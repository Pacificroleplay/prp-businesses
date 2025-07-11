fx_version 'cerulean'
game 'gta5'

lua54 'yes'

dependency 'ox_lib'

client_scripts {
    '@ox_lib/init.lua',
    'client/*'
}

shared_scripts {
    'config/*'
}

server_scripts {
    'server/*'
}
