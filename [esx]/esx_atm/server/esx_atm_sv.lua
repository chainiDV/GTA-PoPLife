ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_atm:depositarpop')
AddEventHandler('esx_atm:depositarpop', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	amount = tonumber(amount)
	if amount == nil or amount <= 0 or amount > xPlayer.getDineroPop() then
		TriggerClientEvent('esx:showNotification', _source, _U('invalid_amount'))
	else
		xPlayer.retirarDineropop(amount)
		xPlayer.addAccountMoney('bank', amount)
		TriggerClientEvent('esx:showNotification', _source, _U('deposit_money') .. amount .. '~s~.')
		TriggerClientEvent('esx_atm:closeATM', _source)
	end
end)


RegisterServerEvent('esx_atm:sacarpop')
AddEventHandler('esx_atm:sacarpop', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	amount = tonumber(amount)
	local accountMoney = 0
	accountMoney = xPlayer.getAccount('bank').money
	if amount == nil or amount <= 0 or amount > accountMoney then
		TriggerClientEvent('esx:showNotification', _source, _U('invalid_amount'))
	else
		xPlayer.removeAccountMoney('bank', amount)
		xPlayer.anadirMoneypop(amount)
		TriggerClientEvent('esx:showNotification', _source, _U('withdraw_money') .. amount .. '~s~.')
		TriggerClientEvent('esx_atm:closeATM', _source)
	end
end)