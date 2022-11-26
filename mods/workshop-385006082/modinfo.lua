
name = "DST Path Lights"
description = "lights"
author = "Afro1967"
version = "1.6"

forumthread = ""

priority = 0.346962879
dst_compatible = true
all_clients_require_mod = true
client_only_mod = false

api_version = 10

icon_atlas = "path_light.xml"
icon = "path_light.tex"

configuration_options =
{
	{
		name = "path_lightrecipe",
		label = "Recipe",
        hover = "Here's where you change the recipe",
		options =
	{
		{description = "Easy", data = "easy", hover = "1 Rock 3 Twigs 1 firefly and 1 Rope"},
		{description = "Normal", data = "normal", hover = "1 Moon Rock 3 Twigs 1 firefly and 1 Rope"},
		{description = "Hard", data = "hard", hover = "2 Moon Rocks 3 Twigs 1 firefly and 2 Rope"},
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
		name = "light_color",
		label = "Light Color",
        hover = "Here we change the light color",
		options =
	{
		{description = "Blue", data = "color1"},
		{description = "Red", data = "color2"},
		{description = "Green", data = "color3"},
		{description = "White", data = "color4"},
	},
		default = "color1",
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
		name = "FueledLights",
		label = "Fueled ?",
        hover = "Choose to make the Path Lights use fuel or not",
		options =
	{
		{description = "No", data = "no", hover = "No fuel will be used"},
		{description = "Yes", data = "yes", hover = "Fuel will be used"},
	},
		default = "no",
	},

}