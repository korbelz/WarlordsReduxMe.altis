#include "..\warlords_constants.inc"

private _bluenum = (playersNumber west + 1);
private _rednum = (playersNumber east + 1);


loopnum = ["once"];

while {TRUE} do {
sleep WL_SECTOR_PAYOFF_PERIOD;
	if (((_bluenum - _rednum) < KORB_TEAM_BALANCE_SPLIT) and ((_rednum - _bluenum) < KORB_TEAM_BALANCE_SPLIT) ) then {
		
		{
			_side = _x;
			_income = _side call BIS_fnc_WL2_income;
			{
				[_x, _income] call BIS_fnc_WL2_fundsControl;
			} forEach (BIS_WL_allWarlords select {side group _x == _side});
		}forEach BIS_WL_competingSides;
		
	};
	if ((_bluenum < _rednum) and ((_rednum - _bluenum) > KORB_TEAM_BALANCE_SPLIT)) then {
		
		{
			_side = WEST;
			_income = _side call BIS_fnc_WL2_income;
			private _balance_ratio = (_rednum / _bluenum);
			{
				[_x, (_income * _balance_ratio)] call BIS_fnc_WL2_fundsControl;
			} forEach (BIS_WL_allWarlords select {side group _x == _side});
		}forEach loopnum;

		{
			_side = EAST;
			_income = _side call BIS_fnc_WL2_income;
			{
				[_x, _income] call BIS_fnc_WL2_fundsControl;
			} forEach (BIS_WL_allWarlords select {side group _x == _side});
		}forEach loopnum;
		
	};	
	if ((_rednum < _bluenum) and ((_bluenum - _rednum) > KORB_TEAM_BALANCE_SPLIT)) then {
			
			{
				_side = EAST;
				_income = _side call BIS_fnc_WL2_income;
				private _balance_ratio = (_bluenum / _rednum);
				{
					[_x, (_income * _balance_ratio)] call BIS_fnc_WL2_fundsControl;
				} forEach (BIS_WL_allWarlords select {side group _x == _side});
			}forEach loopnum;

			{
				_side = WEST;
				_income = _side call BIS_fnc_WL2_income;
				{
					[_x, _income] call BIS_fnc_WL2_fundsControl;
				} forEach (BIS_WL_allWarlords select {side group _x == _side});
			}forEach loopnum;
				
	};
};		 

 