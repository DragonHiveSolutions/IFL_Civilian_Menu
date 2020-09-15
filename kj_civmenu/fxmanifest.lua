-- Resource Metadata
fx_version 'bodacious'
games { 'gta5' }

author 'KJ Studios'
description 'A menu made to assist civilians.'
version '1.0.0'

-- shared_script ''

client_scripts {
    'functions.lua',
    'warmenu.lua',
    'config.lua',
    'proplist.lua',
    'obs.lua',
    'search.lua',
    'props.lua',
    'client.lua'
}

server_scripts {
    'sv_obs.lua',
    'sv_search.lua'
}