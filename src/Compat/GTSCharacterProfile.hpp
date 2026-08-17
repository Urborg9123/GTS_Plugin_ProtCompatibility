#pragma once

namespace GTS::CharacterProfile {

	// GTS-owned character persistence. The caller supplies only an opaque
	// profile key; no Proteus types or workflow knowledge live here.
	bool Save(RE::Actor* actor, std::string_view profileKey);
	bool Load(RE::Actor* actor, std::string_view profileKey);
	bool Reset(RE::Actor* actor);
	void Dump(RE::Actor* actor, std::string_view label);

}
