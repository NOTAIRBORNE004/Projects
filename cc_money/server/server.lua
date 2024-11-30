RegisterNetEvent('cc_money:generate', function()
    local playerId = source
    local identifier = GetPlayerIdentifierByType(playerId, 'license')
    MySQL.scalar('SELECT money FROM money WHERE identifier = ?', { identifier }, function(money)
        if not money then
            local startMoney = 25000 
            MySQL.insert('INSERT INTO money (identifier, money) VALUES (?, ?)', {
                identifier, 
                startMoney
            })
        else
            return
        end
    end)
end)

RegisterNetEvent('cc_money:show', function()
    local playerId = source
    local identifier = GetPlayerIdentifierByType(playerId, 'license')
    MySQL.scalar('SELECT money FROM money WHERE identifier = ?', { identifier }, function(money)
        if not money then
            TriggerClientEvent('chat:addMessage', playerId, {
                args = {'^1^*[Error]^7 ^r No Money Value Found - Contact Owner'}
            })
            return
        else
            TriggerClientEvent('chat:addMessage', playerId, {
                args = {'^2^*$^7^r' .. money .. ''}
            })
        end
    end)
end)

RegisterNetEvent('cc_money:paycheck', function()
    local playerId = source
    local identifier = GetPlayerIdentifierByType(playerId, 'license')
    MySQL.scalar('SELECT money FROM money WHERE identifier = ?', { identifier }, function(money)
        if not money then
            TriggerClientEvent('chat:addMessage', playerId, {
                args = { '^1^*[Error]^7^r No Money Value Found - Contact Owner' }
            })
            return
        end
        local newMoney = money + 1500
        MySQL.execute('INSERT INTO money (identifier, money) VALUES (?, ?) ON DUPLICATE KEY UPDATE money = ?', {
            identifier,
            newMoney,
            newMoney
        }, function()
            TriggerClientEvent('chat:addMessage', playerId, {
                args = { '^2^*[Info]^7^r Paycheck received, your balance is now ^2^*$^7^r' .. newMoney }
            })
        end)
    end)
end)

RegisterCommand('+setmoney', function(source, args)
    if not args[1] then
        TriggerClientEvent('chat:addMessage', source, {
            args = { '^1^*[Error]^7^r You must provide an amount!' }
        })
        return
    end
    local identifier = GetPlayerIdentifierByType(source, 'license')
    local money = tonumber(args[1])
    if not money or money < 0 then
        TriggerClientEvent('chat:addMessage', source, {
            args = { '^1^*[Error]^7^r Invalid amount!' }
        })
        return
    end
    MySQL.insert('INSERT INTO money (identifier, money) VALUES (?, ?) ON DUPLICATE KEY UPDATE money = ?', {
        identifier,
        money,
        money
    }, function()
        TriggerClientEvent('chat:addMessage', source, {
            args = { '^2^*[Info]^7^r Money Updated to ' .. money }
        })
    end)
end)

RegisterNetEvent('cc_money:payPlayer', function(targetPlayerId, amount)
    local payerId = source
    local payerName = GetPlayerName(payerId)
    local targetName = GetPlayerName(targetPlayerId)
    local payerIdentifier = GetPlayerIdentifierByType(payerId, 'license')
    local recipientIdentifier = GetPlayerIdentifierByType(targetPlayerId, 'license')
    amount = tonumber(amount)
    if not amount or amount <= 0 then
        TriggerClientEvent('chat:addMessage', payerId, {
            args = {'^1^*[Error]^7^r Invalid amount'}
        })
        return
    end
    MySQL.scalar('SELECT money FROM money WHERE identifier = ?', { payerIdentifier }, function(payerMoneyString)
        payerMoney = tonumber(payerMoneyString)
        if not payerMoney or payerMoney < amount then
            TriggerClientEvent('chat:addMessage', payerId, {
                args = {'^1^*[Error]^7^r Insufficient funds!'}
            })
            return
        end
        if not recipientIdentifier then
            TriggerClientEvent('chat:addMessage', payerId, {
                args = {'^1^*[Error]^7^r Invalid Player ID'}
            })
            return
        end
        local newPayerBalance = payerMoney - amount
        MySQL.execute('UPDATE money SET money = ? WHERE identifier = ?', { newPayerBalance, payerIdentifier })
        MySQL.scalar('SELECT money FROM money WHERE identifier = ?', { recipientIdentifier }, function(recipientMoney)
            local newRecipientBalance = (recipientMoney or 0) + amount
            MySQL.execute('UPDATE money SET money = ? WHERE identifier = ?', { newRecipientBalance, recipientIdentifier })
            TriggerClientEvent('chat:addMessage', payerId, {
                args = {'^2^*[Info]^7^r You sent ^2^*$^7^r' .. amount .. ' to ' .. targetName .. '.'}
            })
            TriggerClientEvent('chat:addMessage', targetPlayerId, {
                args = {'^2^*[Info]^7^r You received ^2^*$^7^r' .. amount .. ' from ' .. payerName .. '.'}
            })
        end)
    end)
end)

RegisterNetEvent('cc_money:retrieve', function()
    local playerId = source
    local identifier = GetPlayerIdentifierByType(playerId, 'license')
    MySQL.scalar('SELECT money FROM money WHERE identifier = ?', { identifier }, function(money)
        if not money then
            TriggerClientEvent('chat:addMessage', playerId, {
                args = {'^1^*[Error]^7 ^r No Money Value Found - Contact Owner'}
            })
            return
        end
        TriggerClientEvent('cc_money:updateBalance', playerId, money)
    end)
end)