#include "..\warlords_constants.inc"

params ["_area", ["_rimWidth", 0], ["_infantryOnly", TRUE], ["_sortCenter", objNull]];
if (typeName _area != typeName []) then {_area = [_area]};

private _center = _area # 0;
private _axisA = 0;
private _axisB = 0;

switch (typeName _center) do {
	case typeName []: {
		_axisA = _area # 1;
		_axisB = _area # 1;
	};
	case typeName "": {
		_axisA = (markerSize _center) # 0;
		_axisB = (markerSize _center) # 1;
		_area = [markerPos _center, _axisA, _axisB, markerDir _center, (markerShape _center) == "RECTANGLE"];
		_center = _area # 0;
	};
	case typeName objNull: {
		if (typeOf _center == "EmptyDetector") then {
			_axisA = (triggerArea _center) # 0;
			_axisB = (triggerArea _center) # 1;
		} else {
			if (_center isKindOf "Man") then {
				_area append [100, 100, 0, FALSE]; //default values 100, 100, 0, false
				_axisA = _area # 1;
				_axisB = _area # 2;
			} else {
				_area = (_center getVariable "objectAreaComplete");
				_axisA = _area # 1;
				_axisB = _area # 2;
			}
		};

		//These random x,y,z don't seem to break anything so I'm leaving them in. If spawning breaks later remove them.
		private _randomx = random 60;
		private _randomy = random 60;
		private _randomz = 0;

		_center = position _center vectorAdd [_randomx, _randomy, _randomz];
	};
};

//These random x,y,z don't seem to break anything so I'm leaving them in. If spawning breaks later remove them.
private _randomx = random 60;
private _randomy = random 60;
private _randomz = 0;


if (isNull _sortCenter) then {_sortCenter = _center vectorAdd [_randomx, _randomy, _randomz]};

private _rimArea = _area;
private _axisRimA = 0;
private _axisRimB = 0;

if (_rimWidth != 0) then {
	_axisRimA = _axisA + _rimWidth;
	_axisRimB = _axisB + _rimWidth;
	_rimArea = [_center, _axisRimA, _axisRimB, _area # 3, _area # 4];
};

_center set [2, 0];

private _maxAxis = (if (_area # 4) then {
	if (_rimWidth > 0) then {
		sqrt ((_axisRimA ^ 2) + (_axisRimB ^ 2));
	} else {
		sqrt ((_axisA ^ 2) + (_axisB ^ 2));
	}
} else {
	if (_rimWidth > 0) then {
		_axisRimA max _axisRimB;
	} else {
		_axisA max _axisB;
	};
});

private _areaStart = _center vectorDiff [_maxAxis, _maxAxis, 0];
private _areaEnd = _center vectorAdd [_maxAxis, _maxAxis, 0];
private _axisStep = if (_infantryOnly) then {5} else {WL_SPAWN_GRID_SIZE / 2};

private _areaCheck = if (_rimWidth == 0) then {
	{_this inArea _area}
} else {
	if (_rimWidth > 0) then {
		{_this inArea _rimArea && !(_this inArea _area)}
	} else {
		{_this inArea _area && !(_this inArea _rimArea)}
	}
};

private _ret = [];
private _blacklistedMapObjects = ["BUILDING", "HOUSE", "CHURCH", "CHAPEL", "BUNKER", "FORTRESS", "FOUNTAIN", "VIEW-TOWER", "LIGHTHOUSE", "FUELSTATION", "HOSPITAL", "BUSSTOP", "TRANSMITTER", "STACK", "RUIN", "WATERTOWER", "ROCK", "ROCKS", "POWERSOLAR", "POWERWIND", "SHIPWRECK"];
if !(_infantryOnly) then {_blacklistedMapObjects append ["TREE", "FOREST BORDER", "FOREST TRIANGLE", "FOREST SQUARE", "CROSS", "WALL", "FOREST", "POWER LINES"]};

for [{_axisYSpawnCheck = _areaStart # 1}, {_axisYSpawnCheck < (_areaEnd # 1)}, {_axisYSpawnCheck = _axisYSpawnCheck + _axisStep}] do {
	for [{_axisXSpawnCheck = _areaStart # 0}, {_axisXSpawnCheck < (_areaEnd # 0)}, {_axisXSpawnCheck = _axisXSpawnCheck + _axisStep}] do {
		_spawnCheckPos = [_axisXSpawnCheck, _axisYSpawnCheck, 0];
		if (_spawnCheckPos call _areaCheck) then {
			if !(isOnRoad _spawnCheckPos || surfaceIsWater _spawnCheckPos || !(_spawnCheckPos inArea BIS_WL_mapAreaArray)) then {
				_finalPos = _spawnCheckPos isFlatEmpty [5, -1, 0.65, 5, 0, FALSE, objNull];
				if !(_finalPos isEqualTo []) then {
					_finalPos = ASLToATL _finalPos;
					_nearObjs = _finalPos nearObjects ["AllVehicles", 10];
					_nearMapObjs = nearestTerrainObjects [_finalPos, _blacklistedMapObjects, 10];
					if (count _nearObjs == 0 && count _nearMapObjs == 0) then {
						_finalPos set [2, 0];
						_ret pushBack _finalPos;
					};
				};
			};
		};
	};
};
/*
if (count _ret < 20) then {
	private _roadPosArr = ((_center nearRoads _maxAxis) select {_x call _areaCheck}) apply {position _x};

	{
		private _pos = _x;
		if (_roadPosArr findIf {_x distance2D _pos < _axisStep && _x distance2D _pos > 0} != -1 || count (_pos nearObjects ["AllVehicles", _axisStep]) > 0) then {
			_roadPosArr set [_forEachIndex, objNull];
		};
	} forEach _roadPosArr;

	_roadPosArr = _roadPosArr - [objNull];
	_ret append _roadPosArr;
}; */

_ret = _ret apply {[_x distance2D _sortCenter, [_x]]};
_ret sort TRUE;
_ret = _ret apply {(_x # 1) # 0};
/*
{
	_mrkr = createMarkerLocal [call BIS_fnc_WL2_generateVariableName, _x];
	_mrkr setMarkerTypeLocal "mil_dot_noShadow";
	_mrkr setMarkerSizeLocal [0.5, 0.5];
} forEach _ret;
*/
_ret