open = false
local mainMenu = RageUI.CreateMenu("", "Bienvenue chez ~y~McDonald's~s~", nil, nil, "banner", "mcdo")
local subMenu = RageUI.CreateSubMenu(mainMenu, "", "Bienvenue chez ~y~McDonald's~s~", nil, nil, "banner", "mcdo")

mainMenu.Closed = function()
    open = false
end

function openCuisine()
    if (open) then
        return
    end
    open = true

    RageUI.Visible(mainMenu, true)

    CreateThread(function()
        while (open) do
            RageUI.IsVisible(mainMenu, function()
                for k,v in pairs(_McDo.submenu.burger) do
                    RageUI.Button(v.lbl, v.ingredient, {RightLabel = "~y~Cuisiner~s~ →→"}, true, {
                        onSelected = function()
                            for k,v in pairs(ESX.GetPlayerData().inventory) do
                                if v.name == 'mower' and v.count > 0 then

                                end
                            end
                        end
                    })
                end
            end)

            Wait(0)
        end
    end)
end