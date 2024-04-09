class CfgWLRequisitionPresets
{
	class A3ReduxAll
	{
		class WEST
		{
			class Infantry
			{
				class B_Soldier_F							{cost = 100;	requirements[]={};	};	// "Rifleman"
				class B_crew_F								{cost = 100;	requirements[]={};	};	// "Crewman"
				class B_Helipilot_F							{cost = 100;	requirements[]={};	};	// "Helicopter Pilot"
				class B_Pilot_F								{cost = 100;	requirements[]={};	};	// "Pilot"
				class B_Soldier_GL_F						{cost = 125;	requirements[]={};	};	// "Grenadier"
				class B_medic_F								{cost = 125;	requirements[]={};	};	// "Combat Life Saver"
				class B_soldier_AR_F						{cost = 150;	requirements[]={};	};	// "Autorifleman"
				class B_Soldier_A_F							{cost = 150;	requirements[]={};	};	// "Ammo Bearer"
				class B_soldier_M_F							{cost = 150;	requirements[]={};	};	// "Marksman"
				class B_soldier_repair_F					{cost = 200;	requirements[]={};	};	// "Repair Specialist"
				class B_HeavyGunner_F						{cost = 200;	requirements[]={};	};	// "Heavy Gunner"
				class B_soldier_LAT_F						{cost = 250;	requirements[]={};	};	// "Rifleman (AT)"
				class B_soldier_LAT2_F						{cost = 300;	requirements[]={};	};	// "Rifleman (Light AT)"
				class B_soldier_AT_F						{cost = 300;	requirements[]={};	};	// "Missile Specialist (AT)"
				class B_soldier_AA_F						{cost = 300;	requirements[]={};	};	// "Missile Specialist (AA)"
				class B_Sharpshooter_F						{cost = 300;	requirements[]={};	};	// "Sharpshooter"
				class B_sniper_F							{cost = 300;	requirements[]={};	};	// "Sniper"
				class B_soldier_exp_F							{cost = 300;	requirements[]={};	};	// "Explosive Specialist"
				class B_diver_F							{cost = 300;	requirements[]={};	};	// "diver"
				class B_CTRG_Miller_F							{cost = 1000;	requirements[]={};	};	// "Miller"
				class B_Captain_Dwarden_F					{cost = 1000;	requirements[]={};	};	// "Dwarden"
			};
			class Vehicles
			{
				
				class C_Tractor_01_F						{cost = 200;	requirements[]={};	};	// "Sexy Tractor"
				class B_Truck_01_transport_F				{cost = 700;	requirements[]={};	};	// "HEMTT Transport"
				class B_Truck_01_fuel_F						{cost = 700;	requirements[]={};	};	// "HEMTT Fuel"
				class B_Truck_01_medical_F					{cost = 700;	requirements[]={};	};	// "HEMTT Medical"
				class I_E_Van_02_medevac_F					{cost = 700;	requirements[]={};	};	// "Ambulance"
				class B_G_Offroad_01_armed_F				{cost = 1200;	requirements[]={};	};	// "Offroad (HMG)"
				class B_G_Offroad_01_AT_F					{cost = 1500;	requirements[]={};	};	// "Offroad (AT)"
				class I_LT_01_AA_F							{cost = 2500;	requirements[]={};	};	// "AWC 302 Nyx (AA)"
				class I_LT_01_scout_F						{cost = 1000;	requirements[]={};	};	// "AWC 303 Nyx (Recon)"
				class B_Truck_01_Repair_F					{cost = 2000;	requirements[]={};	};	// "HEMTT Repair"
				class B_Truck_01_ammo_F						{cost = 3000;	requirements[]={};	};	// "HEMTT Ammo"
				class B_APC_Wheeled_03_cannon_F				{cost = 3500;	requirements[]={"G"};	};	// "AFV-4 Gorgon"
				class B_APC_Wheeled_01_cannon_F				{cost = 3000;	requirements[]={"B"};	};	// "AMV-7 Marshall"
				class I_APC_tracked_03_cannon_F				{cost = 3000;	requirements[]={"G"};	};	// "Mora"
				class B_APC_Tracked_01_rcws_F				{cost = 3000;	requirements[]={"B"};	};	// "IFV-6c Panther"
				class B_APC_Tracked_01_AA_F					{cost = 3000;	requirements[]={"B"};	};	// "IFV-6a Cheetah"
				class B_MBT_01_cannon_F						{cost = 6000;	requirements[]={"B"};	};	// "M2A1 Slammer"
				class B_MBT_01_TUSK_F						{cost = 6500;	requirements[]={"B"};	};	// "M2A1 Slammer UP"
				class I_MBT_03_cannon_F						{cost = 6000;	requirements[]={"G"};	};	// "Kuma"
				class O_MBT_04_command_F					{cost = 8000;	requirements[]={"T"};	};	// "T-140K Angara"
				class B_AFV_Wheeled_01_cannon_F				{cost = 4500;	requirements[]={"M"};	};	// "Rhino MGS"
				class B_AFV_Wheeled_01_up_cannon_F			{cost = 5500;	requirements[]={"M"};	};	// "Rhino MGS UP" 
				class B_MBT_01_arty_F						{cost = 28000;	requirements[]={"F"};	};	// "M4 Scorcher" 
				class I_Truck_02_MRL_F						{cost = 32000;	requirements[]={"E"};	};	// "Zamak MRL"
				class B_SAM_System_03_F						{cost = 8000;	requirements[]={};	offset[]={0, 5.3, 0};};	// "MIM-145 Defender"
				class B_Radar_System_01_F					{cost = 5000;	requirements[]={};	offset[]={0, 5.3, 0};};	// "AN/MPQ-105 Radar"
				class B_Mortar_01_F							{cost = 11000;	requirements[]={"M"}; offset[]={0, 3, 0};};	// "Mortar"
				class B_UGV_01_rcws_F						{cost = 6500;	requirements[]={}; offset[]={0, 4, 0};};	// "UGAS" 
				class B_AAA_System_01_F						{cost = 8000;	requirements[]={"S"};	offset[]={0, 3, 0.8};};	// "Phalax"; 
				class B_Ship_Gun_01_F						{cost = 28000;	requirements[]={"S"};	offset[]={0, 6, 0.8};};	// "Ship gun"
				class B_Ship_MRLS_01_F						{cost = 38000;	requirements[]={"S"};	offset[]={0, 6, 0.8};};	// "mk 41 VLS"
				class B_SAM_System_01_F						{cost = 8000;	requirements[]={"S"}; offset[]={0, 3, 0.8}; };	// "Mk49 Spartan"; 
				class B_SAM_System_02_F						{cost = 8000;	requirements[]={"S"}; offset[]={0, 3, 0.8}; };	// "Mk21 Centurion"; 
				 
				 
			};
			class Aircraft
			{
				class B_Heli_Light_01_F						{cost = 1000;	requirements[]={"H"};	};	// "MH-9 Hummingbird"
				class I_C_Heli_Light_01_civil_F				{cost = 1000;	requirements[]={"H"};	};	// "M-900"
				class I_Heli_Transport_02_F					{cost = 1200;	requirements[]={"H"};	};	// "Mohawk"
				class I_Heli_light_03_unarmed_F				{cost = 1200;	requirements[]={"H"};	};	// "hellcat unarmed"
				class B_Heli_Light_01_armed_F				{cost = 2500;	requirements[]={"H"};	};	// "AH-9 Pawnee"
				class B_Heli_Light_01_dynamicLoadout_F		{cost = 2700;	requirements[]={"H"};	};	// "AH-9 Pawnee"
				class B_Heli_Transport_01_F					{cost = 1500;	requirements[]={"H"};	};	// "UH-80 Ghost Hawk"
				class B_Heli_Transport_03_F					{cost = 1500;	requirements[]={"H"};	};	// "CH-67 Huron"
				class B_Heli_Attack_01_F					{cost = 6000;	requirements[]={"H"};	};	// "AH-99 Blackfoot"
				class B_Heli_Attack_01_dynamicLoadout_F		{cost = 7000;	requirements[]={"H"};	};	// "AH-99 Blackfoot"
				class I_Heli_light_03_F						{cost = 2500;	requirements[]={"H"};	};	// "Hellcat"
				class I_Heli_light_03_dynamicLoadout_F		{cost = 2700;	requirements[]={"H"};	};	// "Hellcat"
				class B_T_VTOL_01_infantry_F				{cost = 2500;	requirements[]={"H"};	};	// "V-44 X Blackfish(Inf)";
				class B_T_VTOL_01_vehicle_F					{cost = 4500;	requirements[]={"H"};	};	// "V-44 X Blackfish(Vic)";
				class B_T_VTOL_01_armed_F					{cost = 6500;	requirements[]={"H"};	};	// "V-44 X Blackfish (Armed)"
				class B_Plane_CAS_01_F						{cost = 7000;	requirements[]={"A"};	};	// "A-164 Wipeout (CAS)"
				class B_Plane_CAS_01_dynamicLoadout_F		{cost = 6800;	requirements[]={"A"};	};	// "A-164 Wipeout (CAS)"
				class B_Plane_Fighter_01_F					{cost = 9000;	requirements[]={"A"};	};	// "F/A-181 Black Wasp II";
				class B_Plane_Fighter_01_Stealth_F			{cost = 8000;	requirements[]={"A"};	};	// "F/A-181 Black Wasp II Stealth";
				class O_Plane_Fighter_02_F					{cost = 10000;	requirements[]={"A"};	};	// "To-201 Shikra"
				class O_T_VTOL_02_infantry_dynamicLoadout_F	{cost = 9000;	requirements[]={"H"};	};	// "Y-32 Xi'an (Infantry Transport)"
				class I_Plane_Fighter_04_F					{cost = 9000;	requirements[]={"A"};	};	// "A-149 Gryphon";
				class I_Plane_Fighter_03_CAS_F				{cost = 7000;	requirements[]={"A"};	};	// "A-143 Buzzard";
				class I_Plane_Fighter_03_dynamicLoadout_F	{cost = 6800;	requirements[]={"A"};	};	// "A-143 Buzzard custom";
				class I_C_Plane_Civil_01_F					{cost = 1000;	requirements[]={"A"};	};	// "Caesar BTT";
				class B_T_UAV_03_F							{cost = 8000;	requirements[]={"H"}; offset[]={0, 6, 0};};	// "Firescout";
				class B_T_UAV_03_dynamicLoadout_F			{cost = 8200;	requirements[]={"H"}; offset[]={0, 6, 0};};	// "Firescout";
				class B_UAV_02_F							{cost = 8000;	requirements[]={"A"}; offset[]={0, 6, 0};};	// "greyhawk AT";
				class B_UAV_02_CAS_F						{cost = 8000;	requirements[]={"A"}; offset[]={0, 6, 0};};	// "greyhawk LGB";
				class B_UAV_02_dynamicLoadout_F				{cost = 8200;	requirements[]={"A"}; offset[]={0, 6, 0};};	// "greyhawk Custom";
				class B_UAV_05_F							{cost = 8000;	requirements[]={"A"}; offset[]={0, 6, 0};};	// "UCAV";
				class B_UAV_01_F							{cost = 2000;	requirements[]={"H"};	};	// "AR-2 Darter";
				class B_UAV_06_F							{cost = 2000;	requirements[]={"H"};	};	// "AL-6 Pelican";
				class B_UAV_06_medical_F					{cost = 2000;	requirements[]={"H"};	};	// "AL-6 Pelican medical";
				class B_T_VTOL_01_infantry_olive_F			{cost = 1400;	requirements[]={"H"};	};	// "KV-44 Blackfish tanker";
				 
				
			};
			class Naval
			{
				class B_Boat_Transport_01_F					{cost = 100;	requirements[]={"W"};	};	// "Assault Boat"
				class I_C_Boat_Transport_02_F				{cost = 300;	requirements[]={"W"};	};	// "RHIB"
				class B_Boat_Armed_01_minigun_F				{cost = 750;	requirements[]={"W"};	};	// "Speedboat Minigun"
				class B_SDV_01_F							{cost = 900;	requirements[]={"W"};	};	// "SDV"
			};
			class Gear
			{
				//class Box_NATO_Ammo_F						{cost = 200;	requirements[]={};	};	// "Basic Ammo [NATO]"
				//class Box_NATO_Grenades_F					{cost = 200;	requirements[]={};	};	// "Grenades [NATO]"
				//class Box_NATO_Wps_F						{cost = 250;	requirements[]={};	};	// "Basic Weapons [NATO]"
				//class Box_NATO_WpsLaunch_F				{cost = 300;	requirements[]={};	};	// "Launchers [NATO]"
				//class Box_NATO_WpsSpecial_F				{cost = 500;	requirements[]={};	};	// "Special Weapons [NATO]"
				//class B_supplyCrate_F						{cost = 500;	requirements[]={};	};	// "Supply Box [NATO]"
				class Box_NATO_AmmoVeh_F					{cost = 500;	requirements[]={};	};	// "Vehicle Ammo [NATO]"
				class B_Slingload_01_Ammo_F					{cost = 500;	requirements[]={};	};	// "Huron Ammo Container"
				class B_Slingload_01_Cargo_F				{cost = 500;	requirements[]={};	};	// "Huron Cargo Container"
				class B_Slingload_01_Fuel_F					{cost = 500;	requirements[]={};	};	// "Huron Fuel Container"
				class B_Slingload_01_Medevac_F				{cost = 500;	requirements[]={};	};	// "Huron Medical Container"
				class B_Slingload_01_Repair_F				{cost = 500;	requirements[]={};	};	// "Huron Repair Container"
				class O_CargoNet_01_ammo_F					{cost = 1869;		requirements[]={};	};	// "Custom box blue one"
				class I_CargoNet_01_ammo_F					{cost = 1870;		requirements[]={};	};	// "Custom box blue two"
				class B_CargoNet_01_ammo_F					{cost = 1871;		requirements[]={};	};	// "Custom box blue three"
				class CargoNet_01_box_F						{cost = 1872;		requirements[]={};	};	// "Custom box blue four"
				class I_supplyCrate_F						{cost = 1873;		requirements[]={};	};	// "Custom box blue five"
				
				
			};
			class Defences
			{
				//class B_HMG_01_F							{cost = 750;	requirements[]={};	};	// "Mk30 HMG .50"
				//class B_HMG_01_high_F						{cost = 750;	requirements[]={};	};	// "Mk30 HMG .50 (Raised)"
				class B_GMG_01_F							{cost = 60000;	requirements[]={};	};	// "Mk32 GMG 20 mm"
				//class B_GMG_01_high_F						{cost = 750;	requirements[]={};	};	// "Mk32 GMG 20 mm (Raised)"
				//class B_static_AA_F							{cost = 800;	requirements[]={};	};	// "Static Titan Launcher (AA) [NATO]"
				//class B_static_AT_F							{cost = 800;	requirements[]={};	};	// "Static Titan Launcher (AT) [NATO]"
				//class B_SAM_System_03_F						{cost = 8000;	requirements[]={};	offset[]={0, 5.3, 0};};	// "MIM-145 Defender"
				//class B_Radar_System_01_F					{cost = 5000;	requirements[]={};	offset[]={0, 5.3, 0};};	// "AN/MPQ-105 Radar"
				//class B_Mortar_01_F							{cost = 11000;	requirements[]={"M"}; offset[]={0, 3, 0};};	// "Mortar"
				//class B_UGV_01_rcws_F						{cost = 8500;	requirements[]={}; offset[]={0, 4, 0};};	// "UGAS" 
				//class B_UGV_02_Demining_F					{cost = 4500;	requirements[]={};	};	// "UGAS demining"
				//class B_UAV_05_F							{cost = 8000;	requirements[]={"A"}; offset[]={0, 6, 0};};	// "UCAV";
				//class B_UAV_01_F							{cost = 500;	requirements[]={};	};	// "AR-2 Darter";
				//class B_UAV_06_F							{cost = 500;	requirements[]={};	};	// "AL-6 Pelican";
				//class B_UAV_06_medical_F					{cost = 500;	requirements[]={};	};	// "AL-6 Pelican medical";
				//class B_AAA_System_01_F						{cost = 8000;	requirements[]={};	offset[]={0, 3, 0.8};};	// "Phalax"; 
				//class B_Ship_Gun_01_F						{cost = 24000;	requirements[]={};	offset[]={0, 6, 0.8};};	// "Ship gun"
				//class B_Ship_MRLS_01_F						{cost = 38000;	requirements[]={};	offset[]={0, 6, 0.8};};	// "mk 41 VLS"
				//class B_SAM_System_01_F						{cost = 8000;	requirements[]={}; offset[]={0, 3, 0.8}; };	// "Mk49 Spartan"; 
				//class B_SAM_System_02_F						{cost = 8000;	requirements[]={}; offset[]={0, 3, 0.8}; };	// "Mk21 Centurion"; 
				
			};
		};
		class EAST
		{
			class Infantry
			{
				class O_Soldier_F							{cost = 100;	requirements[]={};	};	// "Rifleman"
				class O_crew_F								{cost = 100;	requirements[]={};	};	// "Crewman"
				class O_Helipilot_F							{cost = 100;	requirements[]={};	};	// "Helicopter Pilot"
				class O_Pilot_F								{cost = 100;	requirements[]={};	};	// "Pilot"
				class O_Soldier_GL_F						{cost = 125;	requirements[]={};	};	// "Grenadier"
				class O_medic_F								{cost = 125;	requirements[]={};	};	// "Combat Life Saver"
				class O_soldier_AR_F						{cost = 150;	requirements[]={};	};	// "Autorifleman"
				class O_Soldier_A_F							{cost = 150;	requirements[]={};	};	// "Ammo Bearer"
				class O_soldier_M_F							{cost = 150;	requirements[]={};	};	// "Marksman"
				class O_soldier_repair_F					{cost = 200;	requirements[]={};	};	// "Repair Specialist"
				class O_HeavyGunner_F						{cost = 200;	requirements[]={};	};	// "Heavy Gunner"
				class O_soldier_LAT_F						{cost = 250;	requirements[]={};	};	// "Rifleman (AT)"
				class O_soldier_AT_F						{cost = 300;	requirements[]={};	};	// "Missile Specialist (AT)"
				class O_Soldier_AA_F						{cost = 300;	requirements[]={};	};	// "Missile Specialist (AA)"
				class O_Sharpshooter_F						{cost = 300;	requirements[]={};	};	// "Sharpshooter"
				class O_sniper_F							{cost = 300;	requirements[]={};	};	// "Sniper"
				class O_soldier_exp_F							{cost = 300;	requirements[]={};	};	// "Explosive Specialist"
				class O_diver_F							{cost = 300;	requirements[]={};	};	// "diver"
				class O_soldier_HAT_F						{cost = 350;	requirements[]={};	};	// "Rifleman (Heavy AT)"
			};
			class Vehicles
			{
				
				class C_Tractor_01_F						{cost = 200;	requirements[]={};	};	// "Sexy Tractor"
				class O_Truck_03_transport_F				{cost = 700;	requirements[]={};	};	// "Tempest Transport"
				class O_Truck_03_Fuel_F						{cost = 700;	requirements[]={};	};	// "Tempest Fuel"
				class O_Truck_03_medical_F					{cost = 700;	requirements[]={};	};	// "Tempest Medical"
				class I_E_Van_02_medevac_F					{cost = 700;	requirements[]={};	};	// "Ambulance"
				class O_G_Offroad_01_armed_F				{cost = 1200;	requirements[]={};	};	// "Offroad (HMG)"
				class O_G_Offroad_01_AT_F					{cost = 1500;	requirements[]={};	};	// "Offroad (AT)"
				class I_LT_01_AA_F							{cost = 2500;	requirements[]={};	};	// "AWC 302 Nyx (AA)"
				class I_LT_01_scout_F						{cost = 1000;	requirements[]={};	};	// "AWC 303 Nyx (Recon)"
				class O_Truck_03_Repair_F					{cost = 2000;	requirements[]={};	};	// "Tempest Repair"
				class O_Truck_03_ammo_F						{cost = 3000;	requirements[]={};	};	// "Tempest Ammo"
				class O_APC_Wheeled_02_rcws_v2_F			{cost = 2000;	requirements[]={"T"};	};	// "MSE-3 Marid"
				class O_APC_Tracked_02_cannon_F				{cost = 3000;	requirements[]={"T"};	};	// "BTR-K Kamysh"
				class I_APC_tracked_03_cannon_F				{cost = 3000;	requirements[]={"G"};	};	// "Mora"
				class O_APC_Tracked_02_AA_F					{cost = 3000;	requirements[]={"T"};	};	// "ZSU-39 Tigris"
				class I_APC_Wheeled_03_cannon_F				{cost = 3500;	requirements[]={"G"};	};	// "AFV-4 Gorgon"
				class O_MBT_02_cannon_F						{cost = 6000;	requirements[]={"T"};	};	// "T-100 Varsuk"
				class O_MBT_04_cannon_F						{cost = 7000;	requirements[]={"T"};	};	// "T-140 Angara"
				class O_MBT_04_command_F					{cost = 8000;	requirements[]={"T"};	};	// "T-140K Angara"
				class I_MBT_03_cannon_F						{cost = 6000;	requirements[]={"G"};	};	// "Kuma"
				class B_MBT_01_TUSK_F						{cost = 6500;	requirements[]={"B"};	};	// "M2A1 Slammer UP"
				class O_MBT_02_arty_F						{cost = 28000;	requirements[]={"F"};	};	// "2S9 Sochor"
				class I_Truck_02_MRL_F						{cost = 32000;	requirements[]={"E"};	};	// "Zamak MRL"
				class B_AFV_Wheeled_01_up_cannon_F			{cost = 5500;	requirements[]={"M"};	};	// "Rhino MGS UP"
				class O_SAM_System_04_F						{cost = 8000;	requirements[]={};	offset[]={0, 5.3, 0};};	// "S-750 Rhea"
				class O_Radar_System_02_F					{cost = 5000;	requirements[]={};	offset[]={0, 5.3, 0};};	// "R-750 Cronus Radar"
				class O_Mortar_01_F							{cost = 11000;	requirements[]={"M"}; offset[]={0, 3, 0};	};	// "Mortar"
				class O_UGV_01_rcws_F						{cost = 6500;	requirements[]={}; offset[]={0, 4, 0}; };	// "UGAV rcws"
				class O_UGV_02_Demining_F					{cost = 4500;	requirements[]={};	};	// "UGAV demining"
				class B_AAA_System_01_F						{cost = 8000;	requirements[]={"S"}; offset[]={0, 6, 0.8}; };	// "Phalax"; 
				class B_Ship_Gun_01_F						{cost = 28000;	requirements[]={"S"}; offset[]={0, 6, 0.8}; };	// "Ship gun"
				class B_Ship_MRLS_01_F						{cost = 38000;	requirements[]={"S"}; offset[]={0, 6, 0.8}; };	// "mk 41 VLS"
				class B_SAM_System_01_F						{cost = 8000;	requirements[]={"S"}; offset[]={0, 4, 0.8}; };	// "Mk49 Spartan"; 
				class B_SAM_System_02_F						{cost = 8000;	requirements[]={"S"}; offset[]={0, 4, 0.8}; };	// "Mk21 Centurion";
				

			};
			class Aircraft
			{
				class O_Heli_Light_02_unarmed_F				{cost = 1000;	requirements[]={"H"};	};	// "PO-30 Orca (Unarmed)"
				class I_C_Heli_Light_01_civil_F				{cost = 1000;	requirements[]={"H"};	};	// "M-900"
				class I_Heli_Transport_02_F					{cost = 1200;	requirements[]={"H"};	};	// "Mohawk"
				class I_Heli_light_03_unarmed_F				{cost = 1200;	requirements[]={"H"};	};	// "hellcat unarmed"
				class O_Heli_Light_02_F						{cost = 2500;	requirements[]={"H"};	};	// "PO-30 Orca"
				class O_Heli_Light_02_dynamicLoadout_F		{cost = 2700;	requirements[]={"H"};	};	// "PO-30 Orca"
				class O_Heli_Transport_04_F					{cost = 1000;	requirements[]={"H"};	};	// "Mi-290 Taru"
				class O_Heli_Transport_04_covered_F			{cost = 1000;	requirements[]={"H"};	};	// "Mi-290 Taru (Transport)"
				class O_Heli_Transport_04_medevac_F			{cost = 1000;	requirements[]={"H"};	};	// "Mi-290 Taru (Medical)"
				class O_Heli_Attack_02_F					{cost = 6000;	requirements[]={"H"};	};	// "Mi-48 Kajman"
				class O_Heli_Attack_02_dynamicLoadout_F		{cost = 7000;	requirements[]={"H"};	};	// "Mi-48 Kajman"
				class I_Heli_light_03_F						{cost = 2500;	requirements[]={"H"};	};	// "Hellcat"
				class I_Heli_light_03_dynamicLoadout_F		{cost = 2700;	requirements[]={"H"};	};	// "Hellcat"
				class O_T_VTOL_02_infantry_dynamicLoadout_F	{cost = 9000;	requirements[]={"H"};	};	// "Y-32 Xi'an (Infantry Transport)"
				class O_T_VTOL_02_vehicle_F					{cost = 9000;	requirements[]={"H"};	};	// "Y-32 Xi'an (vehicle Transport)"
				class B_T_VTOL_01_vehicle_blue_F			{cost = 2500;	requirements[]={"H"};	};	// "V-44 X Blackfish(Vic)_blue";
				class B_T_VTOL_01_infantry_blue_F			{cost = 4500;	requirements[]={"H"};	};	// "V-44 X Blackfish(Inf)_blue";
				class B_T_VTOL_01_armed_blue_F				{cost = 6500;	requirements[]={"H"};	};	// "V-44 X Blackfish(Armed)_blue";
				class O_Plane_CAS_02_F						{cost = 7000;	requirements[]={"A"};	};	// "To-199 Neophron (CAS)"
				class O_Plane_CAS_02_dynamicLoadout_F		{cost = 6800;	requirements[]={"A"};	};	// "To-199 Neophron (CAS)_custom"
				class O_Plane_Fighter_02_F					{cost = 10000;	requirements[]={"A"};	};	// "To-201 Shikra"
				class O_Plane_Fighter_02_Stealth_F			{cost = 8000;	requirements[]={"A"};	};	// "To-201 Shikra Stealth"
				class B_Plane_Fighter_01_F					{cost = 9000;	requirements[]={"A"};	};	// "F/A-181 Black Wasp II";
				class I_Plane_Fighter_04_F					{cost = 9000;	requirements[]={"A"};	};	// "A-149 Gryphon";
				class I_Plane_Fighter_03_CAS_F				{cost = 7000;	requirements[]={"A"};	};	// "A-143 Buzzard";
				class I_Plane_Fighter_03_dynamicLoadout_F	{cost = 6800;	requirements[]={"A"};	};	// "A-143 Buzzard custom";
				class I_C_Plane_Civil_01_F					{cost = 1000;	requirements[]={"A"};	};	// "Caesar BTT";
				class B_T_UAV_03_F							{cost = 8000;	requirements[]={"H"}; offset[]={0, 6, 0};};	// "Firescout";
				class B_T_UAV_03_dynamicLoadout_F			{cost = 8200;	requirements[]={"H"}; offset[]={0, 6, 0};};	// "Firescout";
				class O_UAV_02_F							{cost = 8000;	requirements[]={"A"}; offset[]={0, 6, 0}; };	// "K40 AT"
				class O_UAV_02_CAS_F						{cost = 8000;	requirements[]={"A"}; offset[]={0, 6, 0}; };	// "K40 LGB"
				class O_UAV_02_dynamicLoadout_F				{cost = 8000;	requirements[]={"A"}; offset[]={0, 6, 0}; };	// "K40 Custom"
				class O_T_UAV_04_CAS_F						{cost = 8000;	requirements[]={"A"}; offset[]={0, 6, 0}; };	// "KH-3A CAS"
				class B_UAV_05_F							{cost = 8000;	requirements[]={"A"}; offset[]={0, 6, 0};};	// "UCAV";
				class O_UAV_01_F							{cost = 2000;	requirements[]={"H"};	};	// "AR-2 Darter";
				class O_UAV_06_F							{cost = 2000;	requirements[]={"H"};	};	// "AL_6 Pelican"
				class O_UAV_06_medical_F					{cost = 2000;	requirements[]={"H"};	};	// "AL_6 Pelican Medical"
				class B_T_VTOL_01_infantry_olive_F			{cost = 1400;	requirements[]={"H"};	};	// "KV-44 Blackfish tanker";				
				
			};
			class Naval
			{
				class O_Boat_Transport_01_F					{cost = 100;	requirements[]={"W"};	};	// "Assault Boat"
				class I_C_Boat_Transport_02_F				{cost = 300;	requirements[]={"W"};	};	// "RHIB"
				class O_Boat_Armed_01_hmg_F					{cost = 750;	requirements[]={"W"};	};	// "Speedboat HMG"
				class O_SDV_01_F							{cost = 900;	requirements[]={"W"};	};	// "SDV"
			};
			class Gear
			{
				//class Box_East_Ammo_F							{cost = 200;	requirements[]={};	};	// "Basic Ammo [CSAT]"
				//class Box_East_Grenades_F						{cost = 200;	requirements[]={};	};	// "Grenades [CSAT]"
				//class Box_East_Wps_F							{cost = 250;	requirements[]={};	};	// "Basic Weapons [CSAT]"
				//class Box_East_WpsLaunch_F					{cost = 300;	requirements[]={};	};	// "Launchers [CSAT]"
				//class Box_East_WpsSpecial_F					{cost = 500;	requirements[]={};	};	// "Special Weapons [CSAT]"
				//class O_supplyCrate_F							{cost = 500;	requirements[]={};	};	// "Supply Box [CSAT]"
				//class Box_East_AmmoVeh_F						{cost = 500;	requirements[]={};	};	// "Vehicle Ammo [CSAT]"
				class Land_Pod_Heli_Transport_04_ammo_F			{cost = 500;	requirements[]={};	};	// "Taru Ammo Pod"
				class Land_Pod_Heli_Transport_04_box_F			{cost = 500;	requirements[]={};	};	// "Taru Cargo Pod"
				class Land_Pod_Heli_Transport_04_fuel_F			{cost = 500;	requirements[]={};	};	// "Taru Fuel Pod"
				class Land_Pod_Heli_Transport_04_repair_F		{cost = 500;	requirements[]={};	};	// "Taru Repair Pod"
				class Land_Pod_Heli_Transport_04_bench_F		{cost = 500;	requirements[]={};	};	// "Taru Bench Pod"
				class Land_Pod_Heli_Transport_04_medevac_F		{cost = 500;	requirements[]={};	};	// "Taru Medical Pod"
				class O_CargoNet_01_ammo_F						{cost = 1869;		requirements[]={};	};	// "Custom box red one"
				class I_CargoNet_01_ammo_F						{cost = 1870;		requirements[]={};	};	// "Custom box red two"
				class B_CargoNet_01_ammo_F						{cost = 1871;		requirements[]={};	};	// "Custom box red three"
				class CargoNet_01_box_F							{cost = 1872;		requirements[]={};	};	// "Custom box red four"
				class I_supplyCrate_F							{cost = 1873;		requirements[]={};	};	// "Custom box red five"
				
				

			};
			class Defences
			{
				//class O_HMG_01_F							{cost = 750;	requirements[]={};	};	// "Mk30 HMG .50"
				//class O_HMG_01_high_F						{cost = 750;	requirements[]={};	};	// "Mk30 HMG .50 (Raised)"
				class O_GMG_01_F							{cost = 60000;	requirements[]={};	};	// "Mk32 GMG 20 mm"
				//class O_GMG_01_high_F						{cost = 750;	requirements[]={};	};	// "Mk32 GMG 20 mm (Raised)"
				//class O_static_AA_F							{cost = 800;	requirements[]={};	};	// "Static Titan Launcher (AA) [CSAT]"
				//class O_static_AT_F							{cost = 800;	requirements[]={};	};	// "Static Titan Launcher (AT) [CSAT]"
				//class O_SAM_System_04_F						{cost = 8000;	requirements[]={};	offset[]={0, 5.3, 0};};	// "S-750 Rhea"
				//class O_Radar_System_02_F					{cost = 5000;	requirements[]={};	offset[]={0, 5.3, 0};};	// "R-750 Cronus Radar"
				//class O_Mortar_01_F							{cost = 11000;	requirements[]={"M"}; offset[]={0, 3, 0};	};	// "Mortar"
				//class O_UGV_01_rcws_F						{cost = 8500;	requirements[]={}; offset[]={0, 4, 0}; };	// "UGAV rcws"
				//class O_UGV_02_Demining_F					{cost = 4500;	requirements[]={};	};	// "UGAV demining"
				//class O_UAV_01_F							{cost = 500;	requirements[]={};	};	// "AR-2 Darter"
				//class O_UAV_06_F							{cost = 500;	requirements[]={};	};	// "AL_6 Pelican"
				//class O_UAV_06_medical_F					{cost = 500;	requirements[]={};	};	// "AL_6 Pelican Medical"
				//class B_AAA_System_01_F						{cost = 8000;	requirements[]={"S"}; offset[]={0, 6, 0.8}; };	// "Phalax"; 
				//class B_Ship_Gun_01_F						{cost = 24000;	requirements[]={"S"}; offset[]={0, 6, 0.8}; };	// "Ship gun"
				//class B_Ship_MRLS_01_F						{cost = 38000;	requirements[]={"S"}; offset[]={0, 6, 0.8}; };	// "mk 41 VLS"
				//class B_SAM_System_01_F						{cost = 8000;	requirements[]={"S"}; offset[]={0, 4, 0.8}; };	// "Mk49 Spartan"; 
				//class B_SAM_System_02_F						{cost = 8000;	requirements[]={"S"}; offset[]={0, 4, 0.8}; };	// "Mk21 Centurion"; 
				

			};
		};
		class GUER
		{
			class Infantry
			{
				class I_soldier_F							{cost = 100;	requirements[]={};	};	// "Rifleman"
				//class O_crew_F								{cost = 100;	requirements[]={};	};	// "Crewman"
				//class O_Helipilot_F							{cost = 100;	requirements[]={};	};	// "Helicopter Pilot"
				//class O_Pilot_F								{cost = 100;	requirements[]={};	};	// "Pilot"
				class I_Soldier_GL_F						{cost = 125;	requirements[]={};	};	// "Grenadier"
				class I_medic_F								{cost = 125;	requirements[]={};	};	// "Combat Life Saver"
				class I_Soldier_AR_F						{cost = 150;	requirements[]={};	};	// "Autorifleman"
				class I_Soldier_A_F							{cost = 150;	requirements[]={};	};	// "Ammo Bearer"
				class I_Soldier_M_F							{cost = 150;	requirements[]={};	};	// "Marksman"
				class I_Soldier_repair_F					{cost = 200;	requirements[]={};	};	// "Repair Specialist"
				//class O_HeavyGunner_F						{cost = 200;	requirements[]={};	};	// "Heavy Gunner"
				class I_Soldier_LAT_F						{cost = 250;	requirements[]={};	};	// "Rifleman (AT)"
				class I_Soldier_AT_F						{cost = 300;	requirements[]={};	};	// "Missile Specialist (AT)"
				class I_Soldier_AA_F						{cost = 300;	requirements[]={};	};	// "Missile Specialist (AA)"
				//class O_Sharpshooter_F						{cost = 300;	requirements[]={};	};	// "Sharpshooter"
				class I_Sniper_F							{cost = 300;	requirements[]={};	};	// "Sniper"
				//class O_soldier_exp_F							{cost = 300;	requirements[]={};	};	// "Explosive Specialist"
				class I_diver_F							{cost = 300;	requirements[]={};	};	// "diver"
				//class O_soldier_HAT_F						{cost = 350;	requirements[]={};	};	// "Rifleman (Heavy AT)"
			};
			class Vehicles
			{
				
				class C_Tractor_01_F						{cost = 200;	requirements[]={};	};	// "Sexy Tractor"
				//class O_Truck_03_transport_F				{cost = 700;	requirements[]={};	};	// "Tempest Transport"
				//class O_Truck_03_Fuel_F						{cost = 700;	requirements[]={};	};	// "Tempest Fuel"
				//class O_Truck_03_medical_F					{cost = 700;	requirements[]={};	};	// "Tempest Medical"
				class I_E_Van_02_medevac_F					{cost = 700;	requirements[]={};	};	// "Ambulance"
				//class O_G_Offroad_01_armed_F				{cost = 1200;	requirements[]={};	};	// "Offroad (HMG)"
				//class O_G_Offroad_01_AT_F					{cost = 1500;	requirements[]={};	};	// "Offroad (AT)"
				class I_LT_01_AA_F							{cost = 2500;	requirements[]={};	};	// "AWC 302 Nyx (AA)"
				class I_LT_01_scout_F						{cost = 1000;	requirements[]={};	};	// "AWC 303 Nyx (Recon)"
				//class O_Truck_03_Repair_F					{cost = 2000;	requirements[]={};	};	// "Tempest Repair"
				//class O_Truck_03_ammo_F						{cost = 3000;	requirements[]={};	};	// "Tempest Ammo"
				//class O_APC_Wheeled_02_rcws_v2_F			{cost = 2000;	requirements[]={"T"};	};	// "MSE-3 Marid"
				//class O_APC_Tracked_02_cannon_F				{cost = 3000;	requirements[]={"T"};	};	// "BTR-K Kamysh"
				class I_APC_tracked_03_cannon_F				{cost = 3000;	requirements[]={"G"};	};	// "Mora"
				//class O_APC_Tracked_02_AA_F					{cost = 3000;	requirements[]={"T"};	};	// "ZSU-39 Tigris"
				class I_APC_Wheeled_03_cannon_F				{cost = 3500;	requirements[]={"G"};	};	// "AFV-4 Gorgon"
				//class O_MBT_02_cannon_F						{cost = 6000;	requirements[]={"T"};	};	// "T-100 Varsuk"
				//class O_MBT_04_cannon_F						{cost = 7000;	requirements[]={"T"};	};	// "T-140 Angara"
				//class O_MBT_04_command_F					{cost = 8000;	requirements[]={"T"};	};	// "T-140K Angara"
				class I_MBT_03_cannon_F						{cost = 6000;	requirements[]={"G"};	};	// "Kuma"
				class B_MBT_01_TUSK_F						{cost = 6500;	requirements[]={"B"};	};	// "M2A1 Slammer UP"
				class O_MBT_02_arty_F						{cost = 28000;	requirements[]={"F"};	};	// "2S9 Sochor"
				class I_Truck_02_MRL_F						{cost = 32000;	requirements[]={"E"};	};	// "Zamak MRL"
				class B_AFV_Wheeled_01_up_cannon_F			{cost = 5500;	requirements[]={"M"};	};	// "Rhino MGS UP"
				class I_E_SAM_System_03_F						{cost = 8000;	requirements[]={};	offset[]={0, 5.3, 0};};	// "S-750 Rhea"
				class I_E_Radar_System_01_F					{cost = 5000;	requirements[]={};	offset[]={0, 5.3, 0};};	// "R-750 Cronus Radar"
				//class O_Mortar_01_F							{cost = 11000;	requirements[]={"M"}; offset[]={0, 3, 0};	};	// "Mortar"
				//class O_UGV_01_rcws_F						{cost = 6500;	requirements[]={}; offset[]={0, 4, 0}; };	// "UGAV rcws"
				//class O_UGV_02_Demining_F					{cost = 4500;	requirements[]={};	};	// "UGAV demining"
				class B_AAA_System_01_F						{cost = 8000;	requirements[]={"S"}; offset[]={0, 6, 0.8}; };	// "Phalax"; 
				class B_Ship_Gun_01_F						{cost = 28000;	requirements[]={"S"}; offset[]={0, 6, 0.8}; };	// "Ship gun"
				class B_Ship_MRLS_01_F						{cost = 38000;	requirements[]={"S"}; offset[]={0, 6, 0.8}; };	// "mk 41 VLS"
				class B_SAM_System_01_F						{cost = 8000;	requirements[]={"S"}; offset[]={0, 4, 0.8}; };	// "Mk49 Spartan"; 
				class B_SAM_System_02_F						{cost = 8000;	requirements[]={"S"}; offset[]={0, 4, 0.8}; };	// "Mk21 Centurion";
				

			};
			class Aircraft
			{
				//class O_Heli_Light_02_unarmed_F				{cost = 1000;	requirements[]={"H"};	};	// "PO-30 Orca (Unarmed)"
				class I_C_Heli_Light_01_civil_F				{cost = 1000;	requirements[]={"H"};	};	// "M-900"
				class I_Heli_Transport_02_F					{cost = 1200;	requirements[]={"H"};	};	// "Mohawk"
				class I_Heli_light_03_unarmed_F				{cost = 1200;	requirements[]={"H"};	};	// "hellcat unarmed"
				//class O_Heli_Light_02_F						{cost = 2500;	requirements[]={"H"};	};	// "PO-30 Orca"
				//class O_Heli_Light_02_dynamicLoadout_F		{cost = 2700;	requirements[]={"H"};	};	// "PO-30 Orca"
				//class O_Heli_Transport_04_F					{cost = 1000;	requirements[]={"H"};	};	// "Mi-290 Taru"
				//class O_Heli_Transport_04_covered_F			{cost = 1000;	requirements[]={"H"};	};	// "Mi-290 Taru (Transport)"
				//class O_Heli_Transport_04_medevac_F			{cost = 1000;	requirements[]={"H"};	};	// "Mi-290 Taru (Medical)"
				//class O_Heli_Attack_02_F					{cost = 6000;	requirements[]={"H"};	};	// "Mi-48 Kajman"
				//class O_Heli_Attack_02_dynamicLoadout_F		{cost = 7000;	requirements[]={"H"};	};	// "Mi-48 Kajman"
				class I_Heli_light_03_F						{cost = 2500;	requirements[]={"H"};	};	// "Hellcat"
				class I_Heli_light_03_dynamicLoadout_F		{cost = 2700;	requirements[]={"H"};	};	// "Hellcat"
				//class O_T_VTOL_02_infantry_dynamicLoadout_F	{cost = 9000;	requirements[]={"H"};	};	// "Y-32 Xi'an (Infantry Transport)"
				//class O_T_VTOL_02_vehicle_F					{cost = 9000;	requirements[]={"H"};	};	// "Y-32 Xi'an (vehicle Transport)"
				class B_T_VTOL_01_vehicle_blue_F			{cost = 2500;	requirements[]={"H"};	};	// "V-44 X Blackfish(Vic)_blue";
				class B_T_VTOL_01_infantry_blue_F			{cost = 4500;	requirements[]={"H"};	};	// "V-44 X Blackfish(Inf)_blue";
				class B_T_VTOL_01_armed_blue_F				{cost = 6500;	requirements[]={"H"};	};	// "V-44 X Blackfish(Armed)_blue";
				//class O_Plane_CAS_02_F						{cost = 7000;	requirements[]={"A"};	};	// "To-199 Neophron (CAS)"
				//class O_Plane_CAS_02_dynamicLoadout_F		{cost = 6800;	requirements[]={"A"};	};	// "To-199 Neophron (CAS)_custom"
				//class O_Plane_Fighter_02_F					{cost = 10000;	requirements[]={"A"};	};	// "To-201 Shikra"
				//class O_Plane_Fighter_02_Stealth_F			{cost = 8000;	requirements[]={"A"};	};	// "To-201 Shikra Stealth"
				class B_Plane_Fighter_01_F					{cost = 9000;	requirements[]={"A"};	};	// "F/A-181 Black Wasp II";
				class I_Plane_Fighter_04_F					{cost = 9000;	requirements[]={"A"};	};	// "A-149 Gryphon";
				class I_Plane_Fighter_03_CAS_F				{cost = 7000;	requirements[]={"A"};	};	// "A-143 Buzzard";
				class I_Plane_Fighter_03_dynamicLoadout_F	{cost = 6800;	requirements[]={"A"};	};	// "A-143 Buzzard custom";
				class I_C_Plane_Civil_01_F					{cost = 1000;	requirements[]={"A"};	};	// "Caesar BTT";
				class B_T_UAV_03_F							{cost = 8000;	requirements[]={"H"}; offset[]={0, 6, 0};};	// "Firescout";
				class B_T_UAV_03_dynamicLoadout_F			{cost = 8200;	requirements[]={"H"}; offset[]={0, 6, 0};};	// "Firescout";
				class O_UAV_02_F							{cost = 8000;	requirements[]={"A"}; offset[]={0, 6, 0}; };	// "K40 AT"
				class O_UAV_02_CAS_F						{cost = 8000;	requirements[]={"A"}; offset[]={0, 6, 0}; };	// "K40 LGB"
				class O_UAV_02_dynamicLoadout_F				{cost = 8000;	requirements[]={"A"}; offset[]={0, 6, 0}; };	// "K40 Custom"
				class O_T_UAV_04_CAS_F						{cost = 8000;	requirements[]={"A"}; offset[]={0, 6, 0}; };	// "KH-3A CAS"
				class B_UAV_05_F							{cost = 8000;	requirements[]={"A"}; offset[]={0, 6, 0};};	// "UCAV";
				class O_UAV_01_F							{cost = 2000;	requirements[]={"H"};	};	// "AR-2 Darter";
				class O_UAV_06_F							{cost = 2000;	requirements[]={"H"};	};	// "AL_6 Pelican"
				class O_UAV_06_medical_F					{cost = 2000;	requirements[]={"H"};	};	// "AL_6 Pelican Medical"
				class B_T_VTOL_01_infantry_olive_F			{cost = 1400;	requirements[]={"H"};	};	// "KV-44 Blackfish tanker";				
				
			};
			class Naval
			{
				class O_Boat_Transport_01_F					{cost = 100;	requirements[]={"W"};	};	// "Assault Boat"
				class I_C_Boat_Transport_02_F				{cost = 300;	requirements[]={"W"};	};	// "RHIB"
				class O_Boat_Armed_01_hmg_F					{cost = 750;	requirements[]={"W"};	};	// "Speedboat HMG"
				class I_SDV_01_F							{cost = 900;	requirements[]={"W"};	};	// "SDV"
			};
			class Gear
			{
				//class Box_East_Ammo_F							{cost = 200;	requirements[]={};	};	// "Basic Ammo [CSAT]"
				//class Box_East_Grenades_F						{cost = 200;	requirements[]={};	};	// "Grenades [CSAT]"
				//class Box_East_Wps_F							{cost = 250;	requirements[]={};	};	// "Basic Weapons [CSAT]"
				//class Box_East_WpsLaunch_F					{cost = 300;	requirements[]={};	};	// "Launchers [CSAT]"
				//class Box_East_WpsSpecial_F					{cost = 500;	requirements[]={};	};	// "Special Weapons [CSAT]"
				//class O_supplyCrate_F							{cost = 500;	requirements[]={};	};	// "Supply Box [CSAT]"
				//class Box_East_AmmoVeh_F						{cost = 500;	requirements[]={};	};	// "Vehicle Ammo [CSAT]"
				class Land_Pod_Heli_Transport_04_ammo_F			{cost = 500;	requirements[]={};	};	// "Taru Ammo Pod"
				class Land_Pod_Heli_Transport_04_box_F			{cost = 500;	requirements[]={};	};	// "Taru Cargo Pod"
				class Land_Pod_Heli_Transport_04_fuel_F			{cost = 500;	requirements[]={};	};	// "Taru Fuel Pod"
				class Land_Pod_Heli_Transport_04_repair_F		{cost = 500;	requirements[]={};	};	// "Taru Repair Pod"
				class Land_Pod_Heli_Transport_04_bench_F		{cost = 500;	requirements[]={};	};	// "Taru Bench Pod"
				class Land_Pod_Heli_Transport_04_medevac_F		{cost = 500;	requirements[]={};	};	// "Taru Medical Pod"
				class O_CargoNet_01_ammo_F						{cost = 1869;		requirements[]={};	};	// "Custom box red one"
				class I_CargoNet_01_ammo_F						{cost = 1870;		requirements[]={};	};	// "Custom box red two"
				class B_CargoNet_01_ammo_F						{cost = 1871;		requirements[]={};	};	// "Custom box red three"
				class CargoNet_01_box_F							{cost = 1872;		requirements[]={};	};	// "Custom box red four"
				class I_supplyCrate_F							{cost = 1873;		requirements[]={};	};	// "Custom box red five"
				
				

			};
			class Defences
			{
				//class O_HMG_01_F							{cost = 750;	requirements[]={};	};	// "Mk30 HMG .50"
				//class O_HMG_01_high_F						{cost = 750;	requirements[]={};	};	// "Mk30 HMG .50 (Raised)"
				class O_GMG_01_F							{cost = 60000;	requirements[]={};	};	// "Mk32 GMG 20 mm"
				//class O_GMG_01_high_F						{cost = 750;	requirements[]={};	};	// "Mk32 GMG 20 mm (Raised)"
				//class O_static_AA_F							{cost = 800;	requirements[]={};	};	// "Static Titan Launcher (AA) [CSAT]"
				//class O_static_AT_F							{cost = 800;	requirements[]={};	};	// "Static Titan Launcher (AT) [CSAT]"
				//class O_SAM_System_04_F						{cost = 8000;	requirements[]={};	offset[]={0, 5.3, 0};};	// "S-750 Rhea"
				//class O_Radar_System_02_F					{cost = 5000;	requirements[]={};	offset[]={0, 5.3, 0};};	// "R-750 Cronus Radar"
				//class O_Mortar_01_F							{cost = 11000;	requirements[]={"M"}; offset[]={0, 3, 0};	};	// "Mortar"
				//class O_UGV_01_rcws_F						{cost = 8500;	requirements[]={}; offset[]={0, 4, 0}; };	// "UGAV rcws"
				//class O_UGV_02_Demining_F					{cost = 4500;	requirements[]={};	};	// "UGAV demining"
				//class O_UAV_01_F							{cost = 500;	requirements[]={};	};	// "AR-2 Darter"
				//class O_UAV_06_F							{cost = 500;	requirements[]={};	};	// "AL_6 Pelican"
				//class O_UAV_06_medical_F					{cost = 500;	requirements[]={};	};	// "AL_6 Pelican Medical"
				//class B_AAA_System_01_F						{cost = 8000;	requirements[]={"S"}; offset[]={0, 6, 0.8}; };	// "Phalax"; 
				//class B_Ship_Gun_01_F						{cost = 24000;	requirements[]={"S"}; offset[]={0, 6, 0.8}; };	// "Ship gun"
				//class B_Ship_MRLS_01_F						{cost = 38000;	requirements[]={"S"}; offset[]={0, 6, 0.8}; };	// "mk 41 VLS"
				//class B_SAM_System_01_F						{cost = 8000;	requirements[]={"S"}; offset[]={0, 4, 0.8}; };	// "Mk49 Spartan"; 
				//class B_SAM_System_02_F						{cost = 8000;	requirements[]={"S"}; offset[]={0, 4, 0.8}; };	// "Mk21 Centurion"; 
				

			};
		};
	};
};

/*
//class B_Quadbike_01_F						{cost =  20;	requirements[]={};	};	// "Quad Bike"
//class B_LSV_01_unarmed_F					{cost = 500;	requirements[]={};	};	// "Prowler (Unarmed)"
//class B_MRAP_01_F							{cost = 500;	requirements[]={};	};	// "Hunter"
//class B_LSV_01_armed_F						{cost = 1200;	requirements[]={};	};	// "Prowler (HMG)"
//class B_LSV_01_AT_F							{cost = 1800;	requirements[]={};	};	// "Prowler (AT)"
//class B_MRAP_01_hmg_F						{cost = 2000;	requirements[]={"B"};	};	// "Hunter HMG"
//class B_MRAP_01_gmg_F						{cost = 2000;	requirements[]={"B"};	};	// "Hunter GMG"
//class B_UGV_02_Demining_F					{cost = 4500;	requirements[]={};	};	// "UGAS demining"
//class B_UAV_05_F							{cost = 8000;	requirements[]={"A"}; offset[]={0, 6, 0};};	// "UCAV";
//class Box_NATO_AmmoOrd_F					{cost = 1500;	requirements[]={};	};	// "Explosives [NATO]"

//class O_Quadbike_01_F						{cost = 20;	requirements[]={};	};	// "Quad Bike"
//class O_LSV_02_unarmed_F					{cost = 500;	requirements[]={};	};	// "Qilin (Unarmed)"
//class O_MRAP_02_F							{cost = 500;	requirements[]={};	};	// "Ifrit"
//class O_LSV_02_armed_F						{cost = 1200;	requirements[]={};	};	// "Qilin (Minigun)"
//class O_LSV_02_AT_F							{cost = 1800;	requirements[]={};	};	// "Qilin (AT)"
//class O_MRAP_02_hmg_F						{cost = 2000;	requirements[]={"T"};	};	// "Ifrit HMG"
//class O_MRAP_02_gmg_F						{cost = 2000;	requirements[]={"T"};	};	// "Ifrit GMG"

