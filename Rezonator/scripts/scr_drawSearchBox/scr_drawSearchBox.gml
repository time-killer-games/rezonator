/*
	scr_drawSearchBox();
	
	Last Updated: 2019-06-25
	
	Called from: obj_panelPane
	
	Purpose: draw custom search box for multiple options
	
	Mechanism: draws multiple rectangles and text to represent options to the user when they search,
	this includes booleans for a case sensitive search, transcript search, and a search within a chain
				
	Author: Brady Moore
*/
	var verticleBuffer = 125;
	var horizontalBuffer = 250;
	var searchBarXOffset = 235;
	var searchBarYOffset = 20;
	var buttonXOffset = 50;
	var buttonYOffset = 25;

if (obj_control.fPressed) {

	
	
	/*
	if( camera_get_view_height(view_camera[0]) <=1000){
		horizontalBuffer =225;
		verticleBuffer = 50;
	}
	*/
	draw_set_colour(global.colorThemeBG);
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 - horizontalBuffer, camera_get_view_height(view_camera[0])/2 - verticleBuffer, camera_get_view_width(view_camera[0]) /2 + horizontalBuffer, camera_get_view_height(view_camera[0])/2 + verticleBuffer, false);
	draw_set_colour(global.colorThemePaneBG);
	if (global.colorTheme ==0) {
	draw_set_colour(c_ltgray);
	}
	// draw background UI
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 - horizontalBuffer, camera_get_view_height(view_camera[0])/2 - verticleBuffer + 30, camera_get_view_width(view_camera[0]) /2 + horizontalBuffer, camera_get_view_height(view_camera[0])/2 + verticleBuffer, false);
	draw_set_colour(global.colorThemeBorders);
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 - horizontalBuffer, camera_get_view_height(view_camera[0])/2 - verticleBuffer + 30, camera_get_view_width(view_camera[0]) /2 + horizontalBuffer, camera_get_view_height(view_camera[0])/2 + verticleBuffer, true);
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 - horizontalBuffer, camera_get_view_height(view_camera[0])/2 - verticleBuffer, camera_get_view_width(view_camera[0]) /2 + horizontalBuffer, camera_get_view_height(view_camera[0])/2 + verticleBuffer, true);
	draw_set_colour(global.colorThemeText);
	
	draw_set_font(fnt_mainBold);
	draw_text(camera_get_view_width(view_camera[0])/2 - horizontalBuffer + 15, camera_get_view_height(view_camera[0])/2 - verticleBuffer + 15, "Rezonator 0.8.39");
	
	draw_set_font(fnt_mainLarge1);
	
	// draw background text
	draw_text(camera_get_view_width(view_camera[0])/2 - horizontalBuffer + 25, camera_get_view_height(view_camera[0])/2 - verticleBuffer + 75, "Input string to search for.");
	
	
	// draw search bar
	draw_set_colour(global.colorThemeBG);
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 - searchBarXOffset, camera_get_view_height(view_camera[0])/2 - searchBarYOffset, camera_get_view_width(view_camera[0]) /2 + searchBarXOffset, camera_get_view_height(view_camera[0])/2 + searchBarYOffset, false);
	draw_set_colour(global.colorThemeBorders);
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 - searchBarXOffset, camera_get_view_height(view_camera[0])/2 - searchBarYOffset, camera_get_view_width(view_camera[0]) /2 + searchBarXOffset, camera_get_view_height(view_camera[0])/2 + searchBarYOffset, true);

	// draw buttons for OK and Cancel
	draw_set_colour(global.colorThemeBG);
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 + 40 - buttonXOffset, camera_get_view_height(view_camera[0])/2 + 75 - buttonYOffset, camera_get_view_width(view_camera[0]) /2 + 50 + buttonXOffset,camera_get_view_height(view_camera[0])/2 + 75 + buttonYOffset, false);
	draw_set_colour(global.colorThemeBorders);
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 + 40 - buttonXOffset, camera_get_view_height(view_camera[0])/2 + 75 - buttonYOffset, camera_get_view_width(view_camera[0]) /2 + 50 + buttonXOffset,camera_get_view_height(view_camera[0])/2 + 75 + buttonYOffset, true);
	draw_set_colour(global.colorThemeBG);
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 + 180 - buttonXOffset, camera_get_view_height(view_camera[0])/2 + 75 - buttonYOffset, camera_get_view_width(view_camera[0]) /2 + 175 + buttonXOffset,camera_get_view_height(view_camera[0])/2 + 75 + buttonYOffset, false);
	draw_set_colour(global.colorThemeBorders);
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 + 180 - buttonXOffset, camera_get_view_height(view_camera[0])/2 + 75 - buttonYOffset, camera_get_view_width(view_camera[0]) /2 + 175 + buttonXOffset,camera_get_view_height(view_camera[0])/2 + 75 + buttonYOffset, true);
	draw_set_colour(global.colorThemeText);
	draw_set_font(fnt_mainLarge1);
	
	// draw button text
	draw_text(camera_get_view_width(view_camera[0]) /2 + 30, camera_get_view_height(view_camera[0])/2 + 75, "OK");
	draw_text(camera_get_view_width(view_camera[0]) /2 + 150, camera_get_view_height(view_camera[0])/2 + 75, "Cancel");
	
	// draw boolean option check boxes
	draw_set_colour(global.colorThemeText);
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 - 230, camera_get_view_height(view_camera[0])/2 + 95, camera_get_view_width(view_camera[0]) /2 - 220, camera_get_view_height(view_camera[0])/2 + 105, true);
	if (obj_control.inChainBool) {
		draw_rectangle(camera_get_view_width(view_camera[0]) /2 - 230, camera_get_view_height(view_camera[0])/2 + 95, camera_get_view_width(view_camera[0]) /2 - 220, camera_get_view_height(view_camera[0])/2 + 105, false);	
	}
	
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 - 230, camera_get_view_height(view_camera[0])/2 + 65, camera_get_view_width(view_camera[0]) /2 - 220, camera_get_view_height(view_camera[0])/2 + 75, true);
	if (obj_control.caseSensitive) {
		draw_rectangle(camera_get_view_width(view_camera[0]) /2 - 230, camera_get_view_height(view_camera[0])/2 + 65, camera_get_view_width(view_camera[0]) /2 - 220, camera_get_view_height(view_camera[0])/2 + 75, false);	
	}
	
	draw_rectangle(camera_get_view_width(view_camera[0]) /2 - 230, camera_get_view_height(view_camera[0])/2 + 35, camera_get_view_width(view_camera[0]) /2 - 220, camera_get_view_height(view_camera[0])/2 + 45, true);
	if (obj_control.transcriptSearch) {
		draw_rectangle(camera_get_view_width(view_camera[0]) /2 - 230, camera_get_view_height(view_camera[0])/2 + 35, camera_get_view_width(view_camera[0]) /2 - 220, camera_get_view_height(view_camera[0])/2 + 45, false);	
	}

	//darw boolean options text
	draw_set_font(fnt_main);
	draw_text(camera_get_view_width(view_camera[0]) /2 - 210, camera_get_view_height(view_camera[0])/2 + 40,"Transcript Search");
	draw_text(camera_get_view_width(view_camera[0]) /2 - 210, camera_get_view_height(view_camera[0])/2 + 70,"Case Sensistive");
	draw_text(camera_get_view_width(view_camera[0]) /2 - 210, camera_get_view_height(view_camera[0])/2 + 100,"In Current Chain");
	
	
}




// ok button check
if (point_in_rectangle(mouse_x, mouse_y, camera_get_view_width(view_camera[0]) /2 + 50 - buttonXOffset, camera_get_view_height(view_camera[0])/2 + 75 - buttonYOffset, camera_get_view_width(view_camera[0]) /2 + 50 + buttonXOffset, camera_get_view_height(view_camera[0])/2 + 75 + buttonYOffset)){
		if (mouse_check_button_pressed(mb_left)) {
			obj_control.fPressed = false;

		}
		
}

//cancel button check
if (point_in_rectangle(mouse_x, mouse_y, camera_get_view_width(view_camera[0]) /2 + 175 - buttonXOffset, camera_get_view_height(view_camera[0])/2 + 75 - buttonYOffset, camera_get_view_width(view_camera[0]) /2 + 175 + buttonXOffset, camera_get_view_height(view_camera[0])/2 + 75 + buttonYOffset)){
		if (mouse_check_button_pressed(mb_left)) {
			obj_control.fPressed = false;
		}
		
}

// current chain boolean switch
if (point_in_rectangle(mouse_x, mouse_y, camera_get_view_width(view_camera[0]) /2 - 230, camera_get_view_height(view_camera[0])/2 + 95, camera_get_view_width(view_camera[0]) /2 - 220, camera_get_view_height(view_camera[0])/2 + 105)){
		if (mouse_check_button_pressed(mb_left)) {
			obj_control.inChainBool = !obj_control.inChainBool;		
		}
}

// case sensitive boolean switch
if (point_in_rectangle(mouse_x, mouse_y, camera_get_view_width(view_camera[0]) /2 - 230, camera_get_view_height(view_camera[0])/2 + 65, camera_get_view_width(view_camera[0]) /2 - 220, camera_get_view_height(view_camera[0])/2 + 75)){
		if (mouse_check_button_pressed(mb_left)) {
			obj_control.caseSensitive = !obj_control.caseSensitive;			
		}
}

// transcript search boolean switch
if (point_in_rectangle(mouse_x, mouse_y, camera_get_view_width(view_camera[0]) /2 - 230, camera_get_view_height(view_camera[0])/2 + 35, camera_get_view_width(view_camera[0]) /2 - 220, camera_get_view_height(view_camera[0])/2 + 45)){
		if (mouse_check_button_pressed(mb_left)) {
			obj_control.transcriptSearch = !obj_control.transcriptSearch;
		}
}

//keyboard inputs
if (!obj_control.fPressed) {
	inputText = "";
	cursorPos = 1;
	keyboard_string = "";
	obj_control.transcriptSearch = false;
	obj_control.inChainBool = false;
	obj_control.caseSensitive = false;
}

if (obj_control.fPressed) {
// Variables
var ctext = "";
// Clipboard
if(keyboard_check(vk_control) && keyboard_check(ord("V")) && clipboard_has_text()) {
	ctext = clipboard_get_text();
}
if(ctext!="" && (keyboard_check_pressed(ord("V")) || keyboard_check_pressed(vk_control))) { 
	inputText = string_insert(ctext, inputText, cursorPos);
}

// Backspace
if (keyboard_check_pressed(vk_backspace)) {
      inputText = string_delete(inputText, cursorPos-1, 1);
      cursorPos-=1;
}
if (keyboard_string != "") {
      var t = keyboard_string;
      inputText = string_insert(t, inputText, cursorPos);
      cursorPos += string_length(t);
      keyboard_string = "";
}

// Cursor
if(keyboard_check_pressed(vk_left)) {
	cursorPos-=1;
}
if(keyboard_check_pressed(vk_right)) {
	cursorPos+=1;
}


var displayText = string_insert("|", inputText, cursorPos);

draw_text(camera_get_view_width(view_camera[0]) /2 - searchBarXOffset + 5, camera_get_view_height(view_camera[0])/2 , displayText);

}


if keyboard_check_pressed(vk_enter)
   {
   obj_control.fPressed = false;
   }

