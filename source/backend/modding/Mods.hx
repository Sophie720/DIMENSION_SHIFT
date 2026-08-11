package backend.modding;

typedef ModSave =
{
    var id:String;
    var enabled:Bool;
}

class Mods
{
    public static var mods:Array<ModSave> = new Array();

    static function init()
    {
        mods = SaveData.prefs.get('mods');
    }
}