ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('minar:doymineral')
AddEventHandler('minar:doymineral', function(mineral)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	
		xPlayer.addInventoryItem(mineral, 1)
end)

RegisterServerEvent('minar:recibodata')
AddEventHandler('minar:recibodata',function(data)
	Config.rocas = data
	TriggerClientEvent('minar:recibodatacliente',-1,data)
end)



RegisterServerEvent('minar:quitomin')
AddEventHandler('minar:quitomin',function()
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	for i = 1, #xPlayer.inventory,1 do
		if xPlayer.inventory[i].name == "oro" then
			if xPlayer.inventory[i].count > 0 then
				local count = xPlayer.inventory[i].count
				xPlayer.addMoney(count*math.random(170,190))
				xPlayer.removeInventoryItem(xPlayer.inventory[i].name,count)
				TriggerEvent('exp:addExperience',5*count,source)
			end
		elseif xPlayer.inventory[i].name == "plata" then
			if xPlayer.inventory[i].count > 0 then
				local count = xPlayer.inventory[i].count
				xPlayer.addMoney(count*math.random(140,160))
				xPlayer.removeInventoryItem(xPlayer.inventory[i].name,count)
				TriggerEvent('exp:addExperience',5*count,source)
			end
		elseif xPlayer.inventory[i].name == "hierro" then
			if xPlayer.inventory[i].count > 0 then
				local count = xPlayer.inventory[i].count
				xPlayer.addMoney(count*math.random(120,130))
				xPlayer.removeInventoryItem(xPlayer.inventory[i].name,count)
				TriggerEvent('exp:addExperience',3*count,source)
			end
		elseif xPlayer.inventory[i].name == "carbon" then
			if xPlayer.inventory[i].count > 0 then
				local count = xPlayer.inventory[i].count
				xPlayer.addMoney(count*math.random(90,110))
				xPlayer.removeInventoryItem(xPlayer.inventory[i].name,count)
				TriggerEvent('exp:addExperience',3*count,source)
			end
		end
	end
end)


function recarocas()
	for i=1, #Config.rocas, 1 do
		if Config.rocas[i].vida < Config.rocas[i].max then
			Config.rocas[i].vida = Config.rocas[i].vida + 1
		end
	end
	--Sincroniar
	TriggerClientEvent('minar:recibodatacliente',-1,Config.rocas)
end

function loop()
Citizen.CreateThread(function()
	while true do
		recarocas()
		Citizen.Wait(30000)
	Citizen.Wait(0)
	end
end)
end

loop()



