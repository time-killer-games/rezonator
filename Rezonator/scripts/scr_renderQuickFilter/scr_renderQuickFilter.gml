function scr_renderQuickFilter() {
	/*
		scr_renderFilter();
	
		Last Updated: 2018-09-11
	
		Called from: obj_control
	
		Purpose: clear and then populate quickFilterGrid with necessary units
	
		Mechanism: check all chains to see if they are flagged with the filter option, and if they are
					then add a row to the quickFilterGrid
	
		Author: Terry DuBois, Georgio Klironomos
	*/
	
	if(obj_chain.currentFocusedChainID == -1 and is_numeric(obj_chain.currentFocusedChainID)){
		exit;
	}
	
	ds_grid_destroy(quickFilterGrid);
	quickFilterGrid = ds_grid_create(lineGridWidth, 0);



	with(obj_panelPane){
		var grid;
		
		switch (functionChainList_currentTab) {

			case functionChainList_tabRezBrush:
				grid = obj_chain.rezChainGrid;
				
				break;
			case functionChainList_tabTrackBrush:
				grid = obj_chain.trackChainGrid;
				
				break;
			case functionChainList_tabStackBrush:
				grid = obj_chain.stackChainGrid;
				break;
			default:
				break;
		}
	}

	var rowInChainGrid = ds_grid_value_y(grid, obj_chain.chainGrid_colChainID, 0,obj_chain.chainGrid_colChainID, ds_grid_height(grid), obj_chain.currentFocusedChainID);	
	
	var currentIDList = ds_grid_get(grid, obj_chain.chainGrid_colWordIDList, rowInChainGrid);
		
	ds_list_sort(currentIDList, true);
	
	scr_updateDisplayRow();
		
	// set information in quickFilterGrid for words in this chain
	var currentIDListSize = ds_list_size(currentIDList);
	for (var k = 0; k < currentIDListSize; k++) {
		if (grid == obj_chain.stackChainGrid or grid == obj_chain.cliqueDisplayGrid) {
			var currentUnitID = ds_list_find_value(currentIDList, k);
		}
		else {
			var currentWordID = ds_list_find_value(currentIDList, k);
			var currentUnitID = ds_grid_get(wordGrid, wordGrid_colUnitID, currentWordID - 1);
			var currentDisplayRow = ds_grid_get(dynamicWordGrid, dynamicWordGrid_colDisplayRow, currentWordID - 1);
		}
			
		if (ds_grid_value_exists(quickFilterGrid, lineGrid_colUnitID, 0, lineGrid_colUnitID, ds_grid_height(quickFilterGrid), currentUnitID)) {
			continue;
		}
			
		var rowInLineGrid = ds_grid_value_y(lineGrid, lineGrid_colDisplayRow,0,lineGrid_colDisplayRow,ds_grid_height(lineGrid), currentDisplayRow )
		var currentWordIDListUnitGrid = ds_grid_get(lineGrid, lineGrid_colWordIDList, rowInLineGrid);
		var currentDiscoID = ds_grid_get(lineGrid, lineGrid_colDiscoID, rowInLineGrid);
		var currentUtteranceID = ds_grid_get(lineGrid, lineGrid_colUnitID, rowInLineGrid);
		
		show_debug_message("WID:  " + string(currentWordID) + "   ,currentDisplayRow:  " + string(currentDisplayRow) + "  ,rowInLineGrid:  " + string(rowInLineGrid) + "  ,currentWordIDListUnitGrid:  " + scr_getStringOfList(currentWordIDListUnitGrid) )
			
		ds_grid_resize(quickFilterGrid, lineGridWidth, ds_grid_height(quickFilterGrid) + 1);
		var currentRowquickFilterGrid = ds_grid_height(quickFilterGrid) - 1;
			
		ds_grid_set(quickFilterGrid, lineGrid_colDisplayRow, currentRowquickFilterGrid, currentRowquickFilterGrid);
		ds_grid_set(quickFilterGrid, lineGrid_colLineState, currentRowquickFilterGrid, 0);
		ds_grid_set(quickFilterGrid, lineGrid_colUnitID, currentRowquickFilterGrid, currentUnitID);
		ds_grid_set(quickFilterGrid, lineGrid_colPixelY, currentRowquickFilterGrid, (currentRowquickFilterGrid * obj_control.gridSpaceVertical));
		ds_grid_set(quickFilterGrid, lineGrid_colPixelYOriginal, currentRowquickFilterGrid, (currentRowquickFilterGrid * obj_control.gridSpaceVertical));
		ds_grid_set(quickFilterGrid, lineGrid_colDiscoID, currentRowquickFilterGrid, currentDiscoID);
		ds_grid_set(quickFilterGrid, lineGrid_colLineNumberLabel, currentRowquickFilterGrid, currentUnitID);
		ds_grid_set(quickFilterGrid, lineGrid_colWordIDList, currentRowquickFilterGrid, currentWordIDListUnitGrid);
		}
	scr_refreshChainGrid();

	

	quickFilterGridActive = true;
	currentActiveLineGrid = quickFilterGrid;
	wordLeftMarginDest = 170; // Make sure the margin is placed correctly

	with (obj_alarm) {
		alarm[1] = 5;
	}

}

