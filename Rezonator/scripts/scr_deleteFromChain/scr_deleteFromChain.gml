///@description Remove Link or Chunk
function scr_deleteFromChain(sortVizSetList) {
	
	ds_list_clear(obj_control.chainStretchCheckList);
	
	/*
	if (obj_toolPane.currentTool == obj_toolPane.toolBoxBrush || obj_toolPane.currentTool == obj_toolPane.toolNewWord || obj_control.newWordDeleted || obj_control.deleteNewWord || obj_control.deleteChunkWord) {
		scr_deleteChunk();
	}
	*/
	
	show_debug_message("scr_deleteFromChain() , sortVizSetList: " + string(sortVizSetList));

	
	// get the focused chain's submap
	var chainSubMap = global.nodeMap[? obj_chain.currentFocusedChainID];
	if (!scr_isNumericAndExists(chainSubMap, ds_type_map)) {
		show_debug_message("scr_deleteFromChain() ... chainSubMap does not exist");
		exit;
	}
	var chainType = chainSubMap[? "type"];
	
	// get the focused entry's submap
	var focusedEntry = chainSubMap[? "focused"];
	var focusedEntrySubMap = global.nodeMap[? focusedEntry];
	if (!scr_isNumericAndExists(focusedEntrySubMap, ds_type_map)) {
		show_debug_message("scr_deleteFromChain() ... focusedEntrySubMap does not exist");
		exit;
	}
	
	show_debug_message("scr_deleteFromChain() , CHECK 1");
	var focusedEntryType = ds_map_find_value(focusedEntrySubMap, "type");
	
	// get the focusedEntry's token & displayrow
	var focusedEntryToken = "";
	if (focusedEntryType == "rez" || focusedEntryType == "track") {
		focusedEntryToken = focusedEntrySubMap[? "token"];
	}
	var focusedEntryIsChunk = scr_isChunk(focusedEntryToken);
	
	
	// find where in the chain's setList the focused entry is
	var chainSetList = chainSubMap[? "setIDList"];
	var chainVizSetList = chainSubMap[? "vizSetIDList"];
	var chainLinkList = chainSubMap[? "linkIDList"];
	
	// get the focused entry's sourceLink's submap
	var sourceLink = focusedEntrySubMap[? "sourceLink"];
	
	// if this entry has no source...
	var focusedEntryGoalLinkList = focusedEntrySubMap[? "goalLinkList"];
	var focusedEntryGoalLinkListSize = ds_list_size(focusedEntryGoalLinkList);
	if (sourceLink == "") {
		
		// if no source and no goal, we delete the entry and the chain!
		if (focusedEntryGoalLinkListSize < 1) {
			// remove the focusedEntry from this word's inChainsList (if it is a rez or track)
			if (focusedEntryType == "rez" || focusedEntryType == "track") {
				var focusedEntryToken = focusedEntrySubMap[? "token"];
				
				if (obj_control.rightClickonWord and obj_control.deleteChunkWord) {
					if (obj_control.rightClickWordID != focusedEntryWord) {
						exit;
					}
				}
				
				scr_removeChainFromInChainsList(obj_chain.currentFocusedChainID, focusedEntryToken);
			}
			else if (focusedEntryType == "stack"){
				var focusedEntryUnit = focusedEntrySubMap[? "unit"];
			}
			show_debug_message("scr_deleteFromChain() , CHECK 2");
			
			// delete and destroy the focused entry and its chain
			scr_deleteFromNodeMap(focusedEntry);
			scr_deleteFromNodeMap(obj_chain.currentFocusedChainID);
			ds_map_destroy(focusedEntrySubMap);
			ds_map_destroy(chainSubMap);	
			
			scr_removeChainFromLists(obj_chain.currentFocusedChainID, chainType);
			
			// unfocus chain
			obj_chain.currentFocusedChainID = "";
			exit;
		}
		// if no source but it has at least 1 goal, we will restructure the links
		else {
			show_debug_message("scr_deleteFromChain() , CHECK 3");
			var firstGoalLink = focusedEntryGoalLinkList[| 0];
			var firstGoalLinkSubMap = global.nodeMap[? firstGoalLink];
			if (!scr_isNumericAndExists(firstGoalLinkSubMap, ds_type_map)) {
				show_debug_message("scr_deleteFromChain() ... firstGoalLinkSubMap does not exist");
				exit;
			}
			var goalEntry = firstGoalLinkSubMap[? "goal"];
			var goalEntrySubMap = global.nodeMap[? goalEntry];
			if (!scr_isNumericAndExists(goalEntrySubMap, ds_type_map)) {
				show_debug_message("scr_deleteFromChain() ... goalEntrySubMap does not exist");
				exit;
			}
			show_debug_message("scr_deleteFromChain() , CHECK 4");
			// go through all goalLinks (excluding firstGoalLink) and set their sources to be goalEntry
			var goalEntryGoalLinkList = goalEntrySubMap[? "goalLinkList"];
			for (var i = 0; i < focusedEntryGoalLinkListSize; i++) {
				 var currentGoalEntryGoalLink = focusedEntryGoalLinkList[| i];
				 if (currentGoalEntryGoalLink != firstGoalLink) {
					 var currentGoalEntryGoalLinkSubMap = global.nodeMap[? currentGoalEntryGoalLink];
					 ds_map_replace(currentGoalEntryGoalLinkSubMap, "source", goalEntry);
					 ds_list_add(goalEntryGoalLinkList, currentGoalEntryGoalLink);
				 }
			}
			
			// remove the focusedEntry from this token's inChainsList (if it is a rez or track)
			if (focusedEntryType == "rez" || focusedEntryType == "track") {
				scr_removeChainFromInChainsList(obj_chain.currentFocusedChainID, focusedEntryToken);
			}
			else if (focusedEntryType == "stack"){
				var focusedEntryUnit = focusedEntrySubMap[? "unit"];
			}
			show_debug_message("scr_deleteFromChain() , CHECK 5");
			
			// remove the focused entry from its chain's setList and delete it from nodeMap
			scr_deleteFromList(chainSetList, focusedEntry);
			scr_deleteFromNodeMap(focusedEntry);
			ds_map_destroy(focusedEntrySubMap);
			
			// remove the entry from the vizSetList
			scr_deleteFromList(chainVizSetList, focusedEntry);
			
			// delete & destroy the firstGoalLink and all references to it
			ds_map_destroy(firstGoalLinkSubMap);
			var chainLinkListIndex = ds_list_find_index(chainLinkList, firstGoalLink);
			ds_list_delete(chainLinkList, chainLinkListIndex);
			ds_map_replace(goalEntrySubMap, "sourceLink", "");
			scr_deleteFromNodeMap(firstGoalLink);
			
			// sort vizSetList!
			if (sortVizSetList) {
				scr_sortVizSetIDList(obj_chain.currentFocusedChainID);
			}
			
			scr_deleteFromChainVoidCheck(obj_chain.currentFocusedChainID, focusedEntryToken, true);
			
			// focus goalEntry
			ds_map_replace(chainSubMap, "focused", goalEntry);
			exit;
		}
	}
	
	var sourceLinkSubMap = global.nodeMap[? sourceLink];
	if (!scr_isNumericAndExists(sourceLinkSubMap, ds_type_map)) {
		show_debug_message("scr_deleteFromChain() ... sourceLinkSubMap does not exist");
		exit;
	}

	// get the sourceLink's source (sourceEntry) submap
	var sourceEntry = sourceLinkSubMap[? "source"];
	var sourceEntrySubMap = global.nodeMap[? sourceEntry];
	if (!scr_isNumericAndExists(sourceEntrySubMap, ds_type_map)) {
		show_debug_message("scr_deleteFromChain() ... sourceEntrySubMap does not exist");
		exit;
	}
	
	show_debug_message("scr_deleteFromChain() , CHECK 6");
	
	// remove the sourceLink from sourceEntry's goalLinkList
	var sourceEntryGoalLinkList = sourceEntrySubMap[? "goalLinkList"];
	var goalLinkListIndex = ds_list_find_index(sourceEntryGoalLinkList, sourceLink);
	show_debug_message("scr_deleteFromChain() ... goalLinkListIndex: " + string(goalLinkListIndex));
	ds_list_delete(sourceEntryGoalLinkList, goalLinkListIndex);
	
	// remove the sourceLink from chain's linkList
	var chainLinkListIndex = ds_list_find_index(chainLinkList, sourceLink);
	show_debug_message("scr_deleteFromChain() ... chainLinkListIndex: " + string(chainLinkListIndex));
	ds_list_delete(chainLinkList, chainLinkListIndex);
	
	// remove sourceLink from nodeMap and destroy sourceLink
	scr_deleteFromNodeMap(sourceLink);
	ds_map_destroy(sourceLinkSubMap);
	
	// loop through the goals for the current entry and reset their sources to be sourceEntry
	for (var i = 0; i < focusedEntryGoalLinkListSize; i++) {
		
		var currentGoalLink = focusedEntryGoalLinkList[| i];
		var currentGoalLinkSubMap = global.nodeMap[? currentGoalLink];
		ds_map_replace(currentGoalLinkSubMap, "source", sourceEntry);
		
		// add the currentGoalLink to its new source's goalLinkList
		ds_list_add(sourceEntryGoalLinkList, currentGoalLink);
	}
	
	// remove the focusedEntry from its chain's setList
	scr_deleteFromList(chainSetList, focusedEntry);
	
	// remove the entry from the vizSetList
	scr_deleteFromList(chainVizSetList, focusedEntry);
	
	// unfocus focusedEntry
	var newFocusedEntry = (ds_exists(sourceEntrySubMap, ds_type_map)) ? sourceEntry : "";
	show_debug_message("chainSubMap: " + string(chainSubMap) + ", newFocusedEntry: " + string(newFocusedEntry));
	ds_map_replace(chainSubMap, "focused", newFocusedEntry);
	
	// removed chain from focusedEntry's word's inChainsList (if it is a rez or track)
	if (focusedEntryType == "rez" || focusedEntryType == "track") {
		scr_removeChainFromInChainsList(obj_chain.currentFocusedChainID, focusedEntryToken);
	}
	else if (focusedEntryType == "stack"){
		var focusedEntryUnit = ds_map_find_value(focusedEntrySubMap, "unit");
		//ds_grid_set(obj_chain.unitInStackGrid, obj_chain.unitInStackGrid_colStack, focusedEntryUnit-1,-1);
		//ds_grid_set(obj_chain.unitInStackGrid, obj_chain.unitInStackGrid_colStackType, focusedEntryUnit-1, -1);	
	}
	
	// remove focusedEntry from nodeMap and destroy focusedEntry
	scr_deleteFromNodeMap(focusedEntry);
	ds_map_destroy(focusedEntrySubMap);
	
	// sort vizSetList!
	if (sortVizSetList) {
		scr_sortVizSetIDList(obj_chain.currentFocusedChainID);
	}
	
	
	scr_deleteFromChainVoidCheck(obj_chain.currentFocusedChainID, focusedEntryToken, true);
	show_debug_message("scr_deleteFromChain() , FINAL CHECK");

}
