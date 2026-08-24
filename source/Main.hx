package;

import lime.app.Application;
import backend.SaveData;
import flixel.FlxGame;
import openfl.display.Sprite;
import backend.system.DiscordClient;

class Main extends Sprite
{
	public static var gameVersion(get, never):String;
	public static function get_gameVersion():String
		return Application.current.meta.get('version');

	public static var fullscreen(get, set):Bool;
	public static function get_fullscreen():Bool
		return Application.current.window.fullscreen;

	public static function set_fullscreen(v:Bool):Bool
		return Application.current.window.fullscreen = v;

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
		addChild(new FlxGame(640, 480, 
			#if ACT_SELECT
			ActSelectState, 
			#else
			MainState,
			#end
		30, 30, true));
		#if hxdiscord_rpc
		DiscordClient.initialize();
		#end
		trace('DIMENSION/SHIFT v$gameVersion');
	}

	public static function setAct(act:Int)
	{
		openfl.Lib.application.window.title = 'DIMENSION/SHIFT ACT ${act + 1}';
		SaveData.CUR_ACT = act;
		FlxG.switchState(new game.menus.TitleState());
	}
}
