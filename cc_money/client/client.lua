AddEventHandler('playerSpawned', function()
    TriggerServerEvent('cc_money:generate')
end)

RegisterCommand('testmoney', function()
    TriggerServerEvent('cc_money:show')
end)

CreateThread(function()
    while true do
        Wait(600000)
        TriggerServerEvent('cc_money:paycheck')
    end
end)

local currentBalance = 0 

RegisterNetEvent('cc_money:updateBalance')
AddEventHandler('cc_money:updateBalance', function(balance)
    currentBalance = balance
end)

RegisterCommand('pay', function(source, args)
    if tonumber(#args) < 2 then
        TriggerEvent('chat:addMessage', {
            args = {'^1^*[Error]^7^r Usage: /pay [playerId] [amount]'}
        })
        return
    end
    local targetPlayerId = tonumber(args[1])
    local amount = tonumber(args[2])
    if not targetPlayerId or not amount or amount <= 0 then
        TriggerEvent('chat:addMessage', {
            args = {'^1^*[Error]^7^r Invalid input'}
        })
        return
    end
    TriggerServerEvent('cc_money:payPlayer', targetPlayerId, amount)
end)

CreateThread(function()
    while true do
        TriggerServerEvent('cc_money:retrieve')
        Wait(1000)
        SendNUIMessage({
            type = 'balance',
            balance = currentBalance
        })
        Wait(5000)
    end
end)

