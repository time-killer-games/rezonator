// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_wordCalculateVoid(wordID){
	
	var wordInChainsList = ds_grid_get(obj_control.dynamicWordGrid, obj_control.dynamicWordGrid_colInChainList, wordID - 1);
	var wordInChainsListSize = ds_list_size(wordInChainsList);
	
	var currentWordSeq = ds_grid_get(obj_control.wordGrid, obj_control.wordGrid_colWordSeq, wordID - 1);
	var currentWordDisplayCol = ds_grid_get(obj_control.dynamicWordGrid, obj_control.dynamicWordGrid_colDisplayCol, wordID - 1);
	var previousWordID = scr_prevWordInSequence(wordID);

	var previousWordDisplayCol = 0;
	if (previousWordID >= 1 && currentWordSeq > 0) {
		previousWordDisplayCol = ds_grid_get(obj_control.dynamicWordGrid, obj_control.dynamicWordGrid_colDisplayCol, previousWordID - 1);
	}

	// set the void for this word
	var currentWordVoid = currentWordDisplayCol - previousWordDisplayCol;
	ds_grid_set(obj_control.dynamicWordGrid, obj_control.dynamicWordGrid_colVoid, wordID - 1, currentWordVoid);
		
	if (currentWordVoid < 1 && previousWordID >= 0) {
		currentWordDisplayCol++;
		ds_grid_set(obj_control.dynamicWordGrid, obj_control.dynamicWordGrid_colDisplayCol, wordID - 1, currentWordDisplayCol);
			
		// if we are pushing a word in a chain, realign that chain
		if (wordInChainsListSize > 0) {
			for (var i = 0; i < wordInChainsListSize; i++) {
				var currentChain = ds_list_find_value(wordInChainsList, i);
				scr_alignChain2ElectricBoogaloo(currentChain);
			}
		}
	}
	
	// if this word is not in a chain, but has a void greater than 1, bring it back!!
	if (currentWordVoid > 1) {
	
		// check if this word is the first word in an aligned chunk
		var alignedChunkChainID = "";
		var wordInBoxList = ds_grid_get(obj_control.dynamicWordGrid, obj_control.dynamicWordGrid_colInBoxList, wordID - 1);
		var wordInBoxListSize = ds_list_size(wordInBoxList);
		for (var i = 0; i < wordInBoxListSize; i++) {
			var currentChunk = wordInBoxList[| i];
			var currentChunkSubMap = global.nodeMap[? currentChunk];
			if (scr_isNumericAndExists(currentChunkSubMap, ds_type_map)) {
				var currentChunkInChainsList = currentChunkSubMap[? "inChainsList"];
				if (scr_isNumericAndExists(currentChunkInChainsList, ds_type_list)) {
					if (scr_getFirstWordOfChunk(currentChunk) == wordID) {
						var currentChunkInChainsListSize = ds_list_size(currentChunkInChainsList);
						for (var j = 0; j < currentChunkInChainsListSize; j++) {
							var currentChunkInChain = currentChunkInChainsList[| j];
							var currentChunkInChainSubMap = global.nodeMap[? currentChunkInChain];
							if (currentChunkInChainSubMap[? "alignChain"]) alignedChunkChainID = currentChunkInChain;
						}
					}
				}
			}
		}
	
		
		if (wordInChainsListSize < 1 && alignedChunkChainID == "") {
			
			// if this word is not in a chain and not in an aligned chunk, then it's displayCol should be the previous displayCol + 1
			currentWordDisplayCol = (currentWordSeq == 0) ? 0 : previousWordDisplayCol + 1;
			ds_grid_set(obj_control.dynamicWordGrid, obj_control.dynamicWordGrid_colDisplayCol, wordID - 1, currentWordDisplayCol);
			
		}
		else {
			
			// if this word is in a chain, and it has >1 void, let's quickly check that chain to see if it has any words with <=1 void
			// if it doesn't, let's pull that shit back!!!!
			for (var i = 0; i < wordInChainsListSize; i++) {
				var currentChain = wordInChainsList[| i];
				
				var currentChainSubMap = global.nodeMap[? currentChain];
				if (!is_numeric(currentChainSubMap)) continue;
				if (!ds_exists(currentChainSubMap, ds_type_map)) continue;
				var currentChainAlign = currentChainSubMap[? "alignChain"];

				if (currentChainAlign) {
					if (ds_list_find_index(obj_control.chainVoidCheckList, currentChain) == -1) {
						ds_list_add(obj_control.chainVoidCheckList, currentChain);
						
						scr_handleVoid(currentChainSubMap[? "vizSetIDList"]);
					}
				}
			}
		}
		
		if (alignedChunkChainID != "") {
			var alignedChunkChainSubMap = global.nodeMap[? alignedChunkChainID];
			if (scr_isNumericAndExists(alignedChunkChainSubMap, ds_type_map)) {
				scr_handleVoid(alignedChunkChainSubMap[? "vizSetIDList"]);
			}
		}
		
	}
}