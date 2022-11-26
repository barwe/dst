
local MakePlayerCharacter = require "prefabs/player_common"


local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
}

local prefabs = {}

-- Custom starting items
local start_inv = {
	"realjgb"
}

local MONSTERVISION_COLOURCUBES =
{
    day = "images/colour_cubes/beaver_vision_cc.tex",
    dusk = "images/colour_cubes/beaver_vision_cc.tex",
    night = "images/colour_cubes/beaver_vision_cc.tex",
    full_moon = "images/colour_cubes/beaver_vision_cc.tex",
}

-- When the character is revived from human
local function onbecamehuman(inst)
	-- Set speed when reviving from ghost (optional)
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "greatsage_speed_mod", 1.8)
end

local function onbecameghost(inst)
	-- Remove speed modifier when becoming a ghost
	--inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "greatsage_speed_mod", 2)
end

-- When loading or spawning the character
local function onload(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
end

local function NightVision(inst)
	if not TheWorld.state.isday then
		inst.components.playervision:ForceNightVision(true)
        inst.components.playervision:SetCustomCCTable(MONSTERVISION_COLOURCUBES)
    else
        inst.components.playervision:ForceNightVision(false)
        inst.components.playervision:SetCustomCCTable(nil)
	end
end

local function IsValidVictim(victim)
	--return true
	return victim ~= nil and victim:HasTag("monster")
end

local function onattack(inst, data)
    local victim = data.target
    if not inst.components.health:IsDead() and IsValidVictim(victim) then
    	local maxSanity = inst.components.sanity:GetMaxWithPenalty()
        local damage = data.weapon ~= nil and data.weapon.components.weapon.damage or inst.components.combat:CalcDamage(victim, data.weapon)

		local healthPercent = inst.components.health:GetPercent()
		local sanityPercent = inst.components.sanity:GetPercent()
		local healthAbsorbPercent = 0.02
		local sanityAbsorbPercent = 0.02
		
		if healthPercent < 0.3 then
			healthAbsorbPercent = 0.25
		elseif healthPercent < 0.6 then
			healthAbsorbPercent = 0.1
		end

		if sanityPercent < 0.3 then
			sanityAbsorbPercent = 0.15
		elseif sanityPercent < 0.6 then
			sanityAbsorbPercent = 0.08
		end

        local healthDelta = damage * healthAbsorbPercent;
        local sanityDelta = maxSanity * (1 - sanityPercent) * sanityAbsorbPercent;

        inst.components.health:DoDelta(healthDelta)
        inst.components.sanity:DoDelta(sanityDelta)
    end
end

-- This initializes for both the server and client. Tags can be added here.
local common_postinit = function(inst) 
	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "greatsage.tex" )
	
	inst:AddTag("woodcutter")
    inst:AddTag("nightvision")
	inst:WatchWorldState("startnight", NightVision)
	inst:WatchWorldState("startday", NightVision)
end

-- This initializes for the server only. Components are added here.
local master_postinit = function(inst)
	-- choose which sounds this character will play
	inst.soundsname = "willow"
	
	-- Uncomment if "wathgrithr"(Wigfrid) or "webber" voice is used
    --inst.talker_path_override = "dontstarve_DLC001/characters/"
	
	-- Stats
	inst.components.health:SetMaxHealth(200)
	inst.components.hunger:SetMax(200)
	inst.components.sanity:SetMax(100)

	-- Health regen
	inst.components.health:StartRegen(3, 5)
	
	-- Damage multiplier (optional)
    inst.components.combat.damagemultiplier = 2
    inst.components.combat:SetAreaDamage(3, 0.3)
    inst.components.combat:SetAttackPeriod(0.01)

	inst.components.sanity.night_drain_mult = 0.8
	inst.components.sanity.neg_aura_mult = 0.8

	--温度抵抗
	inst.components.temperature.inherentinsulation = 40
	inst.components.temperature.inherentsummerinsulation = 100
	inst.components.temperature.maxtemp = 50
	inst.components.temperature.hurtrate = 0.5
	inst.components.health.fire_damage_scale = 0
	
	-- Hunger rate (optional)
	inst.components.hunger.hungerrate = 1.8 * TUNING.WILSON_HUNGER_RATE

	local selfeater = inst.components.eater
	selfeater.ignoresspoilage = true

	local old = selfeater.Eat
	function inst.components.eater:Eat(food)
		if selfeater:CanEat(food) then
			if food.components.edible.hungervalue < 10 then
				food.components.edible.hungervalue = 10
			end
			if food.components.edible.sanityvalue < 5 and not food:HasTag("meat") then
				food.components.edible.sanityvalue = 5
			end
			if food.components.edible.healthvalue < 5 and food:HasTag("meat") then
				food.components.edible.healthvalue = 5
			end
		end
		return old(selfeater, food)
	end

    inst:ListenForEvent("onattackother", onattack)
	
	inst.OnLoad = onload
    inst.OnNewSpawn = onload
end

return MakePlayerCharacter("greatsage", prefabs, assets, common_postinit, master_postinit, start_inv)
