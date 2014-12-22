diag_log "HOGS_AI STARTING!";
HOGS_AI=[];
 
_missionsArray = [1,2,3,4,5,6,7,8,9,10];
 
sleep 1;
 
Bounce_Mission=false;
 
AI_Timer1={HAI_TIMER=time;waitUntil{(time-HAI_TIMER)>1800};Bounce_Mission=true;};
_loop_timer_01=[] spawn AI_Timer1;
 
while{true}do{
_missions = count _missionsArray;
 
if (_missions == 0) then
{
_missionsArray = [1,2,3,4,5,6,7,8,9,10];
_missions = count _missionsArray;
};
 
_objectiv = _missionsArray select (floor (random _missions));
_missionsArray = _missionsArray - [_objectiv];
 
 
switch (_objectiv) do
{
case 1:
{
_group1 = createGroup RESISTANCE;
currentAO = createMarker ["Inc_Zone_One", [8946.34,13758.8,0.00140381]];
"Inc_Zone_One" setMarkerShape "ELLIPSE";
"Inc_Zone_One" setMarkerSize [600,600];
"Inc_Zone_One" setMarkerColor "ColorRed";
"Inc_Zone_One" setMarkerBrush "DIAGGRID";
"Inc_Zone_One" setMarkerAlpha 1;
currentAO2 = createMarker ["Inc_Zone_Two", [8946.34,13758.8,0.00140381]];
"Inc_Zone_Two" setMarkerType "mil_dot";
"Inc_Zone_Two" setMarkerText "Hogscorp Defense Alert";
 
 
_ogjstr = "<t align='center' size='2.0'>Hogscorp<br/>Defense Alert!</t><br/>______________<br/><br/>
Our radar has picked up a bandit patrol and marked it on your map!<br/>
You have our permission to confiscate any property you find as payment for eliminating the threat!";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";
 
 
BAN_1 = _group1 createUnit["I_Soldier_EPOCH", [8946.34,13758.8,0.00140381], [], 50, "CAN_COLLIDE"];
BAN_2 = _group1 createUnit["I_Soldier_EPOCH", [8946.34,13758.8,0.00140381], [], 50, "CAN_COLLIDE"];
BAN_3 = _group1 createUnit["I_Soldier_EPOCH", [8946.34,13758.8,0.00140381], [], 50, "CAN_COLLIDE"];
BAN_4 = _group1 createUnit["I_Soldier_EPOCH", [8946.34,13758.8,0.00140381], [], 50, "CAN_COLLIDE"];
BAN_5 = _group1 createUnit["I_Soldier_EPOCH", [8946.34,13758.8,0.00140381], [], 50, "CAN_COLLIDE"];
BAN_6 = _group1 createUnit["I_Soldier_EPOCH", [8946.34,13758.8,0.00140381], [], 50, "CAN_COLLIDE"];
BAN_7 = _group1 createUnit["I_Soldier_EPOCH", [8946.34,13758.8,0.00140381], [], 50, "CAN_COLLIDE"];
BAN_8 = _group1 createUnit["I_Soldier_EPOCH", [8946.34,13758.8,0.00140381], [], 50, "CAN_COLLIDE"];
BAN_9 = _group1 createUnit["I_Soldier_EPOCH", [8946.34,13758.8,0.00140381], [], 50, "CAN_COLLIDE"];
BAN_10 = _group1 createUnit["I_Soldier_EPOCH", [8946.34,13758.8,0.00140381], [], 50, "CAN_COLLIDE"];
BAN_11 = _group1 createUnit["I_Soldier_EPOCH", [8946.34,13758.8,0.00140381], [], 50, "CAN_COLLIDE"];
BAN_12 = _group1 createUnit["I_Soldier_EPOCH", [8946.34,13758.8,0.00140381], [], 50, "CAN_COLLIDE"];
BAN_13 = _group1 createUnit["I_Soldier_EPOCH", [8946.34,13758.8,0.00140381], [], 50, "CAN_COLLIDE"];
BAN_14 = _group1 createUnit["I_Soldier_EPOCH", [8946.34,13758.8,0.00140381], [], 50, "CAN_COLLIDE"];
BAN_15 = _group1 createUnit["I_Soldier_EPOCH", [8946.34,13758.8,0.00140381], [], 50, "CAN_COLLIDE"];
 
HOGS_AI=[BAN_1,BAN_2,BAN_3,BAN_4,BAN_5,BAN_6,BAN_7,BAN_8,BAN_9,BAN_10,BAN_11,BAN_12,BAN_13,BAN_14,BAN_15];
PublicVariableServer "HOGS_AI";
 
_group1 setBehaviour "RED";
{
removeUniform _x;
removeHeadgear _x;
_x forceAddUniform  "U_ghillie1_uniform";
_x addVest "V_TacVest_camo";
_x addHeadgear "H_ShemagOpen_tan";
_x addMagazines ["11Rnd_45ACP_Mag", 3];
_x addMagazines ["30Rnd_556x45_Stanag", 8];
_x addWeapon "arifle_Mk20_GL_F";
_x addPrimaryWeaponItem "optic_Arco";
_x addWeapon "hgun_Pistol_heavy_01_F";
_x addHandgunItem "optic_MRD";
_x addMagazines ["1Rnd_HE_Grenade_shell", 2];
_x setSkill 0.7;
_x setBehaviour "RED";
}foreach HOGS_AI;
[_group1, [8946.34,13758.8],300] call bis_fnc_taskPatrol;
 
  // Create trigger around location.
      _dt = createTrigger ["EmptyDetector", [8946.34,13758.8]];
      _dt setTriggerArea [600, 600, 0, false];
      _dt setTriggerActivation ["GUER", "NOTPRESENT", false];
 
// Wait until the trigger sets off or the mission runs out of time
sleep 2;
    Bounce_Mission=false;
waitUntil {(count list _dt < 1) or (Bounce_Mission)};
terminate _loop_timer_01;
 
if(!Bounce_Mission)then{
_prize = createVehicle ["Box_East_Ammo_F",[8946.34,13758.8,0.00140381],[], 0, "CAN_COLLIDE"];
HAI2Prize_Timer=time;
[_prize]spawn{_prize=_this select 0;waitUntil{(time-HAI2Prize_Timer)>600}; deleteVehicle _prize;};
 
//Change the marker to green, inform players of their success
"Inc_Zone_One" setMarkerColor "ColorGreen";
publicVariable "currentAO";
 
_ogjstr = "<t align='center' size='2.0'>Mission Status</t><br/>
______________<br/><br/>
Good work citizens.<br/>
The threat has been eliminated!<br/>
Stand by while our radar makes another pass.";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";
}else{
//Change the marker to yellow, inform players that the bandits got away
"Inc_Zone_One" setMarkerColor "ColorYellow";
publicVariable "currentAO";
 
_ogjstr = "<t align='center' size='2.0'>Mission Status</t><br/>
______________<br/><br/>
The bandits have slipped out of the area!<br/>
We will attempt to find their new location.<br/>
Stand by while our radar makes another pass.";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";
};
//Clean up - delete any left over enemies and groups that have broken ranks or glitched
//Delete the trigger and reset Enemy_Dead
deleteVehicle _dt;
 
 
{deletevehicle _x} forEach (units _group1);
    deleteGroup _group1;
 
sleep 120;
_loop_timer_01=[] spawn AI_Timer1;
 
deleteMarker "Inc_Zone_One"; 
deleteMarker "Inc_Zone_Two";
};
 
case 2:
{
_group1 = createGroup RESISTANCE;
currentAO = createMarker ["Inc_Zone_One", [2252.54,8415.4551]];
"Inc_Zone_One" setMarkerShape "ELLIPSE";
"Inc_Zone_One" setMarkerSize [600,600];
"Inc_Zone_One" setMarkerColor "ColorRed";
"Inc_Zone_One" setMarkerBrush "DIAGGRID";
"Inc_Zone_One" setMarkerAlpha 1;
currentAO2 = createMarker ["Inc_Zone_Two", [2252.54,8415.4551]];
"Inc_Zone_Two" setMarkerType "mil_dot";
"Inc_Zone_Two" setMarkerText "Hogscorp Defense Alert";
 
_ogjstr = "<t align='center' size='2.0'>Hogscorp<br/>Defense Alert!</t><br/>______________<br/><br/>
Our radar has picked up a bandit patrol and marked it on your map!<br/>
You have our permission to confiscate any property you find as payment for eliminating the threat!";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";

 
"I_Soldier_EPOCH" createUnit [[2252.54,8401.4551,0], _group1,"BAN_1=this"];
_group1 selectLeader BAN_1;
"I_Soldier_EPOCH" createUnit [[2252.54,8402.4551,0], _group1,"BAN_2=this"];
"I_Soldier_EPOCH" createUnit [[2252.54,8403.4551,0], _group1,"BAN_3=this"];
"I_Soldier_EPOCH" createUnit [[2252.54,8404.4551,0], _group1,"BAN_4=this"];
"I_Soldier_EPOCH" createUnit [[2252.54,8405.4551,0], _group1,"BAN_5=this"];
"I_Soldier_EPOCH" createUnit [[2252.54,8406.4551,0], _group1,"BAN_6=this"];
"I_Soldier_EPOCH" createUnit [[2252.54,8407.4551,0], _group1,"BAN_7=this"];
"I_Soldier_EPOCH" createUnit [[2252.54,8408.4551,0], _group1,"BAN_8=this"];
"I_Soldier_EPOCH" createUnit [[2252.54,8409.4551,0], _group1,"BAN_9=this"];
"I_Soldier_EPOCH" createUnit [[2252.54,8410.4551,0], _group1,"BAN_10=this"];
"I_Soldier_EPOCH" createUnit [[2252.54,8411.4551,0], _group1,"BAN_11=this"];
"I_Soldier_EPOCH" createUnit [[2252.54,8412.4551,0], _group1,"BAN_12=this"];
"I_Soldier_EPOCH" createUnit [[2252.54,8413.4551,0], _group1,"BAN_13=this"];
"I_Soldier_EPOCH" createUnit [[2252.54,8414.4551,0], _group1,"BAN_14=this"];
"I_Soldier_EPOCH" createUnit [[2252.54,8415.4551,0], _group1,"BAN_15=this"];
_group1 setBehaviour "RED";
 
HOGS_AI=[BAN_1,BAN_2,BAN_3,BAN_4,BAN_5,BAN_6,BAN_7,BAN_8,BAN_9,BAN_10,BAN_11,BAN_12,BAN_13,BAN_14,BAN_15];
PublicVariableServer "HOGS_AI";
 
{
removeUniform _x;
removeHeadgear _x;
_x forceAddUniform  "U_ghillie1_uniform";
_x addVest "V_TacVest_camo";
_x addHeadgear "H_ShemagOpen_tan";
_x addMagazines ["11Rnd_45ACP_Mag", 3];
_x addMagazines ["30Rnd_556x45_Stanag", 8];
_x addWeapon "arifle_Mk20_GL_F";
_x addPrimaryWeaponItem "optic_Arco";
_x addWeapon "hgun_Pistol_heavy_01_F";
_x addHandgunItem "optic_MRD";
_x addMagazines ["1Rnd_HE_Grenade_shell", 2];
_x setSkill 0.7;
_x setBehaviour "RED";
}foreach HOGS_AI;
[_group1, [2252.54,8415.4551],300] call bis_fnc_taskPatrol;
 
  // Create trigger around location.
      _dt = createTrigger ["EmptyDetector", [2252.54,8415.4551]];
      _dt setTriggerArea [600, 600, 0, false];
      _dt setTriggerActivation ["GUER", "NOTPRESENT", false];
 
// Wait until the trigger sets off or the mission runs out of time
sleep 2;
    Bounce_Mission=false;
waitUntil {(count list _dt < 1) or (Bounce_Mission)};
terminate _loop_timer_01;
 
if(!Bounce_Mission)then{
_prize = createVehicle ["Box_East_Ammo_F",[2252.54,8415.4551,0],[], 0, "CAN_COLLIDE"];
HAI2Prize_Timer=time;
[_prize]spawn{_prize=_this select 0;waitUntil{(time-HAI2Prize_Timer)>600}; deleteVehicle _prize;};
 
//Change the marker to green, inform players of their success
"Inc_Zone_One" setMarkerColor "ColorGreen";
publicVariable "currentAO";
 
_ogjstr = "<t align='center' size='2.0'>Mission Status</t><br/>
______________<br/><br/>
Good work citizens.<br/>
The threat has been eliminated!<br/>
Stand by while our radar makes another pass.";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";
 
 
}else{
 
//Change the marker to yellow, inform players that the bandits got away
"Inc_Zone_One" setMarkerColor "ColorYellow";
publicVariable "currentAO";
 
_ogjstr = "<t align='center' size='2.0'>Mission Status</t><br/>
______________<br/><br/>
The bandits have slipped out of the area!<br/>
We will attempt to find their new location.<br/>
Stand by while our radar makes another pass.";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";
};
//Clean up - delete any left over enemies and groups that have broken ranks or glitched
//Delete the trigger and reset Enemy_Dead
deleteVehicle _dt;
 
 
{deletevehicle _x} forEach (units _group1);
    deleteGroup _group1;
 
sleep 120;
_loop_timer_01=[] spawn AI_Timer1;
 
deleteMarker "Inc_Zone_One"; 
deleteMarker "Inc_Zone_Two";
};
case 3:
{
_group1 = createGroup RESISTANCE;
currentAO = createMarker ["Inc_Zone_One", [3557.4958,13942.614]];
"Inc_Zone_One" setMarkerShape "ELLIPSE";
"Inc_Zone_One" setMarkerSize [600,600];
"Inc_Zone_One" setMarkerColor "ColorRed";
"Inc_Zone_One" setMarkerBrush "DIAGGRID";
"Inc_Zone_One" setMarkerAlpha 1;
currentAO2 = createMarker ["Inc_Zone_Two", [3557.4958,13942.614]];
"Inc_Zone_Two" setMarkerType "mil_dot";
"Inc_Zone_Two" setMarkerText "Hogscorp Defense Alert";
 
_ogjstr = "<t align='center' size='2.0'>Hogscorp<br/>Defense Alert!</t><br/>______________<br/><br/>
Our radar has picked up a bandit patrol and marked it on your map!<br/>
You have our permission to confiscate any property you find as payment for eliminating the threat!";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";


"I_Soldier_EPOCH" createUnit [[3557.4958,13928.614,0], _group1,"BAN_1=this"];
_group1 selectLeader BAN_1;
"I_Soldier_EPOCH" createUnit [[3557.4958,13929.614,0], _group1,"BAN_2=this"];
"I_Soldier_EPOCH" createUnit [[3557.4958,13930.614,0], _group1,"BAN_3=this"];
"I_Soldier_EPOCH" createUnit [[3557.4958,13931.614,0], _group1,"BAN_4=this"];
"I_Soldier_EPOCH" createUnit [[3557.4958,13932.614,0], _group1,"BAN_5=this"];
"I_Soldier_EPOCH" createUnit [[3557.4958,13933.614,0], _group1,"BAN_6=this"];
"I_Soldier_EPOCH" createUnit [[3557.4958,13934.614,0], _group1,"BAN_7=this"];
"I_Soldier_EPOCH" createUnit [[3557.4958,13935.614,0], _group1,"BAN_8=this"];
"I_Soldier_EPOCH" createUnit [[3557.4958,13936.614,0], _group1,"BAN_9=this"];
"I_Soldier_EPOCH" createUnit [[3557.4958,13937.614,0], _group1,"BAN_10=this"];
"I_Soldier_EPOCH" createUnit [[3557.4958,13938.614,0], _group1,"BAN_11=this"];
"I_Soldier_EPOCH" createUnit [[3557.4958,13939.614,0], _group1,"BAN_12=this"];
"I_Soldier_EPOCH" createUnit [[3557.4958,13940.614,0], _group1,"BAN_13=this"];
"I_Soldier_EPOCH" createUnit [[3557.4958,13941.614,0], _group1,"BAN_14=this"];
"I_Soldier_EPOCH" createUnit [[3557.4958,13942.614,0], _group1,"BAN_15=this"];
 
HOGS_AI=[BAN_1,BAN_2,BAN_3,BAN_4,BAN_5,BAN_6,BAN_7,BAN_8,BAN_9,BAN_10,BAN_11,BAN_12,BAN_13,BAN_14,BAN_15];
PublicVariableServer "HOGS_AI";
 
_group1 setBehaviour "RED";
{
removeUniform _x;
removeHeadgear _x;
_x forceAddUniform  "U_ghillie1_uniform";
_x addVest "V_TacVest_camo";
_x addHeadgear "H_ShemagOpen_tan";
_x addMagazines ["11Rnd_45ACP_Mag", 3];
_x addMagazines ["30Rnd_556x45_Stanag", 8];
_x addWeapon "arifle_Mk20_GL_F";
_x addPrimaryWeaponItem "optic_Arco";
_x addWeapon "hgun_Pistol_heavy_01_F";
_x addHandgunItem "optic_MRD";
_x addMagazines ["1Rnd_HE_Grenade_shell", 2];
_x setSkill 0.7;
_x setBehaviour "RED";
}foreach HOGS_AI;
[_group1, [3557.4958,13942.614],300] call bis_fnc_taskPatrol;
 
  // Create trigger around location.
      _dt = createTrigger ["EmptyDetector", [3557.4958,13942.614]];
      _dt setTriggerArea [600, 600, 0, false];
      _dt setTriggerActivation ["GUER", "NOTPRESENT", false];
 
// Wait until the trigger sets off or the mission runs out of time
sleep 2;
    Bounce_Mission=false;
waitUntil {(count list _dt < 1) or (Bounce_Mission)};
terminate _loop_timer_01;
 
if(!Bounce_Mission)then{
_prize = createVehicle ["Box_East_Ammo_F",[3557.4958,13942.614,0],[], 0, "CAN_COLLIDE"];
HAI2Prize_Timer=time;
[_prize]spawn{_prize=_this select 0;waitUntil{(time-HAI2Prize_Timer)>600}; deleteVehicle _prize;};
 
//Change the marker to green, inform players of their success
"Inc_Zone_One" setMarkerColor "ColorGreen";
publicVariable "currentAO";
 
_ogjstr = "<t align='center' size='2.0'>Mission Status</t><br/>
______________<br/><br/>
Good work citizens.<br/>
The threat has been eliminated!<br/>
Stand by while our radar makes another pass.";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";
 
 
}else{
 
//Change the marker to yellow, inform players that the bandits got away
"Inc_Zone_One" setMarkerColor "ColorYellow";
publicVariable "currentAO";
 
_ogjstr = "<t align='center' size='2.0'>Mission Status</t><br/>
______________<br/><br/>
The bandits have slipped out of the area!<br/>
We will attempt to find their new location.<br/>
Stand by while our radar makes another pass.";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";
};
//Clean up - delete any left over enemies and groups that have broken ranks or glitched
//Delete the trigger and reset Enemy_Dead
deleteVehicle _dt;
 
 
{deletevehicle _x} forEach (units _group1);
    deleteGroup _group1;
 
sleep 120;
_loop_timer_01=[] spawn AI_Timer1;
 
deleteMarker "Inc_Zone_One"; 
deleteMarker "Inc_Zone_Two";
};
case 4:
{
_group1 = createGroup RESISTANCE;
currentAO = createMarker ["Inc_Zone_One", [9040.9043,1895.418]];
"Inc_Zone_One" setMarkerShape "ELLIPSE";
"Inc_Zone_One" setMarkerSize [600,600];
"Inc_Zone_One" setMarkerColor "ColorRed";
"Inc_Zone_One" setMarkerBrush "DIAGGRID";
"Inc_Zone_One" setMarkerAlpha 1;
currentAO2 = createMarker ["Inc_Zone_Two", [9040.9043,1895.418]];
"Inc_Zone_Two" setMarkerType "mil_dot";
"Inc_Zone_Two" setMarkerText "Hogscorp Defense Alert";
 
_ogjstr = "<t align='center' size='2.0'>Hogscorp<br/>Defense Alert!</t><br/>______________<br/><br/>
Our radar has picked up a bandit patrol and marked it on your map!<br/>
You have our permission to confiscate any property you find as payment for eliminating the threat!";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";

"I_Soldier_EPOCH" createUnit [[9040.9043,1881.418,0], _group1,"BAN_1=this"];
_group1 selectLeader BAN_1;
"I_Soldier_EPOCH" createUnit [[9040.9043,1882.418,0], _group1,"BAN_2=this"];
"I_Soldier_EPOCH" createUnit [[9040.9043,1883.418,0], _group1,"BAN_3=this"];
"I_Soldier_EPOCH" createUnit [[9040.9043,1884.418,0], _group1,"BAN_4=this"];
"I_Soldier_EPOCH" createUnit [[9040.9043,1885.418,0], _group1,"BAN_5=this"];
"I_Soldier_EPOCH" createUnit [[9040.9043,1886.418,0], _group1,"BAN_6=this"];
"I_Soldier_EPOCH" createUnit [[9040.9043,1887.418,0], _group1,"BAN_7=this"];
"I_Soldier_EPOCH" createUnit [[9040.9043,1888.418,0], _group1,"BAN_8=this"];
"I_Soldier_EPOCH" createUnit [[9040.9043,1889.418,0], _group1,"BAN_9=this"];
"I_Soldier_EPOCH" createUnit [[9040.9043,1890.418,0], _group1,"BAN_10=this"];
"I_Soldier_EPOCH" createUnit [[9040.9043,1891.418,0], _group1,"BAN_11=this"];
"I_Soldier_EPOCH" createUnit [[9040.9043,1892.418,0], _group1,"BAN_12=this"];
"I_Soldier_EPOCH" createUnit [[9040.9043,1893.418,0], _group1,"BAN_13=this"];
"I_Soldier_EPOCH" createUnit [[9040.9043,1894.418,0], _group1,"BAN_14=this"];
"I_Soldier_EPOCH" createUnit [[9040.9043,1895.418,0], _group1,"BAN_15=this"];
HOGS_AI=[BAN_1,BAN_2,BAN_3,BAN_4,BAN_5,BAN_6,BAN_7,BAN_8,BAN_9,BAN_10,BAN_11,BAN_12,BAN_13,BAN_14,BAN_15];
PublicVariableServer "HOGS_AI";
 
_group1 setBehaviour "RED";
{
removeUniform _x;
removeHeadgear _x;
_x forceAddUniform  "U_ghillie1_uniform";
_x addVest "V_TacVest_camo";
_x addHeadgear "H_ShemagOpen_tan";
_x addMagazines ["11Rnd_45ACP_Mag", 3];
_x addMagazines ["30Rnd_556x45_Stanag", 8];
_x addWeapon "arifle_Mk20_GL_F";
_x addPrimaryWeaponItem "optic_Arco";
_x addWeapon "hgun_Pistol_heavy_01_F";
_x addHandgunItem "optic_MRD";
_x addMagazines ["1Rnd_HE_Grenade_shell", 2];
_x setSkill 0.7;
_x setBehaviour "RED";
}foreach HOGS_AI;
[_group1, [9040.9043,1895.418],300] call bis_fnc_taskPatrol;
 
  // Create trigger around location.
      _dt = createTrigger ["EmptyDetector", [9040.9043,1895.418]];
      _dt setTriggerArea [600, 600, 0, false];
      _dt setTriggerActivation ["GUER", "NOTPRESENT", false];
 
// Wait until the trigger sets off or the mission runs out of time
sleep 2;
    Bounce_Mission=false;
waitUntil {(count list _dt < 1) or (Bounce_Mission)};
terminate _loop_timer_01;
 
if(!Bounce_Mission)then{
_prize = createVehicle ["Box_East_Ammo_F",[9040.9043,1895.418,0],[], 0, "CAN_COLLIDE"];
HAI2Prize_Timer=time;
[_prize]spawn{_prize=_this select 0;waitUntil{(time-HAI2Prize_Timer)>600}; deleteVehicle _prize;};
 
//Change the marker to green, inform players of their success
"Inc_Zone_One" setMarkerColor "ColorGreen";
publicVariable "currentAO";
 
_ogjstr = "<t align='center' size='2.0'>Mission Status</t><br/>
______________<br/><br/>
Good work citizens.<br/>
The threat has been eliminated!<br/>
Stand by while our radar makes another pass.";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";
 
 
}else{
 
//Change the marker to yellow, inform players that the bandits got away
"Inc_Zone_One" setMarkerColor "ColorYellow";
publicVariable "currentAO";
 
_ogjstr = "<t align='center' size='2.0'>Mission Status</t><br/>
______________<br/><br/>
The bandits have slipped out of the area!<br/>
We will attempt to find their new location.<br/>
Stand by while our radar makes another pass.";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";
};
//Clean up - delete any left over enemies and groups that have broken ranks or glitched
//Delete the trigger and reset Enemy_Dead
deleteVehicle _dt;
 
 
{deletevehicle _x} forEach (units _group1);
    deleteGroup _group1;
 
sleep 120;
_loop_timer_01=[] spawn AI_Timer1;
 
deleteMarker "Inc_Zone_One"; 
deleteMarker "Inc_Zone_Two";
};
case 5:
{
_group1 = createGroup RESISTANCE;
currentAO = createMarker ["Inc_Zone_One", [5781.8521,5882.4922]];
"Inc_Zone_One" setMarkerShape "ELLIPSE";
"Inc_Zone_One" setMarkerSize [600,600];
"Inc_Zone_One" setMarkerColor "ColorRed";
"Inc_Zone_One" setMarkerBrush "DIAGGRID";
"Inc_Zone_One" setMarkerAlpha 1;
currentAO2 = createMarker ["Inc_Zone_Two", [5781.8521,5882.4922]];
"Inc_Zone_Two" setMarkerType "mil_dot";
"Inc_Zone_Two" setMarkerText "Hogscorp Defense Alert";
 
_ogjstr = "<t align='center' size='2.0'>Hogscorp<br/>Defense Alert!</t><br/>______________<br/><br/>
Our radar has picked up a bandit patrol and marked it on your map!<br/>
You have our permission to confiscate any property you find as payment for eliminating the threat!";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";
 
"I_Soldier_EPOCH" createUnit [[5781.8521,5882.4922,0], _group1,"BAN_1=this"];
_group1 selectLeader BAN_1;
"I_Soldier_EPOCH" createUnit [[5781.8521,5883.4922,0], _group1,"BAN_2=this"];
"I_Soldier_EPOCH" createUnit [[5781.8521,5884.4922,0], _group1,"BAN_3=this"];
"I_Soldier_EPOCH" createUnit [[5781.8521,5885.4922,0], _group1,"BAN_4=this"];
"I_Soldier_EPOCH" createUnit [[5781.8521,5886.4922,0], _group1,"BAN_5=this"];
"I_Soldier_EPOCH" createUnit [[5781.8521,5887.4922,0], _group1,"BAN_6=this"];
"I_Soldier_EPOCH" createUnit [[5781.8521,5888.4922,0], _group1,"BAN_7=this"];
"I_Soldier_EPOCH" createUnit [[5781.8521,5889.4922,0], _group1,"BAN_8=this"];
"I_Soldier_EPOCH" createUnit [[5781.8521,5890.4922,0], _group1,"BAN_9=this"];
"I_Soldier_EPOCH" createUnit [[5781.8521,5891.4922,0], _group1,"BAN_10=this"];
"I_Soldier_EPOCH" createUnit [[5781.8521,5892.4922,0], _group1,"BAN_11=this"];
"I_Soldier_EPOCH" createUnit [[5781.8521,5893.4922,0], _group1,"BAN_12=this"];
"I_Soldier_EPOCH" createUnit [[5781.8521,5894.4922,0], _group1,"BAN_13=this"];
"I_Soldier_EPOCH" createUnit [[5781.8521,5895.4922,0], _group1,"BAN_14=this"];
"I_Soldier_EPOCH" createUnit [[5781.8521,5896.4922,0], _group1,"BAN_15=this"];
HOGS_AI=[BAN_1,BAN_2,BAN_3,BAN_4,BAN_5,BAN_6,BAN_7,BAN_8,BAN_9,BAN_10,BAN_11,BAN_12,BAN_13,BAN_14,BAN_15];
PublicVariableServer "HOGS_AI";
 
_group1 setBehaviour "RED";
{
removeUniform _x;
removeHeadgear _x;
_x forceAddUniform  "U_ghillie1_uniform";
_x addVest "V_TacVest_camo";
_x addHeadgear "H_ShemagOpen_tan";
_x addMagazines ["11Rnd_45ACP_Mag", 3];
_x addMagazines ["30Rnd_556x45_Stanag", 8];
_x addWeapon "arifle_Mk20_GL_F";
_x addPrimaryWeaponItem "optic_Arco";
_x addWeapon "hgun_Pistol_heavy_01_F";
_x addHandgunItem "optic_MRD";
_x addMagazines ["1Rnd_HE_Grenade_shell", 2];
_x setSkill 0.7;
_x setBehaviour "RED";
}foreach HOGS_AI;
[_group1, [5781.8521,5882.4922],300] call bis_fnc_taskPatrol;
 
  // Create trigger around location.
      _dt = createTrigger ["EmptyDetector", [5781.8521,5882.4922]];
      _dt setTriggerArea [600, 600, 0, false];
      _dt setTriggerActivation ["GUER", "NOTPRESENT", false];
 
// Wait until the trigger sets off or the mission runs out of time
sleep 2;
    Bounce_Mission=false;
waitUntil {(count list _dt < 1) or (Bounce_Mission)};
terminate _loop_timer_01;
 
if(!Bounce_Mission)then{
_prize = createVehicle ["Box_East_Ammo_F",[5781.8521,5882.4922,0],[], 0, "CAN_COLLIDE"];
HAI2Prize_Timer=time;
[_prize]spawn{_prize=_this select 0;waitUntil{(time-HAI2Prize_Timer)>600}; deleteVehicle _prize;};
 
//Change the marker to green, inform players of their success
"Inc_Zone_One" setMarkerColor "ColorGreen";
publicVariable "currentAO";
 
_ogjstr = "<t align='center' size='2.0'>Mission Status</t><br/>
______________<br/><br/>
Good work citizens.<br/>
The threat has been eliminated!<br/>
Stand by while our radar makes another pass.";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";

}else{
 
//Change the marker to yellow, inform players that the bandits got away
"Inc_Zone_One" setMarkerColor "ColorYellow";
publicVariable "currentAO";
 
_ogjstr = "<t align='center' size='2.0'>Mission Status</t><br/>
______________<br/><br/>
The bandits have slipped out of the area!<br/>
We will attempt to find their new location.<br/>
Stand by while our radar makes another pass.";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";
};
//Clean up - delete any left over enemies and groups that have broken ranks or glitched
//Delete the trigger and reset Enemy_Dead
deleteVehicle _dt;

{deletevehicle _x} forEach (units _group1);
    deleteGroup _group1;
 
sleep 120;
_loop_timer_01=[] spawn AI_Timer1;
 
deleteMarker "Inc_Zone_One"; 
deleteMarker "Inc_Zone_Two";
};
case 6:
{
_group1 = createGroup RESISTANCE;
currentAO = createMarker ["Inc_Zone_One", [10724.351,13992.229]];
"Inc_Zone_One" setMarkerShape "ELLIPSE";
"Inc_Zone_One" setMarkerSize [600,600];
"Inc_Zone_One" setMarkerColor "ColorRed";
"Inc_Zone_One" setMarkerBrush "DIAGGRID";
"Inc_Zone_One" setMarkerAlpha 1;
currentAO2 = createMarker ["Inc_Zone_Two", [10724.351,13992.229]];
"Inc_Zone_Two" setMarkerType "mil_dot";
"Inc_Zone_Two" setMarkerText "Hogscorp Defense Alert";
 
// publicVariable "currentAO";
// publicVariable "currentAO2";
 
_ogjstr = "<t align='center' size='2.0'>Hogscorp<br/>Defense Alert!</t><br/>______________<br/><br/>
Our radar has picked up a bandit patrol and marked it on your map!<br/>
You have our permission to confiscate any property you find as payment for eliminating the threat!";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";

"I_Soldier_EPOCH" createUnit [[10724.351,13978.229,0], _group1,"BAN_1=this"];
_group1 selectLeader BAN_1;
"I_Soldier_EPOCH" createUnit [[10724.351,13979.229,0], _group1,"BAN_2=this"];
"I_Soldier_EPOCH" createUnit [[10724.351,13980.229,0], _group1,"BAN_3=this"];
"I_Soldier_EPOCH" createUnit [[10724.351,13981.229,0], _group1,"BAN_4=this"];
"I_Soldier_EPOCH" createUnit [[10724.351,13982.229,0], _group1,"BAN_5=this"];
"I_Soldier_EPOCH" createUnit [[10724.351,13983.229,0], _group1,"BAN_6=this"];
"I_Soldier_EPOCH" createUnit [[10724.351,13984.229,0], _group1,"BAN_7=this"];
"I_Soldier_EPOCH" createUnit [[10724.351,13985.229,0], _group1,"BAN_8=this"];
"I_Soldier_EPOCH" createUnit [[10724.351,13986.229,0], _group1,"BAN_9=this"];
"I_Soldier_EPOCH" createUnit [[10724.351,13987.229,0], _group1,"BAN_10=this"];
"I_Soldier_EPOCH" createUnit [[10724.351,13988.229,0], _group1,"BAN_11=this"];
"I_Soldier_EPOCH" createUnit [[10724.351,13989.229,0], _group1,"BAN_12=this"];
"I_Soldier_EPOCH" createUnit [[10724.351,13990.229,0], _group1,"BAN_13=this"];
"I_Soldier_EPOCH" createUnit [[10724.351,13991.229,0], _group1,"BAN_14=this"];
"I_Soldier_EPOCH" createUnit [[10724.351,13992.229,0], _group1,"BAN_15=this"];
HOGS_AI=[BAN_1,BAN_2,BAN_3,BAN_4,BAN_5,BAN_6,BAN_7,BAN_8,BAN_9,BAN_10,BAN_11,BAN_12,BAN_13,BAN_14,BAN_15];
PublicVariableServer "HOGS_AI";
 
_group1 setBehaviour "RED";
{
removeUniform _x;
removeHeadgear _x;
_x forceAddUniform  "U_ghillie1_uniform";
_x addVest "V_TacVest_camo";
_x addHeadgear "H_ShemagOpen_tan";
_x addMagazines ["11Rnd_45ACP_Mag", 3];
_x addMagazines ["30Rnd_556x45_Stanag", 8];
_x addWeapon "arifle_Mk20_GL_F";
_x addPrimaryWeaponItem "optic_Arco";
_x addWeapon "hgun_Pistol_heavy_01_F";
_x addHandgunItem "optic_MRD";
_x addMagazines ["1Rnd_HE_Grenade_shell", 2];
_x setSkill 0.7;
_x setBehaviour "RED";
}foreach HOGS_AI;
[_group1, [10724.351,13992.229],300] call bis_fnc_taskPatrol;
 
  // Create trigger around location.
      _dt = createTrigger ["EmptyDetector", [10724.351,13992.229]];
      _dt setTriggerArea [600, 600, 0, false];
      _dt setTriggerActivation ["GUER", "NOTPRESENT", false];
 
// Wait until the trigger sets off or the mission runs out of time
sleep 2;
    Bounce_Mission=false;
waitUntil {(count list _dt < 1) or (Bounce_Mission)};
terminate _loop_timer_01;
 
if(!Bounce_Mission)then{
_prize = createVehicle ["Box_East_Ammo_F",[10724.351,13992.229,0],[], 0, "CAN_COLLIDE"];
HAI2Prize_Timer=time;
[_prize]spawn{_prize=_this select 0;waitUntil{(time-HAI2Prize_Timer)>600}; deleteVehicle _prize;};
 
//Change the marker to green, inform players of their success
"Inc_Zone_One" setMarkerColor "ColorGreen";
publicVariable "currentAO";
 
_ogjstr = "<t align='center' size='2.0'>Mission Status</t><br/>
______________<br/><br/>
Good work citizens.<br/>
The threat has been eliminated!<br/>
Stand by while our radar makes another pass.";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";
 
 
}else{
 
//Change the marker to yellow, inform players that the bandits got away
"Inc_Zone_One" setMarkerColor "ColorYellow";
publicVariable "currentAO";
 
_ogjstr = "<t align='center' size='2.0'>Mission Status</t><br/>
______________<br/><br/>
The bandits have slipped out of the area!<br/>
We will attempt to find their new location.<br/>
Stand by while our radar makes another pass.";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";
};
//Clean up - delete any left over enemies and groups that have broken ranks or glitched
//Delete the trigger and reset Enemy_Dead
deleteVehicle _dt;
 
 
{deletevehicle _x} forEach (units _group1);
    deleteGroup _group1;
 
sleep 120;
_loop_timer_01=[] spawn AI_Timer1;
deleteMarker "Inc_Zone_One"; 
deleteMarker "Inc_Zone_Two";
};
case 7:
{
_group1 = createGroup RESISTANCE;
currentAO = createMarker ["Inc_Zone_One", [14469.495,13846.303]];
"Inc_Zone_One" setMarkerShape "ELLIPSE";
"Inc_Zone_One" setMarkerSize [600,600];
"Inc_Zone_One" setMarkerColor "ColorRed";
"Inc_Zone_One" setMarkerBrush "DIAGGRID";
"Inc_Zone_One" setMarkerAlpha 1;
currentAO2 = createMarker ["Inc_Zone_Two", [14469.495,13846.303]];
"Inc_Zone_Two" setMarkerType "mil_dot";
"Inc_Zone_Two" setMarkerText "Hogscorp Defense Alert";
 
// publicVariable "currentAO";
// publicVariable "currentAO2";
 
_ogjstr = "<t align='center' size='2.0'>Hogscorp<br/>Defense Alert!</t><br/>______________<br/><br/>
Our radar has picked up a bandit patrol and marked it on your map!<br/>
You have our permission to confiscate any property you find as payment for eliminating the threat!";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";
 
"I_Soldier_EPOCH" createUnit [[14469.495,13832.303,0], _group1,"BAN_1=this"];
_group1 selectLeader BAN_1;
"I_Soldier_EPOCH" createUnit [[14469.495,13833.303,0], _group1,"BAN_2=this"];
"I_Soldier_EPOCH" createUnit [[14469.495,13834.303,0], _group1,"BAN_3=this"];
"I_Soldier_EPOCH" createUnit [[14469.495,13835.303,0], _group1,"BAN_4=this"];
"I_Soldier_EPOCH" createUnit [[14469.495,13836.303,0], _group1,"BAN_5=this"];
"I_Soldier_EPOCH" createUnit [[14469.495,13837.303,0], _group1,"BAN_6=this"];
"I_Soldier_EPOCH" createUnit [[14469.495,13838.303,0], _group1,"BAN_7=this"];
"I_Soldier_EPOCH" createUnit [[14469.495,13839.303,0], _group1,"BAN_8=this"];
"I_Soldier_EPOCH" createUnit [[14469.495,13840.303,0], _group1,"BAN_9=this"];
"I_Soldier_EPOCH" createUnit [[14469.495,13841.303,0], _group1,"BAN_10=this"];
"I_Soldier_EPOCH" createUnit [[14469.495,13842.303,0], _group1,"BAN_11=this"];
"I_Soldier_EPOCH" createUnit [[14469.495,13843.303,0], _group1,"BAN_12=this"];
"I_Soldier_EPOCH" createUnit [[14469.495,13844.303,0], _group1,"BAN_13=this"];
"I_Soldier_EPOCH" createUnit [[14469.495,13845.303,0], _group1,"BAN_14=this"];
"I_Soldier_EPOCH" createUnit [[14469.495,13846.303,0], _group1,"BAN_15=this"];
HOGS_AI=[BAN_1,BAN_2,BAN_3,BAN_4,BAN_5,BAN_6,BAN_7,BAN_8,BAN_9,BAN_10,BAN_11,BAN_12,BAN_13,BAN_14,BAN_15];
PublicVariableServer "HOGS_AI";
 
_group1 setBehaviour "RED";
{
removeUniform _x;
removeHeadgear _x;
_x forceAddUniform  "U_ghillie1_uniform";
_x addVest "V_TacVest_camo";
_x addHeadgear "H_ShemagOpen_tan";
_x addMagazines ["11Rnd_45ACP_Mag", 3];
_x addMagazines ["30Rnd_556x45_Stanag", 8];
_x addWeapon "arifle_Mk20_GL_F";
_x addPrimaryWeaponItem "optic_Arco";
_x addWeapon "hgun_Pistol_heavy_01_F";
_x addHandgunItem "optic_MRD";
_x addMagazines ["1Rnd_HE_Grenade_shell", 2];
_x setSkill 0.7;
_x setBehaviour "RED";
}foreach HOGS_AI;
[_group1, [14469.495,13846.303],300] call bis_fnc_taskPatrol;
 
  // Create trigger around location.
      _dt = createTrigger ["EmptyDetector", [14469.495,13846.303]];
      _dt setTriggerArea [600, 600, 0, false];
      _dt setTriggerActivation ["GUER", "NOTPRESENT", false];
 
// Wait until the trigger sets off or the mission runs out of time
sleep 2;
    Bounce_Mission=false;
waitUntil {(count list _dt < 1) or (Bounce_Mission)};
terminate _loop_timer_01;
 
if(!Bounce_Mission)then{
_prize = createVehicle ["Box_East_Ammo_F",[14469.495,13846.303,0],[], 0, "CAN_COLLIDE"];
HAI2Prize_Timer=time;
[_prize]spawn{_prize=_this select 0;waitUntil{(time-HAI2Prize_Timer)>600}; deleteVehicle _prize;};
 
//Change the marker to green, inform players of their success
"Inc_Zone_One" setMarkerColor "ColorGreen";
publicVariable "currentAO";
 
_ogjstr = "<t align='center' size='2.0'>Mission Status</t><br/>
______________<br/><br/>
Good work citizens.<br/>
The threat has been eliminated!<br/>
Stand by while our radar makes another pass.";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";
 
 
}else{
 
//Change the marker to yellow, inform players that the bandits got away
"Inc_Zone_One" setMarkerColor "ColorYellow";
publicVariable "currentAO";
 
_ogjstr = "<t align='center' size='2.0'>Mission Status</t><br/>
______________<br/><br/>
The bandits have slipped out of the area!<br/>
We will attempt to find their new location.<br/>
Stand by while our radar makes another pass.";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";
};
//Clean up - delete any left over enemies and groups that have broken ranks or glitched
//Delete the trigger and reset Enemy_Dead
deleteVehicle _dt;
 
 
{deletevehicle _x} forEach (units _group1);
    deleteGroup _group1;
 
sleep 120;
_loop_timer_01=[] spawn AI_Timer1;
 
deleteMarker "Inc_Zone_One"; 
deleteMarker "Inc_Zone_Two";
};
case 8:
{
_group1 = createGroup RESISTANCE;
currentAO = createMarker ["Inc_Zone_One", [13888.623,9896.498]];
"Inc_Zone_One" setMarkerShape "ELLIPSE";
"Inc_Zone_One" setMarkerSize [600,600];
"Inc_Zone_One" setMarkerColor "ColorRed";
"Inc_Zone_One" setMarkerBrush "DIAGGRID";
"Inc_Zone_One" setMarkerAlpha 1;
currentAO2 = createMarker ["Inc_Zone_Two", [13888.623,9896.498]];
"Inc_Zone_Two" setMarkerType "mil_dot";
"Inc_Zone_Two" setMarkerText "Hogscorp Defense Alert";


_ogjstr = "<t align='center' size='2.0'>Hogscorp<br/>Defense Alert!</t><br/>______________<br/><br/>
Our radar has picked up a bandit patrol and marked it on your map!<br/>
You have our permission to confiscate any property you find as payment for eliminating the threat!";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";

 
"I_Soldier_EPOCH" createUnit [[13874.623,9896.498,0], _group1,"BAN_1=this"];
_group1 selectLeader BAN_1;
"I_Soldier_EPOCH" createUnit [[13875.623,9896.498,0], _group1,"BAN_2=this"];
"I_Soldier_EPOCH" createUnit [[13876.623,9896.498,0], _group1,"BAN_3=this"];
"I_Soldier_EPOCH" createUnit [[13877.623,9896.498,0], _group1,"BAN_4=this"];
"I_Soldier_EPOCH" createUnit [[13878.623,9896.498,0], _group1,"BAN_5=this"];
"I_Soldier_EPOCH" createUnit [[13879.623,9896.498,0], _group1,"BAN_6=this"];
"I_Soldier_EPOCH" createUnit [[13880.623,9896.498,0], _group1,"BAN_7=this"];
"I_Soldier_EPOCH" createUnit [[13881.623,9896.498,0], _group1,"BAN_8=this"];
"I_Soldier_EPOCH" createUnit [[13882.623,9896.498,0], _group1,"BAN_9=this"];
"I_Soldier_EPOCH" createUnit [[13883.623,9896.498,0], _group1,"BAN_10=this"];
"I_Soldier_EPOCH" createUnit [[13884.623,9896.498,0], _group1,"BAN_11=this"];
"I_Soldier_EPOCH" createUnit [[13885.623,9896.498,0], _group1,"BAN_12=this"];
"I_Soldier_EPOCH" createUnit [[13886.623,9896.498,0], _group1,"BAN_13=this"];
"I_Soldier_EPOCH" createUnit [[13887.623,9896.498,0], _group1,"BAN_14=this"];
"I_Soldier_EPOCH" createUnit [[13888.623,9896.498,0], _group1,"BAN_15=this"];
HOGS_AI=[BAN_1,BAN_2,BAN_3,BAN_4,BAN_5,BAN_6,BAN_7,BAN_8,BAN_9,BAN_10,BAN_11,BAN_12,BAN_13,BAN_14,BAN_15];
PublicVariableServer "HOGS_AI";
 
_group1 setBehaviour "RED";
{
removeUniform _x;
removeHeadgear _x;
_x forceAddUniform  "U_ghillie1_uniform";
_x addVest "V_TacVest_camo";
_x addHeadgear "H_ShemagOpen_tan";
_x addMagazines ["11Rnd_45ACP_Mag", 3];
_x addMagazines ["30Rnd_556x45_Stanag", 8];
_x addWeapon "arifle_Mk20_GL_F";
_x addPrimaryWeaponItem "optic_Arco";
_x addWeapon "hgun_Pistol_heavy_01_F";
_x addHandgunItem "optic_MRD";
_x addMagazines ["1Rnd_HE_Grenade_shell", 2];
_x setSkill 0.7;
_x setBehaviour "RED";
}foreach HOGS_AI;

[_group1, [13888.623,9896.498],300] call bis_fnc_taskPatrol;
 
  // Create trigger around location.
      _dt = createTrigger ["EmptyDetector", [13888.623,9896.498]];
      _dt setTriggerArea [600, 600, 0, false];
      _dt setTriggerActivation ["GUER", "NOTPRESENT", false];
 
// Wait until the trigger sets off or the mission runs out of time
sleep 2;
    Bounce_Mission=false;
waitUntil {(count list _dt < 1) or (Bounce_Mission)};
terminate _loop_timer_01;
 
if(!Bounce_Mission)then{
_prize = createVehicle ["Box_East_Ammo_F",[13888.623,9896.498,0],[], 0, "CAN_COLLIDE"];
HAI2Prize_Timer=time;
[_prize]spawn{_prize=_this select 0;waitUntil{(time-HAI2Prize_Timer)>600}; deleteVehicle _prize;};
 
//Change the marker to green, inform players of their success
"Inc_Zone_One" setMarkerColor "ColorGreen";
publicVariable "currentAO";
 
_ogjstr = "<t align='center' size='2.0'>Mission Status</t><br/>
______________<br/><br/>
Good work citizens.<br/>
The threat has been eliminated!<br/>
Stand by while our radar makes another pass.";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";
 
 
}else{
 
//Change the marker to yellow, inform players that the bandits got away
"Inc_Zone_One" setMarkerColor "ColorYellow";
publicVariable "currentAO";
 
_ogjstr = "<t align='center' size='2.0'>Mission Status</t><br/>
______________<br/><br/>
The bandits have slipped out of the area!<br/>
We will attempt to find their new location.<br/>
Stand by while our radar makes another pass.";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";
};
//Clean up - delete any left over enemies and groups that have broken ranks or glitched
//Delete the trigger and reset Enemy_Dead
deleteVehicle _dt;
 
 
{deletevehicle _x} forEach (units _group1);
    deleteGroup _group1;
 
sleep 120;
_loop_timer_01=[] spawn AI_Timer1;
deleteMarker "Inc_Zone_One"; 
deleteMarker "Inc_Zone_Two";
};
case 9:
{
_group1 = createGroup RESISTANCE;
currentAO = createMarker ["Inc_Zone_One", [12400.097,6199.0391]];
"Inc_Zone_One" setMarkerShape "ELLIPSE";
"Inc_Zone_One" setMarkerSize [600,600];
"Inc_Zone_One" setMarkerColor "ColorRed";
"Inc_Zone_One" setMarkerBrush "DIAGGRID";
"Inc_Zone_One" setMarkerAlpha 1;
currentAO2 = createMarker ["Inc_Zone_Two", [12400.097,6199.0391]];
"Inc_Zone_Two" setMarkerType "mil_dot";
"Inc_Zone_Two" setMarkerText "Hogscorp Defense Alert";
 

_ogjstr = "<t align='center' size='2.0'>Hogscorp<br/>Defense Alert!</t><br/>______________<br/><br/>
Our radar has picked up a bandit patrol and marked it on your map!<br/>
You have our permission to confiscate any property you find as payment for eliminating the threat!";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";

"I_Soldier_EPOCH" createUnit [[12400.097,6184.0391,0], _group1,"BAN_1=this"];
_group1 selectLeader BAN_1;
"I_Soldier_EPOCH" createUnit [[12400.097,6185.0391,0], _group1,"BAN_2=this"];
"I_Soldier_EPOCH" createUnit [[12400.097,6186.0391,0], _group1,"BAN_3=this"];
"I_Soldier_EPOCH" createUnit [[12400.097,6187.0391,0], _group1,"BAN_4=this"];
"I_Soldier_EPOCH" createUnit [[12400.097,6189.0391,0], _group1,"BAN_5=this"];
"I_Soldier_EPOCH" createUnit [[12400.097,6190.0391,0], _group1,"BAN_6=this"];
"I_Soldier_EPOCH" createUnit [[12400.097,6191.0391,0], _group1,"BAN_7=this"];
"I_Soldier_EPOCH" createUnit [[12400.097,6192.0391,0], _group1,"BAN_8=this"];
"I_Soldier_EPOCH" createUnit [[12400.097,6193.0391,0], _group1,"BAN_9=this"];
"I_Soldier_EPOCH" createUnit [[12400.097,6194.0391,0], _group1,"BAN_10=this"];
"I_Soldier_EPOCH" createUnit [[12400.097,6195.0391,0], _group1,"BAN_11=this"];
"I_Soldier_EPOCH" createUnit [[12400.097,6196.0391,0], _group1,"BAN_12=this"];
"I_Soldier_EPOCH" createUnit [[12400.097,6197.0391,0], _group1,"BAN_13=this"];
"I_Soldier_EPOCH" createUnit [[12400.097,6198.0391,0], _group1,"BAN_14=this"];
"I_Soldier_EPOCH" createUnit [[12400.097,6199.0391,0], _group1,"BAN_15=this"];
HOGS_AI=[BAN_1,BAN_2,BAN_3,BAN_4,BAN_5,BAN_6,BAN_7,BAN_8,BAN_9,BAN_10,BAN_11,BAN_12,BAN_13,BAN_14,BAN_15];
PublicVariableServer "HOGS_AI";
 
_group1 setBehaviour "RED";
{
removeUniform _x;
removeHeadgear _x;
_x forceAddUniform  "U_ghillie1_uniform";
_x addVest "V_TacVest_camo";
_x addHeadgear "H_ShemagOpen_tan";
_x addMagazines ["11Rnd_45ACP_Mag", 3];
_x addMagazines ["30Rnd_556x45_Stanag", 8];
_x addWeapon "arifle_Mk20_GL_F";
_x addPrimaryWeaponItem "optic_Arco";
_x addWeapon "hgun_Pistol_heavy_01_F";
_x addHandgunItem "optic_MRD";
_x addMagazines ["1Rnd_HE_Grenade_shell", 2];
_x setSkill 0.7;
_x setBehaviour "RED";

}foreach HOGS_AI;

[_group1, [12400.097,6199.0391],300] call bis_fnc_taskPatrol;
 
  // Create trigger around location.
      _dt = createTrigger ["EmptyDetector", [12400.097,6199.0391]];
      _dt setTriggerArea [600, 600, 0, false];
      _dt setTriggerActivation ["GUER", "NOTPRESENT", false];
 
// Wait until the trigger sets off or the mission runs out of time
sleep 2;
    Bounce_Mission=false;
waitUntil {(count list _dt < 1) or (Bounce_Mission)};
terminate _loop_timer_01;
 
if(!Bounce_Mission)then{
_prize = createVehicle ["Box_East_Ammo_F",[12400.097,6199.0391,0],[], 0, "CAN_COLLIDE"];
HAI2Prize_Timer=time;
[_prize]spawn{_prize=_this select 0;waitUntil{(time-HAI2Prize_Timer)>600}; deleteVehicle _prize;};
 
//Change the marker to green, inform players of their success
"Inc_Zone_One" setMarkerColor "ColorGreen";
publicVariable "currentAO";
 
_ogjstr = "<t align='center' size='2.0'>Mission Status</t><br/>
______________<br/><br/>
Good work citizens.<br/>
The threat has been eliminated!<br/>
Stand by while our radar makes another pass.";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";
 
 
}else{
 
//Change the marker to yellow, inform players that the bandits got away
"Inc_Zone_One" setMarkerColor "ColorYellow";
publicVariable "currentAO";
 
_ogjstr = "<t align='center' size='2.0'>Mission Status</t><br/>
______________<br/><br/>
The bandits have slipped out of the area!<br/>
We will attempt to find their new location.<br/>
Stand by while our radar makes another pass.";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";
};
//Clean up - delete any left over enemies and groups that have broken ranks or glitched
//Delete the trigger and reset Enemy_Dead
deleteVehicle _dt;
 
 
{deletevehicle _x} forEach (units _group1);
    deleteGroup _group1;
 
sleep 120;
_loop_timer_01=[] spawn AI_Timer1;
deleteMarker "Inc_Zone_One"; 
deleteMarker "Inc_Zone_Two";
};
case 10:
{
_group1 = createGroup RESISTANCE;
currentAO = createMarker ["Inc_Zone_One", [8837.4209,8242.2432]];
"Inc_Zone_One" setMarkerShape "ELLIPSE";
"Inc_Zone_One" setMarkerSize [600,600];
"Inc_Zone_One" setMarkerColor "ColorRed";
"Inc_Zone_One" setMarkerBrush "DIAGGRID";
"Inc_Zone_One" setMarkerAlpha 1;
currentAO2 = createMarker ["Inc_Zone_Two", [8837.4209,8242.2432]];
"Inc_Zone_Two" setMarkerType "mil_dot";
"Inc_Zone_Two" setMarkerText "Hogscorp Defense Alert";
 
_ogjstr = "<t align='center' size='2.0'>Hogscorp<br/>Defense Alert!</t><br/>______________<br/><br/>
A massive bandit incursion has taken place at the Hogscorp Airport!<br/>
The airport is hugely important to your loyal benefactors!<br/>
Annihilate the threat at all costs!";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";

 
"I_Soldier_EPOCH" createUnit [[8837.4209,8240.2432,0], _group1,"BAN_1=this"];
_group1 selectLeader BAN_1;
"I_Soldier_EPOCH" createUnit [[8837.4209,8241.2432,0], _group1,"BAN_2=this"];
"I_Soldier_EPOCH" createUnit [[8837.4209,8242.2432,0], _group1,"BAN_3=this"];
"I_Soldier_EPOCH" createUnit [[8837.4209,8243.2432,0], _group1,"BAN_4=this"];
"I_Soldier_EPOCH" createUnit [[8837.4209,8244.2432,0], _group1,"BAN_5=this"];
"I_Soldier_EPOCH" createUnit [[8837.4209,8245.2432,0], _group1,"BAN_6=this"];
"I_Soldier_EPOCH" createUnit [[8837.4209,8246.2432,0], _group1,"BAN_7=this"];
"I_Soldier_EPOCH" createUnit [[8837.4209,8247.2432,0], _group1,"BAN_8=this"];
"I_Soldier_EPOCH" createUnit [[8837.4209,8248.2432,0], _group1,"BAN_9=this"];
"I_Soldier_EPOCH" createUnit [[8837.4209,8249.2432,0], _group1,"BAN_10=this"];
"I_Soldier_EPOCH" createUnit [[8837.4209,8250.2432,0], _group1,"BAN_11=this"];
"I_Soldier_EPOCH" createUnit [[8837.4209,8251.2432,0], _group1,"BAN_12=this"];
"I_Soldier_EPOCH" createUnit [[8837.4209,8252.2432,0], _group1,"BAN_13=this"];
"I_Soldier_EPOCH" createUnit [[8837.4209,8253.2432,0], _group1,"BAN_14=this"];
"I_Soldier_EPOCH" createUnit [[8837.4209,8254.2432,0], _group1,"BAN_15=this"];
 
HOGS_AI=[BAN_1,BAN_2,BAN_3,BAN_4,BAN_5,BAN_6,BAN_7,BAN_8,BAN_9,BAN_10,BAN_11,BAN_12,BAN_13,BAN_14,BAN_15];
PublicVariableServer "HOGS_AI";
 
_group1 setBehaviour "RED";
{
removeUniform _x;
removeHeadgear _x;
_x forceAddUniform  "U_ghillie1_uniform";
_x addVest "V_TacVest_camo";
_x addHeadgear "H_ShemagOpen_tan";
_x addMagazines ["11Rnd_45ACP_Mag", 3];
_x addMagazines ["30Rnd_556x45_Stanag", 8];
_x addWeapon "arifle_Mk20_GL_F";
_x addPrimaryWeaponItem "optic_Arco";
_x addWeapon "hgun_Pistol_heavy_01_F";
_x addHandgunItem "optic_MRD";
_x addMagazines ["1Rnd_HE_Grenade_shell", 2];
_x setSkill 0.7;
_x setBehaviour "RED";
}foreach HOGS_AI;

[_group1, [8837.4209,8242.2432],300] call bis_fnc_taskPatrol;
 
  // Create trigger around location.
      _dt = createTrigger ["EmptyDetector", [8837.4209,8242.2432]];
      _dt setTriggerArea [600, 600, 0, false];
      _dt setTriggerActivation ["GUER", "NOTPRESENT", false];
 
// Wait until the trigger sets off or the mission runs out of time
sleep 2;
Bounce_Mission=false;
waitUntil {(count list _dt < 1) or (Bounce_Mission)};
terminate _loop_timer_01;
 
 
if(!Bounce_Mission)then{
_prize = createVehicle ["Box_East_Ammo_F",[8837.4209,8242.2432,0],[], 0, "CAN_COLLIDE"];
HAI2Prize_Timer=time;
[_prize]spawn{_prize=_this select 0;waitUntil{(time-HAI2Prize_Timer)>600}; deleteVehicle _prize;};
 
//Change the marker to green, inform players of their success
"Inc_Zone_One" setMarkerColor "ColorGreen";
publicVariable "currentAO";
 
_ogjstr = "<t align='center' size='2.0'>Mission Status</t><br/>
______________<br/><br/>
Excellent work citizens!<br/>
Your work has helped clear the way for bigger profits.<br/>
Those who helped will be greatly rewarded!";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";
 
 
}else{
 
//Change the marker to yellow, inform players that the bandits got away
"Inc_Zone_One" setMarkerColor "ColorYellow";
publicVariable "currentAO";
 
_ogjstr = "<t align='center' size='2.0'>Mission Status</t><br/>
______________<br/><br/>
The bandits have done their damage and moved on...<br/>
Prices on goods sold in Barter Town will have to be increased to cover our losses.<br/>
Remember, a threat to Hogscorp is a threat to us all!";
GlobalHint = _ogjstr;
publicVariable "GlobalHint";
};
//Clean up - delete any left over enemies and groups that have broken ranks or glitched
//Delete the trigger and reset Enemy_Dead
deleteVehicle _dt;
 
 
{deletevehicle _x} forEach (units _group1);
    deleteGroup _group1;
 
sleep 120;
_loop_timer_01=[] spawn AI_Timer1;
deleteMarker "Inc_Zone_One";
deleteMarker "Inc_Zone_Two";
};
};
 
 
};
