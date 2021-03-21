local alavalot = false
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

--## Uncomment and comment whichever notifications you want to use, or implement your own. By default it's using Mythic_notify, made it usable with ESX notifications also.
--## Dá unconmment e dá comment as notificações que desejas usar ou implementa as tuas próprias. Por padrão, ele está a usar o Mythic_notify, que também pode ser usado com as notificações do ESX.

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        local ped = PlayerPedId()
        if IsPedSittingInAnyVehicle(ped) then
            if IsControlPressed(1, 132) and IsControlJustPressed(1, 47) then
                local vehicle = GetVehiclePedIsIn(ped)
                local alavalotkiinni = IsVehicleNeonLightEnabled(vehicle, 1)
				if alavalotkiinni then
					if alavalot == false then
						alavalot = true
						DisableVehicleNeonLights(vehicle, true)
						TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', length = 3000, text = 'Neonlights : OFF' })
						--PT--TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', length = 3000, text = 'Neons : OFF' })
						--ING--ESX.ShowNotification('Neonlights: ~r~OFF')
						--PT--ESX.ShowNotification('Neons: ~r~OFF')
						Wait(2000)
					elseif alavalot == true then
						alavalot = false
						DisableVehicleNeonLights(vehicle, false)
						TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', length = 3000, text = 'Neonlights : ON' })
						--PT--TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', length = 3000, text = 'Neons : ON' })
						--ING--ESX.ShowNotification('Neonlights: ~g~ON')
						--PT--ESX.ShowNotification('Neons: ~g~ON')
						Wait(2000)
					end
				else
					TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', length = 5000, text = 'You need to have installed Neonlights?' })
					--PT--TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', length = 5000, text = 'Precisas de ter Neons instalados' })
					--ING--ESX.ShowNotification('You need to have installed Neonlights')
					--PT--ESX.ShowNotification('Precisas de ter Neons instalados')
					Wait(2000)
				end
            end
        else
            Wait(1000)
        end
    end
end)