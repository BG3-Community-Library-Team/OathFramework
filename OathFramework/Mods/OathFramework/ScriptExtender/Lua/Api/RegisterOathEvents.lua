--[[
Payloads = {
  Payload = {
    modGuids = {""},
    Tag = "",
    Events = {
      {
        EventType = "Break/Redeem",
        ClassTag = "", -- Subclass tag ID (TagName_TagUUID)
        ListenEvent = "FlagSet", -- Most common. May also be a DB check, or other condition.
        Params = {},
        Conditions = {
          ConditionFn = function,
          Params = {}
        }
      }
    }
  }
}
]]

--- Registers the Oath Events to Globals.PaladinEvents
--- @param payload any
function Api.RegisterOathEvents(payload)
  CLUtils.Info("Entering Api.ImportBackgrounds", Globals.InfoOverride)
  local found, missingMods = Conditions.IsAllModsLoaded(payload.modGuids)
  if found then
    Utils.InstantiateGlobalField(Globals.PaladinTags, payload.Tag)


  else
    CLUtils.Warn(Strings.WARN_MODS_NOT_FOUND .. table.concat(missingMods, ","))
  end
end
