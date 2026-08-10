package;

class MainState extends ShiftSprite
{
    override function create()
    {
        FlxG.switchState(new PlayState('test'));
    }
}