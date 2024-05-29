/*
 * https://github.com/sfwidde/vcmp-snow-effect
 * Snow Effect for Vice City: Multiplayer (VC:MP) 0.4
 * Author: sfwidde ([R3V]Kelvin)
 * 2020-12-14
*/

const MAX_SNOW_EFFECT_ITEMS     = 16;
const MIN_SNOW_EFFECT_ITEM_SIZE = 0.01;
const MAX_SNOW_EFFECT_ITEM_SIZE = 0.05;
const SNOW_EFFECT_ITEM_SPEED    = 0.025;

class SnowItem
{
	sprite = null;
}

function SnowItem::constructor()
{
	sprite = ::GUISprite();
	sprite.Color = ::Colour(255, 255, 255);
	Rewind();
}

function SnowItem::Rewind()
{
	local x = ::snowEffect.RandomFloat(MIN_SNOW_EFFECT_ITEM_SIZE, MAX_SNOW_EFFECT_ITEM_SIZE);
	local size = ::snowEffect.RelativeVectorScreen(x, x * 1.75);
	// Random texture. You can add/edit/remove textures too!
	sprite.SetTexture("ice" + ::snowEffect.RandomInt(0, 1) + ".png");
	sprite.Size = size;
	sprite.Position = ::VectorScreen(::snowEffect.RandomInt(0, ::GUI.GetScreenSize().X - size.X), -size.Y);
	sprite.Alpha = ::snowEffect.RandomInt(15, 255);
}

function SnowItem::Process()
{
	// Does item need to be rewound i.e. it is not visible on the screen anymore?
	if (sprite.Position.Y > ::GUI.GetScreenSize().Y)
	{
		return true;
	}

	// Calculation based on sprite size, simulating its weight as if it were a real-life object.
	// ceil() will help to prevent small items from being stuck on the screen forever
	// by never moving downwards on small resolutions.
	sprite.Position.Y += ::ceil((sprite.Size.X + sprite.Size.Y) * SNOW_EFFECT_ITEM_SPEED);
	return false;
}

snowEffect <-
{
	items   = ::array(MAX_SNOW_EFFECT_ITEMS),
	enabled = true
};

function snowEffect::PreloadItems()
{
	for (local i = 0; i < MAX_SNOW_EFFECT_ITEMS; ++i)
	{
		items[i] = ::SnowItem();
	}
}

function snowEffect::ProcessItems()
{
	foreach (item in items)
	{
		// Don't rewind if
		// - current item doesn't need to be rewound yet, or
		// - the snow effect is disabled (items will still be processed if so anyway
		// so that on-screen items don't suddenly freeze if we decide to disable
		// the snow effect at some point).
		if (!item.Process() || !enabled)
		{
			continue;
		}

		item.Rewind();
	}
}

// ----------------------------------------------------------------------------
/* Utility functions */
// ----------------------------------------------------------------------------

function snowEffect::RelativeVectorScreen(x, y)
{
	local screenSize = ::GUI.GetScreenSize();
	return ::VectorScreen((screenSize.X * x).tointeger(), (screenSize.Y * y).tointeger());
}

function snowEffect::RandomInt(min, max)
{
	return min + (::rand() % (max - min + 1));
}

function snowEffect::RandomFloat(min, max)
{
	// https://stackoverflow.com/a/686373/14197165
	return min + (::rand() / (RAND_MAX.tofloat() / (max - min)));
}
