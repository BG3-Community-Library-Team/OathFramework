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
Globals.PaladinTags = {
  {
    Tag = "",
    Events = {
      {
        ListenEvent = "FlagSet",
        Params = { -- we'll pass this in _and_ use it to calculate arity
          FlagId = ""
        },
        Conditions = {},
        EventType = "Break/Redeem"
      }
    }
  }
}

Globals.ClericTags = {}
Globals.WarlockTags = {}

Globals.EventType = {
  Break = "Break",
  Redeem = "Redeem"
}
