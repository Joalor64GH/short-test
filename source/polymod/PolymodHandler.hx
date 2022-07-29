package polymod;

// this is here so the game doesnt crash because of no framework params
#if (MODS_ALLOWED && polymod)
import polymod.Polymod;

class PolymodHandler
{
	public static var swagMeta:String;
	public static var metadataArrays:Array<String> = [];

	public static function loadMods()
	{
		loadModMetadata();

		Polymod.init({
			modRoot: "polymods/",
			dirs: ModList.getActiveMods(metadataArrays),
			errorCallback: function(error:PolymodError)
			{
				// trace(error.message);
			},
			frameworkParams: {
				assetLibraryPaths: ["songs" => "songs", "shared" => "shared", "fonts" => "fonts"]
			}
		});
	}

	public static function loadModMetadata()
	{
		metadataArrays = [];

		var tempArray = Polymod.scan("polymods/", "*.*.*", function(error:PolymodError)
		{
			trace(error.message);
		});

		for (metadata in tempArray)
		{
			swagMeta = metadata.id;
			metadataArrays.push(metadata.id);
			ModList.modMetadatas.set(metadata.id, metadata);
		}
	}
}
#end