function Conditions.IsClassTagValid(classTag)
  local fleshedClassTag = Ext.StaticData.Get(classTag, "Tag")
  local res = false
  if fleshedClassTag then
    res = true
  else
    CLUtils.Error(Strings.ERR_ClassTagInvalid .. classTag)
  end

  return res
end
