package backend;

import backend.KeyBinds;

class Controls
{
    inline public static function pressed(key:Int)
        return FlxG.keys.anyPressed([key]);

    inline public static function justPressed(key:Int)
        return FlxG.keys.anyJustPressed([key]);

    public static var ACCEPT(get, never):Bool;
    inline public static function get_ACCEPT()
        return pressed(KeyBinds.binds.ACCEPT);

    public static var ACCEPT_P(get, never):Bool;
    inline public static function get_ACCEPT_P()
        return justPressed(KeyBinds.binds.ACCEPT);
	public static var BACK(get, never):Bool;

	inline public static function get_BACK()
		return pressed(KeyBinds.binds.BACK);

	public static var BACK_P(get, never):Bool;

	inline public static function get_BACK_P()
		return justPressed(KeyBinds.binds.BACK);
}