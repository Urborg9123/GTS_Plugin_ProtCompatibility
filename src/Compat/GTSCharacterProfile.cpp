#include "Compat/GTSCharacterProfile.hpp"

#include "Data/Persistent.hpp"
#include "Data/Runtime.hpp"
#include "Managers/Perks/PerkHandler.hpp"
#include "Utils/Text/Text.hpp"

#include <glaze/glaze.hpp>

#include <algorithm>
#include <cctype>
#include <filesystem>
#include <fstream>
#include <unordered_set>

namespace GTS::CharacterProfile {
	struct SkillState {
		bool captured = false;
		float level = 0.0f;
		float progress = 0.0f;
		float ratio = 0.0f;
		bool playerExtrasCaptured = false;
		float legendary = 0.0f;
		float perkPoints = 0.0f;
	};

	struct Profile {
		std::uint32_t schemaVersion = 4;
		std::string profileKey;
		PersistentActorData actorData{};
		PersistentKillCountData killData{};
		SkillState skill{};
		bool playerPerksCaptured = false;
		std::vector<std::uint32_t> playerPerkLocalFormIDs;
	};

	namespace {
		constexpr std::uint32_t kSchemaVersion = 4;
		constexpr std::string_view kGTSPlugin = "GTS.esp";

		RE::TESDataHandler* DataHandler() {
			return RE::TESDataHandler::GetSingleton();
		}

		const RE::TESFile* GTSFile() {
			auto* data = DataHandler();
			return data ? data->LookupModByName(kGTSPlugin) : nullptr;
		}

		bool IsPlayer(const RE::Actor* actor) {
			return actor && actor->IsPlayerRef();
		}

		bool ReadPlayerSkill(SkillState& value) {
			auto* level = Runtime::GetGlobal(Runtime::GLOB.GTSSkillLevel);
			auto* progress = Runtime::GetGlobal(Runtime::GLOB.GTSSkillProgress);
			auto* ratio = Runtime::GetGlobal(Runtime::GLOB.GTSSkillRatio);
			auto* legendary = Runtime::GetGlobal(Runtime::GLOB.GTSSkillLegendary);
			auto* perkPoints = Runtime::GetGlobal(Runtime::GLOB.GTSSkillPerkPoints);
			if (!level || !progress || !ratio || !legendary || !perkPoints) {
				return false;
			}

			value.captured = true;
			value.level = level->value;
			value.progress = progress->value;
			value.ratio = ratio->value;
			value.playerExtrasCaptured = true;
			value.legendary = legendary->value;
			value.perkPoints = perkPoints->value;
			return true;
		}

		bool ReadNPCSkill(const PersistentActorData* actorData, SkillState& value) {
			if (!actorData) {
				return false;
			}

			value.captured = true;
			value.level = actorData->fGTSSkillLevel;
			value.progress = actorData->fGTSSkillExp;
			value.ratio = actorData->fGTSSkillRatio;
			value.playerExtrasCaptured = false;
			value.legendary = 0.0f;
			value.perkPoints = 0.0f;
			return true;
		}

		bool ReadSkill(RE::Actor* actor, const PersistentActorData* actorData, SkillState& value) {
			return IsPlayer(actor) ? ReadPlayerSkill(value) : ReadNPCSkill(actorData, value);
		}

		bool WritePlayerSkill(const SkillState& value) {
			if (!value.captured || !value.playerExtrasCaptured) {
				return false;
			}

			auto* level = Runtime::GetGlobal(Runtime::GLOB.GTSSkillLevel);
			auto* progress = Runtime::GetGlobal(Runtime::GLOB.GTSSkillProgress);
			auto* ratio = Runtime::GetGlobal(Runtime::GLOB.GTSSkillRatio);
			auto* legendary = Runtime::GetGlobal(Runtime::GLOB.GTSSkillLegendary);
			auto* perkPoints = Runtime::GetGlobal(Runtime::GLOB.GTSSkillPerkPoints);
			if (!level || !progress || !ratio || !legendary || !perkPoints) {
				return false;
			}

			level->value = value.level;
			progress->value = value.progress;
			ratio->value = value.ratio;
			legendary->value = value.legendary;
			perkPoints->value = value.perkPoints;
			return true;
		}

		bool WriteNPCSkill(PersistentActorData* actorData, const SkillState& value) {
			if (!actorData || !value.captured) {
				return false;
			}

			actorData->fGTSSkillLevel = value.level;
			actorData->fGTSSkillExp = value.progress;
			actorData->fGTSSkillRatio = value.ratio;
			return true;
		}

		bool WriteSkill(RE::Actor* actor, PersistentActorData* actorData, const SkillState& value) {
			return IsPlayer(actor) ? WritePlayerSkill(value) : WriteNPCSkill(actorData, value);
		}

		bool IsGTSForm(const RE::TESForm* form, const RE::TESFile* gtsFile) {
			return form && gtsFile && form->GetFile(0) == gtsFile;
		}

		bool CaptureActorOwnedGTSPerks(RE::Actor* actor, std::vector<std::uint32_t>& perks) {
			auto* data = DataHandler();
			auto* gts = GTSFile();
			if (!actor || !data || !gts) {
				return false;
			}

			perks.clear();
			for (auto* perk : data->GetFormArray<RE::BGSPerk>()) {
				if (IsGTSForm(perk, gts) && actor->HasPerk(perk)) {
					perks.push_back(perk->GetLocalFormID());
				}
			}
			std::ranges::sort(perks);
			return true;
		}

		bool CaptureEffectiveGTSPerks(RE::Actor* actor, std::vector<std::uint32_t>& perks) {
			auto* data = DataHandler();
			auto* gts = GTSFile();
			auto* base = actor ? actor->GetActorBase() : nullptr;
			if (!actor || !base || !data || !gts) {
				return false;
			}

			perks.clear();
			for (auto* perk : data->GetFormArray<RE::BGSPerk>()) {
				if (!IsGTSForm(perk, gts)) {
					continue;
				}
				if (actor->HasPerk(perk) || base->GetPerkIndex(perk).has_value()) {
					perks.push_back(perk->GetLocalFormID());
				}
			}
			std::ranges::sort(perks);
			return true;
		}

		bool RemoveActorOwnedGTSPerks(RE::Actor* actor) {
			std::vector<std::uint32_t> owned;
			if (!CaptureActorOwnedGTSPerks(actor, owned)) {
				return false;
			}

			auto* data = DataHandler();
			if (!data) {
				return false;
			}

			bool complete = true;
			for (auto localID : owned) {
				auto* perk = data->LookupForm<RE::BGSPerk>(localID, kGTSPlugin);
				if (!perk) {
					logger::warn("GTSCharacterProfile: owned perk {:06X} no longer exists", localID);
					complete = false;
					continue;
				}
				actor->RemovePerk(perk);
			}

			return complete;
		}

		bool SyncPlayerGTSPerks(RE::Actor* actor, const std::vector<std::uint32_t>& desired) {
			auto* data = DataHandler();
			if (!actor || !IsPlayer(actor) || !data || !GTSFile()) {
				return false;
			}

			std::vector<std::uint32_t> current;
			if (!CaptureActorOwnedGTSPerks(actor, current)) {
				return false;
			}

			const std::unordered_set<std::uint32_t> currentSet(current.begin(), current.end());
			const std::unordered_set<std::uint32_t> desiredSet(desired.begin(), desired.end());
			bool complete = true;

			for (auto localID : current) {
				if (desiredSet.contains(localID)) {
					continue;
				}
				auto* perk = data->LookupForm<RE::BGSPerk>(localID, kGTSPlugin);
				if (!perk) {
					logger::warn("GTSCharacterProfile: current player perk {:06X} no longer exists", localID);
					complete = false;
					continue;
				}
				actor->RemovePerk(perk);
			}

			for (auto localID : desired) {
				if (currentSet.contains(localID)) {
					continue;
				}
				auto* perk = data->LookupForm<RE::BGSPerk>(localID, kGTSPlugin);
				if (!perk) {
					logger::warn("GTSCharacterProfile: saved player perk {:06X} no longer exists", localID);
					complete = false;
					continue;
				}
				actor->AddPerk(perk);
			}

			return complete;
		}

		void ApplyActorDataWithoutDerivedMax(PersistentActorData* target, const PersistentActorData& saved) {
			const auto derivedMaxScale = target->fMaxScale;
			*target = saved;
			target->fMaxScale = derivedMaxScale;
		}

		void ResetActorDataWithoutDerivedMax(PersistentActorData* target) {
			const auto derivedMaxScale = target->fMaxScale;
			*target = {};
			target->fMaxScale = derivedMaxScale;
		}

		std::string PerkIDList(const std::vector<std::uint32_t>& perks) {
			if (perks.empty()) {
				return "<none>";
			}
			std::string result;
			for (std::size_t i = 0; i < perks.size(); ++i) {
				if (i != 0) {
					result += ',';
				}
				result += std::format("{:06X}", perks[i]);
			}
			return result;
		}

		std::string SafeKey(std::string_view key) {
			std::string result;
			result.reserve(key.size());
			for (const unsigned char c : key) {
				if (std::isalnum(c) || c == '-' || c == '_') {
					result.push_back(static_cast<char>(c));
				} else {
					result.push_back('_');
				}
			}
			return result.empty() ? "invalid" : result;
		}

		std::filesystem::path Root() {
			return std::filesystem::current_path() / "Data" / "SKSE" / "Plugins" / "GTS_CharacterProfiles";
		}

		std::filesystem::path PathFor(std::string_view key) {
			return Root() / (SafeKey(key) + ".json");
		}

		std::filesystem::path BackupFor(const std::filesystem::path& path) {
			auto backup = path;
			backup += ".bak";
			return backup;
		}

		bool WriteFile(const Profile& profile, const std::filesystem::path& path) {
			std::string json;
			if (auto error = glz::write_json(profile, json); error) {
				logger::error("GTSCharacterProfile: serialization failed for {}", path.string());
				return false;
			}

			std::error_code ec;
			std::filesystem::create_directories(path.parent_path(), ec);
			if (ec) {
				logger::error("GTSCharacterProfile: create directory failed: {}", ec.message());
				return false;
			}

			auto temp = path;
			temp += ".tmp";
			{
				std::ofstream out(temp, std::ios::binary | std::ios::trunc);
				if (!out) {
					return false;
				}
				out.write(json.data(), static_cast<std::streamsize>(json.size()));
				if (!out.good()) {
					return false;
				}
			}

			if (std::filesystem::exists(path)) {
				ec.clear();
				std::filesystem::copy_file(path, BackupFor(path), std::filesystem::copy_options::overwrite_existing, ec);
				if (ec) {
					std::filesystem::remove(temp);
					return false;
				}
				ec.clear();
				std::filesystem::remove(path, ec);
				if (ec) {
					std::filesystem::remove(temp);
					return false;
				}
			}

			ec.clear();
			std::filesystem::rename(temp, path, ec);
			return !ec;
		}

		bool ReadFile(Profile& profile, const std::filesystem::path& path) {
			std::ifstream in(path, std::ios::binary);
			if (!in) {
				return false;
			}
			std::string json((std::istreambuf_iterator<char>(in)), std::istreambuf_iterator<char>());
			if (auto error = glz::read_json(profile, json); error) {
				return false;
			}
			return profile.schemaVersion == kSchemaVersion;
		}

		bool ReadWithBackup(Profile& profile, const std::filesystem::path& path) {
			if (ReadFile(profile, path)) {
				return true;
			}
			Profile backup{};
			if (ReadFile(backup, BackupFor(path))) {
				profile = std::move(backup);
				logger::warn("GTSCharacterProfile: recovered {} from backup", path.string());
				return true;
			}
			return false;
		}
	}

	void Dump(RE::Actor* actor, std::string_view label) {
		if (!actor) {
			Cprint("GTS profile {}: actor is null", label);
			return;
		}

		auto* actorData = Persistent::GetActorData(actor);
		auto* killData = Persistent::GetKillCountData(actor);
		SkillState skill{};
		const bool hasSkill = ReadSkill(actor, actorData, skill);

		std::vector<std::uint32_t> ownedPerks;
		std::vector<std::uint32_t> effectivePerks;
		const bool hasOwnedPerks = CaptureActorOwnedGTSPerks(actor, ownedPerks);
		const bool hasEffectivePerks = CaptureEffectiveGTSPerks(actor, effectivePerks);

		if (IsPlayer(actor)) {
			Cprint("GTS PROFILE [{}] PLAYER kills={} skill={:.2f} progress={:.2f} ratio={:.2f} legendary={:.0f} points={:.0f} perks owned/effective={}/{} visual={:.3f} target={:.3f} max(derived)={:.3f}",
				label,
				killData ? killData->iTotalKills : 0u,
				hasSkill ? skill.level : -1.0f,
				hasSkill ? skill.progress : -1.0f,
				hasSkill ? skill.ratio : -1.0f,
				hasSkill ? skill.legendary : -1.0f,
				hasSkill ? skill.perkPoints : -1.0f,
				hasOwnedPerks ? ownedPerks.size() : 0,
				hasEffectivePerks ? effectivePerks.size() : 0,
				actorData ? actorData->fVisualScale : -1.0f,
				actorData ? actorData->fTargetScale : -1.0f,
				actorData ? actorData->fMaxScale : -1.0f);
		} else {
			auto* base = actor->GetActorBase();
			const bool templated = base && base->UsesTemplate();
			Cprint("GTS PROFILE [{}] NPC {:08X}: kills={} skill={:.2f} progress={:.2f} ratio={:.2f} perks owned/effective={}/{} templated={} visual={:.3f} target={:.3f} max(derived)={:.3f}",
				label,
				actor->GetFormID(),
				killData ? killData->iTotalKills : 0u,
				hasSkill ? skill.level : -1.0f,
				hasSkill ? skill.progress : -1.0f,
				hasSkill ? skill.ratio : -1.0f,
				hasOwnedPerks ? ownedPerks.size() : 0,
				hasEffectivePerks ? effectivePerks.size() : 0,
				templated,
				actorData ? actorData->fVisualScale : -1.0f,
				actorData ? actorData->fTargetScale : -1.0f,
				actorData ? actorData->fMaxScale : -1.0f);
		}

		Cprint("GTS PROFILE [{}] effective perk IDs: {}", label, hasEffectivePerks ? PerkIDList(effectivePerks) : "<capture failed>");
		logger::info("GTSCharacterProfile: dump '{}' actor={:08X} player={} kills={} skill={} progress={} ratio={} ownedPerks={} effectivePerks={} ids={}",
			label,
			actor->GetFormID(),
			IsPlayer(actor),
			killData ? killData->iTotalKills : 0u,
			hasSkill ? skill.level : -1.0f,
			hasSkill ? skill.progress : -1.0f,
			hasSkill ? skill.ratio : -1.0f,
			hasOwnedPerks ? ownedPerks.size() : 0,
			hasEffectivePerks ? effectivePerks.size() : 0,
			hasEffectivePerks ? PerkIDList(effectivePerks) : "<capture failed>");
	}

	bool Save(RE::Actor* actor, std::string_view profileKey) {
		if (!actor || !GTSFile()) {
			return false;
		}

		Profile profile{};
		profile.profileKey = std::string(profileKey);

		auto* actorData = Persistent::GetActorData(actor);
		auto* killData = Persistent::GetKillCountData(actor);
		if (!actorData || !killData) {
			logger::warn("GTSCharacterProfile: save refused because actor state is unavailable");
			return false;
		}

		profile.actorData = *actorData;
		profile.killData = *killData;

		if (!ReadSkill(actor, actorData, profile.skill)) {
			logger::warn("GTSCharacterProfile: save refused because skill state is unavailable");
			return false;
		}

		if (IsPlayer(actor)) {
			profile.playerPerksCaptured = true;
			if (!CaptureActorOwnedGTSPerks(actor, profile.playerPerkLocalFormIDs)) {
				logger::warn("GTSCharacterProfile: player save refused because perk state is unavailable");
				return false;
			}
		}

		const auto path = PathFor(profileKey);
		if (!WriteFile(profile, path)) {
			logger::error("GTSCharacterProfile: failed to write {}", path.string());
			return false;
		}

		logger::info("GTSCharacterProfile: saved schema-v4 key='{}' path='{}' player={} skill={}/{}/{} playerPerks={} kills={}",
			profile.profileKey,
			path.string(),
			IsPlayer(actor),
			profile.skill.level,
			profile.skill.progress,
			profile.skill.ratio,
			profile.playerPerkLocalFormIDs.size(),
			profile.killData.iTotalKills);
		return true;
	}

	bool Load(RE::Actor* actor, std::string_view profileKey) {
		if (!actor || !GTSFile()) {
			return false;
		}

		Profile profile{};
		const auto path = PathFor(profileKey);
		if (!ReadWithBackup(profile, path)) {
			logger::warn("GTSCharacterProfile: no valid schema-v4 profile for key='{}'", profileKey);
			return false;
		}
		if (profile.profileKey != profileKey) {
			logger::error("GTSCharacterProfile: profile key mismatch stored='{}' requested='{}'", profile.profileKey, profileKey);
			return false;
		}
		if (!profile.skill.captured) {
			logger::warn("GTSCharacterProfile: key='{}' has no normalized skill state", profileKey);
			return false;
		}
		if (IsPlayer(actor) && (!profile.skill.playerExtrasCaptured || !profile.playerPerksCaptured)) {
			logger::warn("GTSCharacterProfile: key='{}' came from an NPC; refusing incomplete NPC-to-player progression load", profileKey);
			return false;
		}

		auto* actorData = Persistent::GetActorData(actor);
		auto* killData = Persistent::GetKillCountData(actor);
		if (!actorData || !killData) {
			return false;
		}

		ApplyActorDataWithoutDerivedMax(actorData, profile.actorData);
		*killData = profile.killData;

		// Cross-target actorData is not a valid skill source: player skill lives in
		// globals while NPC skill lives in PersistentActorData. Always overwrite the
		// target's native skill storage from the normalized profile after actorData.
		if (!WriteSkill(actor, actorData, profile.skill)) {
			logger::warn("GTSCharacterProfile: failed to restore normalized skill for key='{}' actor={:08X}", profileKey, actor->GetFormID());
			return false;
		}

		if (IsPlayer(actor)) {
			if (!SyncPlayerGTSPerks(actor, profile.playerPerkLocalFormIDs)) {
				logger::warn("GTSCharacterProfile: player perk sync was incomplete for key='{}'", profileKey);
				return false;
			}
		} else {
			auto* base = actor->GetActorBase();
			if (!base) {
				logger::warn("GTSCharacterProfile: NPC {:08X} has no ActorBase; skill restored but native perk grant skipped", actor->GetFormID());
			} else if (base->UsesTemplate()) {
				// Native GTS intentionally refuses RuntimeGivePerksToNPC for templated
				// NPCs. Keep SPID/base perks intact; their functionality can still use
				// the transferred NPC skill state.
				Cprint("GTS profile: NPC {:08X} is templated; skill transferred, existing SPID/base perks preserved, native level-perk grant skipped", actor->GetFormID());
				logger::warn("GTSCharacterProfile: NPC {:08X} is templated; preserved existing perks and skipped native level-derived perk grant", actor->GetFormID());
			} else {
				// This is the same path GTS uses on NPC GTS level-up. It grants all
				// playable level-eligible GTS perks through ActorBase, applies the
				// temporary perk, then refreshes perks from the base. We deliberately
				// do not remove existing perks because they may come from SPID or the
				// actor definition and are not profile-owned state.
				PerkHandler::RuntimeGivePerksToNPC(actor, profile.skill.level);
			}
		}

		logger::info("GTSCharacterProfile: loaded schema-v4 key='{}' actor={:08X} player={} skill={}/{}/{} playerPerksApplied={} npcNativePerksRecomputed={} kills={} maxScaleIgnored=true",
			profile.profileKey,
			actor->GetFormID(),
			IsPlayer(actor),
			profile.skill.level,
			profile.skill.progress,
			profile.skill.ratio,
			IsPlayer(actor),
			!IsPlayer(actor) && actor->GetActorBase() && !actor->GetActorBase()->UsesTemplate(),
			profile.killData.iTotalKills);
		return true;
	}

	bool Reset(RE::Actor* actor) {
		if (!actor || !GTSFile()) {
			return false;
		}

		auto* actorData = Persistent::GetActorData(actor);
		auto* killData = Persistent::GetKillCountData(actor);
		if (!actorData || !killData) {
			return false;
		}

		bool complete = true;
		if (IsPlayer(actor)) {
			SkillState emptyPlayerSkill{};
			emptyPlayerSkill.captured = true;
			emptyPlayerSkill.playerExtrasCaptured = true;
			if (!WritePlayerSkill(emptyPlayerSkill)) {
				complete = false;
			}
		}

		ResetActorDataWithoutDerivedMax(actorData);
		*killData = {};

		if (IsPlayer(actor)) {
			if (!RemoveActorOwnedGTSPerks(actor)) {
				complete = false;
			}
		} else {
			// Do not remove NPC perks here. They can originate from SPID, ActorBase,
			// templates, or GTS's own native NPC progression and are not safely
			// distinguishable as profile-owned state.
			logger::info("GTSCharacterProfile: NPC reset preserved existing GTS perks by design (SPID/base safe)");
		}

		logger::info("GTSCharacterProfile: reset actor {:08X} player={} npcPerksPreserved={} maxScaleIgnored=true complete={}",
			actor->GetFormID(), IsPlayer(actor), !IsPlayer(actor), complete);
		return complete;
	}
}
