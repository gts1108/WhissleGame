package sprite;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;

class Bird extends FlxSprite
{
    public var GRAVITY = 400; //ms^-2
    public var JUMP_FORCE = 200;
    private static inline var DRAG = 50;
    
    public function new(x:Float, y:Float)
    {
        super(x,y);
        loadGraphic("assets/images/bird.jpg");
        
        setGraphicSize(200);
        updateHitbox();
        
        //this.drag.set(0, DRAG);
        //acceleration.y = GRAVITY;
        maxVelocity.y = 300;
          
    }

    
    override function update(elapsed:Float) 
    {  
        super.update(elapsed);
        acceleration.y = GRAVITY;
        if(FlxG.keys.justPressed.SPACE || FlxG.keys.justPressed.C )
        {
            
            velocity.y = -JUMP_FORCE; 
        }
    }
}