/// @description Insert description here
// You can write your code in this editor
if (mouseoverNeutralSpace and not mouseoverHelpPane and speakerLabelColXHolding == -1) {
	drag_offsetY = scrollPlusYDest - event_data[?"posY"];
	inDrag = true;
}