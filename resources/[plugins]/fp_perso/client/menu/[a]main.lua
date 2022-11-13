local openPersoMenu = false

RMenu.Add('perso', 'main', RageUI.CreateMenu(" ", " "))
RMenu.Add('perso', 'wallet', RageUI.CreateSubMenu(RMenu:Get('perso', 'main'), ' ', " "))
RMenu.Add('perso', 'settings', RageUI.CreateSubMenu(RMenu:Get('perso', 'main'), ' ', " "))
RMenu.Add('perso', 'settings2', RageUI.CreateSubMenu(RMenu:Get('perso', 'main'), ' ', " "))
RMenu.Add('perso', 'settings3', RageUI.CreateSubMenu(RMenu:Get('perso', 'settings2'), ' ', " "))

RMenu:Get('perso', 'main').Closed = function()
    RageUI.CloseAll()
	openPersoMenu = false
end

function Menu.Panel:MainPerso()
    if openPersoMenu then
        RageUI.CloseAll()
	    openPersoMenu = false
		return 
	end
    openPersoMenu = true
    
    RageUI.Visible(RMenu:Get('perso', 'main'), not RageUI.Visible(RMenu:Get('perso', 'main')))
    
    Citizen.CreateThread(function()
        while openPersoMenu do
            Wait(1)

            RageUI.IsVisible(RMenu:Get('perso', 'main'), function()
                RageUI.Button('Portefeuille', nil, { RightLabel = Menu.style.arrow3}, true, {}, RMenu:Get('perso', "wallet"))
                RageUI.Button('Animation', nil, { RightLabel = Menu.style.arrow3}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        openPersoMenu = false
                        TriggerEvent('dp:RecieveMenu')
                    end
                })
                RageUI.Button('Réglages Menu', nil, { RightLabel = Menu.style.arrow3}, true, {}, RMenu:Get('perso', "settings2"))
                RageUI.Button('Paramètre', nil, { RightLabel = Menu.style.arrow3}, true, {}, RMenu:Get('perso', "settings"))
                RageUI.Button('Annonce métier', nil, { RightLabel = Menu.style.arrow3}, verifJob(), {
                    onSelected = function()
                        local annonce = KeyboardInput("Annonce", "", 100)
                        TriggerServerEvent('AnnonceJob', annonce, ESX.GetPlayerData().job.label)
                    end
                })
                
            end)

            RageUI.IsVisible(RMenu:Get('perso', 'settings'), function()  
                Menu.Panel:PersoMenu()
            end)
            RageUI.IsVisible(RMenu:Get('perso', 'settings2'), function()  
                Menu.Panel:PersoMenuParam()
            end)
            RageUI.IsVisible(RMenu:Get('perso', 'wallet'), function()  
                Menu.Panel:PersoMenuWallet()
            end)
		end
	end)
end

function verifJob()
    if ESX.GetPlayerData().job.name == 'unemployed' then
        return false
    else
        return true
    end
end

ESX.RegisterInput("f5:openMenu", "Ouvrir le menu personnel", "keyboard", "F5", function()
    local param = settingsMenu[1]
    if param ~= nil or param == '[]' then
        for k,_ in pairs(RMenu:GetType('perso')) do
            bannerMode = param.banner
            glareMode = param.glare
            if not param.banner then
                RMenu:GetType('perso')[k].Menu:SetRectangleBanner(param.color.r, param.color.g, param.color.b, param.color.a)
                RMenu:GetType('perso')[k].Menu:SetTitle(param.title)
            else
                RMenu:GetType('perso')[k].Menu:SetSpriteBanner("banner", "ban")
            end
            if param.size ~= nil then
                RMenu:GetType('perso')[k].Menu:SetStyleSize(param.size) 
            end
            if param.glare then
                RMenu:GetType('perso')[k].Menu:DisplayGlare(true)
            else
                RMenu:GetType('perso')[k].Menu:DisplayGlare(false)
            end
        end
    end
    Menu.Panel:MainPerso()
end)