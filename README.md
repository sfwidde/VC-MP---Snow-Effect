# Vice City: Multiplayer (VC:MP) Snow Effect.

### Installation steps:
- Download this repository.
- Paste the *store* folder found in the *.zip* file you just downloaded to your server's directory.
- Go to the file where your **Script::ScriptProcess()** client-side function is defined (typically in *store/script/main.nut*), then:
  - Load the script by doing ```dofile("snoweffect.nut");```
  - Append ```::SnowEffect.Process();``` to **Script::ScriptProcess()**'s body.
- Done!
