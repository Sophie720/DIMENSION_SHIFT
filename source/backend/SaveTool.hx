package backend;

import save.ChromaSave;

class SaveUtil
{
    public static function addField(save:ChromaSave, field:String, defaultValue:Dynamic, ?callback:Dynamic->Void)
    {
        if (!save.data.exists(field))
            save.set(field, defaultValue);

        if (callback != null)
            callback(save.get(field));
    }
}