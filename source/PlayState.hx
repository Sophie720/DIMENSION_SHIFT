package;

import flixel.util.FlxColor;

class PlayState extends ShiftState
{
	override public function create()
	{
		var bg = new FlxSprite();
		bg.makeGraphic(1, 1, FlxColor.GRAY);
		bg.scale.set(FlxG.width * 2, FlxG.height * 2);
		add(bg);
		super.create();

		DialogueHandler.startDialogue('test1');
		DialogueHandler.startDialogue('test2');
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
