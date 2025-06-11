Config = {}
Config.Debug = false -- Enable to add debug boxes and message.
Config.DistanceCheck = 10.0 -- Distance to check if player is near the shop
Config.HideRestrictedItems = false -- Show items that you dont have access to or remove them being seen
Config.UsePeds = true -- Use peds or not; can disable peds in each shop

Config.Products = {
	testproducts = { 															-----> id of the product table for shops to use
		{ name = "tosti",														-----> spawncode of item
			price = 1,															-----> price of item
			amount = 1,															-----> amount of item stock
			info = { label = "Tosti", description = "Tosti" },					-----> [OPTIONAL] metadata for the item to have by default; will default to none
			currency = "standard",												-----> [OPTIONAL] type of currency to buy the item with; will default to bank or whatever the shop currency is ["cash", "bank", "standard", or "premium"]
			requirements = {													-----> [OPTIONAL] will default to NO REQUIREMENTS to buy item ; also able to lock full shop
				{ job = "police", rank = 0 },									-----> police job with min rank 0 able to access
				{ gang = "rangers" },											-----> [OPTIONAL] no rank will default to all ranks able to access
				{ licence = "pilot" },											-----> different types of licences
				{ item = "key" },												-----> [OPTIONAL] needing a specific item to buy the item
			}
		},
		{ name = "phone", price = 100, amount = 5000, },
	},
	normal = {
        { name = "tosti", price = 125, amount = 500, },
        { name = "water_bottle", price = 75, amount = 500, },
        { name = "kurkakola", price = 100, amount = 500, },
        { name = "twerks_candy", price = 75, amount = 500, },
        { name = "snikkel_candy", price = 75, amount = 500, },
        { name = "sandwich", price = 75, amount = 500, },
        { name = "beer", price = 75, amount = 250, },
        { name = "whiskey", price = 150, amount = 250, },
        { name = "phone", price = 150, amount = 250, },
        { name = "bandage", price = 75, amount = 250, },
        { name = "lighter", price = 75, amount = 250, },
        { name = "cigarette", price = 25, amount = 250, },
		{ name = "pinkslip", price = 100, amount = 250, },
	},
	liquor = {
        { name = "beer", price = 75, amount = 250, },
        { name = "whiskey", price = 150, amount = 250, },
        { name = "vodka", price = 250, amount = 250, },
	},
	bar = {
		{ name = "tosti", price = 125, amount = 500, info = {} },
		{ name = "sandwich", price = 75, amount = 500, info = {} },
		{ name = "water_bottle", price = 75, amount = 500, info = {} },
		{ name = "kurkakola", price = 100, amount = 500, info = {} },
		{ name = "vodka", price = 250, amount = 500, info = {} },
		{ name = "whiskey", price = 150, amount = 500, info = {} },
		{ name = "cigar", price = 45, amount = 500, info = {} },
		{ name = "cigarette", price = 25, amount = 1500, info = {} },
	},
	pharmacy = {
        { name = "bandage", price = 150, amount = 1500, },
		{ name = "painkillers", price = 300, amount = 1500, },
		{ name = "ifaks", price = 2500, amount = 1500, },
		{ name = "firstaidkit", price = 3500, amount = 1500, },
	},
	hardware = {
		{ name = "lockpick", price = 50, amount = 5000, },
		{ name = "weapon_wrench", price = 200, amount = 2500, },
		{ name = "weapon_hammer", price = 100, amount = 2500, },
		{ name = "repairkit", price = 500, amount = 3000, },
		{ name = "screwdriverset", price = 250, amount = 500, },
		{ name = "detector", price = 500, amount = 5000, },
		{ name = "radio", price = 250, amount = 5000, },
		{ name = "cleaningkit", price = 200, amount = 2500, },
		{ name = "advancedrepairkit", price = 800, amount = 2500, },
		{ name = "razorblade", price = 250, amount = 250,
			type = "item",
		},
		{ name = "plasticjerrycan", price = 100, amount = 250,
			type = "item",
		},
		{ name = "ammonia", price = 100, amount = 300,
			type = "item",
		},
	},
	weedshop = {
        { name = "joint", price = 50, amount = 500, },
        { name = "empty_weed_bag", price = 125, amount = 10000, },
        { name = "rolling_paper", price = 15, amount = 1000, },
        { name = "bong", price = 150, amount = 500, },
        { name = "empty_bottle" , price = 125, amount = 10000, },
        { name = "lighter", price = 75, amount = 500, },
	},
	gearshop = {
		-- { name = "fishingrod", price = 250, amount = 10, },
		-- { name = "fishingbait", price = 1, amount = 500, },
		-- { name = "diving_gear", price = 350, amount = 10, },
	},
	leisureshop = {
		{ name = "fishingrod", price = 250, amount = 10, },
		{ name = "fishingbait", price = 1, amount = 500, },
		{ name = "huntingbait", price = 1, amount = 500, },
		{ name = "parachute", price = 300, amount = 10, },
		{ name = "binoculars", price = 250, amount = 50, },
		{ name = "diving_gear", price = 350, amount = 10, },
	},
	weapons = {
		{ name = "weapon_knife", price = 2500, amount = 250, info = nil },
		{ name = "weapon_bat", price = 4500, amount = 250, },
		{ name = "weapon_hatchet", price = 5000, amount = 250, requiredJob = { "police", "ambulance" } },
		{ name = "weapon_pistol", price = 5000, amount = 5, info = nil, requiresLicence = false },
		{ name = "ammo-pistol", price = 5, amount = 100000, requiresLicence = false },
	},
	coffeeplace = {
		{ name = "coffee", price = 100, amount = 500 },
		{ name = "lighter", price = 75, amount = 50 },
	},
	casino = {
		{ name = 'casinochips', price = 1, amount = 999999 },
	},
	electronics = {
		{ name = "phone", price = 250, amount = 50 },
		{ name = "radio", price = 750, amount = 50, },
	},
	blackmarket = {
		{ name = "trojan_usb", price = 4000, amount = 5 },
		{ name = "electronickit", price = 6500, amount = 5 },
		{ name = "radioscanner", price = 2500, amount = 5 },
		{ name = "sodiumcarbonate", price = 150, amount = 200,
			type = "item",
		},
	},
	policearmory = {
		{ name = "weapon_pistol", price = 10, amount = 50,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "weapon_heavypistol", price = 10, amount = 50,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "weapon_combatpistol", price = 10, amount = 50,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "weapon_stungun", price = 10, amount = 50,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "weapon_smg", price = 10, amount = 50,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "weapon_smg_mk2", price = 10, amount = 50,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "weapon_carbinerifle_mk2", price = 10, amount = 50,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "weapon_carbinerifle", price = 10, amount = 50,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
		{ name = "weapon_bullpuprifle", price = 10, amount = 50,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
		{ name = "weapon_specialcarbine", price = 10, amount = 50,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
		{ name = "weapon_specialcarbine_mk2", price = 10, amount = 50,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
		{ name = "weapon_combatmg", price = 10, amount = 50,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
		{ name = "weapon_assaultsmg", price = 10, amount = 50,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
		{ name = "weapon_blastm4", price = 10, amount = 50,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "weapon_nightstick", price = 10, amount = 50,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "pistol_ammo", price = 10, amount = 500,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "smg_ammo", price = 10, amount = 500,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "shotgun_ammo", price = 10, amount = 500,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "rifle_ammo", price = 10, amount = 500,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "handcuffs", price = 10, amount = 50,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "weapon_flashlight", price = 10, amount = 50,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "empty_evidence_bag", price = 10, amount = 500,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "police_stormram", price = 10, amount = 50,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "armor", price = 10, amount = 500,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "radio", price = 10, amount = 50,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "heavyarmor", price = 10, amount = 500,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "police_fingerprintscanner", price = 10, amount = 50,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "bandage", price = 10, amount = 500,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "ifaks", price = 10, amount = 500,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "pd_bill_device", price = 10, amount = 50,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "advancedrepairkit", price = 10, amount = 50,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "taser_cartridge", price = 10, amount = 500,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "kq_outfitbag", price = 10, amount = 50,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "parachute", price = 10, amount = 500,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
        { name = "ankle_monitor", price = 10, amount = 500,
			requirements = {
				{ job = "police", rank = 0 },
			}
		},
	},
	ambulancearmory = {
		{ name = 'medbag',
			price = 1000, amount = 2500,
			requirements = {
				{ job = "ambulance", rank = 0 },
			}
		},
		{ name = 'medikit',
			price = 15, amount = 2500,
			requirements = {
				{ job = "ambulance", rank = 0 },
			}
		},
		{ name = 'morphine30',
			price = 100, amount = 500,
			requirements = {
				{ job = "ambulance", rank = 0 },
			}
		},
		{ name = 'morphine15',
			price = 45, amount = 500,
			requirements = {
				{ job = "ambulance", rank = 0 },
			}
		},
		{ name = 'perc30',
			price = 60, amount = 500,
			requirements = {
				{ job = "ambulance", rank = 0 },
			}
		},
		{ name = 'perc10',
			price = 40, amount = 500,
			requirements = {
				{ job = "ambulance", rank = 0 },
			}
		},
		{ name = 'perc5',
			price = 30, amount = 500,
			requirements = {
				{ job = "ambulance", rank = 0 },
			}
		},
		{ name = 'vic10',
			price = 30, amount = 500,
			requirements = {
				{ job = "ambulance", rank = 0 },
			}
		},
		{ name = 'vic5',
			price = 15, amount = 500,
			requirements = {
				{ job = "ambulance", rank = 0 },
			}
		},
		{ name = 'radio',
			price = 5, amount = 500,
			requirements = {
				{ job = "ambulance", rank = 0 },
			}
		},
		{ name = 'handcuffs',
			price = 5, amount = 500,
			requirements = {
				{ job = "ambulance", rank = 0 },
			}
		},
		{ name = 'weapon_flashlight',
			price = 5, amount = 500,
			requirements = {
				{ job = "ambulance", rank = 0 },
			}
		},
		{ name = 'bandage',
			price = 5, amount = 5000,
			requirements = {
				{ job = "ambulance", rank = 0 },
			}
		},
		{ name = 'weapon_stungun',
			price = 5, amount = 500,
			requirements = {
				{ job = "ambulance", rank = 0 },
			}
		},
	},
	neotokyorustysshop = {
		{ name = 'flour',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyorustys", rank = 0 },
			}
		},
		{ name = 'milk',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyorustys", rank = 0 },
			}
		},
		{ name = 'chocolate',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyorustys", rank = 0 },
			}
		},
		{ name = 'baking_powder',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyorustys", rank = 0 },
			}
		},
		{ name = 'sugar',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyorustys", rank = 0 },
			}
		},
		{ name = 'cream',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyorustys", rank = 0 },
			}
		},
		{ name = 'strawberry',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyorustys", rank = 0 },
			}
		},
		{ name = 'rustybox',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyorustys", rank = 3 },
			}
		},
	},
		cybergarageshop = {
		{ name = 'advancedrepairkit',
			price = 5, amount = 2500,
			requirements = {
				{ job = "cybergarage", rank = 0 },
			}
		},
		{ name = 'nitros',
			price = 5, amount = 2500,
			requirements = {
				{ job = "cybergarage", rank = 0 },
			}
		},
		{ name = 'repairkit',
			price = 5, amount = 2500,
			requirements = {
				{ job = "cybergarage", rank = 0 },
			}
		},
	},
		neovanillaunicronshop = {
		{ name = 'grape',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neovanillaunicron", rank = 0 },
			}
		},
		{ name = 'tequila',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neovanillaunicron", rank = 0 },
			}
		},
		{ name = 'sugar',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neovanillaunicron", rank = 0 },
			}
		},
		{ name = 'watermelon',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neovanillaunicron", rank = 0 },
			}
		},
		{ name = 'pond_sprinkles',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neovanillaunicron", rank = 0 },
			}
		},
		{ name = 'tortilla_chips',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neovanillaunicron", rank = 0 },
			}
		},
		{ name = 'cheese',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neovanillaunicron", rank = 0 },
			}
		},
		{ name = 'slicedtomato',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neovanillaunicron", rank = 0 },
			}
		},
				{ name = 'ngd_bhjal',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neovanillaunicron", rank = 0 },
			}
		},
		{ name = 'onion',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neovanillaunicron", rank = 0 },
			}
		},
		{ name = 'vodka',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neovanillaunicron", rank = 0 },
			}
		},
		{ name = 'lemon',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neovanillaunicron", rank = 0 },
			}
		},
		{ name = 'syrup',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neovanillaunicron", rank = 0 },
			}
		},
		{ name = 'strawberry',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neovanillaunicron", rank = 0 },
			}
		},
		{ name = 'blueberry',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neovanillaunicron", rank = 0 },
			}
		},
			{ name = 'rsmallglass',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neovanillaunicron", rank = 0 },
			}
		},
	},
			autoexoticshop = {
		{ name = 'stancekit',
			price = 5, amount = 2500,
			requirements = {
				{ job = "autoexotic", rank = 0 },
			}
		},
	},
			neotokyomechshop = {
		{ name = 'nitros',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyomech", rank = 0 },
			}
		},
		{ name = 'repairkit',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyomech", rank = 0 },
			}
		},
		{ name = 'advancedrepairkit',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyomech", rank = 0 },
			}
		},
				{ name = 'cleaningkit',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyomech", rank = 0 },
			}
		},
	},
    		mirrorshop = {
		{ name = 'wshotsauce',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
		{ name = 'bun',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
		{ name = 'steak',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
		{ name = 'choped-onion',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
		{ name = 'potatoes',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
		{ name = 'lemonjuice',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
		{ name = 'ice',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
		{ name = 'italian_sausage_marinara',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
				{ name = 'raw_chicken',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
		{ name = 'rlime',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
		{ name = 'rorange',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
		{ name = 'wsranchseason',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
		{ name = 'butter',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
		{ name = 'ngd_bhcocorum',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
		{ name = 'tequila',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
			{ name = 'plum',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
				{ name = 'salt',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
		{ name = 'lime',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
		{ name = 'sugar',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
		{ name = 'tomatoes',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
		{ name = 'jimsausages',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
		{ name = 'ginger',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
		{ name = 'rice',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
		{ name = 'basil',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
				{ name = 'whipcream',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
		{ name = 'flour',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
		{ name = 'vodka',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
		{ name = 'ngd_bhpj',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
		{ name = 'wssodasyup',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
		{ name = 'gin',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
		{ name = 'tomatosause',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
			{ name = 'cheese',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
			{ name = 'strawberry',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 0 },
			}
		},
			{ name = 'mirrorbox',
			price = 5, amount = 2500,
			requirements = {
				{ job = "mirror", rank = 4 },
			}
		},
    },
    		tacoshopshop = {
		{ name = 'rice_paper',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
		{ name = 'wsfrozenrolls',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
		{ name = 'cheese',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
		{ name = 'rice',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
		{ name = 'wsmango',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
		{ name = 'avacado',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
		{ name = 'cinnamon',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
		{ name = 'milk',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
			{ name = 'meat',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
		{ name = 'tortilla',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
		{ name = 'chilli',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
		{ name = 'red-beans',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
		{ name = 'raw_chicken',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
		{ name = 'sugar',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
		{ name = 'whiterice',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
			{ name = 'yeast',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
				{ name = 'water',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
		{ name = 'grain',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
		{ name = 'lettuce',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
		{ name = 'lemonjuice',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
		{ name = 'honey',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
		{ name = 'wshotsause',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
		{ name = 'aloe',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
		{ name = 'wssodasyrup',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
				{ name = 'flour',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
		{ name = 'egg',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
		{ name = 'tacomenucard',
			price = 5, amount = 2500,
			requirements = {
				{ job = "tacoshop", rank = 0 },
			}
		},
	},
    		neotokyoramenshop = {
		{ name = 'soysauce',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyoramen", rank = 0 },
			}
		},
		{ name = 'meat_cow',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyoramen", rank = 0 },
			}
		},
		{ name = 'garlic',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyoramen", rank = 0 },
			}
		},
		{ name = 'water',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyoramen", rank = 0 },
			}
		},
		{ name = 'white_cabbage',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyoramen", rank = 0 },
			}
		},
		{ name = 'carrot',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyoramen", rank = 0 },
			}
		},
		{ name = 'onion',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyoramen", rank = 0 },
			}
		},
		{ name = 'misopaste',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyoramen", rank = 0 },
			}
		},
			{ name = 'seaweed',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyoramen", rank = 0 },
			}
		},
		{ name = 'yeast',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyoramen", rank = 0 },
			}
		},
		{ name = 'sugar',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyoramen", rank = 0 },
			}
		},
		{ name = 'tea',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyoramen", rank = 0 },
			}
		},
		{ name = 'meat_pig',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyoramen", rank = 0 },
			}
		},
		{ name = 'lemon',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyoramen", rank = 0 },
			}
		},
		{ name = 'noodles',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neotokyoramen", rank = 0 },
			}
		},
	},
    		neobeanmachineshop = {
		{ name = 'coffee_beans',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neobeanmachine", rank = 0 },
			}
		},
		{ name = 'water',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neobeanmachine", rank = 0 },
			}
		},
		{ name = 'cup',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neobeanmachine", rank = 0 },
			}
		},
		{ name = 'milk',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neobeanmachine", rank = 0 },
			}
		},
		{ name = 'wsicecubes',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neobeanmachine", rank = 0 },
			}
		},
		{ name = 'vanilla',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neobeanmachine", rank = 0 },
			}
		},
		{ name = 'blueberry',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neobeanmachine", rank = 0 },
			}
		},
		{ name = 'flour',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neobeanmachine", rank = 0 },
			}
		},
			{ name = 'sugar',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neobeanmachine", rank = 0 },
			}
		},
		{ name = 'eggs',
			price = 5, amount = 2500,
			requirements = {
				{ job = "neobeanmachine", rank = 0 },
			}
		},
	},
    		rockfordshop = {
		{ name = 'grated-cheese',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
		{ name = 'bun',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
		{ name = 'onions',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
		{ name = 'sugar',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
		{ name = 'yeast',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
		{ name = 'vanilla',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
		{ name = 'milk',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
		{ name = 'ngd_vucbj',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
			{ name = 'ngd_bhpj',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
		{ name = 'ngd_bhoj',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
				{ name = 'matchapowder',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
		{ name = 'water',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
		{ name = 'rpineapple',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
		{ name = 'wsmango',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
		{ name = 'sodasyrup',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
		{ name = 'rlemon',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
		{ name = 'vanilla_icecream_box',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
		{ name = 'smoothiecup',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
			{ name = 'rglass',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
		{ name = 'ice',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
				{ name = 'coffee_cup',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
			{ name = 'tortilla',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
		{ name = 'tomatoes',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
				{ name = 'meat_cow',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
		{ name = 'meat_chicken',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
		{ name = 'oil',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
		{ name = 'flour',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
		{ name = 'salt',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
		{ name = 'egg',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
		{ name = 'shrimps',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
		{ name = 'cheedercheese',
			price = 5, amount = 2500,
			requirements = {
				{ job = "rockford", rank = 0 },
			}
		},
	},
}


Config.PedScenarios = {
	"WORLD_HUMAN_WINDOW_SHOP"
}


Config.Shops = {	-- EXAMPLE SHOP
	testshop = { 											-----> id of the shop
		disabled = true, 									-----> [OPTIONAL] disable the shop; will BE ON BY DEFAULT
		label = "Test Shop", 								-----> name of the shop
		type = "items", 									-----> type of items sold the shop
		productSet = "testproducts", 						-----> typeof product solds; id is used to identify in Config.Products
		useTarget = true, 									-----> [OPTIONAL] use target or it will default to interact
		currency = "cash", 									-----> [OPTIONAL] type of currency the shop takes; will default to bank
		requirements = {									-----> [OPTIONAL] will default to NO REQUIREMENTS to access full shop ; also able to lock single products
			{ job = "police", rank = 0 },					-----> police job with min rank 0 able to access
			{ gang = "rangers" },							-----> [OPTIONAL] no rank will default to all ranks able to access
			{ licence = "pilot" },							-----> different types of licences
			{ item = "key" },								-----> [OPTIONAL] needing a specific item to open the shop
		},
		ped = { 											-----> [OPTIONAL] ped settings will default to NO PED
			disabled = true, 								-----> disable the ped or remove the whole block to disable
			killable = true, 								-----> [OPTIONAL] can you kill the ped; will default to false
			models = { "mp_m_shopkeep_01" }, 				-----> random models the ped can be
		},
		blip = { 											-----> [OPTIONAL] blip settings will default to NO BLIP
			disabled = false, 								-----> disable the blip or remove the whole block to disable
			sprite = 125, 									-----> blip icon
			size = 0.7, 									-----> [OPTIONAL] blip size will default to 0.6
			color = 15, 									-----> blip color
		},
		coords = { 											-----> list of all coords of the shop
			vector4(24.5, -1346.19, 29.5, 266.78),
		},
	},


	-- 24/7 [VANILLA]
	["247supermarket"] = {
		label = "24/7 Supermarket",
		type = "items",
		productSet = "normal",
		ped = {
			killable = true,
			models = { "mp_m_shopkeep_01", "S_F_Y_Shop_LOW", "S_F_Y_SweatShop_01" },
		},
		blip = {
			sprite = 628,
			size = 0.7,
			color = 2,
		},
		coords = {
			vector4(24.5, -1346.19, 29.5, 266.78),
			vector4(-3039.91, 584.26, 7.91, 16.79),
			vector4(-3243.27, 1000.1, 12.83, 358.73),
			vector4(1728.28, 6416.03, 35.04, 242.45),
			vector4(1697.96, 4923.04, 42.06, 326.61),
			vector4(1959.6, 3740.93, 32.34, 296.84),
			vector4(549.16, 2670.35, 42.16, 92.53),
			vector4(2677.41, 3279.8, 55.24, 334.16),
			vector4(2556.19, 380.89, 108.62, 355.58),
			vector4(372.82, 327.3, 103.57, 255.46),
			vector4(161.21, 6642.32, 31.61, 223.57),
		},
	},

	-- 24/7 [GABZ]
	-- 247supermarket = {
	--     label = "24/7 Supermarket",
	--     type = "items",
	--     productSet = "normal",
	--     ped = {
	--         killable = true,
	--         models = {
	--             "mp_m_shopkeep_01",
	--             "S_F_Y_Shop_LOW",
	--             "S_F_Y_SweatShop_01",
	--         },
	--     },
	--     blip = {
	--         sprite = 628,
	--         size = 0.7,
	--         color = 2,
	--     },
	--     coords = {
	--         vector4(24.91, -1346.86, 29.5, 268.37),
	--         vector4(-3039.64, 584.78, 7.91, 21.88),
	--         vector4(-3242.73, 1000.46, 12.83, 2.08),
	--         vector4(1728.44, 6415.4, 35.04, 243.26),
	--         vector4(1697.96, 4923.04, 42.06, 326.61),
	--         vector4(1960.26, 3740.6, 32.34, 300.45),
	--         vector4(548.67, 2670.94, 42.16, 101.0),
	--         vector4(2677.97, 3279.95, 55.24, 325.89),
	--         vector4(2556.8, 381.27, 108.62, 359.15),
	--         vector4(373.08, 326.75, 103.57, 253.14),
	--         vector4(161.2, 6641.74, 31.7, 221.02),
	--         vector4(812.86, -782.01, 26.17, 270.01),
	--     },
	-- },


	-- LTD Gasoline
	ltdgasoline = {
		label = "LTD Gasoline",
		type = "items",
		productSet = "normal",
		ped = {
			models = { "s_m_m_autoshop_02", "S_F_M_Autoshop_01", "S_M_M_AutoShop_01", "S_M_M_Autoshop_03", "IG_Benny", "IG_Benny_02", "MP_F_BennyMech_01", },
		},
		blip = {
			sprite = 628,
			color = 5,
		},
		coords = {
			vector4(-47.42, -1758.67, 29.42, 47.26),
			vector4(-706.17, -914.64, 19.22, 88.77),
			vector4(-1819.53, 793.49, 138.09, 131.46),
			vector4(1164.82, -323.66, 69.21, 106.86),
		},
	},

	-- Rob's Liquor
	robsliquor = {
		label = "Rob's Liqour",
		type = "items",
		productSet = "liquor",
		ped = {
			models = { "cs_nervousron", "IG_RussianDrunk", "U_M_Y_MilitaryBum", "A_F_M_TrampBeac_01", "A_M_M_Tramp_01", },
		},
		blip = {
			sprite = 628,
			color = 31,
		},
		coords = {
			vector4(-1221.38, -907.89, 12.33, 27.51),
			vector4(-1486.82, -377.48, 40.16, 130.89),
			vector4(-2966.41, 391.62, 15.04, 87.82),
			vector4(1165.15, 2710.78, 38.16, 177.96),
			vector4(1134.3, -983.26, 46.42, 276.3),
		},
	},

	-- Hardware Store
	hardware = {
		label = "Hardware Store",
		type = "items",
		productSet = "hardware",
		ped = {
			models = { "s_m_m_autoshop_02", "S_F_M_Autoshop_01", "S_M_M_AutoShop_01", "S_M_M_Autoshop_03", "IG_Benny", "IG_Benny_02", "MP_F_BennyMech_01" },
		},
		blip = {
			sprite = 402,
			color = 5,
		},
		coords = {
			vector4(46.52, -1749.55, 29.64, 50.82),
			vector4(2747.76, 3472.9, 55.67, 243.88),
			vector4(-421.65, 6135.97, 31.88, 232.98),
		},
	},

	-- Ammunation [VANILLA]
	ammunation = {
		label = "Ammunation",
		type = "weapons",
		productSet = "weapons",
		ped = {
			models = { "s_m_m_ammucountry", "S_M_Y_AmmuCity_01", "MP_M_WareMech_01", "A_M_M_Farmer_01", "MP_M_ExArmy_01", "S_M_Y_ArmyMech_01", "S_M_M_Armoured_02" },
		},
		blip = {
			sprite = 567,
			color = 1,
		},
		coords = {
			vector4(808.94, -2158.99, 29.62, 330.26),
			vector4(-660.98, -933.6, 21.83, 154.74),
			vector4(1693.16, 3761.94, 34.71, 189.83),
			vector4(-330.72, 6085.81, 31.45, 190.52),
			vector4(253.41, -51.67, 69.94, 28.88),
			vector4(23.69, -1105.95, 29.8, 124.58),
			vector4(2566.81, 292.54, 108.73, 320.09),
			vector4(-1118.19, 2700.5, 18.55, 185.31),
			vector4(841.31, -1035.28, 28.19, 334.27),
			vector4(-1304.44, -395.68, 36.7, 41.85),
		},
	},

	--Ammunation [GABZ]
	-- ammunation = {
	-- 	label = "Ammunation",
	-- 	type = "weapons",
	-- 	productSet = "weapons",
	-- 	ped = {
	-- 		models = { "s_m_m_ammucountry", "S_M_Y_AmmuCity_01", "MP_M_WareMech_01", "A_M_M_Farmer_01", "MP_M_ExArmy_01", "S_M_Y_ArmyMech_01", "S_M_M_Armoured_02" },
	-- 	},
	-- 	blip = {
	-- 		sprite = 110,
	-- 		color = 1,
	-- 	},
	-- 	coords = {
	-- 		vector4(-659.16, -939.79, 21.83, 91.25),
	-- 		vector4(812.85, -2155.16, 29.62, 355.85),
	-- 		vector4(1698.04, 3757.43, 34.71, 136.69),
	-- 		vector4(-326.03, 6081.17, 31.45, 138.33),
	-- 		vector4(246.87, -51.3, 69.94, 335.47),
	-- 		vector4(18.71, -1108.24, 29.8, 158.71),
	-- 		vector4(2564.85, 298.83, 108.74, 283.17),
	-- 		vector4(-1112.4, 2697.08, 18.55, 152.96),
	-- 		vector4(841.16, -1028.63, 28.19, 294.2),
	-- 		vector4(-1310.71, -394.33, 36.7, 340.51),
	-- 	},
	-- },

	-- Casino
	casino = {
		disabled = true,
		label = "Diamond Casino",
		type = "items",
		productSet = "casino",
		ped = {
			models = { "U_F_M_CasinoShop_01" },
		},
		blip = {
			sprite = 617,
			color = 0,
		},
		coords = {
			vector4(949.3, 32.01, 71.84, 81.33),
		},
	},

	casinoBar = {
		disabled = true,
		label = "Casino Bar",
		type = "items",
		productSet = "bar",
		ped = {
			models = { "S_M_M_HighSec_01" },
		},
		blip = {
			sprite = 52,
			color = 0,
		},
		coords = {
			vector4(950.68, 34.56, 71.85, 29.86),
		},
	},

	-- Weedshop
	weedshop = {
		label = "Smoke on the Water",
		type = "items",
		productSet = "weedshop",
		ped = {
			models = { "mp_f_weed_01", "MP_M_Weed_01", "A_M_Y_MethHead_01", "A_F_Y_RurMeth_01" },
		},
		blip = {
			sprite = 496,
			color = 2,
		},
		coords = {
			vector4(-1173.12, -1572.71, 4.66, 123.56),
		},
	},

	-- Bean Coffee
	beancoffee = {
		label = "Bean Machine Coffee",
		type = "items",
		productSet = "coffeeplace",
		ped = {
			models = { "A_F_Y_Hipster_02" },
		},
		blip = {
			sprite = 52,
			color = 31,
		},
		coords = {
			vector4(-628.97, 238.27, 81.9, 1.28),
		},
	},

	-- Sea Word
	seaworld = {
		label = "Sea World",
		type = "items",
		productSet = "gearshop",
		ped = {
			models = { "csb_denise_friend" },
		},
		blip = {
			sprite = 52,
			color = 3,
		},
		coords = {
			vector4(-1686.48, -1072.53, 13.15, 49.85),
		},
	},

	-- Leisure Shop
	leisureshop = {
		label = "Leisure Shop",
		type = "items",
		productSet = "leisureshop",
		ped = {
			models = { "mp_m_boatstaff_01" },
		},
		blip = {
			sprite = 52,
			color = 2,
		},
		coords = {
			vector4(-1505.67, 1512.29, 115.29, 244.94),
		},
	},

	-- Local Store
	delvecchioliquor = {
		label = "Del Vecchio Liquor",
		type = "items",
		productSet = "liquor",
		ped = {
			models = { "cs_nervousron", "IG_RussianDrunk", "U_M_Y_MilitaryBum", "A_F_M_TrampBeac_01", "A_M_M_Tramp_01" },
		},
		blip = {
			sprite = 52,
			color = 2,
		},
		coords = {
			vector4(-160.54, 6320.85, 31.59, 317.79),
		},
	},

	digitalden = {
		label = "Digital Den",
		type = "items",
		productSet = "electronics",
		ped = {
			models = { "S_M_M_LifeInvad_01", "IG_Ramp_Hipster", "A_M_Y_Hipster_02", "A_F_Y_Hipster_01", "IG_LifeInvad_01", "IG_LifeInvad_02", "CS_LifeInvad_01" },
		},
		blip = {
			sprite = 619,
			color = 7,
		},
		coords = {
			vector4(391.76, -832.79, 29.29, 223.77),
			vector4(1136.99, -473.13, 66.53, 254.85),
			vector4(-509.55, 278.63, 83.31, 176.65),
			vector4(-656.27, -854.73, 24.5, 359.39),
			vector4(-1088.29, -254.3, 37.76, 252.7),
		},
	},

	blackmarket = {
		label = "Black Market",
		type = "items",
		productSet = "blackmarket",
		ped = {
			models = { "mp_f_weed_01", "MP_M_Weed_01", "A_M_Y_MethHead_01", "A_F_Y_RurMeth_01", "A_M_M_RurMeth_01", "MP_F_Meth_01", "MP_M_Meth_01" },
		},
		coords = {
			vector4(776.24, 4184.08, 41.8, 92.12),
			vector4(2482.51, 3722.28, 43.92, 39.98),
			vector4(462.67, -1789.16, 28.59, 317.53),
			vector4(-115.15, 6369.07, 31.52, 232.08),
			vector4(752.52, -3198.33, 6.07, 301.72),
		},
	},

	pharmacy = {
		label = "Heal in a Pill Pharmacy",
		type = "items",
		productSet = "pharmacy",
		ped = {
			models = { "s_m_m_scientist_01" },
		},
		blip = {
			sprite = 51,
			color = 8,
		},
		coords = {
			vector4(-172.87, 6381.25, 31.08, 229.11),
			vector4(591.12, 2744.87, 41.64, 183.51),
			vector4(1142.52, -451.99, 66.58, 251.4),
			vector4(-1866.738, -338.107, 48.727, 126.742),
		},
	},
	policearmory = {
        label = "Police Armory",
        type = "items",
        productSet = "policearmory",
        coords = {
            vector4(603.59, 2.4, 87.8, 155.54),
        },
	},
    ambulancearmory = {
		label = "Ambulance Job",
		type = "items",
		productSet = "ambulancearmory",
		coords = {
			vector4(310.42, -569.19, 43.26, 341.92),
		},
	},
    neotokyorustysshop = {
		label = "Neo Tokyo Rusty Shops",
		type = "items",
		productSet = "neotokyorustysshop",
		coords = {
			vector4(-685.42, -176.12, 37.81, 350.01),
		},
	},
	    cybergarageshop = {
		label = "Cyber Garage Shops",
		type = "items",
		productSet = "cybergarageshop",
		coords = {
			vector4(679.9, -776.73, 25.13, 194.05),
		},
	},
		neovanillaunicronshop = {
		label = "Neo Vanilla Unicorn Shops",
		type = "items",
		productSet = "neovanillaunicronshop",
		coords = {
			vector4(-672.38, -157.84, 37.81, 142.81),
		},
	},
		autoexoticshop = {
		label = "Auto Exotic Shops",
		type = "items",
		productSet = "autoexoticshop",
		coords = {
			vector4(542.31, -184.96, 54.51, 66.9),
		},
	},
		neotokyomechshop = {
		label = "Neo Tokyo Mech Shops",
		type = "items",
		productSet = "neotokyomechshop",
		coords = {
			vector4(-697.02, -172.1, 37.83, 34.97),
		},
	},
    	mirroshop = {
		label = "Mirror Shops",
		type = "items",
		productSet = "mirrorshop",
		coords = {
			vector4(-1351.4, -1071.76, 6.99, 296.91),
		},
	},
        tacoshopshop = {
		label = "Taco Shop Shops",
		type = "items",
		productSet = "tacoshopshop",
		coords = {
			vector4(12.64, -1600.25, 29.38, 153.9),
		},
	},
        neotokyoramenshop = {
		label = "Neo Tokyo Ramen Shops",
		type = "items",
		productSet = "neotokyoramenshop",
		coords = {
			vector4(-691.12, -124.1, 37.82, 106.66),
		},
	},
        neobeanmachineshop = {
		label = "Neo Tokyo Bean Machine Shops",
		type = "items",
		productSet = "neobeanmachineshop",
		coords = {
			vector4(-686.33, -130.55, 37.82, 123.95),
		},
	},
        rockfordshop = {
		label = "Neo Tokyo Bean Machine Shops",
		type = "items",
		productSet = "rockfordshop",
		coords = {
			vector4(-994.83, -258.63, 39.04, 255.68),
		},
	},
}

Config.Locales = {
	player_not_found = "Player Not Found",
	shop_not_found = "Shop Not Found",
	item_not_found = "Item Not Found",
	too_far_away = "You are too far away from the shop",
	invalid_payload = "Invalid Payload",
	invalid_shop = "Invalid Shop",
	invalid_location = "Invalid Location",
	invalid_item_index = "Invalid Item Index",
	invalid_amount = "Invalid Amount",
	invalid_payment_type = "Invalid Payment Type",
	invalid_product_category = "Invalid Product Category",
	cannot_carry_name = "You cannot carry this item",
	not_enough_money = "Not enough money",
	invalid_name = "The item doesn't exist",
	invalid_inventory = "The inventory doesn't exist",
	inventory_full = "No free slots",
	success = "Purchase successful",
}