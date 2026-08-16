#include "Compat/ProteusProfile.hpp"

#include "Data/Persistent.hpp"

#include <glaze/glaze.hpp>

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

			// Reserved for the next compatibility stage. Keeping these in schema v1
			// makes profile files immediately useful for debugging and forwards-safe.
			std::vector<std::uint32_t> perkLocalFormIDs;
			std::vector<std::uint32_t> spellLocalFormIDs;
		};

		RE::TESGlobal* GetGlobal(RE::FormID localFormID) {
			auto* dataHandler = RE::TESDataHandler::GetSingleton();
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

			// Treat missing GTS forms as "GTS unavailable", not as zero state. This
			// prevents a temporary disabled/missing GTS install from destroying a
			// previously valid character profile.
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
			return form ? (form->GetFormID() & 0x00FFFFFFu) : 0u;
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

		bool WriteProfileFile(const CharacterProfile& profile, const std::filesystem::path& path) {
			std::string json;
			if (auto error = glz::write_json(profile, json); error) {
				return false;
			}

			std::error_code fsError;
			std::filesystem::create_directories(path.parent_path(), fsError);
			if (fsError) {
				return false;
			}

			const auto tempPath = path.string() + ".tmp";
			const auto backupPath = path.string() + ".bak";
			{
				std::ofstream output(tempPath, std::ios::binary | std::ios::trunc);
				if (!output) {
					return false;
				}
				output.write(json.data(), static_cast<std::streamsize>(json.size()));
				if (!output.good()) {
					return false;
				}
			}

			// Keep one last-known-good backup. The JSON is authoritative, so a
			// partially written file must never replace the previous good profile.
			if (std::filesystem::exists(path)) {
				std::filesystem::copy_file(path, backupPath,
					std::filesystem::copy_options::overwrite_existing, fsError);
				if (fsError) {
					std::filesystem::remove(tempPath);
					return false;
				}
			}

			std::filesystem::remove(path, fsError);
			fsError.clear();
			std::filesystem::rename(tempPath, path, fsError);
			if (fsError) {
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
				return false;
			}
			return profile.schemaVersion == kSchemaVersion;
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
			return false;
		}

		CharacterProfile profile{};
		profile.characterKey = CharacterKey(proteusActor);
		profile.displayName = std::string(displayName);
		profile.proteusLocalFormID = LocalFormID(proteusActor);

		auto* actorData = Persistent::GetActorData(player);
		auto* killData = Persistent::GetKillCountData(player);
		if (!actorData || !killData || !ReadSkillGlobals(profile.skill)) {
			return false;
		}

		profile.actorData = *actorData;
		profile.killData = *killData;

		if (!WriteProfileFile(profile, ProfilePath(proteusActor))) {
			return false;
		}

		UpdateNpcCache(proteusActor, profile);
		return true;
	}

	bool Load(RE::Actor* player, RE::Actor* proteusActor) {
		if (!player || !proteusActor) {
			return false;
		}

		CharacterProfile profile{};
		if (!ReadProfileFile(profile, ProfilePath(proteusActor))) {
			return false;
		}

		// Refuse a profile under the wrong identity instead of silently applying
		// it to another character.
		if (profile.proteusLocalFormID != LocalFormID(proteusActor) ||
			profile.characterKey != CharacterKey(proteusActor)) {
			return false;
		}

		auto* actorData = Persistent::GetActorData(player);
		auto* killData = Persistent::GetKillCountData(player);
		if (!actorData || !killData || !WriteSkillGlobals(profile.skill)) {
			return false;
		}

		*actorData = profile.actorData;
		*killData = profile.killData;
		UpdateNpcCache(proteusActor, profile);
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
		WriteSkillGlobals({});
	}

}
