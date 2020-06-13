--===============================================--===============================================
--= stationary radars based on  https://github.com/DreanorGTA5Mods/StationaryRadar           =
--===============================================--===============================================



ESX              = nil
local PlayerData = {}
local job = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

AddEventHandler('playerSpawned', function(spawn)
	TriggerServerEvent('pop_a:getJob')
end)
TriggerServerEvent('pop_a:getJob')

RegisterNetEvent('pop_a:setJob')
AddEventHandler('pop_a:setJob', function(joba)
    job = joba
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

local radares = {
    {x = 379.68807983398, y = -1048.3527832031, z = 29.250692367554},
    {x = -253.10794067383, y = -630.20385742188, z = 33.002685546875},
    {x = -228.16, y = 6130.48, z = 31.44}, --Carretera principal
    {x = -253.36, y = 6374.28, z = 31.04}, --Universidad
    {x = -9.36, y = 6368.2, z = 31.32}, --Correos
    {x = 165.56, y = 6535.08, z = 31.84}, --Mecánico
	
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k,v in pairs(radares) do
            local player = GetPlayerPed(-1)
            local coords = GetEntityCoords(player, true)
            if GetDistanceBetweenCoords(v.x, v.y, v.z, coords["x"], coords["y"], coords["z"]) < 20 then
            	if not(job == "ambulance" or job == "police") then
                    checkSpeed()
                    Citizen.Wait(1000)
                end
            end
        end
    end
end)

function checkSpeed()
    local pP = GetPlayerPed(-1)
    local speed = GetEntitySpeed(pP)
    local vehicle = GetVehiclePedIsIn(pP, false)
    local driver = GetPedInVehicleSeat(vehicle, -1)
    local plate = GetVehicleNumberPlateText(vehicle)
    local maxspeed = 45
    local mphspeed = math.ceil(speed*2.236936)
	local fineamount = nil
	local finelevel = nil
	local truespeed = mphspeed
    if mphspeed > maxspeed and driver == pP then
        Citizen.Wait(250)
        TriggerServerEvent('fineAmount', mphspeed)
	if truespeed >= 80 and truespeed <= 100 then
	fineamount = Config.Fine
	finelevel = 'Por encima de 10mph'
	end
	if truespeed >= 100 and truespeed <= 120 then
	fineamount = Config.Fine2
	finelevel = 'Por encima de 20mph'
	end
	if truespeed >= 120 and truespeed <= 140 then
	fineamount = Config.Fine3
	finelevel = 'Por encima de 30mph'
	end
	if truespeed >= 140 and truespeed <= 160 then
	fineamount = Config.Fine4
	finelevel = 'Por encima de 40mph'
	end
        exports.pNotify:SetQueueMax("left", 1)
        exports.pNotify:SendNotification({
            text = "<h2><center>Radar</center></h2>" .. "</br>Has sido multado por exceso de velocidad!</br>Numero de matrícula: " .. plate .. "</br>Dinero: $" .. fineamount .. "</br>Nivel de multa: " .. finelevel .. "</br>Límite de velocidad: " .. maxspeed .. "</br>Tu velocidad: " ..mphspeed,
            type = "error",
            timeout = 9500,
            layout = "centerLeft",
            queue = "left"
        })
    end
end

