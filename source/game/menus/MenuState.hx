package game.menus;

class MenuState extends ShiftState
{
    var bg:ShiftSprite;
    override function create()
    {
        bg = new ShiftSprite(0, 0, Paths.getImage('act${SaveData.CUR_ACT + 1}'));
        bg.setGraphicSize(FlxG.width, FlxG.height);
        bg.screenCenter();
        add(bg);

        var version = makeText(0, FlxG.height, 'v' + Main.gameVersion, false, 12);
        version.y -= version.height;
    }
}