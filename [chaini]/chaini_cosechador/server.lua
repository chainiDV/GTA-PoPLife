RegisterServerEvent('pop_cosecha:paga')
AddEventHandler('pop_cosecha:paga', function(price)
	TriggerEvent('es:getPlayerFromId', source, function(user)
    	total = price
		user.addMoney((total))
		TriggerClientEvent('chatMessage', source, _U('boss')..' | ', {255, 0, 0},  _U('pay')..total.."€.")
 end)
end)
