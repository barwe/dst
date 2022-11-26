local assets =
{
	Asset("ANIM", "anim/bambootree.zip"),
	Asset("ANIM", "anim/bambootree_build.zip"),
}

local prefabs =
{
    "bamboo",
    "dug_bambooootree",
    "hacking_bamboo_fx",
}

local function dig_up(inst, worker)
	if inst.components.pickable and inst.components.pickable:CanBePicked() then
		inst.components.lootdropper:SpawnLootPrefab("bamboo")
	end
	inst.components.lootdropper:SpawnLootPrefab("dug_bambooootree")
	inst:Remove()
end

local function onregenfn(inst)
    inst.AnimState:PlayAnimation("grow")
    inst.AnimState:PushAnimation("idle", true)
	inst.Physics:SetCollides(true)
end

local function makeemptyfn(inst)
    if 
           inst.components.witherable ~= nil and
            inst.components.witherable:IsWithered() or
            inst.AnimState:IsCurrentAnimation("idle_dead")
         then
        inst.AnimState:PlayAnimation("dead_to_empty")
        inst.AnimState:PushAnimation("picked", false)
    else
        inst.AnimState:PlayAnimation("picked")
    end
	inst.Physics:SetCollides(true)
end

local function makebarrenfn(inst, wasempty)
    if inst.components.witherable ~= nil and
        inst.components.witherable:IsWithered() then
        inst.AnimState:PlayAnimation(wasempty and "empty_to_dead" or "full_to_dead")
        inst.AnimState:PushAnimation("idle_dead", false)
    else
        inst.AnimState:PlayAnimation("idle_dead")
    end
	inst.Physics:SetCollides(true)
end

local function onpickedfn(inst, picker)

	local fx = SpawnPrefab("hacking_bamboo_fx")
    local x, y, z= inst.Transform:GetWorldPosition()
    fx.Transform:SetPosition(x,y + math.random()*2,z)
	
    inst.SoundEmitter:PlaySound("dontstarve/wilson/pickup_reeds")
    inst.AnimState:PlayAnimation("picking")

    if inst.components.pickable:IsBarren() then
        --inst.AnimState:PushAnimation("empty_to_dead")
        inst.AnimState:PushAnimation("idle_dead", false)
		inst.Physics:SetCollides(true)
    else
        inst.AnimState:PushAnimation("picked", false)
		inst.Physics:SetCollides(false)
    end
end


local function ontransplantfn(inst)
	if inst.components.pickable then
		inst.components.pickable:MakeBarren()
	end
end

local function grass(name, stage)
    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddMiniMapEntity()
        inst.entity:AddNetwork()

        inst.MiniMapEntity:SetIcon("bambooootree.tex")

        inst.AnimState:SetBank("bambootree")
        inst.AnimState:SetBuild("bambootree_build")
        inst.AnimState:PlayAnimation("idle", true)

        inst:AddTag("renewable")
		MakeObstaclePhysics(inst, .35)	
        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst.AnimState:SetTime(math.random() * 2)
        local color = 0.75 + math.random() * 0.25
        inst.AnimState:SetMultColour(color, color, color, 1)

        inst:AddComponent("pickable")
        inst.components.pickable.picksound = "dontstarve/wilson/pickup_reeds"

        inst.components.pickable:SetUp("bamboo", 1920)
        inst.components.pickable.onregenfn = onregenfn
        inst.components.pickable.onpickedfn = onpickedfn
        inst.components.pickable.makeemptyfn = makeemptyfn
        inst.components.pickable.makebarrenfn = makebarrenfn
        inst.components.pickable.max_cycles = 20
        inst.components.pickable.cycles_left = 20
        inst.components.pickable.ontransplantfn = ontransplantfn

        if stage == 1 then
            inst.components.pickable:MakeBarren()
        end

        inst:AddComponent("lootdropper")
        inst:AddComponent("inspectable")

		
		inst:AddComponent("workable")
		inst.components.workable:SetWorkAction(ACTIONS.DIG)
		inst.components.workable:SetOnFinishCallback(dig_up)
		inst.components.workable:SetWorkLeft(1)
        ---------------------

        MakeMediumBurnable(inst)
        MakeSmallPropagator(inst)
        MakeNoGrowInWinter(inst)
        MakeHauntableIgnite(inst)
        ---------------------

        return inst
    end

    return Prefab(name, fn, assets, prefabs)
end

return grass("bambooootree", 0),
    grass("depleted_bambooootree", 1)

