--The name of the mod displayed in the 'mods' screen.
name = "Complete Your Map"

--A description of the mod.
description = "Displays additional info on the map"

--Who wrote this awesome mod?
author = "LinkedFluuuush"

--A version number so you can ask people if they are running an old version of your mod.
version = "3.8"

--This lets other players know if your mod is out of date.  This typically needs to be updated every time there's a new game update.
api_version = 10

icon = "modicon.tex"
icon_atlas = "modicon.xml"

dst_compatible = true
client_only_mod = true
all_clients_require_mod = false

forumthread = ""

configuration_options =
{	
	{name = "blank", label = "Animal display", options = { {description = "____________________", data = 0}, }, default = 0 },

--	{name = "blank", label = "____________________", options = { {description = "____________________", data = 0}, }, default = 0 },
	
--	{name = "blank", label = "____________________", options = { {description = "____________________", data = 0}, }, default = 0 },
	
--	{name = "blank", label = "____________________", options = { {description = "____________________", data = 0}, }, default = 0 },
	

	{name = "Disp_rabbithole", label = "Display rabbit holes", hover = "Rabbit holes",  options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },
	
	{name = "Disp_rabbit", label = "Display rabbits", hover = "Rabbits",  options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "N", },

	{name = "Disp_bunnyman", label = "Display bunnymen", hover = "Bunnyman",  options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "N", },

	{name = "Disp_molehill", label = "Display mole burrows", hover = "Mole burrows", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },
	
	{name = "Disp_mole", label = "Display moles", hover = "Moles",  options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "N", },
	
	{name = "Disp_catcoons", label = "Display catcoons", hover = "Catcoons",  options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "N", },
	
	{name = "Disp_monkey", label = "Display splumonkeys", hover = "Splumonkey", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "N", },
	
	{name = "Disp_penguin", label = "Display pengulls", hover = "Pengull", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "N", },
	
	{name = "Disp_perd", label = "Display gobblers", hover = "Gobbler", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "N", },
	
	{name = "Disp_slurtle", label = "Display sl/nurtles", hover = "Slurtles and snurtles", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "N", },

	{name = "Disp_pigman", label = "Display pigmen", hover = "Pigmen, Pig guardians",  options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "N", },
	
	{name = "Disp_beefalo", label = "Display beefalos", hover = "Beefalos and baby beefalos", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },

	{name = "Disp_lightninggoat", label = "Display volt goats", hover = "Volt goats", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },
	
	{name = "Disp_bird", label = "Display birds", hover = "Crows, Robin and Winter Robin", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "N", },
	
	{name = "Disp_bee", label = "Display bees", hover = "Bee, Killerbee", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "N", },
	
	{name = "Disp_butterfly", label = "Display butterfly", hover = "Butterfly", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "N", },

	{name = "Disp_tracks", label = "Display animal tracks", hover = "Dirt piles and animal tracks", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },

	{name = "Disp_koalefant", label = "Display koalefants", hover = "All koalefants and warg", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },
	
	{name = "Disp_krampus", label = "Display krampus", hover = "Krampus", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },

--	{name = "blank", label = "", options = { {description = "", data = 0}, }, default = 0 },

	
--	{name = "blank", label = "", options = { {description = "", data = 0}, }, default = 0 },
	
	{name = "blank", label = "", options = { {description = "", data = 0}, }, default = 0 },

	{name = "blank", label = "Monster display", options = { {description = "____________________", data = 0}, }, default = 0 },

--	{name = "blank", label = "____________________", options = { {description = "____________________", data = 0}, }, default = 0 },
	
--	{name = "blank", label = "____________________", options = { {description = "____________________", data = 0}, }, default = 0 },
	
--	{name = "blank", label = "____________________", options = { {description = "____________________", data = 0}, }, default = 0 },

	{name = "Disp_giants", label = "Display giants", hover = "Bearger, Deerclops, Dragonfly, Moose/Goose, Moose/Goose's egg, Mossling", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },
	
	{name = "Disp_treeguard", label = "Display treeguards", hover = "Treeguard, Birchnutter", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },

	{name = "Disp_clockwork", label = "Display clockwork monsters", hover = "Clockwork rook, bishop, knight, nightmare rook, bishop, knight", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },
	
	{name = "Disp_nightmare", label = "Display nightmare monsters", hover = "Crawling horror and terrorbeak", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },

	{name = "Disp_hound", label = "Display hounds", hover = "Hounds, fire hounds and ice hounds", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },
	
	{name = "Disp_spider", label = "Display spiders", hover = "Spider, spider warrior, spider dropper, spider spitter, cave spider", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "N", },
	
	{name = "Disp_spiderqueen", label = "Display Spider Queen", hover = "Spider Queen", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },
	
	{name = "Disp_tallbird", label = "Display tallbirds", hover = "Tallbird, teenbird and smallbird", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },

	{name = "Disp_tentacle", label = "Display tentacles", hover = "Tentacles and tentacle pillars", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },

	{name = "Disp_walrus", label = "Display MacTusk", hover = "MacTusk and Wee MacTusk", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },

	{name = "Disp_bat", label = "Display batislisks", hover = "Batilisk", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "N", },

	{name = "Disp_minotaur", label = "Display labyrinth monsters", hover = "Ancient Guardian, Rock Lobsters", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "N", },

	{name = "Disp_slurper", label = "Display slurpers", hover = "Slurper", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "N", },

	{name = "Disp_worm", label = "Display cave worms", hover = "Cave worm", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "N", },

	{name = "Disp_eyeplant", label = "Display eyeplants", hover = "Eyeplant", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "N", },

	{name = "Disp_frog", label = "Display frogs", hover = "Frog", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "N", },

	{name = "Disp_mosquito", label = "Display mosquitos", hover = "Mosquito", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "N", },

	{name = "Disp_merm", label = "Display merms", hover = "Merm", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "N", },

	{name = "Disp_ghost", label = "Display ghosts", hover = "Ghost", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "N", },
	
--	{name = "blank", label = "", options = { {description = "", data = 0}, }, default = 0 },
	
	
--	{name = "blank", label = "", options = { {description = "", data = 0}, }, default = 0 },
	
	{name = "blank", label = "", options = { {description = "", data = 0}, }, default = 0 },

	{name = "blank", label = "Vegetables display", options = { {description = "____________________", data = 0}, }, default = 0 },

--	{name = "blank", label = "____________________", options = { {description = "____________________", data = 0}, }, default = 0 },
	
--	{name = "blank", label = "____________________", options = { {description = "____________________", data = 0}, }, default = 0 },
	
--	{name = "blank", label = "____________________", options = { {description = "____________________", data = 0}, }, default = 0 },

	{name = "Disp_mushroom", label = "Display mushrooms", hover = "Red mushrooms, green mushrooms, blue Mushrooms", options =	{{description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },

	{name = "Disp_mandrake", label = "Display mandrake", hover = "Mandrake", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },

	{name = "Disp_carrot", label = "Display planted carrots", hover = "Planted carrots", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },
	
--	{name = "blank", label = "", options = { {description = "", data = 0}, }, default = 0 },
	
	
--	{name = "blank", label = "", options = { {description = "", data = 0}, }, default = 0 },
	
	{name = "blank", label = "", options = { {description = "", data = 0}, }, default = 0 },

	{name = "blank", label = "Other plants display", options = { {description = "____________________", data = 0}, }, default = 0 },

--	{name = "blank", label = "____________________", options = { {description = "____________________", data = 0}, }, default = 0 },
	
--	{name = "blank", label = "____________________", options = { {description = "____________________", data = 0}, }, default = 0 },
	
--	{name = "blank", label = "____________________", options = { {description = "____________________", data = 0}, }, default = 0 },

	
	{name = "Disp_flower_cave", label = "Display light flowers", hover = "Light flowers level 2 and 3", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },

	{name = "Disp_marsh_bush", label = "Display spiky bushes", hover = "Spiky bushes", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },
	
	
--	{name = "blank", label = "", options = { {description = "", data = 0}, }, default = 0 },
	
	{name = "blank", label = "", options = { {description = "", data = 0}, }, default = 0 },

	{name = "blank", label = "Miscellaneous display", options = { {description = "____________________", data = 0}, }, default = 0 },

--	{name = "blank", label = "____________________", options = { {description = "____________________", data = 0}, }, default = 0 },
	
--	{name = "blank", label = "____________________", options = { {description = "____________________", data = 0}, }, default = 0 },
	
--	{name = "blank", label = "____________________", options = { {description = "____________________", data = 0}, }, default = 0 },

	
	{name = "Disp_rock2", label = "Display gold stones", hover = "Gold stones", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },

	{name = "Disp_chester_eyebone", label = "Display Chester's eyebone", hover = "Chester's eyebone", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },

	{name = "Disp_bone", label = "Display bones", hover = "Bones, skeletons, player skeletons and crispy skeletons", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },

	{name = "Disp_flint", label = "Display flints", hover = "Flints", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },

	{name = "Disp_waxwelljournal", label = "Display the codex umbra", hover = "Codex umbra", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },

	{name = "Disp_teleportato", label = "Display \"things\"", hover = "Box thing, crank thing, ring thing and metal potato thing", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },
	
	{name = "Disp_altar", label = "Display Ancient psuedoscience stations", hover = "Ancient and broken pseudoscience stations", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },
	
	{name = "Disp_wall", label = "Display walls", hover = "Hay walls, wood walls, stone walls, moonrock walls and thulecite walls", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },
	
	{name = "Disp_fireflies", label = "Display fireflies", hover = "Fireflies", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },
	
	{name = "Disp_pighead", label = "Display pig heads", hover = "Pig Heads", options =	{ {description = "No", data = "N"}, {description = "Yes", data = "Y"}, }, default = "Y", },

--	{name = "blank", label = "", options = { {description = "", data = 0}, }, default = 0 },
}