
local MakePlayerCharacter = require "prefabs/player_common"


local assets = {

        Asset( "ANIM", "anim/player_basic.zip" ),
        Asset( "ANIM", "anim/player_idles_shiver.zip" ),
        Asset( "ANIM", "anim/player_actions.zip" ),
        Asset( "ANIM", "anim/player_actions_axe.zip" ),
        Asset( "ANIM", "anim/player_actions_pickaxe.zip" ),
        Asset( "ANIM", "anim/player_actions_shovel.zip" ),
        Asset( "ANIM", "anim/player_actions_blowdart.zip" ),
        Asset( "ANIM", "anim/player_actions_eat.zip" ),
        Asset( "ANIM", "anim/player_actions_item.zip" ),
        Asset( "ANIM", "anim/player_actions_uniqueitem.zip" ),
        Asset( "ANIM", "anim/player_actions_bugnet.zip" ),
        Asset( "ANIM", "anim/player_actions_fishing.zip" ),
        Asset( "ANIM", "anim/player_actions_boomerang.zip" ),
        Asset( "ANIM", "anim/player_bush_hat.zip" ),
        Asset( "ANIM", "anim/player_attacks.zip" ),
        Asset( "ANIM", "anim/player_idles.zip" ),
        Asset( "ANIM", "anim/player_rebirth.zip" ),
        Asset( "ANIM", "anim/player_jump.zip" ),
        Asset( "ANIM", "anim/player_amulet_resurrect.zip" ),
        Asset( "ANIM", "anim/player_teleport.zip" ),
        Asset( "ANIM", "anim/wilson_fx.zip" ),
        Asset( "ANIM", "anim/player_one_man_band.zip" ),
        Asset( "ANIM", "anim/shadow_hands.zip" ),
        Asset( "SOUND", "sound/sfx.fsb" ),
        Asset( "SOUND", "sound/wilson.fsb" ),
        Asset( "ANIM", "anim/beard.zip" ),

        Asset( "ANIM", "anim/yoyozi.zip" ),
        Asset( "ANIM", "anim/ghost_yoyozi_build.zip" ),
}
local prefabs = 
{
	"yoyozi_maozi",
	"redlantern_ghost",
	"shanzi_yoyozi",
}--

local start_inv = 
{
	"yoyozi_maozi",
	"redlantern_ghost",
	"shanzi_yoyozi",
}--

local function canattack(v,inst) ------------
	return v and v:IsValid()  and v ~= inst and 
	v.prefab ~= "chester" and v.prefab ~= "glommer" and --------------
	v.components and v.components.combat and v.components.health and not v.components.health:IsDead() 
end 

local function keepTwoDecimalPlaces(decimal)-----------------------
    decimal = math.floor((decimal * 100)+0.5)*0.01       
    return  decimal 
end

local function setcd(inst,cdname,time,skillname,cansay)-------------------------------
	if GetTime() - inst[cdname] < time then 
		if inst.components.talker and cansay then 
			local last = time - (GetTime() - inst[cdname])
			last = keepTwoDecimalPlaces(last)
			--inst.components.talker:Say(skillname..""..last.."")
		end
		--print("!")
		return false
	end 
	inst[cdname] = GetTime()
	--print("!")
	return true
end 

-- 
local function onbecamehuman(inst)
	-- 
	  inst.components.locomotor.walkspeed = 4
      inst.components.locomotor.runspeed = 6
end

-- 
local function onload(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman) --
    inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.3)
    inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.6)--
    if not inst:HasTag("playerghost") then
        onbecamehuman(inst)
    end
end

local function yoyozi_killfn(inst,x,y,z)
	print("yoyozi_killfn!")
	local mouse = Vector3(x,y,z)
	local target = nil 
	local ents = TheSim:FindEntities(mouse.x, mouse.y, mouse.z, 3, {"_combat"},TUNING.YOYOZI_NO_TAGS)
	for _,v in pairs(ents) do-----------------------------------------------------
		if canattack(v,inst) and v.components.health.currenthealth < 1000 and 
		v.components.health.currenthealth * 0.2 <= inst.components.sanity.current then 
			target = v
			break
		end 
	end 
	print(target)
	if not canattack(target,inst) 
	or target.components.health.currenthealth >= 1000 or target.components.health.currenthealth * 0.2 > inst.components.sanity.current
	then-------------------------------------------------------
		--inst.components.talker:Say("!")
		return 
	end 
------------------------------------------------------------------------------------------
	local cancast = setcd(inst,"yoyozi_killcd",TUNING.YOYOZI_KILLCD,true)
	if cancast ~= true then
		return 
	end 
	
	local a,b,c = target:GetPosition():Get()------------,b,
	
	target.hitfx = SpawnPrefab("gooball_hit_fx")----------------
	target.hitfx.AnimState:SetMultColour(0,0,0,1)-------------------
	target.hitfx.entity:SetParent(target.entity)  ---------------------
	if target:HasTag("largecreature") then --------------------
		target.hitfx.Transform:SetScale(3,3,3)------------------------------
		target.hitfx.Transform:SetPosition(0,-5,0)------------------------- 
	else 
		target.hitfx.Transform:SetPosition(0,-2,0)-------------------------
	end 
	inst.SoundEmitter:PlaySound("dontstarve/charlie/warn")-----
	
	
	inst.AnimState:PlayAnimation("atk_pre")
    inst.AnimState:PushAnimation("atk", false)
	
	inst.components.sanity:DoDelta(-target.components.health.currenthealth * 0.2)------
	target.components.health:Kill()---------
------------------------------------------------------------------------------	

	local ghost = SpawnPrefab("butterfly")
	ghost.Transform:SetPosition(a,b,c)-----------

------------------------------------------------------------------------------		
	if target:HasTag("character","manrabbit") then --------------------
		local ghost = SpawnPrefab("ghost_ai")-------
		ghost.Transform:SetPosition(a,b,c)-----------
			local ghost = SpawnPrefab("butterfly")
	        ghost.Transform:SetPosition(a,b,c)-----------
			local ghost = SpawnPrefab("butterfly")
	        ghost.Transform:SetPosition(a,b,c)-----------
		if ghost.components.follower then 
			ghost.components.follower:SetLeader(inst)-----
		end
	end 
end 

local function yoyozi_hauntfn(inst,x,y,z)
	print("yoyozi_hauntfn!")
	local mouse = Vector3(x,y,z)
	local target = nil 
	local ents = TheSim:FindEntities(mouse.x, mouse.y, mouse.z, 3)
	for _,v in pairs(ents) do-----------------------------------------------------
		if v.components.hauntable then 
			target = v
			break
		end 
	end 
	print(target)
	if not target or not target.components.hauntable then -----------
		--inst.components.talker:Say("!")
		return
	end 
------------------------------------------------------------------------------------------
	local cancast = setcd(inst,"yoyozi_hauntcd",TUNING.YOYOZI_HAUNTCD,true)
	if cancast ~= true then
		return 
	end 
	target.components.hauntable:DoHaunt(inst)-------------
end 

local function yoyozi_ghostfn(inst,x,y,z)
	print("yoyozi_ghostfn!")
------------------------------------------------------------------------------------------
	local cancast = setcd(inst,"yoyozi_ghostcd",TUNING.YOYOZI_GHOSTCD,true)
	if cancast ~= true then
		return 
	end 
	local ghosts = TheSim:FindEntities(x,y,z,5,{"ghost_ai"})-------------------------
	inst.components.talker:Say("啊啦~啊啦~跟上别掉队哟~!")
	for _,v in pairs(ghosts) do
		if canattack(v,inst) and v.components.follower then 
			v.components.follower:SetLeader(inst)-------------------
		end
	end 
end 
---------------------------------------------------------------------------------------------------------
local BEAVERVISION_COLOURCUBES =--------------------
{
    day = "images/colour_cubes/ruins_light_cc.tex",
    dusk = "images/colour_cubes/ruins_dim_cc.tex",
    night = "images/colour_cubes/purple_moon_cc.tex",
    full_moon = "images/colour_cubes/purple_moon_cc.tex",
}
local function SetBeaverVision(inst, enable)--------------
	if TheWorld.state.isnight or TheWorld:HasTag("cave") then
		inst.components.playervision:ForceNightVision(true)
		inst.components.playervision:SetCustomCCTable(BEAVERVISION_COLOURCUBES)
	else
		inst.components.playervision:ForceNightVision(false)
		inst.components.playervision:SetCustomCCTable(nil)
	end
end


local function nightvision(inst)----------

	if TheWorld.state.phase == "day" then
		
		inst.Light:Enable(false)
		
	elseif TheWorld.state.phase == "dusk" then
	
		inst.Light:Enable(false)
		
	elseif TheWorld.state.phase == "night" then
	
		inst.entity:AddLight()
		inst.Light:SetRadius(1)
		inst.Light:SetFalloff(.15)
		inst.Light:SetIntensity(.1)
		inst.Light:SetColour(120/255,120/255,0/255)
		inst.Light:Enable(true)
		
	elseif tempCaveVar == true and TheWorld.state.phase == "caveday" then
		
		inst.Light:Enable(false)
		
	elseif tempCaveVar == true and TheWorld.state.phase == "cavedusk" then

		inst.Light:Enable(false)
		
	elseif tempCaveVar == true and TheWorld.state.phase == "cavenight" then
	
		inst.entity:AddLight()
		inst.Light:SetRadius(1)
		inst.Light:SetFalloff(.15)
		inst.Light:SetIntensity(.15)
		inst.Light:SetColour(120/255,120/255,0/255)
		inst.Light:Enable(true)
		
	end
	
end




local function onchangevision(inst)
	print("onchangevision")
	if inst.night_flag == 1 then 
		SetBeaverVision(inst, true)
	else 
		SetBeaverVision(inst, false)
	end 
end 

---------------------------------------------------------------------------------------------------------

local function onattack(inst,data)-------------------
	local x,y,z = inst:GetPosition():Get()
	local pets = TheSim:FindEntities(x,y,z,32,{"ghost_ai"})
	for k,v in pairs(pets) do 
		if v.components.follower and v.components.follower:GetLeader() == inst and v.brain then 
			v.brain.followtarget = data.target
		end
	end
end 

-- 
local common_postinit = function(inst) 
	--
	inst.MiniMapEntity:SetIcon( "yoyozi.tex" )
	
	inst:AddTag("yoyozi")
	
	
	inst.yoyozi_killcd = 0
	inst.yoyozi_hauntcd = 0
	inst.yoyozi_ghostcd = 0
	inst.yoyozi_nightcd = 0
	
	inst._kill = true
	inst._haunt = true
	inst._ghost = true
	inst._night = true-----------------------------
	
	inst.night_flag = 1
	
	if TheWorld.ismastersim then
		AddModRPCHandler("yoyozi","yoyozi_kill",yoyozi_killfn)
		AddModRPCHandler("yoyozi","yoyozi_haunt",yoyozi_hauntfn)
		AddModRPCHandler("yoyozi","yoyozi_ghost",yoyozi_ghostfn)
		--AddModRPCHandler("yoyozi","yoyozi_night",yoyozi_nightfn_ser)
	else
		AddModRPCHandler("yoyozi","yoyozi_kill",function() end)
		AddModRPCHandler("yoyozi","yoyozi_haunt",function() end)
		AddModRPCHandler("yoyozi","yoyozi_ghost",function() end)
		--AddModRPCHandler("yoyozi","yoyozi_night",function() end)
	end
	
	inst:AddComponent("yoyozi_keyhandler")
	
	inst.components.yoyozi_keyhandler:AddActionListener("yoyozi",TUNING.YOYOZI_KILL_KEY,"yoyozi_kill")
	inst.components.yoyozi_keyhandler:AddActionListener("yoyozi",TUNING.YOYOZI_HAUNT_KEY,"yoyozi_haunt")
	inst.components.yoyozi_keyhandler:AddActionListener("yoyozi",TUNING.YOYOZI_GHOST_KEY,"yoyozi_ghost")
	--inst.components.yoyozi_keyhandler:AddActionListener("yoyozi",TUNING.YOYOZI_NIGHT_KEY,"yoyozi_night")
	--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 
	
	--inst:ListenForEvent("yoyozi_vision", onchangevision)
--[[	inst:WatchWorldState( "isday", function() SetBeaverVision(inst) end)
  	inst:WatchWorldState( "isdusk", function() SetBeaverVision(inst) end)
  	inst:WatchWorldState( "isnight", function() SetBeaverVision(inst)  end)
	inst:WatchWorldState( "iscaveday", function() SetBeaverVision(inst) end)
  	inst:WatchWorldState( "iscavedusk", function() SetBeaverVision(inst) end)
  	inst:WatchWorldState( "iscavenight", function() SetBeaverVision(inst)  end)
	
	SetBeaverVision(inst) --This is here to make sure the NightVision is enabled when a player rejoins.--]]
	--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 
	

end

-- -- 
local master_postinit = function(inst)
	inst.soundsname = "willow"   --
	
	-- 基础3个数值	
	inst.components.health:SetMaxHealth(120)
	inst.components.hunger:SetMax(800)
	inst.components.sanity:SetMax(200)
	--------------------------------------------------------------------
	 inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.2)
    inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.3)--
	
	--inst.components.locomotor.runspeed = 15
	
    inst.components.combat.damagemultiplier = 1.0-- 
	inst.components.hunger.hungerrate = 3 * TUNING.WILSON_HUNGER_RATE--------
	
	
	inst:WatchWorldState( "isday", function(inst) nightvision(inst) end )
	inst:WatchWorldState( "isdusk", function(inst) nightvision(inst) end )
	inst:WatchWorldState( "isnight", function(inst) nightvision(inst) end )
	inst:WatchWorldState( "iscaveday", function(inst) nightvision(inst) end )
	inst:WatchWorldState( "iscavedusk", function(inst) nightvision(inst) end )
	inst:WatchWorldState( "iscavenight", function(inst) nightvision(inst) end )
	nightvision(inst)

	
    --inst:AddComponent("periodicspawner")
    --inst.components.periodicspawner:SetPrefab("butterfly")--gravestone  butterfly
    --inst.components.periodicspawner:SetRandomTimes(50,60)
    --inst.components.periodicspawner:SetDensityInRange(-1,10)
    --inst.components.periodicspawner:SetMinimumSpacing()
    --inst.components.periodicspawner:Start()
	
	inst:ListenForEvent("onattackother", onattack)--------------
	--inst:ListenForEvent("yoyozi_vision", onchangevision)
	--????        ////()
  
    inst.components.sanity.neg_aura_mult = 0
  
end


return MakePlayerCharacter("yoyozi", prefabs, assets, common_postinit, master_postinit, start_inv)
