#pragma once

namespace GTS::ProteusWrapper {

	// New Character: persist the outgoing Player profile and hydrate the newly
	// spawned inactive Proteus actor before Proteus starts resetting Player 0x14.
	// The transaction is only armed after the canonical JSON save succeeds.
	bool BeginNewCharacter(RE::Actor* player, RE::Actor* outgoingActor);

	// Called by the patched Proteus script at its final New Character boundary,
	// after RaceMenu/startup work and immediately before Proteus saves the new
	// character. Requires a matching RaceMenu open+close transaction.
	bool FinalizeNewCharacter(RE::Actor* player);

	// Character switch: save the outgoing Player profile and refresh the stable
	// inactive Proteus actor cache before Proteus overwrites Player 0x14.
	bool BeginSwitch(RE::Actor* player, RE::Actor* outgoingActor);

	// Character switch: load the selected inactive character's canonical GTS
	// profile into Player after Proteus has loaded that character. Missing JSON
	// initializes a clean profile rather than inheriting outgoing Player state.
	bool FinishSwitch(RE::Actor* player, RE::Actor* incomingActor);

	// Existing GTS UI event sink forwards RaceMenu lifecycle events here.
	void HandleMenuOpenClose(const RE::MenuOpenCloseEvent* event);

	// Clear transient transaction state when returning to the main menu or when
	// a flow is abandoned.
	void Reset();

}
