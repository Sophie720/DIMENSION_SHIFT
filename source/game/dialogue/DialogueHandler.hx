package game.dialogue;

import game.dialogue.Dialogue;

class DialogueHandler
{
	public static var dialogueExists:Bool = false;
	private static var dialogueQueue:Array<Void->Dialogue> = [];

	public static function start(id:String, ?parameters:DialogueParameters):Dialogue
    {
		var text = Language.getPhrase(id);
		if (text == null)
			text = 'Phrase not found: $id';
		if (dialogueExists) {
			dialogueQueue.push(() -> start(id, parameters));
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

	public static function startMultiple(dialogues:Array<String>, prefix:String = '')
	{
		for (dialogue in dialogues)
			start(prefix + dialogue);
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