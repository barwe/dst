local assets =
{
    Asset("ANIM", "anim/realjgb.zip"),
    Asset("ANIM", "anim/swap_realjgb.zip"),

    Asset("ATLAS", "images/inventoryimages/realjgb.xml"),
}


local function realjgblightfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddLight()
    inst.entity:AddNetwork()

    inst:AddTag("FX")

    inst.Light:SetIntensity(0.5)
    inst.Light:SetRadius(1)
    inst.Light:Enable(true)
    inst.Light:SetFalloff(.6)
    inst.Light:SetColour(200/255, 100/255, 170/255)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.persists = false

    return inst
end


local function lighton(inst, owner)
    if inst._light == nil or not inst._light:IsValid() then
        inst._light = SpawnPrefab("realjgblight")
    end
    if owner ~= nil then
        inst._light.entity:SetParent(owner.entity)
    end
end


local function lightoff(inst)
    if inst._light ~= nil then
            if inst._light:IsValid() then
                inst._light:Remove()
            end
            inst._light = nil
        end
end


local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_realjgb", "swap_realjgb")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")

    lighton(inst, owner)
end


local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")

    lightoff(inst, owner)
end


local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddLight()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.Light:SetIntensity(0.5)
    inst.Light:SetRadius(1)
    inst.Light:Enable(true)
    inst.Light:SetFalloff(.6)
    inst.Light:SetColour(200/255, 100/255, 170/255)

    inst.AnimState:SetBank("realjgb")
    inst.AnimState:SetBuild("realjgb")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("sharp")

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()

    -----
    inst:AddComponent("tool")
    inst.components.tool:SetAction(ACTIONS.MINE, 3) --可挖矿
    inst.components.tool:SetAction(ACTIONS.CHOP, 10) --可砍树
    --inst.components.tool:SetAction(ACTIONS.DIG)  --可挖..
    --inst.components.tool:SetAction(ACTIONS.NET)  --可捕虫
    inst.components.tool:SetAction(ACTIONS.HAMMER) --可重击
    --inst:AddInherentAction(ACTIONS.TERRAFORM)    --可铲草

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.SPEAR_DAMAGE * 3)
    inst.components.weapon:SetRange(3.0, 4.0)

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.keepondeath = true
    inst.components.inventoryitem.atlasname = "images/inventoryimages/realjgb.xml"

    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
    inst.components.equippable.walkspeedmult = 1.5

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("common/inventory/realjgb", fn, assets),
       Prefab("realjgblight", realjgblightfn)