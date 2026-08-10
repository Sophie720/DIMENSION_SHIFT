package game;

import flixel.util.FlxColor;

class PlayState extends ShiftState
{
	var hscript:HScript;

	override public function new(state:String)
	{
		hscript = new HScript(state);
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
