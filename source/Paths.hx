package;

import sys.FileSystem;

class Paths {
	public static var CUR_MOD:String;
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
				path = '$ASSETS$path';
				return path;
			}
		}
		else
			return '$ASSETS$path';
	}

	inline public static function getImage(file:String)
		return getPath('images/$file.png');

	inline public static function getScript(file:String)
		return getPath('scripts/$file.hx');
}