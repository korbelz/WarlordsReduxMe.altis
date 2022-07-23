//Welcome page testing 
// info: https://community.bistudio.com/wiki/hintC
// info: https://community.bistudio.com/wiki/Structured_Text
//  Example img: <img image='\a3\Data_f\Flags\flag_Altis_co.paa'/>
// Example link: <a href='http://arma3.com'>Arma 3</a>

private _lineone = parseText "<a href='https://github.com/korbelz/WarlordsReduxMe.altis'>Click HERE: To report bugs, and follow development</a>";
private _linetwo = parseText "<a href='https://discord.gg/arma'>Official Arma Discord</a>";
private _linethree = parseText "Unbalanced teams equals no passive CP for stacked team"; 
private _linefour = parseText "<a href='https://steamcommunity.com/sharedfiles/filedetails/?id=2072468574'>Click HERE: Written Warlords FAQ guide on steam</a>"; 
private _linefive = "Welcome to the fight, hold I to load the Warlords MENU";

//_structuredText = composeText [_lineone, lineBreak, lineBreak, _linetwo, lineBreak, lineBreak, _linethree, lineBreak, lineBreak, _linefour];

sleep 5;
//orginal use was hintC _structuredText
"Welcome to Warlords Redux .57! Please read below..." hintC [_lineone, _linethree, _linefour, _linefive, _linetwo]; 
hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
	_this spawn {
		_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
		hintSilent "";
		};
	}]; 



