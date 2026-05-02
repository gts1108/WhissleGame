package sprite;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;
import openfl.geom.ColorTransform;

enum BarState
{
	IDLE; // GREEN
	GROWING; // GREEN
	ALMOST_LIMIT; // Yellow
	// LIMIT; // RED
	DECREASING; // RED
}

class Bar extends FlxBar
{
	private static inline var MAX_VALUE = 200;
	private static inline var MIN_VALUE = 0;

	private var isTweeing:Bool = false;

	public var state:BarState;

	public var onShoot:Void->Void;

    public function new(player:FlxSprite)
    {
		super(player.x, player.y);
		setRange(MIN_VALUE, MAX_VALUE);
		createColoredEmptyBar(FlxColor.TRANSPARENT, false, FlxColor.GREEN, 2);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		handleInput();
		updateState();
	}

	private function handleInput()
	{
		if (isTweeing)
			return;

		if (FlxG.mouse.pressed && state != DECREASING)
		{
			if (value >= MAX_VALUE)
			{
				state = DECREASING;
			}
			else if (value > 150)
			{
				state = ALMOST_LIMIT;
			}
			else
			{
				state = GROWING;
			}
		}
		else if (FlxG.mouse.released)
		{
			if (state != DECREASING)
				FlxTween.cancelTweensOf(this);

			if (value > 120 && onShoot != null)
			{
				state = DECREASING;
				onShoot();
			}
			else
			{
				state = IDLE;
			}
		}
	}

	private function updateState()
	{
		if (isTweeing)
			return;
		switch (state)
		{
			case IDLE:
				resetBar();
			case GROWING:
				growBar(FlxColor.GRAY);
			case DECREASING:
				createFilledBar(FlxColor.TRANSPARENT, FlxColor.RED);
				setToZeroTween();
			case ALMOST_LIMIT:
				growBar(FlxColor.GREEN);
			default:
				resetBar();
		}
	}

	private function resetBar()
	{
		value = 0;
		state = IDLE;
		createFilledBar(FlxColor.TRANSPARENT, FlxColor.GRAY);
	}

	private function growBar(color:FlxColor)
	{
		createFilledBar(FlxColor.TRANSPARENT, color);
		extendBar();
	}

    public function extendBar()
    {
        value++;
    }

    public function shortendBar()
    {
		value--;
	}
	public function setToZeroTween()
	{
		isTweeing = true;

		FlxTween.tween(this, {value: 0}, 2.0, {
			ease: FlxEase.smoothStepOut,
			onComplete: function(_)
			{
				isTweeing = false;
				state = IDLE;
			},
			onUpdate: function(_) {}
		});
	}
}