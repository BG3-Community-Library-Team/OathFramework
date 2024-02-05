function Utils.InstantiateGlobalField(arr, field)
  if not arr[field] then
    arr[field] = {}
  end
end

function Utils.GetClassFromSubclassTagAndCharacter(character, subclassTag)
  for _, class in pairs(character.Classes.Classes) do
    local subclassData = CLUtils.CacheOrRetrieve(class.SubClassUUID, "ClassDescription")
    if subclassData then
      for _, tag in pairs(subclassData.Tags) do
        if string.sub(subclassTag, -36) == tag then
          return CLUtils.CacheOrRetrieve(subclassData.ParentGuid, "ClassDescription").Name
        end
      end
    end
  end
end
