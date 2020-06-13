-- array = {{name = player,llaves = {{matr = "matrícula", stat = status}}}
			--}

local array = {}
local existe = nil

RegisterServerEvent('llaves:addarrayllaves')
AddEventHandler('llaves:addarrayllaves',function(coche,vehicle)
	local source = source

	existe = nil
	for i=1,#array,1 do
		if array[i].name == source then
			table.insert(array[i].llaves,{ matr = coche, stat = "opened"})
			existe = 1
			TriggerClientEvent('llaves:tomaarray',source,array[i],i)
			break
		end
	end
	if existe == nil then --si no existe ya no paso por abajo
		table.insert(array,{name = source, llaves = {}})
		table.insert(array[#array].llaves,{matr = coche, stat = "opened"})
		TriggerClientEvent('llaves:tomaarray',source,array[#array],#array)
	end	

end)


RegisterServerEvent('llaves:prestollaves')
AddEventHandler('llaves:prestollaves',function(coche,persona)
	if persona == source then
		TriggerClientEvent('esx:showNotification', source, "No puedes darte llaves a ti mismo")
	else
	
	if GetPlayerName(persona) then
		existe = nil
		for i=1,#array,1 do
			if array[i].name == persona then
				table.insert(array[i].llaves,coche)
				existe = 1
				TriggerClientEvent('llaves:tomaarray',persona,array[i],i)
				break
			end
		end
		if existe == nil then --si no existe ya no paso por abajo
			table.insert(array,{name = persona, llaves = {}})
			table.insert(array[#array].llaves,coche)
			TriggerClientEvent('llaves:tomaarray',persona,array[#array],#array)
		end
	else
		TriggerClientEvent('esx:showNotification', source, "La ID es incorrecta")
	end
end
end)

RegisterServerEvent('llaves:removearrayllaves')
AddEventHandler('llaves:removearrayllaves',function(coche)
	local source = source
	print("hola"..tostring(coche))
	for i=1,#array,1 do --busco su posición en el array
		if array[i].name == source then
			for j=1,#array[i].llaves,1 do --su array de llaves
				if array[i].llaves[j].matr == coche then
					print(#array[i].llaves)
					table.remove(array[i].llaves,i)
					print(#array[i].llaves)
					TriggerClientEvent('llaves:tomaarray',source,array[i],i)
					break
				end
			end
		end
	end
end)

RegisterServerEvent('llaves:pasoarray')--paso el array al sv 
AddEventHandler('llaves:pasoarray',function(data,iterador)
	local source = source
	if iterador then
		if array[iterador] then
			if array[iterador].name == source then--optimizo con el iterador que le pasé antes
				array[iterador].llaves = data.llaves
			else
				for i=1,#array,1 do
					if array[i].name == source then
						array[i].llaves = data.llaves
						break
					end
				end
			end
		end
	end
end)

AddEventHandler('playerDropped', function(reason)--Cuando jugador se desconecta sus llaves se borran y su name es nil
	local source = source
	for i=1,#array,1 do
		if array[i].name == source then
			table.remove(array,i)
			break
		end
	end
end)
