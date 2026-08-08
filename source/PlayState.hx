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

		DialogueHandler.startDialogue('This is a test!');
		DialogueHandler.startDialogue('and some more and more');
		DialogueHandler.startDialogue('We can have as much dialogue as we want it works in a cool queue');
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
