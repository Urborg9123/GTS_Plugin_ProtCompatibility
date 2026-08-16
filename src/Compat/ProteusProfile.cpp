#include "Compat/ProteusProfile.hpp"

#include "Data/Persistent.hpp"

#include <glaze/glaze.hpp>

#include <algorithm>
#include <filesystem>
#include <fstream>

namespace GTS::ProteusProfile {
	// Glaze's reflection machinery requires serialized types to have external
	// linkage. Keep the profile schema types in this named namespace rather
	// than the anonymous implementation namespace below.
	struct SkillGlobals {
		float level = 0.0f;
		float progress = 0.0f;
		float ratio = 0.0f;
		float legendary = 0.0f;
		float perkPoints = 0.0f;
	};

	struct CharacterProfile {
		std::uint32_t schemaVersion = 2;
		std::string characterKey;
		std::string displayName;
		std::uint32_t proteusLocalFormID = 0;
		PersistentActorData actorData{};
		PersistentKillCountData killData{};
		SkillGlobals skill{};
		std::vector<std::uint32_t> perkLocalFormIDs;

		// Legacy field retained only so the JSON remains self-describing while
		// moving from the first test schema. Spell state belongs to Proteus and
		// is deliberately ignored by this compatibility layer.
		std::vector<std::uint32_t> spellLocalFormIDs;
	};

	namespace {
		constexpr std::uint32_t kSchemaVersion = 2;
		constexpr std::string_view kGTSPlugin = "GTS.esp";

		constexpr RE::FormID kSkillLevel = 0x142200;
		constexpr RE::FormID kSkillProgress = 0x142201;
		constexpr RE::FormID kSkillRatio = 0x142202;
		constexpr RE::FormID kSkillLegendary = 0x142203;
		constexpr RE::FormID kSkillPerkPoints = 0x2352E1;

		RE::TESDataHandler* GetDataHandler() {
			return RE::TESDataHandler::GetSingleton();
		}

		const RE::TESFile* GetGTSFile() {
			auto* dataHandler = GetDataHandler();
			return dataHandler ? dataHandler->LookupModByName(kGTSPlugin) : nullptr;
		}

		RE::TESGlobal* GetGlobal(RE::FormID localFormID) {
			auto* dataHandler = GetDataHandler();
			if (!dataHandler) {
				return nullptr;
			}
			return dataHandler->LookupForm<RE::TESGlobal>(localFormID, kGTSPlugin);
		}

		bool ReadSkillGlobals(SkillGlobals& result) {
			auto* level = GetGlobal(kSkillLevel);
			auto* progress = GetGlobal(kSkillProgress);
			auto* ratio = GetGlobal(kSkillRatio);
			auto* legendary = GetGlobal(kSkillLegendary);
			auto* perkPoints = GetGlobal(kSkillPerkPoints);

			// Missing GTS forms means "GTS unavailable", never "zero state".
			// In particular, do not overwrite a valid profile after GTS.esp was
			// temporarily disabled or removed from a running Proteus setup.
			if (!level || !progress || !ratio || !legendary || !perkPoints) {
				return false;
			}

			result.level = level->value;
			result.progress = progress->value;
			result.ratio = ratio->value;
			result.legendary = legendary->value;
			result.perkPoints = perkPoints->value;
			return true;
		}

		bool WriteSkillGlobals(const SkillGlobals& values) {
			auto* level = GetGlobal(kSkillLevel);
			auto* progress = GetGlobal(kSkillProgress);
			auto* ratio = GetGlobal(kSkillRatio);
			auto* legendary = GetGlobal(kSkillLegendary);
			auto* perkPoints = GetGlobal(kSkillPerkPoints);

			if (!level || !progress || !ratio || !legendary || !perkPoints) {
				return false;
			}

			level->value = values.level;
			progress->value = values.progress;
			ratio->value = values.ratio;
			legendary->value = values.legendary;
			perkPoints->value = values.perkPoints;
			return true;
		}

		std::uint32_t LocalFormID(const RE::TESForm* form) {
			return form ? form->GetLocalFormID() : 0u;
		}

		std::string ActorName(const RE::Actor* actor) {
			if (!actor) {
				return {};
			}
			const auto* name = actor->GetDisplayFullName();
			return name ? std::string(name) : std::string{};
		}

		void LogRuntimeState(std::string_view label, RE::Actor* actor) {
			if (!actor) {
				logger::info("ProteusProfile: {} actor=<null>", label);
				return;
			}

			const auto* actorData = Persistent::GetActorData(actor);
			const auto* killData = Persistent::GetKillCountData(actor);
			SkillGlobals skill{};
			const bool skillAvailable = ReadSkillGlobals(skill);

			logger::info(
				"ProteusProfile: {} actor={:06X} name='{}' kills={} highestDamage={:.3f} visual={:.4f} target={:.4f} max={:.4f} skill={:.3f} progress={:.3f} ratio={:.3f} legendary={:.3f} perkPoints={:.3f}",
				label,
				LocalFormID(actor),
				ActorName(actor),
				killData ? killData->iTotalKills : 0u,
				actorData ? actorData->fHighestDamageDealt : 0.0f,
				actorData ? actorData->fVisualScale : 0.0f,
				actorData ? actorData->fTargetScale : 0.0f,
				actorData ? actorData->fMaxScale : 0.0f,
				skillAvailable ? skill.level : -1.0f,
				skillAvailable ? skill.progress : -1.0f,
				skillAvailable ? skill.ratio : -1.0f,
				skillAvailable ? skill.legendary : -1.0f,
				skillAvailable ? skill.perkPoints : -1.0f);
		}

		bool IsGTSForm(const RE::TESForm* form, const RE::TESFile* gtsFile) {
			return form && gtsFile && form->GetFile(0) == gtsFile;
		}

		bool CaptureGTSPerks(RE::Actor* actor, CharacterProfile& profile) {
			auto* dataHandler = GetDataHandler();
			auto* gtsFile = GetGTSFile();
			if (!actor || !dataHandler || !gtsFile) {
				return false;
			}

			profile.perkLocalFormIDs.clear();
			for (auto* perk : dataHandler->GetFormArray<RE::BGSPerk>()) {
				if (IsGTSForm(perk, gtsFile) && actor->HasPerk(perk)) {
					profile.perkLocalFormIDs.push_back(LocalFormID(perk));
				}
			}

			std::ranges::sort(profile.perkLocalFormIDs);
			return true;
		}

		bool ClearGTSPerks(RE::Actor* actor) {
			auto* dataHandler = GetDataHandler();
			auto* gtsFile = GetGTSFile();
			if (!actor || !dataHandler || !gtsFile) {
				return false;
			}

			for (auto* perk : dataHandler->GetFormArray<RE::BGSPerk>()) {
				if (IsGTSForm(perk, gtsFile) && actor->HasPerk(perk)) {
					actor->RemovePerk(perk);
				}
			}
			return true;
		}

		bool ApplyGTSPerks(RE::Actor* actor, const CharacterProfile& profile) {
			auto* dataHandler = GetDataHandler();
			if (!actor || !dataHandler || !GetGTSFile()) {
				return false;
			}

			for (auto localID : profile.perkLocalFormIDs) {
				auto* perk = dataHandler->LookupForm<RE::BGSPerk>(localID, kGTSPlugin);
				if (!perk) {
					logger::warn("ProteusProfile: GTS perk {:06X} from profile no longer exists", localID);
					continue;
				}
				if (!actor->HasPerk(perk)) {
					actor->AddPerk(perk);
				}
			}
			return true;
		}

		bool ReplaceGTSPerks(RE::Actor* actor, const CharacterProfile& profile) {
			if (!ClearGTSPerks(actor)) {
				return false;
			}
			return ApplyGTSPerks(actor, profile);
		}

		std::string CharacterKey(const RE::Actor* proteusActor) {
			return std::format("PROTEUS.esp|{:06X}", LocalFormID(proteusActor));
		}

		std::filesystem::path ProfileRoot() {
			return std::filesystem::current_path() / "Data" / "SKSE" / "Plugins" / "GTS_Proteus";
		}

		std::filesystem::path ProfilePath(const RE::Actor* proteusActor) {
			return ProfileRoot() / "Characters" / std::format("{:06X}.json", LocalFormID(proteusActor));
		}

		std::filesystem::path BackupPath(const std::filesystem::path& path) {
			auto backup = path;
			backup += ".bak";
			return backup;
		}

		bool WriteProfileFile(const CharacterProfile& profile, const std::filesystem::path& path) {
			std::string json;
			if (auto error = glz::write_json(profile, json); error) {
				logger::error("ProteusProfile: failed to serialize {}", path.string());
				return false;
			}

			std::error_code fsError;
			std::filesystem::create_directories(path.parent_path(), fsError);
			if (fsError) {
				logger::error("ProteusProfile: failed to create profile directory: {}", fsError.message());
				return false;
			}

			auto tempPath = path;
			tempPath += ".tmp";
			const auto backupPath = BackupPath(path);
			{
				std::ofstream output(tempPath, std::ios::binary | std::ios::trunc);
				if (!output) {
					logger::error("ProteusProfile: failed to open temp profile {}", tempPath.string());
					return false;
				}
				output.write(json.data(), static_cast<std::streamsize>(json.size()));
				if (!output.good()) {
					logger::error("ProteusProfile: failed to write temp profile {}", tempPath.string());
					return false;
				}
			}

			if (std::filesystem::exists(path)) {
				fsError.clear();
				std::filesystem::copy_file(path, backupPath,
					std::filesystem::copy_options::overwrite_existing, fsError);
				if (fsError) {
					logger::error("ProteusProfile: failed to back up {}: {}", path.string(), fsError.message());
					std::filesystem::remove(tempPath);
					return false;
				}

				fsError.clear();
				std::filesystem::remove(path, fsError);
				if (fsError) {
					logger::error("ProteusProfile: failed to replace {}: {}", path.string(), fsError.message());
					std::filesystem::remove(tempPath);
					return false;
				}
			}

			fsError.clear();
			std::filesystem::rename(tempPath, path, fsError);
			if (fsError) {
				logger::error("ProteusProfile: failed to install {}: {}", path.string(), fsError.message());
				return false;
			}
			return true;
		}

		bool ReadProfileFile(CharacterProfile& profile, const std::filesystem::path& path) {
			std::ifstream input(path, std::ios::binary);
			if (!input) {
				return false;
			}
			std::string json((std::istreambuf_iterator<char>(input)), std::istreambuf_iterator<char>());
			if (auto error = glz::read_json(profile, json); error) {
				logger::warn("ProteusProfile: invalid JSON in {}", path.string());
				return false;
			}
			if (profile.schemaVersion != kSchemaVersion) {
				logger::warn("ProteusProfile: unsupported schema {} in {} (expected {})",
					profile.schemaVersion, path.string(), kSchemaVersion);
				return false;
			}
			return true;
		}

		bool ReadProfileWithBackup(CharacterProfile& profile, const std::filesystem::path& path) {
			if (ReadProfileFile(profile, path)) {
				return true;
			}

			CharacterProfile backup{};
			if (ReadProfileFile(backup, BackupPath(path))) {
				profile = std::move(backup);
				logger::warn("ProteusProfile: recovered {} from backup", path.string());
				return true;
			}
			return false;
		}

		void UpdateNpcCache(RE::Actor* proteusActor, const CharacterProfile& profile) {
			if (!proteusActor) {
				return;
			}
			if (auto* actorData = Persistent::GetActorData(proteusActor)) {
				*actorData = profile.actorData;
				actorData->fGTSSkillLevel = profile.skill.level;
				actorData->fGTSSkillExp = profile.skill.progress;
				actorData->fGTSSkillRatio = profile.skill.ratio;
			}
			if (auto* killData = Persistent::GetKillCountData(proteusActor)) {
				*killData = profile.killData;
			}
		}
	}

	bool Save(RE::Actor* player, RE::Actor* proteusActor, std::string_view displayName) {
		if (!player || !proteusActor) {
			logger::warn("ProteusProfile: save rejected because player or Proteus actor was null");
			return false;
		}

		LogRuntimeState("SAVE source", player);

		CharacterProfile profile{};
		profile.characterKey = CharacterKey(proteusActor);
		profile.displayName = std::string(displayName);
		if (profile.displayName.empty()) {
			profile.displayName = ActorName(proteusActor);
		}
		profile.proteusLocalFormID = LocalFormID(proteusActor);

		auto* actorData = Persistent::GetActorData(player);
		auto* killData = Persistent::GetKillCountData(player);
		if (!actorData || !killData || !ReadSkillGlobals(profile.skill) || !CaptureGTSPerks(player, profile)) {
			logger::warn("ProteusProfile: refusing to overwrite {} because complete GTS state is unavailable",
				profile.characterKey);
			return false;
		}

		profile.actorData = *actorData;
		profile.killData = *killData;

		const auto path = ProfilePath(proteusActor);
		logger::info("ProteusProfile: SAVE destination={} name='{}' ref={:06X}",
			path.string(), profile.displayName, profile.proteusLocalFormID);
		if (!WriteProfileFile(profile, path)) {
			return false;
		}

		UpdateNpcCache(proteusActor, profile);
		logger::info("ProteusProfile: saved {} ({}) with {} perks and {} total kills",
			profile.displayName,
			profile.characterKey,
			profile.perkLocalFormIDs.size(),
			profile.killData.iTotalKills);
		return true;
	}

	bool Load(RE::Actor* player, RE::Actor* proteusActor) {
		if (!player || !proteusActor) {
			logger::warn("ProteusProfile: load rejected because player or Proteus actor was null");
			return false;
		}

		if (!GetGTSFile()) {
			logger::warn("ProteusProfile: load skipped because GTS.esp is unavailable");
			return false;
		}

		LogRuntimeState("LOAD player-before", player);

		CharacterProfile profile{};
		const auto path = ProfilePath(proteusActor);
		if (!ReadProfileWithBackup(profile, path)) {
			logger::info("ProteusProfile: no valid v{} profile exists yet for {} name='{}'",
				kSchemaVersion, CharacterKey(proteusActor), ActorName(proteusActor));
			return false;
		}

		// The local RefID is the runtime anchor, but Proteus is known to recycle
		// those slots. The name is therefore a secondary generation/fingerprint
		// guard, not the primary key. A mismatch is safer to treat as first-use
		// than to inject another character's GTS progression.
		const auto liveName = ActorName(proteusActor);
		if (profile.proteusLocalFormID != LocalFormID(proteusActor) ||
			profile.characterKey != CharacterKey(proteusActor)) {
			logger::error("ProteusProfile: identity mismatch while loading {}", path.string());
			return false;
		}
		if (!profile.displayName.empty() && !liveName.empty() && profile.displayName != liveName) {
			logger::warn(
				"ProteusProfile: stale/reused Proteus slot {:06X}; stored name='{}', current name='{}'. Refusing old profile.",
				LocalFormID(proteusActor), profile.displayName, liveName);
			return false;
		}

		logger::info(
			"ProteusProfile: LOAD profile={} storedName='{}' liveName='{}' kills={} highestDamage={:.3f} visual={:.4f} target={:.4f} max={:.4f} skill={:.3f}",
			path.string(),
			profile.displayName,
			liveName,
			profile.killData.iTotalKills,
			profile.actorData.fHighestDamageDealt,
			profile.actorData.fVisualScale,
			profile.actorData.fTargetScale,
			profile.actorData.fMaxScale,
			profile.skill.level);

		auto* actorData = Persistent::GetActorData(player);
		auto* killData = Persistent::GetKillCountData(player);
		if (!actorData || !killData || !WriteSkillGlobals(profile.skill)) {
			logger::warn("ProteusProfile: player GTS state is unavailable while loading {}", profile.characterKey);
			return false;
		}

		*actorData = profile.actorData;
		*killData = profile.killData;
		if (!ReplaceGTSPerks(player, profile)) {
			logger::warn("ProteusProfile: failed to replace GTS perks while loading {}", profile.characterKey);
			return false;
		}

		UpdateNpcCache(proteusActor, profile);
		LogRuntimeState("LOAD player-after", player);
		logger::info("ProteusProfile: loaded {} ({}) with {} perks and {} total kills",
			profile.displayName,
			profile.characterKey,
			profile.perkLocalFormIDs.size(),
			profile.killData.iTotalKills);
		return true;
	}

	void ResetNewCharacter(RE::Actor* player) {
		if (!player) {
			logger::warn("ProteusProfile: RESET skipped because player was null");
			return;
		}

		LogRuntimeState("RESET before", player);

		if (auto* actorData = Persistent::GetActorData(player)) {
			*actorData = {};
		}
		if (auto* killData = Persistent::GetKillCountData(player)) {
			*killData = {};
		}
		if (!WriteSkillGlobals({})) {
			logger::warn("ProteusProfile: could not reset GTS skill globals for new character");
		}
		if (!ClearGTSPerks(player)) {
			logger::warn("ProteusProfile: could not clear GTS perks for new character");
		}

		LogRuntimeState("RESET after", player);
		logger::info("ProteusProfile: reset GTS state for new Proteus character");
	}

}
