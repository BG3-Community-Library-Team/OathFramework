function Conditions.DoesCharacterHaveClass(character, subclassTag)
  local res = false
  for _, class in pairs(character.Classes.Classes) do
    local subclassData = CLUtils.CacheOrRetrieve(class.SubClassUUID, "ClassDescription")
    if subclassData then
      for _, tag in pairs(subclassData.Tags) do
        if string.sub(subclassTag, -36) == tag then
          res = true
        end
      end
    end
  end

  if not res then
    CLUtils.Error(Strings.ERR_CharacterDoesNotHaveClass)
  end

  return res
end
