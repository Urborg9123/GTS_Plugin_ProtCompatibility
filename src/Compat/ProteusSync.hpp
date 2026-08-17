#pragma once

namespace GTS::ProteusSync {

	// Marks a Proteus New Character transaction before Proteus starts mutating
	// Player. RaceMenu is only the completion barrier for a transaction that
	// we already initiated; it is never used as a generic operation detector.
	// The transaction is intentionally armed only after the outgoing canonical
	// GTS profile has been saved successfully.
	void BeginNewCharacter(RE::Actor* player);

	// Called from the existing GTS MenuOpenCloseEvent sink. This function
	// ignores every menu event unless a New Character transaction is pending.
	void HandleMenuOpenClose(const RE::MenuOpenCloseEvent* event);

	// Clears transient transaction state when changing saves / starting a new
	// game so a failed or abandoned Proteus flow cannot leak into another game.
	void Reset();

}
