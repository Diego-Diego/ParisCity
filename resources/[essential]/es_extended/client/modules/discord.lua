Citizen.CreateThread(function()
	while true do
        players = {}
        
        for _, player in ipairs(GetActivePlayers()) do
            table.insert(players, player)
        end

        local name = GetPlayerName(PlayerId())
        local id = GetPlayerServerId(PlayerId())
        AddTextEntry('FE_THDR_GTAO', '~w~Paris City ~t~| ~b~ID: ' ..id.. ' ~t~| ~t~ ~b~Pseudo: ~b~' ..name.. " ~t~| ~r~Joueurs: " ..#players .. "/128")

        -- Richpresence
        SetDiscordAppId(987098988677328936)
        SetRichPresence("ID: " ..id.. " | "..#players.. "/128")
        SetDiscordRichPresenceAsset("logo") 
		SetDiscordRichPresenceAssetText("Paris City") 
		SetDiscordRichPresenceAction(0, ">> |🔗 Discord 🔗| <<", "https://discord.gg/xxxx")
		SetDiscordRichPresenceAction(1, ">> |🎮 Connect 🎮| <<", "fivem://connect/cfx.re/join/xxxx")

        Citizen.Wait(5000)
    end
end)