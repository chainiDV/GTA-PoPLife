
function getIdentity(source, callback)
  local identifier = GetPlayerIdentifiers(source)[1]
  MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = @identifier", {['@identifier'] = identifier},
  function(result)
    if result[1] ~= nil then
      local data = {
        firstname     = result[1]['firstname'],
        lastname     = result[1]['lastname']
      }
      callback(data)
    else
      local data = {
        firstname     = ''
      }
      callback(data)
    end
  end)
end

AddEventHandler('chatMessage', function(source, name, message)
  getIdentity(source, function(data)
    if string.sub(message, 1, string.len("/")) ~= "/" then
      TriggerClientEvent("sendProximityMessage", -1, source, data.firstname, message)
    end
  end)
  CancelEvent()
end)

TriggerEvent('es:addCommand', 'me', function(source, args, user)
    getIdentity(source, function(data)
      TriggerClientEvent("sendProximityMessageMe", -1, source, data.firstname, table.concat(args, " "))
    end)
end)

TriggerEvent('es:addCommand', 'do', function(source, args, user)
    getIdentity(source, function(data)
      TriggerClientEvent("sendProximityMessageDo", -1, source, data.firstname, table.concat(args, " "))
    end)
end)

TriggerEvent('es:addCommand', 'twt', function(source, args, user)
  getIdentity(source, function(data)
    TriggerClientEvent('chatMessage', -1, "[" .. source .. "] ^0[^4Twitter^0] (^5@" .. data.firstname .. " " .. data.lastname .. "^0)", {30, 144, 255}, table.concat(args, " "))
  end)
end, {help = 'Manda un tweet. [IC]'})

TriggerEvent('es:addCommand', 'anonimo', function(source, args, user)
  TriggerClientEvent('chatMessage', -1, "[" .. source .. "] Anónimo ^0" , {128, 128, 128}, table.concat(args, " "))
end, {help = 'Send an out of character message to the whole server.'})

function stringsplit(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t={} ; i=1
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    t[i] = str
    i = i + 1
  end
  return t
end
