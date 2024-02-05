Actions.Redeem = {}

function Actions.Redeem.Handler(characterId, subclassTag)
  CLUtils.Info("Entering Actions.Break", Globals.InfoOverride)
  local character = Ext.Entity.Get(characterId)

  if Conditions.IsClassTagValid(subclassTag) and Conditions.IsSubclassTagRegistered(subclassTag) and
    Conditions.DoesCharacterHaveClass(character, subclassTag) then
    local class = Utils.GetClassFromSubclassTagAndCharacter(character, subclassTag)

    Actions.Redeem[class](characterId)
  end
end

function Actions.Redeem.Paladin(characterId)
  Osi.PROC_GLO_PaladinOathbreaker_RedemptionObtained(characterId)
end

function Actions.Redeem.Cleric(characterId)
  CLUtils.Warn(Strings.WARN_SUBCLASS_NOT_SUPPORTED)
  -- TODO
end

function Actions.Redeem.Warlock(characterId)
  -- TODO
  CLUtils.Warn(Strings.WARN_SUBCLASS_NOT_SUPPORTED)
end
