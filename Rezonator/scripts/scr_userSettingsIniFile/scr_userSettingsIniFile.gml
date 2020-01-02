// Create and write to a file containing user settings, attached to the username

if (directory_exists(global.rezonatorDirString)) {
	var filename = global.rezonatorDirString + "\\~usersettings.ini";
	userSettingsIniFile = file_text_open_write(filename);
	
	var fileStr = "";
	
	fileStr += "rememberMe:" + string(global.rememberMe) + "#";
	fileStr += "userName:" + string(global.userName) + "#";
	fileStr += "lineHeight:" + string(obj_control.gridSpaceVertical) + "#";
	fileStr += "fontSize:" + string(global.fontSize) + "#";
	fileStr += "columnWidth:" + string(obj_control.gridSpaceHorizontal) + "#";
	fileStr += "SpeakerLabelX3:" + string(ds_list_find_value(obj_control.speakerLabelColXList,2)) + "#";
	fileStr += "SpeakerLabelX4:" + string(ds_list_find_value(obj_control.speakerLabelColXList,3)) + "#";
	
	fileStr += "end" + "#";
	
	file_text_write_string(userSettingsIniFile, string_hash_to_newline(fileStr));
	file_text_close(userSettingsIniFile);
}
