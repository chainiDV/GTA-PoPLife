--El sistema trabaja con segundos en BD y en la tabla. Para el usuario mostrará el tiempo completo :)
-- baneos = {{ id = , tiempo = , adm = }}
local baneos = {}
local banperm = {}

function cargobans()
	local bans = MySQL.Sync.fetchAll("SELECT * FROM bans")
	if bans then
		for i=1,#bans,1 do
			table.insert(baneos,{id = bans[i].id,steam = bans[i].steam, ip = bans[i].ip, tiempo = bans[i].tiempo, adm = tostring(bans[i].admin), razon = tostring(bans[i].razon)})--{id(licencia),steam = (steam), ip = (ip)}
		end
	end

end

function cargoperm()
	local bans = MySQL.Sync.fetchAll("SELECT * FROM bansperm")
	if bans then
		for i=1,#bans,1 do
			table.insert(banperm,{id = bans[i].id, steam = bans[i].steam, ip = bans[i].ip, adm = tostring(bans[i].admin), razon = tostring(bans[i].razon)})
		end
	end

end

function reiniciotodo()
		baneos = {}
		banperm = {}
		cargobans()
		cargoperm()
end

RegisterServerEvent('chaini_banstemp:guardoIP')
AddEventHandler('chaini_banstemp:guardoIP',function()
	local source = source
	local ip, id
	for k,v in ipairs(GetPlayerIdentifiers(source))do
		if string.sub(v, 1, string.len("ip:")) == "ip:" then
			ip = v
		end

		if string.sub(v, 1, string.len("steam:")) == "steam:" then
			id = v
		end
	end
	MySQL.Async.execute("UPDATE users SET ip = @ip WHERE identifier = @identifier",{['@ip'] = ip,['@identifier'] = id})
end)

AddEventHandler('playerConnecting', function(user, set)
	local ids = GetPlayerIdentifiers(source)
	for i=1,#baneos,1 do
		if (baneos[i].id == tostring(ids[2])) or (baneos[i].id == tostring(ids[1])) or baneos[i].steam == ids[1] or (baneos[i].ip == ids[3] and ids[3]) then
			local tiempo = tonumber(baneos[i].tiempo) --segundos
			local timenow = tonumber(os.time())-- segundos
			if  timenow > tiempo then -- ha pasado el tiempo
				table.remove(baneos,i)
				MySQL.Async.execute("DELETE FROM bans WHERE id = @identifier",{['@identifier'] = tostring(ids[2])})
				break
			else
				set("Todavía estás baneado del servidor hasta el "..os.date("%c",baneos[i].tiempo).." por el admin: "..baneos[i].adm.. ". Razón: "..baneos[i].razon)
				CancelEvent()
				break
			end
		end
	end

	for i=1,#banperm,1 do
		if (banperm[i].id == tostring(ids[2])) or (banperm[i].id == tostring(ids[1])) or banperm[i].steam == ids[1] or (banperm[i].ip == ids[3] and ids[3]) then

			set("Estás baneado del servidor permanentemente por el admin: "..banperm[i].adm.. " Razón : "..banperm[i].razon)
			CancelEvent()
			break
		end
	end
end)

-- /bantemp [ID] [tiempo en horas] [Razón]
TriggerEvent('es:addGroupCommand', 'bantemp', "admin", function(source, args, user)
	if args[2] then
		if(GetPlayerName(tonumber(args[2])))then
			local player = tonumber(args[2])


			TriggerEvent("es:getPlayerFromId", player, function(target)

				if(#args == 2)then
					TriggerClientEvent('chatMessage', source, "BANTEMP", {255, 0, 0}, "Debes poner una razón!")
				elseif #args == 3 then
					TriggerClientEvent('chatMessage', source, "BANTEMP", {255, 0, 0}, "Debes poner las horas!")
				else
					local ids = GetPlayerIdentifiers(player)
					local timeahora = os.time() --en segundos
					local horasaponer = tonumber(args[3]) * 60 * 60 --segundos
					local time = timeahora + horasaponer
					local tmpo = os.date('%c',time)
					table.remove(args, 1)
					table.remove(args, 1)
					table.remove(args, 1)
					local razon =table.concat(args, " ")
					local admin = GetPlayerName(source)
					table.insert(baneos,{id = tostring(ids[2]), steam = tostring(ids[1]), ip = tostring(ids[3]), tiempo = time, adm = admin})
					MySQL.Async.execute("INSERT INTO bans (id ,steam, ip, fecha , tiempo , admin, razon, baneado) VALUES (@identifier,@steam,@ip,@fecha,@tiempo,@admin,@razon,@baneado)",{['@identifier'] = ids[2],['@steam'] = ids[1],['@ip'] = ids[3],['@fecha'] = timeahora, ['@tiempo'] = time, ['@admin'] = admin, ['@razon'] = razon, ['@baneado'] = GetPlayerName(player)})


					TriggerClientEvent('chatMessage', -1, "BANTEMP", {255, 0, 0}, "El jugador ^2" .. GetPlayerName(player).. "^0 ha sido baneado por (^2" .. admin .. "^0) hasta" ..tmpo.." .")
					DropPlayer(player,"Has sido baneado del servidor hasta el "..tmpo.. " por "..admin.. ". Motivo : "..razon)
				end
			end)
		else
			TriggerClientEvent('chatMessage', source, "BANTEMP", {255, 0, 0}, "¡La ID es incorrecta!")
		end
	else
		TriggerClientEvent('chatMessage', source, "BANTEMP", {255, 0, 0}, "¡La ID es incorrecta!")
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Permisos insuficientes!")
end, {help = "Ban a un usuario con un motivo", params = {{name = "ID", help = "ID del jugador"}, {name = "tiempo en horas", help = "Tiempo en HORAS"}, {name = "Razón", help = "Razón del baneo"}}})

--[[AddEventHandler('rconCommand', function(commandName, args)
	if commandName == 'bantemp' then
		if args[2] then
			if(GetPlayerName(tonumber(args[2])))then
			--	local player = tonumber(args[2])


				TriggerEvent("es:getPlayerFromId", player, function(target)

					if(#args == 2)then
						RconPrint("Uso: bantemp [id] [nºhoras] [razón]\n")
						CancelEvent()
					elseif #args == 3 then
						RconPrint("Uso: bantemp [id] [nºhoras] [razón]\n")
						CancelEvent()
					else
						local ids = GetPlayerIdentifiers(player)
						local timeahora = os.time() --en segundos
						local horasaponer = tonumber(args[4]) * 60 * 60 --segundos
						local time = timeahora + horasaponer
						local tmpo = os.date('%c',time)
						table.remove(args, 1)
						table.remove(args, 1)
						table.remove(args, 1)
						local razon =table.concat(args, " ")
						table.insert(baneos,{id = tostring(ids[2]), tiempo = time, adm = 'RCON'})
						MySQL.Async.execute("INSERT INTO bans (id , fecha , tiempo , admin, razon, baneado) VALUES (@identifier,@fecha,@tiempo,@admin,@razon, @baneado)",{['@identifier'] = ids[2],['@fecha'] = timeahora, ['@tiempo'] = time, ['@admin'] = 'RCON', ['@razon'] = razon, ['@baneado'] = GetPlayerName(player)})


						TriggerClientEvent('chatMessage', -1, "BANTEMP", {255, 0, 0}, "El jugador ^2" .. GetPlayerName(player) .. "^0 ha sido baneado por (RCON') hasta" ..tmpo.." .")
						DropPlayer(player,"Has sido baneado del servidor hasta el "..tmpo.. " por RCON. Motivo : "..razon)
					end
				end)
			else
				RconPrint("Uso: bantemp [id] [nºhoras] [razón]\n")
			end
		else
			RconPrint("Uso: bantemp [id] [nºhoras] [razón]\n")
		end
	end

	if commandName == 'banperma' then
		if args[2] then
			if(GetPlayerName(tonumber(args[2])))then
				local player = tonumber(args[2])


				TriggerEvent("es:getPlayerFromId", player, function(target)

					if(#args == 1)then
						RconPrint("Debes poner una ID!")
					elseif #args == 2 then
						RconPrint("Debes poner una razón!")
					else
						local ids = GetPlayerIdentifiers(player)
						local timeahora = os.time() --en segundos
						local admin = GetPlayerName(source)
						table.remove(args, 1)
						table.remove(args, 1)
						local razon =table.concat(args, " ")
						table.insert(banperm,{id = tostring(ids[2]), adm = "RCON", razon = razon})
						MySQL.Async.execute("INSERT INTO bansperm (id , fecha , admin, razon,baneado) VALUES (@identifier,@fecha,@admin,@razon,@baneado)",{['@identifier'] = ids[2],['@fecha'] = timeahora, ['@admin'] = "RCON", ['@razon'] = razon, ['@baneado'] = GetPlayerName(player)})


						TriggerClientEvent('chatMessage', -1, "BANTEMP", {255, 0, 0}, "El jugador ^2" .. GetPlayerName(player) .. "^0 ha sido baneado por RCON permanentemente. Razón : "..razon..".")
						DropPlayer(player,"Has sido baneado del servidor permanentemente por RCON . Motivo : "..razon)
					end
				end)
			else
				RconPrint("Uso: banerma [id] [razón]\n")
			end
		else
			RconPrint("Uso: banperma [id] [razón]\n")
		end
	end
end)]]

--Ban por zuckerberg || Chaini
TriggerEvent('es:addGroupCommand', 'ban', "admin", function(source, args, user)
		if args[2] then
		if(GetPlayerName(tonumber(args[2])))then
			local player = tonumber(args[2])


			TriggerEvent("es:getPlayerFromId", player, function(target)

				if(#args == 1)then
					TriggerClientEvent('chatMessage', source, "BAN", {255, 0, 0}, "Debes poner una ID!")
				elseif #args == 2 then
					TriggerClientEvent('chatMessage', source, "BAN", {255, 0, 0}, "Debes poner una razón!")
				else
					local ids = GetPlayerIdentifiers(player)
					local timeahora = os.time() --en segundos
					local admin = GetPlayerName(source)
					table.remove(args, 1)
					table.remove(args, 1)
					local razon =table.concat(args, " ")
					table.insert(banperm,{id = tostring(ids[2]), steam = ids[1], ip = ids[3], adm = admin, razon = razon})
					MySQL.Async.execute("INSERT INTO bansperm (id , steam, ip, fecha , admin, razon,baneado) VALUES (@identifier,@steam,@ip,@fecha,@admin,@razon,@baneado)",{['@identifier'] = ids[2],['@steam'] = ids[1],['@ip'] = ids[3],['@fecha'] = timeahora, ['@admin'] = admin, ['@razon'] = razon, ['@baneado'] = GetPlayerName(player)})


					TriggerClientEvent('chatMessage', -1, "BAN", {255, 0, 0}, "El jugador ^2" .. GetPlayerName(player) .. "^0 ha sido baneado por (^2" .. admin .. "^0) permanentemente. Razón : "..razon..".")
					DropPlayer(player,"Has sido baneado del servidor permanentemente por "..admin.. ". Motivo : "..razon)
				end
			end)
		else
			TriggerClientEvent('chatMessage', source, "BANT", {255, 0, 0}, "¡La ID es incorrecta!")
		end
	else
		TriggerClientEvent('chatMessage', source, "BANT", {255, 0, 0}, "¡La ID es incorrecta!")
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Permisos insuficientes!")
end, {help = "Ban a un usuario con un motivo", params = {{name = "userid", help = "ID del jugador"}, {name = "reason", help = "Razón del ban del jugador"}}})

Citizen.CreateThread (function()
	Citizen.Wait(5000)	
	while true do
		reiniciotodo()
		Citizen.Wait(25000)	
	end
end)