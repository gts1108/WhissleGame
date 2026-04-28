package;

import flixel.FlxGame;
import lime.app.Application;
import openfl.display.Sprite;

class Main extends Sprite
{
	public var game_width = 1280;
	public var game_height = 720;
	public function new()
	{
		super();
		#if web
		Application.current.window.element.style.setProperty("image-rendering", "pixelated");
		#end 
		addChild(new FlxGame(game_width,game_height, PlayState));
	}
}
