Scriptname ProteusRecurringQuestScript extends ReferenceAlias

Import ProteusDLLUtils
import CharGen
import PhenderixToolResourceScript
Import JContainers
import PO3_SKSEFunctions
import ConsoleUtil

;Properties
globalvariable property k1 auto
globalvariable property k2 auto
globalvariable property k3 auto
globalvariable property k4 auto
globalvariable property k5 auto
globalvariable property k6 auto
globalvariable property k7 auto ;load appearance preset
globalvariable property k8 auto ;npc spell
globalvariable property k9 auto ;player spell
globalvariable property k10 auto ;load appearance + equipped
globalvariable property k11 auto ;player cheat menu
globalvariable property k12 auto ;wheel spell
globalvariable property k13 auto ;spawner spell
globalvariable property k14 auto ;weather spell
globalvariable property disableHotkeys auto
globalvariable property ZZAlternativeDeathSystem auto
Spell property npcSpell auto
Spell property playerSpell auto
Spell property proteusControlSpell auto
Spell property wheelSpell auto
Spell property spawnerSpell auto
Spell property weatherSpell auto
Spell property flames auto
Spell property healing auto

;-- Properties--------------------------------------
;Faction properties
faction property playerFaction auto
faction property thalmorFaction auto
faction property necromancerFaction auto
faction property forswornFaction auto
faction property werewolfFaction auto
faction property vampireFaction auto
faction property banditFaction auto
faction property imperialLegionFaction auto
faction property stormcloakFaction auto
faction property cultistFaction auto
faction property dremoraFaction auto
faction property falmerFaction auto
faction property hagravenFaction auto
faction property tribalOrcsFaction auto
faction property vigilantOfStendarrFaction auto
faction property skeletonFaction auto

;Message properties
message property ZZPlayerConfirmSwitchLocation auto
message property ZZGameWorldSetMessage auto
message property ZZPlayerConfirmSpawnMessage auto
message property ZZPlayerConfirmResetCharacter auto
message property ZZPlayerSwitchMessage auto
message property ZZPlayerSpawnPerksSpellsMessage auto
message property ZZDeletePresetMenu auto
message property ZZProteusDeathMenu auto

;Keyword properties
Keyword property lightArmorKWD auto
Keyword property heavyArmorKWD auto

;GlobalVariable properties
GlobalVariable property ZZPresetLoadedCounter auto
GlobalVariable property ZZPresetLoadedCounter2 auto
GlobalVariable property ZZLoadPlayerPreset auto
GlobalVariable property ZZNPCAppearanceSaved auto
GlobalVariable property explosionsOn auto
GlobalVariable property ZZHasSavedPlayerCharacter auto
GlobalVariable property ZZBackupCounter auto
GlobalVariable property ZZEnableSpawnSpellLoad auto
GlobalVariable property ZZEnableSpawnPerkLoad auto
GlobalVariable property ZZZSaveGameCounter auto
GlobalVariable property ZZBackupAppearanceSave auto

;Quest properties
Quest property ZZProteusSkyUIMenu auto
Quest property ZZProteusRecurringQuest auto

;Explosion properties
Explosion property greenExplosion auto

;FormList properties
FormList property combatStylesList auto
FormList property teleportLocationsList auto
FormList property startingWeaponsList auto
FormList property ZZSpawnedCharactersList auto
Formlist Property ZZVanillaPerksListVampireWerewolf auto
FormList property ZZSpells auto
FormList property ZZCrimeFactions auto
FormList property ZZOutfits auto

;Race properties
Race property NordRace auto
Race property WoodElfRace auto
Race property DarkElfRace auto
Race property HighElfRace auto
Race property OrcRace auto
Race property BretonRace auto
Race property ImperialRace auto
Race property RedguardRace auto
Race property ArgonianRace auto
Race property KhajiitRace auto

;Actor proprties
Actor property ZZCustomF1 auto
Actor property ZZCustomF2 auto
Actor property ZZCustomF3 auto
Actor property ZZCustomF4 auto
Actor property ZZCustomF5 auto
Actor property ZZCustomF6 auto
Actor property ZZCustomF7 auto
Actor property ZZCustomF8 auto
Actor property ZZCustomF9 auto
Actor property ZZCustomF10 auto
Actor property ZZCustomM1 auto
Actor property ZZCustomM2 auto
Actor property ZZCustomM3 auto
Actor property ZZCustomM4 auto
Actor property ZZCustomM5 auto
Actor property ZZCustomM6 auto
Actor property ZZCustomM7 auto
Actor property ZZCustomM8 auto
Actor property ZZCustomM9 auto
Actor property ZZCustomM10 auto
Actor property hostilePlayerCharacter auto

;Actorbase properties
ActorBase property ZZProteusHorse auto


;LeveledItem Properties
LeveledItem Property ZZProteusOutfitSpawnLI1 Auto
LeveledItem Property ZZProteusOutfitSpawnLI2 Auto
LeveledItem Property ZZProteusOutfitSpawnLI3 Auto
LeveledItem Property ZZProteusOutfitSpawnLI4 Auto
LeveledItem Property ZZProteusOutfitSpawnLI5 Auto
LeveledItem Property ZZProteusOutfitSpawnLI6 Auto
LeveledItem Property ZZProteusOutfitSpawnLI7 Auto
LeveledItem Property ZZProteusOutfitSpawnLI8 Auto
LeveledItem Property ZZProteusOutfitSpawnLI9 Auto
LeveledItem Property ZZProteusOutfitSpawnLI10 Auto
LeveledItem Property ZZProteusOutfitSpawnLI11 Auto
LeveledItem Property ZZProteusOutfitSpawnLI12 Auto
LeveledItem Property ZZProteusOutfitSpawnLI13 Auto
LeveledItem Property ZZProteusOutfitSpawnLI14 Auto
LeveledItem Property ZZProteusOutfitSpawnLI15 Auto
LeveledItem Property ZZProteusOutfitSpawnLI16 Auto
LeveledItem Property ZZProteusOutfitSpawnLI17 Auto
LeveledItem Property ZZProteusOutfitSpawnLI18 Auto
LeveledItem Property ZZProteusOutfitSpawnLI19 Auto
LeveledItem Property ZZProteusOutfitSpawnLI20 Auto
LeveledItem Property ZZProteusOutfitSpawnLIEvil Auto

;Outfit properties
Outfit Property ZZProteusOutfitSpawn1 auto
Outfit Property ZZProteusOutfitSpawn2 auto
Outfit Property ZZProteusOutfitSpawn3 auto
Outfit Property ZZProteusOutfitSpawn4 auto
Outfit Property ZZProteusOutfitSpawn5 auto
Outfit Property ZZProteusOutfitSpawn6 auto
Outfit Property ZZProteusOutfitSpawn7 auto
Outfit Property ZZProteusOutfitSpawn8 auto
Outfit Property ZZProteusOutfitSpawn9 auto
Outfit Property ZZProteusOutfitSpawn10 auto
Outfit Property ZZProteusOutfitSpawn11 auto
Outfit Property ZZProteusOutfitSpawn12 auto
Outfit Property ZZProteusOutfitSpawn13 auto
Outfit Property ZZProteusOutfitSpawn14 auto
Outfit Property ZZProteusOutfitSpawn15 auto
Outfit Property ZZProteusOutfitSpawn16 auto
Outfit Property ZZProteusOutfitSpawn17 auto
Outfit Property ZZProteusOutfitSpawn18 auto
Outfit Property ZZProteusOutfitSpawn19 auto
Outfit Property ZZProteusOutfitSpawn20 auto
Outfit Property ZZProteusOutfitSpawnEvil auto
Outfit Property ZZProteusOutfitNone auto


Quest Property ZZProteusQuestSpawn1 auto
Quest Property ZZProteusQuestSpawn2 auto
Quest Property ZZProteusQuestSpawn3 auto
Quest Property ZZProteusQuestSpawn4 auto
Quest Property ZZProteusQuestSpawn5 auto
Quest Property ZZProteusQuestSpawn6 auto
Quest Property ZZProteusQuestSpawn7 auto
Quest Property ZZProteusQuestSpawn8 auto
Quest Property ZZProteusQuestSpawn9 auto
Quest Property ZZProteusQuestSpawn10 auto
Quest Property ZZProteusQuestSpawn11 auto
Quest Property ZZProteusQuestSpawn12 auto
Quest Property ZZProteusQuestSpawn13 auto
Quest Property ZZProteusQuestSpawn14 auto
Quest Property ZZProteusQuestSpawn15 auto
Quest Property ZZProteusQuestSpawn16 auto
Quest Property ZZProteusQuestSpawn17 auto
Quest Property ZZProteusQuestSpawn18 auto
Quest Property ZZProteusQuestSpawn19 auto
Quest Property ZZProteusQuestSpawn20 auto


;ObjectReference properties
ObjectReference property ProteusMarker auto
ObjectReference property playerMarker auto
ObjectReference property UnequippedContainer1 auto
ObjectReference property UnequippedContainer2 auto
ObjectReference property UnequippedContainer3 auto
ObjectReference property UnequippedContainer4 auto
ObjectReference property UnequippedContainer5 auto
ObjectReference property UnequippedContainer6 auto
ObjectReference property UnequippedContainer7 auto
ObjectReference property UnequippedContainer8 auto
ObjectReference property UnequippedContainer9 auto
ObjectReference property UnequippedContainer10 auto
ObjectReference property UnequippedContainer11 auto
ObjectReference property UnequippedContainer12 auto
ObjectReference property UnequippedContainer13 auto
ObjectReference property UnequippedContainer14 auto
ObjectReference property UnequippedContainer15 auto
ObjectReference property UnequippedContainer16 auto
ObjectReference property UnequippedContainer17 auto
ObjectReference property UnequippedContainer18 auto
ObjectReference property UnequippedContainer19 auto
ObjectReference property UnequippedContainer20 auto
ObjectReference property UnequippedContainer21 auto
ObjectReference property UnequippedContainer22 auto
ObjectReference property UnequippedContainer23 auto
ObjectReference property UnequippedContainer24 auto
ObjectReference property UnequippedContainer25 auto
ObjectReference property UnequippedContainer26 auto
ObjectReference property UnequippedContainer27 auto
ObjectReference property UnequippedContainer28 auto
ObjectReference property UnequippedContainer29 auto
ObjectReference property UnequippedContainer30 auto
ObjectReference property UnequippedContainer31 auto
ObjectReference property UnequippedContainer32 auto
ObjectReference property UnequippedContainer33 auto
ObjectReference property UnequippedContainer34 auto
ObjectReference property UnequippedContainer35 auto
ObjectReference property UnequippedContainer36 auto
ObjectReference property UnequippedContainer37 auto
ObjectReference property UnequippedContainer38 auto
ObjectReference property UnequippedContainer39 auto
ObjectReference property UnequippedContainer40 auto
ObjectReference property UnequippedContainer41 auto
ObjectReference property UnequippedContainer42 auto
ObjectReference property UnequippedContainer43 auto
ObjectReference property UnequippedContainer44 auto
ObjectReference property UnequippedContainer45 auto
ObjectReference property UnequippedContainer46 auto
ObjectReference property UnequippedContainer47 auto
ObjectReference property UnequippedContainer48 auto
ObjectReference property UnequippedContainer49 auto
ObjectReference property UnequippedContainer50 auto
ReferenceAlias property sharedContainer auto
ReferenceAlias property ZZTempAlias auto
ObjectReference property voidMarker auto
ObjectReference property voidMarker2 auto

;Container properties
Container property ZZProteusCharacterDeathContainer auto

;Sound descriptor
Sound property ZZProteusCompleteSound auto

;VoiceType properties
VoiceType property ZZMaleArgonian auto
VoiceType property ZZMaleDarkElf auto
VoiceType property ZZMaleEvenToned auto 
VoiceType property ZZMaleKhajiit auto 
VoiceType property ZZMaleOrc auto
VoiceType property ZZFemaleDarkElf auto 
VoiceType property ZZFemaleEvenToned auto 
VoiceType property ZZFemaleOrc auto 
VoiceType property ZZFemaleKhajiit auto
VoiceType property ZZFemaleArgonian auto

;Ammo properties
Ammo property crossBowAmmo auto
Ammo property bowAmmo auto

;MiscObject properties
MiscObject Property Gold001 Auto

;Spell properties
Spell property slowTimeSpell auto
Spell property ZZProteusCureDisease auto

;-- Variables ---------------------------------------
Actor player
Actor switchActor
Int wopCountTracker	
Int totalPerkPointsAvailable
Int  tyleNum
Int combatStyleNum
String spawnedCharacterGender
String characterSavingName
String[] presetsLoaded
Bool firstTimeSpawn
Bool playerPresetFirstLoad
ObjectReference tempMarker
String JContGlobalPath
Float targetCW
ColorForm playerHairColor
Bool running
int runDeath

;cheat menu / explorer variables
String[] modNames
String[] matchingModNames
String[] menuNames
Form[] foundForms
Form[] allGameItems
Int totalMods
Int matchingMods
Int offset
Int quitOption
Int searchOption
Int addAllOption
Int exploreOption
Int backToModListOption
Int viewInventoryScreenOption
Int numPages
Int startingPointInitial
Int startingPointForward
ObjectReference ZZCheatTempContainer
String typeString
Bool showViewInventoryOption
UIListMenu listMenuBase

;Variables (tracking active mods)
Bool obisActive ;OBIS Bandits
Bool lotdActive ;Legacy of the Dragonborn
Bool haemophiliaActive ;Haemophilia Perks
Bool unarmouredDefenseActive ;Unarmoured Defense Perks
Bool dragonbornCustomPerkActive ;Dragonborn Shout Perks
Bool vigilantPerksActive ;Vigilant Perks
Bool glenmorilPerksActive ;Glenmoril Perks
Bool handtohandActive ;Hand to Hands Perks
Bool gtsActive ;Giantess Mod - Size Matters NG
String gtsPatchName = ""
Bool pmwActive ;Phenderix Magic World
Bool apocalypseActive ;Apocalypse - Magic of Skyrim
Bool pmeActive ;Phenderix Magic Evolved
Bool odinActive ;Odin Odin - Skyrim Magic Overhaul
Bool triumActive ;Triumvirate - Mage Archetypes
Bool imperiousActive ;Imperious - Races of Skyrim
Bool aethActive ;Aetherius - A Race Overhaul
bool morningstarActive ;Morningstar - Minimalistic Races of Skyrim
Bool betterVampiresActive ;Better Vampires
Bool bloodlinesActive ;Bloodlines of Tamriel - A Vampire Overhaul
Bool bloodmoonRisingActive ;Bloodmoon Rising SSE Edition Werewolf Overhaul
Bool curseVampireActive ;Curse of the Vampire
bool manbeastActive ;Manbeast - A Werewolf Overhaul
Bool lupineActive ;Lupine - Werewolf Perk Expansion
Bool moonlightTalesActive ;Moonlight Tales Special Edition - Werewolf and Werebear Overhaul
Bool growlActive ;Growl - Werebeasts of Skyrim
Bool sacrilegeActive ;Sacrilege - Minimalistic Vampires of Skyrim
Bool sacrosanctActive ;Sacrosanct - Vampires of Skyrim
Bool sanguinaireActive ;Sanguinaire (Revised Edition)
Bool truaActive ;Trua - Minimalistic Faiths of Skyrim
Bool wintersunActive ;Wintersun - Faiths of Skyrim
Bool pilgrimActive ;Pilgrim - A Religion Overhaul
Bool scionActive ;Scion - A Vampire Overhaul
Bool vampyriumActive ;Vampyrium-Resurrected (Vampire Overhaul)
Bool werewolfPerksExpandedActive ;Werewolf Perks Expanded
Bool arcanumActive ;Arcanum - A New Age of Magic
Bool shadowspellsActive ;Shadow Spell Package
Bool acebloodActive ;Ace Blood Magic
Bool mysticiscmActive ;Mysticism - A Magic Overhaul
Bool edmActive ;Elemental Destruction Magic
Bool edmrActive ;Elemental Destruction Magic Redux
Bool addItemsActive ;AddItemMenu - Ultimate Mod Explorer
Bool colorfulMagicActive ;Colorful Magic by 184Gesu SE
Bool vokriinatorActive ;Vokriinator Black
Bool cgoActive ;Combat gameplay overhaul
bool effActive ;Extensible follower framework
bool nffActive ;Nether's follower framework
bool elementsActive ;Phenderix Elements


function OnInit()
	player = Game.GetPlayer()
	JContGlobalPath = jcontainers.userdirectory()

	if(ZZNPCAppearanceSaved.GetValue() == 0)
		WorldIdentityFunction()
	endIf

	RegisterForSingleUpdate(0.25)
endFunction

function OnUpdate()
	RegisterForSingleUpdate(0.2)
	if input.GetNumKeysPressed() > 0 
		keyMapCasting()
	endIf
endFunction

Event OnEnterBleedout() 

	if ZZAlternativeDeathSystem.GetValue() == 1
		Int ibutton= ZZProteusDeathMenu.show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		if(ibutton == 0)
			Proteus_LockEnable()
			player.RestoreActorValue("health", 10000)
			player.GetActorBase().SetInvulnerable(True)
			player.ResetHealthAndLimbs()
			player.DispelAllSpells() ;remove active magic effects
			ZZProteusCureDisease.Cast(player)
			player.StopCombat()
			player.StopCombatAlarm()

			;save items and drop satchel where player died
			Proteus_SaveAllItems(player.GetActorBase().GetName(), player, true)
			int targetModIndex = Game.GetModByName("Shadow of Skyrim.esp")
			if TargetModIndex == 255
				ObjectReference deathContainer = Game.GetPlayer().PlaceAtMe(ZZProteusCharacterDeathContainer, 1)
				;Debug.MessageBox(deathContainer.GetDisplayName() + " " + deathContainer.GetNumItems())
				deathContainer.SetName(player.GetActorBase().GetName() + " Items")
				deathContainer.SetDisplayName(player.GetActorBase().GetName() + " Items")
				Proteus_RemoveAllItems(player, deathContainer)
			endIf

			;dismiss all followers
			Actor[] playerFollowers = GetPlayerFollowers()
			if nffActive == true
				ProteusNethersScript.Proteus_NetherClearFollowers(playerFollowers, Game.GetPlayer().GetActorBase().GetName())
			elseif effActive == true
				ProteusEFFScript.Proteus_EFFClearFollowers(playerFollowers, Game.GetPlayer().GetActorBase().GetName())
			endIf

			
			;Debug.MessageBox("CLEARED FOLLOWERS")
			player.GetActorBase().SetEssential(false)
			Utility.Wait(4)
			player.MoveTo(voidMarker2)
			player.GetActorBase().SetEssential(true)

			Utility.Wait(1.0)
			;Debug.MessageBox("BEFORE START NEW CHAR")

			Proteus_NewCharacter(1)
		
			Proteus_LockDisable()
			player.GetActorBase().SetInvulnerable(false)
		elseif(ibutton == 1)
			(ZZProteusRecurringQuest.GetNthAlias(0) as ReferenceAlias).Clear()
			player.GetActorBase().SetEssential(false)
			player.Kill()
		EndIf
	else
		(ZZProteusRecurringQuest.GetNthAlias(0) as ReferenceAlias).Clear()
	endif
endEvent


Function Proteus_NewCharacter(int option) ;0 = regular new character process that makes a spawn, 1 = death of previous character
	player.GetActorBase().SetInvulnerable(True)
	Debug.Notification("New character function started.")
	if option == 0
		;First save current character into Proteus system
		Debug.Notification("Before creating new character, saving current character.")
		characterSavingName = player.GetActorBase().GetName()
		Proteus_CharacterSave(player, characterSavingName)
		playerMarker.MoveTo(player)
		Proteus_RemoveFavorites(player)
		;spawn a copy of the just saved character
		Utility.Wait(0.1)
		Proteus_LoadCharacterSpawn(player, characterSavingName)
		Utility.Wait(0.1)
	elseif option == 1
		String presetName = player.GetActorBase().GetName()
		Proteus_SaveTargetStrings(player, presetName)
		Proteus_SaveSkillsAttributes(presetName, player)
		Proteus_SavePerks(presetName)
		Proteus_SaveSpells(presetName, player) ;save formIDs of spells in json file
		;save appearance of target's character (including race) and make system register preset
		Proteus_SaveCharacterAppearance(presetName, player) 
		String processedPLAYERPRESETName = processName(presetName)
		Proteus_RegisterLoadedPresetOption(player, processedPLAYERPRESETName, presetName, false)
		SaveAppearancePresetJSON(processedPLAYERPRESETName, presetName)
		Proteus_SaveGlobalVariables(presetName)
		Proteus_ResetSpawn(presetName, 0)
	endIf

	;reset skills, attributes, experience, perk points available
	player.SetActorValue("Alchemy", 20) 
	player.SetActorValue("Alteration", 20) 
	player.SetActorValue("Marksman", 20) 
	player.SetActorValue("Block", 20) 
	player.SetActorValue("Conjuration", 20) 
	player.SetActorValue("Destruction", 20) 
	player.SetActorValue("Enchanting", 20) 
	player.SetActorValue("HeavyArmor", 20) 
	player.SetActorValue("Illusion", 20) 
	player.SetActorValue("LightArmor", 20) 
	player.SetActorValue("Lockpicking", 20) 
	player.SetActorValue("OneHanded", 20) 
	player.SetActorValue("Pickpocket", 20) 
	player.SetActorValue("Restoration", 20) 
	player.SetActorValue("Smithing", 20) 
	player.SetActorValue("Sneak", 20) 
	player.SetActorValue("Speechcraft", 20) 
	player.SetActorValue("TwoHanded", 20) 
	player.SetActorValue("Health", 100) 
	player.SetActorValue("Magicka", 100) 
	player.SetActorValue("Stamina", 100) 
	player.SetActorValue("CarryWeight", 300)
	;ProteusDLLUtils.SetLevel(player, 1)
	ExecuteCommand("player.setlevel " + 1 as Int)
	Game.SetPlayerExperience(0)
	ActorValueInfo.GetActorValueInfoByName("Alchemy").SetSkillExperience(0)
	ActorValueInfo.GetActorValueInfoByName("Alteration").SetSkillExperience(0)
	ActorValueInfo.GetActorValueInfoByName("Marksman").SetSkillExperience(0)
	ActorValueInfo.GetActorValueInfoByName("Block").SetSkillExperience(0)
	ActorValueInfo.GetActorValueInfoByName("Conjuration").SetSkillExperience(0)
	ActorValueInfo.GetActorValueInfoByName("Destruction").SetSkillExperience(0)
	ActorValueInfo.GetActorValueInfoByName("Enchanting").SetSkillExperience(0)
	ActorValueInfo.GetActorValueInfoByName("HeavyArmor").SetSkillExperience(0)
	ActorValueInfo.GetActorValueInfoByName("Illusion").SetSkillExperience(0)     
	ActorValueInfo.GetActorValueInfoByName("LightArmor").SetSkillExperience(0)
	ActorValueInfo.GetActorValueInfoByName("Lockpicking").SetSkillExperience(0)
	ActorValueInfo.GetActorValueInfoByName("oneHanded").SetSkillExperience(0)
	ActorValueInfo.GetActorValueInfoByName("Pickpocket").SetSkillExperience(0)
	ActorValueInfo.GetActorValueInfoByName("Restoration").SetSkillExperience(0)
	ActorValueInfo.GetActorValueInfoByName("Smithing").SetSkillExperience(0)
	ActorValueInfo.GetActorValueInfoByName("Sneak").SetSkillExperience(0)
 	ActorValueInfo.GetActorValueInfoByName("Speechcraft").SetSkillExperience(0)
	ActorValueInfo.GetActorValueInfoByName("twoHanded").SetSkillExperience(0)
	Game.SetPerkPoints(0)

	;GTS compatibility: a Proteus "New Character" must start with fresh GTS progression.
	;The previous character has already been saved above, so it is now safe to clear
	;the shared player globals / native kill counter before Proteus removes perks/spells.
	if(gtsActive == TRUE)
		GlobalVariable GTSSkillLevelReset = Game.GetFormFromFile(0x142200, "GTS.esp") as GlobalVariable
		GlobalVariable GTSSkillProgressReset = Game.GetFormFromFile(0x142201, "GTS.esp") as GlobalVariable
		GlobalVariable GTSSkillRatioReset = Game.GetFormFromFile(0x142202, "GTS.esp") as GlobalVariable
		GlobalVariable GTSSkillLegendaryReset = Game.GetFormFromFile(0x142203, "GTS.esp") as GlobalVariable
		GlobalVariable GTSSkillPerkPointsReset = Game.GetFormFromFile(0x2352E1, "GTS.esp") as GlobalVariable

		if GTSSkillLevelReset != NONE
			GTSSkillLevelReset.SetValue(0.0)
		endIf
		if GTSSkillProgressReset != NONE
			GTSSkillProgressReset.SetValue(0.0)
		endIf
		if GTSSkillRatioReset != NONE
			GTSSkillRatioReset.SetValue(0.0)
		endIf
		if GTSSkillLegendaryReset != NONE
			GTSSkillLegendaryReset.SetValue(0.0)
		endIf
		if GTSSkillPerkPointsReset != NONE
			GTSSkillPerkPointsReset.SetValue(0.0)
		endIf

		GTSPlugin.SetTotalKills(player, 0)
	endIf

	;reset vampirism status
	Proteus_Vampirism(3)

	;reset elements status
	if elementsActive == true
		Proteus_ClearElementsVariables()
	endIf

	;clear followers
	Proteus_ClearFollowers(player.GetActorBase().GetName())

	;reset bounties
	;ResetCrimeFactions()

	;remove all perks, vanilla spells and spells added by mods with Proteus patches, and items
	Debug.Notification("Removing perks. This process may take a while.")
	Proteus_RemovePerks_SlowCheckingProcess(player, 1)
	Debug.Notification("Removing spells. This process may take a while.")
	Proteus_RemoveSpells(player, 1)
	Proteus_RemoveAllItemsToContainer(player)

	;select starting outfit, weapons, and spells
	ZZCheatTempContainer = ZZTempAlias.GetReference()
	Debug.MessageBox("You will now select/edit: \nStarting Armor\nStarting Weapon\nAppearance\nStarting Location")
	Utility.Wait(0.1)
	Form[] tempArray = NONE
	Proteus_CheatBaseMenu(player, 0, 1, 26, false, false) ;armor search	
	Utility.Wait(0.1)
	Proteus_CheatBaseMenu(player, 0, 1, 41, false, false) ;weapon search
	Utility.Wait(0.1)
	Proteus_CheatBaseMenu(player, 0, 1, 22, false, false) ;spell search
	Utility.Wait(0.1)

	;dispel spells, add back important mod items, and edit appearance
	player.DispelAllSpells()
	ZZProteusCureDisease.Cast(player)
	;ShowRaceMenu()
	ExecuteCommand("showracemenu")

	Utility.Wait(0.1)
	Proteus_AddBackModItems()
	Utility.Wait(0.1)

	;pick starting location
	Debug.MessageBox("Pick your starting location.")
	Utility.Wait(0.1)
	Teleporter(option)
	Utility.Wait(0.1)

	;save new character into the Proteus system
	String playerName = player.GetActorBase().GetName()
	Proteus_CharacterSave(player, playerName)
	Debug.MessageBox("New player character successfully created and saved into the Proteus system.")
	player.GetActorBase().SetInvulnerable(False)
endFunction

bool Function Proteus_CheckModRequirements()
	bool runPlayerModule = true
	if jcontainers.APIVersion() >= 4
	elseif jcontainers.APIVersion() > 0 && jcontainers.APIVersion() < 4
		Debug.MessageBox("Old version of JContainers installed!\nInstall the latest version for Proteus to work! (v4 or higher required)")
		runPlayerModule = false
	elseif jcontainers.APIVersion() <= 0
		Debug.MessageBox("JContainers not installed!\nInstall it for Proteus to work!")
		runPlayerModule = false
	endIf

	int[] papyrusVersion = GetPapyrusExtenderVersion()
	if papyrusVersion[0] >= 5
	elseif papyrusVersion[0] > 0 && papyrusVersion[0] < 5
		Debug.MessageBox("Old version of Papyrus Extender installed!\nInstall the latest version for Proteus to work! (v5 or higher required)")
		runPlayerModule = false
	elseif papyrusVersion[0] <= 0
		Debug.MessageBox("Papyrus Extender not installed!\nInstall it for Proteus to work!")
		runPlayerModule = false
	endIf

	return runPlayerModule
endFunction

function keyMapCasting()
	Actor playerRef = Game.getPlayer()
	if disableHotkeys.GetValue() as Int == 1
	else
		;save character
		if input.IsKeyPressed(k1.getValue() as Int) && running == false
			if Proteus_CheckModRequirements() == true
				running = true
				Proteus_CheckActiveMods()
				Proteus_LockEnable()
				String playerName = player.GetActorBase().GetName()
				Proteus_CharacterSave(player, playerName) ;save skills, perks, inventory, attributes, level, spells, appearance
				ZZProteusCompleteSound.play(playerMarker)
				Proteus_LockDisable()
				running = false
				Proteus_SaveGame()
			endIf
		;switch characters
		elseif input.IsKeyPressed(k3.getValue() as Int) && running == false
			if Proteus_CheckModRequirements() == true
				running = true
				Proteus_CheckActiveMods()
				Proteus_LockEnable()
				Proteus_SwitchCharacter()
				Proteus_LockDisable()
				ZZProteusCompleteSound.play(playerMarker)
				player.DispelAllSpells() ;remove active magic effects
				running = false
				Proteus_SaveGame()
			endIf
		;take control of NPC
		elseif input.IsKeyPressed(k5.getValue() as Int) && running == false
			running = true
			proteusControlSpell.Cast(playerRef)
			Utility.Wait(2)
			running = false
		;summon existing character
		elseif input.IsKeyPressed(k6.getValue() as Int) && running == false
			if Proteus_CheckModRequirements() == true
				running = true
				Proteus_CheckActiveMods()
				Proteus_TeleportExistingSummonToPlayer("")
				running = false
				player.DispelAllSpells() ;remove active magic effects
			endIf
		;load appearance
		elseif input.IsKeyPressed(k7.getValue() as Int) && running == false
			if Proteus_CheckModRequirements() == true
				running = true
				Proteus_CheckActiveMods()
				String presetName = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Load which player character appearance preset?", "")
				Int lengthPresetName = StringUtil.GetLength(presetName as String)
				String playerName = player.GetActorBase().GetName()
				if (lengthPresetName > 0)
					Race currentRace = player.GetRace()	
					Race presetRace = player.GetRace()
					Proteus_LoadTargetStrings(presetName, player, 1) ;change gender if needed
					if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_Race_" + presetName + ".json"))
						presetRace = Proteus_LoadCharacterRace(presetName)
					endIf
					if(explosionsOn.GetValue() == 1)
						player.PlaceAtMe(greenExplosion, 1)
					endIf
					Proteus_LoadCharacterAppearance(presetName, player, currentRace, presetRace, 0)
					Int jPresetList
					Int jPresetMap = jmap.object()
					String presetKey = jmap.nextKey(jPresetList, "", "")
					jmap.SetStr(jPresetMap, "PresetName", presetName)
					presetKey = jmap.nextKey(jPresetList, presetKey, "")
					jmap.SetStr(jPresetMap, "CarryWeight", player.GetBaseAV("CarryWeight"))
					jvalue.writeToFile(jPresetMap, JContGlobalPath + "/Proteus/Proteus_Character_PresetLoaded_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json")
					;make system recognize this preset has been loaded
					String processedPLAYERPRESETName = processName(presetName)
					ZZHasSavedPlayerCharacter.SetValue(ZZHasSavedPlayerCharacter.GetValue() + 1)
					SaveAppearancePresetJSON(playerName, processedPLAYERPRESETName)
					Proteus_SaveGlobalVariables(playerName)
					Debug.Notification(presetName + " appearance loaded successfully.")
				endIf
				Utility.Wait(0.1)
				running = false
				Proteus_SaveGame()
			endIf
		;NPC Module spell
		elseif input.IsKeyPressed(k8.getValue() as Int) && running == false
			running = true
			npcSpell.Cast(player)
			Utility.Wait(0.1)
			running = false
		;Player Module spell
		elseif input.IsKeyPressed(k9.getValue() as Int) && running == false
			if Proteus_CheckModRequirements() == true
				running = true
				playerSpell.Cast(player)
				Utility.Wait(0.1)
				running = false
			endIf
		;cheatm menu
		elseif input.IsKeyPressed(k11.getValue() as Int) && running == false
			running = true
			Proteus_PlayerCheats()
			Utility.Wait(0.1)
			running = false
		;weather spell
		;wheel spell
		elseif input.IsKeyPressed(k12.getValue() as Int) && running == false
			running = true
			wheelSpell.Cast(player)
			Utility.Wait(0.1)
			running = false
		;spawner spell
		elseif input.IsKeyPressed(k13.getValue() as Int) && running == false
			running = true
			spawnerSpell.Cast(player)
			Utility.Wait(0.1)
			running = false
		;weather spell
		elseif input.IsKeyPressed(k14.getValue() as Int) && running == false
			running = true
			weatherSpell.Cast(player)
			Utility.Wait(0.1)
			running = false
		elseif input.IsKeyPressed(k10.getValue() as Int) && running == false
			if Proteus_CheckModRequirements() == true
				running = true
				String presetName = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Load which player character appearance preset?", "")
				Int lengthPresetName = StringUtil.GetLength(presetName as String)
				String playerName = player.GetActorBase().GetName()
				if (lengthPresetName > 0)
					Race currentRace = player.GetRace()	
					Race presetRace = player.GetRace()
					Proteus_LoadTargetStrings(presetName, player, 1) ;change gender if needed
					if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_Race_" + presetName + ".json"))
						presetRace = Proteus_LoadCharacterRace(presetName)
					endIf
					if(explosionsOn.GetValue() == 1)
						player.PlaceAtMe(greenExplosion, 1)
					endIf
					Proteus_LoadCharacterAppearance(presetName, player, currentRace, presetRace, 0)
					Int jPresetList
					Int jPresetMap = jmap.object()
					String presetKey = jmap.nextKey(jPresetList, "", "")
					jmap.SetStr(jPresetMap, "PresetName", presetName)
					presetKey = jmap.nextKey(jPresetList, presetKey, "")
					jmap.SetStr(jPresetMap, "CarryWeight", player.GetBaseAV("CarryWeight"))
					jvalue.writeToFile(jPresetMap, JContGlobalPath + "/Proteus/Proteus_Character_PresetLoaded_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json")
					;make system recognize this preset has been loaded
					String processedPLAYERPRESETName = processName(presetName)
					ZZHasSavedPlayerCharacter.SetValue(ZZHasSavedPlayerCharacter.GetValue() + 1)
					SaveAppearancePresetJSON(playerName, processedPLAYERPRESETName)
					Proteus_SaveGlobalVariables(playerName)
					Proteus_EquipItems(presetName, player)
					Debug.Notification(presetName + " appearance & equipped items loaded successfully.")
				endIf
				Utility.Wait(0.1)
				running = false
				Proteus_SaveGame()
			endIf
		endIf
	endIf
endFunction



Function Proteus_SaveGame()
	Utility.Wait(0.1)
	Game.RequestSave()
endFunction

function Proteus_PlayerMainMenu()

	String[] stringArray = new String[16]
	stringArray[0] = " Save Character"
	stringArray[1] = " Switch Character"
	stringArray[2] = " Import Character"
	stringArray[3] = " Spawn Hostile Character"
	stringArray[4] = " Summon Existing Character"
	stringArray[5] = " Start New Character"
	stringArray[6] = " Piecemeal Save Character"
	stringArray[7] = " Piecemeal Load Character"
	stringArray[8] = " Character Level Scaler"
	stringArray[9] = " Open Shared Stash"
	stringArray[10] = " Reset / Delete Character"
	stringArray[11] = " Show Race Menu (Enhanced)"
	stringArray[12] = " Edit Attributes & Skills"
	stringArray[13] = " Edit Factions"
	stringArray[14] = " Idle Animations"
	stringArray[15] = " Cheats"

	UIListMenu listMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
	if listMenu
		int n = 16
		int i = 0
		while i < n
			listMenu.AddEntryItem(stringArray[i])
			i += 1
		endwhile
	EndIf
		
	listMenu.OpenMenu()
	int result = listMenu.GetResultInt()
	
	if result == 0 ;save character
		Proteus_LockEnable()
		String playerName = player.GetActorBase().GetName()
		Proteus_CharacterSave(player, playerName) ;save skills, perks, inventory, attributes, level, spells, appearance
		ZZProteusCompleteSound.play(playerMarker)
		Proteus_LockDisable()
		Proteus_SaveGame()
	elseIf result == 1 ;switch character
		Proteus_LockEnable()
		Proteus_SwitchCharacter()
		Proteus_LockDisable()
		ZZProteusCompleteSound.play(playerMarker)
		player.DispelAllSpells() ;remove active magic effects
		ZZProteusCureDisease.Cast(player)
		Proteus_SaveGame()
	elseIf result == 2 ;import character
		Proteus_LockEnable()
		playerMarker.MoveTo(player)
		Proteus_LoadCharacterSpawn(player, "")
		ZZProteusCompleteSound.play(playerMarker)
		Debug.Notification("Import process completed.")
		Proteus_LockDisable()
		Proteus_SaveGame()
	elseif result == 3 ;spawn hostile
		Proteus_LockEnable()
		Proteus_LoadCharacterSpawn(player, "evilproteusspawn")
		ZZProteusCompleteSound.play(playerMarker)
		Proteus_LockDisable()
	elseIf result == 4 ;summon existing spawn
		Proteus_TeleportExistingSummonToPlayer("")
	elseIf result == 5 ;new character / reset
		Proteus_LockEnable()
		Int ibutton= ZZPlayerConfirmResetCharacter.show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		if(ibutton == 0)
			Proteus_NewCharacter(0)
		Else
			Proteus_PlayerMainMenu()
		EndIf
		Proteus_LockDisable()
		player.DispelAllSpells()
		Proteus_SaveGame()
	elseIf result == 6 ;piecemeal save
		Proteus_PlayerPiecemealSaveFunction(player)
	elseIf result == 7 ;piecemeal load
		Proteus_PlayerPiecemealLoadFunction(player)
	elseif result == 8
		LevelScaler(player)
	elseif result == 9 ;shared stash
		Proteus_OpenSharedStash()
	elseIf result == 10 ;permanently delete character
		Proteus_LockEnable()
		String presetDelete = Proteus_SelectPresetSwitch(true)
		if(presetDelete == "")
			Proteus_PlayerMainMenu()
		else
			Int ibutton= ZZDeletePresetMenu.show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)		
			if ibutton == 0
				Proteus_ResetSpawn(presetDelete, 0)
			elseif ibutton == 1
				Proteus_DeletePlayerCharacter(presetDelete)
			endIf
		endIf
		Proteus_LockDisable()
	elseIf result == 11 ;racemenu enhanced
		;ShowRaceMenu()
		ExecuteCommand("showracemenu")
		Utility.Wait(0.5)
		String presetName = player.GetActorBase().GetName()
		Int lengthPresetName = StringUtil.GetLength(presetName as String)
		if lengthPresetName > 0
			Proteus_SaveTargetStrings(player, presetName)
			Proteus_SaveCharacterAppearance(presetName, player) ;save appearance of target's character (including race)
			SaveAppearancePresetJSON(player.GetActorBase().GetName(), presetName)
			Proteus_SaveGlobalVariables(presetName)
		else
			Debug.Notification("Invalid preset name entered.")
		endIf
		Proteus_SaveGame()
	elseif result == 12 ;submenu
		ProteusPlayerMainMenu2()
	elseIf result == 13
		Proteus_PlayerFactionsFunction()
	elseIf result == 14
		Proteus_PlayerIdleAnimationFunction(player) ;located in PhenderixToolEditNPCScript
	elseif result == 15 ;cheats
		Proteus_PlayerCheats()
	endIf
endFunction

function Proteus_PlayerCheats()
	String[] stringArray = new String[5]
	stringArray[0] = " Add Perk Point"
	stringArray[1] = " Add Dragon Soul"
	stringArray[2] = " Dispel Active Effects & Diseases"
	stringArray[3] = " Spawn Horse"
	stringArray[4] = " [Back]"
	UIListMenu listMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
	if listMenu
		int n = 5
		int i = 0
		while i < n
			listMenu.AddEntryItem(stringArray[i])
			i += 1
		endwhile
	EndIf
		
	listMenu.OpenMenu()
	int result = listMenu.GetResultInt()
	if result == 0
		String amount = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Add how many perk points?", "1")
		if(amount as Int > 0)
			Game.AddPerkPoints(amount as Int)
			Debug.Notification("Player gained " + Proteus_Round(amount as Int, 0) + " perk point(s).")
		endIf
		Proteus_PlayerCheats()
	elseif result == 1
		String amount = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Add how many dragon souls?", "1")
		if(amount as Int > 0)
			Game.GetPlayer().modav("dragonsouls", amount as Int)
			Debug.Notification("Player gained " + Proteus_Round(amount as Int, 0) + " dragon soul(s).")
		endIf
		Proteus_PlayerCheats()
	elseif result == 2
		Game.GetPlayer().DispelAllSpells()
		ZZProteusCureDisease.Cast(player)
	elseif result == 3
		Game.GetPlayer().PlaceAtMe(ZZProteusHorse, 1)
	elseif result == 4
		Proteus_PlayerMainMenu()
	endIf
endFunction

function ProteusPlayerMainMenu2()
	String[] stringArray = new String[6]
	stringArray[0] = " Attributes"
	stringArray[1] = " Skills"
	stringArray[2] = " Resistances"
	stringArray[3] = " Scale/Size"
	stringArray[4] = " [Back]"
	stringArray[5] = " [Exit Menu]"
	UIListMenu listMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
	if listMenu
		int n = 6
		int i = 0
		while i < n
			listMenu.AddEntryItem(stringArray[i])
			i += 1
		endwhile
	EndIf
	listMenu.OpenMenu()
	int result = listMenu.GetResultInt()
	if result == 0 ;attributes
		Proteus_PlayerAttributesFunction(player) ;located in PhenderixToolEditNPCScript
	elseif result == 1 ;skills
		Proteus_PlayerSkillsFunction(player) ;located in PhenderixToolEditNPCScript
	elseif result == 2 ;resistance
		Proteus_PlayerResistanceFunction(player) ;located in PhenderixToolEditNPCScript
	elseif result == 3 ;size scale
		Proteus_PlayerSizeScaleFunction(player) ;located in PhenderixToolEditNPCScript
	elseif result == 4 ;back to main menu
		Proteus_PlayerMainMenu()
	endIf
endFunction

Function Teleporter(int option)
	Debug.Notification("Teleporter menu loading...may take a few seconds!")
	String[] stringArray = new String[125]
	Form[] teleportArray = new Form[125]
	int k = 0
	while k < teleportLocationsList.GetSize()
		Form temp = teleportLocationsList.GetAt(k)
		teleportArray[k] = temp
		stringArray[k] = " " + temp.GetName()
		k+=1
	endWhile
	int teleporterOption = -1
	UIListMenu listMenuTeleport = UIExtensions.GetMenu("UIListMenu") as UIListMenu
	if(option == 0)
		listMenuTeleport.AddEntryItem("Current Location")
		teleporterOption = 1
	endIf
	int i
	if listMenuTeleport
		int n = k+1
		i = 0
		while i < n
		listMenuTeleport.AddEntryItem(stringArray[i])
		i += 1
		endwhile
	EndIf
	listMenuTeleport.OpenMenu()
	int result = listMenuTeleport.GetResultInt()

	if result > 0 && result <= 130
		if option == 0
			int numR = result - 1
			(teleportLocationsList.GetAt(numR) as Spell).Cast(player, player)
		elseif option == 1
			int numR = result
			(teleportLocationsList.GetAt(numR) as Spell).Cast(player, player)
		endIf
	else
	endIf
endFunction


;Checks if this world has a number assigned to it, if not assigns one
function WorldIdentityFunction()	
	if(ZZNPCAppearanceSaved.GetValue() == 0)
		int i = 1
		bool setVal = false
		while i < 1000 && setVal == false
			if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_PresetsLoaded_" + i + ".json"))
			else
				setVal = true
				ZZNPCAppearanceSaved.SetValue(i)
			endIf
			i+=1
		endWhile
	endIf
endFunction

Function Proteus_CheckActiveMods()
	;initially set all bools as false and then check if mods are active in user's load order
	obisActive = false
	lotdActive = false
	haemophiliaActive  = false
	unarmouredDefenseActive  = false
	dragonbornCustomPerkActive = false
	vigilantPerksActive  = false
	glenmorilPerksActive  = false
	handtohandActive  = false
	gtsActive = false
	gtsPatchName = ""
	pmwActive  = false
	apocalypseActive  = false
	edmrActive  = false
	pmeActive  = false
	odinActive  = false
	triumActive  = false
	imperiousActive  = false
	aethActive = false
	morningstarActive = false
	betterVampiresActive = false
	bloodlinesActive = false
	bloodmoonRisingActive = false
	curseVampireActive = false
	manbeastActive = false
	lupineActive = false
	moonlightTalesActive = false
	sacrilegeActive = false
	sacrosanctActive = false
	sanguinaireActive = false
	scionActive = false
	vampyriumActive = false
	werewolfPerksExpandedActive = false
	growlActive = false
	truaActive = false
	wintersunActive = false
	pilgrimActive = false
	arcanumActive = false
	shadowspellsActive = false
	acebloodActive = false
	mysticiscmActive = false
	colorfulMagicActive = false
	addItemsActive = false
	vokriinatorActive = false
	cgoActive = false
	nffActive = false
	effActive = false
	elementsActive = false

	;------------------------------------------------------------------------------------------------------
	;check for mods critical to running Project Proteus
	;------------------------------------------------------------------------------------------------------
	Int targetModIndex = Game.GetModByName("RaceMenu.esp")
	if TargetModIndex != 255
	else
		Debug.Notification("RaceMenu is not installed. It must be installed for the Player Module to work properly!")
	endIf
	targetModIndex = Game.GetModByName("UIExtensions.esp")
	if TargetModIndex != 255
	else
		Debug.Notification("UIExtensions is not installed. It must be installed for the Player Module to work properly!")
	endIf
	
	;------------------------------------------------------------------------------------------------------
	;check for mods that may have certain items Proteus will have to add back to player / spawn inventory
	;------------------------------------------------------------------------------------------------------
	;check for mods with special items
	targetModIndex = Game.GetModByName("OBIS SE.esp")
	if TargetModIndex != 255
		obisActive = true
	endIf

	targetModIndex = Game.GetModByName("LegacyoftheDragonborn.esm")
	if TargetModIndex != 255
		lotdActive = true
	endIf

	targetModIndex = Game.GetModByName("AddItemMenuSE.esp")
	if TargetModIndex != 255
		addItemsActive = true
	endIf

	targetModIndex = Game.GetModByName("DSerCombatGameplayOverhaul.esp")
	if TargetModIndex != 255
		cgoActive = true
	endIf
	
	;------------------------------------------------------------------------------------------------------
	;custom perk trees (that use Custom Skills Framework)
	targetModIndex = Game.GetModByName("Haemophilia.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Haemophilia Patch.esp")
		if TargetModIndex != 255
			haemophiliaActive = true
		else
			Debug.Notification("Proteus Haemophilia patch not installed. Please install it!")
		endIf
	endIf

	targetModIndex = Game.GetModByName("Perk-Vigilant.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Vigilant Patch.esp")
		if TargetModIndex != 255
			vigilantPerksActive = true
		else
			Debug.Notification("Proteus Vigilant Perk patch not installed. Please install it!")
		endIf
	endIf

	targetModIndex = Game.GetModByName("Perk-Glenmoril.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Glenmoril Patch.esp")
		if TargetModIndex != 255
			glenmorilPerksActive = true
		else
			Debug.Notification("Proteus Glenmoril Perk patch not installed. Please install it!")
		endIf
		
	endIf

	targetModIndex = Game.GetModByName("Perk-HandToHand.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - HandToHand Patch.esp")
		if TargetModIndex != 255
			handtohandActive = true
		else
			Debug.Notification("Proteus Hand to Hand patch not installed. Please install it!")
		endIf
	endIf

	targetModIndex = Game.GetModByName("Perk-Unarmoured.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - UnarmouredDefense Patch.esp")
		if TargetModIndex != 255
			unarmouredDefenseActive = true
		else
			Debug.Notification("Proteus Unarmoured Defense patch not installed. Please install it!")
		endIf
	endIf

	targetModIndex = Game.GetModByName("DragonbornShoutPerks.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Dragonborn Custom Perk Patch.esp")
		if TargetModIndex != 255
			dragonbornCustomPerkActive = true
		else
			Debug.Notification("Proteus Dragonborn Custom Perk patch not installed. Please install it!")
		endIf
	endIf

	;Giantess Mod - Size Matters NG
	targetModIndex = Game.GetModByName("GTS.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - GTS Custom Perk Patch.esp")
		if TargetModIndex != 255
			gtsPatchName = "Proteus - GTS Custom Perk Patch.esp"
		else
			targetModIndex = Game.GetModByName("ProteusGTSCustomPerkPatch.esp")
			if TargetModIndex != 255
				gtsPatchName = "ProteusGTSCustomPerkPatch.esp"
			endIf
		endIf
		if gtsPatchName != ""
			gtsActive = true
		else
			Debug.Notification("Proteus GTS compatibility patch not installed. Please install it!")
		endIf
	endIf

	;------------------------------------------------------------------------------------------------------
	;check for spell mods
	targetModIndex = Game.GetModByName("Phenderix Magic World.esm")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Phenderix Magic World Patch.esp")
		if TargetModIndex != 255
			pmwActive = true
		else
			Debug.Notification("Proteus Phenderix Magic World patch not installed. Please install it!")
		endIf
	endIf

	targetModIndex = Game.GetModByName("Apocalypse - Magic of Skyrim.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Apocalypse Patch.esp")
		if TargetModIndex != 255
			apocalypseActive = true
		else
			Debug.Notification("Proteus Apocalypse patch not installed. Please install it!")
		endIf
	endIf

	targetModIndex = Game.GetModByName("Phenderix Magic Evolved.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Phenderix Magic Evolved Patch.esp")
		if TargetModIndex != 255
			pmeActive = true
		else
			Debug.Notification("Proteus Phenderix Magic Evolved patch not installed. Please install it!")
		endIf
	endIf

	targetModIndex = Game.GetModByName("Elemental Destruction Magic Redux.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - EDM Redux Patch.esp")
		if TargetModIndex != 255
			edmrActive = true
		else
			Debug.Notification("Proteus Elemental Destruction Magic Redux patch not installed. Please install it!")
		EndIf
	endIf

	targetModIndex = Game.GetModByName("Elemental Destruction.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - EDM Patch.esp")
		if TargetModIndex != 255
			edmActive = true
		else
			Debug.Notification("Proteus Elemental Destruction Magic patch not installed. Please install it!")
		EndIf
	endIf

	targetModIndex = Game.GetModByName("Odin - Skyrim Magic Overhaul.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Odin Patch.esp")
		if TargetModIndex != 255
			odinActive = true
		else
			Debug.Notification("Proteus Odin patch not installed. Please install it!")
		EndIf
	endIf

	targetModIndex = Game.GetModByName("Triumvirate - Mage Archetypes.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Triumvirate Patch.esp")
		if TargetModIndex != 255
			triumActive = true
		else
			Debug.Notification("Proteus Triumvirate patch not installed. Please install it!")
		EndIf
	endIf

	targetModIndex = Game.GetModByName("MysticismMagic.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Mysticism Patch.esp")
		if TargetModIndex != 255
			mysticiscmActive = true
		else
			Debug.Notification("Proteus Mysticism patch not installed. Please install it!")
		EndIf
	endIf

	targetModIndex = Game.GetModByName("Colorful_Magic_SE.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Colorful Magic Patch.esp")
		if TargetModIndex != 255
			colorfulMagicActive = true
		else
			Debug.Notification("Proteus Colorful Magic patch not installed. Please install it!")
		EndIf
	endIf

	targetModIndex = Game.GetModByName("ShadowSpellPackage.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Shadow Spells Patch.esp")
		if TargetModIndex != 255
			shadowspellsActive = true
		else
			Debug.Notification("Proteus Shadow Spells patch not installed. Please install it!")
		EndIf
	endIf

	targetModIndex = Game.GetModByName("Ace Blood Magic SE.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Ace Blood Patch.esp")
		if TargetModIndex != 255
			acebloodActive = true
		else
			Debug.Notification("Proteus Ace Blood patch not installed. Please install it!")
		EndIf
	endIf

	targetModIndex = Game.GetModByName("Arcanum.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Arcanum Patch.esp")
		if TargetModIndex != 255
			arcanumActive = true
		else
			Debug.Notification("Proteus Arcanum patch not installed. Please install it!")
		EndIf
	endIf

	targetModIndex = Game.GetModByName("Phenderix Elements.esp")
	if TargetModIndex != 255
		elementsActive = true
	endIf

	;------------------------------------------------------------------------------------------------------
	;check for race mods
	targetModIndex = Game.GetModByName("Imperious - Races of Skyrim.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Imperious Patch.esp")
		if TargetModIndex != 255
			imperiousActive = true
		else
			Debug.Notification("Proteus Imperious patch not installed. Please install it!")
		EndIf
	endIf
	targetModIndex = Game.GetModByName("Morningstar - Minimalistic Races of Skyrim.esl")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Morningstar Patch.esp")
		if TargetModIndex != 255
			morningstarActive = true
		else
			Debug.Notification("Proteus Morningstar patch not installed. Please install it!")
		EndIf
	endIf
	targetModIndex = Game.GetModByName("Aetherius.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Aetherius Patch.esp")
		if TargetModIndex != 255
			aethActive = true
		else
			Debug.Notification("Proteus Aetherius patch not installed. Please install it!")
		EndIf
	endIf

	;------------------------------------------------------------------------------------------------------
	;check for religion mods
	targetModIndex = Game.GetModByName("Trua - Minimalistic Faiths of Skyrim.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Trua Patch.esp")
		if TargetModIndex != 255
			truaActive = true
		else
			Debug.Notification("Proteus Trua patch not installed. Please install it!")
		EndIf
	endIf
	targetModIndex = Game.GetModByName("Wintersun - Faiths of Skyrim.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Wintersun Patch.esp")
		if TargetModIndex != 255
			wintersunActive = true
		else
			Debug.Notification("Proteus Wintersun patch not installed. Please install it!")
		EndIf
	endIf
	targetModIndex = Game.GetModByName("Pilgrim.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Pilgrim Patch.esp")
		if TargetModIndex != 255
			pilgrimActive = true
		else
			Debug.Notification("Proteus Pilgrim patch not installed. Please install it!")
		EndIf
	endIf

	;------------------------------------------------------------------------------------------------------
	;check for vampire mods
	targetModIndex = Game.GetModByName("Better Vampires.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Better Vampires Patch.esp")
		if TargetModIndex != 255
			betterVampiresActive = true
		else
			Debug.Notification("Proteus Better Vampires patch not installed. Please install it!")
		EndIf
	endIf
	targetModIndex = Game.GetModByName("Bloodlines of Tamriel.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Bloodlines Patch.esp")
		if TargetModIndex != 255
			bloodlinesActive = true
		else
			Debug.Notification("Proteus Bloodlines patch not installed. Please install it!")
		EndIf
	endIf
	targetModIndex = Game.GetModByName("Curse of the Vampire.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Curse of the Vampire Patch.esp")
		if TargetModIndex != 255
			curseVampireActive = true
		else
			Debug.Notification("Proteus Curse of the Vampire patch not installed. Please install it!")
		EndIf
	endIf
	targetModIndex = Game.GetModByName("Sacrilege - Minimalistic Vampires of Skyrim.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Sacrilege Patch.esp")
		if TargetModIndex != 255
			sacrilegeActive = true
		else
			Debug.Notification("Proteus Sacrilege patch not installed. Please install it!")
		EndIf
	endIf
	targetModIndex = Game.GetModByName("Sacrosanct - Vampires of Skyrim.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Sacrosanct Patch.esp")
		if TargetModIndex != 255
			sacrosanctActive = true
		else
			Debug.Notification("Proteus Sacrosanct patch not installed. Please install it!")
		EndIf
	endIf
	targetModIndex = Game.GetModByName("Sanguinaire.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Sanguinaire Patch.esp")
		if TargetModIndex != 255
			sanguinaireActive = true
		else
			Debug.Notification("Proteus Sanguinaire patch not installed. Please install it!")
		EndIf
	endIf
	targetModIndex = Game.GetModByName("Scion.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Scion Patch.esp")
		if TargetModIndex != 255
			scionActive = true
		else
			Debug.Notification("Proteus Scion patch not installed. Please install it!")
		EndIf
	endIf
	targetModIndex = Game.GetModByName("Vampyrium2.0.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Vampyrium Patch.esp")
		if TargetModIndex != 255
			vampyriumActive = true
		else
			Debug.Notification("Proteus Vampyrium patch not installed. Please install it!")
		EndIf
	endIf

	;------------------------------------------------------------------------------------------------------
	;check for werewolf mods
	targetModIndex = Game.GetModByName("BloodmoonRising.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Bloodmoon Rising Patch.esp")
		if TargetModIndex != 255
			bloodmoonRisingActive = true
		else
			Debug.Notification("Proteus Bloodmoon Rising patch not installed. Please install it!")
		EndIf
	endIf
	targetModIndex = Game.GetModByName("Manbeast.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Manbeast Patch.esp")
		if TargetModIndex != 255
			manbeastActive = true
		else
			Debug.Notification("Proteus Manbeast patch not installed. Please install it!")
		EndIf
	endIf
	targetModIndex = Game.GetModByName("LupineWerewolfPerkExpansion.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Lupine Patch.esp")
		if TargetModIndex != 255
			lupineActive = true
		else
			Debug.Notification("Proteus Lupine patch not installed. Please install it!")
		EndIf
	endIf
	targetModIndex = Game.GetModByName("Moonlight Tales Special Edition.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Moonlight Tales Patch.esp")
		if TargetModIndex != 255
			moonlightTalesActive = true
		else
			Debug.Notification("Proteus Moonlight Tales patch not installed. Please install it!")
		EndIf
	endIf
	targetModIndex = Game.GetModByName("Growl - Werebeasts of Skyrim.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Growl Patch.esp")
		if TargetModIndex != 255
			growlActive = true
		else
			Debug.Notification("Proteus Growl patch not installed. Please install it!")
		EndIf
	endIf
	targetModIndex = Game.GetModByName("WerewolfPerksExpanded.esp")
	if TargetModIndex != 255
		targetModIndex = Game.GetModByName("Proteus - Werewolf Perks Expanded Patch.esp")
		if TargetModIndex != 255
			werewolfPerksExpandedActive = true
		else
			Debug.Notification("Proteus Werewolf Perks Expanded patch not installed. Please install it!")
		EndIf
	endIf

	targetModIndex = Game.GetModByName("Vokriinator Black.esp")
	if TargetModIndex != 255
		vokriinatorActive = true
	endIf


	;------------------------------------------------------------------------------------------------------
	;check for follower framework mods
	targetModIndex = Game.GetModByName("EFFCore.esm")
	if TargetModIndex != 255
		effActive = true
	endIf
	targetModIndex = Game.GetModByName("nwsFollowerFramework.esp")
	if TargetModIndex != 255
		nffActive = true
	endIf
endFunction


Function Proteus_AddBackModItems()

	if vigilantPerksActive == true
		Form object = Game.GetFormFromFile(0x001816, "Perk-Vigilant.esp")
		if(player.GetItemCount(object) == 0)
			;Debug.MessageBox("Added Vigilant Idol")
			player.AddItem(object, 1, true)
		endIf
	endIf

	if glenmorilPerksActive == true
		Form object = Game.GetFormFromFile(0x002D66, "Perk-Glenmoril.esp")
		if(player.GetItemCount(object) == 0)
			;Debug.MessageBox("Added Glenmoril MusicBox")
			player.AddItem(object, 1, true)
		endIf
	endIf

	if handtohandActive == true
		Form object = Game.GetFormFromFile(0x000D70, "Perk-HandToHand.esp")
		if(player.GetItemCount(object) == 0)
			;Debug.MessageBox("Added Perk H2H")
			player.AddItem(object, 1, true)
		endIf
	endIf

	if unarmouredDefenseActive == true
		Form object = Game.GetFormFromFile(0x000D77, "Perk-Unarmoured.esp")
		if(player.GetItemCount(object) == 0)
			player.AddItem(object, 1, true)
		endIf
	endIf

	if haemophiliaActive == true
		Form object = Game.GetFormFromFile(0x000823, "Haemophilia.esp")
		if(player.GetItemCount(object) == 0)
			;Debug.MessageBox("Added Haem Skull")
			player.AddItem(object, 1, true)
		endIf
		
	endIf

	if obisActive == true
		Form object = Game.GetFormFromFile(0x01074F, "OBIS SE.esp")
		if(player.GetItemCount(object) == 0)
			;Debug.MessageBox("Added OBIS Settings Book")
			player.AddItem(object, 1, true)
		endIf
	endIf

	if lotdActive == true
		Form object = Game.GetFormFromFile(0x2469A6, "LegacyoftheDragonborn.esm")
		if(player.GetItemCount(object) == 0)
			;Debug.MessageBox("Added Curator's Guide")
			player.AddItem(object, 1, true)
		endIf
	endIf

	if addItemsActive == true
		Form object = Game.GetFormFromFile(0x00690C, "AddItemMenuSE.esp")
		Form object2 = Game.GetFormFromFile(0x00895B, "AddItemMenuSE.esp")
		if(player.GetItemCount(object) == 0)
			player.AddItem(object, 1, true)
		endIf
		if(player.GetItemCount(object2) == 0)
			player.AddItem(object2, 1, true)
		endIf
	endIf
endFunction




function Proteus_CharacterSave(Actor target, String presetNameKnown)
	target.GetActorBase().SetInvulnerable(True)
	String presetName
	characterSavingName = target.GetActorBase().GetName()
	if(presetNameKnown == "")
		presetName = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Save player character as?", "")
	else
		presetName = presetNameKnown
	endIf
	Int lengthPresetName = StringUtil.GetLength(presetName as String)
	if (lengthPresetName > 0)
		;save name, gender, race name, carry weight
		Proteus_SaveTargetStrings(target, presetName)

		;save skill levels, attributes, progress to next level
		Proteus_SaveSkillsAttributes(presetName, target)
		Debug.Notification(characterSavingName + " stats saved.")

		;save equipped & unequipped items
		Proteus_SaveAllItems(presetName, target, true)
		Debug.Notification(characterSavingName + " inventory saved.")

		;save perks
		Proteus_SavePerks(presetName)
		Debug.Notification(characterSavingName + " perks saved.")

		;save spells
		Proteus_SaveSpells(presetName, target) ;save formIDs of spells in json file
		Debug.Notification(characterSavingName + " spells saved.")

		;save appearance of target's character (including race) and make system register preset
		Proteus_SaveCharacterAppearance(presetName, target) 
		String processedPLAYERPRESETName = processName(presetName)
		Proteus_RegisterLoadedPresetOption(target, processedPLAYERPRESETName, presetName, false)
		SaveAppearancePresetJSON(processedPLAYERPRESETName, presetName)
		Proteus_SaveGlobalVariables(presetName)
		Debug.Notification(characterSavingName + " appearance saved.")

		;save crime faction bounties
		SaveCrimeFactions(presetName)

		;save vampirism status
		Proteus_Vampirism(0)

		;add back critical items added by some mods
		Proteus_AddBackModItems()

		;save phenderix elements values if mod is enabled
		if elementsActive == true
			Proteus_SaveElementsVariables(presetName)
		endIf

		;update and save location
		ProteusMarker.MoveTo(target) ;moving to marker removes a lot of the notifications that pop up on screen
		target.MoveTo(ProteusMarker)
		ZZHasSavedPlayerCharacter.SetValue(ZZHasSavedPlayerCharacter.GetValue() + 1)
		debug.Notification(characterSavingName + " has been saved.")
	else
		Debug.Notification("That preset name is invalid.")
	endIf
	target.GetActorBase().SetInvulnerable(False)
endFunction


String function Proteus_SpawnHasPerksSpells()
	Utility.Wait(0.1)
	Int ibutton= ZZPlayerSpawnPerksSpellsMessage.show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
	if(ibutton == 0)
		return "Yes"
	Elseif(ibutton == 1)
		return "No"
	else
		Debug.Notification("Invalid response. Try again.")
		Proteus_SpawnHasPerksSpells()
	EndIf
	Utility.Wait(0.1)
endFunction

function Proteus_RemoveFavorites(Actor target)

	;remove favorited spells
	Spell[] favoritedSpells = ProteusDLLUtils.GetAllFavoritedSpells()
	int favCount = 0
	int p = 0
	while p < favoritedSpells.Length
		ProteusUnmarkItemAsFavorite(favoritedSpells[p])
		p += 1
	endWhile

	;remove favorited items
	favCount = 0
	p = 0
	Form[] favoritedItems = ProteusDLLUtils.GetAllFavoritedItems()
	while p < favoritedItems.Length
		ProteusUnmarkItemAsFavorite(favoritedItems[p])
		p += 1
	endWhile
endFunction

function Proteus_LoadCharacter(Actor target, String presetKnownName)
	String presetName = ""
	Int lengthPresetName
	Int spawnLoadPerksSpells
	firstTimeSpawn = false

	if(presetKnownName == "")
		Debug.Notification("Select which character to switch to.")
		presetName = Proteus_SelectPresetSwitch(false)	
	else
		presetName = presetKnownName
	endIf
	lengthPresetName = StringUtil.GetLength(presetName as String)
	
	;if valid preset name entered
	if (lengthPresetName > 0)

		if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_Race_" + presetName + ".json"))

			Proteus_RemoveAllItemsToContainer(target) ;clear items of actor first before changing name
			
			Race presetRace = Proteus_LoadCharacterRace(presetName)
			Proteus_LoadTargetStrings(presetName, target, 2)

			if(StringUtil.GetLength(target.GetActorBase().GetName()) > 0)

				;set up marker for moving target to current player location and move player to target location
				playerMarker.MoveTo(player)
				Utility.Wait(0.1)
				Actor spawnedActor = Proteus_GetSpawningActor(presetName)
				if(spawnedActor == NONE)
				else
					player.MoveTo(spawnedActor)
				endIf

				;remove favorites
				Proteus_RemoveFavorites(target)

				Race currentRace = target.GetRace()
				Proteus_LoadSkillsAttributes(presetName, target, 0) ;REENABLE
				Debug.Notification(presetName + " stats loaded.")
				Proteus_LoadCharacterAppearance(presetName, target, currentRace, presetRace, 0) ;load appearance of character
				Debug.Notification(presetName + " appearance loaded.")

				Proteus_RemoveSpells(target, 0) ;removes current characters spells
				Proteus_RemovePerks(player, 0) ;remove all of player's current perks before adding other character's perks

				Proteus_LoadPerks(presetName, target)
				Debug.Notification(presetName + " perks loaded.")

				Proteus_LoadSpells(presetName, target) ;loads spells from json file
				Debug.Notification(presetName + " spells loaded.")

				Game.SetPerkPoints(totalPerkPointsAvailable)

				;INVENTORY REMOVAL AND LOADING
				Utility.Wait(0.1)
				Proteus_LoadItems(presetName, target) 
				Utility.Wait(0.1)
				Proteus_EquipItems(presetName, target) 
				;mark favorite items
				if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_FavoritedItems_" +  presetName + ".json"))
					Int JItemMapListFavs = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_Character_FavoritedItems_" +  presetName + ".json")
					Int jItemFormNamesFav = jmap.object()
					String ItemFormKeyFavs = jmap.nextKey(JItemMapListFavs, "", "")
					while ItemFormKeyFavs 
						Form value = jmap.GetForm(JItemMapListFavs, ItemFormKeyFavs, none) as Form
						ProteusMarkItemAsFavorite(value)
						ItemFormKeyFavs = jmap.nextKey(JItemMapListFavs, ItemFormKeyFavs, "")
					endwhile
				EndIf
				
				;change carry weight
				Float currentCarryWeight = target.GetBaseAV("CarryWeight")
				Float diff = targetCW - currentCarryWeight
				target.ModAv("CarryWeight", diff)

				;make system recognize this appearance preset has been loaded
				Proteus_SavePlayerPreset(target, presetName)
				String processedPLAYERPRESETName = processName(presetName)
				Proteus_RegisterLoadedPresetOption(target, processedPLAYERPRESETName, presetName, false)
				SaveAppearancePresetJSON(target.GetActorBase().GetName(), presetName)
				Proteus_LoadGlobalVariables(presetName)

				;load crime faction bounties
				;LoadCrimeFactions(presetName)

				;load phenderix elements values if mod is enabled
				if elementsActive == true
					Proteus_LoadElementsVariables(presetName)
				endIf

				;load vampirism status
				Proteus_Vampirism(1)

				;add very important items from other mods that may not be in inventory 
				Proteus_AddBackModItems()

				;final attempt to make appearance correct
				If CharGen.IsExternalEnabled()
					CharGen.LoadExternalCharacter(target, presetRace, presetName)
				Else
					CharGen.LoadCharacter(target,presetRace,presetName)
				EndIf		
				;currentRace = target.GetRace()
				;Proteus_LoadCharacterAppearance(presetName, target, currentRace, presetRace, 0) ;load appearance a second time / may fix some glitches
			endIf
		else
			Debug.Notification("Player character not found.")
		endIf
	else
		Debug.MessageBox("Invalid preset name entered. Try again.")
	endIf
endFunction


function Proteus_LoadCharacterSpawn(Actor target, String presetKnownName)
	String presetName = ""
	Int lengthPresetName
	Int spawnLoadPerksSpells
	firstTimeSpawn = false

	if(presetKnownName == "evilproteusspawn")
		Debug.Notification("Select which character to spawn as an enemy.")
		presetName = Proteus_SelectPresetSpawn()
	elseif(presetKnownName == "")
		Debug.Notification("Select which character to import.")
		presetName = Proteus_SelectPresetSpawnImport()
	else
		presetName = presetKnownName
	endIf

	Utility.Wait(0.1)
	presetName = ProcessName(presetName)
	Utility.Wait(0.1)
	lengthPresetName = StringUtil.GetLength(presetName as String)
	Utility.Wait(0.1)
	;if valid preset name entered
	if (lengthPresetName > 0)
			if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_Race_" + presetName + ".json"))
		
				Race presetRace = Proteus_LoadCharacterRace(presetName)

				if(presetKnownName == "evilproteusspawn")
					target = hostilePlayerCharacter
				elseif presetKnownName == "" ;spawn a player character follower
					Actor actorTemp = Proteus_GetUnusedSpawn()
					target = actorTemp
				else
					Actor actorTemp = Proteus_GetSpawningActor(presetKnownName)
					target = actorTemp
				endIf

				if(target == NONE || target == player)
					;STOP
				else
					target.MoveTo(playerMarker)

					;toggle AI off
					SetSelectedReference(target)
					ExecuteCommand("tai")

					Proteus_LoadTargetStrings(presetName, target, 2)
					if(StringUtil.GetLength(target.GetActorBase().GetName()) > 0)
						Race currentRace = target.GetRace()
						Proteus_LoadSkillsAttributes(presetName, target, 1) ;REENABLE
						Proteus_LoadCharacterAppearance(presetName, target, currentRace, presetRace, 1) ;load appearance of spawned NPC
						Proteus_RegisterLoadedPresetOption(target, presetName, presetName, true)

						;remove existing spells and perks from the spawn
						Proteus_RemoveSpells(target, 0) 
						Proteus_RemovePerks(target, 0)

						;load spells and perks on NPC depending on MCM
						if(ZZEnableSpawnSpellLoad.GetValue() == 1)
							Proteus_LoadSpells(presetName, target)
						endIf
						
						if(presetKnownName == "evilproteusspawn") ;make spawn hostile to the player and frenzied
							firstTimeSpawn = TRUE
							target.SetRelationshipRank(player, -4)
							target.SetActorValue("Aggression", 3 as Float)
							player.SetRelationshipRank(player, -4)
						else ;make spawn friendly to player
							target.SetRelationshipRank(player, 3)
							player.SetRelationshipRank(player, 3)
						endIf
	
						String processedNPCName = processName(target.GetActorBase().GetName())
						Proteus_JSave_NPCForms(target, processedNPCName, presetName) ;save into Proteus system to later reload.
						
						;load NPC voice type if it has one
						bool hasVoiceTypeSaved = FALSE
						String ZZNPCAppearanceSavedValue = Proteus_Round(ZZNPCAppearanceSaved.GetValue(), 0)
						If(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_VT_" + processedNPCName + ".json"))
							Int jVTList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_Character_VT_" + processedNPCName + ".json")
							Int JVT = jmap.object()
							String textKey = jmap.nextKey(jVTList, "", "")
							Form value = jmap.GetForm(jVTList, textKey, none) as Form
							target.GetActorBase().SetVoiceType(value as VoiceType) 
							hasVoiceTypeSaved = TRUE
							Utility.Wait(0.1)
						endIf
						
						if(firstTimeSpawn == TRUE && hasVoiceTypeSaved == FALSE)
							ActorBase spawnAB = target.GetActorBase()
							Race spawnABRace = spawnAB.GetRace()
							String spawnRaceName = spawnABRace.GetName() ;newcode
							if spawnAB.GetSex() == 0 ;male
								if(spawnRaceName == "Argonian" || spawnRaceName == "Argonian DZ")
									spawnAB.SetVoiceType(ZZMaleArgonian)
								elseif(spawnRaceName == "Dark Elf" || spawnRaceName == "Dark Elf DZ")
									spawnAB.SetVoiceType(ZZMaleDarkElf)
								elseif(spawnRaceName == "Khajiit" || spawnRaceName == "Khajiit DZ")
									spawnAB.SetVoiceType(ZZMaleKhajiit)
								elseif(spawnRaceName == "Orc" || spawnRaceName == "Orc DZ")
									spawnAB.SetVoiceType(ZZMaleOrc)
								else
									spawnAB.SetVoiceType(ZZMaleEvenToned)
								endIf
							else ;female
								if(spawnRaceName == "Argonian" || spawnRaceName == "Argonian DZ")
									spawnAB.SetVoiceType(ZZFemaleArgonian)
								elseif(spawnRaceName == "Dark Elf" || spawnRaceName == "Dark Elf DZ")
									spawnAB.SetVoiceType(ZZFemaleDarkElf)
								elseif(spawnRaceName == "Khajiit" || spawnRaceName == "Khajiit DZ")
									spawnAB.SetVoiceType(ZZFemaleKhajiit)
								elseif(spawnRaceName == "Orc" || spawnRaceName == "Orc DZ")
									spawnAB.SetVoiceType(ZZFemaleOrc)
								else
									spawnAB.SetVoiceType(ZZFemaleEvenToned)
								endIf
							endIf
	
							;Save NPC voice type JSON
							Int jVTList
							Int JVT = jmap.object()
							jmap.SetForm(JVT, "VT", target.GetVoiceType())
							jvalue.writeToFile(JVT, JContGlobalPath + "/Proteus/Proteus_Character_VT_" + processedNPCName + ".json")
						endIf
	
						Utility.Wait(0.1)
						Proteus_RemoveAllItems(target, NONE)
						Utility.Wait(0.1)
						Proteus_AddEquippedItemsSpawn(presetName, target) 
						Utility.Wait(0.1)	
						target.SetActorValue("CarryWeight", targetCW)
						voidMarker
						Utility.Wait(0.1)
						target.SetOutfit(ZZProteusOutfitNone)
						Proteus_LoadSpawnOutfit(target)
						Utility.Wait(0.1)
						;change location of target and player, swap positions
						target.MoveTo(voidMarker)
						Utility.Wait(0.1)
						target.MoveTo(playerMarker)
						Utility.Wait(1.0)
						;final attempt to make appearance correct
						currentRace = target.GetRace()
						Proteus_LoadCharacterAppearance(presetName, target, currentRace, presetRace, 1) ;load appearance of spawned NPC

						;Debug.MessageBox("FINAL FIX")
						;unlearn default flames and healing spells
						if target.HasSpell(flames)
							target.RemoveSpell(flames)
						endIf
						if target.HasSpell(healing)
							target.RemoveSpell(healing)
						endIf

						;toggle AI on
						SetSelectedReference(target)
						ExecuteCommand("tai")
					endIf
				endIf
			else
				if presetName != " [Exit Menu]"
					Debug.Notification("Player character " + presetName + " not found.")
				endIf
			endIf
	else
		Debug.MessageBox("Invalid preset name entered. Try again.")
		Utility.Wait(0.1)
	endIf
endFunction

Function Proteus_LoadSpawnOutfit(Actor target)
	if target == ZZCustomF1
		target.SetOutfit(ZZProteusOutfitSpawn1)
		target.GetActorBase().SetOutfit(ZZProteusOutfitSpawn1)
	elseif target == ZZCustomF2
		target.SetOutfit(ZZProteusOutfitSpawn2)
		target.GetActorBase().SetOutfit(ZZProteusOutfitSpawn2)
	elseif target == ZZCustomF3
		target.SetOutfit(ZZProteusOutfitSpawn3)
		target.GetActorBase().SetOutfit(ZZProteusOutfitSpawn3)
	elseif target == ZZCustomF4
		target.SetOutfit(ZZProteusOutfitSpawn4)
		target.GetActorBase().SetOutfit(ZZProteusOutfitSpawn4)
	elseif target == ZZCustomF5
		target.SetOutfit(ZZProteusOutfitSpawn5)
		target.GetActorBase().SetOutfit(ZZProteusOutfitSpawn5)
	elseif target == ZZCustomF6
		target.SetOutfit(ZZProteusOutfitSpawn6)
		target.GetActorBase().SetOutfit(ZZProteusOutfitSpawn6)
	elseif target == ZZCustomF7
		target.SetOutfit(ZZProteusOutfitSpawn7)
		target.GetActorBase().SetOutfit(ZZProteusOutfitSpawn7)
	elseif target == ZZCustomF8
		target.SetOutfit(ZZProteusOutfitSpawn8)
		target.GetActorBase().SetOutfit(ZZProteusOutfitSpawn8)
	elseif target == ZZCustomF9
		target.SetOutfit(ZZProteusOutfitSpawn9)
		target.GetActorBase().SetOutfit(ZZProteusOutfitSpawn9)
	elseif target == ZZCustomF10
		target.SetOutfit(ZZProteusOutfitSpawn10)
		target.GetActorBase().SetOutfit(ZZProteusOutfitSpawn10)
	elseif target == ZZCustomM1
		target.SetOutfit(ZZProteusOutfitSpawn11)
		target.GetActorBase().SetOutfit(ZZProteusOutfitSpawn11)
	elseif target == ZZCustomM2
		target.SetOutfit(ZZProteusOutfitSpawn12)
		target.GetActorBase().SetOutfit(ZZProteusOutfitSpawn12)
	elseif target == ZZCustomM3
		target.SetOutfit(ZZProteusOutfitSpawn13)
		target.GetActorBase().SetOutfit(ZZProteusOutfitSpawn13)
	elseif target == ZZCustomM4
		target.SetOutfit(ZZProteusOutfitSpawn14)
		target.GetActorBase().SetOutfit(ZZProteusOutfitSpawn14)
	elseif target == ZZCustomM5
		target.SetOutfit(ZZProteusOutfitSpawn15)
		target.GetActorBase().SetOutfit(ZZProteusOutfitSpawn15)
	elseif target == ZZCustomM6
		target.SetOutfit(ZZProteusOutfitSpawn16)
		target.GetActorBase().SetOutfit(ZZProteusOutfitSpawn16)
	elseif target == ZZCustomM7
		target.SetOutfit(ZZProteusOutfitSpawn17)
		target.GetActorBase().SetOutfit(ZZProteusOutfitSpawn17)
	elseif target == ZZCustomM8
		target.SetOutfit(ZZProteusOutfitSpawn18)
		target.GetActorBase().SetOutfit(ZZProteusOutfitSpawn18)
	elseif target == ZZCustomM9
		target.SetOutfit(ZZProteusOutfitSpawn19)
		target.GetActorBase().SetOutfit(ZZProteusOutfitSpawn19)
	elseif target == ZZCustomM10
		target.SetOutfit(ZZProteusOutfitSpawn20)
		target.GetActorBase().SetOutfit(ZZProteusOutfitSpawn20)
	elseif target == hostilePlayerCharacter
		target.SetOutfit(ZZProteusOutfitSpawnEvil)
		target.GetActorBase().SetOutfit(ZZProteusOutfitSpawnEvil)
	endIf
endFunction

;on switching characters dump all items in this container
Function Proteus_RemoveAllItemsToContainer(Actor target)
		String saveName = target.GetActorBase().GetName()		
		;get proper container and remove all items from it (setup phase for storage)
		ObjectReference storageContainerUnequipped = Proteus_SaveUnequippedContainerFunction(saveName)
		Proteus_RemoveAllItems(target, storageContainerUnequipped)
		storageContainerUnequipped.SetName(saveName)
		storageContainerUnequipped.SetDisplayName(saveName)
		Proteus_RemoveAllItems(target, storageContainerUnequipped)
endFunction

Actor Function Proteus_GetSpawningActor(String name)
	Actor spawningActor
	string[] stringArray = new String[21]
	stringArray[0] = ZZCustomM1.GetActorBase().GetName()
	stringArray[1] = ZZCustomM2.GetActorBase().GetName()
	stringArray[2] = ZZCustomM3.GetActorBase().GetName()
	stringArray[3] = ZZCustomM4.GetActorBase().GetName()
	stringArray[4] = ZZCustomM5.GetActorBase().GetName()
	stringArray[5] = ZZCustomM6.GetActorBase().GetName()
	stringArray[6] = ZZCustomM7.GetActorBase().GetName()
	stringArray[7] = ZZCustomM8.GetActorBase().GetName()
	stringArray[8] = ZZCustomM9.GetActorBase().GetName()
	stringArray[9] = ZZCustomM10.GetActorBase().GetName()
	stringArray[10] = ZZCustomF1.GetActorBase().GetName()
	stringArray[11] = ZZCustomF2.GetActorBase().GetName()
	stringArray[12] = ZZCustomF3.GetActorBase().GetName()
	stringArray[13] = ZZCustomF4.GetActorBase().GetName()
	stringArray[14] = ZZCustomF5.GetActorBase().GetName()
	stringArray[15] = ZZCustomF6.GetActorBase().GetName()
	stringArray[16] = ZZCustomF7.GetActorBase().GetName()
	stringArray[17] = ZZCustomF8.GetActorBase().GetName()
	stringArray[18] = ZZCustomF9.GetActorBase().GetName()
	stringArray[19] = ZZCustomF10.GetActorBase().GetName()
	stringArray[20] = " [Exit Menu]"

	if name == ""
		UIListMenu listMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
		if listMenu
			int n = 21
			int i = 0
			while i < n
				listMenu.AddEntryItem(stringArray[i])
				i += 1
			endwhile
		EndIf
		listMenu.OpenMenu()
		int result = listMenu.GetResultInt()
		if result == 0
			spawningActor =  ZZCustomM1
		elseif result == 1
			spawningActor =  ZZCustomM2
		elseif result == 2
			spawningActor =  ZZCustomM3
		elseif result == 3
			spawningActor =  ZZCustomM4
		elseif result == 4
			spawningActor =  ZZCustomM5
		elseif result == 5
			spawningActor =  ZZCustomM6
		elseif result == 6
			spawningActor =  ZZCustomM7
		elseif result == 7
			spawningActor =  ZZCustomM8
		elseif result == 8
			spawningActor =  ZZCustomM9
		elseif result == 9
			spawningActor =  ZZCustomM10
		elseif result == 10
			spawningActor =  ZZCustomF1
		elseif result == 11
			spawningActor =  ZZCustomF2
		elseif result == 12
			spawningActor =  ZZCustomF3
		elseif result == 13
			spawningActor =  ZZCustomF4
		elseif result == 14
			spawningActor =  ZZCustomF5
		elseif result == 15
			spawningActor =  ZZCustomF6
		elseif result == 16
			spawningActor =  ZZCustomF7
		elseif result == 17
			spawningActor =  ZZCustomF8
		elseif result == 18
			spawningActor =  ZZCustomF9
		elseif result == 19
			spawningActor =  ZZCustomF10
		elseif result == 20
		endIf
	else
		if name == stringArray[0]
			spawningActor =  ZZCustomM1
		elseif name == stringArray[1]
			spawningActor =  ZZCustomM2
		elseif name == stringArray[2]
			spawningActor =  ZZCustomM3
		elseif name == stringArray[3]
			spawningActor =  ZZCustomM4
		elseif name == stringArray[4]
			spawningActor =  ZZCustomM5
		elseif name == stringArray[5]
			spawningActor =  ZZCustomM6
		elseif name == stringArray[6]
			spawningActor =  ZZCustomM7
		elseif name == stringArray[7]
			spawningActor =  ZZCustomM8
		elseif name == stringArray[8]
			spawningActor =  ZZCustomM9
		elseif name == stringArray[9]
			spawningActor =  ZZCustomM10
		elseif name == stringArray[10]
			spawningActor =  ZZCustomF1
		elseif name == stringArray[11]
			spawningActor =  ZZCustomF2
		elseif name == stringArray[12]
			spawningActor =  ZZCustomF3
		elseif name == stringArray[13]
			spawningActor =  ZZCustomF4
		elseif name == stringArray[14]
			spawningActor =  ZZCustomF5
		elseif name == stringArray[15]
			spawningActor =  ZZCustomF6
		elseif name == stringArray[16]
			spawningActor =  ZZCustomF7
		elseif name == stringArray[17]
			spawningActor =  ZZCustomF8
		elseif name == stringArray[18]
			spawningActor =  ZZCustomF9
		elseif name == stringArray[19]
			spawningActor =  ZZCustomF10
		else
			spawningActor = Proteus_GetUnusedSpawn()
		endIf
	endIf
	
	String name2 = spawningActor.GetActorBase().GetName()
	Int indexF1 = stringutil.Find(name2, "Unused Slot", 0)
	if indexF1 >= 0
		firstTimeSpawn = TRUE
		return spawningActor
	else
		return spawningActor
	EndIf
endFunction

Actor Function Proteus_GetUnusedSpawn()
	Actor target
	if ZZCustomM1.GetActorBase().GetName() == "Unused Slot"
		target = ZZCustomM1
	elseif ZZCustomM2.GetActorBase().GetName() == "Unused Slot"
		target = ZZCustomM2
	elseif ZZCustomM3.GetActorBase().GetName() == "Unused Slot"
		target = ZZCustomM3
	elseif ZZCustomM4.GetActorBase().GetName() == "Unused Slot"
		target = ZZCustomM4
	elseif ZZCustomM5.GetActorBase().GetName() == "Unused Slot"
		target = ZZCustomM5
	elseif ZZCustomM6.GetActorBase().GetName() == "Unused Slot"
		target = ZZCustomM6
	elseif ZZCustomM7.GetActorBase().GetName() == "Unused Slot"
		target = ZZCustomM7
	elseif ZZCustomM8.GetActorBase().GetName() == "Unused Slot"
		target = ZZCustomM8
	elseif ZZCustomM9.GetActorBase().GetName() == "Unused Slot"
		target = ZZCustomM9
	elseif ZZCustomM10.GetActorBase().GetName() == "Unused Slot"
		target = ZZCustomM10
	elseif ZZCustomF1.GetActorBase().GetName() == "Unused Slot"
		target = ZZCustomF1
	elseif ZZCustomF2.GetActorBase().GetName() == "Unused Slot"
		target = ZZCustomF2
	elseif ZZCustomF3.GetActorBase().GetName() == "Unused Slot"
		target = ZZCustomF3
	elseif ZZCustomF4.GetActorBase().GetName() == "Unused Slot"
		target = ZZCustomF4
	elseif ZZCustomF5.GetActorBase().GetName() == "Unused Slot"
		target = ZZCustomF5
	elseif ZZCustomF6.GetActorBase().GetName() == "Unused Slot"
		target = ZZCustomF6
	elseif ZZCustomF7.GetActorBase().GetName() == "Unused Slot"
		target = ZZCustomF7
	elseif ZZCustomF8.GetActorBase().GetName() == "Unused Slot"
		target = ZZCustomF8
	elseif ZZCustomF9.GetActorBase().GetName() == "Unused Slot"
		target = ZZCustomF9
	elseif ZZCustomF10.GetActorBase().GetName() == "Unused Slot"
		target = ZZCustomF10
	endIf
	return target
endFunction


Race Function Proteus_LoadCharacterRace(String presetName)
	Race presetRace
	if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_Race_" + presetName + ".json"))
		Int JRaceList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_Character_Race_" + presetName + ".json")
		Int jStats = jmap.object()
		String raceForm = jmap.nextKey(JRaceList , "", "")
		Race value = jmap.GetForm(JRaceList, raceForm, none) as Race
		if raceForm == "race"
			presetRace = value
		EndIf
	else
		debug.Notification("Race not found in Proteus system.")
	EndIf
	return presetRace
endFunction


int Function Proteus_LoadSkillsAttributes(String presetName, Actor target, Int option) ;option 0 = switch by player, option 1 = load player spawn

	Int alchemyLevel
	Int alterationLevel
	Int marksmanLevel
	Int blockLevel
	Int conjurationLevel
	Int destructionLevel
	Int enchantingLevel
	Int heavyArmorLevel
	Int illusionLevel
	Int lightArmorLevel
	Int lockpickingLevel
	Int onehandedLevel
	Int pickpocketLevel
	Int restorationLevel 
	Int smithingLevel
	Int sneakLevel
	Int speechcraftLevel
	Int twohandedLevel
	Int healthLevel
	Int staminaLevel
	Int magickaLevel
	Int overallLevel
	Float overallExperience

	if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_Skills_" + presetName + ".json"))
			Int jSkillList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_Character_Skills_" + presetName + ".json")
			Int jSkills = jmap.object()
			String skillForm = jmap.nextKey(jSkillList, "", "")
			Int maxCount = jvalue.Count(jSkillList)
			Int j = 0
			String stat = jmap.nextKey(JSkillList, "", "")
			while j < maxCount
				String value = jmap.GetStr(jSkillList , stat, "")
				if stat == "Alchemy"
					alchemyLevel = value as Int
				elseIf stat == "Alteration"
					alterationLevel = value as Int
				elseIf stat == "Marksman"
					marksmanLevel = value as Int
				elseIf stat == "Block"
					blockLevel = value as Int
				elseIf stat == "Conjuration"
					conjurationLevel = value as Int
				elseIf stat == "Destruction"
					destructionLevel = value as Int
				elseIf stat == "Enchanting"
					enchantingLevel = value as Int
				elseIf stat == "HeavyArmor"
					heavyArmorLevel = value as Int
				elseIf stat == "Illusion"
					illusionLevel = value as Int
				elseIf stat == "LightArmor"
					lightArmorLevel = value as Int
				elseIf stat == "Lockpicking"
					lockpickingLevel = value as Int
				elseIf stat == "OneHanded"
					onehandedLevel = value as Int
				elseIf stat == "PickPocket"
					pickpocketLevel = value as Int
				elseIf stat == "Restoration"
					restorationLevel = value as Int
				elseIf stat == "Smithing"
					smithingLevel = value as Int
				elseIf stat == "Sneak"
					sneakLevel = value as Int
				elseIf stat == "Speechcraft"
					speechcraftLevel = value as Int
				elseIf stat == "Twohanded"
					twohandedLevel = value as Int
				elseIf stat == "Health"
					healthLevel = value as Int
				elseIf stat == "Magicka"
					magickaLevel = value as Int
				elseIf stat == "Stamina"
					staminaLevel = value as Int
				elseIf stat == "Level"
					overallLevel = value as Int
				elseIf stat == "Experience"
					overallExperience = value as Float
                elseif stat == "AlchemyExp"
                    if option == 0
                        ActorValueInfo.GetActorValueInfoByName("Alchemy").SetSkillExperience( value as Float )
                    endIf
                elseIf stat == "AlterationExp"
                    if option == 0
                        ActorValueInfo.GetActorValueInfoByName("Alteration").SetSkillExperience( value as Float )
                    endIf
                elseIf stat == "MarksmanExp"
                    if option == 0
                        ActorValueInfo.GetActorValueInfoByName("Marksman").SetSkillExperience( value as Float )
                    endIf
                elseIf stat == "BlockExp"
                    if option == 0
                        ActorValueInfo.GetActorValueInfoByName("Block").SetSkillExperience( value as Float )
                    endIf
                elseIf stat == "ConjurationExp"
                    if option == 0
                        ActorValueInfo.GetActorValueInfoByName("Conjuration").SetSkillExperience( value as Float )
                    endIf   
                elseIf stat == "DestructionExp"
                    if option == 0
                        ActorValueInfo.GetActorValueInfoByName("Destruction").SetSkillExperience( value as Float )
                    endIf
                elseIf stat == "EnchantingExp"
                    if option == 0
                        ActorValueInfo.GetActorValueInfoByName("Enchanting").SetSkillExperience( value as Float )
                    endIf
                elseIf stat == "HeavyArmorExp"
                    if option == 0
                        ActorValueInfo.GetActorValueInfoByName("HeavyArmor").SetSkillExperience( value as Float )
                    endIf
                elseIf stat == "IllusionExp"
                    if option == 0
                        ActorValueInfo.GetActorValueInfoByName("Illusion").SetSkillExperience( value as Float )
                    endIf               
                elseIf stat == "LightArmorExp"
                    if option == 0
                        ActorValueInfo.GetActorValueInfoByName("LightArmor").SetSkillExperience( value as Float )
                    endIf
                elseIf stat == "LockpickingExp"
                    if option == 0
                        ActorValueInfo.GetActorValueInfoByName("Lockpicking").SetSkillExperience( value as Float )
                    endIf
                elseIf stat == "OneHandedExp"
                    if option == 0
                        ActorValueInfo.GetActorValueInfoByName("oneHanded").SetSkillExperience( value as Float )
                    endIf
                elseIf stat == "PickpocketExp"
                    if option == 0
                        ActorValueInfo.GetActorValueInfoByName("Pickpocket").SetSkillExperience( value as Float )
                    endIf
                elseIf stat == "RestorationExp"
                    if option == 0
                        ActorValueInfo.GetActorValueInfoByName("Restoration").SetSkillExperience( value as Float )
                    endIf
                elseIf stat == "SmithingExp"
                    if option == 0
                        ActorValueInfo.GetActorValueInfoByName("Smithing").SetSkillExperience( value as Float )
                    endIf
                elseIf stat == "SneakExp"
                    if option == 0
                        ActorValueInfo.GetActorValueInfoByName("Sneak").SetSkillExperience( value as Float )
                    endIf
                elseIf stat == "SpeechcraftExp"
                    if option == 0
                        ActorValueInfo.GetActorValueInfoByName("Speechcraft").SetSkillExperience( value as Float )
                    endIf
                elseIf stat == "TwoHandedExp"
                    if option == 0
                        ActorValueInfo.GetActorValueInfoByName("twoHanded").SetSkillExperience( value as Float )
                    endIf
                elseIf stat == "ZPerkPoints"
                    if option == 0
                        Game.SetPerkPoints(value as Int)
                        totalPerkPointsAvailable = value as Int
                    endIf
                endIf
                stat = jmap.nextKey(JSkillList, stat, "")
                j += 1
            endWhile

			;change level and skills / new block added in 4.1.0 to make NPCs load stats correctly as when
			;their level is updated, it resets all of their stats. Must load level first and then set skills / attributes
			if(option == 0)
				;ProteusDLLUtils.SetLevel(target, overallLevel as Int)
				ExecuteCommand("player.setlevel " + overallLevel as Int)
				Game.SetPlayerExperience(overallExperience as Float)
			elseif(option == 1)
				;ProteusDLLUtils.SetLevel(target, overallLevel as Int)
				SetSelectedReference(target)
				ExecuteCommand("setlevel " + overallLevel as Int)
			EndIf
			Target.SetActorValue("Alchemy", alchemyLevel as Int) 
			Target.SetActorValue("Alteration", alterationLevel as Int) 
			Target.SetActorValue("Marksman", marksmanLevel as Int) 
			Target.SetActorValue("Block", blockLevel as Int) 
			Target.SetActorValue("Conjuration", conjurationLevel as Int) 
			Target.SetActorValue("Destruction", destructionLevel as Int) 
			Target.SetActorValue("Enchanting", enchantingLevel as Int) 
			Target.SetActorValue("HeavyArmor", heavyArmorLevel as Int) 
			Target.SetActorValue("Illusion", illusionLevel as Int) 
			Target.SetActorValue("LightArmor", lightArmorLevel as Int) 
			Target.SetActorValue("Lockpicking", lockpickingLevel as Int) 
			Target.SetActorValue("OneHanded", onehandedLevel as Int) 
			Target.SetActorValue("Pickpocket", pickpocketLevel as Int) 
			Target.SetActorValue("Restoration", restorationLevel as Int) 
			Target.SetActorValue("Smithing", smithingLevel as Int) 
			Target.SetActorValue("Sneak", sneakLevel as Int) 
			Target.SetActorValue("Speechcraft", speechcraftLevel as Int) 
			Target.SetActorValue("TwoHanded", twohandedLevel as Int) 
			Target.SetActorValue("Health", healthLevel as Int) 
			Target.SetActorValue("Magicka", magickaLevel as Int) 
			Target.SetActorValue("Stamina", staminaLevel as Int) 

		;CUSTOM SKILLS FRAMEWORK LOAD
		if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_SkillsCustom_" + presetName + ".json"))
			Int jCustomSkillsList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_Character_SkillsCustom_" + presetName + ".json")
			Int jCustomSkillsForms = jmap.object()    
			String jCustomSkillsKey= jmap.nextKey(jCustomSkillsList, "", "")
			maxCount = jvalue.Count(jCustomSkillsList)
			j = 0
			stat = jmap.nextKey(jCustomSkillsList, "", "")
			while j < maxCount
				String value = jmap.GetStr(jCustomSkillsList , stat, "")
				if stat == "glenmorilLevel"
					if(glenmorilPerksActive == TRUE)
						GlobalVariable glenmorilLevel = Game.GetFormFromFile(0x001D62, "Perk-Glenmoril.esp") as GlobalVariable
						glenmorilLevel.SetValue(value as Float)
					endIf
				elseif stat == "VigilantLevel"
					if(vigilantPerksActive == TRUE)
						GlobalVariable VigilantLevel = Game.GetFormFromFile(0x002D64, "Perk-Vigilant.esp") as GlobalVariable
						VigilantLevel.SetValue(value as Float)
					endIf
				elseif stat == "VampirismLevel"
					if(haemophiliaActive == TRUE)
						GlobalVariable vampirismLevel = Game.GetFormFromFile(0x00081C, "Haemophilia.esp") as GlobalVariable
						vampirismLevel.SetValue(value as Float)
					endIf	
				elseif stat == "HandToHandLevel"
					if(handtohandActive == TRUE)
						GlobalVariable handtohandLevel = Game.GetFormFromFile(0x000D61, "Perk-HandToHand.esp") as GlobalVariable
						handtohandLevel.SetValue(value as Float)
					endIf
				elseif stat == "HandToHandPerkPoints"
					if(handtohandActive == TRUE)
						GlobalVariable handtohandPerkPoints = Game.GetFormFromFile(0x000D65, "Perk-HandToHand.esp") as GlobalVariable
						handtohandPerkPoints.SetValue(value as Float)
					endIf
				elseif stat == "UnarmouredDefenseLevel"
					if(unarmouredDefenseActive == TRUE)
						GlobalVariable unarmouredDefenseLevel = Game.GetFormFromFile(0x000D61, "Perk-Unarmoured.esp") as GlobalVariable
						unarmouredDefenseLevel.SetValue(value as Float)
					endIf
				elseif stat == "UnarmouredDefensePerkPoints"
					if(unarmouredDefenseActive == TRUE)
						GlobalVariable unarmouredDefensePerkPoints = Game.GetFormFromFile(0x000D65, "Perk-Unarmoured.esp") as GlobalVariable
						unarmouredDefensePerkPoints.SetValue(value as Float)
					endIf
				elseif stat == "DragonbornCustomPerksLevel"
					if(dragonbornCustomPerkActive == TRUE)
						GlobalVariable DragonbornCustomPerksLevel = Game.GetFormFromFile(0x000800, "DragonbornShoutPerks.esp") as GlobalVariable
						DragonbornCustomPerksLevel.SetValue(value as Float)
					endIf
				elseif stat == "DragonbornCustomPerksPerkPoints"
					if(dragonbornCustomPerkActive == TRUE)
						GlobalVariable DragonbornCustomPerksPerkPoints = Game.GetFormFromFile(0x000802, "DragonbornShoutPerks.esp") as GlobalVariable
						DragonbornCustomPerksPerkPoints.SetValue(value as Float)
					endIf
				elseif stat == "DragonbornCustomPerksSkillProgress"
					if(dragonbornCustomPerkActive == TRUE)
						GlobalVariable DragonbornCustomPerksSkillProgress = Game.GetFormFromFile(0x000801, "DragonbornShoutPerks.esp") as GlobalVariable
						DragonbornCustomPerksSkillProgress.SetValue(value as Float)
					endIf
				elseif stat == "GTSSkillLevel"
					if(gtsActive == TRUE)
						GlobalVariable GTSSkillLevel = Game.GetFormFromFile(0x142200, "GTS.esp") as GlobalVariable
						if GTSSkillLevel != NONE
							GTSSkillLevel.SetValue(value as Float)
						endIf
					endIf
				elseif stat == "GTSSkillProgress"
					if(gtsActive == TRUE)
						GlobalVariable GTSSkillProgress = Game.GetFormFromFile(0x142201, "GTS.esp") as GlobalVariable
						if GTSSkillProgress != NONE
							GTSSkillProgress.SetValue(value as Float)
						endIf
					endIf
				elseif stat == "GTSSkillRatio"
					if(gtsActive == TRUE)
						GlobalVariable GTSSkillRatio = Game.GetFormFromFile(0x142202, "GTS.esp") as GlobalVariable
						if GTSSkillRatio != NONE
							GTSSkillRatio.SetValue(value as Float)
						endIf
					endIf
				elseif stat == "GTSSkillLegendary"
					if(gtsActive == TRUE)
						GlobalVariable GTSSkillLegendary = Game.GetFormFromFile(0x142203, "GTS.esp") as GlobalVariable
						if GTSSkillLegendary != NONE
							GTSSkillLegendary.SetValue(value as Float)
						endIf
					endIf
				elseif stat == "GTSSkillPerkPoints"
					if(gtsActive == TRUE)
						GlobalVariable GTSSkillPerkPoints = Game.GetFormFromFile(0x2352E1, "GTS.esp") as GlobalVariable
						if GTSSkillPerkPoints != NONE
							GTSSkillPerkPoints.SetValue(value as Float)
						endIf
					endIf
				elseif stat == "GTSTotalKills"
					if(gtsActive == TRUE)
						GTSPlugin.SetTotalKills(target, value as Int)
					endIf
				endIf
				stat = jmap.nextKey(jCustomSkillsList, stat, "")
				j += 1
			endWhile
		endIf
		return 1
	else
		return 0 ;failed to import skills and attributes
	endIf
endFunction




function Proteus_SaveSkillsAttributes(String presetName, Actor target)
	Int jSkillList = jvalue.readFromFile("Data/Scripts/Proteus JSON/Proteus_Character_Skills_Template.json")
	Int jSkills = jmap.object()
	Int maxCount = jvalue.Count(jSkillList)
	Int j = 0
	while j < maxCount
		String value
		String stat = jarray.getStr(jSkillList, j, "")
		if j == 0
			value = target.GetBaseActorValue("Alchemy")
		elseIf j == 1
			value = target.GetBaseActorValue("Alteration")
		elseIf j == 2
			value = target.GetBaseActorValue("Marksman")
		elseIf j == 3
			value = target.GetBaseActorValue("Block")
		elseIf j == 4
			value = target.GetBaseActorValue("Conjuration")
		elseIf j == 5
			value = target.GetBaseActorValue("Destruction")
		elseIf j == 6
			value = target.GetBaseActorValue("Enchanting")
		elseIf j == 7
			value = target.GetBaseActorValue("HeavyArmor")
		elseIf j == 8
			value = target.GetBaseActorValue("Illusion")
		elseIf j == 9
			value = target.GetBaseActorValue("LightArmor")
		elseIf j == 10
			value = target.GetBaseActorValue("Lockpicking")
		elseIf j == 11
			value = target.GetBaseActorValue("OneHanded")
		elseIf j == 12
			value = target.GetBaseActorValue("Pickpocket")
		elseIf j == 13
			value = target.GetBaseActorValue("Restoration")
		elseIf j == 14
			value = target.GetBaseActorValue("Smithing")
		elseIf j == 15
			value = target.GetBaseActorValue("Sneak")
		elseIf j == 16
			value = target.GetBaseActorValue("Speechcraft")
		elseIf j == 17
			value = target.GetBaseActorValue("TwoHanded")
		elseIf j == 18
			value = target.GetBaseActorValue("Health")
		elseIf j == 19
			value = target.GetBaseActorValue("Magicka")
		elseIf j == 20
			value = target.GetBaseActorValue("Stamina")
		elseIf j == 21
			value = target.GetLevel()
		elseIf j == 22
			value = target.GetActorBase().GetName()
		elseIf j == 23
			value = Game.GetPlayerExperience()
		elseif j == 24
			value = ActorValueInfo.GetActorValueInfoByName("Alchemy").GetSkillExperience()
		elseIf j == 25
			value = ActorValueInfo.GetActorValueInfoByName("Alteration").GetSkillExperience()
		elseIf j == 26
			value = ActorValueInfo.GetActorValueInfoByName("Marksman").GetSkillExperience()
		elseIf j == 27
			value = ActorValueInfo.GetActorValueInfoByName("Block").GetSkillExperience()
		elseIf j == 28
			value = ActorValueInfo.GetActorValueInfoByName("Conjuration").GetSkillExperience()
		elseIf j == 29
			value = ActorValueInfo.GetActorValueInfoByName("Destruction").GetSkillExperience()
		elseIf j == 30
			value = ActorValueInfo.GetActorValueInfoByName("Enchanting").GetSkillExperience()
		elseIf j == 31
			value = ActorValueInfo.GetActorValueInfoByName("HeavyArmor").GetSkillExperience()
		elseIf j == 32
			value = ActorValueInfo.GetActorValueInfoByName("Illusion").GetSkillExperience()
		elseIf j == 33
			value = ActorValueInfo.GetActorValueInfoByName("LightArmor").GetSkillExperience()
		elseIf j == 34
			value = ActorValueInfo.GetActorValueInfoByName("Lockpicking").GetSkillExperience()
		elseIf j == 35
			value = ActorValueInfo.GetActorValueInfoByName("OneHanded").GetSkillExperience()
		elseIf j == 36
			value = ActorValueInfo.GetActorValueInfoByName("Pickpocket").GetSkillExperience()
		elseIf j == 37
			value = ActorValueInfo.GetActorValueInfoByName("Restoration").GetSkillExperience()
		elseIf j == 38
			value = ActorValueInfo.GetActorValueInfoByName("Smithing").GetSkillExperience()
		elseIf j == 39
			value = ActorValueInfo.GetActorValueInfoByName("Sneak").GetSkillExperience()
		elseIf j == 40
			value = ActorValueInfo.GetActorValueInfoByName("Speechcraft").GetSkillExperience()
		elseIf j == 41
			value = ActorValueInfo.GetActorValueInfoByName("TwoHanded").GetSkillExperience()
		elseIf j == 42
			value = Game.GetPerkPoints()
		endIf
		j += 1
		jmap.SetStr(jSkills, stat, value)
	endWhile
	jvalue.writeToFile(jSkills, JContGlobalPath + "/Proteus/Proteus_Character_Skills_" + presetName + ".json")

	;CUSTOM SKILLS FRAMEWORK SAVE
	Int jCustomSkillsList
    Int jCustomSkillsForms = jmap.object()    
    String jCustomSkillsKey= jmap.nextKey(jCustomSkillsList, "", "")
	if(glenmorilPerksActive == TRUE)
		GlobalVariable glenmorilLevel = Game.GetFormFromFile(0x001D62, "Perk-Glenmoril.esp") as GlobalVariable
		jmap.SetStr(jCustomSkillsForms, "GlenmorilLevel", glenmorilLevel.GetValue())
		jCustomSkillsKey= jmap.nextKey(jCustomSkillsList, jCustomSkillsKey, "")
	endIf
	if(vigilantPerksActive == TRUE)
		GlobalVariable VigilantLevel = Game.GetFormFromFile(0x002D64, "Perk-Vigilant.esp") as GlobalVariable
        jmap.SetStr(jCustomSkillsForms, "VigilantLevel", VigilantLevel.GetValue())
        jCustomSkillsKey= jmap.nextKey(jCustomSkillsList, jCustomSkillsKey, "")
	endIf
	if(haemophiliaActive == TRUE)
		GlobalVariable vampirismLevel = Game.GetFormFromFile(0x00081C, "Haemophilia.esp") as GlobalVariable
		jmap.SetStr(jCustomSkillsForms, "VampirismLevel", vampirismLevel.GetValue())
		jCustomSkillsKey= jmap.nextKey(jCustomSkillsList, jCustomSkillsKey, "")
	endIf	
	if(handtohandActive == TRUE)
		GlobalVariable handtohandLevel = Game.GetFormFromFile(0x000D61, "Perk-HandToHand.esp") as GlobalVariable
		jmap.SetStr(jCustomSkillsForms, "HandToHandLevel", handtohandLevel.GetValue())
		jCustomSkillsKey= jmap.nextKey(jCustomSkillsList, jCustomSkillsKey, "")
		GlobalVariable handtohandPerkPoints = Game.GetFormFromFile(0x000D65, "Perk-HandToHand.esp") as GlobalVariable
		jmap.SetStr(jCustomSkillsForms, "HandToHandPerkPoints", handtohandPerkPoints.GetValue())
		jCustomSkillsKey= jmap.nextKey(jCustomSkillsList, jCustomSkillsKey, "")
	endIf	
	if(unarmouredDefenseActive == TRUE)
		GlobalVariable unarmouredDefenseLevel = Game.GetFormFromFile(0x000D61, "Perk-Unarmoured.esp") as GlobalVariable
		jmap.SetStr(jCustomSkillsForms, "UnarmouredDefenseLevel", unarmouredDefenseLevel.GetValue())
		jCustomSkillsKey= jmap.nextKey(jCustomSkillsList, jCustomSkillsKey, "")
		GlobalVariable unarmouredDefensePerkPoints = Game.GetFormFromFile(0x000D65, "Perk-Unarmoured.esp") as GlobalVariable
		jmap.SetStr(jCustomSkillsForms, "UnarmouredDefensePerkPoints", unarmouredDefensePerkPoints.GetValue())
		jCustomSkillsKey = jmap.nextKey(jCustomSkillsList, jCustomSkillsKey, "")
	endIf	
	if(dragonbornCustomPerkActive == TRUE)
		GlobalVariable DragonbornCustomPerksLevel = Game.GetFormFromFile(0x000800, "DragonbornShoutPerks.esp") as GlobalVariable
		jmap.SetStr(jCustomSkillsForms, "DragonbornCustomPerksLevel", DragonbornCustomPerksLevel.GetValue())
		jCustomSkillsKey= jmap.nextKey(jCustomSkillsList, jCustomSkillsKey, "")
		GlobalVariable DragonbornCustomPerksPerkPoints = Game.GetFormFromFile(0x000802, "DragonbornShoutPerks.esp") as GlobalVariable
		jmap.SetStr(jCustomSkillsForms, "DragonbornCustomPerksPerkPoints", DragonbornCustomPerksPerkPoints.GetValue())
		jCustomSkillsKey = jmap.nextKey(jCustomSkillsList, jCustomSkillsKey, "")
		GlobalVariable DragonbornCustomPerksSkillProgress = Game.GetFormFromFile(0x000801, "DragonbornShoutPerks.esp") as GlobalVariable
		jmap.SetStr(jCustomSkillsForms, "DragonbornCustomPerksSkillProgress", DragonbornCustomPerksSkillProgress.GetValue())
		jCustomSkillsKey = jmap.nextKey(jCustomSkillsList, jCustomSkillsKey, "")
	endIf	
	if(gtsActive == TRUE)
		GlobalVariable GTSSkillLevel = Game.GetFormFromFile(0x142200, "GTS.esp") as GlobalVariable
		GlobalVariable GTSSkillProgress = Game.GetFormFromFile(0x142201, "GTS.esp") as GlobalVariable
		GlobalVariable GTSSkillRatio = Game.GetFormFromFile(0x142202, "GTS.esp") as GlobalVariable
		GlobalVariable GTSSkillLegendary = Game.GetFormFromFile(0x142203, "GTS.esp") as GlobalVariable
		GlobalVariable GTSSkillPerkPoints = Game.GetFormFromFile(0x2352E1, "GTS.esp") as GlobalVariable
		if GTSSkillLevel != NONE
			jmap.SetStr(jCustomSkillsForms, "GTSSkillLevel", GTSSkillLevel.GetValue())
		endIf
		if GTSSkillProgress != NONE
			jmap.SetStr(jCustomSkillsForms, "GTSSkillProgress", GTSSkillProgress.GetValue())
		endIf
		if GTSSkillRatio != NONE
			jmap.SetStr(jCustomSkillsForms, "GTSSkillRatio", GTSSkillRatio.GetValue())
		endIf
		if GTSSkillLegendary != NONE
			jmap.SetStr(jCustomSkillsForms, "GTSSkillLegendary", GTSSkillLegendary.GetValue())
		endIf
		if GTSSkillPerkPoints != NONE
			jmap.SetStr(jCustomSkillsForms, "GTSSkillPerkPoints", GTSSkillPerkPoints.GetValue())
		endIf
		jmap.SetStr(jCustomSkillsForms, "GTSTotalKills", GTSPlugin.GetTotalKills(target))
	endIf
	jvalue.writeToFile(jCustomSkillsForms, JContGlobalPath + "/Proteus/Proteus_Character_SkillsCustom_" + presetName + ".json")
endFunction

function Proteus_SaveSpells(String preset, Actor target)
	Spell[] knownSpells = ProteusDLLUtils.GetAllSpells(player)
	Spell[] favoritedSpells = ProteusDLLUtils.GetAllFavoritedSpells()
	Shout[] knownShouts = ProteusDLLUtils.GetAllShouts(player)
	Utility.Wait(0.1)
	Proteus_ExportJSONShout(preset, knownShouts, knownShouts.Length, "/Proteus/Proteus_Character_Shouts_", 0, 1)
	Proteus_ExportJSONSpell(preset, favoritedSpells, favoritedSpells.Length, "/Proteus/Proteus_Character_FavoritedSpells_", 0, 0)
	Proteus_ExportJSONSpell(preset, knownSpells, knownSpells.Length, "/Proteus/Proteus_Character_Spells_", 0, 1)

	;save equipped spells/shouts
	Int jMapObject = jmap.object()
	Int jMapList
	Int j = 0
	int counter = 0
	bool both = false
	String jMapKey = jmap.nextKey(jMapList, "", "")
	if(target.GetEquippedSpell(0) && target.GetEquippedSpell(1) && target.GetEquippedSpell(0) == target.GetEquippedSpell(1))
		String savedName = target.GetEquippedSpell(0).GetName()
		jmap.SetForm(jMapObject, counter + "_ProteusB_" + savedName, target.GetEquippedSpell(0))
		jMapKey = jmap.nextKey(jMapList, jMapKey, "")
		both = true
	endIf
	if(target.GetEquippedSpell(0) && both == false) ;left hand
		String savedName = target.GetEquippedSpell(0).GetName()
		jmap.SetForm(jMapObject, counter + "_ProteusL_" + savedName, target.GetEquippedSpell(0))
		jMapKey = jmap.nextKey(jMapList, jMapKey, "")
	endIf
	if(target.GetEquippedSpell(1) && both == false) ;right hand
		String savedName = target.GetEquippedSpell(1).GetName()
		jmap.SetForm(jMapObject, counter + "_ProteusR_" + savedName, target.GetEquippedSpell(1))
		jMapKey = jmap.nextKey(jMapList, jMapKey, "")
	endIf
	if(target.GetEquippedSpell(2)) ;other slot
		String savedName = target.GetEquippedSpell(2).GetName()
		jmap.SetForm(jMapObject, counter + "_ProteusV_" + savedName, target.GetEquippedSpell(2))
	endIf
	jvalue.writeToFile(jMapObject, JContGlobalPath + "/Proteus/Proteus_Character_EquippedSpells_" + preset + ".json")
endFunction


function Proteus_ExportJSONPerk(String presetName, Perk[] arrayToSave, Int arrayLength, String jsonPartialPath, int counter, int page)
	Int jMapObject = jmap.object()
	Int jMapList
	Int j = 0
	Int initialCounter = counter
	String jMapKey = jmap.nextKey(jMapList, "", "")
	while j <= 127 && j < arrayLength && (j + initialCounter) < arrayLength && arrayToSave[counter] 
		String savedName = arrayToSave[counter].GetName()
		jmap.SetForm(jMapObject, counter + " " + savedName, arrayToSave[counter])
		j += 1
		counter += 1
		jMapKey = jmap.nextKey(jMapList, jMapKey, "")
	endwhile
	jvalue.writeToFile(jMapObject, JContGlobalPath + jsonPartialPath + page + "_"  + presetName + ".json")
	if(arrayLength > counter && arrayToSave[counter])
		page += 1
		Proteus_ExportJSONPerk(presetName, arrayToSave, arrayLength, jsonPartialPath, counter, page)
	endIf
endFunction

function Proteus_ExportJSONForm(String presetName, Form[] arrayToSave, Int arrayLength, String jsonPartialPath, int counter, int page)
	Int jMapObject = jmap.object()
	Int jMapList
	Int j = 0
	Int initialCounter = counter
	String jMapKey = jmap.nextKey(jMapList, "", "")
	while j <= 127 && j < arrayLength && (j + initialCounter) < arrayLength && arrayToSave[counter] 
		String savedName = arrayToSave[counter].GetName()
		jmap.SetForm(jMapObject, counter + " " + savedName, arrayToSave[counter])
		j += 1
		counter += 1
		jMapKey = jmap.nextKey(jMapList, jMapKey, "")
	endwhile
	if(page == 0)
		jvalue.writeToFile(jMapObject, JContGlobalPath + jsonPartialPath + presetName + ".json")
	else
		jvalue.writeToFile(jMapObject, JContGlobalPath + jsonPartialPath + page + "_"  + presetName + ".json")
	endIf
	if(arrayLength > counter && arrayToSave[counter])
		page += 1
		Proteus_ExportJSONForm(presetName, arrayToSave, arrayLength, jsonPartialPath, counter, page)
	endIf
endFunction

function Proteus_ExportJSONSpell(String presetName, Spell[] arrayToSave, Int arrayLength, String jsonPartialPath, int counter, int page)
	Int jMapObject = jmap.object()
	Int jMapList
	Int j = 0
	Int initialCounter = counter
	String jMapKey = jmap.nextKey(jMapList, "", "")
	while j <= 127 && j < arrayLength && (j + initialCounter) < arrayLength
		if(arrayToSave[counter])
			String savedName = arrayToSave[counter].GetName()
			jmap.SetForm(jMapObject, counter + " " + savedName, arrayToSave[counter])
		endIf
		j += 1
		counter += 1
		jMapKey = jmap.nextKey(jMapList, jMapKey, "")
	endwhile
	if(page == 0)
		jvalue.writeToFile(jMapObject, JContGlobalPath + jsonPartialPath + presetName + ".json")
	else
		jvalue.writeToFile(jMapObject, JContGlobalPath + jsonPartialPath + page + "_"  + presetName + ".json")
	endIf
	if(arrayLength > counter && arrayToSave[counter])
		page += 1
		Proteus_ExportJSONSpell(presetName, arrayToSave, arrayLength, jsonPartialPath, counter, page)
	endIf
endFunction

function Proteus_ExportJSONShout(String presetName, Shout[] arrayToSave, Int arrayLength, String jsonPartialPath, int counter, int page)
	;Debug.Notification("Length Array: " + arrayLength)
	Int jMapObject = jmap.object()
	Int jMapList
	Int j = 0
	Int initialCounter = counter
	String jMapKey = jmap.nextKey(jMapList, "", "")
	while j <= 127 && j < arrayLength && (j + initialCounter) < arrayLength && arrayToSave[counter] 
		String savedName = arrayToSave[counter].GetName()
		jmap.SetForm(jMapObject, counter + " " + savedName, arrayToSave[counter])
		j += 1
		counter += 1
		jMapKey = jmap.nextKey(jMapList, jMapKey, "")
	endwhile
	;Debug.Notification("Counter: " + counter)
	jvalue.writeToFile(jMapObject, JContGlobalPath + jsonPartialPath + page + "_"  + presetName + ".json")
	if(arrayLength > counter && arrayToSave[counter])
		page += 1
		Proteus_ExportJSONShout(presetName, arrayToSave, arrayLength, jsonPartialPath, counter, page)
	endIf
endFunction

function Proteus_ExportJSONFormCount(String presetName, Form[] arrayToSave, Int arrayLength, Int[] arrayToSave2, Int arrayLength2, String jsonPartialPath, int counter, int page)
	;Debug.Notification("Length Array: " + arrayLength)
	Int jMapObject = jmap.object()
	Int jMapList
	Int j = 0
	Int initialCounter = counter
	String jMapKey = jmap.nextKey(jMapList, "", "")
	while j <= 127 && j < arrayLength && (j + initialCounter) < arrayLength && arrayToSave[counter] 
		jMapKey = jmap.nextKey(jMapList, jMapKey, "")
		String savedName = arrayToSave[counter].GetName()
		jmap.SetForm(jMapObject, counter + " " + savedName + " ProteusCount:" + arrayToSave2[counter], arrayToSave[counter])
		j += 1
		counter += 1	
		jMapKey = jmap.nextKey(jMapList, jMapKey, "")
	endwhile
	;Debug.Notification("Counter: " + counter)
	jvalue.writeToFile(jMapObject, JContGlobalPath + jsonPartialPath + page + "_"  + presetName + ".json")
	if(arrayLength > counter && arrayToSave[counter])
		page += 1
		Proteus_ExportJSONFormCount(presetName, arrayToSave, arrayLength, arrayToSave2, arrayLength2, jsonPartialPath, counter, page)
	endIf
endFunction


function Proteus_RemoveSpells(Actor target, int option) ;option 0 = switch characters, option 1 = reset character
	
	;unequip spells before removal
	if(target.GetEquippedItemType(0) == 9)
		Spell leftHand = target.GetEquippedSpell(0)
		target.UnequipSpell(leftHand, 0)
	elseif(target.GetEquippedItemType(0) == 9)
		Spell rightHand = target.GetEquippedSpell(1)
		target.UnequipSpell(rightHand, 1)
	endIf

	if option == 0
		ProteusDLLUtils.RemoveAllSpells(target)
	elseif option == 1
		;remove vanilla spells
		int k = 0
		while k < ZZSpells.GetSize()
			target.RemoveSpell(ZZSpells.GetAt(k) as Spell)
			k+=1
		endWhile
		
		FormList ZZSpellList

		;remove Phenderix Magic World Spells
		if(pmwActive == true)
			ZZSpellList = Game.GetFormFromFile(0x800, "Proteus - Phenderix Magic World Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		EndIf
		ZZSpellList = NONE

		;remove Phenderix Magic Evolved Spells
		if(pmeActive == true)
			ZZSpellList = Game.GetFormFromFile(0x800, "Proteus - Phenderix Magic Evolved Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		EndIf
		ZZSpellList = NONE

		;remove Apocalypse Spells
		if(apocalypseActive == true)
			ZZSpellList = Game.GetFormFromFile(0x800, "Proteus - Apocalypse Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove EDMR spells
		if(edmrActive == true)
			ZZSpellList = Game.GetFormFromFile(0x800, "Proteus - EDM Redux Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove Triumvirate spells
		if(triumActive == true)
			ZZSpellList = Game.GetFormFromFile(0x800, "Proteus - Triumvirate Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove Odin spells
		if(odinActive == true)
			ZZSpellList = Game.GetFormFromFile(0x800, "Proteus - Odin Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove Imperious spells
		if(imperiousActive == true)
			ZZSpellList = Game.GetFormFromFile(0x800, "Proteus - Imperious Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove Aetherius spells
		if(aethActive == true)
			ZZSpellList = Game.GetFormFromFile(0x800, "Proteus - Aetherius Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove Morningstar spells
		if(morningstarActive == true)
			ZZSpellList = Game.GetFormFromFile(0xD63, "Proteus - Morningstar Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove Better Vampire spells
		if(betterVampiresActive == true)
			ZZSpellList = Game.GetFormFromFile(0x801, "Proteus - Better Vampires Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove Bloodlines spells
		if(bloodlinesActive == true)
			ZZSpellList = Game.GetFormFromFile(0x801, "Proteus - Bloodlines Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove Bloodmoon Rising spells
		if(bloodmoonRisingActive == true)
			ZZSpellList = Game.GetFormFromFile(0x801, "Proteus - Bloodmoon Rising Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove Curse of the Vampire spells
		if(curseVampireActive == true)
			ZZSpellList = Game.GetFormFromFile(0x801, "Proteus - Curse of the Vampire Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove Manbeast spells
		if(manbeastActive == true)
			ZZSpellList = Game.GetFormFromFile(0x801, "Proteus - Manbeast Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove Lupine spells
		if(lupineActive == true)
			ZZSpellList = Game.GetFormFromFile(0x801, "Proteus - Lupine Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove Moonlight Tales spells
		if(moonlightTalesActive == true)
			ZZSpellList = Game.GetFormFromFile(0x801, "Proteus - Moonlight Tales Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove Growl spells
		if(growlActive == true)
			ZZSpellList = Game.GetFormFromFile(0x801, "Proteus - Growl Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove Sacrilege spells
		if(sacrilegeActive == true)
			ZZSpellList = Game.GetFormFromFile(0x801, "Proteus - Sacrilege Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove Sacrosanct spells
		if(sacrosanctActive == true)
			ZZSpellList = Game.GetFormFromFile(0x801, "Proteus - Sacrosanct Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove Sanguinaire spells
		if(sanguinaireActive == true)
			ZZSpellList = Game.GetFormFromFile(0x801, "Proteus - Sanguinaire Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove Scion spells
		if(scionActive == true)
			ZZSpellList = Game.GetFormFromFile(0x801, "Proteus - Scion Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove Vampyrium spells
		if(vampyriumActive == true)
			ZZSpellList = Game.GetFormFromFile(0x801, "Proteus - Vampyrium Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove Trua spells
		if(truaActive == true)
			ZZSpellList = Game.GetFormFromFile(0x801, "Proteus - Trua Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove Wintersun spells
		if(wintersunActive == true)
			ZZSpellList = Game.GetFormFromFile(0x801, "Proteus - Wintersun Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove Pilgrim spells
		if(pilgrimActive == true)
			ZZSpellList = Game.GetFormFromFile(0x801, "Proteus - Pilgrim Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove Shadow Spell Package spells
		if(shadowspellsActive == true)
			ZZSpellList = Game.GetFormFromFile(0x800, "Proteus - Shadow Spells Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove Ace Blood Magic spells
		if(acebloodActive == true)
			ZZSpellList = Game.GetFormFromFile(0x800, "Proteus - Ace Blood Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove Mysticism spells
		if(mysticiscmActive == true)
			ZZSpellList = Game.GetFormFromFile(0x800, "Proteus - Mysticism Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove Arcanum spells
		if(arcanumActive == true)
			ZZSpellList = Game.GetFormFromFile(0x800, "Proteus - Arcanum Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove EDM spells
		if(edmActive == true)
			ZZSpellList = Game.GetFormFromFile(0x800, "Proteus - EDM Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove colorful magic spells
		if(colorfulMagicActive == true)
			ZZSpellList = Game.GetFormFromFile(0x901, "Proteus - Colorful Magic Patch.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE

		;remove GTS spells
		if(gtsActive == true)
			ZZSpellList = Game.GetFormFromFile(0x801, gtsPatchName) as FormList
			if ZZSpellList != NONE
				k = 0
				while k < ZZSpellList.GetSize()
					target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
					k+=1
				endWhile
			endIf
		endIf
		ZZSpellList = NONE

		;remove phenderix elements spells
		if(elementsActive == true)
			ZZSpellList = Game.GetFormFromFile(0x2721FC, "Phenderix Elements.esp") as FormList
			k = 0
			while k < ZZSpellList.GetSize()
				target.RemoveSpell(ZZSpellList.GetAt(k) as Spell)
				k+=1
			endWhile
		endIf
		ZZSpellList = NONE
	endIf
endFunction


function Proteus_LoadSpells(String presetName, Actor target)
	int counter = 1
	while(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_Spells_" + counter + "_" + presetName + ".json"))
		Proteus_LoadSpells2(presetName, target, counter)
		counter += 1
	endWhile
	Proteus_LoadEquippedSpell(presetName, target)

	if(target == player)
		Proteus_LoadFavoritedSpells(presetName)
		Proteus_LoadShouts(target, presetName)
	endIf
	
endFunction

Function Proteus_LoadSpells2(String presetName, Actor target, int counter)
    Int JSpellMapList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_Character_Spells_" + counter + "_" + presetName + ".json")
    Int jSpellFormNames = jmap.object()
    String SpellFormKey = jmap.nextKey(JSpellMapList, "", "")
    while SpellFormKey 
        Spell value = jmap.GetForm(JSpellMapList, SpellFormKey, none) as Spell
		if value != NONE
			target.AddSpell(value)
		endIf
        SpellFormKey = jmap.nextKey(JSpellMapList, SpellFormKey, "")
    endwhile
endFunction

Function Proteus_LoadShouts(Actor target, String presetname)
	int counter = 1
	while(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_Shouts_" + counter + "_" + presetName + ".json"))
		Proteus_LoadShouts2(presetName, target, counter)
		counter += 1
	endWhile
endFunction
Function Proteus_LoadShouts2(String presetName, Actor target, int counter)
	Int JItemMapList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_Character_Shouts_" + counter + "_" + presetName + ".json")
	Int jItemFormNames = jmap.object()
	String ItemFormKey = jmap.nextKey(JItemMapList, "", "")
	while ItemFormKey 
		Form value = jmap.GetForm(JItemMapList, ItemFormKey, none) as Form
		if value != NONE
			target.AddShout(value as Shout)
		endIf
		ItemFormKey = jmap.nextKey(JItemMapList, ItemFormKey, "")
	endwhile
endFunction

Function Proteus_LoadFavoritedSpells(String presetname)
	;mark favorite spells (item means spells)
		if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_FavoritedSpells_" +  presetName + ".json"))
			Int JItemMapList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_Character_FavoritedSpells_" +  presetName + ".json")
			Int jItemFormNames = jmap.object()
			String ItemFormKey = jmap.nextKey(JItemMapList, "", "")
			while ItemFormKey 
				Form value = jmap.GetForm(JItemMapList, ItemFormKey, none) as Form
				if value != NONE
					ProteusMarkItemAsFavorite(value)
				endIf
				ItemFormKey = jmap.nextKey(JItemMapList, ItemFormKey, "")
			endwhile
		EndIf
endFunction

Function Proteus_LoadEquippedSpell(String presetName, Actor target)
    Int JSpellMapList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_Character_EquippedSpells_" + presetName + ".json")
    Int jSpellFormNames = jmap.object()
    String SpellFormKey = jmap.nextKey(JSpellMapList, "", "")
    while SpellFormKey 
        Spell value = jmap.GetForm(JSpellMapList, SpellFormKey, none) as Spell
		Int indexL = stringutil.Find(SpellFormKey, "_ProteusL_", 0)
		Int indexR = stringutil.Find(SpellFormKey, "_ProteusR_", 0)
		Int indexV = stringutil.Find(SpellFormKey, "_ProteusV_", 0)
		Int indexB = stringutil.Find(SpellFormKey, "_ProteusB_", 0)
		if indexL > 0
			target.EquipSpell(value, 0)
		elseif indexR > 0
			target.EquipSpell(value, 1)
		elseif indexV > 0
			target.EquipSpell(value, 2)
		elseif indexB > 0
			target.EquipSpell(value, 0)
			target.EquipSpell(value, 1)
		endIF
        SpellFormKey = jmap.nextKey(JSpellMapList, SpellFormKey, "")
    endwhile
endFunction


function Proteus_SaveCharacterAppearance(String name, Actor target)
	;saves appearance of the player character
	Proteus_SavePlayerRace(target, name)

	If CharGen.IsExternalEnabled()
		CharGen.SaveExternalCharacter(name)
	Else
		CharGen.SaveCharacter(name)
	endIf
	if target == player
		CharGen.SavePreset(name)
	endIf
	Proteus_SavePlayerPreset(target, name) ;saves preset name to then load at the start of the game
	ProteusSaveHeadParts(name)
	;create backup jslot as well
	if(ZZBackupAppearanceSave.GetValue() == 1)
		int num1 = ZZNPCAppearanceSaved.GetValue() as Int
		Int num2 = ZZBackupCounter.GetValue() as Int
		String backupName = "ZZProteusBackup" + num1 as String + num2 as String
		If CharGen.IsExternalEnabled()
			CharGen.SaveExternalCharacter(backupName)
		Else
			CharGen.SaveCharacter(backupName)
		endIf
		if target == player
			CharGen.SavePreset(name)
		endIf
		ZZBackupCounter.SetValue(ZZBackupCounter.GetValue() + 1)
	endIf
endFunction



Function Proteus_LoadCharacterAppearance(String presetName, Actor target, Race currentRace, Race presetRace, int option)
	;if(presetName != target.GetActorBase().GetName())
	;	CharGen.DeleteFaceGenData(target.GetActorBase())
	;	CharGen.ClearPreset(target.GetActorBase())
	;endIf
	ColorForm colorHair = target.GetActorBase().GetHairColor()	

	if presetRace == currentRace
		Chargen.LoadCharacterPreset(target, presetName, colorHair) 
		Utility.Wait(0.1) 
		If CharGen.IsExternalEnabled()
			CharGen.LoadExternalCharacter(target, presetRace, presetName)
		Else
			CharGen.LoadCharacter(target,presetRace,presetName)
		EndIf
		Utility.Wait(0.1) 
	else
		target.SetRace(presetRace)
		Utility.Wait(0.1)
		Chargen.LoadCharacterPreset(target, presetName, colorHair) 
		If CharGen.IsExternalEnabled()
			CharGen.LoadExternalCharacter(target, presetRace, presetName)
		Else
			CharGen.LoadCharacter(target,presetRace,presetName)
		EndIf			
		Utility.Wait(0.1)	
		target.SetRace(currentRace)
		Utility.Wait(0.1)
		target.SetRace(presetRace)
		Utility.Wait(0.1)
		Chargen.LoadCharacterPreset(target, presetName, colorHair)
		Utility.Wait(0.1) 
		If CharGen.IsExternalEnabled()
			CharGen.LoadExternalCharacter(target, presetRace, presetName)
		Else
			CharGen.LoadCharacter(target,presetRace,presetName)
		EndIf	
		Utility.Wait(0.1) 
	endIf	
endFunction


;saves the actor's preset name to a ProteusN_M2 file
function Proteus_SaveTargetStrings(Actor targetBackup, String presetName)
	Int jTextList = jvalue.readFromFile("Data/Scripts/Proteus JSON/Proteus_Character_GeneralInfo_Template.json")
	Int jNText = jmap.object()
	Int maxCount = jvalue.Count(jTextList)
	Int j = 0
	while j < maxCount
		String value
		String text = jarray.getStr(jTextList, j, "")
		if j == 0
			value = targetBackup.GetActorBase().GetName()
		elseif j == 1
			value = targetBackup.GetActorBase().GetSex()
		elseif j == 2
			value = targetBackup.GetRace().GetName() as String
		elseif j == 3
			value = targetBackup.GetBaseAV("CarryWeight") as String
		elseif j == 4
			value = player.GetActorBase().GetHairColor().GetColor() as String
		EndIf
		j += 1
		jmap.SetStr(jNText, text, value)
	endWhile
	jvalue.writeToFile(jNText, JContGlobalPath + "/Proteus/Proteus_Character_GeneralInfo_" + presetName + ".json")
endFunction



;option (1 = load appearance preset, 2 = siwtch / spawn characters)
function Proteus_LoadTargetStrings(String presetName, Actor target, int option)
	if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_GeneralInfo_" + presetName + ".json"))
		Int JStringList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_Character_GeneralInfo_" + presetName + ".json")
		Int maxCount = jvalue.Count(JStringList )
		Int jStats = jmap.object()
		Int i = 0
		String text = jmap.nextKey(JStringList, "", "")
		String value
		while i < maxCount
			value = jmap.GetStr(JStringList, text, "")
			if text == "name"
				if(option == 2)  ;set target name to other character name
					target.SetName(value)
					target.GetActorBase().SetName(value)
				endIf
			elseif text == "gender"
				if(value == 0 && target.GetActorBase().GetSex() == 1) ;male
					;SetSex(target, 0) 
					SetSelectedReference(target)
					ExecuteCommand("sexchange")
				Elseif (value == 1 && target.GetActorBase().GetSex() == 0) ;female
					;SetSex(target, 1)
					SetSelectedReference(target)
					ExecuteCommand("sexchange")
				endIf
			elseif text == "race"
			elseif text == "CarryWeight"
				if(option == 2)
					targetCW = value as Float
				endIf
			elseif text == "hairColor"
				Int playerHairColorInt = value as Int
				playerHairColor.SetColor(playerHairColorInt)
			EndIf
			text = jmap.nextKey(JStringList, text, "")
			i += 1
		endWhile
	else
	EndIf
endFunction


function Proteus_SavePlayerRace(Actor target, String presetName)
	Int jRaceList
	Int jRaceForms = jmap.object()
	String raceFormKey = jmap.nextKey(jRaceList, "", "")
	Race value = target.GetRace()
	jmap.SetForm(jRaceForms, "Race", value as form)
	jvalue.writeToFile(jRaceForms, JContGlobalPath + "/Proteus/Proteus_Character_Race_" + presetName + ".json")
endFunction

function Proteus_SavePlayerPreset(Actor target, String presetName)
	Int jPresetList
	Int jPresetMap = jmap.object()
	String presetKey = jmap.nextKey(jPresetList, "", "")
	jmap.SetStr(jPresetMap, "PresetName", presetName)
	presetKey = jmap.nextKey(jPresetList, presetKey, "")
	jmap.SetStr(jPresetMap, "CarryWeight", target.GetBaseAV("CarryWeight"))
	jvalue.writeToFile(jPresetMap, JContGlobalPath + "/Proteus/Proteus_Character_PresetLoaded_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json")
endFunction


function Proteus_SavePerks(String preset)
	Perk[] knownPerks = ProteusDLLUtils.GetAllPerks(player)
	Perk[] visiblePerks = ProteusDLLUtils.GetAllVisiblePerks(player) 
	Proteus_ExportJSONPerk(preset, visiblePerks, visiblePerks.Length, "/Proteus/Proteus_Character_VisiblePerks_", 0, 1)
	Proteus_ExportJSONPerk(preset, knownPerks, knownPerks.Length, "/Proteus/Proteus_Character_Perks_", 0, 1)
EndFunction


function Proteus_RemovePerks(Actor target, int option) ;option 0 = switch characters, option 1 = reset character
	if option == 0
		RemoveAllPerks(target)
	elseif option == 1
		Proteus_RemovePerks_SlowCheckingProcess(target, 1)
	endIf
EndFunction

;option 0 = save perks to JSON file, option = 1 = remove all known perks from player
function Proteus_RemovePerks_SlowCheckingProcess(Actor target, int option)

	;initial setup
	int perkCountTracker = 0
	Form[] allGamePerks = Utility.CreateFormArray(5000)
	int i

	RemovePerksForAllTrees(target)
	
	;add all vanilla vampire and werewolf perks to JMap
	i = 0
	while i < ZZVanillaPerksListVampireWerewolf.GetSize() && ZZVanillaPerksListVampireWerewolf != NONE
		Perk pPerk = ZZVanillaPerksListVampireWerewolf.GetAt(i) as Perk
		if player.HasPerk(pPerk) == TRUE
			allGamePerks[perkCountTracker] = ZZVanillaPerksListVampireWerewolf.GetAt(i)
			perkCountTracker += 1
		endIf
		i+=1
	endWhile

	;check for vampire or werewolf perks added by mods:
	Int targetModIndex
	;check for Project Proteus patch for the mod "Sacrosanct - Vampires of Skyrim" by EnaiSiaion
	if sacrosanctActive == true
		FormList SacrosanctPerks = Game.GetFormFromFile(0x800, "Proteus - Sacrosanct Patch.esp") As FormList 
		i = 0
		while i < SacrosanctPerks.GetSize()
			Perk pPerk = SacrosanctPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf
	;check for Project Proteus patch for the mod "Sacrilege - Minimalistic Vampires of Skyrim" by EnaiSiaion
	if sacrilegeActive == true
		FormList SacrilegePerks = Game.GetFormFromFile(0x800, "Proteus - Sacrilege Patch.esp") As FormList
		i = 0
		while i < SacrilegePerks.GetSize()
			Perk pPerk = SacrilegePerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf
	;check for Project Proteus patch for the mod "Better Vampires" by Brehanin
	if betterVampiresActive == true
		FormList BetterVampiresPerks = Game.GetFormFromFile(0x800, "Proteus - Better Vampires Patch.esp") As FormList
		i = 0
		while i < BetterVampiresPerks.GetSize()
			Perk pPerk = BetterVampiresPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf
	;check for Project Proteus patch for the mod "Scion - A Vampire Overhaul" by SimonMagus616
	if scionActive == true
		FormList ScionPerks = Game.GetFormFromFile(0x800, "Proteus - Scion Patch.esp") As FormList
		i = 0
		while i < ScionPerks.GetSize()
			Perk pPerk = ScionPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf 
	;check for Project Proteus patch for the mod "Growl - Werebeasts of Skyrim" by EnaiSiaion
	if growlActive == true
		FormList GrowlPerks = Game.GetFormFromFile(0x800, "Proteus - Growl Patch.esp") As FormList
		i = 0
		while i < GrowlPerks.GetSize()
			Perk pPerk = GrowlPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf
	;check for Project Proteus patch for the mod "Lupine - Werewolf Perk Expansion" by DomainWolf
	if lupineActive == true
		FormList LupinePerks = Game.GetFormFromFile(0x800, "Proteus - Lupine Patch.esp") As FormList
		i = 0
		while i < LupinePerks.GetSize()
			Perk pPerk = LupinePerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf
	;check for Project Proteus patch for the mod "Manbeast" by SimonMagus616
	if manbeastActive == true
		FormList ManbeastPerks = Game.GetFormFromFile(0x800, "Proteus - Manbeast Patch.esp") As FormList
		i = 0
		while i < ManbeastPerks.GetSize()
			Perk pPerk = ManbeastPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf      
	;check for Project Proteus patch for the mod "Moonlight Tales" by Brevi, AI99, NsJones
	if moonlightTalesActive == true
		FormList MoonlightTalesPerks = Game.GetFormFromFile(0x800, "Proteus - Moonlight Tales Patch.esp") As FormList
		i = 0
		while i < MoonlightTalesPerks.GetSize()
			Perk pPerk = MoonlightTalesPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf 
	;check for Project Proteus patch for the mod "Curse of the Vampire" by TX12001
	if curseVampireActive == true
		FormList CurseOfTheVampirePerks = Game.GetFormFromFile(0x800, "Proteus - Curse of the Vampire Patch.esp") As FormList
		i = 0
		while i < CurseOfTheVampirePerks.GetSize()
			Perk pPerk = CurseOfTheVampirePerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf  
	;check for Project Proteus patch for the mod "Werewolf Perks Expanded" by MichaelDusk.
	if werewolfPerksExpandedActive == true
		FormList WerewolfPerksExpandedPerks = Game.GetFormFromFile(0x800, "Proteus - Werewolf Perks Expanded Patch.esp") As FormList
		i = 0
		while i < WerewolfPerksExpandedPerks.GetSize()
			Perk pPerk = WerewolfPerksExpandedPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf 
	;check for Project Proteus patch for the mod "Bloodmoon Rising" by XeNoN.
	if bloodmoonRisingActive == true
		FormList BloodmoonRisingPerks = Game.GetFormFromFile(0x800, "Proteus - Bloodmoon Rising Patch.esp") As FormList
		i = 0
		while i < BloodmoonRisingPerks.GetSize()
			Perk pPerk = BloodmoonRisingPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf
	;check for Project Proteus patch for the mod "Sanguinaire" by Christopher4684.
	if sanguinaireActive == true
		FormList SanguinairePerksPerks = Game.GetFormFromFile(0x800, "Proteus - Sanguinaire Patch.esp") As FormList
		i = 0
		while i < SanguinairePerksPerks.GetSize()
			Perk pPerk = SanguinairePerksPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf 
	;check for Project Proteus patch for the mod "Wintersun - Faiths of Skyrim" by EnaiSiaion.
	if wintersunActive == true
		FormList WintersunPerksPerks = Game.GetFormFromFile(0x800, "Proteus - Wintersun Patch.esp") As FormList
		i = 0
		while i < WintersunPerksPerks.GetSize()
			Perk pPerk = WintersunPerksPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf 
	;check for Project Proteus patch for the mod "Trua - Minimalistic Faiths of Skyrim" by EnaiSiaion.
	if truaActive == true
		FormList TruaPerksPerks = Game.GetFormFromFile(0x800, "Proteus - Trua Patch.esp") As FormList
		i = 0
		while i < TruaPerksPerks.GetSize()
			Perk pPerk = TruaPerksPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf 
	;check for Project Proteus patch for the mod "Pilgrim - A Religion Overhaul" by SimonMagus616.
	if pilgrimActive == true
		FormList PilgrimPerksPerks = Game.GetFormFromFile(0x800, "Proteus - Pilgrim Patch.esp") As FormList
		i = 0
		while i < PilgrimPerksPerks.GetSize()
			Perk pPerk = PilgrimPerksPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf 
	;check for Project Proteus patch for the mod "Vampyrium-Resurrected (Vampire Overhaul)" by BatStranger.
	if vampyriumActive == true
		FormList VampyriumPerksPerks = Game.GetFormFromFile(0x800, "Proteus - Vampyrium Patch.esp") As FormList
		i = 0
		while i < VampyriumPerksPerks.GetSize()
			Perk pPerk = VampyriumPerksPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf 
	;check for Project Proteus patch for the mod "Bloodlines of Tamriel - A Vampire Overhaul" by EddieTheEagle.
	if bloodlinesActive == true
		FormList BloodlinesPerksPerks = Game.GetFormFromFile(0x800, "Proteus - Bloodlines Patch.esp") As FormList
		i = 0
		while i < BloodlinesPerksPerks.GetSize()
			Perk pPerk = BloodlinesPerksPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf 
	
	;CHECK FOR RACE PERKS
	;check for Project Proteus patch for the mod "Aetherius - A Race Overhaul"
	if aethActive == true
		FormList AethPerks = Game.GetFormFromFile(0x801, "Proteus - Aetherius Patch.esp") As FormList
		i = 0
		while i < AethPerks.GetSize()
			Perk pPerk = AethPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf
	;check for Project Proteus patch for the mod "Morningstar - Minimalistic Races of Skyrim"
	if morningstarActive == true
		FormList MorningstarPerks = Game.GetFormFromFile(0xD62, "Proteus - Morningstar Patch.esp") As FormList
		i = 0
		while i < MorningstarPerks.GetSize()
			Perk pPerk = MorningstarPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf
	;check for Project Proteus patch for the mod "Imperious - Races of Skyrim"
	if imperiousActive == true
		FormList ImperiousPerks = Game.GetFormFromFile(0x801, "Proteus - Imperious Patch.esp") As FormList
		i = 0
		while i < ImperiousPerks.GetSize()
			Perk pPerk = ImperiousPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf
	;check for Project Proteus patch for the mod "Mysticism - A Magic Overhaul"
	if mysticiscmActive == true
		FormList MystPerks = Game.GetFormFromFile(0x803, "Proteus - Mysticism Patch.esp") As FormList
		i = 0
		while i < MystPerks.GetSize()
			Perk pPerk = MystPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf
	;check for Project Proteus patch for the mod "Shadow Spell Package"
	if shadowspellsActive == true
		FormList ShadowPerks = Game.GetFormFromFile(0x802, "Proteus - Shadow Spells Patch.esp") As FormList
		i = 0
		while i < ShadowPerks.GetSize()
			Perk pPerk = ShadowPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf
	;check for Project Proteus patch for the mod "Arcanum"
	if arcanumActive == true
		FormList ArcanumPerks = Game.GetFormFromFile(0x803, "Proteus - Arcanum Patch.esp") As FormList
		i = 0
		while i < ArcanumPerks.GetSize()
			Perk pPerk = ArcanumPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf
	;check for Project Proteus patch for the mod "Elemental Destruction Magic"
	if edmActive == true
		FormList EDMPerks = Game.GetFormFromFile(0x801, "Proteus - EDM Patch.esp") As FormList
		i = 0
		while i < EDMPerks.GetSize()
			Perk pPerk = EDMPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf
	;check for Project Proteus patch for the mod "Colorful Magic"
	if colorfulMagicActive == true
		FormList colorfulMagicPerks = Game.GetFormFromFile(0x900, "Proteus - Colorful Magic Patch.esp") As FormList
		i = 0
		while i < colorfulMagicPerks.GetSize()
			Perk pPerk = colorfulMagicPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf
	;CHECK FOR CUSTOM SKILL FRAMEWORK CUSTOM NEW PERK TREES
	;check for Project Proteus patch for the mod "Custom Skills - VIGILANT" by Vicn.
	if vigilantPerksActive == true
		FormList VigilantPerks = Game.GetFormFromFile(0x800, "Proteus - Vigilant Patch.esp") As FormList
		i = 0
		while i < VigilantPerks.GetSize()
			Perk pPerk = VigilantPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf
	;check for Project Proteus patch for the mod "Custom Skills - GLENMORIL" by Vicn.
	if glenmorilPerksActive == true
		FormList GlenmorilPerks = Game.GetFormFromFile(0x800, "Proteus - Glenmoril Patch.esp") As FormList
		i = 0
		while i < GlenmorilPerks.GetSize()
			Perk pPerk = GlenmorilPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf
	;check for Project Proteus patch for the mod "Haemophilia" by SeaSparrow.
	if haemophiliaActive == true
		FormList HaemophiliaPerks = Game.GetFormFromFile(0x002F99, "Proteus - Haemophilia Patch.esp") As FormList
		i = 0
		while i < HaemophiliaPerks.GetSize()
			Perk pPerk = HaemophiliaPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf
	;check for Project Proteus patch for the mod "Custom Skills - Hand to Hand" by Vicn.
	if handtohandActive == true
		FormList HandToHandPerks = Game.GetFormFromFile(0x800, "Proteus - HandToHand Patch.esp") As FormList
		i = 0
		while i < HandToHandPerks.GetSize()
			Perk pPerk = HandToHandPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf
	;check for Project Proteus patch for the mod "Custom Skills - Unarmoured Defense" by Vicn.
	if unarmouredDefenseActive == true
		FormList UnarmouredDefensePerks = Game.GetFormFromFile(0xD61, "Proteus - UnarmouredDefense Patch.esp") As FormList
		i = 0
		while i < UnarmouredDefensePerks.GetSize()
			Perk pPerk = UnarmouredDefensePerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf
	;check for Project Proteus patch for the mod "Dragonborn - Shouts Perk Tree" by DeltaRider.
	if dragonbornCustomPerkActive == true
		FormList DragonbornCustomPerks = Game.GetFormFromFile(0x800, "Proteus - Dragonborn Custom Perk Patch.esp") As FormList
		i = 0
		while i < DragonbornCustomPerks.GetSize()
			Perk pPerk = DragonbornCustomPerks.GetAt(i) as Perk
			if player.HasPerk(pPerk) == TRUE
				allGamePerks[perkCountTracker] = pPerk
				perkCountTracker += 1
			endIf
			i+=1
		endWhile
	endIf
	;GTS custom perks
	if gtsActive == true
		FormList GTSCustomPerks = Game.GetFormFromFile(0x800, gtsPatchName) As FormList
		if GTSCustomPerks != NONE
			i = 0
			while i < GTSCustomPerks.GetSize()
				Perk pPerk = GTSCustomPerks.GetAt(i) as Perk
				if player.HasPerk(pPerk) == TRUE
					allGamePerks[perkCountTracker] = pPerk
					perkCountTracker += 1
				endIf
				i+=1
			endWhile
		endIf
	endIf
	;remove player known perks from player
	if(option == 1)
		i = 0
		while i < allGamePerks.length && allGamePerks[i] != NONE
			Perk pPerk = allGamePerks[i] as Perk
			String perkName = pPerk.GetName()
			if target.HasPerk(pPerk) == TRUE
				target.RemovePerk(pPerk)
			endIf
			i+=1
		endWhile
	EndIf   
EndFunction


Function Proteus_LoadPerks(String presetName, Actor target)
	int counter = 1
	while(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_Perks_" + counter + "_" + presetName + ".json"))
		Proteus_LoadPerks2(presetName, target, counter)
		counter += 1
	endWhile
endFunction

Function Proteus_LoadPerks2(String presetName, Actor target, int counter)
		Int JPerkMapList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_Character_Perks_" + counter + "_" + presetName + ".json")
		Int jPerkFormNames = jmap.object()
		String perkFormKey = jmap.nextKey(JPerkMapList, "", "")
		while perkFormKey 
			Perk value = jmap.GetForm(JPerkMapList, perkFormKey, none) as Perk
			if value != NONE
				target.AddPerk(value)
			endIf
			perkFormKey = jmap.nextKey(JPerkMapList, perkFormKey, "")
		endwhile
endFunction

Function Proteus_LoadPerksVisible(String presetName, Actor target)
	int counter = 1
	while(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_VisiblePerks_" + counter + "_" + presetName + ".json"))
		Proteus_LoadPerksVisible2(presetName, target, counter)
		counter += 1
	endWhile
endFunction

Function Proteus_LoadPerksVisible2(String presetName, Actor target, int counter)
		Int JPerkMapList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_Character_VisiblePerks_" + counter + "_" + presetName + ".json")
		Int jPerkFormNames = jmap.object()
		String perkFormKey = jmap.nextKey(JPerkMapList, "", "")
		while perkFormKey 
			Perk value = jmap.GetForm(JPerkMapList, perkFormKey, none) as Perk
			target.AddPerk(value)
			perkFormKey = jmap.nextKey(JPerkMapList, perkFormKey, "")
		endwhile
endFunction


Function Proteus_SaveAllItems(String preset, Actor target, Bool saveUnequipped)
    ;variable setup for saving all items into 3 different JSON files (unequipped, equipped, favorites)
    Form[] favoritedItems = ProteusDLLUtils.GetAllFavoritedItems()
    Form[] allItems = ProteusAddAllItemsToArray(target, false, false, true)
    Form[] unequippedItems = Utility.CreateFormArray(5000)
	Form[] equippedItems = Utility.CreateFormArray(100)
    Int[] unequippedItemsCount = Utility.CreateIntArray(5000)
	Int[] equippedItemsCount = Utility.CreateIntArray(100)
    Int favCount = 0
	Int setupEquippedCounter = 0
	Int setupUnequippedCounter = 0

	;get count unequipped items and record favorited unequipped items
	int e = 0
	while e < allItems.Length
		if(player.IsEquipped(allItems[e]))
			equippedItems[setupEquippedCounter] = allitems[e]
			equippedItemsCount[setupEquippedCounter] = target.GetItemCount(allitems[e])
			setupEquippedCounter+=1
		else
			unequippedItems[setupUnequippedCounter] = allitems[e]
			unequippedItemsCount[setupUnequippedCounter] = target.GetItemCount(allitems[e])
			setupUnequippedCounter+=1
		endIf
		e+=1
	endWhile    

	if(saveUnequipped == True)
        Proteus_ExportJSONFormCount(preset, unequippedItems, setupUnequippedCounter, unequippedItemsCount, setupUnequippedCounter, "/Proteus/Proteus_Character_UnequippedItems_", 0, 1)
    endIf

    EquipSlot EitherHand = Game.GetForm(0x00013F44) As EquipSlot
    EquipSlot RightHand = Game.GetForm(0x00013F42) As EquipSlot
    EquipSlot LeftHand = Game.GetForm(0x00013F43) As EquipSlot
    EquipSlot BothHands = Game.GetForm(0x00013F45) As EquipSlot
    Form leftHandWeapon
    Form rightHandWeapon
    Bool left = false
    Bool right = false
    Bool continue = true
	Int equippedCountTracker = 0

    if(target.GetEquippedWeapon(true)) ;get left hand weapon
		leftHandWeapon = target.GetEquippedWeapon(true)
        left = true
    endIf
    if(target.GetEquippedWeapon(false)) ;get right hand weapon
		rightHandWeapon = target.GetEquippedWeapon(false)
        right = true
    endIf

	Form[] equippedTemp = new Form[100]
	String ItemFormKeyEq = jmap.nextKey(jItemFormListEq, "", "")
	Int jItemFormNamesEq = jmap.object()
    Int jItemFormListEq
    Int itemType
    Int j = 0
	Int equippedTempCount = 0
	Bool leftSelected = false
	Bool rightSelected = false

    while j < setupEquippedCounter && equippedItems[j] != NONE
		if(continue == true && (equippedItems[j].GetType() == 41)) ;is this a weapon? 41 is weapon type
			if(left == true && right == true) ;a weapon is equipped in both hands or one weapon is equipped by both hands
				if(leftHandWeapon == equippedItems[j] && rightHandWeapon == equippedItems[j]) ;is two handed weapon equipped?
					equippedTemp[equippedTempCount] = equippedItems[j]
					equippedTempCount += 1
					jmap.SetForm(jItemFormNamesEq , equippedCountTracker + " " + equippedItems[j].GetName() + "_ProteusCount" + equippedItemsCount[j] + "_ProteusHand" + "B" , equippedItems[j] as Form)
					continue = false
					equippedCountTracker +=1
					leftSelected = true
					rightSelected = true
					ItemFormKeyEq = jmap.nextKey(jItemFormListEq, ItemFormKeyEq, "")
				elseif(leftHandWeapon == equippedItems[j] && leftSelected == false)  ;is left handed or either handed weapon equipped?
					equippedTemp[equippedTempCount] = equippedItems[j]
					equippedTempCount += 1
					jmap.SetForm(jItemFormNamesEq , equippedCountTracker + " " + equippedItems[j].GetName() + "_ProteusCount" + equippedItemsCount[j] + "_ProteusHand" + "L" , equippedItems[j] as Form)
					equippedCountTracker +=1
					leftSelected = true
					ItemFormKeyEq = jmap.nextKey(jItemFormListEq, ItemFormKeyEq, "")
				elseif(rightHandWeapon == equippedItems[j] && rightSelected == false)  ;is right handed or either handed weapon equipped?
					equippedTemp[equippedTempCount] = equippedItems[j]
					equippedTempCount += 1
					jmap.SetForm(jItemFormNamesEq , equippedCountTracker + " " + equippedItems[j].GetName() + "_ProteusCount" + equippedItemsCount[j] + "_ProteusHand" + "R" , equippedItems[j] as Form)
					equippedCountTracker +=1
					rightSelected = true
					ItemFormKeyEq = jmap.nextKey(jItemFormListEq, ItemFormKeyEq, "")
				endIf
			elseif(left == true)
				if(leftHandWeapon == equippedItems[j] && leftSelected == false)  ;is left handed or either handed weapon equipped?
					equippedTemp[equippedTempCount] = equippedItems[j]
					equippedTempCount += 1
					jmap.SetForm(jItemFormNamesEq , equippedCountTracker + " " + equippedItems[j].GetName() + "_ProteusCount" + equippedItemsCount[j] + "_ProteusHand" + "L" , equippedItems[j] as Form)
					equippedCountTracker +=1
					leftSelected = true
					ItemFormKeyEq = jmap.nextKey(jItemFormListEq, ItemFormKeyEq, "")
				endIf
			elseif(right == true)
				if(rightHandWeapon == equippedItems[j] && rightSelected == false)  ;is right handed or either handed weapon equipped?
					equippedTemp[equippedTempCount] = equippedItems[j]
					equippedTempCount += 1
					jmap.SetForm(jItemFormNamesEq , equippedCountTracker + " " + equippedItems[j].GetName() + "_ProteusCount" + equippedItemsCount[j] + "_ProteusHand" + "R" , equippedItems[j] as Form)
					equippedCountTracker +=1
					rightSelected = true
					ItemFormKeyEq = jmap.nextKey(jItemFormListEq, ItemFormKeyEq, "")
				endIf
			endIf
		else ;not an equipped weapon
			;check to see if already in map, some items use more than one slot
			int y = 0
			bool saveForm = true
			while y < equippedTemp.Length && equippedTemp[y] != NONE
				if(equippedTemp[y] == equippedItems[j])
					saveForm = false
				endIf
				y += 1
			endWhile
			if saveForm == true
				equippedTemp[equippedTempCount] = equippedItems[j]
				equippedTempCount += 1
				jmap.SetForm(jItemFormNamesEq , equippedCountTracker + " " + equippedItems[j].GetName() + "_ProteusCount" + equippedItemsCount[j] + "_ProteusHand" + "N" , equippedItems[j] as Form)
				equippedCountTracker +=1
				ItemFormKeyEq = jmap.nextKey(jItemFormListEq, ItemFormKeyEq, "")
			endIf
        endIf
        j+=1    
    endwhile

	;save equipped items JSON
    jvalue.writeToFile(jItemFormNamesEq, JContGlobalPath + "/Proteus/Proteus_Character_EquippedItems_" +  preset + ".json")
    ;save favorited items JSON
	Proteus_ExportJSONForm(preset, favoritedItems, favoritedItems.Length, "/Proteus/Proteus_Character_FavoritedItems_", 0, 0)
endFunction



Function Proteus_AddEquippedItemsSpawn(String preset, Actor target)
	if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_EquippedItems_" +  preset + ".json"))
		Int JItemMapList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_Character_EquippedItems_" +  preset + ".json")
		Int jItemFormNames = jmap.object()
		String ItemFormKey = jmap.nextKey(JItemMapList, "", "")
		String itemName

		;reset outfits of spawns
		if target == ZZCustomF1
			ZZProteusOutfitSpawnLI1.Revert()
		elseif target == ZZCustomF2
			ZZProteusOutfitSpawnLI2.Revert()
		elseif target == ZZCustomF3
			ZZProteusOutfitSpawnLI3.Revert()
		elseif target == ZZCustomF4
			ZZProteusOutfitSpawnLI4.Revert()
		elseif target == ZZCustomF5
			ZZProteusOutfitSpawnLI5.Revert()
		elseif target == ZZCustomF6
			ZZProteusOutfitSpawnLI6.Revert()
		elseif target == ZZCustomF7
			ZZProteusOutfitSpawnLI7.Revert()
		elseif target == ZZCustomF8
			ZZProteusOutfitSpawnLI8.Revert()
		elseif target == ZZCustomF9
			ZZProteusOutfitSpawnLI9.Revert()
		elseif target == ZZCustomF10
			ZZProteusOutfitSpawnLI10.Revert()
		elseif target == ZZCustomM1
			ZZProteusOutfitSpawnLI11.Revert()
		elseif target == ZZCustomM2
			ZZProteusOutfitSpawnLI12.Revert()
		elseif target == ZZCustomM3
			ZZProteusOutfitSpawnLI13.Revert()
		elseif target == ZZCustomM4
			ZZProteusOutfitSpawnLI14.Revert()
		elseif target == ZZCustomM5
			ZZProteusOutfitSpawnLI15.Revert()
		elseif target == ZZCustomM6
			ZZProteusOutfitSpawnLI16.Revert()
		elseif target == ZZCustomM7
			ZZProteusOutfitSpawnLI17.Revert()
		elseif target == ZZCustomM8
			ZZProteusOutfitSpawnLI18.Revert()
		elseif target == ZZCustomM9
			ZZProteusOutfitSpawnLI19.Revert()
		elseif target == ZZCustomM10
			ZZProteusOutfitSpawnLI20.Revert()
		elseif target == hostilePlayerCharacter
			ZZProteusOutfitSpawnLIEvil.Revert()
		endIf
		Utility.Wait(0.1)

		;add items in equipped items json to appropriate leveled list and add and equip to target
		while ItemFormKey 
			Form value = jmap.GetForm(JItemMapList, ItemFormKey, none) as Form
			target.AddItem(value)
			target.EquipItem(value)
			if target == ZZCustomF1
				ZZProteusOutfitSpawnLI1.AddForm(value, 1, 1)
			elseif target == ZZCustomF2
				ZZProteusOutfitSpawnLI2.AddForm(value, 1, 1)
			elseif target == ZZCustomF3
				ZZProteusOutfitSpawnLI3.AddForm(value, 1, 1)
			elseif target == ZZCustomF4
				ZZProteusOutfitSpawnLI4.AddForm(value, 1, 1)
			elseif target == ZZCustomF5
				ZZProteusOutfitSpawnLI5.AddForm(value, 1, 1)
			elseif target == ZZCustomF6
				ZZProteusOutfitSpawnLI6.AddForm(value, 1, 1)
			elseif target == ZZCustomF7
				ZZProteusOutfitSpawnLI7.AddForm(value, 1, 1)
			elseif target == ZZCustomF8
				ZZProteusOutfitSpawnLI8.AddForm(value, 1, 1)
			elseif target == ZZCustomF9
				ZZProteusOutfitSpawnLI9.AddForm(value, 1, 1)
			elseif target == ZZCustomF10
				ZZProteusOutfitSpawnLI10.AddForm(value, 1, 1)
			elseif target == ZZCustomM1
				ZZProteusOutfitSpawnLI11.AddForm(value, 1, 1)
			elseif target == ZZCustomM2
				ZZProteusOutfitSpawnLI12.AddForm(value, 1, 1)
			elseif target == ZZCustomM3
				ZZProteusOutfitSpawnLI13.AddForm(value, 1, 1)
			elseif target == ZZCustomM4
				ZZProteusOutfitSpawnLI14.AddForm(value, 1, 1)
			elseif target == ZZCustomM5
				ZZProteusOutfitSpawnLI15.AddForm(value, 1, 1)
			elseif target == ZZCustomM6
				ZZProteusOutfitSpawnLI16.AddForm(value, 1, 1)
			elseif target == ZZCustomM7
				ZZProteusOutfitSpawnLI17.AddForm(value, 1, 1)
			elseif target == ZZCustomM8
				ZZProteusOutfitSpawnLI18.AddForm(value, 1, 1)
			elseif target == ZZCustomM9
				ZZProteusOutfitSpawnLI19.AddForm(value, 1, 1)
			elseif target == ZZCustomM10
				ZZProteusOutfitSpawnLI20.AddForm(value, 1, 1)
			elseif target == hostilePlayerCharacter
				ZZProteusOutfitSpawnLIEvil.AddForm(value, 1, 1)
			endIf
			ItemFormKey = jmap.nextKey(JItemMapList, ItemFormKey, "")
		endwhile
		Utility.Wait(0.1)


		;set outfit of NPC, using the newly generated leveled item list from above
		Proteus_LoadSpawnOutfit(target)
	EndIf
EndFunction


Function Proteus_EquipItems(String preset, Actor target)
	if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_EquippedItems_" +  preset + ".json"))
		Int JItemMapList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_Character_EquippedItems_" +  preset + ".json")
		Int jItemFormNames = jmap.object()
		String ItemFormKey = jmap.nextKey(JItemMapList, "", "")
		Form itemWeaponLoaded

		while ItemFormKey 
			Form value = jmap.GetForm(JItemMapList, ItemFormKey, none) as Form
			;Find Item Count
			Int index1 = stringutil.Find(ItemFormKey, "ProteusCount", 0)
			Int index2 = stringutil.Find(ItemFormKey, "_ProteusHand", 0)
			String s1 = stringutil.Substring(ItemFormKey, index1+12, index2-index1)
			Int valueType = value.GetType()
			String substringTest = StringUtil.Substring(ItemFormKey, StringUtil.GetLength(ItemFormKey) - 1, 1)
			if(valueType == 41)
				if(substringTest == "L")
					if(cgoActive == false)
						target.EquipItemEx(value, 2, false, true)
					else
						target.EquipItem(value)
					endIf
				elseif(substringTest == "R")
					if(cgoActive == false)
						target.EquipItemEx(value, 1, false, true)
					else
						target.EquipItem(value)
					endIf
				elseif(substringTest == "B")
					if(cgoActive == false)
						target.EquipItemEx(value, 1, false, true)
						target.EquipItemEx(value, 2, false, true)
					else
						target.EquipItem(value)
					endIf
				EndIf
			else
				target.EquipItem(value, false, true)	
			EndIf
			ItemFormKey = jmap.nextKey(JItemMapList, ItemFormKey, "")
		endwhile
	endIf
EndFunction




Function Proteus_LoadItems(String presetName, Actor target)
	ObjectReference storageContainerUnequipped = Proteus_LoadUnequippedContainerFunction(presetName)
	if(storageContainerUnequipped != NONE && storageContainerUnequipped.GetDisplayname() == presetName)
		Proteus_RemoveAllItems(storageContainerUnequipped, target)
	else
		int counter = 1
		while(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_UnequippedItems_" + counter + "_" + presetName + ".json"))
			Proteus_LoadItems2(presetName, target, counter)
			counter += 1
		endWhile
		
		if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_EquippedItems_"  + presetName + ".json"))
			Proteus_LoadItems3(presetName, target, 1)
		endIf
	endIf
EndFunction

Function Proteus_LoadItems2(String presetName, Actor target, int counter)
    Int JItemMapList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_Character_UnequippedItems_" + counter + "_" + presetName + ".json")
    Int jItemFormNames = jmap.object()
    String ItemFormKey = jmap.nextKey(JItemMapList, "", "")
    while ItemFormKey 
        Form value = jmap.GetForm(JItemMapList, ItemFormKey, none) as Form
        int amount = StringUtil.Substring(ItemFormKey, StringUtil.Find(ItemFormKey, "ProteusCount") + 13) as Int
		if value != NONE
			target.AddItem(value, amount, true)
		endIf
        ItemFormKey = jmap.nextKey(JItemMapList, ItemFormKey, "")
    endwhile
EndFunction

Function Proteus_LoadItems3(String presetName, Actor target, int counter)
    Int JItemMapList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_Character_EquippedItems_" + presetName + ".json")
    Int jItemFormNames = jmap.object()
    String ItemFormKey = jmap.nextKey(JItemMapList, "", "")
    while ItemFormKey 
        Form value = jmap.GetForm(JItemMapList, ItemFormKey, none) as Form
        int amount = StringUtil.Substring(ItemFormKey, StringUtil.Find(ItemFormKey, "ProteusCount") + 12, StringUtil.Find(ItemFormKey, "_ProteusHand")) as Int
		target.AddItem(value, amount, true)
		while(player.GetItemCount(value) < 0)
		endWhile
		if StringUtil.Find(ItemFormKey, "ProteusHandL", 0) > 0
			if(cgoActive == false)
				target.EquipItemEx(value, 2, false, true)
			else
				target.EquipItem(value)
			endIf
		elseif StringUtil.Find(ItemFormKey, "ProteusHandR", 0) > 0
			if(cgoActive == false)
				target.EquipItemEx(value, 1, false, true)
			else
				target.EquipItem(value)
			endIf
		elseif StringUtil.Find(ItemFormKey, "ProteusHandB", 0) > 0
			if(cgoActive == false)
				target.EquipItem(value)
			else
				target.EquipItemEx(value, 1, false, true)
				target.EquipItemEx(value, 2, false, true)
			endIf

		else
			if(target.IsEquipped(value))
			else
				target.EquipItem(value, false, true)	
			endIf
		endIf
        ItemFormKey = jmap.nextKey(JItemMapList, ItemFormKey, "")
    endwhile
EndFunction


Function Proteus_LoadItemsPiecemeal(String presetName, Actor target)
	int counter = 1
	while(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_UnequippedItems_" + counter + "_" + presetName + ".json"))
		Proteus_LoadItems2(presetName, target, 1)
		counter += 1
	endWhile
	
	if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_EquippedItems_"  + presetName + ".json"))
		Proteus_LoadItems3(presetName, target, 1)
	endIf
EndFunction

function Proteus_PlayerResistanceFunction(Actor gTarget)
	string[] stringArray = new String[8]
	stringArray[0] = " Resist Fire"
	stringArray[1] = " Resist Frost"
	stringArray[2] = " Resist Shock"
	stringArray[3] = " Resist Poison"
	stringArray[4] = " Resist Disease"
	stringArray[5] = " Stat Summary"
	stringArray[6] = " [Back]"
	stringArray[7] = " [Exit Menu]"

	UIListMenu listMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
	if listMenu
		int n = 8
		int i = 0
		while i < n
			listMenu.AddEntryItem(stringArray[i])
			i += 1
		endwhile
	EndIf

	listMenu.OpenMenu()
	int result = listMenu.GetResultInt()

	if result == 0
		Proteus_PlayerResistanceModifyFunction("fireResist", gTarget)
	elseIf result == 1
		Proteus_PlayerResistanceModifyFunction("frostResist", gTarget)
	elseIf result == 2
		Proteus_PlayerResistanceModifyFunction("ElectricResist", gTarget)
	elseIf result == 3
		Proteus_PlayerResistanceModifyFunction("poisonResist", gTarget)
	elseIf result == 4
		Proteus_PlayerResistanceModifyFunction("diseaseResist", gTarget)
	elseIf result == 5
		Proteus_PlayerSkillSummaryFunction(gTarget)
		Proteus_PlayerResistanceFunction(gTarget)
	elseIf result == 6
		ProteusPlayerMainMenu2()
	elseIf result == 7
	endIf
endFunction


function Proteus_PlayerSkillSummaryFunction(Actor gTarget)
	UIStatsMenu statsMenu = UIExtensions.GetMenu("UIStatsMenu") as UIStatsMenu
	statsMenu.OpenMenu(gTarget)
endFunction



function Proteus_PlayerResistanceModifyFunction(String S, Actor gTarget)
	Float currentAttributeValue = gTarget.GetBaseAV(S)

    string[] stringArray
    stringArray= new String[8]
	stringArray[0] = "[Current " + S + ": " + Proteus_Round(currentAttributeValue, 2) +"]"
    stringArray[1] = " -25% Resistance"
    stringArray[2] = " -5% Resistance"
    stringArray[3] = " +5% Resistance"
    stringArray[4] = " +25% Resistance"
    stringArray[5] = " Maximum Resistance"
    stringArray[6] = " [Back]"
    stringArray[7] = " [Exit Menu]"

    UIListMenu listMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    if listMenu
        int n = 8
        int i = 0
        while i < n
            listMenu.AddEntryItem(stringArray[i])
            i += 1
        endwhile
    EndIf

    listMenu.OpenMenu()
    int result = listMenu.GetResultInt()

    If result == 0
		Proteus_PlayerResistanceModifyFunction(S, gTarget)
	elseif result == 1
        gTarget.SetActorValue(S, gTarget.GetBaseAV(S) - 25)
        Proteus_PlayerResistanceModifyFunction(S, gTarget)
    elseIf result == 2
        gTarget.SetActorValue(S, gTarget.GetBaseAV(S) - 5)
        Proteus_PlayerResistanceModifyFunction(S, gTarget)
    elseIf result == 3
        gTarget.SetActorValue(S, gTarget.GetBaseAV(S) + 5)
        If gTarget.GetBaseAV(S) > 100
            debug.Notification("Resistance cannot be greater than 100. Set to 100.")
            gTarget.SetActorValue(S, 100)
        endIf
        Proteus_PlayerResistanceModifyFunction(S, gTarget)
    elseIf result == 4
        gTarget.SetActorValue(S, gTarget.GetBaseAV(S) + 25)
        If gTarget.GetBaseAV(S) > 100
            debug.Notification("Resistance cannot be greater than 100. Set to 100.")
            gTarget.SetActorValue(S, 100)
        endIf
        Proteus_PlayerResistanceModifyFunction(S, gTarget)
    elseIf result == 5
        gTarget.SetActorValue(S, 100)
        Proteus_PlayerResistanceModifyFunction(S, gTarget)
    elseIf result == 6
        Proteus_PlayerResistanceFunction(gTarget)
    endIf
endFunction




Function Proteus_PlayerIdleAnimationFunction(Actor gTarget)
	string[] stringArray
	stringArray= new String[23]
	stringArray[0] = " Bow"
	stringArray[1] = " Bow Head"
	stringArray[2] = " Blow Horn"
	stringArray[3] = " Clean Sword"
	stringArray[4] = " Crossed Arms"
	stringArray[5] = " Drink"
	stringArray[6] = " Examine"
	stringArray[7] = " Get Attention"
	stringArray[8] = " Injured"
	stringArray[9] = " Kneeling"
	stringArray[10] = " Lay Down"
	stringArray[11] = " Look Far"
	stringArray[12] = " Meditate"
	stringArray[13] = " Read Book"
	stringArray[14] = " Read Note"
	stringArray[15] = " Salute"
	stringArray[16] = " Search Body"
	stringArray[17] = " Study"
	stringArray[18] = " Surrender"
	stringArray[19] = " Wave"
	stringArray[20] = " Welcome"
	stringArray[21] = " [Back]"
	stringArray[22] = " [Exit Menu]"

	UIListMenu listMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
	if listMenu
		int n = 23
		int i = 0
		while i < n
			listMenu.AddEntryItem(stringArray[i])
			i += 1
		endwhile
	EndIf

	listMenu.OpenMenu()
	int result = listMenu.GetResultInt()

	if result == 0
		Debug.SendAnimationEvent(gTarget,"IdleSilentBow")
	elseIf result == 1
		Debug.SendAnimationEvent(gTarget,"idlebowheadatgrave_01")
	elseIf result == 2
		Debug.SendAnimationEvent(gTarget,"idleblowhornimperial")
	elseIf result == 3
		Debug.SendAnimationEvent(gTarget,"idlecleansword")
	elseIf result == 4
		Debug.SendAnimationEvent(gTarget,"idleoffsetarmscrossedstart")
	elseIf result == 5
		Debug.SendAnimationEvent(gTarget,"IdleDrink")
	elseIf result == 6
		Debug.SendAnimationEvent(gTarget,"idleexamine")
	elseIf result == 7
		Debug.SendAnimationEvent(gTarget,"IdleGetAttention")
	elseIf result == 8
		Debug.SendAnimationEvent(gTarget,"IdleInjured")
	elseIf result == 9
		Debug.SendAnimationEvent(gTarget,"IdleKneeling")
	elseIf result == 10
		Debug.SendAnimationEvent(gTarget,"IdleLayDownEnter")
	elseIf result == 11
		Debug.SendAnimationEvent(gTarget,"IdleLookFar")
	elseIf result == 12
		Debug.SendAnimationEvent(gTarget,"IdleGreybeardMeditate")
	elseIf result == 13
		Debug.SendAnimationEvent(gTarget,"idlebook_reading ")
	elseIf result == 14
		Debug.SendAnimationEvent(gTarget,"IdleNoteRead")
	elseIf result == 15
		Debug.SendAnimationEvent(gTarget,"IdleSalute")
	elseIf result == 16
		Debug.SendAnimationEvent(gTarget,"IdleSearchBody")
	elseIf result == 17
		Debug.SendAnimationEvent(gTarget,"IdleStudy")
	elseIf result == 18
		Debug.SendAnimationEvent(gTarget,"IdleSurrender")
	elseIf result == 19
		Debug.SendAnimationEvent(gTarget,"IdleWave")
	elseIf result == 20
		Debug.SendAnimationEvent(gTarget,"IdleWelcomeGesture")
	elseIf result == 21
		Proteus_PlayerMainMenu()
	elseIf result == 22
	endIf
EndFunction


function Proteus_PlayerSkillsFunction(Actor gTarget)
	string[] stringArray
	stringArray= new String[21]
	stringArray[0] = " Alchemy"
	stringArray[1] = " Alteration"
	stringArray[2] = " Archery"
	stringArray[3] = " Block"
	stringArray[4] = " Conjuration"
	stringArray[5] = " Destruction"
	stringArray[6] = " Enchanting"
	stringArray[7] = " Heavy Armor"
	stringArray[8] = " Illusion"
	stringArray[9] = " Light Armor"
	stringArray[10] = " Lockpicking"
	stringArray[11] = " One-Handed"
	stringArray[12] = " Pickpocket"
	stringArray[13] = " Restoration"
	stringArray[14] = " Smithing"
	stringArray[15] = " Sneak"
	stringArray[16] = " Speech"
	stringArray[17] = " Two-Handed"
	stringArray[18] = " Stat Summary"
	stringArray[19] = " [Back]"
	stringArray[20] = " [Exit Menu]"

	UIListMenu listMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
	if listMenu
		int n = 21
		int i = 0
		while i < n
			listMenu.AddEntryItem(stringArray[i])
			i += 1
		endwhile
	EndIf

	listMenu.OpenMenu()
	int result = listMenu.GetResultInt()

	if result == 0
		Proteus_PlayerSkillModify("alchemy", gTarget)
	elseIf result == 1
		Proteus_PlayerSkillModify("alteration", gTarget)
	elseIf result == 2
		Proteus_PlayerSkillModify("Marksman", gTarget)
	elseIf result == 3
		Proteus_PlayerSkillModify("block", gTarget)
	elseIf result == 4
		Proteus_PlayerSkillModify("conjuration", gTarget)
	elseIf result == 5
		Proteus_PlayerSkillModify("destruction", gTarget)
	elseIf result == 6
		Proteus_PlayerSkillModify("enchanting", gTarget)
	elseIf result == 7
		Proteus_PlayerSkillModify("heavyArmor", gTarget)
	elseIf result == 8
		Proteus_PlayerSkillModify("illusion", gTarget)
	elseIf result == 9
		Proteus_PlayerSkillModify("lightArmor", gTarget)
	elseIf result == 10
		Proteus_PlayerSkillModify("lockpicking", gTarget)
	elseIf result == 11
		Proteus_PlayerSkillModify("oneHanded", gTarget)
	elseIf result == 12
		Proteus_PlayerSkillModify("pickpocket", gTarget)
	elseIf result == 13
		Proteus_PlayerSkillModify("restoration", gTarget)
	elseIf result == 14
		Proteus_PlayerSkillModify("smithing", gTarget)
	elseIf result == 15
		Proteus_PlayerSkillModify("sneak", gTarget)
	elseIf result == 16
		Proteus_PlayerSkillModify("Speechcraft", gTarget)
	elseIf result == 17
		Proteus_PlayerSkillModify("twoHanded", gTarget)
	elseIf result == 18
		Proteus_PlayerSkillSummaryFunction(gTarget)
		Proteus_PlayerSkillsFunction(gTarget)
	elseIf result == 19
		ProteusPlayerMainMenu2()
	elseIf result == 20
	endIf
EndFunction

int function Proteus_PlayerSizeScaleFunction(Actor gTarget)
	Float size = gTarget.GetScale()

	string[] stringArray
	stringArray= new String[9]
	stringArray[0] = "[Current Size: " + Proteus_Round(size , 2) +"]"
	stringArray[1] = " -0.5 Size"
	stringArray[2] = " -0.1 Size"
	stringArray[3] = " +0.1 Size"
	stringArray[4] = " +0.5 Size"
	stringArray[5] = " Reset Size to 1"
	stringArray[6] = " Custom Size"
	stringArray[7] = " [Back]"
	stringArray[8] = " [Exit Menu]"

	UIListMenu listMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
	if listMenu
		int n = 9
		int i = 0
		while i < n
			listMenu.AddEntryItem(stringArray[i])
			i += 1
		endwhile
	EndIf

	listMenu.OpenMenu()
	int result = listMenu.GetResultInt()

	if result == 0
		Proteus_PlayerSizeScaleFunction(gTarget)
	elseif result == 1
		gTarget.SetScale(size - 0.5)
		Proteus_PlayerSizeScaleFunction(gTarget)
	elseIf result == 2
		gTarget.SetScale(size - 0.1)
		Proteus_PlayerSizeScaleFunction(gTarget)
	elseIf result == 3
		gTarget.SetScale(size + 0.1)
		Proteus_PlayerSizeScaleFunction(gTarget)
	elseIf result == 4
		gTarget.SetScale(size + 0.5)
		Proteus_PlayerSizeScaleFunction(gTarget)
	elseIf result == 5
		gTarget.SetScale(1 as Float)
		Proteus_PlayerSizeScaleFunction(gTarget)
	elseIf result == 6
		String customSizeValue = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Custom Size: \nBase value is 1. Enter small adjustments like 0.99 or 1.01.", "")
		if (customSizeValue as Float) > 0 
			Float newAttributeValue = customSizeValue as Float
			gTarget.SetScale(newAttributeValue)
			Proteus_PlayerSizeScaleFunction(gTarget)
		else
			Debug.Notification("Invalid scale size entered. Try again")
			Proteus_PlayerSizeScaleFunction(gTarget)
		endIf
	elseIf result == 7
		ProteusPlayerMainMenu2()
	endIf
endFunction

function Proteus_PlayerAttributeModifyFunction(String S, Actor gTarget)

	Float currentAttributeValue = gTarget.GetBaseAV(S)

	string[] stringArray = new String[10]
	stringArray[0] = "[Current " + S + ": " + Proteus_Round(currentAttributeValue, 0) +"]"
	stringArray[1] = " -100 " + S
	stringArray[2] = " -50 "  + S
	stringArray[3] = " -10 "  + S
	stringArray[4] = " +10 "  + S
	stringArray[5] = " +50 "  + S
	stringArray[6] = " +100 "  + S
	stringArray[7] = " Custom Value"
	stringArray[8] = " [Back]"
	stringArray[9] = " [Exit Menu]"

	UIListMenu listMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
	if listMenu
		int n = 10
		int i = 0
		while i < n
			listMenu.AddEntryItem(stringArray[i])
			i += 1
		endwhile
	EndIf

	listMenu.OpenMenu()
	int result = listMenu.GetResultInt()


	if result == 0
		Proteus_PlayerAttributeModifyFunction(S, gTarget)
	elseif result == 1
		Float newAttributeValue = currentAttributeValue - 100
		if(newAttributeValue < 0)
			Debug.Notification(S + " cannot be lower than 1. Set to 1.")
			newAttributeValue = 1
		else
		endIf
		gTarget.SetActorValue(S, newAttributeValue)
		Proteus_PlayerAttributeModifyFunction(S, gTarget)
	elseIf result == 2
		Float newAttributeValue = currentAttributeValue - 50
		if(newAttributeValue < 0)
			Debug.Notification(S + " cannot be lower than 1. Set to 1.")
			newAttributeValue = 1
		else
		endIf
		gTarget.SetActorValue(S, newAttributeValue)
		Proteus_PlayerAttributeModifyFunction(S, gTarget)
	elseIf result == 3
		Float newAttributeValue = currentAttributeValue - 10
		if(newAttributeValue < 0)
			Debug.Notification(S + " cannot be lower than 1. Set to 1.")
			newAttributeValue = 1
		else
		endIf
		gTarget.SetActorValue(S, newAttributeValue)
		Proteus_PlayerAttributeModifyFunction(S, gTarget)
	elseIf result == 4
		Float newAttributeValue = currentAttributeValue + 10
		gTarget.SetActorValue(S, newAttributeValue)
		Proteus_PlayerAttributeModifyFunction(S, gTarget)
	elseIf result == 5
		Float newAttributeValue = currentAttributeValue + 50
		gTarget.SetActorValue(S, newAttributeValue)
		Proteus_PlayerAttributeModifyFunction(S, gTarget)
	elseIf result == 6
		Float newAttributeValue = currentAttributeValue + 100
		gTarget.SetActorValue(S, newAttributeValue)
		Proteus_PlayerAttributeModifyFunction(S, gTarget)
	elseIf result == 7
		String customAttributeValue = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput(S +" value:", "")
		if (customAttributeValue as Int) > 0 
			Float newAttributeValue = customAttributeValue as Float
			gTarget.SetActorValue(S, newAttributeValue)
			Proteus_PlayerAttributeModifyFunction(S, gTarget)
		else
			Debug.Notification("Invalid skill level entered. Try again")
			Proteus_PlayerAttributeModifyFunction(S, gTarget)
		endIf
	elseIf result == 8
		Proteus_PlayerAttributesFunction(gTarget)
	elseIf result == 9
	endIf
endFunction

int function Proteus_PlayerAttributesFunction(Actor gTarget)
	
	string[] stringArray = new String[13]
	stringArray[0] = " Health"
	stringArray[1] = " Stamina"
	stringArray[2] = " Magicka"
	stringArray[3] = " Regen Rate: Health"
	stringArray[4] = " Regen Rate: Stamina"
	stringArray[5] = " Regen Rate: Magicka"
	stringArray[6] = " Carry Weight"
	stringArray[7] = " Movement Speed"
	stringArray[8] = " Unarmed Damage"
	stringArray[9] = " Divine Restoration"
	stringArray[10] = " Stat Summary"
	stringArray[11] = " [Back]"
	stringArray[12] = " [Exit Menu]"

	UIListMenu listMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
	if listMenu
		int n = 13
		int i = 0
		while i < n
			listMenu.AddEntryItem(stringArray[i])
			i += 1
		endwhile
	EndIf

	listMenu.OpenMenu()
	int result = listMenu.GetResultInt()

	if result == 0
		Proteus_PlayerAttributeModifyFunction("health", gTarget)
	elseIf result == 1
		Proteus_PlayerAttributeModifyFunction("stamina", gTarget)
	elseIf result == 2
		Proteus_PlayerAttributeModifyFunction("magicka", gTarget)
	elseIf result == 3
		Proteus_PlayerAttributeRegenModify("healRate", gTarget)
	elseIf result == 4
		Proteus_PlayerAttributeRegenModify("staminaRate", gTarget)
	elseIf result == 5
		Proteus_PlayerAttributeRegenModify("magickaRate", gTarget)
	elseIf result == 6
		Proteus_PlayerAttributeModifyFunction("carryWeight", gTarget)
	elseif result == 7
		Proteus_PlayerAttributeModifyFunction("speedmult", gTarget)
	elseif result == 8 
		Proteus_PlayerAttributeModifyFunction("UnarmedDamage", gTarget)
	elseIf result == 9
		gTarget.RestoreAV("Health", 1000000 as Float)
		gTarget.RestoreAV("Stamina", 1000000 as Float)
		gTarget.RestoreAV("Magicka", 1000000 as Float)
		Debug.Notification(gTarget.GetActorBase().GetName() + " Health, Magicka, Stamina fully restored.")
		Proteus_PlayerAttributesFunction(gTarget)
	elseIf result == 10
		Proteus_PlayerSkillSummaryFunction(gTarget)
		Proteus_PlayerAttributesFunction(gTarget)
	elseIf result == 11
		ProteusPlayerMainMenu2()
	elseIf result == 12
		return 0 ;close out of menus	
	endIf
endFunction

function Proteus_PlayerSkillModify(String S, Actor gTarget)
	Float currentSkillValue = gTarget.GetBaseAV(S)
	
	string[] stringArray
	stringArray= new String[10]
	stringArray[0] = "[Current " + S + ": " + Proteus_Round(currentSkillValue, 0) +"]"
	stringArray[1] = " -10 Skill Level"
	stringArray[2] = " -5 Skill Level"
	stringArray[3] = " -1 Skill Level"
	stringArray[4] = " +1 Skill Level"
	stringArray[5] = " +5 Skill Level"
	stringArray[6] = " +10 Skill Level"
	stringArray[7] = " Custom Value"
	stringArray[8] = " [Back]"
	stringArray[9] = " [Exit Menu]"

	UIListMenu listMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
	if listMenu
		int n = 10
		int i = 0
		while i < n
			listMenu.AddEntryItem(stringArray[i])
			i += 1
		endwhile
	EndIf

    listMenu.OpenMenu()
    int result = listMenu.GetResultInt()

    if result == 0
		Proteus_PlayerSkillModify(S, gTarget)
	elseif result == 1
        Float newSkillValue = currentSkillValue - 10
        if newSkillValue < 0
            debug.Notification("Skill level cannot be lower than 0. Set to 0.")
            gTarget.SetActorValue(S, 0)
        else
            gTarget.SetActorValue(S, newSkillValue)
        endIf
        Proteus_PlayerSkillModify(S, gTarget)
    elseif result == 2
        Float newSkillValue = currentSkillValue - 5
        if newSkillValue < 0
            debug.Notification("Skill level cannot be lower than 0. Set to 0.")
            gTarget.SetActorValue(S, 0)
        else
            gTarget.SetActorValue(S, newSkillValue)
        endIf
        Proteus_PlayerSkillModify(S, gTarget)
    elseIf result == 3
        Float newSkillValue = currentSkillValue - 1
        if newSkillValue < 0
            debug.Notification("Skill level cannot be lower than 0. Set to 0.")
            gTarget.SetActorValue(S, 0)
        else
            gTarget.SetActorValue(S, newSkillValue)
        endIf
        Proteus_PlayerSkillModify(S, gTarget)
    elseIf result == 4
        Float newSkillValue = currentSkillValue +1
        gTarget.SetActorValue(S, newSkillValue)
        Proteus_PlayerSkillModify(S, gTarget)
    elseIf result == 5
        Float newSkillValue = currentSkillValue +5
        gTarget.SetActorValue(S, newSkillValue)
        Proteus_PlayerSkillModify(S, gTarget)
    elseIf result == 6
        Float newSkillValue = currentSkillValue +10
        gTarget.SetActorValue(S, newSkillValue)
        Proteus_PlayerSkillModify(S, gTarget)
    elseIf result == 7
        String customSkillValue = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Skill Level:", "")
        if (customSkillValue as Int) > 0 
            Float newSkillValue = customSkillValue as Float
            gTarget.SetActorValue(S, newSkillValue)
            Proteus_PlayerSkillModify(S, gTarget)
        else
            Debug.Notification("Invalid skill level entered. Try again")
            Proteus_PlayerSkillModify(S, gTarget)
        endIf
    elseIf result == 8
        Proteus_PlayerSkillsFunction(gTarget)
    endIf
endFunction

function Proteus_PlayerAttributeRegenModify(String S, Actor gTarget)

	Float currentAttributeValue = gTarget.GetBaseAV(S)

	string[] stringArray = new String[12]
	stringArray[0] = "[Current " + S + ": " + Proteus_Round(currentAttributeValue, 2) +"]"
	stringArray[1] = " -5 " + S
	stringArray[2] = " -2 " + S
	stringArray[3] = " -0.5 " + S
	stringArray[4] = " -0.1 " + S
	stringArray[5] = " +0.1 " + S
	stringArray[6] = " +0.5 "+ S
	stringArray[7] = " +2 "+ S
	stringArray[8] = " +5 " + S
	stringArray[9] = " Custom Value"
	stringArray[10] = " [Back]"
	stringArray[11] = " [Exit Menu]"

	UIListMenu listMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
	if listMenu
		int n = 12
		int i = 0
		while i < n
			listMenu.AddEntryItem(stringArray[i])
			i += 1
		endwhile
	EndIf

	listMenu.OpenMenu()
	int result = listMenu.GetResultInt()

    if result == 0
		Proteus_PlayerAttributeRegenModify(S, gTarget)
	elseif result == 1
        gTarget.SetActorValue(S, currentAttributeValue - 5)
        if gTarget.GetBaseAV(S) < 1 as Float
            debug.Notification("Rate cannot be lower than 0. Set to 0.")
            Float amountChange = 0 as Float - gTarget.GetBaseAV(S)
            gTarget.SetActorValue(S, 0)
        endIf
        Proteus_PlayerAttributeRegenModify(S, gTarget)
    elseif result == 2
        gTarget.SetActorValue(S, currentAttributeValue - 2)
        if gTarget.GetBaseAV(S) < 1 as Float
            debug.Notification("Rate cannot be lower than 0. Set to 0.")
            Float amountChange = 0 as Float - gTarget.GetBaseAV(S)
            gTarget.SetActorValue(S, 0)
        endIf
        Proteus_PlayerAttributeRegenModify(S, gTarget)
    elseIf result == 3
        gTarget.SetActorValue(S, currentAttributeValue - 0.5)
        if gTarget.GetBaseAV(S) < 1 as Float
            debug.Notification("Rate cannot be lower than 0. Set to 0.")
            Float amountchange = 0 as Float - gTarget.GetBaseAV(S)
            gTarget.SetActorValue(S, 0)
        endIf
        Proteus_PlayerAttributeRegenModify(S, gTarget)
    elseIf result == 4
        gTarget.SetActorValue(S, currentAttributeValue - 0.1)
        if gTarget.GetBaseAV(S) < 0 as Float
            debug.Notification("Rate cannot be lower than 0. Set to 0.")
            Float amountchange = 0 as Float - gTarget.GetBaseAV(S)
            gTarget.SetActorValue(S, 0)
        endIf
        Proteus_PlayerAttributeRegenModify(S, gTarget)
    elseIf result == 5
        gTarget.SetActorValue(S, currentAttributeValue + 0.1)
        Proteus_PlayerAttributeRegenModify(S, gTarget)
    elseIf result == 6
        gTarget.SetActorValue(S, currentAttributeValue + 0.5)
        Proteus_PlayerAttributeRegenModify(S, gTarget)
    elseIf result == 7
        gTarget.SetActorValue(S, currentAttributeValue + 2)
        Proteus_PlayerAttributeRegenModify(S, gTarget)
    elseIf result == 8
        gTarget.SetActorValue(S, currentAttributeValue + 5)
        Proteus_PlayerAttributeRegenModify(S, gTarget)
	elseIf result == 9
		String customRegenValue = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput(S + " value:", "")
		if (customRegenValue as Int) > 0 
			Float newRegenValue = customRegenValue as Float
			gTarget.SetActorValue(S, newRegenValue)
			Proteus_PlayerAttributeRegenModify(S, gTarget)
		else
			Debug.Notification("Invalid value entered. Try again")
			Proteus_PlayerAttributeRegenModify(S, gTarget)
		endIf
    elseIf result == 10
        Proteus_PlayerAttributesFunction(gTarget)
    elseIf result == 11
    endIf
endFunction




;saves the actor form id to ProteusN_M1 file (only needed if NPC preset to be used across all saved game characters/playthroughs
function Proteus_JSave_NPCForms(Actor targetName, String processedNPCName, String presetName)
	Int jNPCFormList
	if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_NPC_List_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json"))
		jNPCFormList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_NPC_List_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json")
	endIf

	Int jNFormNames = jmap.object()
	String NPCFormKey = jmap.nextKey(jNPCFormList, "", "")
	Bool insertNewNPC = true
	int i = 0
	Form value
	while NPCFormKey
		value = jmap.GetForm(jNPCFormList,NPCFormKey, none)
		if value == targetName
			insertNewNPC = false
			jmap.SetForm(jNFormNames, i + "_ProteusNPC_" + processedNPCName, value)
		else
			jmap.SetForm(jNFormNames, NPCFormKey, value)
		endIf
		i+=1
		NPCFormKey = jmap.nextKey(jNPCFormList, NPCFormKey, "")
	endWhile
	if insertNewNPC == true
		jmap.SetForm(jNFormNames, i + "_ProteusNPC_" + processedNPCName, targetName as form)
	endIf

	jvalue.writeToFile(jNFormNames, JContGlobalPath + "/Proteus/Proteus_NPC_List_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json")

	Proteus_JSave_NPCPresetNames(targetName, processedNPCName, presetName)
endFunction


;saves the actor's preset name to a ProteusN_M2 file, also saves combat style
function Proteus_JSave_NPCPresetNames(Actor targetName, String processedNPCName, String presetName)
	
	combatStyleNum = 0 ;by default combat style is warrior, can change using NPC Module
	
	Int jNPCList = jvalue.readFromFile("Data/Scripts/Proteus JSON/Proteus_NPC_GeneralInfo_Template.json")
	Int jNStats = jmap.object()
	Int maxCount = jvalue.Count(jNPCList)
	Int j = 0
	String value
	String stat
	while j < maxCount
		stat = jarray.getStr(jNPCList, j, "")
		if j == 0
			value = presetName
		elseif j == 1
			value = combatStyleNum
		EndIf
		j += 1
		jmap.SetStr(jNStats, stat, value)
	endWhile
	jvalue.writeToFile(jNStats, JContGlobalPath + "/Proteus/Proteus_NPC_GeneralInfo_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + "_" + processedNPCName + ".json")
endFunction

function Proteus_PlayerPiecemealSaveFunction(Actor target)
	Proteus_LockEnable()
	characterSavingName = target.GetActorBase().GetName()
	
	string[] stringArray = new String[8]
	stringArray[0] = " Save Skills & Attributes"
	stringArray[1] = " Save Perks"
	stringArray[2] = " Save Spells"
	stringArray[3] = " Save Appearance"
	stringArray[4] = " Save Appearance & Equipped Items"
	stringArray[5] = " Save Inventory"
	stringArray[6] = " [Back]"
	stringArray[7] = " [Exit Menu]"

	UIListMenu listMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
	if listMenu
		int n = 8
		int i = 0
		while i < n
			listMenu.AddEntryItem(stringArray[i])
			i += 1
		endwhile
	EndIf

	listMenu.OpenMenu()
	int result = listMenu.GetResultInt()

	if result == 0 ;save skills/attributes/stats
		String presetName = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Save player character's stats as:", "")
		Int lengthPresetName = StringUtil.GetLength(presetName as String)
		if (lengthPresetName > 0)	
			Proteus_SaveSkillsAttributes(presetName, target)
			Utility.Wait(0.1)
			Debug.Notification(characterSavingName + " stats saved.")
		else
			Debug.Notification("Invalid preset name entered. Try again.")
		endIf
	elseif result == 1 ;save perks
		String presetName = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Save player character's perks as:", "")
		Int lengthPresetName = StringUtil.GetLength(presetName as String)
		if (lengthPresetName > 0)	
			Proteus_SavePerks(presetName)
			Utility.Wait(0.1)
			Debug.Notification(characterSavingName + " perks saved.")
		else
			Debug.Notification("Invalid preset name entered. Try again.")
		endIf
	elseif result == 2 ;save spells
		String presetName = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Save player character's spells as:", "")
		Int lengthPresetName = StringUtil.GetLength(presetName as String)
		if (lengthPresetName > 0)	
			Proteus_SaveSpells(presetName, target)
			Utility.Wait(0.1)
			Debug.Notification(characterSavingName + " spells saved.")
		else
			Debug.Notification("Invalid preset name entered. Try again.")
		endIf
	elseif result == 3 ;save appearance
		String presetName = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Save player character appearance preset as:", "")
		Int lengthPresetName = StringUtil.GetLength(presetName as String)
		String playerName = player.GetActorBase().GetName()
		if lengthPresetName > 0
			Proteus_SaveTargetStrings(player, presetName)
			Proteus_SaveCharacterAppearance(presetName, player) ;save appearance of target's character (including race)
			SaveAppearancePresetJSON(player.GetActorBase().GetName(), presetName)
			Proteus_SaveGlobalVariables(playerName)
			Utility.Wait(0.1)
			Debug.Notification(characterSavingName + " appearance saved.")
		else
			Debug.Notification("Invalid preset name entered. Try again.")
		endIf
	elseif result == 4 ;save appearance and equipped items
		String presetName = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Save player character appearance preset as:", "")
		Int lengthPresetName = StringUtil.GetLength(presetName as String)
		String playerName = player.GetActorBase().GetName()
		if lengthPresetName > 0
			Proteus_SaveTargetStrings(player, presetName)
			Proteus_SaveCharacterAppearance(presetName, player) ;save appearance of target's character (including race)
			SaveAppearancePresetJSON(player.GetActorBase().GetName(), presetName)
			Proteus_SaveGlobalVariables(playerName)
			Proteus_SaveAllItems(presetName, player, false)
			Utility.Wait(0.1)
			Debug.Notification(characterSavingName + " appearance & equipped items saved.")
		else
			Debug.Notification("Invalid preset name entered. Try again.")
		endIf
	elseif result == 5 ;save inventory
		String presetName = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Save player character's inventory as:", "")
		Int lengthPresetName = StringUtil.GetLength(presetName as String)
		if (lengthPresetName > 0)	
			Proteus_SaveAllItems(presetName, player, true)
			Utility.Wait(0.1)
			Debug.Notification(characterSavingName + " inventory saved.")
		else
			Debug.Notification("Invalid preset name entered. Try again.")
		endIf
	elseif result == 6 ;back
		Proteus_PlayerMainMenu()
	elseif result == 7 ;exit
	endIf

	Proteus_LockDisable()

endFunction



function Proteus_PlayerPiecemealLoadFunction(Actor target)
	Proteus_LockEnable()
	characterSavingName = target.GetActorBase().GetName()

	string[] stringArray = new String[8]
	stringArray[0] = " Load Skills & Attributes"
	stringArray[1] = " Load Perks"
	stringArray[2] = " Load Spells"
	stringArray[3] = " Load Appearance"
	stringArray[4] = " Load Appearance & Equipped Items"
	StringArray[5] = " Add Inventory Items"
	stringArray[6] = " [Back]"
	stringArray[7] = " [Exit Menu]"

	UIListMenu listMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
	if listMenu
		int n = 8
		int i = 0
		while i < n
			listMenu.AddEntryItem(stringArray[i])
			i += 1
		endwhile
	EndIf

	listMenu.OpenMenu()
	int result = listMenu.GetResultInt()

	if result == 0 ;load skills/attributes/stats
		String presetName = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Load which player character's stats?", "")
		Int lengthPresetName = StringUtil.GetLength(presetName as String)
		if (lengthPresetName > 0)	
			Proteus_LoadSkillsAttributes(presetName, target, 0)
			Debug.Notification(presetName + " stats loaded.")
		else
			Debug.Notification("Invalid preset name entered. Try again.")
		endIf
	elseif result == 1 ;load perks
		String presetName = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Load which player character's perks?", "")
		Int lengthPresetName = StringUtil.GetLength(presetName as String)
		if (lengthPresetName > 0)	
			Proteus_RemovePerks(player, 0)
			Proteus_LoadPerks(presetName, target)
			Game.SetPerkPoints(totalPerkPointsAvailable) 
			Debug.Notification(presetName + " perks loaded.")
		else
			Debug.Notification("Invalid preset name entered. Try again.")
		endIf
	elseif result == 2 ;load spells
		String presetName = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Load which player character's spells?", "")
		Int lengthPresetName = StringUtil.GetLength(presetName as String)
		if (lengthPresetName > 0)	
			Proteus_RemoveSpells(target, 0)
			Proteus_LoadSpells(presetName, target)
			Debug.Notification(presetName + " spells loaded.")
		else
			Debug.Notification("Invalid preset name entered. Try again.")
		endIf
	elseif result == 3 ;load appearance
		String presetName = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Load which player character appearance preset?", "")
		Int lengthPresetName = StringUtil.GetLength(presetName as String)
		String playerName = player.GetActorBase().GetName()
		if (lengthPresetName > 0)
			Race currentRace = player.GetRace()	
			Race presetRace = player.GetRace()
			Proteus_LoadTargetStrings(presetName, player, 1) ;change gender if needed
			presetRace = Proteus_LoadCharacterRace(presetName)
			if(explosionsOn.GetValue() == 1)
				player.PlaceAtMe(greenExplosion, 1)
			endIf
			Proteus_LoadCharacterAppearance(presetName, player, currentRace, presetRace, 0)
			Int jPresetList
			Int jPresetMap = jmap.object()
			String presetKey = jmap.nextKey(jPresetList, "", "")
			jmap.SetStr(jPresetMap, "PresetName", presetName)
			presetKey = jmap.nextKey(jPresetList, presetKey, "")
			jmap.SetStr(jPresetMap, "CarryWeight", player.GetBaseAV("CarryWeight"))
			jvalue.writeToFile(jPresetMap, JContGlobalPath + "/Proteus/Proteus_Character_PresetLoaded_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json")
			;make system recognize this preset has been loaded
			String processedPLAYERPRESETName = processName(presetName)
			ZZHasSavedPlayerCharacter.SetValue(ZZHasSavedPlayerCharacter.GetValue() + 1)
			SaveAppearancePresetJSON(playerName, processedPLAYERPRESETName)
			Proteus_SaveGlobalVariables(playerName)
			Debug.Notification(presetName + " appearance loaded.")

		endIf
	elseif result == 4 ;load appearance and equipped items
		String presetName = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Load which player character appearance preset?", "")
		Int lengthPresetName = StringUtil.GetLength(presetName as String)
		String playerName = player.GetActorBase().GetName()
		if (lengthPresetName > 0)
			Race currentRace = player.GetRace()	
			Race presetRace = player.GetRace()
			Proteus_LoadTargetStrings(presetName, player, 1) ;change gender if needed
			presetRace = Proteus_LoadCharacterRace(presetName)
			if(explosionsOn.GetValue() == 1)
				player.PlaceAtMe(greenExplosion, 1)
			endIf
			Proteus_LoadCharacterAppearance(presetName, player, currentRace, presetRace, 0)
			Int jPresetList
			Int jPresetMap = jmap.object()
			String presetKey = jmap.nextKey(jPresetList, "", "")
			jmap.SetStr(jPresetMap, "PresetName", presetName)
			presetKey = jmap.nextKey(jPresetList, presetKey, "")
			jmap.SetStr(jPresetMap, "CarryWeight", player.GetBaseAV("CarryWeight"))
			jvalue.writeToFile(jPresetMap, JContGlobalPath + "/Proteus/Proteus_Character_PresetLoaded_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json")
			;make system recognize this preset has been loaded
			String processedPLAYERPRESETName = processName(presetName)
			ZZHasSavedPlayerCharacter.SetValue(ZZHasSavedPlayerCharacter.GetValue() + 1)
			SaveAppearancePresetJSON(playerName, processedPLAYERPRESETName)
			Proteus_SaveGlobalVariables(playerName)
			Proteus_EquipItems(presetName, player)
			Debug.Notification(presetName + " appearance & equipped items loaded.")

		endIf
	elseif result == 5 ;load inventory
		String presetName = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Add which player character's items?", "")
		Int lengthPresetName = StringUtil.GetLength(presetName as String)
		if (lengthPresetName > 0)	
			Proteus_LoadItemsPiecemeal(presetName, target) 
			Utility.Wait(0.1)
			Debug.Notification(presetName + " inventory loaded.")
		else
			Debug.Notification("Invalid preset name entered. Try again.")
		endIf
	elseif result == 6 ;back
		Proteus_PlayerMainMenu()
	elseif result == 7 ;exit
		Debug.Notification("Loading Head Parts.")
		ProteusLoadHeadParts(player.GetActorBase().GetName())
	endIf

	Proteus_LockDisable()
endFunction


Function Proteus_SwitchCharacter()
	player.GetActorBase().SetInvulnerable(True)
	String targetSwitchName = Proteus_SelectPresetSwitch(false)
	if(targetSwitchName != "")
		Actor target = Proteus_GetSpawnActor(targetSwitchName)
		String targetName = target.GetActorBase().GetName()
		Int targetNameLength = StringUtil.GetLength(targetName)
		String targetPresetName
		String playerPresetName

		if (targetNameLength > 0)	
			;save current character 
			String playerName = player.GetActorBase().GetName()
			Proteus_CharacterSave(player, playerName)
			Utility.Wait(0.1)

			if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_NPC_GeneralInfo_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + "_" + targetName + ".json"))
				Int JNPCList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_NPC_GeneralInfo_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + "_" + targetName + ".json")
				Int jStats = jmap.object()
				String stat = jmap.nextKey(JNPCList, "", "")
				String value = jmap.GetStr(JNPCList, stat, "")
				if stat == "name"
					targetPresetName = value
				endIf
				stat = jmap.nextKey(JNPCList, stat, "")
				value = jmap.GetStr(JNPCList, stat, "")
				if stat == "name"
					targetPresetName = value
				endIf
			else
				Debug.Notification("Target preset name not found. Switch failed.")
			EndIf

			if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_PresetLoaded_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json") == true) 		
				Int JPlayerList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_Character_PresetLoaded_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json")
				Int jStats = jmap.object()
				String playerPresetNameKey = jmap.nextKey(JPlayerList, "", "")

				while playerPresetNameKey
					String value = jmap.GetStr(JPlayerList, playerPresetNameKey, none) as String
					if playerPresetNameKey == "PresetName"
						playerPresetName = value
					EndIf
					playerPresetNameKey = jmap.nextKey(JPlayerList, playerPresetNameKey, "")
				endWhile

				if playerPresetName != "" && targetPresetName != "" && playerPresetName != targetPresetName
					Utility.Wait(0.1)

					if(targetPresetName != player.GetActorBase().GetName())
						DeleteFaceGenData(player.GetActorBase())
					endIf
					
					;complex switch process XD
					playerMarker.MoveTo(player)
					Utility.Wait(0.1)
					Proteus_LoadCharacterSpawn(target, playerPresetName)
					Utility.Wait(0.1)
					Proteus_ClearFollowers(playerPresetName)
					Utility.Wait(0.1)
					Proteus_LoadCharacter(player, targetPresetName)
					Utility.Wait(0.1)
					Proteus_LoadFollowers(playerPresetName, targetPresetName)
					Utility.Wait(0.1)
					Proteus_ResetSpawn(targetPresetName, 1)
					Utility.Wait(0.1)
					LoadCharacterPreset(player, targetPresetName, playerHairColor)

					target.DispelAllSpells()
					ZZProteusCureDisease.Cast(target)
					;clear notifications
					playerMarker.MoveTo(player)
					player.MoveTo(playerMarker)
					Proteus_ReloadSIGEChanges() ;make sure any character specific armor, weapon, spell changes reload for the new character, added in 1.9.0
					Debug.Notification("Character switch complete.")
				elseif playerPresetName == targetPresetName
					Debug.Notification("ERROR: Player and target preset name match.")
				endIf
				
			else
				Debug.Notification("Player preset name not found. Swap failed.")
			EndIf
		endIf
	else
		;Debug.Notification("No player spawn nearby to swap with.")
	endIf
	player.GetActorBase().SetInvulnerable(False)
EndFunction

;option 0 = delete/clear spawn character, option 1 = spawn switch
Function Proteus_ResetSpawn(String name, Int option)
	Actor resetActor = Proteus_GetSpawningActor(name)
	if resetActor == NONE
		;do nothing, spawn doesn't exist
	elseif option == 0

		Actor[] playerFollowers = GetPlayerFollowers()
		if Proteus_IsInParty(playerFollowers, resetActor) == true
			if nffActive == true
				ProteusNethersScript.Proteus_NetherRemoveFollower(resetActor)
			elseif effActive == true
				ProteusEFFScript.Proteus_EFFRemoveFollower(resetActor)
			endIf
		endIf

		resetActor.GetActorBase().SetName("Unused Slot")
		resetActor.MoveTo(voidMarker)
	
		Int jNPCFormList
		jNPCFormList = jvalue.readFromFile(jcontainers.userDirectory() + "/Proteus/Proteus_NPC_List_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json")	
		Int jNFormNames = jmap.object()
		String NPCFormKey = jmap.nextKey(jNPCFormList, "", "")
		Bool insertNewNPC = true
		int i = 0
		while NPCFormKey
			Actor value = jmap.GetForm(jNPCFormList,NPCFormKey, none) as Actor
			if value == name
			else
				jmap.SetForm(jNFormNames, NPCFormKey, value as form)
			endIf
			i+=1
			NPCFormKey = jmap.nextKey(jNPCFormList, NPCFormKey, "")
		endWhile
		;write file with removed NPC form
		jvalue.writeToFile(jNFormNames, jcontainers.userDirectory() + "/Proteus/Proteus_NPC_List_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json")
	elseif option ==1

		Actor[] playerFollowers = GetPlayerFollowers()
		if Proteus_IsInParty(playerFollowers, resetActor) == true
			if nffActive == true
				ProteusNethersScript.Proteus_NetherRemoveFollower(resetActor)
			elseif effActive == true
				ProteusEFFScript.Proteus_EFFRemoveFollower(resetActor)
			endIf
		endIf


		;resetActor.GetActorBase().SetName("Unused Slot")
		resetActor.MoveTo(voidMarker)
		Int jNPCFormList
		jNPCFormList = jvalue.readFromFile(jcontainers.userDirectory() + "/Proteus/Proteus_NPC_List_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json")	
		Int jNFormNames = jmap.object()
		String NPCFormKey = jmap.nextKey(jNPCFormList, "", "")
		Bool insertNewNPC = true
		int i = 0
		while NPCFormKey
			Actor value = jmap.GetForm(jNPCFormList,NPCFormKey, none) as Actor
			if value == name
			else
				jmap.SetForm(jNFormNames, NPCFormKey, value as form)
			endIf
			i+=1
			NPCFormKey = jmap.nextKey(jNPCFormList, NPCFormKey, "")
		endWhile
		;write file with removed NPC form
		jvalue.writeToFile(jNFormNames, jcontainers.userDirectory() + "/Proteus/Proteus_NPC_List_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json")

	endif
EndFunction




Actor Function Proteus_TeleportExistingSummonToPlayer(String name)
	Actor summonedActor
	Actor[] actorArray = new Actor[20]
	Actor[] actorArrayTemp = new Actor[20]
	string[] stringArray = new String[20]
	Int count = 0

    actorArray[0] = ZZCustomM1
    actorArray[1] = ZZCustomM2
    actorArray[2] = ZZCustomM3
    actorArray[3] = ZZCustomM4
    actorArray[4] = ZZCustomM5
    actorArray[5] = ZZCustomM6
    actorArray[6] = ZZCustomM7
    actorArray[7] = ZZCustomM8
    actorArray[8] = ZZCustomM9
    actorArray[9] = ZZCustomM10
    actorArray[10] = ZZCustomF1
    actorArray[11] = ZZCustomF2
    actorArray[12] = ZZCustomF3
    actorArray[13] = ZZCustomF4
    actorArray[14] = ZZCustomF5
    actorArray[15] = ZZCustomF6
    actorArray[16] = ZZCustomF7
    actorArray[17] = ZZCustomF8
    actorArray[18] = ZZCustomF9
    actorArray[19] = ZZCustomF10

	int result
	if(name == "")

		UIListMenu listMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
		if listMenu
			int n = 20
			int i = 0
			while i < n
				if(actorArray[i].GetActorBase().GetName() != "Unused Slot" && actorArray[i].GetActorBase().GetName() != player.GetActorBase().GetName())
					String loc = "Unknown"
					if(actorArray[i].GetCurrentLocation().GetName() == "")
						loc = actorArray[i].GetCurrentLocation().GetName()
					endIf
					listMenu.AddEntryItem(actorArray[i].GetActorBase().GetName() + " (Current Location: " + loc + ")")
					actorArrayTemp[count] = actorArray[i]
					count += 1
				endIf
				i += 1
			endwhile
			listMenu.AddEntryItem("[Exit Menu]")
		EndIf
		listMenu.OpenMenu()
		result = listMenu.GetResultInt()
		if result == 0
			summonedActor =  actorArrayTemp[0]
		elseif result == 1
			summonedActor =  actorArrayTemp[1]
		elseif result == 2
			summonedActor =  actorArrayTemp[2]
		elseif result == 3
			summonedActor =  actorArrayTemp[3]
		elseif result == 4
			summonedActor =  actorArrayTemp[4]
		elseif result == 5
			summonedActor =  actorArrayTemp[5]
		elseif result == 6
			summonedActor =  actorArrayTemp[6]
		elseif result == 7
			summonedActor =  actorArrayTemp[7]
		elseif result == 8
			summonedActor =  actorArrayTemp[8]
		elseif result == 9
			summonedActor =  actorArrayTemp[9]
		elseif result == 10
			summonedActor =  actorArrayTemp[10]
		elseif result == 11
			summonedActor =  actorArrayTemp[11]
		elseif result == 12
			summonedActor =  actorArrayTemp[12]
		elseif result == 13
			summonedActor =  actorArrayTemp[13]
		elseif result == 14
			summonedActor =  actorArrayTemp[14]
		elseif result == 15
			summonedActor =  actorArrayTemp[15]
		elseif result == 16
			summonedActor =  actorArrayTemp[16]
		elseif result == 17
			summonedActor =  actorArrayTemp[17]
		elseif result == 18
			summonedActor =  actorArrayTemp[18]
		elseif result == 19
			summonedActor =  actorArrayTemp[19]
		elseif result == 20
		endIf
	else
		if name == actorArray[0].GetActorBase().GetName()
			summonedActor =  ZZCustomM1
		elseif name == actorArray[1].GetActorBase().GetName()
			summonedActor =  ZZCustomM2
		elseif name == actorArray[2].GetActorBase().GetName()
			summonedActor =  ZZCustomM3
		elseif name == actorArray[3].GetActorBase().GetName()
			summonedActor =  ZZCustomM4
		elseif name == actorArray[4].GetActorBase().GetName()
			summonedActor =  ZZCustomM5
		elseif name == actorArray[5].GetActorBase().GetName()
			summonedActor =  ZZCustomM6
		elseif name == actorArray[6].GetActorBase().GetName()
			summonedActor =  ZZCustomM7
		elseif name == actorArray[7].GetActorBase().GetName()
			summonedActor =  ZZCustomM8
		elseif name == actorArray[8].GetActorBase().GetName()
			summonedActor =  ZZCustomM9
		elseif name == actorArray[9].GetActorBase().GetName()
			summonedActor =  ZZCustomM10
		elseif name == actorArray[10].GetActorBase().GetName()
			summonedActor =  ZZCustomF1
		elseif name == actorArray[11].GetActorBase().GetName()
			summonedActor =  ZZCustomF2
		elseif name == actorArray[12].GetActorBase().GetName()
			summonedActor =  ZZCustomF3
		elseif name == actorArray[13].GetActorBase().GetName()
			summonedActor =  ZZCustomF4
		elseif name == actorArray[14].GetActorBase().GetName()
			summonedActor =  ZZCustomF5
		elseif name == actorArray[15].GetActorBase().GetName()
			summonedActor =  ZZCustomF6
		elseif name == actorArray[16].GetActorBase().GetName()
			summonedActor =  ZZCustomF7
		elseif name == actorArray[17].GetActorBase().GetName()
			summonedActor =  ZZCustomF8
		elseif name == actorArray[18].GetActorBase().GetName()
			summonedActor =  ZZCustomF9
		elseif name == actorArray[19].GetActorBase().GetName()
			summonedActor =  ZZCustomF10
		endIf
	endIf

	;String summonedActorName = summonedActor.GetActorBase().GetName()
	Int indexF1 = stringutil.Find(name, "Unused Slot", 0)

	if indexF1 >= 0
		Debug.MessageBox("No player character follower loaded on this slot.")
	elseif result != -1 && result != 20
		summonedActor.MoveTo(player)
	EndIf

endFunction



function Proteus_RegisterLoadedPresetOption(Actor targetName, String processedPLAYERPRESETName, String presetName, bool isSpawn)
	playerPresetFirstLoad = false
    Int jPLAYERPRESETFormList
    if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_PresetsLoaded_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json"))
        jPLAYERPRESETFormList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_Character_PresetsLoaded_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json")
    endIf
    Int jNFormNames = jmap.object()
    String PLAYERPRESETFormKey = jmap.nextKey(jPLAYERPRESETFormList, "", "")
    Bool insertNewPLAYERPRESET = true
    int i = 0
    String value
    while PLAYERPRESETFormKey
        value = jmap.GetStr(jPLAYERPRESETFormList,PLAYERPRESETFormKey, none)
        if value == processedPLAYERPRESETName
            insertNewPLAYERPRESET = false
            jmap.SetStr(jNFormNames, i + "_ProteusPlayerPreset_" + processedPLAYERPRESETName, value)
			if(!isSpawn)
				ZZPresetLoadedCounter.SetValue(i)
			endif
        else
            jmap.SetStr(jNFormNames, PLAYERPRESETFormKey, value)
        endIf
        i+=1
        PLAYERPRESETFormKey = jmap.nextKey(jPLAYERPRESETFormList, PLAYERPRESETFormKey, "")
    endWhile
    if insertNewPLAYERPRESET == true
        jmap.SetStr(jNFormNames, i + "_ProteusPlayerPreset_" + processedPLAYERPRESETName, presetName)
		if(!isSpawn)
			ZZPresetLoadedCounter.SetValue(i)
		endif
		playerPresetFirstLoad = true
    endIf
    jvalue.writeToFile(jNFormNames, JContGlobalPath + "/Proteus/Proteus_Character_PresetsLoaded_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json")
endFunction



String Function Proteus_SelectPresetSwitch(bool delete)
	presetsLoaded = new String[100]
    Int jPLAYERPRESETFormList
    if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_PresetsLoaded_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json"))
        jPLAYERPRESETFormList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_Character_PresetsLoaded_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json")
    endIf

	String playerName = player.GetActorBase().GetName()

	Int jNFormNames = jmap.object()
    String PLAYERPRESETFormKey = jmap.nextKey(jPLAYERPRESETFormList, "", "")
    int i = 0
    String value
    while PLAYERPRESETFormKey
        value = jmap.GetStr(jPLAYERPRESETFormList,PLAYERPRESETFormKey, none)
		if(value != playerName)
       		presetsLoaded[i] = value
			i+=1
		endIf
        PLAYERPRESETFormKey = jmap.nextKey(jPLAYERPRESETFormList, PLAYERPRESETFormKey, "")
    endWhile


	String[] stringArray = new String[20]
	stringArray[0] = ZZCustomM1.GetActorBase().GetName()
	stringArray[1] = ZZCustomM2.GetActorBase().GetName()
	stringArray[2] = ZZCustomM3.GetActorBase().GetName()
	stringArray[3] = ZZCustomM4.GetActorBase().GetName()
	stringArray[4] = ZZCustomM5.GetActorBase().GetName()
	stringArray[5] = ZZCustomM6.GetActorBase().GetName()
	stringArray[6] = ZZCustomM7.GetActorBase().GetName()
	stringArray[7] = ZZCustomM8.GetActorBase().GetName()
	stringArray[8] = ZZCustomM9.GetActorBase().GetName()
	stringArray[9] = ZZCustomM10.GetActorBase().GetName()
	stringArray[10] = ZZCustomF1.GetActorBase().GetName()
	stringArray[11] = ZZCustomF2.GetActorBase().GetName()
	stringArray[12] = ZZCustomF3.GetActorBase().GetName()
	stringArray[13] = ZZCustomF4.GetActorBase().GetName()
	stringArray[14] = ZZCustomF5.GetActorBase().GetName()
	stringArray[15] = ZZCustomF6.GetActorBase().GetName()
	stringArray[16] = ZZCustomF7.GetActorBase().GetName()
	stringArray[17] = ZZCustomF8.GetActorBase().GetName()
	stringArray[18] = ZZCustomF9.GetActorBase().GetName()
	stringArray[19] = ZZCustomF10.GetActorBase().GetName()

	;include any preset loaded that currently matches the name of an NPC
	String[] newArray = new String[100]
	i = 0
	int counter
	while i < presetsLoaded.Length && presetsLoaded[i] != ""
		int z = 0
		bool include = false
		if delete == false
			while z < stringArray.Length && stringArray[z] != ""	;include characters already on spawns in the list
				if(presetsLoaded[i] == stringArray[z])
					include = true
				endIf
				z += 1
			endWhile
		elseif delete == true
			include = true
		endIf

		if presetsLoaded[i] == playerName ;don't include current player character in import list
			include = false
		endIf
		if include == true
			newArray[counter] = presetsLoaded[i]
			counter += 1
		endIf
		i += 1
	endWhile

	string[] stringArray2 = new String[100]
	int k = 0
	while StringUtil.GetLength(newArray[k]) > 0
		stringArray2[k] = newArray[k]
		k+=1
	endWhile
	stringArray2[k] = " [Exit Menu]"
	UIListMenu listMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
	if listMenu
		int n = k+1
		i = 0
		while i < n
			listMenu.AddEntryItem(stringArray2[i])
			i += 1
		endwhile
	EndIf
	listMenu.OpenMenu()
	int result = listMenu.GetResultInt()
	int exitOption = k

	if (result == exitOption)
		return ""
	else
		return stringArray2[result]
	endIf
endFunction


String Function Proteus_SelectPresetSpawn()
	presetsLoaded = new String[100]

    Int jPLAYERPRESETFormList
    if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_PresetsLoaded_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json"))
        jPLAYERPRESETFormList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_Character_PresetsLoaded_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json")
    endIf

	Int jNFormNames = jmap.object()
    String PLAYERPRESETFormKey = jmap.nextKey(jPLAYERPRESETFormList, "", "")
    int i = 0
    String value
    while PLAYERPRESETFormKey
        value = jmap.GetStr(jPLAYERPRESETFormList,PLAYERPRESETFormKey, none)
        presetsLoaded[i] = value
        i+=1
        PLAYERPRESETFormKey = jmap.nextKey(jPLAYERPRESETFormList, PLAYERPRESETFormKey, "")
    endWhile

	string[] stringArray = new String[100]
	int k = 0
	while StringUtil.GetLength(presetsLoaded[k]) > 0
		stringArray[k] = presetsLoaded[k]
		k+=1
	endWhile
	stringArray[k] = " [Manually Enter Name]"
	k+=1
	stringArray[k] = " [Exit Menu]"
	UIListMenu listMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
	if listMenu
		int n = k+1
		i = 0
		while i < n
			listMenu.AddEntryItem(stringArray[i])
			i += 1
		endwhile
	EndIf
	listMenu.OpenMenu()
	int result = listMenu.GetResultInt()
	int customOption = k - 1
	int exitOption = k

	if (result == exitOption)
		;Debug.Notification("No preset selected.")
		return ""
	elseif(result == customOption)
		String presetName = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Enter character name:", "")
		Int lengthPresetName = StringUtil.GetLength(presetName as String)
		if (lengthPresetName > 0)	
			return presetName
		else
			return ""
		endIf
	else
		return stringArray[result]
	endIf
endFunction

String Function Proteus_SelectPresetSpawnImport()
	presetsLoaded = new String[120]

	int loadedPresetCount = 0
	int presetFileCounter = 1
	int failStreak = 0
	int previousPresetFileCounter = 0

	while presetFileCounter < 120
		if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_PresetsLoaded_" + presetFileCounter + ".json"))
			Int jPLAYERPRESETFormList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_Character_PresetsLoaded_" + presetFileCounter + ".json")
			Int jNFormNames = jmap.object()
			String PLAYERPRESETFormKey = jmap.nextKey(jPLAYERPRESETFormList, "", "")
			String value
			while PLAYERPRESETFormKey
				value = jmap.GetStr(jPLAYERPRESETFormList,PLAYERPRESETFormKey, none)
				int duplicateIndex = 0
				bool include = true
				while duplicateIndex < loadedPresetCount
					if(value  == presetsLoaded[duplicateIndex])
						include = false
					endIf
					duplicateIndex+=1
				endWhile
				if include == true
					presetsLoaded[loadedPresetCount] = value
					loadedPresetCount += 1
				endIf
				PLAYERPRESETFormKey = jmap.nextKey(jPLAYERPRESETFormList, PLAYERPRESETFormKey, "")
			endWhile
		elseif failStreak > 3
			presetFileCounter = 121
		else
			if(previousPresetFileCounter == (presetFileCounter - 1))
				failStreak += 1
			else
				failStreak = 0
			endIf
			previousPresetFileCounter = presetFileCounter
		endIf
		presetFileCounter += 1
	endWhile


	String[] stringArray = new String[20]
	stringArray[0] = ZZCustomM1.GetActorBase().GetName()
	stringArray[1] = ZZCustomM2.GetActorBase().GetName()
	stringArray[2] = ZZCustomM3.GetActorBase().GetName()
	stringArray[3] = ZZCustomM4.GetActorBase().GetName()
	stringArray[4] = ZZCustomM5.GetActorBase().GetName()
	stringArray[5] = ZZCustomM6.GetActorBase().GetName()
	stringArray[6] = ZZCustomM7.GetActorBase().GetName()
	stringArray[7] = ZZCustomM8.GetActorBase().GetName()
	stringArray[8] = ZZCustomM9.GetActorBase().GetName()
	stringArray[9] = ZZCustomM10.GetActorBase().GetName()
	stringArray[10] = ZZCustomF1.GetActorBase().GetName()
	stringArray[11] = ZZCustomF2.GetActorBase().GetName()
	stringArray[12] = ZZCustomF3.GetActorBase().GetName()
	stringArray[13] = ZZCustomF4.GetActorBase().GetName()
	stringArray[14] = ZZCustomF5.GetActorBase().GetName()
	stringArray[15] = ZZCustomF6.GetActorBase().GetName()
	stringArray[16] = ZZCustomF7.GetActorBase().GetName()
	stringArray[17] = ZZCustomF8.GetActorBase().GetName()
	stringArray[18] = ZZCustomF9.GetActorBase().GetName()
	stringArray[19] = ZZCustomF10.GetActorBase().GetName()

	String playerName = player.GetActorBase().GetName()

	;remove any preset loaded that currently matches the name of an NPC
	String[] newArray = new String[100]
	int i = 0
	int counter
	while i < presetsLoaded.Length && presetsLoaded[i] != ""
		int z = 0
		bool include = true
		while z < stringArray.Length && stringArray[z] != ""	;don't include characters already on spawns in the list
			if(presetsLoaded[i] == stringArray[z])
				include = false
			endIf
			z += 1
		endWhile
		if presetsLoaded[i] == playerName ;don't include current player character in import list
			include = false
		endIf
		if include == true
			newArray[counter] = presetsLoaded[i]
			counter += 1
		endIf
		i += 1
	endWhile

	string[] stringListArray = new String[100]
	int k = 0
	while k < newArray.Length && newArray[k] != ""
		stringListArray[k] = newArray[k]
		k+=1
	endWhile
	stringListArray[k] = " [Manually Enter Name]"
	k+=1
	stringListArray[k] = " [Exit Menu]"
	UIListMenu listMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
	if listMenu
		int n = k+1
		i = 0
		while i < n
			listMenu.AddEntryItem(stringListArray[i])
			i += 1
		endwhile
	EndIf
	listMenu.OpenMenu()
	int result = listMenu.GetResultInt()
	int customOption = k - 1
	int exitOption = k

	if (result == exitOption)
		;Debug.Notification("No preset selected.")
		return ""
	elseif(result == customOption)
		String presetName = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Enter character name:", "")
		Int lengthPresetName = StringUtil.GetLength(presetName as String)
		if (lengthPresetName > 0)
			bool include = true
			i = 0
			while i < stringArray.Length && stringArray[i] != ""
				if stringArray[i] == presetName ;allow to load or not?
					include = false
				endIf
				i += 1
			endWhile

			if include == true
				return presetName
			else
				Debug.MessageBox("This character already exists in this game world. Import cancelled.")
				Utility.Wait(0.1)
			endIf
		else
			return ""
		endIf
	else
		return stringListArray[result]
	endIf
endFunction





ObjectReference Function Proteus_SaveUnequippedContainerFunction(String preset)
    String targetName = preset
    if(UnequippedContainer1.GetDisplayName() == targetName || UnequippedContainer1.GetDisplayName() == "DefaultChest")
        return UnequippedContainer1
    elseif(UnequippedContainer2.GetDisplayName() == targetName || UnequippedContainer2.GetDisplayName() == "DefaultChest")
        return UnequippedContainer2
    elseif(UnequippedContainer3.GetDisplayName() == targetName || UnequippedContainer3.GetDisplayName() == "DefaultChest")
        return UnequippedContainer3
    elseif(UnequippedContainer4.GetDisplayName() == targetName || UnequippedContainer4.GetDisplayName() == "DefaultChest")
        return UnequippedContainer4
    elseif(UnequippedContainer5.GetDisplayName() == targetName || UnequippedContainer5.GetDisplayName() == "DefaultChest")
        return UnequippedContainer5
    elseif(UnequippedContainer6.GetDisplayName() == targetName || UnequippedContainer6.GetDisplayName() == "DefaultChest")
        return UnequippedContainer6
    elseif(UnequippedContainer7.GetDisplayName() == targetName || UnequippedContainer7.GetDisplayName() == "DefaultChest")
        return UnequippedContainer7
    elseif(UnequippedContainer8.GetDisplayName() == targetName || UnequippedContainer8.GetDisplayName() == "DefaultChest")
        return UnequippedContainer8
    elseif(UnequippedContainer9.GetDisplayName() == targetName || UnequippedContainer9.GetDisplayName() == "DefaultChest")
        return UnequippedContainer9
    elseif(UnequippedContainer10.GetDisplayName() == targetName || UnequippedContainer10.GetDisplayName() == "DefaultChest")
        return UnequippedContainer10
    elseif(UnequippedContainer11.GetDisplayName() == targetName || UnequippedContainer11.GetDisplayName() == "DefaultChest")
        return UnequippedContainer11
    elseif(UnequippedContainer12.GetDisplayName() == targetName || UnequippedContainer12.GetDisplayName() == "DefaultChest")
        return UnequippedContainer12
    elseif(UnequippedContainer13.GetDisplayName() == targetName || UnequippedContainer13.GetDisplayName() == "DefaultChest")
        return UnequippedContainer13
    elseif(UnequippedContainer14.GetDisplayName() == targetName || UnequippedContainer14.GetDisplayName() == "DefaultChest")
        return UnequippedContainer14
    elseif(UnequippedContainer15.GetDisplayName() == targetName || UnequippedContainer15.GetDisplayName() == "DefaultChest")
        return UnequippedContainer15
    elseif(UnequippedContainer16.GetDisplayName() == targetName || UnequippedContainer16.GetDisplayName() == "DefaultChest")
        return UnequippedContainer16
    elseif(UnequippedContainer17.GetDisplayName() == targetName || UnequippedContainer17.GetDisplayName() == "DefaultChest")
        return UnequippedContainer17
    elseif(UnequippedContainer18.GetDisplayName() == targetName || UnequippedContainer18.GetDisplayName() == "DefaultChest")
        return UnequippedContainer18
    elseif(UnequippedContainer19.GetDisplayName() == targetName || UnequippedContainer19.GetDisplayName() == "DefaultChest")
        return UnequippedContainer19
    elseif(UnequippedContainer20.GetDisplayName() == targetName || UnequippedContainer20.GetDisplayName() == "DefaultChest")
        return UnequippedContainer20
    elseif(UnequippedContainer21.GetDisplayName() == targetName || UnequippedContainer21.GetDisplayName() == "DefaultChest")
        return UnequippedContainer21
    elseif(UnequippedContainer22.GetDisplayName() == targetName || UnequippedContainer22.GetDisplayName() == "DefaultChest")
        return UnequippedContainer22
    elseif(UnequippedContainer23.GetDisplayName() == targetName || UnequippedContainer23.GetDisplayName() == "DefaultChest")
        return UnequippedContainer23
    elseif(UnequippedContainer24.GetDisplayName() == targetName || UnequippedContainer24.GetDisplayName() == "DefaultChest")
        return UnequippedContainer24
    elseif(UnequippedContainer25.GetDisplayName() == targetName || UnequippedContainer25.GetDisplayName() == "DefaultChest")
        return UnequippedContainer25
    elseif(UnequippedContainer26.GetDisplayName() == targetName || UnequippedContainer26.GetDisplayName() == "DefaultChest")
        return UnequippedContainer26
    elseif(UnequippedContainer27.GetDisplayName() == targetName || UnequippedContainer27.GetDisplayName() == "DefaultChest")
        return UnequippedContainer27
    elseif(UnequippedContainer28.GetDisplayName() == targetName || UnequippedContainer28.GetDisplayName() == "DefaultChest")
        return UnequippedContainer28
    elseif(UnequippedContainer29.GetDisplayName() == targetName || UnequippedContainer29.GetDisplayName() == "DefaultChest")
        return UnequippedContainer29
    elseif(UnequippedContainer30.GetDisplayName() == targetName || UnequippedContainer30.GetDisplayName() == "DefaultChest")
        return UnequippedContainer30
    elseif(UnequippedContainer31.GetDisplayName() == targetName || UnequippedContainer31.GetDisplayName() == "DefaultChest")
        return UnequippedContainer31
    elseif(UnequippedContainer32.GetDisplayName() == targetName || UnequippedContainer32.GetDisplayName() == "DefaultChest")
        return UnequippedContainer32
    elseif(UnequippedContainer33.GetDisplayName() == targetName || UnequippedContainer33.GetDisplayName() == "DefaultChest")
        return UnequippedContainer33
    elseif(UnequippedContainer34.GetDisplayName() == targetName || UnequippedContainer34.GetDisplayName() == "DefaultChest")
        return UnequippedContainer34
    elseif(UnequippedContainer35.GetDisplayName() == targetName || UnequippedContainer35.GetDisplayName() == "DefaultChest")
        return UnequippedContainer35
    elseif(UnequippedContainer36.GetDisplayName() == targetName || UnequippedContainer36.GetDisplayName() == "DefaultChest")
        return UnequippedContainer36
    elseif(UnequippedContainer37.GetDisplayName() == targetName || UnequippedContainer37.GetDisplayName() == "DefaultChest")
        return UnequippedContainer37
    elseif(UnequippedContainer38.GetDisplayName() == targetName || UnequippedContainer38.GetDisplayName() == "DefaultChest")
        return UnequippedContainer38
    elseif(UnequippedContainer39.GetDisplayName() == targetName || UnequippedContainer39.GetDisplayName() == "DefaultChest")
        return UnequippedContainer39
    elseif(UnequippedContainer40.GetDisplayName() == targetName || UnequippedContainer40.GetDisplayName() == "DefaultChest")
        return UnequippedContainer40
    elseif(UnequippedContainer41.GetDisplayName() == targetName || UnequippedContainer41.GetDisplayName() == "DefaultChest")
        return UnequippedContainer41
    elseif(UnequippedContainer42.GetDisplayName() == targetName || UnequippedContainer42.GetDisplayName() == "DefaultChest")
        return UnequippedContainer42
    elseif(UnequippedContainer43.GetDisplayName() == targetName || UnequippedContainer43.GetDisplayName() == "DefaultChest")
        return UnequippedContainer43
    elseif(UnequippedContainer44.GetDisplayName() == targetName || UnequippedContainer44.GetDisplayName() == "DefaultChest")
        return UnequippedContainer44
    elseif(UnequippedContainer45.GetDisplayName() == targetName || UnequippedContainer45.GetDisplayName() == "DefaultChest")
        return UnequippedContainer45
    elseif(UnequippedContainer46.GetDisplayName() == targetName || UnequippedContainer46.GetDisplayName() == "DefaultChest")
        return UnequippedContainer46
    elseif(UnequippedContainer47.GetDisplayName() == targetName || UnequippedContainer47.GetDisplayName() == "DefaultChest")
        return UnequippedContainer47
    elseif(UnequippedContainer48.GetDisplayName() == targetName || UnequippedContainer48.GetDisplayName() == "DefaultChest")
        return UnequippedContainer48
    elseif(UnequippedContainer49.GetDisplayName() == targetName || UnequippedContainer49.GetDisplayName() == "DefaultChest")
        return UnequippedContainer49
    elseif(UnequippedContainer50.GetDisplayName() == targetName || UnequippedContainer50.GetDisplayName() == "DefaultChest")
        return UnequippedContainer50
    else
        return NONE
    endIf
endFunction

ObjectReference Function Proteus_LoadUnequippedContainerFunction(String preset)
		String targetName = preset
		if(UnequippedContainer1.GetDisplayName() == targetName)
			return UnequippedContainer1
		elseif(UnequippedContainer2.GetDisplayName() == targetName)
			return UnequippedContainer2
		elseif(UnequippedContainer3.GetDisplayName() == targetName)
			return UnequippedContainer3
		elseif(UnequippedContainer4.GetDisplayName() == targetName)
			return UnequippedContainer4
		elseif(UnequippedContainer5.GetDisplayName() == targetName)
			return UnequippedContainer5
		elseif(UnequippedContainer6.GetDisplayName() == targetName)
			return UnequippedContainer6
		elseif(UnequippedContainer7.GetDisplayName() == targetName)
			return UnequippedContainer7
		elseif(UnequippedContainer8.GetDisplayName() == targetName)
			return UnequippedContainer8
		elseif(UnequippedContainer9.GetDisplayName() == targetName)
			return UnequippedContainer9
		elseif(UnequippedContainer10.GetDisplayName() == targetName)
			return UnequippedContainer10
		elseif(UnequippedContainer11.GetDisplayName() == targetName)
			return UnequippedContainer11
		elseif(UnequippedContainer12.GetDisplayName() == targetName)
			return UnequippedContainer12
		elseif(UnequippedContainer13.GetDisplayName() == targetName)
			return UnequippedContainer13
		elseif(UnequippedContainer14.GetDisplayName() == targetName)
			return UnequippedContainer14
		elseif(UnequippedContainer15.GetDisplayName() == targetName)
			return UnequippedContainer15
		elseif(UnequippedContainer16.GetDisplayName() == targetName)
			return UnequippedContainer16
		elseif(UnequippedContainer17.GetDisplayName() == targetName)
			return UnequippedContainer17
		elseif(UnequippedContainer18.GetDisplayName() == targetName)
			return UnequippedContainer18
		elseif(UnequippedContainer19.GetDisplayName() == targetName)
			return UnequippedContainer19
		elseif(UnequippedContainer20.GetDisplayName() == targetName)
			return UnequippedContainer20
		elseif(UnequippedContainer21.GetDisplayName() == targetName)
			return UnequippedContainer21
		elseif(UnequippedContainer22.GetDisplayName() == targetName)
			return UnequippedContainer22
		elseif(UnequippedContainer23.GetDisplayName() == targetName)
			return UnequippedContainer23
		elseif(UnequippedContainer24.GetDisplayName() == targetName)
			return UnequippedContainer24
		elseif(UnequippedContainer25.GetDisplayName() == targetName)
			return UnequippedContainer25
		elseif(UnequippedContainer26.GetDisplayName() == targetName)
			return UnequippedContainer26
		elseif(UnequippedContainer27.GetDisplayName() == targetName)
			return UnequippedContainer27
		elseif(UnequippedContainer28.GetDisplayName() == targetName)
			return UnequippedContainer28
		elseif(UnequippedContainer29.GetDisplayName() == targetName)
			return UnequippedContainer29
		elseif(UnequippedContainer30.GetDisplayName() == targetName)
			return UnequippedContainer30
		elseif(UnequippedContainer31.GetDisplayName() == targetName)
			return UnequippedContainer31
		elseif(UnequippedContainer32.GetDisplayName() == targetName)
			return UnequippedContainer32
		elseif(UnequippedContainer33.GetDisplayName() == targetName)
			return UnequippedContainer33
		elseif(UnequippedContainer34.GetDisplayName() == targetName)
			return UnequippedContainer34
		elseif(UnequippedContainer35.GetDisplayName() == targetName)
			return UnequippedContainer35
		elseif(UnequippedContainer36.GetDisplayName() == targetName)
			return UnequippedContainer36
		elseif(UnequippedContainer37.GetDisplayName() == targetName)
			return UnequippedContainer37
		elseif(UnequippedContainer38.GetDisplayName() == targetName)
			return UnequippedContainer38
		elseif(UnequippedContainer39.GetDisplayName() == targetName)
			return UnequippedContainer39
		elseif(UnequippedContainer40.GetDisplayName() == targetName)
			return UnequippedContainer40
		elseif(UnequippedContainer41.GetDisplayName() == targetName)
			return UnequippedContainer41
		elseif(UnequippedContainer42.GetDisplayName() == targetName)
			return UnequippedContainer42
		elseif(UnequippedContainer43.GetDisplayName() == targetName)
			return UnequippedContainer43
		elseif(UnequippedContainer44.GetDisplayName() == targetName)
			return UnequippedContainer44
		elseif(UnequippedContainer45.GetDisplayName() == targetName)
			return UnequippedContainer45
		elseif(UnequippedContainer46.GetDisplayName() == targetName)
			return UnequippedContainer46
		elseif(UnequippedContainer47.GetDisplayName() == targetName)
			return UnequippedContainer47
		elseif(UnequippedContainer48.GetDisplayName() == targetName)
			return UnequippedContainer48
		elseif(UnequippedContainer49.GetDisplayName() == targetName)
			return UnequippedContainer49
		elseif(UnequippedContainer50.GetDisplayName() == targetName)
			return UnequippedContainer50
		else
			return NONE
		endIf
endFunction



Function Proteus_DeletePlayerCharacter(String presetName)
	Bool deleteChar = true
	;CANNOT DELETE CURRENTLY LOADED PRESET - check which preset is currently loaded
	if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_PresetLoaded_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json"))
		Int JPlayerList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_Character_PresetLoaded_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json")
		Int jStats = jmap.object()
		String playerPresetName = jmap.nextKey(JPlayerList, "", "")
		while playerPresetName
			String value = jmap.GetStr(JPlayerList, playerPresetName, none) as String
			if playerPresetName == "PresetName"
				if(value == presetName)
					deleteChar = false
				endIf
			endIf
			playerPresetName = jmap.nextKey(JPlayerList, playerPresetName, "")
		endWhile
	endIf

	if(presetName == "")
		Debug.Notification("Invalid preset name entered.")
		deleteChar = false
	endIf

	if(deleteChar==true)
		;delete race, skills, stats JSON files
		if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_Race_" + presetName + ".json"))
			removeFileAtPath(JContGlobalPath + "/Proteus/Proteus_Character_Race_" + presetName + ".json")
		endIf

		if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_Skills_" + presetName + ".json"))
			removeFileAtPath(JContGlobalPath + "/Proteus/Proteus_Character_Skills_" + presetName + ".json")
		endIf

		if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_SkillsCustom_" + presetName + ".json"))
			removeFileAtPath(JContGlobalPath + "/Proteus/Proteus_Character_SkillsCustom_" + presetName + ".json")
		endIf

		if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_GeneralInfo_" + presetName + ".json"))
			removeFileAtPath(JContGlobalPath + "/Proteus/Proteus_Character_GeneralInfo_" + presetName + ".json")
		endIf
		
		int counter = 1
		while(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_FavoritedItems_" + counter + "_" + presetName + ".json"))
			removeFileAtPath(JContGlobalPath + "/Proteus/Proteus_Character_FavoritedItems_" + counter + "_" + presetName + ".json")
			counter += 1
		endWhile
		
		counter = 1
		while(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_EquippedItems_" + counter + "_" + presetName + ".json"))
			removeFileAtPath(JContGlobalPath + "/Proteus/Proteus_Character_EquippedItems_" + counter + "_" + presetName + ".json")
			counter += 1
		endWhile

		counter = 1
		while(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_UnequippedItems_" + counter + "_" + presetName + ".json"))
			removeFileAtPath(JContGlobalPath + "/Proteus/Proteus_Character_UnequippedItems_" + counter + "_" + presetName + ".json")
			counter += 1
		endWhile
		
		counter = 1
		while(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_EquippedSpells_" + presetName + ".json"))
			removeFileAtPath(JContGlobalPath + "/Proteus/Proteus_Character_EquippedSpells_" + presetName + ".json")
			counter += 1
		endWhile
		counter = 1
		while(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_FavoritedSpells_" + counter + "_" + presetName + ".json"))
			removeFileAtPath(JContGlobalPath + "/Proteus/Proteus_Character_FavoritedSpells_" + counter + "_" + presetName + ".json")
			counter += 1
		endWhile
		counter = 1
		while(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_Spells_" + counter + "_" + presetName + ".json"))
			removeFileAtPath(JContGlobalPath + "/Proteus/Proteus_Character_Spells_" + counter + "_" + presetName + ".json")
			counter += 1
		endWhile	
		
		counter = 1
		while(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_Perks_" + counter + "_" + presetName + ".json"))
			removeFileAtPath(JContGlobalPath + "/Proteus/Proteus_Character_Perks_" + counter + "_" + presetName + ".json")
			counter += 1
		endWhile
	
		;CLEAR REGISTERED PRESETS LIST
		Int jPLAYERPRESETFormList
		if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_PresetsLoaded_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json"))
			jPLAYERPRESETFormList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_Character_PresetsLoaded_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json")
			Int jNFormNames = jmap.object()
			String PLAYERPRESETFormKey = jmap.nextKey(jPLAYERPRESETFormList, "", "")
			int i = 0
			String value
			while PLAYERPRESETFormKey
				value = jmap.GetStr(jPLAYERPRESETFormList,PLAYERPRESETFormKey, none)
				if value == presetName
				else
					jmap.SetStr(jNFormNames, PLAYERPRESETFormKey, value)
				endIf
				i+=1
				PLAYERPRESETFormKey = jmap.nextKey(jPLAYERPRESETFormList, PLAYERPRESETFormKey, "")
			endWhile
			jvalue.writeToFile(jNFormNames, JContGlobalPath + "/Proteus/Proteus_Character_PresetsLoaded_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json")
		endIf

		;CLEAR STORED INVENTORY CONTAINER
		ObjectReference deleteUnequipped = Proteus_LoadUnequippedContainerFunction(presetName)
		Proteus_RemoveAllItems(deleteUnequipped, NONE)
		deleteUnequipped.SetName("DefaultChest")
		deleteUnequipped.SetDisplayName("DefaultChest")

		;reset any actor spawn that has this name
		Actor spawnToClear = Proteus_GetSpawningActor(presetName)
		if(spawnToClear != NONE)
			Proteus_ResetSpawn(presetName, 0)
		endIf
	else
		Debug.MessageBox("Cannot delete as this character is currently loaded on the player.")
	endIf
endFunction

;new function in 2.0.0
Function Proteus_RemoveAllItems(ObjectReference refTarget, ObjectReference containerRef)
	
	if containerRef != NONE
		refTarget.RemoveAllItems(containerRef, true, false)
	else
		refTarget.RemoveAllItems()
	endIf
	Utility.Wait(0.1)
	int numRemainingItems = refTarget.GetNumItems()
	int i = 0
	while i < numRemainingItems
		Form item = refTarget.GetNthForm(i) 
		if item != NONE
			int itemCount = refTarget.GetItemCount(item) 
			if containerRef != NONE
				containerRef.AddItem(item, itemCount)
			endIf
			refTarget.RemoveItem(item, itemCount, true) 
		endIf
		i+=1
	endWhile
endFunction

Function SaveAppearancePresetJSON(String playerName, String presetName)
	playerPresetFirstLoad = false

	Int jPLAYERPRESETFormList
	if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_PresetsLoaded_" + playerName + "_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json"))
		jPLAYERPRESETFormList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_Character_PresetsLoaded_" + playerName + "_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json")
	endIf
	Int jNFormNames = jmap.object()
	String PLAYERPRESETFormKey = jmap.nextKey(jPLAYERPRESETFormList, "", "")
	Bool insertNewPLAYERPRESET = true
	int i = 0
	String value
	while PLAYERPRESETFormKey
		value = jmap.GetStr(jPLAYERPRESETFormList,PLAYERPRESETFormKey, none)
		if value == presetName
			insertNewPLAYERPRESET = false
			jmap.SetStr(jNFormNames, i + "_ProteusPlayerPreset_" + presetName, value)
			ZZPresetLoadedCounter2.SetValue(i)
		else
			jmap.SetStr(jNFormNames, PLAYERPRESETFormKey, value)
		endIf
		i+=1
		PLAYERPRESETFormKey = jmap.nextKey(jPLAYERPRESETFormList, PLAYERPRESETFormKey, "")
	endWhile
	if insertNewPLAYERPRESET == true
		jmap.SetStr(jNFormNames, i + "_ProteusPlayerPreset_" + presetName, presetName)
		ZZPresetLoadedCounter2.SetValue(i)
		playerPresetFirstLoad = true
	endIf
	jvalue.writeToFile(jNFormNames, JContGlobalPath + "/Proteus/Proteus_Character_PresetsLoaded_" + playerName + "_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json")
endFunction

Function LevelScaler(Actor target)
	Utility.Wait(0.1)
    Debug.MessageBox("Select a saved character that you would like to scale your current character to.")
    Utility.Wait(0.1)
    ;figure out which preset to use
    String presetName = Proteus_SelectPresetSpawn()

    ;initial variable setup
    Int totalSkills = 0
    Int totalAttributes = 0
    Int levelPreset = 0
    int skillDiff = 0
    int attributeDiff = 0
    int skillCurrentTotal = 0
    int attributeCurrentTotal = 0
    Bool ran = false

    ;get skills and attributes of selected preset
    if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_Character_Skills_" + presetName + ".json"))
        ran = true
        Int jSkillList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_Character_Skills_" + presetName + ".json")
        Int jSkills = jmap.object()
        String skillForm = jmap.nextKey(jSkillList, "", "")
        Int maxCount = jvalue.Count(jSkillList)
        Int j = 0
        String stat = jmap.nextKey(JSkillList, "", "")
        while j <= maxCount
            String value = jmap.GetStr(jSkillList , stat, "")
            if stat == "Alchemy"
                totalSkills += value as Int 
            elseIf stat == "Alteration"
                totalSkills += value as Int 
            elseIf stat == "Marksman"
                totalSkills += value as Int 
            elseIf stat == "Block"
                totalSkills += value as Int  
            elseIf stat == "Conjuration"
                totalSkills += value as Int 
            elseIf stat == "Destruction"
                totalSkills += value as Int  
            elseIf stat == "Enchanting"
                totalSkills += value as Int 
            elseIf stat == "HeavyArmor"
                totalSkills += value as Int 
            elseIf stat == "Illusion"
                totalSkills += value as Int 
            elseIf stat == "LightArmor"
                totalSkills += value as Int  
            elseIf stat == "Lockpicking"
                totalSkills += value as Int 
            elseIf stat == "OneHanded"
                totalSkills += value as Int 
            elseIf stat == "PickPocket"
                totalSkills += value as Int 
            elseIf stat == "Restoration"
                totalSkills += value as Int 
            elseIf stat == "Smithing"
                totalSkills += value as Int  
            elseIf stat == "Sneak"
                totalSkills += value as Int 
            elseIf stat == "Speechcraft"
                totalSkills += value as Int  
            elseIf stat == "Twohanded"
                totalSkills += value as Int 
            elseIf stat == "Health"
                totalAttributes += value as Int 
            elseIf stat == "Magicka"
                totalAttributes += value as Int 
            elseIf stat == "Stamina"
                totalAttributes += value as Int  
            elseIf stat == "Level"
                levelPreset = value as Int
            elseIf stat == "Name"
            elseIf stat == "Experience"
            elseIf stat == "ZPerkPoints"
            endIf
            stat = jmap.nextKey(JSkillList, stat, "")
            j += 1
        endWhile
    endIf

    ;figure out the skill/attribute differences between selected preset and target
    if ran == true
        int levelDiff = levelPreset - target.GetLevel()
		Utility.Wait(0.1)
        if(levelDiff > 0)
			;ProteusDLLUtils.SetLevel(target, levelPreset)
			SetSelectedReference(target)
			ExecuteCommand("setlevel " + levelPreset as Int)
            skillCurrentTotal += target.GetBaseAV("Alchemy") as Int
            skillCurrentTotal += target.GetBaseAV("Alteration") as Int
            skillCurrentTotal += target.GetBaseAV("Marksman") as Int
            skillCurrentTotal += target.GetBaseAV("Block") as Int
            skillCurrentTotal += target.GetBaseAV("Conjuration") as Int
            skillCurrentTotal += target.GetBaseAV("Destruction") as Int
            skillCurrentTotal += target.GetBaseAV("Enchanting") as Int
            skillCurrentTotal += target.GetBaseAV("HeavyArmor") as Int
            skillCurrentTotal += target.GetBaseAV("Illusion") as Int
            skillCurrentTotal += target.GetBaseAV("LightArmor") as Int
            skillCurrentTotal += target.GetBaseAV("Lockpicking") as Int
            skillCurrentTotal += target.GetBaseAV("OneHanded") as Int
            skillCurrentTotal += target.GetBaseAV("Pickpocket") as Int
            skillCurrentTotal += target.GetBaseAV("Restoration") as Int
            skillCurrentTotal += target.GetBaseAV("Smithing") as Int
            skillCurrentTotal += target.GetBaseAV("Sneak") as Int
            skillCurrentTotal += target.GetBaseAV("Speechcraft") as Int
            skillCurrentTotal += target.GetBaseAV("TwoHanded") as Int
            skillDiff = totalSkills - skillCurrentTotal

            attributeCurrentTotal += target.GetBaseAV("Health") as Int
            attributeCurrentTotal += target.GetBaseAV("Magicka") as Int
            attributeCurrentTotal += target.GetBaseAV("Stamina") as Int
            attributeDiff = totalAttributes - attributeCurrentTotal

            Debug.MessageBox("You have " + attributeDiff as Int + " attribute points to distribute. Each time you make a selection, your remaining available attribute points will decrease.")
            Utility.Wait(0.1)
            LevelScalerAttribute(attributeDiff, target, 10)
            Utility.Wait(0.1)
            Debug.MessageBox("You have " + skillDiff as Int + " skill points to distribute. Each time you make a selection, your remaining available skill points will decrease.")
            Utility.Wait(0.1)
            LevelScalerSkill(skillDiff, target, 1)

            ;PERKS?
            if(target == player)
                Game.AddPerkPoints(levelDiff)
                Debug.MessageBox(target.GetActorBase().GetName() + " obtained " + levelDiff as Int + " perk points and is now level " + levelPreset as Int + ".")
            endIf
        else
            Debug.MessageBox("Level scaler only works when used on a character with a lower level than that of the selected character.")
        endIf
    endIf
    ;Debug.MessageBox("Player \nSkills"+totalSkills + "\nAttrib" + totalAttributes + "\nSkillDiff"+skillDiff + "\nAttribDiff"+attributeDiff)
endFunction


function LevelScalerAttribute(Int amountRemaining, Actor target, Int incrementAmount)
    ;Debug.Notification("Attribute points left to distribute = " + amountRemaining as Int)
	if (incrementAmount > amountRemaining)
		incrementAmount = amountRemaining
	endIf

    string[] stringArray = new String[4]
    stringArray[0] = " [Increment:" + Proteus_Round(incrementAmount, 0) + ", Remaining:" + Proteus_Round(amountRemaining, 0) + "]"
	stringArray[1] = " Health " + target.GetBaseAV("Health") as Int
    stringArray[2] = " Magicka " + target.GetBaseAV("Magicka") as Int
    stringArray[3] = " Stamina " + target.GetBaseAV("Stamina") as Int

    UIListMenu listMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    if listMenu
        int n = 4
        int i = 0
        while i < n
            listMenu.AddEntryItem(stringArray[i])
            i += 1
        endwhile
    EndIf

    listMenu.OpenMenu()
    int result = listMenu.GetResultInt()

    if amountRemaining > 0
		if result == 0
			Int incrementAmountInput = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Change increment amount to:", "") as Int
			Utility.Wait(0.1)
			if incrementAmountInput > 0
				incrementAmount = incrementAmountInput
				LevelScalerAttribute(amountRemaining, target, incrementAmount)
			else
				Debug.Notification("Must enter an integer greater than 0.")
				LevelScalerAttribute(amountRemaining, target, incrementAmount)
			endif
		elseif result == 1
            target.SetActorValue("Health", target.GetBaseAV("Health") + incrementAmount)
            amountRemaining -= incrementAmount
            if amountRemaining > 0
                LevelScalerAttribute(amountRemaining, target, incrementAmount)
            endIf
        elseIf result == 2
            target.SetActorValue("Magicka", target.GetBaseAV("Magicka") + incrementAmount)
            amountRemaining -= incrementAmount
            if amountRemaining > 0
                LevelScalerAttribute(amountRemaining, target, incrementAmount)
            endIf
        elseIf result == 3
            target.SetActorValue("Stamina", target.GetBaseAV("Stamina") + incrementAmount)
            amountRemaining -= incrementAmount
            if amountRemaining > 0
                LevelScalerAttribute(amountRemaining, target, incrementAmount)
            endIf
        elseIf result == -1
            Debug.Notification("You must distribute your remaining " + amountRemaining as Int + " attribute points.")
            if amountRemaining > 0
                LevelScalerAttribute(amountRemaining, target, incrementAmount)
            endIf
        endIf
    endIf
endFunction

function LevelScalerSkill(Int amountRemaining, Actor target, Int incrementAmount)
    ;Debug.Notification("Skill points left to distribute = " + amountRemaining as Int)
	if (incrementAmount > amountRemaining)
		incrementAmount = amountRemaining
	endIf
    string[] stringArray = new String[19]
	stringArray[0] = " [Increment:" + Proteus_Round(incrementAmount, 0) + ", Remaining:" + Proteus_Round(amountRemaining, 0) + "]"
    stringArray[1] = " Alchemy " + target.GetBaseAV("Alchemy") as Int
    stringArray[2] = " Alteration "+ target.GetBaseAV("Alteration") as Int   
    stringArray[3] = " Archery " + target.GetBaseAV("Marksman") as Int   
    stringArray[4] = " Block "+ target.GetBaseAV("Block") as Int
    stringArray[5] = " Conjuration "+ target.GetBaseAV("Conjuration") as Int
    stringArray[6] = " Destruction "+ target.GetBaseAV("Destruction") as Int
    stringArray[7] = " Enchanting "+ target.GetBaseAV("Enchanting") as Int
    stringArray[8] = " HeavyArmor "+ target.GetBaseAV("HeavyArmor") as Int
    stringArray[9] = " Illusion "+ target.GetBaseAV("Illusion") as Int
    stringArray[10] = " LightArmor "+ target.GetBaseAV("LightArmor") as Int
    stringArray[11] = " Lockpicking "+ target.GetBaseAV("Lockpicking") as Int
    stringArray[12] = " OneHanded "+ target.GetBaseAV("OneHanded") as Int
    stringArray[13] = " PickPocket "+ target.GetBaseAV("PickPocket") as Int
    stringArray[14] = " Restoration "+ target.GetBaseAV("Restoration") as Int
    stringArray[15] = " Smithing "+ target.GetBaseAV("Smithing") as Int
    stringArray[16] = " Sneak "+ target.GetBaseAV("Sneak") as Int
    stringArray[17] = " Speechcraft "+ target.GetBaseAV("Speechcraft") as Int
    stringArray[18] = " Twohanded "+ target.GetBaseAV("Twohanded") as Int

    UIListMenu listMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    if listMenu
        int n = 19
        int i = 0
        while i < n
            listMenu.AddEntryItem(stringArray[i])
            i += 1
        endwhile
    EndIf

    listMenu.OpenMenu()
    int result = listMenu.GetResultInt()

    if amountRemaining > 0
		if result == 0
			Int incrementAmountInput = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Change increment amount to:", "") as Int
			Utility.Wait(0.1)
            if incrementAmountInput > 0
                incrementAmount = incrementAmountInput
                LevelScalerSkill(amountRemaining, target, incrementAmount)
            else
                Debug.Notification("Must enter an integer greater than 0.")
                LevelScalerSkill(amountRemaining, target, incrementAmount)
            endif
        elseif result == 1
            target.SetActorValue("Alchemy", target.GetBaseAV("Alchemy") + incrementAmount)
            amountRemaining -= incrementAmount
            if amountRemaining > 0
                LevelScalerSkill(amountRemaining, target, incrementAmount)
            endIf
        elseIf result == 2
            target.SetActorValue("Alteration", target.GetBaseAV("Alteration") + incrementAmount)
            amountRemaining -= incrementAmount
            if amountRemaining > 0
                LevelScalerSkill(amountRemaining, target, incrementAmount)
            endIf
        elseIf result == 3
            target.SetActorValue("Marksman", target.GetBaseAV("Marksman") + incrementAmount)
            amountRemaining -= incrementAmount
            if amountRemaining > 0
                LevelScalerSkill(amountRemaining, target, incrementAmount)
            endIf
        elseIf result == 4
            target.SetActorValue("Block", target.GetBaseAV("Block") + incrementAmount)
            amountRemaining -= incrementAmount
            if amountRemaining > 0
                LevelScalerSkill(amountRemaining, target, incrementAmount)
            endIf
        elseIf result == 5
            target.SetActorValue("Conjuration", target.GetBaseAV("Conjuration") + incrementAmount)
            amountRemaining -= incrementAmount
            if amountRemaining > 0
                LevelScalerSkill(amountRemaining, target, incrementAmount)
            endIf
        elseIf result == 6
            target.SetActorValue("Destruction", target.GetBaseAV("Destruction") + incrementAmount)
            amountRemaining -= incrementAmount
            if amountRemaining > 0
                LevelScalerSkill(amountRemaining, target, incrementAmount)
            endIf
        elseIf result == 7
            target.SetActorValue("Enchanting", target.GetBaseAV("Enchanting") + incrementAmount)
            amountRemaining -= incrementAmount
            if amountRemaining > 0
                LevelScalerSkill(amountRemaining, target, incrementAmount)
            endIf
        elseIf result == 8
            target.SetActorValue("HeavyArmor", target.GetBaseAV("HeavyArmor") + incrementAmount)
            amountRemaining -= incrementAmount
            if amountRemaining > 0
                LevelScalerSkill(amountRemaining, target, incrementAmount)
            endIf
        elseIf result == 9
            target.SetActorValue("Illusion", target.GetBaseAV("Illusion") + incrementAmount)
            amountRemaining -= incrementAmount
            if amountRemaining > 0
                LevelScalerSkill(amountRemaining, target, incrementAmount)
            endIf
        elseIf result == 10
            target.SetActorValue("LightArmor", target.GetBaseAV("LightArmor") + incrementAmount)
            amountRemaining -= incrementAmount
            if amountRemaining > 0
                LevelScalerSkill(amountRemaining, target, incrementAmount)
            endIf
        elseIf result == 11
            target.SetActorValue("Lockpicking", target.GetBaseAV("Lockpicking") + incrementAmount)
            amountRemaining -= incrementAmount
            if amountRemaining > 0
                LevelScalerSkill(amountRemaining, target, incrementAmount)
            endIf
        elseIf result == 12
            target.SetActorValue("OneHanded", target.GetBaseAV("OneHanded") + incrementAmount)
            amountRemaining -= incrementAmount
            if amountRemaining > 0
                LevelScalerSkill(amountRemaining, target, incrementAmount)
            endIf
        elseIf result == 13
            target.SetActorValue("PickPocket", target.GetBaseAV("PickPocket") + incrementAmount)
            amountRemaining -= incrementAmount
            if amountRemaining > 0
                LevelScalerSkill(amountRemaining, target, incrementAmount)
            endIf
        elseIf result == 14
            target.SetActorValue("Restoration", target.GetBaseAV("Restoration") + incrementAmount)
            amountRemaining -= incrementAmount
            if amountRemaining > 0
                LevelScalerSkill(amountRemaining, target, incrementAmount)
            endIf
        elseIf result == 15
            target.SetActorValue("Smithing", target.GetBaseAV("Smithing") + incrementAmount)
            amountRemaining -= incrementAmount
            if amountRemaining > 0
                LevelScalerSkill(amountRemaining, target, incrementAmount)
            endIf
        elseIf result == 16
            target.SetActorValue("Sneak", target.GetBaseAV("Sneak") + incrementAmount)
            amountRemaining -= incrementAmount
            if amountRemaining > 0
                LevelScalerSkill(amountRemaining, target, incrementAmount)
            endIf
        elseIf result == 17
            target.SetActorValue("Speechcraft", target.GetBaseAV("Speechcraft") + incrementAmount)
            amountRemaining -= incrementAmount
            if amountRemaining > 0
                LevelScalerSkill(amountRemaining, target, incrementAmount)
            endIf
        elseIf result == 18
            target.SetActorValue("Twohanded", target.GetBaseAV("Twohanded") + incrementAmount)
            amountRemaining -= incrementAmount
            if amountRemaining > 0
                LevelScalerSkill(amountRemaining, target, incrementAmount)
            endIf
        elseIf result == -1
            Debug.Notification("You must distribute your remaining " + amountRemaining as Int + " skill points.")
            if amountRemaining > 0
                LevelScalerSkill(amountRemaining, target, incrementAmount)
            endIf
        endIf
    else
    endIf
endFunction


Function Proteus_SaveElementsVariables(String playerName)
    Int ElementsFormList
    Int jNFormNames = jmap.object()
    String ElementsFormKey = jmap.nextKey(ElementsFormList, "", "")
    int i = 0
    while i < 25
        ;String value = jmap.GetStr(ElementsFormList,ElementsFormKey, none)
        if i == 0 ;blood spend points
            jmap.SetStr(jNFormNames, "BloodSpend", (Game.GetFormFromFile(0x160B08, "Phenderix Elements.esp") as GlobalVariable).GetValue())
        elseif i == 1 ;darkness spend points
            jmap.SetStr(jNFormNames, "DarknessSpend", (Game.GetFormFromFile(0x160B07, "Phenderix Elements.esp") as GlobalVariable).GetValue())
        elseif i == 2 ;divine spend points
            jmap.SetStr(jNFormNames, "DivineSpend", (Game.GetFormFromFile(0x160B09, "Phenderix Elements.esp") as GlobalVariable).GetValue())
        elseif i == 3 ;earth spend points
            jmap.SetStr(jNFormNames, "EarthSpend", (Game.GetFormFromFile(0x160B06, "Phenderix Elements.esp") as GlobalVariable).GetValue())
        elseif i == 4 ;fire spend points
            jmap.SetStr(jNFormNames, "FireSpend", (Game.GetFormFromFile(0x160B02, "Phenderix Elements.esp") as GlobalVariable).GetValue())
        elseif i == 5 ;frost spend points
            jmap.SetStr(jNFormNames, "FrostSpend", (Game.GetFormFromFile(0x160B03, "Phenderix Elements.esp") as GlobalVariable).GetValue())
        elseif i == 6 ;lightning spend points
            jmap.SetStr(jNFormNames, "LightningSpend", (Game.GetFormFromFile(0x160B04, "Phenderix Elements.esp") as GlobalVariable).GetValue())
        elseif i == 7 ;poison spend points
            jmap.SetStr(jNFormNames, "PoisonSpend", (Game.GetFormFromFile(0x160B05, "Phenderix Elements.esp") as GlobalVariable).GetValue())
        elseif i == 8 ;water spend points
            jmap.SetStr(jNFormNames, "WaterSpend", (Game.GetFormFromFile(0x160B01, "Phenderix Elements.esp") as GlobalVariable).GetValue())
        elseif i == 9 ;wind spend points
            jmap.SetStr(jNFormNames, "WindSpend", (Game.GetFormFromFile(0x0C8C2D, "Phenderix Elements.esp") as GlobalVariable).GetValue())
        elseif i == 10 ;element spend points
            jmap.SetStr(jNFormNames, "ElementSpend", (Game.GetFormFromFile(0x0C8C2E, "Phenderix Elements.esp") as GlobalVariable).GetValue())
        elseif i == 11 ;unlocked elements
            jmap.SetStr(jNFormNames, "UnlockedElements", (Game.GetFormFromFile(0x0C8C2C, "Phenderix Elements.esp") as GlobalVariable).GetValue())
        elseif i == 12 ;blood unlocked
            jmap.SetStr(jNFormNames, "UnlockedBlood", (Game.GetFormFromFile(0x0C8C37, "Phenderix Elements.esp") as GlobalVariable).GetValue())
        elseif i == 13 ;darkness unlocked
            jmap.SetStr(jNFormNames, "UnlockedDark", (Game.GetFormFromFile(0x0C8C38, "Phenderix Elements.esp") as GlobalVariable).GetValue())
        elseif i == 14 ;divine unlocked
            jmap.SetStr(jNFormNames, "UnlockedDivine", (Game.GetFormFromFile(0x0C8C36, "Phenderix Elements.esp") as GlobalVariable).GetValue())
        elseif i == 15 ;earth unlocked
            jmap.SetStr(jNFormNames, "UnlockedEarth", (Game.GetFormFromFile(0x0C8C32, "Phenderix Elements.esp") as GlobalVariable).GetValue())
        elseif i == 16 ;fire unlocked
            jmap.SetStr(jNFormNames, "UnlockedFire", (Game.GetFormFromFile(0x0C8C2F, "Phenderix Elements.esp") as GlobalVariable).GetValue())
        elseif i == 17 ;frost unlocked
            jmap.SetStr(jNFormNames, "UnlockedFrost", (Game.GetFormFromFile(0x0C8C30, "Phenderix Elements.esp") as GlobalVariable).GetValue())
        elseif i == 18 ;lightning unlocked
            jmap.SetStr(jNFormNames, "UnlockedLightning", (Game.GetFormFromFile(0x0C8C31, "Phenderix Elements.esp") as GlobalVariable).GetValue())
        elseif i == 19 ;poison unlocked
            jmap.SetStr(jNFormNames, "UnlockedPoison", (Game.GetFormFromFile(0x0C8C35, "Phenderix Elements.esp") as GlobalVariable).GetValue())
        elseif i == 20 ;water unlocked
            jmap.SetStr(jNFormNames, "UnlockedWater", (Game.GetFormFromFile(0x0C8C33, "Phenderix Elements.esp") as GlobalVariable).GetValue())
        elseif i == 21 ;wind unlocked
            jmap.SetStr(jNFormNames, "UnlockedWind", (Game.GetFormFromFile(0x0C8C34, "Phenderix Elements.esp") as GlobalVariable).GetValue())
		elseif i == 22 ;astral unlocked
            jmap.SetStr(jNFormNames, "UnlockedAstral", (Game.GetFormFromFile(0x2E695D, "Phenderix Elements.esp") as GlobalVariable).GetValue())
		elseif i == 23 ;nature unlocked
            jmap.SetStr(jNFormNames, "UnlockedNature", (Game.GetFormFromFile(0x2E695A, "Phenderix Elements.esp") as GlobalVariable).GetValue())
		elseif i == 24 ;metal unlocked
            jmap.SetStr(jNFormNames, "UnlockedMetal", (Game.GetFormFromFile(0x2E695C, "Phenderix Elements.esp") as GlobalVariable).GetValue())
		elseif i == 22 ;astral spend
            jmap.SetStr(jNFormNames, "AstralSpend", (Game.GetFormFromFile(0x2E695E, "Phenderix Elements.esp") as GlobalVariable).GetValue())
		elseif i == 23 ;nature spend
            jmap.SetStr(jNFormNames, "NatureSpend", (Game.GetFormFromFile(0x2E6960, "Phenderix Elements.esp") as GlobalVariable).GetValue())
		elseif i == 24 ;metal spend
            jmap.SetStr(jNFormNames, "MetalSpend", (Game.GetFormFromFile(0x2E695F, "Phenderix Elements.esp") as GlobalVariable).GetValue())
		endIf
        i+=1
        ElementsFormKey = jmap.nextKey(ElementsFormList, ElementsFormKey, "")
    endWhile
    jvalue.writeToFile(jNFormNames, JContGlobalPath + "/Proteus/Proteus_ElementsValues_" + playerName + "_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json")
endFunction

Function Proteus_LoadElementsVariables(String playerName)
	playerPresetFirstLoad = false
	Int ElementsFormList
	if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_ElementsValues_" + playerName + "_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json"))
		ElementsFormList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_ElementsValues_" + playerName + "_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json")
		Int jNFormNames = jmap.object()
		String ElementsFormKey = jmap.nextKey(ElementsFormList, "", "")
		Bool insertNewPLAYERPRESET = true
		int i = 0
		String value
		while ElementsFormKey
			value = jmap.GetStr(ElementsFormList,ElementsFormKey, none)
			if ElementsFormKey == "BloodSpend" ;blood spend points
				GlobalVariable gvValue = Game.GetFormFromFile(0x160B08, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "DarknessSpend" ;darkness spend points
				GlobalVariable gvValue = Game.GetFormFromFile(0x160B07, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "DivineSpend" ;divine spend points
				GlobalVariable gvValue = Game.GetFormFromFile(0x160B09, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "EarthSpend" ;earth spend points
				GlobalVariable gvValue = Game.GetFormFromFile(0x160B06, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "FireSpend" ;fire spend points
				GlobalVariable gvValue = Game.GetFormFromFile(0x160B02, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "FrostSpend" ;frost spend points
				GlobalVariable gvValue = Game.GetFormFromFile(0x160B03, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "LightningSpend" ;lightning spend points
				GlobalVariable gvValue = Game.GetFormFromFile(0x160B04, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "PoisonSpend" ;poison spend points
				GlobalVariable gvValue = Game.GetFormFromFile(0x160B05, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "WaterSpend" ;water spend points
				GlobalVariable gvValue = Game.GetFormFromFile(0x160B01, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "WindSpend" ;wind spend points
				GlobalVariable gvValue = Game.GetFormFromFile(0x0C8C2D, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "ElementSpend" ;element spend points
				GlobalVariable gvValue = Game.GetFormFromFile(0x0C8C2E, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "UnlockedElements" ;unlocked elements
				GlobalVariable gvValue = Game.GetFormFromFile(0x0C8C2C, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "UnlockedBlood" ;blood unlocked
				GlobalVariable gvValue = Game.GetFormFromFile(0x0C8C37, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "UnlockedDark" ;darkness unlocked
				GlobalVariable gvValue = Game.GetFormFromFile(0x0C8C38, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "UnlockedDivine" ;divine unlocked
				GlobalVariable gvValue = Game.GetFormFromFile(0x0C8C36, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "UnlockedEarth" ;earth unlocked
				GlobalVariable gvValue = Game.GetFormFromFile(0x0C8C32, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "UnlockedFire" ;fire unlocked
				GlobalVariable gvValue = Game.GetFormFromFile(0x0C8C2F, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "UnlockedFrost" ;frost unlocked
				GlobalVariable gvValue = Game.GetFormFromFile(0x0C8C30, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "UnlockedLightning" ;lightning unlocked
				GlobalVariable gvValue = Game.GetFormFromFile(0x0C8C31, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "UnlockedPoison" ;poison unlocked
				GlobalVariable gvValue = Game.GetFormFromFile(0x0C8C35, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "UnlockedWater" ;water unlocked
				GlobalVariable gvValue = Game.GetFormFromFile(0x0C8C33, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "UnlockedWind" ;wind unlocked
				GlobalVariable gvValue = Game.GetFormFromFile(0x0C8C34, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "UnlockedAstral" ;astral unlocked
				GlobalVariable gvValue = Game.GetFormFromFile(0x2E695D, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "UnlockedNature" ;nature unlocked
				GlobalVariable gvValue = Game.GetFormFromFile(0x2E695A, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "UnlockedMetal" ;metal unlocked
				GlobalVariable gvValue = Game.GetFormFromFile(0x2E695C, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "AstralSpend" ;wind spend points
				GlobalVariable gvValue = Game.GetFormFromFile(0x2E695E, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "NatureSpend" ;wind spend points
				GlobalVariable gvValue = Game.GetFormFromFile(0x2E6960, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			elseif ElementsFormKey == "MetalSpend" ;wind spend points
				GlobalVariable gvValue = Game.GetFormFromFile(0x2E695F, "Phenderix Elements.esp") as GlobalVariable
				gvValue.SetValue(value as Int)
			endIf
			i+=1
			ElementsFormKey = jmap.nextKey(ElementsFormList, ElementsFormKey, "")
		endWhile
	else
		Proteus_ClearElementsVariables()
	endIf
endFunction


Function Proteus_ClearElementsVariables()
	GlobalVariable gvValue = Game.GetFormFromFile(0x160B08, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
    gvValue = Game.GetFormFromFile(0x160B07, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
    gvValue = Game.GetFormFromFile(0x160B09, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
    gvValue = Game.GetFormFromFile(0x160B06, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
    gvValue = Game.GetFormFromFile(0x160B02, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
    gvValue = Game.GetFormFromFile(0x160B03, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
    gvValue = Game.GetFormFromFile(0x160B04, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
    gvValue = Game.GetFormFromFile(0x160B05, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
    gvValue = Game.GetFormFromFile(0x160B01, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
    gvValue = Game.GetFormFromFile(0x0C8C2D, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
    gvValue = Game.GetFormFromFile(0x0C8C2E, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(5)
    gvValue = Game.GetFormFromFile(0x0C8C2C, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
    gvValue = Game.GetFormFromFile(0x0C8C37, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
    gvValue = Game.GetFormFromFile(0x0C8C38, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
    gvValue = Game.GetFormFromFile(0x0C8C36, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
    gvValue = Game.GetFormFromFile(0x0C8C32, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
    gvValue = Game.GetFormFromFile(0x0C8C2F, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
    gvValue = Game.GetFormFromFile(0x0C8C30, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
    gvValue = Game.GetFormFromFile(0x0C8C31, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
    gvValue = Game.GetFormFromFile(0x0C8C35, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
    gvValue = Game.GetFormFromFile(0x0C8C33, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
    gvValue = Game.GetFormFromFile(0x0C8C34, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
	gvValue = Game.GetFormFromFile(0x2E695D, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
	gvValue = Game.GetFormFromFile(0x2E695A, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
	gvValue = Game.GetFormFromFile(0x2E695C, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
	gvValue = Game.GetFormFromFile(0x2E695E, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
	gvValue = Game.GetFormFromFile(0x2E6960, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
	gvValue = Game.GetFormFromFile(0x2E695F, "Phenderix Elements.esp") as GlobalVariable
    gvValue.SetValue(0)
endFunction


Function Proteus_SaveGlobalVariables(String playerName)
	playerPresetFirstLoad = false
	Int jPLAYERPRESETFormList
	Int jNFormNames = jmap.object()
	String PLAYERPRESETFormKey = jmap.nextKey(jPLAYERPRESETFormList, "", "")
	int i = 0
	while i < 2
		String value = jmap.GetStr(jPLAYERPRESETFormList,PLAYERPRESETFormKey, none)
		if i == 0
			jmap.SetStr(jNFormNames, "GV1", ZZPresetLoadedCounter.GetValue() as Int)
		elseif i == 1
			jmap.SetStr(jNFormNames, "GV2", ZZPresetLoadedCounter2.GetValue() as Int)
		endIf
		i+=1
		PLAYERPRESETFormKey = jmap.nextKey(jPLAYERPRESETFormList, PLAYERPRESETFormKey, "")
	endWhile
	jvalue.writeToFile(jNFormNames, JContGlobalPath + "/Proteus/ProteusPresetsLoadedGV_" + playerName + "_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json")
endFunction


Function Proteus_LoadGlobalVariables(String playerName)
	playerPresetFirstLoad = false
	Int jPLAYERPRESETFormList
	if(fileExistsAtPath(JContGlobalPath + "/Proteus/ProteusPresetsLoadedGV_" + playerName + "_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json"))
		jPLAYERPRESETFormList = jvalue.readFromFile(JContGlobalPath + "/Proteus/ProteusPresetsLoadedGV_" + playerName + "_" + Proteus_Round(ZZNPCAppearanceSaved.GetValue(),0) + ".json")
		Int jNFormNames = jmap.object()
		String PLAYERPRESETFormKey = jmap.nextKey(jPLAYERPRESETFormList, "", "")
		Bool insertNewPLAYERPRESET = true
		int i = 0
		String value
		while PLAYERPRESETFormKey
			value = jmap.GetStr(jPLAYERPRESETFormList,PLAYERPRESETFormKey, none)
			if PLAYERPRESETFormKey == "GV1"
				;ZZPresetLoadedCounter.SetValue(value as Int)
			elseif PLAYERPRESETFormKey == "GV2"
				ZZPresetLoadedCounter2.SetValue(value as Int)
			endIf
			i+=1
			PLAYERPRESETFormKey = jmap.nextKey(jPLAYERPRESETFormList, PLAYERPRESETFormKey, "")
		endWhile
	endIf
endFunction


;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Proteus_PlayerFactionsFunction()
	string[] stringArray
	stringArray= new String[17]
	stringArray[0] = " Bandit"
	stringArray[1] = " Forsworn"
	stringArray[2] = " Necromancer"
	stringArray[3] = " Vampire"
	stringArray[4] = " Werewolf"
	stringArray[5] = " Thalmor"
	stringArray[6] = " Imperial Legion"
	stringArray[7] = " Stormcloak"
	stringArray[8] = " Cultist"
	stringArray[9] = " Dremora"
	stringArray[10] = " Falmer"
	stringArray[11] = " Hagraven"
	stringArray[12] = " Tribal Orc"
	stringArray[13] = " Vigilant of Stendarr"
	stringArray[14] = " Skeleton"
	stringArray[15] = " [Back]"
	stringArray[16] = " [Exit Menu]"

	UIListMenu listMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
	if listMenu
		int n = 17
		int i = 0
		while i < n
			listMenu.AddEntryItem(stringArray[i])
			i += 1
		endwhile
	EndIf

	listMenu.OpenMenu()
	int result = listMenu.GetResultInt()
	if result == 0
		if player.IsInFaction(banditFaction) == 0 as Bool
			player.AddToFaction(banditFaction)
			banditFaction.SetReaction(playerFaction, 3)
			debug.Notification(player.GetActorBase().GetName() + " is now a member of the Bandit faction.")
			Proteus_PlayerFactionsFunction()
		else
			player.RemoveFromFaction(banditFaction)
			banditFaction.SetReaction(playerFaction, 1)
			debug.Notification(player.GetActorBase().GetName() + " is no longer a member of the Bandit faction.")
			Proteus_PlayerFactionsFunction()
		endIf
	elseIf result == 1
		if player.IsInFaction(forswornFaction) == 0 as Bool
			player.AddToFaction(forswornFaction)
			forswornFaction.SetReaction(playerFaction, 3)
			debug.Notification(player.GetActorBase().GetName() + " is now a member of the Forsworn faction.")
			Proteus_PlayerFactionsFunction()
		else
			player.RemoveFromFaction(forswornFaction)
			forswornFaction.SetReaction(forswornFaction, 1)
			debug.Notification(player.GetActorBase().GetName() + " is no longer a member of the Forsworn faction.")
			Proteus_PlayerFactionsFunction()
		endIf
	elseIf result == 2
		if player.IsInFaction(necromancerFaction) == 0 as Bool
			player.AddToFaction(necromancerFaction)
			necromancerFaction.SetReaction(playerFaction, 3)
			debug.Notification(player.GetActorBase().GetName() + " is now a member of the Necromancer faction.")
			Proteus_PlayerFactionsFunction()
		else
			player.RemoveFromFaction(necromancerFaction)
			necromancerFaction.SetReaction(playerFaction, 1)
			debug.Notification(player.GetActorBase().GetName() + " is no longer a member of the Necromancer faction.")
			Proteus_PlayerFactionsFunction()
		endIf
	elseIf result == 3
		if player.IsInFaction(vampireFaction) == 0 as Bool
			player.AddToFaction(vampireFaction)
			vampireFaction.SetReaction(playerFaction, 3)
			debug.Notification(player.GetActorBase().GetName() + " is now a member of the Vampire faction.")
			Proteus_PlayerFactionsFunction()
		else
			player.RemoveFromFaction(vampireFaction)
			vampireFaction.SetReaction(playerFaction, 1)
			debug.Notification(player.GetActorBase().GetName() + " is no longer a member of the Vampire faction.")
			Proteus_PlayerFactionsFunction()
		endIf
	elseIf result == 4
		if player.IsInFaction(werewolfFaction) == 0 as Bool
			player.AddToFaction(werewolfFaction)
			werewolfFaction.SetReaction(playerFaction, 3)
			debug.Notification(player.GetActorBase().GetName() + " is now a member of the Werewolf faction.")
			Proteus_PlayerFactionsFunction()
		else
			player.RemoveFromFaction(werewolfFaction)
			werewolfFaction.SetReaction(playerFaction, 1)
			debug.Notification(player.GetActorBase().GetName() + " is no longer a member of the Werewolf faction.")
			Proteus_PlayerFactionsFunction()
		endIf
	elseIf result == 5
		if player.IsInFaction(thalmorFaction) == 0 as Bool
			player.AddToFaction(thalmorFaction)
			thalmorFaction.SetReaction(playerFaction, 3)
			debug.Notification(player.GetActorBase().GetName() + " is now a member of the Thalmor faction.")
			Proteus_PlayerFactionsFunction()
		else
			player.RemoveFromFaction(thalmorFaction)
			thalmorFaction.SetReaction(playerFaction, 0)
			debug.Notification(player.GetActorBase().GetName() + " is no longer a member of the Thalmor faction.")
			Proteus_PlayerFactionsFunction()
		endIf
	elseIf result == 6
		if player.IsInFaction(imperialLegionFaction) == 0 as Bool
			player.AddToFaction(imperialLegionFaction)
			imperialLegionFaction.SetReaction(playerFaction, 3)
			debug.Notification(player.GetActorBase().GetName() + " is now a member of the Imperial Legion faction.")
			Proteus_PlayerFactionsFunction()
		else
			player.RemoveFromFaction(imperialLegionFaction)
			imperialLegionFaction.SetReaction(playerFaction, 0)
			debug.Notification(player.GetActorBase().GetName() + " is no longer a member of the Imperial Legion faction.")
			Proteus_PlayerFactionsFunction()
		endIf
	elseIf result == 7
		if player.IsInFaction(stormCloakFaction) == 0 as Bool
			player.AddToFaction(stormCloakFaction)
			stormCloakFaction.SetReaction(playerFaction, 3)
			debug.Notification(player.GetActorBase().GetName() + " is now a member of the Stormcloak faction.")
			Proteus_PlayerFactionsFunction()
		else
			player.RemoveFromFaction(stormCloakFaction)
			stormCloakFaction.SetReaction(playerFaction, 0)
			debug.Notification(player.GetActorBase().GetName() + " is no longer a member of the Stormcloak faction.")
			Proteus_PlayerFactionsFunction()
		endIf
	elseIf result == 8
		if player.IsInFaction(cultistFaction) == 0 as Bool
			player.AddToFaction(cultistFaction)
			cultistFaction.SetReaction(playerFaction, 3)
			debug.Notification(player.GetActorBase().GetName() + " is now a member of the Cultist faction.")
			Proteus_PlayerFactionsFunction()
		else
			player.RemoveFromFaction(cultistFaction)
			cultistFaction.SetReaction(playerFaction, 0)
			debug.Notification(player.GetActorBase().GetName() + " is no longer a member of the Cultist faction.")
			Proteus_PlayerFactionsFunction()
		endIf
	elseIf result == 9
		if player.IsInFaction(dremoraFaction) == 0 as Bool
			player.AddToFaction(dremoraFaction)
			dremoraFaction.SetReaction(playerFaction, 3)
			debug.Notification(player.GetActorBase().GetName() + " is now a member of the Dremora faction.")
			Proteus_PlayerFactionsFunction()
		else
			player.RemoveFromFaction(dremoraFaction)
			dremoraFaction.SetReaction(playerFaction, 0)
			debug.Notification(player.GetActorBase().GetName() + " is no longer a member of the Dremora faction.")
			Proteus_PlayerFactionsFunction()
		endIf
	elseIf result == 10
		if player.IsInFaction(falmerFaction) == 0 as Bool
			player.AddToFaction(falmerFaction)
			falmerFaction.SetReaction(playerFaction, 3)
			debug.Notification(player.GetActorBase().GetName() + " is now a member of the Falmer faction.")
			Proteus_PlayerFactionsFunction()
		else
			player.RemoveFromFaction(falmerFaction)
			falmerFaction.SetReaction(playerFaction, 0)
			debug.Notification(player.GetActorBase().GetName() + " is no longer a member of the Falmer faction.")
			Proteus_PlayerFactionsFunction()
		endIf
	elseIf result == 11
		if player.IsInFaction(hagravenFaction) == 0 as Bool
			player.AddToFaction(hagravenFaction)
			hagravenFaction.SetReaction(playerFaction, 3)
			debug.Notification(player.GetActorBase().GetName() + " is now a member of the Hagraven faction.")
			Proteus_PlayerFactionsFunction()
		else
			player.RemoveFromFaction(hagravenFaction)
			hagravenFaction.SetReaction(playerFaction, 0)
			debug.Notification(player.GetActorBase().GetName() + " is no longer a member of the Hagraven faction.")
			Proteus_PlayerFactionsFunction()
		endIf
	elseIf result == 12
		if player.IsInFaction(tribalOrcsFaction) == 0 as Bool
			player.AddToFaction(tribalOrcsFaction)
			tribalOrcsFaction.SetReaction(playerFaction, 3)
			debug.Notification(player.GetActorBase().GetName() + " is now a member of the Tribal Orc faction.")
			Proteus_PlayerFactionsFunction()
		else
			player.RemoveFromFaction(tribalOrcsFaction)
			tribalOrcsFaction.SetReaction(playerFaction, 0)
			debug.Notification(player.GetActorBase().GetName() + " is no longer a member of the Tribal Orc faction.")
			Proteus_PlayerFactionsFunction()
		endIf
	elseIf result == 13
		if player.IsInFaction(vigilantOfStendarrFaction) == 0 as Bool
			player.AddToFaction(vigilantOfStendarrFaction)
			vigilantOfStendarrFaction.SetReaction(playerFaction, 3)
			debug.Notification(player.GetActorBase().GetName() + " is now a member of the Vigilant of Stendarr faction.")
			Proteus_PlayerFactionsFunction()
		else
			player.RemoveFromFaction(vigilantOfStendarrFaction)
			vigilantOfStendarrFaction.SetReaction(playerFaction, 0)
			debug.Notification(player.GetActorBase().GetName() + " is no longer a member of the Vigilant of Stendarr faction.")
			Proteus_PlayerFactionsFunction()
		endIf
	elseIf result == 14
		if player.IsInFaction(skeletonFaction) == 0 as Bool
			player.AddToFaction(skeletonFaction)
			skeletonFaction.SetReaction(playerFaction, 3)
			debug.Notification(player.GetActorBase().GetName() + " is now a member of the Skeleton faction.")
			Proteus_PlayerFactionsFunction()
		else
			player.RemoveFromFaction(skeletonFaction)
			skeletonFaction.SetReaction(playerFaction, 0)
			debug.Notification(player.GetActorBase().GetName() + " is no longer a member of the Skeleton faction.")
			Proteus_PlayerFactionsFunction()
		endIf
	elseIf result == 15
		Proteus_PlayerMainMenu()
	endIf
endFunction



Function Proteus_OpenSharedStash()
	ObjectReference sharedContainerRef = sharedContainer.GetReference()
	sharedContainerRef.Activate(player)
endFunction


Function ResetCrimeFactions()
	int maxCount = ZZCrimeFactions.GetSize()
	Int j = 0
	while j < maxCount
		Faction factionTemp = ZZCrimeFactions.GetAt(j) as Faction
		factionTemp.SetCrimeGoldViolent(0)
		factionTemp.SetCrimeGold(0)
		j += 1
	endWhile
EndFunction

Function SaveCrimeFactions(String presetName)
	Int jCrimeFactions = jmap.object()
	Int jCrimeFactionsList
	String crimeFormKey = jmap.nextKey(jCrimeFactionsList, "", "")
	int maxCount = ZZCrimeFactions.GetSize()

	Int j = 0
	while j < maxCount
		String value
		Faction factionTemp = ZZCrimeFactions.GetAt(j) as Faction
		String factionName = ProteusGetFormEditorID(factionTemp as Form)

		String crimeGoldViolent = factionTemp.GetCrimeGoldViolent()
		jmap.SetForm(jCrimeFactions, factionName + "_CrimeGoldViolent_" + crimeGoldViolent , factionTemp)
		crimeFormKey = jmap.nextKey(jCrimeFactionsList, crimeFormKey, "")

		String crimeGoldNonViolent = factionTemp.GetCrimeGoldNonViolent()
		jmap.SetForm(jCrimeFactions, factionName + "_CrimeGoldNonviolent_" + crimeGoldNonViolent , factionTemp)
		crimeFormKey = jmap.nextKey(jCrimeFactionsList, crimeFormKey, "")

		j += 1
	endWhile
	jvalue.writeToFile(jCrimeFactions, JContGlobalPath + "/Proteus/Proteus_CrimeFactionGold_" + presetName + ".json")
EndFunction


Function LoadCrimeFactions(String presetName)
	;get beginning amount of gold and add enough to pay bounties
	int beginningGoldPre = player.GetItemCount(Gold001)
	int incrementAmount = 100000
	player.AddItem(Gold001, incrementAmount)
	Utility.Wait(0.2)
	int beginningGoldPost = player.GetItemCount(Gold001)

	int maxCount = ZZCrimeFactions.GetSize() * 2 ;getting violent and non-violent
	if(fileExistsAtPath(JContGlobalPath + "/Proteus/Proteus_CrimeFactionGold_" + presetName + ".json"))
		Int jCrimeFactionsList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_CrimeFactionGold_" + presetName + ".json")
		Int jCrimeFactions = jmap.object()
		String crimeFormKey = jmap.nextKey(jCrimeFactionsList, "", "")
		int j = 0
		while j < maxCount
			Faction factionTemp = jmap.GetForm(jCrimeFactionsList,crimeFormKey, none) as Faction
			Debug.Notification(factionTemp.GetName())
			Int currentCrimeGoldViolent = factionTemp.GetCrimeGoldViolent()
			Int currentCrimeGoldNonViolent = factionTemp.GetCrimeGoldNonViolent()

			Int indexCrimeGoldViolent = stringutil.Find(crimeFormKey, "_CrimeGoldViolent_", 0)
			Int indexCrimeGoldNonViolent = stringutil.Find(crimeFormKey, "_CrimeGoldNonviolent_", 0)
			Int crimeAmount = 0

			if indexCrimeGoldViolent >= 0
				crimeAmount = StringUtil.Substring(crimeFormKey, stringutil.Find(crimeFormKey, "_CrimeGoldViolent_" + 18, 0)) as Int
				if(crimeAmount > 0)
					Debug.MessageBox("CrimeViolent: " + crimeAmount)
				elseif(crimeAmount == 0)
					factionTemp.PlayerPayCrimeGold(false, false)
				endIf
				factionTemp.SetCrimeGoldViolent(crimeAmount)
			elseif indexCrimeGoldNonViolent >= 0
				crimeAmount = StringUtil.Substring(crimeFormKey, stringutil.Find(crimeFormKey, "_CrimeGoldNonviolent_" + 21, 0)) as Int
				factionTemp.SetCrimeGold(crimeAmount)	
			endIf
			j+=1
			crimeFormKey = jmap.nextKey(jCrimeFactionsList, crimeFormKey, "")
		endWhile
		;reset gold to beginning value
		Utility.Wait(0.1)
		int endingGold = player.GetItemCount(Gold001)

		int differenceGold = beginningGoldPost - endingGold
		player.RemoveItem(Gold001, beginningGoldPost - differenceGold - beginningGoldPre)
	endIf
EndFunction


function Proteus_LockEnable()
	Game.SetHudCartMode()
	Game.DisablePlayerControls(true,true,true,true,true, true, true, true)
	Game.ForceFirstPerson()
endFunction

function Proteus_LockDisable()
	Utility.Wait(0.1)
	Game.SetHudCartMode(false)
	Game.EnablePlayerControls()
endFunction



Outfit Function Proteus_GetSpawnOutfit(Actor target)
	Outfit spawnOutfit
	if target == ZZCustomF1
		spawnOutfit = ZZProteusOutfitSpawn1
	elseif target == ZZCustomF2
		spawnOutfit = ZZProteusOutfitSpawn2
	elseif target == ZZCustomF3
		spawnOutfit = ZZProteusOutfitSpawn3
	elseif target == ZZCustomF4
		spawnOutfit = ZZProteusOutfitSpawn4
	elseif target == ZZCustomF5
		spawnOutfit = ZZProteusOutfitSpawn5
	elseif target == ZZCustomF6
		spawnOutfit = ZZProteusOutfitSpawn6
	elseif target == ZZCustomF7
		spawnOutfit = ZZProteusOutfitSpawn7
	elseif target == ZZCustomF8
		spawnOutfit = ZZProteusOutfitSpawn8
	elseif target == ZZCustomF9
		spawnOutfit = ZZProteusOutfitSpawn9
	elseif target == ZZCustomF10
		spawnOutfit = ZZProteusOutfitSpawn10
	elseif target == ZZCustomM1
		spawnOutfit = ZZProteusOutfitSpawn11
	elseif target == ZZCustomM2
		spawnOutfit = ZZProteusOutfitSpawn12
	elseif target == ZZCustomM3
		spawnOutfit = ZZProteusOutfitSpawn13
	elseif target == ZZCustomM4
		spawnOutfit = ZZProteusOutfitSpawn14
	elseif target == ZZCustomM5
		spawnOutfit = ZZProteusOutfitSpawn15
	elseif target == ZZCustomM6
		spawnOutfit = ZZProteusOutfitSpawn16
	elseif target == ZZCustomM7
		spawnOutfit = ZZProteusOutfitSpawn17
	elseif target == ZZCustomM8
		spawnOutfit = ZZProteusOutfitSpawn18
	elseif target == ZZCustomM9
		spawnOutfit = ZZProteusOutfitSpawn19
	elseif target == ZZCustomM10
		spawnOutfit = ZZProteusOutfitSpawn20
	elseif target == hostilePlayerCharacter
		spawnOutfit = ZZProteusOutfitSpawnEvil
	endIf
	return spawnOutfit
endFunction

LeveledItem Function Proteus_GetSpawnLeveledItem(Actor target)
    LeveledItem spawnLeveledItem
    if target == ZZCustomF1
        spawnLeveledItem = ZZProteusOutfitSpawnLI1
    elseif target == ZZCustomF2
        spawnLeveledItem = ZZProteusOutfitSpawnLI2
    elseif target == ZZCustomF3
        spawnLeveledItem = ZZProteusOutfitSpawnLI3
    elseif target == ZZCustomF4
        spawnLeveledItem = ZZProteusOutfitSpawnLI4
    elseif target == ZZCustomF5
        spawnLeveledItem = ZZProteusOutfitSpawnLI5
    elseif target == ZZCustomF6
        spawnLeveledItem = ZZProteusOutfitSpawnLI6
    elseif target == ZZCustomF7
        spawnLeveledItem = ZZProteusOutfitSpawnLI7
    elseif target == ZZCustomF8
        spawnLeveledItem = ZZProteusOutfitSpawnLI8
    elseif target == ZZCustomF9
        spawnLeveledItem = ZZProteusOutfitSpawnLI9
    elseif target == ZZCustomF10
        spawnLeveledItem = ZZProteusOutfitSpawnLI10
    elseif target == ZZCustomM1
        spawnLeveledItem = ZZProteusOutfitSpawnLI11
    elseif target == ZZCustomM2
        spawnLeveledItem = ZZProteusOutfitSpawnLI12
    elseif target == ZZCustomM3
        spawnLeveledItem = ZZProteusOutfitSpawnLI13
    elseif target == ZZCustomM4
        spawnLeveledItem = ZZProteusOutfitSpawnLI14
    elseif target == ZZCustomM5
        spawnLeveledItem = ZZProteusOutfitSpawnLI15
    elseif target == ZZCustomM6
        spawnLeveledItem = ZZProteusOutfitSpawnLI16
    elseif target == ZZCustomM7
        spawnLeveledItem = ZZProteusOutfitSpawnLI17
    elseif target == ZZCustomM8
        spawnLeveledItem = ZZProteusOutfitSpawnLI18
    elseif target == ZZCustomM9
        spawnLeveledItem = ZZProteusOutfitSpawnLI19
    elseif target == ZZCustomM10
        spawnLeveledItem = ZZProteusOutfitSpawnLI20
    elseif target == hostilePlayerCharacter
        spawnLeveledItem = ZZProteusOutfitSpawnLIEvil
    endIf
    return spawnLeveledItem
endFunction


Function ProteusSaveHeadParts(String presetName)
	ActorBase playerBase = player.GetActorBase()
	int headParts = playerBase.GetNumHeadParts()
	Int jHeadPartList
	Int jHeadPartsMap = JMap.object()
	String keyHead = JMap.nextKey(jHeadPartList, "", "")
	Int j = 0
	while j < headparts
		Form value = playerBase.GetNthHeadPart(j) as Form
		j += 1
		jmap.SetForm(jHeadPartsMap, j, value)
		keyHead = JMap.nextKey(jHeadPartList, keyHead, "")
	endWhile
	jvalue.writeToFile(jHeadPartsMap, JContGlobalPath + "/Proteus/Proteus_Character_HeadParts_" + presetName + ".json")
endFunction

Function ProteusLoadHeadParts(String presetName)
	ActorBase playerBase = player.GetActorBase()
	int headParts = playerBase.GetNumHeadParts()
	Int jHeadPartList = jvalue.readFromFile(JContGlobalPath + "/Proteus/Proteus_Character_HeadParts_" + presetName + ".json")
	Int jHeadPartsMap = JMap.object()


	String keyHead = JMap.nextKey(jHeadPartList, "", "")
	while keyHead
		HeadPart value = JMap.GetForm(jHeadPartList, keyHead, none) as HeadPart
		playerBase.SetNthHeadPart(value, keyHead as Int)
		keyHead = JMap.nextKey(jHeadPartList, keyHead, "")
	endWhile
endFunction


;added in 1.9.0
Function Proteus_ReloadSIGEChanges()
	JLoadWeaponsAcrossAllSaves()
	JLoadArmorAcrossAllSaves()
	JLoadSpellAcrossAllSaves()

	JLoadWeaponSpecificSave()
	JLoadArmorSpecificSave()
	JLoadSpellSpecificSave()
EndFunction


















;added in 1.9.0, to make sure values change when switching characters
function JLoadWeaponsAcrossAllSaves()

	Form[] weaponArray = Utility.CreateFormArray(500)
	String[] weaponNameArray = Utility.CreateStringArray(500)

	if(fileExistsAtPath(jcontainers.userDirectory() + "/Proteus/ProteusW_M1_ACROSS_ALL_SAVES.json"))
		Int jWeaponFormList = jvalue.readFromFile(jcontainers.userDirectory() + "/Proteus/ProteusW_M1_ACROSS_ALL_SAVES.json")
		Int jWFormNames = jmap.object()
		String weaponForm = jmap.nextKey(jWeaponFormList, "", "")
		Int i = 0
		Bool insertNewWeapon = true
		while weaponForm
			weapon value = jmap.GetForm(jWeaponFormList, weaponForm, none) as weapon
			if(value != NONE)
				weaponNameArray[i] = weaponForm
				weaponArray[i] = value
				weaponForm = jmap.nextKey(jWeaponFormList, weaponForm, "")
				i += 1
			endIf
		endWhile
		i = 0
		while i < weaponArray.length
			if weaponArray[i] == none
				i = 501
			else
				String weaponName = weaponArray[i].GetName()
				String processedWeaponName = processName(weaponName)
				Weapon weaponTemp = (weaponArray[i] as Weapon)

				if(fileExistsAtPath(jcontainers.userDirectory() + "/Proteus/ProteusW_M2_" + processedWeaponName + ".json"))
					Int JWeaponStatList = jvalue.readFromFile(jcontainers.userDirectory() + "/Proteus/ProteusW_M2_" + processedWeaponName + ".json")
					Int jStats = jmap.object()
					Int j = 0
					String stat = jmap.nextKey(JWeaponStatList, "", "")
					while j < 8
						String value = jmap.GetStr(JWeaponStatList, stat, "")
						if stat == "crit"
							weaponTemp.SetCritDamage(value as Int)
						elseIf stat == "damage"
							weaponTemp.SetBaseDamage(value as Int)
						elseIf stat == "goldval"
							weaponTemp.SetGoldValue(value as Int)
						elseIf stat == "Reach"
							weaponTemp.SetReach(value as Float)
						elseIf stat == "Speed"
							weaponTemp.SetSpeed(value as Float)
						elseIf stat == "Stagger"
							weaponTemp.SetStagger(value as Float)
						elseIf stat == "Weight"
							weaponTemp.SetWeight(value as Float)
						elseif stat == "Type"
						endIf
						stat = jmap.nextKey(JWeaponStatList, stat, "")
						j += 1
					endWhile
				endIf
			endIf
			i += 1
		endWhile
	EndIf
endFunction

function JLoadWeaponSpecificSave()

	String playerName = game.GetPlayer().GetBaseObject().GetName()
	String processedPlayerName = processName(playerName)
	Form[] weaponArray = Utility.CreateFormArray(500)
	String[] weaponNameArray = Utility.CreateStringArray(500)

	if(fileExistsAtPath(jcontainers.userDirectory() + "/Proteus/ProteusW_M1_" + processedPlayerName + ".json"))
		Int jWeaponFormList = jvalue.readFromFile(jcontainers.userDirectory() + "/Proteus/ProteusW_M1_" + processedPlayerName + ".json")
		Int jWFormNames = jmap.object()
		String weaponForm = jmap.nextKey(jWeaponFormList, "", "")
		Int i = 0
		Bool insertNewWeapon = true
		while weaponForm
			weapon value = jmap.GetForm(jWeaponFormList, weaponForm, none) as weapon
			if(value != NONE)
				weaponNameArray[i] = weaponForm
				weaponArray[i] = value
				weaponForm = jmap.nextKey(jWeaponFormList, weaponForm, "")
				i += 1
			endIf
		endWhile
		i = 0
		while i < weaponArray.length
			if weaponArray[i] == none
				i = 501
			else
				String weaponName = weaponArray[i].GetName()
				String processedWeaponName = processName(weaponName)
				Weapon weaponTemp = (weaponArray[i] as Weapon)

				if(fileExistsAtPath(jcontainers.userDirectory() + "/Proteus/ProteusW_M2_" + processedPlayerName + "_" + processedWeaponName + ".json"))
					Int JWeaponStatList = jvalue.readFromFile(jcontainers.userDirectory() + "/Proteus/ProteusW_M2_" + processedPlayerName + "_" + processedWeaponName + ".json")
					Int jStats = jmap.object()
					Int j = 0
					String stat = jmap.nextKey(JWeaponStatList, "", "")
					while j < 8
						String value = jmap.GetStr(JWeaponStatList, stat, "")
						if stat == "crit"
							weaponTemp.SetCritDamage(value as Int)
						elseIf stat == "damage"
							weaponTemp.SetBaseDamage(value as Int)
						elseIf stat == "goldval"
							weaponTemp.SetGoldValue(value as Int)
						elseIf stat == "Reach"
							weaponTemp.SetReach(value as Float)
						elseIf stat == "Speed"
							weaponTemp.SetSpeed(value as Float)
						elseIf stat == "Stagger"
							weaponTemp.SetStagger(value as Float)
						elseIf stat == "Weight"
							weaponTemp.SetWeight(value as Float)
						elseif stat == "Type"
						endIf
						stat = jmap.nextKey(JWeaponStatList, stat, "")
						j += 1
					endWhile
				endIf
			endIf
			i += 1
		endWhile
	EndIf
endFunction

function JLoadSpellSpecificSave()
	String playerName = game.GetPlayer().GetBaseObject().GetName()
	String processedPlayerName = processName(playerName)
	Form[] spellArray = Utility.CreateFormArray(500)
	String[] spellNameArray = Utility.CreateStringArray(500)

	if(fileExistsAtPath(jcontainers.userDirectory() + "/Proteus/ProteusS_M1_" + processedPlayerName + ".json"))
		Int jSpellFormList = jvalue.readFromFile(jcontainers.userDirectory() + "/Proteus/ProteusS_M1_" + processedPlayerName + ".json")
		Int jWFormNames = jmap.object()
		String spellForm = jmap.nextKey(jSpellFormList, "", "")
		Int i = 0
		Bool insertNewSpell = true
		while spellForm
			spell value = jmap.GetForm(jSpellFormList, spellForm, none) as spell
			if(value != NONE)
				spellNameArray[i] = spellForm
				spellArray[i] = value
				spellForm = jmap.nextKey(jSpellFormList, spellForm, "")
				i += 1
			endIf
		endWhile
		i = 0
		while i < spellArray.length
			if spellArray[i] == none
				i = 501
			else
				String spellName = spellArray[i].GetName()
				String processedSpellName = processName(spellName)
				Int numEffects = (spellArray[i] as Spell).GetNumEffects()
				Int z = 0
				while z < numEffects
					Int zVar = z + 1


					if(fileExistsAtPath(jcontainers.userDirectory() + "/Proteus/ProteusS_M2_" + processedPlayerName + "_" + processedSpellName + zVar as String + ".json"))
						Int JSpellStatList = jvalue.readFromFile(jcontainers.userDirectory() + "/Proteus/ProteusS_M2_" + processedPlayerName + "_" + processedSpellName + zVar as String + ".json")
						Int jStats = jmap.object()
						Int j = 0
						String stat = jmap.nextKey(JSpellStatList, "", "")
						while j < 3
							String value = jmap.GetStr(JSpellStatList, stat, "")
							if stat == "area"
								(spellArray[i] as Spell).SetNthEffectArea(z, value as Int)
							elseIf stat == "duration"
								(spellArray[i] as Spell).SetNthEffectDuration(z, value as Int)
							elseIf stat == "magnitude"
								(spellArray[i] as Spell).SetNthEffectMagnitude(z, value as Float)
							endIf
							stat = jmap.nextKey(JSpellStatList, stat, "")
							j += 1
						endWhile
						z += 1
					EndIf
				endWhile
				i += 1
			endIf
		endWhile
	EndIf
endFunction

function JLoadSpellAcrossAllSaves()
	if(fileExistsAtPath(jcontainers.userDirectory() + "/Proteus/ProteusS_M1_ACROSS_ALL_SAVES.json"))
		Form[] spellArray = Utility.CreateFormArray(500)
		String[] spellNameArray = Utility.CreateStringArray(500)
	
		Int jSpellFormList = jvalue.readFromFile(jcontainers.userDirectory() + "/Proteus/ProteusS_M1_ACROSS_ALL_SAVES.json")
		Int jWFormNames = jmap.object()
		String spellForm = jmap.nextKey(jSpellFormList, "", "")
		Int i = 0
		Bool insertNewSpell = true
		while spellForm
			spell value = jmap.GetForm(jSpellFormList, spellForm, none) as spell
			if(value != NONE)
				spellNameArray[i] = spellForm
				spellArray[i] = value
				spellForm = jmap.nextKey(jSpellFormList, spellForm, "")
				i += 1
			endIf
		endWhile
		i = 0
		while i < spellArray.length
			if spellArray[i] == none
				i = 501
			else
				String spellName = spellArray[i].GetName()
				String processedSpellName = processName(spellName)
				Int numEffects = (spellArray[i] as Spell).GetNumEffects()
				Int z = 0
				while z < numEffects
					Int zVar = z + 1

					if(fileExistsAtPath(jcontainers.userDirectory() + "/Proteus/ProteusS_M2_" + processedSpellName + zVar as String + ".json"))
						Int JSpellStatList = jvalue.readFromFile(jcontainers.userDirectory() + "/Proteus/ProteusS_M2_" + processedSpellName + zVar as String + ".json")
						Int jStats = jmap.object()
						Int j = 0
						String stat = jmap.nextKey(JSpellStatList, "", "")
						while j < 3
							String value = jmap.GetStr(JSpellStatList, stat, "")
							if stat == "area"
								(spellArray[i] as Spell).SetNthEffectArea(z, value as Int)
							elseIf stat == "duration"
								(spellArray[i] as Spell).SetNthEffectDuration(z, value as Int)
							elseIf stat == "magnitude"
								(spellArray[i] as Spell).SetNthEffectMagnitude(z, value as Float)
							endIf
							stat = jmap.nextKey(JSpellStatList, stat, "")
							j += 1
						endWhile
					endIf
					z += 1
				endWhile
				i += 1
			endIf
		endWhile
	EndIf
endFunction

function JLoadArmorSpecificSave()
	String playerName = game.GetPlayer().GetBaseObject().GetName()
	String processedPlayerName = processName(playerName)

	Form[] armorArray = Utility.CreateFormArray(500)
	String[] armorNameArray = Utility.CreateStringArray(500)


	if(fileExistsAtPath(jcontainers.userDirectory() + "/Proteus/ProteusA_M1_" + processedPlayerName + ".json"))
		Int jArmorFormList = jvalue.readFromFile(jcontainers.userDirectory() + "/Proteus/ProteusA_M1_" + processedPlayerName + ".json")
		Int jWFormNames = jmap.object()
		String armorForm = jmap.nextKey(jArmorFormList, "", "")
		Int i = 0
		Bool insertNewArmor = true
		while armorForm
			armor value = jmap.GetForm(jArmorFormList, armorForm, none) as armor
			if(value != NONE)
				armorNameArray[i] = armorForm
				armorArray[i] = value
				armorForm = jmap.nextKey(jArmorFormList, armorForm, "")
				i += 1
			endIf
		endWhile
		i = 0
		while i < armorArray.length
			if armorArray[i] == none
				i = 501
			else
				String armorName = armorArray[i].GetName()
				String processedArmorName = processName(armorName)
				Armor armorTemp = armorArray[i] as Armor

				if(fileExistsAtPath(jcontainers.userDirectory() + "/Proteus/ProteusA_M2_" + processedPlayerName + "_" + processedArmorName + ".json"))
					Int JArmorStatList = jvalue.readFromFile(jcontainers.userDirectory() + "/Proteus/ProteusA_M2_" + processedPlayerName + "_" + processedArmorName + ".json")
					Int jStats = jmap.object()
					Int j = 0
					String stat = jmap.nextKey(JArmorStatList, "", "")
					while j < 5
						String value = jmap.GetStr(JArmorStatList, stat, "")
						if stat == "armorrating"
							armorTemp.SetArmorRating(value as Int)
						elseIf stat == "weightclass"
							armorTemp.SetWeightClass(value as Int)
						elseIf stat == "goldval"
							armorTemp.SetGoldValue(value as Int)
						elseIf stat == "Weight"
							armorTemp.SetWeight(value as Float)
						elseIf stat == "Type"
							if(value == "HeavyArmor")
								if(armorTemp.HasKeyword(LightArmorKWD) == TRUE)
									ProteusReplaceKeywordOnForm(armorTemp, HeavyArmorKWD, LightArmorKWD)
								elseif(armorTemp.HasKeyword(HeavyArmorKWD) == FALSE)
									ProteusAddKeywordToForm(armorTemp, HeavyArmorKWD)
								endIf
								armorTemp.SetWeightClass(1)
							elseif(value == "LightArmor")
								if(armorTemp.HasKeyword(HeavyArmorKWD) == TRUE)
									ProteusReplaceKeywordOnForm(armorTemp, lightArmorKWD, heavyArmorKWD)
								elseif(armorTemp.HasKeyword(lightArmorKWD) == FALSE)
									ProteusAddKeywordToForm(armorTemp, lightArmorKWD)
								endIf
								armorTemp.SetWeightClass(0)
							elseif(value == "NoType")
								if(armorTemp.HasKeyword(HeavyArmorKWD) == TRUE)
									ProteusRemoveKeywordOnForm(armorTemp, HeavyArmorKWD)
								endIf
								if(armorTemp.HasKeyword(LightArmorKWD) == TRUE)
									ProteusRemoveKeywordOnForm(armorTemp, LightArmorKWD)
								endif
								armorTemp.SetWeightClass(2)
							endIf
						endIf
						stat = jmap.nextKey(JArmorStatList, stat, "")
						j += 1
					endWhile
				endIf
			endIf
			i += 1
		endWhile
	EndIf
endFunction

function JLoadArmorAcrossAllSaves()
	Form[] armorArray = Utility.CreateFormArray(500)
	String[] armorNameArray = Utility.CreateStringArray(500)

	if(fileExistsAtPath(jcontainers.userDirectory() + "/Proteus/ProteusA_M1_ACROSS_ALL_SAVES.json"))
		Int jArmorFormList = jvalue.readFromFile(jcontainers.userDirectory() + "/Proteus/ProteusA_M1_ACROSS_ALL_SAVES.json")
		Int jWFormNames = jmap.object()
		String armorForm = jmap.nextKey(jArmorFormList, "", "")
		Int i = 0
		Bool insertNewArmor = true
		while armorForm
			armor value = jmap.GetForm(jArmorFormList, armorForm, none) as armor
			if(value != NONE)
				armorNameArray[i] = armorForm
				armorArray[i] = value
				armorForm = jmap.nextKey(jArmorFormList, armorForm, "")
				i += 1
			endIf
		endWhile
		i = 0
		while i < armorArray.length
			if armorArray[i] == none
				i = 501
			else
				String armorName = armorArray[i].GetName()
				String processedArmorName = processName(armorName)
				Armor armorTemp = armorArray[i] as Armor

				if(fileExistsAtPath(jcontainers.userDirectory() + "/Proteus/ProteusA_M2_" + processedArmorName + ".json"))
					Int JArmorStatList = jvalue.readFromFile(jcontainers.userDirectory() + "/Proteus/ProteusA_M2_" + processedArmorName + ".json")
					Int jStats = jmap.object()
					Int j = 0
					String stat = jmap.nextKey(JArmorStatList, "", "")
					while j < 5
						String value = jmap.GetStr(JArmorStatList, stat, "")
						if stat == "armorrating"
							armorTemp.SetArmorRating(value as Int)
						elseIf stat == "weightclass"
							armorTemp.SetWeightClass(value as Int)
						elseIf stat == "goldval"
							armorTemp.SetGoldValue(value as Int)
						elseIf stat == "Weight"
							armorTemp.SetWeight(value as Float)
						elseIf stat == "Type"
							if(value == "HeavyArmor")
								if(armorTemp.HasKeyword(LightArmorKWD) == TRUE)
									ProteusReplaceKeywordOnForm(armorTemp, HeavyArmorKWD, LightArmorKWD)
								elseif(armorTemp.HasKeyword(HeavyArmorKWD) == FALSE)
									ProteusAddKeywordToForm(armorTemp, HeavyArmorKWD)
								endIf
								armorTemp.SetWeightClass(1)
							elseif(value == "LightArmor")
								if(armorTemp.HasKeyword(HeavyArmorKWD) == TRUE)
									ProteusReplaceKeywordOnForm(armorTemp, lightArmorKWD, heavyArmorKWD)
								elseif(armorTemp.HasKeyword(lightArmorKWD) == FALSE)
									ProteusAddKeywordToForm(armorTemp, lightArmorKWD)
								endIf
								armorTemp.SetWeightClass(0)
							elseif(value == "NoType")
								if(armorTemp.HasKeyword(HeavyArmorKWD) == TRUE)
									ProteusRemoveKeywordOnForm(armorTemp, HeavyArmorKWD)
								endIf
								if(armorTemp.HasKeyword(LightArmorKWD) == TRUE)
									ProteusRemoveKeywordOnForm(armorTemp, LightArmorKWD)
								endif
								armorTemp.SetWeightClass(2)
							endIf
						endIf
						stat = jmap.nextKey(JArmorStatList, stat, "")
						j += 1
					endWhile
				endIf
			endIf
			i += 1
		endWhile
	EndIf
endFunction









;gets a name for the form shown in menus, either a given name or the editorID if given name is blank
String Function GetFormMenuName(Form selectedItem) 
    String name = selectedItem.GetName()
    if(name == "")
        name = ProteusGetFormEditorID(selectedItem)
        if(name == "")
            name = "(Missing Name)"
        endif
        return name
    else
        return name
    endif
EndFunction

;rounding script for numbers on menus
string Function Cheat_Round(float number, int precision) 
    string result = number as int
    number -= number as int
    if precision > 0
        result += "."
    endif
    while precision > 0
        number *= 10
        precision -= 1
        if precision == 0
            number += 0.5
        endif
        result += number as int
        number -= number as int
    endwhile
    return result
EndFunction

;base menu for adding items, spells, perks, etc.
Function Proteus_CheatBaseMenu(Actor target, int startingPoint, int currentPage, int typeCode, Bool searchBool, Bool repeatSame) 
	;initial set up of type strings and associated process variables

    if repeatSame == false
        showViewInventoryOption = true
        typeString = Proteus_GetTypeString(typeCode)
        allGameItems = Utility.CreateFormArray(10000)
        menuNames = Utility.CreateStringArray(10000)
        if searchBool == true
            allGameItems = foundForms
        else
            allGameItems = ProteusGetAllByFormId(typeCode) ;get all Items in game and from mods
        endIf
    endIf
    Debug.Notification(typeString + " menu loading...may take a few seconds!")

    if repeatSame == false
        startingPointInitial = startingPoint
        numPages = Math.Ceiling(allGameItems.Length / 127 as Float) as Int
        offset = 0
        quitOption = -2
        searchOption = -2
        addAllOption = -2
        exploreOption = -2
        backToModListOption = -2
        viewInventoryScreenOption = -2

        listMenuBase = UIExtensions.GetMenu("UIListMenu") as UIListMenu
        int i = 0
        if(typeCode != 999)
            listMenuBase.AddEntryItem("[Search" + typeString + "]")
            searchOption = i
            offset+=1
            i+=1
            listMenuBase.AddEntryItem("[Explore" + typeString + " by Mod]")
            exploreOption = i
            offset+=1
            i+=1
        endIf

        if(numPages <= 5 && showViewInventoryOption == true)
            listMenuBase.AddEntryItem("[View" + typeString + " in Inventory Screen]")
            viewInventoryScreenOption = i
            offset+=1
            i+=1
        endIf
        if typeCode == 43
            listMenuBase.AddEntryItem("[Spawn All" + typeString + "]")
            addAllOption = i
            offset+=1
            i+=1
        else
            listMenuBase.AddEntryItem("[Add All" + typeString + "]")
            addAllOption = i
            offset+=1
            i+=1
        endIf
        
        while startingPoint < allGameItems.Length && i < 128
            String name
            if repeatSame == true
                name = menuNames[startingPoint]
            else
			    name = GetFormMenuName(allGameItems[startingPoint])
                menuNames[startingPoint] = name
            endIf
            listMenuBase.AddEntryItem(name)
            i += 1
            startingPoint += 1
			if(allGameItems[startingPoint] == NONE)
				i = 128
			endIf
			if(i == 127)
                listMenuBase.AddEntryItem("[Continue to Page " + Cheat_Round(currentPage + 1, 0) as String + " of " + Cheat_Round(numPages, 0) as String + "]")
                i = 128
            endIf
        endwhile
        startingPointForward = startingPoint
    EndIf

    listMenuBase.OpenMenu()
    int result = listMenuBase.GetResultInt()
    if result == searchOption ;search option
        String searchTerm = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Search for:", "")
        Utility.Wait(0.1)
        Int lengthSearchTerm = StringUtil.GetLength(searchTerm)
        if (lengthSearchTerm > 0)   
            foundForms = ProteusGetItemBySearch(searchTerm, typeCode, "")
            Proteus_CheatBaseMenu(target, 0, 1, typeCode, true, false)
        else
            Debug.Notification("Invalid length search term.")
            if(searchBool == false)
                Proteus_CheatBaseMenu(target, 0, 1 ,typeCode, false,  true)
            else
                Proteus_CheatBaseMenu(target, 0, 1 ,typeCode, true, true)
            endIf
        endIf
    elseif result == exploreOption ;mod explorer option
		Utility.Wait(0.1)
        String[] tempStringArray = NONE
		Proteus_ModExplorer(target, 0, 1, typeCode, false, true)    
    elseif result == viewInventoryScreenOption
        Debug.Notification(typeString + " inventory menu loading...may take a few seconds!")	
		Proteus_RemoveAllItems(ZZCheatTempContainer, NONE)	
        int z = 0
        int allGameItemsLength = allGameItems.Length
        while z < allGameItemsLength && allGameItems[z]
            ZZCheatTempContainer.AddItem(allGameItems[z])
            z+=1
        endWhile
		Utility.Wait(0.1)
        ZZCheatTempContainer.Activate(target)
    elseif result == addAllOption
        int j = 0
        if(typeCode != 92 && typeCode != 22 && typeCode != 119 && typeCode != 43)
            while j < allGameItems.Length
                target.AddItem(allGameItems[j], 1, true)
                j+=1
		    endWhile
            Debug.Notification(j + " items added to inventory.")
        elseif typeCode == 92
            while j < allGameItems.Length
                target.AddPerk(allGameItems[j] as Perk)
                j+=1
            endWhile
            Debug.Notification(j + " perks added.")
        elseif typeCode == 22
            while j < allGameItems.Length
                target.AddSpell(allGameItems[j] as Spell)
                j+=1
            endWhile
            Debug.Notification(j + " spells added.")
        elseif typeCode == 119
            while j < allGameItems.Length
                target.AddShout(allGameItems[j] as Shout)
                j+=1
                int s = 0
                while (allGameItems[j] as Shout).GetNthWordOfPower(s)
                    WordOfPower wordTemp = (allGameItems[j] as Shout).GetNthWordOfPower(s)
                    Game.UnlockWord(wordTemp)
                    s+=1
                endWhile
            endWhile
            Debug.Notification(j + " shouts added.")
        elseif typeCode  == 43
            while j < allGameItems.Length
                target.PlaceAtMe(allGameItems[j], 1)
                j+=1
            endWhile
            Debug.Notification(j + " NPCs spawned.")
        endIf
	elseif result == 127 ;next page option
        currentPage += 1
        if(searchBool == false)
            Proteus_CheatBaseMenu(target, startingPointForward, currentPage, typeCode, false, false)
        else
            Proteus_CheatBaseMenu(target, startingPointForward, currentPage, typeCode, true, false)
        endIf
    elseif(result > 0 && result != 127)
            Form selectedItem
            if startingPointForward > 127
                selectedItem = allGameItems[startingPointInitial + result - offset]
            else
                selectedItem = allGameItems[result - offset]
            endIf

            if(showViewInventoryOption == false)
                if typeCode == 22 ;spell
                    target.AddSpell(selectedItem as Spell)
                elseif typeCode == 119 ;shout
                    target.AddShout(selectedItem as Shout)
                    int s = 0
                    while (selectedItem as Shout).GetNthWordOfPower(s)
                        WordOfPower wordTemp = (selectedItem as Shout).GetNthWordOfPower(s)
                        Game.UnlockWord(wordTemp)
                        s+=1
                    endWhile
                    Debug.Notification(selectedItem.getName() + " added.")
                elseif typeCode == 92 ;perk
                    target.AddPerk(selectedItem as Perk)
                    Debug.Notification(selectedItem.getName() + " added.")
                elseif typeCode == 43 ;NPC
                    Int itemAmount = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Spawn how many " + selectedItem.GetName() + "?", "1") as Int
                    Utility.Wait(0.1)
                    if (itemAmount > 0)   
                        target.PlaceAtMe(selectedItem, itemAmount)
                    elseif itemAmount != 0
                        Debug.Notification("Invalid amount entered.")
                    endIf
                elseif typeCode == 124 ;outfit
                    target.SetOutfit(selectedItem as Outfit)
                elseif typeCode == 98 ;voice type
                    target.GetActorBase().SetVoiceType(selectedItem as VoiceType)
                endIf
            else
                Int itemAmount = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Add how many " + selectedItem.GetName() + "?", "1") as Int
                Utility.Wait(0.1)
                if (itemAmount > 0)   
                    target.AddItem(selectedItem, itemAmount,  true)
                    String name = selectedItem.GetName()
                    Debug.Notification(Cheat_Round(itemAmount, 0) + " " + name + " added to inventory.")
                    if(typeCode == 41 || typeCode == 26 || typeCode == 42)
                        Utility.Wait(0.1)
                        target.EquipItem(selectedItem)
                    endIf
                elseif itemAmount != 0
                    Debug.Notification("Invalid amount entered.")
                endIf
            endIf

            if(searchBool == false)
                Proteus_CheatBaseMenu(target, startingPointInitial, currentPage, typeCode, false, true)
            else
                Proteus_CheatBaseMenu(target, startingPointInitial, currentPage, typeCode, true, true)
            endIf
    endIf
EndFunction

Function Proteus_ModExplorer(Actor target, int startingPoint, int currentPage, int typeCode, bool searchBool, bool initialSetup) 
	Debug.Notification("Mod list generating...may take a few seconds!")
    int i = 0
    ;initial setup and calculation of number of active mods
    if initialSetup == true
        
        String jContDirectory = jcontainers.userdirectory()

        modNames = Utility.CreateStringArray(5000)

        if(fileExistsAtPath(jContDirectory + "/Skyrim Cheat Engine/ModList.json"))
            Int jModList = jvalue.readFromFile(jContDirectory + "/Skyrim Cheat Engine/ModList.json")
            ;Int jModMap = jmap.object()
            String jModKey = jmap.nextKey(jModList, "", "")
            while jModKey 
                String value = jmap.GetStr(jModList , jModKey, "")
                modNames[i] = value
                i+=1
                jModKey = jmap.nextKey(jModList, jModKey, "")
            endwhile
            totalMods = i
            menuNames = Utility.CreateStringArray(totalMods)
            modNames = SortArrayString(modNames)
            menuNames = modNames

        else
            int numRegularMods = Game.GetModCount()
            int numLightMods = Game.GetLightModCount()
            totalMods = numRegularMods + numLightMods
            modNames = Utility.CreateStringArray(totalMods)
            while i < numRegularMods
                modNames[i] = Game.GetModName(i)
                i += 1
            EndWhile
            int j = 0
            while j < numLightMods
                modNames[i] = Game.GetLightModName(j)
                i += 1
                j += 1
            EndWhile
            menuNames = Utility.CreateStringArray(totalMods)
            modNames = SortArrayString(modNames)
            menuNames = modNames
        endIf
    endIf

    int loopLimit = 0
    if searchBool == true
        loopLimit = matchingMods
    else
        loopLimit = totalMods
    endIf
    
    numPages = Math.Ceiling(loopLimit / 127 as Float) as Int
    startingPointInitial = startingPoint
	i = 0
	listMenuBase = UIExtensions.GetMenu("UIListMenu") as UIListMenu

    if listMenuBase 
        listMenuBase.AddEntryItem("[Search For Mod]")
        i+=1

        while startingPoint < loopLimit && i < 128
            listMenuBase.AddEntryItem(menuNames[startingPoint])
            i += 1
            startingPoint += 1
			if menuNames[startingPoint] == ""
				i = 128
            elseif i == 127
                listMenuBase.AddEntryItem("[Continue to Page " + Cheat_Round(currentPage + 1, 0) as String + " of " + Cheat_Round(numPages, 0) as String + "]")
                i = 128
            endIf
        endwhile
    EndIf
    listMenuBase.OpenMenu()
    int result = listMenuBase.GetResultInt()
    if result == 0 ;search option
        String searchTerm = ((ZZProteusSkyUIMenu as Form) as UILIB_1).ShowTextInput("Search for mod named:", "")
        Utility.Wait(0.1)
        Int lengthSearchTerm = StringUtil.GetLength(searchTerm)
        if (lengthSearchTerm > 0)  
			int j = 0
			int z = 0
			matchingModNames = Utility.CreateStringArray(10000)
			while j < totalMods 
				Int indexSearch = Stringutil.Find(modNames[j], searchTerm, 0)
				if indexSearch != -1
					matchingModNames[z] = modNames[j]
					z += 1
				endIf
				j+=1
			endWhile
			if z == 0
                Debug.Notification("No matching mods found for search term " + searchTerm + ".")
			endIf
            matchingMods = z
            menuNames = Utility.CreateStringArray(matchingMods)
            menuNames = matchingModNames
            Proteus_ModExplorer(target, 0, 1, typeCode, true, false)
        else
            Debug.Notification("Invalid length search term.")
        endIf
    elseif result == 127 ;next page option
        currentPage += 1
        String[] tempStringArray = NONE
        if(searchBool == true)
            Proteus_ModExplorer(target, startingPoint, currentPage, typeCode, true, false)
        else
            Proteus_ModExplorer(target, startingPoint, currentPage, typeCode, false, false)
        endIf
    elseif(result > 0 && result != 127)
        String selectedMod
        if(startingPoint > 127)
            selectedMod = menuNames[startingPointInitial + result - 1]
        else
            selectedMod = menuNames[result - 1]
        endIf
        
        if typeCode == 999
            int arrayLength = 0
            Form[] weaponArray = ProteusGetAllInModByFormId(41, selectedMod)
            arrayLength += weaponArray.Length
            Form[] armorArray = ProteusGetAllInModByFormId(26, selectedMod)
            arrayLength += armorArray.Length
            Form[] miscArray = ProteusGetAllInModByFormId(32, selectedMod)
            arrayLength += miscArray.Length
            Form[] ammoArray = ProteusGetAllInModByFormId(42, selectedMod)
            arrayLength += ammoArray.Length
            Form[] scrollArray = ProteusGetAllInModByFormId(23, selectedMod)
            arrayLength += scrollArray.Length
            Form[] bookArray = ProteusGetAllInModByFormId(27, selectedMod)
            arrayLength += bookArray.Length
            Form[] keyArray = ProteusGetAllInModByFormId(45, selectedMod)
            arrayLength += keyArray.Length
            Form[] potionArray = ProteusGetAllInModByFormId(46, selectedMod)
            arrayLength += potionArray.Length
            Form[] ingredientArray = ProteusGetAllInModByFormId(30, selectedMod)
            arrayLength += ingredientArray.Length
            Form[] soulGemArray = ProteusGetAllInModByFormId(52, selectedMod)
            arrayLength += soulGemArray.Length
            foundForms = Utility.CreateFormArray(arrayLength)
            int w = 0
            int counterAll = 0
            while w < weaponArray.Length && weaponArray[w]
                foundForms[counterAll] = weaponArray[w]
                w += 1
                counterAll += 1
            endWhile
            w = 0
            while w < armorArray.Length && armorArray[w]
                foundForms[counterAll] = armorArray[w]
                w += 1
                counterAll += 1
            endWhile
            w = 0
            while w < miscArray.Length && miscArray[w]
                foundForms[counterAll] = miscArray[w]
                w += 1
                counterAll += 1
            endWhile
            w = 0
            while w < ammoArray.Length && ammoArray[w]
                foundForms[counterAll] = ammoArray[w]
                w += 1
                counterAll += 1
            endWhile
            w = 0
            while w < scrollArray.Length && scrollArray[w]
                foundForms[counterAll] = scrollArray[w]
                w += 1
                counterAll += 1
            endWhile
            w = 0
            while w < bookArray.Length && bookArray[w]
                foundForms[counterAll] = bookArray[w]
                w += 1
                counterAll += 1
            endWhile
            w = 0
            while w < keyArray.Length && keyArray[w]
                foundForms[counterAll] = keyArray[w]
                w += 1
                counterAll += 1
            endWhile
            w = 0
            while w < potionArray.Length && potionArray[w]
                foundForms[counterAll] = potionArray[w]
                w += 1
                counterAll += 1
            endWhile
            w = 0
            while w < ingredientArray.Length && ingredientArray[w]
                foundForms[counterAll] = ingredientArray[w]
                w += 1
                counterAll += 1
            endWhile
            w = 0
            while w < soulGemArray.Length && soulGemArray[w]
                foundForms[counterAll] = soulGemArray[w]
                w += 1
                counterAll += 1
            endWhile
        else
            foundForms = Utility.CreateFormArray(100000)
            foundForms = ProteusDLLUtils.ProteusGetAllInModByFormId(typeCode, selectedMod)
        endIf
        Proteus_CheatBaseMenu(target, 0, 1, typeCode, true, false)
    endIf
endFunction

;gets string to show in menus based on form typeCode
String function Proteus_GetTypeString(Int typeCode) 
    if typeCode == 41
		typeString = " Weapons"
	elseif typeCode == 32
		typeString = " Misc Items"
	elseif typeCode == 26
		typeString = " Armors"
	elseif typeCode == 23
		typeString = " Scrolls"
	elseif typeCode == 27
		typeString = " Books"
	elseif typeCode == 42
		typeString = " Ammo"
    elseif typeCode == 43
        typeString = " NPCs"
        showViewInventoryOption = false
	elseif typeCode == 45
		typeString = " Keys"
	elseif typeCode == 46
		typeString = " Potions"
    elseif typeCode == 124
        typeString = " Outfits"
        showViewInventoryOption = false
    elseif typeCode == 98
        typeString = " VoiceTypes"
        showViewInventoryOption = false
    elseif typeCode == 30
        typeString = " Ingredients"
    elseif typeCode == 22
        typeString = " Spells"
        showViewInventoryOption = false
    elseif typeCode == 119
        typeString = " Shouts"
        showViewInventoryOption = false
    elseif typeCode == 92
        typeString = " Perks"
        showViewInventoryOption = false
    elseif typeCode == 52
        typeString = " Soul Gems"
    else
        typeString = " Items"
	endIf
    return typeString
endFunction


;new function in 3.1.0
function Proteus_ClearFollowers(String playerName)
	;check for Nether's Follower Framework
	Actor[] playerFollowers = GetPlayerFollowers() ;PO3 function
	Proteus_SaveFollowers(playerName, playerFollowers)

	int i = 0
	int numFollowersStart = playerFollowers.Length
	int numFollowersCurrent = numFollowersStart
	int j = 0
	while i < playerFollowers.Length && playerFollowers[i] && j < 4
		if nffActive == true
			ProteusNethersScript.Proteus_NetherClearFollowers(playerFollowers, playerName)
		elseif effActive == true
			ProteusEFFScript.Proteus_EFFClearFollowers(playerFollowers, playerName)
		endIf
		numFollowersCurrent = GetPlayerFollowers().Length
		if numFollowersCurrent <= 0
			i = 999
		elseif numFollowersCurrent != numFollowersStart
			numFollowersStart = numFollowersCurrent
			i += 1
		endIf
		j+=1
	endWhile
endFunction



function Proteus_SaveFollowers(String playerName, Actor[] playerFollowers)
    
    Quest currentPlayerCharacterQuest = Proteus_GetSpawnQuest(playerName)
    Actor currentPlayerCharacter = Proteus_GetSpawnActor(playerName)

	if currentPlayerCharacterQuest != NONE

        int aliasCount = currentPlayerCharacterQuest.GetNumAliases()
        int i = 0

		;START OFF CLEARING FOLLOWERS THAT ARE NO LONGER PART OF THE PARTY
        while i < aliasCount
			bool clearVal = true
            Actor currentPlayerAliasFollower = (currentPlayerCharacterQuest.GetNthAlias(i) as ReferenceAlias).GetActorRef()
            if currentPlayerAliasFollower != NONE
                int z = 0
                while z < playerFollowers.length
                    if currentPlayerAliasFollower == playerFollowers[z]
                        clearVal = false
                        z = 999
                    endIf
                    z+=1
                endWhile

				;character currentPlayerAliasFollower was not found in the party as a follower, clear it from other party members quests
                if clearVal == true

					;clear active player character alias from the quest of the follower no longer in the party
					If Proteus_GetSpawnQuest(currentPlayerAliasFollower.GetActorBase().GetName()) != NONE
						Quest PlayerAliasFollowerQuest = Proteus_GetSpawnQuest(currentPlayerAliasFollower.GetActorBase().GetName())
						int aliasCount3 = PlayerAliasFollowerQuest.GetNumAliases()
						int y = 0
						while y < aliasCount3
							if (PlayerAliasFollowerQuest.GetNthAlias(y) as ReferenceAlias).GetActorRef() == currentPlayerCharacter
								;Debug.MessageBox("Cleared follower no longer in party: " + (PlayerAliasFollowerQuest.GetNthAlias(y) as ReferenceAlias).GetActorRef().GetActorBase().GetName())
								(PlayerAliasFollowerQuest.GetNthAlias(y) as ReferenceAlias).Clear()
							endIf
							y+=1
						endWhile
					endIf

					;clear other party followers from the quest of the follower no longer in the party
					If Proteus_GetSpawnQuest(currentPlayerAliasFollower.GetActorBase().GetName()) != NONE
						Quest PlayerAliasFollowerQuest = Proteus_GetSpawnQuest(currentPlayerAliasFollower.GetActorBase().GetName())
						int aliasCount3 = PlayerAliasFollowerQuest.GetNumAliases()
						int y = 0
						while y < aliasCount3
							int g = 0
							while g < playerFollowers.Length
								if (PlayerAliasFollowerQuest.GetNthAlias(y) as ReferenceAlias).GetActorRef() == playerFollowers[g]
									;Debug.MessageBox("Cleared follower no longer in party: " + (PlayerAliasFollowerQuest.GetNthAlias(y) as ReferenceAlias).GetActorRef().GetActorBase().GetName() + " from " + (PlayerAliasFollowerQuest.GetNthAlias(y) as ReferenceAlias).GetActorRef().GetActorBase().GetName() + " quest")

									(PlayerAliasFollowerQuest.GetNthAlias(y) as ReferenceAlias).Clear()
								endIf
								g+=1
							endWhile
							y+=1
						endWhile
					endIf
                endIf
            endIf
            i += 1
        endWhile

		;START OFF SAVING CURRENT PLAYER CHARACTER SPANWS
		;reset all aliases in spawn follower quest and save previous aliases in an array
		;Actor[] previousActorAliases = new Actor[10]
		i = 0
		while i < aliasCount
			;previousActorAliases[i] = (currentPlayerCharacterQuest.GetNthAlias(i) as ReferenceAlias).GetActorRef()
			(currentPlayerCharacterQuest.GetNthAlias(i) as ReferenceAlias).Clear()
			i+=1
		endWhile

		;fill in current spawn quest aliases with proper followers
        i = 0
        while i < aliasCount
            if i < playerFollowers.length
                (currentPlayerCharacterQuest.GetNthAlias(i) as ReferenceAlias).ForceRefTo(playerFollowers[i])
				;Debug.MessageBox("Saved " + playerFollowers[i].GetActorBase().GetName() + " " + (currentPlayerCharacterQuest.GetNthAlias(i) as ReferenceAlias).GetActorRef().GetActorBase().GetName())
            endIf
            i+=1
        endWhile

		;clear quest aliases of the quest for each current player followers
		i = 0
		while i < playerFollowers.length
			Quest playerFollowerQuest =  Proteus_GetSpawnQuest(playerFollowers[i].GetActorBase().GetName())
			int playerFollowerQuestAliasCount = currentPlayerCharacterQuest.GetNumAliases()
			int y = 0
			while y < playerFollowerQuestAliasCount
				(playerFollowerQuest.GetNthAlias(y) as ReferenceAlias).Clear()
				y+=1
			endWhile
			i+=1
		endWhile

		;debug.messagebox("phase1")
		;i = 0
		;while i < aliasCount
		;	GenerateFollowerQuestAliasOverview((currentPlayerCharacterQuest.GetNthAlias(i) as ReferenceAlias).GetActorRef().GetActorBase().GetName())
		;	i+=1
		;endWhile
		;GenerateFollowerQuestAliasOverview(Proteus_GetSpawnActor(playerName).GetActorBase().GetName())


		aliasCount = currentPlayerCharacterQuest.GetNumAliases()

		i = 0
		int p = 0 
		while p < aliasCount
			if (currentPlayerCharacterQuest.GetNthAlias(p) as ReferenceAlias).GetActorRef() != NONE

				Actor currentAliasActor = (currentPlayerCharacterQuest.GetNthAlias(p) as ReferenceAlias).GetActorRef()

				Quest FollowerQuest = Proteus_GetSpawnQuest(currentAliasActor.GetActorBase().GetName())
				int FollowerQuestAliasCount = FollowerQuest.GetNumAliases()

				;add the other followers as aliases to follower quest i
				int y = 0
				int z = 0
				while z < aliasCount
					Actor addActor = (currentPlayerCharacterQuest.GetNthAlias(z) as ReferenceAlias).GetActorRef()
					y = 0
					bool addOtherFollower = true
					while y < FollowerQuestAliasCount
						if (FollowerQuest.GetNthAlias(y) as ReferenceAlias).GetActorRef() == addActor
							addOtherFollower = false
							y=999
						endIf
						y+=1
					EndWhile

					if addOtherFollower == true
						y = 0
						while y < FollowerQuestAliasCount
							if (FollowerQuest.GetNthAlias(y) as ReferenceAlias).GetActorRef() == NONE
								if Proteus_GetSpawnActorUsingQuest(FollowerQuest) != addActor
									(FollowerQuest.GetNthAlias(y) as ReferenceAlias).ForceRefTo(addActor)
									y=999
								endIf
							endIf
							y+=1
						EndWhile
					endIf
					z+=1
				endWhile
				
				;add the other followers as aliases to follower quest i
				y = 0
				bool addThis = true
				while y < FollowerQuestAliasCount
					if (FollowerQuest.GetNthAlias(y) as ReferenceAlias).GetActorRef() == currentAliasActor
						addThis = false
						y=999
					endIf
					y+=1
				EndWhile
 
				if addThis == true
					y = 0
					while y < FollowerQuestAliasCount
						if (FollowerQuest.GetNthAlias(y) as ReferenceAlias).GetActorRef() == NONE
							if Proteus_GetSpawnActorUsingQuest(FollowerQuest) != currentAliasActor
								(FollowerQuest.GetNthAlias(y) as ReferenceAlias).ForceRefTo(currentAliasActor)
								y=999
							endIf
						endIf
						y+=1
					EndWhile
				endIf

				;add the player as an alias to follower quest i
				y = 0
				while y < FollowerQuestAliasCount
					if(FollowerQuest.GetNthAlias(y) as ReferenceAlias).GetActorRef() == NONE
						if Proteus_GetSpawnActorUsingQuest(FollowerQuest) != currentPlayerCharacter
							(FollowerQuest.GetNthAlias(y) as ReferenceAlias).ForceRefTo(currentPlayerCharacter)
							y=999
						endIf
					endIf
					y+=1
				endWhile

				;Debug.MessageBox("phase4")
				;Utility.Wait(0.1)
				;i = 0
				;while i < aliasCount
				;;	GenerateFollowerQuestAliasOverview((currentPlayerCharacterQuest.GetNthAlias(i) as ReferenceAlias).GetActorRef().GetActorBase().GetName())
				;	Utility.Wait(0.1)
				;	i+=1
				;endWhile
				;GenerateFollowerQuestAliasOverview((currentPlayerCharacterQuest.GetNthAlias(i) as ReferenceAlias).GetActorRef().GetActorBase().GetName())
				;GenerateFollowerQuestAliasOverview(currentPlayerCharacter.GetActorBase().GetName())

			endIf
			p+=1
		endWhile

		Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn1)
		Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn2) 
		Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn3) 
		Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn4) 
		Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn5)  
		Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn6) 
		Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn7) 
		Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn8) 
		Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn9) 
		Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn10)  
		Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn11)  
		Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn12) 
		Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn13)  
		Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn14)  
		Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn15) 
		Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn16)  
		Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn17) 
		Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn18)  
		Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn19) 
		Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn20)  
	else
        Debug.Notification("Spawn quest is none")
    endIf
endFunction

function GenerateFollowerQuestAliasOverview(String spawnName)
	if(spawnName != "")
		Quest spawnQuest = Proteus_GetSpawnQuest(spawnName)
		int spawnAliasCount = spawnQuest.GetNumAliases()
		int i = 0
		String summaryString
		while i < spawnAliasCount
			summaryString += (spawnQuest.GetNthAlias(i) as ReferenceAlias).GetActorRef().GetActorBase().GetName() + "\n"
			i+=1
		endWhile
		Utility.Wait(0.1)
		Debug.MessageBox(spawnName + "\n\n" + summaryString)
		Utility.Wait(0.1)
	endIf
EndFunction

function Proteus_LoadFollowers(String previousActorString, String currentActorString)

	if nffActive == true || effActive == true

		;set up variables
		Actor previousActor = Proteus_GetSpawnActor(previousActorString)
		Actor currentActor = Proteus_GetSpawnActor(currentActorString)
		Quest spawnQuest = Proteus_GetSpawnQuest(currentActorString)

		if spawnQuest != NONE

			;recruit followers saved in spawnQuest to the active player character
			int aliasCount = spawnQuest.GetNumAliases()
			int i = 0
			int numTotalFollowersCheck = 0
			int numFollowersFilled = 0
			while i < aliasCount
				if(spawnQuest.GetNthAlias(i) as ReferenceAlias).GetActorRef() != NONE
					numTotalFollowersCheck+=1
				endIf
				i+=1
			endWhile
			;Debug.MessageBox("Should be " + numTotalFollowersCheck + " followers.")

			i=0
			int j = 0
			while i < numTotalFollowersCheck
				if (spawnQuest.GetNthAlias(i) as ReferenceAlias).GetActorRef() != NONE && j < 30
					if nffActive == true
						ProteusNethersScript.Proteus_NetherRecruitFollowers((spawnQuest.GetNthAlias(i) as ReferenceAlias).GetActorRef())
					elseif effActive == true
						ProteusEFFScript.Proteus_EFFRecruitFollowers((spawnQuest.GetNthAlias(i) as ReferenceAlias).GetActorRef())
					endIf
					Utility.Wait(0.5)
					int playerCurrentNumFollowers = GetPlayerFollowers().Length
					if i < playerCurrentNumFollowers
						i+=1
					endIf
				else
					i+=1
				endIf
				j+=1
				;Debug.MessageBox("Recruited: " + (spawnQuest.GetNthAlias(i) as ReferenceAlias).GetActorRef().GetActorBase().GetName())
			endWhile

			if nffActive == true
				ProteusNethersScript.Proteus_NetherFollowAll()
			elseif effActive == true
				ProteusEFFScript.Proteus_EFFFollowAll()
			endIf
			Actor[] playerFollowers = GetPlayerFollowers() ;PO3 function

			;String names = ""
			;int t = 0
			;while t < playerFollowers.Length
			;	names += playerFollowers[t].GetActorBase().GetName() + " "
			;	t += 1
			;endWhile
			;Debug.MessageBox("Names: " + names)
			;GenerateFollowerQuestAliasOverview(ZZCustomM1.GetActorBase().GetName())
			;GenerateFollowerQuestAliasOverview(ZZCustomM2.GetActorBase().GetName())
			;GenerateFollowerQuestAliasOverview(ZZCustomM3.GetActorBase().GetName())
			;GenerateFollowerQuestAliasOverview(ZZCustomM4.GetActorBase().GetName())
			;GenerateFollowerQuestAliasOverview(ZZCustomM5.GetActorBase().GetName())
			;GenerateFollowerQuestAliasOverview(ZZCustomM6.GetActorBase().GetName())
			;GenerateFollowerQuestAliasOverview(ZZCustomM7.GetActorBase().GetName())
			;GenerateFollowerQuestAliasOverview(ZZCustomM8.GetActorBase().GetName())

			Utility.Wait(0.1)
			Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn1)
			Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn2) 
			Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn3) 
			Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn4) 
			Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn5)  
			Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn6) 
			Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn7) 
			Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn8) 
			Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn9) 
			Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn10)  
			Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn11)  
			Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn12) 
			Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn13)  
			Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn14)  
			Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn15) 
			Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn16)  
			Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn17) 
			Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn18)  
			Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn19) 
			Proteus_ClearFollowerAlias(playerFollowers, ZZProteusQuestSpawn20)  
		endIf


	endIf
endFunction

bool function Proteus_IsInParty(Actor[] playerFollowers, Actor actorToCheck)
	bool isInParty = false
	int i = 0
	while i < playerFollowers.Length
		if actorToCheck == playerFollowers[i]
			isInParty = true
			i = 999
		endIf
		i+=1
	endWhile
	return isInParty
endFunction

function Proteus_ClearFollowerAlias(Actor[] playerFollowers, Quest spawnOtherQuest)
	int otherQuestAliasCount = spawnOtherQuest.GetNumAliases()
	Actor currentPlayerCharacter = Proteus_GetSpawnActor(player.GetActorBase().GetName())
	int z = 0
	if (spawnOtherQuest != Proteus_GetSpawnQuest(player.GetActorBase().GetName()))
		while z < otherQuestAliasCount
			Actor currentAliasActor = (spawnOtherQuest.GetNthAlias(z) as ReferenceAlias).GetActorRef()
			;remove current party member follower from given quest if the given quest owner is not a follower
			if Proteus_IsInParty(playerFollowers, currentAliasActor) == TRUE
				if Proteus_IsInParty(playerFollowers, Proteus_GetSpawnActorUsingQuest(spawnOtherQuest)) == FALSE
					;Debug.MessageBox("Quest: " + Proteus_GetSpawnActorUsingQuest(spawnOtherQuest).GetActorBase().GetName() + "   NPCCLEARED " + currentAliasActor.GetActorBase().GetName())
					(spawnOtherQuest.GetNthAlias(z) as ReferenceAlias).Clear()
				endIf
			endIf
			;remove player character as an alias from the given quest unless the given quest spawn is a follower
			if currentAliasActor == currentPlayerCharacter
				if Proteus_IsInParty(playerFollowers, Proteus_GetSpawnActorUsingQuest(spawnOtherQuest)) == FALSE
					;Debug.MessageBox("Quest: " + Proteus_GetSpawnActorUsingQuest(spawnOtherQuest).GetActorBase().GetName() + "   PLAYERCLEARED " + currentAliasActor.GetActorBase().GetName())
					(spawnOtherQuest.GetNthAlias(z) as ReferenceAlias).Clear()
				endIf
			endIf
			z+=1
		endWhile
	endIf
endFunction

function Proteus_Vampirism(Int option)
	Quest spawnQuest = Proteus_GetSpawnQuest(player.GetActorBase().GetName())
	if option == 0 ;save character
		Quest vampireQuest = Game.GetFormFromFile(0x000EAFD5, "Skyrim.esm") as Quest
		if vampireQuest.GetStage() >= 10
			spawnQuest.SetStage(10)
		else
			spawnQuest.SetStage(0)
		endIf
	elseif option == 1 ;switch character
		Quest vampireQuest = Game.GetFormFromFile(0x000EAFD5, "Skyrim.esm") as Quest
		if spawnQuest.GetStage() == 10
			vampireQuest.SetStage(0)
		else
			vampireQuest.SetStage(10)
		endIf
	elseif option == 3 ;reset/new character
		Quest vampireQuest = Game.GetFormFromFile(0x000EAFD5, "Skyrim.esm") as Quest
		vampireQuest.SetStage(10)
		Utility.Wait(0.1)
		vampireQuest.SetStage(0)
	endIf
endFunction


Quest function Proteus_GetSpawnQuest(String playerName)
	if ZZCustomM1.GetActorBase().GetName() == playerName
		return ZZProteusQuestSpawn1
	elseif ZZCustomM2.GetActorBase().GetName() == playerName
		return ZZProteusQuestSpawn2
	elseif ZZCustomM3.GetActorBase().GetName() == playerName
		return ZZProteusQuestSpawn3
	elseif ZZCustomM4.GetActorBase().GetName() == playerName
		return ZZProteusQuestSpawn4
	elseif ZZCustomM5.GetActorBase().GetName() == playerName
		return ZZProteusQuestSpawn5
	elseif ZZCustomM6.GetActorBase().GetName() == playerName
		return ZZProteusQuestSpawn6
	elseif ZZCustomM7.GetActorBase().GetName() == playerName
		return ZZProteusQuestSpawn7
	elseif ZZCustomM8.GetActorBase().GetName() == playerName
		return ZZProteusQuestSpawn8
	elseif ZZCustomM9.GetActorBase().GetName() == playerName
		return ZZProteusQuestSpawn9
	elseif ZZCustomM10.GetActorBase().GetName() == playerName
		return ZZProteusQuestSpawn10
	elseif ZZCustomF1.GetActorBase().GetName() == playerName
		return ZZProteusQuestSpawn11
	elseif ZZCustomF2.GetActorBase().GetName() == playerName
		return ZZProteusQuestSpawn12
	elseif ZZCustomF3.GetActorBase().GetName() == playerName
		return ZZProteusQuestSpawn13
	elseif ZZCustomF4.GetActorBase().GetName() == playerName
		return ZZProteusQuestSpawn14
	elseif ZZCustomF5.GetActorBase().GetName() == playerName
		return ZZProteusQuestSpawn15
	elseif ZZCustomF6.GetActorBase().GetName() == playerName
		return ZZProteusQuestSpawn16
	elseif ZZCustomF7.GetActorBase().GetName() == playerName
		return ZZProteusQuestSpawn17
	elseif ZZCustomF8.GetActorBase().GetName() == playerName
		return ZZProteusQuestSpawn18
	elseif ZZCustomF9.GetActorBase().GetName() == playerName
		return ZZProteusQuestSpawn19
	elseif ZZCustomF10.GetActorBase().GetName() == playerName
		return ZZProteusQuestSpawn20
	else
		return NONE
	endIf
endFunction

Actor function Proteus_GetSpawnActor(String playerName)
	if ZZCustomM1.GetActorBase().GetName() == playerName
		return ZZCustomM1
	elseif ZZCustomM2.GetActorBase().GetName() == playerName
		return ZZCustomM2
	elseif ZZCustomM3.GetActorBase().GetName() == playerName
		return ZZCustomM3
	elseif ZZCustomM4.GetActorBase().GetName() == playerName
		return ZZCustomM4
	elseif ZZCustomM5.GetActorBase().GetName() == playerName
		return ZZCustomM5
	elseif ZZCustomM6.GetActorBase().GetName() == playerName
		return ZZCustomM6
	elseif ZZCustomM7.GetActorBase().GetName() == playerName
		return ZZCustomM7
	elseif ZZCustomM8.GetActorBase().GetName() == playerName
		return ZZCustomM8
	elseif ZZCustomM9.GetActorBase().GetName() == playerName
		return ZZCustomM9
	elseif ZZCustomM10.GetActorBase().GetName() == playerName
		return ZZCustomM10
	elseif ZZCustomF1.GetActorBase().GetName() == playerName
		return ZZCustomF1
	elseif ZZCustomF2.GetActorBase().GetName() == playerName
		return ZZCustomF2
	elseif ZZCustomF3.GetActorBase().GetName() == playerName
		return ZZCustomF3
	elseif ZZCustomF4.GetActorBase().GetName() == playerName
		return ZZCustomF4
	elseif ZZCustomF5.GetActorBase().GetName() == playerName
		return ZZCustomF5
	elseif ZZCustomF6.GetActorBase().GetName() == playerName
		return ZZCustomF6
	elseif ZZCustomF7.GetActorBase().GetName() == playerName
		return ZZCustomF7
	elseif ZZCustomF8.GetActorBase().GetName() == playerName
		return ZZCustomF8
	elseif ZZCustomF9.GetActorBase().GetName() == playerName
		return ZZCustomF9
	elseif ZZCustomF10.GetActorBase().GetName() == playerName
		return ZZCustomF10
	else
		return NONE
	endIf
endFunction


Actor function Proteus_GetSpawnActorUsingQuest(Quest questCheck)
    if ZZProteusQuestSpawn1 == questCheck
        return ZZCustomM1
    elseif ZZProteusQuestSpawn2 == questCheck
        return ZZCustomM2
    elseif ZZProteusQuestSpawn3 == questCheck
        return ZZCustomM3
    elseif ZZProteusQuestSpawn4 == questCheck
        return ZZCustomM4
    elseif ZZProteusQuestSpawn5 == questCheck
        return ZZCustomM5
    elseif ZZProteusQuestSpawn6 == questCheck
        return ZZCustomM6
    elseif ZZProteusQuestSpawn7 == questCheck
        return ZZCustomM7
    elseif ZZProteusQuestSpawn8 == questCheck
        return ZZCustomM8
    elseif ZZProteusQuestSpawn9 == questCheck
        return ZZCustomM9
    elseif ZZProteusQuestSpawn10 == questCheck
        return ZZCustomM10
    elseif ZZProteusQuestSpawn11 == questCheck
        return ZZCustomF1
    elseif ZZProteusQuestSpawn12 == questCheck
        return ZZCustomF2
    elseif ZZProteusQuestSpawn13 == questCheck
        return ZZCustomF3
    elseif ZZProteusQuestSpawn14 == questCheck
        return ZZCustomF4
    elseif ZZProteusQuestSpawn15 == questCheck
        return ZZCustomF5
    elseif ZZProteusQuestSpawn16 == questCheck
        return ZZCustomF6
    elseif ZZProteusQuestSpawn17 == questCheck
        return ZZCustomF7
    elseif ZZProteusQuestSpawn18 == questCheck
        return ZZCustomF8
    elseif ZZProteusQuestSpawn19 == questCheck
        return ZZCustomF9
    elseif ZZProteusQuestSpawn20 == questCheck
        return ZZCustomF10
    else
        return NONE
    endIf
endFunction
