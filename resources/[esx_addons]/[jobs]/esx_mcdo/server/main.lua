RegisterNetEvent("save:mcdo")
AddEventHandler("save:mcdo", function(command)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    print(json.encode(command))

    if xPlayer then
        MySQL.insert('INSERT INTO command_mcd (data, date) VALUES (?, ?)', {json.encode(command), os.date("%d/%m/%Y - %H:%M")},
        function(rowsChanged)
            local xPlayers = ESX.GetExtendedPlayers("job", "mcd")
            for _, xTarget in pairs(xPlayers) do
                xTarget.showNotification("~y~Une commande à été enregistrées veuillez la faire au plus vite !")
            end
            xPlayer.showNotification("~y~Votre commande est enregistrée")
        end)
    end
end)

ESX.RegisterServerCallback('mcd:recupcommand', function(src, cb)
	MySQL.query('SELECT * FROM command_mcd', {}, function(result)
        cb(result)
    end)
end)

RegisterNetEvent("esx_mcdo:deletecommand")
AddEventHandler("esx_mcdo:deletecommand", function(data)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    MySQL.update('DELETE FROM command_mcd WHERE number = ?', {data.number},
    function(rowsChanged)
        if rowsChanged == 1 then
            xPlayer.showNotification("~r~Commande n°"..data.number.." suprimée")
        end
    end)
end)