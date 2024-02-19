local function CLCheck()
  local IsCLLoaded = false
  local IsCLGoodVersion = false

  if Ext.Mod.IsModLoaded("396c5966-09b0-40a1-af3f-93a5e9ce71c0") then
    IsCLLoaded = true
    local CLVersion = Ext.Mod.GetMod("396c5966-09b0-40a1-af3f-93a5e9ce71c0").Info.ModVersion
    if CLVersion[1] < 2 and CLVersion[2] < 2 then
      Ext.Utils.PrintError(Strings.ERR_CLWrongVersion .. table.concat(CLVersion, "."))
    else
      IsCLGoodVersion = true
    end
  else
    Ext.Utils.PrintError(Strings.ERR_CLNotDetected)
  end

  return IsCLLoaded and IsCLGoodVersion
end


if CLCheck() then
  Ext.Require("Globals.lua")
  Ext.Require("Strings.lua")
  Ext.Require("Utils/_init.lua")
  Ext.Require("Conditions/_init.lua")
  Ext.Require("Actions/_init.lua")
  Ext.Require("Listeners/_init.lua")
  Ext.Require("Api/_init.lua")
  Ext.Require("JsonLoader.lua")

  LoadConfigFiles()
end
