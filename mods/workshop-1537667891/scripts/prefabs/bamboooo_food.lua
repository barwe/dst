local function sanitybuff(inst,eater)
	if eater.components.debuffable ~= nil and eater.components.debuffable:IsEnabled() and
		not (eater.components.health ~= nil and eater.components.health:IsDead()) and
		not eater:HasTag("playerghost") then
                eater.components.debuffable:AddDebuff("bab_sanitybuff", "bab_sanitybuff")
	end		
end
local function damagebuff(inst,eater)
	if eater.components.debuffable ~= nil and eater.components.debuffable:IsEnabled() and
		not (eater.components.health ~= nil and eater.components.health:IsDead()) and
		not eater:HasTag("playerghost") then
                eater.components.debuffable:AddDebuff("bab_attackbuff", "bab_attackbuff")
	end		
end	

local function speedbuff(inst,eater)
	if eater.components.debuffable ~= nil and eater.components.debuffable:IsEnabled() and
		not (eater.components.health ~= nil and eater.components.health:IsDead()) and
		not eater:HasTag("playerghost") then
                eater.components.debuffable:AddDebuff("bab_speedbuff", "bab_speedbuff")
	end		
end	
local function MakeFood(name,data)
	local assets=
	{
		Asset("ANIM", "anim/"..name..".zip"),
		Asset( "IMAGE", "images/inventoryimages/"..name..".tex" ),
		Asset( "ATLAS", "images/inventoryimages/"..name..".xml" ),
	}
	
	local prefabs = 
	{
		"spoiled_food",
	}

	local function fn()
		local inst = CreateEntity()
		inst.entity:AddTransform()
		inst.entity:AddAnimState()
		inst.entity:AddNetwork()
		MakeInventoryPhysics(inst)
		
		inst.AnimState:SetBuild(name)
		inst.AnimState:SetBank(name)
		inst.AnimState:PlayAnimation("idle")
	    
	    inst:AddTag("preparedfood")
		inst:AddTag("catfood")
		inst:AddTag("bamboooo_food")

		inst.entity:SetPristine()

		if not TheWorld.ismastersim then
			return inst
		end
		inst:AddComponent("edible")
		inst.components.edible.healthvalue = data.health
		inst.components.edible.hungervalue = data.hunger
		inst.components.edible.foodtype =  data.type
		inst.components.edible.sanityvalue = data.sanity
		if data.fn ~= nil then
			inst.components.edible.oneaten = data.fn
		end		
			
		inst:AddComponent("inspectable")

		inst:AddComponent("inventoryitem")
		inst.components.inventoryitem.atlasname = "images/inventoryimages/"..name..".xml"
		
		inst:AddComponent("stackable")
		inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

		inst:AddComponent("perishable")
		inst.components.perishable:SetPerishTime(data.perishtime) 
		inst.components.perishable:StartPerishing()
		inst.components.perishable.onperishreplacement = "spoiled_food"

	    MakeHauntableLaunchAndPerish(inst)  

		return inst
	end
return Prefab(name, fn, assets, prefabs)	
end
return
		MakeFood("bab_dpr",{hunger= 150,sanity= 0 ,health= 0,perishtime=TUNING.PERISH_SLOW,type = "MEAT",fn = sanitybuff}),
		MakeFood("bab_ssgy",{hunger= 150,sanity= 0 ,health= 0,perishtime=TUNING.PERISH_SLOW,type = "MEAT",fn = damagebuff}),
		MakeFood("bab_rb",{hunger= 80,sanity= 50 ,health= 0,perishtime=TUNING.PERISH_SLOW,type = "MEAT"}),
		MakeFood("bab_sm",{hunger= 80,sanity= 0 ,health= 50,perishtime=TUNING.PERISH_SLOW,type = "VEGGIE"}),
		MakeFood("bab_jlbg",{hunger= 80,sanity= 30 ,health= 50,perishtime=TUNING.PERISH_SLOW,type = "VEGGIE"}),
		MakeFood("bab_xhb",{hunger= 75,sanity= 0 ,health= 0,perishtime=TUNING.PERISH_PRESERVED,type = "VEGGIE",fn = speedbuff})