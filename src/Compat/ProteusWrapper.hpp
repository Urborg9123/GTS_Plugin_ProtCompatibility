#pragma once

namespace GTS::ProteusWrapper {

	// Legacy New Character entry retained for older test PEX builds.
	bool BeginNewCharacter(RE::Actor* player, RE::Actor* outgoingActor, std::string_view outgoingKey);

	// New Character phase 1: save the live outgoing Player profile and immediately
	// reset character-owned GTS state BEFORE Proteus starts its own save/spawn/reset
	// workflow. This is the same ordering already validated for Switch Character.
	bool PrepareNewCharacter(RE::Actor* player, std::string_view outgoingKey);

	// New Character phase 2: after Proteus has spawned the outgoing character,
	// hydrate that explicitly resolved inactive actor from the pending outgoing JSON.
	bool RestoreOutgoingNewCharacterActor(RE::Actor* outgoingActor);

	// Called by the patched Proteus script at its final New Character boundary,
	// after RaceMenu/startup work and immediately before Proteus saves the new
	// character. Requires a matching RaceMenu open+close transaction.
	bool FinalizeNewCharacter(RE::Actor* player);

	// Legacy switch entry retained for older test PEX builds.
	bool BeginSwitch(RE::Actor* player, RE::Actor* outgoingActor, std::string_view outgoingKey);

	// Switch phase 1. Save the live outgoing Player profile, then immediately clear
	// character-owned GTS state from Player 0x14 BEFORE Proteus begins its own swap.
	bool PrepareSwitch(RE::Actor* player, std::string_view outgoingKey);

	// Switch phase 2. Called only after Proteus has spawned/loaded the outgoing
	// character into its inactive actor slot. The canonical key comes from the
	// pending PrepareSwitch transaction, not from Papyrus.
	bool RestoreOutgoingSwitchActor(RE::Actor* outgoingActor);

	// Papyrus bridge keeps a string argument for an easy surgical PEX call. The
	// supplied string is diagnostic only; the pending PrepareSwitch key remains
	// authoritative.
	bool RestoreOutgoingSwitchActor(RE::Actor* outgoingActor, std::string_view diagnosticKey);

	// Switch phase 3: load the incoming profile into Player after Proteus has loaded
	// that character. Missing JSON initializes a clean profile.
	bool FinishSwitch(RE::Actor* player, std::string_view incomingKey);

	// Existing GTS UI event sink forwards RaceMenu lifecycle events here.
	void HandleMenuOpenClose(const RE::MenuOpenCloseEvent* event);

	// Clear transient lifecycle transaction state when returning to the main menu
	// or when a flow is abandoned.
	void Reset();

}
