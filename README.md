A3_EPOCH_Headless_Client
========================
These files are for setting up a headless client in [Arma 3: Epoch Mod](http://epochmod.com/) and should work with minimal editing.

The tutorial I wrote for creating this setup can be found on the official forum ([here](http://epochmod.com/forum/index.php?/topic/29541-headless-clientswalkthrough-w-custom-ai-mission-wip-updateddec-10th/)).

####Short Recap
**1.** Add this line to your server config, edited with the IPs your HCs will connect from:<br />
`headlessClients[]={"127.0.0.1","123.4.56.789"};`

**2.** Add a unit to your mission.sqm with these attributes:<br />
`SIDE: Game Logic, CLASS: Virtual Entities, UNIT: Headless Client, CONTROL: Playable, NAME: somename`

**3.** Add this code to your init.sqf; edited with whatever file you use to spawn AI:<br />
```
if (!hasInterface and !isServer) then {
execVm "custom\Hogs_AI\AI_Init.sqf";
};
```

**4.** Create your HC_Start.bat to launch the HC and place this into the bat:<br />
`start arma3server.exe  -client -connect=127.0.0.1 -mod="@epoch" -password=""`

If you do no not have a password, then delete `-password=""` from the above line.

Your server should be ready to go. You will need to launch Redis first, then your server, then BEC then finally your HC before joining yourself. 

If you run your server on one computer, then run the HC and your client from that same computer you can run into one issue. Once the HC is running, your client will attempt to overwrite the current mission in your MPMissioncache folder when you connect. If this happens, it will kick you out of the server and you will need to rejoin. This is a program rights issue where you already have the mission open in one program and are attempting to re-download and overwrite it with another program. After you have gone through that once, Arma 3 will know that you already downloaded the mission file the first time and will not attempt to re-download it again. This will allow your game client to join as normal.

I hope this helps you out! If you find anything I could do better, just post a pull request. 

hogs
