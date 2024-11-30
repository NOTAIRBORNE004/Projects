RegisterCommand('tp', function(source, args)
    local playerPed = PlayerPedId()
    local sandy = vector3(1791.81, 3272.73, 42.24)
    local lsia = vector3(-1012.12, -2983.04, 13.95)
    local grapeseed = vector3(1987.12, 4650.41, 41.04)
    local pelato = vector3(-449.26, 6031.08, 31.34)
    local destination = args[1]
    destination = string.lower(destination)
    if destination == 'sandy' then
        SetEntityCoords(playerPed, sandy.x, sandy.y, sandy.z, false, false, false, true)
        SetEntityHeading(playerPed, 350.71)
        SetGameplayCamRelativeHeading(350.71)
    elseif destination == 'lsia' then
        SetEntityCoords(playerPed, lsia.x, lsia.y, lsia.z, false, false, false, true)
        SetEntityHeading(playerPed, 59.47)
        SetGameplayCamRelativeHeading(59.47)
    elseif destination == 'grapeseed' then
        SetEntityCoords(playerPed, grapeseed.x, grapeseed.y, grapeseed.z, false, false, false, true)
        SetEntityHeading(playerPed, 243.12)
        SetGameplayCamRelativeHeading(243.12)
    elseif destination == 'pelato' then
        SetEntityCoords(playerPed, pelato.x, pelato.y, pelato.z, false, false, false, true)
        SetEntityHeading(playerPed, 300.01)
        SetGameplayCamRelativeHeading(300.01)
    elseif destination == '?' then
        TriggerEvent('chat:addMessage', { args = {'^2^*[Help]^7^r Valid Destinations are Sandy, LSIA, Grapeseed, or Pelato'}})
    else
        TriggerEvent('chat:addMessage', { args = {'^1^*[Error]^7^r Invalid location. Use "Sandy", "LSIA", "Grapeseed", or "Pelato".'} })
    end
end)

RegisterCommand('goto', function(_, args)
    local targetId = tonumber(args[1])
    if not targetId then
        TriggerEvent('chat:addMessage', {
            args = {'^1^*[Error]^7^r Invalid Player ID'}
        })
        return
    end
    TriggerServerEvent('cc_quickTp:goto', targetId)
end)

RegisterCommand('summon', function(_, args)
    local targetId = args[1]
    if not targetId then
        TriggerEvent('chat:addmessage', {
            args = {'^1^*[Error]^7^r Invalid Player ID'}
        })
        return
    end
    TriggerServerEvent('cc_quickTp:summon', targetId)
end)


RegisterNetEvent('cc_quickTp:teleport', function(targetCoordinates)
    local playerPed = PlayerPedId()
    SetEntityCoords(playerPed, targetCoordinates)
end)

