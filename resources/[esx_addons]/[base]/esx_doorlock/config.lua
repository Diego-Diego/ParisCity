Config = {}
Config.Locale = 'fr'

Config.DoorList = {

	--
	-- Mission Row First Floor
	--

	-- Police Porte
	{
		textCoords = vector3(434.63, -982.02, 30.71),
		authorizedJobs = {'police'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = -165604314, objHeading = 270.0, objCoords = vector3(434.71, -980.82, 30.80)},
			{objHash = 1388858739, objHeading = 270.0, objCoords = vector3(434.71, -983.06, 30.80)}
		}
	},
	{
		textCoords = vector3(442.72, -998.66, 30.72),
		authorizedJobs = {'police'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = -165604314, objHeading = 179.99, objCoords = vector3(443.83, -998.68, 30.79)},
			{objHash = 1388858739, objHeading = 179.99, objCoords = vector3(441.59, -998.68, 30.79)}
		}
	},
	{
		textCoords = vector3(440.09, -998.69, 30.72),
		authorizedJobs = {'police'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = -165604314, objHeading = 179.99, objCoords = vector3(441.24, -998.68, 30.79)},
			{objHash = 1388858739, objHeading = 179.99, objCoords = vector3(439.00, -998.68, 30.79)}
		}
	},
	{
		textCoords = vector3(464.82, -988.61, 25.78),
		authorizedJobs = {'police'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = 165994623, objHeading = 90.01, objCoords = vector3(464.67, -989.32, 25.86)}
		}
	},

	--Police Cellule 
	{
		textCoords = vector3(461.30, -989.08, 34.18),
		authorizedJobs = {'police'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = -1988553564, objHeading = -0.19, objCoords = vector3(462.14, -989.14, 34.33)},
		}
	},
	{
		textCoords = vector3(455.37, -989.14, 34.18),
		authorizedJobs = {'police'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = -1988553564, objHeading = -0.19, objCoords = vector3(456.22, -989.14, 34.33)},
		}
	},
	{
		textCoords = vector3(449.59, -989.21, 34.18),
		authorizedJobs = {'police'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = -1988553564, objHeading = -0.19, objCoords = vector3(450.28, -989.14, 34.33)},
		}
	},
	{
		textCoords = vector3(449.68, -984.76, 34.19),
		authorizedJobs = {'police'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = -884718443, objHeading = -179.99, objCoords = vector3(448.99, -984.66, 34.34)},
		}
	},
	{
		textCoords = vector3(455.64, -984.71, 34.21),
		authorizedJobs = {'police'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = -884718443, objHeading = -179.99, objCoords = vector3(454.91, -984.66, 34.34)},
		}
	},
	{
		textCoords = vector3(461.61, -984.61, 34.21),
		authorizedJobs = {'police'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = -1988553564, objHeading = -179.99, objCoords = vector3(460.84, -984.66, 34.34)},
		}
	},

	-- Pompier Porte
	{
		textCoords = vector3(1167.74, -1475.53, 34.71),
		authorizedJobs = {'fire'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey("v_ilev_ph_door002"), objHeading = 90.33, objCoords = vector3(1167.58, -1474.21, 34.87)},
			{objHash = GetHashKey("v_ilev_ph_door002"), objHeading = -90.18, objCoords = vector3(1167.58, -1476.81, 34.87)}
		}
	},
	{
		textCoords = vector3(1177.81, -1477.78, 34.72),
		authorizedJobs = {'fire'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey("v_ilev_ph_gendoor004"), objHeading = -89.90, objCoords = vector3(1177.87, -1479.11, 34.87)},
			{objHash = GetHashKey("v_ilev_ph_gendoor004"), objHeading = 89.99, objCoords = vector3(1177.87, -1476.51, 34.87)}
		}
	},
	{
		textCoords = vector3(1181.22, -1481.07, 34.72),
		authorizedJobs = {'fire'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey("v_ilev_rc_door2"), objHeading = -179.93, objCoords = vector3(1182.46, -1481.00, 34.87)},
			{objHash = GetHashKey("v_ilev_rc_door2"), objHeading = -0.26, objCoords = vector3(1179.86, -1481.00, 34.87)}
		}
	},
	{
		textCoords = vector3(1193.99, -1484.09, 34.72),
		authorizedJobs = {'fire'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey("v_ilev_ph_gendoor006"), objHeading = 0.03, objCoords = vector3(1195.26, -1484.01, 34.87)},
			{objHash = GetHashKey("v_ilev_ph_gendoor006"), objHeading = -179.95, objCoords = vector3(1192.66, -1484.01, 34.87)}
		}
	},
	{
		textCoords = vector3(1199.85, -1483.93, 34.72),
		authorizedJobs = {'fire'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey("v_ilev_ph_gendoor006"), objHeading = 0.03, objCoords = vector3(1200.63, -1484.01, 34.87)}
		}
	},
	{
		textCoords = vector3(1204.95, -1483.97, 34.72),
		authorizedJobs = {'fire'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey("v_ilev_ph_gendoor006"), objHeading = 0.03, objCoords = vector3(1205.64, -1484.01, 34.87)}
		}
	},
	{
		textCoords = vector3(1211.17, -1483.90, 34.72),
		authorizedJobs = {'fire'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey("v_ilev_ph_gendoor006"), objHeading = 0.05, objCoords = vector3(1211.88, -1484.01, 34.87)}
		}
	},
	{
		textCoords = vector3(1219.51, -1485.43, 34.72),
		authorizedJobs = {'fire'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey("v_ilev_ph_gendoor005"), objHeading = 89.93, objCoords = vector3(1219.43, -1484.14, 34.87)},
			{objHash = GetHashKey("v_ilev_ph_gendoor005"), objHeading = -90.07, objCoords = vector3(1219.43, -1486.74, 34.87)}
		}
	},	

	-- Gendarmerie Porte
	{
		textCoords = vector3(-451.52, 6006.53, 31.84),
		authorizedJobs = {'gendarme'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = -829332642, objHeading = 134.92, objCoords = vector3(-450.98, 6006.04, 31.97)}
		}
	},
	{
		textCoords = vector3(-446.88, 6001.88, 31.69),
		authorizedJobs = {'gendarme'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = -829332642, objHeading = 134.90, objCoords = vector3(-446.31, 6001.37, 31.82)}
		}
	},
	{
		textCoords = vector3(-443.26, 6009.58, 31.71),
		authorizedJobs = {'gendarme'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey("hei_heist_apart2_door"), objHeading = 45.02, objCoords = vector3(-442.31, 6010.60, 31.86)},
			{objHash = GetHashKey("hei_heist_apart2_door"), objHeading = -135.18, objCoords = vector3(-444.14, 6008.77, 31.86)}
		}
	},	
	{
		textCoords = vector3(-446.41, 6007.96, 31.71),
		authorizedJobs = {'gendarme'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey("v_ilev_bk_door2"), objHeading = -0.23, objCoords = vector3(-445.03, 6007.94, 31.86)},
			{objHash = GetHashKey("v_ilev_bk_door2"), objHeading = 179.90, objCoords = vector3(-447.63, 6007.94, 31.86)}
		}
	},
	{
		textCoords = vector3(-453.11, 6017.61, 31.71),
		authorizedJobs = {'gendarme'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey("v_ilev_rc_door2"), objHeading = -45.08, objCoords = vector3(-453.54, 6018.07, 31.87)}
		}
	},
}