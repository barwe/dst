local assets =
{
	Asset( "ANIM", "anim/greatsage.zip" ),
	Asset( "ANIM", "anim/ghost_greatsage_build.zip" ),
}

local skins =
{
	normal_skin = "greatsage",
	ghost_skin = "ghost_greatsage_build",
}

local base_prefab = "greatsage"

local tags = {"GREATSAGE", "CHARACTER"}

return CreatePrefabSkin("greatsage_none",
{
	base_prefab = base_prefab, 
	skins = skins, 
	assets = assets,
	tags = tags,
	
	skip_item_gen = true,
	skip_giftable_gen = true,
})