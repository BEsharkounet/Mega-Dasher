using Godot;
using System;
using System.Runtime.CompilerServices;

// colors doc :
// Deep Plum (#4A2040) – A rich, dark purple for depth.
// Midnight Teal (#174A54) – A deep but slightly muted teal for contrast.
// Dusky Rose (#80384C) – A warm, dark reddish shade.
// Burnt Peach (#D48A67) – A soft, warm, slightly muted orange-yellow for clarity.
// Shadow Indigo (#2F3254) – A deep, moody blue for balance.
// Olive Dusk (#7A6A40) – A toned-down, earthy green for variety.

// Background: Midnight Teal (#174A54) → Dark, but not too harsh, giving a good base.
// Buttons: Burnt Peach (#D48A67) (Main CTA) → Stands out while staying harmonious.
// Secondary Buttons / Hover Effects: Dusky Rose (#80384C) → Gives warmth without being aggressive.
// Text / Icons: Deep Plum (#4A2040) or Shadow Indigo (#2F3254) for good readability.
// Accents / Highlights: Olive Dusk (#7A6A40) → Adds variety without overwhelming.

// Suggestion pour les transitions :
// Pale Apricot (#E8B88F) → Un beige chaud et pastel, assez lumineux pour trancher avec le fond sans être agressif.

public partial class Menu : Control
{
	#region private properties

	private Sprite2D _spriteCircle;

	#endregion

	#region overrides

	public override void _Ready()
	{
		base._Ready();

		GetNodes();
		SetCircleColor();
	}

	#endregion

	#region private methods

	private void GetNodes()
	{
		_spriteCircle = GetNode<Sprite2D>("Control/SpriteCircle");
	}

	private void SetCircleColor()
	{
		_spriteCircle.Modulate = new Color("#D48A67");
	}

	#endregion
}
