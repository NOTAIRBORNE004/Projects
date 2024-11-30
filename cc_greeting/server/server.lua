RegisterCommand('setgreeting', function(source, args, rawCommand)
    local identifier = GetPlayerIdentifierByType(source, 'license')
    local greeting = string.sub(rawCommand, 13)
    MySQL.insert('INSERT INTO greetings (identifier, greeting) VALUES (?, ?) ON DUPLICATE KEY UPDATE greeting = ?', {
        identifier,
        greeting,
        greeting,
    }, function()
    TriggerClientEvent('chat:addMessage', source, {
        args = {'^2^*[Info]^7^r Greeting Updated'}
    })
    end)
end)

RegisterNetEvent('cc_greeting:show', function()
    local playerId = source
    local identifier = GetPlayerIdentifierByType(playerId, 'license')
    MySQL.scalar('SELECT greeting FROM greetings WHERE identifier = ?', { identifier }, function(greeting)
        if not greeting then
            local defaultGreeting = "Welcome to the NOTAIRBORNE Test Server." 
            MySQL.insert('INSERT INTO greetings (identifier, greeting) VALUES (?, ?)', {
                identifier, defaultGreeting
            }, function()
                TriggerClientEvent('chat:addMessage', playerId, {
                    args = { '^2^*[Greeting]^7^r ' .. defaultGreeting }
                })
            end)
        else
            TriggerClientEvent('chat:addMessage', playerId, {
                args = { '^2^*[Greeting]^7^r ' .. greeting }
            })
        end
    end)
end)
