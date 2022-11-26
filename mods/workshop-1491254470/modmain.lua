PrefabFiles = {
	"yoyozi",
	"yoyozi_maozi",
	"ghost_ai",--------------
	"ghost_tree",-------------
	"redlantern_ghost",------------
	"yyz_projectile",----------
	"shanzi_yoyozi",---------------
	"yoyozi_body",---------------
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/yoyozi.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/yoyozi.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/yoyozi.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/yoyozi.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/yoyozi_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/yoyozi_silho.xml" ),

    Asset( "IMAGE", "bigportraits/yoyozi.tex" ),
    Asset( "ATLAS", "bigportraits/yoyozi.xml" ),
	
	Asset( "IMAGE", "images/map_icons/yoyozi.tex" ),
	Asset( "ATLAS", "images/map_icons/yoyozi.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_yoyozi.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_yoyozi.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_yoyozi.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_yoyozi.xml" ),
	
	Asset( "IMAGE", "images/ghosttab.tex" ),------------------------
    Asset( "ATLAS", "images/ghosttab.xml" ),
	
	Asset( "IMAGE", "minimap/ghost_tree.tex" ),
    Asset( "ATLAS", "minimap/ghost_tree.xml" ),
	
	Asset("SOUNDPACKAGE", "sound/ghost_tree.fev"),
    Asset("SOUND", "sound/ghost_tree.fsb"),
	


}
--If GLOBAL.TheNet:GetIsServer() then --
--API内容
--end

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local TECH = GLOBAL.TECH

local TUNING = GLOBAL.TUNING
local Player = GLOBAL.ThePlayer
local TheNet = GLOBAL.TheNet
local IsServer = GLOBAL.TheNet:GetIsServer()
local TheInput = GLOBAL.TheInput
local TimeEvent = GLOBAL.TimeEvent
local FRAMES = GLOBAL.FRAMES
local EQUIPSLOTS = GLOBAL.EQUIPSLOTS
local EventHandler = GLOBAL.EventHandler
local SpawnPrefab = GLOBAL.SpawnPrefab
local State = GLOBAL.State
local DEGREES = GLOBAL.DEGREES
local Vector3 = GLOBAL.Vector3
local ACTIONS = GLOBAL.ACTIONS
local FOODTYPE = GLOBAL.FOODTYPE
local PLAYERSTUNLOCK = GLOBAL.PLAYERSTUNLOCK
local GetTime = GLOBAL.GetTime
local HUMAN_MEAT_ENABLED = GLOBAL.HUMAN_MEAT_ENABLED
local TheSim = GLOBAL.TheSim
local ActionHandler = GLOBAL.ActionHandler
GLOBAL.setmetatable(env,{__index=function(t,k) return GLOBAL.rawget(GLOBAL,k) end})


AddPrefabPostInit("strawhat", AddHairFrontHat)
AddPrefabPostInit("tophat", AddHairFrontHat)
AddPrefabPostInit("beefalohat", AddHairFrontHat)
AddPrefabPostInit("featherhat", AddHairFrontHat)
AddPrefabPostInit("beehat", AddHairFrontHat)
AddPrefabPostInit("minerhat", AddHairFrontHat)
AddPrefabPostInit("spiderhat", AddHairFrontHat)
AddPrefabPostInit("footballhat", AddHairFrontHat)
--AddPrefabPostInit("earmuffshat", AddHairFrontHat)
AddPrefabPostInit("winterhat", AddHairFrontHat)
AddPrefabPostInit("bushhat", AddHairFrontHat)
--AddPrefabPostInit("flowerhat", AddHairFrontHat)
AddPrefabPostInit("walrushat", AddHairFrontHat)
AddPrefabPostInit("slurtlehat", AddHairFrontHat)
AddPrefabPostInit("ruinshat", AddHairFrontHat)
--AddPrefabPostInit("molehat", AddHairFrontHat)
AddPrefabPostInit("wathgrithrhat", AddHairFrontHat)
AddPrefabPostInit("icehat", AddHairFrontHat)
AddPrefabPostInit("rainhat", AddHairFrontHat)
AddPrefabPostInit("catcoonhat", AddHairFrontHat)
AddPrefabPostInit("watermelonhat", AddHairFrontHat)
AddPrefabPostInit("eyebrellahat", AddHairFrontHat)
AddPrefabPostInit("red_mushroomhat", AddHairFrontHat)
AddPrefabPostInit("green_mushroomhat", AddHairFrontHat)
AddPrefabPostInit("blue_mushroomhat", AddHairFrontHat)
AddPrefabPostInit("hivehat", AddHairFrontHat)
AddPrefabPostInit("dragonheadhat", AddHairFrontHat)
AddPrefabPostInit("dragonbodyhat", AddHairFrontHat)
AddPrefabPostInit("dragontailhat", AddHairFrontHat)
AddPrefabPostInit("deserthat", AddHairFrontHat)
--AddPrefabPostInit("goggleshat", AddHairFrontHat)
AddPrefabPostInit("skeletonhat", AddHairFrontHat)

if TheNet:GetPVPEnabled() then 
	GLOBAL.TUNING.YOYOZI_NO_TAGS = {}
	else 
	GLOBAL.TUNING.YOYOZI_NO_TAGS = {"player"}
end 

AddPrefabPostInit("ghost", function (inst)
		if GLOBAL.TheWorld.ismastersim then
			table.insert(inst.components.aura.auraexcludetags, "yoyozi")
			inst.components.sanityaura.aurafn = function(instance, observer)
				return observer:HasTag("yoyozi") and 0 or inst.components.sanityaura.aura
			end
		end
	end
)

---------------------
local ghoster = "yoyozi" 
GHOSTtab = AddRecipeTab("幽幽子",233, "images/ghosttab.xml", "ghosttab.tex", ghoster)

AddRecipe("yoyozi_maozi", 
{Ingredient("flowerhat", 1), Ingredient("silk", 4),Ingredient("boneshard", 2)}, 
GHOSTtab, TECH.NONE, nil, nil, nil, nil, ghoster,"images/inventoryimages/yoyozi_maozi.xml", "yoyozi_maozi.tex" )
STRINGS.NAMES.YOYOZI_MAOZI = "幽幽子的帽子"
STRINGS.RECIPE_DESC.YOYOZI_MAOZI = "以逝者的帽子"	

AddRecipe("redlantern_ghost", 
{Ingredient("papyrus", 5), Ingredient("nightmarefuel", 10),Ingredient("fireflies", 6)}, 
GHOSTtab, TECH.NONE, nil, nil, nil, nil, ghoster,"images/inventoryimages/redlantern_ghost.xml", "redlantern_ghost.tex" )
STRINGS.NAMES.REDLANTERN_GHOST = "人魂灯"
STRINGS.RECIPE_DESC.REDLANTERN_GHOST = "幽幽子管理魂魄的道具"		

AddRecipe("ghost_tree", 
{Ingredient("livinglog", 10), Ingredient("nightmarefuel", 20)}, 
GHOSTtab, TECH.NONE, "ghost_tree_placer", nil, nil, nil, ghoster,"minimap/ghost_tree.xml", "ghost_tree.tex" )
STRINGS.NAMES.GHOST_TREE = "西行妖"
STRINGS.RECIPE_DESC.GHOST_TREE = "千年的樱花妖"	
-----------------------------------------------------------

modimport("engine.lua")
Load "chatinputscreen"
Load "consolescreen"
Load "textedit"

GLOBAL.TUNING.YOYOZI_KILL_KEY = KEY_Z
GLOBAL.TUNING.YOYOZI_HAUNT_KEY = KEY_X
GLOBAL.TUNING.YOYOZI_GHOST_KEY = KEY_C
--GLOBAL.TUNING.YOYOZI_NIGHT_KEY = KEY_V

GLOBAL.TUNING.YOYOZI_KILLCD = 60   --
GLOBAL.TUNING.YOYOZI_HAUNTCD = 3    --
GLOBAL.TUNING.YOYOZI_GHOSTCD = 5   --
--GLOBAL.TUNING.YOYOZI_NIGHTCD = 0.3

STRINGS.NAMES.YOYOZI_MAOZI = "逝者的帽子"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.YOYOZI_MAOZI = "逝者的帽子"

STRINGS.RECIPE_DESC.YOYOZI_MAOZI = "幽幽子的帽子"
-- 
STRINGS.CHARACTER_TITLES.yoyozi = "天衣无缝的亡灵"
STRINGS.CHARACTER_NAMES.yoyozi = "幽幽子"
STRINGS.CHARACTER_DESCRIPTIONS.yoyozi = "*吃货\n*冥界的管理者\n*亡灵"
STRINGS.CHARACTER_QUOTES.yoyozi = "\"樱花何时会再次绽放呢......\""

-- 
STRINGS.CHARACTERS.YOYOZI = require "speech_yoyozi"

-- 
STRINGS.NAMES.YOYOZI = "幽幽子"

-- 

STRINGS.CHARACTERS.GENERIC.DESCRIBE.YOYOZI =
	{
		GENERIC = "幽幽子大人!",
		ATTACKER = "幽幽子看起来很腹黑....",
		MURDERER = "冥界的管理者!",
		REVIVER = "幽幽子是鬼的朋友",
		GHOST = "幽幽子只是从实体变成了虚无",
	}


AddMinimapAtlas("images/map_icons/yoyozi.xml")
AddMinimapAtlas("minimap/ghost_tree.xml")






-- 
AddModCharacter("yoyozi", "FEMALE")


