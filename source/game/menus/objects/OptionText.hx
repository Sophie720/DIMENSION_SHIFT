package game.menus.objects;

class OptionText extends FlxText
{
    public var selected(default, set):Bool;
    public var id:String;

    public function set_selected(v:Bool)
    {
        color = v ? FlxColor.WHITE : FlxColor.GRAY;
        return v;
    }

    override public function new(x:Float, y:Float, id:String, size:Int = 16)
    {
        this.id = id;
        super(x, y, Language.getPhrase('menu.$id'));
        setFormat(Paths.getFont('font'), size, FlxColor.GRAY, CENTER);
    }
}