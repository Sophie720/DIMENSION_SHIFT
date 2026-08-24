package game.menus;

import game.menus.objects.Option;
import game.menus.objects.Option.OptionType;

class OptionsState extends MenuState
{
    var options = ['developerMode', 'fullscreen'];
    var types:Array<OptionType> = [BOOL, BOOL];
    var optionText:Array<Option> = new Array();
    var curSelected = 0;
    override function create()
    {
        super.create();

        bg.alpha = 0.5;

        var y = 0.0;

        for (option in options)
        {
            var curOption = new Option(0, y, 'menu.options.$option', option);
            optionText.push(curOption);
            add(curOption);
            y += 16;
        }

        optionText[0].selected = true;
    }

    function changeSelection(change:Int = 0):Void
    {
        optionText[curSelected].selected = false;
        curSelected = (curSelected + change + optionText.length) % optionText.length;
        optionText[curSelected].selected = true;
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        if (Controls.DOWN_P)
            changeSelection(1);
        else if (Controls.UP_P)
            changeSelection(-1);

        if (Controls.BACK_P)
        {
            SaveData.prefs.save();
            FlxG.switchState(new TitleState());
        }

        if (Controls.ACCEPT_P)
        {
            if (optionText[curSelected].type == BOOL)
            {
                if (options[curSelected] == 'fullscreen')
                    Main.fullscreen = !Main.fullscreen;
                optionText[curSelected].value = !optionText[curSelected].value;
                optionText[curSelected].updateText();
            }
        }
    }
}