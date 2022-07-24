package polymod;

#if polymod
import polymod.Polymod;

class PolymodHandler
{
    public static var metadataArrays:Array<String> = [];

    public static function loadMods()
    {
        loadModMetadata();

		Polymod.init({
			modRoot:"polymods/",
			dirs: ModList.getActiveMods(metadataArrays),
            framework: OPENFL,
			errorCallback: function(error:PolymodError)
			{
				#if debug
                trace(error.message);
                #end
			},
            frameworkParams: {
                assetLibraryPaths: [
                    "default" => "./preload",
                    "songs" => "./songs",
                    "shared" => "./",
                    "tutorial" => "./tutorial",
                    "week1" => "./week1",
                    "week2" => "./week2",
                    "week3" => "./week3",
                    "week4" => "./week4",
                    "week5" => "./week5",
                    "week6" => "./week6",
                    "stages" => "stages",
                    "fonts" => "fonts"
                ]
            }
		});
    }

    public static function loadModMetadata()
    {
        metadataArrays = [];

        var tempArray = Polymod.scan("polymods/","*.*.*",function(error:PolymodError) {
            #if debug
			trace(error.message);
            #end
		});

        for(metadata in tempArray)
        {
            metadataArrays.push(metadata.id);
            ModList.modMetadatas.set(metadata.id, metadata);
        }
    }
}
#end