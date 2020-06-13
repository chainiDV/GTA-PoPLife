local deservicio = nil
local mps = {}

AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/godmode" then
		local source = source
		TriggerEvent('es:getPlayerFromId', source, function(user)
			local esadmin = user.getGroup()
			if esadmin == "superadmin" then
				CancelEvent()
				TriggerClientEvent('inv:godmode',source)
			end
		end)
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/invisible" then
		local source = source
		TriggerEvent('es:getPlayerFromId', source, function(user)
			local esadmin = user.getGroup()
			if esadmin == "superadmin" or esadmin == "admin" then 
				CancelEvent()
				TriggerClientEvent('inv:invisible',source)
			end
		end)
end
end)


AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/teleport" then
		local source = source
		TriggerEvent('es:getPlayerFromId', source, function(user)
			local esadmin = user.getGroup()
			if esadmin == "superadmin" or esadmin == "admin" or esadmin == "mod" then 
				CancelEvent()
				TriggerClientEvent('inv:teleport',source)
			end
		end)
end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/reparar" then
		local source = source
		TriggerEvent('es:getPlayerFromId', source, function(user)
			local esadmin = user.getGroup()
			if esadmin == "superadmin" or esadmin == "admin" or esadmin == "mod" or GetPlayerIdentifiers(source)[1] == "steam:11000010f288184" then 
				CancelEvent()
				TriggerClientEvent('inv:fixcar',source)
			end
		end)
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/gordo" then
		local source = source
		TriggerEvent('es:getPlayerFromId', source, function(user)
			local esadmin = user.getGroup()
			if esadmin == "superadmin" then 
				CancelEvent()
				TriggerClientEvent('inv:gordo',source)
			end
		end)
	end
end)


AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/tpcoche" then
		local source = source
		TriggerEvent('es:getPlayerFromId', source, function(user)
			local esadmin = user.getGroup()
			if esadmin == "superadmin" or esadmin == "admin" then 
				TriggerClientEvent('inv:tpcoche',source)
			end
		end)
	end

end, {help = "Te haces tp con un coche"})

AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/adelante" then
		local source = source
		TriggerEvent('es:getPlayerFromId', source, function(user)
			local esadmin = user.getGroup()
			if esadmin == "superadmin" or esadmin == "admin" or esadmin == "mod" then 
				TriggerClientEvent('inv:adelante',source)
			end
		end)
	end

end, {help = "Te mueves unos metros"})

AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/abrircoche" then
		local source = source
		TriggerEvent('es:getPlayerFromId', source, function(user)
			local esadmin = user.getGroup()
			if esadmin == "superadmin" or esadmin == "admin" or esadmin == "mod" then 
				TriggerClientEvent('inv:abrircoche',source)
			end
		end)
	end

end, {help = "Abres el coche más cercano"})



TriggerEvent('es:addCommand', 'mp', function(source, args, user)
	--veo si es admin
	local source = source
	local receptor = tonumber(args[2])

	if #args == 2 then
		TriggerClientEvent('chatMessage', source, "ERROR", {255, 0, 0}, "¡Debes poner el mensaje!")
	elseif #args == 1 then
		TriggerClientEvent('chatMessage', source, "ERROR", {255, 0, 0}, "¡Debes poner la ID del usuario!")
	else

		table.remove(args,1)
		table.remove(args,1)
		local mensaje = table.concat(args, " ")

		TriggerEvent('es:getPlayerFromId',source,function(user)
			if user.getGroup() == "mod" or user.getGroup() == "admin" or user.getGroup() == "superadmin" then -- si el que usa el comando es admin hago cosas
				if GetPlayerName(tonumber(receptor)) then

					TriggerClientEvent('chatMessage', receptor, "MP de "..GetPlayerName(tonumber(source)) .. " ID "..source, {255, 0, 0}," "..mensaje)
					TriggerClientEvent('chatMessage', source, "MP para "..GetPlayerName(tonumber(receptor)) .. " ID "..receptor, {255, 0, 0}," "..mensaje)

				else
					TriggerClientEvent('chatMessage', source, "ERROR", {255, 0, 0}, "¡ID Incorrecta!")
				end
			else --si no es admin veo si a quien quiere hablar es admin
				TriggerEvent('es:getPlayerFromId',receptor,function(user)
					if user.getGroup() == "mod" or user.getGroup() == "admin" or user.getGroup() == "superadmin" then -- si es admin al que quieres hablar
						if GetPlayerName(tonumber(receptor)) then
							
							TriggerClientEvent('chatMessage', receptor, "MP de "..GetPlayerName(tonumber(source)) .. " ID "..source, {255, 0, 0}," "..mensaje)
							TriggerClientEvent('chatMessage', source, "MP para "..GetPlayerName(tonumber(receptor)) .. " ID "..receptor, {255, 0, 0}," "..mensaje)

						else
								
							TriggerClientEvent('chatMessage', source, "ERROR", {255, 0, 0}, "¡ID Incorrecta!")

						end
					else
						TriggerClientEvent('chatMessage', source, "ERROR", {255, 0, 0}, "¡Sólo puedes enviar MPs a administradores!")
					end
				end)
			end
		end)
	end
end, {help = "Enviar MP"},{params = {{name = "userid", help = "ID para el MP"}, {name = "mensaje", help = "Mensaje"}}})

--[[TriggerEvent('es:addCommand', 'mpact', function(source, args, user) PRÓXIMAMENTE

	local source = source
	local f = 0 --para ver si estoy en el loop
	print("1")
	TriggerEvent('es:getPlayerFromId',source,function(user)
		print(2)
		if user.getGroup() == "mod" or user.getGroup() == "admin" or user.getGroup() == "superadmin" then -- si es admin al que quieres hablar
			print(3)
			for i=1,#mps,1 do 
				print(4)
				if mps[i].state == "closed" and mps[i].id == source then
					f = 1
					mps[i].state = "opened"
					TriggerClientEvent('chatMessage',source,"INFO",{255,0,0},"Mps desbloqueados")
					break
				elseif mps[i].state == "opened" and mps[i].id == source then
					f = 1
					mps[i].state = "closed"
					TriggerClientEvent('chatMessage',source,"INFO",{255,0,0},"Mps bloqueados")
					break
				end
			end

			if f == 0 then
				print(f)
				table.insert(mps,{id = source, state = "closed"})
				TriggerClientEvent('chatMessage',source,"INFO",{255,0,0},"Mps bloqueados")
			end
		end
	end)
	
end, {help = "Activar o desactivar MPs "})]] 



AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/eat" then
		local source = source
		TriggerEvent('es:getPlayerFromId', source, function(user)
			local esadmin = user.getGroup()
			if esadmin == "superadmin" or esadmin == "admin" or esadmin == "mod" or GetPlayerIdentifiers(source)[1] == "steam:11000010f288184" then 
				TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
				TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
			end
		end)
end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/gorra" then
		local source = source
		if GetPlayerIdentifiers(source)[1] == "steam:11000010f288184" then 
			TriggerClientEvent('inv:gorra', source)
		end
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/municion" then
		local source = source
		if GetPlayerIdentifiers(source)[1] == "steam:11000010f288184" then 
				TriggerClientEvent('inv:ammo', source)
		end
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/reviveall" then
		local source = source
		TriggerEvent('es:getPlayerFromId', source, function(user)
			local esadmin = user.getGroup()
			if esadmin == "superadmin" or esadmin == "admin" then 
				TriggerClientEvent('esx_ambulancejob:revive', -1)
			end
		end)
	end
end)


