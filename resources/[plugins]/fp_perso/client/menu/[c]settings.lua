local interface = true
local radar = true
local cinehud = false

local function alterRadarActive(newState)
    if (not (cinehud)) then
        radar = newState
        DisplayRadar(radar)
    end
end

local function startCinematicMode()
    Citizen.CreateThread(function()
        while (cinehud) do
            Citizen.Wait(1)			
            DrawRect(0.0, 0.0, 2.0, w, 0, 0, 0, 255)
            DrawRect(0.0, 1.0, 2.0, w, 0, 0, 0, 255)
        end
    end)

    for i = 0, 0.2, 0.01 do 
        Wait(10)
        w = i
    end
end

local function alterCinematicMode(newState)
    cinehud = newState
    radar = not (newState)
    interface = not (newState)
    DisplayRadar(not (newState))
    TriggerEvent("togglehud", not (newState))
    if (newState) then
        startCinematicMode()
    end
end

local function tooglehud(newState)
    if (not (cinehud)) then
        interface = newState
        TriggerEvent("togglehud", newState)
    end
end

function Menu.Panel:PersoMenuParam()
    RageUI.Checkbox("Interface utilisateur", nil, interface, {}, {
        onChecked = function()
            tooglehud(true)
        end,
        onUnChecked = function()
            tooglehud(false)
        end
    })
    RageUI.Checkbox("Mini-Map", nil, radar, {}, {
        onChecked = function()
            alterRadarActive(true)
        end,
        onUnChecked = function()
            alterRadarActive(false)
        end
    })
    RageUI.Checkbox("Mode cinématique", nil, cinehud, {}, {
        onChecked = function()
            alterCinematicMode(true)
        end,
        onUnChecked = function()
            alterCinematicMode(false)
        end
    })
end