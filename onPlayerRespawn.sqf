_name = getPlayerUID player;
sleep 30; 
_name remoteExec ["systemChat"];
[format ["#kick %1", _name]] remoteExecCall ["serverCommand", 2];