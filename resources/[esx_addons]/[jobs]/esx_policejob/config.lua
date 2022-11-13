Config                            = {}

Config.DrawDistance               = 10.0 -- How close do you need to be for the markers to be drawn (in GTA units).
Config.MarkerType                 = {Cloakrooms = 20, Armories = 21, BossActions = 22, Vehicles = 36, Helicopters = 34}
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 50, g = 50, b = 204}

Config.EnablePlayerManagement     = true -- Enable if you want society managing.
Config.EnableArmoryManagement     = false
Config.EnableESXIdentity          = true -- Enable if you're using esx_identity.
Config.EnableESXOptionalneeds     = false -- Enable if you're using esx_optionalneeds
Config.EnableLicenses             = false -- Enable if you're using esx_license.

Config.EnableHandcuffTimer        = true -- Enable handcuff timer? will unrestrain player after the time ends.
Config.HandcuffTimer              = 10 * 60000 -- 10 minutes.

Config.EnableJobBlip              = false -- Enable blips for cops on duty, requires esx_society.
Config.EnableCustomPeds           = false -- Enable custom peds in cloak room? See Config.CustomPeds below to customize peds.

Config.EnableESXService           = false -- Enable esx service?
Config.MaxInService               = -1 -- How many people can be in service at once? Set as -1 to have no limit

Config.Locale = GetConvar('esx:locale', 'fr')

Config.OxInventory = ESX.GetConfig().OxInventory

Config.PoliceStations = {
	LSPD = {
		Blip = {
			Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 388,
			Display = 4,
			Scale   = 0.9,
		},

		Cloakrooms = {
			vector3(470.663727, -988.734070, 25.724487)
		},

		Armories = {
			vector3(485.26, -1006.47, 25.72)
		},

		Vehicles = {
			{
				Spawner = vector3(464.584625, -980.109863, 25.775146),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{coords = vector3(440.215393, -985.134033, 25.724487), heading = 90.0, radius = 6.0},
					{coords = vector3(440.294495, -987.797731, 25.724487), heading = 90.0, radius = 6.0},
					{coords = vector3(440.294495, -990.764832, 25724487), heading = 90.0, radius = 6.0},
					{coords = vector3(440.254944, -982.193420, 25.724487), heading = 90.0, radius = 6.0}
				}
			},

			{
				Spawner = vector3(473.3, -1018.8, 28.0),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{coords = vector3(475.9, -1021.6, 28.0), heading = 276.1, radius = 6.0},
					{coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(461.1, -981.5, 43.6),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0}
				}
			}
		},

		BossActions = {
			vector3(471.323090, -1005.389038, 30.678345)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
		{weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 10000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 1500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 80}
	},

	officer = {
		{weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 10000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 50000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	sergeant = {
		{weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 10000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 50000},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {2000, 6000, nil}, price = 70000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	lieutenant = {
		{weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 10000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 50000},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {2000, 6000, nil}, price = 70000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	boss = {
		{weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 10000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 50000},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {2000, 6000, nil}, price = 70000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	}
}

Config.AuthorizedVehicles = {
	car = {
		Stagiaire = {},
		recruit = {
			{model = '308', price = 0},
			{model = 'megane3pn', price = 0},
		},
		officier = {
			{model = '308', price = 0},
			{model = '5008pn', price = 0},
			{model = 'master2017pn', price = 0},
			{model = 'megane3pn', price = 0},
		},
		officier2 = {
			{model = '308', price = 0},
			{model = '5008pn', price = 0},
			{model = 'master2017pn', price = 0},
			{model = 'megane3pn', price = 0},
		},
		sergent = {
			{model = '308', price = 0},
			{model = '5008pn', price = 0},
			{model = 'master2017pn', price = 0},
			{model = 'megane3pn', price = 0},
			{model = 'police2', price = 0},
			{model = 'policet', price = 0},
		},
		sergent2 = {
			{model = '308', price = 0},
			{model = '5008pn', price = 0},
			{model = 'master2017pn', price = 0},
			{model = 'megane3pn', price = 0},
			{model = 'police2', price = 0},
			{model = 'policet', price = 0},
		},
		boss = {
			{model = '308', price = 0},
			{model = '5008pn', price = 0},
			{model = 'master2017pn', price = 0},
			{model = 'megane3pn', price = 0},
			{model = 'police2', price = 0},
			{model = 'policet', price = 0},
		},
		boss2 = {
			{model = '308', price = 0},
			{model = '5008pn', price = 0},
			{model = 'master2017pn', price = 0},
			{model = 'megane3pn', price = 0},
			{model = 'police2', price = 0},
			{model = 'policet', price = 0},
		},
	},      

	helicopter = {
		recruit = {},

		officer = {},

		sergeant = {},

		sergent = {
			{model = 'polmav', props = {modLivery = 0}, price = 0}
		},
		sergent2 = {
			{model = 'polmav', props = {modLivery = 0}, price = 0}
		},
		boss = {
			{model = 'polmav', props = {modLivery = 0}, price = 0}
		},
		boss2 = {
			{model = 'polmav', props = {modLivery = 0}, price = 0}
		},
	}
}

Config.CustomPeds = {
	shared = {
		{label = 'Sheriff Ped', maleModel = 's_m_y_sheriff_01', femaleModel = 's_f_y_sheriff_01'},
		{label = 'Police Ped', maleModel = 's_m_y_cop_01', femaleModel = 's_f_y_cop_01'}
	},

	recruit = {},

	officer = {},

	sergeant = {},

	lieutenant = {},

	boss = {
		{label = 'SWAT Ped', maleModel = 's_m_y_swat_01', femaleModel = 's_m_y_swat_01'}
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {

	tenu_lspd = {

		male = {

			['tshirt_1'] = 57,  ['tshirt_2'] = 0,

			['torso_1'] = 94,   ['torso_2'] = 2,

			['decals_1'] = 0,   ['decals_2'] = 0,

			['arms'] = 0,

			['pants_1'] = 46,   ['pants_2'] = 0,

			['shoes_1'] = 25,   ['shoes_2'] = 0,

			['helmet_1'] = -1,  ['helmet_2'] = 0,

			['chain_1'] = 0,    ['chain_2'] = 0,

			['mask_1'] = -1,  ['mask_2'] = 0,

			['bproof_1'] = 0,  ['bproof_2'] = 0,

			['ears_1'] = -1,     ['ears_2'] = 0,

			['glasses_1'] = 0,     ['glasses_2'] = 0

		},

		female = {

			['tshirt_1'] = 27,  ['tshirt_2'] = 0,

			['torso_1'] = 93,   ['torso_2'] = 0,

			['decals_1'] = 0,   ['decals_2'] = 0,

			['arms'] = 31,

			['pants_1'] = 61,   ['pants_2'] = 0,

			['shoes_1'] = 25,   ['shoes_2'] = 0,

			['helmet_1'] = -1,  ['helmet_2'] = 0,

			['chain_1'] = 1,    ['chain_2'] = 0,

			['mask_1'] = -1,  ['mask_2'] = 0,

			['bproof_1'] = 0,  ['bproof_2'] = 0,

			['ears_1'] = 2,     ['ears_2'] = 0

		}

	},



	tenu_hiv = {

		male = {

			['tshirt_1'] = 57,  ['tshirt_2'] = 0,

			['torso_1'] = 50,   ['torso_2'] = 4,

			['decals_1'] = -1,   ['decals_2'] = 0,

			['arms'] = 17,

			['pants_1'] = 46,   ['pants_2'] = 0,

			['shoes_1'] = 25,   ['shoes_2'] = 0,

			['helmet_1'] = 80,  ['helmet_2'] = 1,

			['chain_1'] = -1,    ['chain_2'] = 0,

			['mask_1'] = 52,  ['mask_2'] = 0,

			['bproof_1'] = 8,  ['bproof_2'] = 0

		},

		female = {

			['tshirt_1'] = 45,  ['tshirt_2'] = 0,

			['torso_1'] = 119,   ['torso_2'] = 1,

			['decals_1'] = 0,   ['decals_2'] = 0,

			['arms'] = 7,

			['pants_1'] = 61,   ['pants_2'] = 0,

			['shoes_1'] = 25,   ['shoes_2'] = 0,

			['helmet_1'] = -1,  ['helmet_2'] = 0,

			['chain_1'] = 1,    ['chain_2'] = 0,

			['mask_1'] = -1,  ['mask_2'] = 0,

			['bproof_1'] = 0,  ['bproof_2'] = 0,

			['ears_1'] = 2,     ['ears_2'] = 0,

                        ['glasses_1'] = 0,  ['glasses_2'] =0

		}

	},



	tenu_doag = {

		male = {

			['tshirt_1'] = 15,  ['tshirt_2'] = 0,

			['torso_1'] = 0,   ['torso_2'] = 1,

			['decals_1'] = 0,   ['decals_2'] = 0,

			['arms'] = 0,

			['pants_1'] = 5,   ['pants_2'] = 0,

			['shoes_1'] = 25,   ['shoes_2'] = 0,

			['helmet_1'] = 17,  ['helmet_2'] = 0,

			['chain_1'] = 0,    ['chain_2'] = 0,

			['mask_1'] = -1,  ['mask_2'] = 0,

			['bproof_1'] = 0,  ['bproof_2'] = 0,

			['ears_1'] = 1,     ['ears_2'] = 0

		},

		female = {

			['tshirt_1'] = 27,  ['tshirt_2'] = 0,

			['torso_1'] = 92,   ['torso_2'] = 0,

			['decals_1'] = 0,   ['decals_2'] = 0,

			['arms'] = 3,

			['pants_1'] = 61,   ['pants_2'] = 0,

			['shoes_1'] = 25,   ['shoes_2'] = 0,

			['helmet_1'] = -1,  ['helmet_2'] = 0,

			['chain_1'] = 1,    ['chain_2'] = 0,

			['mask_1'] = -1,  ['mask_2'] = 0,

			['bproof_1'] = 0,  ['bproof_2'] = 0,

			['ears_1'] = 2,     ['ears_2'] = 0

		}

	},



	tenu_sahp = {

		male = {

			['tshirt_1'] = 53,  ['tshirt_2'] = 0,

			['torso_1'] = 32,   ['torso_2'] = 0,

			['decals_1'] = 0,   ['decals_2'] = 0,

			['arms'] = 12,

			['pants_1'] = 59,   ['pants_2'] = 0,

			['shoes_1'] = 33,   ['shoes_2'] = 0,

			['helmet_1'] = -1,  ['helmet_2'] = 0,

			['chain_1'] = 0,    ['chain_2'] = 0,

			['mask_1'] = -1,  ['mask_2'] = 0,

			['bproof_1'] = 1,  ['bproof_2'] = 0,

			['ears_1'] = 1,     ['ears_2'] = 0

		},

		female = {

			['tshirt_1'] = 27,  ['tshirt_2'] = 0,

			['torso_1'] = 33,   ['torso_2'] = 0,

			['decals_1'] = 0,   ['decals_2'] = 0,

			['arms'] = 14,

			['pants_1'] = 31,   ['pants_2'] = 0,

			['shoes_1'] = 24,   ['shoes_2'] = 0,

			['helmet_1'] = -1,  ['helmet_2'] = 0,

			['chain_1'] = 0,    ['chain_2'] = 0,

			['mask_1'] = -1,  ['mask_2'] = 0,

			['bproof_1'] = 0,  ['bproof_2'] = 0,

			['ears_1'] = 2,     ['ears_2'] = 0

		}

	},

	tenu_ma = {

		male = {

			['tshirt_1'] = 15,  ['tshirt_2'] = 0,

			['torso_1'] = 134,   ['torso_2'] = 0,

			['decals_1'] = 0,   ['decals_2'] = 0,

			['arms'] = 4,

			['pants_1'] = 26,   ['pants_2'] = 6,

			['shoes_1'] = 7,   ['shoes_2'] = 0,

			['helmet_1'] = -1,  ['helmet_2'] = 0,

			['chain_1'] = 0,    ['chain_2'] = 0,

			['mask_1'] = -1,  ['mask_2'] = 0,

			['bproof_1'] = 0,  ['bproof_2'] = 0,

			['ears_1'] = 1,     ['ears_2'] = 0

		},

		female = {

			['tshirt_1'] = 27,  ['tshirt_2'] = 0,

			['torso_1'] = 92,   ['torso_2'] = 0,

			['decals_1'] = 0,   ['decals_2'] = 0,

			['arms'] = 3,

			['pants_1'] = 61,   ['pants_2'] = 0,

			['shoes_1'] = 25,   ['shoes_2'] = 0,

			['helmet_1'] = -1,  ['helmet_2'] = 0,

			['chain_1'] = 1,    ['chain_2'] = 0,

			['mask_1'] = -1,  ['mask_2'] = 0,

			['bproof_1'] = 0,  ['bproof_2'] = 0,

			['ears_1'] = 2,     ['ears_2'] = 0

		}

	},

	tenu_sahpg = {

		male = {

			['tshirt_1'] = 53,  ['tshirt_2'] = 0,

			['torso_1'] = 32,   ['torso_2'] = 0,

			['decals_1'] = 0,   ['decals_2'] = 0,

			['arms'] = 12,

			['pants_1'] = 59,   ['pants_2'] = 0,

			['shoes_1'] = 33,   ['shoes_2'] = 0,

			['helmet_1'] = -1,  ['helmet_2'] = 0,

			['chain_1'] = 0,    ['chain_2'] = 0,

			['mask_1'] = -1,  ['mask_2'] = 0,

			['bproof_1'] = 12,  ['bproof_2'] = 0,

			['ears_1'] = 1,     ['ears_2'] = 0

		},

		female = {

			['tshirt_1'] = 27,  ['tshirt_2'] = 0,

			['torso_1'] = 33,   ['torso_2'] = 0,

			['decals_1'] = 0,   ['decals_2'] = 0,

			['arms'] = 14,

			['pants_1'] = 31,   ['pants_2'] = 0,

			['shoes_1'] = 24,   ['shoes_2'] = 0,

			['helmet_1'] = -1,  ['helmet_2'] = 0,

			['chain_1'] = 0,    ['chain_2'] = 0,

			['mask_1'] = -1,  ['mask_2'] = 0,

			['bproof_1'] = 11,  ['bproof_2'] = 0,

			['ears_1'] = 2,     ['ears_2'] = 0

		}

	},



	bullet_wear = {

		male = {

			['bproof_1'] = 3,  ['bproof_2'] = 0

		},

		female = {

			['bproof_1'] = 2,  ['bproof_2'] = 3

		}

	},



	bullet2_wear = {

		male = {

			['bproof_1'] = 18,  ['bproof_2'] = 1

		},

		female = {

			['bproof_1'] = 10,  ['bproof_2'] = 3

		}

	},


bullet3_wear = {

		male = {

			['bproof_1'] = 8,  ['bproof_2'] = 0

		},

		female = {

			['bproof_1'] = 1,  ['bproof_2'] = 0

		}

	},

bullet4_wear = {

		male = {

			['bproof_1'] = 8,  ['bproof_2'] = 3

		},

		female = {

			['bproof_1'] = 3,  ['bproof_2'] = 0

		}

	},




	helmet_wear = {

		male = {

			['helmet_1'] = 126,  ['helmet_2'] = 0

		},

		female = {

			['helmet_1'] = 126,  ['helmet_2'] = 0

		}

	}



}