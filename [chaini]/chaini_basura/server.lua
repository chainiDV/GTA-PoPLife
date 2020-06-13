RegisterServerEvent('pop_basura:paga')
AddEventHandler('pop_basura:paga', function(price)
	TriggerEvent('es:getPlayerFromId', source, function(user)
    	total = price
		user.addMoney((total))
		TriggerClientEvent('chatMessage', source, 'Empresario | ', {255, 0, 0}, "Has ganado "..total.."€.")
 end)
end)

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
RegisterServerEvent('pop_basura:getJob')
AddEventHandler('pop_basura:getJob',function()
	local source = source
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayers[i] == source then
			TriggerClientEvent('pop_basura:setJob',xPlayers[i],xPlayer.job.name)
		end
	end
end)