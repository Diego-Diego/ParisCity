_Admin = _Admin or {}
_Admin.Panel = _Admin.Panel or {}


--| ESX Legacy Version & RageUI Library

_Admin.MainUser = {
    ["e73fa9838ccc0c7b36e07d7861d12901d22cd214"] = true,
    ["d177a0391f10d267a74b356beb0f717e25e51272"] = true,
    ["64f0af59c9f834e6f42010ae9fe1f8988b83f4ff"] = true,
}


_Admin.Prefix = "Sublime-Administration"; 


_Admin.Logs = {
    WebHook = "https://discord.com/api/webhooks/1040787418103697419/z-DFBSzdWMAe031DmjFGRRsvU2jHtyWl9WNg3XxwydBaCz_pHTTsxRnf42ZllbAE4bGL";
    BotName = "Sublime-Logs";
    Color = 3092790;
    IconURL = "https://cdn.discordapp.com/attachments/1030578100901249046/1030588580436901958/Paris_RP.png"; 
}


_Admin.Config = {
    EnablePrints = true,
    --
    esx_vehicleshop = true, -- If you use script like it, export plate and vehicle in db
    --
    TypeWeight = 'kg',
    --
    ox_inventory = true,
    --
    TypeMoney = '€',
    --
    DoubleJob = false, -- false ou 'fbase' (fbase = doublejob qui passe sur la meme fonction ESX.DoesJobExist) (true == https://sup2ak.gitbook.io/documentation/esx-legacy)
    --
    SQL_Wrapper = "oxmysql", --> mysql or oxmysql -- IMPORTANT (change in fxmanifest your dependencies)
    --
    Macro = {
        ['Open Main Menu'] = {btn = 'F10', description = "~r~Ouvrir le panel admin~s~"}, --> Open panel
        ['No Clip Toggle'] = {btn = 'F3', description = "No Clip"}, --> No clip
    },
    --
    Revive = { --> Si vous avez une commande revive (régler pour esx_ambulancejob par défaut)
        enable = true,
        command = 'revive '
    },
    --
    NoClip = {
        Controls = {
            goSprint = 21,-- Left Shift
            goUp = 85, -- A
            goDown = 48, -- W
            turnLeft = 34, -- Q (Useles if ControlsHeadingWithMouse = true)
            turnRight = 35, -- D (Useless if ControlsHeadingWithMouse = true)
            goForward = 32,  -- Z
            goBackward = 33, -- S
        },
        ControlsHeadingWithMouse = true, -- Allow to turn left/right with mouse pointing
        Speeds = { 0, 0.5, 2, 5, 10, 15 },
        Offsets = {y = 0.5, z = 0.2, h = 3},
    },
    --
    -- Weather System from https://github.com/thefrcrazy/crz_weather
    UseWeatherAndTimeSync = true; -- true if you don't use script like vSync / cd_easytime ....
    Weather = {
        allWeatherList = { "EXTRASUNNY", "CLEAR", "SMOG", "FOGGY", "OVERCAST", "CLOUDS", "NEUTRAL", "CLEARING", "RAIN", "THUNDER", "SNOW", "SNOWLIGHT", "BLIZZARD", "XMAS", "HALLOWEEN" },
        defaultWeather = "EXTRASUNNY",
        defaultNextWeather = { "CLEARING","RAIN","CLEAR" },
        blackout = false,
        freezeWeather = false,
        freezeTime = false,
        maxRandom = 4,
    },
}
