#include "Compat/ProteusProfile.hpp"

#include "Data/Persistent.hpp"

#include <glaze/glaze.hpp>

#include <algorithm>
#include <filesystem>
#include <fstream>

namespace GTS::ProteusProfile {
	namespace {
		constexpr std::uint32_t kSchemaVersion = 1;
		constexpr std::string_view kGTSPlugin = "GTS.esp";

		constexpr RE::FormID kSkillLevel = 0x142200;
		constexpr RE::FormID kSkillProgress = 0x142201;
		constexpr RE::FormID kSkillRatio = 0x142202;
		constexpr RE::FormID kSkillLegendary = 0x142203;
		constexpr RE::FormID kSkillPerkPoints = 0x2352E1;

		struct SkillGlobals {
			float level = 0.0f;
			float progress = 0.0f;
			float ratio = 0.0f;
			float legendary = 0.0f;
			float perkPoints = 0.0f;
		};

		struct CharacterProfile {
			std::uint32_t schemaVersion = kSchemaVersion;
			std::string characterKey;
			std::string displayName;
			std::uint32_t proteusLocalFormID = 0;
			PersistentActorData actorData{};
			PersistentKillCountData killData{};
			SkillGlobals skill{};
			std::vector<std::uint32_t> perkLocalFormIDs;
			std::vector<std::uint32_t> spellLocalFormIDs;
		};

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

		bool IsGTSForm(const RE::TESForm* form, const RE::TESFile* gtsFile) {
			return form && gtsFile && form->GetFile(0) == gtsFile;
		}

		bool CaptureGTSForms(RE::Actor* actor, CharacterProfile& profile) {
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

			profile.spellLocalFormIDs.clear();
			for (auto* spell : dataHandler->GetFormArray<RE::SpellItem>()) {
				if (IsGTSForm(spell, gtsFile) && actor->HasSpell(spell)) {
					profile.spellLocalFormIDs.push_back(LocalFormID(spell));
				}
			}

			std::ranges::sort(profile.perkLocalFormIDs);
			std::ranges::sort(profile.spellLocalFormIDs);
			return true;
		}

		bool ClearGTSForms(RE::Actor* actor) {
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

			for (auto* spell : dataHandler->GetFormArray<RE::SpellItem>()) {
				if (IsGTSForm(spell, gtsFile) && actor->HasSpell(spell)) {
					actor->RemoveSpell(spell);
				}
			}
			return true;
		}

		bool ApplyGTSForms(RE::Actor* actor, const CharacterProfile& profile) {
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

			for (auto localID : profile.spellLocalFormIDs) {
				auto* spell = dataHandler->LookupForm<RE::SpellItem>(localID, kGTSPlugin);
				if (!spell) {
					logger::warn("ProteusProfile: GTS spell {:06X} from profile no longer exists", localID);
					continue;
				}
				if (!actor->HasSpell(spell)) {
					actor->AddSpell(spell);
				}
			}
			return true;
		}

		bool ReplaceGTSForms(RE::Actor* actor, const CharacterProfile& profile) {
			if (!ClearGTSForms(actor)) {
				return false;
			}
			return ApplyGTSForms(actor, profile);
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
				logger::warn("ProteusProfile: unsupported schema {} in {}", profile.schemaVersion, path.string());
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

		CharacterProfile profile{};
		profile.characterKey = CharacterKey(proteusActor);
		profile.displayName = std::string(displayName);
		profile.proteusLocalFormID = LocalFormID(proteusActor);

		auto* actorData = Persistent::GetActorData(player);
		auto* killData = Persistent::GetKillCountData(player);
		if (!actorData || !killData || !ReadSkillGlobals(profile.skill) || !CaptureGTSForms(player, profile)) {
			logger::warn("ProteusProfile: refusing to overwrite {} because complete GTS state is unavailable",
				profile.characterKey);
			return false;
		}

		profile.actorData = *actorData;
		profile.killData = *killData;

		const auto path = ProfilePath(proteusActor);
		if (!WriteProfileFile(profile, path)) {
			return false;
		}

		UpdateNpcCache(proteusActor, profile);
		logger::info("ProteusProfile: saved {} ({}) with {} perks, {} spells, {} total kills",
			profile.displayName,
			profile.characterKey,
			profile.perkLocalFormIDs.size(),
			profile.spellLocalFormIDs.size(),
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

		CharacterProfile profile{};
		const auto path = ProfilePath(proteusActor);
		if (!ReadProfileWithBackup(profile, path)) {
			logger::info("ProteusProfile: no valid profile exists yet for {}", CharacterKey(proteusActor));
			return false;
		}

		// Refuse a profile under the wrong identity instead of silently applying
		// it to another character. Display names are metadata only.
		if (profile.proteusLocalFormID != LocalFormID(proteusActor) ||
			profile.characterKey != CharacterKey(proteusActor)) {
			logger::error("ProteusProfile: identity mismatch while loading {}", path.string());
			return false;
		}

		auto* actorData = Persistent::GetActorData(player);
		auto* killData = Persistent::GetKillCountData(player);
		if (!actorData || !killData || !WriteSkillGlobals(profile.skill)) {
			logger::warn("ProteusProfile: player GTS state is unavailable while loading {}", profile.characterKey);
			return false;
		}

		*actorData = profile.actorData;
		*killData = profile.killData;
		if (!ReplaceGTSForms(player, profile)) {
			logger::warn("ProteusProfile: failed to replace GTS forms while loading {}", profile.characterKey);
			return false;
		}

		UpdateNpcCache(proteusActor, profile);
		logger::info("ProteusProfile: loaded {} ({}) with {} perks, {} spells, {} total kills",
			profile.displayName,
			profile.characterKey,
			profile.perkLocalFormIDs.size(),
			profile.spellLocalFormIDs.size(),
			profile.killData.iTotalKills);
		return true;
	}

	void ResetNewCharacter(RE::Actor* player) {
		if (!player) {
			return;
		}

		if (auto* actorData = Persistent::GetActorData(player)) {
			*actorData = {};
		}
		if (auto* killData = Persistent::GetKillCountData(player)) {
			*killData = {};
		}
		if (!WriteSkillGlobals({})) {
			logger::warn("ProteusProfile: could not reset GTS skill globals for new character");
		}
		if (!ClearGTSForms(player)) {
			logger::warn("ProteusProfile: could not clear GTS perks/spells for new character");
		}
		logger::info("ProteusProfile: reset GTS state for new Proteus character");
	}

}
