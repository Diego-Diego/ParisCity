local index2, index3, index4 = 1, 1, 1
function Menu.Panel:PersoMenuWallet()
    RageUI.Separator("~b~Métier~s~ : "..ESX.GetPlayerData().job.label.." ~b~Grade : ~s~"..ESX.GetPlayerData().job.grade_label)
    RageUI.Separator("~b~Faction~s~ : "..ESX.GetPlayerData().faction.label.." ~b~Grade : ~s~"..ESX.GetPlayerData().faction.grade_label)

    RageUI.Line({0,0,0})

    for i = 1, #ESX.PlayerData.accounts, 1 do
        if ESX.PlayerData.accounts[i].name == 'money' then
            RageUI.Separator('~b~Argent sur soi : ~s~'..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money).."$")
        elseif ESX.PlayerData.accounts[i].name == "black_money" then
            RageUI.Separator('~b~Argent sale : ~s~'..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money).."$")
        end
    end

    RageUI.Line({0,0,0})

    RageUI.List("Carte d'identité : ", {"Regarder", "Montrer"}, index2, nil, {}, true, {
        onListChange = function(index)
            index2 = index
        end,
        onSelected = function(Index, Item)
            if Index == 1 then
                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
            else
                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                if closestDistance ~= -1 and closestDistance <= 3.0 then
                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer))
                else
                    ESX.ShowNotification("~r~Il y a personne à proximité !~s~")
                end
            end
        end
    })

    RageUI.List("Permis de conduire : ", {"Regarder", "Montrer"}, index3, nil, {}, true, {
        onListChange = function(index)
            index3 = index
        end,
        onSelected = function(Index, Item)
            if Index == 1 then
                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), "driver")
            else
                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                if closestDistance ~= -1 and closestDistance <= 3.0 then
                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), "driver")
                else
                    ESX.ShowNotification("~r~Il y a personne à proximité !~s~")    
                end
            end
        end
    })

    RageUI.List("Permis port d'arme : ", {"Regarder", "Montrer"}, index4, nil, {}, true, {
        onListChange = function(index)
            index4 = index
        end,
        onSelected = function(Index, Item)
            if Index == 1 then
                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), "weapon")
            else
                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                if closestDistance ~= -1 and closestDistance <= 3.0 then
                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), "weapon")
                else
                    ESX.ShowNotification("~r~Il y a personne à proximité !~s~")    
                end
            end
        end
    })
end