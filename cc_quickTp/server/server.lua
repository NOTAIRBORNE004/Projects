RegisterNetEvent('cc_quickTp:goto', function(targetId)
    local playerId = source
    if not targetId or not GetPlayerPed(targetId) or not DoesEntityExist(GetPlayerPed(targetId)) or targetId == 0 then
        TriggerClientEvent('chat:addMessage', playerId, {
            args = {'^1^*[Error] Player ID ' .. (targetId or 'Invalid ID') .. ' is invalid.'}
        })
        return
    end
    local targetPed = GetPlayerPed(targetId)
    local targetPos = GetEntityCoords(targetPed)
    TriggerClientEvent('cc_quickTp:teleport', playerId, targetPos)
end)

RegisterNetEvent('cc_quickTp:summon', function(targetId)
    local playerId = source
    local playerPed = GetPlayerPed(playerId)
    local playerPos = GetEntityCoords(playerPed)
    TriggerClientEvent('cc_quickTp:teleport', targetId, playerPos)
end)