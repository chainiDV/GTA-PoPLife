local ems = 0

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)



function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
local job = nil
AddEventHandler('playerSpawned', function(spawn)
  TriggerServerEvent('medikits:getJob')
end)
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    TriggerServerEvent('minar:getJob')
end)
TriggerServerEvent('medikits:getJob')
RegisterNetEvent('medikits:setJob')
AddEventHandler('medikits:setJob',function(jobu)
  job = jobu
end)

Citizen.CreateThread(function()
	while true do
		local coords = GetEntityCoords(GetPlayerPed(-1))
		if job == "ambulance" then
			if GetDistanceBetweenCoords(coords, -380.16, 6087.24, 30.6) < 50 then
				DrawMarker(1,-380.16,6087.24,30.6, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,252,255,0, 200, 0, 0, 0, 0)
				if GetDistanceBetweenCoords(coords,-380.16,6087.24,30.6) < 1.5 then
					DisplayHelpText("Pulsa ~INPUT_CONTEXT~ para conseguir 10 medikits")
					if IsControlJustReleased(1,38) then
						TriggerServerEvent('medikits:doymedikits')
					end
				end
			end
		end
		Citizen.Wait(0)
	end
end)