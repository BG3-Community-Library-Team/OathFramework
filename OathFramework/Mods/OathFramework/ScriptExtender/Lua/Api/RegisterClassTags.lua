--- Registers Oathbreaker Subclass Tags and Event Flags
--- @param payload table
function Api.RegisterSubclassTags(payload)
  CLUtils.Info("Entering Api.RegisterSubclassTags", Globals.InfoOverride)

  for subclassTag, tagData in pairs(payload) do
    local found, missingMods = Conditions.IsAllModsLoaded(tagData.modGuids)

    if found then
      Globals.PaladinTags[subclassTag] = {
        OathbreakerTag = tagData.OathbreakerTag,
        OathBrokenEventFlag = tagData.SubclassOathBrokenEventFlag
      }
    else
      CLUtils.Warn(Strings.WARN_MODS_NOT_FOUND .. table.concat(missingMods, ", "))
    end
  end
end
