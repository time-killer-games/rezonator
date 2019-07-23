if(ds_list_size(obj_control.stackShowList) > 0 && obj_control.currentStackShowListPosition != (ds_list_size(obj_control.stackShowList))) {
	// Filter on ds_list_get_value(stackShowList, currentStackShowListPosition);
	
	if(obj_control.currentStackShowListPosition > 0) {
		var prevStackID = ds_list_find_value(obj_control.stackShowList, obj_control.currentStackShowListPosition - 1);
		var prevStackRow = ds_grid_value_y(obj_chain.stackChainGrid, obj_chain.chainGrid_colChainID, 0, obj_chain.chainGrid_colChainID, ds_grid_height(obj_chain.stackChainGrid), prevStackID);
		ds_grid_set(obj_chain.stackChainGrid, obj_chain.chainGrid_colInFilter, prevStackRow, false);
	}
	
	var currentStackID = ds_list_find_value(obj_control.stackShowList, obj_control.currentStackShowListPosition);
	var currentStackRow = ds_grid_value_y(obj_chain.stackChainGrid, obj_chain.chainGrid_colChainID, 0, obj_chain.chainGrid_colChainID, ds_grid_height(obj_chain.stackChainGrid), currentStackID);
	ds_grid_set(obj_chain.stackChainGrid, obj_chain.chainGrid_colInFilter, currentStackRow, true);
			
	// Render the filter in the mainscreen
	with (obj_control) {
		scr_renderFilter();
	}
	obj_control.currentStackShowListPosition++;
}
else if(obj_control.currentStackShowListPosition == (ds_list_size(obj_control.stackShowList))) {
	//Set currentStackShowListPosition to -1
	obj_control.currentStackShowListPosition = -1;
	//Clear stackShowList
	ds_list_clear(obj_control.stackShowList);
	// Exit the filter
	ds_grid_set_region(obj_chain.stackChainGrid, obj_chain.chainGrid_colInFilter, 0, obj_chain.chainGrid_colInFilter, ds_grid_height(obj_chain.stackChainGrid), false);
	// Switch to active grid
	obj_control.filterGridActive = false;
	obj_control.currentActiveLineGrid = obj_control.lineGrid;
}