
/*
	scr_stackShowWindow();
	
	Last Updated: 2019-06-25
	
	Called from: obj_control
	
	Purpose: draw custom search box for multiple options
	
	Mechanism: draws multiple rectangles and text to represent options to the user when they search,
	this includes booleans for a case sensitive search, transcript search, and a search within a chain
				
	Author: Brady Moore
*/


	var verticleBuffer = 230;
	var horizontalBuffer = 300;
	var stackBoxXOffset = 280;
	var stackBoxYOffset = 160;
	var buttonXOffset = 65;
	var buttonYOffset = 25;


if (stackShowWindowActive) {
	obj_control.mouseoverPanelPane = true;

	

	draw_set_halign(fa_left);
	draw_set_colour(global.colorThemeBG);
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 - horizontalBuffer, camera_get_view_height(view_camera[0])/2 - verticleBuffer, camera_get_view_width(view_camera[0]) /2 + horizontalBuffer, camera_get_view_height(view_camera[0])/2 + verticleBuffer, false);
	x = camera_get_view_width(view_camera[0]) /2 - stackBoxXOffset;
	y = camera_get_view_height(view_camera[0])/2 - stackBoxYOffset + 1;
	
	draw_set_colour(global.colorThemePaneBG);
	if (global.colorTheme ==0) {
	draw_set_colour(c_ltgray);
	}
	// draw background UI
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 - horizontalBuffer, camera_get_view_height(view_camera[0])/2 - verticleBuffer + 30, camera_get_view_width(view_camera[0]) /2 + horizontalBuffer, camera_get_view_height(view_camera[0])/2 + verticleBuffer, false);
	draw_set_colour(global.colorThemeBorders);
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 - horizontalBuffer, camera_get_view_height(view_camera[0])/2 - verticleBuffer + 30, camera_get_view_width(view_camera[0]) /2 + horizontalBuffer, camera_get_view_height(view_camera[0])/2 + verticleBuffer, true);
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 - horizontalBuffer, camera_get_view_height(view_camera[0])/2 - verticleBuffer, camera_get_view_width(view_camera[0]) /2 + horizontalBuffer, camera_get_view_height(view_camera[0])/2 + verticleBuffer, true);

		
	// draw stack box
	draw_set_colour(c_white);
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 - stackBoxXOffset , camera_get_view_height(view_camera[0])/2 - stackBoxYOffset - 20, camera_get_view_width(view_camera[0]) /2 + 20, camera_get_view_height(view_camera[0])/2 + stackBoxYOffset - 20, false);
	draw_set_colour(global.colorThemeBorders);
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 - stackBoxXOffset , camera_get_view_height(view_camera[0])/2 - stackBoxYOffset - 20, camera_get_view_width(view_camera[0]) /2 + 21, camera_get_view_height(view_camera[0])/2 + stackBoxYOffset - 20, true);

		
	// draw inside stack box
	draw_set_colour(c_white);
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 - stackBoxXOffset , camera_get_view_height(view_camera[0])/2 - stackBoxYOffset, camera_get_view_width(view_camera[0]) /2 + 20, camera_get_view_height(view_camera[0])/2 + stackBoxYOffset - 20, false);
	draw_set_colour(global.colorThemeBorders);
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 - stackBoxXOffset , camera_get_view_height(view_camera[0])/2 - stackBoxYOffset, camera_get_view_width(view_camera[0]) /2 + 21, camera_get_view_height(view_camera[0])/2 + stackBoxYOffset - 20, true);

	
	draw_set_colour(global.colorThemeText);
	draw_set_font(fnt_mainBold);
	draw_text(camera_get_view_width(view_camera[0]) /2 - stackBoxXOffset  + 30, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset - 9, "Select All");
	
	draw_set_colour(global.colorThemeText);
	draw_set_font(fnt_mainBold);
	draw_text(camera_get_view_width(view_camera[0])/2 - horizontalBuffer + 15, camera_get_view_height(view_camera[0])/2 - verticleBuffer + 15, string(game_display_name));
	
	draw_set_font(fnt_mainLarge1);

	// draw buttons for OK and Cancel
	draw_set_colour(global.colorThemeBG);
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 - 100 - buttonXOffset, camera_get_view_height(view_camera[0])/2 + 180 - buttonYOffset, camera_get_view_width(view_camera[0]) /2 - 100 + buttonXOffset,camera_get_view_height(view_camera[0])/2 + 180 + buttonYOffset, false);
	draw_set_colour(global.colorThemeBorders);
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 - 100 - buttonXOffset, camera_get_view_height(view_camera[0])/2 + 180 - buttonYOffset, camera_get_view_width(view_camera[0]) /2 - 100 + buttonXOffset,camera_get_view_height(view_camera[0])/2 + 180 + buttonYOffset, true);
	draw_set_colour(global.colorThemeBG);
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 + 100 - buttonXOffset, camera_get_view_height(view_camera[0])/2 + 180 - buttonYOffset, camera_get_view_width(view_camera[0]) /2 + 100 + buttonXOffset,camera_get_view_height(view_camera[0])/2 + 180 + buttonYOffset, false);
	draw_set_colour(global.colorThemeBorders);
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 + 100 - buttonXOffset, camera_get_view_height(view_camera[0])/2 + 180 - buttonYOffset, camera_get_view_width(view_camera[0]) /2 + 100 + buttonXOffset,camera_get_view_height(view_camera[0])/2 + 180 + buttonYOffset, true);
	draw_set_colour(global.colorThemeText);
	draw_set_font(fnt_mainLarge1);
	
	// draw button text
	draw_text(camera_get_view_width(view_camera[0]) /2 - 155, camera_get_view_height(view_camera[0])/2 + 180, "Show Stacks");
	draw_text(camera_get_view_width(view_camera[0]) /2 + 70, camera_get_view_height(view_camera[0])/2 + 180, "Cancel");
	
	

	draw_rectangle(camera_get_view_width(view_camera[0]) /2 - stackBoxXOffset  + 10, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset - 15, camera_get_view_width(view_camera[0]) /2 - stackBoxXOffset  + 20, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset - 5, true);
	if (obj_dialogueBox.selectAll) {
		draw_rectangle(camera_get_view_width(view_camera[0]) /2 - stackBoxXOffset  + 10, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset - 15, camera_get_view_width(view_camera[0]) /2 - stackBoxXOffset  + 20, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset - 5, false);	
	}

	// Select all boolean switch
	if (point_in_rectangle(mouse_x, mouse_y,camera_get_view_width(view_camera[0]) /2 - stackBoxXOffset  + 10, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset - 15, camera_get_view_width(view_camera[0]) /2 - stackBoxXOffset  + 20, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset - 5)){
			if (device_mouse_check_button_released(0, mb_left)) {
				obj_dialogueBox.selectAll = !obj_dialogueBox.selectAll;	
				ds_grid_set_region(obj_chain.stackChainGrid, obj_chain.chainGrid_colInFilter, 0, obj_chain.chainGrid_colInFilter, ds_grid_height(obj_chain.stackChainGrid), obj_dialogueBox.selectAll);
			}
	}
	
	
	
	
	//draw stacks for selection
	
	
	scr_drawStackShowWindow();

	
	
	//right side of window options
	
	//option headers
	draw_set_halign(fa_center);
	draw_set_alpha(1);
	draw_set_font(fnt_mainBoldLarge1);
	draw_set_colour(global.colorThemeText);
	draw_text(camera_get_view_width(view_camera[0]) /2 + 150, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset - 10 , "GAME");
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 + 150 - (string_width("GAME")/2) - 5, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset, camera_get_view_width(view_camera[0]) /2 + 150 + (string_width("GAME")/2) + 5, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset, true);
	
	
	draw_text(camera_get_view_width(view_camera[0]) /2 + 150, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset/2.5 - 10 , "VIEW");
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 + 150 - (string_width("VIEW")/2) - 5, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset/2.5, camera_get_view_width(view_camera[0]) /2 + 150 + (string_width("VIEW")/2) + 5, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset/2.5, true);
	
	
	//button for game selection
	draw_set_font(fnt_mainLarge1);
	draw_text(camera_get_view_width(view_camera[0]) /2 + 150, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset + 20, currentGame);

	if(gameHover == true){
		draw_rectangle(camera_get_view_width(view_camera[0]) /2 + 150 - (string_width(currentGame)/2) - 5, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset + 20 - (string_height(currentGame)/2) - 5, camera_get_view_width(view_camera[0]) /2 + 150 + (string_width(currentGame)/2) + 5, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset + 20 + (string_height(currentGame)/2) + 5, true);
	}

	
	//options text draw
	draw_set_font(fnt_main);
	draw_set_halign(fa_left);
	draw_text(camera_get_view_width(view_camera[0]) /2 + 70, camera_get_view_height(view_camera[0])/2 - 110 , "Tutorial");
	draw_text(camera_get_view_width(view_camera[0]) /2 + 70, camera_get_view_height(view_camera[0])/2 - 45, "Left Justified");
	draw_text(camera_get_view_width(view_camera[0]) /2 + 70, camera_get_view_height(view_camera[0])/2 - 15, "Transcript");
	draw_text(camera_get_view_width(view_camera[0]) /2 + 70, camera_get_view_height(view_camera[0])/2 + 15, "Show Nav Window");
	
	// Tutorial toggle button
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 + 70 - 30, camera_get_view_height(view_camera[0])/2 - 110 - 10, camera_get_view_width(view_camera[0]) /2 + 70 -10, camera_get_view_height(view_camera[0])/2 - 110 + 10, true);
	if (setTutorial) {
		draw_rectangle(camera_get_view_width(view_camera[0]) /2 + 70 - 30, camera_get_view_height(view_camera[0])/2 - 110 - 10, camera_get_view_width(view_camera[0]) /2 + 70 -10, camera_get_view_height(view_camera[0])/2 - 110 + 10, false);	
	}
	// Justify toggle button
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 + 70 - 30, camera_get_view_height(view_camera[0])/2 - 45 - 10, camera_get_view_width(view_camera[0]) /2 + 70 -10, camera_get_view_height(view_camera[0])/2 - 45 + 10, true);
	if (setJustified) {
		draw_rectangle(camera_get_view_width(view_camera[0]) /2 + 70 - 30, camera_get_view_height(view_camera[0])/2 - 45 - 10, camera_get_view_width(view_camera[0]) /2 + 70 -10, camera_get_view_height(view_camera[0])/2 - 45 + 10, false);	
	}
	// Transcript toggle button
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 + 70 - 30, camera_get_view_height(view_camera[0])/2 - 15 - 10, camera_get_view_width(view_camera[0]) /2 + 70 -10, camera_get_view_height(view_camera[0])/2 - 15 + 10, true);
	if (setTranscript) {
		draw_rectangle(camera_get_view_width(view_camera[0]) /2 + 70 - 30, camera_get_view_height(view_camera[0])/2 - 15 - 10, camera_get_view_width(view_camera[0]) /2 + 70 -10, camera_get_view_height(view_camera[0])/2 - 15 + 10, false);	
	}

	// NavWindow toggle button
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 + 70 - 30, camera_get_view_height(view_camera[0])/2 + 15 - 10, camera_get_view_width(view_camera[0]) /2 + 70 -10, camera_get_view_height(view_camera[0])/2 + 15 + 10, true);
	if (setNavWindow) {
		draw_rectangle(camera_get_view_width(view_camera[0]) /2 + 70 - 30, camera_get_view_height(view_camera[0])/2 + 15 - 10, camera_get_view_width(view_camera[0]) /2 + 70 -10, camera_get_view_height(view_camera[0])/2 + 15 + 10, false);	
	}


	//tutorial logic check
	if (point_in_rectangle(mouse_x, mouse_y,camera_get_view_width(view_camera[0]) /2 + 70 - 30, camera_get_view_height(view_camera[0])/2 - 110 - 10, camera_get_view_width(view_camera[0]) /2 + 70 -10, camera_get_view_height(view_camera[0])/2 - 110 + 10)){

			draw_set_color(c_white);
			draw_rectangle(mouse_x-35, mouse_y+20,mouse_x+35, mouse_y + 40,false);
			draw_set_colour(global.colorThemeBorders);
			draw_rectangle(mouse_x-35, mouse_y+20,mouse_x+35, mouse_y + 40,true);
			
			if(setTutorial){
				draw_set_halign(fa_center);
				draw_text(mean(mouse_x-25,mouse_x+25), mean(mouse_y+20,mouse_y + 40) , "Enabled");
			}
			else{
				draw_set_halign(fa_center);
				draw_text(mean(mouse_x-25,mouse_x+25), mean(mouse_y+20,mouse_y + 40) , "Disabled");
			}
			if (device_mouse_check_button_released(0, mb_left)) {
				setTutorial = !setTutorial;	
			}
	}


	// Justify logic check
	if (point_in_rectangle(mouse_x, mouse_y,camera_get_view_width(view_camera[0]) /2 + 70 - 30, camera_get_view_height(view_camera[0])/2 - 45 - 10, camera_get_view_width(view_camera[0]) /2 + 70 -10, camera_get_view_height(view_camera[0])/2 - 45 + 10)){

			draw_set_color(c_white);
			draw_rectangle(mouse_x-35, mouse_y+20,mouse_x+35, mouse_y + 40,false);
			draw_set_colour(global.colorThemeBorders);
			draw_rectangle(mouse_x-35, mouse_y+20,mouse_x+35, mouse_y + 40,true);
			
			if(setJustified){
				draw_set_halign(fa_center);
				draw_text(mean(mouse_x-25,mouse_x+25), mean(mouse_y+20,mouse_y + 40) , "Enabled");
			}
			else{
				draw_set_halign(fa_center);
				draw_text(mean(mouse_x-25,mouse_x+25), mean(mouse_y+20,mouse_y + 40) , "Disabled");
			}
			if (device_mouse_check_button_released(0, mb_left)) {
				setJustified = !setJustified;	
			}
	}
	


	// Transcript logic check
	if (point_in_rectangle(mouse_x, mouse_y,camera_get_view_width(view_camera[0]) /2 + 70 - 30, camera_get_view_height(view_camera[0])/2 - 15 - 10, camera_get_view_width(view_camera[0]) /2 + 70 -10, camera_get_view_height(view_camera[0])/2 - 15 + 10)){

			draw_set_color(c_white);
			draw_rectangle(mouse_x-35, mouse_y+20,mouse_x+35, mouse_y + 40,false);
			draw_set_colour(global.colorThemeBorders);
			draw_rectangle(mouse_x-35, mouse_y+20,mouse_x+35, mouse_y + 40,true);
			
			if(setTranscript){
				draw_set_halign(fa_center);
				draw_text(mean(mouse_x-25,mouse_x+25), mean(mouse_y+20,mouse_y + 40) , "Enabled");
			}
			else{
				draw_set_halign(fa_center);
				draw_text(mean(mouse_x-25,mouse_x+25), mean(mouse_y+20,mouse_y + 40) , "Disabled");
			}
			if (device_mouse_check_button_released(0, mb_left)) {
				setTranscript = !setTranscript;	
			}
	}
	

	
	// NavWindow logic check
	if (point_in_rectangle(mouse_x, mouse_y,camera_get_view_width(view_camera[0]) /2 + 70 - 30, camera_get_view_height(view_camera[0])/2 + 15 - 10, camera_get_view_width(view_camera[0]) /2 + 70 -10, camera_get_view_height(view_camera[0])/2 + 15 + 10)){

			draw_set_color(c_white);
			draw_rectangle(mouse_x-35, mouse_y+20,mouse_x+35, mouse_y + 40,false);
			draw_set_colour(global.colorThemeBorders);
			draw_rectangle(mouse_x-35, mouse_y+20,mouse_x+35, mouse_y + 40,true);
			
			if(setNavWindow){
				draw_set_halign(fa_center);
				draw_text(mean(mouse_x-25,mouse_x+25), mean(mouse_y+20,mouse_y + 40) , "Enabled");
			}
			else{
				draw_set_halign(fa_center);
				draw_text(mean(mouse_x-25,mouse_x+25), mean(mouse_y+20,mouse_y + 40) , "Disabled");
			}
			if (device_mouse_check_button_released(0, mb_left)) {
				setNavWindow = !setNavWindow;	
			}
	}
	
	
			
	if (point_in_rectangle(mouse_x, mouse_y,camera_get_view_width(view_camera[0]) /2 + 150 - (string_width(currentGame)/2) - 5, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset + 20 - (string_height(currentGame)/2) - 5, camera_get_view_width(view_camera[0]) /2 + 150 + (string_width(currentGame)/2) + 5, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset + 20 + (string_height(currentGame)/2) + 5)){
			gameHover = true;
			if (device_mouse_check_button_released(0, mb_left)) {

					obj_control.wideDropDown = true;
					var dropDownOptionList = ds_list_create();
					ds_list_add(dropDownOptionList,"Where's Elmo", "Rezzles", "SpotBot");

					if (ds_list_size(dropDownOptionList) > 0 and obj_control.ableToCreateDropDown) {
						var dropDownInst = instance_create_depth(camera_get_view_width(view_camera[0]) /2 + 134 - 52,  camera_get_view_height(view_camera[0])/2 - stackBoxYOffset + 22 + (string_height(currentGame)/2) + 5, -999, obj_dropDown);
						dropDownInst.optionList = dropDownOptionList;
						dropDownInst.optionListType = 10;
					
						obj_control.ableToCreateDropDown = false;
						obj_control.alarm[0] = 2;
					}
			}
	}
	else{
		gameHover = false;
	}
	
	
	
	/*
	// Tracks Only toggle button
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 - stackBoxXOffset + 120, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset - 15, camera_get_view_width(view_camera[0]) /2 - stackBoxXOffset + 130, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset - 5, true);
	if (obj_toolPane.tracksOnlyStackShow) {
		draw_rectangle(camera_get_view_width(view_camera[0]) /2 - stackBoxXOffset + 120, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset - 15, camera_get_view_width(view_camera[0]) /2 - stackBoxXOffset + 130, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset - 5, false);	
	}

	draw_set_colour(global.colorThemeText);
	draw_set_font(fnt_mainBold);
	draw_text(camera_get_view_width(view_camera[0]) /2 - stackBoxXOffset + 135, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset - 10, "Where's Elmo?");
	// current chain boolean switch
	if (point_in_rectangle(mouse_x, mouse_y,camera_get_view_width(view_camera[0]) /2 - stackBoxXOffset + 120, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset - 15, camera_get_view_width(view_camera[0]) /2 - stackBoxXOffset + 130, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset - 5)){
			if (device_mouse_check_button_released(0, mb_left)) {
				obj_toolPane.tracksOnlyStackShow = !obj_toolPane.tracksOnlyStackShow;	
				obj_toolPane.rezOnlyStackShow = false;
				//ds_grid_set_region(obj_chain.stackChainGrid, obj_chain.chainGrid_colInFilter, 0, obj_chain.chainGrid_colInFilter, ds_grid_height(obj_chain.stackChainGrid), obj_dialogueBox.selectAll);
			}
	}
	
	// Rez Only toggle button
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 - stackBoxXOffset + 260, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset - 15, camera_get_view_width(view_camera[0]) /2 - stackBoxXOffset + 270, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset - 5, true);
	if (obj_toolPane.rezOnlyStackShow) {
		draw_rectangle(camera_get_view_width(view_camera[0]) /2 - stackBoxXOffset + 260, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset - 15, camera_get_view_width(view_camera[0]) /2 - stackBoxXOffset + 270, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset - 5, false);	
	}

	draw_set_colour(global.colorThemeText);
	draw_set_font(fnt_mainBold);
	draw_text(camera_get_view_width(view_camera[0]) /2 - stackBoxXOffset + 275, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset - 10, "Rezzle");
	// current chain boolean switch
	if (point_in_rectangle(mouse_x, mouse_y,camera_get_view_width(view_camera[0]) /2 - stackBoxXOffset + 260, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset - 15, camera_get_view_width(view_camera[0]) /2 - stackBoxXOffset + 270, camera_get_view_height(view_camera[0])/2 - stackBoxYOffset - 5)){
			if (device_mouse_check_button_released(0, mb_left)) {
				obj_toolPane.rezOnlyStackShow = !obj_toolPane.rezOnlyStackShow;	
				obj_toolPane.tracksOnlyStackShow = false;
				//ds_grid_set_region(obj_chain.stackChainGrid, obj_chain.chainGrid_colInFilter, 0, obj_chain.chainGrid_colInFilter, ds_grid_height(obj_chain.stackChainGrid), obj_dialogueBox.selectAll);
			}
	}
	//draw_set_font(fnt_mainLarge1);
*/





}




// ok button check
if (point_in_rectangle(mouse_x, mouse_y, camera_get_view_width(view_camera[0]) /2 - 100 - buttonXOffset, camera_get_view_height(view_camera[0])/2 + 180 - buttonYOffset, camera_get_view_width(view_camera[0]) /2 - 100 + buttonXOffset, camera_get_view_height(view_camera[0])/2 + 180 + buttonYOffset) && stackShowWindowActive){
		if (device_mouse_check_button_released(0, mb_left)) {
			
			
			// In here is where the stackShow initiation code will go
			//obj_control.currentStackShowListPosition = 0;
			for(var stackShowListLoop = 0; stackShowListLoop < ds_grid_height(obj_chain.stackChainGrid); stackShowListLoop++) {
				// Currently adds Stacks into the list if they are within the filter
				if(ds_grid_get(obj_chain.stackChainGrid, obj_chain.chainGrid_colInFilter, stackShowListLoop)) {
					var currentStackID = ds_grid_get(obj_chain.stackChainGrid, obj_chain.chainGrid_colChainID, stackShowListLoop);
					ds_list_add(obj_control.stackShowList, currentStackID);	
				}
			}
			
			
			
			// Clear the Filter of all chains
			ds_grid_set_region(obj_chain.rezChainGrid, obj_chain.chainGrid_colInFilter, 0, obj_chain.chainGrid_colInFilter, ds_grid_height(obj_chain.rezChainGrid), false);
			ds_grid_set_region(obj_chain.trackChainGrid, obj_chain.chainGrid_colInFilter, 0, obj_chain.chainGrid_colInFilter, ds_grid_height(obj_chain.trackChainGrid), false);
			ds_grid_set_region(obj_chain.stackChainGrid, obj_chain.chainGrid_colInFilter, 0, obj_chain.chainGrid_colInFilter, ds_grid_height(obj_chain.stackChainGrid), false);
			instance_destroy();
			// Begin the show
			scr_stackShow();
			
			// Restrict tool selection for players
			if(string(global.userName) != "gold"){
				with(obj_toolPane) {
					alarm[3] = 30;	
				}
			}
			
			// Start the tracker timer
			with(obj_panelPane){
				alarm[5] = 60;
			}
			obj_control.moveCounter = 0;
			
			// Set word's to their tokens as default for stackShow
			if(!obj_control.wordTranscriptView) {
				//obj_control.stackShowSwitchedWordView = true;
				obj_control.wordTranscriptView = !obj_control.wordTranscriptView;

				for (var i = 0; i < ds_grid_height(obj_control.dynamicWordGrid); i++) {
					var currentWordTranscript = ds_grid_get(obj_control.wordGrid, obj_control.wordGrid_colWordTranscript, i);
					var currentWordToken = ds_grid_get(obj_control.wordGrid, obj_control.wordGrid_colWordToken, i);
					var currentReplaceWord = ds_grid_get(obj_control.dynamicWordGrid, obj_control.dynamicWordGrid_colReplaceWord, i);
	
					if (string_length(currentReplaceWord) > 0) {
						ds_grid_set(obj_control.dynamicWordGrid, obj_control.dynamicWordGrid_colDisplayString, i, currentReplaceWord);
					}
					else {
						if (obj_control.wordTranscriptView) {
							ds_grid_set(obj_control.dynamicWordGrid, obj_control.dynamicWordGrid_colDisplayString, i, currentWordToken);
						}
						else {
							ds_grid_set(obj_control.dynamicWordGrid, obj_control.dynamicWordGrid_colDisplayString, i, currentWordTranscript);
						}
					}
				}
			}
			if(obj_toolPane.tracksOnlyStackShow) {
				if (obj_control.shape == obj_control.shapeBlock) {
					obj_control.stackShowSwitchedTextShape = true;
					obj_control.shape = obj_control.shapeText;	
				}
				if (!instance_exists(obj_dialogueBox)) {
					instance_create_layer(x, y, "InstancesDialogue", obj_dialogueBox);
				}
				
				instance_create_layer(-500, -500, "Instances", obj_submitChain);
	
				obj_dialogueBox.elmoActive = true;
				if(string(global.userName) != "gold") {
					obj_panelPane.showNav = false;
					obj_toolPane.showTool = false;
				}
			}
		}
		
}

// cancel button check
if (point_in_rectangle(mouse_x, mouse_y, camera_get_view_width(view_camera[0]) /2 + 100 - buttonXOffset, camera_get_view_height(view_camera[0])/2 + 180 - buttonYOffset, camera_get_view_width(view_camera[0]) /2 + 100 + buttonXOffset, camera_get_view_height(view_camera[0])/2 + 180 + buttonYOffset) && stackShowWindowActive){
	if (device_mouse_check_button_released(0, mb_left)) {
		obj_dialogueBox.stackShowWindowActive = false;
		instance_destroy();
	}
		
}


// enter check
//show_message(string(global.wheresElmo));
if ( (keyboard_check_pressed(vk_enter) && stackShowWindowActive) or global.games) {

	if(global.games) {
		ds_grid_set_region(obj_chain.stackChainGrid, obj_chain.chainGrid_colInFilter, 0, obj_chain.chainGrid_colInFilter, ds_grid_height(obj_chain.stackChainGrid), true);	
	}
	
	// In here is where the stackShow initiation code will go
	//obj_control.currentStackShowListPosition = 0;
	for(var stackShowListLoop = 0; stackShowListLoop < ds_grid_height(obj_chain.stackChainGrid); stackShowListLoop++) {
		// Currently adds Stacks into the list if they are within the filter
		if(ds_grid_get(obj_chain.stackChainGrid, obj_chain.chainGrid_colInFilter, stackShowListLoop)) {
			var currentStackID = ds_grid_get(obj_chain.stackChainGrid, obj_chain.chainGrid_colChainID, stackShowListLoop);
			ds_list_add(obj_control.stackShowList, currentStackID);	
		}
	}
	
	// Clear the Filter of all chains
	ds_grid_set_region(obj_chain.rezChainGrid, obj_chain.chainGrid_colInFilter, 0, obj_chain.chainGrid_colInFilter, ds_grid_height(obj_chain.rezChainGrid), false);
	ds_grid_set_region(obj_chain.trackChainGrid, obj_chain.chainGrid_colInFilter, 0, obj_chain.chainGrid_colInFilter, ds_grid_height(obj_chain.trackChainGrid), false);
	ds_grid_set_region(obj_chain.stackChainGrid, obj_chain.chainGrid_colInFilter, 0, obj_chain.chainGrid_colInFilter, ds_grid_height(obj_chain.stackChainGrid), false);
	instance_destroy();
	// Begin the show
	scr_stackShow();
	
	
	
	// Restrict tool selection for players
	if(string(global.userName) != "gold"){
		with(obj_toolPane) {
			alarm[3] = 30;	
		}
	}
	
	with(obj_panelPane){
		alarm[5] = 60;
	}
	obj_control.moveCounter = 0
	
	// Set word's to their tokens as default for stackShow
	if(!obj_control.wordTranscriptView) {
		//obj_control.stackShowSwitchedWordView = true;
		obj_control.wordTranscriptView = !obj_control.wordTranscriptView;

		for (var i = 0; i < ds_grid_height(obj_control.dynamicWordGrid); i++) {
			var currentWordTranscript = ds_grid_get(obj_control.wordGrid, obj_control.wordGrid_colWordTranscript, i);
			var currentWordToken = ds_grid_get(obj_control.wordGrid, obj_control.wordGrid_colWordToken, i);
			var currentReplaceWord = ds_grid_get(obj_control.dynamicWordGrid, obj_control.dynamicWordGrid_colReplaceWord, i);
	
			if (string_length(currentReplaceWord) > 0) {
				ds_grid_set(obj_control.dynamicWordGrid, obj_control.dynamicWordGrid_colDisplayString, i, currentReplaceWord);
			}
			else {
				if (obj_control.wordTranscriptView) {
					ds_grid_set(obj_control.dynamicWordGrid, obj_control.dynamicWordGrid_colDisplayString, i, currentWordToken);
				}
				else {
					ds_grid_set(obj_control.dynamicWordGrid, obj_control.dynamicWordGrid_colDisplayString, i, currentWordTranscript);
				}
			}
		}
	}
	if(obj_toolPane.tracksOnlyStackShow) {
		if (obj_control.shape == obj_control.shapeBlock) {
			obj_control.stackShowSwitchedTextShape = true;
			obj_control.shape = obj_control.shapeText;	
		}

		if (!instance_exists(obj_dialogueBox)) {
			instance_create_layer(x, y, "InstancesDialogue", obj_dialogueBox);
		}
		
		instance_create_layer(-500, -500, "Instances", obj_submitChain);
	
		obj_dialogueBox.elmoActive = true;
		if(string(global.userName) != "gold") {
			obj_panelPane.showNav = false;
			obj_toolPane.showTool = false;
		}
	}
	else if(global.rezzles) {
		instance_create_layer(-500, -500, "Instances", obj_submitChain);
	}
	
	
}
