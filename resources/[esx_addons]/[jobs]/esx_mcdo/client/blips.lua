
-- Create blips
CreateThread(function()
	for k,v in pairs(_McDo.posU) do
		local blip = AddBlipForCoord(v.Command)

		SetBlipSprite (blip, 124)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.7)
		SetBlipColour (blip, 5)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName("McDonald's")
		EndTextCommandSetBlipName(blip)
	end
end)