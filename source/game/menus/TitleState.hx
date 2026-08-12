package game.menus;

import game.menus.objects.OptionText;

class TitleState extends MenuState
{
    var options:Array<String> = ['start', 'options', 'mods'];
    var optionsText:Map<String, OptionText> = new Map();
    var curSelected = 0;

    override function create()
    {
        super.create();

        var text = makeText(0, 50, 'DIMENSION/SHIFT', true);
        makeText(0, text.y + text.height, 'ACT ${SaveData.CUR_ACT + 1}', true);

        var i = 0;
        for (option in options)
        {
            optionsText.set(option, new OptionText(0, (FlxG.height/4)*2 + text.height*i, 'menu.title.$option'));
            optionsText.get(option).screenCenter(X);
            add(optionsText.get(option));
            i++;
        }

        optionsText.get(options[curSelected]).selected = true;

        if (FlxG.sound.music == null)
            FlxG.sound.playMusic(Paths.getMusic('act${SaveData.CUR_ACT + 1}'), 1, true);
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
                    FlxG.switchState(new SaveSelectState());

                case 'options':
                    FlxG.switchState(new OptionsState());

                case 'mods':
                    trace('todo');
            }
        }

        #if ACT_SELECT
        if (Controls.BACK_P)
        {
            FlxG.sound.music.stop();
            FlxG.sound.music = null;
            FlxG.switchState(new ActSelectState());
        }
        #end
    }
}