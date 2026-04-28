package util;

import flixel.FlxG;
import flixel.input.gamepad.FlxGamepad;

class Controls
{
    var gamePad:FlxGamepad;

    public function addGamePad(elapsed:Float)
    {
        gamePad = FlxG.gamepads.lastActive;
        if(gamePad !=null)
        {
            UpdateGamePad(gamePad);
        }
    }

    public function UpdateGamePad(gamepad:FlxGamepad)
    {

    }
}