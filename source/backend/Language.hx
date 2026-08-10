package backend;

import sys.io.File;
import sys.FileSystem;

class Language
{
    public static var language(default, set):String = 'english';
    public static function set_language(v:String):String
    {
        SaveData.prefs.set('language', v);
        SaveData.prefs.save();
        return v;
    }
    public static var languages:Map<String, Language> = new Map();

    public var data:Map<String, String> = new Map();
	public var lang:String;

    inline public static function getPhrase(key:String):String
        return languages.get(language).data.get(key);

    public static function init()
    {
        trace('Initializing languages...');
        var files = FileSystem.readDirectory(Paths.ASSETS + 'data/lang/');
        for (mod in Paths.mods)
        {
            var path = '${Paths.MODS}$mod/data/lang/';
            if (FileSystem.exists(path))
            {
                for (file in FileSystem.readDirectory(path))
                {
                    if (!files.contains(file))
                        files.push(file);
                }
            }
        }
        for (file in files)
        {
            file = file.toLowerCase();
            if (file.endsWith('.txt'))
            {
                var lang = file.substring(0, file.length - 4);
                languages.set(lang, new Language(lang));
            }
        }
        trace('Languages: $languages');
    }

    public function toString():String
        return lang;

    public function new(lang:String)
    {
		this.lang = lang;
        try 
        {
            var file = '';
            if (lang != 'english')
                file = Paths.getLanguage('english');
            file += '\n${Paths.getLanguage(lang)}';
            var lines = file.split('\n');

            for (line in lines)
            {
                line.trim();
                if (line.length == 0 || line.startsWith('#'))
                    continue;
                var phrase = line.split('=');
                if (phrase.length >= 2)
                    data.set(phrase[0].trim(), phrase[1].trim());
            }
        }
    }
}