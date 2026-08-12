package;

import game.menus.objects.OptionText;

class ActSelectState extends ShiftState
{
    var options:Array<OptionText> = new Array();
    var curSelected = 0;

    var acts = [0, 1, 2];

    function changeSelection(change:Int = 0):Void
    {
        options[curSelected].selected = false;
        curSelected = (curSelected + change + options.length) % options.length;
        options[curSelected].selected = true;
    }

    override function create()
    {
        openfl.Lib.application.window.title = 'DIMENSION/SHIFT';
        super.create();

        var text = makeText(0, 0, Language.getPhrase('menu.acts.title'), true);

        var y:Float = 150;

        for (act in acts)
        {
            var option = new OptionText(0, y, '', 32);
            option.text = ' ACT ${act+1}';
            option.screenCenter(X);
            add(option);
            options.push(option);
            y += 48;
        }
        options[curSelected].selected = true;
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
            Main.setAct(acts[curSelected]);
        }
    }
}