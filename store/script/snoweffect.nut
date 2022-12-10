// https://github.com/sfwidde/VC-MP-Snow-Effect

const MAX_SNOW_EFFECT_ITEMS = 10;

class SnowItem
{
	sprite = null;
}

function SnowItem::constructor()
{
	sprite = ::GUISprite();
	Rewind();
}

function SnowItem::Rewind()
{
	local ssX = ::GUI.GetScreenSize().X;
	// Screen width * random float between 0.01 and 0.08.
	//
	// Random float generator algorithm:
	// https://stackoverflow.com/a/686373/14197165
	local size = ssX * ((::rand() / (RAND_MAX / 0.07)) + 0.01);

	// Random texture. You can add/edit/remove textures too!
	sprite.SetTexture(::format("ice%u.png", ::rand() % 2));
	sprite.Colour   = ::Colour(255, 255, 255);
	sprite.Size     = ::VectorScreen(size, size);
	sprite.Position = ::VectorScreen(::rand() % (ssX - size + 1), -size);
}

function SnowItem::Process()
{
	// Does item need to be rewound i.e. it's not visible
	// on the screen anymore?
	if (sprite.Position.Y > ::GUI.GetScreenSize().Y)
	{
		return true;
	}

	// Calculation based on sprite size, simulating its weight as if it were an
	// IRL object. ceil() will help to prevent small items from being stuck on
	// the screen forever and never moving downwards on small resolutions.
	sprite.Position.Y += ::ceil((sprite.Size.X + sprite.Size.Y) * 0.03);
	return false;
}

snowEffect <-
{
	items = ::array(MAX_SNOW_EFFECT_ITEMS),

	// Is the snow effect enabled?
	enabled = true
};

function snowEffect::PreloadItems()
{
	// Fill our whole array with new 'SnowItem' objects.
	for (local i = 0; i < MAX_SNOW_EFFECT_ITEMS; ++i)
	{
		items[i] = ::SnowItem();
	}
}

function snowEffect::ProcessItems()
{
	foreach (item in items)
	{
		// Don't rewind if:
		// A) Current item doesn't need to be rewound yet.
		// B) The snow effect is disabled (items will still be processed if so
		// anyway so on-screen items don't suddenly freeze if we decide to
		// disable the snow effect at some point).
		if (!item.Process() || !enabled)
		{
			continue;
		}

		// Rewind it!
		item.Rewind();
	}
}
