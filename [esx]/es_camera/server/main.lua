local Spectating = {}
local users = {}

function startR()
	Citizen.CreateThread(function()
		while true do
			local xPlayers = ESX.GetPlayers()
			users = {}
			for i=1, #xPlayers, 1 do
				table.insert(users,xPlayers[i])
			end
			Citizen.Wait(5000)
		end
	end)
end

function getRandomID(source)
	local xPlayers = ESX.GetPlayers()
	users = {}
	for i=1, #xPlayers, 1 do
		table.insert(users,xPlayers[i])
		if source == xPlayers[i] then
			
		else
			return xPlayers[i]
		end
	end
	return false
end

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
	startR()
	end)

RegisterServerEvent('es_camera:requestSpectating')
AddEventHandler('es_camera:requestSpectating', function()
	TriggerClientEvent('es_camera:onSpectate', source, Spectating)
end)

RegisterServerEvent('es_camera:spectate')
AddEventHandler('es_camera:spectate', function(tg)

	local Source = source
	local target = tg
	


	if target == -1 then

		for i=1, #Spectating, 1 do
			if Spectating[i] == source then
				Spectating[i] = nil
				break
			end
		end

		--TriggerClientEvent('afk:changerS',source)
		--TriggerClientEvent('pop_walk:isSpectating',source)
		TriggerClientEvent('es_camera:onSpectate', -1, Spectating)
		TriggerClientEvent('es_camera:spectate', source, target)

	elseif target == source then
		TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "No te puedes spectear a ti mismo, melón!")
	else
		local target = getRandomID(source)

		if getRandomID(source) == false then
			TriggerClientEvent('tm1_adminSystem:returnSpectate',source)
			TriggerClientEvent('esx:showNotification',source,"No hay nadie para spectear.")
			return false
		end
		

		local found = false

		for i=1, #Spectating, 1 do
			if Spectating[i] == source then
				found = true
				break
			end
		end

		if not found then
			table.insert(Spectating, source)
		end

		--TriggerClientEvent('afk:changerS',source)
		--TriggerClientEvent('pop_walk:isSpectating',source)
		TriggerClientEvent('es_camera:onSpectate', -1, Spectating)
		TriggerClientEvent('es_camera:spectate', source, target)
	end
end)

RegisterServerEvent('es_camera:next')
AddEventHandler('es_camera:next', function(target)
	local theNext = nil
	for i,v in pairs(users) do
		if target == v then
			theNext = i + 1
		end
	end
	if users[theNext] == source then
		theNext = theNext + 1
	end	

	if users[theNext] == nil then
		theNext = 0
	end

	spectate(users[theNext],source,theNext)
end)

RegisterServerEvent('es_camera:nextTo')
AddEventHandler('es_camera:nextTo', function(target)
	local theNext = nil
	for i,v in pairs(users) do
		if target == v then
			theNext = i - 1
		end
	end
	if users[theNext] == source then
		theNext = theNext - 1
	end	
	spectate(users[theNext],source,theNext)
end)

function spectate(target,source,o)
	if o == 0 then
			TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Con la otra flecha huevon")
	else
		if target == source then
			TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "No te puedes spectear a ti mismo, melón!")
		else
			TriggerClientEvent('esx:showNotification', source, "La id del que estas specteando es : "..target.." | "..GetPlayerName(target))
			TriggerClientEvent('es_camera:onSpectate', -1, Spectating)
			TriggerClientEvent('es_camera:spectate', source, target)
		end
	end
end


TriggerEvent('es:addCommand', 'spectate',function(source, args, user)
	local Source = source
	TriggerEvent('es:getPlayerFromId', Source, function(user)
	  	if user.getGroup() == "admin" or user.getGroup() == "superadmin" or user.getGroup() == "mod" then
			local target = -1

			if args[1] ~= nil then
				target = tonumber(args[1])
			end

			if target == -1 then

				for i=1, #Spectating, 1 do
					if Spectating[i] == source then
						Spectating[i] = nil
						break
					end
				end

				TriggerClientEvent('afk:changerS',source)
				TriggerClientEvent('pop_walk:isSpectating',source)
				TriggerClientEvent('es_camera:onSpectate', -1, Spectating)
				TriggerClientEvent('es_camera:spectate', source, target)

			elseif target == source then
				TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "No te puedes spectear a ti mismo, melón!")
			else
				TriggerClientEvent('tm1_adminSystem:activeSpectate',Source)
				local found = false

				for i=1, #Spectating, 1 do
					if Spectating[i] == source then
						found = true
						break
					end
				end

				if not found then
					table.insert(Spectating, source)
				end

				TriggerClientEvent('afk:changerS',source)
				TriggerClientEvent('pop_walk:isSpectating',source)
				TriggerClientEvent('es_camera:onSpectate', -1, Spectating)
				TriggerClientEvent('es_camera:spectate', source, target)
			end
		end
	end)
end, {help = 'Spectate', params = {{name = 'id'}}})



AddEventHandler('playerDropped', function()
	for i=1, #Spectating, 1 do
		if Spectating[i] == source then
			Spectating[i] = nil
			break
		end
	end
end)
