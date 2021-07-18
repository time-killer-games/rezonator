// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_setEntryAutoTags(grid, gridCol, vizSetIDList, chainType){
	
	var gridHeight = ds_grid_height(grid);
	var prevUnitSeq = -1;
	var prevTokenSeq = -1;

	for (var i = 0; i < gridHeight; i++) {
		var currentEntry = ds_grid_get(grid, gridCol, i);
		ds_list_add(vizSetIDList, currentEntry);
		var isChunk = false;
		// set gap tag in this entry's tagmap
		var currentEntrySubMap = global.nodeMap[? currentEntry];
		if (scr_isNumericAndExists(currentEntrySubMap, ds_type_map)) {
				
			// get unit/token from this entry
			var discourseTokenSeq = -1;
			var currentChunk = "";
			var currentUnitSeq = -1;
			var currentToken = "";
			var currentTokenCount = "N/A";
			if (chainType == "rezChain" || chainType == "trackChain") {
				currentToken = currentEntrySubMap[? "token"];
				
				isChunk = scr_isChunk(currentToken);
				
				if(isChunk){
					currentChunk = currentToken;
					currentToken = scr_getFirstWordOfChunk(currentToken);
				}
				
				var tokenSubMap = global.nodeMap[? currentToken];
				
				if (scr_isNumericAndExists(tokenSubMap, ds_type_map)) {
					discourseTokenSeq = tokenSubMap[? "discourseTokenSeq"];
					var tokenUnitID = tokenSubMap[? "unit"];
					var unitSubMap = global.nodeMap[? tokenUnitID];
					if (scr_isNumericAndExists(unitSubMap, ds_type_map)) {
						currentUnitSeq = unitSubMap[? "unitSeq"];
					}
				}
			}
			else if (chainType == "stackChain") {
				var unitID = currentEntrySubMap[? "unit"];
				var unitSubMap = global.nodeMap[? unitID];
				currentUnitSeq = unitSubMap[? "unitSeq"];
			}
				
			// calculate gapUnits
			var currentGapUnits = "N/A";
			if (prevUnitSeq >= 0) {
				currentGapUnits = currentUnitSeq - prevUnitSeq;
			}
				
			// calculate auto-tags for rez & track
			var currentGapWords = "N/A";
			var currentCharCount = "N/A";
			if (chainType == "rezChain" || chainType == "trackChain") {
				if (prevTokenSeq >= 0) {
					currentGapWords = discourseTokenSeq - prevTokenSeq;
				}
					
				// calculate character & token count
				if (currentToken != "") {
					//start token count for tokens to  be 1
					if (currentTokenCount == "N/A") {
						currentTokenCount = 1;
					}
					
					
					if(isChunk){
						var currentDisplayStr = scr_getChunkText(currentChunk);
						var chunkSubMap = global.nodeMap[?currentChunk];
						currentTokenCount = ds_list_size(chunkSubMap[?"tokenList"]);
					}
					else{
						if(scr_isNumericAndExists(tokenSubMap, ds_type_map)){
							var tokenTagMap = tokenSubMap[? "tagMap"];
							var currentDisplayStr = tokenTagMap[? global.displayTokenField];
						}
						else{
							var currentDisplayStr = "";	
						}
					}
					
					
					currentCharCount = string_length(currentDisplayStr);

				}
			}

			// set auto-tags
			var currentTagMap = currentEntrySubMap[? "tagMap"];
			if (scr_isNumericAndExists(currentTagMap, ds_type_map)) {
				currentTagMap[? "gapUnits"] = currentGapUnits;
				currentTagMap[? "gapWords"] = currentGapWords;
				currentTagMap[? "charCount"] = currentCharCount;
				currentTagMap[? "tokenCount"] = currentTokenCount;
			}
				
			// used for gapUnits & gapWords
			prevUnitSeq = currentUnitSeq;
			prevTokenSeq = discourseTokenSeq;
		}	
	}
}