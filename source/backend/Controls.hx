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

    //directions
    public static var LEFT(get, never):Bool;
    inline public static function get_LEFT()
        return pressed(KeyBinds.binds.LEFT);
    public static var RIGHT(get, never):Bool;
    inline public static function get_RIGHT()
        return pressed(KeyBinds.binds.RIGHT);
    public static var UP(get, never):Bool;
    inline public static function get_UP()
        return pressed(KeyBinds.binds.UP);
    public static var DOWN(get, never):Bool;
    inline public static function get_DOWN()
        return pressed(KeyBinds.binds.DOWN);

    public static var LEFT_P(get, never):Bool;
    inline public static function get_LEFT_P()
        return justPressed(KeyBinds.binds.LEFT);
    public static var RIGHT_P(get, never):Bool;
    inline public static function get_RIGHT_P()
        return justPressed(KeyBinds.binds.RIGHT);
    public static var UP_P(get, never):Bool;
    inline public static function get_UP_P()
        return justPressed(KeyBinds.binds.UP);
    public static var DOWN_P(get, never):Bool;
    inline public static function get_DOWN_P()
        return justPressed(KeyBinds.binds.DOWN);
}