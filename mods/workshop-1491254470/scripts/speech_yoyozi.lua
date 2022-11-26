--[[
	--- This is Wilson's speech file for Don't Starve Together ---
	Write your character's lines here.
	If you want to use another speech file as a base, or use a more up-to-date version, get them from data\scripts\
	
	If you want to use quotation marks in a quote, put a \ before it.
	Example:
	"Like \"this\"."
]]
return {
	ACTIONFAIL =
	{
		SHAVE =
		{
			AWAKEBEEFALO = "我不想在它醒着的时候去尝试.",
			GENERIC = "我不能刮",
			NOBITS = "连渣都没有了",
		},
		STORE =
		{
			GENERIC = "已经满了",
			NOTALLOWED = "这个不能放在这里面",
			INUSE = "我应该等轮到我的时候",
		},
		RUMMAGE =
		{	
			GENERIC = "不能这么做",
			INUSE = "我应该等轮到我的时候",	
		},
        COOK =
        {
            GENERIC = "不能这么做",
            INUSE = "我应该等轮到我的时候",
        },
        GIVE =
        {
            DEAD = "也许我能拿着这个.",
            SLEEPING = "太粗心大意了",
            BUSY = "我一会儿再试.",
        },
        GIVETOPLAYER = 
        {
        	FULL = "它的口袋太满了！",
            DEAD = "也许我能拿着这个.",
            SLEEPING = "太粗心大意了",
            BUSY = "我一会儿再试.",
    	},
    	GIVEALLTOPLAYER = 
        {
        	FULL = "它的口袋太满了！",
            DEAD = "也许我能拿着这个.",
            SLEEPING = "太粗心大意了",
            BUSY = "我一会儿再试.",
    	},
	},
	ACTIONFAIL_GENERIC = "我做不到这个",
	ANNOUNCE_ADVENTUREFAIL = "挥不动胳膊了……",
	ANNOUNCE_BEES = "好啊!",
	ANNOUNCE_BOOMERANG = "是回旋镖！",
	ANNOUNCE_CHARLIE = "那是什么? !",
	ANNOUNCE_CHARLIE_ATTACK = "噢!什么东西咬了我!",
	ANNOUNCE_COLD = "幽灵的实体也是会冷的啊.....",
	ANNOUNCE_HOT = "啊啊啊！！妖梦我上身着火了啊！！",
	ANNOUNCE_CRAFTING_FAIL = "没有需要的食材呢....妖梦去弄点吧~",
	ANNOUNCE_DEERCLOPS = "听起来太棒了!",
	ANNOUNCE_DUSK = "时间不早了.天很快就要黑了.",
	ANNOUNCE_EAT =
	{
		GENERIC = "好吃！",
		PAINFUL = "妖梦绝对不会让我吃这个的！",
		SPOILED = "妖梦绝对不会让我吃这个的！",
		STALE = "妖梦绝对不会让我吃这个的！",
		INVALID = "妖梦绝对不会让我吃这个的！",
		YUCKY = "妖梦绝对不会让我吃这个的！",
	},
	ANNOUNCE_ENTER_DARK = "太黑了ǃ",
	ANNOUNCE_ENTER_LIGHT = "我能看到了!",
	ANNOUNCE_FREEDOM = "我自由了!我终于自由了!",
	ANNOUNCE_HIGHRESEARCH = "我肯定比（9）聪明!",
	ANNOUNCE_HOUNDS = "有什么东西要来了！(°Д°)",
	ANNOUNCE_HUNGRY = "妖梦...我好饿! ",
	ANNOUNCE_HUNT_BEAST_NEARBY = "这痕迹是新的，食物一定在附近.",
	ANNOUNCE_HUNT_LOST_TRAIL = "食物的痕迹到这里消失了",
	ANNOUNCE_HUNT_LOST_TRAIL_SPRING = "潮湿的地面不会留下脚印.",
	ANNOUNCE_INV_FULL = "我不能再带东西了!",
	ANNOUNCE_KNOCKEDOUT = "啊！我的头!",
	ANNOUNCE_LOWRESEARCH = "我并没有从中学到很多东西.",
	ANNOUNCE_MOSQUITOS = "啊!走开!",
	ANNOUNCE_NODANGERSLEEP = "现在太危险了!",
	ANNOUNCE_NODAYSLEEP = "太亮了.",
	ANNOUNCE_NODAYSLEEP_CAVE = "我不累.",
	ANNOUNCE_NOHUNGERSLEEP = "我饿得睡不着....本小姐要吃东西！!",
	ANNOUNCE_NOSLEEPONFIRE = "本小姐居然要睡在外面....",
	ANNOUNCE_NODANGERSIESTA = "现在太危险了!",
	ANNOUNCE_NONIGHTSIESTA = "夜晚是用来睡觉的，而不是午睡.",
	ANNOUNCE_NONIGHTSIESTA_CAVE = "我觉得我不能在这里放松.",
	ANNOUNCE_NOHUNGERSIESTA = "我太饿了，不能午睡!",
	ANNOUNCE_NODANGERAFK = "现在不是逃避这场战斗的时候!",
	ANNOUNCE_NO_TRAP = "这很简单.",
	ANNOUNCE_PECKED = "噢!别闹了!",
	ANNOUNCE_QUAKE = "听起来不妙啊.",
	ANNOUNCE_RESEARCH = "不断学习!",
	ANNOUNCE_SHELTER = "谢谢你的保护，亲爱的大树先生!",
	ANNOUNCE_THORNS = "噢!",
	ANNOUNCE_BURNT = "啊!那很烫!...",
	ANNOUNCE_TORCH_OUT = "我的光没了!",
	ANNOUNCE_TRAP_WENT_OFF = "哎呀！",
	ANNOUNCE_UNIMPLEMENTED = "噢!我觉得还没准备好.",
	ANNOUNCE_WORMHOLE = "这不是一件明智的事情.",
	ANNOUNCE_CANFIX = "我想我能修好它!",
	ANNOUNCE_ACCOMPLISHMENT = "我觉得很有成就感!",
	ANNOUNCE_ACCOMPLISHMENT_DONE = "要是我的朋友现在能看见我就好了.",	
	ANNOUNCE_INSUFFICIENTFERTILIZER = "你还饿吗，植物?",
	ANNOUNCE_TOOL_SLIP = "哇这个工具很滑!0ДQ",
	ANNOUNCE_LIGHTNING_DAMAGE_AVOIDED = "何方道友在此渡劫！",

	ANNOUNCE_DAMP = "是水~",
	ANNOUNCE_WET = "唔....湿身福利.....",
	ANNOUNCE_WETTER = "地都湿了",
	ANNOUNCE_SOAKED = "唔....",
	
	ANNOUNCE_BECOMEGHOST = "哇哦!",
	ANNOUNCE_GHOSTDRAIN = "我的人性即将开始衰落……人性？不存在的┌(.Д.)┐",

	DESCRIBE_SAMECHARACTER = "这是平行世界吗？",
	
	BATTLECRY =
	{
		GENERIC = "你的春我就收下啦~",
		PIG = "我已经饿了",
		PREY = "就这么愉快的决定啦！吃了你  ",
		SPIDER = "我要吃了你",
		SPIDER_WARRIOR = "我改变主意了",
	},
	COMBAT_QUIT =
	{
		GENERIC = "我肯定看见了它!",
		PIG = "下次再吃你哦",
		PREY = "我的食物！别跑！",
		SPIDER = "它太恶心了",
		SPIDER_WARRIOR = "嘘，你这讨厌的家伙!",
	},
	DESCRIBE =
	{
        PLAYER =
        {
            GENERIC = "这是 %s!",
            ATTACKER = " %s 看起来机智如我",
            MURDERER = "凶手!",
            REVIVER = "%s, 鬼的朋友.",
            GHOST = "%s 可以使用一个心.",
        },
		WILSON = 
		{
			GENERIC = "你好威尔逊",
			ATTACKER = "威尔逊看起来比（9）聪明…",
			MURDERER = "凶手!",
			REVIVER = "威尔逊,鬼的朋友.",
			GHOST = "威尔逊可以用一颗心脏.",
		},
		WOLFGANG = 
		{
			GENERIC = "你好沃尔夫冈",
			ATTACKER = "沃尔夫冈看起来比（9）聪明…",
			MURDERER = "凶手!",
			REVIVER = "Wolfgang, 鬼的朋友.",
			GHOST = "Wolfgang 可以用一颗心脏.",
		},
		WAXWELL = 
		{
			GENERIC = "你好 Maxwell~",
			ATTACKER = "Maxwell 看起来比（9）聪明…",
			MURDERER = "凶手!",
			REVIVER = "Maxwell, 鬼的朋友.",
			GHOST = "Maxwell 可以用一颗心脏.",
		},
		WX78 = 
		{
			GENERIC = "你好 WX-78!",
			ATTACKER = "That WX-78 看起来比（9）聪明…",
			MURDERER = "凶手!",
			REVIVER = "WX-78, 鬼的朋友.",
			GHOST = "WX-78 可以用一颗心脏.",
		},
		WILLOW = 
		{
			GENERIC = "你好 Willow!",
			ATTACKER = "That Willow 看起来比（9）聪明…",
			MURDERER = "凶手!",
			REVIVER = "Willow, 鬼的朋友.",
			GHOST = "Willow 可以用一颗心脏.",
		},
		WENDY = 
		{
			GENERIC = "你好 Wendy!",
			ATTACKER = "That Wendy 看起来比（9）聪明…",
			MURDERER = "凶手!",
			REVIVER = "Wendy, 鬼的朋友.",
			GHOST = "Wendy 可以用一颗心脏.",
		},
		WOODIE = 
		{
			GENERIC = "你好 Woodie!",
			ATTACKER = "That Woodie 看起来比（9）聪明…",
			MURDERER = "凶手!",
			REVIVER = "Woodie, 鬼的朋友.",
			GHOST = "Woodie 可以用一颗心脏.",
		},
		WICKERBOTTOM = 
		{
			GENERIC = "你好 Wickerbottom!",
			ATTACKER = "That Wickerbottom 看起来比（9）聪明…",
			MURDERER = "凶手!",
			REVIVER = "Wickerbottom, 鬼的朋友.",
			GHOST = "Wickerbottom 可以用一颗心脏.",
		},
		WES = 
		{
			GENERIC = "你好 Wes!",
			ATTACKER = "That Wes 看起来比（9）聪明…",
			MURDERER = "凶手!",
			REVIVER = "Wes, 鬼的朋友.",
			GHOST = "Wes 可以用一颗心脏.",
		},
		MULTIPLAYER_PORTAL = "门先生，我能回白玉楼吗？",
		GLOMMER = "胖胖的，好像很好吃呢....",
		GLOMMERFLOWER = 
		{
			GENERIC = "花瓣在光里闪烁.",
			DEAD = "花瓣在光中凋零和闪烁.",
		},
		GLOMMERWINGS = "没我的帽子好看....",
		GLOMMERFUEL = "这东西闻起来很臭！",
		BELL = "丁丁灵",
		STATUEGLOMMER = 
		{	
			GENERIC = "我不知道那是什么.",
			EMPTY = "我打破了它，为科学.",
		},

		WEBBERSKULL = "可怜的凡人，它应该得到一个体面的葬礼.",
		WORMLIGHT = "看起来很好吃~",
		WORM =
		{
		    PLANT = "我觉得很安全.",
		    DIRT = "看起来就像一堆泥土.",
		    WORM = "是条虫子!",
		},
		MOLE =
		{
			HELD = "我的朋友，没有地方可挖了.",
			UNDERGROUND = "有东西在下面，寻找矿物质.",
			ABOVEGROUND = "我肯定喜欢打那个鼹鼠……",
		},
		MOLEHILL = "跟我家白玉楼比差远了",
		MOLEHAT = "一种令人讨厌的恶臭，但却具有极好的可视性.",

		EEL = "一顿美餐~",
		EEL_COOKED = "闻起来好香!",
		UNAGI = "妖梦~妖梦~看我自己做的!",
		EYETURRET = "我希望它不会向我打开.",
		EYETURRET_ITEM = "我觉得它在睡觉.",
		MINOTAURHORN = "哇!我很高兴没给我带来麻烦!",
		MINOTAURCHEST = "可能会有更大的东西!或者是可怕的.",
		THULECITE_PIECES = "它是一些更小的石块.",
		POND_ALGAE = "池塘里的水藻.",
		GREENSTAFF = "这迟早会有用的.",
		POTTEDFERN = "一盆蕨类植物.",

		THULECITE = "我想知道这是从哪里来的?",
		ARMORRUINS = "奇怪的光线.",
		RUINS_BAT = "它有相当大的分量.",
		RUINSHAT = "适合做国王.或者是我.",
		NIGHTMARE_TIMEPIECE =
		{
		CALM = "一切正常.",
		WARN = "在这里变得很神奇.",
		WAXING = "我想它越来越集中了!",
		STEADY = "这似乎是保持稳定.",
		WANING = "感觉好像在后退.",
		DAWN = "噩梦即将结束!",
		NOMAGIC = "这附近没有魔法.",
		},
		BISHOP_NIGHTMARE = "它要散架了!",
		ROOK_NIGHTMARE = "太可怕了!",
		KNIGHT_NIGHTMARE = "这是骑士!",
		MINOTAUR = "那东西看起来不太高兴.",
		SPIDER_DROPPER = "告诉自己:不要抬头.",
		NIGHTMARELIGHT = "我想知道这是什么功能.",
		NIGHTSTICK = "它是电动的!",
		GREENGEM = "绿色和宝石.",
		RELIC = "古老的家庭用品.",
		RUINS_RUBBLE = "这可以固定.",
		MULTITOOL_AXE_PICKAXE = "太棒了!",
		ORANGESTAFF = "这胜过走路.",
		YELLOWAMULET = "温暖的触摸.",
		GREENAMULET = "我想我还没有好.",
		SLURPERPELT = "看上去没有什么不同",	

		SLURPER = "这么多毛!",
		SLURPER_PELT = "看起来没多大不同.",
		ARMORSLURPER = "一套湿漉漉的，持久的，肉质的衣服.",
		ORANGEAMULET = "瞬间移动非常有用.",
		YELLOWSTAFF = "我在棍子上放了颗宝石.",
		YELLOWGEM = "这个宝石是黄色的.",
		ORANGEGEM = "这是一个橙色的宝石.",
		TELEBASE = 
		{
			VALID = "它已经准备好了.",
			GEMS = "它需要更多的紫色宝石.",
		},
		GEMSOCKET = 
		{
			VALID = "看起来准备好了.",
			GEMS = "它需要一个宝石.",
		},
		STAFFLIGHT = "这看起来很危险.",
	
        ANCIENT_ALTAR = "一种古老而神秘的结构.",

        ANCIENT_ALTAR_BROKEN = "好像是坏了.",

        ANCIENT_STATUE = "它似乎与世界格格不入.",

        LICHEN = "只有蓝藻才能在这种光线下生长.",
		CUTLICHEN = "很有营养的,但它很容易变质.",

		CAVE_BANANA = "它是糊状的.",
		CAVE_BANANA_COOKED = "太好吃了!",
		CAVE_BANANA_TREE = "这是双重的光合作用.",
		ROCKY = "它有吓人爪子.",
		
		COMPASS =
		{
			GENERIC="我不能阅读.",
			N = "北",
			S = "南",
			E = "东",
			W = "西",
			NE = "东北",
			SE = "东南",
			NW = "西北",
			SW = "西南",
		},

		NIGHTMARE_TIMEPIECE =	-- Duplicated
		{
			WAXING = "我想它越来越集中了!",
			STEADY = "这似乎是保持稳定.",
			WANING = "感觉好像在后退.",
			DAWN = "噩梦即将结束!",
			WARN = "在这里变得很神奇.",
			CALM = "一切正常.",
			NOMAGIC = "这里没有魔法.",
		},

		HOUNDSTOOTH="它很锋利!",
		ARMORSNURTLESHELL="它黏在我背上.",
		BAT="啊!可怕!",
		BATBAT = "不知道我能不能带两个这个.",
		BATWING="我讨厌这些东西，即使它们已经死了.",
		BATWING_COOKED="至少它不会再回来了.",
		BEDROLL_FURRY="它是如此温暖和舒适.",
		BUNNYMAN="很多肉的大白兔！",
		FLOWER_CAVE="会发光的地底植物.",
		FLOWER_CAVE_DOUBLE="科学使它发光.",
		FLOWER_CAVE_TRIPLE="科学使它发光.",
		GUANO="便便的另一种味道.",
		LANTERN="一个更加文明的灯光.",
		LIGHTBULB="看起来很好吃.",
		MANRABBIT_TAIL="我就喜欢拿着它.",
		MUSHTREE_TALL  ="魔理沙应该会喜欢的",
		MUSHTREE_MEDIUM="这些曾经在我的浴室里生长.",
		MUSHTREE_SMALL ="魔法蘑菇?",
		RABBITHOUSE=
		{
			GENERIC = "那不是真正的胡萝卜.",
			BURNT = "那不是真正的烤胡萝卜.",
		},
		SLURTLE="这是什么？.",
		SLURTLE_SHELLPIECES="一个没有解决办法的谜题.",
		SLURTLEHAT="我希望它不会把我的头发弄乱.",
		SLURTLEHOLE="这是黏糊糊动物的家",
		SLURTLESLIME="如果没用，我就不会碰它.",
		SNURTLE="它没那么恶心，但还是很恶心.",
		SPIDER_HIDER="啊!好多的蜘蛛!",
		SPIDER_SPITTER="我讨厌吃蜘蛛!",
		SPIDERHOLE="上面有个旧的网.",
		STALAGMITE="看起来像块石头.",
		STALAGMITE_FULL="看起来像块石头.",
		STALAGMITE_LOW="看起来像块石头.",
		STALAGMITE_MED="看起来像块石头.",
		STALAGMITE_TALL="岩石,岩石,岩石,岩石.",
		STALAGMITE_TALL_FULL="岩石,岩石,岩石,岩石…",
		STALAGMITE_TALL_LOW="岩石,岩石,岩石,岩石…",
		STALAGMITE_TALL_MED="岩石,岩石,岩石,岩石…",

		TURF_CARPETFLOOR = "另一种地面类型.",
		TURF_CHECKERFLOOR = "另一种地面类型.",
		TURF_DIRT = "另一种地面类型.",
		TURF_FOREST = "另一种地面类型.",
		TURF_GRASS = "另一种地面类型.",
		TURF_MARSH = "另一种地面类型.",
		TURF_ROAD = "另一种地面类型.",
		TURF_ROCKY = "另一种地面类型.",
		TURF_SAVANNA = "另一种地面类型.",
		TURF_WOODFLOOR = "另一种地面类型.",

		TURF_CAVE="另一种地面类型.",
		TURF_FUNGUS="另一种地面类型.",
		TURF_SINKHOLE="另一种地面类型.",
		TURF_UNDERROCK="另一种地面类型.",
		TURF_MUD="另一种地面类型.",

		TURF_DECIDUOUS = "另一种地面类型.",
		TURF_SANDY = "另一种地面类型.",
		TURF_BADLANDS = "另一种地面类型.",

		POWCAKE = "我不知道我饿了.",
        CAVE_ENTRANCE = 
        {
            GENERIC="不知道我能不能移动那块石头.",
            OPEN = "我猜里面会发现各种各样的东西.",
        },
        CAVE_EXIT = "我已经有了足够的发现.",
		MAXWELLPHONOGRAPH = "这就是音乐的来源.",
		BOOMERANG = "空气动力学!",
		PIGGUARD = "它看起来不友好.",
		ABIGAIL = "哇，她有个可爱的小蝴蝶结.",
		ADVENTURE_PORTAL = "我不确定我是否还想再来一次.",
		AMULET = "当我穿着它的时候，我感觉很安全.",
		ANIMAL_TRACK = "食物留下的痕迹，我的意思是……一种动物.",
		ARMORGRASS = "我希望这里面没有虫子.",
		ARMORMARBLE = "这看起来很重.",
		ARMORWOOD = "这是一件非常合理的衣服.",
		ARMOR_SANITY = "穿这衣服让我觉得安全又不安全.",
		ASH =
		{
			GENERIC = "这一切都是在火灾之后留下的.",
			REMAINS_GLOMMERFLOWER = "我传送的时候，花被火吞噬了!",
			REMAINS_EYE_BONE = "当我传送的时候，眼骨被火吞噬了！",
			REMAINS_THINGIE = "这是在它被烧之前的事.",
		},
		AXE = "这是我值得信赖的斧头.",
		BABYBEEFALO = "恩，太可爱了!",
		BACKPACK = "我要把东西放进去.",
		BACONEGGS = "我自己做的!",
		BANDAGE = "看起来是无菌的.",
		BASALT = "那太强大了，不能突破!",
		BATBAT = "如果我有两个，我打赌我能飞.",	-- Duplicated
		BEARDHAIR = "我用我的脸做的.",
		BEARGER = "是一只大獾熊.",
		BEARGERVEST = "欢迎来到冬眠站!",
		ICEPACK = "皮毛能让温度保持稳定.",
		BEARGER_FUR = "一层厚厚的毛皮.",
		BEDROLL_STRAW = "闻起来像湿的.",
		BEE =
		{
			GENERIC = "会嗡嗡的带刺食物",
			HELD = "小心!",
		},
		BEEBOX =
		{
			READY = "它充满了蜂蜜.",
			FULLHONEY = "它充满了蜂蜜.",
			GENERIC = "蜜蜂!",
			NOHONEY = "是空的.",
			SOMEHONEY = "我应该等一会儿.",
			BURNT = "它是怎么被烧的?!!",
		},
		BEEFALO =
		{
			FOLLOWER = "和平相处",
			GENERIC = "我看到了牛肉在跑！！",
			NAKED = "它太伤心了.",
			SLEEPING = "它们都睡得很沉.",
		},
		BEEFALOHAT = "多么漂亮的帽子，虽然没我的帽子好看~",
		BEEFALOWOOL = "闻起来像牛肉味道",
		BEEHAT = "这应该能保护我.",
		BEEHIVE = "它在嗡嗡作响.",
		BEEMINE = "我摇它的时候就会发出嗡嗡声.",
		BEEMINE_MAXWELL = "蚊子的愤怒!",
		BERRIES = "浆果味道很好.",
		BERRIES_COOKED = "我觉得热不太好.",
		BERRYBUSH =
		{
			BARREN = "我认为它需要施肥.",
			WITHERED = "在这种高温下什么也不会生长.",
			GENERIC = "浆果味道很好.",
			PICKED = "也许它们会长回来?",
		},
		BIGFOOT = "这是一只脚.",
		BIRDCAGE =
		{
			GENERIC = "我应该在里面放一只鸟.",
			OCCUPIED = "这是我的鸟!",
			SLEEPING = "啊，它睡着了.",
		},
		BIRDTRAP = "用来抓小碎骨的",
		BIRD_EGG = "一个小小的，正常的蛋.",
		BIRD_EGG_COOKED = "阳光灿烂!",
		BISHOP = "发条教主，河童和早苗一定会喜欢的",
		BLOWDART_FIRE = "这看起来根本不安全.",
		BLOWDART_SLEEP = "千万别吸气.",
		BLOWDART_PIPE = "我的生日蛋糕做得不错!",
		BLUEAMULET = "凉爽的冰!",
		BLUEGEM = "它闪烁着冰冷的能量.",
		BLUEPRINT = "这是科学!",
		BELL_BLUEPRINT = "这是科学！",
		BLUE_CAP = "很奇怪而粘稠.",
		BLUE_CAP_COOKED = "现在不一样了!",
		BLUE_MUSHROOM =
		{
			GENERIC = "魔理沙会喜欢的",
			INGROUND = "它在睡觉.",
			PICKED = "不知道它会不会回来?",
		},
		BOARDS = "木板",
		BOAT = "我是这样到这来的吗？",
		BONESHARD = "骨刺.",
		BONESTEW = "我自己做的!",
		BUGNET = "用来捕捉虫子.",
		BUSHHAT = "有点痒的感觉.",
		BUTTER = "真不敢相信是黄油!",
		BUTTERFLY =
		{
			GENERIC = "蝴蝶,飞舞~",
			HELD = "现在我有你了!",
		},
		BUTTERFLYMUFFIN = "我自己做的!",
		BUTTERFLYWINGS = "蝴蝶掉落了",
		BUZZARD = "它在等待着尸体",
		CACTUS = 
		{
			GENERIC = "尖锐的,但很好吃.",
			PICKED = "还是很刺.",
		},
		CACTUS_MEAT_COOKED = "沙漠的烤水果.",
		CACTUS_MEAT = "我和一顿美味的饭菜之间还有些刺.",
		CACTUS_FLOWER = "一种漂亮的花，来自多刺的植物.",

		COLDFIRE =
		{
			EMBERS = "我应该在火熄灭之前放点东西在火上.",
			GENERIC = "打败了黑暗.",
			HIGH = "火已经失控了!",
			LOW = "火势越来越小了.",
			NORMAL = "很好很舒服~",
			OUT = "好了，结束了.",
		},
		CAMPFIRE =
		{
			EMBERS = "我应该在火熄灭之前放点东西在火上.",
			GENERIC = "打败了黑暗.",
			HIGH = "火已经失控了",
			LOW = "火势越来越小了.",
			NORMAL = "很好很舒服~",
			OUT = "好了，结束了.",
		},
		CANE = "似乎让行走更容易!",
		CATCOON = "一个有趣的小东西.",
		CATCOONDEN = 
		{
			GENERIC = "这是一个树桩洞",
			EMPTY = "它的主人失去了生命.",
		},
		CATCOONHAT = "耳朵帽!",
		COONTAIL = "我想它还在嗖嗖作响.",
		CARROT = "大萝卜~.",
		CARROT_COOKED = "糊状的东西...",
		CARROT_PLANTED = "大自然正在制造食物.",
		CARROT_SEEDS = "它是一粒种子.",
		WATERMELON_SEEDS = "它是一粒种子.",
		CAVE_FERN = "这是一种蕨类植物.",
		CHARCOAL = "它很小，很黑，闻起来像烧焦的木头.",
        CHESSJUNK1 = "一堆破碎的棋子.",
        CHESSJUNK2 = "另一堆破碎的棋子.",
        CHESSJUNK3 = "更坏的棋子.",
		CHESTER = "奥托切斯特菲尔德先生.",
		CHESTER_EYEBONE =
		{
			GENERIC = "它在盯着我.",
			WAITING = "它睡着了.",
		},
		COOKEDMANDRAKE = "可怜的小家伙.",
		COOKEDMEAT = "炭烤过的美味.",
		COOKEDMONSTERMEAT = "开胃小菜.",
		COOKEDSMALLMEAT = "现在我不用担心会有虫子了！",
		COOKPOT =
		{
			COOKING_LONG = "这需要一段时间.",
			COOKING_SHORT = "快好了!",
			DONE = "太好了!差不多完成了!",
			EMPTY = "光是看着它就让我很饿.",
			BURNT = "锅里快煮熟了.",
		},
		CORN = "糖果!",
		CORN_COOKED = "糖果",
		CORN_SEEDS = "它是一粒种子.",
		CROW =
		{
			GENERIC = "小碎骨太多了，不是很喜欢呢~",
			HELD = "它不是很高兴.",
		},
		CUTGRASS = "割草，准备制作艺术和工艺品.",
		CUTREEDS = "剪断芦苇，准备加工",
		CUTSTONE = "我让它们变得很有魅力.",
		DEADLYFEAST = "最好的菜.",
		DEERCLOPS = "它是巨大的!!",
		DEERCLOPS_EYEBALL = "这真的很恶心.",
		EYEBRELLAHAT =	"它会看着我.",
		DEPLETED_GRASS =
		{
			GENERIC = "可能是一簇草.",
		},
		DEVTOOL = "培根的味道!",
		DEVTOOL_NODEV = "我没有强到驾驭它的能力.",
		DIRTPILE = "那是一堆土……是吗?",
		DIVININGROD =
		{
			COLD = "信号很微弱.",
			GENERIC = "它是某种寻的装置.",
			HOT = "这个东西是疯了!",
			WARM = "我的方向是对的.",
			WARMER = "我一定很接近了..",
		},
		DIVININGRODBASE =
		{
			GENERIC = "我想知道它是干什么的.",
			READY = "看起来它需要一把大钥匙.",
			UNLOCKED = "现在我的机器可以工作了!",
		},
		DIVININGRODSTART = "那根杆子看起来很有用!",
		DRAGONFLY = "那是一只飞龙!",
		ARMORDRAGONFLY = "夏日邮件",
		DRAGON_SCALES = "它仍然是温暖的.",
		DRAGONFLYCHEST = "最好是一个带锁的箱子!",
		LAVASPIT = 
		{
			HOT = "热!",
			COOL = "我喜欢叫它  Basaliva'.",
		},
		DRAGONFRUIT = "多奇怪的水果啊.",
		DRAGONFRUIT_COOKED = "还是很奇怪.",
		DRAGONFRUIT_SEEDS = "它是一粒种子.",
		DRAGONPIE = "我自己做的!",
		DRUMSTICK = "我应该把它吃掉.",
		DRUMSTICK_COOKED = "现在它更美味了.",
		DUG_BERRYBUSH = "我应该种下这个.",
		DUG_GRASS = "我应该种下这个.",
		DUG_MARSH_BUSH = "我应该种下这个.",
		DUG_SAPLING = "我应该种下这个.",
		DURIAN = "噢!",
		DURIAN_COOKED = "现在闻起来更糟了!",
		DURIAN_SEEDS = "它是一粒种子.",
		EARMUFFSHAT = "至少我的耳朵不会冷....",
		EGGPLANT = "它看起来不像鸡蛋.",
		EGGPLANT_COOKED = "更不像蛋了.",
		EGGPLANT_SEEDS = "它是一粒种子.",
		DECIDUOUSTREE = 
		{
			BURNING = "真是浪费木头.",
			BURNT = "我觉得我本可以阻止它的.",
			CHOPPED = "接招吧！大自然!",
			POISON = "我偷那鸟蛋，它看起来很不高兴！",
			GENERIC = "全是树叶，大部分时间是这样.",
		},
		ACORN = 
		{
		    GENERIC = "里面肯定有什么东西.",
		    PLANTED = "很快就会变成一棵树了!",
		},
		ACORN_COOKED = "烤得完美.",
		BIRCHNUTDRAKE = "一个疯狂的小坚果.",
		EVERGREEN =
		{
			BURNING = "真是浪费木头.",
			BURNT = "我觉得我本可以阻止它的.",
			CHOPPED = "接招吧！大自然!",
			GENERIC = "我只想到了西行妖.....",
		},
		EVERGREEN_SPARSE =
		{
			BURNING = "真是浪费木头.",
			BURNT = "我觉得我本可以阻止它的.",
			CHOPPED = "接招吧！大自然!",
			GENERIC = "这棵可怜的树没有种子.",
		},
		EYEPLANT = "我想我被监视了.",
		FARMPLOT =
		{
			GENERIC = "我应该尝试种一些庄稼.",
			GROWING = "种植物去吧!",
			NEEDSFERTILIZER = "我认为它需要施肥.",
			BURNT = "我不认为有什么东西会在一堆灰烬中生长.",
		},
		FEATHERHAT = "我是一只鸟!",
		FEATHER_CROW = "一根乌鸦羽毛.",
		FEATHER_ROBIN = "红雀的羽毛.",
		FEATHER_ROBIN_WINTER = "雪鸟羽毛.",
		FEM_PUPPET = "她被困住了!",
		FIREFLIES =
		{
			GENERIC = "要是我能抓住它们就好了!",
			HELD = "它们让我的口袋闪闪发光!",
		},
		FIREHOUND = "那个是 glowy.",
		FIREPIT =
		{
			EMBERS = "我应该在火熄灭之前放点东西在火上.",
			GENERIC = "打败了黑暗.",
			HIGH = "还好它被控制住了!",
			LOW = "火越来越小了.",
			NORMAL = "很好很舒服.",
			OUT = "至少我可以重新开始.",
		},
		COLDFIREPIT =
		{
			EMBERS = "我应该在火熄灭之前放点东西在火上.",
			GENERIC = "打败了黑暗.",
			HIGH = "还好它被控制住了!",
			LOW = "火越来越小了.",
			NORMAL = "很好很舒服.",
			OUT = "至少我可以重新开始.",
		},
		FIRESTAFF = "我不想让全世界都着火！",
		FIRESUPPRESSOR = 
		{	
			ON = "阻止火灾！",
			OFF = "所有都保持沉默.",
			LOWFUEL = "燃料有点少了.",
		},

		FISH = "现在我要吃一天的饭.",
		FISHINGROD = "钩、线、棒!",
		FISHSTICKS = "我自己做的!",
		FISHTACOS = "我自己做的!",
		FISH_COOKED = "烤得很完美",
		FLINT = "这是一块非常锋利的石头.",
		FLOWER = "美丽的装饰物~",
		FLOWERHAT = "很漂亮.",
		FLOWER_EVIL = "啊!它是如此邪恶!",
		FOLIAGE = "一些绿叶蔬菜.",
		FOOTBALLHAT = "我不喜欢运动.",
		FROG =
		{
			DEAD = "它死掉了.",
			GENERIC = "要吃它有点麻烦呢~",
			SLEEPING = "啊，看 它睡着了!",
		},
		FROGGLEBUNWICH = "我自己做的!",
		FROGLEGS = "我听说它很美味",
		FROGLEGS_COOKED = "尝起来像鸡肉.",
		FRUITMEDLEY = "我自己做的!",
		FURTUFT = "黑白相间的皮毛.", 
		GEARS = "你想做非想天则？",
		GHOST = "这让我成为了科学家.",
		GOLDENAXE = "这是一把奇特的斧头.",
		GOLDENPICKAXE = "嘿，黄金不是很软的吗?",
		GOLDENPITCHFORK = "为什么我做了一个如此花哨的干草叉?",
		GOLDENSHOVEL = "我等不及要挖洞了.",
		GOLDNUGGET = "不能吃，但它很亮.",
		GRASS =
		{
			BARREN = "它需要便便.",
			WITHERED = "它不会在太热的时候长出来的.",
			BURNING = "燃烧得太快了",
			GENERIC = "这是草簇.",
			PICKED = "它在壮年时被砍倒了.",
		},
		GREEN_CAP = "似乎很正常.",
		GREEN_CAP_COOKED = "现在不同了……",
		GREEN_MUSHROOM =
		{
			GENERIC = "魔理沙应该会喜欢",
			INGROUND = "它在睡觉.",
			PICKED = "我想知道它会不会长出来？",
		},
		GUNPOWDER = "它看起来像胡椒.",
		HAMBAT = "这看起来不卫生.",
		HAMMER = "停!别把东西砸了!",
		HEALINGSALVE = "刺痛意味着它起作用了.",
		HEATROCK =
		{
			FROZEN = "比冰还冷.",
			COLD = "那是一块冰冷的石头.",
			GENERIC = "我可以控制它的温度.",
			WARM = "非常暖的一块石头~",
			HOT = "又热又舒服!",
		},
		HOME = "必须有人住在这里.",
		HOMESIGN = 
		{
			GENERIC = "上面写着‘你在这里’.",
			BURNT = "我不能再读了.",
		},
		HONEY = "看起来很美味!",
		HONEYCOMB = "蜜蜂以前住在这里.",
		HONEYHAM = "我自己做的!",
		HONEYNUGGETS = "我自己做的!",
		HORN = "听起来就像皮弗娄牛场.",
		HOUND = "一直都很兴奋的狗狗",
		HOUNDBONE = "狗狗的骸骨",
		HOUNDMOUND = "我可不想到这里找一根骨头.",
		ICEBOX = "我已经驾驭了寒冷的力量!",
		ICEHAT = "冷静点，孩子.",
		ICEHOUND = "每个季节都有猎犬吗?",
		INSANITYROCK =
		{
			ACTIVE = "花,让人找到自己的理智!",
			INACTIVE = "与其说它是方尖碑，不如说它是一个金字塔.",
		},
		JAMMYPRESERVES = "我自己做的!",
		KABOBS = "我自己做的!",
		KILLERBEE =
		{
			GENERIC = "带刺的食物！",
			HELD = "这看起来很危险.",
		},
		KNIGHT = "河童和早苗肯定喜欢！",
		KOALEFANT_SUMMER = "美味可口~",
		KOALEFANT_WINTER = "它看起来很温暖，充满了肉.",
		KRAMPUS = "它在追我的东西！",
		KRAMPUS_SACK = " Krampus 的粘液.",
		LEIF = "它真大!",
		LEIF_SPARSE = "它块头很大!",
		LIGHTNING_ROD =
		{
			CHARGED = "力量是我的!",
			GENERIC = "我能驾驭天堂！",
		},
		LIGHTNINGGOAT = 
		{
			GENERIC = "自己!",
			CHARGED = "我觉得它不喜欢被闪电击中.",
		},
		LIGHTNINGGOATHORN = "它就像一个微型避雷针.",
		GOATMILK = "它在嗡嗡作响!",
		LITTLE_WALRUS = "它不会永远可爱...",
		LIVINGLOG = "它看起来忧心忡忡.",
		LOCKEDWES = "麦克斯韦的雕像把它困住了.",
		LOG =
		{
			BURNING = "那是一些热木头!",
			GENERIC = "它很大，很重",
		},
		LUREPLANT = "太诱人了.",
		LUREPLANTBULB = "现在我可以开始自己的肉类农场了.",
		MALE_PUPPET = "它被困住了!",
		MANDRAKE =
		{
			DEAD = "曼德拉草有奇怪的力量.",
			GENERIC = "我听说过这植物的奇怪事情.",
			PICKED = "这磨人的小妖精....我会吃了你哟！",
		},
		MANDRAKESOUP = "我自己做的!",
		MANDRAKE_COOKED = "看起来不再那么奇怪了.",
		MARBLE = "幻想!",
		MARBLEPILLAR = "我想我可以用.",
		MARBLETREE = "我认为斧头不能把它砍掉.",
		MARSH_BUSH =
		{
			BURNING = "烧得真快!",
			GENERIC = "看起来很棘手.",
			PICKED = "唔...好疼...",
		},
		BURNT_MARSH_BUSH = "都烧焦了....",
		MARSH_PLANT = "它是一种植物.",
		MARSH_TREE =
		{
			BURNING = "尖锋和火焰!",
			BURNT = "现在它被烧焦了.",
			CHOPPED = "现在没那么刺眼了!",
			GENERIC = "那些钉子看起来很锋利!",
		},
		MAXWELL = "我讨厌那个家伙.",
		MAXWELLHEAD = "我能看到它的毛孔.",
		MAXWELLLIGHT = "我想知道它是如何工作的.",
		MAXWELLLOCK = "看起来就像一个钥匙孔.",
		MAXWELLTHRONE = "看上去不太舒服.",
		MEAT = "看的我都肚子饿了....",
		MEATBALLS = "我自己做的!",
		MEATRACK =
		{
			DONE = "平静的时光~",
			DRYING = "肉需要一段时间才能干燥.",
			DRYINGINRAIN = "在雨中，肉需要更长的时间才能干燥.",
			GENERIC = "我应该挂点干肉.",
			BURNT = "架子变干了.",
		},
		MEAT_DRIED = "够了.",
		MERM = "臭死了!",
		MERMHEAD = 
		{
			GENERIC = "这是我这一天闻到最臭的东西.",
			BURNT = "烧焦的肉肉有点难闻.",
		},
		MERMHOUSE = 
		{
			GENERIC = "谁会住在这里?",
			BURNT = "现在没人生活了.",
		},
		MINERHAT = "这将使我的双手更自由.",
		MONKEY = "奇怪的小家伙.",
		MONKEYBARREL = "你刚才动了吗?",
		MONSTERLASAGNA = "我自己做的!",
		FLOWERSALAD = "一碗叶子.",
        ICECREAM = "我要冰淇淋!",
        WATERMELONICLE = "低温的水",
        TRAILMIX = "一种健康的天然零食.",
        HOTCHILI = "5个警报!",
        GUACAMOLE = "阿伏伽德罗最喜欢的菜.",
		MONSTERMEAT = "啊，我想我不应该吃那个.",
		MONSTERMEAT_DRIED = "怪味的牛肉干....",
		MOOSE = "我不太清楚那是什么.",
		MOOSEEGG = "里面的东西就像是想逃跑的兴奋电子.",
		MOSSLING = "啊!你绝对不是一个电子!",
		FEATHERFAN = "把我的体温降下来.",
		GOOSE_FEATHER = "毛茸茸的~",
		STAFF_TORNADO = "旋转的厄运.",
		MOSQUITO =
		{
			GENERIC = "你也是红魔馆的吗？",
			HELD = "那是我的血吗?....",
		},
		MOSQUITOSACK = "可能不是别人的血……",
		MOUND =
		{
			DUG = "我感到很难过.",
			GENERIC = "我敢打赌，那里有各种各样的好东西！",
		},
		NIGHTLIGHT = "它发出一种诡异的光.",
		NIGHTMAREFUEL = "这些东西都是疯了!",
		NIGHTSWORD = "我梦见自己!",
		NITRE = "我不是一个地质学家.",
		ONEMANBAND = "猪肉们听我召唤！",
		PANDORASCHEST = "它可能包含一些奇妙的东西!或者是可怕的.",
		PANFLUTE = "我可以为动物们唱小夜曲.",
		PAPYRUS = "一些纸.",
		PENGUIN = "春天来了，又到了交配的季节了",
		PERD = "会跑的食物，在吃我不会跑的食物!.....",
		PEROGIES = "我自己做的!",
		PETALS = "开始凋零了",
		PETALS_EVIL = "开始凋零了",
		PHLEGM = "它又厚又柔软.还有咸味.",
		PICKAXE = "把岩石敲碎",
		PIGGYBACK = "我觉得有点不舒服.",
		PIGHEAD = 
		{	
			GENERIC = "看起来像是给野兽的礼物.",
			BURNT = "脆皮.",
		},
		PIGHOUSE =
		{
			FULL = "我能看到一个鼻子贴在窗户上.",
			GENERIC = "连这些猪肉都有房子.",
			LIGHTSOUT = "开门！查水表！",
			BURNT = "现在不那么喜欢猪了!",
		},
		PIGKING = "看起来就像非洲酋长....还是特别肥的那种....",
		PIGMAN =
		{
			DEAD = "有人应该告诉它的家人.",
			FOLLOWER = "它是我的随从.",
			GENERIC = "猪肉~",
			GUARD = "它看上去很严肃.",
			WEREPIG = "它不友好!",
		},
		PIGSKIN = "它仍然有尾巴在上面.",
		PIGTENT = "熏肉的味道.",
		PIGTORCH = "猪肉族的精神图腾？",
		PINECONE = 
		{
		    GENERIC = "我能听到里面的一棵小树苗，想赶快出来看看世界~",
		    PLANTED = "很快就会变成一棵树!",
		},
		PITCHFORK = "麦克斯韦可能在找这个.",
		PLANTMEAT = "看上去没有什么吸引力.",
		PLANTMEAT_COOKED = "至少现在暖和了~",
		PLANT_NORMAL =
		{
			GENERIC = "绿叶!",
			GROWING = "啊!它长得太慢了!",
			READY = "嗯,准备收获.",
			WITHERED = "它热死了.",
		},
		POMEGRANATE = "它看起来就像一个外星人的大脑内部.",
		POMEGRANATE_COOKED = "高等厨房!",
		POMEGRANATE_SEEDS = "它是一粒种子.",
		POND = "我看不见底！",
		POOP = "排泄物....",
		FERTILIZER = "那绝对是一个装满粪便的桶.",
		PUMPKIN = "它和我的脑袋一样大!",
		PUMPKINCOOKIE = "我自己做的!",
		PUMPKIN_COOKED = "它怎么没有变成馅饼呢？",
		PUMPKIN_LANTERN = "Spooky!",
		PUMPKIN_SEEDS = "它是一粒种子.",
		PURPLEAMULET = "它在跟我窃窃私语.",
		PURPLEGEM = "它包含了宇宙的奥秘.",
		RABBIT =
		{
			GENERIC = "会跑的食物~",
			HELD = "你喜欢科学吗?",
		},
		RABBITHOLE = 
		{
			GENERIC = "食物的家",
			SPRING = "本尼门的王国已经关闭了.",
		},
		RAINOMETER = 
		{	
			GENERIC = "它能测量云.",
			BURNT = "测量部件在烟雾中上升.",
		},
		RAINCOAT = "要让雨保持在应有的位置.在我的身体外面.",
		RAINHAT = "它会把我的头发弄乱，但我会保持干爽.",
		RATATOUILLE = "我自己做的!",
		RAZOR = "一块锋利的石头绑在一根棍子上",
		REDGEM = "它闪烁着内心的温暖.",
		RED_CAP = "它闻起来很有趣.",
		RED_CAP_COOKED = "现在不同了……",
		RED_MUSHROOM =
		{
			GENERIC = "魔理沙应该会喜欢",
			INGROUND = "它在睡觉.",
			PICKED = "我想知道它会不会长出来？",
		},
		REEDS =
		{
			BURNING = "真着火了!",
			GENERIC = "这是一个芦苇丛.",
			PICKED = "我挑了所有有用的芦苇.",
		},
        RELIC = 
        {
            GENERIC = "古老的家庭用品.",
            BROKEN = "这里没什么有用的.",
        },
        RUINS_RUBBLE = "这可以固定.",
        RUBBLE = "只是一些岩石的碎片.",
		RESEARCHLAB = 
		{	
			GENERIC = "它把原材料合成其它的东西",
			BURNT = "现在它不会做很多科学研究了.",
		},
		RESEARCHLAB2 = 
		{
			GENERIC = "它比上一个更科学.",
			BURNT = "额外的科学并没有使其保持活力.",
		},
		RESEARCHLAB3 = 
		{
			GENERIC = "我创造了什么?",
			BURNT = "不管它是什么，它现在都被烧毁了.",
		},
		RESEARCHLAB4 = 
		{
			GENERIC = "帽子仪器？",
			BURNT = "火并不能真正解决命名问题.",
		},
		RESURRECTIONSTATUE = 
		{
			GENERIC = "一个恶魔!",
			BURNT = "没什么用了.",
		},		RESURRECTIONSTONE = "这石头能让已逝者复活",
		ROBIN =
		{
			GENERIC = "小碎骨太多了，不是很喜欢呢~",
			HELD = "它喜欢我的口袋.",
		},
		ROBIN_WINTER =
		{
			GENERIC = "冬天才会出现的小碎骨.",
			HELD = "它太软了.",
		},
		ROBOT_PUPPET = "它被困住了!",
		ROCK_LIGHT =
		{
			GENERIC = "一个在熔岩坑里的硬壳.",
			OUT = "看起来很脆弱.",
			LOW = "熔岩的结壳.",
			NORMAL = "很好很舒服.",
		},
		ROCK = "岩石，重要的材料",
		ROCK_ICE = 
		{
			GENERIC = "幽幽子要吃冰沙！",
			MELTED = "没有任何有用的东西，直到它再次结冰.",
		},
		ROCK_ICE_MELTED = "没有任何有用的东西，直到它再次结冰.",
		ICE = "我很高兴见到你，冰",
		ROCKS = "我可以用这些东西.",
        ROOK = "发条战车，河童和早苗肯定喜欢！",
		ROPE = "一些短的绳子.",
		ROTTENEGG = "唔!它很臭!",
		SANITYROCK =
		{
			ACTIVE = "那是一块看起来很疯狂的石头!",
			INACTIVE = "剩下的部分去哪儿了?",
		},
		SAPLING =
		{
			BURNING = "烧得真快!",
			WITHERED = "如果天气凉爽些就好了.",
			GENERIC = "小树太可爱了!",
			PICKED = "这小家伙还会长起来的，对吧？",
		},
		SEEDS = "每一个都是一个小谜团.",
		SEEDS_COOKED = "我把它们都烤熟了!",
		SEWING_KIT = "把损坏的衣物缝好",
		SHOVEL = "把地下有用的东西挖出来.",
		SILK = "它来自于蜘蛛的屁股.",
		SKELETON = "可怜的凡人啊 到冥界来吧，我会欢迎你的~",
		SCORCHED_SKELETON = "被烤焦的骸骨",
		SKELETON_PLAYER = "等一下!",
		SKULLCHEST = "我不确定我是否想打开它.",
		SMALLBIRD =
		{
			GENERIC = "那是一只相当小的鸟(食物）",
			HUNGRY = "它看起来饿了.",
			STARVING = "一定是饿坏了.",
		},
		SMALLMEAT = "一小块肉",
		SMALLMEAT_DRIED = "有点干.",
		SPAT = "一种易怒的动物.",
		SPEAR = "这是一根尖尖的棍子.",
		SPIDER =
		{
			DEAD = "太好了!",
			GENERIC = "很多脚的食物",
			SLEEPING = "最好在它醒来之前吃了它",
		},
		SPIDERDEN = "多脚食物的家!",
		SPIDEREGGSACK = "我希望这些东西不会在我的口袋里孵化出来.",
		SPIDERGLAND = "它有一种刺鼻的、防腐的气味.",
		SPIDERHAT = "我希望我把所有的蜘蛛都弄出来了.",
		SPIDERQUEEN = "啊啊啊啊!那只食物真大!",
		SPIDER_WARRIOR =
		{
			DEAD = "谢天谢地!",
			GENERIC = "比平常更有意义.",
			SLEEPING = "我应该保持距离.",
		},
		SPOILED_FOOD = "这是一团腐烂的食物.",
		STATUEHARP = "你的头怎么了?",
		STATUEMAXWELL = "它真的抓住了它的个性.",
		STEELWOOL = "粗糙的金属纤维.",
		STINGER = "看起来锋利!",
		STRAWHAT = "帽子挺漂亮的，虽然没我的帽子好看.",
		STUFFEDEGGPLANT = "我自己做的!",
		SUNKBOAT = "对我没有用处!",
		SWEATERVEST = "这件背心看起来很整洁.",
		REFLECTIVEVEST = "要融化了！邪恶的太阳!",
		HAWAIIANSHIRT = "这不安全!",
		TAFFY = "我自己做的!",
		TALLBIRD = "头以下全是腿......",
		TALLBIRDEGG = "它会孵化出来吗?",
		TALLBIRDEGG_COOKED = "美味又营养.",
		TALLBIRDEGG_CRACKED =
		{
			COLD = "好啊!",
			GENERIC = "看起来像是在孵化.",
			HOT = "鸡蛋会流汗吗?",
			LONG = "我觉得这需要一段时间……",
			SHORT = "它应该在任何时候孵化.",
		},
		TALLBIRDNEST =
		{
			GENERIC = "这是一个美味的鸡蛋!",
			PICKED = "鸟巢是空的.",
		},
		TEENBIRD =
		{
			GENERIC = "不是一种非常高的鸟.",
			HUNGRY = "幽幽子最好去找点吃的.",
			STARVING = "它看起来很危险.",
		},
		TELEBASE =	-- Duplicated
		{
			VALID = "它已经准备好了.",
			GEMS = "它需要更多的紫色宝石.",
		},
		GEMSOCKET = -- Duplicated
		{
			VALID = "看起来准备好了.",
			GEMS = "它需要一个宝石.",
		},
		TELEPORTATO_BASE =
		{
			ACTIVE = "有了这个，我一定能穿越时空!",
			GENERIC = "这似乎是另一个平行世界的连结!",
			LOCKED = "有一些东西不见了.",
			PARTIAL = "很快，我的发明就要完成了!",
		},
		TELEPORTATO_BOX = "这可能会控制整个宇宙的极性.",
		TELEPORTATO_CRANK = "足以应付最激烈的实验.",
		TELEPORTATO_POTATO = "这个金属马铃薯含有巨大而可怕的力量……",
		TELEPORTATO_RING = "一个能聚焦空间能量的环.",
		TELESTAFF = "它可以让我看到世界.",
		TENT = 
		{
			GENERIC = "我不睡觉的时候就会发疯.",
			BURNT = "没什么可睡的",
		},
		SIESTAHUT = 
		{
			GENERIC = "这是一个避暑的好地方.",
			BURNT = "现在它不会提供多少荫凉.",
		},
		TENTACLE = "这个看起来很危险.",
		TENTACLESPIKE = "尖尖的，黏糊糊的.",
		TENTACLESPOTS = "我想这是它的生殖器.",
		TENTACLE_PILLAR = "一根黏糊糊的杆子.",
		TENTACLE_PILLAR_ARM = "胳膊有点滑.",
		TENTACLE_GARDEN = "又一根黏糊糊的杆子.",
		TOPHAT = "帽子挺漂亮的，虽然没我的帽子好看",
		TORCH = "有些东西挡住了黑夜.",
		TRANSISTOR = "它呼呼作响.",
		TRAP = "我把它编织得很紧.",
		TRAP_TEETH = "这是个令人讨厌的惊喜.",
		TRAP_TEETH_MAXWELL = "我要避免踩到那个！",
		TREASURECHEST = 
		{
			GENERIC = "这是我的行李箱!",
			BURNT = "后备箱被截断了.",
		},
		TREASURECHEST_TRAP = "真方便!",
		TREECLUMP = "好像有人想阻止我去别的地方.",
		TRINKET_1 = "它们都融化在一起.", --Melty Marbles
		TRINKET_2 = "只是个廉价的复制品.", --Fake Kazoo
		TRINKET_3 = "这个结永远卡住了.", --Gord's Knot
		TRINKET_4 = "它一定是某种宗教物品.", --Gnome
		TRINKET_5 = "太小了，我不能逃出去.", --Tiny Rocketship
		TRINKET_6 = "它们的电力供应已经结束了.", --Frazzled Wires
		TRINKET_7 = "我没有时间玩游戏！", --Ball and Cup
		TRINKET_8 = "满足了我所有的浴缸需求", --Hardened Rubber Bung
		TRINKET_9 = "我自己更像个拉链人.", --Mismatched Buttons
		TRINKET_10 = "我希望在我需要这些东西之前离开这里.", --Second-hand Dentures
		TRINKET_11 = "它低声地向我耳语.", --Lying Robot
		TRINKET_12 = "我不知道该如何处理干燥的触手.", --Dessicated Tentacle
		TRINKET_13 = "它一定是某种宗教物品.", --Gnome (female)
		TRUNKVEST_SUMMER = "荒野休闲",
		TRUNKVEST_WINTER = "冬季生存装备.",
		TRUNK_COOKED = "比以前更有鼻音.",
		TRUNK_SUMMER = "一个轻盈的后备箱.",
		TRUNK_WINTER = "一个又厚又多毛的树干.",
		TUMBLEWEED = "谁知道那只滚草是怎么回事.",
		TURF_CARPETFLOOR = "这是令人惊讶的抓痕.",	-- Duplicated
		TURF_CHECKERFLOOR = "这些都很时髦.",	-- Duplicated
		TURF_DIRT = "一块地面.",	-- Duplicated
		TURF_FOREST = "一块地面.",	-- Duplicated
		TURF_GRASS = "一块地面.",	-- Duplicated
		TURF_MARSH = "一块地面.",	-- Duplicated
		TURF_ROAD = "Hastily cobbled stones.",	-- Duplicated
		TURF_ROCKY = "一块地面.",	-- Duplicated
		TURF_SAVANNA = "一块地面.",	-- Duplicated
		TURF_WOODFLOOR = "这是地板.",	-- Duplicated
		TURKEYDINNER = "嗯.",
		TWIGS = "那是一堆小树枝",
		UMBRELLA = "这至少能让我的头发保持干燥.",
		GRASS_UMBRELLA = "这至少能使我的头发适度干燥.",
		UNIMPLEMENTED = "它看起来不太好!它可能是危险的.",
		WAFFLES = "我自己做的!",
		WALL_HAY = 
		{	
			GENERIC = "嗯，我想这是必须的.",
			BURNT = "那根本不行.",
		},
		WALL_HAY_ITEM = "这似乎是个坏主意.",
		WALL_STONE = "那是一堵很好的墙.",
		WALL_STONE_ITEM = "它们让我觉得很安全.",
		WALL_RUINS = "一堵古老的墙.",
		WALL_RUINS_ITEM = "一段坚实的历史.",
		WALL_WOOD = 
		{
			GENERIC = "尖尖的!",
			BURNT = "烧焦了!",
		},
		WALL_WOOD_ITEM = "木头守护",
		WALL_MOONROCK = "光滑!",
		WALL_MOONROCK_ITEM = "非常轻，但却异常坚硬.",
		WALRUS = "海象是天敌.",
		WALRUSHAT = "上面覆盖着海象毛.",
		WALRUS_CAMP =
		{
			EMPTY = "好像有人在这里露营.",
			GENERIC = "里面看起来温暖舒适.",
		},
		WALRUS_TUSK = "我相信我最终会找到它的用处的.",
		WARG = "你可能是一只有能力的大狗狗.",
		WASPHIVE = "我觉得那些蜜蜂都疯了.",
		WATERMELON = "黏黏的糖.",
		WATERMELON_COOKED = "多汁温暖的.",
		WATERMELONHAT = "让果汁顺着你的脸流下来.",
		WETGOOP = "我自己做的!",
		WINTERHAT = "有了它就不怕冬天啦~",
		WINTEROMETER = 
		{
			GENERIC = "我是一个科学家.",
			BURNT = "它的测量周期已经结束.",
		},
		WORMHOLE =
		{
			GENERIC = "为了找到更多好吃的！",
			OPEN = "看起来我要被吃了.....",
		},
		WORMHOLE_LIMITED = "那东西看起来比平时更糟.",
		ACCOMPLISHMENT_SHRINE = "我想用它，我想让全世界都知道我做了什么.",        
		LIVINGTREE = "它在看着我吗?",
		ICESTAFF = "触摸起来很冷.",
		REVIVER = "这颗跳动的心将会使一个幽灵复活！",
		LIFEINJECTOR = "嘘!",
		SKELETON_PLAYER =
		{
			MALE = "%s 因为 %s凋零了",
			FEMALE = "%s 因为 %s凋零了",
			ROBOT = "%s 因为 %s凋零了",
			DEFAULT = "%s 因为 %s凋零了",
		},
		HUMANMEAT = "我要在哪里画线?",
		HUMANMEAT_COOKED = "煮得又好又嫩，但还是灰色的.",
		HUMANMEAT_DRIED = "它不是来自于人类，对吧？",
		MOONROCKNUGGET = "那块石头来自月球，纯狐又在攻打月都了吗？",
	},
	DESCRIBE_GENERIC = "这是一件…事情.",
	DESCRIBE_TOODARK = "天太黑了，看不见!",
	DESCRIBE_SMOLDERING = "那东西快着火了！",
	EAT_FOOD =
	{
		TALLBIRDEGG_CRACKED = "嗯，像鸟嘴.",
	},
}
