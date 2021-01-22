function scr_panelPane_drawChainTabs() {
	/*
		scr_panelPane_drawChainTabs();
	
		Last Updated: 2019-01-29
	
		Called from: obj_panelPane
	
		Purpose: draw Rez, Track, and Stack tabs on chainList panel pane
	
		Mechanism: loop 3 times and create a rectangle button tab for each type of chain
	
		Author: Terry DuBois, Georgio Klironomos
	*/

	// Set opacity, font, and alignment of text in chain tabs


	draw_set_alpha(1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	var textMarginLeft = 5;
	with (obj_panelPane) {
		functionChainList_tabHeight = string_height("0") + 20;
	}

	var tabAmount = 4;

	if (obj_panelPane.showNav) {
		y = obj_menuBar.menuHeight;
	}

	var tabRectY1 = y;
	var tabRectY2 = tabRectY1 + functionChainList_tabHeight;
	draw_set_color(global.colorThemeBG);
	draw_rectangle(x, tabRectY1, x + windowWidth, tabRectY2, false);


	for (var i = 0; i < tabAmount; i++) {// main mechanism

	
		// set dimensions for tabs
		var tabRectX1 = x + (i * (windowWidth / tabAmount));
		var tabRectX2 = tabRectX1 + (windowWidth / tabAmount);
	
		// highlight current tab
		if (i == functionChainList_currentTab) {
			draw_set_color(global.colorThemeSelected1);
			draw_rectangle(tabRectX1, tabRectY1, tabRectX2, tabRectY2, false);
		}
		
		if (i == functionChainList_tabRezBrush || i == functionChainList_tabTrackBrush || i == functionChainList_tabStackBrush) {
			// draw toggleDraw button
			var buttonRectSize = (tabRectY2 - tabRectY1) - 20;
			var toggleDrawRectX1 = tabRectX2 - buttonRectSize - 4;
			var toggleDrawRectY1 = tabRectY2 - string_height("0") - 4;
			var toggleDrawRectX2 = toggleDrawRectX1 + buttonRectSize;
			var toggleDrawRectY2 = toggleDrawRectY1 + buttonRectSize;
			if (i == functionChainList_tabRezBrush) {
				draw_sprite_ext(spr_toggleDraw, obj_chain.toggleDrawRez, mean(toggleDrawRectX1, toggleDrawRectX2), mean(toggleDrawRectY1, toggleDrawRectY2), 1, 1, 0, c_white, 1);
			}
			else if (i == functionChainList_tabTrackBrush) {
				draw_sprite_ext(spr_toggleDraw, obj_chain.toggleDrawTrack, mean(toggleDrawRectX1, toggleDrawRectX2), mean(toggleDrawRectY1, toggleDrawRectY2), 1, 1, 0, c_white, 1);
			}
			else if (i == functionChainList_tabStackBrush) {
				draw_sprite_ext(spr_toggleDraw, obj_chain.toggleDrawStack, mean(toggleDrawRectX1, toggleDrawRectX2), mean(toggleDrawRectY1, toggleDrawRectY2), 1, 1, 0, c_white, 1);
			}
			var mouseoverToggleDraw = point_in_rectangle(mouse_x, mouse_y, toggleDrawRectX1, toggleDrawRectY1, toggleDrawRectX2, toggleDrawRectY2);
			if (mouseoverToggleDraw && !instance_exists(obj_dropDown) && !chainListPane.scrollBarClickLock) {
				scr_createTooltip(mean(toggleDrawRectX1, toggleDrawRectX2), toggleDrawRectY2, "Toggle visible", obj_tooltip.arrowFaceUp);
				draw_set_color(global.colorThemeBorders);
				draw_rectangle(toggleDrawRectX1, toggleDrawRectY1, toggleDrawRectX2, toggleDrawRectY2, true);
				if (mouse_check_button_released(mb_left)) {
					if (i == functionChainList_tabRezBrush) {
						obj_chain.toggleDrawRez = !obj_chain.toggleDrawRez;
					}
					else if (i == functionChainList_tabTrackBrush) {
						obj_chain.toggleDrawTrack = !obj_chain.toggleDrawTrack;
					}
					else if (i == functionChainList_tabStackBrush) {
						obj_chain.toggleDrawStack = !obj_chain.toggleDrawStack;
					}
				}
			}
			
			
			// determine the chainType and listOfChains based on what tab we are on
			var currentTabChainType = "";
			var listOfChains = -1;
			var listOfFilteredChains = -1;
			if (i == functionChainList_tabRezBrush) {
				listOfChains = ds_map_find_value(global.nodeMap, "rezChainList");
				currentTabChainType = "rezChain";
				listOfFilteredChains = obj_chain.filteredRezChainList;
			}
			else if (i == functionChainList_tabTrackBrush) {
				listOfChains = ds_map_find_value(global.nodeMap, "trackChainList");
				currentTabChainType = "trackChain";
				listOfFilteredChains = obj_chain.filteredTrackChainList;
			}
			else if (i == functionChainList_tabStackBrush) {
				listOfChains = ds_map_find_value(global.nodeMap, "stackChainList");
				currentTabChainType = "stackChain";
				listOfFilteredChains = obj_chain.filteredStackChainList;
			}
			var listOfChainsSize = ds_list_size(listOfChains);
			
			
			// draw filter button
			var filterRectX1 = toggleDrawRectX1 - 4 - buttonRectSize;
			var filterRectY1 = toggleDrawRectY1;
			var filterRectX2 = filterRectX1 + buttonRectSize;
			var filterRectY2 = filterRectY1 + buttonRectSize;
			var mouseoverFilter = point_in_rectangle(mouse_x, mouse_y, filterRectX1, filterRectY1, filterRectX2, filterRectY2);
			if (mouseoverFilter && !instance_exists(obj_dropDown) && !chainListPane.scrollBarClickLock) {
				scr_createTooltip(mean(filterRectX1, filterRectX2), filterRectY2, "Filter chains", obj_tooltip.arrowFaceUp);
				draw_set_color(global.colorThemeBorders);
				draw_rectangle(filterRectX1, filterRectY1, filterRectX2, filterRectY2, true);
				if (mouse_check_button_released(mb_left)) {
									
					// if all chains are filtered, unfilter all of them
					if (ds_list_size(listOfFilteredChains) == listOfChainsSize) {
						show_debug_message("scr_panelPane_drawChainTabs() ... unfiltering all chains of type: " + string(currentTabChainType));
						scr_setValueForAllChains(currentTabChainType, "filter", false);
					}
					// if not all of the chains are filtered, filter all of them
					else if (ds_list_size(listOfFilteredChains) >= 0) {
						show_debug_message("scr_panelPane_drawChainTabs() ... filtering all chains of type: " + string(currentTabChainType));
						scr_setValueForAllChains(currentTabChainType, "filter", true);
					}
					
					// render filter!
					if (obj_control.filterGridActive) {
						with (obj_control) {
							scr_renderFilter();
						}
						
						// if there is nothing filtered, we turn filter off
						var totalChainsFiltered = ds_list_size(obj_chain.filteredRezChainList) + ds_list_size(obj_chain.filteredTrackChainList) + ds_list_size(obj_chain.filteredStackChainList);
						if (totalChainsFiltered <= 0) {
							with (obj_control) {
								searchGridActive = false;
								filterGridActive = false;
								currentActiveLineGrid = lineGrid;
								obj_toolPane.currentMode = obj_toolPane.setModeMain;
								wordLeftMarginDest = 170; // Make sure the margin is placed correctly

								with (obj_alarm) {
									alarm[1] = 5;
								}
							}
						}
					}
				}
			}
			
			// adjust image index of filter sprite depending on how many chains are filtered
			var filterImageIndex = 0;
			if (ds_list_size(listOfFilteredChains) > 0) {
				if (ds_list_size(listOfFilteredChains) < listOfChainsSize) {
					filterImageIndex = 2;
				}
				else {
					filterImageIndex = 1;
				}
			}
			draw_sprite_ext(spr_filterIcons, filterImageIndex, mean(filterRectX1, filterRectX2), mean(filterRectY1, filterRectY2), 1, 1, 0, c_white, 1);
		}
		
		// CHAIN OVERHAUL: come back later
		/*
		if (grid != obj_chain.cliqueDisplayGrid) {
			if (grid != obj_control.lineGrid) {
				if(i == functionChainList_currentTab){
					// draw toggleDraw button
					var buttonRectSize = (tabRectY2 - tabRectY1) - 20;
					var toggleDrawRectX1 = tabRectX2 - buttonRectSize - 4;
					var toggleDrawRectY1 = tabRectY2 - string_height("0") - 4;
					var toggleDrawRectX2 = toggleDrawRectX1 + buttonRectSize;
					var toggleDrawRectY2 = toggleDrawRectY1 + buttonRectSize;
					if (i == functionChainList_tabRezBrush) {
						draw_sprite_ext(spr_toggleDraw, obj_chain.toggleDrawRez, mean(toggleDrawRectX1, toggleDrawRectX2), mean(toggleDrawRectY1, toggleDrawRectY2), 1, 1, 0, c_white, 1);
					}
					else if (i == functionChainList_tabTrackBrush) {
						draw_sprite_ext(spr_toggleDraw, obj_chain.toggleDrawTrack, mean(toggleDrawRectX1, toggleDrawRectX2), mean(toggleDrawRectY1, toggleDrawRectY2), 1, 1, 0, c_white, 1);
					}
					else if (i == functionChainList_tabStackBrush) {
						draw_sprite_ext(spr_toggleDraw, obj_chain.toggleDrawStack, mean(toggleDrawRectX1, toggleDrawRectX2), mean(toggleDrawRectY1, toggleDrawRectY2), 1, 1, 0, c_white, 1);
					}
					if (not instance_exists(obj_dropDown) and point_in_rectangle(mouse_x, mouse_y, toggleDrawRectX1, toggleDrawRectY1, toggleDrawRectX2, toggleDrawRectY2) and not chainListPane.scrollBarClickLock) {
						scr_createTooltip(mean(toggleDrawRectX1, toggleDrawRectX2), toggleDrawRectY2, "Toggle visible", obj_tooltip.arrowFaceUp);
						draw_set_color(global.colorThemeBorders);
						draw_rectangle(toggleDrawRectX1, toggleDrawRectY1, toggleDrawRectX2, toggleDrawRectY2, true);
						if (mouse_check_button_released(mb_left)) {
							if (i == functionChainList_tabRezBrush) {
								obj_chain.toggleDrawRez = !obj_chain.toggleDrawRez;
							}
							else if (i == functionChainList_tabTrackBrush) {
								obj_chain.toggleDrawTrack = !obj_chain.toggleDrawTrack;
							}
							else if (i == functionChainList_tabStackBrush) {
								obj_chain.toggleDrawStack = !obj_chain.toggleDrawStack;
							}
						}
					}
	
					// draw filter button
					var filterRectX1 = toggleDrawRectX1 - 4 - buttonRectSize;
					var filterRectY1 = toggleDrawRectY1;
					var filterRectX2 = filterRectX1 + buttonRectSize;
					var filterRectY2 = filterRectY1 + buttonRectSize;
					var filterImageIndex = 0;
					if (not instance_exists(obj_dropDown) and point_in_rectangle(mouse_x, mouse_y, filterRectX1, filterRectY1, filterRectX2, filterRectY2) and not chainListPane.scrollBarClickLock) {
						scr_createTooltip(mean(filterRectX1, filterRectX2), filterRectY2, "Filter chains", obj_tooltip.arrowFaceUp);
						draw_set_color(global.colorThemeBorders);
						draw_rectangle(filterRectX1, filterRectY1, filterRectX2, filterRectY2, true);
						if (mouse_check_button_released(mb_left)) {
			
							if (ds_grid_value_exists(grid, obj_chain.chainGrid_colInFilter, 0, obj_chain.chainGrid_colInFilter, ds_grid_height(grid), true)) {
								if (ds_grid_value_exists(grid, obj_chain.chainGrid_colInFilter, 0, obj_chain.chainGrid_colInFilter, ds_grid_height(grid), false)) {
									ds_grid_set_region(grid, obj_chain.chainGrid_colInFilter, 0, obj_chain.chainGrid_colInFilter, ds_grid_height(grid), true);
								}
								else {
									ds_grid_set_region(grid, obj_chain.chainGrid_colInFilter, 0, obj_chain.chainGrid_colInFilter, ds_grid_height(grid), false);
								}
							}
							else {
								ds_grid_set_region(grid, obj_chain.chainGrid_colInFilter, 0, obj_chain.chainGrid_colInFilter, ds_grid_height(grid), true);
							}
				
				
							if (obj_control.filterGridActive) {
					
								with (obj_control) {
									scr_renderFilter();
								}
					
								if (not ds_grid_value_exists(obj_chain.rezChainGrid, obj_chain.chainGrid_colInFilter, 0, obj_chain.chainGrid_colInFilter, ds_grid_height(grid), true)
								and not ds_grid_value_exists(obj_chain.trackChainGrid, obj_chain.chainGrid_colInFilter, 0, obj_chain.chainGrid_colInFilter, ds_grid_height(grid), true)
								and not ds_grid_value_exists(obj_chain.stackChainGrid, obj_chain.chainGrid_colInFilter, 0, obj_chain.chainGrid_colInFilter, ds_grid_height(grid), true)) {
					
									with (obj_control) {
										searchGridActive = false;
										filterGridActive = false;
										currentActiveLineGrid = lineGrid;
										obj_toolPane.currentMode = obj_toolPane.setModeMain;
										wordLeftMarginDest = 170; // Make sure the margin is placed correctly

										with (obj_alarm) {
											alarm[1] = 5;
										}
									}
								}
							}
						}
					}
					if (ds_grid_value_exists(grid, obj_chain.chainGrid_colInFilter, 0, obj_chain.chainGrid_colInFilter, ds_grid_height(grid), true)) {
						if (ds_grid_value_exists(grid, obj_chain.chainGrid_colInFilter, 0, obj_chain.chainGrid_colInFilter, ds_grid_height(grid), false)) {
							filterImageIndex = 2;
						}
						else {
							filterImageIndex = 1;
						}
					}
					draw_sprite_ext(spr_filterIcons, filterImageIndex, mean(filterRectX1, filterRectX2), mean(filterRectY1, filterRectY2), 1, 1, 0, c_white, 1);
		
			
			
			
					var ascendRectX1 = filterRectX1 - 4 - buttonRectSize;
					var ascendRectY1 = filterRectY1;
					var ascendRectX2 = ascendRectX1 + buttonRectSize;
					var ascendRectY2 = ascendRectY1 + buttonRectSize;
			
					if (not instance_exists(obj_dropDown) and point_in_rectangle(mouse_x, mouse_y, ascendRectX1, ascendRectY1, ascendRectX2, ascendRectY2) and not chainListPane.scrollBarClickLock) {
						scr_createTooltip(mean(ascendRectX1, ascendRectX2), ascendRectY2, (functionChainList_sortAsc[i]) ? "Sort ascending" : "Sort descending", obj_tooltip.arrowFaceUp);
						draw_set_color(global.colorThemeBorders);
						draw_rectangle(ascendRectX1, ascendRectY1, ascendRectX2, ascendRectY2, true);
				
						if (mouse_check_button_released(mb_left)) {
							with (obj_panelPane) {
								functionChainList_sortAsc[i] = !functionChainList_sortAsc[i];
							}
							var sortCol = obj_chain.chainGrid_colChainSeq;
							switch (i) {
								case functionChainList_tabRezBrush:
									with (obj_chain) {
										ds_grid_sort(rezChainGrid, sortCol, obj_panelPane.functionChainList_sortAsc[i]);
									}
									break;
								case functionChainList_tabTrackBrush:
									with (obj_chain) {
										ds_grid_sort(trackChainGrid, sortCol, obj_panelPane.functionChainList_sortAsc[i]);
									}
									break;
								case functionChainList_tabStackBrush:
									with (obj_chain) {
										ds_grid_sort(stackChainGrid, sortCol, obj_panelPane.functionChainList_sortAsc[i]);
									}
									break;
								default:
									break;
							}
						}
					}
			
					var ascendYScale = (functionChainList_sortAsc[i]) ? 1 : -1;
					draw_sprite_ext(spr_ascend, 0, mean(ascendRectX1, ascendRectX2), mean(ascendRectY1, ascendRectY2), 1, ascendYScale, 0, c_white, 1);
				}
			}			
			else if (functionChainList_currentTab == functionChainList_tabLine) {
				
					var mouseOverUnitTab = false;
					// Unit Tag toggle button
					var buttonRectSize = (tabRectY2 - tabRectY1) - 8;
					var tagButtonRectX1 = tabRectX2 - buttonRectSize - 4;
					var tagButtonRectY1 = tabRectY1 + 4;
					var tagButtonRectX2 = tagButtonRectX1 + buttonRectSize;
					var tagButtonRectY2 = tagButtonRectY1 + buttonRectSize;
					draw_set_color(global.colorThemeText);
					if (not instance_exists(obj_dropDown) and point_in_rectangle(mouse_x, mouse_y, tagButtonRectX1, tagButtonRectY1, tagButtonRectX2, tagButtonRectY2) and not chainListPane.scrollBarClickLock) {
						
						scr_createTooltip(mean(tagButtonRectX1, tagButtonRectX2), tagButtonRectY2, (obj_control.showUnitTags) ? "1-to-1" : "1-to-many", obj_tooltip.arrowFaceUp);
						
						draw_set_color(global.colorThemeSelected2);
						draw_rectangle(tagButtonRectX1, tagButtonRectY1, tagButtonRectX2, tagButtonRectY2, false);
						draw_set_color(global.colorThemeBorders);
						draw_rectangle(tagButtonRectX1, tagButtonRectY1, tagButtonRectX2, tagButtonRectY2, true);

						mouseOverUnitTab = true;
						//draw_rectangle(tagButtonRectX1, tagButtonRectY1, tagButtonRectX2, tagButtonRectY2, false);

						if (mouse_check_button_released(mb_left)) {
							obj_control.showUnitTags = !obj_control.showUnitTags;
							if(obj_control.showTranslation) {
								obj_control.showTranslation = false;
							}
						}
					}
					draw_sprite_ext(spr_oneToOne, (obj_control.showUnitTags) ? 1 : 0, floor(mean(tagButtonRectX1, tagButtonRectX2)), floor(mean(tagButtonRectY1, tagButtonRectY2)), 1, 1, 0, c_white, 1);
				}	
		}
		*/
		
		
		
		
	

		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	
		// check for mouse clicks to change the selected tab
		if (not instance_exists(obj_dropDown) and point_in_rectangle(mouse_x, mouse_y, tabRectX1, tabRectY1, tabRectX2, tabRectY2) and not chainListPane.scrollBarClickLock) {
			if (device_mouse_check_button_released(0, mb_left)) {
				//show_message(string(i));
				functionChainList_currentTab = i;
			
				// unfocus chains of all type
				scr_unFocusAllChains();
			
				if (i == 1) {
					obj_toolPane.currentMode = obj_toolPane.modeTrack;
					if(obj_control.searchGridActive) {
						obj_toolPane.setModeSearch = obj_toolPane.modeTrack;
					}
					else {
						obj_toolPane.setModeMain = obj_toolPane.modeTrack;
					}
				}
				if (i == 2) {
					obj_toolPane.currentMode = obj_toolPane.modeRez;
					if(obj_control.searchGridActive) {
						obj_toolPane.setModeSearch = obj_toolPane.modeRez;
					}
					else {
						obj_toolPane.setModeMain = obj_toolPane.modeRez;
					}
				}
				if (i == 3) {
					if(obj_toolPane.currentMode = obj_toolPane.modeRead) {
						obj_toolPane.currentMode = obj_toolPane.modeTrack;
						if (obj_control.searchGridActive) {
							obj_toolPane.setModeSearch = obj_toolPane.modeTrack;
						}
						else {
							obj_toolPane.setModeMain = obj_toolPane.modeTrack;
						}
					}
				}
			}
		}
	
		// keeps drawing the name of the tabs
		draw_set_color(global.colorThemeBorders);
		draw_rectangle(tabRectX1, tabRectY1, tabRectX2, tabRectY2, true);
		draw_set_color(global.colorThemeText);
		scr_adaptFont(scr_get_translation(functionChainList_tabName[i]), "M");
		draw_text(tabRectX1 + textMarginLeft, tabRectY1, scr_get_translation(functionChainList_tabName[i]));

	}


}
