bannerMode = false
glareMode = true
function Menu.Panel:PersoMenu()
    RageUI.Checkbox("Bannière", nil, bannerMode, {}, {
        onChecked = function()
            bannerMode = true
            RMenu:Get('perso', 'settings'):SetSpriteBanner("banner", "ban")
            
            Menu.style.Settings.Title = ""
            RMenu:Get('perso', 'settings'):SetTitle('')
        end,
        onUnChecked = function()
            bannerMode = false
            RMenu:Get('perso', 'settings'):SetRectangleBanner(Menu.style.Settings.color.indexRed-1, Menu.style.Settings.color.indexGreen-1, Menu.style.Settings.color.indexBlue-1, Menu.style.Settings.color.indexAlpha-1)
        end
    })
    RageUI.Checkbox("Glare", nil, glareMode, {}, {
        onChecked = function()
            glareMode = true
            RMenu:Get('perso', 'settings'):DisplayGlare(true)
        end,
        onUnChecked = function()
            glareMode = false
            RMenu:Get('perso', 'settings'):DisplayGlare(false)
        end
    })

    RageUI.Line({r = 255, g = 255, b = 255})
    RageUI.List('Rouge', Menu.style.Settings.color.red, Menu.style.Settings.color.indexRed or 1, nil, {}, not bannerMode, {
        onListChange = function(index)
            Menu.style.Settings.color.indexRed = index
            RMenu:Get('perso', 'settings'):SetRectangleBanner(Menu.style.Settings.color.indexRed-1, Menu.style.Settings.color.indexGreen-1, Menu.style.Settings.color.indexBlue-1, Menu.style.Settings.color.indexAlpha-1)
        end,
        onSelected = function()
            local post, red = CheckQuantity(KeyboardInput('Rouge', '', 3))
            if post then
                if red ~= nil then
                    Menu.style.Settings.color.indexRed = red + 1
                    RMenu:Get('perso', 'settings'):SetRectangleBanner(Menu.style.Settings.color.indexRed-1, Menu.style.Settings.color.indexGreen-1, Menu.style.Settings.color.indexBlue-1, Menu.style.Settings.color.indexAlpha-1)
                end
            end
        end
    })
    RageUI.List('Vert', Menu.style.Settings.color.green, Menu.style.Settings.color.indexGreen or 1, nil, {}, not bannerMode, {
        onListChange = function(index)
            Menu.style.Settings.color.indexGreen = index
            RMenu:Get('perso', 'settings'):SetRectangleBanner(Menu.style.Settings.color.indexRed-1, Menu.style.Settings.color.indexGreen-1, Menu.style.Settings.color.indexBlue-1, Menu.style.Settings.color.indexAlpha-1)
        end,
        onSelected = function()
            local post, green = CheckQuantity(KeyboardInput('Rouge', '', 3))
            if post then
                if green ~= nil then
                    Menu.style.Settings.color.indexGreen = green + 1
                    RMenu:Get('perso', 'settings'):SetRectangleBanner(Menu.style.Settings.color.indexRed-1, Menu.style.Settings.color.indexGreen-1, Menu.style.Settings.color.indexBlue-1, Menu.style.Settings.color.indexAlpha-1)
                end
            end
        end
    })
    RageUI.List('Bleue', Menu.style.Settings.color.blue, Menu.style.Settings.color.indexBlue or 1, nil, {}, not bannerMode, {
        onListChange = function(index)
            Menu.style.Settings.color.indexBlue = index
            RMenu:Get('perso', 'settings'):SetRectangleBanner(Menu.style.Settings.color.indexRed-1, Menu.style.Settings.color.indexGreen-1, Menu.style.Settings.color.indexBlue-1, Menu.style.Settings.color.indexAlpha-1)
        end,
        onSelected = function()
            local post, blue = CheckQuantity(KeyboardInput('Rouge', '', 3))
            if post then
                if blue ~= nil then
                    Menu.style.Settings.color.indexBlue = blue + 1
                    RMenu:Get('perso', 'settings'):SetRectangleBanner(Menu.style.Settings.color.indexRed-1, Menu.style.Settings.color.indexGreen-1, Menu.style.Settings.color.indexBlue-1, Menu.style.Settings.color.indexAlpha-1)
                end
            end
        end
    })
    RageUI.List('Opacité', Menu.style.Settings.color.alpha, Menu.style.Settings.color.indexAlpha or 1, nil, {}, not bannerMode, {
        onListChange = function(index)
            Menu.style.Settings.color.indexAlpha = index
            RMenu:Get('perso', 'settings'):SetRectangleBanner(Menu.style.Settings.color.indexRed-1, Menu.style.Settings.color.indexGreen-1, Menu.style.Settings.color.indexBlue-1, Menu.style.Settings.color.indexAlpha-1)
        end,
        onSelected = function()
            local post, alpha = CheckQuantity(KeyboardInput('Rouge', '', 3))
            if post then
                if alpha ~= nil then
                    Menu.style.Settings.color.indexAlpha = alpha + 1
                    RMenu:Get('perso', 'settings'):SetRectangleBanner(Menu.style.Settings.color.indexRed-1, Menu.style.Settings.color.indexGreen-1, Menu.style.Settings.color.indexBlue-1, Menu.style.Settings.color.indexAlpha-1)
                end
            end
        end
    })

    RageUI.Line({r = 255, g = 255, b = 255})
    RageUI.List('Largeur', Menu.style.Settings.size, Menu.style.Settings.indexSize, nil, {}, true, {
        onListChange = function(index, item)
            Menu.style.Settings.indexSize = index
            if item == "NativeUI" then
                RMenu:Get('perso', 'settings'):SetStyleSize(0)
                Menu.style.Settings.currentSize = 0
            elseif item == "RageUI" then
                RMenu:Get('perso', 'settings'):SetStyleSize(100)
                Menu.style.Settings.currentSize = 100
            end
        end,
        onActive = function(index, item)
            if item == "NativeUI" then
                RMenu:Get('perso', 'settings'):SetStyleSize(0)
                Menu.style.Settings.currentSize = 0
            elseif item == "RageUI" then
                RMenu:Get('perso', 'settings'):SetStyleSize(100)
                Menu.style.Settings.currentSize = 100
            end
        end,
    })
    RageUI.List('Titre', {"Nom Serveur", "Pseudo"}, Menu.style.Settings.indexTitle or 1, 'Entrer pour sélectionner', {}, not bannerMode, {
        onListChange = function(index, Items)
            Menu.style.Settings.indexTitle = index
        end,
        onActive = function(index, Items)
            if index == 1 then
                name = Menu.style.serverName
            else
                name = GetPlayerName(PlayerId())
            end
            RMenu:Get('perso', 'settings'):SetTitle(name)
            Menu.style.Settings.Title = name
        end,
        onSelected = function(index, Items)
            Menu.style.Settings.Title = name
        end
    })

    RageUI.Line({r = 255, g = 255, b = 255})
    RageUI.Button('Confirmer', nil, {Color = {BackgroundColor = {0,128,0, 150}, HightLightColor = {0,128,0, 245}}}, true, {
        onSelected = function()
            table.remove(settingsMenu, 1)
            table.insert(settingsMenu, {
                color = {
                    r = Menu.style.Settings.color.indexRed - 1,
                    g = Menu.style.Settings.color.indexGreen - 1,
                    b = Menu.style.Settings.color.indexBlue - 1,
                    a = Menu.style.Settings.color.indexAlpha - 1
                },
                title = Menu.style.Settings.Title,
                size = Menu.style.Settings.currentSize,
                banner = bannerMode,
                glare = glareMode
            })
            for k,_ in pairs(RMenu:GetType('perso')) do
                if not bannerMode then
                    RMenu:GetType('perso')[k].Menu:SetRectangleBanner(Menu.style.Settings.color.indexRed-1, Menu.style.Settings.color.indexGreen-1, Menu.style.Settings.color.indexBlue-1, Menu.style.Settings.color.indexAlpha-1)
                end
                if Menu.style.Settings.currentSize ~= nil then
                    RMenu:GetType('perso')[k].Menu:SetStyleSize(Menu.style.Settings.currentSize) 
                end
                
                if bannerMode then
                    RMenu:GetType('perso')[k].Menu:SetSpriteBanner("banner", "ban") 
                end
                
                RMenu:GetType('perso')[k].Menu:DisplayGlare(glareMode)
                RMenu:GetType('perso')[k].Menu:SetTitle(Menu.style.Settings.Title)
            end
            SetResourceKvp("settingsMenu", json.encode(settingsMenu))
        end
    })
end