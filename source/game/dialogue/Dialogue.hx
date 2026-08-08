package game.dialogue;

import flixel.addons.text.FlxTypeText;

class Dialogue extends ShiftSpriteGroup
{
    public var textSpr:FlxTypeText;
    public var box:ShiftSprite;
    public var text:String;

    public function new(text:String)
    {
        this.text = text;
        super();
    }

    override function create() 
    {
        scrollFactor.set();

        box = new ShiftSprite();
        box.makeGraphic(FlxG.width - 40, Math.round((FlxG.height/3) - 20), 0x000000);

        textSpr = new FlxTypeText(box.x + 10, box.y + 10, Math.round(box.width) - 10, text, 16);
        textSpr.start();

        y = FlxG.height - box.height - 20;

        add(box);
        add(textSpr);
    }
}