
function GetClosestVehicle()
    local distanceLimit = 5.0
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)
    local closestVehicle = nil
    local closestDistance = 1000 
    local handle, vehicle = FindFirstVehicle()
    local success
    repeat
        if vehicle ~= nil and DoesEntityExist(vehicle) then
            local vehiclePos = GetEntityCoords(vehicle)
            local distance = #(playerPos - vehiclePos) 

            if distance < closestDistance and distance <= distanceLimit then
                closestDistance = distance
                closestVehicle = vehicle
            end
        end
        success, vehicle = FindNextVehicle(handle) 
    until not success
    EndFindVehicle(handle) 

    return closestVehicle
end

function DeleteClosestVehicle()
    local closestVehicle = GetClosestVehicle()

    if closestVehicle and DoesEntityExist(closestVehicle) then
        DeleteEntity(closestVehicle) 
    end
end

RegisterCommand('dv', function()
    DeleteClosestVehicle()
end)