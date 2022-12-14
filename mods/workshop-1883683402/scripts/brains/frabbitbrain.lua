require "behaviours/wander"
require "behaviours/follow"
require "behaviours/faceentity"
require "behaviours/chaseandattack"
require "behaviours/runaway"
require "behaviours/doaction"
--require "behaviours/choptree"
require "behaviours/findlight"
require "behaviours/panic"
require "behaviours/chattynode"
require "behaviours/leash"
require "behaviours/wanderanddostuff"
require "behaviours/dynamicchat"

local MIN_FOLLOW_DIST = 2
local TARGET_FOLLOW_DIST = 5
local MAX_FOLLOW_DIST = 9
local MAX_WANDER_DIST = 20

local LEASH_RETURN_DIST = 10
local LEASH_MAX_DIST = 20

local START_FACE_DIST = 6
local KEEP_FACE_DIST = 8
local START_RUN_DIST = 3
local STOP_RUN_DIST = 20
local MAX_CHASE_TIME = 10
local MAX_CHASE_DIST = 20
local SEE_LIGHT_DIST = 20
local TRADE_DIST = 20
local SEE_TREE_DIST = 15
local SEE_TARGET_DIST = 25
local SEE_FOOD_DIST = 10

local SEE_BURNING_HOME_DIST_SQ = 20*20

local KEEP_CHOPPING_DIST = 10

local RUN_AWAY_DIST = 5
local STOP_RUN_AWAY_DIST = 8
local SEE_PLAYER_DIST = 6

local function GetTraderFn(inst)
	return FindEntity(inst, TRADE_DIST, function(target) return inst.components.trader:IsTryingToTradeWithMe(target) end, {"player"})
end

local function KeepTraderFn(inst, target)
	return inst.components.trader:IsTryingToTradeWithMe(target)
end

local function FindStuffAction(inst)
	local target = nil

	if inst.sg:HasStateTag("busy") then
		return
	end

	local targetfn = inst:GetStuffTargetFn()
	if targetfn then
		target = targetfn(inst)
		inst.stufftarget = target
	end

	if target ~= nil then
		local actionfn = inst:GetStuffActionFn()
		if actionfn ~= nil then
			return actionfn(inst, target)
		end
	else
		inst.stufftarget = nil
	end
end

local function FindFoodAction(inst)
	local target = nil

	if inst.sg:HasStateTag("busy") then
		return
	end

	if inst.components.inventory and inst.components.eater then
		target = inst.components.inventory:FindItem(
			function(item)
				return inst.components.eater:CanEat(item) and
					item.prefab ~= "carrot_seeds"
			end
		)
	end

	local time_since_eat = inst.components.eater:TimeSinceLastEating()
	local noveggie = time_since_eat and time_since_eat < TUNING.PIG_MIN_POOP_PERIOD*4

	if not target and (not time_since_eat or time_since_eat > TUNING.PIG_MIN_POOP_PERIOD*2) then
		target = FindEntity(inst, SEE_FOOD_DIST, function(item)
				if item:GetTimeAlive() < 8 then return false end
				if item.prefab == "mandrake" then return false end
				if noveggie and item.components.edible and item.components.edible.foodtype ~= FOODTYPE.MEAT then
					return false
				end
				if not item:IsOnValidGround() then
					return false
				end
				return inst.components.eater:CanEat(item)
			end)
	end
	if target then
		return BufferedAction(inst, target, ACTIONS.EAT)
	end
end

local function HasValidHome(inst)
	local home = inst.components.homeseeker ~= nil and inst.components.homeseeker.home or nil
	return home ~= nil
		and home:IsValid()
		and not (home.components.burnable ~= nil and home.components.burnable:IsBurning())
		and not home:HasTag("burnt")
end

local function GoHomeAction(inst)
	if HasValidHome(inst) and
		not inst.components.combat.target then
			return BufferedAction(inst, inst.components.homeseeker.home, ACTIONS.GOHOME)
	end
end

local function IsHomeOnFire(inst)
	return inst.components.homeseeker
		and inst.components.homeseeker.home
		and inst.components.homeseeker.home.components.burnable
		and inst.components.homeseeker.home.components.burnable:IsBurning()
		and inst:GetDistanceSqToInst(inst.components.homeseeker.home) < SEE_BURNING_HOME_DIST_SQ
end

local function GetHomePos(inst)
	local location = inst.components.knownlocations:GetLocation("home")
	if location ~= nil then
		return location
	end
end

local function GetNoLeaderHomePos(inst)
	return GetHomePos(inst)
end

local FrabbitBrain = Class(Brain, function(self, inst)
	Brain._ctor(self, inst)
end)

function FrabbitBrain:OnStart()
	--print(self.inst, "PigBrain:OnStart")

	local root =
		PriorityNode(
		{
			WhileNode( function() return self.inst.components.hauntable and self.inst.components.hauntable.panic end, "PanicHaunted", Panic(self.inst)),
			WhileNode(function() return self.inst.components.health.takingfiredamage end, "OnFire",
				Panic(self.inst)),
			WhileNode(function() return self.inst.components.health:GetPercent() < TUNING.BUNNYMAN_PANIC_THRESH end, "LowHealth",
				RunAway(self.inst, "scarytoprey", SEE_PLAYER_DIST, STOP_RUN_DIST)),
			ChaseAndAttack(self.inst, MAX_CHASE_TIME, MAX_CHASE_DIST),
			-- WhileNode(function() return IsHomeOnFire(self.inst) end, "OnFire",
			-- 	Panic(self.inst)),
			FaceEntity(self.inst, GetTraderFn, KeepTraderFn),
			DoAction(self.inst, FindFoodAction),
			-- Follow(self.inst, GetLeader, MIN_FOLLOW_DIST, TARGET_FOLLOW_DIST, MAX_FOLLOW_DIST),
			-- WhileNode(function() return not self.inst.beardlord and TheWorld.state.iscaveday end, "IsDay",
			-- 			DoAction(self.inst, GoHomeAction, "go home", true ), 1),
			Leash(self.inst, GetNoLeaderHomePos, LEASH_MAX_DIST, LEASH_RETURN_DIST),
			Wander(self.inst, GetNoLeaderHomePos, MAX_WANDER_DIST)
		}, .5)

	self.bt = BT(self.inst, root)
end

return FrabbitBrain
