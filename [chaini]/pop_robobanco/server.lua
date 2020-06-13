ESX = nil
local rob = false
local robbers = {}
local tiempo = 0

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('robos:doydinero')
AddEventHandler('robos:doydinero',function(price)
	TriggerEvent('es:getPlayerFromId', source, function(user)
    	total = price
    	user.addMoney(total)
 	end)
end)


RegisterServerEvent('robos:demasiadolejos')
AddEventHandler('robos:demasiadolejos',function()
	local source = source
	local xPlayers = ESX.GetPlayers()
	rob = false
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx:showNotification', xPlayers[i],"Atención a todas las unidades: ~b~se cancela el aviso del ~r~ ATRACO~b~ en el ~w~BANCO".." | Jugador : "..source )
		end
	end
	TriggerClientEvent('robos:toofarlocal', source)
	TriggerClientEvent('esx:showNotification', source, "El ~r~ATRACO ~w~al ~b~BANCO ~w~ ha sido cancelado por estar lejos del punto")
end)
RegisterServerEvent('robos:hamuerto')
AddEventHandler('robos:hamuerto',function()
	rob = false
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
	 	if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx:showNotification',  xPlayers[i],"Atención a todas las unidades: el ~b~atracador ~w~ha sido ~r~ABATIDO")
		end		
	end

end)

RegisterServerEvent('robos:roboactivo')
AddEventHandler('robos:roboactivo',function()
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	local puedo = false


	if os.time() - tiempo < 1000 and tiempo ~= 0 then
		local mensaje = "Todavía no se puede robar"
		TriggerClientEvent('robos:notificacion',source,mensaje)
		return
	end

	TriggerEvent('es:getPlayerFromId',source, function(user)
		if user then
			local member = MySQL.Sync.fetchAll("SELECT * FROM tm1_membersgroups WHERE identifier = @player", {[' @player'] = user.getIdentifier()})
			local groupiswhitelisted = MySQL.Sync.fetchAll("SELECT * FROM tm1_groups WHERE groupid = @id", {["@id"] = member[1].groupid})
			if member[1] then
				if groupiswhitelisted[1].aprove == 1 then
					puedo = true
				else
					TriggerClientEvent('robos:notificacion',source,"Debes ser una mafia aprobada")
				end
			else
				TriggerClientEvent('robos:notificacion',source," Debes ser mafia")
			end
		end
	end)
	if puedo == true then
		local polis = 0


		for i=1, #xPlayers, 1 do
	 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
	 		if xPlayer.job.name == 'police' then
					polis = polis + 1
			end
		end

		--debug; por defecto polis > 5
		if polis >= 5 then 
			for i=1, #xPlayers, 1 do
	 			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
	 		if xPlayer.job.name == 'police' then
					TriggerClientEvent('esx:showNotification',  xPlayers[i],"Atención a todas las unidades: ~b~se está produciendo un ~r~ATRACO~b~ en el ~w~BANCO" )
					TriggerClientEvent('esx:showNotification',  xPlayers[i],"~r~CÓDIGO 3" )
					--TriggerClientEvent('esx:showNotification', xPlayers[i],"Pulsa 'E' para recibir la posición")
					--que puedan esocger coords al pulsar un botonTrigge
				end
			end
				tiempo = os.time()

			TriggerClientEvent('robos:empiezorobo',source)
			rob = true
			SetTimeout(420000, function()
			--SetTimeout(10000, function()
				rob = false
				TriggerClientEvent('robos:colocodinero', source)
				TriggerClientEvent('esx:showNotification', source,"Coge el ~g~dinero ~w~que está en la cámara acorazada")
				for i=1, #xPlayers, 1 do
	 				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		 			if xPlayer.job.name == 'police' then
					TriggerClientEvent('esx:showNotification',  xPlayers[i],"La cámara actorazada se ha ~g~abierto" )
					end
				end
			end)
		else 
			local poli = 5 - polis
			local mensaje = "~b~Se necesitan ~r~"..poli.." ~b~policías más para poder robar el banco"
			TriggerClientEvent('robos:notificacion',source,mensaje)
		end
	end
end)

