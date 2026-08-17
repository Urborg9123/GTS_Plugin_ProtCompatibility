#include "Managers/Console/ConsoleManager.hpp"
#include "Compat/GTSCharacterProfile.hpp"
#include "Version.hpp"
#include "git.h"


namespace GTS {

	namespace {
		RE::Actor* ResolveProfileActor() {
			auto selected = RE::Console::GetSelectedRef();
			if (selected) {
				auto* actor = selected->As<RE::Actor>();
				if (!actor) {
					Cprint("GTS profile: selected console reference is not an Actor; command aborted");
					return nullptr;
				}

				Cprint("GTS profile target: selected actor {:08X}", actor->GetFormID());
				auto* player = PlayerCharacter::GetSingleton();
				if (actor != player) {
					Cprint("GTS profile note: skill/progress globals are shared runtime state and will also be saved/loaded/reset");
				}
				return actor;
			}

			auto* player = PlayerCharacter::GetSingleton();
			if (player) {
				Cprint("GTS profile target: player {:08X}", player->GetFormID());
			}
			return player;
		}

		bool ResolveProfileKey(const std::vector<std::string>& args, std::string_view command, std::string& key) {
			if (args.size() > 1) {
				Cprint("Usage: gts {} [profile]", command);
				return false;
			}
			key = args.empty() ? "manual-test" : args.front();
			return true;
		}

		bool RequireNoArgs(const std::vector<std::string>& args, std::string_view command) {
			if (!args.empty()) {
				Cprint("Usage: gts {}", command);
				return false;
			}
			return true;
		}
	}

	void ConsoleManager::RegisterCommand(std::string_view a_cmdName, const std::function<void(const CommandArgs&)>& a_callback, const std::string& a_desc) {

		std::string name(a_cmdName);
		RegisteredCommands.try_emplace(name, a_callback, a_desc);
		logger::info("Registered Console Command \"{} {}\"", Default_Preffix, name);
	}

	bool ConsoleManager::Process(const std::string& a_msg) {

		if (RegisteredCommands.empty()) return false;

		std::stringstream Msg(trim(a_msg));

		std::vector<std::string> Args{};
		std::string TmpArg;

		while (Msg >> TmpArg) {
			Args.emplace_back(TmpArg);
		}

		if (Args.empty() || str_tolower(Args.at(0)) != Default_Preffix) {
			return false;
		}

		//if 1 arg show help
		if (Args.size() < 2) {
			CMD_Help(CommandArgs{});
			return true;
		}

		const auto commandName = str_tolower(Args.at(1));
		CommandArgs commandArgs{};
		if (Args.size() > 2) {
			commandArgs.assign(Args.begin() + 2, Args.end());
		}

		for (const auto& registered_command : RegisteredCommands) {
			if (registered_command.first == commandName) {
				if (registered_command.second.callback) {
					registered_command.second.callback(commandArgs);
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

	void ConsoleManager::CMD_Help(const CommandArgs&) {
		Cprint("--- List of available commands ---");

		for (const auto& key : RegisteredCommands) {
			Cprint("* {} {} - {} ", Default_Preffix, key.first, key.second.desc);
		}
	}

	void ConsoleManager::CMD_Version(const CommandArgs&) {
		Cprint("--- Giantess Mod: Size Matters ---");
		Cprint("Version: {}", GTSPlugin::ModVersion.string());
		Cprint("Dll Build Date: {} {}", __DATE__, __TIME__);
		Cprint("Git Commit Date: {}", git_CommitDate());
	}

	void ConsoleManager::CMD_Unlimited(const CommandArgs&) {
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

	void ConsoleManager::CMD_ProfileDump(const CommandArgs& args) {
		std::string label;
		if (!ResolveProfileKey(args, "pdump", label)) {
			return;
		}
		auto* actor = ResolveProfileActor();
		if (!actor) {
			return;
		}
		CharacterProfile::Dump(actor, label);
	}

	void ConsoleManager::CMD_ProfileSave(const CommandArgs& args) {
		std::string key;
		if (!ResolveProfileKey(args, "psave", key)) {
			return;
		}
		auto* actor = ResolveProfileActor();
		if (!actor) {
			return;
		}
		CharacterProfile::Dump(actor, "before-save");
		const bool ok = CharacterProfile::Save(actor, key);
		Cprint("GTS profile SAVE [{}] actor {:08X}: {}", key, actor->GetFormID(), ok ? "SUCCESS" : "FAILED");
	}

	void ConsoleManager::CMD_ProfileReset(const CommandArgs& args) {
		if (!RequireNoArgs(args, "preset")) {
			return;
		}
		auto* actor = ResolveProfileActor();
		if (!actor) {
			return;
		}
		CharacterProfile::Dump(actor, "before-reset");
		const bool ok = CharacterProfile::Reset(actor);
		Cprint("GTS profile RESET actor {:08X}: {}", actor->GetFormID(), ok ? "SUCCESS" : "FAILED");
		CharacterProfile::Dump(actor, "after-reset");
	}

	void ConsoleManager::CMD_ProfileLoad(const CommandArgs& args) {
		std::string key;
		if (!ResolveProfileKey(args, "pload", key)) {
			return;
		}
		auto* actor = ResolveProfileActor();
		if (!actor) {
			return;
		}
		CharacterProfile::Dump(actor, "before-load");
		const bool ok = CharacterProfile::Load(actor, key);
		Cprint("GTS profile LOAD [{}] actor {:08X}: {}", key, actor->GetFormID(), ok ? "SUCCESS" : "FAILED");
		CharacterProfile::Dump(actor, "after-load");
	}

	void ConsoleManager::Init() {
		logger::info("Loading Default Command List");
		RegisterCommand("help", CMD_Help, "Show this list");
		RegisterCommand("version", CMD_Version, "Show plugin version");
		RegisterCommand("unlimited", CMD_Unlimited, "Unlocks max size sliders");

		RegisterCommand("pdump", CMD_ProfileDump, "Dump selected actor/player GTS state; optional profile label");
		RegisterCommand("psave", CMD_ProfileSave, "Save selected actor/player GTS state; optional profile name");
		RegisterCommand("preset", CMD_ProfileReset, "Reset selected actor/player GTS progression state");
		RegisterCommand("pload", CMD_ProfileLoad, "Load named GTS profile into selected actor/player");

		// Manual profile/actor aliases used by the persistence test harness.
		RegisterCommand("padump", CMD_ProfileDump, "Alias: dump selected actor/player GTS state");
		RegisterCommand("pasave", CMD_ProfileSave, "Alias: save selected actor/player GTS state to named profile");
		RegisterCommand("pareset", CMD_ProfileReset, "Alias: reset selected actor/player GTS state");
		RegisterCommand("paload", CMD_ProfileLoad, "Alias: load named profile into selected actor/player");
	}
}


