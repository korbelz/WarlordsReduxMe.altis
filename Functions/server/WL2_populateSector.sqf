#include "..\warlords_constants.inc"

params ["_sector", "_side"];

private _spawnPosArr = _sector call BIS_fnc_WL2_findSpawnPositions;
private _connectedToBase = count (WL_BASES arrayIntersect (_sector getVariable "BIS_WL_connectedSectors")) > 0;

//adjusting nearroads value below should change spawn slots for non-hard coded towns.

if (_side == BIS_WL_localSide) then {
	if (!_connectedToBase) then {
		private _roads = ((_sector nearRoads 300) select {count roadsConnectedTo _x > 0}) inAreaArray (_sector getVariable "objectAreaComplete");
		private _tankArray = [];
		private _qrfArray = [];
		
		private _randomsize = (1 +  random KORB_VIC_RANDOM_AI_SPAWNS);
		 _tankArray resize _randomsize; 
		 _qrfArray resize 1;
		
		
		if (count _roads > 0) then {
			{
				_road = selectRandom _roads;
				_vehicleArray = [position _road, _road getDir selectRandom (roadsConnectedTo _road), selectRandomWeighted (BIS_WL_factionVehicleClasses # (BIS_WL_sidesArray find _side)), _side] call BIS_fnc_spawnVehicle;
				_vehicleArray params ["_vehicle", "_crew", "_group"];
				_vehicle setVariable ["BIS_WL_parentSector", _sector];
				[objNull, _vehicle] call BIS_fnc_WL2_newAssetHandle;
				{
					_x setVariable ["BIS_WL_parentSector", _sector];
					_x setSkill ["spotdistance", 1];
					[objNull, _x] call BIS_fnc_WL2_newAssetHandle;
				} forEach _crew;
			
						
				[_group, 0] setWaypointPosition [position _vehicle, 0];
				_group deleteGroupWhenEmpty TRUE;
				
				_vehicle allowCrewInImmobile [TRUE, TRUE];
				_vehicle setVehicleRadar 1;

				private _tanklock = random 10;
				if (_tanklock > 3) then {
					_vehicle lock TRUE;
				};
				_wp = _group addWaypoint [position _sector, 0];
				_wp setWaypointType "SAD";

				_wp2 = _group addWaypoint [position _sector, 800];
				_wp2 setWaypointType "SAD";
			
				_wp = _group addWaypoint [position _sector, 0];
				_wp setWaypointType "CYCLE";
			} forEach _tankArray;
		};

		//AAF QRF code 
		/*
			invert this code block to add Friendly AI strike teams 
			Code block should be moved out of this script in order get attacking player side 

			Use enemy QRF code and modify it to have a chance of spawning friendly AI strike teams to help the players attack a sector. 

			maybe gate it towards lower player counts to help the map move along. 
			FRIENDLY_QRF_MOD = 5

			ex: 100% -  ((count players) * FRIENDLY_QRF_MOD)
			that example 5 players on the server would have an 75% chance of getting an AI team to help them attack the sector.

			Could also add code blocks for land units 

		*/
		if (count _roads > 0) then {
			{
				_randomx = random 10000;
				_randomy = random 10000;
				_randomz = random [50, 100, 200];

				_vehicleArray = [position _sector vectorAdd [_randomx, _randomy, _randomz], 0, "I_Heli_Transport_02_F", _side] call BIS_fnc_spawnVehicle;
				_vehicleArray params ["_vehicle", "_crew", "_group"];
				_vehicle setVariable ["BIS_WL_parentSector", _sector];
				[objNull, _vehicle] call BIS_fnc_WL2_newAssetHandle;
				{
					_x setVariable ["BIS_WL_parentSector", _sector];
					_x setSkill ["spotdistance", 1];
					[objNull, _x] call BIS_fnc_WL2_newAssetHandle;
				} forEach _crew;
			
						
				[_group, 0] setWaypointPosition [position _vehicle, 0];
				_group deleteGroupWhenEmpty TRUE;

				_vehicle allowCrewInImmobile [TRUE, TRUE];
				_vehicle setVehicleRadar 1;
			
				_wp = _group addWaypoint [position _sector, 0];
				_wp setWaypointType "TR UNLOAD";
				_wp setWaypointBehaviour "CARELESS";
				_wp setWaypointSpeed "LIMITED";

				//_wp2 = _group addWaypoint [position _sector, 800];
				//_wp2 setWaypointType "SAD";
			
				_wp = _group addWaypoint [position _sector, 600];
				_wp setWaypointType "CYCLE";

				_aafqrf = [[15771.8,19754.2,0], INDEPENDENT, ["I_Soldier_AT_F","I_Soldier_AA_F","I_Soldier_M_F","I_Soldier_AR_F","I_Soldier_AT_F",
				 "I_Soldier_AA_F","I_Soldier_M_F","I_Soldier_AR_F","I_Soldier_AT_F","I_Soldier_AA_F","I_Soldier_M_F","I_Soldier_AR_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;

				sleep .5;
       			_aafqrf = _aafqrf;
        		{ _x assignAsCargo _vehicle; _x moveIncargo _vehicle;} foreach units _aafqrf;
			} forEach _qrfArray;
		};
		
		private _navyArray = [];
        private _randomsize = (1 +  random KORB_NAVY_RANDOM_AI_SPAWNS);
         _navyArray resize _randomsize; 
        
		if(KORB_INDY_BOATS_ACTIVE == 1) then {
		 	if (count _navyArray > 0  and "S" in (_sector getVariable "BIS_WL_services")) then {
            	{
                	_randomx = random 600;
                	_randomy = random 600;
                	_randomz = 0;
                	
                	_vehicleArray = [position _sector vectorAdd [_randomx, _randomy, _randomz], 0, selectRandomWeighted (BIS_WL_factionBoatClasses # (BIS_WL_sidesArray find _side)), _side] call BIS_fnc_spawnVehicle;
                	_vehicleArray params ["_vehicle", "_crew", "_group"];
                	_vehicle setVariable ["BIS_WL_parentSector", _sector];
                	[objNull, _vehicle] call BIS_fnc_WL2_newAssetHandle;
                	{
                    	_x setVariable ["BIS_WL_parentSector", _sector];
						_x setSkill ["spotdistance", 1];
                    	[objNull, _x] call BIS_fnc_WL2_newAssetHandle;
                	} forEach _crew;


                	[_group, 0] setWaypointPosition [position _vehicle, 500];
                	_group deleteGroupWhenEmpty TRUE;

					_vehicle allowCrewInImmobile [TRUE, TRUE];

					private _tanklock = random 10;
					if (_tanklock > 3) then {
						_vehicle lock TRUE;
					};

                	_wp = _group addWaypoint [position _sector, 2000];
                	_wp setWaypointType "SAD";

					_wp2 = _group addWaypoint [position _sector, 2000];
					_wp2 setWaypointType "SAD";

                	_wp = _group addWaypoint [position _sector, 500];
                	_wp setWaypointType "CYCLE";
            	} forEach _navyArray;
			};
		};

		
		
        private _diverArray = [];
        private _randomsize = (1 +  random KORB_DIVER_RANDOM_AI_SPAWNS);
         _diverArray resize _randomsize; 
        
		private _diversPool = BIS_WL_factionDiverClasses # (BIS_WL_sidesArray find _side);

		if(KORB_INDY_DIVERS_ACTIVE == 1) then {
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

					_newGrp setBehaviour "COMBAT";
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
				_x setSkill ["spotdistance", 1];
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
		private _randomsize = (1 + random KORB_AIR_RANDOM_AI_SPAWNS);
		 _airArray resize _randomsize; 
		
		if (count _airArray > 0) then {
			{
				_randomx = random 800;
				_randomy = random 800;
				_randomz = random [200, 400, 800];
							
				_vehicleArray = [position _sector vectorAdd [_randomx, _randomy, _randomz], 0, selectRandomWeighted (BIS_WL_factionAircraftClasses # (BIS_WL_sidesArray find _side)), _side] call BIS_fnc_spawnVehicle;
				_vehicleArray params ["_vehicle", "_crew", "_group"];
				
			
				_vehicle setVariable ["BIS_WL_parentSector", _sector];
				[objNull, _vehicle] call BIS_fnc_WL2_newAssetHandle;
			
				{
					_x setVariable ["BIS_WL_parentSector", _sector];
					_x setSkill ["spotdistance", 1];
					[objNull, _x] call BIS_fnc_WL2_newAssetHandle;
				} forEach _crew;
			
			

				[_group, 0] setWaypointPosition [position _vehicle, 300];
				_group deleteGroupWhenEmpty TRUE;
			
				_vehicle allowCrewInImmobile [TRUE, TRUE];
				_vehicle setVehicleRadar 1;

				private _tanklock = random 10;
				if (_tanklock > 3) then {
					_vehicle lock TRUE;
				};

				_wp1 = _group addWaypoint [position _sector, 800];
				_wp1 setWaypointType "SAD";
			
				_wp2 = _group addWaypoint [position _sector, 800];
				_wp2 setWaypointType "SAD";
			
				_wp3 = _group addWaypoint [waypointPosition _wp1, 800];
				_wp3 setWaypointType "CYCLE";
			} forEach _airArray;
		};
			//sam site code
			private _samArray = [];
			_samArray resize 1;
		if (count _samArray > 0) then {
			{
				_randomx = random 200;
				_randomy = random 200;
				_randomz = 0;
							
				_vehicleArray = [position _sector vectorAdd [_randomx, _randomy, _randomz], 0, "I_E_SAM_System_03_F", _side] call BIS_fnc_spawnVehicle;
				_vehicleArray params ["_vehicle", "_crew", "_group"];
		
				_vehicle setVariable ["BIS_WL_parentSector", _sector];
				[objNull, _vehicle] call BIS_fnc_WL2_newAssetHandle;
			
				{
					_x setVariable ["BIS_WL_parentSector", _sector];
					_x setSkill ["spotdistance", 1];
					[objNull, _x] call BIS_fnc_WL2_newAssetHandle;
				} forEach _crew;
			
			

				[_group, 0] setWaypointPosition [position _vehicle, 300];
				_group deleteGroupWhenEmpty TRUE;
			
				_vehicle allowCrewInImmobile [TRUE, TRUE];
				_vehicle setVehicleRadar 1;

				private _tanklock = random 10;
				if (_tanklock > 3) then {
					_vehicle lock TRUE;
				};

				_wp1 = _group addWaypoint [position _sector, 800];
				_wp1 setWaypointType "SAD";
			
				_wp2 = _group addWaypoint [position _sector, 800];
				_wp2 setWaypointType "SAD";
			
				_wp3 = _group addWaypoint [waypointPosition _wp1, 800];
				_wp3 setWaypointType "CYCLE";
			} forEach _samArray;
		};

			//radar site code
			private _radarArray = [];
			_radarArray resize 1;
		if (count _radarArray > 0) then {
			{
				_randomx = random 200;
				_randomy = random 200;
				_randomz = 0;
														
				_vehicleArray = [position _sector vectorAdd [_randomx, _randomy, _randomz], 0, "I_E_Radar_System_01_F", _side] call BIS_fnc_spawnVehicle;
				_vehicleArray params ["_vehicle", "_crew", "_group"];
			
				_vehicle setVariable ["BIS_WL_parentSector", _sector];
				[objNull, _vehicle] call BIS_fnc_WL2_newAssetHandle;
			
				{
					_x setVariable ["BIS_WL_parentSector", _sector];
					_x setSkill ["spotdistance", 1];
					[objNull, _x] call BIS_fnc_WL2_newAssetHandle;
				} forEach _crew;
			
			

				[_group, 0] setWaypointPosition [position _vehicle, 300];
				_group deleteGroupWhenEmpty TRUE;
			
				_vehicle allowCrewInImmobile [TRUE, TRUE];
				_vehicle setVehicleRadar 1;
				/*
				_lookAtPositions = [0, 90, 180, 270] apply { _asset getRelPos [100, _x] };
				_radarIter = 0;

				while {alive _asset} do {
						_vehicle lookAt (_lookAtPositions # _radarIter);
						_radarIter = (_radarIter + 1) % 4;
					};
					sleep WL_TIMEOUT_LONG;
				*/ 
				private _tanklock = random 10;
				if (_tanklock > 3) then {
					_vehicle lock TRUE;
				};

				_wp1 = _group addWaypoint [position _sector, 800];
				_wp1 setWaypointType "SAD";
			
				_wp2 = _group addWaypoint [position _sector, 800];
				_wp2 setWaypointType "SAD";
			
				_wp3 = _group addWaypoint [waypointPosition _wp1, 800];
				_wp3 setWaypointType "CYCLE";
			} forEach _radarArray;
		};
	};
};

if(KORB_EAST_WEST_TANKAIR_DEFENDERS == 1)then{
//West sector spawning code
BIS_WL_sidesArrayWest = BIS_WL_sidesArray # 0;
if (_side == BIS_WL_sidesArrayWest) then {
	if (!_connectedToBase) then {
		private _roads = ((_sector nearRoads 300) select {count roadsConnectedTo _x > 0}) inAreaArray (_sector getVariable "objectAreaComplete");
		private _tankArray = [];
		private _randomsize = (1 + random KORB_VIC_RANDOM_AI_SPAWNS);
		 _tankArray resize _randomsize; 
				
		if (count _roads > 0) then {
			{
				_road = selectRandom _roads;
				_vehicleArray = [position _road, _road getDir selectRandom (roadsConnectedTo _road), selectRandomWeighted (BIS_WL_factionVehicleClasses # (BIS_WL_sidesArray find _side)), _side] call BIS_fnc_spawnVehicle;
				_vehicleArray params ["_vehicle", "_crew", "_group"];
				_vehicle setVariable ["BIS_WL_parentSector", _sector];
				[objNull, _vehicle] call BIS_fnc_WL2_newAssetHandle;
				{
					_x setVariable ["BIS_WL_parentSector", _sector];
					_x setSkill ["spotdistance", 1];
					[objNull, _x] call BIS_fnc_WL2_newAssetHandle;
				} forEach _crew;
			
						
				[_group, 0] setWaypointPosition [position _vehicle, 0];
				_group deleteGroupWhenEmpty TRUE;

				_vehicle allowCrewInImmobile [TRUE, TRUE];
				_vehicle setVehicleRadar 1;

				private _tanklock = random 10;
				if (_tanklock > 3) then {
					_vehicle lock TRUE;
				};
			
				_wp = _group addWaypoint [position _sector, 600];
				_wp setWaypointType "SAD";

				_wp2 = _group addWaypoint [position _sector, 800];
				_wp2 setWaypointType "SAD";
			
				_wp = _group addWaypoint [position _sector, 0];
				_wp setWaypointType "CYCLE";
			} forEach _tankArray;
		};
		
		private _qrfArray = [];
		_qrfArray resize 1;
		if (count _roads > 0) then {
			{
				_randomx = random 10000;
				_randomy = random 10000;
				_randomz = random [50, 100, 200];

				_vehicleArray = [position _sector vectorAdd [_randomx, _randomy, _randomz], 0, "B_Heli_Transport_03_F", _side] call BIS_fnc_spawnVehicle;
				_vehicleArray params ["_vehicle", "_crew", "_group"];
				_vehicle setVariable ["BIS_WL_parentSector", _sector];
				[objNull, _vehicle] call BIS_fnc_WL2_newAssetHandle;
				{
					_x setVariable ["BIS_WL_parentSector", _sector];
					_x setSkill ["spotdistance", 1];
					[objNull, _x] call BIS_fnc_WL2_newAssetHandle;
				} forEach _crew;
			
						
				[_group, 0] setWaypointPosition [position _vehicle, 0];
				_group deleteGroupWhenEmpty TRUE;

				_vehicle allowCrewInImmobile [TRUE, TRUE];
				_vehicle setVehicleRadar 1;
			
				_wp = _group addWaypoint [position _sector, 0];
				_wp setWaypointType "TR UNLOAD";
				_wp setWaypointBehaviour "CARELESS";
				_wp setWaypointSpeed "LIMITED";

				//_wp2 = _group addWaypoint [position _sector, 800];
				//_wp2 setWaypointType "SAD";
			
				_wp = _group addWaypoint [position _sector, 600];
				_wp setWaypointType "CYCLE";

				_blueqrf = [[15771.8,19754.2,0], WEST, ["B_Soldier_AT_F","B_Soldier_AA_F","B_Soldier_M_F","B_Soldier_AR_F","B_Soldier_AT_F",
				 "B_Soldier_AA_F","B_Soldier_M_F","B_Soldier_AR_F","B_Soldier_AT_F","B_Soldier_AA_F","B_Soldier_M_F","B_Soldier_AR_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;

				sleep .5;
       			_blueqrf = _blueqrf;
        		{ _x assignAsCargo _vehicle; _x moveIncargo _vehicle;} foreach units _blueqrf;
			} forEach _qrfArray;
		};
		
        private _navyArray = [];
         
        private _randomsize = (1 + random KORB_NAVY_RANDOM_AI_SPAWNS);
         _navyArray resize _randomsize; 
         
		if(KORB_INDY_BOATS_ACTIVE == 1) then {
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
						_x setSkill ["spotdistance", 1];
                    	[objNull, _x] call BIS_fnc_WL2_newAssetHandle;
                	} forEach _crew;


                	[_group, 0] setWaypointPosition [position _vehicle, 500];
                	_group deleteGroupWhenEmpty TRUE;

					_vehicle allowCrewInImmobile [TRUE, TRUE];
					_vehicle setVehicleRadar 1;

					private _tanklock = random 10;
					if (_tanklock > 3) then {
						_vehicle lock TRUE;
					};

                	_wp = _group addWaypoint [position _sector, 2000];
                	_wp setWaypointType "SAD";

					_wp2 = _group addWaypoint [position _sector, 2000];
					_wp2 setWaypointType "SAD";

                	_wp = _group addWaypoint [position _sector, 500];
                	_wp setWaypointType "CYCLE";
            	} forEach _navyArray;
			};
		};

		
		
        private _diverArray = [];
        private _randomsize = (1 + random KORB_DIVER_RANDOM_AI_SPAWNS);
         _diverArray resize _randomsize; 
        private _diversPool = BIS_WL_factionDiverClasses # (BIS_WL_sidesArray find _side);

		if(KORB_INDY_DIVERS_ACTIVE == 1) then {
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

					_newGrp setBehaviour "COMBAT";
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
				_x setSkill ["spotdistance", 1];
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
		private _randomsize = (1 + random KORB_AIR_RANDOM_AI_SPAWNS);
		 _airArray resize _randomsize; 
		
		if (count _airArray > 0) then {
			{
				_randomx = random 800;
				_randomy = random 800;
				_randomz = random [200, 400, 800];
							
				_vehicleArray = [position _sector vectorAdd [_randomx, _randomy, _randomz], 0, selectRandomWeighted (BIS_WL_factionAircraftClasses # (BIS_WL_sidesArray find _side)), _side] call BIS_fnc_spawnVehicle;
				_vehicleArray params ["_vehicle", "_crew", "_group"];
				
			
				_vehicle setVariable ["BIS_WL_parentSector", _sector];
				[objNull, _vehicle] call BIS_fnc_WL2_newAssetHandle;
			
				{
					_x setVariable ["BIS_WL_parentSector", _sector];
					_x setSkill ["spotdistance", 1];
					[objNull, _x] call BIS_fnc_WL2_newAssetHandle;
				} forEach _crew;
			
			

				[_group, 0] setWaypointPosition [position _vehicle, 300];
				_group deleteGroupWhenEmpty TRUE;

				_vehicle allowCrewInImmobile [TRUE, TRUE];
				_vehicle setVehicleRadar 1;

				private _tanklock = random 10;
				if (_tanklock > 3) then {
					_vehicle lock TRUE;
				};
			
				_wp1 = _group addWaypoint [position _sector, 800];
				_wp1 setWaypointType "SAD";
			
				_wp2 = _group addWaypoint [position _sector, 800];
				_wp2 setWaypointType "SAD";
			
				_wp3 = _group addWaypoint [waypointPosition _wp1, 800];
				_wp3 setWaypointType "CYCLE";
			} forEach _airArray;
		};

			//sam site code
			private _samArray = [];
			_samArray resize 1;
		if (count _samArray > 0) then {
			{
				_randomx = random 200;
				_randomy = random 200;
				_randomz = 0;
							
				_vehicleArray = [position _sector vectorAdd [_randomx, _randomy, _randomz], 0, "B_SAM_System_03_F", _side] call BIS_fnc_spawnVehicle;
				_vehicleArray params ["_vehicle", "_crew", "_group"];
		
				_vehicle setVariable ["BIS_WL_parentSector", _sector];
				[objNull, _vehicle] call BIS_fnc_WL2_newAssetHandle;
			
				{
					_x setVariable ["BIS_WL_parentSector", _sector];
					_x setSkill ["spotdistance", 1];
					[objNull, _x] call BIS_fnc_WL2_newAssetHandle;
				} forEach _crew;
			
			

				[_group, 0] setWaypointPosition [position _vehicle, 300];
				_group deleteGroupWhenEmpty TRUE;
			
				_vehicle allowCrewInImmobile [TRUE, TRUE];
				_vehicle setVehicleRadar 1;

				private _tanklock = random 10;
				if (_tanklock > 3) then {
					_vehicle lock TRUE;
				};

				_wp1 = _group addWaypoint [position _sector, 800];
				_wp1 setWaypointType "SAD";
			
				_wp2 = _group addWaypoint [position _sector, 800];
				_wp2 setWaypointType "SAD";
			
				_wp3 = _group addWaypoint [waypointPosition _wp1, 800];
				_wp3 setWaypointType "CYCLE";
			} forEach _samArray;
		};

			//radar site code
			private _radarArray = [];
			_radarArray resize 1;
		if (count _radarArray > 0) then {
			{
				_randomx = random 200;
				_randomy = random 200;
				_randomz = 0;
														
				_vehicleArray = [position _sector vectorAdd [_randomx, _randomy, _randomz], 0, "B_Radar_System_01_F", _side] call BIS_fnc_spawnVehicle;
				_vehicleArray params ["_vehicle", "_crew", "_group"];
			
				_vehicle setVariable ["BIS_WL_parentSector", _sector];
				[objNull, _vehicle] call BIS_fnc_WL2_newAssetHandle;
			
				{
					_x setVariable ["BIS_WL_parentSector", _sector];
					_x setSkill ["spotdistance", 1];
					[objNull, _x] call BIS_fnc_WL2_newAssetHandle;
				} forEach _crew;
			
			

				[_group, 0] setWaypointPosition [position _vehicle, 300];
				_group deleteGroupWhenEmpty TRUE;
			
				_vehicle allowCrewInImmobile [TRUE, TRUE];
				_vehicle setVehicleRadar 1;

				private _tanklock = random 10;
				if (_tanklock > 3) then {
					_vehicle lock TRUE;
				};

				_wp1 = _group addWaypoint [position _sector, 800];
				_wp1 setWaypointType "SAD";
			
				_wp2 = _group addWaypoint [position _sector, 800];
				_wp2 setWaypointType "SAD";
			
				_wp3 = _group addWaypoint [waypointPosition _wp1, 800];
				_wp3 setWaypointType "CYCLE";
			} forEach _radarArray;
		};
	};
};

//East sector spawning code
BIS_WL_sidesArrayEast = BIS_WL_sidesArray # 1;
if (_side == BIS_WL_sidesArrayEast) then {
	if (!_connectedToBase) then {
		private _roads = ((_sector nearRoads 300) select {count roadsConnectedTo _x > 0}) inAreaArray (_sector getVariable "objectAreaComplete");
		private _tankArray = [];
		private _randomsize = (1 + random KORB_VIC_RANDOM_AI_SPAWNS);
		 _tankArray resize _randomsize; 
				
		if (count _roads > 0) then {
			{
				_road = selectRandom _roads;
				_vehicleArray = [position _road, _road getDir selectRandom (roadsConnectedTo _road), selectRandomWeighted (BIS_WL_factionVehicleClasses # (BIS_WL_sidesArray find _side)), _side] call BIS_fnc_spawnVehicle;
				_vehicleArray params ["_vehicle", "_crew", "_group"];
				_vehicle setVariable ["BIS_WL_parentSector", _sector];
				[objNull, _vehicle] call BIS_fnc_WL2_newAssetHandle;
				{
					_x setVariable ["BIS_WL_parentSector", _sector];
					_x setSkill ["spotdistance", 1];
					[objNull, _x] call BIS_fnc_WL2_newAssetHandle;
				} forEach _crew;
			
						
				[_group, 0] setWaypointPosition [position _vehicle, 0];
				_group deleteGroupWhenEmpty TRUE;

				_vehicle allowCrewInImmobile [TRUE, TRUE];
				_vehicle setVehicleRadar 1;

				private _tanklock = random 10;
				if (_tanklock > 3) then {
					_vehicle lock TRUE;
				};
			
				_wp = _group addWaypoint [position _sector, 600];
				_wp setWaypointType "SAD";

				_wp2 = _group addWaypoint [position _sector, 800];
				_wp2 setWaypointType "SAD";
			
				_wp = _group addWaypoint [position _sector, 0];
				_wp setWaypointType "CYCLE";
			} forEach _tankArray;
		};
		
		private _qrfArray = [];
		_qrfArray resize 1;
		if (count _roads > 0) then {
			{
				_randomx = random 10000;
				_randomy = random 10000;
				_randomz = random [50, 100, 200];

				_vehicleArray = [position _sector vectorAdd [_randomx, _randomy, _randomz], 0, "O_Heli_Transport_04_covered_F", _side] call BIS_fnc_spawnVehicle;
				_vehicleArray params ["_vehicle", "_crew", "_group"];
				_vehicle setVariable ["BIS_WL_parentSector", _sector];
				[objNull, _vehicle] call BIS_fnc_WL2_newAssetHandle;
				{
					_x setVariable ["BIS_WL_parentSector", _sector];
					_x setSkill ["spotdistance", 1];
					[objNull, _x] call BIS_fnc_WL2_newAssetHandle;
				} forEach _crew;
			
						
				[_group, 0] setWaypointPosition [position _vehicle, 0];
				_group deleteGroupWhenEmpty TRUE;

				_vehicle allowCrewInImmobile [TRUE, TRUE];
				_vehicle setVehicleRadar 1;
			
				_wp = _group addWaypoint [position _sector, 0];
				_wp setWaypointType "TR UNLOAD";
				_wp setWaypointBehaviour "CARELESS";
				_wp setWaypointSpeed "LIMITED";

				//_wp2 = _group addWaypoint [position _sector, 800];
				//_wp2 setWaypointType "SAD";
			
				_wp = _group addWaypoint [position _sector, 600];
				_wp setWaypointType "CYCLE";

				_redqrf = [[15771.8,19754.2,0], EAST, ["O_Soldier_AT_F","O_Soldier_AA_F","O_Soldier_M_F","O_Soldier_AR_F","O_Soldier_AT_F",
				 "O_Soldier_AA_F","O_Soldier_M_F","O_Soldier_AR_F","O_Soldier_AT_F","O_Soldier_AA_F","O_Soldier_M_F","O_Soldier_AR_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;

				sleep .5;
       			_redqrf = _redqrf;
        		{ _x assignAsCargo _vehicle; _x moveIncargo _vehicle;} foreach units _redqrf;
			} forEach _qrfArray;
		};

		private _navyArray = [];
        private _randomsize = (1 + random KORB_NAVY_RANDOM_AI_SPAWNS);
         _navyArray resize _randomsize; 
        
		if(KORB_INDY_BOATS_ACTIVE == 1) then {
		 	if (count _navyArray > 0  and "S" in (_sector getVariable "BIS_WL_services")) then {
            	{
                	_randomx = random 600;
                	_randomy = random 600;
                	_randomz = 0;
                	
                	_vehicleArray = [position _sector vectorAdd [_randomx, _randomy, _randomz], 0, selectRandomWeighted (BIS_WL_factionBoatClasses # (BIS_WL_sidesArray find _side)), _side] call BIS_fnc_spawnVehicle;
                	_vehicleArray params ["_vehicle", "_crew", "_group"];
                	_vehicle setVariable ["BIS_WL_parentSector", _sector];
                	[objNull, _vehicle] call BIS_fnc_WL2_newAssetHandle;
                	{
                    	_x setVariable ["BIS_WL_parentSector", _sector];
						_x setSkill ["spotdistance", 1];
                    	[objNull, _x] call BIS_fnc_WL2_newAssetHandle;
                	} forEach _crew;


                	[_group, 0] setWaypointPosition [position _vehicle, 500];
                	_group deleteGroupWhenEmpty TRUE;

					_vehicle allowCrewInImmobile [TRUE, TRUE];
					_vehicle setVehicleRadar 1;

					private _tanklock = random 10;
					if (_tanklock > 3) then {
						_vehicle lock TRUE;
					};

                	_wp = _group addWaypoint [position _sector, 2000];
                	_wp setWaypointType "SAD";

					_wp2 = _group addWaypoint [position _sector, 2000];
					_wp2 setWaypointType "SAD";

                	_wp = _group addWaypoint [position _sector, 500];
                	_wp setWaypointType "CYCLE";
            	} forEach _navyArray;
			};
		};
		
		private _diverArray = [];
        private _randomsize = (1 + random KORB_DIVER_RANDOM_AI_SPAWNS);
         _diverArray resize _randomsize; 
        private _diversPool = BIS_WL_factionDiverClasses # (BIS_WL_sidesArray find _side);

		if(KORB_INDY_DIVERS_ACTIVE == 1) then {
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

					_newGrp setBehaviour "COMBAT";
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
				_x setSkill ["spotdistance", 1];
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
		private _randomsize = (1 + random KORB_AIR_RANDOM_AI_SPAWNS);
		 _airArray resize _randomsize; 
		
		if (count _airArray > 0) then {
			{
				_randomx = random 800;
				_randomy = random 800;
				_randomz = random [200, 400, 800];
							
				_vehicleArray = [position _sector vectorAdd [_randomx, _randomy, _randomz], 0, selectRandomWeighted (BIS_WL_factionAircraftClasses # (BIS_WL_sidesArray find _side)), _side] call BIS_fnc_spawnVehicle;
				_vehicleArray params ["_vehicle", "_crew", "_group"];
				
			
				_vehicle setVariable ["BIS_WL_parentSector", _sector];
				[objNull, _vehicle] call BIS_fnc_WL2_newAssetHandle;
			
				{
					_x setVariable ["BIS_WL_parentSector", _sector];
					_x setSkill ["spotdistance", 1];
					[objNull, _x] call BIS_fnc_WL2_newAssetHandle;
				} forEach _crew;
			
			

				[_group, 0] setWaypointPosition [position _vehicle, 300];
				_group deleteGroupWhenEmpty TRUE;

				_vehicle allowCrewInImmobile [TRUE, TRUE];
				_vehicle setVehicleRadar 1;

				private _tanklock = random 10;
				if (_tanklock > 3) then {
					_vehicle lock TRUE;
				};
			
				_wp1 = _group addWaypoint [position _sector, 800];
				_wp1 setWaypointType "SAD";
			
				_wp2 = _group addWaypoint [position _sector, 800];
				_wp2 setWaypointType "SAD";
			
				_wp3 = _group addWaypoint [waypointPosition _wp1, 800];
				_wp3 setWaypointType "CYCLE";
			} forEach _airArray;
		};

			//sam site code
			private _samArray = [];
			_samArray resize 1;
		if (count _samArray > 0) then {
			{
				_randomx = random 200;
				_randomy = random 200;
				_randomz = 0;
							
				_vehicleArray = [position _sector vectorAdd [_randomx, _randomy, _randomz], 0, "O_SAM_System_04_F", _side] call BIS_fnc_spawnVehicle;
				_vehicleArray params ["_vehicle", "_crew", "_group"];
		
				_vehicle setVariable ["BIS_WL_parentSector", _sector];
				[objNull, _vehicle] call BIS_fnc_WL2_newAssetHandle;
			
				{
					_x setVariable ["BIS_WL_parentSector", _sector];
					_x setSkill ["spotdistance", 1];
					[objNull, _x] call BIS_fnc_WL2_newAssetHandle;
				} forEach _crew;
			
			

				[_group, 0] setWaypointPosition [position _vehicle, 300];
				_group deleteGroupWhenEmpty TRUE;
			
				_vehicle allowCrewInImmobile [TRUE, TRUE];
				_vehicle setVehicleRadar 1;

				private _tanklock = random 10;
				if (_tanklock > 3) then {
					_vehicle lock TRUE;
				};

				_wp1 = _group addWaypoint [position _sector, 800];
				_wp1 setWaypointType "SAD";
			
				_wp2 = _group addWaypoint [position _sector, 800];
				_wp2 setWaypointType "SAD";
			
				_wp3 = _group addWaypoint [waypointPosition _wp1, 800];
				_wp3 setWaypointType "CYCLE";
			} forEach _samArray;
		};

			//radar site code
			private _radarArray = [];
			_radarArray resize 1;
		if (count _radarArray > 0) then {
			{
				_randomx = random 200;
				_randomy = random 200;
				_randomz = 0;
														
				_vehicleArray = [position _sector vectorAdd [_randomx, _randomy, _randomz], 0, "O_Radar_System_02_F", _side] call BIS_fnc_spawnVehicle;
				_vehicleArray params ["_vehicle", "_crew", "_group"];
			
				_vehicle setVariable ["BIS_WL_parentSector", _sector];
				[objNull, _vehicle] call BIS_fnc_WL2_newAssetHandle;
			
				{
					_x setVariable ["BIS_WL_parentSector", _sector];
					_x setSkill ["spotdistance", 1];
					[objNull, _x] call BIS_fnc_WL2_newAssetHandle;
				} forEach _crew;
			
			

				[_group, 0] setWaypointPosition [position _vehicle, 300];
				_group deleteGroupWhenEmpty TRUE;
			
				_vehicle allowCrewInImmobile [TRUE, TRUE];
				_vehicle setVehicleRadar 1;

				private _tanklock = random 10;
				if (_tanklock > 3) then {
					_vehicle lock TRUE;
				};

				_wp1 = _group addWaypoint [position _sector, 800];
				_wp1 setWaypointType "SAD";
			
				_wp2 = _group addWaypoint [position _sector, 800];
				_wp2 setWaypointType "SAD";
			
				_wp3 = _group addWaypoint [waypointPosition _wp1, 800];
				_wp3 setWaypointType "CYCLE";
			} forEach _radarArray;
		};
	};
};
};
if (count _spawnPosArr == 0) exitWith {};
/*
	dynamic AI numbers per sector code here 
	time_1 = sector start timestamp
	time_2 = sector end timestamp
	AI_number_modifer = (time_2 - time_1) / BASELINE_MINUTES(ex: 20)

	next sector spawn code:
     	_garrisonSize / AI_number_modifer
*/ 
//adjust KORB_GARRISON_SIZE_MOD in warlords_constants for more AI INF per town(I think)
// Adjust GROUP_SIZE_MIN up to help smaller sectors without turning telos in to 1 FPS hell
private _garrisonSize = (_sector getVariable "BIS_WL_value") * KORB_GARRISON_SIZE_MOD; //dynamic AI number scaling goes here
private _unitsPool = BIS_WL_factionUnitClasses # (BIS_WL_sidesArray find _side);

_i = 0;

while {_i < _garrisonSize} do {
	private _pos = selectRandom _spawnPosArr;
	private _newGrp = createGroup _side;
	private _grpSize = floor (WL_GARRISON_GROUP_SIZE_MIN + random (WL_GARRISON_GROUP_SIZE_MAX - WL_GARRISON_GROUP_SIZE_MIN));
	
	for [{_i2 = 0}, {_i2 < _grpSize && _i < _garrisonSize}, {_i2 = _i2 + 1; _i = _i + 1}] do {
		_newUnit = _newGrp createUnit [selectRandomWeighted _unitsPool, _pos, [], 5, "NONE"];
		_newUnit setVariable ["BIS_WL_parentSector", _sector];
		_newUnit setSkill ["spotdistance", 1];
		[objNull, _newUnit] call BIS_fnc_WL2_newAssetHandle;
		uiSleep WL_TIMEOUT_MIN;
	};
	
	_newGrp setBehaviour "COMBAT";
	_newGrp setSpeedMode "LIMITED";
	
	[_newGrp, 0] setWaypointPosition [_pos, 0];
	_newGrp deleteGroupWhenEmpty TRUE;
	
	for [{_i3 = 0}, {_i3 < 5}, {_i3 = _i3 + 1}] do {
		_newWP = _newGrp addWaypoint [selectRandom _spawnPosArr, 0];
	};
	
	_newWP = _newGrp addWaypoint [_pos, 0];
	_newWP setWaypointType "CYCLE";
};