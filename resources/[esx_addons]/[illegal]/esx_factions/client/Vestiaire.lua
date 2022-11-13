local hasFactionClothes = false 

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setFaction')
AddEventHandler('esx:setFaction', function(Faction)
    ESX.PlayerData.faction = Faction
end)


local menuOpen = false
RMenu.Add("Factions", "Vestiaire", RageUI.CreateMenu("Vestiaire", " ", nil , 160))
RMenu:Get("Factions", "Vestiaire").Closed = function()
    RageUI.CloseAll()
    menuOpen = false
end;
RMenu:Get("Factions", "Vestiaire").EnableMouse = false
RMenu:Get("Factions", "Vestiaire").onIndexChange = function(Index)
end

function openFactionsVestiaire()

    if menuOpen then 
		menuOpen = false 
		return 
	end
    menuOpen = true

    RageUI.Visible(RMenu:Get("Factions", "Vestiaire"), not RageUI.Visible(RMenu:Get("Factions", "Vestiaire")))
    Citizen.CreateThread(function()
        while menuOpen do
            Wait(1)
            RageUI.IsVisible(RMenu:Get("Factions", "Vestiaire"), function()
                RageUI.Separator("↓ ~b~Tenue Perso ~s~↓")

                for index,infos in pairs(Cloak.clothes.specials) do
                    RageUI.Button(infos.label, nil, { RightBadge = RageUI.BadgeStyle.Clothes}, true, {
                        onSelected = function()
                            TriggerEvent("skinchanger:getSkin", function(skin)    
                                local uniformObject
                                if skin.sex == 0 then
                                    uniformObject = infos.variations.male
                                else
                                    uniformObject = infos.variations.female
                                end
                                if uniformObject then
                                    TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
                                end
                            end)
                            TriggerEvent('skinchanger:getSkin', function(skin)
                                TriggerServerEvent('esx_skin:save', skin)
                            end)

                            hasFactionClothes = false
                        end,
                    })
                end
               
                RageUI.Separator("↓ ~b~Tenues de Faction ~s~↓")
                if ESX.PlayerData.faction.name == "medellin" then
                    for index,infos in pairs(Cloak.clothes.Medellin) do
                        if ESX.PlayerData.faction.grade >= infos.minimum_grade then
                            RageUI.Button(infos.label, nil, { RightBadge = RageUI.BadgeStyle.Clothes}, true, {
                                onSelected = function()
                                    ApplySkinSpecificFaction(infos)
                                end,
                            })
                        end
                    end
                end
                if ESX.PlayerData.faction.name == "ira" then
                    for index,infos in pairs(Cloak.clothes.IRA) do
                        RageUI.Button(infos.label, nil, { RightBadge = RageUI.BadgeStyle.Clothes}, true, {
                            onSelected = function()
                                ApplySkinSpecificFaction(infos)

                            end,
                        })
                    end
                end
                if ESX.PlayerData.faction.name == "mercenaire" then
                    for index,infos in pairs(Cloak.clothes.Mercenaires) do
                        RageUI.Button(infos.label, nil, { RightBadge = RageUI.BadgeStyle.Clothes}, true, {
                            onSelected = function()
                                ApplySkinSpecificFaction(infos)

                            end,
                        })
                    end
                end
                if ESX.PlayerData.faction.name == "sinaloa" then
                    for index,infos in pairs(Cloak.clothes.Sinaloa) do
                        RageUI.Button(infos.label, nil, { RightBadge = RageUI.BadgeStyle.Clothes}, true, {
                            onSelected = function()
                                ApplySkinSpecificFaction(infos)

                            end,
                        })
                    end
                end
                if ESX.PlayerData.faction.name == "stidda" then
                    for index,infos in pairs(Cloak.clothes.Stidda) do
                        RageUI.Button(infos.label, nil, { RightBadge = RageUI.BadgeStyle.Clothes}, true, {
                            onSelected = function()
                                ApplySkinSpecificFaction(infos)

                            end,
                        })
                    end
                end

                if ESX.PlayerData.faction.name == "loszetas" then
                    for index,infos in pairs(Cloak.clothes.LosZetas) do
                        RageUI.Button(infos.label, nil, { RightBadge = RageUI.BadgeStyle.Clothes}, true, {
                            onSelected = function()
                                ApplySkinSpecificFaction(infos)

                            end,
                        })
                    end
                end

                if ESX.PlayerData.faction.name == "salvatierra" then
                    for index,infos in pairs(Cloak.clothes.Salvatierra) do
                        RageUI.Button(infos.label, nil, { RightBadge = RageUI.BadgeStyle.Clothes}, true, {
                            onSelected = function()
                                ApplySkinSpecificFaction(infos)

                            end,
                        })
                    end
                end

                if ESX.PlayerData.faction.name == "duchesse" then
                    for index,infos in pairs(Cloak.clothes.Duchesse) do
                        RageUI.Button(infos.label, nil, { RightBadge = RageUI.BadgeStyle.Clothes}, true, {
                            onSelected = function()
                                ApplySkinSpecificFaction(infos)

                            end,
                        })
                    end
                end

                if ESX.PlayerData.faction.name == "madrazo" then
                    for index,infos in pairs(Cloak.clothes.Madrazo) do
                        RageUI.Button(infos.label, nil, { RightBadge = RageUI.BadgeStyle.Clothes}, true, {
                            onSelected = function()
                                ApplySkinSpecificFaction(infos)
                            end,
                        })
                    end
                end

                if ESX.PlayerData.faction.name == "mendoza" then
                    for index,infos in pairs(Cloak.clothes.Mendoza) do
                        if ESX.PlayerData.faction.grade >= infos.minimum_grade then
                            RageUI.Button(infos.label, nil, { RightBadge = RageUI.BadgeStyle.Clothes}, true, {
                                onSelected = function()
                                    ApplySkinSpecificFaction(infos)
                                end,
                            })
                        end
                    end
                end

                if ESX.PlayerData.faction.name == "shadow" then
                    for index,infos in pairs(Cloak.clothes.Shadow) do
                        if ESX.PlayerData.faction.grade >= infos.minimum_grade then
                            RageUI.Button(infos.label, nil, { RightBadge = RageUI.BadgeStyle.Clothes}, true, {
                                onSelected = function()
                                    ApplySkinSpecificFaction(infos)
                                end,
                            })
                        end
                    end
                end
                
            end, function() 
            end)
        end
    end)
end

function ApplySkinSpecificFaction(infos)
    
    if not hasFactionClothes then
        TriggerEvent('skinchanger:getSkin', function(skin)
            if skin.sex == 0 then
                Cloak.clothes.specials[0].variations.male = skin
            else
                Cloak.clothes.specials[0].variations.female = skin
            end
        end)
    end

    TriggerEvent("skinchanger:getSkin", function(skin)    
        local uniformObject
        if skin.sex == 0 then
            uniformObject = infos.variations.male
        else
            uniformObject = infos.variations.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
        infos.onEquip()
    end)

    TriggerEvent('skinchanger:getSkin', function(skin)
        TriggerServerEvent('esx_skin:save', skin)
    end)

    hasFactionClothes = true
end

RegisterNetEvent("MyCity_Factions:openFactionsVestiaire")
AddEventHandler("MyCity_Factions:openFactionsVestiaire", function()
    openFactionsVestiaire()
end)