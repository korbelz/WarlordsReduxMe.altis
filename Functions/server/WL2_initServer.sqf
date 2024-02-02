#include "..\warlords_constants.inc"

["server_init"] call BIS_fnc_startLoadingScreen;

{createCenter _x} forEach [WEST, EAST, RESISTANCE, CIVILIAN];

WEST setFriend [EAST, 0];
EAST setFriend [WEST, 0];
RESISTANCE setFriend [WEST, 0];
WEST setFriend [RESISTANCE, 0];
RESISTANCE setFriend [EAST, 0];
EAST setFriend [RESISTANCE, 0];
CIVILIAN setFriend [WEST, 1];
CIVILIAN setFriend [EAST, 1];
CIVILIAN setFriend [RESISTANCE, 1];
WEST setFriend [CIVILIAN, 1];
EAST setFriend [CIVILIAN, 1];
RESISTANCE setFriend [CIVILIAN, 1];

//this part sets fog and rain to zero
[] spawn {
	while {TRUE} do {
		_overcastPreset = random 1;
		(7200 * timeMultiplier) setOvercast _overcastPreset;
		waitUntil {sleep 600; 0 setFog 0; 10e10 setFog 0; 0 setRain 0; 10e10 setRain 0; simulWeatherSync; abs (overcast - _overcastPreset) < 0.2};
	};
};

"server" call BIS_fnc_WL2_varsInit;

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	
	BIS_WL_allWarlords = BIS_WL_allWarlords - [_unit];
	_sideID = BIS_WL_competingSides find (side group _unit);
	if (_sideID != -1) then {
		_playerSideArr = BIS_WL_playerIDArr # _sideID;
		_playerSideArr = _playerSideArr - [_uid];
		BIS_WL_playerIDArr set [_sideID, _playerSideArr];
	};

	{
		_x call BIS_fnc_WL2_sub_deleteAsset;
	} forEach (missionNamespace getVariable format ["BIS_WL_%1_ownedVehicles", _uid]);
	
	{
		if !(isPlayer _x) then {_x setDamage 1};
	} forEach ((units group _unit) - [_unit]);
	
	missionNamespace setVariable [format ["BIS_WL_%1", _uid], nil];
	missionNamespace setVariable [format ["BIS_WL_%1_ownedVehicles", _uid], nil];
}];

missionNamespace setVariable ["BIS_WL_missionStart", WL_SYNCED_TIME, TRUE];
missionNamespace setVariable ["BIS_WL_wrongTeamGroup", createGroup CIVILIAN, TRUE];
BIS_WL_wrongTeamGroup deleteGroupWhenEmpty FALSE;

if !(isDedicated) then {waitUntil {!isNull player && isPlayer player}};

call BIS_fnc_WL2_loadFactionClasses;
call BIS_fnc_WL2_sectorsInitServer;
"setup" call BIS_fnc_WL2_handleRespawnMarkers;
{_x call BIS_fnc_WL2_parsePurchaseList} forEach BIS_WL_competingSides;
[] spawn BIS_fnc_WL2_detectNewPlayers;
["server", TRUE] call BIS_fnc_WL2_updateSectorArrays;
[] spawn BIS_fnc_WL2_targetSelectionHandleServer;
[] spawn BIS_fnc_WL2_zoneRestrictionHandleServer;
[] spawn BIS_fnc_WL2_incomePayoff;
[] spawn BIS_fnc_WL2_garbageCollector;
[] spawn BIS_fnc_WL2_targetResetHandleServer;

setTimeMultiplier BIS_WL_timeMultiplier;

[] spawn {
	while {TRUE} do {
		waitUntil {sleep WL_TIMEOUT_LONG; daytime > 20 || daytime < 5};
		setTimeMultiplier ((BIS_WL_timeMultiplier * 4) min 24);
		waitUntil {sleep WL_TIMEOUT_LONG; daytime < 20 && daytime > 5};
		setTimeMultiplier BIS_WL_timeMultiplier;
	};
};

{
	_x spawn {
		_side = _this;
		while {!BIS_WL_missionEnd} do {
			waitUntil {sleep WL_TIMEOUT_LONG; ((missionNamespace getVariable format ["BIS_WL_currentTarget_%1", _side]) getVariable ["BIS_WL_owner", sideUnknown]) == _side};
			sleep WL_TIMEOUT_LONG;
			if (((missionNamespace getVariable format ["BIS_WL_currentTarget_%1", _side]) getVariable ["BIS_WL_owner", sideUnknown]) == _side) then {
				[_side, objNull] call BIS_fnc_WL2_selectTarget;
			};
		};
	};
} forEach BIS_WL_competingSides;

["server_init"] call BIS_fnc_endLoadingScreen;

//dynamic map marker system

_markeroneloc = [];
_markertwoloc = [];
_markerthreeloc = [];
_worldname = worldName;  
switch (_worldname) do
{ 
	case "Altis":
	{
    	_markeroneloc = [13998.892,14819.831,0]; 
		_markertwoloc = [13991.464,14401.705,0];
		_markerthreeloc = [13995.007,13756.69,0]; 
	};
	case default 
	{
		_markeroneloc = [(worldSize / 2), ((worldSize / 2) + 200), 0];
		_markertwoloc = [(worldSize / 2), (worldSize / 2), 0];
		_markerthreeloc = [(worldSize / 2), ((worldSize / 2) - 200), 0];
	};

};
_markerone = createMarker ["markerone", _markeroneloc]; // Not visible yet.
_markerone setMarkerType "mil_marker"; // Visible.
_markerone setMarkerColor "ColorOrange";
_markerone setMarkerAlpha 0.50;
_markerone setMarkerText missionName; 

//add server discord to this list to have it auto populate
_serverdiscord = serverName; 
switch (_serverdiscord) do
{ 
	case "Open Warlords":
	{
    	_serverdiscord = "https://discord.gg/SBGrYUpvba"; 
	};
	case default 
	{
		_serverdiscord = "discord.gg/arma3";
	};

};
_markertwo = createMarker ["markertwo", _markertwoloc]; // Not visible yet.
_markertwo setMarkerType "mil_box"; // Visible.
_markertwo setMarkerColor "ColorOrange";
_markertwo setMarkerAlpha 0.50;
_markertwo setMarkerText _serverdiscord; 

_buglink = missionName; 
switch (_buglink) do
{ 
	case "OWLKorb":
	{
    	_buglink = "https://github.com/korbelz/OWLKorb/issues"; 
	};
	case "OWL":
	{
    	_buglink = "https://github.com/aaannnndd/OWL/issues"; 
	};
	case "WarlordsReduxMe":
	{
    	_buglink = "https://github.com/korbelz/WarlordsReduxMe.altis"; 
	};
	case "WarlordsReduxMav":
	{
    	_buglink = "https://github.com/korbelz/WarlordsReduxMav.altis/issues"; 
	};
	case default 
	{
		_buglink = "discord.gg/arma3";
	};

};
_markerthree = createMarker ["markerthree", _markerthreeloc]; // Not visible yet.
_markerthree  setMarkerType "mil_triangle"; // Visible.
_markerthree  setMarkerColor "ColorOrange";
_markerthree  setMarkerAlpha 0.50;
_markerthree  setMarkerText _buglink; 