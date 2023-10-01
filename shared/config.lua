Config = Config or {}

Config.RarityReward = true -- If True it will give rewards with a rarity other then just random Rewards. (Rarity is changed in server/main.lua)

Config.DumpsterCommon = { -- These are the items that can be optained from the Dumpster if RarityReward = True (Base Odds = 60%) (Rarity is changed in server/main.lua)
    [1] = "antique_coin1", 
    [2] = "nails",
    [3] = "barbed_wire",
    [4] = "pandora_charm",
    [5] = "fishingbait",
    [6] = "nuts_bolts",
    [7] = "metalscrap",
}

Config.DumpsterTrash = { -- These are the items that can be optained from the Dumpster if RarityReward = True (Base Odds = 38.6%) (Rarity is changed in server/main.lua)
    [1] = "can",
    [2] = "penny",
    [3] = "seaweed",
}

Config.DumpsterRare = { -- These are the items that can be optained from the Dumpster if RarityReward = True (Base Odds = 1%) (Rarity is changed in server/main.lua)
    [1] = "weapon_kitchen",
    [2] = "weapon_flashlight",
    [3] = "weapon_machete",
    [4] = "pistol_ammo",
}

Config.DumpsterUnique = { -- These are the items that can be optained from the Dumpster if RarityReward = True (Base Odds = 0.1%) (Rarity is changed in server/main.lua)
    [1] = "weapon_nambu",
    [2] = "weapon_zkiller",
    [3] = "ap_watch",
    [4] = "bmx",
}


-------------------------------------------------------------------------------------------------------------------------------------

Config.ItemTable = { -- These are the items that can be optained from the Dumpster if RarityReward = False
	[1] = "phone",
	[2] = "water_bottle",
	[3] = "plastic",
	[4] = "metalscrap",
	[5] = "bottle",
}

Config.MaxItemsReceived = 2 -- Max amount of items you can get per box
Config.MinItemReceivedQty = 1 -- Min amount of a certain item you can get at a time
Config.MaxItemReceivedQty = 2 -- Max amount of a certain item you can get at a time

Config.Circles = 2 -- How many Circles should they complete?
Config.HackTime = 10 -- How Quick the Circles should be

Config.CoolDown = 1 -- Cooldown in minutes 