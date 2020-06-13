--Settings--
ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


enableprice = true -- true = carwash is paid, false = carwash is free

price = 100 -- you may edit this to your liking. if "enableprice = false" ignore this one

--DO-NOT-EDIT-BELLOW-THIS-LINE--

RegisterServerEvent('es_carwash:checkmoney')
AddEventHandler('es_carwash:checkmoney', function ()
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	if enableprice == true then		
		if xPlayer.get('money') >= price then

			xPlayer.removeMoney(price)
			TriggerClientEvent('es_carwash:success',source,price)
		else
			TriggerClientEvent('esx:showNotification', _source, "No tienes suficiente dinero")
		end
	else
		TriggerClientEvent('es_carwash:free', source)
	end

	
end)
