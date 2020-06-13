ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


-- /darjobems [ID] [rango] si rango == -1 expulsa
TriggerEvent('es:addCommand', 'darjobems', function(source, args, user)

    if args[2] then
        if(GetPlayerName(tonumber(args[1])))then
            local xPlayer = ESX.GetPlayerFromId(source)
            if xPlayer.faccion.name == 'ambulance' and xPlayer.faccion.grade_name == "boss" then
                local player = tonumber(args[1])
                TriggerEvent('es:getPlayerFromId', player, function(user)
                    local xPlayer = ESX.GetPlayerFromId(player)
                    if tonumber(args[2]) == -1 then --expulso
                        xPlayer.setFaccion('unemployed1',0)
                    else
                        xPlayer.setFaccion('ambulance',tonumber(args[2]))
                    end
                end)
           end
        else
            TriggerClientEvent('chatMessage', source, "DARJOB", {255, 0, 0}, "ID Incorrecta")
        end
    else
        TriggerClientEvent('chatMessage', source, "DARJOB", {255, 0, 0}, "/darjobems [ID] [RANGO] (rango -1 == expulsar)!")

    end
end)

TriggerEvent('es:addCommand', 'darjobpoli', function(source, args, user)

    if args[2] then
        if(GetPlayerName(tonumber(args[1])))then
            local xPlayer = ESX.GetPlayerFromId(source)
            if xPlayer.faccion.name == 'police' and xPlayer.faccion.grade_name ==  "boss" then
                local player = tonumber(args[1])
                TriggerEvent('es:getPlayerFromId', player, function(user)
                    local xPlayer = ESX.GetPlayerFromId(player)
                    if tonumber(args[2]) == -1 then --expulso
                        xPlayer.setFaccion('unemployed1',0)
                    else
                        xPlayer.setFaccion('police',tonumber(args[2]))
                    end
                end)
           end
        else
            TriggerClientEvent('chatMessage', source, "DARJOB", {255, 0, 0}, "ID Incorrecta")
        end
    else
        TriggerClientEvent('chatMessage', source, "DARJOB", {255, 0, 0}, "/darjobpoli [ID] [RANGO] (rango -1 == expulsar)!")

    end
end)