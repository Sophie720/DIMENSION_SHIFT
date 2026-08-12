package backend.modding;

typedef ModSave =
{
    var id:String;
    var enabled:Bool;
}

class Mods
{
    public static var mods(get, never):Array<ModSave>;

    public static function get_mods():Array<ModSave>
        return cast SaveData.prefs.get('mods');
}