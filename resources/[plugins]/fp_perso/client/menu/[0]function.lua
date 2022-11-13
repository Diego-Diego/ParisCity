function KeyboardInput(TextEntry, ExampleText, MaxStringLength)
    AddTextEntry("FMMC_KEY_TIP1", TextEntry .. "")
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        blockinput = false
        return result
    else
        Citizen.Wait(500)
        blockinput = false
        return nil
    end
end

function CheckQuantity(number)
    number = tonumber(number)

    if type(number) == 'number' then
        number = number

        if number > 0 then
            return true, number
        end
    end

    return false, number
end

for i = 0, 255, 1 do
    table.insert(Menu.style.Settings.color.red, i)
    table.insert(Menu.style.Settings.color.green, i)
    table.insert(Menu.style.Settings.color.blue, i)
    table.insert(Menu.style.Settings.color.alpha, i)
end

settingsMenu = {}
if GetResourceKvpString("settingsMenu") ~= nil then 
    settingsMenu = json.decode(GetResourceKvpString("settingsMenu")) 
    print(GetResourceKvpString("settingsMenu")) 
end

mapMenu = {}
if GetResourceKvpString("mapMenu") ~= nil then 
    mapMenu = json.decode(GetResourceKvpString("mapMenu")) 
    print(GetResourceKvpString("mapMenu")) 
else 
    print("Aucun paramètre trouvé") 
end