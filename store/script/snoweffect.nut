/*
* https://github.com/sfwidde/VCMP-Snow-Effect
*
* Snow Effect for Vice City: Multiplayer (VC:MP) 0.4 by sfwidde ([R3V]Kelvin).
*
* December 14, 2020 - September 28, 2021 (UTC).
*/

snowEffect <-
{
    elementHandler = [],
    lastTicks      = 0,
    
    enabled       = true,
    waitTime      = 250,
    maxSpriteSize = 3

    function Process()
    {
        // The snow effect is enabled.
        if (enabled)
        {
            local currentTicks = ::Script.GetTicks();

            if ((currentTicks - lastTicks) >= waitTime)
            {
                // Create a new sprite.
                local newSprite   = ::GUISprite();
                local screenWidth = ::GUI.GetScreenSize().X;
                local spriteSize  = screenWidth * ((::rand() % (maxSpriteSize + 1) + maxSpriteSize) * 0.01);

                newSprite.SetTexture(::format("ice%d.png", ::rand() % 2));
                newSprite.Size     = ::VectorScreen(spriteSize, spriteSize - 5.0);
                newSprite.Position = ::VectorScreen(::rand() % (screenWidth - spriteSize), spriteSize * -1.0);
                newSprite.Colour   = ::Colour(255, 255, 255, 255);

                // Append the created sprite into elementHandler for later access.
                elementHandler.append(newSprite);
                // We let the client know a new sprite has just been created so it must wait a while before creating another sprite again
                // to prevent filling the screen with new sprites on each frame.
                lastTicks = currentTicks;
            }
        }

        // Move on-screen sprites downwards. If they are not visible anymore, delete them.
        foreach (index, sprite in elementHandler)
            if ((sprite.Position.Y += (sprite.Size.X * 0.1)) > ::GUI.GetScreenSize().Y)
                elementHandler.remove(index);
    }
};
