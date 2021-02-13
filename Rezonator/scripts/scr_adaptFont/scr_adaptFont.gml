// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_adaptFont(inputString, size){
	
	// make sure we're dealing with a string
	if (!is_string(inputString)) inputString = string(inputString);

	// get rid of any newlines in this string
	inputString = string_replace_all(inputString, "\n", "");
	inputString = string_replace_all(inputString, "\r", "");
	
	// determine if this string is latin, CJK, or hebrew
	var isCJK = false;
	var isHE = false;
	if (ds_map_exists(global.strToLangMap, inputString)) {
		var langCode = ds_map_find_value(global.strToLangMap, inputString);
		if (langCode == "CJK") isCJK = true;
		else if (langCode == "HE") isHE = true;
	}
	else {
		var letterCount = string_length(inputString);
		for (var i = 0;i <= letterCount; i++) {
			var unicodeValue = ord(string_char_at(inputString,i));
			// check if char is in CJK unicode range
			if ( (12288 <= unicodeValue and unicodeValue <= 65535) or
			(131072 <= unicodeValue  and unicodeValue <= 183983) or
			(194560 <= unicodeValue  and unicodeValue <= 195103) ){

				isCJK = true;
				break;
			
			}
			// check if char is in Hebrew unicode range
			if ( 1424 <= unicodeValue  and unicodeValue <= 1535 ){
				isHE = true;
			}
		}
		
		// attach a language code to the string and put it in strToLang map
		var langCode = "";
		if (isCJK) langCode = "CJK";
		else if (isHE) langCode = "HE";
		else langCode = "LATIN";
		ds_map_add(global.strToLangMap, inputString, langCode);
	}
		
		
	// determine the font to set
	if ( isCJK ){
		if(size == "S"){
			var fontScaledName = global.localeCJK_S_0;
			if( global.fontSize == 0 ){
				fontScaledName = global.localeCJK_S_0;
			}
			else if( global.fontSize == 1 ){
				fontScaledName = global.localeCJK_S_1;
			} 
			else if( global.fontSize == 2 ){
				fontScaledName = global.localeCJK_S_2;
			}
			else if( global.fontSize == 3 ){
				fontScaledName = global.localeCJK_S_3;
			}
			else if( global.fontSize == 4 ){
				fontScaledName = global.localeCJK_S_4;
			}
			else if( global.fontSize == 5 ){
				fontScaledName = global.localeCJK_S_5;
			} 
		}
		if(size == "M"){
			var fontScaledName = global.localeCJK_M_0;
			if( global.fontSize == 0 ){
				fontScaledName = global.localeCJK_M_0;
			}
			else if( global.fontSize == 1 ){
				fontScaledName = global.localeCJK_M_1;
			} 
			else if( global.fontSize == 2 ){
				fontScaledName = global.localeCJK_M_2;
			}
			else if( global.fontSize == 3 ){
				fontScaledName = global.localeCJK_M_3;
			}
			else if( global.fontSize == 4 ){
				fontScaledName = global.localeCJK_M_4;
			}
			else if( global.fontSize == 5 ){
				fontScaledName = global.localeCJK_M_5;
			} 
		}
		if(size == "L"){
			var fontScaledName = global.localeCJK_L_0;
			if( global.fontSize == 0 ){
				fontScaledName = global.localeCJK_L_0;
			}
			else if( global.fontSize == 1 ){
				fontScaledName = global.localeCJK_L_1;
			} 
			else if( global.fontSize == 2 ){
				fontScaledName = global.localeCJK_L_2;
			}
			else if( global.fontSize == 3 ){
				fontScaledName = global.localeCJK_L_3;
			}
			else if( global.fontSize == 4 ){
				fontScaledName = global.localeCJK_L_4;
			}
			else if( global.fontSize == 5 ){
				fontScaledName = global.localeCJK_L_5;
			} 
		}

	}
		
	else {
		if(size == "S"){
			var fontScaledName = global.localeEN_S_0;
			if( global.fontSize == 0 ){
				fontScaledName = global.localeEN_S_0;
			}
			else if( global.fontSize == 1 ){
				fontScaledName = global.localeEN_S_1;
			} 
			else if( global.fontSize == 2 ){
				fontScaledName = global.localeEN_S_2;
			}
			else if( global.fontSize == 3 ){
				fontScaledName = global.localeEN_S_3;
			}
			else if( global.fontSize == 4 ){
				fontScaledName = global.localeEN_S_4;
			}
			else if( global.fontSize == 5 ){
				fontScaledName = global.localeEN_S_5;
			} 
		}
		if(size == "M"){
			var fontScaledName = global.localeEN_M_0;
			if( global.fontSize == 0 ){
				fontScaledName = global.localeEN_M_0;
			}
			else if( global.fontSize == 1 ){
				fontScaledName = global.localeEN_M_1;
			} 
			else if( global.fontSize == 2 ){
				fontScaledName = global.localeEN_M_2;
			}
			else if( global.fontSize == 3 ){
				fontScaledName = global.localeEN_M_3;
			}
			else if( global.fontSize == 4 ){
				fontScaledName = global.localeEN_M_4;
			}
			else if( global.fontSize == 5 ){
				fontScaledName = global.localeEN_M_5;
			} 
		}
		if(size == "L"){
			var fontScaledName = global.localeEN_L_0;
			if( global.fontSize == 0 ){
				fontScaledName = global.localeEN_L_0;
			}
			else if( global.fontSize == 1 ){
				fontScaledName = global.localeEN_L_1;
			} 
			else if( global.fontSize == 2 ){
				fontScaledName = global.localeEN_L_2;
			}
			else if( global.fontSize == 3 ){
				fontScaledName = global.localeEN_L_3;
			}
			else if( global.fontSize == 4 ){
				fontScaledName = global.localeEN_L_4;
			}
			else if( global.fontSize == 5 ){
				fontScaledName = global.localeEN_L_5;
			} 
		}
	}
		
	draw_set_font(fontScaledName);
	
	// flip the string if it's Hebrew!
	if (isHE) inputString = scr_stringReverse(inputString);
	
	return inputString;
}