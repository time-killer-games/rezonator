function scr_toolsOptions(argument0) {
	//toolsOptions
	var optionSelected = argument0;

	switch (optionSelected)
	{
		case "Search":
			scr_destroyAllDropDownsOtherThanSelf();
			var dropDownOptionList = ds_list_create();
			ds_list_add(dropDownOptionList, "Keyword", "Clear");
						
			if (ds_list_size(dropDownOptionList) > 0) {
				/*var dropDownInst = instance_create_depth(obj_dropDown.x + obj_dropDown.windowWidth , obj_dropDown.y , -999, obj_dropDown);
				dropDownInst.optionList = dropDownOptionList;
				dropDownInst.optionListType = dropDownInst.optionListTypeSearch;
					
				obj_control.ableToCreateDropDown = false;
				obj_control.alarm[0] = 2;*/
				scr_createDropDown(obj_dropDown.x + obj_dropDown.windowWidth, obj_dropDown.y, dropDownOptionList, obj_control.optionListTypeSearch);
			}
			break;
		case "Rez":
			with (obj_panelPane) {
				if (currentFunction == functionChainList) {
					functionChainList_currentTab = functionChainList_tabRezBrush;
				}
			}
			with (obj_toolPane) {
				currentMode = modeRez;
				if(obj_control.searchGridActive) {
					obj_toolPane.setModeSearch = obj_toolPane.modeRez;
				}
				else {
					obj_toolPane.setModeMain = obj_toolPane.modeRez;
				}
			}
			with (obj_dropDown) {
				instance_destroy();
			}
			break;
		case "Track":
			with (obj_panelPane) {
				if (currentFunction == functionChainList) {
					functionChainList_currentTab = functionChainList_tabTrackBrush;
				}
			}
			with (obj_toolPane) {
				currentMode = modeTrack;
				if(obj_control.searchGridActive) {
					obj_toolPane.setModeSearch = obj_toolPane.modeTrack;
				}
				else {
					obj_toolPane.setModeMain = obj_toolPane.modeTrack;
				}
			}
			with (obj_dropDown) {
				instance_destroy();
			}
			break;
		case "Stack":
			scr_destroyAllDropDownsOtherThanSelf();
			var dropDownOptionList = ds_list_create();
			ds_list_add(dropDownOptionList, "Stack tab", "StackShow", "Stacker");
						
			if (ds_list_size(dropDownOptionList) > 0) {
				/*var dropDownInst = instance_create_depth(obj_dropDown.x + obj_dropDown.windowWidth , obj_dropDown.y + (obj_dropDown.optionSpacing * 3), -999, obj_dropDown);
				dropDownInst.optionList = dropDownOptionList;
				dropDownInst.optionListType = dropDownInst.optionListTypeStack;
					
				obj_control.ableToCreateDropDown = false;
				obj_control.alarm[0] = 2;*/
				scr_createDropDown(obj_dropDown.x + obj_dropDown.windowWidth, obj_dropDown.y + (obj_dropDown.optionSpacing * 3), dropDownOptionList, obj_control.optionListTypeStack);
			}
			break;
			
		case "Play and Learn":
			scr_destroyAllDropDownsOtherThanSelf();
			var dropDownOptionList = ds_list_create();
			ds_list_add(dropDownOptionList, "Where's Elmo");
						
			if (ds_list_size(dropDownOptionList) > 0) {
				/*var dropDownInst = instance_create_depth(obj_dropDown.x + obj_dropDown.windowWidth , obj_dropDown.y + (obj_dropDown.optionSpacing * 4), -999, obj_dropDown);
				dropDownInst.optionList = dropDownOptionList;
				dropDownInst.optionListType = dropDownInst.optionListTypePlayAndLearn;
					
				obj_control.ableToCreateDropDown = false;
				obj_control.alarm[0] = 2;*/
				scr_createDropDown(obj_dropDown.x + obj_dropDown.windowWidth, obj_dropDown.y + (obj_dropDown.optionSpacing * 4), dropDownOptionList, obj_control.optionListTypePlayAndLearn);
			}
		break;
		default:
			break;
	}


}
