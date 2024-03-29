#define WL_RESPAWN_MARKERS_CNT 20
#define WL_ZONE_RESTRICTION_KILL_TIMEOUT_INFANTRY 2
#define WL_ZONE_RESTRICTION_KILL_TIMEOUT_VEHICLES 2
#define WL_ZONE_RESTRICTION_KILL_TIMEOUT_AIRCRAFT 2
#define WL_MAX_SEIZING_HEIGHT 38 //this is AGL, default value 150, actual cap height = this/2-ish. 50 gives a cap height of 35?
#define WL_TIMEOUT_MIN 0.055 //25, 
#define WL_TIMEOUT_SHORT 0.25
#define WL_TIMEOUT_MEDIUM 0.5
#define WL_TIMEOUT_STANDARD 1
#define WL_TIMEOUT_LONG 5
#define WL_TIMEOUT_MAX 30
#define WL_CONNECTING_LINE_AXIS 20
#define WL_CONNECTING_LINE_ALPHA_MIN 0.2
#define WL_CONNECTING_LINE_ALPHA_MAX 0.5
#define WL_MAP_PULSE_FREQ 1
#define WL_MAP_PULSE_ICON_SIZE 1.5
#define WL_BASE_ICON_SIZE 1.5
#define WL_ANNOUNCER_PAUSE 0.5
#define WL_SECTOR_CAPTURE_REWARD_MULTIPLIER 60 //default value 10; this reward only works for green sectors
#define WL_SECTOR_PAYOFF_PERIOD 80 //time in seconds 
#define WL_SPAWN_GRID_SIZE 40 //default value 40
#define WL_PLAYER_ICON_RANGE 75
#define WL_BASE_DANGER_SPAWN_RANGE 200
#define WL_ID_SELECTION_NONE 0
#define WL_ID_SELECTION_VOTING 1
#define WL_ID_SELECTION_VOTED 2
#define WL_ID_SELECTION_FAST_TRAVEL 3
#define WL_ID_SELECTION_ORDERING_NAVAL 4
#define WL_ID_SELECTION_ORDERING_AIRCRAFT 5
#define WL_ID_SELECTION_ORDERING_AIRDROP 6
#define WL_ID_SELECTION_SCAN 7
#define WL_ID_SELECTION_FAST_TRAVEL_CONTESTED 8
#define WL_ID_SELECTION_DEPLOYING_DEFENCE 9
#define WL_SEIZING_TIMEOUT_MIN 15
#define WL_SEIZING_TIMEOUT_MAX 90
#define WL_FAST_TRAVEL_OFFSET 100
#define WL_FAST_TRAVEL_RANGE_AXIS 50
#define WL_FAST_TRAVEL_TEAM_RADIUS 200
#define WL_TARGET_RESET_ZONE_RESTRICTION_TOLERANCE 30
#define WL_SCAN_DURATION 30
#define WL_MAP_FONT_SIZE 0.0375
#define WL_SCENE_FONT_SIZE 0.03
#define WL_ASSET_REMOVAL_SAFEZONE 0 //100
#define WL_RESPAWN_PROTECTION_DURATION 240
#define WL_ASSET_PROTECTION_DURATION 240
#define WL_ASSET_SCENE_ICON_DURATION 90
#define WL_FRIENDLY_FIRE_RECORD_DURATION 1200
#define WL_FRIENDLY_FIRE_THRESHOLD 2
#define WL_FRIENDLY_FIRE_PENALTY 180
#define WL_FRIENDLY_FIRE_PENALTY_MAX 600
#define WL_MAINTENANCE_RADIUS 50
#define WL_MAINTENANCE_COOLDOWN_REPAIR 900  //300
#define WL_MAINTENANCE_COOLDOWN_REARM 900   // 300; standard setting 1080
#define WL_MAINTENANCE_COOLDOWN_REARM_Helicopter 600 //not in .57 
#define WL_MAINTENANCE_COOLDOWN_REARM_Jets 1200  //not in .57
#define WL_MAINTENANCE_COOLDOWN_REARM_Artillery 1800 //not in .57
#define WL_LOSING_SECTOR_WARN_FREQ 30
#define WL_MUSIC_VOLUME 0.1
#define WL_GARRISON_GROUP_SIZE_MIN 3
#define WL_GARRISON_GROUP_SIZE_MAX 4
#define WL_ASSET_IRRELEVANT_RANGE 1000
#define WL_TARGET_RESET_VOTING_TIME 60
#define KORB_KILL_REWARD_MOD 4000  //Original value 10,000; lower value equals higher kill rewards
#define KORB_GARRISON_SIZE_MOD 2  //Original value 2; adjust this to increase total INF spawning in an AI sector. 
#define KORB_MINECOUNT_DELETE_THRESHOLD 200 //Original value 400; Total # of mines allowed on server anymore will be delete when any sector is capped
#define KORB_UAVCOUNT_DELETE_THRESHOLD 24 //Original value 50;
#define KORB_VIC_MIN_HEIGHT -85  //default is roughly 100 AGL, -90 = roughly 10 meters AGL. 0 = roughly 100 AGL
#define KORB_VIC_RANDOM_HEIGHT 70  //Bell curve model, 125 = avg of 75 height + Min Height value. Game deafults to roughly 135 AGL
#define KORB_VIC_RANDOM_AI_SPAWNS 4  //Random number of AI vics that can spawn in a zone 0 to <value given>; default 4
#define KORB_AIR_RANDOM_AI_SPAWNS 4  //Random number of AI Air that can spawn in a zone 0 to <value given>; default 4
#define KORB_NAVY_RANDOM_AI_SPAWNS 4  //Random number of AI Navy that can spawn in a zone 0 to <value given>; default 4
#define KORB_DIVER_RANDOM_AI_SPAWNS 4  //Random number of AI Divers that can spawn in a zone 0 to <value given>; default 4
#define KORB_TEAM_BALANCE_SPLIT 3  //Number of player split between teams before CP adjustments; default 3
#define KORB_BASE_VALUE_ADJUSTMENT 10000  //default 10,000; Lower number equals more CP value for a sector; see also WL_SECTOR_CAPTURE_REWARD_MULTIPLIER
#define KORB_AIR_RADAR_ACTIVE 1  //default 1; 1 = radar off, datalink only; 2 = radar active + datalink
#define KORB_JET_IR_ACTIVE 1  //default 1; 1 = IR off; 2 = IR active
#define KORB_HELI_RADAR_ACTIVE 1  //default 1; 1 = radar off, datalink only; 2 = radar active + datalink
#define KORB_HELI_IR_ACTIVE 1  //default 1; 1 = IR off; 2 = IR active
#define KORB_TANK_IR_ACTIVE 1  //default 1; 1 = IR off; 2 = IR active
#define KORB_UAV_MAN_SENSOR_ACTIVE 1  //default 1; 1 = UAV will NOT report/datalink players; 2 = UAV will report/datalink players
#define KORB_INDY_BOATS_ACTIVE 1  //default 1; 1 = INDY boats will spawn; 2 = Indy boats will not spawn
#define KORB_INDY_DIVERS_ACTIVE 1  //default 1; 1 = INDY Divers will spawn; 2 = Indy Divers will not spawn
#define KORB_CUSTOM_SECTOR_NAMES 1  //default 1; 1 = Sectors will have custom names; 2 = Sectors will have no custom names
#define KORB_DISABLE_TEAM_SWITCHING 1  //default 1; 1 = Team switching disabled; 2 = Team switching enabled
#define KORB_EAST_WEST_TANKAIR_DEFENDERS 1  //default 1; 1 = Tanks and aircraft will spawn at Bluefor/OPFOR zones; 2 = Tanks and aircraft will NOT spawn at Bluefor/OPFOR zones
#define KORB_HIGH_LOW_PLAYER_COUNT 60  //default 60; This is the number of players at which the dynamic AI buddy system swaps from high AI count to low AI count.
#define KORB_LOW_AI_BUDDY_COUNT 1  //default 1; number of friendly AI player can have during high player count
#define KORB_HIGH_AI_BUDDY_COUNT 2  //default 2; number of friendly AI player can have during low player count
#define KORB_TRANSITION_ALT 4000  //default 4000; AGL altitude. Aircraft above this height will not be effected by zone restrictions around sectors
#define KORB_BONUS_LOADOUT_ACTIVE 1  //default 1; 1 = Bonus loadouts on; 2 = No bonus loadouts
#define KORB_VISUAL_ID_ACTIVE 1  //default 1; 1 = GIGACHAD visual ID system on; 2 = No GIGACHAD visual ID system
#define KORB_REMOVE_DATALINK_ACTIVE 1  //default 1; 1 = Removed Datalink; 2 = Datalinks work normally

#define WL_SYNCED_TIME (call BIS_fnc_WL2_syncedTime)
#define WL_TARGET_FRIENDLY (missionNamespace getVariable format ["BIS_WL_currentTarget_%1", BIS_WL_playerSide])
#define WL_TARGET_ENEMY (missionNamespace getVariable format ["BIS_WL_currentTarget_%1", BIS_WL_enemySide])
#define WL_CONTROL_MAP (uiNamespace getVariable ["BIS_WL_mapControl", controlNull])
#define WL_DISPLAY_MAIN (findDisplay 46)
#define WL_PLAYER_FUNDS (player getVariable ["BIS_WL_funds", -1])
#define WL_PLAYER_REQUISITION_LIST (missionNamespace getVariable format ["BIS_WL_purchasable_%1", BIS_WL_playerSide])
#define WL_REQUISITION_CATEGORIES ["Infantry", "Vehicles", "Aircraft", "Naval", "Defences", "Gear", "Strategy"]
#define WL_PLAYER_VEHS (missionNamespace getVariable [format ["BIS_WL_%1_ownedVehicles", getPlayerUID player], []])
#define WL_BASES [BIS_WL_base1, BIS_WL_base2]