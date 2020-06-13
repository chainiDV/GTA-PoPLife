ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local coords = {x = -200.88, y = 6214.44, z = 36.96}  --xmas tree coordenates
local day = 1 --current day to check if it's xmas
local month = 1 --just in case it's not december
local present = 1 --1 if already given ; 0 if not


------------------------------------------------
-------------------EVENT HANDLERS---------------
------------------------------------------------
RegisterNetEvent('chaini_navidad:CurrentDate')
AddEventHandler('chaini_navidad:CurrentDate',function(day1,month1)
    day = tonumber(day1)
    month = tonumber(month1)

end)

AddEventHandler('playerSpawned',function()
    TriggerServerEvent('chaini_navidad:checkPresents')
end)

RegisterNetEvent('chaini_navidad:updateState')
AddEventHandler('chaini_navidad:updateState',function(state)
    present = tonumber(state)
end)
------------------------------------------------
-------------------FUNCTIONS--------------------
------------------------------------------------

function DrawText3D(x,y,z, text) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*10
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 0.5*scale)
        SetTextFont(1)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function notificacion(texto)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(texto)
    DrawNotification(false, true)
end

function get3DDistance(x1, y1, z1, x2, y2, z2)
    local a = (x1 - x2) * (x1 - x2)
    local b = (y1 - y2) * (y1 - y2)
    local c = (z1 - z2) * (z1 - z2)
    return math.sqrt(a + b + c)
end

function darCoche(modelo)
    local pos = GetEntityCoords(GetPlayerPed(-1))
    ESX.Game.SpawnVehicle(tostring(modelo), pos, 270.0, function(vehicle)
        TriggerServerEvent('chaini_navidad:darCoche',ESX.Game.GetVehicleProperties(vehicle),GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
        TriggerServerEvent('llaves:addarrayllaves',GetVehicleNumberPlateText(vehicle),vehicle)
        SetPedIntoVehicle(GetPlayerPed(-1),vehicle,-1)
    end)
end

function regaloRandom() 
    local var = math.random(1,60)

    if var >= 1 and var <= 5 then --10% probabilidad
        -- 1 Millón
        TriggerServerEvent('chaini_navidad:darRegalo',1)
        notificacion("Has recibido: ~g~ 1.000.000 €")

    elseif var >= 6 and var <= 18 then -- 20% probabilidad
        --Coche
        darCoche("caddy")
        notificacion("Has recibido: ~b~ un Caddy ")

    elseif var >= 19 and var <= 31 then -- 20%probabilidad
        --500k
        TriggerServerEvent('chaini_navidad:darRegalo',2)
        notificacion("Has recibido: ~g~ 500.000 €")

    elseif var >= 32 and var <= 50 then -- 30% probabilidad
        --pistola + droga
        GiveWeaponToPed(GetPlayerPed(-1),GetHashKey('WEAPON_PISTOL50'),255,false,true)
        TriggerServerEvent('chaini_navidad:darRegalo',3)   
        notificacion("Has recibido: un poco de ~g~ farlopa ~w~ y una ~b~ pistola") 

    elseif var >= 51 and var <= 57 then -- 10% probabilidad
        -- 700k
        TriggerServerEvent('chaini_navidad:darRegalo',4)
        notificacion("Has recibido: ~g~ 700.000 €")

    elseif var >= 58 and var <= 60 then --10 % probabilidad
        -- coche2
        darCoche("dune2")
        notificacion("Has recibido: ~b~ un Dune2 ")
    end
    --gorro navideño
    TriggerServerEvent('chaini_navidad:insertTable')
    present = 1

end


------------------------------------------------------
--------------------MAIN THREAD-----------------------
------------------------------------------------------

Citizen.CreateThread(function()
    while true do
        local pos = GetEntityCoords(GetPlayerPed(-1))
        if get3DDistance(pos.x,pos.y,pos.z,coords.x,coords.y,coords.z) < 50.0 then
            if (day >= 25 and month == 12) then
                DrawText3D(coords.x,coords.y,coords.z,"~g~¡Feliz Navidad!")
                DrawText3D(coords.x,coords.y,coords.z-1,"~w~ Alguien ha dejado ~r~ regalos ~w~ para ~b~ TODOS")           

                if get3DDistance(pos.x,pos.y,pos.z,coords.x,coords.y,coords.z) < 10 then
                    DisplayHelpText("Presiona ~INPUT_CONTEXT~ para abrir tu ~r~regalo")

                    if IsControlJustReleased(1,38) then
                        if present == 0 then
                            regaloRandom()
                        else
                            notificacion("Ya has recibido tu ~r~ regalo")
                        end
                    end
                end
            else
                DrawText3D(coords.x,coords.y,coords.z,"~w~¿Qué habrá aquí el ~b~día ~r~25~w~?") 
            end
        end
        Citizen.Wait(0)
    end
end)

