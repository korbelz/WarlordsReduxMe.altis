BIS_WL_initModule setVariable ["BIS_WL_combatantsPreset", 0];
BIS_WL_initModule setVariable ["BIS_WL_faction_WEST", "BLU_F"];
BIS_WL_initModule setVariable ["BIS_WL_faction_EAST", "OPF_F"];
BIS_WL_initModule setVariable ["BIS_WL_faction_GUER", "IND_F"];
BIS_WL_initModule setVariable ["BIS_WL_startCP", 200]; // Correct place to change starting CP, defualt value 1000
BIS_WL_initModule setVariable ["BIS_WL_targetVotingDuration", 15];
BIS_WL_initModule setVariable ["BIS_WL_allowAIVoting", FALSE];
BIS_WL_initModule setVariable ["BIS_WL_announcerEnabled", TRUE];
BIS_WL_initModule setVariable ["BIS_WL_musicEnabled", TRUE];
BIS_WL_initModule setVariable ["BIS_WL_initialProgress", 0];
BIS_WL_initModule setVariable ["BIS_WL_fogOfWar", 1];
BIS_WL_initModule setVariable ["BIS_WL_playersAlpha", 50];
BIS_WL_initModule setVariable ["BIS_WL_markersAlpha", 50];
BIS_WL_initModule setVariable ["BIS_WL_requisitionPreset", "['A3ReduxAll']"];
BIS_WL_initModule setVariable ["BIS_WL_scanCost", 350];
BIS_WL_initModule setVariable ["BIS_WL_fastTravelCostOwned", 0];
BIS_WL_initModule setVariable ["BIS_WL_fastTravelCostContested", 25]; //Cost of fast travel to contested sector
BIS_WL_initModule setVariable ["BIS_WL_fundsTransferCost", 4000];  //default 1000; 
BIS_WL_initModule setVariable ["BIS_WL_targetResetCost", 1200]; //default value 2000; lowered to 1200 for official servers
BIS_WL_initModule setVariable ["BIS_WL_scanEnabled", TRUE];
BIS_WL_initModule setVariable ["BIS_WL_fastTravelEnabled", 1];
BIS_WL_initModule setVariable ["BIS_WL_maxCP", 38069];
BIS_WL_initModule setVariable ["BIS_WL_dropCost", 2];
BIS_WL_initModule setVariable ["BIS_WL_dropCost_far", 3000];
BIS_WL_initModule setVariable ["BIS_WL_autonomous_limit", 2];
BIS_WL_initModule setVariable ["BIS_WL_arsenalEnabled", FALSE];
BIS_WL_initModule setVariable ["BIS_WL_arsenalCost", 1000];
BIS_WL_initModule setVariable ["BIS_WL_maxSubordinates", 2]; //default value 8; check WL2_changeSectorOwnership file and make sure it matches this value
BIS_WL_initModule setVariable ["BIS_WL_assetLimit", 4]; //default 10; 4 is likely the min number possible here without restricting gameplay. 
BIS_WL_initModule setVariable ["BIS_WL_targetResetTimeout", 300];
BIS_WL_initModule setVariable ["BIS_WL_baseValue", 50]; //this changes money from main base ie starter CP/Min, default value 10
BIS_WL_initModule setVariable ["BIS_WL_baseDistanceMin", 13]; //default value 5; Use _tolerance value in combo with baseDistanceMin to add randomness to base distances
BIS_WL_initModule setVariable ["BIS_WL_baseDistanceMax", -1]; //default value -1 
BIS_WL_initModule setVariable ["BIS_WL_scanCooldown", 90];
BIS_WL_initModule setVariable ["BIS_WL_lastLoadoutCost", 500];
BIS_WL_initModule setVariable ["BIS_WL_wreckRemovalTimeout", 30];
BIS_WL_initModule setVariable ["BIS_WL_corpseRemovalTimeout", 600];
BIS_WL_initModule setVariable ["BIS_WL_savedLoadoutCost", 600];
BIS_WL_initModule setVariable ["BIS_WL_timeMultiplier", 6];
BIS_WL_initModule setVariable ["BIS_WL_zoneRestrictionSetting", 0]; //default value 0
BIS_WL_initModule setVariable ["BIS_WL_savingEnabled", FALSE];

{
	_x setVariable ["objectArea", triggerArea ((_x nearObjects ["EmptyDetector", 100]) # 0)];
	if (isNil {_x getVariable "BIS_WL_services"}) then {
		_x setVariable ["BIS_WL_services", []];
	};
	if (isNil {_x getVariable "BIS_WL_canBeBase"}) then {
		_x setVariable ["BIS_WL_canBeBase", TRUE];
	};
	_x setVariable ["BIS_WL_fastTravelEnabled", TRUE];
} forEach BIS_WL_allSectors;

{_x enableSimulation FALSE} forEach allMissionObjects "EmptyDetector";