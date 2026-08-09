package backend.scripting;

import crowplexus.iris.Iris;
import crowplexus.iris.IrisConfig;

class HScript extends Iris
{
    override public function new(script:String)
    {
        var rules:RawIrisConfig = {name: script, autoRun: true, autoPreset: true};
        var content = 'import flixel.*;\n';
        content += sys.io.File.getContent(Paths.getScript(script));

        super(content, rules);

        set('DialogueHandler', DialogueHandler);
    }

    override public function call(func:String, ?args:Array<Dynamic>):Dynamic
    {
		if (exists(func))
			return super.call(func, args);
		return null;
	}
}