PrefabFiles = {
	"bamboooo", 
	"bamboooo_none", 
	"bamboobed",
	"bamboo_cookpot",
	"bamboooo_food",
	"bamboooo_buffs",
	"inv_bamboo",
	"bambooootree",
	"dug_bambooootree",
	"hacking_bamboo_fx",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/bamboooo.tex" ), 
    Asset( "ATLAS", "images/saveslot_portraits/bamboooo.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/bamboooo.tex" ), 
    Asset( "ATLAS", "images/selectscreen_portraits/bamboooo.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/bamboooo_silho.tex" ), 
    Asset( "ATLAS", "images/selectscreen_portraits/bamboooo_silho.xml" ),

    Asset( "IMAGE", "bigportraits/bamboooo.tex" ),
    Asset( "ATLAS", "bigportraits/bamboooo.xml" ),
	
	Asset( "IMAGE", "images/map_icons/bamboooo.tex" ),
	Asset( "ATLAS", "images/map_icons/bamboooo.xml" ),
	
	Asset( "IMAGE", "images/map_icons/bamboo_cookpot_item.tex" ),
	Asset( "ATLAS", "images/map_icons/bamboo_cookpot_item.xml" ),
	
	Asset( "IMAGE", "images/map_icons/bambooootree.tex" ),
	Asset( "ATLAS", "images/map_icons/bambooootree.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_bamboooo.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_bamboooo.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_bamboooo.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_bamboooo.xml" ),
	
	Asset( "IMAGE", "images/avatars/self_inspect_bamboooo.tex" ), 
    Asset( "ATLAS", "images/avatars/self_inspect_bamboooo.xml" ),
	
	Asset( "IMAGE", "images/names_bamboooo.tex" ), 
    Asset( "ATLAS", "images/names_bamboooo.xml" ),
	
    Asset( "IMAGE", "bigportraits/bamboooo_none.tex" ), 
    Asset( "ATLAS", "bigportraits/bamboooo_none.xml" ),
	
	Asset( "SOUND" , "sound/bab_xdj.fsb" ),
	Asset( "SOUNDPACKAGE" , "sound/bab_xdj.fev" ),
}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local TUNING = GLOBAL.TUNING
local ActionHandler = GLOBAL.ActionHandler
local ACTIONS = GLOBAL.ACTIONS
local TimeEvent = GLOBAL.TimeEvent
local FRAMES = GLOBAL.FRAMES
local EventHandler = GLOBAL.EventHandler

if GetModConfigData("Language") == true then
STRINGS.CHARACTER_TITLES.bamboooo = "BAMBOO"
STRINGS.CHARACTER_NAMES.bamboooo = "BAMBOO"
STRINGS.CHARACTER_DESCRIPTIONS.bamboooo = "*擅长中华料理\n*喜欢睡觉\n*笨重且容易饿"
STRINGS.CHARACTER_QUOTES.bamboooo = "*Woah!"
STRINGS.NAMES.BAMBOOOO = "BAMBOO"
STRINGS.CHARACTERS.BAMBOOOO = require "speech_bamboooo"

STRINGS.NAMES.BAMBOOBED = "竹席"
STRINGS.RECIPE_DESC.BAMBOOBED = "凉爽又实用的竹席！"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BAMBOOBED = "我想躺在竹子上好好睡一觉"

STRINGS.NAMES.BAMBOO_COOKPOT_ITEM = "竹制小蒸笼" 
STRINGS.RECIPE_DESC.BAMBOO_COOKPOT_ITEM = "用蒸笼来做美食吧！"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BAMBOO_COOKPOT_ITEM = "用它来做中华料理一定很美味"
STRINGS.NAMES.BAMBOO_COOKPOT = "竹制小蒸笼" 
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BAMBOO_COOKPOT = "看起来能做些特别的中华料理"

STRINGS.NAMES.BAB_DPR = "东坡肉"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BAB_DPR = "焖煮收汁，肥而不腻！"
STRINGS.NAMES.BAB_SSGY = "松鼠桂鱼"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BAB_SSGY = "外脆里嫩，酸甜适口！"
STRINGS.NAMES.BAB_RB = "肉包"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BAB_RB = "硬气蒸制，营养丰富！"
STRINGS.NAMES.BAB_SM = "烧麦"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BAB_SM = "洁白晶莹，馅多皮薄！"
STRINGS.NAMES.BAB_JLBG = "煎萝卜糕"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BAB_JLBG = "色泽金黄，松酥味美！"
STRINGS.NAMES.BAB_XHB = "鲜花饼"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BAB_XHB = "油酥制皮，香甜四溢！"

STRINGS.NAMES.BAMBOO = "竹子"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BAMBOO = "我觉得我可以吃掉它们"
STRINGS.NAMES.BAMBOOOOTREE = "竹子树"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BAMBOOOOTREE =
		{
			BURNING = "再见, 竹子树.",
			BURNT = "我觉得我可以阻止这个的发生.",
			CHOPPED = "接收自然吧",
			GENERIC = "看起来很壮观.",
		}

STRINGS.NAMES.DUG_BAMBOOOOTREE = "竹子根"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.DUG_BAMBOOOOTREE = "我应该种点这个"
else 
STRINGS.CHARACTER_TITLES.bamboooo = "BAMBOO"
STRINGS.CHARACTER_NAMES.bamboooo = "BAMBOO"
STRINGS.CHARACTER_DESCRIPTIONS.bamboooo = "*is good at Chinese cuisine\n*like sleeping\n*is heavy and hungry easily"
STRINGS.CHARACTER_QUOTES.bamboooo = "*Woah!"
STRINGS.NAMES.BAMBOOOO = "BAMBOO"
STRINGS.CHARACTERS.BAMBOOOO = require "speech_bamboooo"

STRINGS.NAMES.BAMBOOBED = "BAMBOOBED"
STRINGS.RECIPE_DESC.BAMBOOBED = "Cool and practical"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BAMBOOBED = "I want to lie on the bamboobed and have a good sleep."

STRINGS.NAMES.BAMBOO_COOKPOT_ITEM = "bamboosteamer"  
STRINGS.RECIPE_DESC.BAMBOO_COOKPOT_ITEM = "Use bamboosteamers to make delicious food!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BAMBOO_COOKPOT_ITEM = "Use it to cook Chinese food must be delicious."
STRINGS.NAMES.BAMBOO_COOKPOT = "bamboosteamer" 
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BAMBOO_COOKPOT = "It seems to be able to make some special Chinese dishes."

STRINGS.NAMES.BAB_DPR = "dongpopork"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BAB_DPR = "Stew and juice, fat and not greasy!"
STRINGS.NAMES.BAB_SSGY = "sweetmandarinfish"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BAB_SSGY = "Crispy outside, tender and sweet!"
STRINGS.NAMES.BAB_RB = "meatbun"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BAB_RB = "Hard gas steamed, nutrient rich!"
STRINGS.NAMES.BAB_SM = "shaomai"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BAB_SM = "White and sparkling, stuffed with thin skin!"
STRINGS.NAMES.BAB_JLBG = "radishcake"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BAB_JLBG = "Golden yellow, crisp and delicious!"
STRINGS.NAMES.BAB_XHB = "flowercake"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BAB_XHB = "Crisp skin, sweet and overflowing!"

STRINGS.NAMES.BAMBOO = "BamBoo"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BAMBOO = "Maybe I can bamboozle my enemies with this?"
STRINGS.NAMES.BAMBOOOOTREE = "Bamboo Patch"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BAMBOOOOTREE =
		{
			BURNING = "Bye bye, bamboo.",
			BURNT = "I feel like I could have prevented that.",
			CHOPPED = "Take that, nature!",
			GENERIC = "Looks pretty sturdy.",
		}
STRINGS.NAMES.DUG_BAMBOOOOTREE = "Bamboo Root"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.DUG_BAMBOOOOTREE = "I need to plant this."

end
AddMinimapAtlas("images/map_icons/bamboooo.xml") 
AddMinimapAtlas("images/map_icons/bamboo_cookpot_item.xml")
AddMinimapAtlas("images/map_icons/bambooootree.xml")

AddModCharacter("bamboooo", "FEMALE")


local FOODTYPE = GLOBAL.FOODTYPE
FOODTYPE.BAB_BAMBOO = "BAB_BAMBOO"
AddComponentPostInit("eater", function(self)
	self.SetCanEatBAB_BAMBOO = function ()
	    table.insert(self.preferseating, "BAB_BAMBOO")
	    table.insert(self.caneat, "BAB_BAMBOO")
	    self.inst:AddTag("BAB_BAMBOO_eater")
	end
end)
AddPrefabPostInit("bamboo", function(inst)
	inst:AddTag("bamboooo_food")
	if  GLOBAL.TheWorld.ismastersim  then
		inst:AddComponent("edible")
		inst.components.edible.foodtype = "BAB_BAMBOO"
	    inst.components.edible.healthvalue = 1
	    inst.components.edible.hungervalue = 15
	    inst.components.edible.sanityvalue = 2
	end
end)

local OldStore = GLOBAL.ACTIONS.STORE.strfn

GLOBAL.ACTIONS.STORE.strfn = function(act)
    if act.target and  act.target.prefab == "bamboo_cookpot"   then
        return "COOK"
    end
    return OldStore(act)
end

local function wakeuptest(inst, phase)
    if phase ~= "night" then
        inst.components.sleepingbag:DoWakeUp()
    end
end

local function onsleeptick(inst, sleeper)
    local isstarving = sleeper.components.beaverness ~= nil and sleeper.components.beaverness:IsStarving()

    if sleeper.components.hunger ~= nil then
        sleeper.components.hunger:DoDelta(TUNING.SLEEP_HUNGER_PER_TICK, true, true)
        isstarving = sleeper.components.hunger:IsStarving()
    end

    if sleeper.components.sanity ~= nil and sleeper.components.sanity:GetPercentWithPenalty() < 1 then
        sleeper.components.sanity:DoDelta(inst.sanity_tick	* ( sleeper:HasTag("bamboooo") and 1.25 or 1), true)
    end

    if not isstarving and inst.components.sleepingbag.healthsleep and sleeper.components.health ~= nil then
        sleeper.components.health:DoDelta(TUNING.SLEEP_HEALTH_PER_TICK * ( sleeper:HasTag("bamboooo") and 1.25 or 1), true, "bedroll", true)
    end

    if sleeper.components.temperature ~= nil then
        if inst.sleep_temp_min ~= nil and sleeper.components.temperature:GetCurrent() < inst.sleep_temp_min then
            sleeper.components.temperature:SetTemperature(sleeper.components.temperature:GetCurrent() + TUNING.SLEEP_TEMP_PER_TICK)
        elseif inst.sleep_temp_max ~= nil and sleeper.components.temperature:GetCurrent() > inst.sleep_temp_max then
            sleeper.components.temperature:SetTemperature(sleeper.components.temperature:GetCurrent() - TUNING.SLEEP_TEMP_PER_TICK)
        end
    end

    if isstarving then
        inst.components.sleepingbag:DoWakeUp()
    end
end

local function onsleep(inst, sleeper)
    inst:WatchWorldState("phase", wakeuptest)

    if inst.sleeptask ~= nil then
        inst.sleeptask:Cancel()
    end
    inst.sleeptask = inst:DoPeriodicTask(TUNING.SLEEP_TICK_PERIOD, onsleeptick, nil, sleeper)
end

local function damiao(inst)
    if not GLOBAL.TheWorld.ismastersim then
        return inst
    end
	inst.components.sleepingbag.onsleep = onsleep
end
AddPrefabPostInit("bedroll_straw", damiao)
AddPrefabPostInit("bedroll_furry", damiao)

local OldPick = GLOBAL.ACTIONS.PICKUP.fn
GLOBAL.ACTIONS.PICKUP.fn = function(act)
    if act.doer.components.inventory ~= nil and act.target ~= nil and act.target.components.boopickupable ~= nil and not act.target:IsInLimbo() then
        act.doer:PushEvent("onpickupitem", {item = act.target})
        return act.target.components.boopickupable:OnPickup(act.doer)
    end
    return OldPick(act)
end


AddComponentAction("SCENE", "boopickupable" , function(inst, doer, actions, right)
	if right and inst._isempty and inst._isempty:value() == true 
		and not inst:HasTag("cooking")
		and not inst:HasTag("donecooking")
		and doer.replica.inventory ~= nil then
			table.insert(actions, GLOBAL.ACTIONS.PICKUP)
	end
end)

local bab_dpr =
	{
		name = "bab_dpr",
		test = function(cooker, names, tags) return (names.meat or names.meat_cooked) and ((names.smallmeat and names.smallmeat == 2) or (names.smallmeat_cooked and names.smallmeat_cooked == 2) or (names.smallmeat_cooked and names.smallmeat ))  and (names.berries or names.berries_cooked or names.berries_juicy or names.berries_juicy_cooked )end,
		priority = 50,
		weight = 1,
		foodtype = GLOBAL.FOODTYPE.MEAT,
		health = 0,
		hunger = 150,
		perishtime = GLOBAL.TUNING.PERISH_SLOW,
		sanity = 0,
		cooktime = 1.5,
		tags = {"catfood"},
	}
local bab_ssgy =
	{
		name = "bab_ssgy",
		test = function(cooker, names, tags) return ( (names.fish and names.fish == 2)  or (names.fish_cooked and names.fish_cooked == 2) or (names.fish and names.fish_cooked ) ) and tags.sweetener  and (names.berries or names.berries_cooked or names.berries_juicy or names.berries_juicy_cooked) end,
		priority = 50,
		weight = 1,
		foodtype = GLOBAL.FOODTYPE.MEAT,
		health = 0,
		hunger = 150,
		perishtime = GLOBAL.TUNING.PERISH_SLOW,
		sanity = 0,
		cooktime = 1.5,
		tags = {"catfood"},
	}
	local bab_rb =
	{
		name = "bab_rb",
		test = function(cooker, names, tags) return (names.bird_egg or names.bird_egg_cooked or names.tallbirdegg) and (names.smallmeat or names.smallmeat_cooked  )and names.twigs and  (names.berries or names.berries_cooked or names.berries_juicy or names.berries_juicy_cooked )end,
		priority = 100,
		weight = 1,
		foodtype = GLOBAL.FOODTYPE.MEAT,
		health = 0,
		hunger = 80,
		perishtime = GLOBAL.TUNING.PERISH_SLOW,
		sanity = 50,
		cooktime = 1,
		tags = {"catfood"},
	}
	local bab_sm =
	{
		name = "bab_sm",
		test = function(cooker, names, tags) return (tags.veggie and tags.veggie >= 2)  and (names.bird_egg or names.bird_egg_cooked ) end,
		priority = 100,
		weight = 1,
		foodtype = GLOBAL.FOODTYPE.VEGGIE,
		health = 50,
		hunger = 80,
		perishtime = GLOBAL.TUNING.PERISH_SLOW,
		sanity = 0,
		cooktime = 1.3,
		tags = {"catfood"},
	}
	local bab_jlbg =
	{
		name = "bab_jlbg",
		test = function(cooker, names, tags) return ((names.carrot and names.carrot == 3) or (names.carrot_cooked and names.carrot_cooked == 3) or (   (names.carrot and names.carrot == 2) and  names.carrot_cooked )   or  (  (names.carrot_cooked and names.carrot_cooked == 2) and  names.carrot ) ) and names.acorn_cooked end,
		priority = 50,
		weight = 1,
		foodtype = GLOBAL.FOODTYPE.VEGGIE,
		health = 30,
		hunger = 80,
		perishtime = GLOBAL.TUNING.PERISH_SLOW,
		sanity = 30,
		cooktime = 1,
		tags = {"catfood"},
	}
	local bab_xhb =
	{
		name = "bab_xhb",
		test = function(cooker, names, tags) return (names.petals or names.petals == 3) and tags.sweetener end,
		priority = 50,
		weight = 1,
		foodtype = GLOBAL.FOODTYPE.VEGGIE,
		health = 0,
		hunger = 80,
		perishtime = GLOBAL.TUNING.PERISH_PRESERVED,
		sanity = 0,
		cooktime = 2,
		tags = {"catfood"},
	}
AddIngredientValues({"petals"}, {fruit=0})
AddCookerRecipe("bamboo_cookpot", bab_dpr)
AddCookerRecipe("bamboo_cookpot", bab_ssgy)
AddCookerRecipe("bamboo_cookpot", bab_rb)
AddCookerRecipe("bamboo_cookpot", bab_sm)
AddCookerRecipe("bamboo_cookpot", bab_jlbg)
AddCookerRecipe("bamboo_cookpot", bab_xhb)

AddRecipe("bamboobed",{GLOBAL.Ingredient("bamboo", 4,"images/inventoryimages/bamboo.xml"), GLOBAL.Ingredient("rope", 2)}, GLOBAL.RECIPETABS.SURVIVAL, GLOBAL.TECH.SCIENCE_ONE, 
nil, nil, nil, nil, "bamboooo",
"images/inventoryimages/bamboobed.xml", 
"bamboobed.tex")
AddRecipe("bamboo_cookpot_item",{Ingredient("cutstone", 3),Ingredient("charcoal", 6), Ingredient("bamboo", 4, "images/inventoryimages/bamboo.xml")}, GLOBAL.RECIPETABS.FARM, GLOBAL.TECH.SCIENCE_TWO, 
nil, nil, nil, nil, "bamboooo",
"images/inventoryimages/bamboo_cookpot_item.xml", 
"bamboo_cookpot_item.tex")

local function SetSleeperSleepState(inst)
    if inst.components.grue ~= nil then
        inst.components.grue:AddImmunity("sleeping")
    end
    if inst.components.talker ~= nil then
        inst.components.talker:IgnoreAll("sleeping")
    end
    if inst.components.firebug ~= nil then
        inst.components.firebug:Disable()
    end
    if inst.components.playercontroller ~= nil then
        inst.components.playercontroller:EnableMapControls(false)
        inst.components.playercontroller:Enable(false)
    end
    inst:OnSleepIn()
    inst.components.inventory:Hide()
    inst:PushEvent("ms_closepopups")
    inst:ShowActions(false)
end
local function SetSleeperAwakeState(inst)
    if inst.components.grue ~= nil then
        inst.components.grue:RemoveImmunity("sleeping")
    end
    if inst.components.talker ~= nil then
        inst.components.talker:StopIgnoringAll("sleeping")
    end
    if inst.components.firebug ~= nil then
        inst.components.firebug:Enable()
    end
    if inst.components.playercontroller ~= nil then
        inst.components.playercontroller:EnableMapControls(true)
        inst.components.playercontroller:Enable(true)
    end
    inst:OnWakeUp()
    inst.components.inventory:Show()
    inst:ShowActions(true)
end
local function IsNearDanger(inst)
    local hounded = GLOBAL.TheWorld.components.hounded
    if hounded ~= nil and (hounded:GetWarning() or hounded:GetAttacking()) then
        return true
    end
    local burnable = inst.components.burnable
    if burnable ~= nil and (burnable:IsBurning() or burnable:IsSmoldering()) then
        return true
    end
    if inst:HasTag("spiderwhisperer") then
        return GLOBAL.FindEntity(inst, 10,
            function(target)
                return (target.components.combat ~= nil and target.components.combat.target == inst)
                    or ((target:HasTag("monster") or target:HasTag("pig")) and
                        not (target:HasTag("player") or target:HasTag("spider")) and
                        not (inst.components.sanity:IsSane() and target:HasTag("shadowcreature")))
            end,
            nil, nil, { "monster", "pig", "_combat" }) ~= nil
    end
    return GLOBAL.FindEntity(inst, 10,
        function(target)
            return (target.components.combat ~= nil and target.components.combat.target == inst)
                or (target:HasTag("monster") and
                    not target:HasTag("player") and
                    not (inst.components.sanity:IsSane() and target:HasTag("shadowcreature")))
        end,
        nil, nil, { "monster", "_combat" }) ~= nil
end


AddStategraphState("wilson", 
    GLOBAL.State{
        name = "bedroll",
        tags = { "bedroll", "busy", "nomorph" },
        onenter = function(inst)
			local bedroll = inst.bufferedaction.invobject
			if  bedroll ~= nil and bedroll:HasTag("bamboobed") then
				inst.components.locomotor:Stop()
				inst.AnimState:PlayAnimation("action_uniqueitem_pre")
				inst.AnimState:PushAnimation("bedroll", false)
				SetSleeperSleepState(inst)
			else
            inst.components.locomotor:Stop()
            local failreason =
                (GLOBAL.TheWorld.state.isday and
                    (GLOBAL.TheWorld:HasTag("cave") and "ANNOUNCE_NODAYSLEEP_CAVE" or "ANNOUNCE_NODAYSLEEP")
                )
                or (IsNearDanger(inst) and "ANNOUNCE_NODANGERSLEEP")
                or (inst.components.hunger.current < TUNING.CALORIES_MED and "ANNOUNCE_NOHUNGERSLEEP")
                or (inst.components.beaverness ~= nil and inst.components.beaverness:IsStarving() and "ANNOUNCE_NOHUNGERSLEEP")
                or nil

            if failreason ~= nil then
                inst:PushEvent("performaction", { action = inst.bufferedaction })
                inst:ClearBufferedAction()
                inst.sg:GoToState("idle")
                if inst.components.talker ~= nil then
                    inst.components.talker:Say(GLOBAL.GetString(inst, failreason))
                end
                return
            end

            inst.AnimState:PlayAnimation("action_uniqueitem_pre")
            inst.AnimState:PushAnimation("bedroll", false)

            SetSleeperSleepState(inst)
			end
        end,
        timeline =
        {
            GLOBAL.TimeEvent(20 * GLOBAL.FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve/wilson/use_bedroll")
            end),
        },
        events =
        {
            GLOBAL.EventHandler("firedamage", function(inst)
                if inst.sg:HasStateTag("sleeping") then
                    inst.sg.statemem.iswaking = true
                    inst.sg:GoToState("wakeup")
                end
            end),
            GLOBAL.EventHandler("animqueueover", function(inst)
		
                if inst.AnimState:AnimDone() then
						if	inst.bufferedaction.invobject and inst.bufferedaction.invobject:HasTag("bamboobed") then
                        inst:PerformBufferedAction()
                        if inst.components.playercontroller ~= nil then
                            inst.components.playercontroller:Enable(true)
                        end
                        inst.sg:AddStateTag("sleeping")
                        inst.sg:AddStateTag("silentmorph")
                        inst.sg:RemoveStateTag("nomorph")
                        inst.sg:RemoveStateTag("busy")
                        inst.AnimState:PlayAnimation("bedroll_sleep_loop", true)	
                    elseif GLOBAL.TheWorld.state.isday or
                        (inst.components.health ~= nil and inst.components.health.takingfiredamage) or
                        (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
                        inst:PushEvent("performaction", { action = inst.bufferedaction })
                        inst:ClearBufferedAction()
                        inst.sg.statemem.iswaking = true
                        inst.sg:GoToState("wakeup")
                    elseif inst:GetBufferedAction() then
                        inst:PerformBufferedAction()
                        if inst.components.playercontroller ~= nil then
                            inst.components.playercontroller:Enable(true)
                        end
                        inst.sg:AddStateTag("sleeping")
                        inst.sg:AddStateTag("silentmorph")
                        inst.sg:RemoveStateTag("nomorph")
                        inst.sg:RemoveStateTag("busy")
                        inst.AnimState:PlayAnimation("bedroll_sleep_loop", true)
                    else
                        inst.sg.statemem.iswaking = true
                        inst.sg:GoToState("wakeup")
                    end
                end
            end),
        },
        onexit = function(inst)
            if inst.sleepingbag ~= nil then
                inst.sleepingbag.components.sleepingbag:DoWakeUp(true)
                inst.sleepingbag = nil
                SetSleeperAwakeState(inst)
            elseif not inst.sg.statemem.iswaking then
                SetSleeperAwakeState(inst)
            end
        end,
    }
)