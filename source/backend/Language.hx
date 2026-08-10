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
        for (file in FileSystem.readDirectory(Paths.ASSETS + 'data/lang/'))
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
            var file = Paths.getLanguage(lang);
            var lines = file.split('\n');

            for (line in lines)
            {
                var phrase = line.split('=');
                data.set(phrase[0], phrase[1].trim());
            }
        }
    }
}