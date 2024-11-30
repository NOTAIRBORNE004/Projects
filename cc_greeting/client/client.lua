
AddEventHandler('playerSpawned', function()
    TriggerServerEvent('cc_greeting:generate')
end)

AddEventHandler('playerSpawned', function()
    TriggerServerEvent('cc_greeting:show')
end)

RegisterCommand('testgreeting', function()
    TriggerServerEvent('cc_greeting:show')
end)