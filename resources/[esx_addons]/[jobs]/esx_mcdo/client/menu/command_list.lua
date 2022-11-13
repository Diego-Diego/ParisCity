open = false
local mainMenu = RageUI.CreateMenu("", "Bienvenue chez ~y~McDonald's~s~", nil, nil, "banner", "mcdo")
local subMenu = RageUI.CreateSubMenu(mainMenu, "", "Bienvenue chez ~y~McDonald's~s~", nil, nil, "banner", "mcdo")
local subMenu2 = RageUI.CreateSubMenu(subMenu, "", "Bienvenue chez ~y~McDonald's~s~", nil, nil, "banner", "mcdo")
local subMenu3 = RageUI.CreateSubMenu(subMenu2, "", "Bienvenue chez ~y~McDonald's~s~", nil, nil, "banner", "mcdo")
local subMenu4 = RageUI.CreateSubMenu(subMenu2, "", "Bienvenue chez ~y~McDonald's~s~", nil, nil, "banner", "mcdo")
local type = ""

local command = {
    boisson = "",
    burger = "",
    frite = "",
}
local bouton
mainMenu.Closed = function()
    open = false
end

function openCommand2(data)
    if (open) then
        return
    end
    open = true

    RageUI.Visible(mainMenu, true)

    CreateThread(function()
        while (open) do
            RageUI.IsVisible(mainMenu, function()
                for k,v in pairs (data) do 
                    RageUI.Button("Commande n°".. v.number,nil,{},true,{
                        onSelected = function()
                            bouton = v
                        end
                    },subMenu)
                end 
            end)
            RageUI.IsVisible(subMenu, function()
                while bouton == nil do
                    Wait(5)
                end
                liste = json.decode(bouton.data)

                RageUI.Separator(liste['boisson'])
                RageUI.Separator(liste['burger'])
                RageUI.Separator(liste['frite'])
                RageUI.Button("~y~Supprimer~s~",nil,{Color = {BackgroundColor = RageUI.ItemsColour.Red, HightLightColor = RageUI.ItemsColour.Red}},true,{
                    onSelected = function()
                        TriggerServerEvent("esx_mcdo:deletecommand", bouton)
                        open = false
                        RageUI.CloseAll()
                    end
                },subMenu)
            end)
            Wait(0)
        end
    end)
end