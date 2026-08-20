#pragma once

#include <atomic>

namespace GTS::ProteusSaveMask {
	// While true, Proteus is serializing the outgoing Player character. The
	// ActorValueOwner hook must expose clean base Health/Magicka/Stamina instead
	// of baking Full Assimilation's persisted bonus into Proteus's own stats JSON.
	inline std::atomic_bool Active {false};

	inline void Set(bool value) {
		Active.store(value, std::memory_order_release);
	}

	[[nodiscard]] inline bool IsActive() {
		return Active.load(std::memory_order_acquire);
	}
}
