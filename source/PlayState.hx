package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxColor;
import flixel.math.FlxRandom;

class PlayState extends FlxState
{
	static var RNG:FlxRandom = new FlxRandom();
	
	//int variables
	private var game_Timer = 15;
	private var start_Time = 30;
	private var seconds = 0;
	private var timesUp_Timer = 0;
	private var timesUp_Final = 120;
	private var clear_count = 0;
	private var clear_max = 5;
	
	private var SHIP_START_X = 0;
	private var SHIP_START_Y = 0;
	
	private var GOAL_X = 0;
	private var GOAL_Y = 0;
	
	
	//text variables
	private var timerText:FlxText;
	private var authorText:FlxText;
	
	//enviornmental variables
	private var starX:Float = 630;
	private var starY:Float = 0;
	private var star:Star;
	
	
	
	
	override public function create():Void
	{
		super.create();
		
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
		
		//adds a player ship into game space
		var player:Ship = new Ship(360, 240);
		add(player);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		//while the game timer is not zero, game will continue
		if (game_Timer > 0){
			seconds++;
		}
		
		if (seconds % 5 == 0){
			//spawns star for a cool background effect
			starY = FlxG.random.float(0, 470);
			star = new Star(starX, starY);
			add(star);
		}
		
		//decreases the game timer by 1 every second
		if (seconds == 60){
			game_Timer--;
			seconds = 0;
		}
		
		//displays the timer on the screen
		timerText.text = "" + game_Timer;
		
		
		//fun little extra where the time changes color based on how much time is left
		//if time's up, goes into the loss state
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