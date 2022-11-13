open = false
local mainMenu = RageUI.CreateMenu("", "Garage Taxi", nil, nil, "banner", "ban")

mainMenu.Closed = function()
    open = false
end

function OpenGarage()
    if (open) then
        return
    end
    open = true

    RageUI.Visible(mainMenu, true)

    CreateThread(function()
        while (open) do
            RageUI.IsVisible(mainMenu, function()
                RageUI.Button("Taxi", nil, {}, true, {
                    onSelected = function()
                        if not ESX.Game.IsSpawnPointClear(Config.spawnPoint, 5.0) then
                            ESX.ShowNotification(TranslateCap('spawnpoint_blocked'))
                            return
                        end
                        RageUI.CloseAll()
                        open = false
                        ESX.TriggerServerCallback("taxiJob:SpawnVehicle", function()
                            ESX.ShowNotification("Votre véhicule à apparu")
                        end, "taxi", {plate = "TAXI JOB"})
                    end
                })
            end)

            Wait(0)
        end
    end)
end