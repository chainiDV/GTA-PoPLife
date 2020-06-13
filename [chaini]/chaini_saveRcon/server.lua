ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



AddEventHandler('rconCommand', function(commandName, args)
	if commandName == 'saveBeforeRestart' then
		ESX.SavePlayers()
	end
end)

