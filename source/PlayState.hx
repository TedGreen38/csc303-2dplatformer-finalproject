package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;
import flixel.math.FlxRandom;

class PlayState extends FlxState
{
	static var RNG:FlxRandom = new FlxRandom();
	
	//Timer Variables
	private var game_Timer = 15;
	private var start_Time = 30;
	private var seconds = 0;
	private var timesUp_Timer = 0;
	private var timesUp_Final = 120;
	
	//Level Count Variables
	private var clear_count = 0;
	private var clear_max = 4;
	
	//ship spawn coordinates 
	private var SHIP_START_X = 0;
	private var SHIP_START_Y = 0;
	
	//goal coordinates
	private var GOAL_X = 0;
	private var GOAL_Y = 0;
	
	//text variables
	private var timerText:FlxText;
	private var authorText:FlxText;
	
	//enviornmental variables
	private var starX:Float = 630;
	private var starY:Float = 0;
	private var star:Star;
	
	// level and player variables
	private var map:FlxTilemap;
	private var player:Ship;
	private var goal:Goal;
	
	override public function create():Void
	{
		super.create();
		
		//creates and adds in assets such as the player ship and the current level
		initiate_START();
		initiate_Text();
		addAll();
	}
	
	private function initiate_Text():Void {
		//creates text that displays the time on the screen
		timerText = new FlxText(0, 20, 500); // x, y, width
		timerText.text = "" + game_Timer;
		timerText.setFormat(30, FlxColor.WHITE, CENTER);
		timerText.screenCenter(FlxAxes.X);
		
		//creates text that displays author content
		authorText = new FlxText(0, 450, 500); // x, y, width
		authorText.text = "Created By Ted Green. 2018";
		authorText.setFormat(8, FlxColor.WHITE, CENTER);
		authorText.screenCenter(FlxAxes.X);
	}
	
	private function addAll():Void {
		add(map);
		add(player);
		add(goal);
		add(timerText);
		add(authorText);
	}
	
	//array based level layouts that is based on how many levels are cleared
	private function initiate_Level():Void {
		
		// level 1
		if (clear_count == 0) {
			SHIP_START_X = 96;
			SHIP_START_Y = 370;
			GOAL_X = 550;
			GOAL_Y = 160;
			map.loadMapFromArray([
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,
			1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,1,
			1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,
			1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,
			1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
			1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
			1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			20, 15, AssetPaths.Brick__png, 32, 32);
		}
		
		// level 2
		if (clear_count == 1) {
			SHIP_START_X = 310;
			SHIP_START_Y = 128;
			GOAL_X = 310;
			GOAL_Y = 352;
			map.loadMapFromArray([
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,1,
			1,1,1,1,1,1,0,0,0,1,1,0,0,0,1,1,1,1,1,1,
			1,1,1,1,1,0,0,0,0,1,1,0,0,0,0,1,1,1,1,1,
			1,1,1,1,1,1,0,0,0,1,1,0,0,0,1,1,1,1,1,1,
			1,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			20, 15, AssetPaths.Brick__png, 32, 32);
		}
		
		// level 3
		if (clear_count == 2) {
			SHIP_START_X = 96;
			SHIP_START_Y = 80;
			GOAL_X = 550;
			GOAL_Y = 380;
			map.loadMapFromArray([
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,
			1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,
			1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,
			1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
			1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,
			1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,
			1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
			1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
			1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			20, 15, AssetPaths.Brick__png, 32, 32);
		}
		
		// level 4
		if (clear_count == 3) {
			SHIP_START_X = 70;
			SHIP_START_Y = 320;
			GOAL_X = 448;
			GOAL_Y = 120;
			map.loadMapFromArray([
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,0,0,1,1,1,1,0,0,1,1,1,0,0,0,0,0,0,1,1,
			1,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,0,0,0,1,
			1,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,0,0,0,1,
			1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,
			1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,1,
			1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,1,
			1,0,0,0,1,1,0,0,0,1,1,1,0,0,0,0,0,0,0,1,
			1,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,0,0,0,1,
			1,0,0,0,1,1,0,0,0,1,1,0,0,0,1,1,0,0,0,1,
			1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
			1,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			20, 15, AssetPaths.Brick__png, 32, 32);
		}
		// level 5
		if (clear_count == 4) {
			SHIP_START_X = 544;
			SHIP_START_Y = 400;
			GOAL_X = 384;
			GOAL_Y = 235;
			map.loadMapFromArray([
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,
			1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,
			1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,1,1,
			1,1,1,1,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,1,
			1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,1,1,
			1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,1,
			1,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,
			1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
			1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			20, 15, AssetPaths.Brick__png, 32, 32);
		}

	}

	//Spawns a brand new ship and a brand new goal at the start of the game
	private function initiate_START():Void {
		map = new FlxTilemap();
		initiate_Level();
		player = new Ship(SHIP_START_X, SHIP_START_Y);
		goal = new Goal(GOAL_X, GOAL_Y);
	}
	
	private function initiate_Ship_And_Goal():Void {
		
		//player coordinates based on map
		player.x = SHIP_START_X;
		player.y = SHIP_START_Y;
		
		//slows down player when new level loads
		player.velocity.x = 0;
		player.velocity.y = 0;
		
		//goal coordinates based on map
		goal.x = GOAL_X;
		goal.y = GOAL_Y;
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
		
		//if player collides with the wall, send ship back to spawn point
		if (FlxG.collide(player, map)){
			player.x = SHIP_START_X;
			player.y = SHIP_START_Y;
		}
		
		//if the player reaches the goal before time runs out, load next level
		if (FlxG.collide(player, goal)){
			//if player clears 5th level, end game in WinState
			//else, add 1 to clear_count, reset timers, and load new level and coordinates
			if (clear_count == clear_max){
				FlxG.switchState(new WinState());
			} else if (clear_count < clear_max){
				clear_count++;
				game_Timer = 15;
				seconds = 0;
				initiate_Level();
				initiate_Ship_And_Goal();
			}
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
		} else if (game_Timer == 15){
			timerText.setFormat(30, FlxColor.WHITE, CENTER);
		}
	}
}