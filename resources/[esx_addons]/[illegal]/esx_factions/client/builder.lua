ActualGang = nil
gangsKit = {
	Weapons = {
		[1] = {
			{name = 'WEAPON_KNIFE', price = 1500},
			{name = 'WEAPON_PISTOL', price = 115000},
			{name = 'WEAPON_MICROSMG', price = 170000},
			{name = 'WEAPON_ASSAULTSMG', price = 375000}
		},
		[2] = {}
	}
}

RegisterNetEvent('gb:SyncGang')
AddEventHandler('gb:SyncGang', function(data)
	ActualGang = data
end)

function KeyboardInput(TextEntry, ExampleText, MaxStringLength)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry .. ':')
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

function ShowNotification(text)
	BeginTextCommandThefeedPost('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandThefeedPostTicker(false, false)
end

function VectorToArray(vector)
	return {x = vector.x, y = vector.y, z = vector.z}
end

function RoundNumber(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end