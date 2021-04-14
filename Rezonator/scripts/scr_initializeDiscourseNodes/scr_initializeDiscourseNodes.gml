// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_initializeDiscourseNodes(){
	
	show_debug_message("scr_initializeDiscourseNodes() ... START " + scr_printTime());
	
	var currentDiscourseNode = scr_addToNodeMap("Discourse");
	var currentDiscourseSubMap = global.nodeMap[? currentDiscourseNode];	
	
	var unitList = ds_list_create();
	var tokenList = ds_list_create();
	
	
	var tokenSeq = 1;
	
	var unitGrid = obj_control.unitGrid;
	var unitGridHeight = ds_grid_height(unitGrid);
	for (var i = 0; i < unitGridHeight; i++) {
		
		// get list of tokens
		var currentWordIDList = ds_grid_get(unitGrid, obj_control.unitGrid_colWordIDList, i);
		var currentEntryList = ds_list_create();
		if (scr_isNumericAndExists(currentWordIDList, ds_type_list)) {
			var currentWordIDListSize = ds_list_size(currentWordIDList);
			for (var j = 0; j < currentWordIDListSize; j++) {
				// make token node
				var currentTokenNode = scr_addToNodeMap("token");
				var currentTokenSubMap = global.nodeMap[? currentTokenNode];
				ds_map_add(currentTokenSubMap, "tokenSeq", tokenSeq);
				tokenSeq++;
				
				//add each token to the totoal token's List
				ds_list_add(tokenList, currentTokenNode);
				
				// make entry node
				var currentEntryNode = scr_addToNodeMap("entry");
				var currentEntrySubMap = global.nodeMap[? currentEntryNode];
				ds_map_add(currentEntrySubMap, "token", currentTokenNode);
				
				
				ds_list_add(currentEntryList, currentEntryNode);
			}
		}
		
		
		var currentUnitNode = scr_addToNodeMap("unit");
		var currentUnitSubMap = global.nodeMap[? currentUnitNode];
		
		// add values to unit node
		ds_map_add(currentUnitSubMap, "unitSeq", i + 1);
		ds_map_add_list(currentUnitSubMap, "entryList", currentEntryList);
		
		//add each token to the totoal token's List
		ds_list_add(unitList, currentUnitNode);
	
	}
	
	
	ds_map_add(currentDiscourseSubMap, "unitList", unitList);
	ds_map_add(currentDiscourseSubMap, "tokenList", tokenList);	
	
	show_debug_message("scr_initializeDiscourseNodes() ... END " + scr_printTime());
	

}