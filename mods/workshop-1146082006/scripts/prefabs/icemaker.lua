require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/icemachine.zip"),
}

local prefabs =
{
    "collapse_small",
    "gears",
}

local MACHINESTATES =
{
    ON = "_on",
    OFF = "_off",
}

local function spawnice(inst)
    inst:RemoveEventCallback("animover", spawnice)

    local gears = SpawnPrefab("gears")
    local pt = Vector3(inst.Transform:GetWorldPosition()) + Vector3(0,2,0)
    gears.Transform:SetPosition(pt:Get())
    local down = TheCamera:GetDownVec()
    local angle = math.atan2(down.z, down.x) + (math.random()*60)*DEGREES
    local sp = 3 + math.random()
    gears.Physics:SetVel(sp*math.cos(angle), math.random()*2+8, sp*math.sin(angle))
    SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())

    --Machine should only ever be on after spawning an gears
    inst.components.fueled:StartConsuming()
    inst.AnimState:PlayAnimation("idle_on", true)
end

local function onhammered(inst, worked)
    if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
    end
    inst.components.lootdropper:DropLoot()
    SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
    inst.SoundEmitter:PlaySound("dontstarve/common/destroy_metal")

    inst:Remove()
end

local function fueltaskfn(inst)
    inst.AnimState:PlayAnimation("use")
    --inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/icemachine_start")
    inst.components.fueled:StopConsuming() --temp pause fuel so we don't run out in the animation.
    inst:ListenForEvent("animover", spawnice)
end

local function ontakefuelfn(inst)
    inst.SoundEmitter:PlaySound("dontstarve/common/fireAddFuel")
    inst.components.fueled:StartConsuming()
end

local function fuelupdatefn(inst, dt)
    -- TODO: summer season rate adjustment?
    inst.components.fueled.rate = 1
end

local function onhit(inst, worker)
    inst.AnimState:PlayAnimation("hit"..inst.machinestate)
    inst.AnimState:PushAnimation("idle"..inst.machinestate, true)
    inst:RemoveEventCallback("animover", spawnice)
    if inst.machinestate == MACHINESTATES.ON then
        inst.components.fueled:StartConsuming() --resume fuel consumption incase you were interrupted from fueltaskfn
    end
end

local function fuelsectioncallback(new, old, inst)
    if new == 0 and old > 0 then
        inst.machinestate = MACHINESTATES.OFF
        inst.AnimState:PlayAnimation("turn"..inst.machinestate)
        inst.AnimState:PushAnimation("idle"..inst.machinestate, true)
        inst.SoundEmitter:KillSound("loop")
        if inst.fueltask ~= nil then
            inst.fueltask:Cancel()
            inst.fueltask = nil
        end
    elseif new > 0 and old == 0 then
        inst.machinestate = MACHINESTATES.ON
        inst.AnimState:PlayAnimation("turn"..inst.machinestate)
        inst.AnimState:PushAnimation("idle"..inst.machinestate, true)
        if not inst.SoundEmitter:PlayingSound("loop") then
            --inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/icemachine_lp", "loop")
        end
        if inst.fueltask == nil then
            inst.fueltask = inst:DoPeriodicTask(TUNING.ICEMAKER_SPAWN_TIME, fueltaskfn)
        end
    end
end

local function getstatus(inst)
    local sec = inst.components.fueled:GetCurrentSection()
    if sec == 0 then
        STRINGS.CHARACTERS.GENERIC.DESCRIBE.ICEMAKER            = "It needs more fuel."
        STRINGS.CHARACTERS.WILLOW.DESCRIBE.ICEMAKER             = "It turns fire into gears. Woaw"
        STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.ICEMAKER           = "Small machine is out of gears."
        STRINGS.CHARACTERS.WENDY.DESCRIBE.ICEMAKER              = "My heart makes gears too."
        STRINGS.CHARACTERS.WX78.DESCRIBE.ICEMAKER               = "FUEL IS DEPLETED"
        STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.ICEMAKER       = "It's out of energy."
        STRINGS.CHARACTERS.WOODIE.DESCRIBE.ICEMAKER             = "It's hooped."
        STRINGS.CHARACTERS.WAXWELL.DESCRIBE.ICEMAKER            = "It's not doing its job."
        STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.ICEMAKER         = "Reminds me öf höme."
        STRINGS.CHARACTERS.WEBBER.DESCRIBE.ICEMAKER             = "Gears is useful in this heat."
        return "OUT"
    elseif sec == 1 then
        STRINGS.CHARACTERS.GENERIC.DESCRIBE.ICEMAKER            = "I can hear it sputtering."
        STRINGS.CHARACTERS.WILLOW.DESCRIBE.ICEMAKER             = "It turns fire into gears. Woaw."
        STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.ICEMAKER           = "Machine will not last much longer."
        STRINGS.CHARACTERS.WENDY.DESCRIBE.ICEMAKER              = "My heart makes gears too."
        STRINGS.CHARACTERS.WX78.DESCRIBE.ICEMAKER               = "MACHINE IS RUNNING ON EMPTY"
        STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.ICEMAKER       = "Nearly empty."
        STRINGS.CHARACTERS.WOODIE.DESCRIBE.ICEMAKER             = "It'll give out any second."
        STRINGS.CHARACTERS.WAXWELL.DESCRIBE.ICEMAKER            = "It's on its last legs."
        STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.ICEMAKER         = "Reminds me öf höme."
        STRINGS.CHARACTERS.WEBBER.DESCRIBE.ICEMAKER             = "Gears is useful in this heat."
        return "VERYLOW"
    elseif sec == 2 then
        STRINGS.CHARACTERS.GENERIC.DESCRIBE.ICEMAKER            = "It seems to be slowing down."
        STRINGS.CHARACTERS.WILLOW.DESCRIBE.ICEMAKER             = "It turns fire into gears. Woaw."
        STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.ICEMAKER           = "Little machine looks tired"
        STRINGS.CHARACTERS.WENDY.DESCRIBE.ICEMAKER              = "My heart makes gears too."
        STRINGS.CHARACTERS.WX78.DESCRIBE.ICEMAKER               = "FUEL IS REQUIRED FOR FURTHER PRODUCTION"
        STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.ICEMAKER       = "Its pace is dropping."
        STRINGS.CHARACTERS.WOODIE.DESCRIBE.ICEMAKER             = "Gettin' low."
        STRINGS.CHARACTERS.WAXWELL.DESCRIBE.ICEMAKER            = "I'd better fill it up."
        STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.ICEMAKER         = "Reminds me öf höme."
        STRINGS.CHARACTERS.WEBBER.DESCRIBE.ICEMAKER             = "Gears is useful in this heat."
        return "LOW"
    elseif sec == 3 then
        STRINGS.CHARACTERS.GENERIC.DESCRIBE.ICEMAKER            = "It's putting along."
        STRINGS.CHARACTERS.WILLOW.DESCRIBE.ICEMAKER             = "It turns fire into gears. Woaw."
        STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.ICEMAKER           = "Thank you for good gears, machine"
        STRINGS.CHARACTERS.WENDY.DESCRIBE.ICEMAKER              = "My heart makes gears too."
        STRINGS.CHARACTERS.WX78.DESCRIBE.ICEMAKER               = "MACHINE IS OPERATING SATISFACTORILY"
        STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.ICEMAKER       = "The output is quite regular."
        STRINGS.CHARACTERS.WOODIE.DESCRIBE.ICEMAKER             = "It's pumping along nicely."
        STRINGS.CHARACTERS.WAXWELL.DESCRIBE.ICEMAKER            = "It appears to be doing its job."
        STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.ICEMAKER         = "Reminds me öf höme."
        STRINGS.CHARACTERS.WEBBER.DESCRIBE.ICEMAKER             = "Gears is useful in this heat."
        return "NORMAL"
    elseif sec == 4 then
        STRINGS.CHARACTERS.GENERIC.DESCRIBE.ICEMAKER            = "It's running great!"
        STRINGS.CHARACTERS.WILLOW.DESCRIBE.ICEMAKER             = "It turns fire into gears. Woaw."
        STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.ICEMAKER           = "Machine is doing very good job!"
        STRINGS.CHARACTERS.WENDY.DESCRIBE.ICEMAKER              = "My heart makes gears too."
        STRINGS.CHARACTERS.WX78.DESCRIBE.ICEMAKER               = "MACHINE IS OPERATING AT OPTIMAL LEVEL"
        STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.ICEMAKER       = "Icetastic!"
        STRINGS.CHARACTERS.WOODIE.DESCRIBE.ICEMAKER             = "Furiously gears! Reminds me of home."
        STRINGS.CHARACTERS.WAXWELL.DESCRIBE.ICEMAKER            = "It's working hard to make gears for me."
        STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.ICEMAKER         = "Reminds me öf höme."
        STRINGS.CHARACTERS.WEBBER.DESCRIBE.ICEMAKER             = "Gears is useful in this heat."
        return "HIGH"
    end
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("place")
    inst.AnimState:PushAnimation("idle"..inst.machinestate)
    --inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/icemaker_place")
    inst.SoundEmitter:PlaySound("dontstarve/common/researchmachine_place")
end

local function onFloodedStart(inst)
    if inst.components.fueled then 
        inst.components.fueled.accepting = false
    end 
end 

local function onFloodedEnd(inst)
    if inst.components.fueled then 
        inst.components.fueled.accepting = true
    end 
end 

local function fn(Sim)
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeObstaclePhysics(inst, .4)

    local minimap = inst.entity:AddMiniMapEntity()
    inst.MiniMapEntity:SetIcon("minimap_icemaker.tex")

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()

    inst.AnimState:SetBank("icemachine")
    inst.AnimState:SetBuild("icemachine")

    inst:AddTag("structure")

    inst:AddComponent("lootdropper")

    inst:AddComponent("fueled")
    inst.components.fueled.maxfuel = TUNING.ICEMAKER_FUEL_MAX
    inst.components.fueled.accepting = true
    inst.components.fueled:SetSections(4)
    inst.components.fueled.ontakefuelfn = ontakefuelfn
    inst.components.fueled:SetUpdateFn(fuelupdatefn)
    inst.components.fueled:SetSectionCallback(fuelsectioncallback)
    inst.components.fueled:InitializeFuelLevel(TUNING.ICEMAKER_FUEL_MAX/2)
    inst.components.fueled:StartConsuming()

    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetOnFinishCallback(onhammered)
    --inst.components.workable:SetOnWorkCallback(onhit)

    MakeLargeBurnable(inst, nil, nil, true)
    MakeLargePropagator(inst)

    inst.machinestate = MACHINESTATES.ON
    inst:ListenForEvent( "onbuilt", onbuilt)

    return inst
end

return Prefab( "common/icemaker", fn, assets, prefabs),
MakePlacer( "common/icemaker_placer", "icemachine", "icemachine", "idle_off" )
