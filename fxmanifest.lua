fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Marolli'
description 'Skrypt na robotę wędkarza! https://marolliscripts.pl/'

client_scripts {
    'shared/config.lua',
    'client/*.lua'
}

server_scripts {
    'shared/config.lua',
    'server/*.lua'
}

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua'
}
