local opencreationsg = false
RMenu.Add('Gangs', 'creations', RageUI.CreateMenu("Créations de Gangs", "Créations"))


RMenu:Get('Gangs', 'creations'):SetSubtitle("Que voulez vous faire ?")
RMenu:Get('Gangs', 'creations'):DisplayGlare(true);
RMenu:Get('Gangs', 'creations').Closed = function()
    RageUI.CloseAll()
    opencreationsg = false
end;
RMenu:Get('Gangs', 'creations').EnableMouse = false
RMenu:Get('Gangs', 'creations').onIndexChange = function(Index)
end
CreationInWork = false
result = nil
result2 = nil
function CreationsGangs()
    opencreationsg = true
    RageUI.Visible(RMenu:Get('Gangs', 'creations'), not RageUI.Visible(RMenu:Get('Gangs', 'creations')))
    Citizen.CreateThread(function()
        while opencreationsg do
            Wait(1)
            RageUI.IsVisible(RMenu:Get('Gangs', 'creations'), function()
                if not CreationInWork then
                    GangData = {}
                end
                RageUI.Button('Nom du Gang', "Tout en minuscule sans espace !", { RightLabel = result }, true, {
                    onSelected = function()
                            DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 20)
                        while (UpdateOnscreenKeyboard() == 0) do
                            DisableAllControlActions(0);
                           Citizen.Wait(1)
                        end
                        if (GetOnscreenKeyboardResult()) then
                            GangData.Name = GetOnscreenKeyboardResult()
                            result = GangData.Name
                            if GangData.Name == nil then
                               exports.pNotify:SendNotificationMC('Vous devez entrer votre Nom')
                            end     
                        end 
                        CreationInWork = true
                    end,
                })

                RageUI.Button('Label du Gang', "Écriture comme vous le voulez", { RightLabel =  result2 }, true, {
                    onSelected = function()
                        DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 20)
                        while (UpdateOnscreenKeyboard() == 0) do
                            DisableAllControlActions(0);
                           Citizen.Wait(1)
                        end
                        if (GetOnscreenKeyboardResult()) then
                            GangData.Label = GetOnscreenKeyboardResult()
                            result2 = GangData.Label
                            if GangData.Label == nil then
                               exports.pNotify:SendNotificationMC('Vous devez entrer votre Nom')
                            end     
                        end 
                    end,
                })

                RageUI.Button('Vestiaire', nil, { RightLabel = "→" }, true, {
                    onSelected = function()
                        local plyCoords = VectorToArray(GetEntityCoords(PlayerPedId(), false))
                        plyCoords.z = plyCoords.z - 1.05
                        GangData.Cloakroom = plyCoords
                        ShowNotification('Coordonnées ajoutées')
                    end,
                })

                RageUI.Button('Armurerie', nil, { RightLabel = "→" }, true, {
                    onSelected = function()
                        local plyCoords = VectorToArray(GetEntityCoords(PlayerPedId(), false))
                        plyCoords.z = plyCoords.z - 1.05
                        GangData.Armory = plyCoords
                        GangData.Weapons = "[]"
                        ShowNotification('Coordonnées ajoutées')    
                    end,
                })

                RageUI.Button('Armurerie Chef', nil, { RightLabel = "→" }, true, {
                    onSelected = function()
                        local plyCoords = VectorToArray(GetEntityCoords(PlayerPedId(), false))
                        plyCoords.z = plyCoords.z - 1.05
                        GangData.ArmoryBoss = plyCoords
                        GangData.Weapons = "[]"
                        ShowNotification('Coordonnées ajoutées')    
                    end,
                })

                RageUI.Button('Sortie de Véhicule', nil, { RightLabel = "→" }, true, {
                    onSelected = function()
                        local plyCoords = VectorToArray(GetEntityCoords(PlayerPedId(), false))
                        plyCoords.z = plyCoords.z - 1.05
                        GangData.VehSpawner = plyCoords
                        ShowNotification('Coordonnées ajoutées')   
                    end,
                })

                RageUI.Button('Spawn du Véhicule', nil, { RightLabel = "→" }, true, {
                    onSelected = function()
                        local plyCoords = VectorToArray(GetEntityCoords(PlayerPedId(), false))
                        plyCoords.z = plyCoords.z - 1.05
                        GangData.VehSpawnPoint = plyCoords
                        ShowNotification('Coordonnées ajoutées')
                    end,
                })

                RageUI.Button('Orientation du Véhicule', nil, { RightLabel = "→" }, true, {
                    onSelected = function()
                        GangData.VehSpawnHeading = GetEntityPhysicsHeading(PlayerPedId(), true)
                        ShowNotification('Rotation ajoutées')
                    end,
                })

                RageUI.Button('Rentrer le Véhicule', nil, { RightLabel = "→" }, true, {
                    onSelected = function()
                        local plyCoords = VectorToArray(GetEntityCoords(PlayerPedId(), false))
                        plyCoords.z = plyCoords.z - 1.05
                        GangData.VehDeleter = plyCoords
                        ShowNotification('Coordonnées ajoutées')
                    end,
                })

                RageUI.Button('Actions du Patron', nil, { RightLabel = "→" }, true, {
                    onSelected = function()
                        local plyCoords = VectorToArray(GetEntityCoords(PlayerPedId(), false))
                        plyCoords.z = plyCoords.z - 1.05
                        GangData.BossActions = plyCoords
                        ShowNotification('Coordonnées ajoutées')
                    end,
                })

                RageUI.Button("Confirmer la Créations", nil, {RightLabel = "", Color = { BackgroundColor = RageUI.ItemsColour.Red }}, true, {
                    onSelected = function()
                        if GangData.Name == nil then
                            ShowNotification('Aucun nom !')
                            return
                        end
            
                        if GangData.Label == nil then
                            ShowNotification('Aucun label !')
                            return
                        end
            
                        if GangData.Weapons == nil then
                            ShowNotification('Aucun kit d\'armes !')
                            return
                        end
            
                        if GangData.Cloakroom == nil then
                            ShowNotification('Aucun vestiaire !')
                            return
                        end
            
                        if GangData.Armory == nil then
                            ShowNotification('Aucune armurerie !')
                            return
                        end

                        if GangData.ArmoryBoss == nil then
                            ShowNotification('Aucune armurerie de Boss !')
                            return
                        end
            
                        if GangData.VehSpawner == nil then
                            ShowNotification('Aucun point pour spawn véhicule !')
                            return
                        end
            
                        if GangData.VehSpawnPoint == nil then
                            ShowNotification('Aucun emplacement de spawn véhicule !')
                            return
                        end
            
                        if GangData.VehSpawnHeading == nil then
                            ShowNotification('Aucune rotation du véhicule !')
                            return
                        end
            
                        if GangData.VehDeleter == nil then
                            ShowNotification('Aucun point de suppression véhicule !')
                            return
                        end
            
                        if GangData.BossActions == nil then
                            ShowNotification('Aucun point de gestion gang !')
                            return
                        end
            
                        TriggerServerEvent('gb:addGang', GangData)
                        ShowNotification('Gang créé ! (Disponible au prochain reboot)')
                        RageUI.CloseAll()
                        opencreationsg = false
                        CreationInWork = false
                    end,
                })

                RageUI.Button("Fermer le Menu", nil, {RightLabel = "", Color = { BackgroundColor = RageUI.ItemsColour.Red }}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        opencreationsg = false
                    end,
                })

            end, function() 
            end) 
        end
    end)
end

RegisterNetEvent('gb:OpenMenu')
AddEventHandler('gb:OpenMenu', function()
    RageUI.CloseAll()
	Citizen.Wait(250)
	CreationsGangs()
end)

RegisterCommand('GangsCreations', function(source)
	ESX.TriggerServerCallback('Shun_Gang:GetUserGroup', function(plyGroup)
		if plyGroup ~= nil and (plyGroup == 'dev') then
			TriggerEvent('gb:OpenMenu', source)
		else
            ESX.ShowNotification('Vous devez être superAdmin ~w~pour ouvrir la Création de Gang')
		end
	end)
end, false)