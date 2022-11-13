local lastPlayerSuccess = {}

if Config.MaxInService ~= -1 then
    TriggerEvent('esx_service:activateService', 'taxi', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'taxi', "Taxi Client", true, true)
TriggerEvent('esx_society:registerSociety', 'taxi', 'Taxi', 'society_taxi', 'society_taxi', 'society_taxi', {
    type = 'public'
})

RegisterNetEvent('taxiJob:success')
AddEventHandler('taxiJob:success', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local timeNow = os.clock()

    if xPlayer.job.name == 'taxi' then
        if not lastPlayerSuccess[source] or timeNow - lastPlayerSuccess[source] > 5 then
            lastPlayerSuccess[source] = timeNow

            math.randomseed(os.time())
            local total = math.random(Config.NPCJobEarnings.min, Config.NPCJobEarnings.max)

            if xPlayer.job.grade >= 3 then
                total = total * 2
            end

            TriggerEvent('esx_addonaccount:getSharedAccount', 'society_taxi', function(account)
                if account then
                    local playerMoney = ESX.Math.Round(total / 100 * 30)
                    local societyMoney = ESX.Math.Round(total / 100 * 70)

                    xPlayer.addMoney(playerMoney, "Tarif de taxi")
                    account.addMoney(societyMoney)

                    xPlayer.showNotification("- Votre société a gagné $"..societyMoney.."\n- Vous avez gagné $"..playerMoney)
                else
                    xPlayer.addMoney(total, "Tarif de taxi")
                    xPlayer.showNotification('vous avez gagné $'.. total)
                end
            end)
        end
    else
        print(('[^3WARNING^7] Player ^5%s^7 attempted to ^5esx_taxijob:success^7 (cheating)'):format(source))
    end
end)

ESX.RegisterServerCallback("taxiJob:SpawnVehicle", function(source, cb, model , props)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "taxi" then 
        print(('[^3WARNING^7] Player ^5%s^7 attempted to Exploit Vehicle Spawing!!'):format(source))
        return
    end
    local SpawnPoint = vector3(Config.spawnPoint)
    ESX.OneSync.SpawnVehicle(joaat(model), SpawnPoint, 328.81, props, function(vehicle)
        local vehicle = NetworkGetEntityFromNetworkId(vehicle)
        while GetVehicleNumberPlateText(vehicle) ~= props.plate do
            Wait(0)
        end
        TaskWarpPedIntoVehicle(GetPlayerPed(source), vehicle, -1)
    end)
    cb()
end)