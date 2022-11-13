fx_version 'bodacious'

game 'gta5'

author 'Nawax'

version '1.0'

description 'Drugs for ESX'

server_scripts {
  'server/main.lua',
  'config.lua',
}

client_scripts {
	--RageUi
	"RageUI/RMenu.lua",
	"RageUI/menu/RageUI.lua",
	"RageUI/menu/Menu.lua",
	"RageUI/menu/MenuController.lua",
	"RageUI/components/*.lua",
	"RageUI/menu/elements/*.lua",
	"RageUI/menu/items/*.lua",
	"RageUI/menu/panels/*.lua",
	"RageUI/menu/windows/*.lua",
	--Script
	'config.lua',
	'client/*.lua',
}
