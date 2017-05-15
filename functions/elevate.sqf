private ["_phase", "_newPhase", "_gun","_mult","_dir","_milSys"];
_gun = vehicle player;

_dir = _this select 7;	// +1/-1
_milSys = getNumber (configFile >> "CfgVehicles" >> typeOf _gun >> "bn_arty_milSys");
if (_milSys == 0) then {_milSys = 6000};
_mult = 1;
// 6400 / _milSys;	
// US mils to Russian mils

//todo: read mil sys from config;

if (_this select 4) then {_mult=_mult*5};	// shift
if (_this select 5) then {_mult=_mult*10};	// ctrl

// hint str (_this);

_phase = _gun animationPhase "MainGun";
_newPhase = round(_phase+_dir*_mult);
_gun animate ["MainGun", _newPhase];
_gun setVariable ["MainGun",_newPhase];

if (scriptDone tu_arty_dials_handle) then {tu_arty_dials_handle = [vehicle player] execVM "\tu_arty_config\scripts\dials.sqf"};