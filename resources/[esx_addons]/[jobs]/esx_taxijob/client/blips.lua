-- Create Blips
CreateThread(function()
    local blip = AddBlipForCoord(903.32, -170.55, 74.0)

    SetBlipSprite(blip, 198)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.8)
    SetBlipColour(blip, 5)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(TranslateCap('blip_taxi'))
    EndTextCommandSetBlipName(blip)
end)