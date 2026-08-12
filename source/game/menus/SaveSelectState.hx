package game.menus;

import game.menus.objects.OptionText;

class SaveSelectState extends MenuState
{
    var options:Array<OptionText> = new Array();
    var curSelected = 0;

    function changeSelection(change:Int = 0):Void
    {
        options[curSelected].selected = false;
        curSelected = (curSelected + change + options.length) % options.length;
        options[curSelected].selected = true;
    }

    override function create()
    {
        super.create();

        bg.alpha = 0.5;
        var text = makeText(0, 0, Language.getPhrase('menu.save.title'), true);

        var y:Float = 150;

        for (i in 0...4)
        {
            var option = new OptionText(0, y, '', 32);
            option.text = ' SAVE ${i + 1}';
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

        if (Controls.BACK_P)
            FlxG.switchState(new TitleState());

        if (Controls.ACCEPT_P)
        {
            SaveData.curSave_index = curSelected;
            PlayState.loadMap('test');
        }
    }
}