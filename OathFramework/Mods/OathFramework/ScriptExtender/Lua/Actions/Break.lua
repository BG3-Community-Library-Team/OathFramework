Actions.Break = {}

function Actions.Break.Handler(characterId, subclassTag)
  CLUtils.Info("Entering Actions.Break", Globals.InfoOverride)
  local character = Ext.Entity.Get(characterId)

  if Conditions.IsClassTagValid(subclassTag) and Conditions.IsSubclassTagRegistered(subclassTag) and
    Conditions.DoesCharacterHaveClass(character, subclassTag) then
    local class = Utils.GetClassFromSubclassTagAndCharacter(character, subclassTag)

    Actions.Break[class](characterId, subclassTag)
  end
end

function Actions.Break.Paladin(characterId, subclassTag)
  if Osi.IsTagged(characterId, subclassTag) then
    Osi.PROC_GLO_PaladinOathbreaker_BrokeOath(characterId)
    Osi.PROC_ORI_SetupCamp("S_GLO_OathbreakerKnight_3939625d-86cc-4395-9d50-4f8b846c4231")
  end
end

function Actions.Break.Cleric(characterId, subclassTag)
  CLUtils.Warn(Strings.WARN_SUBCLASS_NOT_SUPPORTED)
  -- TODO
end

function Actions.Break.Warlock(characterId, subclassTag)
  -- TODO
  CLUtils.Warn(Strings.WARN_SUBCLASS_NOT_SUPPORTED)
end
