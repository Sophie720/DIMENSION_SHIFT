package;

import flixel.util.FlxColor;

class PlayState extends ShiftState
{
	var hscript:HScript;

	public function call(func:String, ?args:Array<Dynamic>):Dynamic
	{
		if (hscript != null)
		{
			if (hscript.exists(func))
				return hscript.call(func, args);
		}
		return null;
	}

	override public function create()
	{
		var bg = new FlxSprite();
		bg.makeGraphic(1, 1, FlxColor.GRAY);
		bg.scale.set(FlxG.width * 2, FlxG.height * 2);
		add(bg);
		super.create();

		hscript = new HScript('test');
		call('create');
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		call('update', [elapsed]);
	}
}
