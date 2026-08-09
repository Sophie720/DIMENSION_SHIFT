package;

import sys.FileSystem;

class Paths {
	public static var CUR_MOD:String = 'test-mod';
	public static var ASSETS:String = 'assets/';
	public static var MODS:String = 'mods/';

	public static function getPath(file:String):String
	{
		var path = '';
		if (CUR_MOD != null)
		{
			path = '$MODS$CUR_MOD/$file';
			if (!FileSystem.exists(path))
			{
				path = '$ASSETS$file';
			}
			return path;
		}
		else
			return '$ASSETS$file';
	}

	inline public static function getImage(file:String)
		return getPath('images/$file.png');

	inline public static function getSound(file:String)
		return getPath('sounds/$file.ogg');

	inline public static function getFont(file:String)
		return getPath('fonts/$file.ttf');

	inline public static function getScript(file:String)
		return getPath('scripts/$file.hx');

	inline public static function getText(file:String) 
		return getPath('data/$file.txt');
}