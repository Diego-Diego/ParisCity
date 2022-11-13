local PlayersHarvesting, PlayersTransforming = {}, {}
local weedTraitQuantity = 0

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--Récolte
local function Harvest(source, part)
	if PlayersHarvesting[source] == true then

		local xPlayer = ESX.GetPlayerFromId(source)
		if part == "WeedFarms" then
			local weedQuantity = xPlayer.getInventoryItem('weed').count
			if weedQuantity >= 100 then
				xPlayer.showNotification('Vous avez trop de weed sur vous.')
				return
			else
				SetTimeout(3000, function()
					xPlayer.addInventoryItem('weed', 1)
					Harvest(source, part)
				end)
			end
		end
	end
end

RegisterServerEvent('nwx_drugs:startHarvest')
AddEventHandler('nwx_drugs:startHarvest', function(part)
	local _source = source
  	
	if PlayersHarvesting[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, 'Vous devez vous éloigner puis revenir pour éviter les glitch !')
		PlayersHarvesting[_source] = false
	else
		PlayersHarvesting[_source] = true
		TriggerClientEvent('esx:showNotification', _source, 'Récolte en cours..')  
		Harvest(_source, part)
	end
end)


RegisterServerEvent('nwx_drugs:stopHarvest')
AddEventHandler('nwx_drugs:stopHarvest', function()
	local _source = source
	
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source] = false
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez récolter de nouveau !')
		PlayersHarvesting[_source] = true
	end
end)

--Transform
local function Transform(source, part)
	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if part == "WeedTransform" then
			local weedQuantity = xPlayer.getInventoryItem('weed').count
			local weedTraitQuantity = xPlayer.getInventoryItem('weed_trait').count

			if weedTraitQuantity >= 100 then
				xPlayer.showNotification("Vous avez trop de Weed (Sèche) sur vous.")
			elseif weedQuantity <= 1 then
				xPlayer.showNotification("Vous n'avez pas assez de Weed (Humide) sur vous.")
			else
				SetTimeout(4500, function()
					xPlayer.removeInventoryItem('weed', 2)
					xPlayer.addInventoryItem('weed_trait', 1)
					
					Transform(source, part)
				end)
			end
		end
	end
end

RegisterServerEvent('nwx_drugs:startTransform')
AddEventHandler('nwx_drugs:startTransform', function(part)
	local _source = source
  	
	if PlayersTransforming[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, 'Vous devez vous éloigner puis revenir pour éviter les glitch !')
		PlayersHarvesting[_source] = false
	else
		PlayersTransforming[_source] = true
		TriggerClientEvent('esx:showNotification', _source, 'Sèchage en cours..')  
		Transform(_source, part)
	end
end)


RegisterServerEvent('nwx_drugs:stopTransform')
AddEventHandler('nwx_drugs:stopTransform', function()
	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source] = false
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez sècher de la weed de nouveau !')
		PlayersTransforming[_source] = true
	end
end)

-------------------
---- SellFarms ----
-------------------
RegisterServerEvent('nwx_drugs:sellWeed')
AddEventHandler('nwx_drugs:sellWeed', function(quantity)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local priceWeedTrait = 6 * quantity
	local quantitySellWeedTrait = quantity
	local weedTraitQuantity = xPlayer.getInventoryItem('weed_trait').count

	if not weedTraitQuantity ~= quantitySellWeedTrait and weedTraitQuantity >= quantitySellWeedTrait then
		xPlayer.removeInventoryItem('weed_trait', quantitySellWeedTrait)
		xPlayer.addAccountMoney('black_money', priceWeedTrait)
		xPlayer.showNotification('Vous avez vendu x'..quantity.. ' Weed pour ' ..priceWeedTrait.. '$')
	else
		xPlayer.showNotification("Vous n'avez pas assez de Weed (Sèche) sur vous.")
	end
end)