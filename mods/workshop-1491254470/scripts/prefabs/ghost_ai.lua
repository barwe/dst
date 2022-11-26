local assets =
{
    Asset("ANIM", "anim/player_ghost_withhat.zip"),
    Asset("ANIM", "anim/ghost_build.zip"),
    Asset("SOUND", "sound/ghost.fsb"),
}

local brain = require "brains/ghostaibrain"


local WAKE_TO_FOLLOW_DISTANCE = 10
--local SLEEP_NEAR_LEADER_DISTANCE = 7

local function ShouldWakeUp(inst)
    return DefaultWakeTest(inst) or not inst.components.follower:IsNearLeader(WAKE_TO_FOLLOW_DISTANCE)
end



local function AbleToAcceptTest(inst, item)-------------------------
    return false, item.prefab == "reviver" and "GHOSTHEART" or nil------------------
end

local function OnDeath(inst)--------------
    inst.components.aura:Enable(false)
end

local function Retarget(inst)-----------------
	local leader = inst.components.follower.leader
    return FindEntity(
        inst,
        20,
        function(guy)
            return leader ~= nil
			    and leader ~= guy
                and inst.components.combat:CanTarget(guy)
                and ((guy.components.combat and guy.components.combat.target == leader) or
                    (leader.components.combat and leader.components.combat.target == guy))
        end,
        { "_combat", "_health" },
        { "INLIMBO", "noauradamage" }
    )
end

local function auratest(inst, target)---------------------
	local leader = inst.components.follower.leader
    if target == inst.leader then------------
        return false
    end

    if inst.components.combat.target == target then------------
        return true
    end
    if target.components.combat.target ~= nil--------------------- 
        and (target.components.combat.target == inst or
            target.components.combat.target == leader) then
        return true
    end

    if leader ~= nil------------
        and (leader == target
            or (target.components.follower ~= nil and
                target.components.follower.leader == leader)) then
        return false
    end

    return not target:HasTag("player") and target:HasTag("monster") or target:HasTag("prey")----/ 
end


local function KillerRetarget(inst)
    return FindEntity(inst, SpringCombatMod(8),
        function(guy)
            return inst.components.combat:CanTarget(guy)
        end,
        { "_combat", "_health" },
        { "insect", "INLIMBO" },
        { "character", "animal", "monster" })
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddLight()
    inst.entity:AddNetwork()

    MakeGhostPhysics(inst, .5, .5)-------------

    inst.AnimState:SetBloomEffectHandle("shaders/anim_bloom_ghost.ksh")
    inst.AnimState:SetLightOverride(TUNING.GHOST_LIGHT_OVERRIDE)

    inst.Light:SetIntensity(.6)----------------------
    inst.Light:SetRadius(.6)
    inst.Light:SetFalloff(.6)
    inst.Light:Enable(true)
    inst.Light:SetColour(180/255, 195/255, 225/255)

    inst.AnimState:SetBank("ghost")-------------------
    inst.AnimState:SetBuild("ghost_build")
    inst.AnimState:PlayAnimation("idle", true)
    --inst.AnimState:SetMultColour(1,1,1,.6)

    --inst:AddTag("monster")
    inst:AddTag("hostile")
    inst:AddTag("ghost")
	inst:AddTag("ghost_ai")
    inst:AddTag("noauradamage")
	
	inst:AddTag("flying")
	--inst:AddTag("hostile")

    --trader (from trader component) added to pristine state for optimization
    inst:AddTag("trader")

    inst.SoundEmitter:PlaySound("dontstarve/ghost/ghost_howl_LP", "howl")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:SetBrain(brain)---------

    inst:AddComponent("locomotor")--------------------------- 
    inst.components.locomotor.walkspeed = TUNING.GHOST_SPEED
    inst.components.locomotor.runspeed = TUNING.GHOST_SPEED
    inst.components.locomotor.directdrive = true
	
	inst.components.locomotor.runspeed = 5

    inst:SetStateGraph("SGghostai")------------

    inst:AddComponent("sanityaura")------------------------
    inst.components.sanityaura.aura = -TUNING.SANITYAURA_MED

    inst:AddComponent("inspectable")--------------------
	inst.components.inspectable:SetDescription("游荡的灵魂需要归宿")
	
    inst:AddComponent("health")------------------
    inst.components.health:SetMaxHealth(TUNING.GHOST_HEALTH)

    inst:AddComponent("combat")-----------------------------
    inst.components.combat.defaultdamage = TUNING.GHOST_DAMAGE
    inst.components.combat.playerdamagepercent = TUNING.GHOST_DMG_PLAYER_PERCENT
	inst.components.combat:SetRetargetFunction(3, Retarget)

    inst:AddComponent("aura")--------------------- 
    inst.components.aura.radius = 3
    inst.components.aura.tickperiod = 1
    inst.components.aura.ignoreallies = true
    inst.components.aura.auratestfn = auratest

    --Added so you can attempt to give hearts to trigger flavour text when the action fails
    inst:AddComponent("trader")-----------------------
    inst.components.trader:SetAbleToAcceptTest(AbleToAcceptTest)
	
	inst:AddComponent("follower")
	--inst:ListenForEvent("stopfollowing", OnStopFollowing)
    --inst:ListenForEvent("startfollowing", OnStartFollowing)

    inst:ListenForEvent("death", OnDeath)
	
	inst:DoPeriodicTask(10,function()-------------------
		if inst.components.follower.leader == nil then 
			inst.sg:GoToState("dissipate")
		end
	end)

    ------------------

    return inst
end

STRINGS.NAMES.GHOST_AI = "游魂"

return Prefab("ghost_ai", fn, assets)
