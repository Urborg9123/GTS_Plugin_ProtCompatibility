#include "Managers/Console/ConsoleManager.hpp"
#include "Compat/GTSCharacterProfile.hpp"
#include "Version.hpp"
#include "git.h"


namespace GTS {

	void ConsoleManager::RegisterCommand(std::string_view a_cmdName, const std::function<void()>& a_callback, const std::string& a_desc) {

		std::string name(a_cmdName);
		RegisteredCommands.try_emplace(name, a_callback, a_desc);
		logger::info("Registered Console Command \"{} {}\"", Default_Preffix, name);
	}

	bool ConsoleManager::Process(const std::string& a_msg) {

		if (RegisteredCommands.empty()) return false;

		//Convert to invariant and trim
		std::stringstream Msg(trim(str_tolower(a_msg)));

		std::vector<std::string> Args{};
		std::string TmpArg;

		while (Msg >> TmpArg) {

			//If subcommands are ever needed just increase this value
			if (Args.size() == 2) {
				break;
			}

			Args.emplace_back(TmpArg);

			//no "gts" ? then its not our problem to deal with
			if (Args.at(0) != Default_Preffix) {
				return false;
			}
		}

		//if 1 arg show help
		if (Args.size() < 2) {
			CMD_Help();
			return true;
		}

		for (const auto& registered_command : RegisteredCommands) {
			if (registered_command.first == Args.at(1)) {
				if (registered_command.second.callback) {
					registered_command.second.callback();
					return true;
				}
				else {
					logger::warn("Command {} has no function assigned to it", registered_command.first);
					return false;
				}
			}
		}

		Cprint("Command not found type {} help for a list of commands.", Default_Preffix);
		return true;
	}

	std::string ConsoleManager::DebugName() {
		return "::ConsoleManager";
	}

	void ConsoleManager::DataReady() {
		Init();
	}

	void ConsoleManager::CMD_Help() {
		Cprint("--- List of available commands ---");

		for (const auto& key : RegisteredCommands) {
			Cprint("* {} {} - {} ", Default_Preffix, key.first, key.second.desc);
		}
	}

	void ConsoleManager::CMD_Version() {
		Cprint("--- Giantess Mod: Size Matters ---");
		Cprint("Version: {}", GTSPlugin::ModVersion.string());
		Cprint("Dll Build Date: {} {}", __DATE__, __TIME__);
		Cprint("Git Commit Date: {}", git_CommitDate());
	}

	void ConsoleManager::CMD_Unlimited() {
		auto Player = PlayerCharacter::GetSingleton();
		if (Player) {
			if (Runtime::HasPerk(Player, Runtime::PERK.GTSPerkColossalGrowth)) {
				Persistent::UnlockMaxSizeSliders.value = !Persistent::UnlockMaxSizeSliders.value;
				Cprint("Max Size Sliders unlocked: {}", Persistent::UnlockMaxSizeSliders.value);
			}
			else {
				Cprint("You need to obtain Colossal Growth perk to use this command");
			}
		}
	}

	void ConsoleManager::CMD_ProfileDump() {
		auto* player = PlayerCharacter::GetSingleton();
		CharacterProfile::Dump(player, "manual-test");
	}

	void ConsoleManager::CMD_ProfileSave() {
		auto* player = PlayerCharacter::GetSingleton();
		CharacterProfile::Dump(player, "before-save");
		const bool ok = CharacterProfile::Save(player, "manual-test");
		Cprint("GTS profile SAVE: {}", ok ? "SUCCESS" : "FAILED");
	}

	void ConsoleManager::CMD_ProfileReset() {
		auto* player = PlayerCharacter::GetSingleton();
		CharacterProfile::Dump(player, "before-reset");
		const bool ok = CharacterProfile::Reset(player);
		Cprint("GTS profile RESET: {}", ok ? "SUCCESS" : "FAILED");
		CharacterProfile::Dump(player, "after-reset");
	}

	void ConsoleManager::CMD_ProfileLoad() {
		auto* player = PlayerCharacter::GetSingleton();
		CharacterProfile::Dump(player, "before-load");
		const bool ok = CharacterProfile::Load(player, "manual-test");
		Cprint("GTS profile LOAD: {}", ok ? "SUCCESS" : "FAILED");
		CharacterProfile::Dump(player, "after-load");
	}

	void ConsoleManager::Init() {
		logger::info("Loading Default Command List");
		RegisterCommand("help", CMD_Help, "Show this list");
		RegisterCommand("version", CMD_Version, "Show plugin version");
		RegisterCommand("unlimited", CMD_Unlimited, "Unlocks max size sliders");
		RegisterCommand("pdump", CMD_ProfileDump, "Dump current GTS profile state");
		RegisterCommand("psave", CMD_ProfileSave, "Save current GTS state to manual-test JSON");
		RegisterCommand("preset", CMD_ProfileReset, "Reset current GTS progression state");
		RegisterCommand("pload", CMD_ProfileLoad, "Load manual-test JSON into current GTS state");
	}
}


