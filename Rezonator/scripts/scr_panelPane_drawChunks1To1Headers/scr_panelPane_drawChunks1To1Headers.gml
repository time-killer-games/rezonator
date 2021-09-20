// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_panelPane_drawChunks1To1Headers(fieldList){
	
	var headerHeight = functionTabs_tabHeight;
	var textMarginLeft = 8;
	var fieldListSize = ds_list_size(fieldList);
	var lineStateLTR = (obj_control.drawLineState == obj_control.lineState_ltr);

	// Create the column headers
	for (var i = 0; i < fieldListSize; i++) {
		
		// header coordinates
		var headerRectX1 = x + (i * (windowWidth / fieldListSize));
		var headerRectY1 = y;
		var headerRectX2 = headerRectX1 + (windowWidth / fieldListSize);
		var headerRectY2 = headerRectY1 + headerHeight;
		var mouseoverColHeader = point_in_rectangle(mouse_x, mouse_y, headerRectX1, headerRectY1, headerRectX2, headerRectY2) && !instance_exists(obj_dropDown) && !instance_exists(obj_dialogueBox);
		
		
		// get field name
		var currentField = string(fieldList[| i]);
		
		// BG & outline rects
		draw_set_color(global.colorThemeBG);
		draw_rectangle(headerRectX1, headerRectY1, headerRectX2, headerRectY1 + headerHeight, false);
		draw_set_color(global.colorThemeBorders);
		draw_rectangle(headerRectX1, headerRectY1, headerRectX2, headerRectY1 + headerHeight, true);
		
		// draw line to separate column headers from data
		draw_set_color(global.colorThemeBorders);
		draw_rectangle(x, headerRectY1, x + windowWidth, headerRectY2, true);
		
		// draw header name
		draw_set_valign(fa_middle);
		scr_adaptFont(currentField, "M");
		
		// get header text coordinates
		draw_set_halign(fa_left);
		var headerTextX = floor(headerRectX1 + (textMarginLeft));
		if (!lineStateLTR) {
			draw_set_halign(fa_right);
			headerTextX = floor(headerRectX2 - (textMarginLeft * 2));
		}
		var headerTextY = floor(y + (headerHeight / 2));
		
		
		if (mouseoverColHeader) {
			scr_createTooltip(mean(headerRectX1, headerRectX2), headerRectY2, scr_get_translation("msg_change_field"), obj_tooltip.arrowFaceUp);
			
			// draw underline
			var underlineX1 = headerTextX;
			var underlineX2 = 0;
			if (lineStateLTR) {
				underlineX2 = headerTextX + string_width(currentField);
			}
			else{
				underlineX2 = headerTextX - string_width(currentField);
			}
			var underlineY = headerTextY + (headerHeight * 0.25);
			draw_set_color(global.colorThemeBorders);
			draw_line_width(underlineX1, underlineY, underlineX2, underlineY, 2);
			
			if (mouse_check_button_released(mb_left)) {
				
				with (obj_panelPane) {
					chosenCol = i;
				}
				obj_control.chunk1to1ChunkToChange = "";
				obj_control.chunk1to1FieldToChange = currentField;
				obj_control.selectFieldChunk = true;
				
				var dropDownOptionList = ds_list_create();
				ds_list_add(dropDownOptionList, "option_select-field", "option_create-new-field", "option_add-to-tag-set", "option-remove-tag-set",);
				scr_createDropDown(headerRectX1, headerRectY2, dropDownOptionList, global.optionListTypeFieldUnits1ToMany);
			}
		}
		
		
		// draw header text
		draw_set_color(global.colorThemeText);
		draw_text(headerTextX, headerTextY, currentField);
		
		// draw lines for dividing columns
		if(lineStateLTR){	
			if(i > 0){
				draw_set_color(global.colorThemeBorders);
				draw_line_width(headerRectX1, y, headerRectX1, y + windowHeight, 1);
			}
		}
		else{
			if(i > 0 && i < fieldListSize){
				draw_set_color(global.colorThemeBorders);
				draw_line_width(headerRectX1 + 1, y, headerRectX1 + 1, y + windowHeight, 1);
			}
		}
		
		
		
	
	}

}