require "behaviours/follow"
require "behaviours/wander"
require "behaviours/faceentity"
require "behaviours/panic"


local MIN_FOLLOW_DIST = 1
local MAX_FOLLOW_DIST = 10
local TARGET_FOLLOW_DIST = 13

local MAX_WANDER_DIST = 3





local GhostAiBrain = Class(Brain, function(self, inst)
    Brain._ctor(self, inst)
end)

local function IsAlive(target)
    return target.entity:IsVisible() and
        target.components.health ~= nil and
        not target.components.health:IsDead()
end

local function GetFollowTarget(ghost)---------------------
    if ghost.brain.followtarget ~= nil
        and (not ghost.brain.followtarget:IsValid() or------------------ IsVaild()  
            not ghost.brain.followtarget.entity:IsVisible() or--------------IsVisible()  
            ghost.brain.followtarget:IsInLimbo() or----------IsInLimbo()
            ghost.brain.followtarget.components.health == nil or-----------------
            ghost.brain.followtarget.components.health:IsDead() or-------------
            ghost:GetDistanceSqToInst(ghost.brain.followtarget) > 15 * 15) or ------------*15
			(ghost.components.follower and ghost.components.follower.leader == ghost.brain.followtarget )then-----------
        ghost.brain.followtarget = nil-----------
    end
    
    if ghost.brain.followtarget == nil then-------------
		local x,y,z = ghost:GetPosition():Get()------------
		local targets = TheSim:FindEntities(x,y,z,10, IsAlive, nil, { "INLIMBO" })-----------
		for k,v in pairs(targets) do 
			if ghost.components.follower and ghost.components.follower.leader ~= v then 
				ghost.brain.followtarget = v------------
				break
			end 
		end
    end

    return ghost.brain.followtarget-------------
end

local function GetFaceTargetFn(inst)
	return inst.components.follower.leader
end

local function KeepFaceTargetFn(inst, target)
    return inst.components.follower.leader == target
end

local function checkattack(inst)
	return inst.components.follower.leader and inst.components.follower.leader ~= inst.brain.followtarget
end 

local function checkred(inst)
	local leader = inst.components.follower.leader
	return leader ~= nil and (leader.prefab == "redlantern_ghost" or leader:HasTag("player"))
end 

local function checktree(inst)
	local leader = inst.components.follower.leader
	return leader ~= nil and leader.prefab == "ghost_tree"
end 

local function gethome(inst)
	local leader = inst.components.follower.leader
	return leader and leader.prefab == "ghost_tree" and leader:GetPosition()
end

local FOLLOW_DIST = math.random(4,5)

function GhostAiBrain:OnStart()
    local root = PriorityNode(
    {	
	
		ChaseAndAttack(self.inst, 15),---------------!
		IfNode(function() return checkred(self.inst)end , "ghost light",---------------- 
			 Follow(self.inst, function() return self.inst.components.follower.leader end, MIN_FOLLOW_DIST, TARGET_FOLLOW_DIST, MAX_FOLLOW_DIST)
			 ),--
		--FaceEntity(self.inst, GetFaceTargetFn, KeepFaceTargetFn),
		IfNode(function() return checktree(self.inst)end , "ghost tree", -----------------
			Wander(self.inst,gethome(self.inst), 7) ),
		
    },0.5)
        
    self.bt = BT(self.inst, root)
end

return GhostAiBrain