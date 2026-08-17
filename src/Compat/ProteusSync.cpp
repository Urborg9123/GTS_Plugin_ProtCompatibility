#include "Compat/ProteusSync.hpp"

#include "Compat/ProteusProfile.hpp"

#include <mutex>

namespace GTS::ProteusSync {
	namespace {
		struct NewCharacterState {
			bool pending = false;
			bool raceMenuOpened = false;
			bool finalizeQueued = false;
			std::string oldName;
		};

		std::mutex StateLock;
		NewCharacterState State;

		std::string ActorName(RE::Actor* actor) {
			if (!actor) {
				return {};
			}
			const auto* name = actor->GetDisplayFullName();
			return name ? std::string(name) : std::string{};
		}

		void FinalizeNewCharacter(std::string oldName) {
			auto* player = RE::PlayerCharacter::GetSingleton();
			if (!player) {
				logger::error("ProteusSync: New Character finalizer could not resolve Player");
				Reset();
				return;
			}

			const auto newName = ActorName(player);
			logger::info(
				"ProteusSync: finalizing New Character '{}' -> '{}' (player={:08X})",
				oldName,
				newName,
				player->GetFormID());

			// The new Proteus character has no stable inactive NPC yet. Clean the
			// Player working copy now; its authoritative JSON profile is created
			// later, when Proteus first switches away and a stable NPC exists.
			GTS::ProteusProfile::ResetNewCharacter(player);

			{
				std::scoped_lock lock(StateLock);
				State = {};
			}
			logger::info("ProteusSync: New Character transaction complete");
		}
	}

	void BeginNewCharacter(RE::Actor* player) {
		auto* actualPlayer = RE::PlayerCharacter::GetSingleton();
		if (!player || player != actualPlayer) {
			logger::error("ProteusSync: rejected New Character begin for non-player actor");
			return;
		}

		std::scoped_lock lock(StateLock);
		State.pending = true;
		State.raceMenuOpened = false;
		State.finalizeQueued = false;
		State.oldName = ActorName(player);

		logger::info(
			"ProteusSync: begin New Character outgoing='{}' player={:08X}",
			State.oldName,
			player->GetFormID());
	}

	void HandleMenuOpenClose(const RE::MenuOpenCloseEvent* event) {
		if (!event || event->menuName != RE::RaceSexMenu::MENU_NAME) {
			return;
		}

		std::string oldName;
		bool queueFinalize = false;
		{
			std::scoped_lock lock(StateLock);
			if (!State.pending) {
				return;
			}

			if (event->opening) {
				State.raceMenuOpened = true;
				logger::info("ProteusSync: RaceMenu OPEN during pending New Character");
				return;
			}

			if (!State.raceMenuOpened) {
				logger::warn("ProteusSync: ignored RaceMenu CLOSE before matching OPEN");
				return;
			}

			if (State.finalizeQueued) {
				return;
			}

			State.finalizeQueued = true;
			oldName = State.oldName;
			queueFinalize = true;
		}

		if (!queueFinalize) {
			return;
		}

		logger::info("ProteusSync: RaceMenu CLOSE; queueing New Character finalizer");
		if (auto* task = SKSE::GetTaskInterface()) {
			task->AddTask([oldName = std::move(oldName)]() mutable {
				FinalizeNewCharacter(std::move(oldName));
			});
		} else {
			logger::error("ProteusSync: SKSE task interface unavailable; cancelling transaction");
			Reset();
		}
	}

	void Reset() {
		std::scoped_lock lock(StateLock);
		if (State.pending) {
			logger::info("ProteusSync: clearing pending transaction state");
		}
		State = {};
	}
}
