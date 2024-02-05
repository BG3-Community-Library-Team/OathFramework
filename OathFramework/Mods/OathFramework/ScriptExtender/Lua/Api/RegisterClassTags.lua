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

      -- Register Connections within the DB
      Osi.DB_GLO_PaladinOathbreaker_SubclassTags(subclassTag, tagData.OathbreakerTag)
      Osi.DB_GLO_PaladinOathbreaker_SubclassOathBrokenFlags(tagData.SubclassOathBrokenEventFlag, subclassTag)

      -- Register Generic Crimes
      for _, crime in pairs(Osi.DB_GLO_PaladinOathbreaker_GenericCrimes:Get(_)) do
        Osi.DB_GLO_PaladinOathbreaker_CrimesToReact(subclassTag, crime[1],
          "CIVILIAN_71120d5d-3853-46e4-9762-33f59aa6b4ae")
        Osi.DB_GLO_PaladinOathbreaker_CrimesToReact(subclassTag, crime[1],
          "CROWDSYS_NPC_1274ffab-2fa2-4d6f-801e-751664ceb771")
        Osi.DB_GLO_PaladinOathbreaker_CrimesToReact(subclassTag, crime[1], "KID_ee978587-6c68-4186-9bfc-3b3cc719a835")
        Osi.DB_GLO_PaladinOathbreaker_CrimesToReact(subclassTag, crime[1], "GUARD_0b52f35e-fb1f-4865-bcd2-5d21ef7343cd")
      end
    else
      CLUtils.Warn(Strings.WARN_MODS_NOT_FOUND .. table.concat(missingMods, ", "))
    end
  end
end
