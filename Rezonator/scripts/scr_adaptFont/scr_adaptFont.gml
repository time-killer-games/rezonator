// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_adaptFont(inputString,size){
		if (!is_string(inputString)){
			exit;
		}
		var unicodeValue = ord(inputString);
		
		if ( (12288 <= unicodeValue  and unicodeValue <= 40959)  or
		(63744 <= unicodeValue  and unicodeValue <= 64255) or
		(131072 <= unicodeValue  and unicodeValue <= 183983) or
		(194560 <= unicodeValue  and unicodeValue <= 195103) ){
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
}