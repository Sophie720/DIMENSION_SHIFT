package game;

import flixel.util.FlxColor;

class PlayState extends ShiftState
{
	public static var curMap:String;
	var hscript:HScript;

	public static function loadMap(map:String)
		FlxG.switchState(new PlayState(map));

	override public function new(map:String)
	{
		hscript = new HScript('maps/' + map);
		curMap = map;
		super();
	}

	override public function create()
	{
		var bg = new FlxSprite();
		bg.makeGraphic(1, 1, FlxColor.GRAY);
		bg.scale.set(FlxG.width * 2, FlxG.height * 2);
		add(bg);
		super.create();

		hscript.call('create');
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		hscript.call('update', [elapsed]);
	}
}
