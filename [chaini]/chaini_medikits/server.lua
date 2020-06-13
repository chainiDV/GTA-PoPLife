ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)




RegisterServerEvent('medikits:doymedikits')
AddEventHandler('medikits:doymedikits',function()
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.addInventoryItem('medikit', 10)
end)

RegisterServerEvent('medikits:getJob')
AddEventHandler('medikits:getJob',function()
	local source = source
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayers[i] == source then
			TriggerClientEvent('medikits:setJob',xPlayers[i],xPlayer.job.name)
		end
	end
end)