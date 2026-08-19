#pragma once

namespace GTS::ProteusWrapper {

	// New Character: persist the outgoing Player profile under Proteus's explicit
	// preset key and hydrate the newly spawned inactive Proteus actor before
	// Proteus starts resetting Player 0x14. The transaction is only armed after
	// the canonical JSON save succeeds.
	bool BeginNewCharacter(RE::Actor* player, RE::Actor* outgoingActor, std::string_view outgoingKey);

	// Called by the patched Proteus script at its final New Character boundary,
	// after RaceMenu/startup work and immediately before Proteus saves the new
	// character. Requires a matching RaceMenu open+close transaction.
	bool FinalizeNewCharacter(RE::Actor* player);

	// Legacy switch entry retained for older test PEX builds.
	bool BeginSwitch(RE::Actor* player, RE::Actor* outgoingActor, std::string_view outgoingKey);

	// New switch phase 1. Save the live outgoing Player profile, then immediately
	// clear character-owned GTS state from Player 0x14 BEFORE Proteus begins its
	// own character-save/swap workflow. No Proteus actor reference is accepted at
	// this boundary because the inactive slot identity is ambiguous here.
	bool PrepareSwitch(RE::Actor* player, std::string_view outgoingKey);

	// New switch phase 2. Called only after Proteus has spawned/loaded the outgoing
	// character into its inactive actor slot. The canonical key comes from the
	// pending PrepareSwitch transaction, not from Papyrus.
	bool RestoreOutgoingSwitchActor(RE::Actor* outgoingActor);

	// Character switch phase 3: load the incoming profile into Player after Proteus
	// has finished loading that character. Missing JSON initializes a clean profile.
	bool FinishSwitch(RE::Actor* player, std::string_view incomingKey);

	// Existing GTS UI event sink forwards RaceMenu lifecycle events here.
	void HandleMenuOpenClose(const RE::MenuOpenCloseEvent* event);

	// Clear transient transaction state when returning to the main menu or when
	// a flow is abandoned.
	void Reset();

}
