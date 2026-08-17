#include "Compat/GTSCharacterProfile.hpp"

#include "Data/Persistent.hpp"
#include "Utils/Text/Text.hpp"

#include <glaze/glaze.hpp>

#include <algorithm>
#include <filesystem>
#include <fstream>

namespace GTS::CharacterProfile {
	struct SkillGlobals {
		float level = 0.0f;
		float progress = 0.0f;
		float ratio = 0.0f;
		float legendary = 0.0f;
		float perkPoints = 0.0f;
	};

	struct Profile {
		std::uint32_t schemaVersion = 1;
		std::string profileKey;
		PersistentActorData actorData{};
		PersistentKillCountData killData{};
		SkillGlobals skill{};
		std::vector<std::uint32_t> perkLocalFormIDs;
	};

	namespace {
		constexpr std::uint32_t kSchemaVersion = 1;
		constexpr std::string_view kGTSPlugin = "GTS.esp";

		constexpr RE::FormID kSkillLevel = 0x142200;
		constexpr RE::FormID kSkillProgress = 0x142201;
		constexpr RE::FormID kSkillRatio = 0x142202;
		constexpr RE::FormID kSkillLegendary = 0x142203;
		constexpr RE::FormID kSkillPerkPoints = 0x2352E1;

		RE::TESDataHandler* DataHandler() {
			return RE::TESDataHandler::GetSingleton();
		}

		const RE::TESFile* GTSFile() {
			auto* data = DataHandler();
			return data ? data->LookupModByName(kGTSPlugin) : nullptr;
		}

		RE::TESGlobal* Global(RE::FormID localFormID) {
			auto* data = DataHandler();
			return data ? data->LookupForm<RE::TESGlobal>(localFormID, kGTSPlugin) : nullptr;
		}

		bool ReadSkill(SkillGlobals& value) {
			auto* level = Global(kSkillLevel);
			auto* progress = Global(kSkillProgress);
			auto* ratio = Global(kSkillRatio);
			auto* legendary = Global(kSkillLegendary);
			auto* perkPoints = Global(kSkillPerkPoints);
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

		bool WriteSkill(const SkillGlobals& value) {
			auto* level = Global(kSkillLevel);
			auto* progress = Global(kSkillProgress);
			auto* ratio = Global(kSkillRatio);
			auto* legendary = Global(kSkillLegendary);
			auto* perkPoints = Global(kSkillPerkPoints);
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

		bool CapturePerks(RE::Actor* actor, std::vector<std::uint32_t>& perks) {
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

		bool ClearPerks(RE::Actor* actor) {
			auto* data = DataHandler();
			auto* gts = GTSFile();
			if (!actor || !data || !gts) {
				return false;
			}
			for (auto* perk : data->GetFormArray<RE::BGSPerk>()) {
				if (IsGTSForm(perk, gts) && actor->HasPerk(perk)) {
					actor->RemovePerk(perk);
				}
			}
			return true;
		}

		bool RestorePerks(RE::Actor* actor, const std::vector<std::uint32_t>& perks) {
			auto* data = DataHandler();
			if (!actor || !data || !GTSFile()) {
				return false;
			}
			if (!ClearPerks(actor)) {
				return false;
			}
			for (auto localID : perks) {
				auto* perk = data->LookupForm<RE::BGSPerk>(localID, kGTSPlugin);
				if (!perk) {
					logger::warn("GTSCharacterProfile: saved perk {:06X} no longer exists", localID);
					continue;
				}
				if (!actor->HasPerk(perk)) {
					actor->AddPerk(perk);
				}
			}
			return true;
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

		std::size_t CountPerks(RE::Actor* actor) {
			std::vector<std::uint32_t> perks;
			return CapturePerks(actor, perks) ? perks.size() : 0;
		}
	}

	void Dump(RE::Actor* actor, std::string_view label) {
		if (!actor) {
			Cprint("GTS profile {}: actor is null", label);
			return;
		}
		auto* actorData = Persistent::GetActorData(actor);
		auto* killData = Persistent::GetKillCountData(actor);
		SkillGlobals skill{};
		const bool hasSkill = ReadSkill(skill);
		const auto perkCount = CountPerks(actor);
		Cprint("GTS PROFILE [{}] kills={} skill={:.2f} progress={:.2f} ratio={:.2f} legendary={:.0f} points={:.0f} perks={} visual={:.3f} target={:.3f} max={:.3f}",
			label,
			killData ? killData->iTotalKills : 0u,
			hasSkill ? skill.level : -1.0f,
			hasSkill ? skill.progress : -1.0f,
			hasSkill ? skill.ratio : -1.0f,
			hasSkill ? skill.legendary : -1.0f,
			hasSkill ? skill.perkPoints : -1.0f,
			perkCount,
			actorData ? actorData->fVisualScale : -1.0f,
			actorData ? actorData->fTargetScale : -1.0f,
			actorData ? actorData->fMaxScale : -1.0f);
		logger::info("GTSCharacterProfile: dump '{}' kills={} perks={} skill={:.3f}", label,
			killData ? killData->iTotalKills : 0u, perkCount, hasSkill ? skill.level : -1.0f);
	}

	bool Save(RE::Actor* actor, std::string_view profileKey) {
		if (!actor || !GTSFile()) {
			return false;
		}
		Profile profile{};
		profile.profileKey = std::string(profileKey);
		auto* actorData = Persistent::GetActorData(actor);
		auto* killData = Persistent::GetKillCountData(actor);
		if (!actorData || !killData || !ReadSkill(profile.skill) || !CapturePerks(actor, profile.perkLocalFormIDs)) {
			logger::warn("GTSCharacterProfile: save refused because complete GTS state is unavailable");
			return false;
		}
		profile.actorData = *actorData;
		profile.killData = *killData;
		const auto path = PathFor(profileKey);
		if (!WriteFile(profile, path)) {
			logger::error("GTSCharacterProfile: failed to write {}", path.string());
			return false;
		}
		logger::info("GTSCharacterProfile: saved key='{}' path='{}' perks={} kills={}",
			profile.profileKey, path.string(), profile.perkLocalFormIDs.size(), profile.killData.iTotalKills);
		return true;
	}

	bool Load(RE::Actor* actor, std::string_view profileKey) {
		if (!actor || !GTSFile()) {
			return false;
		}
		Profile profile{};
		const auto path = PathFor(profileKey);
		if (!ReadWithBackup(profile, path)) {
			logger::warn("GTSCharacterProfile: no valid profile for key='{}'", profileKey);
			return false;
		}
		if (profile.profileKey != profileKey) {
			logger::error("GTSCharacterProfile: profile key mismatch stored='{}' requested='{}'", profile.profileKey, profileKey);
			return false;
		}
		auto* actorData = Persistent::GetActorData(actor);
		auto* killData = Persistent::GetKillCountData(actor);
		if (!actorData || !killData || !WriteSkill(profile.skill)) {
			return false;
		}
		*actorData = profile.actorData;
		*killData = profile.killData;
		if (!RestorePerks(actor, profile.perkLocalFormIDs)) {
			return false;
		}
		logger::info("GTSCharacterProfile: loaded key='{}' perks={} kills={}",
			profile.profileKey, profile.perkLocalFormIDs.size(), profile.killData.iTotalKills);
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
		*actorData = {};
		*killData = {};
		if (!WriteSkill({}) || !ClearPerks(actor)) {
			return false;
		}
		logger::info("GTSCharacterProfile: reset actor {:08X}", actor->GetFormID());
		return true;
	}
}
