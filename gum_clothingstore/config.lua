Config = {}

Config.Pricing = {
    Hat = 0.05,
    EyeWear = 0.05,
    NeckWear = 0.05,
    Mask = 0.50,
    NeckTies = 0.05,
    Shirt = 0.15,
    Suspender = 0.05,
    Vest = 0.10,
    Coat = 0.20,
    CoatClosed = 0.20,
    Poncho = 0.10,
    Cloak = 0.10,
    Glove = 0.07,
    Satchels = 0.05,
    RingRh = 0.20,
    RingLh = 0.20,
    Bracelet = 0.02,
    Gunbelt = 0.20,
    Belt = 0.20,
    Buckle = 0.40,
    Holster = 0.10,
    Pant = 0.20,
    Spats = 0.10,
    Skirt = 0.15,
    Chap = 0.15,
    Boots = 0.10,
    Spurs = 0.10,
    Gauntlets = 0.05,
    Accessories = 0.02,
    Loadouts = 0.30,
    GunbeltAccs = 0.20,
}

Config.ClothingStore = {
    [1] =  {
        ["ClothingBlip"] = "Clothing Store Valentine",
        ["ClothingStore"] = {-325.85, 774.49, 118.12},
        ["ClothingSpott"] = {-329.27, 775.06, 120.65},
        ["ClothingCamera"] = {-326.52, 775.40, 122.08, 94.14},
        ["ClothingEscape"] = {-323.32, 775.55, 120.65},
        ["DebugEscape"] = false,
    },
    [2] =  {
        ["ClothingBlip"] = "Clothing Store Saint Denis",
        ["ClothingStore"] = {2554.6875, -1168.54052734375, 53.68349456787109},
        ["ClothingSpott"] = {2556.114501953125, -1161.2445068359375, 52.70168304443359},
        ["ClothingCamera"] = {2556.05, -1159.14, 54.15, -178.40},
        ["ClothingEscape"] = {2553.0185546875, -1161.09521484375, 53.68352890014648},
        ["DebugEscape"] = true,
    },
    [3] =  {
        ["ClothingBlip"] = "Clothing Store Rhodes",
        ["ClothingStore"] = {1322.535400390625, -1291.8333740234375, 77.02304077148438},
        ["ClothingSpott"] = {1323.9852294921875, -1288.159423828125, 76.01953125},
        ["ClothingCamera"] = {1322.89, -1290.71, 77.63, -23.15},
        ["ClothingEscape"] = {1322.535400390625, -1291.8333740234375, 77.02304077148438},
        ["DebugEscape"] = true,
    },
	[4] =  {
        ["ClothingBlip"] = "Clothing Store Black Water",
        ["ClothingStore"] = {-761.11, -1291.90, 43.89},
        ["ClothingSpott"] = {-767.36, -1292.50, 42.94},
        ["ClothingCamera"] = {-764.20, -1292.94, 44.69, 86.88},
        ["ClothingEscape"] = {-764.15, -1290.89, 43.94},
    },
}


Config.Language = {
    [1] = {text = "Open clothing store",},
    [2] = {text = "db",},--Command for reload cloths (now is /db or full /dbs)
    [3] = {text = "Clothing store",},
    [4] = {text = "Price : ",},
    [5] = {text = "Turn left",},
    [6] = {text = "Turn right",},
    [7] = {text = "Turn down",},
    [8] = {text = "Turn up",},
    [9] = {text = "Zoom +",},
    [10] = {text = "Zoom -",},
    [11] = {text = "You dont have money",},

    --Commands
    [200] = {text = "hats",},
    [201] = {text = "glass",},
    [202] = {text = "scarf",},
    [203] = {text = "mask",},
    [204] = {text = "necktie",},
    [205] = {text = "shirt",},
    [206] = {text = "suspenders",},
    [208] = {text = "vest",},
    [209] = {text = "coat",},
    [211] = {text = "poncho",},
    [212] = {text = "cloak",},
    [213] = {text = "glove",},
    [214] = {text = "rings",},
    [216] = {text = "bracelet",},
    [217] = {text = "holster",},
    [218] = {text = "holsteraccesorie",},
    [219] = {text = "belt",},
    [220] = {text = "buckle",},
    [221] = {text = "secondholster",},
    [222] = {text = "pant",},
    [223] = {text = "spats",},
    [224] = {text = "skirt",},
    [225] = {text = "chaps",},
    [226] = {text = "boots",},
    [227] = {text = "spurs",},
    [228] = {text = "gauntlets",},
    [229] = {text = "accesories",},
    [230] = {text = "bags",},
    [231] = {text = "ammobelt",},
    [232] = {text = "unwear",},
    [233] = {text = "wear",},
    [234] = {text = "bandana",},
    [235] = {text = "sleeves",},
}
