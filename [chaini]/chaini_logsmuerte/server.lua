

function addRow(asesinado,asesino,weapon)
	local timenow = tonumber(os.time())
	local text =  _U('givefood')..asesinado.._U('killedby')..asesino.._U('withA')..weapon
	MySQL.Async.execute("INSERT INTO log_killing (`date`, `log`) VALUES (@date,@log)",{['@date'] = 	tostring(os.date("%c",timenow)),['@log'] = text})

end

function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    if num >= 0 then return math.floor(num * mult + 0.5) / mult
    else return math.ceil(num * mult - 0.5) / mult end
end

RegisterServerEvent('baseevents:onPlayerKilled')
AddEventHandler('baseevents:onPlayerKilled',function(killer,info)
	local player = source
	TriggerClientEvent('chatMessage', player, 'LOG', {255, 0, 0}, _U('youKilledBy')..tostring(GetPlayerName(killer)))
	addRow(tostring(GetPlayerName(player)),tostring(GetPlayerName(killer)),info.weaponhash)
end)

AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/logkills" then
		local source = source
		TriggerEvent('es:getPlayerFromId', source, function(user)
			local esadmin = user.getGroup()
			if esadmin == "superadmin" or esadmin == "admin" or esadmin == "mod" then 
				CancelEvent()
				local logs = MySQL.Sync.fetchAll("SELECT * FROM log_killing ORDER BY log_id DESC LIMIT 15")
				local paso = {}
				if logs[1] then
					for i=1,#logs,1 do
						table.insert(paso,{id = logs[i].id,fecha = logs[i].date,texto = logs[i].log})
					end
				end
				TriggerClientEvent('logskills:menu',source,paso)
			end
		end)
	end
end)