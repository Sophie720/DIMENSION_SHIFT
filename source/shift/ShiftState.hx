package shift;

class ShiftState extends FlxState
{
    public var camGame(get, never):FlxCamera;
    public function get_camGame()
        return FlxG.camera;

    public static var state(get, never):ShiftState;
    public static function get_state()
    {
        if (Std.isOfType(FlxG.state, ShiftState))
			return cast FlxG.state;

        return null;
    }

    public var camHUD:FlxCamera = new FlxCamera();
    public var camDialogue:FlxCamera = new FlxCamera();

    override public function create() 
    {
        FlxG.mouse.visible = false;
        super.create();

        FlxG.cameras.add(camHUD);
        FlxG.cameras.add(camDialogue);
    }
}