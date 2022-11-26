
local MakePlayerCharacter = require "prefabs/player_common"


local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
}
local prefabs = {}


local start_inv = {
	"bamboobed",
	"bamboo_cookpot_item",
    "dug_bambooootree",
	"dug_bambooootree",
	"dug_bambooootree",
	"dug_bambooootree",
	"dug_bambooootree",
	"dug_bambooootree",
	"dug_bambooootree",
	"dug_bambooootree",
	"dug_bambooootree",
	"dug_bambooootree",
	"dug_bambooootree",
	"dug_bambooootree",
	"dug_bambooootree",
	"dug_bambooootree",
	"dug_bambooootree",
	"dug_bambooootree",
	"dug_bambooootree",
	"dug_bambooootree",
	"dug_bambooootree",
	"dug_bambooootree",
}
local function oneat(inst, food)
    if food and food.components.edible and food:HasTag("bamboooo_food") then
		local hunger = food.components.edible.hungervalue or 0
		local sanity = food.components.edible.sanityvalue or 0
		local health = food.components.edible.healthvalue or 0
		if  inst.components.health then
			inst.components.health:DoDelta(health*0.2)
		end
		if  inst.components.sanity then
			inst.components.sanity:DoDelta(sanity*0.2)
		end
		if  inst.components.hunger then
			inst.components.hunger:DoDelta(hunger*0.2)
		end
    end
end

local function onbecamehuman(inst)

	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "bamboooo_speed_mod", 0.8)
end
local function onbecameghost(inst)

   inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "bamboooo_speed_mod")
end

local function onload(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
end

local common_postinit = function(inst) 
	inst.MiniMapEntity:SetIcon( "bamboooo.tex" )
	inst:AddTag("bamboooo")
end


local master_postinit = function(inst)

	inst.soundsname = "willow"

	inst.components.health:SetMaxHealth(150)
	inst.components.hunger:SetMax(300)
	inst.components.sanity:SetMax(150)
	
	inst.components.eater:SetAbsorptionModifiers(0.8,0.8,0.8)
	inst.components.eater:SetCanEatBAB_BAMBOO()

	inst.components.eater:SetOnEatFn(oneat)

    inst.components.combat.damagemultiplier = 0.8
	inst.components.temperature.inherentinsulation = 120
	
	inst.components.hunger.hungerrate = 1.2 * TUNING.WILSON_HUNGER_RATE
	
	inst.OnLoad = onload
    inst.OnNewSpawn = onload
	
end

return MakePlayerCharacter("bamboooo", prefabs, assets, common_postinit, master_postinit, start_inv)
