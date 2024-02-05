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
    Utils.InstantiateGlobalField(Globals.PaladinTags, payload.SubclassTagId)

    Actions[payload.EventType].Handler(payload.CharacterId, payload.SubclassTagId)
  else
    CLUtils.Warn(Strings.WARN_MODS_NOT_FOUND .. table.concat(missingMods, ","))
  end
end
