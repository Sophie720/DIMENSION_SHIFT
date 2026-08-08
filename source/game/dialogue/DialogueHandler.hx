package game.dialogue;

import game.dialogue.Dialogue;

class DialogueHandler
{
    public static function startDialogue(text:String):Dialogue
    {
        var dialogue = new Dialogue(text);
        FlxG.state.add(dialogue);
        return dialogue;
    }
}