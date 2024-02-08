function Actions.RegisterSubclassTags(subclassTag, tagData)
  Globals.PaladinTags[subclassTag] = {
    OathbreakerTag = tagData.OathbreakerTag,
    OathBrokenEventFlag = tagData.SubclassOathBrokenEventFlag,
    CrimesToReact = tagData.CrimesToReact
  }

end
