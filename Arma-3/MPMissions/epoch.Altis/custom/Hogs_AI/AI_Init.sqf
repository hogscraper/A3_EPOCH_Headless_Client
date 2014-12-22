//THIS IS NOT A MISSION SYSTEM. IT IS INCLUDED FOR ILLUSTRATION PURPOSES ONLY.
//THIS CODE WILL SPAWN ONE GROUP OF AI AND A MARKER THEN STOP.
//PLEASE SUBSTITUTE THIS WITH YOUR FAVORITE MISSION SYSTEM INIT.SQF

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
 
 
BAN_1 = _group1 createUnit["I_Soldier_EPOCH", [11656.7,8094.86,0.1], [], 50, "CAN_COLLIDE"];
BAN_2 = _group1 createUnit["I_Soldier_EPOCH", [11656.7,8094.86,0.1], [], 50, "CAN_COLLIDE"];
BAN_3 = _group1 createUnit["I_Soldier_EPOCH", [11656.7,8094.86,0.1], [], 50, "CAN_COLLIDE"];
BAN_4 = _group1 createUnit["I_Soldier_EPOCH", [11656.7,8094.86,0.1], [], 50, "CAN_COLLIDE"];
BAN_5 = _group1 createUnit["I_Soldier_EPOCH", [11656.7,8094.86,0.1], [], 50, "CAN_COLLIDE"];
BAN_6 = _group1 createUnit["I_Soldier_EPOCH", [11656.7,8094.86,0.1], [], 50, "CAN_COLLIDE"];
BAN_7 = _group1 createUnit["I_Soldier_EPOCH", [11656.7,8094.86,0.1], [], 50, "CAN_COLLIDE"];
BAN_8 = _group1 createUnit["I_Soldier_EPOCH", [11656.7,8094.86,0.1], [], 50, "CAN_COLLIDE"];
BAN_9 = _group1 createUnit["I_Soldier_EPOCH", [11656.7,8094.86,0.1], [], 50, "CAN_COLLIDE"];
BAN_10 = _group1 createUnit["I_Soldier_EPOCH", [11656.7,8094.86,0.1], [], 50, "CAN_COLLIDE"];
BAN_11 = _group1 createUnit["I_Soldier_EPOCH", [11656.7,8094.86,0.1], [], 50, "CAN_COLLIDE"];
BAN_12 = _group1 createUnit["I_Soldier_EPOCH", [11656.7,8094.86,0.1], [], 50, "CAN_COLLIDE"];
BAN_13 = _group1 createUnit["I_Soldier_EPOCH", [11656.7,8094.86,0.1], [], 50, "CAN_COLLIDE"];
BAN_14 = _group1 createUnit["I_Soldier_EPOCH", [11656.7,8094.86,0.1], [], 50, "CAN_COLLIDE"];
BAN_15 = _group1 createUnit["I_Soldier_EPOCH", [11656.7,8094.86,0.1], [], 50, "CAN_COLLIDE"];
 
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
[_group1, [11656.7,8094.86],300] call bis_fnc_taskPatrol;
 
