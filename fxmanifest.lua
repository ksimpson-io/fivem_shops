fx_version "cerulean"
use_experimental_fxv2_oal "yes"
lua54 "yes"
game "gta5"

name "frudy_shops"
author "4rudy"
version "1.5.0"
description "A modular shops system for FiveM"

shared_scripts {
    "@ox_lib/init.lua",
    "@mc9-lib/import.lua",
    "shared/config.lua",
    "shared/shopcfg.lua",
}

server_scripts {
    "server/server.lua",
}

client_scripts {
    "@PolyZone/client.lua",
    "@PolyZone/BoxZone.lua",

    "client/main.lua",
    "client/shop.lua",
}

lua54 'yes'

ui_page 'ui/index.html'
files {
	'ui/**.*',
}
