// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_createTreeLink(clickedEntry){

	
	var clickedEntrySubMap = global.treeMap[? clickedEntry];
	var focusedEntrySubMap = global.treeMap[? obj_chain.currentFocusedEntryID];
	var treeSubMap = global.treeMap[? obj_panelPane.functionTree_treeSelected];
	
	//create Link node for Tree
	var linkID = scr_generateRandomHex();
	var linkMap = ds_map_create();
	
	//set source and goal
	ds_map_add(linkMap, "type", "link");
	ds_map_add(linkMap, "source", obj_chain.currentFocusedEntryID);
	ds_map_add(linkMap, "goal", clickedEntry);
	
	//add link node to treeeeee map
	ds_map_add_map(global.treeMap, linkID,linkMap);
	
	//add clicked entry to focused entry goal list
	ds_list_add(focusedEntrySubMap[?"goalLinkList"], linkID);
	
	//update clicked entry sub map
	clickedEntrySubMap[? "sourceLink"] = linkID;
	clickedEntrySubMap[? "level"] = focusedEntrySubMap[?"level"]+1;
	
	//update tree subamp
	ds_list_add(treeSubMap[?"linkIDList"], linkID);
}