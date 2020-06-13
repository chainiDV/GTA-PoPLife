ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
  TriggerEvent('esx_service:activateService', 'police', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'police', _U('alert_police'), true, true)
TriggerEvent('esx_society:registerSociety', 'police', 'Police', 'society_police', 'society_police', 'society_police', {type = 'public'})

RegisterServerEvent('esx_policejob:giveWeapon')
AddEventHandler('esx_policejob:giveWeapon', function(weapon, ammo)
  local xPlayer = ESX.GetPlayerFromId(source)
  xPlayer.addWeapon(weapon, ammo)
end)

RegisterServerEvent('esx_policejob:confiscarPlayerItemPop')
AddEventHandler('esx_policejob:confiscarPlayerItemPop', function(target, itemType, itemName, amount)

  local sourceXPlayer = ESX.GetPlayerFromId(source)
  local targetXPlayer = ESX.GetPlayerFromId(target)

  if itemType == 'item_standard' then

    local label = sourceXPlayer.getInventoryItem(itemName).label

    targetXPlayer.removeInventoryItem(itemName, amount)

    TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_have_confinv') .. amount .. ' ' .. label .. _U('from') .. targetXPlayer.name)
    TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~b~' .. targetXPlayer.name .. _U('confinv') .. amount .. ' ' .. label )

  end

  if itemType == 'item_account' then

    targetXPlayer.removeAccountMoney(itemName, amount)
    sourceXPlayer.addAccountMoney(itemName, amount)

    TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_have_confdm') .. amount .. _U('from') .. targetXPlayer.name)
    TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~b~' .. targetXPlayer.name .. _U('confdm') .. amount)

  end

  if itemType == 'item_weapon' then

    targetXPlayer.removeWeapon(itemName)
    sourceXPlayer.addWeapon(itemName, amount)

    TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_have_confweapon') .. ESX.GetWeaponLabel(itemName) .. _U('from') .. targetXPlayer.name)
    TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~b~' .. targetXPlayer.name .. _U('confweapon') .. ESX.GetWeaponLabel(itemName))

  end

end)

RegisterServerEvent('esx_policejob:handcuff')
AddEventHandler('esx_policejob:handcuff', function(target)
  TriggerClientEvent('esx_policejob:handcuff', target)
  TriggerClientEvent('afk:changerP',target)
  TriggerClientEvent('esx_animations:handCuff',target)
end)

RegisterServerEvent('esx_policejob:drag')
AddEventHandler('esx_policejob:drag', function(target)
  local _source = source
  TriggerClientEvent('esx_policejob:drag', target, _source)
end)

RegisterServerEvent('esx_policejob:license')
AddEventHandler('esx_policejob:license', function(target)
  local _source = source
    TriggerEvent('esx_license:getLicenses', target, function(licenses)
      local licens = false
      for i,v in pairs(licenses) do
        if v.type == "drive" then
          licens = true
        end
      end
      TriggerClientEvent('esx_policejob:licensed', _source, licens)
    end)
end)

RegisterServerEvent('esx_policejob:retireLicense')
AddEventHandler('esx_policejob:retireLicense', function(tg)
  TriggerEvent('esx_license:removeLicense', tg, "drive",function() end)
  TriggerClientEvent('esx:showNotification', tg, "Se te ha retirado la licencia de conducir")
end)

RegisterServerEvent('esx_policejob:putInVehicle')
AddEventHandler('esx_policejob:putInVehicle', function(target)
  TriggerClientEvent('esx_policejob:putInVehicle', target)
end)

RegisterServerEvent('esx_policejob:OutVehicle')
AddEventHandler('esx_policejob:OutVehicle', function(target)
    TriggerClientEvent('esx_policejob:OutVehicle', target)
end)

RegisterServerEvent('esx_policejob:addItem')
AddEventHandler('esx_policejob:addItem', function(name,price)
    local xPlayer  = ESX.GetPlayerFromId(source)
    local money = xPlayer.get('money')
    if money >= price then
      xPlayer.addInventoryItem(name,1)
      xPlayer.removeMoney(price)
    else
      TriggerClientEvent('esx:showNotification', source, "No tienes suficiente dinero")
    end
end)

RegisterServerEvent('esx_policejob:getStockItem')
AddEventHandler('esx_policejob:getStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getCompartidoInventarioPop', 'society_police', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn') .. count .. ' ' .. item.label)

  end)

end)

RegisterServerEvent('esx_policejob:putStockItems')
AddEventHandler('esx_policejob:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getCompartidoInventarioPop', 'society_police', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= 0 then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('added') .. count .. ' ' .. item.label)

  end)

end)

ESX.RegisterServerCallback('esx_policejob:getOtherPlayerData', function(source, cb, target)

	if true then

		local xPlayer = ESX.GetPlayerFromId(target)

		local result = MySQL.Sync.fetchAll('SELECT firstname, lastname, sex, dateofbirth, height FROM characters WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier
		})

		local firstname = result[1].firstname or ''
		local lastname  = result[1].lastname or ''
		local sex       = result[1].sex or ''
		local dob       = result[1].dateofbirth or ''
		local height    = result[1].height or ''


		local data = {
			name      = GetPlayerName(target),
			job       = xPlayer.job,
			inventory = xPlayer.inventory,
			accounts  = xPlayer.accounts,
			weapons   = xPlayer.loadout,
			firstname = firstname,
			lastname  = lastname,
			sex       = sex,
			dob       = dob,
			height    = height
		}

		TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
			if status ~= nil then
				data.drunk = math.floor(status.percent)
			end
		end)

		cb(data)

	else

		local xPlayer = ESX.GetPlayerFromId(target)

		local data = {
			name       = GetPlayerName(target),
			job        = xPlayer.job,
			inventory  = xPlayer.inventory,
			accounts   = xPlayer.accounts,
			weapons    = xPlayer.loadout
		}

		TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
			if status ~= nil then
				data.drunk = math.floor(status.percent)
			end
		end)

		TriggerEvent('esx_license:getLicenses', target, function(licenses)
			data.licenses = licenses
		end)

		cb(data)

	end

end)

ESX.RegisterServerCallback('esx_policejob:getFineList', function(source, cb, category)

  MySQL.Async.fetchAll(
    'SELECT * FROM fine_types WHERE category = @category',
    {
      ['@category'] = category
    },
    function(fines)
      cb(fines)
    end
  )

end)

ESX.RegisterServerCallback('esx_policejob:getVehicleInfos', function(source, cb, plate)

  if Config.EnableESXIdentity then

    MySQL.Async.fetchAll(
      'SELECT * FROM owned_vehicles WHERE plate = @plate',
      {['@plate'] = plate},
      function(result)

        local foundIdentifier = nil

        for i=1, #result, 1 do

          local vehicleData = json.decode(result[i].vehicle)

          if vehicleData.plate == plate then
            foundIdentifier = result[i].owner
            break
          end

        end

        if foundIdentifier ~= nil then

          MySQL.Async.fetchAll(
            'SELECT * FROM characters WHERE identifier = @identifier',
            {
              ['@identifier'] = foundIdentifier
            },
            function(result)

              local ownerName = result[1].firstname .. " " .. result[1].lastname

              local infos = {
                plate = plate,
                owner = ownerName
              }

              cb(infos)

            end
          )

        else

          local infos = {
          plate = plate
          }

          cb(infos)

        end

      end
    )

  else

    MySQL.Async.fetchAll(
      'SELECT * FROM owned_vehicles',
      {},
      function(result)

        local foundIdentifier = nil

        for i=1, #result, 1 do

          local vehicleData = json.decode(result[i].vehicle)

          if vehicleData.plate == plate then
            foundIdentifier = result[i].owner
            break
          end

        end

        if foundIdentifier ~= nil then

          MySQL.Async.fetchAll(
            'SELECT * FROM users WHERE identifier = @identifier',
            {
              ['@identifier'] = foundIdentifier
            },
            function(result)

              local infos = {
                plate = plate,
                owner = result[1].name
              }

              cb(infos)

            end
          )

        else

          local infos = {
          plate = plate
          }

          cb(infos)

        end

      end
    )

  end

end)

RegisterServerEvent('esx_policejob:drugReviser')
AddEventHandler('esx_policejob:drugReviser', function(target)
      local source = source
      local obj = target
      TriggerEvent('es:getPlayerFromId',obj, function(user)
        local player = user.getIdentifier()
        MySQL.Async.fetchAll("SELECT * FROM pop_inventory WHERE identifier = @player", {[' @player'] = player},function ( result )
          if result[1] then
            TriggerClientEvent('esx_policejob:setD',
              source,
              result[1].dimetilglioxima,
              result[1].piridina,
              result[1].acloroplatinico,
              result[1].npotasio,
              result[1].csodio,
              result[1].dsodio,
              result[1].metalina,
              result[1].pestosina,
              result[1].repersina,
              result[1].cajas,
              obj)
          end
        end)
      end)
end)

RegisterServerEvent('esx_policejob:setDrugNone')
AddEventHandler('esx_policejob:setDrugNone', function(target)
    TriggerClientEvent('pop_droga:setvar',target,0,0,0,0,0,0,0,0,0,0)
    TriggerEvent('es:getPlayerFromId',target, function(user)
      if user then
        local player = user.getIdentifier()
        Citizen.CreateThread(function()
          MySQL.Async.execute("UPDATE pop_inventory SET piridina = @cantidad WHERE identifier = @identifier",{['@identifier'] = player,['@cantidad'] = 0})
          Citizen.Wait(100)
          MySQL.Async.execute("UPDATE pop_inventory SET dimetilglioxima = @cantidad WHERE identifier = @identifier",{['@identifier'] = player,['@cantidad'] = 0})
          Citizen.Wait(100)
          MySQL.Async.execute("UPDATE pop_inventory SET acloroplatinico = @cantidad WHERE identifier = @identifier",{['@identifier'] = player,['@cantidad'] = 0})
          Citizen.Wait(100)
          MySQL.Async.execute("UPDATE pop_inventory SET dsodio = @cantidad WHERE identifier = @identifier",{['@identifier'] = player,['@cantidad'] = 0})
          Citizen.Wait(100)
          MySQL.Async.execute("UPDATE pop_inventory SET metalina = @cantidad WHERE identifier = @identifier",{['@identifier'] = player,['@cantidad'] = 0})
          Citizen.Wait(100)
          MySQL.Async.execute("UPDATE pop_inventory SET csodio = @cantidad WHERE identifier = @identifier",{['@identifier'] = player,['@cantidad'] = 0})
          Citizen.Wait(100)
          MySQL.Async.execute("UPDATE pop_inventory SET metalina = @cantidad WHERE identifier = @identifier",{['@identifier'] = player,['@cantidad'] = 0})
          Citizen.Wait(100)
          MySQL.Async.execute("UPDATE pop_inventory SET pestosina = @cantidad WHERE identifier = @identifier",{['@identifier'] = player,['@cantidad'] = 0})
          Citizen.Wait(100)
          MySQL.Async.execute("UPDATE pop_inventory SET repersina = @cantidad WHERE identifier = @identifier",{['@identifier'] = player,['@cantidad'] = 0})
          Citizen.Wait(100)
          MySQL.Async.execute("UPDATE pop_inventory SET cajas = @cantidad WHERE identifier = @identifier",{['@identifier'] = player,['@cantidad'] = 0})
          Citizen.Wait(100)
          TriggerClientEvent('chatMessage', -1, 'Info | ', {255, 0, 0}, "BORRADO")
        end)
      end
    end)
end)

ESX.RegisterServerCallback('esx_policejob:getArmoryWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

ESX.RegisterServerCallback('esx_policejob:addArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('esx_policejob:removeArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)


ESX.RegisterServerCallback('esx_policejob:comprarPop', function(source, cb, amount)

  TriggerEvent('esx_addonaccount:getCompartidaCuentaPop', 'society_police', function(account)

    if account.money >= amount then
      account.removeMoney(amount)
      cb(true)
    else
      cb(false)
    end

  end)

end)

ESX.RegisterServerCallback('esx_policejob:getStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getCompartidoInventarioPop', 'society_police', function(inventory)
    cb(inventory.items)
  end)

end)

ESX.RegisterServerCallback('esx_policejob:getPlayerInventory', function(source, cb)

  local xPlayer = ESX.GetPlayerFromId(source)
  local items   = xPlayer.inventory

  cb({
    items = items
  })

end)

RegisterNetEvent('esx_policejob:addLicense')
AddEventHandler('esx_policejob:addLicense', function(type,pers)
  local _source = pers
  TriggerEvent('esx_license:addLicense', _source, type, function()
    TriggerEvent('esx_license:getLicenses', _source, function(licenses)
      TriggerClientEvent('esx_dmvschool:loadLicenses', _source, licenses)
    end)
  end)
end)