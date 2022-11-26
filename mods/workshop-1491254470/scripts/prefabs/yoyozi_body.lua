local assets =
{ 
    Asset("ANIM", "anim/yoyozi_body.zip"),
}

local function fn()

    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
	
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()  -- 
	
	MakeObstaclePhysics(inst,0.01)

	inst.entity:AddMiniMapEntity()
	
	
	inst.AnimState:SetBank("yoyozi_body")
    inst.AnimState:SetBuild("yoyozi_body")
    inst.AnimState:PlayAnimation("idle")
	
	--inst.Transform:SetScale(4,4,4)
	
	
	---------------------- 
	
	inst.entity:SetPristine()   -- 
	if not TheWorld.ismastersim then
        return inst
    end
	
	----------------------

    inst:AddComponent("inspectable")

	
	MakeHauntableLaunch(inst)  --
    return inst
end
STRINGS.NAMES.YOYOZI_BODY = "尸体"
STRINGS.RECIPE_DESC.YOYOZI_BODY = "她是谁？为什么在樱花树下自尽？....."

STRINGS.CHARACTERS.GENERIC.DESCRIBE.YOYOZI_BODY = "她是谁？为什么在樱花树下自尽？....."

return  Prefab("yoyozi_body", fn, assets, prefabs)