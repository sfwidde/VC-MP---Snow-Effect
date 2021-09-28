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
        if (isEnabled)
        {
            local currentTicks = ::Script.GetTicks();

            if ((currentTicks - lastSpriteCreationTicks) > spriteCreationFrequency)
            {
                local newSprite = ::GUISprite();
                local screenWidth = ::GUI.GetScreenSize().X;
                local spriteSize = screenWidth * ((::rand() % (maxSpriteSize + 1) + maxSpriteSize) * 0.01);

                newSprite.SetTexture(::format("ice%d.png", ::rand() % 2));
                newSprite.Size     = ::VectorScreen(spriteSize, spriteSize - 5.0);
                newSprite.Position = ::VectorScreen(::rand() % (screenWidth - spriteSize), spriteSize * -1.0);
                newSprite.Colour   = ::Colour(255, 255, 255, 255);

                elementsHandler.append(newSprite);
                lastSpriteCreationTicks = currentTicks;
            }
        }

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
            default:     throw ::format("argType is '%s'; must be 'bool'", argType);
        }
    }

    function SetCreationFrequency(ms)
    {
        local argType = typeof ms;

        switch (argType)
        {
            case "integer": spriteCreationFrequency = ms; break;
            default:        throw ::format("argType is '%s'; must be 'integer'", argType);
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
                else throw ::format("size is %u; it must be <= 25", size);
            }
            else throw ::format("size is %d; it must be > 0", size);

            break;

            default:
            throw ::format("argType is '%s'; must be 'integer'", argType);
        }
    }
};
