open = false
local mainMenu = RageUI.CreateMenu("", "Actions Taxi", nil, nil, "banner", "ban")

mainMenu.Closed = function()
    open = false
end

function OpenMobileTaxiActionsMenu()
    if (open) then
        return
    end
    open = true

    RageUI.Visible(mainMenu, true)
    
    CreateThread(function()
        while (open) do
            RageUI.IsVisible(mainMenu, function()
                RageUI.Button("Donner une facture", nil, {}, true, {
                    onSelected = function()
                        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'billing', {
                            title = TranslateCap('invoice_amount')
                        }, function(data, menu)
            
                            local amount = tonumber(data.value)
                            if amount == nil then
                                ESX.ShowNotification(TranslateCap('amount_invalid'))
                            else
                                menu.close()
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                if closestPlayer == -1 or closestDistance > 3.0 then
                                    ESX.ShowNotification(TranslateCap('no_players_near'))
                                else
                                    TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_taxi',
                                        'Taxi', amount)
                                    ESX.ShowNotification(TranslateCap('billing_sent'))
                                end
            
                            end
            
                        end, function(data, menu)
                            menu.close()
                        end)
                    end
                })
                RageUI.Button("Activer / désactiver les courses PNJ", nil, {}, true, {
                    onSelected = function()
                        if OnJob then
                            StopTaxiJob()
                        else
                            if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'taxi' then
                                local playerPed = PlayerPedId()
                                local vehicle = GetVehiclePedIsIn(playerPed, false)
            
                                if IsPedInAnyVehicle(playerPed, false) and GetPedInVehicleSeat(vehicle, -1) == playerPed then
                                    if tonumber(ESX.PlayerData.job.grade) >= 3 then
                                        StartTaxiJob()
                                    else
                                        if IsInAuthorizedVehicle() then
                                            StartTaxiJob()
                                        else
                                            ESX.ShowNotification(TranslateCap('must_in_taxi'))
                                        end
                                    end
                                else
                                    if tonumber(ESX.PlayerData.job.grade) >= 3 then
                                        ESX.ShowNotification(TranslateCap('must_in_vehicle'))
                                    else
                                        ESX.ShowNotification(TranslateCap('must_in_taxi'))
                                    end
                                end
                            end
                        end
                    end
                })
            end)

            Wait(0)
        end
    end)
end