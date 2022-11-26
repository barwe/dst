local assets =
{
	Asset( "ANIM", "anim/bamboooo.zip" ),
	Asset( "ANIM", "anim/ghost_bamboooo_build.zip" ),
}

local skins =
{
	normal_skin = "bamboooo",
	ghost_skin = "ghost_bamboooo_build",
}

local base_prefab = "bamboooo"

local tags = {"BAMBOOOO", "CHARACTER"}

return CreatePrefabSkin("bamboooo_none",
{
	base_prefab = base_prefab, 
	skins = skins, 
	assets = assets,
	tags = tags,
	
	skip_item_gen = true,
	skip_giftable_gen = true,
})