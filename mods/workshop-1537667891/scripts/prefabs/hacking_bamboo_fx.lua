
local assets =
{
    Asset("ANIM", "anim/hacking_bamboo_fx.zip"),
}

local function PlayRingAnim(proxy)
    local inst = CreateEntity()

    inst:AddTag("FX")
    inst.entity:SetCanSleep(false)
    inst.persists = false
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.Transform:SetFromProxy(proxy.GUID)
   
    inst.AnimState:SetBank("hacking_bamboo_fx")
    inst.AnimState:SetBuild("hacking_bamboo_fx")
    inst.AnimState:PlayAnimation("idle")

    inst:ListenForEvent("animover", inst.Remove)
end

local function fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddNetwork()
    inst:AddTag("FX")
    if not TheNet:IsDedicated() then
        inst:DoTaskInTime(0, PlayRingAnim)
    end
    inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        return inst
    end
    inst.persists = false
    inst:DoTaskInTime(3, inst.Remove)
    return inst
end
return Prefab("hacking_bamboo_fx", fn, assets)