package sprite;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Enemy extends FlxSprite
{
    public function new(x:Float, y:Float)
    {
        super(x,y);
        makeGraphic(64, 64, FlxColor.RED);
    }

    override function update(elapsed:Float) 
    {
        super.update(elapsed);
        velocity.set(-50, 0);
        
    }
}