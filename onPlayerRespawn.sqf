//#include "..\warlords_constants.inc"


_sender = player;

_randomnum = random [1200, 1800, 2400];

sleep 5; 
_startPos = getPosASL _sender;
Sleep _randomnum;
_newPos = getPosASL _sender;



if (_startPos isEqualTo _newPos) then 
{
	_afkmessage =  format ["This player is AFK and should be kicked : %1 ", _sender];
    [_afkmessage] remoteExec ["systemChat", 0];
	

};