package backend;

import save.ChromaSave;

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

    public static function initPrefs()
    {
        prefs = new ChromaSave('prefs');
        prefs.parse();

        if (prefs.data.exists('language'))
            Language.language = prefs.get('langauge');
        else
            prefs.set('language', 'english');

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