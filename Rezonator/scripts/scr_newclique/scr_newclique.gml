function scr_newClique(chainID, unitID){

	// create clique and its submap
	var newCliqueID = scr_generateRandomHex();
	var newCliqueSubMap = ds_map_create();
	ds_map_add_map(global.cliqueMap, newCliqueID, newCliqueSubMap);
	ds_list_add(obj_chain.cliqueList, newCliqueID);
	
	// create chain list, add new chain to it
	var newCliqueChainList = ds_list_create();
	ds_list_add(newCliqueChainList, chainID);
	ds_map_add_list(newCliqueSubMap, "chainList", newCliqueChainList);
	
	// create unit list, add new unit to it
	var newCliqueUnitList = ds_list_create();
	if (is_string(unitID)) ds_list_add(newCliqueUnitList, unitID);
	ds_map_add_list(newCliqueSubMap, "unitList", newCliqueUnitList);
	
	return newCliqueID;

}