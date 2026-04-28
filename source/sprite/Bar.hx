package sprite;

import flixel.FlxSprite;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;

class Bar extends FlxBar
{
    public function new(player:FlxSprite)
    {
        super(player.x, player.y);
        
        createColoredEmptyBar(FlxColor.TRANSPARENT, false, FlxColor.GREEN, 2);
    }

    public function extendBar()
    {
        value++;
    }

    public function shortendBar()
    {
        value--;
    }

    public function setToZero()
    {
        value = 0;
    }
}