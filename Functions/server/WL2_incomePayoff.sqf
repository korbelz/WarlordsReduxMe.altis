#include "..\warlords_constants.inc"

//create blue array and get number of items in array
//create OPFOR array and get number of item in array
//compares array numbers 
//create new array with only smaller array in it. 


while {TRUE} do {
	sleep WL_SECTOR_PAYOFF_PERIOD;
	{
		_side = _x;
		_income = _side call BIS_fnc_WL2_income;
		{
			[_x, _income] call BIS_fnc_WL2_fundsControl;
		} forEach (BIS_WL_allWarlords select {side group _x == _side});
	} forEach BIS_WL_competingSides;
};