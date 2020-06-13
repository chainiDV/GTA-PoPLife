ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'taxi', Config.MaxInService)
end


TriggerEvent('esx_phone:registerNumber', 'taxi', 'Alerta de taxi', true, true)

RegisterServerEvent('esx_taxijob:exitoPop')
AddEventHandler('esx_taxijob:exitoPop', function()

	math.randomseed(os.time())

	local xPlayer        = ESX.GetPlayerFromId(source)
  local total          = math.random(Config.NPCJobEarnings.min, Config.NPCJobEarnings.max);
  local societyAccount = nil

  if xPlayer.job.grade >= 3 then
  	total = total * 2
  end

  TriggerEvent('esx_addonaccount:getCompartidaCuentaPop', 'society_taxi', function(account)
  	societyAccount = account
  end)

  if societyAccount ~= nil then

	  local playerMoney  = math.random(400,600)
	  local societyMoney = math.random(100,200)

	  xPlayer.addMoney(playerMoney)
	  societyAccount.addMoney(societyMoney)

	  TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_earned') .. playerMoney)
	  TriggerClientEvent('esx:showNotification', xPlayer.source, _U('comp_earned') .. societyMoney)

	else

		xPlayer.addMoney(total)
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_earned') .. total)

	end

end)

TriggerEvent('esx_phone:registerNumber', 'taxi', 'Atención taxistas', true, true)

TriggerEvent('esx_phone:registerCallback', function(source, phoneNumber, message, anon)

	local xPlayer  = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()

	if phoneNumber == 'taxi' then
		for i=1, #xPlayers, 1 do
			local xPlayer2 = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer2.job.name == 'taxi' then
				TriggerEvent('esx_phone:getDistpatchRequestId', function(requestId)
					TriggerClientEvent('esx_phone:onMessage', xPlayer2.source, xPlayer.get('phoneNumber'), message, xPlayer.get('coords'), anon, 'Appel Taxi', requestId)
				end)
			end
		end
	end

end)
