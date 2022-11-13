local CurrentActionData, currentTask = {}, {}
local HasAlreadyEnteredMarker, isDead, playerInService, isInSellMenu = false, false, false, false
local LastStation, LastPart, LastPartNum, CurrentAction, CurrentActionMsg

local GUI = {}
GUI.Time = 0

ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1)
	end
end)

---------------------------
---- ENTER/EXIT MARKER ----
---------------------------
AddEventHandler('nwx_drugs:hasEnteredMarker', function(station, part, partNum)
	if part == 'WeedFarms' then
		CurrentAction = 'open_weed_harvest'
		CurrentActionMsg = 'Appuyez sur [E] pour récolter de la weed'
    CurrentActionData = {part = part}
  elseif part == 'WeedTransform' then
		CurrentAction = 'open_weed_transform'
		CurrentActionMsg = 'Appuyez sur [E] pour sécher de la weed'
		CurrentActionData = {part = part}
  elseif part == 'ReselWeed' then
		CurrentAction = 'open_reselweed'
		CurrentActionMsg = 'Appuyez sur [E] pour dealer avec le grossiste'
		CurrentActionData = {part = part}
	end
end)

AddEventHandler('nwx_drugs:hasExitedMarker', function(station, part, partNum)
	if not isInSellMenu then
		ESX.UI.Menu.CloseAll()
    if part == "WeedFarms" then
			TriggerServerEvent('nwx_drugs:stopHarvest')
    end
    if part == "WeedTransform" then
			TriggerServerEvent('nwx_drugs:stopTransform')
		end
	end

	CurrentAction = nil
end)

-----------------
---- MARKERS ----
-----------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local isInMarker, hasExited, letSleep = false, false, true
    local currentStation, currentPart, currentPartNum

    for k,v in pairs(Config.DrugsStations) do
      for i=1, #v.WeedFarms, 1 do
        local distance = #(playerCoords - v.WeedFarms[i])

        if distance < Config.DrawDistance then
          --DrawMarker(Config.MarkerWeedFarmsType, v.WeedFarms[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.5, 2.5, 0.5, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
          letSleep = false

          if distance < Config.MarkerSize.x then
            isInMarker, currentStation, currentPart, currentPartNum = true, k, 'WeedFarms', i
          end
        end
      end

      for i=1, #v.WeedTransform, 1 do
        local distance = #(playerCoords - v.WeedTransform[i])

        if distance < Config.DrawDistance then
          DrawMarker(Config.MarkerWeedTransformType, v.WeedTransform[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, 4.5, 4.5, 0.2, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
          letSleep = false

          if distance < Config.MarkerSize.x then
            isInMarker, currentStation, currentPart, currentPartNum = true, k, 'WeedTransform', i
          end
        end
      end

      for i=1, #v.ReselWeed, 1 do
        local distance = #(playerCoords - v.ReselWeed[i])

        if distance < Config.DrawDistance then
          DrawMarker(Config.MarkerReselWeedType, v.ReselWeed[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerReselColor.r, Config.MarkerReselColor.g, Config.MarkerReselColor.b, 100, false, true, 2, true, false, false, false)
          letSleep = false

          if distance < Config.MarkerSize.x then
            isInMarker, currentStation, currentPart, currentPartNum = true, k, 'ReselWeed', i
          end
        end
      end

      if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then
        if
          (LastStation and LastPart and LastPartNum) and
          (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
        then
          TriggerEvent('nwx_drugs:hasExitedMarker', LastStation, LastPart, LastPartNum)
          hasExited = true
        end

        HasAlreadyEnteredMarker = true
        LastStation = currentStation
        LastPart = currentPart
        LastPartNum = currentPartNum

        TriggerEvent('nwx_drugs:hasEnteredMarker', currentStation, currentPart, currentPartNum)
      end

      if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
        HasAlreadyEnteredMarker = false
        TriggerEvent('nwx_drugs:hasExitedMarker', LastStation, LastPart, LastPartNum)
      end

      if letSleep then
        Citizen.Wait(500)
      end
    end
  end
end)

------------------
---- CONTROLS ----
------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)

    if CurrentAction ~= nil then
      ESX.ShowHelpNotification(CurrentActionMsg)

      if IsControlJustReleased(0, 38) and not (IsPedSittingInAnyVehicle(playerPed)) and (GetGameTimer() - GUI.Time) > 1500 then

        if CurrentAction == 'open_weed_harvest' then
          TriggerServerEvent('nwx_drugs:startHarvest', CurrentActionData.part)
          CurrentAction = nil
        end

        if CurrentAction == 'open_weed_transform' then
          TriggerServerEvent('nwx_drugs:startTransform', CurrentActionData.part)
          CurrentAction = nil
        end
          
        if CurrentAction == 'open_reselweed' then
          if not RageUI.Visible(mainMenu) then
            openSellWeedMenu(CurrentActionData.part)
          end
        end
      end
      
    end

  end
end)