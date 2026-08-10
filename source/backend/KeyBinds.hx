package backend;

typedef Binds =
{
    @:optional var ACCEPT:Int;
    @:optional var BACK:Int;
    @:optional var MENU:Int;
    @:optional var LEFT:Int;
    @:optional var UP:Int;
    @:optional var RIGHT:Int;
    @:optional var DOWN:Int;
}

class KeyBinds
{
    inline public static function dummy():Binds
        return {
            ACCEPT: KeyBinds.binds.ACCEPT,
            BACK: KeyBinds.binds.BACK,
            MENU: KeyBinds.binds.MENU,
            LEFT: KeyBinds.binds.LEFT,
            UP: KeyBinds.binds.UP,
            RIGHT: KeyBinds.binds.RIGHT,
            DOWN: KeyBinds.binds.DOWN
        };
    public static var binds:KeyBinds;
    function new() 
    {
        binds = this;
    }
    public var ACCEPT:Int = 90;
    public var BACK:Int = 88;
    public var MENU:Int = 67;
    public var LEFT:Int = 37;
    public var UP:Int = 38;
    public var RIGHT:Int = 39;
    public var DOWN:Int = 40;
}