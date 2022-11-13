Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = false
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = true -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.FireStations = {

  LSFD = {
    Blip = {
      Pos = { x = 1202.7244873047, y = -1463.0455322266, z = 34.849590301514 },
      Sprite  = 436,
      Display = 4,
      Scale   = 1.2,
      Colour  = 1,
    },

    AuthorizedWeapons = {
      {name = 'WEAPON_FLASHLIGHT',       price = 80},
      {name = 'WEAPON_FIREEXTINGUISHER', price = 120},
	  {name = 'WEAPON_FLARE',            price = 60 },
      {name = 'WEAPON_FLAREGUN',         price = 60},
    },

    AuthorizedVehicles = {
	  { name = 'police', label = 'Ambulance 206' },
	  { name = 'firetruk', label = 'Fire Truck' },
	  { name = 'vsavsdis13', label = 'VSAV' },
    },

    Cloakrooms = {
      { x = 1233.75, y = -1490.97, z = 34.69-0.98}
    },

    Armories = {
      { x = 1211.32, y = -1487.73, z = 34.68-0.98 },
    },

    Vehicles = {
      {
        Spawner    = { x = 1202.51, y = -1482.68, z = 34.68-0.98 },
        SpawnPoint = { x = 1200.7666015625, y = -1456.6851806641, z = 34.93176651001 },
        Heading    = 359.68
      }
    },

    Helicopters = {
      {
        Spawner    = {x = 466.477, y = -982.819, z = 42.691},
        SpawnPoint = {x = 450.04, y = -981.14, z = 42.691},
        Heading    = 0.0
      }
    },

    VehicleDeleters = {
      { x = 1201.015, y = -1473.41, z = 34.68-0.98 },
    },

    BossActions = {
      { x = 1210.74, y = -1481.49, z = 42.47-0.98 },
    }
  }
}
Config.Uniforms = {
	ambulance_wear = {
    male = {
      ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 77,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 17,
			['pants_1'] = 43,   ['pants_2'] = 0,
			['shoes_1'] = 71,   ['shoes_2'] = 0,
			['helmet_1'] = 138,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['mask_1'] = -1,  ['mask_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['glasses_1'] = 0,     ['glasses_2'] = 0
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 325,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 18,
			['pants_1'] = 126,   ['pants_2'] = 0,
			['shoes_1'] = 76,   ['shoes_2'] = 0,
			['helmet_1'] = 137,  ['helmet_2'] = 0,
			['chain_1'] = 1,    ['chain_2'] = 0,
			['mask_1'] = -1,  ['mask_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
}