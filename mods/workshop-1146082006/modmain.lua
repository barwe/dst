PrefabFiles = {
    "icemaker",
}

Assets = {
    Asset("ATLAS", "images/inventoryimages/icemaker.xml"),
    Asset("IMAGE", "images/inventoryimages/icemaker.tex"),
    Asset("IMAGE", "minimap/minimap_icemaker.tex"),
    Asset("ATLAS", "minimap/minimap_icemaker.xml"),
}

AddMinimapAtlas("minimap/minimap_icemaker.xml")

local STRINGS = GLOBAL.STRINGS
local RECIPETABS = GLOBAL.RECIPETABS
local TECH = GLOBAL.TECH
local Recipe = GLOBAL.Recipe
local Ingredient = GLOBAL.Ingredient

--Config
TUNING.ICEMAKER_FUEL_MAX = GetModConfigData("config_fuel_max")
TUNING.ICEMAKER_SPAWN_TIME = GetModConfigData("config_spawn_time")

STRINGS.ICEMAKER = "Gears Making Machine"
STRINGS.NAMES.ICEMAKER = "G.M.M"
STRINGS.RECIPE_DESC.ICEMAKER = "Gears Making Machine"

--Recipe
if GetModConfigData("config_recipe") == 1 then
    local icemaker = Recipe("icemaker",
    {
            Ingredient("gears",1),
            Ingredient("cutstone",10),
			Ingredient("redgem",1)
        },  RECIPETABS.SCIENCE, TECH.SCIENCE_TWO, "icemaker_placer")
    icemaker.atlas = "images/inventoryimages/icemaker.xml"
elseif GetModConfigData("config_recipe") == 2 then
    local icemaker = Recipe("icemaker",
        {
            Ingredient("gears",2),
            Ingredient("cutstone",20),
			Ingredient("redgem",3),
			Ingredient("nightmarefuel",3),
        },  RECIPETABS.SCIENCE, TECH.SCIENCE_TWO, "icemaker_placer")
    icemaker.atlas = "images/inventoryimages/icemaker.xml"
end