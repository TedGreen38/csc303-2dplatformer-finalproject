package;

import flixel.FlxG;
import flixel.FlxSprite;

/**
 * ...
 * @author Ted Green
 */

class Ship extends FlxSprite
{

	private var MAX_X = 250;
	private var MAX_Y = 250;
	
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		makeGraphic(20, 20);
		this.maxVelocity.set(MAX_X, MAX_Y);
	}
	
	override public function update(elapsed:Float):Void
	{
		
		if (FlxG.keys.pressed.W){
			this.velocity.y += -5;
			this.angle = 90;
		}
		
		if (FlxG.keys.pressed.S){
			this.velocity.y += 5;
			this.angle = 270;
		}
		
		if (FlxG.keys.pressed.D){
			this.velocity.x += 5;
			this.angle = 0;
		}
		
		if (FlxG.keys.pressed.A){
			this.velocity.x += -5;
			this.angle = 180;
		}
		
		super.update(elapsed);
	}
}