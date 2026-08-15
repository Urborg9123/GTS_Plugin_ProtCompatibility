Scriptname ProteusDLLUtils Hidden
Bool Function fileExistsAtPath(String path) global native
Function removeFileAtPath(String path) global native
Spell[] Function GetAllSpells(Actor target) global native
Spell[] Function GetAllFavoritedSpells() global native
Form[] Function GetAllFavoritedItems() global native
Shout[] Function GetAllShouts(Actor target) global native
Perk[] Function GetAllPerks(Actor target) global native
Perk[] Function GetAllVisiblePerks(Actor target) global native
Function RemoveAllSpells(Actor target) global native
Function RemoveAllPerks(Actor target) global native
Function RemovePerksForAllTrees(Actor target) global native
Form[] Function ProteusGetAllInModByFormId(Int typeCode, String modName) global native
Form[] Function ProteusGetAllByFormId(Int typeCode) global native
Form[] Function ProteusGetItemBySearch(String searchTerm, Int typeCode, String modName) global native
Form[] Function ProteusAddAllItemsToArray(ObjectReference target, Bool noEquipped = true, Bool noFavorited = false, Bool noQuestItem = false) global native
Function ProteusReplaceKeywordOnForm(Form target, Keyword keywordAdd, Keyword keywordRemove) global native
Function ProteusAddKeywordToForm(Form target, Keyword keywordToAdd) global native
Bool Function ProteusRemoveKeywordOnForm(Form target, Keyword keywordToRemove) global native
Function ProteusMarkItemAsFavorite(Form target) global native
Function ProteusUnmarkItemAsFavorite(Form target) global native
String Function ProteusGetFormEditorID(Form target) global native
Function SetLevel(Actor target, Int level) global native
