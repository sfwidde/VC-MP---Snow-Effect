# Snow Effect for Vice City: Multiplayer (VC:MP) 0.4
Find out [_what does it look like_](https://youtu.be/vtSrnNbO_vs).
### Installation steps
- Download this repository by clicking on *Code > Download ZIP*.
- Paste the *store* folder found in the .zip file you just downloaded to your server's directory.
- Go to the file where your `Script::ScriptLoad()` and `Script::ScriptProcess()` client-side functions are defined (typically, in *store/script/main.nut*), then:
  - Load the script by doing `dofile("snoweffect.nut");`.
  - Append `::snowEffect.PreloadItems();` to your `Script::ScriptLoad()` function body.
  - Append `::snowEffect.ProcessItems();` to your `Script::ScriptProcess()` function body.

### Snow Effect behaviour
##### Constants
- `MAX_SNOW_EFFECT_ITEMS`
  - **Type:** *int*.
  - **Acceptable values:** any integer that is at least 1.
  - **Description:** how many snow items should be visible on the screen at the same time.
- `MIN_SNOW_EFFECT_ITEM_SIZE`
  - **Type:** *float*.
  - **Acceptable values:** any floating-point value greater than 0.0.
  - **Description:** minimum value a snow item (sprite) size can have.
- `MAX_SNOW_EFFECT_ITEM_SIZE`
  - **Type:** *float*.
  - **Acceptable values:** any floating-point value greater or equal than `MIN_SNOW_EFFECT_ITEM_SIZE`.
  - **Description:** maximum value a snow item (sprite) size can have.

##### Table keys
- `snowEffect.enabled`
  - **Type:** *bool*.
  - **Acceptable values:** either `true` or `false`.
  - **Description:** whether the Snow Effect is enabled or not. When set to `true` it will remain enabled, disabled otherwise. This is useful when for example your player enters an interior -- you'd want to disable the snow effect in such case.

Please note that by not following the acceptable values for the above constants/keys may, or may not lead to undesired behaviour.