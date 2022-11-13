return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			}
		}
	},

	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dirty Money',
	},

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['cola'] = {
		label = 'eCola',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
	},

	['phone'] = {
		label = 'Phone',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		label = 'Money',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Eau',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['bread'] = {
		label = 'Pain',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
            usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Mastercard',
		stack = false,
		weight = 10,
	},

	['carokit'] = {
		label = 'kit carosserie',
		weight = 3,
		stack = true,
		close = true,
		description = nil
	},

	['fixkit'] = {
		label = 'kit réparation',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['bolcacahuetes'] = {
		label = 'bol de cacahuètes',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['bolchips'] = {
		label = 'bol de chips',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['bolnoixcajou'] = {
		label = 'bol de noix de cajou',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['bolpistache'] = {
		label = 'bol de pistaches',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['drpepper'] = {
		label = 'dr. pepper',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['energy'] = {
		label = 'energy drink',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['golem'] = {
		label = 'golem',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['grapperaisin'] = {
		label = 'grappe de raisin',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['ice'] = {
		label = 'glaçon',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['icetea'] = {
		label = 'ice tea',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['jager'] = {
		label = 'jägermeister',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['jagerbomb'] = {
		label = 'jägerbomb',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['jagercerbere'] = {
		label = 'jäger cerbère',
		weight = 3,
		stack = true,
		close = true,
		description = nil
	},

	['jusfruit'] = {
		label = 'jus de fruits',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['limonade'] = {
		label = 'limonade',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['martini'] = {
		label = 'martini blanc',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['menthe'] = {
		label = 'feuille de menthe',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['metreshooter'] = {
		label = 'mètre de shooter',
		weight = 3,
		stack = true,
		close = true,
		description = nil
	},

	['mixapero'] = {
		label = 'mix apéritif',
		weight = 3,
		stack = true,
		close = true,
		description = nil
	},

	['mojito'] = {
		label = 'mojito',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['rhum'] = {
		label = 'rhum',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['rhumcoca'] = {
		label = 'rhum-coca',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['rhumfruit'] = {
		label = 'rhum-jus de fruits',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['saucisson'] = {
		label = 'saucisson',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['soda'] = {
		label = 'soda',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['teqpaf'] = {
		label = 'teq\'paf',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['tequila'] = {
		label = 'tequila',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['vodka'] = {
		label = 'vodka',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['vodkaenergy'] = {
		label = 'vodka-energy',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['vodkafruit'] = {
		label = 'vodka-jus de fruits',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['whisky'] = {
		label = 'whisky',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['whiskycoca'] = {
		label = 'whisky-coca',
		weight = 5,
		stack = true,
		close = true,
		description = nil
	},

	['journal'] = {
		label = 'journal',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['journaux'] = {
		label = 'paquet de journaux',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	['bread'] = {
		label = 'Pain',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['weed'] = {
		label = 'weed (humide)',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['weed_trait'] = {
		label = 'weed (sèche)',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['blue_phone'] = {
		label = 'téléphone bleue',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['green_phone'] = {
		label = 'téléphone vert',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['white_phone'] = {
		label = 'téléphone blanc',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
}