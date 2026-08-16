# GTS-side Proteus character profiles

Work-in-progress design for the compatibility layer.

- Proteus stable actor reference is the character identity; display name is metadata only.
- GTS-owned JSON is authoritative persistent storage.
- The stable Proteus NPC is a live/cache copy, not the database.
- Player form 0x14 is the active working copy.
- Only durable GTS state is transferred. Transient interaction/animation state must not be copied.
- Existing profile data is never overwritten with defaults merely because GTS or a required form is unavailable.
- Writes should be versioned/backup-safe for debugging and recovery.
