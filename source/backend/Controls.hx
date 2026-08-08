package backend;

class Controls
{
    public static var ACCEPT(get, never):Bool;
    public static function get_ACCEPT()
        return FlxG.keys.pressed.Z;

    public static var ACCEPT_P(get, never):Bool;
    public static function get_ACCEPT_P()
        return FlxG.keys.justPressed.Z;
}