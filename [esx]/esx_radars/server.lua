ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('fineAmount')
AddEventHandler('fineAmount', function(mphspeed)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local truespeed = mphspeed
	if truespeed >= 55 and truespeed <= 65 then
		xPlayer.removeAccountMoney('bank', Config.Fine)
	end
	if truespeed >= 65 and truespeed <= 75 then
		xPlayer.removeAccountMoney('bank', Config.Fine2)
	end
	if truespeed >= 75 and truespeed <= 85 then
	xPlayer.removeAccountMoney('bank', Config.Fine3)
	end
	if truespeed >= 85 and truespeed <= 200 then
	xPlayer.removeAccountMoney('bank', Config.Fine4)
	end
	CancelEvent()
end)

RegisterServerEvent('pop_a:getJob')
AddEventHandler('pop_a:getJob',function()
	local source = source
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayers[i] == source then
			TriggerClientEvent('pop_a:setJob',xPlayers[i],xPlayer.job.name)
		end
	end
end)