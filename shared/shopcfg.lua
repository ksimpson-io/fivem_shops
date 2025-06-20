Config.Shops = {	-- EXAMPLE SHOP
	testshop = { 											-----> id of the shop
		disabled = true, 									-----> [OPTIONAL] disable the shop; will BE ON BY DEFAULT
		label = "Test Shop", 								-----> name of the shop
		type = "items", 									-----> type of items sold the shop
		productSet = "testproducts", 						-----> typeof product solds; id is used to identify in Config.Products
		useTarget = false, 									-----> [OPTIONAL] use target or it will default to interact
		currency = "cash", 									-----> [OPTIONAL] type of currency the shop takes; will default to bank
		mode = "sell", 										-----> [OPTIONAL] choices: { "buy", "sell" }; "sell" = player sells to shop, "buy" = player buys from shop; will default to buy
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
			vector4(39.1, -1355.08, 29.29, 22.68),
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

}
