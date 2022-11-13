Config                            = {}

Config.DrawDistance               = 10.0 -- How close do you need to be in order for the markers to be drawn (in GTA units).
Config.Debug                      = ESX.GetConfig().EnableDebug
Config.Marker                     = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}

Config.ReviveReward               = 700  -- Revive reward, set to 0 if you don't want it enabled
Config.SaveDeathStatus              = true -- Save Death Status?
Config.LoadIpl                    = true -- Disable if you're using fivem-ipl or other IPL loaders

Config.Locale = GetConvar('esx:locale', 'fr')

Config.DistressBlip = {
	Sprite = 310,
	Color = 48,
	Scale = 0.7
}

Config.EarlyRespawnTimer          = 60000 * 1  -- time til respawn is available
Config.BleedoutTimer              = 60000 * 10 -- time til the player bleeds out

Config.EnablePlayerManagement     = false -- Enable society managing (If you are using esx_society).

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 5000

Config.OxInventory                = ESX.GetConfig().OxInventory
Config.RespawnPoints = {
	{coords = vector3(341.0, -1397.3, 32.5), heading = 48.5}, -- Central Los Santos
	{coords = vector3(1836.03, 3670.99, 34.28), heading = 296.06} -- Sandy Shores
}

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(310.36, -587.59, 43.28),
			sprite = 61,
			scale  = 0.7,
			color  = 2
		},

		AmbulanceActions = {
			vector3(298.60, -597.96, 43.26-0.98)
		},

		Pharmacies = {
			vector3(306.61, -601.76, 43.28-0.98)
		},

		Vehicles = {
			{
				Spawner = vector3(297.81, -586.77, 43.24),
				InsideShop = vector3(291.60, -584.36, 43.18),
				Marker = {type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(293.18, -570.01, 43.13), heading = 62.36, radius = 2.0},
					{coords = vector3(298.18, -575.94, 43.13), heading = 17.00, radius = 4.0},
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(345.52, -580.90, 74.15),
				InsideShop = vector3(351.96, -588.44, 74.15),
				Marker = {type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(351.96, -588.44, 74.15), heading = 142.7, radius = 10.0},
				}
			}
		},

		FastTravels = {
			{
				From = vector3(332.37, -595.75, 43.28-0.98),
				To = {coords = vector3(343.56, -585.45, 74.15), heading = 249.44},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(338.5, -583.88, 74.15-0.98),
				To = {coords = vector3(330.14, -601.02, 43.28), heading = 70.90},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},
		},

		FastTravelsPrompt = {
			{
				From = vector3(237.4, -1373.8, 26.0),
				To = {coords = vector3(251.9, -1363.3, 38.5), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = TranslateCap('fast_travel')
			},

			{
				From = vector3(256.5, -1357.7, 36.0),
				To = {coords = vector3(235.4, -1372.8, 26.3), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = TranslateCap('fast_travel')
			}
		}

	}
}

Config.AuthorizedVehicles = {
	car = {
		ambulance = {
			{model = 'ambulance', price = 1},
			{model = 'dodgesamu', price = 1}
		},
        
		doctor = {
			{model = 'ambulance', price = 1},
			{model = 'dodgesamu', price = 1}
		},

		chief_doctor = {
			{model = 'ambulance', price = 1},
			{model = 'dodgesamu', price = 1},
		},

		boss = {
			{model = 'ambulance', price = 1},
			{model = 'dodgesamu', price = 1},
		}
	},

	helicopter = {
		ambulance = {},

		doctor = {
			{model = 'supervolito', price = 1}
		},

		chief_doctor = {
			{model = 'supervolito', price = 1}
		},

		boss = {
			{model = 'supervolito', price = 1}
		}
	}
}
