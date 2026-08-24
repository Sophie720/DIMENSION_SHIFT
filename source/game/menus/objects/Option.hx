package game.menus.objects;

import game.menus.objects.OptionText;

enum OptionType 
{
    BOOL;
}

class Option extends OptionText
{
    public var value(default, set):Dynamic;
    public var save:String;
    public var type:OptionType = BOOL;

    public function set_value(v:Dynamic):Dynamic
    {
        SaveData.prefs.set(save, v);
        return v;
    }

    override public function new(x:Float, y:Float, id:String, saveVariable:String, type:OptionType = BOOL, size:Int = 16)
    {
        super(x, y, id, size);

        this.type = type;
        save = saveVariable;
        value = SaveData.prefs.get(saveVariable);
        updateText();
    }

    public function updateText()
    {
        if (type == BOOL)
        {
            var sel = '[ ]';
            if (SaveData.prefs.get(save))
                sel = '[X]';
            text = '${defaultText} $sel';
        }
    }
}