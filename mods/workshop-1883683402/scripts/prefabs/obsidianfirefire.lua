local assets =
{
	Asset("ANIM", "anim/campfire_fire.zip"),
	Asset("SOUND", "sound/common.fsb"),
}

local heats = { 70, 85, 100, 115 }
local function GetHeatFn(inst)
	return heats[inst.components.firefx.level] or 20
end

local function fn()

	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
	local sound = inst.entity:AddSoundEmitter()
	local light = inst.entity:AddLight()

    anim:SetBank("campfire_fire")
    anim:SetBuild("campfire_fire")
	anim:SetBloomEffectHandle( "shaders/anim.ksh" )
    inst.AnimState:SetRayTestOnBB(true)

    inst:AddTag("fx")

    inst:AddComponent("firefx")
    inst.components.firefx.levels =
    {
        {anim="level1", sound="dontstarve/common/campfire", radius=TUNING.OBSIDIANLIGHT_RADIUS_1, intensity=.8, falloff=.33, colour = {255/255,255/255,192/255}, soundintensity=.1},
        {anim="level2", sound="dontstarve/common/campfire", radius=TUNING.OBSIDIANLIGHT_RADIUS_2, intensity=.8, falloff=.33, colour = {255/255,255/255,192/255}, soundintensity=.3},
        {anim="level3", sound="dontstarve/common/campfire", radius=TUNING.OBSIDIANLIGHT_RADIUS_3, intensity=.8, falloff=.33, colour = {255/255,255/255,192/255}, soundintensity=.6},
        {anim="level4", sound="dontstarve/common/campfire", radius=TUNING.OBSIDIANLIGHT_RADIUS_4, intensity=.8, falloff=.33, colour = {255/255,255/255,192/255}, soundintensity=1},
    }

    anim:SetFinalOffset(-1)
    inst.components.firefx:SetLevel(1)
    inst.components.firefx.usedayparamforsound = true

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("heater")
    inst.components.heater.heatfn = GetHeatFn
    return inst
end

return Prefab( "common/fx/obsidianfirefire", fn, assets)
