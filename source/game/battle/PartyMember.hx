package game.battle;

class PartyMember
{
    public var hp:Int;
    public var atk:Int;
    public var def:Int;
    public var magic:Int;
    public var mp:Int;
    public var int:Int;
    public var luck:Int;
    public var speed:Int;

    public function new(?preset:String)
    {
        if (preset != null)
        {
            switch (preset.toLowerCase().trim())
            {
                case 'kai':
                    hp = 50;
                    atk = 10;
                    def = 10;
                    magic = 5;
                    mp = 20;
                    int = 15;
                    luck = 15;
                    speed = 15;
            }
        }
    }
}