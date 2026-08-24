package game.objects;

class Player extends Character
{
    public var followers:Array<Follower>;

    public function addFollower(id:String):Follower
    {
        if (followers == null)
            followers = new Array();
        var f = new Follower(id, this);
        followers.push(f);

        var playerIndex = ShiftState.state.members.indexOf(this);
        ShiftState.state.insert(playerIndex, f);

        return f;
    }
}