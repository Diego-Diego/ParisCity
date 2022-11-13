open = false
local mainMenu = RageUI.CreateMenu("", "Bienvenue chez ~y~McDonald's~s~", nil, nil, "banner", "mcdo")
local subMenu = RageUI.CreateSubMenu(mainMenu, "", "Bienvenue chez ~y~McDonald's~s~", nil, nil, "banner", "mcdo")

mainMenu.Closed = function()
    open = false
end

local car
function openGarage()
    if (open) then
        return
    end
    open = true

    RageUI.Visible(mainMenu, true)

    CreateThread(function()
        while (open) do
            RageUI.IsVisible(mainMenu, function()
                for k,v in pairs(_McDo.garage) do
                    RageUI.Button(v.lbl,nil, {RightLabel = "→→→"}, true, {onSelected = function() car = v.name end}, subMenu)
                end
            end)
            RageUI.IsVisible(subMenu, function()
                for k,v in pairs(_McDo.spawnPoint) do
                    DrawMarker(v.type, v.coords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.7, 0.7, 0.5, 0, 0, 0, 200, false, true, 2, false, false, false, false)
                    RageUI.Button('Place n°'..k, nil, {}, true, {
                        onSelected = function()
                            local foundSpawn, spawnPoint = GetAvailableVehicleSpawnPoint(v.coords, k)
                            if foundSpawn then
                                ESX.Game.SpawnVehicle(GetHashKey(car), spawnPoint.coords, spawnPoint.heading, function(vehicle)
                                    ESX.ShowNotification("~g~Vous avez sortie votre véhicule.~s~")
                                end)
                            end
                        end
                    })
                end
            end)
            Wait(0)
        end
    end)
end