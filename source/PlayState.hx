package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;
import flixel.group.FlxGroup.FlxTypedGroup;

class PlayState extends FlxState
{
	//int variables
	private var game_Timer = 15;
	private var start_Time = 30;
	private var seconds = 0;
	private var timesUp_Timer = 0;
	private var timesUp_Final = 120;
	
	//text variables
	private var timerText:FlxText;
	private var authorText:FlxText;
	
	
	override public function create():Void
	{
		super.create();
		
		var player:Ship = new Ship(360, 240);
		add(player);
		
		//creates text that displays the time on the screen
		timerText = new FlxText(0, 20, 500); // x, y, width
		timerText.text = "" + game_Timer;
		timerText.setFormat(30, FlxColor.WHITE, CENTER);
		add(timerText);
		timerText.screenCenter(FlxAxes.X);
		
		//creates text that displays author content
		authorText = new FlxText(0, 450, 500); // x, y, width
		authorText.text = "Created By Ted Green. 2018";
		authorText.setFormat(8, FlxColor.WHITE, CENTER);
		add(authorText);
		authorText.screenCenter(FlxAxes.X);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		
		if (game_Timer > 0){
			seconds++;
		}
		
		if (seconds == 60){
			game_Timer--;
			seconds = 0;
		}
		
		timerText.text = "" + game_Timer;
		
		if (game_Timer == 10){
			timerText.setFormat(30, FlxColor.YELLOW, CENTER);
		} else if (game_Timer == 5) {
			timerText.setFormat(30, FlxColor.ORANGE, CENTER);
		} else if (game_Timer == 0){
			timerText.text = "Times up!";
			timerText.setFormat(40, FlxColor.RED, CENTER);
			timesUp_Timer++;
			if (timesUp_Timer == timesUp_Final) {
				FlxG.switchState(new LossState());
			}
			
		}
	}
}