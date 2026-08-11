package game.menus;

import game.menus.objects.OptionText;

class TitleState extends ShiftState
{
    var options:Array<String> = ['start', 'options', 'mods'];
    var optionsText:Map<String, OptionText> = new Map();
    var curSelected = 0;

    private function makeText(x:Float, y:Float, text:String, center:Bool = false, size:Int = 16):FlxText
    {
        var text = new FlxText(x, y, text);
        text.setFormat(Paths.getFont('font'), size);
        if (center) text.screenCenter(X);
        add(text);
        return text;
    }

    override function create()
    {
        super.create();

        FlxG.mouse.visible = false;

        var bg = new ShiftSprite(0, 0, Paths.getImage('act1'));
        bg.setGraphicSize(FlxG.width, FlxG.height);
        bg.screenCenter();
        bg.antialiasing = false;
        add(bg);

        var text = makeText(0, 50, 'DIMENSION/SHIFT', true);
        var version = makeText(0, FlxG.height, 'v' + Main.gameVersion, false, 12);
        version.y -= version.height;
        makeText(0, text.y + text.height, 'ACT 1', true);

        var i = 0;
        for (option in options)
        {
            optionsText.set(option, new OptionText(0, (FlxG.height/4)*2 + text.height*i, option));
            optionsText.get(option).screenCenter(X);
            add(optionsText.get(option));
            i++;
        }

        optionsText.get(options[curSelected]).selected = true;
    }

    function changeSelection(change:Int = 0):Void
    {
        optionsText.get(options[curSelected]).selected = false;
        curSelected = (curSelected + change + options.length) % options.length;
        optionsText.get(options[curSelected]).selected = true;
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        if (Controls.DOWN_P)
            changeSelection(1);
        else if (Controls.UP_P)
            changeSelection(-1);

        if (Controls.ACCEPT_P)
        {
            switch (options[curSelected])
            {
                case 'start':
                    PlayState.loadMap('test');

                case 'options':
                    trace('todo');

                case 'mods':
                    trace('todo');
            }
        }
    }
}