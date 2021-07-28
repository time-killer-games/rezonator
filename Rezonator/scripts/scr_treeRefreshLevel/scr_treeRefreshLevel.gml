// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_treeRefreshLevel(tree, entry, level){

	// get tree & entry, make sure they exist
	var treeSubMap = global.treeMap[? tree];
	if (!scr_isNumericAndExists(treeSubMap, ds_type_map)) exit;
	var entrySubMap = global.treeMap[? entry];
	if (!scr_isNumericAndExists(entrySubMap, ds_type_map)) exit;
	
	
	// set level of entry
	entrySubMap[? "level"] = level;
	
	// get goal links for entry
	var goalLinkList = entrySubMap[? "goalLinkList"];
	if (!scr_isNumericAndExists(goalLinkList, ds_type_list)) exit;
	
	// loop through all goal links
	var goalLinkListSize = ds_list_size(goalLinkList);
	for (var i = 0; i < goalLinkListSize; i++) {
		
		// get current goal link, make sure it exists
		var currentLink = goalLinkList[| i];
		var currentLinkSubMap = global.treeMap[? currentLink];
		if (!scr_isNumericAndExists(currentLinkSubMap, ds_type_map)) continue;
		
		var currentLinkGoalEntry = currentLinkSubMap[? "goal"];
		scr_treeRefreshLevel(tree, currentLinkGoalEntry, level + 1);
		treeSubMap[? "maxLevel"] = max(treeSubMap[? "maxLevel"],level+1);
	}

}