#include "..\warlords_constants.inc"

_bluenum = playersNumber west;
_rednum = playersNumber east;
//_bluecount =  format ["# OF blue balls on the server : %1 ", _bluenum];
//	[_bluecount] remoteExec ["systemChat", 0];
//_redcount =  format ["# OF red balls on the server : %1 ", _rednum];
//	[_redcount] remoteExec ["systemChat", 0];

loopnum = ["once"];

while {TRUE} do {
sleep WL_SECTOR_PAYOFF_PERIOD;
	if (_bluenum == _rednum) then {
		
		_bluecount =  format ["# OF blue balls on the server : %1 ", _bluenum];
			[_bluecount] remoteExec ["systemChat", 0];
		_redcount =  format ["# OF red balls on the server : %1 ", _rednum];
			[_redcount] remoteExec ["systemChat", 0];
		_bothpay =  format ["both got paid"];
			[_bothpay] remoteExec ["systemChat", 0];
		{
			_side = _x;
			//_sidepay = WEST; 
			_income = _side call BIS_fnc_WL2_income;
			{
				[_x, _income] call BIS_fnc_WL2_fundsControl;
			} forEach (BIS_WL_allWarlords select {side group _x == _side});
		}forEach BIS_WL_competingSides;
		
	};
	if (_bluenum < _rednum) then {
		
		_bluecount =  format ["# OF blue balls is more than red : %1 ", _bluenum];
			[_bluecount] remoteExec ["systemChat", 0];
		_redcount =  format ["# OF red balls less then blue : %1 ", _rednum];
			[_redcount] remoteExec ["systemChat", 0];
		_bluepay =  format ["blue got paid"];
			[_bluepay] remoteExec ["systemChat", 0];
		{
			_side = WEST;
			//_sidepay = WEST; 
			_income = _side call BIS_fnc_WL2_income;
		{
			[_x, _income] call BIS_fnc_WL2_fundsControl;
		} forEach (BIS_WL_allWarlords select {side group _x == _side});
		}forEach loopnum;
	};	
	if (_rednum < _bluenum) then {
			
			_bluecount =  format ["# OF blue balls less than red : %1 ", _bluenum];
				[_bluecount] remoteExec ["systemChat", 0];
			_redcount =  format ["# OF red balls more than blue : %1 ", _rednum];
				[_redcount] remoteExec ["systemChat", 0];
			_redpay =  format ["red got paid"];
				[_redpay] remoteExec ["systemChat", 0];
			{
				_side = EAST;
				//_sidepay = EAST; 
				_income = _side call BIS_fnc_WL2_income;
			{
				[_x, _income] call BIS_fnc_WL2_fundsControl;
			} forEach (BIS_WL_allWarlords select {side group _x == _side});
			}forEach loopnum;
				
	};
};		 

 