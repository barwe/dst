require "prefabutil"

local cooking = require("cooking")

local assets=
{
    Asset("ANIM", "anim/bamboo_cookpot.zip"),
	Asset("ANIM", "anim/cook_pot_warly.zip"),
    Asset("ANIM", "anim/cook_pot_food.zip"),
    Asset("ANIM", "anim/ui_cookpot_1x4.zip"),
	Asset("ATLAS", "images/inventoryimages/bamboo_cookpot_item.xml"),
}

local prefabs = {"collapse_small"}
for k,v in pairs(cooking.recipes.cookpot) do
	table.insert(prefabs, v.name)
end

local foods = require("preparedfoods")
for k,recipe in pairs (foods) do
	if recipe then
		AddCookerRecipe("bamboo_cookpot", recipe)
	end
end

local function onhammered(inst, worker)
    if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
    end
	if inst.components.stewer and inst.components.stewer.product and inst.components.stewer.done then
		inst.components.lootdropper:AddChanceLoot(inst.components.stewer.product, 1)
	end --如果有食物 那么掉落
	inst.components.lootdropper:DropLoot()
    if inst.components.container ~= nil then
        inst.components.container:DropEverything()
    end
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("metal")
	inst:Remove()
end

local function onhit(inst, worker)
	if not inst:HasTag("burnt") then
        if inst.components.stewer:IsCooking() then
            inst.AnimState:PlayAnimation("hit_cooking")
            inst.AnimState:PushAnimation("cooking_loop", true)
        elseif inst.components.stewer:IsDone() then
            inst.AnimState:PlayAnimation("hit_full")
            inst.AnimState:PushAnimation("idle_full", false)
        else
            inst.AnimState:PlayAnimation("hit_empty")
            inst.AnimState:PushAnimation("idle_empty", false)
        end
	end
end

--anim and sound callbacks
local foooood = {
	"bab_dpr",
	"bab_ssgy",
	"bab_rb",
	"bab_sm",
	"bab_jlbg",
	"bab_xhb",
}
local function ShowProduct(inst)
    if not inst:HasTag("burnt") then
        local product = inst.components.stewer.product
        if IsModCookingProduct(inst.prefab, product) then
            inst.AnimState:OverrideSymbol("swap_cooked", product, product)
        else
            inst.AnimState:OverrideSymbol("swap_cooked", "cook_pot_food", product)
        end
			for k,v in pairs(foooood) do 
				if v == product then
					inst.SoundEmitter:PlaySound("bab_xdj/bab_xdj/bab_xdj")
					break
				end
			end			
    end
end

local function ShowProductload(inst)
    if not inst:HasTag("burnt") then
        local product = inst.components.stewer.product
        if IsModCookingProduct(inst.prefab, product) then
            inst.AnimState:OverrideSymbol("swap_cooked", product, product)
        else
            inst.AnimState:OverrideSymbol("swap_cooked", "cook_pot_food", product)
        end
    end
end

local function startcookfn(inst)
    if not inst:HasTag("burnt") then
        inst.AnimState:PlayAnimation("cooking_loop", true)
        inst.SoundEmitter:KillSound("snd")
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_rattle", "snd")
        inst.Light:Enable(true)
		inst:AddTag("cooking")
    end
end


local function onopen(inst)
    if not inst:HasTag("burnt") then
        inst.AnimState:PlayAnimation("cooking_pre_loop", true)
        inst.SoundEmitter:KillSound("snd")
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_open")
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot", "snd")
    end
end

local function onclose(inst)
    if not inst:HasTag("burnt") then 
        if not inst.components.stewer:IsCooking() then
            inst.AnimState:PlayAnimation("idle_empty")
            inst.SoundEmitter:KillSound("snd")
        end
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
    end
end

local function spoilfn(inst)
    if not inst:HasTag("burnt") then
        inst.components.stewer.product = inst.components.stewer.spoiledproduct
        inst.AnimState:OverrideSymbol("swap_cooked", "cook_pot_food", inst.components.stewer.product)
    end
end

local function donecookfn(inst)
    if not inst:HasTag("burnt") then
        inst.AnimState:PlayAnimation("cooking_pst")
        inst.AnimState:PushAnimation("idle_full", false)
        ShowProduct(inst)
        inst.SoundEmitter:KillSound("snd")
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish")
        inst.Light:Enable(false)
		inst:RemoveTag("cooking")
    end
end


local function continuecookfn(inst)
    if not inst:HasTag("burnt") then 
        inst.AnimState:PlayAnimation("cooking_loop", true)
        inst.Light:Enable(true)
        inst.SoundEmitter:KillSound("snd")
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_rattle", "snd")
		inst:AddTag("cooking")
    end
end

local function harvestfn(inst)
    if not inst:HasTag("burnt") then
        inst.AnimState:PlayAnimation("idle_empty")
    end
end

local function getstatus(inst)
    return (inst:HasTag("burnt") and "BURNT")
        or (inst.components.stewer:IsDone() and "DONE")
        or (not inst.components.stewer:IsCooking() and "EMPTY")
        or (inst.components.stewer:GetTimeToCook() > 15 and "COOKING_LONG")
        or "COOKING_SHORT"
end

local function onfar(inst)
	if inst.components.container then
		inst.components.container:Close()
	end
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("place")
    inst.AnimState:PushAnimation("idle_empty", false)
    inst.SoundEmitter:PlaySound("dontstarve/common/cook_pot_craft")
end

local function ondeploy(inst, pt, deployer)
	local pot = SpawnPrefab("bamboo_cookpot") 
	if pot then 
		pt = Vector3(pt.x, 0, pt.z)
		pot.Physics:SetCollides(false)
		pot.Physics:Teleport(pt.x, pt.y, pt.z) 
		pot.Physics:SetCollides(true)
		pot.SoundEmitter:PlaySound("dontstarve/common/place_structure_stone")
		pot.AnimState:PlayAnimation("place")
		pot.AnimState:PushAnimation("idle_empty", false)
		inst:Remove()
	end        
end

local function pickupfn(inst, guy)
	if guy.components and guy.components.inventory then
		local potitem = SpawnPrefab("bamboo_cookpot_item")
		guy.components.inventory:GiveItem(potitem)
		inst:Remove()
		return true
	end
end


local function item_deploytest(inst, pt)
	return true
end

local function item_droppedfn(inst)
	if inst.components.deployable and inst.components.deployable:CanDeploy(inst:GetPosition()) then
		inst.components.deployable:Deploy(inst:GetPosition(), inst)
	end
end

local function itemfn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)

	inst:AddTag("irreplaceable")
	inst:AddTag("eyeturret") --from eyeturret
    inst.AnimState:SetBank("cook_pot_warly")
    inst.AnimState:SetBuild("bamboo_cookpot")
	inst.AnimState:PlayAnimation("idle_drop")
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end	
	inst:AddComponent("inspectable")

	inst:AddComponent("inventoryitem")
	--inst.components.inventoryitem:SetOnDroppedFn(item_droppedfn)
	inst.components.inventoryitem.atlasname = "images/inventoryimages/bamboo_cookpot_item.xml"

	inst:AddComponent("deployable")
	inst.components.deployable.ondeploy = ondeploy
	inst.components.deployable.placer = "bamboo_cookpot_item_placer"
	inst.components.deployable.test = item_deploytest

	
	return inst
end

local function canpickup(inst)
	local stewer = inst.components.stewer
	local container = inst.components.container
	if not stewer or not container then
		return false
	end
	return container:IsEmpty() and not stewer.cooking and not stewer.product
end

local function onsave(inst, data)
    if inst:HasTag("burnt") or (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
        data.burnt = true
    end
end

local function onload(inst, data)
    if data ~= nil and data.burnt then
        inst.components.burnable.onburnt(inst)
        inst.Light:Enable(false)
    end
end
local function continuedonefn(inst)
    if not inst:HasTag("burnt") then 
        inst.AnimState:PlayAnimation("idle_full")
        --ShowProduct(inst)
		ShowProductload(inst)
    end
end
local function OnHaunt(inst, haunter)
    local ret = false
    if inst.components.stewer ~= nil and
        inst.components.stewer.product ~= "wetgoop" and
        math.random() <= TUNING.HAUNT_CHANCE_ALWAYS then
        if inst.components.stewer:IsCooking() then
            inst.components.stewer.product = "wetgoop"
            inst.components.hauntable.hauntvalue = TUNING.HAUNT_MEDIUM
            ret = true
        elseif inst.components.stewer:IsDone() then
            inst.components.stewer.product = "wetgoop"
            inst.components.hauntable.hauntvalue = TUNING.HAUNT_MEDIUM
            continuedonefn(inst)
            ret = true
        end
    end
    return ret
end

local function Update(inst)
    if inst.components.container:IsEmpty() then
		inst._isempty:set(true)
	else
		inst._isempty:set(false)
    end
end

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon( "bamboo_cookpot_item.tex" )
	
	local light = inst.entity:AddLight()
	inst.Light:Enable(false)
	inst.Light:SetRadius(.6)
	inst.Light:SetFalloff(1)
	inst.Light:SetIntensity(.5)
	inst.Light:SetColour(235/255,62/255,12/255)

	inst:AddTag("structure")
	MakeObstaclePhysics(inst, .5)
	MakeSnowCoveredPristine(inst)
	inst._isempty = net_bool(inst.GUID, "babcook._isempty")
	--inst._isempty:set(true)
	
    inst.AnimState:SetBank("cook_pot_warly")
    inst.AnimState:SetBuild("bamboo_cookpot")
	inst.AnimState:PlayAnimation("idle_empty")
	
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function () 
			if  inst.replica.container ~= nil then
				inst.replica.container:WidgetSetup("cookpot")
			end
		end)
        return inst
    end
	
	inst:AddComponent("stewer")
	inst.components.stewer.onstartcooking = startcookfn
	inst.components.stewer.oncontinuecooking = continuecookfn
	inst.components.stewer.oncontinuedone = continuedonefn
	inst.components.stewer.ondonecooking = donecookfn
	inst.components.stewer.onharvest = harvestfn
	inst.components.stewer.onspoil = spoilfn
	
	inst:AddComponent("container")
	inst.components.container:WidgetSetup("cookpot")
	inst.components.container.onopenfn = onopen
	inst.components.container.onclosefn = onclose

	inst:AddComponent("inspectable")
	inst.components.inspectable.getstatus = getstatus  
	
    inst:AddComponent("lootdropper")
	
	 MakeSnowCovered(inst)
	inst:ListenForEvent( "onbuilt", onbuilt)
	
    inst:AddComponent("hauntable")
    inst.components.hauntable:SetOnHauntFn(OnHaunt)
	
	inst:AddComponent("boopickupable")
	inst.components.boopickupable:SetOnPickupFn(pickupfn)
	inst.components.boopickupable.canpickupfn = canpickup

    inst:ListenForEvent("itemget", Update)
    inst:ListenForEvent("itemlose", Update)
	Update(inst)
    inst.OnSave = onsave 
    inst.OnLoad = onload
	return inst
end

return Prefab( "bamboo_cookpot", fn, assets, prefabs),
		MakePlacer( "bamboo_cookpot_item_placer", "cook_pot_warly", "bamboo_cookpot", "idle_empty" ),
		Prefab("bamboo_cookpot_item", itemfn, assets, prefabs)
