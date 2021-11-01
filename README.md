# Snow Effect for Vice City: Multiplayer (VC:MP) 0.4
https://youtu.be/vtSrnNbO_vs
### Installation steps
- Download this repository by clicking *Code > Download ZIP*.
- Paste the *store* folder found in the .zip file you just downloaded to your server's directory.
- Go to the file where your **Script::ScriptProcess()** client-side function is defined (typically, in *store/script/main.nut*), then:
  - Load the script by doing `dofile("snoweffect.nut");`. I recommend doing this at the top of your script, outside any function.
  - Append `::snowEffect.Process();` to your **Script::ScriptProcess()** function body.
- Done!

### Snow Effect behaviour
You can control how the Snow Effect behaves for every player in your server by changing the values that the following keys hold:
- `snowEffect.enabled`
  - **Type:** *bool*.
  - **Acceptable values:** either *true* or *false* (lol).
  - **Description:** whether the Snow Effect is enabled or not. When set to *true* it will remain enabled, disabled otherwise.
- `snowEffect.waitTime`
  - **Type:** *integer*.
  - **Acceptable values:** any integer >= 0.
  - **Description:** the time (in milliseconds) the client must wait before creating a new sprite again. This prevents filling the screen with a new sprite on every frame.
- `snowEffect.maxSpriteSize`
  - **Type:** *integer*.
  - **Acceptable values:** any integer >= 1.
  - **Description:** How big a sprite can be.

Please note that by not following the acceptable values for the above keys may, or may not lead to undesired behaviour.
