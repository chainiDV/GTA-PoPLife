local coords = {
  {x =  225.338, y =  -419.716, z =  -118.150, x1 = 238.794, y1 =  -334.078, z1 =  -118.760}, -- coutroom entrance / exit
  {x =  246.438, y =  -337.090, z =  -118.794, x1 = 248.171, y1 = -337.797, z1 = -118.794}, -- entrance to defence hall // exit defence hall
  {x = 241.035, y = -304.235, z = -118.794, x1 =  -1003.101, y1 = -477.870, z1 = 50.030}, -- judge office // solomon's office
  {x = 236.101, y =  -413.360, z = -118.150 , x1 = -428.7784, y1 = 1111.17, z1 = 327.6931}, -- reception exit // pos de LS
}

function drawTxt(text, font, centre, x, y, scale, r, g, b, a)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

function get3DDistance(x1,y1,z1,x2,y2,z2)
  local a = (x2 - x1) * (x2 - x1)
  local b = (y2 - y1) * (y2 - y1)
  local c = (z2 - z1) * (z2 - z1)

  return math.sqrt(a+b+c)
end 


local blips = {
  {title="Juzgado", colour=18, id=285,  x = -428.7784, y = 1111.17, z = 327.6931}
}

Citizen.CreateThread(function()
  for _, info in pairs(blips) do
    info.blip = AddBlipForCoord(info.x, info.y, info.z)
    SetBlipSprite(info.blip, info.id)
    SetBlipDisplay(info.blip, 4)
    SetBlipScale(info.blip, 0.9)
    SetBlipColour(info.blip, info.colour)
    SetBlipAsShortRange(info.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(info.title)
    EndTextCommandSetBlipName(info.blip)
  end

end)

-------------------------------------
--CITIZEN--------
-------------------------------------
Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
      for i = 1, #coords, 1 do
        local pos = GetEntityCoords(GetPlayerPed(-1))
        if get3DDistance(coords[i].x,coords[i].y,coords[i].z, pos.x,pos.y,pos.z) < 14.0 then
            DrawMarker(1,coords[i].x,coords[i].y,coords[i].z-1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 1.6001,98,192,249, 200, 0, 0, 0, 0)
            if get3DDistance(coords[i].x,coords[i].y,coords[i].z, pos.x,pos.y,pos.z) < 1.0 then
              drawTxt('Presiona E para entrar', 2, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
              if IsControlJustPressed(1,38) then
                  SetEntityCoords(GetPlayerPed(-1), coords[i].x1,coords[i].y1,coords[i].z1-1)
                  FreezeEntityPosition(GetPlayerPed(-1), true)
                  TriggerEvent('chatMessage', 'Interior:', {255, 0, 0}, "Congelado 3 segundos para cargar el interior")
                  Citizen.Wait(3000)
                  FreezeEntityPosition(GetPlayerPed(-1), false)
              end
            end
        end

        if get3DDistance(coords[i].x1,coords[i].y1,coords[i].z1, pos.x,pos.y,pos.z) < 14.0 then
          DrawMarker(1,coords[i].x1,coords[i].y1,coords[i].z1-1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 1.6001,98,192,249, 200, 0, 0, 0, 0)
          if get3DDistance(coords[i].x1,coords[i].y1,coords[i].z1, pos.x,pos.y,pos.z) < 1.0 then
            drawTxt('Presiona E entrar', 2, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
            if IsControlJustPressed(1,38) then
                SetEntityCoords(GetPlayerPed(-1), coords[i].x,coords[i].y,coords[i].z-1)
                FreezeEntityPosition(GetPlayerPed(-1), true)
                TriggerEvent('chatMessage', 'Interior:', {255, 0, 0}, "Congelado 3 segundos para cargar el interior")
                Citizen.Wait(3000)
                FreezeEntityPosition(GetPlayerPed(-1), false)
            end
          end
        end
      end
		end
end)
