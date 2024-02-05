function Utils.InstantiateGlobalField(arr, field)
  if not arr[field] then
    arr[field] = {}
  end
end

function Utils.GetClassFromSubclassTagAndCharacter(character, subclassTag)
  for _, class in pairs(character.Classes) do
    local subclassData = CLUtils.CacheOrRetrieve(class.SubClassUUID)

    for _, tag in pairs(subclassData.Tags) do
      if string.sub(subclassTag, -36) == tag then
        return Ext.StaticData.Get(subclassData.ParentGuid).Name
      end
    end
  end
end
