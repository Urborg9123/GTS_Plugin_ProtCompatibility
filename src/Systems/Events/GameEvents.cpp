#include "Systems/Events/GameEvents.hpp"

namespace GTS {

	std::string GameEvents::DebugName() {
		return "::GameEvents";
	}

	void GameEvents::DataReady() {
		auto event_sources = ScriptEventSourceHolder::GetSingleton();
		if (event_sources) {
			event_sources->AddEventSink<TESHitEvent>(this);
			event_sources->AddEventSink<TESObjectLoadedEvent>(this);
			event_sources->AddEventSink<TESEquipEvent>(this);
			event_sources->AddEventSink<TESTrackedStatsEvent>(this);
			event_sources->AddEventSink<TESResetEvent>(this);
			event_sources->AddEventSink<TESDeathEvent>(this);
			event_sources->AddEventSink<TESFurnitureEvent>(this); 
		}


		auto ui = UI::GetSingleton();
		if (ui) {
			ui->AddEventSink<MenuOpenCloseEvent>(this);
			logger::info("Successfully registered MenuOpenCloseEventHandler");
		}
		else {
			logger::error("Failed to register MenuOpenCloseEventHandler");
		}
	}

	BSEventNotifyControl GameEvents::ProcessEvent(const TESHitEvent* evn, BSTEventSource<TESHitEvent>* dispatcher){
		if (evn) EventDispatcher::DoHitEvent(evn);
		return BSEventNotifyControl::kContinue;
	}

	BSEventNotifyControl GameEvents::ProcessEvent(const TESObjectLoadedEvent* evn, BSTEventSource<TESObjectLoadedEvent>* dispatcher) {
		if (evn) {
			if (auto* actor = TESForm::LookupByID<Actor>(evn->formID)){
				//EventDispatcher::DoActorLoaded(actor);
			}
		}
		return BSEventNotifyControl::kContinue;
	}

	BSEventNotifyControl GameEvents::ProcessEvent(const TESResetEvent* evn, BSTEventSource<TESResetEvent>* dispatcher) {
		if (evn) {
			if (auto* object = evn->object.get()) {
				if (auto* actor = TESForm::LookupByID<Actor>(object->formID)) {
					EventDispatcher::DoResetActor(actor);
				}
			}
		}
		return BSEventNotifyControl::kContinue;
	}

	BSEventNotifyControl GameEvents::ProcessEvent(const TESEquipEvent* evn, BSTEventSource<TESEquipEvent>* dispatcher) {
		if (evn) {
			if (auto* actor = TESForm::LookupByID<Actor>(evn->actor->formID)) {
				EventDispatcher::DoActorEquip(actor);
			}
		}
		return BSEventNotifyControl::kContinue;
	}

	BSEventNotifyControl GameEvents::ProcessEvent(const TESTrackedStatsEvent* evn, BSTEventSource<TESTrackedStatsEvent>* dispatcher){
		if (evn) {
			if (evn->stat == "Dragon Souls Collected") {
				EventDispatcher::DoDragonSoulAbsorption();
			}
		}
		return BSEventNotifyControl::kContinue;
	}

	BSEventNotifyControl GameEvents::ProcessEvent(const MenuOpenCloseEvent* a_event, BSTEventSource<MenuOpenCloseEvent>* a_eventSource) {

		if (a_event) {

			if (a_event->menuName == RE::MainMenu::MENU_NAME) {
				//Set the state flag opposite to the open/close bool for the main menu.
				//Fixes cases where the mod doesn't initialize if you directly load into a cell from the main menu.
				//Passing the inverted state also acts as a "Reset" so that if you go back to the main menu the ingame state is set to false again.
				State::SetInGame(!a_event->opening);
			}

			// Proteus compatibility diagnostic. RaceMenu itself is our candidate
			// synchronization barrier for the New Character flow. This test is
			// deliberately read-only: it logs the menu boundary and the player
			// identity after the close event, but does not modify any GTS state.
			if (a_event->menuName == RE::RaceSexMenu::MENU_NAME) {
				if (a_event->opening) {
					auto* player = RE::PlayerCharacter::GetSingleton();
					const char* name = player ? player->GetDisplayFullName() : nullptr;
					logger::info("ProteusRaceMenuDiag: OPEN playerName='{}'", name ? name : "<null>");
				} else {
					auto* player = RE::PlayerCharacter::GetSingleton();
					const char* name = player ? player->GetDisplayFullName() : nullptr;
					logger::info("ProteusRaceMenuDiag: CLOSE playerName-at-event='{}'", name ? name : "<null>");

					if (auto* tasks = SKSE::GetTaskInterface()) {
						tasks->AddTask([]() {
							auto* queuedPlayer = RE::PlayerCharacter::GetSingleton();
							const char* queuedName = queuedPlayer ? queuedPlayer->GetDisplayFullName() : nullptr;
							logger::info("ProteusRaceMenuDiag: POST-CLOSE playerName='{}'", queuedName ? queuedName : "<null>");
						});
					} else {
						logger::warn("ProteusRaceMenuDiag: SKSE task interface unavailable after RaceMenu close");
					}
				}
			}

			EventDispatcher::DoMenuChange(a_event);
		}

		return RE::BSEventNotifyControl::kContinue;
	}

	BSEventNotifyControl GameEvents::ProcessEvent(const TESFurnitureEvent* a_event, BSTEventSource<TESFurnitureEvent>* a_eventSource) {
		if (a_event) EventDispatcher::DoFurnitureEvent(a_event);
		return RE::BSEventNotifyControl::kContinue;
	}

	BSEventNotifyControl GameEvents::ProcessEvent(const TESDeathEvent* a_event, BSTEventSource<TESDeathEvent>* a_eventSource) {
		if (a_event) EventDispatcher::DoGameDeathEvent(a_event);
		return RE::BSEventNotifyControl::kContinue;
	}
}
