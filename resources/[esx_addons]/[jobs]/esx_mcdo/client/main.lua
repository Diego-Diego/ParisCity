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

AddEventHandler('macdoJob:hasEnteredMarker', function(station, part, partNum)
	if part == 'Command' then
		CurrentAction = 'Command'
		CurrentActionMsg = "Appuyez sur ~INPUT_CONTEXT~ pour passé ~y~commande"
		CurrentActionData = {}
	elseif part == 'Command2' then
		CurrentAction = 'Command2'
		CurrentActionMsg = "Appuyez sur ~INPUT_CONTEXT~ pour voir les ~y~commandes"
		CurrentActionData = {}
	elseif part == 'Garage' then
		CurrentAction = 'Garage'
		CurrentActionMsg = "Appuyez sur ~INPUT_CONTEXT~ pour voir les ~y~vehicules"
		CurrentActionData = {}
	elseif part == 'Cuisine' then
		CurrentAction = 'Cuisine'
		CurrentActionMsg = "Appuyez sur ~INPUT_CONTEXT~ pour ~y~cuisiner"
		CurrentActionData = {}
	end
end)

AddEventHandler('macdoJob:hasExitedMarker', function(station, part, partNum)
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

        Sleep = 500
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local isInMarker, hasExited = false, false
        local currentStation, currentPart, currentPartNum

		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mcd' then
            for k,v in pairs(_McDo.posEmployer) do
				local distance = #(playerCoords - v.Command2)
			
				if distance < _McDo.DrawDistance then
					DrawMarker(23, v.Command2, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.7, 0.7, 0.5, 255, 215, 0, 100, false, true, 2, false, false, false, false)
					Sleep = 0
	
					if distance < 1.5 then
						isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Command2', i
					end
				end
			end
			for k,v in pairs(_McDo.posEmployer) do
				local distance = #(playerCoords - v.Garage)
			
				if distance < _McDo.DrawDistance then
					DrawMarker(23, v.Garage, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.7, 0.7, 0.5, 255, 215, 0, 100, false, true, 2, false, false, false, false)
					Sleep = 0
	
					if distance < 1.5 then
						isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Garage', i
					end
				end
			end
			for k,v in pairs(_McDo.posEmployer) do
				local distance = #(playerCoords - v.Cuisine)
			
				if distance < _McDo.DrawDistance then
					DrawMarker(23, v.Cuisine, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.7, 0.7, 0.5, 255, 215, 0, 100, false, true, 2, false, false, false, false)
					Sleep = 0
	
					if distance < 1.5 then
						isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Cuisine', i
					end
				end
			end
		end
		for k,v in pairs(_McDo.posU) do
			local distance = #(playerCoords - v.Command)
			
			if distance < _McDo.DrawDistance then
				DrawMarker(23, v.Command, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.7, 0.7, 0.5, 255, 215, 0, 100, false, true, 2, false, false, false, false)
				Sleep = 0

				if distance < 1.5 then
					isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Command', i
				end
			end
		end

        if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then
            if (LastStation and LastPart and LastPartNum) and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum) then
                TriggerEvent('macdoJob:hasExitedMarker', LastStation, LastPart, LastPartNum)
                hasExited = true
            end
            HasAlreadyEnteredMarker = true
            LastStation = currentStation
            LastPart = currentPart
            LastPartNum = currentPartNum
            TriggerEvent('macdoJob:hasEnteredMarker', currentStation, currentPart, currentPartNum)
        end
        if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
            HasAlreadyEnteredMarker = false
            TriggerEvent('macdoJob:hasExitedMarker', LastStation, LastPart, LastPartNum)
        end

        Wait(Sleep)
	end
end)

ESX.RegisterInput("macdoJob:interact", "(ESX mcdonald's) Interact", "keyboard", "E", function()
	if not CurrentAction then
		return
	end
	if not ESX.PlayerData.job or (ESX.PlayerData.job and not ESX.PlayerData.job.name == 'mcd') then
		return
	end
	if CurrentAction == 'Command' then
        openCommand()
	elseif CurrentAction == 'Command2' then
		ESX.TriggerServerCallback('mcd:recupcommand', function(data)
			openCommand2(data)
		end)
	elseif CurrentAction == 'Garage' then
		openGarage()
	elseif CurrentAction == 'Cuisine' then
		openCuisine()
	end
	CurrentAction = nil
end)
