#include "Compat/GTSCharacterProfile.hpp"

#include "Data/Persistent.hpp"
#include "Data/Runtime.hpp"
#include "Utils/Text/Text.hpp"

#include <glaze/glaze.hpp>

#include <algorithm>
#include <filesystem>
#include <fstream>
#include <unordered_set>

namespace GTS::CharacterProfile {
	struct SkillGlobals {
		float level = 0.0f;
		float progress = 0.0f;
		float ratio = 0.0f;
		float legendary = 0.0f;
		float perkPoints = 0.0f;
	};

	struct PlayerSkillState {
		bool captured = false;
		SkillGlobals skill{};
	};

	struct Profile {
		std::uint32_t schemaVersion = 3;
		std::string profileKey;
		PersistentActorData actorData{};
		PersistentKillCountData killData{};
		std::vector<std::uint32_t> actorPerkLocalFormIDs;
		PlayerSkillState playerSkill{};
	};

	namespace {
		constexpr std::uint32_t kSchemaVersion = 3;
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

		bool ReadPlayerSkill(SkillGlobals& value) {
			auto* level = Runtime::GetGlobal(Runtime::GLOB.GTSSkillLevel);
			auto* progress = Runtime::GetGlobal(Runtime::GLOB.GTSSkillProgress);
			auto* ratio = Runtime::GetGlobal(Runtime::GLOB.GTSSkillRatio);
			auto* legendary = Runtime::GetGlobal(Runtime::GLOB.GTSSkillLegendary);
			auto* perkPoints = Runtime::GetGlobal(Runtime::GLOB.GTSSkillPerkPoints);
			if (!level || !progress || !ratio || !legendary || !perkPoints) {
				return false;
			}
			value.level = level->value;
			value.progress = progress->value;
			value.ratio = ratio->value;
			value.legendary = legendary->value;
			value.perkPoints = perkPoints->value;
			return true;
		}

		bool WritePlayerSkill(const SkillGlobals& value) {
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

		bool IsGTSForm(const RE::TESForm* form, const RE::TESFile* gtsFile) {
			return form && gtsFile && form->GetFile(0) == gtsFile;
		}

		bool CaptureDynamicGTSPerks(RE::Actor* actor, std::vector<std::uint32_t>& perks) {
			auto* data = DataHandler();
			auto* gts = GTSFile();
			if (!actor || !data || !gts) {
				return false;
			}

			perks.clear();
			for (auto* perk : data->GetFormArray<RE::BGSPerk>()) {
				// Keep only perks dynamically owned by this Actor. Runtime::HasPerk also
				// includes ActorBase perks, which are static actor-definition data.
				if (IsGTSForm(perk, gts) && actor->HasPerk(perk)) {
					perks.push_back(perk->GetLocalFormID());
				}
			}
			std::ranges::sort(perks);
			return true;
		}

		bool RemoveDynamicGTSPerks(RE::Actor* actor) {
			std::vector<std::uint32_t> owned;
			if (!CaptureDynamicGTSPerks(actor, owned)) {
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

			// Skyrim may not report removals through HasPerk until a later update.
			// Do not synchronously verify here; the previous verification caused the
			// first reset call to abort after issuing RemovePerk.
			return complete;
		}

		bool SyncDynamicGTSPerks(RE::Actor* actor, const std::vector<std::uint32_t>& desired) {
			auto* data = DataHandler();
			if (!actor || !data || !GTSFile()) {
				return false;
			}

			std::vector<std::uint32_t> current;
			if (!CaptureDynamicGTSPerks(actor, current)) {
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
					logger::warn("GTSCharacterProfile: current perk {:06X} no longer exists", localID);
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
					logger::warn("GTSCharacterProfile: saved perk {:06X} no longer exists", localID);
					complete = false;
					continue;
				}
				actor->AddPerk(perk);
			}

			// Like removal, perk ownership can settle on a later engine update.
			// padump is the explicit post-operation verification for the test harness.
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
		std::vector<std::uint32_t> perks;
		const bool hasPerks = CaptureDynamicGTSPerks(actor, perks);

		if (IsPlayer(actor)) {
			SkillGlobals skill{};
			const bool hasSkill = ReadPlayerSkill(skill);
			Cprint("GTS PROFILE [{}] PLAYER kills={} skill={:.2f} progress={:.2f} ratio={:.2f} legendary={:.0f} points={:.0f} perks={} visual={:.3f} target={:.3f} max(derived)={:.3f}",
				label,
				killData ? killData->iTotalKills : 0u,
				hasSkill ? skill.level : -1.0f,
				hasSkill ? skill.progress : -1.0f,
				hasSkill ? skill.ratio : -1.0f,
				hasSkill ? skill.legendary : -1.0f,
				hasSkill ? skill.perkPoints : -1.0f,
				hasPerks ? perks.size() : 0,
				actorData ? actorData->fVisualScale : -1.0f,
				actorData ? actorData->fTargetScale : -1.0f,
				actorData ? actorData->fMaxScale : -1.0f);
		} else {
			Cprint("GTS PROFILE [{}] NPC {:08X}: player skill skipped; kills={} perks={} visual={:.3f} target={:.3f} max(derived)={:.3f}",
				label,
				actor->GetFormID(),
				killData ? killData->iTotalKills : 0u,
				hasPerks ? perks.size() : 0,
				actorData ? actorData->fVisualScale : -1.0f,
				actorData ? actorData->fTargetScale : -1.0f,
				actorData ? actorData->fMaxScale : -1.0f);
		}

		Cprint("GTS PROFILE [{}] perk IDs: {}", label, hasPerks ? PerkIDList(perks) : "<capture failed>");
		logger::info("GTSCharacterProfile: dump '{}' actor={:08X} player={} kills={} perks={} ids={}",
			label, actor->GetFormID(), IsPlayer(actor), killData ? killData->iTotalKills : 0u,
			hasPerks ? perks.size() : 0, hasPerks ? PerkIDList(perks) : "<capture failed>");
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
		if (!CaptureDynamicGTSPerks(actor, profile.actorPerkLocalFormIDs)) {
			logger::warn("GTSCharacterProfile: save refused because actor perk state is unavailable");
			return false;
		}

		if (IsPlayer(actor)) {
			profile.playerSkill.captured = true;
			if (!ReadPlayerSkill(profile.playerSkill.skill)) {
				logger::warn("GTSCharacterProfile: player save refused because skill state is unavailable");
				return false;
			}
		}

		const auto path = PathFor(profileKey);
		if (!WriteFile(profile, path)) {
			logger::error("GTSCharacterProfile: failed to write {}", path.string());
			return false;
		}
		logger::info("GTSCharacterProfile: saved key='{}' path='{}' playerSkill={} perks={} kills={}",
			profile.profileKey, path.string(), profile.playerSkill.captured,
			profile.actorPerkLocalFormIDs.size(), profile.killData.iTotalKills);
		return true;
	}

	bool Load(RE::Actor* actor, std::string_view profileKey) {
		if (!actor || !GTSFile()) {
			return false;
		}

		Profile profile{};
		const auto path = PathFor(profileKey);
		if (!ReadWithBackup(profile, path)) {
			logger::warn("GTSCharacterProfile: no valid schema-v3 profile for key='{}'", profileKey);
			return false;
		}
		if (profile.profileKey != profileKey) {
			logger::error("GTSCharacterProfile: profile key mismatch stored='{}' requested='{}'", profile.profileKey, profileKey);
			return false;
		}
		if (IsPlayer(actor) && !profile.playerSkill.captured) {
			logger::warn("GTSCharacterProfile: key='{}' has no player skill state; refusing partial player load", profileKey);
			return false;
		}

		auto* actorData = Persistent::GetActorData(actor);
		auto* killData = Persistent::GetKillCountData(actor);
		if (!actorData || !killData) {
			return false;
		}

		if (IsPlayer(actor) && !WritePlayerSkill(profile.playerSkill.skill)) {
			logger::warn("GTSCharacterProfile: failed to restore player skill for key='{}'", profileKey);
			return false;
		}

		if (!SyncDynamicGTSPerks(actor, profile.actorPerkLocalFormIDs)) {
			logger::warn("GTSCharacterProfile: perk sync was incomplete for key='{}' actor={:08X}", profileKey, actor->GetFormID());
			return false;
		}

		ApplyActorDataWithoutDerivedMax(actorData, profile.actorData);
		*killData = profile.killData;
		logger::info("GTSCharacterProfile: loaded key='{}' actor={:08X} playerSkillApplied={} perks={} kills={} maxScaleIgnored=true",
			profile.profileKey, actor->GetFormID(), IsPlayer(actor),
			profile.actorPerkLocalFormIDs.size(), profile.killData.iTotalKills);
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
		if (IsPlayer(actor) && !WritePlayerSkill({})) {
			complete = false;
		}

		// Reset persistent state regardless of whether Skyrim has finished applying
		// perk removals. fMaxScale is derived by GTS and is intentionally untouched.
		ResetActorDataWithoutDerivedMax(actorData);
		*killData = {};

		if (!RemoveDynamicGTSPerks(actor)) {
			complete = false;
		}

		logger::info("GTSCharacterProfile: reset actor {:08X} playerSkill={} perksRemovalIssued=true maxScaleIgnored=true complete={}",
			actor->GetFormID(), IsPlayer(actor), complete);
		return complete;
	}
}
