RegisterCommand('time', function(source, args)
    local target = string.lower(args[1])
    if target == 'day' then
        TriggerClientEvent('cc_environment:time-day', -1)
    elseif target == 'night' then
        TriggerClientEvent('cc_environment:time-night', -1) 
    elseif target == 'morning' then
        TriggerClientEvent('cc_environment:time-morning', -1)
    elseif target == 'evening' then
        TriggerClientEvent('cc_environment:time-evening', -1) 
    elseif target == 'noon' then
        TriggerClientEvent('cc_environment:time-noon', -1) 
    else
        TriggerClientEvent('chat:addMessage', source, {
            args = {'^1^*[Error]^7^r Invalid time argument. (Day, Night, Morning, Evening, Noon).'}
        })
        return
    end
    TriggerClientEvent('chat:addMessage', source, {
        args = {'^2^*[Info]^7^r Time has been set to ' .. target .. '.'}
    })
end)

RegisterCommand('weather', function(source, args)
    local target = string.lower(args[1])
    if target == 'clear' then
        TriggerClientEvent('cc_environment:weather-clear', -1)
    elseif target == 'sunny' then
        TriggerClientEvent('cc_environment:weather-extrasunny', -1)
    elseif target == 'cloudy' then
        TriggerClientEvent('cc_environment:weather-cloudy', -1)

    elseif target == 'overcast' then
        TriggerClientEvent('cc_environment:weather-overcast', -1)

    elseif target == 'rain' then
        TriggerClientEvent('cc_environment:weather-rain', -1)

    elseif target == 'clearing' then
        TriggerClientEvent('cc_environment:weather-clearing', -1)

    elseif target == 'thunderstorm' then
        TriggerClientEvent('cc_environment:weather-thunderstorm', -1)

    elseif target == 'smog' then
        TriggerClientEvent('cc_environment:weather-smog', -1)

    elseif target == 'foggy' then
        TriggerClientEvent('cc_environment:weather-foggy', -1)

    elseif target == 'xmas' then
        TriggerClientEvent('cc_environment:weather-xmas', -1)

    elseif target == 'snow' then
        TriggerClientEvent('cc_environment:weather-snow', -1)

    elseif target == 'snowlight' then
        TriggerClientEvent('cc_environment:weather-snowlight', -1)

    elseif target == 'blizzard' then
        TriggerClientEvent('cc_environment:weather-blizzard', -1)

    elseif target == 'halloween' then
        TriggerClientEvent('cc_environment:weather-halloween', -1)

    elseif target == 'neutral' then
        TriggerClientEvent('cc_environment:weather-neutral', -1)
    
    elseif target == 'help' then
        TriggerClientEvent('chat:addMessage', source, {
            args = {'^2^*[Info]^7^r Weather Choices: Clear, Sunny, Cloudy, Overcast, Rain, Clearing, Thunderstorm, Smog, Foggy, Xmas, Snow, SnowLight, Blizzard, Halloween, or Neutral'}
        })
        return

    else                                    
        TriggerClientEvent('chat:addMessage', source, {
            args = {'^1^*[Error]^7^r ' .. target .. ' is an invalid input. Type "/weather help" to view options'}
        })
        return

    end
    TriggerClientEvent('chat:addMessage', source, {
        args = {'^2^*[Info]^7^r Weather has been set to ' .. target .. '.'}
    })
end)
