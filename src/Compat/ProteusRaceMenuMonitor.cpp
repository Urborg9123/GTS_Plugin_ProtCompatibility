#include "Compat/ProteusRaceMenuMonitor.hpp"

#include "Systems/Events/EventDispatcher.hpp"
#include "Systems/Events/EventListener.hpp"

namespace GTS::ProteusRaceMenuMonitor {
	namespace {
		class Monitor final : public EventListener {
		public:
			static Monitor& GetSingleton() {
				static Monitor instance;
				return instance;
			}

			std::string DebugName() override {
				return "::ProteusRaceMenuMonitor";
			}

			void MenuChange(const RE::MenuOpenCloseEvent* event) override {
				if (!event || event->menuName != RE::RaceSexMenu::MENU_NAME) {
					return;
				}

				auto* player = RE::PlayerCharacter::GetSingleton();
				const char* currentName = player ? player->GetDisplayFullName() : nullptr;
				logger::info(
					"ProteusRaceMenuDiag: RaceMenu {} player={:08X} name='{}'",
					event->opening ? "OPEN" : "CLOSE",
					player ? player->GetFormID() : 0u,
					currentName ? currentName : "<null>");

				if (!event->opening) {
					SKSE::GetTaskInterface()->AddTask([] {
						auto* deferredPlayer = RE::PlayerCharacter::GetSingleton();
						const char* deferredName = deferredPlayer ? deferredPlayer->GetDisplayFullName() : nullptr;
						logger::info(
							"ProteusRaceMenuDiag: POST-CLOSE player={:08X} name='{}'",
							deferredPlayer ? deferredPlayer->GetFormID() : 0u,
							deferredName ? deferredName : "<null>");
					});
				}
			}

		private:
			Monitor() = default;
		};
	}

	void Register() {
		EventDispatcher::AddListener(&Monitor::GetSingleton());
		logger::info("ProteusRaceMenuDiag: monitor registered");
	}
}
