local toggle = false
local speedType = "mph"

AddEventHandler('playerSpawned', function()
    toggle = false
end)

RegisterCommand('speedtoggle', function()
    if toggle == false then
        toggle = true
        CreateThread(function()
            while toggle do
                Wait(50)
                local playerPed = PlayerPedId()
                if IsPedInAnyVehicle(playerPed, false) then
                    local vehicle = GetVehiclePedIsUsing(playerPed)
                    local rawSpeed = GetEntitySpeed(vehicle)
                    local speed = speedType == "mph" and rawSpeed * 2.23694 or rawSpeed * 3.6
                    SendNUIMessage({
                        type = 'speed',
                        speed = speed,
                        speedType = speedType
                    })
                else
                    SendNUIMessage({
                        type = 'hideSpeedo'
                    })
                end
            end
        end)
    else
        toggle = false
        SendNUIMessage({
            type = 'hideSpeedo'
        })
    end
end)

RegisterCommand('speedtype', function()
    if speedType == "mph" then
        speedType = "kmph"
    else
        speedType = "mph"
    end
    TriggerClientEvent('chat:addMessage', {
        args = {"^2^*[Info]^7^r Speedometer Unit Type is Now " .. string.upper(speedType) .. ''}
    })
end)
