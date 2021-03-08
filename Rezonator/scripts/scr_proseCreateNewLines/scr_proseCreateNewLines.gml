// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_proseCreateNewLines(){
	
	show_debug_message("scr_proseCreateNewLines()");
	
	var wordSpacing = 12;
	var lineGrid = obj_control.lineGrid;
	var endOfLineBuffer = (global.scrollBarWidth * 4);
	var maxScreenWidth = (window_get_width() * 0.4) - obj_control.wordLeftMargin - endOfLineBuffer;
	maxScreenWidth = clamp(maxScreenWidth, 200, 5000);
	
	// loop through lineGrid and split lines that have more words than maxWordsPerLine
	for (var i = 0; i < ds_grid_height(lineGrid); i++) {
		var currentWordIDList = ds_grid_get(lineGrid, obj_control.lineGrid_colWordIDList, i);
		var totalLineWidth = 0;
		var indexToSplit = 0;
		var splitFound = false;

		// make sure each word knows its displayRow and get size odf all words in list
		var currentWordIDListSize = ds_list_size(currentWordIDList);
		for (var j = 0; j < currentWordIDListSize; j++) {
			var currentWordID = ds_list_find_value(currentWordIDList, j);
			var currentWordStr = ds_grid_get(obj_control.dynamicWordGrid, obj_control.dynamicWordGrid_colDisplayString, currentWordID - 1);
			scr_adaptFont(currentWordStr, "M");
			totalLineWidth += string_width(currentWordStr) + wordSpacing;
			if (totalLineWidth > maxScreenWidth and !splitFound) {
				indexToSplit = j;
				splitFound = true;
			}
			ds_grid_set(obj_control.dynamicWordGrid, obj_control.dynamicWordGrid_colDisplayRow, currentWordID - 1, i);
		}
		
		// if this line has more words than maxWordsPerLine, we will split the line
		if (totalLineWidth > maxScreenWidth) {
			
			// subtract 1 from indexToSplit if we can
			indexToSplit = max(0, indexToSplit - 2);
			
			// get wordID of indexToSplit and splitLine on that word
			var splitWordID = ds_list_find_value(currentWordIDList, indexToSplit);
			scr_splitLine(splitWordID);
			
		}
	}

}