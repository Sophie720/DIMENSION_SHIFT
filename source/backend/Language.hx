package backend;

import sys.io.File;

class Language
{
    public static var language:String = 'spanish';
    public static var languages:Map<String, Language> = new Map();

    public var data:Map<String, String> = new Map();

    inline public static function getPhrase(key:String):String
        return languages.get(language).data.get(key);

    public function new(lang:String)
    {
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