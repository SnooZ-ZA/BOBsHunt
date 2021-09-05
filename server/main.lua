ESX = nil

TriggerEvent("esx:getSharedObject", function(response)
    ESX = response
end)

RegisterServerEvent('esx_bobhunt:getPelt')
AddEventHandler('esx_bobhunt:getPelt', function(item, p_name)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.addInventoryItem(item, 1)
	TriggerClientEvent('esx:showNotification', source, '~b~You picked up a ' .. p_name)	
end)

-----Sell
RegisterServerEvent("esx_bobhunt:sellpelt")
AddEventHandler("esx_bobhunt:sellpelt", function(value, p_name, p_price)
    local player = ESX.GetPlayerFromId(source)
    local currentPelts = player.getInventoryItem(value)["count"]   
    if currentPelts > 0 then
        player.removeInventoryItem(value, currentPelts)
        player.addMoney(p_price * currentPelts)
        TriggerClientEvent("esx:showNotification", source, ("You had %s ~g~" .. p_name .. "~s~ and got paid $%s."):format(currentPelts, currentPelts * p_price))
    else
        TriggerClientEvent("esx:showNotification", source, "You don't have any ~r~" .. p_name .. "~s~ to sell.")
    end
end)
