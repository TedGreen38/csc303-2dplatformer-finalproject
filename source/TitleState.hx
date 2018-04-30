package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;

class TitleState extends FlxState
{
	
	private var titleText:FlxText;
	private var enterText:FlxText;
	private var authorText:FlxText;
	private var enterPause = 0;
	private var startTimer = 0;
	private var start = false;
	
	override public function create():Void
	{
		super.create();
		
		//sets format for text on the screen
		titleText = new FlxText(0, 20, 500); // x, y, width
		enterText = new FlxText(0, 390, 500); // x, y, width
		authorText = new FlxText(0, 450, 500); // x, y, width
		
		titleText.text = "Final Rush";
		enterText.text = "Press 'Space' to Start!";
		authorText.text = "Created By Ted Green. 2018";
		
		titleText.setFormat(140, FlxColor.WHITE, CENTER);
		titleText.setBorderStyle(OUTLINE, FlxColor.RED, 6);
		
		enterText.setFormat(20, FlxColor.YELLOW, CENTER);
		enterText.setBorderStyle(OUTLINE, FlxColor.RED, 2);
		
		authorText.setFormat(8, FlxColor.WHITE, CENTER);
		
		//adds text to screen
		add(titleText);
		add(enterText);
		add(authorText);
		
		//centers text along x-axis
		titleText.screenCenter(FlxAxes.X);
		enterText.screenCenter(FlxAxes.X);
		authorText.screenCenter(FlxAxes.X);
	}

	override public function update(elapsed:Float):Void
	{
		//pressing space starts the game. till then, var "start" is set to false
		if (FlxG.keys.justPressed.SPACE){
			start = true;
		}
		
		//if start = false, flashes enterText for a set interval.
		if (start == false){
			if (enterPause <= 50) {
				enterText.alpha = 1;
				enterPause++;
			}
			else if (enterPause <= 100) {
				enterText.alpha = 0;
				enterPause++;
			}
			else if (enterPause > 100) {
				enterPause = 0;
			}
		}
		
		// if start is true, speeds up flashing of enter text for a short period of time
		// afterwards, starts game when startTimer reaches a certain value
		if (start == true){
			if (enterPause <= 7) {
				enterText.alpha = 1;
				enterPause++;
			}
			else if (enterPause <= 14) {
				enterText.alpha = 0;
				enterPause++;
			}
			else if (enterPause > 14) {
				enterPause = 0;
				startTimer++;
				
				if (startTimer == 8){
					start = false;
					startTimer = 0;
					enterPause = 0;
					FlxG.switchState(new PlayState());
				}
			}
		}
		super.update(elapsed);
	}
}