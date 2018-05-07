package;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.math.FlxRandom;

/**
 * ...
 * @author Ted Green
 */
class Star extends FlxSprite
{

	static var RNG:FlxRandom = new FlxRandom();
	
	private var speedX:Float = RNG.float( -600, -400);
	private var size = RNG.int( 3, 9);
	
	
	public function new(?X:Float=0, ?Y:Float=0)
	{
		super(X, Y);
		this.makeGraphic(size, size, FlxColor.GRAY);
		
		this.velocity.x += speedX;

	}
	
	override public function update(elapsed:Float):Void
	{
		if (this.isOnScreen() == false){
			this.destroy;
		}
	
		super.update(elapsed);
	}
	

	
}