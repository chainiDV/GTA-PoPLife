
ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

------------------------------------------------
-------------------EVENT HANDLERS---------------
------------------------------------------------

RegisterServerEvent('chaini_navidad:insertTable')
AddEventHandler('chaini_navidad:insertTable',function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.execute("INSERT INTO chaini_xmasPresents (identifier,received) VALUES (@identifier,@received)",{["@identifier"] = xPlayer.identifier, ["@received"] = 1})
end)

RegisterServerEvent('chaini_navidad:checkPresents')
AddEventHandler('chaini_navidad:checkPresents',function()

    local source = source
    
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        local present = MySQL.Sync.fetchAll("SELECT * FROM chaini_xmasPresents WHERE identifier = @identifier",{["@identifier"] = xPlayer.identifier})
        
        if present and present == {} then
            if present[1].received == 1 then
                TriggerClientEvent('chaini_navidad:updateState',source,1)
            else
                TriggerClientEvent('chaini_navidad:updateState',source,0)
            end
        else
            TriggerClientEvent('chaini_navidad:updateState',source,0)
        end
    end
    
end)

RegisterServerEvent('chaini_navidad:darCoche')
AddEventHandler('chaini_navidad:darCoche',function(properties,name)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.execute(
        'INSERT INTO owned_vehicles (vehicle, owner,name,plate,model) VALUES (@vehicle, @owner,@name,@plate,@model)',
        {
          ['@vehicle'] = json.encode(properties),
          ['@owner']   = xPlayer.identifier,
          ['@name']   = name,
          ['@plate']   = properties.plate,
          ['@model']   = properties.model,
    
        },
        function (rowsChanged)
        end)
end)

RegisterServerEvent('chaini_navidad:darRegalo')
AddEventHandler('chaini_navidad:darRegalo',function(type)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if type == 1 then
        xPlayer.anadirMoneypop(1000000)
    elseif type == 2 then
        xPlayer.anadirMoneypop(500000)      
    elseif type == 3 then
        xPlayer.anadirInventarioItemPoP("coca",15) 
    elseif type == 4 then
        xPlayer.anadirMoneypop(700000)      
    end
end)


------------------------------------------------------
--------------------MAIN THREAD-----------------------
------------------------------------------------------

--Refresh every hour to check if it's the magic day!
Citizen.CreateThread(function()
    while true do

        local day = os.date("%d")
        local month = os.date("%m")
        
        TriggerClientEvent('chaini_navidad:CurrentDate',-1,day,month)
        
        Citizen.Wait(1000) --1 minute
    end
end)