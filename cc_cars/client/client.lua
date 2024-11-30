RegisterCommand('spawn', function(source, args)
    local vehicleName = args[1] or 'adder'

 
    if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
        TriggerEvent('chat:addMessage', {
            args = { '^1 ^* [ERROR] ' .. vehicleName .. ' is an invalid input.' }
        })
        return
    end


    RequestModel(vehicleName)
    while not HasModelLoaded(vehicleName) do
        Wait(10)
    end


    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
    local heading = GetEntityHeading(playerPed)

    local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z, heading, true, false)
    SetPedIntoVehicle(playerPed, vehicle, -1)

    SetModelAsNoLongerNeeded(vehicleName)
end)
