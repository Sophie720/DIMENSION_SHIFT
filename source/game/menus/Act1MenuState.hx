package game.menus;

class Act1MenuState extends ShiftState
{
    var bg:ShiftSprite;
    override function create()
    {
        bg = new ShiftSprite(0, 0, Paths.getImage('act1'));
        bg.setGraphicSize(FlxG.width, FlxG.height);
        bg.screenCenter();
        add(bg);

        var version = makeText(0, FlxG.height, 'v' + Main.gameVersion, false, 12);
        version.y -= version.height;
    }

    function makeText(x:Float, y:Float, text:String, center:Bool = false, size:Int = 16):FlxText
    {
        var text = new FlxText(x, y, text);
        text.setFormat(Paths.getFont('font'), size);
        if (center) text.screenCenter(X);
        add(text);
        return text;
    }
}