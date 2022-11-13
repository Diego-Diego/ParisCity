local PlayerData = {}
local handcuffTimer, dragStatus, currentTask, GUI = {}, {}, {}, {}
local isDead, IsHandcuffed, OnJob, IsSearching =  false, false, false, false
local GUI = {}
GUI.Time = 0
local amount = 0

local HasAlreadyEnteredMarker = false
local LastPart = nil

local CurrentAction = nil
local CurrentActionMsg = ''
local CurrentActionData = {}

local GCoffreEntreprise = false
local garageopen = false
local GarageBoatOpen = false
local GarageHelicleOpen = false
local openGestionsOrga = false
local noSpam = true
local blockMenu = false

dragStatus.isDragged, isInShopMenu = false, false

Citizen.CreateThread(function()
	PlayerData = ESX.GetPlayerData()
	TriggerServerEvent('gb:requestSync')
	
	while ActualGang == nil do
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setFaction')
AddEventHandler('esx:setFaction', function(faction)
	PlayerData.faction = faction
    TriggerServerEvent('gb:requestSync')
end)


AddEventHandler('GangsBuilderJob:hasEnteredMarker', function(part)
	if part == 'Armory' then
		CurrentAction = 'menu_armory'
		CurrentActionMsg = _U('open_armory')
		CurrentActionData = {}
	end

    if part == 'ArmoryBoss' then
		CurrentAction = 'menu_armoryboss'
		CurrentActionMsg = _U('open_armory_boss')
		CurrentActionData = {}
	end

	if part == 'VehicleSpawner' then
		CurrentAction = 'menu_vehicle_spawner'
		CurrentActionMsg = _U('vehicle_spawner')
		CurrentActionData = {}
	end

    if part == 'VehicleSpawner2' then
		CurrentAction = 'menu_vehicle_spawner2'
		CurrentActionMsg = _U('vehicle_spawner')
		CurrentActionData = {}
	end

	if part == 'VehicleDeleter' then
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed, false)

		if IsPedInAnyVehicle(playerPed, false) then
			local vehicle = GetVehiclePedIsIn(playerPed, false)

			if DoesEntityExist(vehicle) then
				CurrentAction = 'delete_vehicle'
				CurrentActionMsg = _U('store_vehicle')
				CurrentActionData = {vehicle = vehicle}
			end
		end
	end

	if part == 'HelicleSpawner' then
		CurrentAction = 'menu_helicle_spawner'
		CurrentActionMsg = 'Appuyez sur [~b~E~s~] pour ouvrir l\'Héliport'
		CurrentActionData = {}
	end

	if part == 'HelicleDeleter' then
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed, false)

		if IsPedInAnyVehicle(playerPed, false) then
			local vehicle = GetVehiclePedIsIn(playerPed, false)

			if DoesEntityExist(vehicle) then
				CurrentAction = 'delete_helicle'
				CurrentActionMsg = "Appuyez sur [~b~E~s~] pour stoker l'hélicoptère"
				CurrentActionData = {vehicle = vehicle}
			end
		end
	end

	if part == 'BoatSpawner' then
		CurrentAction = 'menu_boat_spawner'
		CurrentActionMsg = 'Appuyez sur [~b~E~s~] pour ouvrir le Garage à Bateaux'
		CurrentActionData = {}
	end

	if part == 'BoatDeleter' then
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed, false)

		if IsPedInAnyVehicle(playerPed, false) then
			local vehicle = GetVehiclePedIsIn(playerPed, false)

			if DoesEntityExist(vehicle) then
				CurrentAction = 'delete_boat'
				CurrentActionMsg = "Appuyez sur [~b~E~s~] pour stoker le bateau"
				CurrentActionData = {vehicle = vehicle}
			end
		end
	end

	if part == 'BossActions' then
		CurrentAction = 'menu_boss_actions'
		CurrentActionMsg = _U('open_bossmenu')
		CurrentActionData = {}
	end
end)

AddEventHandler('GangsBuilderJob:hasExitedMarker', function(part)
    RageUI.CloseAll()
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
    GCoffreEntreprise = false
    garageopen = false
    GarageHelicleOpen = false
    GarageBoatOpen = false
    openGestionsOrga = false
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if PlayerData.faction ~= nil and ActualGang then
			local coords = GetEntityCoords(PlayerPedId(), false)
			local isInMarker = false
			local currentPart = nil

            if GetDistanceBetweenCoords(coords, ActualGang.VehSpawner.x, ActualGang.VehSpawner.y, ActualGang.VehSpawner.z,  true) < Config.DrawDistance then
				DrawMarker(Config.MarkerType, ActualGang.VehSpawner.x, ActualGang.VehSpawner.y, ActualGang.VehSpawner.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize, Config.MarkerColor, 100, false, true, 2, false, false, false, false)
                
                if GetDistanceBetweenCoords(coords, ActualGang.VehSpawner.x, ActualGang.VehSpawner.y, ActualGang.VehSpawner.z, true) < Config.MarkerSize.x then
                    isInMarker = true
                    currentPart = 'VehicleSpawner'
                end
            end

            if GetDistanceBetweenCoords(coords, ActualGang.VehDeleter.x, ActualGang.VehDeleter.y, ActualGang.VehDeleter.z,  true) < Config.DrawDistance then
				DrawMarker(36, ActualGang.VehDeleter.x, ActualGang.VehDeleter.y, ActualGang.VehDeleter.z+1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize, Config.MarkerColor, 100, false, true, 2, false, false, false, false)
                
                if GetDistanceBetweenCoords(coords, ActualGang.VehDeleter.x, ActualGang.VehDeleter.y, ActualGang.VehDeleter.z, true) < Config.MarkerSize.x then
                    isInMarker = true
                    currentPart = 'VehicleDeleter'
                end
            end

            if (PlayerData.faction.name ~= "medellin" and PlayerData.faction.name ~= "families") or PlayerData.faction.grade > 0 then

                if GetDistanceBetweenCoords(coords, ActualGang.Armory.x, ActualGang.Armory.y, ActualGang.Armory.z,  true) < Config.DrawDistance then
                    DrawMarker(Config.MarkerType, ActualGang.Armory.x, ActualGang.Armory.y, ActualGang.Armory.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize, Config.MarkerColor, 100, false, true, 2, false, false, false, false)
                    
                    if GetDistanceBetweenCoords(coords, ActualGang.Armory.x, ActualGang.Armory.y, ActualGang.Armory.z, true) < Config.MarkerSize.x then
                        isInMarker = true
                        currentPart = 'Armory'
                    end
                end

                --[[if PlayerData.faction.name == "medellin" then
                    if GetDistanceBetweenCoords(coords, ActualGang.Armory2.x, ActualGang.Armory2.y, ActualGang.Armory2.z,  true) < Config.DrawDistance then
                        DrawMarker(Config.MarkerType, ActualGang.Armory2.x, ActualGang.Armory2.y, ActualGang.Armory2.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize, Config.MarkerColor, 100, false, true, 2, false, false, false, false)
                    end
                    if GetDistanceBetweenCoords(coords, ActualGang.Armory2.x, ActualGang.Armory2.y, ActualGang.Armory2.z, true) < Config.MarkerSize.x then
                        isInMarker = true
                        currentPart = 'Armory'
                    end
                end]]

                if PlayerData.faction.name == "medellin" then

                    if GetDistanceBetweenCoords(coords, ActualGang.VehSpawner2.x, ActualGang.VehSpawner2.y, ActualGang.VehSpawner2.z,  true) < Config.DrawDistance then
                        DrawMarker(Config.MarkerType, ActualGang.VehSpawner2.x, ActualGang.VehSpawner2.y, ActualGang.VehSpawner2.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize, Config.MarkerColor, 100, false, true, 2, false, false, false, false)
                        
                        if GetDistanceBetweenCoords(coords, ActualGang.VehSpawner2.x, ActualGang.VehSpawner2.y, ActualGang.VehSpawner2.z, true) < Config.MarkerSize.x then
                            isInMarker = true
                            currentPart = 'VehicleSpawner2'
                        end
                    end

                    if GetDistanceBetweenCoords(coords, ActualGang.VehDeleter2.x, ActualGang.VehDeleter2.y, ActualGang.VehDeleter2.z,  true) < Config.DrawDistance then
                        DrawMarker(36, ActualGang.VehDeleter2.x, ActualGang.VehDeleter2.y, ActualGang.VehDeleter2.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize, Config.MarkerColor, 100, false, true, 2, false, false, false, false)
                        
                        if GetDistanceBetweenCoords(coords, ActualGang.VehDeleter2.x, ActualGang.VehDeleter2.y, ActualGang.VehDeleter2.z, true) < 5 then
                            isInMarker = true
                            currentPart = 'VehicleDeleter'
                        end
                    end
                end

                if PlayerData.faction.name == "mercenaire" then

                    if GetDistanceBetweenCoords(coords, ActualGang.HelSpawner.x, ActualGang.HelSpawner.y, ActualGang.HelSpawner.z,  true) < Config.DrawDistance then
                        DrawMarker(Config.MarkerType, ActualGang.HelSpawner.x, ActualGang.HelSpawner.y, ActualGang.HelSpawner.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize, Config.MarkerColor, 100, false, true, 2, false, false, false, false)
                        
                        if GetDistanceBetweenCoords(coords, ActualGang.HelSpawner.x, ActualGang.HelSpawner.y, ActualGang.HelSpawner.z, true) < Config.MarkerSize.x then
                            isInMarker = true
                            currentPart = 'HelicleSpawner'
                        end
                    end
                    
                    if GetDistanceBetweenCoords(coords, ActualGang.HelDeleter.x, ActualGang.HelDeleter.y, ActualGang.HelDeleter.z,  true) < Config.DrawDistance then
                        DrawMarker(Config.MarkerType, ActualGang.HelDeleter.x, ActualGang.HelDeleter.y, ActualGang.HelDeleter.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize, Config.MarkerColor, 100, false, true, 2, false, false, false, false)
                        
                        if GetDistanceBetweenCoords(coords, ActualGang.HelDeleter.x, ActualGang.HelDeleter.y, ActualGang.HelDeleter.z, true) < 5 then
                            isInMarker = true
                            currentPart = 'HelicleDeleter'
                        end
                    end
                end

                if PlayerData.faction.name == "mercenaire" or PlayerData.faction.name == "ira" or PlayerData.faction.name == "kcorp" or PlayerData.faction.name == "londonmafia" then

                    if GetDistanceBetweenCoords(coords, ActualGang.BoatSpawner.x, ActualGang.BoatSpawner.y, ActualGang.BoatSpawner.z,  true) < Config.DrawDistance then
                        DrawMarker(Config.MarkerType, ActualGang.BoatSpawner.x, ActualGang.BoatSpawner.y, ActualGang.BoatSpawner.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize, Config.MarkerColor, 100, false, true, 2, false, false, false, false)
                        
                        if GetDistanceBetweenCoords(coords, ActualGang.BoatSpawner.x, ActualGang.BoatSpawner.y, ActualGang.BoatSpawner.z, true) < Config.MarkerSize.x then
                            isInMarker = true
                            currentPart = 'BoatSpawner'
                        end
                    end
                
                    if GetDistanceBetweenCoords(coords, ActualGang.BoatDeleter.x, ActualGang.BoatDeleter.y, ActualGang.BoatDeleter.z,  true) < Config.DrawDistance then
                        DrawMarker(35, ActualGang.BoatDeleter.x, ActualGang.BoatDeleter.y, ActualGang.BoatDeleter.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize, Config.MarkerColor, 100, false, true, 2, false, false, false, false)
                        
                        if GetDistanceBetweenCoords(coords, ActualGang.BoatDeleter.x, ActualGang.BoatDeleter.y, ActualGang.BoatDeleter.z, true) < 5 then
                            isInMarker = true
                            currentPart = 'BoatDeleter'
                        end
                    end
                end

                if PlayerData.faction ~= nil and PlayerData.faction.grade_name == 'boss' then
                    if PlayerData.faction.grade_name == 'boss' then
                        if GetDistanceBetweenCoords(coords, ActualGang.BossActions.x, ActualGang.BossActions.y, ActualGang.BossActions.z, true) < Config.DrawDistance then
                            DrawMarker(Config.MarkerType, ActualGang.BossActions.x, ActualGang.BossActions.y, ActualGang.BossActions.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize, Config.MarkerColor, 100, false, true, 2, false, false, false, false)
                        end
                        if GetDistanceBetweenCoords(coords, ActualGang.BossActions.x, ActualGang.BossActions.y, ActualGang.BossActions.z, true) < Config.MarkerSize.x then
                            isInMarker = true
                            currentPart = 'BossActions'
                        end
                    end
                end

                if PlayerData.faction ~= nil and (PlayerData.faction.grade_name == 'boss' or (PlayerData.faction.name == "mercenaire" and PlayerData.faction.grade > 0) or (PlayerData.faction.name == "ballas" and PlayerData.faction.grade > 2) or (PlayerData.faction.name == "madrazo" and PlayerData.faction.grade > 3) or (PlayerData.faction.name == "marabunta" and PlayerData.faction.grade > 2)) then
                    if GetDistanceBetweenCoords(coords, ActualGang.ArmoryBoss.x, ActualGang.ArmoryBoss.y, ActualGang.ArmoryBoss.z,  true) < Config.DrawDistance then
                        DrawMarker(Config.MarkerType, ActualGang.ArmoryBoss.x, ActualGang.ArmoryBoss.y, ActualGang.ArmoryBoss.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize, Config.MarkerColor, 100, false, true, 2, false, false, false, false)
                    end
                    
                    if GetDistanceBetweenCoords(coords, ActualGang.ArmoryBoss.x, ActualGang.ArmoryBoss.y, ActualGang.ArmoryBoss.z, true) < Config.MarkerSize.x then
                        isInMarker = true
                        currentPart = 'ArmoryBoss'
                    end
                end
            end

			local hasExited = false

			if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastPart ~= currentPart)) then
				if (LastPart ~= nil) and (LastPart ~= currentPart) then
					TriggerEvent('GangsBuilderJob:hasExitedMarker', LastPart)
					hasExited = true
				end

				HasAlreadyEnteredMarker = true
				LastPart = currentPart

				TriggerEvent('GangsBuilderJob:hasEnteredMarker', currentPart)
			end

			if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('GangsBuilderJob:hasExitedMarker', LastPart)
			end
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction ~= nil then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlPressed(0, 38) and PlayerData.faction ~= nil and ActualGang and (GetGameTimer() - GUI.Time) > 150 then

				if CurrentAction == 'menu_armory' then
					OpenCoffre()
				end
                
                if CurrentAction == 'menu_armoryboss' then
					OpenCoffreBoss()
				end

				if CurrentAction == 'menu_vehicle_spawner' then
					OpenGarage()
				end

                if CurrentAction == 'menu_vehicle_spawner2' then
					OpenGarage(true)
				end

				if CurrentAction == 'menu_helicle_spawner' then
					OpenGarageHelicle()
				end

				if CurrentAction == 'delete_helicle' then
					local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
					local Classvehicle = GetVehicleClass(CurrentActionData.vehicle)
					if Classvehicle == 15 then
						TriggerServerEvent('esx_societyfaction:putHelicleInGarageFaction', ActualGang.Name, vehicleProps)
						ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
					end
				end

				if CurrentAction == 'menu_boat_spawner' then
					OpenGarageBoat()
				end

				if CurrentAction == 'delete_boat' then
					local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
					local Classvehicle = GetVehicleClass(CurrentActionData.vehicle)
					if Classvehicle == 14 then
						TriggerServerEvent('esx_societyfaction:putBoatInGarageFaction', ActualGang.Name, vehicleProps)

                        local pedsInBoat = {}

                        for i=-1,6 do
                            local playerPedInBoat = GetPedInVehicleSeat(CurrentActionData.vehicle, i)
                            if playerPedInBoat ~= 0 then
                                pedsInBoat[i] = playerPedInBoat
                            end
                        end

						ESX.Game.DeleteVehicle(CurrentActionData.vehicle)

                        for k,v in pairs(pedsInBoat) do
                            SetEntityCoords(v, ActualGang.BoatSpawner.x, ActualGang.BoatSpawner.y, ActualGang.BoatSpawner.z)
                        end
					end
				end

				if CurrentAction == 'delete_vehicle' then
					local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
                    
                    if string.match(vehicleProps.plate, 'MCEV') then
                        ESX.ShowNotification("Vous n'avez pas le droit de voler les véhicules du MCEvent !")
                    else
                        ESX.TriggerServerCallback('esx_societyfaction:getVehiclesInGarageFaction', function(vehicles)
                            local found
                            for i = 1, #vehicles, 1 do
                                if vehicles[i].plate == vehicleProps.plate then
                                    found = true
                                    break
                                end
                            end
                            if found then
                                ESX.ShowNotification("~r~Ce véhicule est déja dans le garage")
                            else
                                ESX.TriggerServerCallback('eden_garage:stockv', function(valid)
                                    TriggerServerEvent('esx_societyfaction:putVehicleInGarageFaction', ActualGang.Name, vehicleProps, GetDisplayNameFromVehicleModel(vehicleProps.model))
                                    TriggerServerEvent('eden_garage:modifystate', vehicleProps, 'VolerGang')
                                    ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
                                end, vehicleProps)
                            end
                        end, PlayerData.faction.name)
                    end			
				end

				if CurrentAction == 'menu_boss_actions' then
                    OpenGestionsOrga()
					--TriggerEvent('esx_societyfaction:openBossMenu', ActualGang.Name, function(data, menu)
						--menu.close()
					  --end)
				end

				CurrentAction = nil
				GUI.Time = GetGameTimer()
			end
		end
	end
end)

RegisterCommand('illegalmenu', function()
    if PlayerData.faction ~= nil and ActualGang then
        if not blockMenu then
            OpenF7(true)
        end
    end
end, false)

RegisterKeyMapping('illegalmenu', 'Ouvrir le menu illégal', 'keyboard', 'F7')

RMenu.Add('Garage', 'SortieGarage', RageUI.CreateMenu("Garage", "Que voulez-vous sortir ?", nil, 160))
RMenu:Get('Garage', 'SortieGarage').Closed = function()
    RageUI.CloseAll()
    garageopen = false
    HasAlreadyEnteredMarker = false
end;

function OpenGarage(bool)
    garageopen = true
    RageUI.Visible(RMenu:Get('Garage', 'SortieGarage'), not RageUI.Visible(RMenu:Get('Garage', 'SortieGarage')))
    ESX.TriggerServerCallback('esx_societyfaction:getVehiclesInGarageFaction', function(vehicles)
        while garageopen do
			RageUI.IsVisible(RMenu:Get('Garage', 'SortieGarage'), function()

                RageUI.Button('Rechercher un Véhicule', nil, {RightLabel = GarageMenu.Filtre}, true, {
                    onSelected = function()
                        DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 20)
                        while (UpdateOnscreenKeyboard() == 0) do
                            DisableAllControlActions(0);
                            Citizen.Wait(1)
                        end
                        if (GetOnscreenKeyboardResult()) then
                            GarageMenu.Filtre = GetOnscreenKeyboardResult()
                        end 
                    end,
                })

                for i = 1, #vehicles, 1 do
                    vehiclen = GetDisplayNameFromVehicleModel(vehicles[i].model)
                    if GarageMenu.Filtre == "" or string.match(vehiclen:lower(), GarageMenu.Filtre:lower()) then
                        RageUI.Button(""..vehiclen, nil, {RightLabel = '~r~' .. vehicles[i].plate}, true, {
                            onSelected = function()
                                ESX.TriggerServerCallback('esx_societyfaction:getVehiclesInGarageFaction', function(vehiclesInGarage)
                                    local found
                                    for j = 1, #vehiclesInGarage, 1 do
                                        if vehiclesInGarage[j].plate == vehicles[i].plate then
                                            found = true
                                            if bool then
                                                if ESX.Game.IsSpawnPointClear(ActualGang.VehSpawnPoint2, 5.0) then
                                                    local getvehicle = vehiclesInGarage[j].model
                                                    ESX.Game.SpawnVehicle(vehiclesInGarage[j].model, ActualGang.VehSpawnPoint2, ActualGang.VehSpawnHeading2, function(vehicle)
                                                        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                                                        ESX.Game.SetVehicleProperties(vehicle, vehiclesInGarage[j])
                                                    end)
                                                    RageUI.CloseAll()
                                                    garageopen = false
                                                    TriggerServerEvent('esx_societyfaction:removeVehicleFromGarageFaction', ActualGang.Name, vehiclesInGarage[j], vehiclen)
                                                    TriggerServerEvent('eden_garage:modifystate', vehiclesInGarage[j], 'Sortie')
                                                else
                                                    ESX.ShowNotification('Sortie ~r~obstruée')
                                                end
                                            else
                                                if ESX.Game.IsSpawnPointClear(ActualGang.VehSpawnPoint, 5.0) then
                                                    local getvehicle = vehiclesInGarage[j].model
                                                    ESX.Game.SpawnVehicle(vehiclesInGarage[j].model, ActualGang.VehSpawnPoint, ActualGang.VehSpawnHeading, function(vehicle)
                                                        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                                                        ESX.Game.SetVehicleProperties(vehicle, vehiclesInGarage[j])
                                                    end)
                                                    RageUI.CloseAll()
                                                    garageopen = false
                                                    TriggerServerEvent('esx_societyfaction:removeVehicleFromGarageFaction', ActualGang.Name, vehiclesInGarage[j], vehiclen)
                                                    TriggerServerEvent('eden_garage:modifystate', vehiclesInGarage[j], 'Sortie')
                                                else
                                                    ESX.ShowNotification('Sortie ~r~obstruée')
                                                end
                                            end
                                            break
                                        end
                                    end

                                    vehicles = vehiclesInGarage
                                    
                                    if not found then
                                        ESX.ShowNotification("~r~Ce véhicule n'est plus dans le garage !")
                                    end
                                end, PlayerData.faction.name)
                            end,
                        })
                    end
                end
                RageUI.Button("Fermer le Menu", nil, {RightLabel = "", Color = { BackgroundColor = RageUI.ItemsColour.Red }}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        garageopen = false
                        HasAlreadyEnteredMarker = false
                    end,
                })
            end, function() 
            end)
            Citizen.Wait(5)
        end
    end, ActualGang.Name)
end

local GarageHelicleOpen = false
RMenu.Add('GarageHelicle', 'SortieGarage', RageUI.CreateMenu("Héliport", "Que voulez-vous sortir ?", nil, 160))

RMenu:Get('GarageHelicle', 'SortieGarage').Closed = function()
    RageUI.CloseAll()
    GarageHelicleOpen = false
    HasAlreadyEnteredMarker = false
end;
RMenu:Get('GarageHelicle', 'SortieGarage').EnableMouse = false
RMenu:Get('GarageHelicle', 'SortieGarage').onIndexChange = function(Index)
end

function OpenGarageHelicle()
    GarageHelicleOpen = true
    RageUI.Visible(RMenu:Get('GarageHelicle', 'SortieGarage'), not RageUI.Visible(RMenu:Get('GarageHelicle', 'SortieGarage')))
    ESX.TriggerServerCallback('esx_societyfaction:getHelicleInGarageFaction', function(vehicles)
        while GarageHelicleOpen do
			RageUI.IsVisible(RMenu:Get('GarageHelicle', 'SortieGarage'), function()
                for i = 1, #vehicles, 1 do
                    vehiclen = GetDisplayNameFromVehicleModel(vehicles[i].model)
                    RageUI.Button("Véhicule : "..vehiclen, "Plaque du Véhicule : "..vehicles[i].plate, {RightLabel = "Dans le Garage"}, true, {
                        onSelected = function()
                            if noSpam then
                                noSpam = false
                                if ESX.Game.IsSpawnPointClear(ActualGang.HelSpawnPoint, 5.0) then
                                    local getvehicle = vehicles[i].model
                                    ESX.Game.SpawnVehicle(vehicles[i].model, ActualGang.HelSpawnPoint, ActualGang.HelSpawnHeading, function(vehicle)
                                        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                                        ESX.Game.SetVehicleProperties(vehicle, vehicles[i])
                                    end)
                                    RageUI.CloseAll()
                                    GarageHelicleOpen = false
                                    HasAlreadyEnteredMarker = false
                                    local vehprops = ESX.Game.GetVehicleProperties(vehicle)
                                    TriggerServerEvent('esx_societyfaction:removeHelicleFromGarageFaction', ActualGang.Name, vehicles[i])
                                else
                                    ESX.ShowNotification('Sortie ~r~obstruée')
                                end
                                Citizen.Wait(50)
                                noSpam = true
                            end
                        end,
                    })
                end
                RageUI.Button("Fermer le Menu", nil, {RightLabel = "", Color = { BackgroundColor = RageUI.ItemsColour.Red }}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        GarageHelicleOpen = false
                        HasAlreadyEnteredMarker = false
                    end,
                })
            end, function() 
            end)
            Citizen.Wait(0)
        end
    end, ActualGang.Name)
end

RMenu.Add('GarageBoat', 'SortieGarage', RageUI.CreateMenu("Garage à Bateaux", "Que voulez-vous sortir ?", nil, 160))
RMenu:Get('GarageBoat', 'SortieGarage').Closed = function()
    RageUI.CloseAll()
    GarageBoatOpen = false
    HasAlreadyEnteredMarker = false
end;
RMenu:Get('GarageBoat', 'SortieGarage').EnableMouse = false
RMenu:Get('GarageBoat', 'SortieGarage').onIndexChange = function(Index)
end

function OpenGarageBoat()
    GarageBoatOpen = true
    RageUI.Visible(RMenu:Get('GarageBoat', 'SortieGarage'), not RageUI.Visible(RMenu:Get('GarageBoat', 'SortieGarage')))
    ESX.TriggerServerCallback('esx_societyfaction:getBoatInGarageFaction', function(vehicles)
        while GarageBoatOpen do
			RageUI.IsVisible(RMenu:Get('GarageBoat', 'SortieGarage'), function()
                for i = 1, #vehicles, 1 do
                    vehiclen = GetDisplayNameFromVehicleModel(vehicles[i].model)
                    RageUI.Button("Véhicule : "..vehiclen, "Plaque du Véhicule : "..vehicles[i].plate, {RightLabel = "Dans le Garage"}, true, {
                        onSelected = function()
                            if noSpam then
                                noSpam = false
                                if ESX.Game.IsSpawnPointClear(ActualGang.BoatSpawnPoint, 5.0) then
                                    local getvehicle = vehicles[i].model
                                    ESX.Game.SpawnVehicle(vehicles[i].model, ActualGang.BoatSpawnPoint, ActualGang.BoatSpawnHeading, function(vehicle)
                                        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                                        ESX.Game.SetVehicleProperties(vehicle, vehicles[i])
                                    end)
                                    RageUI.CloseAll()
                                    GarageBoatOpen = false
                                    HasAlreadyEnteredMarker = false
                                    local vehprops = ESX.Game.GetVehicleProperties(vehicle)
                                    TriggerServerEvent('esx_societyfaction:removeBoatFromGarageFaction', ActualGang.Name, vehicles[i])
                                else
                                    ESX.ShowNotification('Sortie ~r~obstruée')
                                end
                                Citizen.Wait(50)
                                noSpam = true
                            end
                        end,
                    })
                end
                RageUI.Button("Fermer le Menu", nil, {RightLabel = "", Color = { BackgroundColor = RageUI.ItemsColour.Red }}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        GarageBoatOpen = false
                        HasAlreadyEnteredMarker = false
                    end,
                })
            end, function() 
            end)
            Citizen.Wait(0)
        end
    end, ActualGang.Name)
end

local openf7 = false
RMenu.Add('GangMenu', 'main', RageUI.CreateMenu("Menu d'Interaction", " ", nil , 160))
RMenu:Get('GangMenu', 'main').Closed = function()
    RageUI.CloseAll()
    openf7 = false
end;
RMenu:Get('GangMenu', 'main').EnableMouse = false
RMenu:Get('GangMenu', 'main').onIndexChange = function(Index)
end

local Shun_Gang = {
	list = 1,
	list2 = 1,
	list3 = 1,
	list4 = 1
}
function OpenF7(boolIllegal)
    if openf7 then openf7 = false RageUI.CloseAll() return end
    openf7 = true
    RageUI.Visible(RMenu:Get('GangMenu', 'main'), not RageUI.Visible(RMenu:Get('GangMenu', 'main')))
	while openf7 do
		RageUI.IsVisible(RMenu:Get('GangMenu', 'main'), function()
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			if closestPlayer ~= -1 and closestDistance <= 3.0 then
				RageUI.Button("Fouiller la Personne", nil, {RightLabel = "→"}, true, {
					onSelected = function()
						RageUI.CloseAll()
						openf7 = false
						OpenFouille(closestPlayer, boolIllegal)
					end,
				})
				RageUI.List("Interaction sur la Personne", {
					{ Name = "~r~Menotter / Démenotter~s~", Value = 1 },
					{ Name = "~o~Prendre les poignets~s~", Value = 2 },
				}, Shun_Gang.list, nil, {}, true, {
					onListChange = function(Index, Item)
						Shun_Gang.list = Index;
					end,
					onSelected = function(Index, Item)
						Shun_Gang.list = Index;
						if Index == 1 then
							TriggerServerEvent('MyCity_Facitons:handcuff', GetPlayerServerId(closestPlayer))
						elseif Index == 2 then
							TriggerServerEvent('MyCity_Facitons:drag', GetPlayerServerId(closestPlayer))
						end
					end,
				})

                if boolIllegal then
                    RageUI.List("Forcer à genoux", {
                        { Name = "~r~Mettre à Genoux~s~", Value = 1 },
                        { Name = "~o~Relever~s~", Value = 2 },
                    }, Shun_Gang.list3, nil, {}, true, {
                        onListChange = function(Index, Item)
                            Shun_Gang.list3 = Index;
                        end,
                        onSelected = function(Index, Item)
                            Shun_Gang.list3 = Index;
                            if Index == 1 then
                                makeSurrender()
                            elseif Index == 2 then
                                makeCancelEmote()
                            end
                        end,
                    })

                    RageUI.List("Forcer les mains", {
                        { Name = "~r~Mettre les mains derrière la tête~s~", Value = 1 },
                        { Name = "~o~Enlever les mains de la tête~s~", Value = 2 },
                    }, Shun_Gang.list4, nil, {}, true, {
                        onListChange = function(Index, Item)
                            Shun_Gang.list4 = Index;
                        end,
                        onSelected = function(Index, Item)
                            Shun_Gang.list4 = Index;
                            if Index == 1 then
                                makeSurrender2()
                            elseif Index == 2 then
                                makeCancelEmote()
                            end
                        end,
                    })
                end

				RageUI.List("Interaction Personne avec Véhicule", {
					{ Name = "~b~Jeter~s~", Value = 1 },
					{ Name = "~o~Sortir~s~", Value = 2 },
				}, Shun_Gang.list2, nil, {}, true, {
					onListChange = function(Index, Item)
						Shun_Gang.list2 = Index;
					end,
					onSelected = function(Index, Item)
						Shun_Gang.list2 = Index;
						if Index == 1 then
							TriggerServerEvent('MyCity_Facitons:putInVehicle', GetPlayerServerId(closestPlayer))
						elseif Index == 2 then
							TriggerServerEvent('MyCity_Facitons:OutVehicle', GetPlayerServerId(closestPlayer))
						end
					end,
				})
                
			else
				RageUI.Button("Fouiller la Personne", nil, {RightBadge = RageUI.BadgeStyle.Lock}, true, {
					onSelected = function()
						exports.pNotify:SendNotificationMC("Aucune personne à proximité")
					end,
				})
				RageUI.Button("Interaction sur la Personne", nil, {RightBadge = RageUI.BadgeStyle.Lock}, true, {
					onSelected = function()
						exports.pNotify:SendNotificationMC("Aucune personne à proximité")
					end,
				})
                if boolIllegal then
                    RageUI.Button("Forcer à genoux", nil, {RightBadge = RageUI.BadgeStyle.Lock}, true, {
                        onSelected = function()
                            exports.pNotify:SendNotificationMC("Aucune personne à proximité")
                        end,
                    })
                    RageUI.Button("Forcer les mains", nil, {RightBadge = RageUI.BadgeStyle.Lock}, true, {
                        onSelected = function()
                            exports.pNotify:SendNotificationMC("Aucune personne à proximité")
                        end,
                    })
                end
				RageUI.Button("Interaction Personne avec Véhicule", nil, {RightBadge = RageUI.BadgeStyle.Lock}, true, {
					onSelected = function()
						exports.pNotify:SendNotificationMC("Aucune personne à proximité")
					end,
				})
			end
		end, function() 
		end) 
		Citizen.Wait(0)
	end
end



local fouilleopen = false
RMenu.Add('Fouille', 'main', RageUI.CreateMenu("Fouille", "Voici ses poches", nil, 160))
RMenu:Get('Fouille', 'main').Closed = function()
    RageUI.CloseAll()
    fouilleopen = false
end;
RMenu:Get('Fouille', 'main').EnableMouse = false
RMenu:Get('Fouille', 'main').onIndexChange = function(Index)
end

function OpenFouille(player, boolIllegal)
    fouilleopen = true

    RageUI.Visible(RMenu:Get('Fouille', 'main'), not RageUI.Visible(RMenu:Get('Fouille', 'main')))
    ESX.TriggerServerCallback('MyCity_Factions:getOtherPlayerData', function(data)
        while fouilleopen do
            IsSearching = true
		    PlayerSearched = player

            RageUI.IsVisible(RMenu:Get('Fouille', 'main'), function()
                if boolIllegal then
                    RageUI.Separator("↓ CARTE SIM ~s~↓")
                    RageUI.Button('SIM dans le téléphone ~s~:', nil, { RightLabel = data.phone_number }, true, {
                        onSelected = function()
                        end,
                    })
                end
                RageUI.Separator("↓ Argent ~s~↓")
                for i=1, #data.accounts, 1 do
                    if data.accounts[i].name == 'black_money' and data.accounts[i].money > 0 then
                        RageUI.Button('Argent ~s~:', nil, { RightLabel = "$ "..ESX.Math.Round(data.accounts[i].money) }, true, {
                            onSelected = function()
                                value = 'black_money'
                                itemType = 'item_account'
                                amount = data.accounts[i].money
                                TriggerServerEvent('MyCity_Factions:confiscatePlayerItem', GetPlayerServerId(player), itemType, value, amount)
                                RageUI.CloseAll()
                                fouilleopen = false
                                Citizen.Wait(250)
                            end,
                        })
                    end
                end
                RageUI.Separator("↓ ~o~Armes ~s~↓")
                for i=1, #data.weapons, 1 do
                    RageUI.Button('Armes : ~o~'..ESX.GetWeaponLabel(data.weapons[i].name), nil, { RightLabel ="Munitions : ~o~"..data.weapons[i].ammo}, true, {
                        onSelected = function()
                            value = data.weapons[i].name
                            itemType = 'item_weapon'
                            amount = data.weapons[i].ammo
                            TriggerServerEvent('MyCity_Factions:confiscatePlayerItem', GetPlayerServerId(player), itemType, value, amount)
                            RageUI.CloseAll()
                            fouilleopen = false
                            Citizen.Wait(250)
                        end,
                    })
                end
                RageUI.Separator("↓ Objets ~s~↓")
                for i=1, #data.inventory, 1 do
                    if data.inventory[i].count > 0 then
                        RageUI.Button('Objets : '..data.inventory[i].label , nil, { RightLabel = "x"..data.inventory[i].count }, true, {
                            onSelected = function()
                                value = data.inventory[i].name
                                itemType = 'item_standard'
                                amount = data.inventory[i].count
                                TriggerServerEvent('MyCity_Factions:confiscatePlayerItem', GetPlayerServerId(player), itemType, value, amount)
                                RageUI.CloseAll()
                                fouilleopen = false
                                Citizen.Wait(250)
                            end,
                        })
                    end
                end

                RageUI.Button("Fermer le Menu", nil, {RightLabel = "→", Color = { BackgroundColor = RageUI.ItemsColour.Red }}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        fouilleopen = false
                        IsSearching = false
			            PlayerSearched = nil
                    end,
                })

            end, function() 
            end)
            Citizen.Wait(0)
        end
        Citizen.Wait(50)
        TriggerServerEvent('MyCity_Factions:stopBlockMenuSv', GetPlayerServerId(player))
    end, GetPlayerServerId(player))
end

local fouilleopenconf = false
RMenu.Add('Fouille', 'ConfirmeItem', RageUI.CreateMenu("Fouille", "Le vol c'est pas bien !", nil, 160))
RMenu:Get('Fouille', 'ConfirmeItem').Closed = function()
    RageUI.CloseAll()
    fouilleopenconf = false
end;
RMenu:Get('Fouille', 'ConfirmeItem').EnableMouse = false
RMenu:Get('Fouille', 'ConfirmeItem').onIndexChange = function(Index)
end

quantiterf = 0
function GetItemFouille()
    fouilleopenconf = true
    RageUI.Visible(RMenu:Get('Fouille', 'ConfirmeItem'), not RageUI.Visible(RMenu:Get('Fouille', 'ConfirmeItem')))
    Citizen.CreateThread(function()
        while fouilleopenconf do
            RageUI.IsVisible(RMenu:Get('Fouille', 'ConfirmeItem'), function()
                RageUI.Separator("Item : "..itemlabelf)
                RageUI.Separator("Il y en a actuellement x"..itemcountf.." ~s~sur lui")
                RageUI.Button("Choisir la Quantité : ", nil, {RightLabel = "x"..quantiterf}, true, {
                    onSelected = function()
                        local montant = KeyboardInput('Quantiter ', "", 1)
                        if montant ~= "" then
                            quantiterf = RoundNumber(montant)
                        end
                    end,
                });

                RageUI.Button("Lui Prendre", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        fouilleopenconf = false
                        TriggerServerEvent('Shun_LSPD:confiscatePlayerItem', GetPlayerServerId(player), itemtypef, itemnamef, quantiterf)
                    end,
                })

                RageUI.Button("Fermer le Menu", nil, {RightLabel = "→", Color = { BackgroundColor = RageUI.ItemsColour.Red }}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        fouilleopenconf = false
                    end,
                })
            end, function() 
            end)
            Citizen.Wait(0)
        end
    end)
end

local fouilleopenconfw = false
RMenu.Add('Fouille', 'ConfirmeWeapon', RageUI.CreateMenu("Fouille", "La vol c'est pas bien !", nil, 160))
RMenu:Get('Fouille', 'ConfirmeWeapon').Closed = function()
    RageUI.CloseAll()
    fouilleopenconfw = false
end;
RMenu:Get('Fouille', 'ConfirmeWeapon').EnableMouse = false
RMenu:Get('Fouille', 'ConfirmeWeapon').onIndexChange = function(Index)
end

quantiterf = 0
function GetWeaponFouille()
    fouilleopenconfw = true
    RageUI.Visible(RMenu:Get('Fouille', 'ConfirmeWeapon'), not RageUI.Visible(RMenu:Get('Fouille', 'ConfirmeWeapon')))
    Citizen.CreateThread(function()
        while fouilleopenconfw do
            RageUI.IsVisible(RMenu:Get('Fouille', 'ConfirmeWeapon'), function()
                RageUI.Separator("Armes : "..ESX.GetWeaponLabel(weaponnamef))
                RageUI.Button("Lui Prendre", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        fouilleopenconfw = false
                        TriggerServerEvent('Shun_Gang:confiscatePlayerItem', GetPlayerServerId(player), itemtypef, weaponnamef, weaponammof)
                    end,
                })

                RageUI.Button("Fermer le Menu", nil, {RightLabel = "→", Color = { BackgroundColor = RageUI.ItemsColour.Red }}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        fouilleopenconfw = false
                    end,
                })
            end, function() 
            end)
            Citizen.Wait(0)
        end
    end)
end

RegisterNetEvent('MyCity_Factions:blockOpenMenu')
AddEventHandler('MyCity_Factions:blockOpenMenu', function()
    blockMenu = true
    Citizen.Wait(50)
    ESX.ShowNotification('Vous êtes fouillé !')
	Citizen.CreateThread(function()
        while blockMenu do
            Citizen.Wait(0)
            DisableControlAction(0, 289)
            DisableControlAction(0, 38)
        end
    end)

    Citizen.Wait(50)
    RageUI.CloseAll()
    ESX.UI.Menu.CloseAll()
    TriggerEvent('esx_inventoryhud:forceCloseInventory')
end)

RegisterNetEvent('MyCity_Factions:stopBlockMenu')
AddEventHandler('MyCity_Factions:stopBlockMenu', function()
	blockMenu = false
end)

RegisterNetEvent('MyCity_Facitons:handcuff')
AddEventHandler('MyCity_Facitons:handcuff', function()
	isHandcuffed = not isHandcuffed
	local playerPed = PlayerPedId()

	if isHandcuffed then
		RequestAnimDict('mp_arresting')
		while not HasAnimDictLoaded('mp_arresting') do
			Citizen.Wait(100)
		end

		TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)

		SetEnableHandcuffs(playerPed, true)
		DisablePlayerFiring(playerPed, true)
		SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
		SetPedCanPlayGestureAnims(playerPed, false)
		--FreezeEntityPosition(playerPed, true)
		DisplayRadar(false)

		if Config.EnableHandcuffTimer then
			if handcuffTimer.active then
				ESX.ClearTimeout(handcuffTimer.task)
			end

			StartHandcuffTimer()
		end
	else
		if Config.EnableHandcuffTimer and handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		--FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)
	end
end)

RegisterNetEvent('MyCity_Facitons:unrestrain')
AddEventHandler('MyCity_Facitons:unrestrain', function()
	if isHandcuffed then
		local playerPed = PlayerPedId()
		isHandcuffed = false

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		--FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)

		-- end timer
		if Config.EnableHandcuffTimer and handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end
	end
end)

-- handcuff timer, unrestrain the player after an certain amount of time
function StartHandcuffTimer()
	if Config.EnableHandcuffTimer and handcuffTimer.active then
		ESX.ClearTimeout(handcuffTimer.task)
	end

	handcuffTimer.active = true

	handcuffTimer.task = ESX.SetTimeout(Config.HandcuffTimer, function()
		ESX.ShowNotification(_U('unrestrained_timer'))
		TriggerEvent('MyCity_Facitons:unrestrain')
		handcuffTimer.active = false
	end)
end

RegisterNetEvent('MyCity_Facitons:drag')
AddEventHandler('MyCity_Facitons:drag', function(copId)
	if isHandcuffed then
		dragStatus.isDragged = not dragStatus.isDragged
		dragStatus.CopId = copId
	end
end)

Citizen.CreateThread(function()
	local wasDragged

	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()

		if isHandcuffed and dragStatus.isDragged then
			local targetPed = GetPlayerPed(GetPlayerFromServerId(dragStatus.CopId))

			if DoesEntityExist(targetPed) and IsPedOnFoot(targetPed) and not IsPedDeadOrDying(targetPed, true) then
				if not wasDragged then
					AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
					wasDragged = true
				else
					Citizen.Wait(1000)
				end
			else
				wasDragged = false
				dragStatus.isDragged = false
				DetachEntity(playerPed, true, false)
			end
		elseif wasDragged then
			wasDragged = false
			DetachEntity(playerPed, true, false)
		else
			Citizen.Wait(500)
		end
	end
end)

RegisterNetEvent('MyCity_Facitons:putInVehicle')
AddEventHandler('MyCity_Facitons:putInVehicle', function()
	if isHandcuffed then
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if IsAnyVehicleNearPoint(coords, 5.0) then
			local vehicle = GetClosestVehicle(coords, 5.0, 0, 71)

			if DoesEntityExist(vehicle) then
				local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

				for i=maxSeats - 1, 0, -1 do
					if IsVehicleSeatFree(vehicle, i) then
						freeSeat = i
						break
					end
				end

				if freeSeat then
					TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
					dragStatus.isDragged = false
				end
			end
		end
	end
end)

RegisterNetEvent('MyCity_Facitons:OutVehicle')
AddEventHandler('MyCity_Facitons:OutVehicle', function()
	local playerPed = PlayerPedId()

	if IsPedSittingInAnyVehicle(playerPed) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		TaskLeaveVehicle(playerPed, vehicle, 64)
	end
end)

-- Handcuff
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()

		if isHandcuffed then
			--DisableControlAction(0, 1, true) -- Disable pan
			--DisableControlAction(0, 2, true) -- Disable tilt
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1
			--DisableControlAction(0, 32, true) -- W
			--DisableControlAction(0, 34, true) -- A
			--DisableControlAction(0, 31, true) -- S
			--DisableControlAction(0, 30, true) -- D

			DisableControlAction(0, 45, true) -- Reload
			--DisableControlAction(0, 22, true) -- Jump
			DisableControlAction(0, 44, true) -- Cover
			DisableControlAction(0, 37, true) -- Select Weapon
			DisableControlAction(0, 23, true) -- Also 'enter'?

			DisableControlAction(0, 288,  true) -- Disable phone
			DisableControlAction(0, 289, true) -- Inventory
			DisableControlAction(0, 170, true) -- Animations
			DisableControlAction(0, 167, true) -- Job

			DisableControlAction(0, 0, true) -- Disable changing view
			DisableControlAction(0, 26, true) -- Disable looking behind
			DisableControlAction(0, 73, true) -- Disable clearing animation
			DisableControlAction(2, 199, true) -- Disable pause screen

			DisableControlAction(0, 59, true) -- Disable steering in vehicle
			DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
			DisableControlAction(0, 72, true) -- Disable reversing in vehicle

			DisableControlAction(2, 36, true) -- Disable going stealth

			DisableControlAction(0, 47, true)  -- Disable weapon
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle

			if IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) ~= 1 then
				ESX.Streaming.RequestAnimDict('mp_arresting', function()
					TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
				end)
			end
		else
			Citizen.Wait(500)
		end
	end
end)

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local StockMenu2 = {
	ItemSelected = {},
	ItemIndex = {},
	WeaponData = {}
}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end

	while ESX.GetPlayerData().faction == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
	TriggerServerEvent('gb:requestSync')
	
	while ActualGang == nil do
		Citizen.Wait(0)
    end
    
    StockMenu2.WeaponData = ESX.GetWeaponList()

	for i = 1, #StockMenu2.WeaponData, 1 do
		if StockMenu2.WeaponData[i].name == 'WEAPON_UNARMED' then
			StockMenu2.WeaponData[i] = nil
		else
			StockMenu2.WeaponData[i].hash = GetHashKey(StockMenu2.WeaponData[i].name)
		end
	end
end)

RegisterNetEvent('esx:setFaction')
AddEventHandler('esx:setFaction', function(faction)
	PlayerData.faction = faction
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('Shun_Gang:BoiteArmeVide')
AddEventHandler('Shun_Gang:BoiteArmeVide', function(source)
	OpenRangementArmeBoite()
end)

local boitearmeopen = false
RMenu.Add('BoiteArmeVide', 'menu', RageUI.CreateMenu("Boîte d'Arme Vide", "Entreposer une Arme", nil, 160))
RMenu.Add('BoiteArmeVide', 'StockInBoite', RageUI.CreateSubMenu(RMenu:Get('BoiteArmeVide', 'menu'), "Ranger l'Arme", "Que voulez vous faire ?"))
RMenu:Get('BoiteArmeVide', 'menu').Closed = function()
    RageUI.CloseAll()
    boitearmeopen = false
end;
RMenu:Get('BoiteArmeVide', 'menu').EnableMouse = false
RMenu:Get('BoiteArmeVide', 'menu').onIndexChange = function(Index)
end

function OpenRangementArmeBoite()
    RageUI.CloseAll()
    boitearmeopen = true
    RageUI.Visible(RMenu:Get('BoiteArmeVide', 'menu'), not RageUI.Visible(RMenu:Get('BoiteArmeVide', 'menu')))
    Citizen.CreateThread(function()
        while boitearmeopen do
            Wait(1)

            RageUI.IsVisible(RMenu:Get('BoiteArmeVide', 'menu'), function()
                local playerPed  = PlayerPedId()
                local weaponList = ESX.GetWeaponList()
                for i=1, #weaponList, 1 do
                    local weaponHash = GetHashKey(weaponList[i].name)
                    if HasPedGotWeapon(playerPed, weaponHash, false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
                        RageUI.Button("Arme : ", nil, {RightLabel = ""..weaponList[i].label}, true, {
                            onSelected = function()
                                pweaponlabel = weaponList[i].label
                                pweaponname = weaponList[i].name
                            end,
                        }, RMenu:Get('BoiteArmeVide', 'StockInBoite'))
                    end
                end
            end, function() 
            end) 

            RageUI.IsVisible(RMenu:Get('BoiteArmeVide', 'StockInBoite'), function()

                RageUI.Separator("Arme : "..pweaponname)

                RageUI.Button("Mettre dans la boîte", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        TriggerServerEvent('Shun_Gang:addWeaponInBox', pweaponname)
                        RageUI.CloseAll()
                        boitearmeopen = false
                    end,
                })
            end, function() 
            end)
        end
    end)
end

InfosGlobal = {
    InventoryPlayer = {},
    PlayerGroup = "",
    NamePlayer = "",
}

CoffreEntreprise = {
    InventoryS = {},
    Weapons = {},
    Inventory = {}
}

StockMenu = {
    Filtre = "",
}

ArmeMenu = {
    Filtre = "",
}

GarageMenu = {
    Filtre = "",
}

local NameM = "Coffre"
RMenu.Add("Global-CF", "Principale", RageUI.CreateMenu(NameM, " ", nil , 160))
RMenu.Add("Global-CF", "Principale_Retrait", RageUI.CreateSubMenu(RMenu:Get("Global-CF", "Principale"), NameM, " "))
RMenu.Add("Global-CF", "Principale_Depot", RageUI.CreateSubMenu(RMenu:Get("Global-CF", "Principale"), NameM, " "))
RMenu.Add("Global-CF", "Principale_Weapon_Retrait", RageUI.CreateSubMenu(RMenu:Get("Global-CF", "Principale"), NameM, " "))
RMenu.Add("Global-CF", "Principale_Weapon_Retrait2", RageUI.CreateSubMenu(RMenu:Get("Global-CF", "Principale"), NameM, " "))
RMenu.Add("Global-CF", "Principale_Weapon_Depot", RageUI.CreateSubMenu(RMenu:Get("Global-CF", "Principale"), NameM, " "))
RMenu.Add("Global-CF", "Principale_Weapon_Depot2", RageUI.CreateSubMenu(RMenu:Get("Global-CF", "Principale"), NameM, " "))
RMenu.Add("Global-CF", "Principale_BlackMoney_Depot", RageUI.CreateSubMenu(RMenu:Get("Global-CF", "Principale"), NameM, " "))

RMenu:Get("Global-CF", "Principale").Closed = function()
    RageUI.CloseAll()
    GCoffreEntreprise = false
    HasAlreadyEnteredMarker = false
end;
RMenu:Get("Global-CF", "Principale").onIndexChange = function(Index)
end

function OpenCoffre()
    GCoffreEntreprise = true
    RageUI.Visible(RMenu:Get("Global-CF", "Principale"), not RageUI.Visible(RMenu:Get("Global-CF", "Principale")))
    Citizen.CreateThread(function()
        while GCoffreEntreprise do
            Wait(1)
            RageUI.IsVisible(RMenu:Get("Global-CF", "Principale"), function()

                RageUI.Button("Déposer un Objet", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback("MyCity_CoreV2:GetPlayers:Inventory", function(InventoryPlayer)
                            InfosGlobal.InventoryPlayer = InventoryPlayer.items
                            InfosGlobal.BlackMoneyPlayer = InventoryPlayer.blackMoney
                        end)
                    end,
                }, RMenu:Get("Global-CF", "Principale_Depot"))

                if (PlayerData.faction.name == "fprofaci" and (PlayerData.faction.grade_name == "brasdroit" or PlayerData.faction.grade_name == "boss")) or (PlayerData.faction.name ~= "fprofaci") then
                    RageUI.Button("Prendre un Objet", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            ESX.TriggerServerCallback("MyCity_Factions:CoffreEntreprise:StockFaction", function(InventorySociety)
                                CoffreEntreprise.InventoryS = InventorySociety.items
                            end)
                        end,
                    }, RMenu:Get("Global-CF", "Principale_Retrait"))
                end

                RageUI.Button("Déposer une Arme", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                    end,
                }, RMenu:Get("Global-CF", "Principale_Weapon_Depot"))

                if (PlayerData.faction.name == "fprofaci" and (PlayerData.faction.grade_name == "brasdroit" or PlayerData.faction.grade_name == "boss")) or (PlayerData.faction.name == "marabunta" and (PlayerData.faction.grade_name == "teiniete" or PlayerData.faction.grade_name == "secundo" or PlayerData.faction.grade_name == "boss")) or (PlayerData.faction.name ~= "fprofaci" and PlayerData.faction.name ~= "marabunta") then
                    RageUI.Button("Prendre une Arme", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            ESX.TriggerServerCallback('esx_gangjob:getArmoryWeapons', function(weapons)
                                CoffreEntreprise.Weapons = weapons
                            end, ESX.PlayerData.faction.name)
                        end,
                    }, RMenu:Get("Global-CF", "Principale_Weapon_Retrait"))
                end
            end, function()
            end)
            RageUI.IsVisible(RMenu:Get("Global-CF", "Principale_Retrait"), function()
                RageUI.Button('Rechercher un Objet', nil, {RightLabel = StockMenu.Filtre}, true, {
                    onSelected = function()
                        DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 20)
                        while (UpdateOnscreenKeyboard() == 0) do
                            DisableAllControlActions(0);
                            Citizen.Wait(1)
                        end
                        if (GetOnscreenKeyboardResult()) then
                            StockMenu.Filtre = GetOnscreenKeyboardResult() 
                        end 
                    end,
                })
                
                for i = 1, #CoffreEntreprise.InventoryS, 1 do
                    if CoffreEntreprise.InventoryS[i].label then
                        if CoffreEntreprise.InventoryS[i].count > 0 then
                            if StockMenu.Filtre == "" or string.match(CoffreEntreprise.InventoryS[i].label:lower(), StockMenu.Filtre:lower()) then
                                RageUI.Button("[~b~"..CoffreEntreprise.InventoryS[i].label.."~s~]", nil, {RightLabel = "[~b~"..CoffreEntreprise.InventoryS[i].count.."~s~] ← Quantité"}, true, {
                                    onSelected = function()
                                        Quantity = KeyboardInput("Prendre : ~b~" .. CoffreEntreprise.InventoryS[i].label .. "~s~, Quantité par défaut : ~g~".. CoffreEntreprise.InventoryS[i].count .."~s~ ", "", 25)
                                        if Quantity then
                                            if Quantity == "" then
                                                Quantity = CoffreEntreprise.InventoryS[i].count
                                            else
                                                Quantity = ESX.Math.Round(Quantity)
                                            end
                                            TriggerServerEvent("MyCity_Factions:CoffreFaction:GetStocks", CoffreEntreprise.InventoryS[i].name, Quantity)
                                            ESX.TriggerServerCallback("MyCity_Factions:CoffreEntreprise:StockFaction", function(InventorySociety)
                                                CoffreEntreprise.InventoryS = InventorySociety.items
                                            end)
                                        end
                                    end,
                                }, RMenu:Get("Global-CF", "Principale_Retrait"))
                            end
                        end
                    end
                end
            end, function() 
            end)
            RageUI.IsVisible(RMenu:Get("Global-CF", "Principale_Depot"), function()
                RageUI.Button("Argent Sale : ", nil, {RightLabel = "$ ".. (ESX.Math.GroupDigits(InfosGlobal.BlackMoneyPlayer or 0) )}, true, {
                    onSelected = function()
                        dirtymoney = InfosGlobal.BlackMoneyPlayer
                    end,
                },RMenu:Get("Global-CF", "Principale_BlackMoney_Depot"))
                for i = 1, #InfosGlobal.InventoryPlayer, 1 do
                    if InfosGlobal.InventoryPlayer[i].count > 0 then
                        RageUI.Button("[~b~"..InfosGlobal.InventoryPlayer[i].label.."~s~]", nil, {RightLabel = "[~b~"..InfosGlobal.InventoryPlayer[i].count.."~s~] ← Quantité"}, true, {
                            onSelected = function()
                                Quantity = KeyboardInput("Déposer : ~b~" .. InfosGlobal.InventoryPlayer[i].label .. "~s~, Quantité par défaut : ~g~" ..InfosGlobal.InventoryPlayer[i].count.."~s~ ", "", 25)
                                if Quantity then
                                    if Quantity == "" then
                                        Quantity = InfosGlobal.InventoryPlayer[i].count
                                    else
                                        Quantity = ESX.Math.Round(Quantity)
                                    end
                                end
                                TriggerServerEvent('MyCity_Factions:CoffreFaction:PutStocks', InfosGlobal.InventoryPlayer[i].name, Quantity)
                                ESX.TriggerServerCallback("MyCity_CoreV2:GetPlayers:Inventory", function(InventoryPlayer)
                                    InfosGlobal.InventoryPlayer = InventoryPlayer.items
                                end)
                            end,
                        }, RMenu:Get("Global-CF", "Principale_Depot"))
                    end
                end
            end, function() 
            end)
            RageUI.IsVisible(RMenu:Get("Global-CF", "Principale_BlackMoney_Depot"), function()
                RageUI.Separator("Argent Sale sur vous : ~r~$ "..ESX.Math.GroupDigits(dirtymoney or 0))
                RageUI.Button("Choisir le Montant : ", nil, {RightLabel = "~r~$ "..amount}, true, {
                    onSelected = function()
                        DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 20)
                        while (UpdateOnscreenKeyboard() == 0) do
                            DisableAllControlActions(0);
                            Citizen.Wait(1)
                        end
                        if (GetOnscreenKeyboardResult()) then
                            amount = GetOnscreenKeyboardResult()
                            if amount == nil then
                                exports.pNotify:SendNotificationMC('Vous devez entrer votre une Quantité')
                            end  
                        end 
                        amount = RoundNumber(amount)
                    end,
                });
                RageUI.Button("Déposer dans le Coffre", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        TriggerServerEvent('CoffreRageUI:putStockBlackMoney', 'argent_sale', amount)
                        ESX.TriggerServerCallback("MyCity_CoreV2:GetPlayers:Inventory", function(InventoryPlayer)
                            InfosGlobal.InventoryPlayer = InventoryPlayer.items
                            InfosGlobal.BlackMoneyPlayer = InventoryPlayer.blackMoney
                        end)
                    end,
                }, RMenu:Get("Global-CF", "Principale_Depot"))
            end, function() 
            end)
            RageUI.IsVisible(RMenu:Get("Global-CF", "Principale_Weapon_Retrait"), function()
                
                RageUI.Button('Rechercher une Arme', nil, {RightLabel = ArmeMenu.Filtre}, true, {
                    onSelected = function()
                        DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 20)
                        while (UpdateOnscreenKeyboard() == 0) do
                            DisableAllControlActions(0);
                            Citizen.Wait(1)
                        end
                        if (GetOnscreenKeyboardResult()) then
                            ArmeMenu.Filtre = GetOnscreenKeyboardResult() 
                        end 
                    end,
                })
                for i = 1, #CoffreEntreprise.Weapons, 1 do
                    if ArmeMenu.Filtre == "" or string.match(ESX.GetWeaponLabel(CoffreEntreprise.Weapons[i].name):lower(), ArmeMenu.Filtre:lower()) then
                        if CoffreEntreprise.Weapons[i].ammo ~= nil then
                            RageUI.Button('~b~' .. ESX.GetWeaponLabel(CoffreEntreprise.Weapons[i].name), nil, {RightLabel = "[~r~"..CoffreEntreprise.Weapons[i].ammo .. "~s~] ← Munitions"}, true, {
                                onSelected = function()
                                    pweaponlabel = ESX.GetWeaponLabel(CoffreEntreprise.Weapons[i].name)
                                    pweaponname = CoffreEntreprise.Weapons[i].name
                                    pweaponammo = CoffreEntreprise.Weapons[i].ammo
                                end,
                            }, RMenu:Get("Global-CF", "Principale_Weapon_Retrait2"))
                        end
                    end
                end
            end, function()
            end)
            RageUI.IsVisible(RMenu:Get("Global-CF", "Principale_Weapon_Depot"), function()
                local playerPed  = PlayerPedId()
                local weaponList = ESX.GetWeaponList()
                
                for i=1, #weaponList, 1 do
                    local weaponHash = GetHashKey(weaponList[i].name)
                    local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
                    if HasPedGotWeapon(playerPed, weaponHash, false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
                        RageUI.Button("~b~"..weaponList[i].label, nil, {RightLabel = "[~r~".. ammo .. "~s~] ← Munitions"}, true, {
                            onSelected = function()
                                pweaponlabel = weaponList[i].label
                                pweaponname = weaponList[i].name
                                pweaponammo = ammo
                            end,
                        }, RMenu:Get("Global-CF", "Principale_Weapon_Depot2"))
                    end
                end
            end, function() 
            end)
            RageUI.IsVisible(RMenu:Get('Global-CF', 'Principale_Weapon_Retrait2'), function()
                while not pweaponlabel do Citizen.Wait(0) end
                RageUI.Separator("Arme : ~r~"..pweaponlabel)
                RageUI.Separator("Munitions : ~r~"..pweaponammo)
                RageUI.Button("Prendre dans le Coffre", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback('esx_gangjob:removeArmoryWeapon', function()
                            ESX.TriggerServerCallback('esx_gangjob:getArmoryWeapons', function(weapons)
                                CoffreEntreprise.Weapons = weapons
                            end, ESX.PlayerData.faction.name)
                        end,  pweaponname, pweaponammo)
                    end,
                }, RMenu:Get("Global-CF", "Principale_Weapon_Retrait"))
            end, function() 
            end)
            RageUI.IsVisible(RMenu:Get('Global-CF', 'Principale_Weapon_Depot2'), function()
                while not pweaponlabel do Citizen.Wait(0) end
                RageUI.Separator("Arme : ~r~"..pweaponlabel)
                RageUI.Separator("Munitions : ~r~"..pweaponammo)
                RageUI.Button("Déposer dans le Coffre", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback('esx_gangjob:addArmoryWeapon', function()
                        end, pweaponname, pweaponammo)
                    end,
                }, RMenu:Get("Global-CF", "Principale_Weapon_Depot"))
            end, function() 
            end)
        end
    end)
end

local NameM = "Coffre"
RMenu.Add("Global-CF-Boss", "Principale", RageUI.CreateMenu(NameM, " ", nil , 160))
RMenu.Add("Global-CF-Boss", "Principale_Retrait", RageUI.CreateSubMenu(RMenu:Get("Global-CF-Boss", "Principale"), NameM, " "))
RMenu.Add("Global-CF-Boss", "Principale_Depot", RageUI.CreateSubMenu(RMenu:Get("Global-CF-Boss", "Principale"), NameM, " "))
RMenu.Add("Global-CF-Boss", "Principale_Weapon_Retrait", RageUI.CreateSubMenu(RMenu:Get("Global-CF-Boss", "Principale"), NameM, " "))
RMenu.Add("Global-CF-Boss", "Principale_Weapon_Retrait2", RageUI.CreateSubMenu(RMenu:Get("Global-CF-Boss", "Principale"), NameM, " "))
RMenu.Add("Global-CF-Boss", "Principale_Weapon_Depot", RageUI.CreateSubMenu(RMenu:Get("Global-CF-Boss", "Principale"), NameM, " "))
RMenu.Add("Global-CF-Boss", "Principale_Weapon_Depot2", RageUI.CreateSubMenu(RMenu:Get("Global-CF-Boss", "Principale"), NameM, " "))
RMenu.Add("Global-CF-Boss", "Principale_BlackMoney_Depot", RageUI.CreateSubMenu(RMenu:Get("Global-CF-Boss", "Principale"), NameM, " "))

RMenu:Get("Global-CF-Boss", "Principale").Closed = function()
    RageUI.CloseAll()
    GCoffreEntreprise = false
    HasAlreadyEnteredMarker = false
end;
RMenu:Get("Global-CF-Boss", "Principale").onIndexChange = function(Index)
end

function OpenCoffreBoss()
    GCoffreEntreprise = true
    RageUI.Visible(RMenu:Get("Global-CF-Boss", "Principale"), not RageUI.Visible(RMenu:Get("Global-CF-Boss", "Principale")))
    Citizen.CreateThread(function()
        while GCoffreEntreprise do
            Wait(1)
            RageUI.IsVisible(RMenu:Get("Global-CF-Boss", "Principale"), function()

                RageUI.Button("Déposer un Objet", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback("MyCity_CoreV2:GetPlayers:Inventory", function(InventoryPlayer)
                            InfosGlobal.InventoryPlayer = InventoryPlayer.items
                            InfosGlobal.BlackMoneyPlayer = InventoryPlayer.blackMoney
                        end)
                    end,
                }, RMenu:Get("Global-CF-Boss", "Principale_Depot"))

                if (PlayerData.faction.name == "fprofaci" and (PlayerData.faction.grade_name == "brasdroit" or PlayerData.faction.grade_name == "boss")) or (PlayerData.faction.name ~= "fprofaci") then
                    RageUI.Button("Prendre un Objet", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            ESX.TriggerServerCallback("MyCity_Factions:CoffreEntreprise:StockFactionBoss", function(InventorySociety)
                                CoffreEntreprise.InventoryS = InventorySociety.items
                            end)
                        end,
                    }, RMenu:Get("Global-CF-Boss", "Principale_Retrait"))
                end

                RageUI.Button("Déposer une Arme", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                    end,
                }, RMenu:Get("Global-CF-Boss", "Principale_Weapon_Depot"))

                if (PlayerData.faction.name == "fprofaci" and (PlayerData.faction.grade_name == "brasdroit" or PlayerData.faction.grade_name == "boss")) or (PlayerData.faction.name == "marabunta" and (PlayerData.faction.grade_name == "teiniete" or PlayerData.faction.grade_name == "secundo" or PlayerData.faction.grade_name == "boss")) or (PlayerData.faction.name ~= "fprofaci" and PlayerData.faction.name ~= "marabunta") then
                    RageUI.Button("Prendre une Arme", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            ESX.TriggerServerCallback('esx_gangjob:getArmoryWeaponsBoss', function(weapons)
                                CoffreEntreprise.Weapons = weapons
                            end, ESX.PlayerData.faction.name)
                        end,
                    }, RMenu:Get("Global-CF-Boss", "Principale_Weapon_Retrait"))
                end
            end, function()
            end)
            RageUI.IsVisible(RMenu:Get("Global-CF-Boss", "Principale_Retrait"), function()
                RageUI.Button('Rechercher un Objet', nil, {RightLabel = StockMenu.Filtre}, true, {
                    onSelected = function()
                        DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 20)
                        while (UpdateOnscreenKeyboard() == 0) do
                            DisableAllControlActions(0);
                            Citizen.Wait(1)
                        end
                        if (GetOnscreenKeyboardResult()) then
                            StockMenu.Filtre = GetOnscreenKeyboardResult() 
                        end 
                    end,
                })
                
                for i = 1, #CoffreEntreprise.InventoryS, 1 do
                    if CoffreEntreprise.InventoryS[i].label then
                        if CoffreEntreprise.InventoryS[i].count > 0 then
                            if StockMenu.Filtre == "" or string.match(CoffreEntreprise.InventoryS[i].label:lower(), StockMenu.Filtre:lower()) then
                                RageUI.Button("[~b~"..CoffreEntreprise.InventoryS[i].label.."~s~]", nil, {RightLabel = "[~b~"..CoffreEntreprise.InventoryS[i].count.."~s~] ← Quantité"}, true, {
                                    onSelected = function()
                                        Quantity = KeyboardInput("Prendre : ~b~" .. CoffreEntreprise.InventoryS[i].label .. "~s~, Quantité par défaut : ~g~".. CoffreEntreprise.InventoryS[i].count .."~s~ ", "", 25)
                                        if Quantity then
                                            if Quantity == "" then
                                                Quantity = CoffreEntreprise.InventoryS[i].count
                                            else
                                                Quantity = ESX.Math.Round(Quantity)
                                            end
                                        end
                                        TriggerServerEvent("MyCity_Factions:CoffreFaction:GetStocksBoss", CoffreEntreprise.InventoryS[i].name, Quantity)
                                        ESX.TriggerServerCallback("MyCity_Factions:CoffreEntreprise:StockFactionBoss", function(InventorySociety)
                                            CoffreEntreprise.InventoryS = InventorySociety.items
                                        end)
                                    end,
                                }, RMenu:Get("Global-CF-Boss", "Principale_Retrait"))
                            end
                        end
                    end
                end
            end, function() 
            end)
            RageUI.IsVisible(RMenu:Get("Global-CF-Boss", "Principale_Depot"), function()
                RageUI.Button("Argent Sale : ", nil, {RightLabel = "$ ".. (ESX.Math.GroupDigits(InfosGlobal.BlackMoneyPlayer or 0) )}, true, {
                    onSelected = function()
                        dirtymoney = InfosGlobal.BlackMoneyPlayer
                    end,
                },RMenu:Get("Global-CF-Boss", "Principale_BlackMoney_Depot"))
                for i = 1, #InfosGlobal.InventoryPlayer, 1 do
                    if InfosGlobal.InventoryPlayer[i].count > 0 then
                        RageUI.Button("[~b~"..InfosGlobal.InventoryPlayer[i].label.."~s~]", nil, {RightLabel = "[~b~"..InfosGlobal.InventoryPlayer[i].count.."~s~] ← Quantité"}, true, {
                            onSelected = function()
                                Quantity = KeyboardInput("Déposer : ~b~" .. InfosGlobal.InventoryPlayer[i].label .. "~s~, Quantité par défaut : ~g~" ..InfosGlobal.InventoryPlayer[i].count.."~s~ ", "", 25)
                                if Quantity then
                                    if Quantity == "" then
                                        Quantity = InfosGlobal.InventoryPlayer[i].count
                                    else
                                        Quantity = ESX.Math.Round(Quantity)
                                    end
                                end
                                TriggerServerEvent('MyCity_Factions:CoffreFaction:PutStocksBoss', InfosGlobal.InventoryPlayer[i].name, Quantity)
                                ESX.TriggerServerCallback("MyCity_CoreV2:GetPlayers:Inventory", function(InventoryPlayer)
                                    InfosGlobal.InventoryPlayer = InventoryPlayer.items
                                end)
                            end,
                        }, RMenu:Get("Global-CF-Boss", "Principale_Depot"))
                    end
                end
            end, function() 
            end)
            RageUI.IsVisible(RMenu:Get("Global-CF-Boss", "Principale_BlackMoney_Depot"), function()
                RageUI.Separator("Argent Sale sur vous : ~r~$ "..ESX.Math.GroupDigits(dirtymoney or 0))
                RageUI.Button("Choisir le Montant : ", nil, {RightLabel = "~r~$ "..amount}, true, {
                    onSelected = function()
                        DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", amount, "", 20)
                        while (UpdateOnscreenKeyboard() == 0) do
                            DisableAllControlActions(0);
                            Citizen.Wait(1)
                        end
                        if (GetOnscreenKeyboardResult()) then
                            amount = GetOnscreenKeyboardResult()
                            if amount == nil then
                                exports.pNotify:SendNotificationMC('Vous devez entrer une Quantité')
                            end  
                        end 
                        amount = RoundNumber(amount)
                    end,
                });
                RageUI.Button("Déposer dans le Coffre", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        TriggerServerEvent('CoffreRageUI:putStockBlackMoneyBoss', 'argent_sale', amount)
                        ESX.TriggerServerCallback("MyCity_CoreV2:GetPlayers:Inventory", function(InventoryPlayer)
                            InfosGlobal.InventoryPlayer = InventoryPlayer.items
                            InfosGlobal.BlackMoneyPlayer = InventoryPlayer.blackMoney
                        end)
                    end,
                }, RMenu:Get("Global-CF-Boss", "Principale_Depot"))
            end, function() 
            end)
            RageUI.IsVisible(RMenu:Get("Global-CF-Boss", "Principale_Weapon_Retrait"), function()
                
                RageUI.Button('Rechercher une Arme', nil, {RightLabel = ArmeMenu.Filtre}, true, {
                    onSelected = function()
                        DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 20)
                        while (UpdateOnscreenKeyboard() == 0) do
                            DisableAllControlActions(0);
                            Citizen.Wait(1)
                        end
                        if (GetOnscreenKeyboardResult()) then
                            ArmeMenu.Filtre = GetOnscreenKeyboardResult() 
                        end 
                    end,
                })
                for i = 1, #CoffreEntreprise.Weapons, 1 do
                    if ArmeMenu.Filtre == "" or string.match(ESX.GetWeaponLabel(CoffreEntreprise.Weapons[i].name):lower(), ArmeMenu.Filtre:lower()) then
                        if CoffreEntreprise.Weapons[i].ammo ~= nil then
                            RageUI.Button('~b~' .. ESX.GetWeaponLabel(CoffreEntreprise.Weapons[i].name), nil, {RightLabel = "[~r~"..CoffreEntreprise.Weapons[i].ammo .. "~s~] ← Munitions"}, true, {
                                onSelected = function()
                                    pweaponlabel = ESX.GetWeaponLabel(CoffreEntreprise.Weapons[i].name)
                                    pweaponname = CoffreEntreprise.Weapons[i].name
                                    pweaponammo = CoffreEntreprise.Weapons[i].ammo
                                end,
                            }, RMenu:Get("Global-CF-Boss", "Principale_Weapon_Retrait2"))
                        end
                    end
                end
            end, function()
            end)
            RageUI.IsVisible(RMenu:Get("Global-CF-Boss", "Principale_Weapon_Depot"), function()
                local playerPed  = PlayerPedId()
                local weaponList = ESX.GetWeaponList()
                
                for i=1, #weaponList, 1 do
                    local weaponHash = GetHashKey(weaponList[i].name)
                    local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
                    if HasPedGotWeapon(playerPed, weaponHash, false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
                        RageUI.Button("~b~"..weaponList[i].label, nil, {RightLabel = "[~r~".. ammo .. "~s~] ← Munitions"}, true, {
                            onSelected = function()
                                pweaponlabel = weaponList[i].label
                                pweaponname = weaponList[i].name
                                pweaponammo = ammo
                            end,
                        }, RMenu:Get("Global-CF-Boss", "Principale_Weapon_Depot2"))
                    end
                end
            end, function() 
            end)
            RageUI.IsVisible(RMenu:Get('Global-CF-Boss', 'Principale_Weapon_Retrait2'), function()
                while not pweaponlabel do Citizen.Wait(0) end
                RageUI.Separator("Arme : ~r~"..pweaponlabel)
                RageUI.Separator("Munitions : ~r~"..pweaponammo)
                RageUI.Button("Prendre dans le Coffre", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback('esx_gangjob:removeArmoryWeaponBoss', function()
                            ESX.TriggerServerCallback('esx_gangjob:getArmoryWeaponsBoss', function(weapons)
                                CoffreEntreprise.Weapons = weapons
                            end, ESX.PlayerData.faction.name)
                        end,  pweaponname, pweaponammo)
                    end,
                }, RMenu:Get("Global-CF-Boss", "Principale_Weapon_Retrait"))
            end, function() 
            end)
            RageUI.IsVisible(RMenu:Get('Global-CF-Boss', 'Principale_Weapon_Depot2'), function()
                while not pweaponlabel do Citizen.Wait(0) end
                RageUI.Separator("Arme : ~r~"..pweaponlabel)
                RageUI.Separator("Munitions : ~r~"..pweaponammo)
                RageUI.Button("Déposer dans le Coffre", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback('esx_gangjob:addArmoryWeaponBoss', function()
                        end, pweaponname, pweaponammo)
                    end,
                }, RMenu:Get("Global-CF-Boss", "Principale_Weapon_Depot"))
            end, function() 
            end)
        end
    end)
end

RegisterNetEvent('MyCity_Factions:getSurrender')
AddEventHandler('MyCity_Factions:getSurrender', function(target)

	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))

	RequestAnimDict('random@arrests@busted')
	while not HasAnimDictLoaded('random@arrests@busted') do
		Citizen.Wait(100)
	end

	TaskPlayAnim(targetPed, 'random@arrests@busted', 'idle_a', 2.0, -2.0, -1, 1, 0, false, false, false)
    Citizen.Wait(500)
    Citizen.CreateThread(function()
        while IsEntityPlayingAnim(targetPed, 'random@arrests@busted', 'idle_a', 1) do
            Citizen.Wait(0)
            if IsControlJustReleased(0, 73) then
                ClearPedTasks(targetPed)
            end
        end
    end)
end)

RegisterNetEvent('MyCity_Factions:getSurrender2')
AddEventHandler('MyCity_Factions:getSurrender2', function(target)

	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))

	RequestAnimDict('random@arrests@busted')
	while not HasAnimDictLoaded('random@arrests@busted') do
		Citizen.Wait(100)
	end

	TaskPlayAnim(targetPed, 'random@arrests@busted', 'idle_a', 2.0, -2.0, -1, 51, 0, false, false, false)
    Citizen.Wait(500)
    Citizen.CreateThread(function()
        while IsEntityPlayingAnim(targetPed, 'random@arrests@busted', 'idle_a', 51) do
            Citizen.Wait(0)
            if IsControlJustReleased(0, 73) then
                ClearPedTasks(targetPed)
            end
        end
    end)
end)

RegisterNetEvent('MyCity_Factions:getCancelEmote')
AddEventHandler('MyCity_Factions:getCancelEmote', function(target)
    local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
    ClearPedTasks(targetPed)
end)

function GetClosestPlayer()
    local players = GetActivePlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply, 0)

    for index,value in ipairs(players) do
        local target = GetPlayerPed(value)
        if(target ~= ply) then
            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
            local distance = GetDistanceBetweenCoords(targetCoords['x'], targetCoords['y'], targetCoords['z'], plyCoords['x'], plyCoords['y'], plyCoords['z'], true)
            if(closestDistance == -1 or closestDistance > distance) then
                closestPlayer = value
                closestDistance = distance
            end
        end
    end
    return closestPlayer, closestDistance
end

function makeSurrender()
	local closestPlayer, distance = GetClosestPlayer()
    local pedIsInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local targetIsInVehicle = IsPedInAnyVehicle(GetPlayerPed(closestPlayer))
    if distance ~= -1 and distance <= 2.0 then
        if not pedIsInVehicle and not targetIsInVehicle then
            Citizen.Wait(100)
            local targetPed = GetPlayerServerId(closestPlayer)
            TriggerServerEvent('MyCity_Factions:trySurrender', targetPed)
        end
    end
end

function makeSurrender2()
	local closestPlayer, distance = GetClosestPlayer()
    local pedIsInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local targetIsInVehicle = IsPedInAnyVehicle(GetPlayerPed(closestPlayer))
    if distance ~= -1 and distance <= 2.0 then
        if not pedIsInVehicle and not targetIsInVehicle then
            Citizen.Wait(100)
            local targetPed = GetPlayerServerId(closestPlayer)
            TriggerServerEvent('MyCity_Factions:trySurrender2', targetPed)
        end
    end
end

function makeCancelEmote()
	local closestPlayer, distance = GetClosestPlayer()
    local pedIsInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local targetIsInVehicle = IsPedInAnyVehicle(GetPlayerPed(closestPlayer))

    if distance ~= -1 and distance <= 2.0 then
        if not pedIsInVehicle and not targetIsInVehicle then
            Citizen.Wait(100)
            local targetPed = GetPlayerServerId(closestPlayer)
            TriggerServerEvent('MyCity_Factions:makeCancelEmote', targetPed)
        end
    end
end


RegisterNetEvent('esx_addonaccount:setMoney')
AddEventHandler('esx_addonaccount:setMoney', function(society, money)
	if ESX.PlayerData.faction ~= nil and ESX.PlayerData.faction.grade_name == 'boss' and 'society_' .. ESX.PlayerData.faction.name == society then
		societymoney = ESX.Math.GroupDigits(money)
	end
end)

function RefreshMoney()
	if ESX.PlayerData.faction ~= nil and ESX.PlayerData.faction.grade_name == 'boss' then
		ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
			societymoney = ESX.Math.GroupDigits(money)
		end, ESX.PlayerData.faction.name)
	end
end

MyCity = {
    PlayerInventory = {},
    ItemLabelSelected = "",
    ItemNameSelected = "",
    ItemQuantity = "",
    ItemQuantitySelected = 0,
    SocietyInventory = {},
    ManagementSocietyMoney = "",
    ManagementMontant = 0,
    ManagementModification = 0,
    EmployeesInSociety = "",
    FiltreEmployees = "",
    EmployeesName = "",
    EmployeesGrade = "",
    EmployeesIdentifier = "",
    ManagementGrade = "",
    ManagementSalaireModif = "",
    VehicleInGarage = "",
    VehicleState = "",
}


RMenu.Add('GestionsOrga', 'main', RageUI.CreateMenu("Gestion", "Gestion Orga", nil, 160))
RMenu.Add('GestionsOrga', 'GestionsROrga', RageUI.CreateSubMenu(RMenu:Get('GestionsOrga', 'main'), "Gestion", "Gestion Orga"))
RMenu.Add('GestionsOrga', 'GestionsDOrga', RageUI.CreateSubMenu(RMenu:Get('GestionsOrga', 'main'), "Gestion", "Gestion Orga"))
RMenu.Add('GestionsOrga', 'gereremployer', RageUI.CreateSubMenu(RMenu:Get('GestionsOrga', 'main'), "Membres", "Gestion Orga"))
RMenu.Add('GestionsOrga', 'gereremployersub', RageUI.CreateSubMenu(RMenu:Get('GestionsOrga', 'gereremployer'), "Employés", "Gestion Orga"))
RMenu.Add('GestionsOrga', 'gereremployersubsub', RageUI.CreateSubMenu(RMenu:Get('GestionsOrga', 'gereremployersub'), "Employés", "Gestion Orga"))
RMenu:Get('GestionsOrga', 'main').Closed = function()
    RageUI.CloseAll()
    openGestionsOrga = false
    HasAlreadyEnteredMarker = false
end;
RMenu:Get('GestionsOrga', 'main').EnableMouse = false
RMenu:Get('GestionsOrga', 'main').onIndexChange = function(Index)
end

function RoundNumber(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

local amountExchange = 0
local amountInOrgaWithExchange = 0
local moneyOrga = 0
function OpenGestionsOrga()
    openGestionsOrga = true
    
    RageUI.Visible(RMenu:Get('GestionsOrga', 'main'), not RageUI.Visible(RMenu:Get('GestionsOrga', 'main')))
    Citizen.CreateThread(function()
        while openGestionsOrga do
            Wait(1)

            RageUI.IsVisible(RMenu:Get('GestionsOrga', 'main'), function()

                RageUI.Button('Retirer de l\'Argent', nil, { RightLabel = "→" }, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback('GestionOrga:getSocietyMoneyFaction', function(money)
                            moneyOrga = money
                        end)
                    end,
                }, RMenu:Get('GestionsOrga', 'GestionsROrga'))

                RageUI.Button('Déposer de l\'Argent', nil, { RightLabel = "→" }, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback('GestionOrga:getSocietyMoneyFaction', function(money)
                            moneyOrga = money
                        end, ESX.PlayerData.faction.name)
                    end,
                }, RMenu:Get('GestionsOrga', 'GestionsDOrga'))

                RageUI.Button("Gérer les Membres", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback('esx_societyfaction:getEmployeesFaction', function(faction)
                            MyCity.EmployeesInSociety = faction
                        end, ESX.PlayerData.faction.name)
                        Citizen.Wait(10)
                    end,
                }, RMenu:Get("GestionsOrga", "gereremployer"))

                RageUI.Button("Fermer le Menu", nil, {RightLabel = "→", Color = { BackgroundColor = RageUI.ItemsColour.Red }}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        openGestionsOrga = false
                        HasAlreadyEnteredMarker = false
                    end,
                })

            end, function() 
            end)

            RageUI.IsVisible(RMenu:Get('GestionsOrga', 'GestionsROrga'), function()
                RageUI.Separator("↓ Solde Actuel de l'Organisation ↓")
                
                RageUI.Separator("$ ".. ESX.Math.GroupDigits(moneyOrga))

               RageUI.Button("Montant :", nil, {RightLabel = "$ ".. ESX.Math.GroupDigits(amountExchange)}, true, {
                    onSelected = function()
                        local input = KeyboardInput('Montant', '', 25)
                        if tonumber(input) then
                            amountExchange = tonumber(input)
                        end
                    end,
                })
                
                if tonumber(amountExchange) then
                    amountInOrgaWithExchange = RoundNumber(moneyOrga - amountExchange)
                    amountExchange = RoundNumber(amountExchange)
                else
                    amountInOrgaWithExchange = moneyOrga
                    amountExchange = 0
                end

                RageUI.Separator("↓ Solde Après Modification ↓")
                RageUI.Separator("$ ".. ESX.Math.GroupDigits(amountInOrgaWithExchange))

                RageUI.Button("Confirmer le Retrait", nil, {RightLabel = "→", Color = { BackgroundColor = RageUI.ItemsColour.Green }}, true, {
                    onSelected = function()
                        TriggerServerEvent('GestionOrga:RemoveMoneySocietyFaction', amountExchange)
                        openGestionsOrgaR = false
                    end,
                }, RMenu:Get('GestionsOrga', 'main'))
            end, function() 
            end)

            RageUI.IsVisible(RMenu:Get('GestionsOrga', 'GestionsDOrga'), function()
                RageUI.Separator("↓ Solde Actuel de l'Organisation ↓")
                
                RageUI.Separator("$ ".. ESX.Math.GroupDigits(moneyOrga))

               RageUI.Button("Montant :", nil, {RightLabel = "$ ".. ESX.Math.GroupDigits(amountExchange)}, true, {
                    onSelected = function()
                        local input = KeyboardInput('Montant', '', 25)
                        if tonumber(input) then
                            amountExchange = tonumber(input)
                        end
                    end,
                })
                if tonumber(amountExchange) then
                    amountInOrgaWithExchange = RoundNumber(moneyOrga + amountExchange)
                    amountExchange = RoundNumber(amountExchange)
                else
                    amountInOrgaWithExchange = moneyOrga
                    amountExchange = 0
                end

                RageUI.Separator("↓ Solde Après Modification ↓")
                RageUI.Separator("$ ".. ESX.Math.GroupDigits(amountInOrgaWithExchange))

                RageUI.Button("Confirmer le Dépôt", nil, {RightLabel = "→", Color = { BackgroundColor = RageUI.ItemsColour.Green }}, true, {
                    onSelected = function()
                        openGestionsOrgaD = false
                        TriggerServerEvent('GestionOrga:AddMoneySocietyFaction', amountExchange)
                    end,
                }, RMenu:Get('GestionsOrga', 'main'))
            end, function() 
            end)

            RageUI.IsVisible(RMenu:Get('GestionsOrga', 'gereremployer'), function()

                RageUI.Button("Rechercher un Membre", nil, {RightLabel = "~b~"..MyCity.FiltreEmployees}, true, {
                    onSelected = function()
                        MyCity.FiltreEmployees = KeyboardInput("Filtre", "", 25)
                        if not MyCity.FiltreEmployees then MyCity.FiltreEmployees = '' end
                    end,
                }) 
                RageUI.Separator("↓ Membres ↓")
                for i = 1, #MyCity.EmployeesInSociety, 1 do
                    if MyCity.FiltreEmployees == "" or string.match(MyCity.EmployeesInSociety[i].name:lower(), MyCity.FiltreEmployees:lower()) then
                        RageUI.Button("Membre [~o~"..MyCity.EmployeesInSociety[i].name.."~s~]", nil, {RightLabel = "Grade [~o~"..MyCity.EmployeesInSociety[i].faction.grade_label.."~s~]"}, true, {
                            onSelected = function()
                                MyCity.EmployeesName, MyCity.EmployeesGrade, MyCity.EmployeesIdentifier = MyCity.EmployeesInSociety[i].name, MyCity.EmployeesInSociety[i].faction.grade_label, MyCity.EmployeesInSociety[i].identifier
                            end,
                        }, RMenu:Get("GestionsOrga", "gereremployersub"))
                    end
                end

                RageUI.Button("Fermer le Menu", nil, {RightLabel = "→", Color = { BackgroundColor = RageUI.ItemsColour.Red }}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        openGestionsOrga = false
                        HasAlreadyEnteredMarker = false
                    end,
                })

            end, function() 
            end)

            RageUI.IsVisible(RMenu:Get("GestionsOrga", "gereremployersub"), function()
                RageUI.Separator("Membre [~o~"..MyCity.EmployeesName.."~s~] - Grade [~o~"..MyCity.EmployeesGrade.."~s~]")
                RageUI.Button("Modifier le Grade", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback('esx_societyfaction:getFaction', function(faction)
                            MyCity.ManagementGrade = faction.grades
                        end, ESX.PlayerData.faction.name)
                        Citizen.Wait(10)
                    end,
                }, RMenu:Get("GestionsOrga", "gereremployersubsub"))

                RageUI.Button("Virer la Personne", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback("esx_societyfaction:setFaction", function() 
                        end, MyCity.EmployeesIdentifier, 'civil', 0, "fire")
                        Citizen.Wait(10)
                        MyCity.EmployeesInSociety = {}
                        ESX.TriggerServerCallback('esx_societyfaction:getEmployeesFaction', function(faction)
                            MyCity.EmployeesInSociety = faction
                        end, ESX.PlayerData.faction.name)
                        Citizen.Wait(10)
                    end,
                }, RMenu:Get("GestionsOrga","gereremployer"))

                RageUI.Button("Fermer le Menu", nil, {RightLabel = "→", Color = { BackgroundColor = RageUI.ItemsColour.Red }}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        openGestionsOrga = false
                        HasAlreadyEnteredMarker = false
                    end,
                })
            end, function() 
            end)

            RageUI.IsVisible(RMenu:Get("GestionsOrga", "gereremployersubsub"), function()
                RageUI.Separator("Membre [~o~"..MyCity.EmployeesName.."~s~] - Grade [~o~"..MyCity.EmployeesGrade.."~s~]")
                for i = 1, #MyCity.ManagementGrade, 1 do
                    RageUI.Button("Grade [~o~"..MyCity.ManagementGrade[i].label.."~s~]", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            PromotePlayerGrade = MyCity.ManagementGrade[i].grade
                            MyCity.EmployeesGrade = MyCity.ManagementGrade[i].label
                            ESX.TriggerServerCallback("esx_societyfaction:setFaction", function() 
                            end, MyCity.EmployeesIdentifier, ESX.PlayerData.faction.name, PromotePlayerGrade, "promote")
                            Citizen.Wait(10)
                            ESX.TriggerServerCallback('esx_societyfaction:getEmployeesFaction', function(faction)
                                MyCity.EmployeesInSociety = faction
                            end, ESX.PlayerData.faction.name)
                            MyCity.EmployeesInSociety = {}
                            Citizen.Wait(10)
                        end,
                    }, RMenu:Get("GestionsOrga","gereremployersub"))
                end

                RageUI.Button("Fermer le Menu", nil, {RightLabel = "→", Color = { BackgroundColor = RageUI.ItemsColour.Red }}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        openGestionsOrga = false
                        HasAlreadyEnteredMarker = false
                    end,
                })
            end, function() 
            end)
        end
    end)
end


