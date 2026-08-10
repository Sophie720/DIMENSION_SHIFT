package;

import sys.FileSystem;
import sys.io.File;

class Paths {
	inline public static final ASSETS:String = './assets/';
	inline public static final MODS:String = './mods/';
	inline public static final MODS_LIST:String = './mods.list';
	
	public static var mods:Array<Mod> = [];

	public static function saveMods()
	{
		var file = '';
		for (mod in mods)
			file += '${mod.id}|${mod.enabled.toInt()}\n';

		File.saveContent(file, MODS_LIST);
	}

	public static function initMods()
	{
		if (!FileSystem.exists(MODS))
			FileSystem.createDirectory(MODS);

		for (mod in FileSystem.readDirectory(MODS))
		{
			if (FileSystem.isDirectory(MODS + mod))
			{
				mods.push(new Mod(mod));
			}
		}

		trace('Loaded mods: $mods');
	}

	public static function getPath(file:String):String
	{
		var path = '';
		for (mod in mods)
		{
			if (!mod.enabled)
				continue;
			path = '$MODS$mod/$file';
			if (FileSystem.exists(path))
				return path;
		}
		return '$ASSETS$file';
	}

	inline public static function getFile(file:String):String
		return File.getContent(getPath(file));

	public static function getFile_append(file:String):String
	{
		var content:String = '';
		if (FileSystem.exists('$ASSETS$file'))
			content += File.getContent('$ASSETS$file');

		var modsArray = mods.copy();
		modsArray.reverse();

		for (mod in modsArray)
		{
			var path = '$MODS$mod/$file';
			if (FileSystem.exists(path) && mod.enabled)
				content += '\n${File.getContent(path)}';
		}
		return content;
	}

	inline public static function getLanguage(file:String)
		return getFile_append('data/lang/$file.txt');

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