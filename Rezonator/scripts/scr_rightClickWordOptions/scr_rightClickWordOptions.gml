function scr_rightClickWordOptions(optionSelected) {
	var optionIndex = ds_list_find_index(optionList, optionSelected);
	
	switch (optionSelected)
	{
		
		case "Replace Word":
		
			if (obj_control.rightClickID != "") {

					if (!obj_control.dialogueBoxActive) {
						keyboard_string = "";
						obj_control.replace = true;
					}

					obj_control.fromDropDown = true;
					obj_control.dialogueBoxActive = true;

					if (!instance_exists(obj_dialogueBox)) {
						instance_create_layer(x, y, "InstancesDialogue", obj_dialogueBox);
					}
					obj_dialogueBox.inputWindowActive = true;
		
			}
			
			instance_destroy();

			break;
			
		case "help_label_split-word":
			scr_destroyAllDropDownsOtherThanSelf();
			if (obj_control.rightClickID != "") {

					if (!obj_control.dialogueBoxActive) {
						keyboard_string = "";
						obj_control.replace = true;
					}

					obj_control.fromDropDown = true;
					obj_control.dialogueBoxActive = true;
					obj_control.splitWord = true;

					if (!instance_exists(obj_dialogueBox)) {
						instance_create_layer(x, y, "InstancesDialogue", obj_dialogueBox);
						
					}
					obj_dialogueBox.inputWindowActive = true;
		
			}
			instance_destroy();

			break;
			
		case "option_new-token":
		
			scr_destroyAllDropDownsOtherThanSelf();
			var dropDownOptionList = ds_list_create();
			ds_list_add(dropDownOptionList, "option_zero-0", "option_zero", "option_pronoun", "option_custom");
						

			if (ds_list_size(dropDownOptionList) > 0) {
				scr_createDropDown(obj_dropDown.x + obj_dropDown.windowWidth, obj_dropDown.y + (optionIndex * optionSpacing), dropDownOptionList, global.optionListTypeNewWord);
			}
	
			break;
			
		case "help_label_delete-link":
		
			scr_deleteFromChain(true);

			instance_destroy();
			break;
		case "option_set-chain-name":
		
			scr_setChainName();

			instance_destroy();
			break;
		case "Tag Chain":
			
			// set field/tags
			if (obj_control.rightClickID != "") {
				var tokenSubMap = global.nodeMap[? obj_control.rightClickID];
				if(scr_isNumericAndExists(tokenSubMap, ds_type_map)){
					
					var inChainsList = tokenSubMap[? "inChainsList"];
					var inChainsListSize = ds_list_size(inChainsList);
					
					
					for(var i = 0; i < inChainsListSize; i++){
						var currentChainID = inChainsList[| i];
						var chainSubMap = global.nodeMap[? currentChainID];						
						if(scr_isNumericAndExists(chainSubMap, ds_type_map)){
							var chainType = chainSubMap[? "type"];							
							if((chainType == "trail" && obj_toolPane.currentMode == obj_toolPane.modeTrack or obj_toolPane.currentMode == obj_toolPane.modeRead)
							or (chainType == "resonance" && obj_toolPane.currentMode == obj_toolPane.modeRez or obj_toolPane.currentMode == obj_toolPane.modeRead)){
								if (obj_panelPane.functionField_chainFieldSelected != "" && obj_panelPane.functionField_chainTagSelected != ""
								&& is_string(obj_panelPane.functionField_chainFieldSelected) && is_string(obj_panelPane.functionField_chainTagSelected)) {
									var chainTagMap = chainSubMap[? "tagMap"];
									if (scr_isNumericAndExists(chainTagMap, ds_type_map)) {
										chainTagMap[? obj_panelPane.functionField_chainFieldSelected] = obj_panelPane.functionField_chainTagSelected;
										show_debug_message("scr_tokenRightClicked ... setting ChainSubMap: " + string(currentChainID) + ", field:" + string(obj_panelPane.functionField_chainFieldSelected) + ", tag: " + string(obj_panelPane.functionField_chainTagSelected));
									}
								}			
							}
						}						
					}
				}
			}
			

			instance_destroy();
			break;
		case "Tag Entry":
			
			// set field/tags
			if (obj_control.rightClickID != "") {
				var tokenSubMap = global.nodeMap[? obj_control.rightClickID];
				if(scr_isNumericAndExists(tokenSubMap, ds_type_map)){
					var inChainsList = tokenSubMap[? "inChainsList"];
					var inChainsListSize = ds_list_size(inChainsList);
					
					for(var i = 0; i < inChainsListSize; i++){
						var currentChainID = inChainsList[| i];
						var chainSubMap = global.nodeMap[? currentChainID];	
						
						if(scr_isNumericAndExists(chainSubMap, ds_type_map)){
							var chainType = chainSubMap[? "type"];		
							
							if((chainType == "trail" && obj_toolPane.currentMode == obj_toolPane.modeTrack or obj_toolPane.currentMode == obj_toolPane.modeRead)
							or (chainType == "resonance" && obj_toolPane.currentMode == obj_toolPane.modeRez or obj_toolPane.currentMode == obj_toolPane.modeRead)){
								 var chainSetList = chainSubMap[? "setIDList"];
								 var sizeOfSetList = ds_list_size(chainSetList);
								 
								for(var j = 0 ; j < sizeOfSetList ; j ++){
									var currentEntry = chainSetList[|j];
									var currentEntrySubMap = global.nodeMap[?currentEntry];
									
									if(scr_isNumericAndExists(currentEntrySubMap , ds_type_map)){
										var currentTokenID = currentEntrySubMap[?"token"];
										
										if(currentTokenID == obj_control.rightClickID){
											if (obj_panelPane.functionField_entryFieldSelected != "" && obj_panelPane.functionField_entryTagSelected != ""
											&& is_string(obj_panelPane.functionField_entryFieldSelected) && is_string(obj_panelPane.functionField_entryTagSelected)) {
												var currentEntryTagMap = currentEntrySubMap[? "tagMap"];
												if (scr_isNumericAndExists(currentEntryTagMap, ds_type_map)) {
													currentEntryTagMap[? obj_panelPane.functionField_entryFieldSelected] = obj_panelPane.functionField_entryTagSelected;
													show_debug_message("scr_tokenRightClicked ... setting ChainSubMap: " + string(currentEntry) + ", field:" + string(obj_panelPane.functionField_entryFieldSelected) + ", tag: " + string(obj_panelPane.functionField_entryTagSelected));
												}
											}
										}
									}
								}									
							}
						}						
					}
				}
			}

			instance_destroy();
			break;
			
			case "Tag Token":
			
			// set field/tags
			if (obj_control.rightClickID != "") {
				var tokenSubMap = global.nodeMap[? obj_control.rightClickID];
				if(scr_isNumericAndExists(tokenSubMap, ds_type_map)){
					if (obj_panelPane.functionField_tokenFieldSelected != "" && obj_panelPane.functionField_tokenTagSelected != ""
					&& is_string(obj_panelPane.functionField_tokenFieldSelected) && is_string(obj_panelPane.functionField_tokenTagSelected)) {
						var tokenTagMap = tokenSubMap[? "tagMap"];
						if (scr_isNumericAndExists(tokenTagMap, ds_type_map)) {
							tokenTagMap[? obj_panelPane.functionField_tokenFieldSelected] = obj_panelPane.functionField_tokenTagSelected;
							show_debug_message("scr_tokenRightClicked ... setting tokenSubMap: " + string(obj_control.rightClickID) + ", field:" + string(obj_panelPane.functionField_tokenFieldSelected) + ", tag: " + string(obj_panelPane.functionField_tokenTagSelected));
						}
					}			
				}
			}
			

			instance_destroy(obj_dropDown);
			break;
			case "tab_name_tag":
			obj_control.tokenToChange =	obj_control.rightClickID;
			scr_destroyAllDropDownsOtherThanSelf();
			var dropDownOptionList = ds_list_create();
			if(obj_control.inChunk == true){
				ds_list_add(dropDownOptionList, "Tag Chunk");
			}
			else{
				ds_list_add(dropDownOptionList, "Tag Token");
			}
			if(obj_control.inChain == true){
				ds_list_add(dropDownOptionList, "Tag Chain", "Tag Entry");
			}
			if (ds_list_size(dropDownOptionList) > 0) {
				scr_createDropDown(obj_dropDown.x + obj_dropDown.windowWidth, obj_dropDown.y + (obj_dropDown.optionSpacing * optionIndex), dropDownOptionList, global.optionListTypeTag);
			}
			break;
			
		case "option_delete-chunk":

			
			obj_control.deleteChunkWord = true;
			var chunkSubMap = global.nodeMap[?obj_control.rightClickID];
			var inChainsList = chunkSubMap[?"inChainsList"];
			if(ds_list_size(inChainsList) > 0){
				scr_deleteFromChain(true);
			}
			scr_deleteChunk(obj_control.rightClickID);
			
			obj_control.deleteChunkWord = false;
			instance_destroy();
			break;
		case "option_delete-token":


			var tokenSubMap = global.nodeMap[?obj_control.rightClickID];
			scr_deleteToken(obj_control.rightClickID);
			
			instance_destroy();
			break;

			
			
		default:
			break;
	}

obj_control.rightClicked = false;
obj_control.inChain = false;
obj_control.inChunk = false;
}
