private _hash = [];
while {count _hash < 10} do {
	_hash pushBack selectRandom [97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,49,50,51,52,53,54,55,56,57];
};
"BIS_WL_" + (toString _hash)