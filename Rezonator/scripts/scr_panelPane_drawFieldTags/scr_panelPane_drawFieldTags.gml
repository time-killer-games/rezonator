// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_panelPane_drawFieldTags(){


	draw_set_alpha(1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	
	var strHeight = string_height("0") * 1.5;
	var spaceWidth = string_width(" ");
	var headerHeight = functionTabs_tabHeight;
	var checkboxColX = x;
	var checkboxColWidth = windowWidth * 0.1;
	var numColX = checkboxColX + checkboxColWidth;
	var numColWidth = windowWidth * 0.1;
	var tagNameColX = numColX + numColWidth;
	var mouseoverWindow = point_in_rectangle(mouse_x, mouse_y, x, y, x + windowWidth, y + windowHeight);
	
	//show_debug_message("BUH")
	

	scr_surfaceStart();
	
	
	var tokenTagMap = global.nodeMap[? "tokenTagMap"];
	var fieldSubMap = tokenTagMap[? functionField_fieldSelected];
	if (scr_isNumericAndExists(fieldSubMap, ds_type_map)){
	
	
		var tagList = fieldSubMap[? "tagSet"];
		if (scr_isNumericAndExists(tagList, ds_type_list)){
		var tagListSize = ds_list_size(tagList);
	
	
			
			var plusY = strHeight;
			for (var i = 0; i < tagListSize; i++) {
		
				var currentRowY1 = y + plusY + scrollPlusY - 16;
				var currentRowY2 = currentRowY1 + strHeight;
				var mouseoverRow = point_in_rectangle(mouse_x, mouse_y, x, currentRowY1, x + windowWidth, currentRowY2);
				
				// mouseover & click
				if (mouseoverRow) {
					draw_set_color(merge_color(global.colorThemeSelected1, global.colorThemeBG, 0.5));
					draw_rectangle(x - clipX, currentRowY1 - clipY, x + windowWidth - clipX, currentRowY2 - clipY, false);
					if (mouse_check_button_released(mb_left)) {
						with(obj_panelPane){
							functionField_tagSelected = tagList[| i];
						}
					}
				}
		
				//check if this row/field has been selected
				if (functionField_tagSelected == tagList[| i]) {
					draw_set_color(c_red);
					draw_rectangle(x - clipX, currentRowY1 - clipY, x + windowWidth - clipX, currentRowY2 - clipY, false);
				}
		
				// draw #
				draw_set_color(global.colorThemeText);
				draw_text(floor(numColX + spaceWidth) - clipX, floor(mean(currentRowY1, currentRowY2)) - clipY, string(i + 1));
		
				// draw field name
				draw_text(floor(tagNameColX + spaceWidth) - clipX, floor(mean(currentRowY1, currentRowY2)) - clipY, string(tagList[| i]));
			
	
				plusY += strHeight;
			}
	
	
		scr_scrollBar(tagListSize, -1, strHeight, headerHeight,
				global.colorThemeSelected1, global.colorThemeSelected2,
				global.colorThemeSelected1, global.colorThemeSelected2, spr_ascend, windowWidth, windowHeight);
		}
	}
	
	scr_surfaceEnd();
	
	var headerTextY = floor(mean(y, y + headerHeight));
	
	// checkbox header
	draw_set_color(global.colorThemeBG);
	draw_rectangle(checkboxColX, y, checkboxColX + checkboxColWidth, y + headerHeight, false);
	draw_set_color(global.colorThemeBorders);
	draw_rectangle(checkboxColX, y, checkboxColX + checkboxColWidth, y + headerHeight, true);
	draw_set_color(global.colorThemeText);
	
	// num header
	draw_set_color(global.colorThemeBG);
	draw_rectangle(numColX, y, numColX + numColWidth, y + headerHeight, false);
	draw_set_color(global.colorThemeBorders);
	draw_rectangle(numColX, y, numColX + numColWidth, y + headerHeight, true);
	draw_text(floor(numColX + spaceWidth), headerTextY, "#");
	
	// field name header
	draw_set_color(global.colorThemeBG);
	draw_rectangle(tagNameColX, y, x + windowWidth, y + headerHeight, false);
	draw_set_color(global.colorThemeBorders);
	draw_rectangle(tagNameColX, y, x + windowWidth, y + headerHeight, true);
	draw_text(floor(tagNameColX + spaceWidth), headerTextY, "Tag name");
	
	
	
	if (mouseoverWindow && mouse_wheel_down()) {
		scrollPlusYDest -= 16;
	}
	if (mouseoverWindow && mouse_wheel_up()) {
		scrollPlusYDest += 16;
	}
	
	
}