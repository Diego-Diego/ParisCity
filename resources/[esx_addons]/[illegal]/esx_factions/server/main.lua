ESX.RegisterServerCallback('MyCity_Factions:getOtherPlayerData', function(source, cb, target, notify)
	local xPlayer = ESX.GetPlayerFromId(target)
	TriggerClientEvent('MyCity_Factions:blockOpenMenu', target)
	TriggerClientEvent('esx_inventoryhud_trunk:blockMenu', target)

	if xPlayer then
		local data = {
			inventory = xPlayer.getInventory(),
			accounts = xPlayer.getAccounts(),
			weapons = xPlayer.getLoadout()
		}

		local result = MySQL.Sync.fetchAll("SELECT phone_number FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.identifier})
		
		if result[1] == nil then
			data.phone_number = ''
		else
			data.phone_number = result[1].phone_number
        end

		TriggerEvent('esx_license:getLicenses', target, function(licenses)
			data.licenses = licenses
			cb(data)
		end)
	end
end)

RegisterNetEvent('MyCity_Factions:stopBlockMenuSv')
AddEventHandler('MyCity_Factions:stopBlockMenuSv', function(target)
	TriggerClientEvent('MyCity_Factions:stopBlockMenu', target)
	TriggerClientEvent('esx_inventoryhud_trunk:stopBlockMenu', target)
end)

RegisterNetEvent('MyCity_Facitons:handcuff')
AddEventHandler('MyCity_Facitons:handcuff', function(target)
  local _source = source
  local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local xPlayer = ESX.GetPlayerFromId(source)

	if sourceXPlayer.faction ~= nil and sourceXPlayer.faction.grade_name == 'civil' then
    	print(('MyCity_Facitons: %s attempted to handcuff a player (not in faction)!'):format(xPlayer.identifier))
	else
		TriggerClientEvent('MyCity_Facitons:handcuff', target)
		TriggerClientEvent('crewPhone:blockPhone', target)
	end
end)

RegisterNetEvent('MyCity_Factions:confiscatePlayerItem')
AddEventHandler('MyCity_Factions:confiscatePlayerItem', function(target, itemType, itemName, amount)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if itemType == 'item_standard' then
		local targetItem = targetXPlayer.getInventoryItem(itemName)
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)

		-- does the target player have enough in their inventory?
		if targetItem.count > 0 and targetItem.count <= amount then

			-- can the player carry the said amount of x item?
			if sourceXPlayer.getInventoryItem(itemName, sourceItem.count) then
				targetXPlayer.removeInventoryItem(itemName, amount)
				sourceXPlayer.addInventoryItem(itemName, amount)

				sourceXPlayer.showNotification('Vous avez pris : ~b~' .. amount .. '~g~x ~b~'..sourceItem.label)
				targetXPlayer.showNotification('On vous a pris : ~b~' .. amount .. '~g~x ~b~'..sourceItem.label)
				TriggerEvent('MyCity_Core:PlayerToPlayer:Logs', os.date("%d/%m/%y à %H:%M"), sourceXPlayer.getName() .. " viens de prendre " .. amount .."x " .. sourceItem.label .. " à ".. targetXPlayer.getName())
			else
				sourceXPlayer.showNotification("Fouille - ~r~Quantité Invalide")
			end
		else
			sourceXPlayer.showNotification("Fouille - La personne ne possède ~r~aucun objet")
		end

	elseif itemType == 'item_account' then
		targetXPlayer.removeAccountMoney(itemName, amount)
		sourceXPlayer.addAccountMoney(itemName, amount)

		sourceXPlayer.showNotification('Vous avez pris : ~g~$'..ESX.Math.GroupDigits(amount)..'~s~ d\'~b~Argent Sale')
		targetXPlayer.showNotification('On vous a pris : ~g~$'..ESX.Math.GroupDigits(amount)..'~s~ d\'~b~Argent Sale')
		TriggerEvent('MyCity_Core:PlayerToPlayer:Logs', os.date("%d/%m/%y à %H:%M"), sourceXPlayer.getName() .. " viens de prendre $" .. amount .." de " .. sourceXPlayer.getAccount(itemName).label .. " à ".. targetXPlayer.getName())
	elseif itemType == 'item_weapon' then
		if amount == nil then amount = 0 end

		if not sourceXPlayer.hasWeapon(itemName) then
			local _, weapon = targetXPlayer.getWeapon(itemName)
			targetXPlayer.removeWeapon(itemName, amount)
			sourceXPlayer.addWeapon(itemName, amount)

			if weapon.tintIndex and weapon.tintIndex ~= 0 then 
				sourceXPlayer.setWeaponTint(itemName, weapon.tintIndex)
			end

			if weapon.components then
				for k,v in ipairs(weapon.components) do
					sourceXPlayer.addWeaponComponent(itemName, v)
				end
			end

			sourceXPlayer.showNotification('Vous avez pris : ~b~'..ESX.GetWeaponLabel(itemName)..' x'..amount)
			targetXPlayer.showNotification('On vous a pris : ~b~'..ESX.GetWeaponLabel(itemName)..' x'..amount)
			TriggerEvent('MyCity_Core:PlayerToPlayer:Logs', os.date("%d/%m/%y à %H:%M"), sourceXPlayer.getName() .. " viens de prendre " .. ESX.GetWeaponLabel(itemName) .." avec " .. amount .. "x munitions à ".. targetXPlayer.getName())
		else
			sourceXPlayer.showNotification('~r~Vous possédez déjà cette arme !')
		end
	end
end)

RegisterNetEvent('MyCity_Facitons:drag')
AddEventHandler('MyCity_Facitons:drag', function(target)
  local _source = source
  local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local xPlayer = ESX.GetPlayerFromId(source)

	if sourceXPlayer.faction ~= nil and sourceXPlayer.faction.grade_name == 'civil' then
    print(('MyCity_Facitons: %s attempted to drag (not cop)!'):format(xPlayer.identifier))
	else
		TriggerClientEvent('MyCity_Facitons:drag', target, source)
	end
end)

RegisterNetEvent('MyCity_Facitons:putInVehicle')
AddEventHandler('MyCity_Facitons:putInVehicle', function(target)
  local _source = source
  local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local xPlayer = ESX.GetPlayerFromId(source)

	if sourceXPlayer.faction ~= nil and sourceXPlayer.faction.grade_name == 'civil' then
    print(('MyCity_Facitons: %s attempted to put in vehicle (not cop)!'):format(xPlayer.identifier))
	else
		TriggerClientEvent('MyCity_Facitons:putInVehicle', target)
	end
end)

RegisterNetEvent('MyCity_Facitons:OutVehicle')
AddEventHandler('MyCity_Facitons:OutVehicle', function(target)
  local _source = source
  local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local xPlayer = ESX.GetPlayerFromId(source)

	if sourceXPlayer.faction ~= nil and sourceXPlayer.faction.grade_name == 'civil' then
    print(('MyCity_Facitons: %s attempted to drag out from vehicle (not cop)!'):format(xPlayer.identifier))
	else
		TriggerClientEvent('MyCity_Facitons:OutVehicle', target)
	end
end)

RegisterServerEvent("esx_societyfaction:ChangeStateVehicle")
AddEventHandler("esx_societyfaction:ChangeStateVehicle", function(VehProp, state, stealby, stealgang)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if not stealby then stealby = xPlayer.identifier end
	if not stealgang then stealgang = xPlayer.faction.name end

	MySQL.Async.execute('UPDATE owned_vehicles SET state=@state, StealBy = @stealby, StealGang = @stealgang WHERE plate=@plate', {
        ['@state'] = state,
		['@stealby'] = stealby,
		['@stealgang'] = stealgang,
        ['@plate'] = VehProp.plate
    }, function()
	end)
end)

RegisterNetEvent('CoffreRageUI:putStockBlackMoney')
AddEventHandler('CoffreRageUI:putStockBlackMoney', function(itemName, count)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local label = 'Argent Sale'

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_'..xPlayer.faction.name, function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		if xPlayer.getAccount('black_money').money >= count and count > 0 then
			xPlayer.removeAccountMoney('black_money', count)
			inventory.addItem(itemName, count)
			TriggerClientEvent("esx:showNotification", source, "Vous avez déposé : $"..count.."~s~ | "..label)
			TriggerEvent('MyCity_Core:CoffreFactions:Logs', xPlayer.faction.label, xPlayer.getName() .." viens de déposer x"..count.." de "..label)
		else
			TriggerClientEvent("esx:showNotification", source, "Quantité Invalide")
		end
	end)
end)

RegisterNetEvent('CoffreRageUI:putStockBlackMoneyBoss')
AddEventHandler('CoffreRageUI:putStockBlackMoneyBoss', function(itemName, count)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local label = 'Argent Sale'

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_'..xPlayer.faction.name ..'boss', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		if xPlayer.getAccount('black_money').money >= count and count > 0 then
			xPlayer.removeAccountMoney('black_money', count)
			inventory.addItem(itemName, count)
			TriggerClientEvent("esx:showNotification", source, "Vous avez déposé : $"..count.."~s~ | "..label)
			TriggerEvent('MyCity_Core:CoffreFactions:Logs', xPlayer.faction.label .. " - Coffre Boss", xPlayer.getName() .." viens de déposer x"..count.." de ".. label)
		else
			TriggerClientEvent("esx:showNotification", source, "Quantité Invalide")
		end
	end)
end)

ESX.RegisterServerCallback('esx_gangjob:addArmoryWeapon', function(source, cb, weaponName, weaponAmmo)
	local xPlayer = ESX.GetPlayerFromId(source)
	local station = xPlayer.faction.name
	if xPlayer.hasWeapon(weaponName) then
		local _, weapon = xPlayer.getWeapon(weaponName)
		TriggerEvent('esx_datastore:getSharedDataStore', 'society_'..station, function(store)
			local weapons = store.get('weapons') or {}
			weaponName = string.upper(weaponName)
			table.insert(weapons, weapon)
			TriggerEvent('MyCity_Core:CoffreFactions:Logs', xPlayer.faction.label, xPlayer.getName() .." viens de déposer une arme : ".. ESX.GetWeaponLabel(weaponName))
			xPlayer.removeWeapon(weaponName)
				store.set('weapons', weapons)
				cb()
		end)
	else
		xPlayer.showNotification('Vous ne possédez pas cette arme !')
		cb()
	end
end)

ESX.RegisterServerCallback('esx_gangjob:addArmoryWeaponBoss', function(source, cb, weaponName, weaponAmmo)
	local xPlayer = ESX.GetPlayerFromId(source)
	local station = xPlayer.faction.name
	if xPlayer.hasWeapon(weaponName) then
	TriggerEvent('esx_datastore:getSharedDataStore', 'society_'..station .. 'boss', function(store)
		local _, weapon = xPlayer.getWeapon(weaponName)
		local weapons = store.get('weapons') or {}
		weaponName = string.upper(weaponName)
		table.insert(weapons, weapon)
		TriggerEvent('MyCity_Core:CoffreFactions:Logs', xPlayer.faction.label .. " - Coffre Boss", xPlayer.getName() .." viens de déposer une arme : ".. ESX.GetWeaponLabel(weaponName))
		xPlayer.removeWeapon(weaponName)
			store.set('weapons', weapons)
			cb()
		end)
	else
		xPlayer.showNotification('Vous ne possédez pas cette arme !')
		cb()
	end
end)

ESX.RegisterServerCallback('esx_gangjob:removeArmoryWeapon', function(source, cb, weaponName, weaponAmmo)
	local xPlayer = ESX.GetPlayerFromId(source)
	local station = xPlayer.faction.name
	if not xPlayer.hasWeapon(weaponName) then
		TriggerEvent('esx_datastore:getSharedDataStore', 'society_'..station, function(store)
		local weapons = store.get('weapons') or {}
		weaponName = string.upper(weaponName)

		for i = 1, #weapons, 1 do
			if weapons[i].name == weaponName and weapons[i].ammo == weaponAmmo then
				xPlayer.addWeapon(weaponName, weapons[i].ammo)
				
				if weapons[i].tintIndex and weapons[i].tintIndex ~= 0 then 
					xPlayer.setWeaponTint(weaponName, weapons[i].tintIndex)
				end

				if weapons[i].components then
					for k,v in ipairs(weapons[i].components) do
						xPlayer.addWeaponComponent(weaponName, v)
					end
				end

				table.remove(weapons, i)
				TriggerEvent('MyCity_Core:CoffreFactions:Logs', xPlayer.faction.label, xPlayer.getName() .." viens de retirer une arme : ".. ESX.GetWeaponLabel(weaponName))
				store.set('weapons', weapons)
				
				break
			end
		end
			cb()
		end)
	else
		xPlayer.showNotification('Vous possédez déjà cette arme !')
		cb()
	end
end)

ESX.RegisterServerCallback('esx_gangjob:removeArmoryWeaponBoss', function(source, cb, weaponName, weaponAmmo)
	local xPlayer = ESX.GetPlayerFromId(source)
	local station = xPlayer.faction.name
	if not xPlayer.hasWeapon(weaponName) then
		TriggerEvent('esx_datastore:getSharedDataStore', 'society_'..station .. 'boss', function(store)
		local weapons = store.get('weapons') or {}
		weaponName = string.upper(weaponName)

		for i = 1, #weapons, 1 do
			if weapons[i].name == weaponName and weapons[i].ammo == weaponAmmo then
				xPlayer.addWeapon(weaponName, weaponAmmo)
				
				if weapons[i].tintIndex and weapons[i].tintIndex ~= 0 then 
					xPlayer.setWeaponTint(weaponName, weapons[i].tintIndex)
				end

				if weapons[i].components then
					for k,v in ipairs(weapons[i].components) do
						xPlayer.addWeaponComponent(weaponName, v)
					end
				end

				table.remove(weapons, i)
				TriggerEvent('MyCity_Core:CoffreFactions:Logs', xPlayer.faction.label .. " - Coffre Boss", xPlayer.getName() .." viens de retirer une arme : ".. ESX.GetWeaponLabel(weaponName))
				store.set('weapons', weapons)
				break
			end
		end
			cb()
		end)
	else
		xPlayer.showNotification('Vous possédez déjà cette arme !')
		cb()
	end
end)

ESX.RegisterServerCallback('esx_gangjob:getArmoryWeapons', function(source, cb, station)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_' .. station, function(store)
  
	  local weapons = store.get('weapons')
  
	  if weapons == nil then
		weapons = {}
	  end
  
	  cb(weapons)
	end)
end)

ESX.RegisterServerCallback('esx_gangjob:getArmoryWeaponsBoss', function(source, cb, station)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_' .. station ..'boss', function(store)
  
	  local weapons = store.get('weapons')
  
	  if weapons == nil then
		weapons = {}
	  end
  
	  cb(weapons)
  
	end) 
end)

ESX.RegisterServerCallback("MyCity_Factions:CoffreEntreprise:StockFaction", function(source, cb)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerEvent("esx_addoninventory:getSharedInventory", "society_"..xPlayer.faction.name, function(inventory)
        cb(inventory)
    end)
end)

ESX.RegisterServerCallback("MyCity_Factions:CoffreEntreprise:StockFactionBoss", function(source, cb)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerEvent("esx_addoninventory:getSharedInventory", "society_"..xPlayer.faction.name ..'boss', function(inventory)
        cb(inventory)
    end)
end)

RegisterServerEvent("MyCity_Factions:CoffreFaction:PutStocks")
AddEventHandler("MyCity_Factions:CoffreFaction:PutStocks", function(itemName, count)
    local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_'..xPlayer.faction.name, function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent("esx:showNotification", source, "Vous avez déposé : x"..count.."~s~ | "..inventoryItem.label)
			TriggerEvent('MyCity_Core:CoffreFactions:Logs', xPlayer.faction.label, xPlayer.getName() .." viens de déposer x"..ESX.Math.GroupDigits(count).." de "..inventoryItem.label)
		else
			TriggerClientEvent("esx:showNotification", source, "Quantité Invalide")
		end
	end)
end)

RegisterServerEvent("MyCity_Factions:CoffreFaction:PutStocksBoss")
AddEventHandler("MyCity_Factions:CoffreFaction:PutStocksBoss", function(itemName, count)
    local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_'..xPlayer.faction.name ..'boss', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent("esx:showNotification", source, "Vous avez déposé : x"..count.."~s~ | "..inventoryItem.label)
			TriggerEvent('MyCity_Core:CoffreFactions:Logs', xPlayer.faction.label  .. " - Coffre Boss", xPlayer.getName() .." viens de déposer x"..ESX.Math.GroupDigits(count).." de "..inventoryItem.label)
		else
			TriggerClientEvent("esx:showNotification", source, "Quantité Invalide")
		end
	end)
end)

RegisterServerEvent("MyCity_Factions:CoffreFaction:GetStocks")
AddEventHandler("MyCity_Factions:CoffreFaction:GetStocks", function(itemName, count)
    local source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_'..xPlayer.faction.name, function(inventory)
		local inventoryItem = inventory.getItem(itemName)
		local dirtymoney = "argent_sale"
		if count > 0 and inventoryItem.count >= count then
			if xPlayer.getInventoryItem(itemName, count) then
				inventory.removeItem(itemName, count)
				if itemName == dirtymoney then
					xPlayer.addAccountMoney('black_money', count)
					TriggerClientEvent("ESX:showNotification", source, 'Vous avez retirer : $ '..count.."~s~ |  d'Argent Sale")
					TriggerEvent('MyCity_Core:CoffreFactions:Logs', xPlayer.faction.label, xPlayer.getName() .." viens de retirer x"..ESX.Math.GroupDigits(count).." d'Argent Sale")
				else
					xPlayer.addInventoryItem(itemName, count)
					TriggerEvent('MyCity_Core:CoffreFactions:Logs', xPlayer.faction.label, xPlayer.getName() .." viens de retirer x"..ESX.Math.GroupDigits(count).." de "..inventoryItem.label)
				end
				TriggerClientEvent("ESX:showNotification", source, 'Vous avez retiré : x'..count.."~s~ | "..inventoryItem.label)
			else
				TriggerClientEvent("ESX:showNotification", source, "Quantité Invalide")
			end
		else
			TriggerClientEvent("ESX:showNotification", source, "Quantité Invalide")
		end
	end)
end)

RegisterServerEvent("MyCity_Factions:CoffreFaction:GetStocksBoss")
AddEventHandler("MyCity_Factions:CoffreFaction:GetStocksBoss", function(itemName, count)
    local source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_'..xPlayer.faction.name .. 'boss', function(inventory)
		local inventoryItem = inventory.getItem(itemName)
		local dirtymoney = "argent_sale"
		if count > 0 and inventoryItem.count >= count then
			if xPlayer.getInventoryItem(itemName, count) then
				inventory.removeItem(itemName, count)
				if itemName == dirtymoney then
					xPlayer.addAccountMoney('black_money', count)
					TriggerClientEvent("ESX:showNotification", source, 'Vous avez retirer : $ '..count.."~s~ |  d'Argent Sale")
					TriggerEvent('MyCity_Core:CoffreFactions:Logs', xPlayer.faction.label .. " - Coffre Boss", xPlayer.getName() .." viens de retirer x"..ESX.Math.GroupDigits(count).." d'Argent Sale")
				else
					xPlayer.addInventoryItem(itemName, count)
					TriggerEvent('MyCity_Core:CoffreFactions:Logs', xPlayer.faction.label .. " - Coffre Boss", xPlayer.getName() .." viens de retirer x"..ESX.Math.GroupDigits(count).." de "..inventoryItem.label)
				end
				TriggerClientEvent("ESX:showNotification", source, 'Vous avez retiré : x'..count.."~s~ | "..inventoryItem.label)
			else
				TriggerClientEvent("ESX:showNotification", source, "Quantité Invalide")
			end
		else
			TriggerClientEvent("ESX:showNotification", source, "Quantité Invalide")
		end
	end)
end)

ESX.RegisterUsableItem('boitedarmevide', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('Shun_Gang:BoiteArmeVide', source)
end)

RegisterNetEvent('Shun_Gang:addWeaponInBox')
AddEventHandler('Shun_Gang:addWeaponInBox', function(pweaponlabel)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	print(pweaponlabel)
  
	xPlayer.removeWeapon(pweaponlabel)
	xPlayer.addInventoryItem(pweaponlabel, 1)
	xPlayer.removeInventoryItem('boitedarmevide', 1)
end)

--Surrender
RegisterServerEvent('MyCity_Factions:trySurrender')
AddEventHandler('MyCity_Factions:trySurrender', function(target)
	TriggerClientEvent('MyCity_Factions:getSurrender', target)
end)

RegisterServerEvent('MyCity_Factions:trySurrender2')
AddEventHandler('MyCity_Factions:trySurrender2', function(target)
	TriggerClientEvent('MyCity_Factions:getSurrender2', target)
end)

RegisterServerEvent('MyCity_Factions:makeCancelEmote')
AddEventHandler('MyCity_Factions:makeCancelEmote', function(target)
	TriggerClientEvent('MyCity_Factions:getCancelEmote', target)
end)