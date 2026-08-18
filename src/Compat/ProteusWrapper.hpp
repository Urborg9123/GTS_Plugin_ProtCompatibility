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

	// Character switch: save the outgoing Player under Proteus's explicit
	// playerPresetName and refresh the stable inactive actor cache before Proteus
	// overwrites Player 0x14.
	bool BeginSwitch(RE::Actor* player, RE::Actor* outgoingActor, std::string_view outgoingKey);

	// Character switch: load targetPresetName into Player after Proteus has loaded
	// that character. We intentionally do not derive identity from the `target`
	// actor because Proteus repurposes that actor to hold the outgoing character
	// during the swap. Missing JSON initializes a clean profile.
	bool FinishSwitch(RE::Actor* player, std::string_view incomingKey);

	// Existing GTS UI event sink forwards RaceMenu lifecycle events here.
	void HandleMenuOpenClose(const RE::MenuOpenCloseEvent* event);

	// Clear transient transaction state when returning to the main menu or when
	// a flow is abandoned.
	void Reset();

}
