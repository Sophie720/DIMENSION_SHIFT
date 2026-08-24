package game.objects;

@:allow(game.objects.Player)
class Follower extends Character
{
    public var parent:Player;

    override function new(id:String, parent:Player)
    {
        this.parent = parent;

        super(parent.x, parent.y, id);
    }
}