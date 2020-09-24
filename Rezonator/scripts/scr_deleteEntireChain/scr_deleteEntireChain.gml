function scr_deleteEntireChain() {
	var currentChainID = argument[0];
	var currentChainGridRow = ds_grid_value_y(obj_chain.currentChainGrid, obj_chain.chainGrid_colChainID, 0, obj_chain.chainGrid_colChainID, ds_grid_height(obj_chain.currentChainGrid)-1, currentChainID);
	var currentChainWordIDList = ds_grid_get(obj_chain.currentChainGrid, obj_chain.chainGrid_colWordIDList, currentChainGridRow);
	//show_message(scr_getStringOfList(currentChainWordIDList));
	// Focus a link on the relevant chain
	var currentLinkGridRow = ds_grid_value_y(obj_chain.linkGrid, obj_chain.linkGrid_colChainID, 0, obj_chain.linkGrid_colChainID, ds_grid_height(obj_chain.linkGrid), currentChainID);
	ds_grid_set(obj_chain.linkGrid, obj_chain.linkGrid_colFocus, currentLinkGridRow, true);

	if( currentChainWordIDList == undefined){
		//show_message("it didn't work");
		exit;
	}

	var currentChainWordIDListSize = ds_list_size(currentChainWordIDList);
	for(var deleteLoop = 0; deleteLoop < currentChainWordIDListSize; deleteLoop++) {
		//show_message(string(ds_list_find_value(currentChainWordIDList, deleteLoop)));
		with(obj_control) {
			scr_deleteFromChain();	
		}
	}

	// Rudimentary function to switch to another chain in order to keep Flow
	//if(ds_grid_height(obj_chain.currentChainGrid) > 0 && not obj_toolPane.tracksOnlyStackShow) {
	//	if(currentChainGridRow != 0) {
	//		ds_grid_set(obj_chain.currentChainGrid, obj_chain.chainGrid_colChainState, currentChainGridRow - 1, obj_chain.chainStateFocus);	
	//	}
	//	else {
	//		ds_grid_set(obj_chain.currentChainGrid, obj_chain.chainGrid_colChainState, currentChainGridRow, obj_chain.chainStateFocus);	
	//	}
	//}


}
