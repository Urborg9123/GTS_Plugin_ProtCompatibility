#include "Compat/ProteusWrapper.hpp"

#include "Compat/GTSCharacterProfile.hpp"

#include <mutex>

namespace GTS::ProteusWrapper {
	namespace {
		struct NewCharacterState {
			bool pending = false;
			bool raceMenuOpened = false;
			bool raceMenuClosed = false;
			std::string oldKey;
		};

		std::mutex StateLock;
		NewCharacterState NewCharacter;

		bool IsPlayer(RE::Actor* actor) {
			return actor && actor == RE::PlayerCharacter::GetSingleton();
		}

		std::string ActorKey(RE::Actor* actor) {
			if (!actor) {
				return {};
			}

			if (auto* base = actor->GetActorBase()) {
				if (const auto* name = base->GetName(); name && name[0] != '\0') {
					return std::string(name);
				}
			}

			if (const auto* name = actor->GetDisplayFullName(); name && name[0] != '\0') {
				return std::string(name);
			}

			return {};
		}

		bool SaveOutgoing(RE::Actor* player, RE::Actor* outgoingActor, std::string_view key) {
			if (key.empty()) {
				logger::error("ProteusWrapper: refused outgoing save with empty Proteus preset key");
				return false;
			}

			if (!GTS::CharacterProfile::Save(player, key)) {
				logger::error("ProteusWrapper: canonical save failed for outgoing key='{}'", key);
				return false;
			}

			if (outgoingActor && !GTS::CharacterProfile::Load(outgoingActor, key)) {
				logger::warn(
					"ProteusWrapper: canonical save succeeded but inactive actor cache refresh failed key='{}' actor={:08X}",
					key,
					outgoingActor->GetFormID());
			}

			return true;
		}

		bool InitializeFresh(RE::Actor* player, std::string_view key) {
			if (key.empty()) {
				logger::error("ProteusWrapper: refused fresh profile with empty Proteus preset key");
				return false;
			}

			if (!GTS::CharacterProfile::Reset(player)) {
				logger::error("ProteusWrapper: failed to reset Player for fresh key='{}'", key);
				return false;
			}

			if (!GTS::CharacterProfile::Save(player, key)) {
				logger::error("ProteusWrapper: failed to create fresh canonical profile key='{}'", key);
				return false;
			}

			return true;
		}
	}

	bool BeginNewCharacter(RE::Actor* player, RE::Actor* outgoingActor, std::string_view outgoingKey) {
		if (!IsPlayer(player)) {
			logger::error("ProteusWrapper: BeginNewCharacter rejected non-player actor");
			return false;
		}
		if (outgoingKey.empty()) {
			logger::error("ProteusWrapper: BeginNewCharacter received empty outgoing preset key");
			return false;
		}

		if (!SaveOutgoing(player, outgoingActor, outgoingKey)) {
			return false;
		}

		{
			std::scoped_lock lock(StateLock);
			NewCharacter.pending = true;
			NewCharacter.raceMenuOpened = false;
			NewCharacter.raceMenuClosed = false;
			NewCharacter.oldKey = std::string(outgoingKey);
		}

		logger::info(
			"ProteusWrapper: New Character armed outgoing='{}' player={:08X} inactive={:08X}",
			outgoingKey,
			player->GetFormID(),
			outgoingActor ? outgoingActor->GetFormID() : 0u);
		return true;
	}

	bool FinalizeNewCharacter(RE::Actor* player) {
		if (!IsPlayer(player)) {
			logger::error("ProteusWrapper: FinalizeNewCharacter rejected non-player actor");
			return false;
		}

		NewCharacterState state;
		{
			std::scoped_lock lock(StateLock);
			state = NewCharacter;
		}

		if (!state.pending) {
			logger::error("ProteusWrapper: FinalizeNewCharacter called without pending transaction");
			return false;
		}
		if (!state.raceMenuOpened || !state.raceMenuClosed) {
			logger::error(
				"ProteusWrapper: FinalizeNewCharacter rejected incomplete RaceMenu transaction open={} close={}",
				state.raceMenuOpened,
				state.raceMenuClosed);
			return false;
		}

		const auto newKey = ActorKey(player);
		if (newKey.empty()) {
			logger::error("ProteusWrapper: FinalizeNewCharacter could not resolve new character name");
			return false;
		}

		if (newKey == state.oldKey) {
			logger::error(
				"ProteusWrapper: New Character kept the outgoing preset key '{}'; refusing to overwrite its canonical GTS profile",
				newKey);
			return false;
		}

		const bool ok = InitializeFresh(player, newKey);
		if (ok) {
			std::scoped_lock lock(StateLock);
			NewCharacter = {};
			logger::info("ProteusWrapper: New Character finalized '{}' -> '{}'", state.oldKey, newKey);
		}
		return ok;
	}

	bool BeginSwitch(RE::Actor* player, RE::Actor* outgoingActor, std::string_view outgoingKey) {
		if (!IsPlayer(player)) {
			logger::error("ProteusWrapper: BeginSwitch rejected non-player actor");
			return false;
		}
		if (outgoingKey.empty()) {
			logger::error("ProteusWrapper: BeginSwitch received empty outgoing preset key");
			return false;
		}

		const bool ok = SaveOutgoing(player, outgoingActor, outgoingKey);
		if (ok) {
			logger::info(
				"ProteusWrapper: saved outgoing switch character key='{}' inactive={:08X}",
				outgoingKey,
				outgoingActor ? outgoingActor->GetFormID() : 0u);
		}
		return ok;
	}

	bool FinishSwitch(RE::Actor* player, std::string_view incomingKey) {
		if (!IsPlayer(player)) {
			logger::error("ProteusWrapper: FinishSwitch rejected non-player actor");
			return false;
		}
		if (incomingKey.empty()) {
			logger::error("ProteusWrapper: FinishSwitch received empty incoming preset key");
			return false;
		}

		if (GTS::CharacterProfile::Load(player, incomingKey)) {
			logger::info("ProteusWrapper: loaded incoming switch character key='{}'", incomingKey);
			return true;
		}

		logger::warn("ProteusWrapper: no canonical profile for incoming key='{}'; initializing clean GTS state", incomingKey);
		return InitializeFresh(player, incomingKey);
	}

	void HandleMenuOpenClose(const RE::MenuOpenCloseEvent* event) {
		if (!event || event->menuName != RE::RaceSexMenu::MENU_NAME) {
			return;
		}

		std::scoped_lock lock(StateLock);
		if (!NewCharacter.pending) {
			return;
		}

		if (event->opening) {
			NewCharacter.raceMenuOpened = true;
			NewCharacter.raceMenuClosed = false;
			logger::info("ProteusWrapper: RaceMenu OPEN during New Character transaction");
			return;
		}

		if (!NewCharacter.raceMenuOpened) {
			logger::warn("ProteusWrapper: ignored RaceMenu CLOSE without matching OPEN");
			return;
		}

		NewCharacter.raceMenuClosed = true;
		logger::info("ProteusWrapper: RaceMenu CLOSE; New Character may finalize at Proteus end boundary");
	}

	void Reset() {
		std::scoped_lock lock(StateLock);
		if (NewCharacter.pending) {
			logger::info("ProteusWrapper: clearing pending New Character transaction");
		}
		NewCharacter = {};
	}
}
