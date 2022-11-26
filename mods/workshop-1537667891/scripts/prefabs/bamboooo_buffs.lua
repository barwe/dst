---speed
local function OnSpeed(inst, target)
    if target.components.locomotor ~= nil and target.components.health ~= nil and
        not target.components.health:IsDead() and
        not target:HasTag("playerghost") then
        target.components.locomotor:SetExternalSpeedMultiplier(target, "bab_speedbuff", 1.3)
    else
        inst.components.debuff:Stop()
    end
end

local function OnSpeedStart(inst, target) 
    inst.entity:SetParent(target.entity)
    inst.Transform:SetPosition(0, 0, 0) 
    OnSpeed(inst, target)
    inst:ListenForEvent("death", function()
        inst.components.debuff:Stop()
    end, target)
end

local function OnSpeedExtended(inst, target)
    inst.components.timer:StopTimer("regenover")
    inst.components.timer:StartTimer("regenover", 300)
    OnSpeed(inst, target)
end

local function OnSpeedTimer(inst, data)
    if data.name == "regenover" then
        inst.components.debuff:Stop()
    end	
end
local function OnSpeedDeath(inst,target)
	if target.components.locomotor ~= nil then
		target.components.locomotor:RemoveExternalSpeedMultiplier(target, "rg_speedbuff")
	end
	inst:Remove()
end
--===================
-----========attack
local function OnAttack(inst, target)
    if target.components.combat ~= nil and target.components.health ~= nil and
        not target.components.health:IsDead() and
        not target:HasTag("playerghost") then
        target.components.combat.externaldamagemultipliers:SetModifier(inst, 1.3)
    else
        inst.components.debuff:Stop()
    end

end

local function OnAttackStart(inst, target)
    inst.entity:SetParent(target.entity)
    inst.Transform:SetPosition(0, 0, 0) 
    OnAttack(inst, target)
    inst:ListenForEvent("death", function()
        inst.components.debuff:Stop()
    end, target)
end

local function OnAttackExtended(inst, target)
    inst.components.timer:StopTimer("regenover")
    inst.components.timer:StartTimer("regenover", 300)
    OnAttack(inst, target)
end

local function OnAttackTimer(inst, data)
    if data.name == "regenover" then
        inst.components.debuff:Stop()
    end	
end
local function OnAttackDeath(inst,target)
		if target.components.combat ~= nil then
			target.components.combat.externaldamagemultipliers:RemoveModifier(inst)
		end
	inst:Remove()
end
---sanity
local function OnTick(inst, target)
    if target.components.health ~= nil and
        not target.components.health:IsDead() and target.components.sanity ~= nil and
        not target:HasTag("playerghost") then
        target.components.sanity:DoDelta(0.5,true)
    else
        inst.components.debuff:Stop()
    end
end

local function OnSanityStart(inst, target)
    inst.entity:SetParent(target.entity)
    inst.Transform:SetPosition(0, 0, 0)
    inst.task = inst:DoPeriodicTask(1, OnTick, nil, target)
    inst:ListenForEvent("death", function()
        inst.components.debuff:Stop()
    end, target)
end

local function OnSanityTimer(inst, data)
    if data.name == "regenover" then
        inst.components.debuff:Stop()
    end
end

local function OnSanityExtended(inst, target)
    inst.components.timer:StopTimer("regenover")
    inst.components.timer:StartTimer("regenover", 300)
    inst.task:Cancel()
    inst.task = inst:DoPeriodicTask(1, OnTick, nil, target)

end
local function OnSanityDeath(inst,target)
	inst:Remove()
end
-----
local function makebuffs(name,data)
	local function fn()
		local inst = CreateEntity()
		if not TheWorld.ismastersim then
			inst:DoTaskInTime(0, inst.Remove)
			return inst
		end
		inst.entity:AddTransform()
		inst.entity:Hide()
		inst.persists = false

		inst:AddTag("CLASSIFIED")

		inst:AddComponent("debuff")
		inst.components.debuff:SetAttachedFn(data.attacked)
		inst.components.debuff:SetDetachedFn(data.death)
		inst.components.debuff:SetExtendedFn(data.extended)
		inst.components.debuff.keepondespawn = true

		inst:AddComponent("timer")
		inst.components.timer:StartTimer("regenover", data.time)
		inst:ListenForEvent("timerdone", data.timedone)

		return inst
	end
	return Prefab(name, fn)
end

return 	
makebuffs("bab_speedbuff",{attacked = OnSpeedStart , extended =OnSpeedExtended ,death = OnSpeedDeath , timedone = OnSpeedTimer ,time = 300 }),
makebuffs("bab_sanitybuff",{attacked = OnSanityStart , extended =OnSanityExtended ,death = OnSanityDeath , timedone = OnSanityTimer ,time = 300 }),
makebuffs("bab_attackbuff",{attacked = OnAttackStart , extended =OnAttackExtended ,death = OnAttackDeath , timedone = OnAttackTimer ,time = 300 })
