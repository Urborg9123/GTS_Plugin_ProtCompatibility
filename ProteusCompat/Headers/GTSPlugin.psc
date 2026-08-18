scriptName GTSPlugin hidden

; Internal methods for papyrus -> dll interop.

; Quest
Function ResetQuestProgression() global native
Float function Quest_GetProgression(int aiStage) global native
Bool function WasDragonEaten() global native

; Legacy Proteus compatibility helpers
Int Function GetTotalKills(Actor akActor) global native
Function SetTotalKills(Actor akActor, Int aiCount) global native

; Legacy native Proteus profile bridge retained for compatibility while the
; lifecycle wrapper is tested.
Bool Function ProteusProfileSave(Actor akPlayer, Actor akProteusActor) global native
Bool Function ProteusProfileLoad(Actor akPlayer, Actor akProteusActor) global native
Function ProteusProfileResetNewCharacter(Actor akPlayer) global native

; Proteus lifecycle wrapper. GTSCharacterProfile JSON is authoritative; the
; inactive Proteus actor is only a runtime cache at character boundaries.
Bool Function ProteusBeginNewCharacter(Actor akPlayer, Actor akOutgoingActor) global native
Bool Function ProteusFinalizeNewCharacter(Actor akPlayer) global native
Bool Function ProteusBeginSwitch(Actor akPlayer, Actor akOutgoingActor) global native
Bool Function ProteusFinishSwitch(Actor akPlayer, Actor akIncomingActor) global native

; Devourment Compatibility
Function CallDevourmentCompatibility(Actor akPred, Actor akPrey, bool Digested) global native

; Force-Start (emphasis on START) size interactions between two actors, further AI actions will rely on your AI settings.
; int Type explanation:
; 0 = Vore
; 1 = Devourment (Only with Devourment)
; 2 = Stomp
; 3 = Kicks
; 4 = Thigh Sandwich
; 5 = Thigh Crush
; 6 = Butt Crush
; 7 = Hugs
; 8 = Grab
Function ForceStartSizeInteraction(Actor Pred, Actor Prey, int Type) global native
