package game;

import flixel.util.FlxColor;

class PlayState extends ShiftState
{
	public static var curMap:String;
	var hscript:HScript;

	private var nextX:Float;
	private var nextY:Float;

	public var player:Player;
	public static var moveSpeed:Float = 150;

	public static function loadMap(map:String, x:Float, y:Float)
		FlxG.switchState(new PlayState(map, x, y));

	override public function new(map:String, x:Float, y:Float)
	{
		hscript = new HScript('maps/' + map);
		curMap = map;
		nextX = x;
		nextY = y;
		super();
	}

	override public function create()
	{
		var bg = new FlxSprite();
		bg.makeGraphic(1, 1, FlxColor.GRAY);
		bg.scale.set(FlxG.width * 2, FlxG.height * 2);
		add(bg);

		player = new Player(nextX, nextY, 'blobette');
		player.screenCenter();
		add(player);

		player.addFollower('blobette').color = FlxColor.RED;

		super.create();

		hscript.call('create');
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		hscript.call('update', [elapsed]);
		if (!DialogueHandler.dialogueExists)
			postUpdate(elapsed);
	}

	public function postUpdate(elapsed:Float)
	{
		hscript.call('postUpdate', [elapsed]);

		var speed = moveSpeed;

		if ((Controls.LEFT || Controls.RIGHT) && (Controls.UP || Controls.DOWN))
			speed /= Math.sqrt(2);

		if (Controls.LEFT)
			player.x -= speed * elapsed;
		if (Controls.RIGHT)
			player.x += speed * elapsed;

		if (Controls.UP)
			player.y -= speed * elapsed;
		if (Controls.DOWN)
			player.y += speed * elapsed;
	}
}