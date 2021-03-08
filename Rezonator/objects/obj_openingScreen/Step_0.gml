// CSV group import
if (keyboard_check(vk_shift) && keyboard_check(vk_control) && keyboard_check_released(ord("I"))) {
	
	global.importGroupOutputDir = get_string("Type in output directory for REZ files", "");
	show_message("Directory exists: " + string(directory_exists(global.importGroupOutputDir)));
	
	var filename = "";
	filename = get_open_filename("CSV file|*.csv", "");
	global.importGroupDir = filename_dir(filename);
	
	if (directory_exists(global.importGroupDir)) {
		var currentFile = file_find_first(global.importGroupDir + "\\*.csv", 0);
		while (currentFile != "") {
			var currentFilePath = global.importGroupDir + "\\" + currentFile;
			ds_list_add(global.importGroupFileList, currentFilePath);
			currentFile = file_find_next();
		}
		file_find_close();
		show_message("global.importGroupFileList: " + scr_getStringOfList(global.importGroupFileList));
	}
	
	global.importGroupSchemaFile = get_open_filename_ext("SCHEMA file|*.rzs", "", global.rezonatorSchemaDirString, "Open Schema");
	show_debug_message("global.importGroupSchemaFile: " + string(global.importGroupSchemaFile) + ", file exists: " + string(file_exists(global.importGroupSchemaFile)));
}

if (ds_list_size(global.importGroupFileList) > 0 && global.importGroupFileIndex >= 0 && global.importGroupFileIndex < ds_list_size(global.importGroupFileList)) {
	var importFileName = ds_list_find_value(global.importGroupFileList, global.importGroupFileIndex);
	show_debug_message("Going to import file: " + string(importFileName));
	show_debug_message(" ... file exists: " + string(file_exists(importFileName)));
	if (file_exists(importFileName)) {
		scr_importCSV(importFileName);
	}
}


// skipping to import screen by clicking "Import" in file menu
if (global.skipToImportScreen) {
	global.skipToImportScreen = false;
	
	global.newProject = true;
	global.openProject = false;
	global.currentDirString = global.previousImportDirectory;
}

// skipping to import screen by clicking "Import" in file menu
if (global.skipToPlayandLearn) {
	global.skipToPlayandLearn = false;
	
	global.newProject = false;
	global.openProject = true;
	global.games = true;
	global.wheresElmo =true;
	if(global.wheresElmo){

		global.currentDirString = global.rezonatorElmoDirString;


	}
	room_goto(rm_mainScreen);
}

if (keyboard_check(vk_control) && keyboard_check_pressed(ord("U"))) {
	global.importType = global.importType_IGT;
	show_debug_message("global.importType = global.importType_IGT");
}



window_set_caption(string(game_display_name) );
