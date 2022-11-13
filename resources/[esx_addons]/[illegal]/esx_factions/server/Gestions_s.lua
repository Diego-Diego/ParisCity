local Jobs = {}

MySQL.ready(function()
	local result = MySQL.Sync.fetchAll('SELECT * FROM factions', {})

	for i=1, #result, 1 do
		Jobs[result[i].name] = result[i]
		Jobs[result[i].name].grades = {}
	end

	local result2 = MySQL.Sync.fetchAll('SELECT * FROM faction_grades', {})

	for i=1, #result2, 1 do
		Jobs[result2[i].faction_name].grades[tostring(result2[i].grade)] = result2[i]
	end
end)

RegisterServerEvent('GestionOrga:AddMoneySocietyFaction')
AddEventHandler('GestionOrga:AddMoneySocietyFaction', function(amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    local society = xPlayer.faction.name
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..society, function(account)
        
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getMoney() >= amount then
            xPlayer.removeMoney(amount)
            account.addMoney(amount)
            TriggerClientEvent('esx:showNotification', source, "Vous avez déposé ~g~$" .. ESX.Math.GroupDigits(amount))
            TriggerEvent('MyCity_Core:GestionsFactions:Logs', xPlayer.faction.label, xPlayer.getName() .." viens de déposer ".. ESX.Math.GroupDigits(amount) .. "$, nouveau solde : " .. ESX.Math.GroupDigits(account.money + amount) .. "$")
        else
            TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas autant d'argent sur vous !")    
        end 
	end)
end) 

RegisterServerEvent('GestionOrga:RemoveMoneySocietyFaction')
AddEventHandler('GestionOrga:RemoveMoneySocietyFaction', function(amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    local society = xPlayer.faction.name
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..society, function(account)
        local xPlayer = ESX.GetPlayerFromId(source)
        print(amount)
        if amount > 0 and account.money >= amount then
            xPlayer.addMoney(amount)
            account.removeMoney(amount)
            TriggerClientEvent('esx:showNotification', source, "Vous avez retiré ~g~$" .. ESX.Math.GroupDigits(amount))
            TriggerEvent('MyCity_Core:GestionsFactions:Logs', xPlayer.faction.label, xPlayer.getName() .." viens de retirer ".. ESX.Math.GroupDigits(amount) .. "$, nouveau solde : " .. ESX.Math.GroupDigits(account.money - amount) .. "$")
        else
            TriggerClientEvent('esx:showNotification', source, "Il n'y a pas autant d'argent dans le coffre !")
        end 
	end)
end) 

ESX.RegisterServerCallback("GestionOrga:getSocietyMoneyFaction", function(source, cb)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local society = xPlayer.faction.name
    
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..society, function(account)
        cb(account.money)
    end)
end)

ESX.RegisterServerCallback("GestionOrga:getEmployeesFaction", function(source, cb, society)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local faction = xPlayer.faction.name
    MySQL.Async.fetchAll('SELECT firstname, lastname, identifier, faction, faction_grade FROM users WHERE faction=@faction ORDER BY faction_grade DESC', {
        ['@faction'] = faction
    }, function (results)
        local faction = {}

        for i=1, #results, 1 do
            table.insert(faction, {
                name       = results[i].firstname .. ' ' .. results[i].lastname,
                identifier = results[i].identifier,
                job = {
                    name        = results[i].faction,
                    label       = Jobs[results[i].faction].label,
                    grade       = results[i].faction_grade,
                    grade_name  = Jobs[results[i].faction].grades[tostring(results[i].faction_grade)].name,
                    grade_label = Jobs[results[i].faction].grades[tostring(results[i].faction_grade)].label
                }
            })
        end

        cb(faction)
    end)
end)


ESX.RegisterServerCallback('GestionsOrga:setJobSalaryFaction', function(source, cb, job, grade, salary)
    MySQL.Async.execute('UPDATE faction_grades SET salary = @salary WHERE faction_name = @faction_name AND grade = @grade',{
        ['@salary']   = salary,
        ['@faction_name'] = job,
        ['@grade']    = grade
    },function(rowsChanged)
            Jobs[job].grades[tostring(grade)].salary = salary
            local xPlayers = ESX.GetPlayers()
            for i=1, #xPlayers, 1 do
                local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
                if xPlayer.faction.name == job and xPlayer.job2.grade == grade then
                    xPlayer.setFaction(job, grade)
                end
            end
        cb()
    end)
end)