#include "Papyrus/Plugin.hpp"
#include "Compat/ProteusProfile.hpp"
#include "Compat/ProteusWrapper.hpp"
#include "Data/Persistent.hpp"
#include "Utils/Text/Text.hpp"

#include "Config/Config.hpp"

#include "Magic/Effects/Common.hpp"
#include "Utils/Actions/VoreUtils.hpp"

#include "Managers/AI/Vore/VoreAI.hpp"
#include "Managers/AI/Vore/DevourmentAI.hpp"
#include "Managers/AI/Thigh/ThighCrushAI.hpp"
#include "Managers/AI/ButtCrush/ButtCrushAI.hpp"
#include "Managers/AI/Thigh/ThighSandwichAI.hpp"
#include "Managers/AI/StompKick/StompKickSwipeAI.hpp"
#include "Managers/Animation/Grab.hpp"
#include "Managers/Animation/HugShrink.hpp"
#include "Managers/Animation/Controllers/VoreController.hpp"

#include "Managers/AI/Grab/GrabAI.hpp"
#include "Managers/AI/Hug/HugAI.hpp"

using namespace RE;
using namespace RE::BSScript;
using namespace GTS;

namespace {

	constexpr std::string_view PapyrusClass = "GTSPlugin";
	constexpr std::string_view ProteusPlugin = "PROTEUS.esp";

	bool IsProteusProfileActor(const Actor* actor) {
		if (!actor) {
			return false;
		}
		auto* dataHandler = TESDataHandler::GetSingleton();
		auto* proteusFile = dataHandler ? dataHandler->LookupModByName(ProteusPlugin) : nullptr;
		return proteusFile && actor->GetFile(0) == proteusFile;
	}

	int GetTotalKills(StaticFunctionTag*, Actor* actor) {
		if (!actor) {
			return 0;
		}

		if (auto data = Persistent::GetKillCountData(actor)) {
			return static_cast<int>(data->iTotalKills);
		}

		return 0;
	}

	void SetTotalKills(StaticFunctionTag*, Actor* actor, int count) {
		if (!actor) {
			return;
		}

		if (auto data = Persistent::GetKillCountData(actor)) {
			data->iTotalKills = static_cast<std::uint32_t>(count > 0 ? count : 0);
		}
	}

	bool ProteusProfileSave(StaticFunctionTag*, Actor* player, Actor* proteusActor) {
		if (!player || !IsProteusProfileActor(proteusActor)) {
			logger::error("ProteusProfileSave: rejected invalid/non-PROTEUS.esp profile actor");
			return false;
		}
		const auto* name = proteusActor->GetDisplayFullName();
		return GTS::ProteusProfile::Save(player, proteusActor, name ? name : "");
	}

	bool ProteusProfileLoad(StaticFunctionTag*, Actor* player, Actor* proteusActor) {
		if (!player || !IsProteusProfileActor(proteusActor)) {
			logger::error("ProteusProfileLoad: rejected invalid/non-PROTEUS.esp profile actor");
			return false;
		}
		return GTS::ProteusProfile::Load(player, proteusActor);
	}

	void ProteusProfileResetNewCharacter(StaticFunctionTag*, Actor* player) {
		GTS::ProteusProfile::ResetNewCharacter(player);
	}

	bool ProteusBeginNewCharacter(StaticFunctionTag*, Actor* player, Actor* outgoingActor, std::string outgoingKey) {
		return GTS::ProteusWrapper::BeginNewCharacter(player, outgoingActor, outgoingKey);
	}

	bool ProteusFinalizeNewCharacter(StaticFunctionTag*, Actor* player) {
		return GTS::ProteusWrapper::FinalizeNewCharacter(player);
	}

	bool ProteusBeginSwitch(StaticFunctionTag*, Actor* player, Actor* outgoingActor, std::string outgoingKey) {
		return GTS::ProteusWrapper::BeginSwitch(player, outgoingActor, outgoingKey);
	}

	bool ProteusPrepareSwitch(StaticFunctionTag*, Actor* player, std::string outgoingKey) {
		return GTS::ProteusWrapper::PrepareSwitch(player, outgoingKey);
	}

	bool ProteusRestoreOutgoingSwitchActor(StaticFunctionTag*, Actor* outgoingActor, std::string diagnosticKey) {
		(void)diagnosticKey;
		return GTS::ProteusWrapper::RestoreOutgoingSwitchActor(outgoingActor);
	}

	bool ProteusFinishSwitch(StaticFunctionTag*, Actor* player, std::string incomingKey) {
		return GTS::ProteusWrapper::FinishSwitch(player, incomingKey);
	}

	void ResetQuestProgression(StaticFunctionTag*) {
		GTS::ResetQuest();
	}

	float Quest_GetProgression(StaticFunctionTag*, int stage) {
		return GTS::GetQuestProgression(stage);
	}

	bool WasDragonEaten(StaticFunctionTag*) {
		auto pc = PlayerCharacter::GetSingleton();
		auto transient = GTS::Transient::GetActorData(pc);
		if (transient) {
			return transient->DragonWasEaten;
		}
		return false;
	}

	void CallDevourmentCompatibility(StaticFunctionTag*, Actor* Pred, Actor* Prey, bool Digested) {
		if (GTS::Config::General.bDevourmentCompat) {
			GTS::Devourment_Compatibility(Pred, Prey, Digested);
		}
	}

	void ForceStartSizeInteraction(StaticFunctionTag*, Actor* Pred, Actor* Prey, int Type) {
		// 0 = Vore
		// 1 = Devourment (Only with Devourment)
		// 2 = Stomp
		// 3 = Kicks
		// 4 = Thigh Sandwich
		// 5 = Thigh Crush
		// 6 = Butt Crush
		// 7 = Hugs
		// 8 = Grab
		if (Pred && Prey) {
			switch (Type) {
				case 0: VoreAI_StartVore(Pred, std::vector<Actor*> {Prey}); break;
				case 1: DevourmentAI_Start(Pred, std::vector<Actor*> {Prey}); break;
				case 2: StompAI_Start(Pred, Prey); break;
				case 3: KickSwipeAI_Start(Pred); break;
				case 4: ThighSandwichAI_Start(Pred, std::vector<Actor*> {Prey}); break;
				case 5: ThighCrushAI_Start(Pred); break;
				case 6: ButtCrushAI_Start(Pred, Prey); break;
				case 7: HugAI_Start(Pred, Prey); break;
				case 8: GrabAI_Start(Pred, Prey); break;
			}
		} else {
			if (!Pred) {
				Notify("Pred is null");
			}
			if (!Prey) {
				Notify("Prey is null");
			}
		}
	}
}

namespace GTS {

	bool register_papyrus_plugin(IVirtualMachine* vm) {

		//Quest
		vm->RegisterFunction("ResetQuestProgression", PapyrusClass, ResetQuestProgression);
		vm->RegisterFunction("Quest_GetProgression", PapyrusClass, Quest_GetProgression);
		vm->RegisterFunction("WasDragonEaten", PapyrusClass, WasDragonEaten);

		vm->RegisterFunction("GetTotalKills", PapyrusClass, GetTotalKills);
		vm->RegisterFunction("SetTotalKills", PapyrusClass, SetTotalKills);

		// Legacy native Proteus profile bridge retained while the lifecycle
		// wrapper is validated.
		vm->RegisterFunction("ProteusProfileSave", PapyrusClass, ProteusProfileSave);
		vm->RegisterFunction("ProteusProfileLoad", PapyrusClass, ProteusProfileLoad);
		vm->RegisterFunction("ProteusProfileResetNewCharacter", PapyrusClass, ProteusProfileResetNewCharacter);

		// Proteus lifecycle wrapper. GTSCharacterProfile JSON owns persistence.
		vm->RegisterFunction("ProteusBeginNewCharacter", PapyrusClass, ProteusBeginNewCharacter);
		vm->RegisterFunction("ProteusFinalizeNewCharacter", PapyrusClass, ProteusFinalizeNewCharacter);
		vm->RegisterFunction("ProteusBeginSwitch", PapyrusClass, ProteusBeginSwitch);
		vm->RegisterFunction("ProteusPrepareSwitch", PapyrusClass, ProteusPrepareSwitch);
		vm->RegisterFunction("ProteusRestoreOutgoingSwitchActor", PapyrusClass, ProteusRestoreOutgoingSwitchActor);
		vm->RegisterFunction("ProteusFinishSwitch", PapyrusClass, ProteusFinishSwitch);

		//Devourment
		vm->RegisterFunction("CallDevourmentCompatibility", PapyrusClass, CallDevourmentCompatibility);
		vm->RegisterFunction("ForceStartSizeInteraction", PapyrusClass, ForceStartSizeInteraction);

		return true;
	}
}
