local assets=
{ 
    Asset("ANIM", "anim/yoyozi_maozi.zip"),
    Asset("ANIM", "anim/yoyozi_maozi_swap.zip"), 

    Asset("ATLAS", "images/inventoryimages/yoyozi_maozi.xml"),
    Asset("IMAGE", "images/inventoryimages/yoyozi_maozi.tex"),
}

local prefabs = 
{
}

local function checkowner(inst,owner)--------------------------
	
end 

local function OnEquip(inst, owner) --------------------------------------------?
	checkowner(inst,owner)--------
    owner.AnimState:OverrideSymbol("swap_hat", "yoyozi_maozi_swap", "swap_hat")
    owner.AnimState:Show("HAT")
    owner.AnimState:Show("HAIR_HAT")
    owner.AnimState:Hide("HAIR_NOHAT")
    owner.AnimState:Hide("HAIR")
    if owner:HasTag("player") then
        owner.AnimState:Hide("HEAD")
        owner.AnimState:Show("HEAD_HAT")
		if owner:HasTag("HairFrontHat") then
			owner.AnimState:OverrideSymbol("hairfront", "yuyuko", "hairfront_hat")
		end
    end
end

local function OnUnequip(inst, owner) 
	checkowner(inst,owner)--------
    owner.AnimState:Hide("HAT")
    owner.AnimState:Hide("HAIR_HAT")
    owner.AnimState:Show("HAIR_NOHAT")
    owner.AnimState:Show("HAIR")
    if owner:HasTag("player") then
        owner.AnimState:Show("HEAD")
        owner.AnimState:Hide("HEAD_HAT")
		if owner:HasTag("HairFrontHat") then 
			owner.AnimState:ClearOverrideSymbol("hairfront")
		end
	end
end

local function OnChosen(inst,owner)
	return owner.prefab == "yoyozi"
end 

local function fn()

    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
	inst.entity:AddNetwork()
    MakeInventoryPhysics(inst)
    
    anim:SetBank("beehat")----------------------
    anim:SetBuild("yoyozi_maozi")--------------------
    anim:PlayAnimation("anim")----------------

	inst.entity:SetPristine()
	
	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:AddComponent("chosenpeople")--------
	inst.components.chosenpeople:SetChosenFn(OnChosen)
	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "yoyozi_maozi"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/yoyozi_maozi.xml"
    
    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip(OnEquip)
    inst.components.equippable:SetOnUnequip(OnUnequip)
	
	inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE----------------
	
	inst:AddComponent("armor")
    inst.components.armor:InitCondition(200,0.6)---------------
	
	--inst:AddComponent("fueled")
    --inst.components.fueled.fueltype = "USAGE"
    --inst.components.fueled:InitializeFuelLevel(TUNING.EARMUFF_PERISHTIME)
    --inst.components.fueled:SetDepletedFn(inst.Remove)
	
	
	
	inst:AddComponent("insulator")
    inst.components.insulator:SetInsulation(TUNING.INSULATION_SMALL)--TINY SMALL MED LARGE ABSOLUTE
	
		
	inst:AddComponent("inspectable")
	--inst.components.inspectable:SetDescription("")

	
	MakeHauntableLaunch(inst)
	
    return inst
end

return  Prefab("common/inventory/yoyozi_maozi", fn, assets, prefabs)