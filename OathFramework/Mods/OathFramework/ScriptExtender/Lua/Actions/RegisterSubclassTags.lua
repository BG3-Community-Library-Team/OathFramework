function Actions.RegisterSubclassTags(subclassTag, tagData)
  Globals.PaladinTags[subclassTag] = {
    OathbreakerTag = tagData.OathbreakerTag,
    OathBrokenEventFlag = tagData.SubclassOathBrokenEventFlag
  }

  -- Register Connections within the DB
  Osi.DB_GLO_PaladinOathbreaker_SubclassTags(subclassTag, tagData.OathbreakerTag)
  Osi.DB_GLO_PaladinOathbreaker_SubclassOathBrokenFlags(tagData.SubclassOathBrokenEventFlag, subclassTag)

  -- Register Generic Crimes
  for _, crime in pairs(Osi.DB_GLO_PaladinOathbreaker_GenericCrimes:Get(_)) do
    Actions.RegisterCrimes(subclassTag, crime[1])
  end

  -- Register Payload-Provided Crimes
  for _, crime in pairs(tagData.CrimesToReact) do
    Actions.RegisterCrimes(subclassTag, crime)
  end
end
