open = false
local mainMenu = RageUI.CreateMenu("", "Vestiaire Taxi", nil, nil, "banner", "ban")

mainMenu.Closed = function()
    open = false
end

function OpenCloakRoom()
    if (open) then
        return
    end
    open = true

    RageUI.Visible(mainMenu, true)

    CreateThread(function()
        while (open) do
            RageUI.IsVisible(mainMenu, function()
                RageUI.Button("Tenue civil", nil, {}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                            TriggerEvent('skinchanger:loadSkin', skin)
                        end)
                    end
                })
                RageUI.Button("Tenue de service", nil, {}, true, {
                    onSelected = function()
                        setUniform("work", PlayerPedId())
                    end
                })
            end)

            Wait(0)
        end
    end)
end

function setUniform(uniform, playerPed)
	TriggerEvent('skinchanger:getSkin', function(skin)
		local uniformObject

		if skin.sex == 0 then
			uniformObject = Config.Uniforms[uniform].male
		else
			uniformObject = Config.Uniforms[uniform].female
		end

		if uniformObject then
			TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
		else
			ESX.ShowNotification(TranslateCap('no_outfit'))
		end
	end)
end