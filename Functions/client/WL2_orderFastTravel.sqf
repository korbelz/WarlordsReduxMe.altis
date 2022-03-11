#include "..\warlords_constants.inc"

params ["_toContested"];

"Destination" call BIS_fnc_WL2_announcer;
[toUpper localize "STR_A3_WL_popup_destination"] spawn BIS_fnc_WL2_smoothText;
private _cost = if (_toContested) then {BIS_WL_fastTravelCostContested} else {BIS_WL_fastTravelCostOwned};
[player, -_cost] call BIS_fnc_WL2_fundsControl;
["RequestMenu_close"] call BIS_fnc_WL2_setupUI;
if !(visibleMap) then {
	processDiaryLink createDiaryLink ["Map", player, ""];
	if (_toContested) then {
		WL_CONTROL_MAP ctrlMapAnimAdd [0, BIS_WL_mapSizeIndex / 75, WL_TARGET_FRIENDLY];
	} else {
		WL_CONTROL_MAP ctrlMapAnimAdd [0, 0.3, player];
	};
	ctrlMapAnimCommit WL_CONTROL_MAP;
};
BIS_WL_targetSector = objNull;
BIS_WL_currentSelection = if (_toContested) then {WL_ID_SELECTION_FAST_TRAVEL_CONTESTED} else {WL_ID_SELECTION_FAST_TRAVEL};
private _action = if (_toContested) then {"travelling_contested"} else {"travelling"};
private _marker = "";
private _markerText = "";

if (_toContested) then {
	private _startArr = (synchronizedObjects WL_TARGET_FRIENDLY) select {(_x getVariable "BIS_WL_owner") == BIS_WL_playerSide};
	_startArr = _startArr apply {[_x distance2D player, _x]};
	_startArr sort TRUE;
	private _start = (_startArr # 0) # 1;
	private _area = WL_TARGET_FRIENDLY getVariable "objectArea";
	private _size = (if (_area # 3) then {
		sqrt (((_area # 0) ^ 2) + ((_area # 1) ^ 2));
	} else {
		(_area # 0) max (_area # 1);
	});
	_marker = createMarkerLocal [call BIS_fnc_WL2_generateVariableName, [WL_TARGET_FRIENDLY, _size + WL_FAST_TRAVEL_OFFSET, WL_TARGET_FRIENDLY getDir _start] call BIS_fnc_relPos];
	_marker setMarkerShapeLocal "RECTANGLE";
	_marker setMarkerColorLocal BIS_WL_colorMarkerFriendly;
	_marker setMarkerDirLocal (WL_TARGET_FRIENDLY getDir _start);
	_marker setMarkerSizeLocal [_size, WL_FAST_TRAVEL_RANGE_AXIS];
	_markerText = createMarkerLocal [call BIS_fnc_WL2_generateVariableName, markerPos _marker];
	_markerText setMarkerColorLocal BIS_WL_colorMarkerFriendly;
	_markerText setMarkerSizeLocal [0, 0];
	_markerText setMarkerTypeLocal "mil_dot";
	_markerText setMarkerTextLocal localize "STR_A3_cfgvehicles_moduletasksetdestination_f_arguments_destination_0";
};

sleep 0.25;

_action spawn BIS_fnc_WL2_sectorSelectionHandle;

waitUntil {sleep WL_TIMEOUT_MIN; !isNull BIS_WL_targetSector || !visibleMap || BIS_WL_currentSelection == WL_ID_SELECTION_VOTING || !alive player || lifeState player == "INCAPACITATED"};

[_action, "end"] call BIS_fnc_WL2_sectorSelectionHandle;

if (isNull BIS_WL_targetSector) exitWith {
	if (BIS_WL_currentSelection in [WL_ID_SELECTION_FAST_TRAVEL, WL_ID_SELECTION_FAST_TRAVEL_CONTESTED]) then {
		BIS_WL_currentSelection = WL_ID_SELECTION_NONE;
	};
	"Canceled" call BIS_fnc_WL2_announcer;
	[toUpper localize "STR_A3_WL_menu_fasttravel_canceled"] spawn BIS_fnc_WL2_smoothText;
	deleteMarkerLocal _marker;
	deleteMarkerLocal _markerText;
	[player, _cost] call BIS_fnc_WL2_fundsControl;
};

titleCut ["", "BLACK OUT", 1];
openMap [FALSE, FALSE];

private _destination = if (_toContested) then {
		(_marker call BIS_fnc_WL2_findSpawnPositions) select {private _pos = _x; BIS_WL_allSectors findIf {_pos inArea ((_x getVariable "BIS_WL_markers") # 2)} == -1};
	} else {
		BIS_WL_targetSector call BIS_fnc_WL2_findSpawnPositions;
	};
if (count _destination > 0) then {_destination = selectRandom _destination} else {_destination = if (_toContested) then {markerPos _marker} else {position BIS_WL_targetSector}};

deleteMarkerLocal _marker;
deleteMarkerLocal _markerText;

"Fast_travel" call BIS_fnc_WL2_announcer;
[toUpper format [localize "STR_A3_WL_popup_travelling", BIS_WL_targetSector getVariable "BIS_WL_name"], nil, 3] spawn BIS_fnc_WL2_smoothText;

sleep 1;

["fastTravel", [_destination]] call BIS_fnc_WL2_sendClientRequest;

sleep 2;

if (BIS_WL_currentSelection in [WL_ID_SELECTION_FAST_TRAVEL, WL_ID_SELECTION_FAST_TRAVEL_CONTESTED]) then {
	BIS_WL_currentSelection = WL_ID_SELECTION_NONE;
};

player setDir (player getDir BIS_WL_targetSector);
titleCut ["", "BLACK IN", 1];