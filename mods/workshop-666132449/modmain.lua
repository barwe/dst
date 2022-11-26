--[[
    
***************************************************************
Created by: zyjwsg
Date: 2016.4.15
Description: 大圣
***************************************************************

--]]

PrefabFiles = {
	"greatsage",
	"greatsage_none",
	"realjgb",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/greatsage.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/greatsage.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/greatsage.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/greatsage.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/greatsage_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/greatsage_silho.xml" ),

    Asset( "IMAGE", "bigportraits/greatsage.tex" ),
    Asset( "ATLAS", "bigportraits/greatsage.xml" ),
	
	Asset( "IMAGE", "images/map_icons/greatsage.tex" ),
	Asset( "ATLAS", "images/map_icons/greatsage.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_greatsage.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_greatsage.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_greatsage.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_greatsage.xml" ),
	
	Asset( "IMAGE", "images/avatars/self_inspect_greatsage.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_greatsage.xml" ),
	
	Asset( "IMAGE", "images/names_greatsage.tex" ),
    Asset( "ATLAS", "images/names_greatsage.xml" ),
	
    Asset( "IMAGE", "bigportraits/greatsage_none.tex" ),
    Asset( "ATLAS", "bigportraits/greatsage_none.xml" ),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local Recipe = GLOBAL.Recipe
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS

-- The character select screen lines
STRINGS.CHARACTER_TITLES.greatsage = "Great Sage"
STRINGS.CHARACTER_NAMES.greatsage = "Great Sage"
STRINGS.CHARACTER_DESCRIPTIONS.greatsage = "*Night Vision\n*Immune To Fire\n*The Real Warrior"
STRINGS.CHARACTER_QUOTES.greatsage = "My stick is very hungry"

-- Custom speech strings
STRINGS.CHARACTERS.GREATSAGE = require "speech_greatsage"

-- The character's name as appears in-game 
STRINGS.NAMES.GREATSAGE = "greatsage"

--
STRINGS.NAMES.REALJGB = "Monkey King`s Bar"
STRINGS.RECIPE_DESC.REALJGB = "The Real One"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.REALJGB = "A cool weapon!"

--,Ingredient("goldnugget", 5),Ingredient("purplegem", 1)
AddRecipe("realjgb", {Ingredient("rocks", 10), Ingredient("goldnugget", 5), Ingredient("purplegem", 1)}, RECIPETABS.WAR, GLOBAL.TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/realjgb.xml", "realjgb.tex" )

AddMinimapAtlas("images/map_icons/greatsage.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("greatsage", "FEMALE")

