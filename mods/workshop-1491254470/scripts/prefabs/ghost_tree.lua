local assets =
{
	Asset("ANIM", "anim/ghost_tree.zip"),
	Asset("ANIM", "anim/ghost_tree_snow.zip"),
	Asset( "IMAGE", "minimap/ghost_tree.tex" ),
    Asset( "ATLAS", "minimap/ghost_tree.xml" ),

}

local REZ_CD = 360--360
local KILL_CD = 400--600


local function GetVerb()
    return STRINGS.ACTIONS.ACTIVATE.GENERIC
end

local function rebingghost(inst)-----------------------
	local x,y,z = inst:GetPosition():Get()
	local ghosts = TheSim:FindEntities(x,y,z,32,{"ghost_ai"})
	for k,v in pairs(ghosts) do 
		if v and v.components.follower and 
		(v.components.follower:GetLeader() == nil or v.components.follower:GetLeader().prefab == "redlantern_ghost")then 
		-----------
			v.components.follower:SetLeader(inst)
			inst.components.leader:AddFollower(v)
		end
	end 
end 

local function onhaunt(inst,doer)--------
	if doer:HasTag("playerghost") and inst:HasTag("resurrector") then---------
		for k,v in pairs(inst.rez_list) do----------------
			if v.id == doer.userid and v.cd > 0 then ------------
				if doer.components.talker then 
					doer.components.talker:Say("我还有"..v.cd.."秒以后才能复活")-------
				end
				return
			end
		end
		doer:PushEvent("respawnfromghost", { source = inst })-------------
		table.insert (inst.rez_list,{id = doer.userid,cd = REZ_CD})-------------
	end
end 

local function KillOthers(inst)----------------
	local x,y,z = inst:GetPosition():Get()
	local people = TheSim:FindEntities(x,y,z,15,{"player"})
	local flag = true
	for _,v in pairs(people) do 
		if not v:HasTag("playerghost") and v.prefab ~= "yoyozi" then 
			for _,m in pairs(inst.kill_list) do 
				if v.userid and v.userid == m.id and m.cd >= 0 then
					flag =false
				end
			end
			if flag then 
				local pos = v:GetPosition()
				local fx = SpawnPrefab("statue_transition_2")
				fx.Transform:SetPosition(pos.x,pos.y,pos.z)
				v.components.health:Kill()
				table.insert (inst.kill_list,{id = v.userid,cd = KILL_CD})-------------
				
				local gravestones = SpawnPrefab("gravestone")
			    gravestones.Transform:SetPosition(pos.x,0,pos.z)
			end
		end
	end
end 

local function checkcdfn(inst)
	for k,v in pairs(inst.rez_list) do
		if v.cd > 0 then 
			v.cd = v.cd - 1
			if v.cd <= 0 then 
				table.remove(inst.rez_list,k)
			end
		end
		print(k,v.id,v.cd)
	end
	for k,v in pairs(inst.kill_list) do
		if v.cd > 0 then 
			v.cd = v.cd - 1
			if v.cd <= 0 then 
				table.remove(inst.kill_list,k)
			end
		end
		print(k,v.id,v.cd)
	end
end 

local function CanFlower(inst)
	local x,y,z = inst:GetPosition():Get()
	local ghosts = TheSim:FindEntities(x,y,z,32,{"ghost_ai"})
	local follower = 0
	for k,v in pairs(ghosts)do
		follower = follower + 1
	end
	return (inst.ghostnum + follower) >= 10 
end 

local function ChangeTree(inst)---------------------
	local season = TheWorld.state.season
	local anim = "idle"
	if TheWorld.state.issnowcovered and season == "winter" then 
		season = "snow"
	end
	
	if season == "snow" then 
		inst.AnimState:SetBank("ghost_tree_snow")
		inst.AnimState:SetBuild("ghost_tree_snow")
		if CanFlower(inst) then 
			anim = "idle_snowflower"
		else
			anim = "idle_snow"
		end
	else 
		inst.AnimState:SetBank("ghost_tree")
		inst.AnimState:SetBuild("ghost_tree")
		if CanFlower(inst) then 
			anim = "idle_flower"
		else
			anim = "idle"
		end
	end
	inst.AnimState:PlayAnimation(anim, true)
end 

local function OnChange(inst)-----------
	local day = TheWorld.state.phase
	local anim = "idle"
	
	if day == "day" then 
		inst.lastchase = "night"
	elseif day == "dusk" then 
		inst.lastchase = "day"
	elseif day == "night"  then 
		inst.lastchase = "dusk"
	end 
	
	if day == "dusk" or TheWorld:HasTag("cave") then
		day = "night"
	end
	
	ChangeTree(inst)

	if day == "night" then ------------
		if inst.killghostfn ~= nil then 
			inst.killghostfn:Cancel()
			inst.killghostfn = nil 
		end 
		for i=1,inst.ghostnum do 
			local ghost = SpawnPrefab("ghost_ai")
			ghost.Transform:SetPosition(inst:GetPosition():Get())
			rebingghost(inst)
		end 
		inst.ghostnum = 0 ------------
		if inst.lastchase == "day" or TheWorld:HasTag("cave") then 
			inst.SoundEmitter:KillSound("ghost_night")
			inst.SoundEmitter:KillSound("ghost_day")
			inst.SoundEmitter:PlaySound("ghost_tree/night/night"..math.random(1,4),"ghost_night")
		end 
	else 
		if inst.killghostfn == nil then 
			inst.killghostfn = inst:DoPeriodicTask(1,function()-------
				local x,y,z = inst:GetPosition():Get()
				local ghosts = TheSim:FindEntities(x,y,z,60,{"ghost_ai"})
				for k,v in pairs(ghosts) do
					if v.components.follower and v.components.follower:GetLeader() == inst then 
						v.components.locomotor:GoToPoint(inst:GetPosition())
						if distsq(v:GetPosition(),inst:GetPosition()) <= 3 and 
						v.components.health and not v.components.health :IsDead() and v.sg.currentstate.name ~= "dissipate" then 
							v.sg:GoToState("dissipate")
							inst.ghostnum = inst.ghostnum + 1------------
						end
					end
				end 
			end)
		end 
		inst.SoundEmitter:KillSound("ghost_night")
		inst.SoundEmitter:KillSound("ghost_day")
		inst.SoundEmitter:PlaySound("ghost_tree/day/day"..math.random(1,4),"ghost_day")
	end
end

local function onsave(inst,data)----------/
	data.rez_list = inst.rez_list or nil 
	data.kill_list = inst.kill_list or nil
	data.ghostnum = inst.ghostnum or nil
	data.lastchase = inst.lastchase or nil 

end 

local function onload(inst,data)-------
	if data ~= nil then 
		if data.rez_list ~= nil then 
			inst.rez_list = data.rez_list
		end
		if data.kill_list ~= nil then 
			inst.kill_list = data.kill_list
		end
		if data.ghostnum ~= nil then
			inst.ghostnum = data.ghostnum
		end 
		if data.lastchase ~= nil then
			inst.lastchase = data.lastchase
		end 
	end
	OnChange(inst)
end 

local function SpawnFlowers(inst)-----------
	local x,y,z = inst:GetPosition():Get()
	local space = 2
	local max_nums = 20
	local max_tries = 20
	local prefab = "flower"
	
	local ents = TheSim:FindEntities(x,y,z,10,{"flower"})
	for k,_ in pairs(ents) do
		if k >= max_nums then 
			return
		end
	end
	
	for i = 1,max_tries do 
		local rad = math.random(3,10)
		local arc = math.random(0,360)
		local a,b,c = x + rad * math.cos(arc),0,z + rad * math.sin(arc)
		if TheWorld.Map:IsAboveGroundAtPoint(a,b,c) then 
			local flower = SpawnPrefab(prefab)
			flower.Transform:SetPosition(a,b,c)
			break
		end
	end 
end 


local function SpawnFireflies(inst)-----------
	local x,y,z = inst:GetPosition():Get()
	local space = 2
	local max_nums = 5
	local max_tries = 10
	local prefab = "fireflies"
	
	local ents = TheSim:FindEntities(x,y,z,10,{"fireflies"})
	for k,_ in pairs(ents) do
		if k >= max_nums then 
			return
		end
	end
	
	for i = 1,max_tries do 
		local rad = math.random(3,10)
		local arc = math.random(0,360)
		local a,b,c = x + rad * math.cos(arc),0,z + rad * math.sin(arc)
		if TheWorld.Map:IsAboveGroundAtPoint(a,b,c) then 
			local fireflies = SpawnPrefab(prefab)
			fireflies.Transform:SetPosition(a,b,c)
			break
		end
	end 
end 





local function CalcSanityAura(inst, observer)
    return TUNING.SANITYAURA_HUGE
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
	
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    -- MakeObstaclePhysics(inst, 1)

    --inst.MiniMapEntity:SetIcon("portal_dst.png")
	MakeObstaclePhysics(inst, .75)
    inst.MiniMapEntity:SetIcon("ghost_tree.tex")

    inst:AddTag("tree")
	
	inst.Transform:SetScale(4,4,4)
    inst.AnimState:SetBank("ghost_tree")
    inst.AnimState:SetBuild("ghost_tree")
    inst.AnimState:PlayAnimation("idle", true)
	
	
	


    inst:AddTag("antlion_sinkhole_blocker")

    inst:SetDeployExtraSpacing(2)

    inst.GetActivateVerb = GetVerb
	
	inst.ghostnum = 0
	inst.rez_list = {}
	inst.kill_list = {}
	inst.lastchase = "day"
    inst:AddTag("resurrector")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end


		
	 --inst.statedata = statedata[1]
     --inst.seedprefab = treetype.seedprefab
     --inst.canshelter = treetype.shelter
		
	--inst.canshelter and inst.statedata.shelter then
        inst:AddTag("shelter")
		
    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription("为什么有种想要自杀的冲动.....")


    inst:AddComponent("hauntable")
    inst.components.hauntable:SetOnHauntFn(onhaunt)
	
	inst:AddComponent("leader")
	
    inst:AddComponent("sanityaura")
    inst.components.sanityaura.aurafn = CalcSanityAura
	
	
	rebingghost(inst)
	inst:DoPeriodicTask(3,function()rebingghost(inst)end )-----
	inst:DoPeriodicTask(1,function()checkcdfn(inst)KillOthers(inst)end )----/
	inst:DoPeriodicTask(35,function()SpawnFlowers(inst)end )-------
	inst:DoPeriodicTask(1800,function()SpawnFireflies(inst)end )-------
	
	inst:WatchWorldState("startday", OnChange)
	inst:WatchWorldState("startdusk", OnChange)
	inst:WatchWorldState("startnight", OnChange)
	inst:WatchWorldState( "iscaveday",OnChange )
  	inst:WatchWorldState( "iscavedusk",OnChange)
  	inst:WatchWorldState( "iscavenight",OnChange)
	OnChange(inst)--------------------------------------
	
	inst:ListenForEvent("onbuilt", function(inst,data)
		local builder = data.builder
		local pos = builder:GetPosition()
		if builder and builder.components.health and not builder.components.health:IsDead() then
			builder.components.health:Kill()
			local body = SpawnPrefab("yoyozi_body")
			body.Transform:SetPosition(pos.x,0,pos.z)
		end 
	end)----------------
	
	inst.OnSave = onsave
	inst.OnLoad = onload

    return inst
end
STRINGS.NAMES.GHOST_TREE = "西行妖"
return Prefab("ghost_tree", fn, assets),
	MakePlacer("common/ghost_tree_placer", "ghost_tree", "ghost_tree", "build") 
