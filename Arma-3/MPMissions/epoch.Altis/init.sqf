//Only uses this code if the connecting client is not the server
//and doesn't have an interface(our headless client)

if (!hasInterface and !isServer) then {
execVm "custom\Hogs_AI\AI_Init.sqf";
};

"GlobalHint" addPublicVariableEventHandler
{
private ["_GHint"];
_GHint = _this select 1;
hint parseText format["%1", _GHint];
};
