package;

import game.menus.TitleState;

class MainState extends ShiftState
{
    override function create()
    {
        FlxG.switchState(new TitleState());
    }
}