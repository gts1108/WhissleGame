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
		velocity.set(0, 0);
		maxVelocity.set(350, 350);
          
    }

    
    override function update(elapsed:Float) 
    {  
        super.update(elapsed);
        acceleration.y = GRAVITY;
		velocity.x = 0;

		if (FlxG.keys.pressed.D)
		{
			velocity.x = JUMP_FORCE;
		}
		else if (FlxG.keys.pressed.A)
		{
			velocity.x = -JUMP_FORCE;
		}

		if (FlxG.keys.justPressed.SPACE || FlxG.keys.justPressed.W)
        {
            
            velocity.y = -JUMP_FORCE; 
        }
    }
}