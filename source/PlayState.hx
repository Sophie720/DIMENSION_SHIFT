package;

import flixel.FlxState;
import game.dialogue.DialogueHandler;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();

		DialogueHandler.startDialogue('Hello everybody my name is markiplier');
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
