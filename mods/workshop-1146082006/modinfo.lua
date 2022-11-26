name                        = "Gears Making Machine"
description                 = "it is now easier to own gears."
author                      = "BahadirBY"
version                     = "1.0.1"
forumthread                 = "BahadirBY-Gears Making Machine"
api_version					= 10
dst_compatible 				= true
client_only_mod 			= false
all_clients_require_mod 	= true

icon_atlas = "modicon.xml"
icon = "modicon.tex"

configuration_options =
{
    {
		name = "config_fuel_max",
		label = "Fuel Max",
		options =	{
            {description = "30", data = 30},
            {description = "60", data = 60},
			{description = "90 (default)", data = 90},
			{description = "120", data = 120},
            {description = "150", data = 150},
		},
		default = 90,
	},
    {
		name = "config_spawn_time",
		label = "Spawn Time",
		options =	{
            {description = "15", data = 15},
			{description = "30 (default)", data = 30},
			{description = "45", data = 45},
		},
		default = 30,
	},
    {
		name = "config_recipe",
		label = "Crafting Recipe",
		options =	{
            {description = "Normal", data = 1},
			{description = "Hard", data = 2},
		},
		default = 1,
	}
}