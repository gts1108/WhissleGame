package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.input.gamepad.FlxGamepadButton;
import flixel.input.gamepad.FlxGamepadMappedInput;
import flixel.math.FlxRandom;
import flixel.text.FlxText;
import flixel.ui.FlxBar;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import sprite.Bar;
import sprite.Bird;
import sprite.Enemy;

class PlayState extends FlxState
{
	var bar:Bar;
	var bird:Bird;
	
	

	var text:FlxText;
	var gravityText:FlxText;
	var jumpForceText:FlxText;

	var gravityUpButton:FlxButton;
	var gravityDownButton:FlxButton;
	
	var jumpForceUpButton:FlxButton;
	var jumpForceDownButton:FlxButton;

	override public function create()
	{
		super.create();
		
		text = new FlxText(0,0,0,"Hold to whissle", 64);
		text.screenCenter();
			
		bird = new Bird(20,100);
		bar = new Bar(bird);
		

		gravityUpButton = new FlxButton(100, 50,"+",clickGravityUp);
		gravityDownButton = new FlxButton(20, 50, "-",clickGravityDown);
		gravityText = new FlxText(gravityUpButton.x - gravityDownButton.x,50, 0);
		
		jumpForceUpButton = new FlxButton(580, 50,"+",clickJumpForceUp);
		jumpForceDownButton = new FlxButton(500, 50, "-",clickJumpForceDown);
		jumpForceText = new FlxText(jumpForceDownButton.x + 40 ,50, 0 );
	
		#if debug
		add(gravityUpButton);
		add(gravityDownButton);
		add(gravityText);
		
		add(jumpForceUpButton);
		add(jumpForceDownButton);
		add(jumpForceText);

		#end

		add(bird);
		add(bar);
		add(text);
		
		new FlxTimer().start(5, function (_){add(new Enemy(730,new FlxRandom().float(50,650)));}, 0);

	}
	
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		
		

		bird.update(elapsed);
		
		gravityText.text = "Gravity:"+bird.GRAVITY;
		jumpForceText.text = "Jump Force:"+bird.JUMP_FORCE;

		if(FlxG.mouse.pressed)
		{
			bar.value++;
		}
		else 
		{
			bar.setToZero();
		}
		
	}
	
	function clickGravityUp()
	{
		bird.GRAVITY += 20;
	}
	
	function clickGravityDown()
	{
		bird.GRAVITY -= 20;
	}

	function clickJumpForceUp()
	{
		bird.JUMP_FORCE += 20;
	}
	function clickJumpForceDown()
	{
		bird.JUMP_FORCE -= 20;
	}
}
