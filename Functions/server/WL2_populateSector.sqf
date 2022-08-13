#include "..\warlords_constants.inc"

params ["_sector", "_side"];

private _spawnPosArr = _sector call BIS_fnc_WL2_findSpawnPositions;
private _connectedToBase = count (WL_BASES arrayIntersect (_sector getVariable "BIS_WL_connectedSectors")) > 0;

//adjusting nearroads value below should change spawn slots for non-hard coded towns.
// Orginal if (_side == BIS_WL_localSide)
if (_side == BIS_WL_localSide) then {
	if (count (_sector getVariable "BIS_WL_vehiclesToSpawn") == 0 && !_connectedToBase) then {
		private _roads = ((_sector nearRoads 250) select {count roadsConnectedTo _x > 0}) inAreaArray (_sector getVariable "objectAreaComplete");
		private _tankArray = [];
		//_text = format ["items in myArray: %1", count _tankArray];
		//[_text] remoteExec ["systemChat"]; 
		private _randomsize = random RD_VIC_RANDOM_AI_SPAWNS;
		_tankArray resize _randomsize; 
		//_text = format ["items in myArray: %1", count _tankArray];
		//[_text] remoteExec ["systemChat"]; 
		
		if (count _roads > 0) then {
			{
				_road = selectRandom _roads;
				_vehicleArray = [position _road, _road getDir selectRandom (roadsConnectedTo _road), selectRandomWeighted (BIS_WL_factionVehicleClasses # (BIS_WL_sidesArray find _side)), _side] call BIS_fnc_spawnVehicle;
				_vehicleArray params ["_vehicle", "_crew", "_group"];
				_vehicle setVariable ["BIS_WL_parentSector", _sector];
				[objNull, _vehicle] call BIS_fnc_WL2_newAssetHandle;
				{
					_x setVariable ["BIS_WL_parentSector", _sector];
					[objNull, _x] call BIS_fnc_WL2_newAssetHandle;
				} forEach _crew;
			
						
				[_group, 0] setWaypointPosition [position _vehicle, 0];
				_group deleteGroupWhenEmpty TRUE;
			
				_wp = _group addWaypoint [position _sector, 600];
				_wp setWaypointType "SAD";

				_wp2 = _group addWaypoint [position _sector, 800];
				_wp2 setWaypointType "SAD";
			
				_wp = _group addWaypoint [position _sector, 0];
				_wp setWaypointType "CYCLE";
			} forEach _tankArray;
		};
		
		//private _roads = ((_sector nearRoads 250) select {count roadsConnectedTo _x > 0}) inAreaArray (_sector getVariable "objectAreaComplete");
        private _navyArray = [];
        //_text = format ["items in myArray: %1", count _myArray];
        //[_text] remoteExec ["systemChat"]; 
        private _randomsize = random RD_NAVY_RANDOM_AI_SPAWNS;
        _navyArray resize _randomsize; 
        //_text = format ["items in myArray: %1", count _myArray];
        //[_text] remoteExec ["systemChat"]; 
		if(RD_INDY_BOATS_ACTIVE == 1) then {
		 	if (count _navyArray > 0  and "S" in (_sector getVariable "BIS_WL_services")) then {
            	{
                	_randomx = random 600;
                	_randomy = random 600;
                	_randomz = 0;
                	//_road = selectRandom _roads;
                	_vehicleArray = [position _sector vectorAdd [_randomx, _randomy, _randomz], 0, selectRandomWeighted (BIS_WL_factionBoatClasses # (BIS_WL_sidesArray find _side)), _side] call BIS_fnc_spawnVehicle;
                	_vehicleArray params ["_vehicle", "_crew", "_group"];
                	_vehicle setVariable ["BIS_WL_parentSector", _sector];
                	[objNull, _vehicle] call BIS_fnc_WL2_newAssetHandle;
                	{
                    	_x setVariable ["BIS_WL_parentSector", _sector];
                    	[objNull, _x] call BIS_fnc_WL2_newAssetHandle;
                	} forEach _crew;


                	[_group, 0] setWaypointPosition [position _vehicle, 500];
                	_group deleteGroupWhenEmpty TRUE;

                	_wp = _group addWaypoint [position _sector, 2000];
                	_wp setWaypointType "SAD";

					_wp2 = _group addWaypoint [position _sector, 2000];
					_wp2 setWaypointType "SAD";

                	_wp = _group addWaypoint [position _sector, 500];
                	_wp setWaypointType "CYCLE";
            	} forEach _navyArray;
			};
		};

		
		//private _roads = ((_sector nearRoads 250) select {count roadsConnectedTo _x > 0}) inAreaArray (_sector getVariable "objectAreaComplete");
        private _diverArray = [];
        //_text = format ["items in myArray: %1", count _myArray];
        //[_text] remoteExec ["systemChat"]; 
        private _randomsize = random RD_DIVER_RANDOM_AI_SPAWNS;
        _diverArray resize _randomsize; 
        //_text = format ["items in myArray: %1", count _myArray];
        //[_text] remoteExec ["systemChat"]; 
		private _diversPool = BIS_WL_factionDiverClasses # (BIS_WL_sidesArray find _side);

		if(RD_INDY_DIVERS_ACTIVE == 1) then {
			if (count _diverArray > 0  and "S" in (_sector getVariable "BIS_WL_services")) then {
            	{
                	private _newGrp = createGroup _side;

					_randomx = random [60, 200, 400];
                	_randomy = random [60, 200, 400];
                	_randomz = 0;
                	_newUnit = _newGrp createUnit [selectRandomWeighted _diversPool, position _sector vectorAdd [_randomx, _randomy, _randomz], [], 5, "NONE"];
					_newUnit setVariable ["BIS_WL_parentSector", _sector];
					[objNull, _newUnit] call BIS_fnc_WL2_newAssetHandle;
					uiSleep WL_TIMEOUT_MIN;

					_newGrp setBehaviour "SAFE";
					_newGrp setSpeedMode "LIMITED";

                	[_newGrp, 0] setWaypointPosition [position _sector vectorAdd [_randomx, _randomy, _randomz], 10];
                	_newGrp deleteGroupWhenEmpty TRUE;

                	_wp = _newGrp addWaypoint [position _sector, 80];
                	_wp setWaypointType "SAD";

					_wp2 = _newGrp addWaypoint [position _sector, 80];
					_wp2 setWaypointType "SAD";

               		_wp =_newGrp addWaypoint [position _sector, 80];
               		_wp setWaypointType "CYCLE";
            	} forEach _diverArray;
			};
		};



	} else {
		{
			_vehicleInfo = _x;
			_vehicleInfo params ["_type", "_pos", "_dir", "_lock", "_waypoints"];
			_vehicleArray = [_pos, _dir, _type, _side] call BIS_fnc_spawnVehicle;
			_vehicleArray params ["_vehicle", "_crew", "_group"];
			
			_vehicle setVariable ["BIS_WL_parentSector", _sector];
			[objNull, _vehicle] call BIS_fnc_WL2_newAssetHandle;
			
			{
				_x setVariable ["BIS_WL_parentSector", _sector];
				[objNull, _x] call BIS_fnc_WL2_newAssetHandle;
			} forEach _crew;
			
			_vehicle lock _lock;
			[_group, 0] setWaypointPosition [_pos, 0];
			_group deleteGroupWhenEmpty TRUE;
			
			{
				_x params ["_pos", "_type", "_speed", "_behavior", "_timeout"];
				_wp = _group addWaypoint [_pos, 0];
				_wp setWaypointType _type;
				_wp setWaypointSpeed _speed;
				_wp setWaypointBehaviour _behavior;
				_wp setWaypointTimeout _timeout;
			} forEach _waypoints;
			uiSleep WL_TIMEOUT_MIN;
		} forEach (_sector getVariable "BIS_WL_vehiclesToSpawn");
	}; //below is heli/jet spawn code, molos AF never gets one because its not connected to any friendly towns when attacked 
	if (!_connectedToBase && "H" in (_sector getVariable "BIS_WL_services")) then {
		private _airArray = [];
		//_text = format ["items in myArray: %1", count _myArray];
		//[_text] remoteExec ["systemChat"]; 
		private _randomsize = random RD_AIR_RANDOM_AI_SPAWNS;
		_airArray resize _randomsize; 
		//_text = format ["items in airArray: %1", count _airArray];
		//[_text] remoteExec ["systemChat"];
		
		//private _neighbors = (_sector getVariable "BIS_WL_connectedSectors") select {(_x getVariable "BIS_WL_owner") == _side};
		//_randomx = random 500;
		//_randomy = random 500;
		//_randomz = random [200, 400, 600];

		if (count _airArray > 0) then {
			{
				_randomx = random 500;
				_randomy = random 500;
				_randomz = random [200, 400, 800];
							
				_vehicleArray = [position _sector vectorAdd [_randomx, _randomy, _randomz], 0, selectRandomWeighted (BIS_WL_factionAircraftClasses # (BIS_WL_sidesArray find _side)), _side] call BIS_fnc_spawnVehicle;
				_vehicleArray params ["_vehicle", "_crew", "_group"];
				
			
				_vehicle setVariable ["BIS_WL_parentSector", _sector];
				[objNull, _vehicle] call BIS_fnc_WL2_newAssetHandle;
			
				{
					_x setVariable ["BIS_WL_parentSector", _sector];
					[objNull, _x] call BIS_fnc_WL2_newAssetHandle;
				} forEach _crew;
			
			

				[_group, 0] setWaypointPosition [position _vehicle, 300];
				_group deleteGroupWhenEmpty TRUE;
			
				_wp1 = _group addWaypoint [position _sector, 400];
				_wp1 setWaypointType "SAD";
			
				_wp2 = _group addWaypoint [position _sector, 400];
				_wp2 setWaypointType "SAD";
			
				_wp3 = _group addWaypoint [waypointPosition _wp1, 400];
				_wp3 setWaypointType "CYCLE";
			} forEach _airArray;
		};
	};
};

if (count _spawnPosArr == 0) exitWith {};
//adjust RD_GARRISON_SIZE_MOD in warlords_constants for more AI INF per town(I think)
// Adjust GROUP_SIZE_MIN up to help smaller sectors without turning telos in to 1 FPS hell
private _garrisonSize = (_sector getVariable "BIS_WL_value") * RD_GARRISON_SIZE_MOD;
private _unitsPool = BIS_WL_factionUnitClasses # (BIS_WL_sidesArray find _side);

_i = 0;

while {_i < _garrisonSize} do {
	private _pos = selectRandom _spawnPosArr;
	private _newGrp = createGroup _side;
	private _grpSize = floor (WL_GARRISON_GROUP_SIZE_MIN + random (WL_GARRISON_GROUP_SIZE_MAX - WL_GARRISON_GROUP_SIZE_MIN));
	
	for [{_i2 = 0}, {_i2 < _grpSize && _i < _garrisonSize}, {_i2 = _i2 + 1; _i = _i + 1}] do {
		_newUnit = _newGrp createUnit [selectRandomWeighted _unitsPool, _pos, [], 5, "NONE"];
		_newUnit setVariable ["BIS_WL_parentSector", _sector];
		[objNull, _newUnit] call BIS_fnc_WL2_newAssetHandle;
		uiSleep WL_TIMEOUT_MIN;
	};
	
	_newGrp setBehaviour "SAFE";
	_newGrp setSpeedMode "LIMITED";
	[_newGrp, 0] setWaypointPosition [_pos, 0];
	_newGrp deleteGroupWhenEmpty TRUE;
	
	for [{_i3 = 0}, {_i3 < 5}, {_i3 = _i3 + 1}] do {
		_newWP = _newGrp addWaypoint [selectRandom _spawnPosArr, 0];
	};
	
	_newWP = _newGrp addWaypoint [_pos, 0];
	_newWP setWaypointType "CYCLE";
};