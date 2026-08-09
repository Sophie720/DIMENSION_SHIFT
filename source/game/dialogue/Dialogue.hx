package game.dialogue;

import flixel.addons.text.FlxTypeText;

typedef DialogueParameters = {
	@:optional var skippable:Bool; // defaults to true
	@:optional var sounds:Array<String>;
}

class Dialogue extends ShiftSpriteGroup
{
    public var textSpr:FlxTypeText;
    public var box:ShiftSprite;
    public var text:String;

	public var skippable:Bool = true;
	public var sounds:Array<String> = ['beep'];
	public var done:Bool = false;

	function new(text:String, ?parameters:DialogueParameters)
    {
        this.text = text;
		if (parameters != null) {
			if (parameters?.skippable != null)
				skippable = parameters.skippable;
			if (parameters?.sounds != null)
				sounds = parameters.sounds;
		}
        super();
    }

    override function create() 
    {
        scrollFactor.set();

        box = new ShiftSprite();
		box.makeGraphic(FlxG.width - 40, Math.round((FlxG.height / 2.5) - 20), FlxColor.BLACK);
        
        textSpr = new FlxTypeText(box.x + 10, box.y + 10, Math.round(box.width) - 10, text, 16);
		textSpr.completeCallback = function() {
			done = true;
		};
		textSpr.setFormat(Paths.getFont('font'), 16);
		var soundArr:Array<FlxSound> = new Array();
		for (sound in sounds)
		{
			var curSound = FlxG.sound.load(Paths.getSound(sound));
			soundArr.push(curSound);
		}
		textSpr.sounds = soundArr;
        textSpr.start();

		x += 20;
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

		if (Controls.BACK_P) {
			if (skippable)
			{
				textSpr.skip();
			}
		}

		if (Controls.ACCEPT_P) {
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