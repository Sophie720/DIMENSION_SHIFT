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

	public static var languages:Map<String, Language> = new Map();

	public function new()
	{
		languages.set('english', new Language('english'));
		super();
		addChild(new FlxGame(0, 0, PlayState, 30, 30, true));

		trace('DIMENSION/SHIFT version ${gameVersion}');
	}
}
