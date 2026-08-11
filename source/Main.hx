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

	public static function setAct(act:Int)
	{
		switch(act)
		{
			case 0:
				FlxG.switchState(new game.menus.TitleState());

			default:
				trace('Unknown act: $act');
				return;
		}
		SaveData.CUR_ACT = act;
	}
}
