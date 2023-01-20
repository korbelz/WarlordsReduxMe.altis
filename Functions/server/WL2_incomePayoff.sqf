#include "..\warlords_constants.inc"

private _bluenum = (playersNumber west + 1);
private _rednum = (playersNumber east + 1);
/*
_bluecount =  format ["# OF blue balls on the server : %1 ", _bluenum];
	[_bluecount] remoteExec ["systemChat", 0];
_redcount =  format ["# OF red balls on the server : %1 ", _rednum];
	[_redcount] remoteExec ["systemChat", 0];
*/
//following varibles might be able to be used to sector sector control ratios and mod CP cap rewards based on that 
//count (BIS_WL_sectorsArray # 0) and count (BIS_WL_sectorsArrayEnemy # 0)

loopnum = ["once"];

while {TRUE} do {
sleep WL_SECTOR_PAYOFF_PERIOD;
	if (((_bluenum - _rednum) < KORB_TEAM_BALANCE_SPLIT) and ((_rednum - _bluenum) < KORB_TEAM_BALANCE_SPLIT) ) then {
		/*
		_bluecount =  format ["# OF blue balls on the server : %1 ", _bluenum];
			[_bluecount] remoteExec ["systemChat", 0];
		_redcount =  format ["# OF red balls on the server : %1 ", _rednum];
			[_redcount] remoteExec ["systemChat", 0];
		_bothpay =  format ["both got paid"];
			[_bothpay] remoteExec ["systemChat", 0];
		*/
		{
			_side = _x;
			_income = _side call BIS_fnc_WL2_income;
			{
				[_x, _income] call BIS_fnc_WL2_fundsControl;
			} forEach (BIS_WL_allWarlords select {side group _x == _side});
		}forEach BIS_WL_competingSides;
		
	};
	if ((_bluenum < _rednum) and ((_rednum - _bluenum) > KORB_TEAM_BALANCE_SPLIT)) then {
		/*
		_bluecount =  format ["# OF blue balls is more than red : %1 ", _bluenum];
			[_bluecount] remoteExec ["systemChat", 0];
		_redcount =  format ["# OF red balls less then blue : %1 ", _rednum];
			[_redcount] remoteExec ["systemChat", 0];
		_bluepay =  format ["blue got paid"];
			[_bluepay] remoteExec ["systemChat", 0];
		*/
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
			/*
			_bluecount =  format ["# OF blue balls less than red : %1 ", _bluenum];
				[_bluecount] remoteExec ["systemChat", 0];
			_redcount =  format ["# OF red balls more than blue : %1 ", _rednum];
				[_redcount] remoteExec ["systemChat", 0];
			_redpay =  format ["red got paid"];
				[_redpay] remoteExec ["systemChat", 0];
			*/
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

 