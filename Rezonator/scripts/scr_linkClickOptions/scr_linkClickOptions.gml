// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_linkClickOptions(optionSelected){
	
	show_debug_message("scr_linkClickOptions, optionSelected: " + string(optionSelected));
	
	if (optionSelected == "Create new field") {
		instance_destroy();
	}
	else {
		scr_destroyAllDropDownsOtherThanSelf();
		
		var indexOfList = ds_list_find_index(global.linkFieldList, optionSelected);
		var linkFieldSubMap = global.linkFieldMap[? optionSelected];
		if (scr_isNumericAndExists(linkFieldSubMap, ds_type_map)) {
			obj_control.linkFieldSelected = optionSelected;
			
			var linkTagSet = linkFieldSubMap[? "tagSet"];
			if (scr_isNumericAndExists(linkTagSet, ds_type_list)) {
		
				var dropDownOptionList = ds_list_create();
				ds_list_copy(dropDownOptionList, linkTagSet);
				//ds_list_insert(dropDownOptionList, 0, "Add new tag");  will add this back in soon
				
				scr_createDropDown(obj_dropDown.x + obj_dropDown.windowWidth, obj_dropDown.y + (obj_dropDown.optionSpacing * (indexOfList + 1)), dropDownOptionList, global.optionListTypeLinkTag);
			}
		}
	}
	
	
	
}