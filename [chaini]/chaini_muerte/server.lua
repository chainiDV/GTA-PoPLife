ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('chaini_muerto:updatePlayer')
AddEventHandler('chaini_muerto:updatePlayer', function(dead)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer ~= nil then
	    local identifier = xPlayer.identifier
		local deathStatus = 0

		if dead then
			deathStatus = 1
		end

		MySQL.Async.execute("UPDATE users SET isDead = @deathStatus WHERE identifier = @identifier", {
			['@deathStatus'] = deathStatus, ['@identifier'] = identifier
		})
    end
end)

ESX.RegisterServerCallback('chaini_muerto:isDead', function (source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer ~= nil then
	    local identifier = xPlayer.identifier
	MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
		  ['@identifier'] = identifier
		},function(result)
			if result[1] ~= nil then
				local user = result[1]
				local deathStatus = user['isDead']
				if deathStatus == 0 then
					cb(false)
				else
					cb(true)
				end
			else
				cb(false)
			end
		end
		)
	end
end)

