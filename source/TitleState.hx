package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;


class TitleState extends FlxState
{
	
	private var titleText:FlxText;
	private var enterText:FlxText;
	private var authorText:FlxText;
	private var enterPause = 0;
	private var start = false;
	
	override public function create():Void
	{
		super.create();
		
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
		
		add(titleText);
		add(enterText);
		add(authorText);
		
		titleText.screenCenter(FlxAxes.X);
		enterText.screenCenter(FlxAxes.X);
		authorText.screenCenter(FlxAxes.X);
	}

	override public function update(elapsed:Float):Void
	{
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
		
		super.update(elapsed);
	}
}