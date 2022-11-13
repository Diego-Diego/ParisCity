RegisterNetEvent("AnnonceJob")
AddEventHandler("AnnonceJob", function(annonceJob, joblabel)
    TriggerClientEvent("esx:showAdvancedNotification", -1, joblabel, "Information(s)", annonceJob, 'CHAR_SOCIAL_CLUB', 1)

    
end)