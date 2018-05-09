package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;

class WinState extends FlxState
{
	//number variables
	private var try_Timer = 0;
	private var try_Final = 120;
	
	//text variables
	private var gameoverText:FlxText;
	private var tryAgainText:FlxText;
	private var authorText:FlxText;
	
	override public function create():Void
	{
		super.create();
		
		//creates text that displays author content
		authorText = new FlxText(0, 450, 500); // x, y, width
		authorText.text = "Created By Ted Green. 2018";
		authorText.setFormat(8, FlxColor.WHITE, CENTER);
		add(authorText);
		authorText.screenCenter(FlxAxes.X);
		
		//creates text that displays Game Over
		gameoverText = new FlxText(0, 20, 500); // x, y, width
		gameoverText.text = "YOU WIN!";
		gameoverText.setFormat(120, FlxColor.WHITE, CENTER);
		gameoverText.setBorderStyle(OUTLINE, FlxColor.RED, 6);
		add(gameoverText);
		gameoverText.screenCenter(FlxAxes.X);
		
		//creates text that asks the player to try again
		tryAgainText = new FlxText(0, 340, 500); // x, y, width
		tryAgainText.text = "Press 'Space' to try again.";
		tryAgainText.setFormat(15, FlxColor.WHITE, CENTER);
		tryAgainText.alpha = 0;
		add(tryAgainText);
		tryAgainText.screenCenter(FlxAxes.X);
		
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (try_Timer < try_Final){
			try_Timer++;
		} else {
			tryAgainText.alpha = 1;
		}
		
		if (FlxG.keys.justPressed.SPACE && try_Timer >= try_Final){
			FlxG.switchState(new TitleState());
		}
		
	}
	
}