local straw_assets =
{
    Asset("ANIM", "anim/swap_bedroll_bamboooo.zip"),
	Asset("ATLAS", "images/inventoryimages/bamboobed.xml"),
}

local function onwake(inst, sleeper, nostatechange)
    if inst.sleeptask ~= nil then
        inst.sleeptask:Cancel()
        inst.sleeptask = nil
    end

    if not nostatechange then
        if sleeper.sg:HasStateTag("bedroll") then
            sleeper.sg.statemem.iswaking = true
        end
        sleeper.sg:GoToState("wakeup")
    end

    if inst.components.finiteuses == nil or inst.components.finiteuses:GetUses() <= 0 then
        if inst.components.stackable ~= nil then
            inst.components.stackable:Get():Remove()
        else
            inst:Remove()
        end
    end
end

local function onsleeptick(inst, sleeper)
    local isstarving = sleeper.components.beaverness ~= nil and sleeper.components.beaverness:IsStarving()

    if sleeper.components.hunger ~= nil then			
        sleeper.components.hunger:DoDelta(TUNING.SLEEP_HUNGER_PER_TICK, true, true)
        isstarving = sleeper.components.hunger:IsStarving()
    end
														
    if sleeper.components.sanity ~= nil and sleeper.components.sanity:GetPercentWithPenalty() < 1 then
        sleeper.components.sanity:DoDelta(	sleeper:HasTag("bamboooo") and 1 or 0.67, true)  
    end
																
    if not isstarving and inst.components.sleepingbag.healthsleep and sleeper.components.health ~= nil then
        sleeper.components.health:DoDelta(sleeper:HasTag("bamboooo") and 2 or 1, true, "bedroll", true)
    end

    if sleeper.components.temperature ~= nil then
        if inst.sleep_temp_min ~= nil and sleeper.components.temperature:GetCurrent() < inst.sleep_temp_min then
            sleeper.components.temperature:SetTemperature(sleeper.components.temperature:GetCurrent() + TUNING.SLEEP_TEMP_PER_TICK)
        elseif inst.sleep_temp_max ~= nil and sleeper.components.temperature:GetCurrent() > inst.sleep_temp_max then
            sleeper.components.temperature:SetTemperature(sleeper.components.temperature:GetCurrent() - TUNING.SLEEP_TEMP_PER_TICK)
        end
    end

    if isstarving then
        inst.components.sleepingbag:DoWakeUp()
    end
end

local function onsleep(inst, sleeper)
    if inst.sleeptask ~= nil then
        inst.sleeptask:Cancel()
    end
    inst.sleeptask = inst:DoPeriodicTask(TUNING.SLEEP_TICK_PERIOD, onsleeptick, nil, sleeper)
end

local function onuse_straw(inst, sleeper)
    sleeper.AnimState:OverrideSymbol("swap_bedroll", "swap_bedroll_bamboooo", "bedroll_furry")
end

local function common_fn(bank, build)
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank(bank)
    inst.AnimState:SetBuild(build)
    inst.AnimState:PlayAnimation("idle")
	inst:AddTag("bamboobed")
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/bamboobed.xml"

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.LARGE_FUEL

    MakeSmallBurnable(inst, TUNING.LONG_BURNABLE)
    MakeSmallPropagator(inst)

    inst:AddComponent("sleepingbag")
    inst.components.sleepingbag.onsleep = onsleep
    inst.components.sleepingbag.onwake = onwake

    MakeHauntableLaunchAndIgnite(inst)

    return inst
end

local function bedroll_bamboooo()
    local inst = common_fn("swap_bedroll_bamboooo", "swap_bedroll_bamboooo")

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_LARGEITEM

    inst.sanity_tick = TUNING.SLEEP_SANITY_PER_TICK * .67
    --inst.temperature_target = nil
    inst.components.sleepingbag.healthsleep = true
    inst.onuse = onuse_straw

    return inst
end


return Prefab("bamboobed", bedroll_bamboooo, straw_assets)
