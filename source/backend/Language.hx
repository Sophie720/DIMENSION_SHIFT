package backend;

import sys.io.File;

class Language
{
    public static var language:String = 'english';

    public var data:Map<String, String> = new Map();
    public function new(lang:String)
    {
        try 
        {
            var file = File.getContent(Paths.getText('lang/$lang'));
            var lines = file.split('\n');

            for (line in lines)
            {
                var phrase = line.split('=');
                data.set(phrase[0], phrase[1]);
            }
        }
    }
}