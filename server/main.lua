ESX = nil

TriggerEvent("esx:getSharedObject", function(response)
    ESX = response
end)

RegisterServerEvent('esx_bobhunt:getpelt_boar')
AddEventHandler('esx_bobhunt:getpelt_boar', function()
local player = ESX.GetPlayerFromId(source)		
		player.addInventoryItem('pelt_boar', 1)
		TriggerClientEvent('esx:showNotification', source, "~g~Success, ~g~Boar Pelt")
end)
RegisterServerEvent('esx_bobhunt:getpelt_mtnlion')
AddEventHandler('esx_bobhunt:getpelt_mtnlion', function()
local player = ESX.GetPlayerFromId(source)		
		player.addInventoryItem('pelt_mtnlion', 1)
		TriggerClientEvent('esx:showNotification', source, "~g~Success, ~y~Mountain Lion Pelt")
end)
RegisterServerEvent('esx_bobhunt:getpelt_deer')
AddEventHandler('esx_bobhunt:getpelt_deer', function()
local player = ESX.GetPlayerFromId(source)		
		player.addInventoryItem('pelt_deer', 1)
		TriggerClientEvent('esx:showNotification', source, "~g~Success, ~y~Deer Pelt")
end)
RegisterServerEvent('esx_bobhunt:getpelt_coyote')
AddEventHandler('esx_bobhunt:getpelt_coyote', function()
local player = ESX.GetPlayerFromId(source)		
		player.addInventoryItem('pelt_coyote', 1)
		TriggerClientEvent('esx:showNotification', source, "~g~Success, ~r~Coyote Pelt")
end)
RegisterServerEvent('esx_bobhunt:getpelt_rabbit')
AddEventHandler('esx_bobhunt:getpelt_rabbit', function()
local player = ESX.GetPlayerFromId(source)		
		player.addInventoryItem('pelt_rabbit', 1)
		TriggerClientEvent('esx:showNotification', source, "~g~Success, ~r~Rabbit Pelt")
end)
-----Sälj
RegisterServerEvent('esx_bobhunt:sellpelt_boar')
AddEventHandler('esx_bobhunt:sellpelt_boar', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local pelt_boar = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "pelt_boar" then
			pelt_boar = item.count
		end
	end
    
    if pelt_boar > 0 then
        xPlayer.removeInventoryItem('pelt_boar', 1)
        xPlayer.addMoney(1000)
		TriggerClientEvent('esx:showNotification', xPlayer.source, 'You sold a ~g~Boar Pelt!')
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You dont have any ~g~Boar Pelts ~s~to sell !')
    end
end)

RegisterServerEvent('esx_bobhunt:sellpelt_mtnlion')
AddEventHandler('esx_bobhunt:sellpelt_mtnlion', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local pelt_mtnlion = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "pelt_mtnlion" then
			pelt_mtnlion = item.count
		end
	end
    
    if pelt_mtnlion > 0 then
        xPlayer.removeInventoryItem('pelt_mtnlion', 1)
        xPlayer.addMoney(500)
		TriggerClientEvent('esx:showNotification', xPlayer.source, 'You sold a ~y~Mountain Lion Pelt!')
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You dont have any ~y~Mountain Lion Pelts ~s~to sell !')
    end
end)

RegisterServerEvent('esx_bobhunt:sellpelt_deer')
AddEventHandler('esx_bobhunt:sellpelt_deer', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local pelt_deer = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "pelt_deer" then
			pelt_deer = item.count
		end
	end
    
    if pelt_deer > 0 then
        xPlayer.removeInventoryItem('pelt_deer', 1)
        xPlayer.addMoney(300)
		TriggerClientEvent('esx:showNotification', xPlayer.source, 'You sold a ~r~Deer Pelt!')
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You dont have any ~r~Deer Pelts ~s~to sell !')
    end
end)

RegisterServerEvent('esx_bobhunt:sellpelt_coyote')
AddEventHandler('esx_bobhunt:sellpelt_coyote', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local pelt_coyote = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "pelt_coyote" then
			pelt_coyote = item.count
		end
	end
    
    if pelt_coyote > 0 then
        xPlayer.removeInventoryItem('pelt_coyote', 1)
        xPlayer.addMoney(200)
		TriggerClientEvent('esx:showNotification', xPlayer.source, 'You sold a ~r~Coyote Pelt!')
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You dont have any ~r~Coyote Pelts ~s~to sell !')
    end
end)


RegisterServerEvent('esx_bobhunt:sellpelt_rabbit')
AddEventHandler('esx_bobhunt:sellpelt_rabbit', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local pelt_rabbit = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "pelt_rabbit" then
			pelt_rabbit = item.count
		end
	end
    
    if pelt_rabbit > 0 then
        xPlayer.removeInventoryItem('pelt_rabbit', 1)
        xPlayer.addMoney(50)
		TriggerClientEvent('esx:showNotification', xPlayer.source, 'You sold a ~r~Rabbit Pelt!')
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You dont have any ~r~Rabbit Pelts ~s~to sell !')
    end
end)

function notification(text)
	TriggerClientEvent('esx:showNotification', source, text)
end
