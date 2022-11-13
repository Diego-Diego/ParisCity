GangsData = {}

Citizen.CreateThread(function()
	GangsData = GetGangs()

	for i = 1, #GangsData, 1 do
		TriggerEvent('esx_societyfaction:registerSocietyFaction', GangsData[i].Name, GangsData[i].Label, 'society_' .. GangsData[i].Name, 'society_' .. GangsData[i].Name, 'society_' .. GangsData[i].Name, {type = 'public'})
	end
end)

function GetGangs()
	local data = LoadResourceFile('esx_factions', 'data/gangData.json')
	return data and json.decode(data) or {}
end

function GetGang(faction)
	for i = 1, #GangsData, 1 do
		if faction.name == GangsData[i].Name then
			return GangsData[i]
		end
	end

	return false
end

RegisterServerEvent('gb:addGang')
AddEventHandler('gb:addGang', function(data)
	MySQL.Async.execute([[
INSERT INTO `addon_account` (name, label, shared) VALUES (@gangSociety, @gangLabel, 1);
INSERT INTO `datastore` (name, label, shared) VALUES (@gangSociety, @gangLabel, 1);
INSERT INTO `addon_inventory` (name, label, shared) VALUES (@gangSociety, @gangLabel, 1);
INSERT INTO `factions` (`name`, `label`) VALUES (@gangName, @gangLabel);
INSERT INTO `faction_grades` (`faction_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(@gangName, 0, 'rookie', 'Associé', 0, '{}', '{}'),
	(@gangName, 1, 'member', 'Soldat', 0, '{}', '{}'),
	(@gangName, 2, 'elite', 'Elite', 0, '{}', '{}'),
	(@gangName, 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
	(@gangName, 4, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
	(@gangName, 5, 'boss', 'Patron', 0, '{}', '{}')
;
	]], {
		['@gangName'] = data.Name,
		['@gangLabel'] = data.Label,
		['@gangSociety'] = 'society_' .. data.Name
	}, function()
		table.insert(GangsData, data)
		SaveResourceFile('esx_factions', 'data/gangData.json', json.encode(GangsData))
	end)
end)

RegisterServerEvent('gb:requestSync')
AddEventHandler('gb:requestSync', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	while xPlayer == nil do
		Wait(5)
	end

	local plyGang = GetGang(xPlayer.faction)
	TriggerClientEvent('gb:SyncGang', xPlayer.source, plyGang)
end)

AddEventHandler('esx:playerLoaded', function(source, xPlayer)
	local plyGang = GetGang(xPlayer.faction)
	TriggerClientEvent('gb:SyncGang', source, plyGang)
end)

AddEventHandler('esx:setFaction', function(source, faction)
	local plyGang = GetGang(faction)
	TriggerClientEvent('gb:SyncGang', source, plyGang)
end)

ESX.RegisterServerCallback('Shun_Gang:GetUserGroup', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local plyGroup = xPlayer.getGroup()

	if plyGroup ~= nil then 
		cb(plyGroup)
	else
		cb('user')
	end
end)
