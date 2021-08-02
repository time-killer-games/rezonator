/// @description initialize panel pane tab list
with (obj_control) {
	ds_list_add(panelPaneTabList, 
		obj_panelPane.functionChainList_tabLine,
		obj_panelPane.functionChainList_tabChunk,
		obj_panelPane.functionChainList_tabTree,
		obj_panelPane.functionChainList_tabTrackBrush,
		obj_panelPane.functionChainList_tabRezBrush,
		obj_panelPane.functionChainList_tabClique,
		obj_panelPane.functionChainList_tabStackBrush,
		obj_panelPane.functionChainList_tabShow,
		obj_panelPane.functionChainList_tabSearch,
		obj_panelPane.functionChainList_tabField
		);	
		
	var translationListSize = ds_list_size(global.translationList);
	var hasTranslation = (translationListSize > 0);
	if(hasTranslation){
		ds_list_insert(obj_control.panelPaneTabList, 8, obj_panelPane.functionChainList_tabTranslations);
	}
}