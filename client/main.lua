ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(5)

		TriggerEvent("esx:getSharedObject", function(library)
			ESX = library
		end)
    end

    if ESX.IsPlayerLoaded() then
		ESX.PlayerData = ESX.GetPlayerData()
	end
end)

local oPlayer = false
local InVehicle = false
local playerpos = false

Citizen.CreateThread(function()
    while(true) do
		oPlayer = GetPlayerPed(-1)
        InVehicle = IsPedInAnyVehicle(oPlayer, true)
		playerpos = GetEntityCoords(oPlayer)
        Citizen.Wait(500)
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local handle, ped = FindFirstPed()
		local success
		repeat
			success, ped = FindNextPed(handle)
			local pos = GetEntityCoords(ped)
			local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, playerpos.x, playerpos.y, playerpos.z, true)
			if distance < 2 and CanSlaughterPed(ped) then
			drawText3D(pos.x, pos.y, pos.z + 0.6, '⚙️')		
            while IsControlPressed(0, 38) do
			drawText3D(pos.x, pos.y, pos.z + 0.5, '[H] ~b~Skin Animal~s~')
			break
				end	
					if IsControlJustPressed(1,74) then
						if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey('WEAPON_KNIFE') then
						oldped = ped
						SetEntityHeading(ped,GetHeadingFromVector_2d(pos.x-playerpos.x,pos.y-playerpos.y)+180)
						SetEntityHeading(oPlayer,GetHeadingFromVector_2d(pos.x-playerpos.x,pos.y-playerpos.y))
						exports.rprogress:Custom({
								Async = true,
								x = 0.5,
								y = 0.5,
								From = 0,
								To = 100,
								Duration = 5000,
								Radius = 60,
								Stroke = 10,
								MaxAngle = 360,
								Rotation = 0,
								Easing = "easeLinear",
								Label = "SKINNING",
								LabelPosition = "right",
								Color = "rgba(255, 255, 255, 1.0)",
								BGColor = "rgba(107, 109, 110, 0.95)",
								Animation = {
								--scenario = "CODE_HUMAN_MEDIC_TEND_TO_DEAD", -- https://pastebin.com/6mrYTdQv
								animationDictionary = "anim@heists@narcotics@funding@gang_idle", -- https://alexguirre.github.io/animations-list/
								animationName = "gang_chatting_idle01",
								},
								DisableControls = {
								Mouse = false,
								Player = true,
								Vehicle = true
								},
								})
						Citizen.Wait(5000)
						ClearPedTasks(PlayerPedId())
								if GetEntityModel(ped) == GetHashKey("a_c_boar") then
									local item = 'pelt_boar'
									local p_name = 'Boar pelt'
									TriggerServerEvent('esx_bobhunt:getPelt', item, p_name)
								elseif GetEntityModel(ped) == GetHashKey("a_c_mtlion") then
									local item = 'pelt_mtnlion'
									local p_name = 'Mountain Lion pelt'
									TriggerServerEvent('esx_bobhunt:getPelt', item, p_name)
								elseif GetEntityModel(ped) == GetHashKey("a_c_deer") then
									local item = 'pelt_deer'
									local p_name = 'Deer pelt'
									TriggerServerEvent('esx_bobhunt:getPelt', item, p_name)
								elseif GetEntityModel(ped) == GetHashKey("a_c_coyote") then
									local item = 'pelt_coyote'
									local p_name = 'Coyote pelt'
									TriggerServerEvent('esx_bobhunt:getPelt', item, p_name)
								elseif GetEntityModel(ped) == GetHashKey("a_c_rabbit_01") then
									local item = 'pelt_rabbit'
									local p_name = 'Rabbit pelt'
									TriggerServerEvent('esx_bobhunt:getPelt', item,  p_name)
								end
						
						Citizen.Wait(10)
						SetPedAsNoLongerNeeded(oldped)
						if DoesEntityExist(ped) then
						DeleteEntity(ped)
						end
						
						Citizen.Wait(1000)
						break
					else
					ESX.ShowNotification('~r~You need to use a knife!')
					end
					end
				end	
		until not success
		EndFindPed(handle)
	end
end)

function CanSlaughterPed(ped)
	if not IsPedAPlayer(ped) 
	and not IsPedInAnyVehicle(ped,false) 
	and not IsPedHuman(ped) 
	and IsEntityDead(ped) 
	and ped ~= oldped 
	and GetEntityModel(ped) == GetHashKey("a_c_boar") 
	or GetEntityModel(ped) == GetHashKey("a_c_coyote") 
	or GetEntityModel(ped) == GetHashKey("a_c_deer") 
	or GetEntityModel(ped) == GetHashKey("a_c_mtlion") 
	or GetEntityModel(ped) == GetHashKey("a_c_rabbit_01") then 
		return true
	end
	return false
end

function hintToDisplay(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local blips = {
      {title="Hunters Den", colour=4, id=463, x = -1132.93, y = 4948.42, z = 221.87}
}
 
      
Citizen.CreateThread(function()
    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.8)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)
  
local gym = {
    {x = -1132.93, y = 4948.42, z = 221.87}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k in pairs(gym) do
            DrawMarker(27, gym[k].x, gym[k].y, gym[k].z, 0, 0, 0, 0, 0, 0, 1.600, 1.600, 0.3001, 0, 153, 255, 255, 0, 0, 0, 0)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(gym) do
		
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, gym[k].x, gym[k].y, gym[k].z)

            if dist <= 1.5 then
				drawText3D(gym[k].x, gym[k].y, gym[k].z + 1.0, '⚙️')		
                while IsControlPressed(0, 38) do
				drawText3D(gym[k].x, gym[k].y, gym[k].z + 1.0, '[H] ~b~Sell Animal Pelts~s~')
				break
				end
				if IsControlJustPressed(0, 74) then
					OpenSellSkinsMenu()
				end			
            end
        end
    end
end)

function OpenSellSkinsMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'pawn_sell_menu',
        {
            title    = 'Do you have any pelts you want to sell?',
			align    = 'top-left',
            elements = {
                {label = 'Boar Pelt($1000)', value = 'pelt_boar', p_name = 'Boar Pelt', p_price = 1000},
				{label = 'Mountain Lion Pelt($500)', value = 'pelt_mtnlion', p_name = 'Mountain Lion Pelt', p_price = 500},
				{label = 'Deer Pelt($300)', value = 'pelt_deer', p_name = 'Deer Pelt', p_price = 300},
				{label = 'Coyote Pelt($200)', value = 'pelt_coyote', p_name = 'Coyote Pelt', p_price = 200},
				{label = 'Rabbit Pelt($50)', value = 'pelt_rabbit', p_name = 'Rabbit Pelt', p_price = 100}
				
            }
        },
        function(data, menu)
            if data.current.value == 'pelt_boar' then
				TriggerServerEvent('esx_bobhunt:sellpelt', data.current.value, data.current.p_name, data.current.p_price)
			elseif data.current.value == 'pelt_mtnlion' then
				TriggerServerEvent('esx_bobhunt:sellpelt', data.current.value, data.current.p_name, data.current.p_price)
			elseif data.current.value == 'pelt_deer' then
				TriggerServerEvent('esx_bobhunt:sellpelt', data.current.value, data.current.p_name, data.current.p_price)
			elseif data.current.value == 'pelt_coyote' then
				TriggerServerEvent('esx_bobhunt:sellpelt', data.current.value, data.current.p_name, data.current.p_price)
			elseif data.current.value == 'pelt_rabbit' then
				TriggerServerEvent('esx_bobhunt:sellpelt', data.current.value, data.current.p_name, data.current.p_price)
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end