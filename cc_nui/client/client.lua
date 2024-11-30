CreateThread(function()
    while true do
        Wait(50)
        local playerId = PlayerPedId()
        local playerCoords = GetEntityCoords(playerId)
        local playerHeading = GetEntityHeading(playerId)
        SendNUIMessage({
            type = 'position',
            x = playerCoords.x,
            y = playerCoords.y,
            z = playerCoords.z,
            heading = playerHeading,
        })
    end
end)

CreateThread(function()
    while true do
        Wait(1000)
        SendNUIMessage({
            type = 'ping',
        })
    end
end)
RegisterNUICallback('pong', function(data, cb)
    print('Got pong, foo value is', data.foo)
    cb({
        acceptedPong = true,
    })
end)