fx_version 'cerulean'
game 'gta5'

name "zF5V2"
description "Personal Menu For FIVEM"
author "Sayzx"
version "2"

shared_scripts {
	'shared/*.lua'
}

client_scripts {
	"RageUI/RMenu.lua",
    "RageUI/menu/RageUI.lua",
    "RageUI/menu/Menu.lua",
    "RageUI/menu/MenuController.lua",
    "RageUI/components/*.lua",
    "RageUI/menu/elements/*.lua",
    "RageUI/menu/items/*.lua",
    "RageUI/menu/panels/*.lua",
    "RageUI/menu/windows/*.lua",
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}
