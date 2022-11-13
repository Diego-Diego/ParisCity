local CurrentActionData = {}
local HasAlreadyEnteredMarker, OnJob = false, false
local LastStation, LastPart, LastPartNum, LastEntity, CurrentAction, CurrentActionMsg
isInShopMenu = false, false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
    ESX.PlayerLoaded = true
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
    ESX.PlayerLoaded = false
    ESX.PlayerData = {}
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
    local specialContact = {
        name = TranslateCap('phone_taxi'),
        number = 'taxi',
        base64Icon = 'data:image/png;base64,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'
    }

    TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

CreateThread(function()
	while true do
		local Sleep = 1000

		if CurrentAction then
			Sleep = 0
			ESX.ShowHelpNotification(CurrentActionMsg)
		end
	Wait(Sleep)
	end
end)

AddEventHandler('taxiJob:hasEnteredMarker', function(station, part, partNum)
	if part == 'Cloakroom' then
		CurrentAction = 'menu_cloakroom'
		CurrentActionMsg = "Appuyez sur E pour accéder au vestiaire"
		CurrentActionData = {}
	elseif part == 'ActionBoss' then
		CurrentAction     = 'menu_boss'
		CurrentActionMsg  = "Appuyez sur E pour accéder à l'action patron"
		CurrentActionData = {station = station}
	elseif part == 'Storage' then
		CurrentAction = 'storage'
		CurrentActionMsg = "Appuyez sur E pour accéder au coffre"
		CurrentActionData = {station = station}
	elseif part == 'Garage' then
		CurrentAction = 'garage'
		CurrentActionMsg = "Appuyez sur E pour accéder au garage"
		CurrentActionData = {station = station}
	elseif part == 'DeleteVehicle' then
        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        if IsPedInAnyVehicle(playerPed, false) and GetPedInVehicleSeat(vehicle, -1) == playerPed then
            CurrentAction = 'DeleteVehicle'
            CurrentActionMsg = "Appuyez sur E pour ranger votre véhicule"
            CurrentActionData = {
                vehicle = vehicle
            }
        end
	end
end)

AddEventHandler('taxiJob:hasExitedMarker', function(station, part, partNum)
	if not isInShopMenu then
		RageUI.CloseAll()
		open = false
	end

	CurrentAction = nil
end)

-- Draw markers and more
CreateThread(function()
	while true do
		local Sleep = 1500
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'taxi' then
			Sleep = 500
			local playerPed = PlayerPedId()
			local playerCoords = GetEntityCoords(playerPed)
			local isInMarker, hasExited = false, false
			local currentStation, currentPart, currentPartNum
            
            for k,v in pairs(Config.TaxiStations) do
                for i=1, #v.Cloakrooms, 1 do
                    local distance = #(playerCoords - v.Cloakrooms[i])
                    
                    if distance < Config.DrawDistance then
                        DrawMarker(Config.MarkerType.Cloakrooms, v.Cloakrooms[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.7, 0.7, 0.5, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
						Sleep = 0

						if distance < Config.MarkerSize.x then
							isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Cloakroom', i
						end
					end
				end

				for i=1, #v.ActionBoss, 1 do
					local distance = #(playerCoords - v.ActionBoss[i])

					if distance < Config.DrawDistance then
						DrawMarker(Config.MarkerType.ActionBoss, v.ActionBoss[i], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						Sleep = 0

						if distance < Config.MarkerSize.x then
							isInMarker, currentStation, currentPart, currentPartNum = true, k, 'ActionBoss', i
						end
					end
				end

				for i=1, #v.Storage, 1 do
					local distance = #(playerCoords - v.Storage[i])

					if distance < Config.DrawDistance then
						DrawMarker(Config.MarkerType.Storage, v.Storage[i], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						Sleep = 0

						if distance < Config.MarkerSize.x then
							isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Storage', i
						end
					end
				end

				for i=1, #v.Garage, 1 do
					local distance = #(playerCoords - v.Garage[i])

					if distance < Config.DrawDistance then
						DrawMarker(Config.MarkerType.Garage, v.Garage[i], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						Sleep = 0

						if distance < Config.MarkerSize.x then
							isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Garage', i
						end
					end
				end

				for i=1, #v.DeleteVehicle, 1 do
					local distance = #(playerCoords - v.DeleteVehicle[i])

					if distance < Config.DrawDistance then
						DrawMarker(Config.MarkerType.DeleteVehicle, v.DeleteVehicle[i], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 0.5, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						Sleep = 0

						if distance < Config.MarkerSize.x then
							isInMarker, currentStation, currentPart, currentPartNum = true, k, 'DeleteVehicle', i
						end
					end
				end
			end

			if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then
				if (LastStation and LastPart and LastPartNum) and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum) then
					TriggerEvent('taxiJob:hasExitedMarker', LastStation, LastPart, LastPartNum)
					hasExited = true
				end
				HasAlreadyEnteredMarker = true
				LastStation = currentStation
				LastPart = currentPart
				LastPartNum = currentPartNum
				TriggerEvent('taxiJob:hasEnteredMarker', currentStation, currentPart, currentPartNum)
			end
			if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('taxiJob:hasExitedMarker', LastStation, LastPart, LastPartNum)
			end
		end
        Wait(Sleep)
	end
end)

ESX.RegisterInput("taxiJob:interact", "(ESX taxiJob) Interact", "keyboard", "E", function()
	if not CurrentAction then 
		return 
	end
	if not ESX.PlayerData.job or (ESX.PlayerData.job and not ESX.PlayerData.job.name == 'taxi') then
		return
	end
	if CurrentAction == 'menu_cloakroom' then
        OpenCloakRoom()
	elseif CurrentAction == 'menu_boss' then
		TriggerEvent('esx_society:openBossMenu', 'taxi', function(data, menu)
			menu.close()
		end, {wash = false, grades = false})
	elseif CurrentAction == 'storage' then
		exports.ox_inventory:openInventory('stash', 'society_taxi')
	elseif CurrentAction == 'garage' then
		OpenGarage()
	elseif CurrentAction == 'DeleteVehicle' then
		if IsInAuthorizedVehicle() then
			ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
		
			if Config.MaxInService ~= -1 then
				TriggerServerEvent('esx_service:disableService', 'taxi')
			end
		else
			ESX.ShowNotification("Vous avez pas le droit de ranger se véhicule ici !")
		end
	end

	CurrentAction = nil
end)

function IsInAuthorizedVehicle()
    local playerPed = PlayerPedId()
    local vehModel = GetEntityModel(GetVehiclePedIsIn(playerPed, false))

    for i = 1, #Config.AuthorizedVehicles, 1 do
        if vehModel == joaat(Config.AuthorizedVehicles[i].model) then
            return true
        end
    end

    return false
end

RegisterCommand('taximenu', function()
    if not ESX.PlayerData.dead and ESX.PlayerData.job and ESX.PlayerData.job.name == 'taxi' then
        OpenMobileTaxiActionsMenu()
    end
end, false)

RegisterKeyMapping('taximenu', 'Ouvrir le menu Taxi', 'keyboard', 'f6')