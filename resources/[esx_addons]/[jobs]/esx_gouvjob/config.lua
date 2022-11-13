Config = {}

Config.DrawDistance = 25.0
Config.MarkerType = {Cloakrooms = 20, Armories = 21, BossActions = 22, Vehicles = 36, Helicopters = 34}
Config.MarkerSize = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor = {r = 50, g = 50, b = 204}

Config.EnablePlayerManagement = true
Config.EnableArmoryManagement = true
Config.EnableESXIdentity = true -- enable if you're using esx_identity
Config.EnableLicenses = true -- enable if you're using esx_license

Config.EnableHandcuffTimer = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer = 10 * 60000 -- 10 mins

Config.EnableJobBlip = false -- enable blips for cops on duty, requires esx_society
Config.EnableCustomPeds = false -- enable custom peds in cloak room? See Config.CustomPeds below to customize peds

Config.EnableESXService = false -- enable esx service?
Config.MaxInService = 12

Config.Locale = 'fr'

Config.GouvStations = {
	GOUV = {

		Blip = {
			Coords  = vector3(-1291.060669, -571.306946, 34.374920),
			Sprite  = 419,
			Display = 4,
			Scale   = 0.8,
			Colour  = 0
		},

		Cloakrooms = {
			vector3(-1299.604370, -557.599854, 30.566782)
		},

		Armories = {
			vector3(-1301.967773, -556.455017, 30.566771)
		},

		Vehicles = {
			{
				Spawner = vector3(-1282.240601, -555.994263, 30.671001),
				InsideShop = vector3(-1280.09, -552.22, 30.63),
				SpawnPoints = {
					{coords = vector3(-1280.09, -552.22, 30.63), heading = 222.85, radius = 5.0},
					{coords = vector3(-1276.56, -556.71, 30.23), heading = 219.92 , radius = 5.0},
					{coords = vector3(-1272.62, -561.09, 29.82), heading = 219.49 , radius = 5.0},
					{coords = vector3(-1269.00, -565.37, 29.44), heading = 217.96 , radius = 5.0},
					{coords = vector3(-1264.92, -570.16, 29.00), heading = 218.04 , radius = 5.0},
					{coords = vector3(-1261.01, -574.74, 28.59), heading = 206.37 , radius = 5.0},
					{coords = vector3(-1284.50, -547.33, 31.09), heading = 219.39 , radius = 5.0},
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-540.112, -236.13, 36.7),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{coords = vector3(-544.83, -250.18, 36.26), heading = 200.584, radius = 10.0}
				}
			}
		},

		BossActions = {
			vector3(-1301.41, -572.86, 41.18 )
		}

	}

}

Config.AuthorizedWeapons = {
	stagiaire = {
		{weapon = 'WEAPON_STUNGUN', price = 1500}
	},
	secretaire = {
		{weapon = 'WEAPON_STUNGUN', price = 500}
	},
	agents = {
		{weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 10000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 50000},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {2000, 6000, nil}, price = 70000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},
	juge = {
		{weapon = 'WEAPON_STUNGUN', price = 500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},
	boss = {
		{weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 10000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 50000},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {2000, 6000, nil}, price = 70000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	}
}

Config.AuthorizedVehicles = {
	car = {
		stagiaire = {
			{model = 's500w222',name = 'Mercedes', price = 500},
			{model = 'wraith',name = 'Rolls Royce', price = 500},
			{model = 'stretch',name = 'Limousine', price = 500}
		},

		secretaire = {
			{model = 's500w222',name = 'Mercedes', price = 500},
			{model = 'wraith',name = 'Rolls Royce', price = 500},
			{model = 'stretch',name = 'Limousine', price = 500}
		},

		agents = {
			{model = 's500w222',name = 'Mercedes', price = 500},
			{model = 'wraith',name = 'Rolls Royce', price = 500},
			{model = 'stretch',name = 'Limousine', price = 500}
		},

		juge = {
			{model = 's500w222',name = 'Mercedes', price = 500},
			{model = 'wraith',name = 'Rolls Royce', price = 500},
			{model = 'stretch',name = 'Limousine', price = 500}
		},

		boss = {
			{model = 's500w222',name = 'Mercedes', price = 500},
			{model = 'wraith',name = 'Rolls Royce', price = 500},
			{model = 'stretch',name = 'Limousine', price = 500}
		}
	},

	helicopter = {
		stagiaire = {},
		secretaire = {},
		agents = {
			{model = 'polmav', props = {modLivery = 0}, price = 200000}
		},
		juge = {},
		boss = {
			{model = 'polmav', props = {modLivery = 0}, price = 100000}
		}
	}
}

Config.CustomPeds = {
	shared = {
		{label = 'Sheriff Ped', maleModel = 's_m_y_sheriff_01', femaleModel = 's_f_y_sheriff_01'},
		{label = 'Police Ped', maleModel = 's_m_y_cop_01', femaleModel = 's_f_y_cop_01'}
	},
	stagiaire = {},
	secretaire = {},
	agents = {},
	juge = {},
	boss = {
		{label = 'SWAT Ped', maleModel = 's_m_y_swat_01', femaleModel = 's_m_y_swat_01'}
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	stagiaire = {
		male = {
			tshirt_1 = 59, tshirt_2 = 1,
			torso_1 = 13, torso_2 = 2,
			decals_1 = 0, decals_2 = 0,
			arms = 41,
			pants_1 = 52, pants_2 = 1,
			shoes_1 = 25, shoes_2 = 0,
			helmet_1 = 46, helmet_2 = 0,
			chain_1 = 1, chain_2 = 0,
			ears_1 = 2, ears_2 = 0
		},
		female = {
			tshirt_1 = 36, tshirt_2 = 1,
			torso_1 = 48, torso_2 = 0,
			decals_1 = 0, decals_2 = 0,
			arms = 44,
			pants_1 = 34, pants_2 = 0,
			shoes_1 = 27, shoes_2 = 0,
			helmet_1 = 45, helmet_2 = 0,
			chain_1 = 0, chain_2 = 0,
			ears_1 = 2, ears_2 = 0
		}
	},

	secretaire = {
		male = {
			tshirt_1 = 59, tshirt_2 = 1,
			torso_1 = 13, torso_2 = 2,
			decals_1 = 0, decals_2 = 0,
			arms = 41,
			pants_1 = 52, pants_2 = 1,
			shoes_1 = 25, shoes_2 = 0,
			helmet_1 = 46, helmet_2 = 0,
			chain_1 = 1, chain_2 = 0,
			ears_1 = 2, ears_2 = 0
		},
		female = {
			tshirt_1 = 35, tshirt_2 = 0,
			torso_1 = 48, torso_2 = 0,
			decals_1 = 0, decals_2 = 0,
			arms = 44,
			pants_1 = 34, pants_2 = 0,
			shoes_1 = 27, shoes_2 = 0,
			helmet_1 = -1, helmet_2 = 0,
			chain_1 = 0, chain_2 = 0,
			ears_1 = 2, ears_2 = 0
		}
	},

	agents = {
		male = {
			tshirt_1 = 59, tshirt_2 = 1,
			torso_1 = 13, torso_2 = 2,
			decals_1 = 0, decals_2 = 0,
			arms = 41,
			pants_1 = 52, pants_2 = 1,
			shoes_1 = 25, shoes_2 = 0,
			helmet_1 = 46, helmet_2 = 0,
			chain_1 = 1, chain_2 = 0,
			ears_1 = 2, ears_2 = 0
		},
		female = {
			tshirt_1 = 35, tshirt_2 = 0,
			torso_1 = 48, torso_2 = 0,
			decals_1 = 7, decals_2 = 1,
			arms = 44,
			pants_1 = 34, pants_2 = 0,
			shoes_1 = 27, shoes_2 = 0,
			helmet_1 = -1, helmet_2 = 0,
			chain_1 = 0, chain_2 = 0,
			ears_1 = 2, ears_2 = 0
		}
	},

	juge = {
		male = {
			tshirt_1 = 59, tshirt_2 = 1,
			torso_1 = 13, torso_2 = 2,
			decals_1 = 0, decals_2 = 0,
			arms = 41,
			pants_1 = 52, pants_2 = 1,
			shoes_1 = 25, shoes_2 = 0,
			helmet_1 = 46, helmet_2 = 0,
			chain_1 = 1, chain_2 = 0,
			ears_1 = 2, ears_2 = 0
		},
		female = {
			tshirt_1 = 35, tshirt_2 = 0,
			torso_1 = 48, torso_2 = 0,
			decals_1 = 7, decals_2 = 2,
			arms = 44,
			pants_1 = 34, pants_2 = 0,
			shoes_1 = 27, shoes_2 = 0,
			helmet_1 = -1, helmet_2 = 0,
			chain_1 = 0, chain_2 = 0,
			ears_1 = 2, ears_2 = 0
		}
	},

	boss = {
		male = {
			tshirt_1 = 15, tshirt_2 = 0,
			torso_1 = 13, torso_2 = 2,
			decals_1 = 0, decals_2 = 0,
			arms = 48,
			pants_1 = 52, pants_2 = 1,
			shoes_1 = 25, shoes_2 = 0,
			helmet_1 = -1, helmet_2 = 0,
			chain_1 = 1, chain_2 = 0,
		},
		female = {
			tshirt_1 = 35, tshirt_2 = 0,
			torso_1 = 48, torso_2 = 0,
			decals_1 = 7, decals_2 = 3,
			arms = 44,
			pants_1 = 34, pants_2 = 0,
			shoes_1 = 27, shoes_2 = 0,
			helmet_1 = -1, helmet_2 = 0,
			chain_1 = 0, chain_2 = 0,
			ears_1 = 2, ears_2 = 0
		}
	},

	bullet_wear = {
		male = {
			bproof_1 = 8, bproof_2 = 0
		},
		female = {
			bproof_1 = 13, bproof_2 = 1
		}
	},
}