Globals = {}
OF = {}
OF.UUID = "0119681e-9ea0-4b24-8009-bc13da121229"
OF.modTableKey = "OathFramework"
OF.modPrefix = "OF"
OF.modVersion = Ext.Mod.GetMod(OF.UUID).Info.ModVersion

Mods.OF = Mods.OathFramework
Globals.InfoOverride = false

local clImports = {}
clImports[1] = "Globals"
clImports[2] = "Utils"

CLGlobals, CLUtils = Mods.CommunityLibrary.Import(clImports)

-- We're going to handle Clerics and Warlocks eventually. For now, we'll just do Paladins
Globals.PaladinTags = {}

-- Globals.ClericEvents = {}
-- Globals.WarlockEvents = {}

Globals.EventFnType = {
  Break = "BreakOath",
  Redeem = "RedeemOath"
}
