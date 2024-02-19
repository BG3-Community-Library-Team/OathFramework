Globals = {}

ModuleUUID = "f633f957-e650-490d-aa20-62fa8db33db6"
ModTableKey = "OathFramework"
ModPrefix = "OF"
ModVersion = Ext.Mod.GetMod(ModuleUUID).Info.ModVersion

Mods[ModPrefix] = Mods.OathFramework
Globals.InfoOverride = false

local clImports = {}
clImports[1] = "Globals"
clImports[2] = "Utils"

CLGlobals, CLUtils = Mods.CommunityLibrary.Import(clImports)

-- Just in case Import Breaks
if not CLUtils and not CLGlobals then
  Ext.Utils.PrintWarning("CLGlobals and CLUtils failed to Import, manually setting...")
  CLUtils = Mods.CL.Utils
  CLGlobals = Mods.Cl.Globals
end


-- We're going to handle Clerics and Warlocks eventually. For now, we'll just do Paladins
Globals.PaladinTags = {}

-- Globals.ClericEvents = {}
-- Globals.WarlockEvents = {}
