scr_windowExit();


if (keyboard_check_released(vk_escape)) {
	show_debug_message("Going to openingScreen, obj_loadingControl step");
	room_goto(rm_openingScreen);
}


if (importGridRow >= ds_grid_height(global.importGrid) && !finished) {
	finished = true;
	show_debug_message("obj_loadingControl ... finished!" + scr_printTime());
	
	// copy unitList into displayUnitList
	ds_list_copy(displayUnitList, unitList);
	scr_addToListOnce(global.usedImports,global.importType);
	if (global.steamAPI) {
		var currentUsedImports = steam_get_stat_int("SA_imports");
		var usedImportSize = ds_list_size(global.usedImports);
		if (usedImportSize > currentUsedImports) {
			steam_set_stat_int("SA_imports",usedImportSize);
			if (steam_get_stat_int("SA_imports") >= 7 ) {
				if (!steam_get_achievement("SA_all-impots")) {
					steam_set_achievement("SA_all-impots");
				}
			}
		}
	}
	room_goto(rm_mainScreen);
}
else {
	var iterations = fps;
	if (global.importType == "import_type_song" || global.importType == "import_type_prose") {
		repeat(iterations) scr_importGridToNodeMap_plainText(importGridRow);
	}
	else if (global.importType == "import_type_interlinear" || global.importType == "import_type_transcription" || global.importType == "import_type_elan") {
		repeat(iterations) scr_importGridToNodeMap_fieldsRowUnit(importGridRow);
	}
	else if (global.importType == "import_type_conllu" || global.importType == "import_type_word") {
		repeat(iterations) scr_importGridToNodeMap_fieldsRowToken(importGridRow);
	}
}