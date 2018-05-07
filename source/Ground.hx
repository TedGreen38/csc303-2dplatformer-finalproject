package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

/**
 * ...
 * @author Ted Green
 */
class Ground extends FlxSprite 
{
	public static var LENGTH(default, never):Int = 32;
	public static var HEIGHT(default, never):Int = 32;

	public function new(?X:Float=0, ?Y:Float=0) {
		super(X, Y);
		makeGraphic(LENGTH, HEIGHT, FlxColor.GRAY);
		set_immovable(true);
	}
	
}