// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_drawLineEntryList(unitID, unitSubMap, entryList, pixelY){
	
	draw_set_color(global.colorThemeText);
	draw_set_alpha(1);
	draw_set_valign(fa_middle);
	
	// set halign
	var halign = fa_left;
	if (justify == justifyRight && shape == shapeBlock) halign = fa_right;
	draw_set_halign(halign);
	
	var camWidth = camera_get_view_width(camera_get_active());
	var shapeTextX = 0;
	var spaceWidth = string_width(" ");
	
	// get unit width
	var unitWidth = 0;
	if (justify != justifyLeft) {
		unitWidth = string_width(scr_getUnitText(unitSubMap));
	}
	
	var entryListSize = ds_list_size(entryList);
	for (var i = 0; i < entryListSize; i++) {
		
		// get current entry submap and make sure it exists
		var currentEntry = entryList[| i];
		var currentEntrySubMap = global.nodeMap[? currentEntry];
		if (!scr_isNumericAndExists(currentEntrySubMap, ds_type_map)) continue;
		
		// get token for this entry and make sure that exists
		var currentToken = currentEntrySubMap[? "token"];
		var currentTokenSubMap = global.nodeMap[? currentToken];
		if (!scr_isNumericAndExists(currentTokenSubMap, ds_type_map)) continue;
		
		// get tag map for this token
		var currentTagMap = currentTokenSubMap[? "tagMap"];
		if (!scr_isNumericAndExists(currentTagMap, ds_type_map)) continue;
		var currentDisplayStr = string(currentTagMap[? global.displayTokenField]);
		
		// get & set pixelX value
		scr_tokenCalculateVoid(currentToken);
		var currentDisplayCol = currentTokenSubMap[? "displayCol"];
		var currentPixelX = scr_setTokenX(currentTokenSubMap, currentDisplayCol, entryListSize, i, unitWidth, shapeTextX, camWidth);
		shapeTextX += string_width(currentDisplayStr) + spaceWidth;
		
		
		//mouseover Token check
		scr_adaptFont(currentDisplayStr,"M");
		var currentTokenStringWidth = string_width(currentDisplayStr);
		var currentTokenStringHeight = string_height(currentDisplayStr);		
		var tokenRectBuffer = 3;
		var tokenRectX1 = currentPixelX - tokenRectBuffer;
		var tokenRectY1 = pixelY - (currentTokenStringHeight / 2) - tokenRectBuffer;
		var tokenRectX2 = tokenRectX1 + currentTokenStringWidth + (tokenRectBuffer * 2);
		var tokenRectY2 = tokenRectY1 + currentTokenStringHeight + (tokenRectBuffer * 2);
		if (halign == fa_right) {
			tokenRectX1 -= currentTokenStringWidth;
			tokenRectX2 -= currentTokenStringWidth;
		}
		var mouseOverToken = point_in_rectangle(mouse_x,mouse_y, tokenRectX1, tokenRectY1, tokenRectX2, tokenRectY2) && obj_control.hoverTokenID == "";
		
		// draw background tokenRect
		draw_set_color(global.colorThemeBG);
		draw_set_alpha(1);
		draw_rectangle(tokenRectX1, tokenRectY1, tokenRectX2, tokenRectY2, false);
		
		// check if this token is in mouse rect
		var mouseRectExists = (mouseHoldRectX1 >= 0 && mouseHoldRectY1 >= 0);
		var inMouseRect = false;
		if (mouseRectExists) {
			inMouseRect = rectangle_in_rectangle(tokenRectX1, tokenRectY1, tokenRectX2, tokenRectY2, min(mouse_x, mouseHoldRectX1), min(mouse_y, mouseHoldRectY1), max(mouse_x, mouseHoldRectX1), max(mouse_y, mouseHoldRectY1));
			if (inMouseRect && !mouse_check_button_released(mb_left)) {
				ds_list_add(inRectTokenIDList, currentToken);
				if (ds_list_find_index(inRectUnitIDList, unitID) == -1) {
					ds_list_add(inRectUnitIDList, unitID);
				}
			}
		}
		
		// draw border on this token if it is in the mouse rect
		if (mouseRectExists && inMouseRect && !mouse_check_button_released(mb_left)) {
			draw_set_color(c_ltblue);
			scr_drawRectWidth(tokenRectX1, tokenRectY1, tokenRectX2, tokenRectY2, 2, true);
		}
	
		
		//if token has anything in chainslist add to show list
		var inChainsList = currentTokenSubMap[?"inChainsList"];
		var sizeOfInChainsList = ds_list_size(inChainsList);
		if (sizeOfInChainsList > 0) {
			for(var j = 0; j < sizeOfInChainsList; j++ ){
				var chainID = inChainsList[|j];
				if(ds_list_find_index(obj_chain.chainShowList, inChainsList[|j]) == -1){
					ds_list_add(obj_chain.chainShowList,  inChainsList[|j]);
				}
				
				// get cool chain vars
				var chainSubMap = global.nodeMap[?chainID];
				var chainColor = chainSubMap[?"chainColor"]
				var chainType = chainSubMap[?"type"]
				
				// draw filled in rect if this is the focused entry of the focused chain
				if (obj_chain.mouseLineWordID == currentToken && obj_chain.currentFocusedChainID == chainID) {
					draw_set_alpha(0.25);
					draw_set_color(chainColor);
					if (chainType == "rezChain") draw_rectangle(tokenRectX1, tokenRectY1, tokenRectX2, tokenRectY2, false);
					else if (chainType == "trackChain") draw_roundrect(tokenRectX1, tokenRectY1, tokenRectX2, tokenRectY2, false);
					draw_set_alpha(1);
				}
				
				// draw border around token if its in a chain
				draw_set_color(chainColor);
				draw_set_alpha(1);
				scr_drawRectWidth(tokenRectX1, tokenRectY1, tokenRectX2, tokenRectY2, 2, chainType == "trackChain");
			}
		}
		
		
		// mouseover & click on token
		if(mouseOverToken){
			if(sizeOfInChainsList == 0){
				draw_set_color(global.colorThemeBorders);
				draw_rectangle(tokenRectX1,tokenRectY1,tokenRectX2,tokenRectY2, true);
			}
			obj_control.hoverTokenID = currentToken;
			if(device_mouse_check_button_released(0, mb_left)){
				
				
				var focusedchainIDSubMap = ds_map_find_value(global.nodeMap, obj_chain.currentFocusedChainID);
				
				if(is_numeric(focusedchainIDSubMap)){
					if(ds_exists(focusedchainIDSubMap, ds_type_map)){
						var prevChainType = ds_map_find_value(focusedchainIDSubMap, "type");
						if( prevChainType == "stackChain"){
							scr_chainDeselect();
						}
					}
				}
				
				if (obj_control.ctrlHold) {
						
					// make a temporary "fake" inChainsList that will contain the chain that this stack is in (or no chain if there is none)
					var inChainsList = currentTokenSubMap[?"inChainsList"];
					// combine the chains
					scr_combineChainsDrawLine(inChainsList);

						
				}
				
				
				scr_tokenClicked(currentToken);
			}
		}

		
		draw_set_color(global.colorThemeText);
		draw_set_alpha(1);
		draw_text(currentPixelX, pixelY, currentDisplayStr);
		
	}

}