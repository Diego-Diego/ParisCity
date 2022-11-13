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

mainMenu.Closed = function()
    open = false
end

function openCommand()
    if (open) then
        return
    end
    open = true

    RageUI.Visible(mainMenu, true)

    CreateThread(function()
        while (open) do
            RageUI.IsVisible(mainMenu, function()
                for k,v in pairs(_McDo.menu) do
                    RageUI.Button(v.lbl, v.desc, {RightLabel = "→→→"}, true, {onSelected = function() type = v.lbl end}, subMenu)
                end
            end)
            RageUI.IsVisible(subMenu, function()
                for k,v in pairs(_McDo.submenu.boisson) do
                    RageUI.Button(v.lbl..quantity(type), nil, {RightLabel = "→→→"}, true, {onSelected = function() command.boisson = v.name end}, subMenu2)
                end
            end)
            RageUI.IsVisible(subMenu2, function()
                for k,v in pairs(_McDo.submenu.burger) do
                    RageUI.Button(v.lbl, nil, {RightLabel = "→→→"}, true, {onSelected = function() command.burger = v.name end}, subMenu3)
                end
            end)
            RageUI.IsVisible(subMenu3, function()
                for k,v in pairs(_McDo.submenu.frite) do
                    RageUI.Button(v.lbl, nil, {RightLabel = "→→→"}, true, {onSelected = function() command.frite = v.name TriggerServerEvent("save:mcdo", command) end}, subMenu4)
                end
            end)
            Wait(0)
        end
    end)
end