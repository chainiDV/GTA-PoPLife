 
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('onMySQLReady',function()
	MySQL.Async.execute("UPDATE users SET conectado = @conect",{['@conect'] = tonumber(0)}) -- Al servidor inicializar reseteo todo
end)

RegisterServerEvent('chaini_registro:loaded')
AddEventHandler('chaini_registro:loaded',function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer then
		local port = GetConvar("port","null")
		MySQL.Async.execute("UPDATE users SET conectado = @conect, puerto = @port, id = @id WHERE identifier = @ident",{['@conect'] = tonumber(1),['@id'] = tonumber(source),['@ident'] = xPlayer.identifier,['@port'] = port})
	end
end)


AddEventHandler('playerDropped', function()
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		MySQL.Async.execute("UPDATE users SET `loadout` = @loadout  WHERE identifier = @identifier",{['@loadout'] = json.encode(xPlayer.getLoadout()),['@identifier'] = xPlayer.identifier})
		MySQL.Async.execute("UPDATE users SET conectado = @conect, id = @id,puerto = @port, lastLogin = @lastLogin WHERE identifier = @ident",{['@conect'] = tonumber(0),['@id'] = -1,['@port'] = "desconectado",['@ident'] = xPlayer.identifier, ["@lastLogin"] = os.date("%c",os.time())})
	end
end)

RegisterServerEvent('chaini_registro:firstLogin')
AddEventHandler('chaini_registro:firstLogin',function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer then
		MySQL.Async.execute("UPDATE users SET firstLogin = @firstLogin WHERE identifier = @ident",{['@firstLogin'] = os.date("%c",os.time()),['@ident'] = xPlayer.identifier})
	end
end)