# Snow Effect for Vice City: Multiplayer (VC:MP) 0.4 servers
Find out what it looks like by clicking the image below:

[![VCMP | Snow Effect](https://img.youtube.com/vi/XKcfGlijQAk/0.jpg)](https://www.youtube.com/watch?v=XKcfGlijQAk)

## Installation steps
- Download this repository by clicking on
[*Code > Download ZIP*](https://github.com/sfwidde/vcmp-snow-effect/archive/refs/heads/main.zip).
- Open up the **.zip file you just downloaded** and extract the `store` folder
found in it to your server's directory.
- With a text editor, open the script file where your `Script::ScriptLoad()`
and `Script::ScriptProcess()` client-side functions are defined (typically, in
*store/script/main.nut*), then:
	- Load the script via:
	```
	dofile("snoweffect.nut");
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
### Constants (defined in `snoweffect.nut`)
- `MAX_SNOW_EFFECT_ITEMS`
	- **Description:** How many snow items should be visible on the screen at
	the same time.
	- **Type:** int
	- **Acceptable values:** Any integer greater than or equal to 1.
- `MIN_SNOW_EFFECT_ITEM_SIZE`
	- **Description:** Minimum size a snow item (sprite) can have.
	- **Type:** float
	- **Acceptable values:** Any floating-point greater than 0.0.
- `MAX_SNOW_EFFECT_ITEM_SIZE`
	- **Description:** Maximum size a snow item (sprite) can have.
	- **Type:** float
	- **Acceptable values:** Any floating-point greater than or equal to
	`MIN_SNOW_EFFECT_ITEM_SIZE`.

### Table keys
- `snowEffect.enabled`
	- **Description:** Whether the snow effect is enabled or not. When set to
	`true` it will remain enabled, disabled otherwise. This is useful when for
	example a player enters an interior -- you would want to disable the snow
	effect for that specific player in this case.
	- **Type:** bool
	- **Acceptable values:** either `true` or `false`.

Please note that by not following the acceptable values for the above
constants/keys may, or may not lead to undesired behavior.