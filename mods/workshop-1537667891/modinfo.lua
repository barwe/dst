
name = "Bamboo"
description = "动物拟人系列 panda"
author = "酸酸乳&酸酸"
version = "1.2.8" 
forumthread = ""
api_version = 10
dst_compatible = true 

dont_starve_compatible = false 
reign_of_giants_compatible = false 
all_clients_require_mod = true 
icon_atlas = "modicon.xml"
icon = "modicon.tex"

server_filter_tags = { 
"character",
}

configuration_options = {
	{
        name = "Language",
        label = "Language",
        options =	{
						{description = "English", data = false},
						{description = "中文", data = true},
					},
		default = true,
    },
}