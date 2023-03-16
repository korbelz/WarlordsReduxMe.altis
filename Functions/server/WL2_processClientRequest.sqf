#include "..\warlords_constants.inc"

params ["_var", "_action"];

private _sender = objNull;
private _actionArray = _action splitString "|";
_action = _actionArray # 0;
private _params = _actionArray - [_action];

//arrays for custom equipment boxes
//blue boxes 
private _blueboxone = "O_CargoNet_01_ammo_F"; //get this class ID from requisitions.inc, put it in quotes
private _itemsblueone = [  ["arifle_MXM_RCO_pointer_snds_F",1], ["muzzle_snds_H_khk_F",1], ["acc_pointer_IR",1], ["optic_Nightstalker",1], ["bipod_01_F_khk",1], ["30Rnd_65x39_caseless_khaki_mag",7],
 ["launch_I_Titan_short_F", 1], ["Titan_AT",3], ["launch_MRAWS_green_F", 1], ["MRAWS_HEAT_F",3], ["U_B_CTRG_Soldier_F", 1], ["V_PlateCarrierIAGL_oli", 1], ["H_HelmetO_ViperSP_ghex_F", 1], ["Laserdesignator", 1], ["Laserbatteries",1], ["MineDetector",1], ["FirstAidKit",3], ["B_UavTerminal",1],
 ["srifle_EBR_ARCO_pointer_snds_F",1],["20Rnd_762x51_Mag",7],["arifle_Katiba_ARCO_pointer_snds_F",1],["30Rnd_65x39_caseless_green",7]];
private _backpacksblueone = [  ["B_FieldPack_oli", 1]];

private _blueboxtwo = "I_CargoNet_01_ammo_F"; //get this class ID from requisitions.inc, put it in quotes
private _itemsbluetwo = [  ["arifle_MX_SW_Hamr_pointer_F",1], ["muzzle_snds_H_khk_F",1], ["acc_pointer_IR",1], ["optic_Nightstalker",1], ["bipod_01_F_khk",1], ["100Rnd_65x39_caseless_mag",7],
 ["launch_B_Titan_olive_F", 1], ["Titan_AA",3], ["U_B_CTRG_Soldier_F", 1], ["V_PlateCarrierIAGL_oli", 1], ["H_HelmetO_ViperSP_ghex_F", 1], ["Laserdesignator", 1], ["Laserbatteries",1], ["MineDetector",1], ["FirstAidKit",3], ["B_UavTerminal",1],
 ["LMG_Mk200_MRCO_F",1],["200Rnd_65x39_cased_Box",4],["arifle_SPAR_02_blk_ERCO_Pointer_F",1],["150Rnd_556x45_Drum_Mag_F",5]];
private _backpacksbluetwo = [  ["B_FieldPack_oli", 1]];

private _blueboxthree = "B_CargoNet_01_ammo_F"; //get this class ID from requisitions.inc, put it in quotes
private _itemsbluethree = [  ["arifle_SDAR_F",1], ["20Rnd_556x45_UW_mag",7], ["NVGoggles_OPFOR",1], 
 ["launch_I_Titan_short_F", 1], ["Titan_AT",2], ["U_B_Wetsuit", 1], ["V_RebreatherB", 1], ["G_Diving", 1], ["H_HelmetSpecB_blk", 1], ["Laserdesignator", 1], ["Laserbatteries",1], ["MineDetector",1], ["FirstAidKit",3], ["B_UavTerminal",1],
 ["DemoCharge_Remote_Mag",2],["ClaymoreDirectionalMine_Remote_Mag",2], ["SatchelCharge_Remote_Mag",2]];
private _backpacksbluethree = [  ["B_FieldPack_blk", 1]];

private _blueboxfour = "CargoNet_01_box_F"; //get this class ID from requisitions.inc, put it in quotes
private _itemsbluefour = [  ["srifle_LRR_F",1],["optic_LRPS",1], ["7Rnd_408_Mag",13], ["NVGoggles",1],
  ["U_B_FullGhillie_ard", 1], ["V_PlateCarrierIAGL_oli", 1], ["G_Balaclava_blk", 1], ["H_HelmetSpecB_snakeskin", 1], ["Laserdesignator", 1], ["Laserbatteries",1], ["MineDetector",1], ["FirstAidKit",3], ["B_UavTerminal",1],
  ["srifle_GM6_SOS_F",1],["30Rnd_65x39_caseless_khaki_mag",13],["arifle_SPAR_03_blk_MOS_Pointer_Bipod_F",1],["20Rnd_762x51_Mag",13]];
private _backpacksbluefour = [  ["B_FieldPack_cbr", 1]];

private _blueboxfive = "I_supplyCrate_F"; //get this class ID from requisitions.inc, put it in quotes
private _itemsbluefive = [  ["optic_Nightstalker",1], ["launch_O_Vorona_brown_F", 1],  ["Vorona_HEAT", 3], ["srifle_DMR_02_SOS_F", 1],  ["20Rnd_762x51_Mag", 7], ["MMG_01_hex_ARCO_LP_F", 1],  ["150Rnd_93x64_Mag", 7]
, ["LMG_Zafir_ARCO_F", 1],  ["150Rnd_762x54_Box", 7], ["launch_RPG32_F", 1], ["RPG32_F",3], ["srifle_DMR_01_DMS_snds_BI_F", 1],  ["10Rnd_762x54_Mag", 7]];
private _backpacksbluefive = [  ["B_Carryall_mcamo", 1]];

//red boxes
private _redboxone = "O_CargoNet_01_ammo_F"; //get this class ID from requisitions.inc
private _itemsredone = [  ["arifle_MXM_Black_F",1], ["muzzle_snds_H",1], ["acc_pointer_IR",1], ["optic_Nightstalker",1], ["bipod_02_F_blk",1], ["30Rnd_65x39_caseless_black_mag",7],
 ["launch_B_Titan_short_F", 1], ["Titan_AT",3], ["launch_MRAWS_sand_F", 1], ["MRAWS_HEAT_F",3], ["U_O_V_Soldier_Viper_hex_F", 1], ["V_TacVest_brn", 1], ["H_HelmetO_ViperSP_hex_F", 1], ["Laserdesignator", 1], ["Laserbatteries",1], ["MineDetector",1], ["FirstAidKit",3], ["O_UavTerminal",1],
 ["srifle_EBR_ARCO_pointer_snds_F",1],["20Rnd_762x51_Mag",7],["arifle_Katiba_ARCO_pointer_snds_F",1],["30Rnd_65x39_caseless_green",7]];
private _backpacksredone = [  ["B_FieldPack_ocamo", 1]];

private _redboxtwo = "I_CargoNet_01_ammo_F"; //get this class ID from requisitions.inc
private _itemsredtwo = [  ["arifle_MX_SW_Black_Hamr_pointer_F",1], ["muzzle_snds_H",1], ["acc_pointer_IR",1], ["optic_Nightstalker",1], ["bipod_02_F_blk",1], ["100Rnd_65x39_caseless_black_mag",7],
 ["launch_B_Titan_F", 1], ["Titan_AA",3], ["U_O_V_Soldier_Viper_hex_F", 1], ["V_TacVest_brn", 1], ["H_HelmetO_ViperSP_hex_F", 1], ["Laserdesignator", 1], ["Laserbatteries",1], ["MineDetector",1], ["FirstAidKit",3], ["O_UavTerminal",1],
 ["LMG_Mk200_MRCO_F",1],["200Rnd_65x39_cased_Box",4],["arifle_SPAR_02_blk_ERCO_Pointer_F",1],["150Rnd_556x45_Drum_Mag_F",5]];
private _backpacksredtwo = [  ["B_FieldPack_ocamo", 1]];

private _redboxthree = "B_CargoNet_01_ammo_F"; //get this class ID from requisitions.inc
private _itemsredthree = [  ["arifle_SDAR_F",1], ["20Rnd_556x45_UW_mag",7], ["NVGoggles_OPFOR",1], 
 ["launch_I_Titan_short_F", 1], ["Titan_AT",2], ["U_B_Wetsuit", 1], ["G_Diving", 1], ["H_HelmetSpecB_blk", 1], ["Laserdesignator", 1], ["Laserbatteries",1], ["MineDetector",1], ["FirstAidKit",3], ["O_UavTerminal",1],
 ["DemoCharge_Remote_Mag",2],["ClaymoreDirectionalMine_Remote_Mag",2], ["SatchelCharge_Remote_Mag",2]];
private _backpacksredthree = [  ["B_FieldPack_ocamo", 1]];

private _redboxfour = "CargoNet_01_box_F"; //get this class ID from requisitions.inc
private _itemsredfour = [  ["srifle_LRR_F",1],["optic_LRPS",1], ["7Rnd_408_Mag",13], ["NVGoggles",1],
  ["U_O_FullGhillie_ard", 1], ["V_PlateCarrierIAGL_dgtl", 1], ["V_RebreatherIR", 1], ["G_Balaclava_blk", 1], ["H_HelmetSpecB_paint1", 1], ["Laserdesignator", 1], ["Laserbatteries",1], ["MineDetector",1], ["FirstAidKit",3], ["O_UavTerminal",1],
   ["srifle_GM6_SOS_F",1],["30Rnd_65x39_caseless_khaki_mag",13],["arifle_SPAR_03_blk_MOS_Pointer_Bipod_F",1],["20Rnd_762x51_Mag",13]];
private _backpacksredfour = [  ["B_FieldPack_ocamo", 1]];

private _redboxfive = "I_supplyCrate_F"; //get this class ID from requisitions.inc
private _itemsredfive = [  ["optic_Nightstalker",1], ["launch_O_Vorona_brown_F", 1],  ["Vorona_HEAT", 3], ["srifle_DMR_02_SOS_F", 1],  ["20Rnd_762x51_Mag", 7], ["MMG_01_hex_ARCO_LP_F", 1],  ["150Rnd_93x64_Mag", 7]
, ["LMG_Zafir_ARCO_F", 1],  ["150Rnd_762x54_Box", 7], ["launch_RPG32_F", 1], ["RPG32_F",3], ["srifle_DMR_01_DMS_snds_BI_F", 1],  ["10Rnd_762x54_Mag", 7]];
private _backpacksredfive = [  ["B_Carryall_ocamo", 1]];

if (isMultiplayer) then {
	_var = (_var splitString "BIS_WL_") # 0;

	private _senderArr = BIS_WL_allWarlords select {getPlayerUID _x == _var};
	if (count _senderArr == 0) exitWith {};

	_sender = _senderArr # 0;
} else {
	_sender = player;
};

_processTargetPos = {
	private _targetPosFinalArr = [];
	private _targetPosFinal = [];
	
	if !(surfaceIsWater _targetPos) then {
		_nearSectorArr = _targetPos nearObjects ["Logic", 10]; 
		
		if (count _nearSectorArr == 0) then {
			_targetPosFinalArr = [_sender, nil, FALSE, _sender] call BIS_fnc_WL2_findSpawnPositions;
		} else {
			_sector = _nearSectorArr # 0;
			_targetPosFinalArr = [_sector, nil, FALSE, if (_sender inArea (_sector getVariable "objectAreaComplete")) then {_sender}] call BIS_fnc_WL2_findSpawnPositions;
		};
	} else {
		_targetPosFinalArr = [_targetPos];
	};

	if (count _targetPosFinalArr > 0) then {
		_targetPosFinal = selectRandom _targetPosFinalArr;
	} else {
		_targetPosFinal = [_targetPos, random 10, random 100] call BIS_fnc_relPos;
	};
	
	[_targetPosFinal, _targetPosFinalArr]
};

_setOwner = {
	params ["_asset", "_sender", ["_isStatic", FALSE]];
	if (_asset isKindOf "Man") exitWith {};
	if (isMultiplayer) then {
		if !(_isStatic) then {
			waitUntil {sleep WL_TIMEOUT_SHORT; {uniform _x == "U_VirtualMan_F"} count crew _asset == 0};
		};
		_i = 0;
		if (count crew _asset > 0 && _isStatic) then {
			_assetGrp = group effectiveCommander _asset;
			while {!(_assetGrp setGroupOwner (owner _sender)) && _i < 50} do {
				_i = _i + 1;
				_assetGrp setGroupOwner (owner _sender);
				sleep WL_TIMEOUT_SHORT;
			};
		};
		_i = 0;
		while {!(_asset setGroupOwner (owner _sender)) && (owner _asset) != (owner _sender) && _i < 50} do {
			_i = _i + 1;
			_asset setGroupOwner (owner _sender);
			sleep WL_TIMEOUT_SHORT;
		};
	};
};

if !(isNull _sender) then {
	switch (_action) do {
		case "respawn": {
			_sender setDamage 1
		};
		case "requestAsset": {
			_params params ["_assetVar", "_className", "_targetPos", "_isStatic", "_disable"];
			private _asset = objNull;
			
			private _isStatic = call compile _isStatic;
			private _disable = call compile _disable;
			
			_targetPos = call compile _targetPos;
			_targetPosFinal = if (_isStatic) then {_targetPos} else {(call _processTargetPos) # 0};
			
			if (_className isKindOf "Ship") then {
				_asset = createVehicle [_className, _targetPosFinal, [], 0, "CAN_COLLIDE"];
				_asset setPos (_targetPosFinal vectorAdd [0,0,3]);
				
			} else {
				if (_className isKindOf "Air") then {
					_isPlane = (toLower getText (configFile >> "CfgVehicles" >> _className >> "simulation")) in ["airplanex", "airplane"] && !(_className isKindOf "VTOL_Base_F");
					if (_isPlane) then {
						private _sector = ((_targetPos nearObjects ["Logic", 10]) select {count (_x getVariable ["BIS_WL_runwaySpawnPosArr", []]) > 0}) # 0;
						private _taxiNodes = _sector getVariable "BIS_WL_runwaySpawnPosArr";
						private _taxiNodesCnt = count _taxiNodes;
						private _spawnPos = [];
						private _dir = 0;
						private _checks = 0;
						while {count _spawnPos == 0 && _checks < 100} do {
							_checks = _checks + 1;
							private _i = (floor random _taxiNodesCnt) max 1;
							private _pointB = _taxiNodes # _i;
							private _pointA = _taxiNodes # (_i - 1);
							_dir = _pointA getDir _pointB;
							private _pos = [_pointA, random (_pointA distance2D _pointB), _dir] call BIS_fnc_relPos;
							if (count (_pos nearObjects ["AllVehicles", 20]) == 0) then {
								_spawnPos = _pos;
							}
						};
						
						if (count _spawnPos == 0) then {
							_spawnPos = _targetPosFinal;
						};
						_asset = createVehicle [_className, _spawnPos, [], 0, "CAN_COLLIDE"];
						_asset setDir _dir;
						if (KORB_AIR_RADAR_ACTIVE == 1) then {
							_asset enableVehicleSensor ["ActiveRadarSensorComponent", false];
							_asset enableVehicleSensor ["PassiveRadarSensorComponent", false];
						};
						if (KORB_JET_IR_ACTIVE == 1) then {
							_asset disableTIEquipment true;
						}; 

						if (KORB_UAV_MAN_SENSOR_ACTIVE == 1) then {
							_asset enableVehicleSensor ["manSensorComponent", false];
						};

						if (getNumber (configFile >> "CfgVehicles" >> _className >> "isUav") == 1 && side _sender == WEST) then {
							createVehicleCrew _asset;
							
							
						};
						if (getNumber (configFile >> "CfgVehicles" >> _className >> "isUav") == 1 && side _sender == EAST) then {
							createVehicleCrew _asset;
							_assetUavGrp = createGroup EAST;
							[driver _asset, gunner _asset] joinSilent _assetUavGrp;
																	
							
						};

						//Wipeout blue dynamic loadout
						if (_className == "B_Plane_CAS_01_dynamicLoadout_F" && side _sender == WEST) then {
							/*
							GIGACHAD code goes here 
							*/
							if (KORB_BONUS_LOADOUT_ACTIVE == 1) then {
								private _pylons = ["PylonRack_1Rnd_Missile_AA_04_F","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_1Rnd_Missile_AGM_02_F","PylonMissile_1Rnd_Bomb_04_F","PylonMissile_1Rnd_Bomb_04_F","PylonMissile_1Rnd_Bomb_04_F","PylonMissile_1Rnd_Bomb_04_F","PylonRack_1Rnd_Missile_AGM_02_F","PylonRack_7Rnd_Rocket_04_AP_F","PylonRack_1Rnd_Missile_AA_04_F"];
								private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _asset >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
								{ _asset removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _asset;
								{ _asset setPylonLoadout [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
							};
							 
						};

						//MQ-4 blue dynamic loadout
						if (_className == "B_UAV_02_dynamicLoadout_F" && side _sender == WEST) then {
							/*
							GIGACHAD code goes here 
							*/
							if (KORB_BONUS_LOADOUT_ACTIVE == 1) then {
								private _pylons = ["PylonMissile_1Rnd_Bomb_04_F","PylonMissile_1Rnd_Bomb_04_F"];
								private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _asset >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
								{ _asset removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _asset;
								{ _asset setPylonLoadout [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
							};
							 
						};
						
						//Neo red dynamic loadout
						if (_className == "O_Plane_CAS_02_dynamicLoadout_F" && side _sender == EAST) then {
							/*
							GIGACHAD code goes here 
							*/
							if (KORB_BONUS_LOADOUT_ACTIVE == 1) then {
								private _pylons = ["PylonRack_1Rnd_Missile_AA_03_F","PylonRack_20Rnd_Rocket_03_HE_F","PylonRack_20Rnd_Rocket_03_AP_F","PylonRack_1Rnd_Missile_AGM_01_F","PylonMissile_1Rnd_Bomb_03_F","PylonMissile_1Rnd_Bomb_03_F","PylonRack_1Rnd_Missile_AGM_01_F","PylonRack_20Rnd_Rocket_03_AP_F","PylonRack_20Rnd_Rocket_03_HE_F","PylonRack_1Rnd_Missile_AA_03_F"];
								private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _asset >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
								{ _asset removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _asset;
								{ _asset setPylonLoadout [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
							};
							 
						};

						//K40 UCAV red dynamic loadout
						if (_className == "O_UAV_02_dynamicLoadout_F" && side _sender == EAST) then {
							/*
							GIGACHAD code goes here 
							*/
							if (KORB_BONUS_LOADOUT_ACTIVE == 1) then {
								private _pylons = ["PylonMissile_1Rnd_Bomb_03_F","PylonMissile_1Rnd_Bomb_03_F"];
								private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _asset >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
								{ _asset removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _asset;
								{ _asset setPylonLoadout [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
							};
							 
						};

						//Buzzard blue dynamic loadout
						if (_className == "I_Plane_Fighter_03_dynamicLoadout_F" && side _sender == WEST) then {
							/*
							GIGACHAD code goes here 
							*/
							if (KORB_BONUS_LOADOUT_ACTIVE == 1) then {
								private _pylons = ["PylonRack_1Rnd_LG_scalpel","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_1Rnd_Missile_AGM_02_F","PylonWeapon_300Rnd_20mm_shells","PylonRack_1Rnd_Missile_AGM_02_F","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_1Rnd_LG_scalpel"];
								private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _asset >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
								{ _asset removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _asset;
								{ _asset setPylonLoadout [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
							};
							 
						};

						//Buzzard red dynamic loadout
						if (_className == "I_Plane_Fighter_03_dynamicLoadout_F" && side _sender == EAST) then {
							/*
							GIGACHAD code goes here 
							*/
							if (KORB_BONUS_LOADOUT_ACTIVE == 1) then {
								private _pylons = ["PylonRack_1Rnd_LG_scalpel","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_1Rnd_Missile_AGM_02_F","PylonWeapon_300Rnd_20mm_shells","PylonRack_1Rnd_Missile_AGM_02_F","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_1Rnd_LG_scalpel"];
								private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _asset >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
								{ _asset removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _asset;
								{ _asset setPylonLoadout [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
							};
							 
						};

						//black wasp stealth blue dynamic loadout
						if (_className == "B_Plane_Fighter_01_Stealth_F" && side _sender == WEST) then {
							/*
							GIGACHAD code goes here 
							*/
							if (KORB_BONUS_LOADOUT_ACTIVE == 1) then {
								private _pylons = ["","","","","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1"];
								private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _asset >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
								{ _asset removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _asset;
								{ _asset setPylonLoadout [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
							};
							 
						};

						//Shirka stealth red dynamic loadout
						if (_className == "O_Plane_Fighter_02_Stealth_F" && side _sender == EAST) then {
							/*
							GIGACHAD code goes here 
							*/
							if (KORB_BONUS_LOADOUT_ACTIVE == 1) then {
								private _pylons = ["","","","","","","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_INT_x1","PylonMissile_Missile_AA_R77_INT_x1","PylonMissile_Missile_AA_R77_INT_x1"];
								private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _asset >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
								{ _asset removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _asset;
								{ _asset setPylonLoadout [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
							};
							 
						};
					} else {
						_asset = createVehicle [_className, _targetPosFinal, [], 0, "FLY"]; 
						_asset setVelocity [0, 0, 0];
						[_asset, _sender, _classname] call BIS_fnc_WL2_sub_assetLanding;
						if (KORB_HELI_IR_ACTIVE == 1) then {
							_asset disableTIEquipment true;
						};
						if (KORB_HELI_RADAR_ACTIVE == 1) then {
							_asset enableVehicleSensor ["ActiveRadarSensorComponent", false];
							_asset enableVehicleSensor ["PassiveRadarSensorComponent", false];
						};
						if (KORB_UAV_MAN_SENSOR_ACTIVE == 1) then {
							_asset enableVehicleSensor ["manSensorComponent", false];
						};
						if (getNumber (configFile >> "CfgVehicles" >> _className >> "isUav") == 1 && side _sender == WEST) then {
							createVehicleCrew _asset;
							"You must unlock UAV via the I menu to fly it" remoteExec ["systemChat"];
							
						};
						if (getNumber (configFile >> "CfgVehicles" >> _className >> "isUav") == 1 && side _sender == EAST) then {
								createVehicleCrew _asset;
								_assetUavGrp = createGroup EAST;
								[driver _asset, gunner _asset] joinSilent _assetUavGrp;
								"You must unlock UAV via the I menu to fly it" remoteExec ["systemChat"];			
								
						};

						//AH-9 blue dynamic loadout loadout
						if (_className == "B_Heli_Light_01_dynamicLoadout_F" && side _sender == WEST) then {
							/*
							GIGACHAD code goes here 
							*/
							if (KORB_BONUS_LOADOUT_ACTIVE == 1) then {
								private _pylons = ["PylonRack_12Rnd_PG_missiles","PylonRack_12Rnd_PG_missiles"];
								private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _asset >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
								{ _asset removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _asset;
								{ _asset setPylonLoadout [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
							};
							 
						};
						
						//AH-99 blue dynamic loadout loadout
						if (_className == "B_Heli_Attack_01_dynamicLoadout_F" && side _sender == WEST) then {
							/*
							GIGACHAD code goes here 
							*/
							if (KORB_BONUS_LOADOUT_ACTIVE == 1) then {
								private _pylons = ["PylonRack_12Rnd_missiles","PylonMissile_1Rnd_AAA_missiles","PylonRack_12Rnd_missiles","PylonRack_12Rnd_missiles","PylonMissile_1Rnd_AAA_missiles","PylonRack_12Rnd_missiles"];
								private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _asset >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
								{ _asset removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _asset;
								{ _asset setPylonLoadout [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
							};
							 
						};

						//Orca red dynamic loadout loadout
						if (_className == "O_Heli_Light_02_dynamicLoadout_F" && side _sender == EAST) then {
							/*
							GIGACHAD code goes here 
							*/
							if (KORB_BONUS_LOADOUT_ACTIVE == 1) then {
								private _pylons = ["PylonRack_12Rnd_missiles","PylonRack_12Rnd_missiles"];
								private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _asset >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
								{ _asset removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _asset;
								{ _asset setPylonLoadout [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
							};
							 
						};

						//Kajmen red dynamic loadout loadout
						if (_className == "O_Heli_Attack_02_dynamicLoadout_F" && side _sender == EAST) then {
							/*
							GIGACHAD code goes here 
							*/
							if (KORB_BONUS_LOADOUT_ACTIVE == 1) then {
								private _pylons = ["PylonRack_19Rnd_Rocket_Skyfire","PylonMissile_1Rnd_Bomb_03_F","PylonMissile_1Rnd_Bomb_03_F","PylonRack_19Rnd_Rocket_Skyfire"];
								private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _asset >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
								{ _asset removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _asset;
								{ _asset setPylonLoadout [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
							};
							 
						};

						//Hellcat blue dynamic loadout loadout
						if (_className == "I_Heli_light_03_dynamicLoadout_F" && side _sender == WEST) then {
							/*
							GIGACHAD code goes here 
							*/
							if (KORB_BONUS_LOADOUT_ACTIVE == 1) then {
								private _pylons = ["PylonRack_12Rnd_PG_missiles","PylonRack_12Rnd_PG_missiles"];
								private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _asset >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
								{ _asset removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _asset;
								{ _asset setPylonLoadout [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
							};
							 
						};

						//Hellcat red dynamic loadout loadout
						if (_className == "I_Heli_light_03_dynamicLoadout_F" && side _sender == EAST) then {
							/*
							GIGACHAD code goes here 
							*/
							if (KORB_BONUS_LOADOUT_ACTIVE == 1) then {
								private _pylons = ["PylonRack_12Rnd_PG_missiles","PylonRack_12Rnd_PG_missiles"];
								private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _asset >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
								{ _asset removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _asset;
								{ _asset setPylonLoadout [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
							};
							 
						};

						//MQ-12 blue dynamic loadout loadout
						if (_className == "B_T_UAV_03_dynamicLoadout_F" && side _sender == WEST) then {
							/*
							GIGACHAD code goes here 
							*/
							if (KORB_BONUS_LOADOUT_ACTIVE == 1) then {
								private _pylons = ["PylonRack_12Rnd_PG_missiles","PylonRack_3Rnd_LG_scalpel","PylonRack_3Rnd_LG_scalpel","PylonRack_12Rnd_PG_missiles"];
								private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _asset >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
								{ _asset removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _asset;
								{ _asset setPylonLoadout [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
							};
							 
						};

						//MQ-12 red dynamic loadout loadout
						if (_className == "B_T_UAV_03_dynamicLoadout_F" && side _sender == EAST) then {
							/*
							GIGACHAD code goes here 
							*/
							if (KORB_BONUS_LOADOUT_ACTIVE == 1) then {
								private _pylons = ["PylonRack_12Rnd_PG_missiles","PylonRack_3Rnd_LG_scalpel","PylonRack_3Rnd_LG_scalpel","PylonRack_12Rnd_PG_missiles"];
								private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _asset >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
								{ _asset removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _asset;
								{ _asset setPylonLoadout [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
							};
							 
						};
					};
				} else {
					if (_isStatic) then {
						_asset = createVehicle [_className, _targetPosFinal, [], 0, "NONE"];
						_targetPos set [2, (_targetPos # 2) max 0];
						_asset setDir direction _sender;
						_asset setPos _targetPosFinal;
						if (_disable) then {
							_asset enableSimulationGlobal FALSE;
							_asset hideObjectGlobal TRUE;
						} else {
							if (getNumber (configFile >> "CfgVehicles" >> _className >> "isUav") == 1 && side _sender == WEST) then {
								createVehicleCrew _asset;
								(effectiveCommander _asset) setSkill 1;
								(group effectiveCommander _asset) deleteGroupWhenEmpty TRUE;
								
							};
							if (getNumber (configFile >> "CfgVehicles" >> _className >> "isUav") == 1 && side _sender == EAST) then {
								createVehicleCrew _asset;
								_assetUavGrp = createGroup EAST;
								[driver _asset, gunner _asset] joinSilent _assetUavGrp;
										
								(effectiveCommander _asset) setSkill 1;
								(group effectiveCommander _asset) deleteGroupWhenEmpty TRUE;
								
							};
						};
						
					};
				};
			};
			
			_asset setVehicleVarName _assetVar;
			missionNamespace setVariable [_assetVar, _asset];
			(owner _sender) publicVariableClient _assetVar;
			
			[_asset, _sender, _isStatic] spawn _setGroupOwner;
		};
		case "requestAssetArray": {
			_params params ["_assetVar", "_infoArray", "_targetPos"];
			private _assets = [];

			_infoArray = call compile _infoArray;
			_targetPos = call compile _targetPos;
			_purchaseList = missionNamespace getVariable format ["BIS_WL_purchasable_%1", side group _sender];
			_classNames = [];
			_assets = [];
			
			{
				if ((_forEachIndex % 2) == 0) then {
					_category = _x;
					_item = _infoArray # (_forEachIndex + 1);
					_classNames pushBack (((_purchaseList # _category) # _item) # 0);
				};
			} forEach _infoArray;
			
			_targetPosArr = (call _processTargetPos) # 1;
			
			{
				_className = _x;
				_isMan = _className isKindOf "Man";
				_targetPosFinal = if (_className isKindOf "Air") then {
					if (count _targetPosArr > 10) then {
						selectRandom _targetPosArr
					} else {
						(call _processTargetPos) # 0
					};
				} else {
					if (_forEachIndex < count _targetPosArr) then {
						_targetPosArr # _forEachIndex;
					} else {
						(call _processTargetPos) # 0;
					};
				};
				
				private _asset = objNull;
				_parachute = createVehicle [if (_isMan) then {"Steerable_Parachute_F"} else {"B_Parachute_02_F"}, _targetPosFinal, [], 0, "FLY"];
				//called in Inf and Vehicle spawning code. Inf = _isMan, Vic = Else 
				if (_isMan) then {
					_asset = (group _sender) createUnit [_className, _targetPosFinal, [], 0, "NONE"];
					_asset assignAsDriver _parachute;
					_asset moveInDriver _parachute;
					[_parachute, _asset] spawn {
						params ["_parachute", "_asset"];
						waitUntil {sleep WL_TIMEOUT_STANDARD; isNull _parachute || isNull _asset};
						if (isNull _asset) then {
							deleteVehicle _parachute;
						};
					}; 
				} else {
							
					_parachute setPos ((position _parachute) vectorAdd [0, 0, KORB_VIC_MIN_HEIGHT + random KORB_VIC_RANDOM_HEIGHT]);
					_asset = createVehicle [_className, _targetPosFinal, [], 0, "NONE"];
					_asset setVariable ["BIS_WL_deployPos", _targetPosFinal];
					_bBox = boundingBoxReal _asset;
					_bBoxCenter = (_bbox # 0) vectorAdd (_bBox # 1);
					_asset attachTo [_parachute, _bBoxCenter];
					_assetDummy = _className createVehicleLocal _targetPosFinal;
					_assetDummy setPos _targetPosFinal;
					_assetDummy hideObject TRUE;
					_assetDummy enableSimulation TRUE;
					if (getNumber (configFile >> "CfgVehicles" >> _className >> "isUav") == 1 && side _sender == WEST) then {
								createVehicleCrew _asset;
								(effectiveCommander _asset) setSkill 1;
								(group effectiveCommander _asset) deleteGroupWhenEmpty TRUE;
								
							};
							if (getNumber (configFile >> "CfgVehicles" >> _className >> "isUav") == 1 && side _sender == EAST) then {
								createVehicleCrew _asset;
								_assetUavGrp = createGroup EAST;
								[driver _asset, gunner _asset] joinSilent _assetUavGrp;
										
								(effectiveCommander _asset) setSkill 1;
								(group effectiveCommander _asset) deleteGroupWhenEmpty TRUE;
								
							};
					if (KORB_TANK_IR_ACTIVE == 1) then {
						_asset disableTIEquipment true;
					};
					//Tank GIGACHAD visual ID code
					//blue mora 
					if (_className == "I_APC_tracked_03_cannon_F" && side _sender == WEST) then {
						if (KORB_VISUAL_ID_ACTIVE == 1) then {
							[
    						_asset,	["EAF_01",1], 
    						["showBags",1,"showBags2",1,"showCamonetHull",0,"showCamonetTurret",0,"showTools",1,"showSLATHull",1,"showSLATTurret",1]
							] call BIS_fnc_initVehicle;
						};
					};

					//Red mora 
					if (_className == "I_APC_tracked_03_cannon_F" && side _sender == EAST) then {
						if (KORB_VISUAL_ID_ACTIVE == 1) then {
							[
    						_asset,	["Indep_01",1], 
    						["showBags",0,"showBags2",1,"showCamonetHull",1,"showCamonetTurret",1,"showTools",0,"showSLATHull",0,"showSLATTurret",0]
							] call BIS_fnc_initVehicle;
						}; 
					};

					//blue gorgan 
					if (_className == "I_APC_Wheeled_03_cannon_F" && side _sender == WEST) then {
						if (KORB_VISUAL_ID_ACTIVE == 1) then {
							[
    						_asset,	 ["Guerilla_03",1], 
    						["showCamonetHull",0,"showBags",0,"showBags2",0,"showTools",0,"showSLATHull",1]
							] call BIS_fnc_initVehicle;
						}; 
					};

					//Red gorgan 
					if (_className == "I_APC_Wheeled_03_cannon_F" && side _sender == EAST) then {
						if (KORB_VISUAL_ID_ACTIVE == 1) then {
							[
    						_asset,	 ["Guerilla_02",1], 
    						["showCamonetHull",1,"showBags",0,"showBags2",0,"showTools",0,"showSLATHull",1]
							] call BIS_fnc_initVehicle;
						}; 
					};

					//Blue Kuma 
					if (_className == "I_MBT_03_cannon_F" && side _sender == WEST) then {
						if (KORB_VISUAL_ID_ACTIVE == 1) then {
							[
    						_asset,	 ["Indep_02",1], 
    						["HideTurret",0,"HideHull",0,"showCamonetHull",1,"showCamonetTurret",1]
							] call BIS_fnc_initVehicle;
						}; 
					};

					//Red Kuma 
					if (_className == "I_MBT_03_cannon_F" && side _sender == EAST) then {
						if (KORB_VISUAL_ID_ACTIVE == 1) then {
							[
    						_asset,	 ["Indep_03",1], 
    						["HideTurret",0,"HideHull",0,"showCamonetHull",1,"showCamonetTurret",1]
							] call BIS_fnc_initVehicle;
						}; 
					};

					//blue nyx recon 
					if (_className == "I_LT_01_scout_F" && side _sender == WEST) then {
						if (KORB_VISUAL_ID_ACTIVE == 1) then {
							[
    						_asset,	 ["Indep_Olive",1], 
    						["showTools",0,"showCamonetHull",0,"showBags",0,"showSLATHull",1]
							] call BIS_fnc_initVehicle;
						}; 
					};

					//Red nyx recon 
					if (_className == "I_LT_01_scout_F" && side _sender == EAST) then {
						if (KORB_VISUAL_ID_ACTIVE == 1) then {
							[
    						_asset,	["Indep_03",1], 
    						["showTools",0,"showCamonetHull",1,"showBags",0,"showSLATHull",1]
							] call BIS_fnc_initVehicle;
						}; 
					};

					//Blue nyx AA 
					if (_className == "I_LT_01_AA_F" && side _sender == WEST) then {
						if (KORB_VISUAL_ID_ACTIVE == 1) then {
							[
    						_asset,	["Indep_Olive",1], 
    						["showTools",0,"showCamonetHull",0,"showBags",0,"showSLATHull",1]
							] call BIS_fnc_initVehicle;
						}; 
					};

					//Red Nyx AA 
					if (_className == "I_LT_01_AA_F" && side _sender == EAST) then {
						if (KORB_VISUAL_ID_ACTIVE == 1) then {
							[
    						_asset,	["Indep_03",1], 
    						["showTools",0,"showCamonetHull",1,"showBags",0,"showSLATHull",1]
							] call BIS_fnc_initVehicle;
						}; 
					};
					//blue T-140K
					if (_className == "O_MBT_04_command_F" && side _sender == WEST) then {
						if (KORB_VISUAL_ID_ACTIVE == 1) then {
							[
    							_asset, ["Grey",1], 
    							["showCamonetHull",0,"showCamonetTurret",0]
							] call BIS_fnc_initVehicle;
						};

						if (KORB_REMOVE_DATALINK_ACTIVE == 1) then {
							_asset setVehicleReportRemoteTargets FALSE; //sending data
							_asset setVehicleReceiveRemoteTargets FALSE; //receive data
							_asset setVehicleReportOwnPosition FALSE;
						}; 
					};

					//Red T-140K
					if (_className == "O_MBT_04_command_F" && side _sender == EAST) then {
						/*if (KORB_VISUAL_ID_ACTIVE == 1) then {
							[
    						_asset,	["Indep_01",1], 
    						["showBags",0,"showBags2",1,"showCamonetHull",1,"showCamonetTurret",1,"showTools",0,"showSLATHull",0,"showSLATTurret",0]
							] call BIS_fnc_initVehicle;
						};*/

						if (KORB_REMOVE_DATALINK_ACTIVE == 1) then {
							_asset setVehicleReportRemoteTargets FALSE; //sending data
							_asset setVehicleReceiveRemoteTargets FALSE; //receive data
							_asset setVehicleReportOwnPosition FALSE;
						}; 
					};

					//blue Rhino
					if (_className == "B_AFV_Wheeled_01_cannon_F" && side _sender == WEST) then {
						/*if (KORB_VISUAL_ID_ACTIVE == 1) then {
							[
    						_asset,	["Indep_01",1], 
    						["showBags",0,"showBags2",1,"showCamonetHull",1,"showCamonetTurret",1,"showTools",0,"showSLATHull",0,"showSLATTurret",0]
							] call BIS_fnc_initVehicle;
						};*/

						if (KORB_REMOVE_DATALINK_ACTIVE == 1) then {
							_asset setVehicleReportRemoteTargets FALSE; //sending data
							_asset setVehicleReceiveRemoteTargets FALSE; //receive data
							_asset setVehicleReportOwnPosition FALSE;
						}; 
					};

					//Blue Rhino UP
					if (_className == "B_AFV_Wheeled_01_up_cannon_F" && side _sender == WEST) then {
						/*if (KORB_VISUAL_ID_ACTIVE == 1) then {
							[
    						_asset,	["Indep_01",1], 
    						["showBags",0,"showBags2",1,"showCamonetHull",1,"showCamonetTurret",1,"showTools",0,"showSLATHull",0,"showSLATTurret",0]
							] call BIS_fnc_initVehicle;
						};*/

						if (KORB_REMOVE_DATALINK_ACTIVE == 1) then {
							_asset setVehicleReportRemoteTargets FALSE; //sending data
							_asset setVehicleReceiveRemoteTargets FALSE; //receive data
							_asset setVehicleReportOwnPosition FALSE;
						}; 
					};

					//Red Rhino UP
					if (_className == "B_AFV_Wheeled_01_up_cannon_F" && side _sender == EAST) then {
						if (KORB_VISUAL_ID_ACTIVE == 1) then {
							[
    						_asset,	 ["Green",1], 
    						["showCamonetHull",1,"showCamonetTurret",1,"showSLATHull",0]
							] call BIS_fnc_initVehicle;
						};

						if (KORB_REMOVE_DATALINK_ACTIVE == 1) then {
							_asset setVehicleReportRemoteTargets FALSE; //sending data
							_asset setVehicleReceiveRemoteTargets FALSE; //receive data
							_asset setVehicleReportOwnPosition FALSE;
						}; 
					};

					//Red Slammer
					if (_className == "B_MBT_01_TUSK_F" && side _sender == EAST) then {
						if (KORB_VISUAL_ID_ACTIVE == 1) then {
							[
    						_asset,	 ["Sand",1], 
    						["showCamonetTurret",1,"showCamonetHull",1,"showBags",0]
							] call BIS_fnc_initVehicle;
						};
					};		
					//custom box code
					if (_className == _blueboxone && side _sender == WEST) then {
						
						clearBackpackCargoGlobal _asset;
						clearMagazineCargoGlobal _asset;
						clearWeaponCargoGlobal _asset;
						clearItemCargoGlobal _asset;

						//create equipment arrays up at top of the script 
						{ _asset addItemCargoGlobal _x } forEach _itemsblueone;  
						{ _asset addBackpackCargoGlobal _x } forEach _backpacksblueone; 
					};

					if (_className == _blueboxtwo && side _sender == WEST) then {
						
						clearBackpackCargoGlobal _asset;
						clearMagazineCargoGlobal _asset;
						clearWeaponCargoGlobal _asset;
						clearItemCargoGlobal _asset;

						//create equipment arrays up at top of the script 
						{ _asset addItemCargoGlobal _x } forEach _itemsbluetwo;  
						{ _asset addBackpackCargoGlobal _x } forEach _backpacksbluetwo; 
					};

					if (_className == _blueboxthree && side _sender == WEST) then {
						
						clearBackpackCargoGlobal _asset;
						clearMagazineCargoGlobal _asset;
						clearWeaponCargoGlobal _asset;
						clearItemCargoGlobal _asset;

						//create equipment arrays up at top of the script 
						{ _asset addItemCargoGlobal _x } forEach _itemsbluethree;  
						{ _asset addBackpackCargoGlobal _x } forEach _backpacksbluethree; 
					};

					if (_className == _blueboxfour && side _sender == WEST) then {
						
						clearBackpackCargoGlobal _asset;
						clearMagazineCargoGlobal _asset;
						clearWeaponCargoGlobal _asset;
						clearItemCargoGlobal _asset;

						//create equipment arrays up at top of the script 
						{ _asset addItemCargoGlobal _x } forEach _itemsbluefour; 
						{ _asset addBackpackCargoGlobal _x } forEach _backpacksbluefour; 
					};

					if (_className == _blueboxfive && side _sender == WEST) then {
						
						clearBackpackCargoGlobal _asset;
						clearMagazineCargoGlobal _asset;
						clearWeaponCargoGlobal _asset;
						clearItemCargoGlobal _asset;

						//create equipment arrays up at top of the script 
						{ _asset addItemCargoGlobal _x } forEach _itemsbluefive; 
						{ _asset addBackpackCargoGlobal _x } forEach _backpacksbluefive; 
					};

					//Red crates
					if (_className == _redboxone && side _sender == EAST) then {
						
						clearBackpackCargoGlobal _asset;
						clearMagazineCargoGlobal _asset;
						clearWeaponCargoGlobal _asset;
						clearItemCargoGlobal _asset;

						//create equipment arrays up at top of the script 
						{ _asset addItemCargoGlobal _x } forEach _itemsredone; 
						{ _asset addBackpackCargoGlobal _x } forEach _backpacksredone; 
					};

						if (_className == _redboxtwo && side _sender == EAST) then {
						
						clearBackpackCargoGlobal _asset;
						clearMagazineCargoGlobal _asset;
						clearWeaponCargoGlobal _asset;
						clearItemCargoGlobal _asset;

						//create equipment arrays up at top of the script 
						{ _asset addItemCargoGlobal _x } forEach _itemsredtwo;  
						{ _asset addBackpackCargoGlobal _x } forEach _backpacksredtwo; 
					};

						if (_className == _redboxthree && side _sender == EAST) then {
						
						clearBackpackCargoGlobal _asset;
						clearMagazineCargoGlobal _asset;
						clearWeaponCargoGlobal _asset;
						clearItemCargoGlobal _asset;

						//create equipment arrays up at top of the script 
						{ _asset addItemCargoGlobal _x } forEach _itemsredthree; 
						{ _asset addBackpackCargoGlobal _x } forEach _backpacksredthree; 
					};

						if (_className == _redboxfour && side _sender == EAST) then {
						
						clearBackpackCargoGlobal _asset;
						clearMagazineCargoGlobal _asset;
						clearWeaponCargoGlobal _asset;
						clearItemCargoGlobal _asset;

						//create equipment arrays up at top of the script 
						{ _asset addItemCargoGlobal _x } forEach _itemsredfour; 
						{ _asset addBackpackCargoGlobal _x } forEach _backpacksredfour; 
					};

						if (_className == _redboxfive && side _sender == EAST) then {
						
						clearBackpackCargoGlobal _asset;
						clearMagazineCargoGlobal _asset;
						clearWeaponCargoGlobal _asset;
						clearItemCargoGlobal _asset;

						//create equipment arrays up at top of the script 
						{ _asset addItemCargoGlobal _x } forEach _itemsredfive; 
						{ _asset addBackpackCargoGlobal _x } forEach _backpacksredfive; 
					};
					[_parachute, _asset, _assetDummy] spawn {
						params ["_parachute", "_asset", "_assetDummy"];
						
						while {alive _parachute && alive _asset && (position _asset) # 2 >= 4} do {
							_parachute setVelocity [0, 0, (velocity _parachute) # 2];
							_parachute setVectorUp [0,0,1];
							sleep 0.25;
						};
						
						deleteVehicle _assetDummy;
						
						if (isNull _asset) then {
							deleteVehicle _parachute;
						} else {
							detach _asset;
							_parachute disableCollisionWith _asset;
							_itemConfig = configFile >> "CfgVehicles" >> typeOf _asset;
							_dropSoundClassArr = getArray (_itemConfig >> "soundBuildingCrash");
							_dropSoundArr = [];
							// this code block waits for the vic to 'land' then repair and refuels it.
							sleep WL_TIMEOUT_MEDIUM;
							_asset setDamage 0;
							_asset setFuel 1;
							
							
							{
								if (_forEachIndex % 2 == 0) then {
									_dropSoundArr pushBack ((getArray (_itemConfig >> _x)) # 0);
								};
							} forEach _dropSoundClassArr;
							
							if (count _dropSoundArr > 0) then {
								_dropSound = selectRandom _dropSoundArr;
								sleep 0.75;
								playSound3D [_dropSound + ".wss", _asset];
							};
						};
					};
				};
				
				_assetVariable = call BIS_fnc_WL2_generateVariableName;
				_asset setVehicleVarName _assetVariable;
				missionNamespace setVariable [_assetVariable, _asset];
				if (isMultiplayer) then {
					[_asset, _assetVariable] remoteExec ["setVehicleVarName", _sender];
				};
				_assets pushBack _asset;
				
				[_asset, _sender] spawn _setGroupOwner;
				
				
			} forEach _classNames;
			
			missionNamespace setVariable [_assetVar, _assets];
			(owner _sender) publicVariableClient _assetVar;
		};
		case "deleteAsset": {
			_params params ["_assetVar"];
			_asset = missionNamespace getVariable [_assetVar, objNull];
			_asset call BIS_fnc_WL2_sub_deleteAsset;
		};
		case "repairAsset": {
			_params params ["_assetVar"];
			_asset = missionNamespace getVariable [_assetVar, objNull];
			_asset setDamage 0;
		};
		case "fundsTransfer": {
			_params params ["_recipient", "_amount"];
			_recipientArr = BIS_WL_allWarlords select {getPlayerUID _x == _recipient};
			_amount = parseNumber _amount;
			if (count _recipientArr > 0) then {
				_recipient = _recipientArr # 0;
				[_sender, -_amount] call BIS_fnc_WL2_fundsControl;
				[_recipient, _amount] call BIS_fnc_WL2_fundsControl;
			};
		};
		case "fastTravel": {
			_params params ["_destination"];
			_destination = parseSimpleArray _destination;
			[_sender, _destination] spawn {
				params ["_sender", "_destination"];
				private _tagAlong = (units group _sender) select {_x distance2D _sender <= WL_FAST_TRAVEL_TEAM_RADIUS && vehicle _x == _x};
				while {_tagAlong findIf {_x distance2D _destination > 50 && alive _x} != -1} do {
					private _toMove = _tagAlong select {_x distance2D _destination > 50 && alive _x};
					{
						[_x, [_destination, [], 2, "NONE"]] remoteExec ["setVehiclePosition", _x];
					} forEach _toMove;
					sleep WL_TIMEOUT_STANDARD;
				};
			};
		};
	};
};

if !(isMultiplayer) then {
	missionNamespace setVariable [_var, ""];
};