package sprite;

import flixel.FlxSprite;
import flixel.util.FlxColor;


class Bullet extends FlxSprite
{
    public function new(x:Float, y:Float)
    {
        super(x,y);
        makeGraphic(32,32,FlxColor.GRAY);
    }
    override function update(elapsed:Float) {
        super.update(elapsed);
        velocity.set(50, 0);
        
        if(!isOnScreen())
        {
            kill();
        }
    }
}