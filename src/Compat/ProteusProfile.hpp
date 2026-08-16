#pragma once

namespace GTS::ProteusProfile {

	bool Save(RE::Actor* player, RE::Actor* proteusActor);
	bool Load(RE::Actor* player, RE::Actor* proteusActor);
	void ResetNewCharacter(RE::Actor* player);

}
