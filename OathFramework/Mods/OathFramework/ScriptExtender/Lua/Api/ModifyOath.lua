--[[
Payload = {
  modGuids = {"",""}
  CharacterId = "",
  SubclassTagId = "",
  EventType = ""
}
]]

function Api.ModifyOath(payload)
  CLUtils.Info("Entering Api.ModifyOath", Globals.InfoOverride)
  local modsLoaded, missingMods = Conditions.IsAllModsLoaded(payload.modGuids)
  if modsLoaded then
    CLUtils.Info("Modifying Oath: " .. payload.EventType .. " Oath " .. Ext.StaticData.Get("SubclassTagId", "Tag").Name .. " for character ID: " .. payload.CharacterId .. ". Request sent from mod " .. table.concat(payload.modGuids, ", "))
    Utils.InstantiateGlobalField(Globals.PaladinTags, payload.SubclassTagId)

    Actions[payload.EventType].Handler(payload.CharacterId, payload.SubclassTagId)
  else
    CLUtils.Warn(Strings.WARN_MODS_NOT_FOUND .. table.concat(missingMods, ","))
  end
end
