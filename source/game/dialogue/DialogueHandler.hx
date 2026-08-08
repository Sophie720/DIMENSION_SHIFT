package game.dialogue;

import game.dialogue.Dialogue;

class DialogueHandler
{
	public static var dialogueExists:Bool = false;
	private static var dialogueQueue:Array<Void->Dialogue> = [];

	public static function startDialogue(text:String, ?parameters:DialogueParameters):Dialogue
    {
		if (dialogueExists) {
			dialogueQueue.push(() -> startDialogue(text, parameters));
			return null;
		}


		@:privateAccess
		var dialogue = new Dialogue(text, parameters);

		if (ShiftState.state != null)
			dialogue.cameras = [ShiftState.state.camDialogue];
        FlxG.state.add(dialogue);
		dialogueExists = true;

        return dialogue;
    }
	private static function dialogueDestroyed() {
		dialogueExists = false;

		if (dialogueQueue != null) {
			if (dialogueQueue.length < 1)
				return;
			var next = dialogueQueue[0];
			dialogueQueue.remove(next);
			next();
		}
	}
}