package game.menus;

class TitleState extends ShiftState
{
    override function create()
    {
        super.create();
        var text = new FlxText(0, 50, 'DIMENSION/SHIFT');
        text.setFormat(Paths.getFont('font'), 16);
        text.screenCenter(X);

        var press = new FlxText(0, FlxG.height - 50, Language.getPhrase('menu.title.start'));
        press.setFormat(Paths.getFont('font'), 16);
        press.screenCenter(X);

        add(text);
        add(press);
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        if (Controls.ACCEPT_P)
        {
            PlayState.loadMap('test');
        }
    }
}