ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)




TriggerEvent('es:addCommand', 'escudo', function(source, args, user)
    
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'police' then

        TriggerClientEvent('chaini_escudo:escudo',source)
    end
end)
