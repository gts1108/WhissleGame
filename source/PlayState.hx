package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
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
import sprite.Bullet;
import sprite.Enemy;

class PlayState extends FlxState
{
	var bar:Bar;
	var bird:Bird;
	
	

	var text:FlxText;
	var gravityText:FlxText;
	var jumpForceText:FlxText;
	var barValueText:FlxText;

	var gravityUpButton:FlxButton;
	var gravityDownButton:FlxButton;
	
	var jumpForceUpButton:FlxButton;
	var jumpForceDownButton:FlxButton;

	var bullets:FlxTypedGroup<Bullet>;
	var enemies:FlxTypedGroup<Enemy>;
	override public function create()
	{
		super.create();


		text = new FlxText(0, 0, 0, "Hold to whissle", 64);
		bird = new Bird(20, 100);
		bar = new Bar(bird);
		bullets = new FlxTypedGroup<Bullet>();
		enemies = new FlxTypedGroup<Enemy>();
		

		gravityUpButton = new FlxButton(100, 50, "+", clickGravityUp);
		gravityDownButton = new FlxButton(20, 50, "-", clickGravityDown);
		gravityText = new FlxText(gravityUpButton.x - gravityDownButton.x, 50, 0);
		
		jumpForceUpButton = new FlxButton(580, 50, "+", clickJumpForceUp);
		jumpForceDownButton = new FlxButton(500, 50, "-",clickJumpForceDown);
		jumpForceText = new FlxText(jumpForceDownButton.x + 40, 50, 0);

		barValueText = new FlxText(1000, 50, 0);

		text.screenCenter();
		#if debug
		add(gravityUpButton);
		add(gravityDownButton);
		add(gravityText);
		
		add(jumpForceUpButton);
		add(jumpForceDownButton);
		add(jumpForceText);
		add(barValueText);

		#end
		add(bird);
		add(enemies);
		add(bullets);
		
		add(bar);
		add(text);
		
		bar.onShoot = shootBullets;
		
	}
	
	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		gravityText.text = "Gravity:" + bird.GRAVITY;
		jumpForceText.text = "Jump Force:" + bird.JUMP_FORCE;
		barValueText.text = "Bar: " + Std.string(Std.int(bar.value));

		FlxG.overlap(bullets, enemies, onBulletOverlapEnemies);
	}

	private function shootBullets()
	{
		trace("SHOOT SHOOT");
		
		var bullet = bullets.getFirstDead();

		if (bullet == null)
		{
			bullet = new Bullet(bird.x, bird.y);
			bullets.add(bullet);
		}
		bullet.reset(bird.x, bird.y);
		
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
	function onBulletOverlapEnemies(_bullets:Bullet, _enemies:Enemy)
	{
		_bullets.kill();
		_enemies.kill();
	}
}
