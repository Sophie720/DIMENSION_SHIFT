package backend;

import save.ChromaSave;

using backend.SaveTool;

class SaveData
{
    public static var CUR_ACT = 0;
    public static var saves:Map<Int, ChromaSave> = new Map();
    public static var prefs:ChromaSave;
    public static var curSave_index(default, set):Int = 0;

    public static function set_curSave_index(v:Int)
    {
        if (!saves.exists(v))
            init(v);
        return v;
    }

    public static var curSave(get, never):ChromaSave;
    
    public static function get_curSave()
        return saves.get(curSave_index);

    public static function setBinds(v:Dynamic)
    {
        KeyBinds.binds.ACCEPT = v.ACCEPT;
        KeyBinds.binds.BACK = v.BACK;
        KeyBinds.binds.MENU = v.MENU;
        KeyBinds.binds.LEFT = v.LEFT;
        KeyBinds.binds.UP = v.UP;
        KeyBinds.binds.RIGHT = v.RIGHT;
        KeyBinds.binds.DOWN = v.DOWN;
    }

    public static function initPrefs()
    {
        prefs = new ChromaSave('prefs');
        prefs.parse();

        prefs.addField('language', 'english', (v)->Language.language = v);
        @:privateAccess
        new KeyBinds();
        prefs.addField('keybinds', KeyBinds.dummy(), setBinds);

        prefs.save();
    }

    public static function init(saveInd:Int):Void
    {
        var save = new ChromaSave('save$CUR_ACT-$saveInd');
        save.parse();
        save.save();

        saves.set(saveInd, save);
    }
}