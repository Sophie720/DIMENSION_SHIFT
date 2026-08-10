package;

import lime.app.Application;
import backend.SaveData;
import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public static var gameVersion(get, never):String;
	public static function get_gameVersion():String
		return Application.current.meta.get('version');

	public function new()
	{
		try
		{
			SaveData.initPrefs();
			SaveData.curSave_index = 0;
		} catch(e:Dynamic)
		{
			trace(e);
		}

		Paths.initMods();
		Language.init();
		super();
		addChild(new FlxGame(0, 0, MainState, 30, 30, true));

		trace('DIMENSION/SHIFT v$gameVersion');
	}
}
