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
				{ licence = "pilot", item = "pilotlicense" },					-----> different types of licences; 'item' is optional. If provided, the player must have the physical item. If omitted, only having the licence metadata is required
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

Config.Locales = {
	player_not_found = "Player Not Found",
	shop_not_found = "Shop Not Found",
	item_not_found = "Item Not Found",
	too_far_away = "You are too far away from the shop",
	invalid_payload = "Invalid Payload",
	invalid_shop = "Invalid Shop",
	invalid_location = "Invalid Location",
	invalid_item_index = "Invalid Item Index",
	invalid_item_table = "Invalid Item Table",
	invalid_item_name = "Invalid Item Name",
	invalid_item_amount = "Invalid Item Amount",
	invalid_amount = "Invalid Amount",
	invalid_payment_type = "Invalid Payment Type",
	invalid_product_category = "Invalid Product Category",
	cannot_carry_name = "You cannot carry this item",
	not_enough_money = "Not enough money",
	invalid_name = "The item doesn't exist",
	invalid_inventory = "The inventory doesn't exist",
	inventory_full = "No free slots",
	purchase_success = "Purchase successful",
	sell_success = "Items sold",
}
