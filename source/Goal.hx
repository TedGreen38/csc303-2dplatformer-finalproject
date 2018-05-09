package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

/**
 * ...
 * @author Ted Green
 */
class Goal extends FlxSprite
{

public function new(?X:Float=0, ?Y:Float=0)
	{
		super(X, Y);
		this.makeGraphic(25, 25, FlxColor.GREEN);
		set_immovable(true);
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
}