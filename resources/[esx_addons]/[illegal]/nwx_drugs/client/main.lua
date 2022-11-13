local farmMenu = {
    ItemSelected = {},
    list = 1,
    ItemIndex = {},
    checkbox = false,
}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

function openSellWeedMenu()
    isInSellMenu = true
    local mainMenu = RageUI.CreateMenu("Grossiste de weed", "Vente de weed en grande quantité", 0, 0, nil, nil)

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    mainMenu.Closed = function()
        mainMenu = false
        isInSellMenu = false
    end

    while mainMenu do

        Citizen.Wait(5)

        local descWeed = "Vente de votre ~g~Weed~s~."
        RageUI.IsVisible(mainMenu, function()
            RageUI.Button('Vendre de la ~g~Weed~s~ (Sèche)', descWeed, {}, true, {
                onSelected = function()
                    local post, quantity = CheckQuantity(KeyboardInput(('Quantité'), '', 1))
                    if post then
                        if quantity ~= nil and quantity > 0 then
                            TriggerServerEvent("nwx_drugs:sellWeed", quantity)
                        else
                            ESX.ShowNotification("Quantité invalide")
                        end
                    else
                        ESX.ShowNotification("Quantité invalide")
                    end
                end
            })
        end)
    end
end