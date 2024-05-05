Ext.Osiris.RegisterListener("LevelGameplayStarted", 2, "after", function (_, _)
  CLUtils.Info("Entering LevelGameplayStarted Listener", Globals.InfoOverride)
  for tagName, tagData in pairs(Globals.PaladinTags) do
    -- Register Connections within the DB
    Osi.DB_GLO_PaladinOathbreaker_SubclassTags(tagName, tagData.OathbreakerTag)
    Osi.DB_GLO_PaladinOathbreaker_SubclassOathBrokenFlags(tagData.OathBrokenEventFlag, tagName)

    -- Register Generic Crimes
    for _, crime in pairs(Osi.DB_GLO_PaladinOathbreaker_GenericCrimes:Get(_)) do
      Actions.RegisterCrimes(tagName, crime[1])
    end

    -- Register Payload-Provided Crimes
    for _, crime in pairs(tagData.CrimesToReact) do
      Actions.RegisterCrimes(tagName, crime)
    end
  end
end)
