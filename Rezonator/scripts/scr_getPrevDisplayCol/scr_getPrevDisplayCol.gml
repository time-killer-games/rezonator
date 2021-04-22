// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_getPrevDisplayCol(tokenID){
	
	// really quick way to grab the previous token's display col
	
	var prevDisplayCol = -1;
	var prevTokenID = scr_prevTokenInSequence(tokenID);
	var prevTokenSubMap = global.nodeMap[? prevTokenID];
	
	if (scr_isNumericAndExists(prevTokenSubMap, ds_type_map)) {
		prevDisplayCol = prevTokenSubMap[? "displayCol"];
	}
	
	return prevDisplayCol;

}