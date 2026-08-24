package game.objects;

class Character extends ShiftSprite
{
    public var char:String;

    override public function new(x:Float, y:Float, id:String)
    {
        char = id;
        var path = Paths.getImage('characters/$char');
        super(x, y, path);

        scale.set(2, 2);
    }

    public function walkTo(targetX:Float, targetY:Float, speed:Float = 100, ?onComplete:Void->Void):Void
    {
        FlxTween.linearMotion(this, x, y, targetX, targetY, speed, true, {
            onComplete: function(_) {
                if (onComplete != null) onComplete();
            }
        });
}
}