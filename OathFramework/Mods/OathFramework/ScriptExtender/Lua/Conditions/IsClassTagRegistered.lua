function Conditions.IsSubclassTagRegistered(subclassTag)
  local res = false

  for tag, _ in pairs(Globals.PaladinTags) do
    if tag == subclassTag then
      res = true
    end
  end

  if not res then
    CLUtils.Error(Strings.ERR_ClassTagNotRegistered)
  end

  return res
end
