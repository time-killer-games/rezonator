/*
	scr_renderFilter();
	
	Last Updated: 2018-09-11
	
	Called from: obj_control
	
	Purpose: clear and then populate filterGrid with necessary units
	
	Mechanism: check all chains to see if they are flagged with the filter option, and if they are
				then add a row to the filterGrid
	
	Author: Terry DuBois
*/

ds_grid_destroy(filterGrid);
filterGrid = ds_grid_create(lineGridWidth, 0);

var grid;

for (var i = 0; i < 3; i++)
{
	switch (i)
	{
		case 0:
			grid = obj_chain.rezChainGrid;
			break;
		case 1:
			grid = obj_chain.trackChainGrid;
			break;
		case 2:
			grid = obj_chain.stackChainGrid;
			break;
		default:
			break;
	}
	
	for (var j = 0; j < ds_grid_height(grid); j++)
	{
		if (not ds_grid_get(grid, obj_chain.chainGrid_colInFilter, j))
		{
			continue;
		}
		
		var currentIDList = ds_grid_get(grid, obj_chain.chainGrid_colWordIDList, j);
		
		ds_list_sort(currentIDList, true);
		
		for (var k = 0; k < ds_list_size(currentIDList); k++)
		{
			if (i == 2)
			{
				var currentUnitID = ds_list_find_value(currentIDList, k);
			}
			else
			{
				var currentWordID = ds_list_find_value(currentIDList, k);
				var currentUnitID = ds_grid_get(wordGrid, wordGrid_colUnitID, currentWordID - 1);
			}
			
			if (ds_grid_value_exists(filterGrid, lineGrid_colUnitID, 0, lineGrid_colUnitID, ds_grid_height(filterGrid), currentUnitID))
			{
				continue;
			}
			
			
			var currentWordIDListUnitGrid = ds_grid_get(unitGrid, unitGrid_colWordIDList, currentUnitID - 1);
			var currentDiscoID = ds_grid_get(unitGrid, unitGrid_colDiscoID, currentUnitID - 1);
			var currentUtteranceID = ds_grid_get(unitGrid, unitGrid_colUtteranceID, currentUnitID - 1);
			
			ds_grid_resize(filterGrid, lineGridWidth, ds_grid_height(filterGrid) + 1);
			var currentRowFilterGrid = ds_grid_height(filterGrid) - 1;
			
			ds_grid_set(filterGrid, lineGrid_colDisplayRow, currentRowFilterGrid, currentRowFilterGrid);
			ds_grid_set(filterGrid, lineGrid_colLineState, currentRowFilterGrid, 0);
			ds_grid_set(filterGrid, lineGrid_colUnitID, currentRowFilterGrid, currentUnitID);
			ds_grid_set(filterGrid, lineGrid_colPixelY, currentRowFilterGrid, room_height + gridSpaceVertical);
			ds_grid_set(filterGrid, lineGrid_colDiscoID, currentRowFilterGrid, currentDiscoID);
			ds_grid_set(filterGrid, lineGrid_colLineNumberLabel, currentRowFilterGrid, currentUtteranceID);
			ds_grid_set(filterGrid, lineGrid_colWordIDList, currentRowFilterGrid, currentWordIDListUnitGrid);
		}
	}
}

ds_grid_sort(filterGrid, lineGrid_colUnitID, true);
for (var i = 0; i < ds_grid_height(filterGrid); i++)
{
	ds_grid_set(filterGrid, lineGrid_colDisplayRow, i, i);
}

var firstUnit = ds_grid_get(filterGrid, lineGrid_colUnitID, 0);
var lastUnit = ds_grid_get(filterGrid, lineGrid_colUnitID, ds_grid_height(filterGrid) - 1);

if (firstUnit == undefined or lastUnit == undefined)
{
	exit;
}

if (obj_panelPane.functionFilter_peek[0] == 1)
{
	
	for (var i = 0; i < firstUnit - 1; i++)
	{
		if (i < 0 or i > ds_grid_height(unitGrid))
		{
			continue;
		}
		
		var currentUnitID = ds_grid_get(unitGrid, unitGrid_colUnitID, i);
		
		if (ds_grid_value_exists(filterGrid, lineGrid_colUnitID, 0, lineGrid_colUnitID, ds_grid_height(filterGrid), currentUnitID))
		{
			continue;
		}
		
		var currentDiscoID = ds_grid_get(unitGrid, unitGrid_colDiscoID, currentUnitID - 1);
		var currentUtteranceID = ds_grid_get(unitGrid, unitGrid_colUtteranceID, currentUnitID - 1);
		var currentWordIDList = ds_grid_get(unitGrid, unitGrid_colWordIDList, currentUnitID - 1);
		
		ds_grid_resize(filterGrid, lineGridWidth, ds_grid_height(filterGrid) + 1); 
		var currentRowFilterGrid = ds_grid_height(filterGrid) - 1;
		
		ds_grid_set(filterGrid, lineGrid_colDisplayRow, currentRowFilterGrid, currentRowFilterGrid);
		ds_grid_set(filterGrid, lineGrid_colLineState, currentRowFilterGrid, 0);
		ds_grid_set(filterGrid, lineGrid_colUnitID, currentRowFilterGrid, currentUnitID);
		ds_grid_set(filterGrid, lineGrid_colPixelY, currentRowFilterGrid, room_height + gridSpaceVertical);
		ds_grid_set(filterGrid, lineGrid_colDiscoID, currentRowFilterGrid, currentDiscoID);
		ds_grid_set(filterGrid, lineGrid_colLineNumberLabel, currentRowFilterGrid, currentUtteranceID);
		ds_grid_set(filterGrid, lineGrid_colWordIDList, currentRowFilterGrid, currentWordIDList);
	}
	
}

if (obj_panelPane.functionFilter_peek[1] == 1)
{	
	for (var i = firstUnit; i < lastUnit; i++)
	{
		var currentUnitID = ds_grid_get(unitGrid, unitGrid_colUnitID, i);
		
		if (ds_grid_value_exists(filterGrid, lineGrid_colUnitID, 0, lineGrid_colUnitID, ds_grid_height(filterGrid), currentUnitID))
		{
			continue;
		}
		
		var currentDiscoID = ds_grid_get(unitGrid, unitGrid_colDiscoID, currentUnitID - 1);
		var currentUtteranceID = ds_grid_get(unitGrid, unitGrid_colUtteranceID, currentUnitID - 1);
		var currentWordIDList = ds_grid_get(unitGrid, unitGrid_colWordIDList, currentUnitID - 1);
		
		ds_grid_resize(filterGrid, lineGridWidth, ds_grid_height(filterGrid) + 1);
		var currentRowFilterGrid = ds_grid_height(filterGrid) - 1;
		
		ds_grid_set(filterGrid, lineGrid_colDisplayRow, currentRowFilterGrid, currentRowFilterGrid);
		ds_grid_set(filterGrid, lineGrid_colLineState, currentRowFilterGrid, 0);
		ds_grid_set(filterGrid, lineGrid_colUnitID, currentRowFilterGrid, currentUnitID);
		ds_grid_set(filterGrid, lineGrid_colPixelY, currentRowFilterGrid, room_height + gridSpaceVertical);
		ds_grid_set(filterGrid, lineGrid_colDiscoID, currentRowFilterGrid, currentDiscoID);
		ds_grid_set(filterGrid, lineGrid_colLineNumberLabel, currentRowFilterGrid, currentUtteranceID);
		ds_grid_set(filterGrid, lineGrid_colWordIDList, currentRowFilterGrid, currentWordIDList);
	}
	//currentCenterDisplayRow = floor((ds_grid_get(filterGrid, lineGrid_colUnitID, firstUnit) + ds_grid_get(filterGrid, lineGrid_colUnitID, lastUnit)) / 2);
	//absolutely does not work, something about an unloaded object, check error message
}

if (obj_panelPane.functionFilter_peek[2] == 1)
{	
	for (var i = lastUnit; i < ds_grid_height(unitGrid); i++)
	{
		var currentUnitID = ds_grid_get(unitGrid, unitGrid_colUnitID, i);
		
		if (ds_grid_value_exists(filterGrid, lineGrid_colUnitID, 0, lineGrid_colUnitID, ds_grid_height(filterGrid), currentUnitID))
		{
			continue;
		}
		
		var currentDiscoID = ds_grid_get(unitGrid, unitGrid_colDiscoID, currentUnitID - 1);
		var currentUtteranceID = ds_grid_get(unitGrid, unitGrid_colUtteranceID, currentUnitID - 1);
		var currentWordIDList = ds_grid_get(unitGrid, unitGrid_colWordIDList, currentUnitID - 1);
		
		ds_grid_resize(filterGrid, lineGridWidth, ds_grid_height(filterGrid) + 1);
		var currentRowFilterGrid = ds_grid_height(filterGrid) - 1;
		
		ds_grid_set(filterGrid, lineGrid_colDisplayRow, currentRowFilterGrid, currentRowFilterGrid);
		ds_grid_set(filterGrid, lineGrid_colLineState, currentRowFilterGrid, 0);
		ds_grid_set(filterGrid, lineGrid_colUnitID, currentRowFilterGrid, currentUnitID);
		ds_grid_set(filterGrid, lineGrid_colPixelY, currentRowFilterGrid, room_height + gridSpaceVertical);
		ds_grid_set(filterGrid, lineGrid_colDiscoID, currentRowFilterGrid, currentDiscoID);
		ds_grid_set(filterGrid, lineGrid_colLineNumberLabel, currentRowFilterGrid, currentUtteranceID);
		ds_grid_set(filterGrid, lineGrid_colWordIDList, currentRowFilterGrid, currentWordIDList);
	}
}


/*if (obj_panelPane.functionFilter_peek[0] == 1 and obj_panelPane.functionFilter_peek[2] != 1)
{//this one works for some reason
	currentCenterDisplayRow = ds_grid_get(filterGrid, lineGrid_colUnitID, firstUnit);
}
if (obj_panelPane.functionFilter_peek[2] == 1 and obj_panelPane.functionFilter_peek[0] != 1)
{//yet this one does not, wild
	currentCenterDisplayRow = ds_grid_get(filterGrid, lineGrid_colUnitID, lastUnit);
}*/


ds_grid_sort(filterGrid, lineGrid_colUnitID, true);
for (var i = 0; i < ds_grid_height(filterGrid); i++)
{
	ds_grid_set(filterGrid, lineGrid_colDisplayRow, i, i);
}

searchGridActive = false;
filterGridActive = true;
currentActiveLineGrid = filterGrid;