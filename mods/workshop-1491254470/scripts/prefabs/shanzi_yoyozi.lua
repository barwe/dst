
local assets =
{
    Asset("ANIM", "anim/shanzi_yoyozi.zip"),
    Asset("ANIM", "anim/swap_shanzi_yoyozi.zip"),
	Asset("IMAGE","images/inventoryimages/shanzi_yoyozi.tex"),
	Asset("ATLAS","images/inventoryimages/shanzi_yoyozi.xml")
}

STRINGS.NAMES.SHANZI_YOYOZI = "幽幽子的折扇"
local name = STRINGS.NAMES.SHANZI_YOYOZI


local function ChangeSymbol(inst,owner)----------------------
	if owner and owner.AnimState then 
		if inst.isopen == 1 then
			owner.AnimState:OverrideSymbol("swap_object", "swap_shanzi_yoyozi", "swap_shanzi_yoyozi_open")
		else
			owner.AnimState:OverrideSymbol("swap_object", "swap_shanzi_yoyozi", "swap_shanzi_yoyozi_close")
		end
	end
end 

local function turnon(inst)------------
	local owner = inst.components.inventoryitem.owner-------
	if inst.components.equippable:IsEquipped() then 
		owner:PushEvent("unequip", {item=inst, eslot=EQUIPSLOTS.HANDS})
		owner:PushEvent("equip", {item=inst, eslot=EQUIPSLOTS.HANDS})
		owner.AnimState:OverrideSymbol("swap_object", "swap_shanzi_yoyozi", "swap_shanzi_yoyozi_open")--------
		
	end 

	inst.components.named:SetName(name.."(开扇)")------
	
	inst.isopen = 1-----------
	ChangeSymbol(inst,owner)----------

    inst.components.weapon:SetDamage(5)--------
    inst.components.weapon:SetRange(12, 12)--------
	inst.components.weapon:SetProjectile("butterfly_projectile")------
    inst.components.insulator:SetInsulation(TUNING.INSULATION_MED)
	

end 

local function turnoff(inst)----
	local owner = inst.components.inventoryitem.owner
	if inst.components.equippable:IsEquipped() then 
		owner:PushEvent("unequip", {item=inst, eslot=EQUIPSLOTS.HANDS})
		owner:PushEvent("equip", {item=inst, eslot=EQUIPSLOTS.HANDS})
		owner.AnimState:OverrideSymbol("swap_object", "swap_shanzi_yoyozi", "swap_shanzi_yoyozi_close")
	end 
	inst.components.named:SetName(name.."(关扇)")------
	
	inst.isopen = 0
	ChangeSymbol(inst,owner)
    inst.components.weapon:SetDamage(40)
    inst.components.weapon:SetRange(0.2, 0.2)
	inst.components.weapon:SetProjectile(nil)---------

	inst.components.insulator:SetInsulation(0)

	
end 

---------------------------------------------------------------
local function sf(inst,x,y,z)
    local x,y,z = inst:GetPosition():Get()
	local ghosts = TheSim:FindEntities(x,y,z,16,{"ghost_ai"})-------------------------
	

		if inst.components.follower then 
		   inst.components.follower:SetLeader(inst)-------------------
		end
	end 
--end

---------------------------------------------------------------

local function onuse(inst)--------
	if inst.isopen == 1 then --------
		turnoff(inst)
	else
		turnon(inst)
	end
	inst.components.useableitem.inuse = false-------
end 

local function onequip(inst, owner)
	ChangeSymbol(inst,owner)
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end

local function onunequip(inst, owner)
	owner.AnimState:ClearOverrideSymbol("swap_object")
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end

local function onattack(inst,owner,target)
	if inst.isopen == 1 then 
		local x,y,z = owner:GetPosition():Get()
		local ents = TheSim:FindEntities(x,y,z,15,{"ghost_ai"})
		local nums = 0
		for _,v in pairs(ents)do
			if v.components.follower and v.components.follower.leader == owner then 
				nums = nums + 1
			end 
		end
		if target and target:IsValid() and target.components.combat then 
			target.components.combat:GetAttacked(owner,nums)-----------------
			if target.components.locomotor and not target:HasTag("largecreature") then -------------
				local pt11 = owner:GetPosition()
				local pt12 = target:GetPosition()
				local a,b,c = (pt12.x-pt11.x)*0.1+pt12.x,0, (pt12.z-pt11.z)*0.1+pt12.z
				if TheWorld.Map:IsPassableAtPoint(a,b,c) then
					target.Transform:SetPosition(a,b,c)
				end 
			end 
		end 
	end
end 

local function onsave(inst,data)
	data.isopen = inst.isopen or nil 
end 

local function onload(inst,data)
	if data ~= nil then 
		if data.isopen ~= nil then 
			inst.isopen = data.isopen
		end 
	end 
	if inst.isopen == 1 then
		turnon(inst)
	else 
		turnoff(inst)
	end
end 

local function OnChosen(inst,owner)
	return owner.prefab == "yoyozi"
end 

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
	inst.entity:AddLight()
    inst.entity:AddNetwork()
	inst.entity:AddSoundEmitter()
    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("shanzi_yoyozi")
    inst.AnimState:SetBuild("shanzi_yoyozi")
    inst.AnimState:PlayAnimation("idle")

	--inst.Transform:SetScale(0.56,0.56,0.56)
	inst.isopen = 0

    inst.entity:SetPristine()	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("chosenpeople")
	inst.components.chosenpeople:SetChosenFn(OnChosen)-------

	inst:AddComponent("named")
	inst.components.named:SetName(name.."(关闭)")
	
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(15)
    inst.components.weapon:SetRange(0.2, 0.2)
	inst.components.weapon.onattack = onattack
	
	--inst:AddComponent("spellcaster")
	--inst.components.spellcaster:SetSpellFn(createlight)
	--inst.components.spellcaster.canuseonpoint =true
	

--[[    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(200)
    inst.components.finiteuses:SetUses(200)--]]

    inst:AddComponent("inspectable")
	inst.components.inspectable:SetDescription("幽幽子的折扇")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "shanzi_yoyozi"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/shanzi_yoyozi.xml"

    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
	
	inst:AddComponent("useableitem")------ 
    inst.components.useableitem:SetOnUseFn(onuse)
----------------------------------------------------------------------------	
	inst:AddComponent("insulator")
    inst.components.insulator:SetSummer()
    MakeHauntableLaunch(inst)
	
    inst:AddComponent("spellcaster")
	inst.components.spellcaster:SetSpellFn(sf)
	inst.components.spellcaster.canuseonpoint =true
	--inst.components.spellcaster.castingstate = "castspell_meteor"
----------------------------------------------------------------------------

    MakeHauntableLaunch(inst)
	
	inst.OnSave = onsave
	inst.OnLoad = onload
	
    return inst
end



return Prefab( "common/inventory/shanzi_yoyozi", fn, assets)
