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
Config.MaxInService               = 20
Config.Locale                     = 'es'

Config.PoliceStations = {

  Paleto = {

    Blip = {
      Pos     = {x = -449.16, y = 6012.32, z = 30.72},
      Sprite  = 60,
      Display = 4,
      Scale   = 1.2,
      Color   = 29,
    },

    AuthorizedWeapons = {
      { name = 'WEAPON_NIGHTSTICK',       price = 200 },
      { name = 'WEAPON_PISTOL',     price = 300 },
      { name = 'WEAPON_HEAVYPISTOL',     price = 300 },
      { name = 'WEAPON_COMBATPISTOL',     price = 300},
      { name = 'WEAPON_ASSAULTSMG',       price = 1250 },
      { name = 'WEAPON_SPECIALCARBINE',     price = 1500 },
      { name = 'WEAPON_COMBATPDW',          price = 1000},
      { name = 'WEAPON_STUNGUN',          price = 500 },
      { name = 'WEAPON_HEAVYSNIPER',     price = 1200},
      { name = 'WEAPON_FLASHLIGHT',       price = 80 },
      { name = 'GADGET_PARACHUTE',        price = 300 },
      { name = 'WEAPON_SMOKEGRENADE',        price = 300 },
    },

    AuthorizedVehicles = {
      { name = '',  label = '-> RECLUTA A AGENTE <-' },
      { name = 'feverest', label = '4X4 Ford' },
      { name = 'lrover', label = 'Range Rover 4x4' },
      { name = 'sef_pfinder', label = 'Nissan Pathfinder' },
      { name = 'kuga', label = 'Kuga' },
      { name = '',  label = '-> AGENTE 2ª A AGENTE 1ª <-' },
      { name = 'bmwtou', label = 'BMW Guardia Civil' },
      { name = 'skoda', label = 'Skoda Guardia Civil' },
      { name = 'mer02', label = 'Mercedes Vito' },
      { name = 'oastra', label = 'Opel Astra' },
      { name = 'megan', label = 'Megane' },
      { name = 'skoda', label = 'Skoda Guardia Civil' },
      { name = 'c414', label = 'Citroën C4' },
      { name = '',  label = '-> CABO A CABO 1ª <-' },
      { name = 'c4picasso', label = 'Citroën C4 Picasso 2009' },
      { name = '',  label = '-> CABO MAYOR A SARGENTO <-' },
      { name = 'c4mercury', label = 'Citroën C4 Picasso 2014' },
      { name = '',  label = '' },
      { name = '',  label = '-= ESPECIALIDADES =-' },
      { name = '',  label = '=> UNIDAD CENTRAL OPERATIVA <=' },
      { name = 'polgtr', label = 'GTR'},
      { name = 'policesl', label = 'BMW X5'},
      { name = 'policer8', label = 'Mustang'},
      { name = '',  label = '=> AGRUPACIÓN DE TRAFICO <=' },
      { name = 'rt1200', label = 'Moto BMW RT1200 Tráfico' },
      { name = '159atgc',  label = 'Alfa Romeo' },
      { name = 'mer03', label = 'Furgon Tráfico'},
      { name = 'sef_pfinder_atgc', label = '4x4 Tráfico'},
      { name = 'bmwsla', label = 'BMW trafico' },
      { name = '',  label = '=> GRUPO DE RESERVA Y SEGURIDAD <=' },
      { name = 'crafter', label = 'Volkswagen Crafter' },
      { name = 'fdlctruck', label = 'Bomba GRS' },
      { name = 'jumpy', label = 'Citroën Jumpy' },
      { name = '',  label = '=> UNIDAD ESPECIAL DE INTERVENCIÓN <=' },
      { name = 'elsantos', label = 'El Santos'},
      { name = 'bestia', label = 'Bestia U.E.I.'}
    },

    Cloakrooms = {
      { x = -451.68, y = 6006.08, z = 30.84 },
    },

    Armories = {
      { x = -446.88, y = 6001.32, z = 30.68 },
    },

    Vehicles = {
      {
        Spawner    = { x = -474.4, y = 6037.68, z = 30.36 },
        SpawnPoint = { x = -474.36, y = 6023.8, z = 30.36 },
        Heading    = 90.0,
      }
    },

    Helicopters = {
      {
        Spawner    = { x = -470.6, y = 5988.6, z = 30.32 },
        SpawnPoint = { x = -479.96, y = 5983.96, z =31.08 },
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {
      { x = -459.28, y = 6042.2, z = 30.36 },
      { x = 462.40, y = -1019.7, z = 27.104 },
    },

    BossActions = {
      { x = -449.16, y = 6012.32, z = 30.72 }
		}
	},




	SandyShores = {

    Blip = {
      Pos     = {x = 1852.84, y = 3689.2, z = 34.28},
      Sprite  = 60,
      Display = 4,
      Scale   = 1.2,
      Color   = 29,
    },

    AuthorizedWeapons = {
      { name = 'WEAPON_NIGHTSTICK',       price = 200 },
      { name = 'WEAPON_PISTOL',     price = 300 },
      { name = 'WEAPON_HEAVYPISTOL',     price = 300 },
      { name = 'WEAPON_ASSAULTSMG',       price = 1250 },
      { name = 'WEAPON_SPECIALCARBINE',     price = 1500 },
      { name = 'WEAPON_STUNGUN',          price = 500 },
      { name = 'WEAPON_FLASHLIGHT',       price = 80 },
      { name = 'GADGET_PARACHUTE',        price = 300 },
      { name = 'WEAPON_SMOKEGRENADE',        price = 300 },
    },
    AuthorizedVehicles = {
      { name = '',  label = '-> RECLUTA A AGENTE <-' },
      { name = 'feverest', label = '4X4 Ford' },
      { name = 'lrover', label = 'Range Rover 4x4' },
      { name = 'sef_pfinder', label = 'Nissan Pathfinder' },
      { name = '',  label = '-> AGENTE 2ª A AGENTE 1ª <-' },
      { name = 'bmwtou', label = 'BMW Guardia Civil' },
      { name = 'skoda', label = 'Skoda Guardia Civil' },
      { name = 'mer02', label = 'Mercedes Vito' },
      { name = 'oastra', label = 'Opel Astra' },
      { name = 'skoda', label = 'Skoda Guardia Civil' },
      { name = 'c414', label = 'Citroën C4' },
      { name = '',  label = '-> CABO A CABO 1ª <-' },
      { name = 'c4picasso', label = 'Citroën C4 Picasso 2009' },
      { name = '',  label = '-> CABO MAYOR A SARGENTO <-' },
      { name = 'c4mercury', label = 'Citroën C4 Picasso 2014' },
      { name = '',  label = '' },
      { name = '',  label = '-= ESPECIALIDADES =-' },
      { name = '',  label = '=> UNIDAD CENTRAL OPERATIVA <=' },
      { name = 'polgtr', label = 'GTR'},
      { name = 'policesl', label = 'BMW X5'},
      { name = 'policer8', label = 'Mustang'},
      { name = '',  label = '=> AGRUPACIÓN DE TRAFICO <=' },
      { name = 'rt1200', label = 'Moto BMW RT1200 Tráfico' },
      { name = '159atgc',  label = 'Alfa Romeo' },
      { name = 'mer03', label = 'Furgon Tráfico'},
      { name = 'sef_pfinder_atgc', label = '4x4 Tráfico'},
      { name = 'bmwsla', label = 'BMW trafico' },
      { name = '',  label = '=> GRUPO DE RESERVA Y SEGURIDAD <=' },
      { name = 'crafter', label = 'Volkswagen Crafter' },
      { name = 'fdlctruck', label = 'Bomba GRS' },
      { name = 'jumpy', label = 'Citroën Jumpy' },
      { name = '',  label = '=> UNIDAD ESPECIAL DE INTERVENCIÓN <=' },
      { name = 'elsantos', label = 'El Santos'},
      { name = 'bestia', label = 'Bestia U.E.I.'}
    },

    Cloakrooms = {
      { x = 1857.0, y = 3689.72, z = 33.30 },
    },

    Armories = {
      { x = 1883.08, y = 3672.92, z = 32.50 },
    },
    
    Vehicles = {
      {
        Spawner    = { x = 1866.0, y = 3685.32, z = 32.60 },
        SpawnPoint = { x = 1874.36, y = 3674.88, z = 32.96 },
        Heading    = 90.0,
      }
    },

    Helicopters = {
      {
        Spawner    = { x = 1868.16, y = 3685.00, z = 32.70 },
        SpawnPoint = { x = 1874.36, y = 3674.88, z = 32.96 },
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {
      { x = 1868.84, y = 3693.64, z = 32.22 },
    },

    BossActions = {
      { x = 1852.16, y = 3689.56, z = 33.60 }
		}
	},

}

Config.Uniforms = {
  [1] = { -- tráfico 1
    male = {
      ['tshirt_1'] = 13,  ['tshirt_2'] = 0,
      ['torso_1'] = 32,   ['torso_2'] = 0,
      ['decals_1'] = 0,   ['decals_2'] = 0,
      ['arms'] = 42,
      ['pants_1'] = 49,   ['pants_2'] = 0,
      ['shoes_1'] = 25,   ['shoes_2'] = 0,
      ['helmet_1'] = 17,  ['helmet_2'] = 0,
      ['chain_1'] = 0,    ['chain_2'] = 0,
      ['ears_1'] = 0,     ['ears_2'] = 0,
      ['bproof_1'] = 0,  ['bproof_2'] = 0
    },
    female = {
      ['tshirt_1'] = 13,  ['tshirt_2'] = 0,
      ['torso_1'] = 32,   ['torso_2'] = 0,
      ['decals_1'] = 0,   ['decals_2'] = 0,
      ['arms'] = 42,
      ['pants_1'] = 48,   ['pants_2'] = 0,
      ['shoes_1'] = 25,   ['shoes_2'] = 0,
      ['helmet_1'] = 17,  ['helmet_2'] = 0,
      ['chain_1'] = 0,    ['chain_2'] = 0,
      ['ears_1'] = 0,     ['ears_2'] = 0,
      ['bproof_1'] = 0,  ['bproof_2'] = 0
    }
  },
  [2] = { -- tráfico 2
    male = {
      ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
      ['torso_1'] = 75,   ['torso_2'] = 0,
      ['decals_1'] = 0,   ['decals_2'] = 0,
      ['arms'] = 42,
      ['pants_1'] = 49,   ['pants_2'] = 0,
      ['shoes_1'] = 25,   ['shoes_2'] = 0,
      ['helmet_1'] = 17,  ['helmet_2'] = 0,
      ['chain_1'] = 0,    ['chain_2'] = 0,
      ['ears_1'] = 0,     ['ears_2'] = 0,
      ['bproof_1'] = 0,  ['bproof_2'] = 0
    },
    female = {
      ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
      ['torso_1'] = 75,   ['torso_2'] = 0,
      ['decals_1'] = 0,   ['decals_2'] = 0,
      ['arms'] = 42,
      ['pants_1'] = 49,   ['pants_2'] = 0,
      ['shoes_1'] = 25,   ['shoes_2'] = 0,
      ['helmet_1'] = 17,  ['helmet_2'] = 0,
      ['chain_1'] = 0,    ['chain_2'] = 0,
      ['ears_1'] = 0,     ['ears_2'] = 0,
      ['bproof_1'] = 0,  ['bproof_2'] = 0
    }
  },
  [3] = { -- gabardina larga
    male = {
      ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
      ['torso_1'] = 30,   ['torso_2'] = 0,
      ['decals_1'] = 0,   ['decals_2'] = 0,
      ['arms'] = 42,
      ['pants_1'] = 49,   ['pants_2'] = 0,
      ['shoes_1'] = 25,   ['shoes_2'] = 0,
      ['helmet_1'] = 10,  ['helmet_2'] = 0,
      ['chain_1'] = 0,    ['chain_2'] = 0,
      ['ears_1'] = 0,     ['ears_2'] = 0,
      ['bproof_1'] = 0,  ['bproof_2'] = 0
    },
    female = {
      ['tshirt_1'] = 4,  ['tshirt_2'] = 0,
      ['torso_1'] = 30,   ['torso_2'] = 0,
      ['decals_1'] = 0,   ['decals_2'] = 0,
      ['arms'] = 42,
      ['pants_1'] = 49,   ['pants_2'] = 0,
      ['shoes_1'] = 25,   ['shoes_2'] = 0,
      ['helmet_1'] = 10,  ['helmet_2'] = 0,
      ['chain_1'] = 0,    ['chain_2'] = 0,
      ['ears_1'] = 0,     ['ears_2'] = 0,
      ['bproof_1'] = 0,  ['bproof_2'] = 0
    }
  },
  [4] = { --polo negro
    male = {
      ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
      ['torso_1'] = 74,   ['torso_2'] = 0,
      ['decals_1'] = 0,   ['decals_2'] = 0,
      ['arms'] = 42,
      ['pants_1'] = 49,   ['pants_2'] = 0,
      ['shoes_1'] = 25,   ['shoes_2'] = 0,
      ['helmet_1'] = 10,  ['helmet_2'] = 0,
      ['chain_1'] = 0,    ['chain_2'] = 0,
      ['ears_1'] = 0,     ['ears_2'] = 0,
      ['bproof_1'] = 0,  ['bproof_2'] = 0
    },
    female = {
      ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
      ['torso_1'] = 74,   ['torso_2'] = 0,
      ['decals_1'] = 0,   ['decals_2'] = 0,
      ['arms'] = 42,
      ['pants_1'] = 49,   ['pants_2'] = 0,
      ['shoes_1'] = 25,   ['shoes_2'] = 0,
      ['helmet_1'] = 10,  ['helmet_2'] = 0,
      ['chain_1'] = 0,    ['chain_2'] = 0,
      ['ears_1'] = 0,     ['ears_2'] = 0,
      ['bproof_1'] = 0,  ['bproof_2'] = 0
    }
  },
  [5] = { --camiseta corta negra
    male = {
      ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
      ['torso_1'] = 98,   ['torso_2'] = 0,
      ['decals_1'] = 0,   ['decals_2'] = 0,
      ['arms'] = 41,
      ['pants_1'] = 49,   ['pants_2'] = 0,
      ['shoes_1'] = 25,   ['shoes_2'] = 0,
      ['helmet_1'] = 10,  ['helmet_2'] = 0,
      ['chain_1'] = 0,    ['chain_2'] = 0,
      ['ears_1'] = 0,     ['ears_2'] = 0,
      ['bproof_1'] = 0,  ['bproof_2'] = 0
    },
    female = {
      ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
      ['torso_1'] = 98,   ['torso_2'] = 0,
      ['decals_1'] = 0,   ['decals_2'] = 0,
      ['arms'] = 41,
      ['pants_1'] = 49,   ['pants_2'] = 0,
      ['shoes_1'] = 25,   ['shoes_2'] = 0,
      ['helmet_1'] = 10,  ['helmet_2'] = 0,
      ['chain_1'] = 0,    ['chain_2'] = 0,
      ['ears_1'] = 0,     ['ears_2'] = 0,
      ['bproof_1'] = 0,  ['bproof_2'] = 0
    }
  },
  [6] = { --camiseta corta verde
    male = {
      ['tshirt_1'] = 122,  ['tshirt_2'] = 0,
      ['torso_1'] = 18,   ['torso_2'] = 0,
      ['decals_1'] = 0,   ['decals_2'] = 0,
      ['arms'] = 41,
      ['pants_1'] = 49,   ['pants_2'] = 0,
      ['shoes_1'] = 25,   ['shoes_2'] = 0,
      ['helmet_1'] = 10,  ['helmet_2'] = 0,
      ['chain_1'] = 0,    ['chain_2'] = 0,
      ['ears_1'] = 0,     ['ears_2'] = 0,
      ['bproof_1'] = 0,  ['bproof_2'] = 0
    },
    female = {
      ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
      ['torso_1'] = 18,   ['torso_2'] = 0,
      ['decals_1'] = 0,   ['decals_2'] = 0,
      ['arms'] = 41,
      ['pants_1'] = 49,   ['pants_2'] = 0,
      ['shoes_1'] = 25,   ['shoes_2'] = 0,
      ['helmet_1'] = 10,  ['helmet_2'] = 0,
      ['chain_1'] = 0,    ['chain_2'] = 0,
      ['ears_1'] = 0,     ['ears_2'] = 0,
      ['bproof_1'] = 0,  ['bproof_2'] = 0
    }
  },
  [7] = { --camisa arremangada verde
    male = {
      ['tshirt_1'] = 122,  ['tshirt_2'] = 0,
      ['torso_1'] = 101,   ['torso_2'] = 0,
      ['decals_1'] = 0,   ['decals_2'] = 0,
      ['arms'] = 26,
      ['pants_1'] = 49,   ['pants_2'] = 0,
      ['shoes_1'] = 25,   ['shoes_2'] = 0,
      ['helmet_1'] = 10,  ['helmet_2'] = 0,
      ['chain_1'] = 0,    ['chain_2'] = 0,
      ['ears_1'] = 0,     ['ears_2'] = 0,
      ['bproof_1'] = 0,  ['bproof_2'] = 0
    },
    female = {
      ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
      ['torso_1'] = 101,   ['torso_2'] = 0,
      ['decals_1'] = 0,   ['decals_2'] = 0,
      ['arms'] = 41,
      ['pants_1'] = 49,   ['pants_2'] = 0,
      ['shoes_1'] = 25,   ['shoes_2'] = 0,
      ['helmet_1'] = 10,  ['helmet_2'] = 0,
      ['chain_1'] = 0,    ['chain_2'] = 0,
      ['ears_1'] = 0,     ['ears_2'] = 0,
      ['bproof_1'] = 0,  ['bproof_2'] = 0
    }
  },
  [8] = { --chaqueta guardia civil
  male = {
    ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
    ['torso_1'] = 103,   ['torso_2'] = 0,
    ['decals_1'] = 0,   ['decals_2'] = 0,
    ['arms'] = 42,
    ['pants_1'] = 49,   ['pants_2'] = 0,
    ['shoes_1'] = 25,   ['shoes_2'] = 0,
    ['helmet_1'] = 10,  ['helmet_2'] = 0,
    ['chain_1'] = 0,    ['chain_2'] = 0,
    ['ears_1'] = 0,     ['ears_2'] = 0,
    ['bproof_1'] = 0,  ['bproof_2'] = 0
  },
  female = {
    ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
    ['torso_1'] = 103,   ['torso_2'] = 0,
    ['decals_1'] = 0,   ['decals_2'] = 0,
    ['arms'] = 42,
    ['pants_1'] = 49,   ['pants_2'] = 0,
    ['shoes_1'] = 25,   ['shoes_2'] = 0,
    ['helmet_1'] = 10,  ['helmet_2'] = 0,
    ['chain_1'] = 0,    ['chain_2'] = 0,
    ['ears_1'] = 0,     ['ears_2'] = 0,
    ['bproof_1'] = 0,  ['bproof_2'] = 0
  }
},
  [9] = {--Chaleco policía
  male = {
      ['bproof_1'] = 17,  ['bproof_2'] = 0
    },
    female = {
      ['bproof_1'] = 17,  ['bproof_2'] = 0
    }
  },
  [10] = {--Trafico3
    male = {
      ['tshirt_1'] = 122,  ['tshirt_2'] = 0,
      ['torso_1'] = 18,   ['torso_2'] = 1,
      ['decals_1'] = 0,   ['decals_2'] = 0,
      ['arms'] = 41,
      ['pants_1'] = 49,   ['pants_2'] = 0,
      ['shoes_1'] = 25,   ['shoes_2'] = 0,
      ['helmet_1'] = 10,  ['helmet_2'] = 0,
      ['chain_1'] = 0,    ['chain_2'] = 0,
      ['ears_1'] = 0,     ['ears_2'] = 0,
      ['bproof_1'] = 0,  ['bproof_2'] = 0
    },
    female = {
      ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
      ['torso_1'] = 18,   ['torso_2'] = 0,
      ['decals_1'] = 0,   ['decals_2'] = 0,
      ['arms'] = 41,
      ['pants_1'] = 49,   ['pants_2'] = 0,
      ['shoes_1'] = 25,   ['shoes_2'] = 0,
      ['helmet_1'] = 10,  ['helmet_2'] = 0,
      ['chain_1'] = 0,    ['chain_2'] = 0,
      ['ears_1'] = 0,     ['ears_2'] = 0,
      ['bproof_1'] = 0,  ['bproof_2'] = 0
    }
  }
}