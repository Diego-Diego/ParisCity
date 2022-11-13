function quantity(type)
    if type == "Menu maxi best of™" then
        return " ~y~50cl~s~"
    else
        return " ~y~40cl~s~"
    end
end

function GetAvailableVehicleSpawnPoint(coords, key)
	local spawnPoints = _McDo.spawnPoint
	local found, foundSpawnPoint = false, nil

	for i=1, #spawnPoints, 1 do
		if ESX.Game.IsSpawnPointClear(coords, 1.0) then
			found, foundSpawnPoint = true, spawnPoints[key]
			break
		end
	end

	if found then
		return true, foundSpawnPoint
	else
		ESX.ShowNotification("~r~Il y a déjà un véhicule sur la place de parking~s~")
		return false
	end
end