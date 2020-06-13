Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }

Config.ReviveReward               = 300  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = false -- enable anti-combat logging?
Config.LoadIpl                    = false -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'es'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 3 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 6 * minute -- Time til the player bleeds out

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 0

Config.RespawnPoint = { coords = vector3(-388.76, 6128.08, 30.48), heading = 48.5 }

Config.Hospitals = {
	Paleto = {

		Blip = {
			coords = vector3(-380.76, 6118.47, 30.84),
			sprite = 61,
			scale  = 1.2,
			color  = 2
		},

		AmbulanceActions = {
			vector3(-369.2, 6121.44, 30.44)
		},

		Pharmacies = {
			vector3(-366.32, 6124.28, 30.44)
		},

		Vehicles = {
			{
				Spawner = vector3(-360.92, 6108.52, 31.48),
				InsideShop = vector3(-357.28, 6096.68, 31.44),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(-346.44, 6111.0, 31.44), heading = 227.6, radius = 4.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-366.44, 6103.84, 35.44),
				InsideShop = vector3(-360.16, 6116.56, 37.8),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(-360.16, 6116.56, 37.8), heading = 142.7, radius = 10.0 }				}
			}
		},

		FastTravels = {
			{
				From = vector3(294.7, -1448.1, 29.0),
				To = { coords = vector3(272.8, -1358.8, 23.5), heading = 0.0 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(275.3, -1361, 23.5),
				To = { coords = vector3(295.8, -1446.5, 28.9), heading = 0.0 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(247.3, -1371.5, 23.5),
				To = { coords = vector3(333.1, -1434.9, 45.5), heading = 138.6 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(335.5, -1432.0, 45.50),
				To = { coords = vector3(249.1, -1369.6, 23.5), heading = 0.0 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(234.5, -1373.7, 20.9),
				To = { coords = vector3(320.9, -1478.6, 28.8), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(317.9, -1476.1, 28.9),
				To = { coords = vector3(238.6, -1368.4, 23.5), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false }
			}
		},

		FastTravelsPrompt = {
			{
				From = vector3(237.4, -1373.8, 26.0),
				To = { coords = vector3(251.9, -1363.3, 38.5), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(256.5, -1357.7, 36.0),
				To = { coords = vector3(235.4, -1372.8, 26.3), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			}
		}

	},
	Shandy = {

		Blip = {
			coords = vector3(1838.96, 3673.68, 34.28),
			sprite = 61,
			scale  = 1.2,
			color  = 2
		},

		AmbulanceActions = {
			vector3(-0.2, 0.44, 0.44)
		},

		Pharmacies = {
			vector3(-0.32, 0.28, 0.44)
		},

		Vehicles = {
			{
				Spawner = vector3(1838.96, 3673.68, 34.28),
				InsideShop = vector3(1834.96, 3660.84, 33.92),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(1852.88, 3670.48, 33.84), heading = 227.6, radius = 4.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-366.44, 6103.84, 35.44),
				InsideShop = vector3(-360.16, 6116.56, 37.8),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(-359.4, 6120.68, 37.8), heading = 142.7, radius = 10.0 }				}
			}
		},

		FastTravels = {
			{
				From = vector3(294.7, -1448.1, 29.0),
				To = { coords = vector3(272.8, -1358.8, 23.5), heading = 0.0 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(275.3, -1361, 23.5),
				To = { coords = vector3(295.8, -1446.5, 28.9), heading = 0.0 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(247.3, -1371.5, 23.5),
				To = { coords = vector3(333.1, -1434.9, 45.5), heading = 138.6 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(335.5, -1432.0, 45.50),
				To = { coords = vector3(249.1, -1369.6, 23.5), heading = 0.0 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(234.5, -1373.7, 20.9),
				To = { coords = vector3(320.9, -1478.6, 28.8), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(317.9, -1476.1, 28.9),
				To = { coords = vector3(238.6, -1368.4, 23.5), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false }
			}
		},

		FastTravelsPrompt = {
			{
				From = vector3(237.4, -1373.8, 26.0),
				To = { coords = vector3(251.9, -1363.3, 38.5), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(256.5, -1357.7, 36.0),
				To = { coords = vector3(235.4, -1372.8, 26.3), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			}
		}

	}


}
function carsAmbulance()
	local cars = {{label = "Ambulancia Cruz Roja",  value = 'sprinter1'},
      {label = "Ambulancia sprinter 311", value = 'sprinter3'},
      {label = "Ambulancia Volkswagen", value = 'inem_vwcrafter'},
			{label = "Ambulancia Sprinter", value = 'sprinter'}}
			
		local allcars = {}

	for i,v in pairs(cars) do
		table.insert(allcars, { model = v.value, label = v.label, price = 10})
	end

	return allcars
end

function carsMedico()
	local cars = {{label = "Ambulancia Cruz Roja",  value = 'sprinter1'},
		{label = "Ambulancia sprinter 311", value = 'sprinter3'},
		{label = "Ambulancia Volkswagen", value = 'inem_vwcrafter'},
		{label = "Ambulancia Sprinter", value = 'sprinter'},
		{label = "Peugeot 206",  value = 'fk2'},
    {label = "Smart", value = 'mini'},
    {label = "Lexus VIR Cruz Roja", value = 'polgs350'}}
			
		local allcars = {}

	for i,v in pairs(cars) do
		table.insert(allcars, { model = v.value, label = v.label, price = 10})
	end

	return allcars
end

function carsUMIR()
	local cars = {{label = "Ambulancia Cruz Roja",  value = 'sprinter1'},
		{label = "Ambulancia sprinter 311", value = 'sprinter3'},
		{label = "Ambulancia Volkswagen", value = 'inem_vwcrafter'},
		{label = "Ambulancia Sprinter", value = 'sprinter'},
		{label = "Peugeot 206",  value = 'fk2'},
    {label = "Smart", value = 'mini'},
		{label = "Lexus VIR Cruz Roja", value = 'polgs350'},
		{label = " Moto GS1200", value = 'ems_gs1200'}}
			
		local allcars = {}

	for i,v in pairs(cars) do
		table.insert(allcars, { model = v.value, label = v.label, price = 10})
	end

	return allcars
end

function carsGRM()
	local cars = {{label = "Ambulancia Cruz Roja",  value = 'sprinter1'},
		{label = "Ambulancia sprinter 311", value = 'sprinter3'},
		{label = "Ambulancia Volkswagen", value = 'inem_vwcrafter'},
		{label = "Ambulancia Sprinter", value = 'sprinter'},
		{label = "Peugeot 206",  value = 'fk2'},
    {label = "Smart", value = 'mini'},
		{label = "Lexus VIR Cruz Roja", value = 'polgs350'},
		{label = " Moto GS1200", value = 'ems_gs1200'},
		{label = "BMW X6 Doctor", value = 'sheriffx6'}}
			
		local allcars = {}

	for i,v in pairs(cars) do
		table.insert(allcars, { model = v.value, label = v.label, price = 10})
	end

	return allcars
end

function carsPiloto()
	local cars = {{label = "Ambulancia Cruz Roja",  value = 'sprinter1'},
		{label = "Ambulancia sprinter 311", value = 'sprinter3'},
		{label = "Ambulancia Volkswagen", value = 'inem_vwcrafter'},
		{label = "Ambulancia Sprinter", value = 'sprinter'},
		{label = "Peugeot 206",  value = 'fk2'},
    {label = "Smart", value = 'mini'},
		{label = "Lexus VIR Cruz Roja", value = 'polgs350'},
		{label = " Moto GS1200", value = 'ems_gs1200'},
		{label = "BMW X6 Doctor", value = 'sheriffx6'},
		{label = "Helicoptero Bomberos", value = 'firehawk'},
		{label = "Helicoptero Mixto", value = 'jayhawk'},
		{label = "Helicóptero",  value = 'EC135'}}
			
		local allcars = {}

	for i,v in pairs(cars) do
		table.insert(allcars, { model = v.value, label = v.label, price = 10})
	end

	return allcars
end

function helis()
	local cars = {
		{label = "Helicoptero Bomberos", value = 'firehawk'},
		{label = "Helicoptero Mixto", value = 'jayhawk'},
		{label = "Helicóptero",  value = 'EC135'}}
			
		local allcars = {}

	for i,v in pairs(cars) do
		table.insert(allcars, { model = v.value, label = v.label, price = 10})
	end

	return allcars
end

function cars()
	  local cars = {{label = "Ambulancia Cruz Roja",  value = 'sprinter1'},
      {label = "Ambulancia sprinter 311", value = 'sprinter3'},
      {label = "Ambulancia Volkswagen", value = 'inem_vwcrafter'},
      {label = "Ambulancia Sprinter", value = 'sprinter'},
      {label = "Peugeot 206",  value = 'fk2'},
      {label = "Smart", value = 'mini'},
      {label = "Lexus VIR Cruz Roja", value = 'polgs350'},
      {label = "Volskwagen t6 Forense", value = 'vwt6for'},
      {label = " Moto GS1200", value = 'ems_gs1200'},
      {label = "Porsche 718 VIR Cruz Roja",  value = 'pol718'},
      {label = "Mercedes Stilo Zendrack",  value = 'zendrack'},
      {label = "Hospital de Campaña",  value = 'hcampana'},
      {label = 'MP4' , value = 'polmp4'},
      {label = 'Aventador',value = 'polaventa'},
      {label = "BMW X6 Doctor", value = 'sheriffx6'},
      {label = "Raptor Jefatura", value = 'f150'},
      {label = "Grúa Mapfre", value = 'towtruck'},
      {label = "Renault Midlium", value = 'renmidlium'},
      {label = "Mercedes Atego", value = 'meratego'},
      {label = "Isuzu",  value = 'suzufire'},
      {label = "Scania p280",  value = 'p280'},
      {label = "Mercedes Atego escalera",  value = 'm939'},
      {label = "Volkswagen t6", value = 'vwt6'},
      {label = "Mercedes Vito", value = 'vitofor'},
      {label = "Kangoo", value = 'partner'},
      {label = "Volkswagen Touran", value = 'voltouran'},
      {label = "Land Rover", value = 'landb'},
      {label = "Incendios extremos", value = 'desfire'},
      {label = "Land Rover Defender", value = 'rsb_lrdef'},
      {label = "Helicoptero Bomberos", value = 'firehawk'},
      {label = "Helicoptero Mixto", value = 'jayhawk'},
	  {label = "Helicóptero",  value = 'EC135'}}
	  
	  local allcars = {}

	  for i,v in pairs(cars) do
		table.insert(allcars, { model = v.value, label = v.label, price = 10})
	  end

	  return allcars
	end


Config.AuthorizedVehicles = {

	ambulance = carsAmbulance(),
	tecnico = carsAmbulance(),
	medico = carsMedico(),
	piloto = carsPiloto(),
	chief_doctor = cars(),
	boss = cars(),
	doctor = carsPiloto(),
	forense = cars(),
	umir = carsUMIR(),
	aspirante = carsMedico(),
	bomberoprimera = carsGRM(),
	bomberosegunda = carsGRM(),
	virtercero = carsPiloto()


}

Config.AuthorizedHelicopters = {
	ambulance = helis(),
	tecnico =  helis(),
	medico = helis(),
	piloto = helis(),
	chief_doctor = helis(),
	boss = helis(),
	doctor = helis(),
	forense = helis(),
	umir = helis(),
	aspirante = helis(),
	bomberoprimera = helis(),
	bomberosegunda = helis(),
	virtercero = helis()
	
}

Config.Uniforms = {
	[1] = { -- bomberos
	  male = {
		['tshirt_1'] = 37,  ['tshirt_2'] = 0,
		['torso_1'] = 35,   ['torso_2'] = 1,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 0,
		['pants_1'] = 46,   ['pants_2'] = 0,
		['shoes_1'] = 27,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 0,  ['bproof_2'] = 0
	  },
	  female = {
		['tshirt_1'] = 37,  ['tshirt_2'] = 0,
		['torso_1'] = 35,   ['torso_2'] = 1,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 0,
		['pants_1'] = 46,   ['pants_2'] = 0,
		['shoes_1'] = 27,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 0,  ['bproof_2'] = 0
	  }
	},
	[2] = { -- forense
	  male = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 36,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 85,
		['pants_1'] = 84,   ['pants_2'] = 0,
		['shoes_1'] = 25,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 18,  ['bproof_2'] = 3
	  },
	  female = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 36,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 85,
		['pants_1'] = 84,   ['pants_2'] = 0,
		['shoes_1'] = 25,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 18,  ['bproof_2'] = 3
	  }
	},
	[3] = { -- enfermero
	  male = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 36,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 85,
		['pants_1'] = 84,   ['pants_2'] = 0,
		['shoes_1'] = 25,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 18,  ['bproof_2'] = 0
	  },
	  female = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 36,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 85,
		['pants_1'] = 84,   ['pants_2'] = 0,
		['shoes_1'] = 25,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 18,  ['bproof_2'] = 0
	  }
	},
	[4] = { --técnico
	  male = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 36,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 85,
		['pants_1'] = 84,   ['pants_2'] = 0,
		['shoes_1'] = 25,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 18,  ['bproof_2'] = 1
	  },
	  female = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 36,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 85,
		['pants_1'] = 84,   ['pants_2'] = 0,
		['shoes_1'] = 25,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 18,  ['bproof_2'] = 1
	  }
	},
	[5] = { --médico
	  male = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 36,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 85,
		['pants_1'] = 84,   ['pants_2'] = 0,
		['shoes_1'] = 25,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 18,  ['bproof_2'] = 2
	  },
	  female = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 36,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 85,
		['pants_1'] = 84,   ['pants_2'] = 0,
		['shoes_1'] = 25,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 18,  ['bproof_2'] = 2
	  }
	},
	[6] = { --doctor
	  male = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 36,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 85,
		['pants_1'] = 84,   ['pants_2'] = 0,
		['shoes_1'] = 25,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 18,  ['bproof_2'] = 4
	  },
	  female = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 36,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 85,
		['pants_1'] = 84,   ['pants_2'] = 0,
		['shoes_1'] = 25,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 18,  ['bproof_2'] = 4
	  }
	},
	[7] = { --jefatura
	  male = {
		['tshirt_1'] = 129,  ['tshirt_2'] = 0,
		['torso_1'] = 36,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 85,
		['pants_1'] = 84,   ['pants_2'] = 0,
		['shoes_1'] = 25,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 18,  ['bproof_2'] = 5
	  },
	  female = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 36,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 85,
		['pants_1'] = 84,   ['pants_2'] = 0,
		['shoes_1'] = 25,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 18,  ['bproof_2'] = 5
	  }
	},
	[8] = { --UMIR
	  male = {
		['tshirt_1'] = 129,  ['tshirt_2'] = 0,
		['torso_1'] = 74,   ['torso_2'] = 2,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 86,
		['pants_1'] = 84,   ['pants_2'] = 0,
		['shoes_1'] = 25,   ['shoes_2'] = 0,
		['helmet_1'] = 17,  ['helmet_2'] = 1,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 0,  ['bproof_2'] = 0
	  },
	  female = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 74,   ['torso_2'] = 2,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 85,
		['pants_1'] = 84,   ['pants_2'] = 0,
		['shoes_1'] = 25,   ['shoes_2'] = 0,
		['helmet_1'] = 17,  ['helmet_2'] = 1,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 0,  ['bproof_2'] = 0
	  }
	},
	[9] = { --Forense
	  male = {
		['tshirt_1'] = 129,  ['tshirt_2'] = 0,
		['torso_1'] = 74,   ['torso_2'] = 1,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 86,
		['pants_1'] = 84,   ['pants_2'] = 1,
		['shoes_1'] = 25,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 0,  ['bproof_2'] = 0
	  },
	  female = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 74,   ['torso_2'] = 2,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 85,
		['pants_1'] = 84,   ['pants_2'] = 0,
		['shoes_1'] = 25,   ['shoes_2'] = 0,
		['helmet_1'] = 17,  ['helmet_2'] = 1,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 0,  ['bproof_2'] = 0
	  }
	},
	[11] = { --Piloto
	  male = {
		['tshirt_1'] = 57,  ['tshirt_2'] = 0,
		['torso_1'] = 65,   ['torso_2'] = 2,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 96,
		['pants_1'] = 38,   ['pants_2'] = 2,
		['shoes_1'] = 24,   ['shoes_2'] = 0,
		['helmet_1'] = 19,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 0,  ['bproof_2'] = 0
	  },
	  female = {
		['tshirt_1'] = 57,  ['tshirt_2'] = 0,
		['torso_1'] = 65,   ['torso_2'] = 2,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 96,
		['pants_1'] = 38,   ['pants_2'] = 2,
		['shoes_1'] = 24,   ['shoes_2'] = 0,
		['helmet_1'] = 19,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 0,  ['bproof_2'] = 0
	  }
	},
	[10] = { --Limpiar
	  male = {
		['tshirt_1'] = 0,  ['tshirt_2'] = 0,
		['torso_1'] = 0,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 0,
		['pants_1'] = 0,   ['pants_2'] = 0,
		['shoes_1'] = 0,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 0,  ['bproof_2'] = 0
	  },
	  female = {
		['tshirt_1'] = 0,  ['tshirt_2'] = 0,
		['torso_1'] = 0,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 0,
		['pants_1'] = 0,   ['pants_2'] = 0,
		['shoes_1'] = 0,   ['shoes_2'] = 0,
		['helmet_1'] = 0,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 0,  ['bproof_2'] = 0
	  }
	}
}
