#include "Compat/ProteusWrapper.hpp"

#include "Compat/GTSCharacterProfile.hpp"

#include <mutex>

namespace GTS::ProteusWrapper {
	namespace {
		struct NewCharacterState {
			bool pending = false;
			bool outgoingActorRestored = false;
			bool raceMenuOpened = false;
			bool raceMenuClosed = false;
			std::string oldKey;
		};

		struct SwitchState {
			bool pending = false;
			bool outgoingActorRestored = false;
			std::string outgoingKey;
		};

		std::mutex StateLock;
		NewCharacterState NewCharacter;
		SwitchState Switch;

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

		bool SaveAndResetPlayer(RE::Actor* player, std::string_view key, std::string_view flow) {
			if (key.empty()) {
				logger::error("ProteusWrapper: {} refused empty outgoing preset key", flow);
				return false;
			}

			if (!GTS::CharacterProfile::Save(player, key)) {
				logger::error("ProteusWrapper: {} failed saving outgoing key='{}'", flow, key);
				return false;
			}

			if (!GTS::CharacterProfile::Reset(player)) {
				logger::error("ProteusWrapper: {} saved '{}' but failed resetting Player", flow, key);
				return false;
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
		// Legacy entry retained for older test PEX builds. The validated replacement
		// is PrepareNewCharacter -> RestoreOutgoingNewCharacterActor -> Finalize.
		logger::error(
			"ProteusWrapper: ENTER BeginNewCharacter(legacy) player={:08X} outgoing={:08X} key='{}'",
			player ? player->GetFormID() : 0u,
			outgoingActor ? outgoingActor->GetFormID() : 0u,
			outgoingKey);

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
			NewCharacter.outgoingActorRestored = outgoingActor != nullptr;
			NewCharacter.raceMenuOpened = false;
			NewCharacter.raceMenuClosed = false;
			NewCharacter.oldKey = std::string(outgoingKey);
		}

		return true;
	}

	bool PrepareNewCharacter(RE::Actor* player, std::string_view outgoingKey) {
		logger::error(
			"ProteusWrapper: ENTER PrepareNewCharacter player={:08X} key='{}'",
			player ? player->GetFormID() : 0u,
			outgoingKey);

		if (!IsPlayer(player)) {
			logger::error("ProteusWrapper: PrepareNewCharacter rejected non-player actor");
			return false;
		}

		// Snapshot the outgoing character while Player 0x14 still unequivocally
		// represents it, then clear GTS character state before Proteus serializes it.
		if (!SaveAndResetPlayer(player, outgoingKey, "PrepareNewCharacter")) {
			return false;
		}

		{
			std::scoped_lock lock(StateLock);
			NewCharacter.pending = true;
			NewCharacter.outgoingActorRestored = false;
			NewCharacter.raceMenuOpened = false;
			NewCharacter.raceMenuClosed = false;
			NewCharacter.oldKey = std::string(outgoingKey);
		}

		logger::error("ProteusWrapper: NEWCHAR PREPARED outgoing='{}' saved=true reset=true", outgoingKey);
		return true;
	}

	bool RestoreOutgoingNewCharacterActor(RE::Actor* outgoingActor) {
		NewCharacterState state;
		{
			std::scoped_lock lock(StateLock);
			state = NewCharacter;
		}

		logger::error(
			"ProteusWrapper: ENTER RestoreOutgoingNewCharacterActor actor={:08X} preparedKey='{}'",
			outgoingActor ? outgoingActor->GetFormID() : 0u,
			state.oldKey);

		if (!outgoingActor || IsPlayer(outgoingActor)) {
			logger::error("ProteusWrapper: RestoreOutgoingNewCharacterActor rejected invalid/player actor");
			return false;
		}
		if (!state.pending || state.oldKey.empty()) {
			logger::error("ProteusWrapper: RestoreOutgoingNewCharacterActor called without valid pending transaction");
			return false;
		}

		if (!GTS::CharacterProfile::Load(outgoingActor, state.oldKey)) {
			logger::error(
				"ProteusWrapper: failed hydrating New Character outgoing actor {:08X} key='{}'",
				outgoingActor->GetFormID(),
				state.oldKey);
			return false;
		}

		{
			std::scoped_lock lock(StateLock);
			NewCharacter.outgoingActorRestored = true;
		}
		logger::error(
			"ProteusWrapper: NEWCHAR RESTORED outgoing inactive actor {:08X} key='{}'",
			outgoingActor->GetFormID(),
			state.oldKey);
		return true;
	}

	bool FinalizeNewCharacter(RE::Actor* player) {
		logger::error(
			"ProteusWrapper: ENTER FinalizeNewCharacter player={:08X}",
			player ? player->GetFormID() : 0u);

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
				"ProteusWrapper: New Character kept outgoing preset key '{}'; refusing to overwrite its canonical GTS profile",
				newKey);
			return false;
		}

		const bool ok = InitializeFresh(player, newKey);
		if (ok) {
			std::scoped_lock lock(StateLock);
			NewCharacter = {};
			logger::error(
				"ProteusWrapper: NEWCHAR FINISHED outgoing='{}' outgoingActorRestored={} incoming='{}'",
				state.oldKey,
				state.outgoingActorRestored,
				newKey);
		}
		return ok;
	}

	bool BeginSwitch(RE::Actor* player, RE::Actor* outgoingActor, std::string_view outgoingKey) {
		logger::error(
			"ProteusWrapper: ENTER BeginSwitch(legacy) player={:08X} outgoing={:08X} key='{}'",
			player ? player->GetFormID() : 0u,
			outgoingActor ? outgoingActor->GetFormID() : 0u,
			outgoingKey);
		return SaveOutgoing(player, outgoingActor, outgoingKey);
	}

	bool PrepareSwitch(RE::Actor* player, std::string_view outgoingKey) {
		logger::error(
			"ProteusWrapper: ENTER PrepareSwitch player={:08X} key='{}'",
			player ? player->GetFormID() : 0u,
			outgoingKey);

		if (!IsPlayer(player)) {
			logger::error("ProteusWrapper: PrepareSwitch rejected non-player actor");
			return false;
		}

		if (!SaveAndResetPlayer(player, outgoingKey, "PrepareSwitch")) {
			return false;
		}

		{
			std::scoped_lock lock(StateLock);
			Switch.pending = true;
			Switch.outgoingActorRestored = false;
			Switch.outgoingKey = std::string(outgoingKey);
		}

		logger::error("ProteusWrapper: PREPARED outgoing='{}' saved=true reset=true", outgoingKey);
		return true;
	}

	bool RestoreOutgoingSwitchActor(RE::Actor* outgoingActor) {
		SwitchState state;
		{
			std::scoped_lock lock(StateLock);
			state = Switch;
		}

		logger::error(
			"ProteusWrapper: ENTER RestoreOutgoingSwitchActor actor={:08X} preparedKey='{}'",
			outgoingActor ? outgoingActor->GetFormID() : 0u,
			state.outgoingKey);

		if (!outgoingActor || IsPlayer(outgoingActor)) {
			logger::error("ProteusWrapper: RestoreOutgoingSwitchActor rejected invalid/player actor");
			return false;
		}
		if (!state.pending || state.outgoingKey.empty()) {
			logger::error("ProteusWrapper: RestoreOutgoingSwitchActor called without valid pending switch");
			return false;
		}

		if (!GTS::CharacterProfile::Load(outgoingActor, state.outgoingKey)) {
			logger::error(
				"ProteusWrapper: failed hydrating outgoing inactive actor {:08X} key='{}'",
				outgoingActor->GetFormID(),
				state.outgoingKey);
			return false;
		}

		{
			std::scoped_lock lock(StateLock);
			Switch.outgoingActorRestored = true;
		}
		logger::error(
			"ProteusWrapper: RESTORED outgoing inactive actor {:08X} key='{}'",
			outgoingActor->GetFormID(),
			state.outgoingKey);
		return true;
	}

	bool FinishSwitch(RE::Actor* player, std::string_view incomingKey) {
		logger::error(
			"ProteusWrapper: ENTER FinishSwitch player={:08X} key='{}'",
			player ? player->GetFormID() : 0u,
			incomingKey);

		if (!IsPlayer(player)) {
			logger::error("ProteusWrapper: FinishSwitch rejected non-player actor");
			return false;
		}
		if (incomingKey.empty()) {
			logger::error("ProteusWrapper: FinishSwitch received empty incoming preset key");
			return false;
		}

		bool ok = false;
		if (GTS::CharacterProfile::Load(player, incomingKey)) {
			logger::info("ProteusWrapper: loaded incoming switch character key='{}'", incomingKey);
			ok = true;
		} else {
			logger::warn("ProteusWrapper: no canonical profile for incoming key='{}'; initializing clean GTS state", incomingKey);
			ok = InitializeFresh(player, incomingKey);
		}

		if (ok) {
			SwitchState state;
			{
				std::scoped_lock lock(StateLock);
				state = Switch;
				Switch = {};
			}
			logger::error(
				"ProteusWrapper: FINISHED switch outgoing='{}' outgoingActorRestored={} incoming='{}'",
				state.outgoingKey,
				state.outgoingActorRestored,
				incomingKey);
		}
		return ok;
	}

	void HandleMenuOpenClose(const RE::MenuOpenCloseEvent* event) {
		if (!event || event->menuName != RE::RaceSexMenu::MENU_NAME) {
			return;
		}

		std::scoped_lock lock(StateLock);
		if (!NewCharacter.pending) {
			logger::info(
				"ProteusWrapper: RaceMenu {} observed with no pending New Character transaction",
				event->opening ? "OPEN" : "CLOSE");
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
			logger::info("ProteusWrapper: clearing pending New Character transaction outgoing='{}'", NewCharacter.oldKey);
		}
		if (Switch.pending) {
			logger::info("ProteusWrapper: clearing pending Switch transaction outgoing='{}'", Switch.outgoingKey);
		}
		NewCharacter = {};
		Switch = {};
	}
}
