# Snow Effect for Vice City: Multiplayer (VC:MP) 0.4
Find out [_what does it look like_](https://youtu.be/vtSrnNbO_vs).
### Installation steps
- Download this repository by clicking on *Code > Download ZIP*.
- Paste the *store* folder found in the .zip file you just downloaded to your server's directory.
- Go to the file where your `Script::ScriptLoad()` and `Script::ScriptProcess()` client-side functions are defined (typically, in *store/script/main.nut*), then:
  - Load the script by adding `dofile("snoweffect.nut");` at the very top of your main script.
  - Append `::snowEffect.PreloadItems();` to your `Script::ScriptLoad()` function body.
  - Append `::snowEffect.ProcessItems();` to your `Script::ScriptProcess()` function body.
  - If you followed the steps correctly your main script would end up looking more or less like this:
    ```
    ...
    dofile("snoweffect.nut");
    ...
    
    function Script::ScriptLoad()
    {
      ...
    	::snowEffect.PreloadItems();
    	...
    }
    
    function Script::ScriptProcess()
    {
      ...
    	::snowEffect.ProcessItems();
    	...
    }
    ```

### Snow Effect behaviour
You can control how the Snow Effect behaves for every player in your server by changing the value that the following key hold:
- `snowEffect.enabled`
  - **Type:** *bool*.
  - **Acceptable values:** either `true` or `false`.
  - **Description:** whether the Snow Effect is enabled or not. When set to `true` it will remain enabled, disabled otherwise. This is useful when for example your player enters an interior -- you would want to disable the snow effect in such scenario.

Please note that by not following the acceptable values for the above key may, or may not lead to undesired behaviour.
