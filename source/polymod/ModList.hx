package polymod;

#if polymod
import polymod.Polymod;

class ModList
{
	public static var modList:Map<String, Bool> = new Map<String, Bool>();

    public static var modMetadatas:Map<String, ModMetadata> = new Map();

	public static function setModEnabled(mod:String, enabled:Bool):Void
	{
		modList.set(mod, enabled);

		setData(polymodsList, "polymodsList", "polymodsList");
	}

	public static function getModEnabled(mod:String):Bool
	{
		if (!modList.exists(mod))
			setModEnabled(mod, true);

		return modList.get(mod);
	}

    public static function getActiveMods(modsToCheck:Array<String>):Array<String>
    {
        var activeMods:Array<String> = [];

        for(modName in modsToCheck)
        {
            if(getModEnabled(modName))
                activeMods.push(modName);
        }

        return activeMods;
    }

	public static function load():Void
	{
		if(getData("polymodsList", "polymodsList") != null && getData("polymodsList", "polymodsList") != [])
			ModList = getData("polymodsList", "polymodsList");
	}
}
#end