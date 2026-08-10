package backend.scripting;

import crowplexus.iris.Iris;
import crowplexus.iris.IrisConfig;

class HScript extends Iris
{
    override public function new(script:String)
    {
        var rules:RawIrisConfig = {name: script, autoRun: true, autoPreset: true};
        var content = sys.io.File.getContent(Paths.getScript(script));

        super(content, rules);

        set('DialogueHandler', DialogueHandler);
        set('Language', Language);
        set('Paths', Paths);
        set('game', ShiftState.state);
        set('ShiftSprite', ShiftSprite);
        set('ShiftSpriteGroup', ShiftSpriteGroup);
        set('ShiftState', ShiftState);
    }

    override public function call(func:String, ?args:Array<Dynamic>):IrisCall
    {
		if (exists(func))
			return super.call(func, args);
		return null;
	}
}