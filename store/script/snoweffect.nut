/*
* Snow effect for Vice City: Multiplayer (VC:MP) by sfwidde ([R3V]Kelvin).
*
* https://github.com/sfwidde/VCMP-Snow-Effect
*
* December 14, 2020 - September 28, 2021 (UTC).
*/

snowEffect <-
{
    elementsHandler = [],
    lastSpriteCreationTicks = 0,

    // Modifiable values.
    isEnabled = true,
    spriteCreationFrequency = 250,
    maxSpriteSize = 3

    function Process()
    {
        // The snow effect is enabled.
        if (isEnabled)
        {
            local currentTicks = ::Script.GetTicks();

            if ((currentTicks - lastSpriteCreationTicks) >= spriteCreationFrequency)
            {
                // Create a sprite.
                local newSprite   = ::GUISprite();
                local screenWidth = ::GUI.GetScreenSize().X;
                local spriteSize  = screenWidth * ((::rand() % (maxSpriteSize + 1) + maxSpriteSize) * 0.01);

                newSprite.SetTexture(::format("ice%d.png", ::rand() % 2));
                newSprite.Size     = ::VectorScreen(spriteSize, spriteSize - 5.0);
                newSprite.Position = ::VectorScreen(::rand() % (screenWidth - spriteSize), spriteSize * -1.0);
                newSprite.Colour   = ::Colour(255, 255, 255, 255);

                // Appends the created sprite instance into an array for later access.
                elementsHandler.append(newSprite);
                // The client now knows we have just created another sprite so it must wait a while before creating another sprite again
                // to avoid filling the screen with new sprites on each frame.
                lastSpriteCreationTicks = currentTicks;
            }
        }

        // Move them downward.
        foreach (index, sprite in elementsHandler)
            if ((sprite.Position.Y += (sprite.Size.X * 0.1)) > ::GUI.GetScreenSize().Y)
                elementsHandler.remove(index);
    }

    function SetEnabled(enabled)
    {
        local argType = typeof enabled;

        switch (argType)
        {
            case "bool": isEnabled = enabled; break;
            default:     throw ::format("argType is '%s' - must be 'bool'", argType);
        }
    }

    function SetCreationFrequency(ms)
    {
        local argType = typeof ms;

        switch (argType)
        {
            case "integer":
            if (ms > 0)
                spriteCreationFrequency = ms;
            else throw ::format("ms is %d - must be > 0", ms);
            
            break;
            
            default:
            throw ::format("argType is '%s' - must be 'integer'", argType);
        }
    }

    function SetMaxSize(size)
    {
        local argType = typeof size;

        switch (argType)
        {
            case "integer":
            if (size > 0)
            {
                if (size <= 25)
                    maxSpriteSize = size;
                else throw ::format("size is %u - must be <= 25", size);
            }
            else throw ::format("size is %d - must be > 0", size);

            break;

            default:
            throw ::format("argType is '%s' - must be 'integer'", argType);
        }
    }
};
