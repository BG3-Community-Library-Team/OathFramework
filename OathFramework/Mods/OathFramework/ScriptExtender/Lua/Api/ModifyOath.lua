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
    Utils.InstantiateGlobalField(Globals.PaladinTags, payload.Tag)

    Actions[Globals.EventFnType[payload.EventType]].Handler(payload.CharacterId, payload.ClassTag)
  else
    CLUtils.Warn(Strings.WARN_MODS_NOT_FOUND .. table.concat(missingMods, ","))
  end
end
