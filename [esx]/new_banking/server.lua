--================================================================================================
--==                                VARIABLES - DO NOT EDIT                                     ==
--================================================================================================
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


function logMoney(enviador,receptor,cantidad)

	MySQL.Async.execute("INSERT INTO chaini_logTransacciones (Remitente,Receptor,Cantidad) VALUES (@remitente,@receptor,@cantidad)",{['@remitente'] = enviador, ['@receptor'] = receptor, ['@cantidad'] = cantidad})

end

RegisterServerEvent('bank:logMoney')
AddEventHandler('bank:logMoney', function(toPlayer,quantity)
	local xPlayerTo = ESX.GetPlayerFromId(toPlayer)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	logMoney(tostring(xPlayer.identifier),tostring(xPlayerTo.identifier),tonumber(quantity))

end)

RegisterServerEvent('bank:depositarPop')
AddEventHandler('bank:depositarPop', function(amount)
	local _source = source
	
	local xPlayer = ESX.GetPlayerFromId(_source)
	if amount == nil or amount <= 0 or amount > xPlayer.getMoney() then
		TriggerClientEvent('chatMessage', _source, "Cantidad inválida")
	else
		xPlayer.removeMoney(amount)
		xPlayer.addAccountMoney('bank', tonumber(amount))
	end
end)


RegisterServerEvent('bank:quitarPop')
AddEventHandler('bank:quitarPop', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local base = 0
	amount = tonumber(amount)
	base = xPlayer.getAccount('bank').money
	if amount == nil or amount <= 0 or amount > base then
		TriggerClientEvent('chatMessage', _source, "Cantidad inválida")
	else
		xPlayer.removeAccountMoney('bank', amount)
		xPlayer.addMoney(amount)
	end
end)

RegisterServerEvent('bank:balancePop')
AddEventHandler('bank:balancePop', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	balance = xPlayer.getAccount('bank').money
	TriggerClientEvent('currentbalance1', _source, balance)
	
end)


RegisterServerEvent('bank:transferir')
AddEventHandler('bank:transferir', function(to, amountt)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local zPlayer = ESX.GetPlayerFromId(to)
	local balance = 0
	balance = xPlayer.getAccount('bank').money
	zbalance = zPlayer.getAccount('bank').money

	if tonumber(_source) == tonumber(to) then
		TriggerClientEvent('chatMessage', _source, "No puedes hacerte una transferencia a ti mismo")
	else
		if balance <= 0 or balance < tonumber(amountt) or tonumber(amountt) <= 0 then
			TriggerClientEvent('chatMessage', _source, "No tienes suficiente dinero en el banco.")
		else
			xPlayer.removeAccountMoney('bank', amountt)
			zPlayer.addAccountMoney('bank', amountt)

			if tonumber(amountt) >= 300000 then

				logMoney(tostring(xPlayer.identifier),tostring(zPlayer.identifier),tonumber(amountt))
			end
		end
		
	end
end)





