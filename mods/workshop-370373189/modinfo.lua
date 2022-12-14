
name = "DST Advanced Farming"
description = "We won't stave this winter!"
author = "Afro1967"
version = "3.4"

forumthread = ""
priority = 0.346962880
dst_compatible = true
all_clients_require_mod = true
client_only_mod = false

api_version = 10

icon_atlas = "g_house.xml"
icon = "g_house.tex"

configuration_options =
{
	{
		name = "greenhouserecipe",
		label = "Advanced Farm Recipe",
        hover = "Here's where you to change the Advanced Farm recipe",
		options =
	{
		{description = "Easy", data = "easy", hover = "3 Boards 3 Silk and 1 Rope"},
		{description = "Normal", data = "normal", hover = "3 Boards 3 Silk 2 Rope and 10 Poop"},
		{description = "Hard", data = "hard", hover = "5 Boards 6 Silk 4 Rope and 10 Poop"},
	},
		default = "easy",
	},

	{
		name = "",
		label = "",
		options =
	{
		{description = "", data = 0},
	},
		default = 0,
	},

	{
		name = "b_seeds",
		label = "Enable Banana Seeds ?",
        hover = "Choose to enable or disable the crafting of Hybrid Banana Seeds",
		options =
	{
		{description = "No", data = "no", hover = "Hybrid Banana Seeds will not be craftable"},
		{description = "Yes", data = "yes", hover = "Hybrid Banana Seeds will be craftable"},
	},
		default = "yes",
	},

	{
		name = "",
		label = "",
		options =
	{
		{description = "", data = 0},
	},
		default = 0,
	},

	{
		name = "W_Grow",
		label = "Bananas In Winter ?",
        hover = "Choose to enable or disable if your Hybrid Banana Trees grow fruit in winter",
		options =
	{
		{description = "No", data = "no", hover = "Hybrid Banana Trees will not grow fruit in winter"},
		{description = "Yes", data = "yes", hover = "Hybrid Banana Trees will grow fruit in winter"},
	},
		default = "yes",
	},
}