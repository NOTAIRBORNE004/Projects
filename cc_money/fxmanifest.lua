fx_version 'bodacious'
game 'gta5'
lua54 'yes'

client_scripts{
    'client/client.lua',
}

server_scripts{
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua',
}

ui_page 'nui/nui.html'

files {
    'nui/nui.html',
    'nui/style.css',
    'nui/script.js',
}