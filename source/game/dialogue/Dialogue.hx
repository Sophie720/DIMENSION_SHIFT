package game.dialogue;

import flixel.addons.text.FlxTypeText;

typedef DialogueParameters = {
	@:optional var skippable:Bool; // defaults to true
}

class Dialogue extends ShiftSpriteGroup
{
    public var textSpr:FlxTypeText;
    public var box:ShiftSprite;
    public var text:String;

	public var skippable:Bool = true;
	public var done:Bool = false;

	function new(text:String, ?parameters:DialogueParameters)
    {
        this.text = text;
		if (parameters != null) {
			if (parameters?.skippable != null)
				skippable = parameters.skippable;
		}
        super();
    }

    override function create() 
    {
        scrollFactor.set();

        box = new ShiftSprite();
        box.makeGraphic(FlxG.width - 40, Math.round((FlxG.height/3) - 20), 0x000000);

        textSpr = new FlxTypeText(box.x + 10, box.y + 10, Math.round(box.width) - 10, text, 16);
		textSpr.completeCallback = function() {
			done = true;
		};
        textSpr.start();

        y = FlxG.height - box.height - 20;

        add(box);
        add(textSpr);
    }
	var curFrame = 0;

	override function update(elapsed:Float) {
		curFrame++;

		super.update(elapsed);

		if (curFrame < 5)
			return;

		if (Controls.ACCEPT_P) {
			if (skippable)
				textSpr.skip();

			if (done) {
				destroy();
			}
		}
	}

	override function destroy() {
		@:privateAccess
		DialogueHandler.dialogueDestroyed();
		super.destroy();
	}
}