# Snow Effect for Vice City: Multiplayer (VC:MP) 0.4 servers
Click on the video below to find out what it looks like:

[![VCMP | Snow Effect](https://img.youtube.com/vi/x6P7o-JqYB8/0.jpg)](https://www.youtube.com/watch?v=x6P7o-JqYB8)

## Installation steps
1. Download this repository by clicking on
[*Code > Download ZIP*](https://github.com/sfwidde/vcmp-snow-effect/archive/refs/heads/main.zip).
2. Locate the `store` folder *found in the **.zip** file you just downloaded*,
and extract it to your server's directory.
3. With a text editor, open the script file where your `Script::ScriptLoad()`
and `Script::ScriptProcess()` client-side events are defined (typically, in
*store/script/main.nut*), then:
	- Load the script by doing:
	```
	::dofile("snoweffect.nut");
	```
	- Add the following line to your `Script::ScriptLoad()` function body:
	```
	::snowEffect.PreloadItems();
	```
	- Add the following line to your `Script::ScriptProcess()` function body:
	```
	::snowEffect.ProcessItems();
	```

## Snow Effect behavior
Uniquely customize how the Snow Effect behaves on your server by messing with
the values of the following identifiers defined in `snoweffect.nut`:

### Constants
- (int) `MAX_SNOW_EFFECT_ITEMS`
	- **Description:** How many snow items (sprites) should be visible on the
	screen at the same time.
	- **Acceptable values:** Any integer greater than 0.
	- **Default value:** 16
- (float) `MIN_SNOW_EFFECT_ITEM_SIZE`
	- **Description:** Minimum size a snow item (sprite) can have.
	- **Acceptable values:** Any floating-point greater than 0.0.
	- **Default value:** 0.01
- (float) `MAX_SNOW_EFFECT_ITEM_SIZE`
	- **Description:** Maximum size a snow item (sprite) can have.
	- **Acceptable values:** Any floating-point greater than or equal to
	`MIN_SNOW_EFFECT_ITEM_SIZE`.
	- **Default value:** 0.05
- (float) `SNOW_EFFECT_ITEM_SPEED`
	- **Description:** Speed at which snow items (sprites) fall down (will vary
	depending on client frame rate).
	- **Acceptable values:** Any floating-point greater than 0.0.
	- **Default value:** 0.025

### Table keys
- (bool) `snowEffect.enabled`
	- **Description:** Whether the snow effect is enabled or not. When set to
	`true` it will remain enabled, disabled otherwise. This is useful when for
	example a player enters an interior -- you would want to disable the snow
	effect for that specific player in this case.
	- **Acceptable values:** either `true` or `false`.
	- **Default value:** `true`

Please note that by not following the **acceptable values** for the above
constants/keys may, or may not lead to undesired behavior.