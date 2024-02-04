--- Generate an Osiris Listener based on a given function name and parameters,
--- conditions, and a function to fire when all conditions are met.
--- @param ListenFnName string name of Osiris Event/Function/DB to listen for
--- @param params table Table of parameter names that must be passed via the listener 
--- @param conditionFns table Table of Conditional Functions and their Parameters
--- @param doFn function Function to fire when Conditions are met.
function Actions.GenerateListener(ListenFnName, params, conditionFns, doFn)
  local function anonFn(...)
    local res = true
    for _, condition in pairs(conditionFns) do
      if not condition.conditionFn(table.unpack(arg)) then
        res = false
      end
    end

    if res then
      -- We only need the Character ID, but we need a way to ensure we have the character ID
      Actions[Globals.EventFnType[doFn]](params)
    end
  end

  Ext.Osiris.RegisterListener(ListenFnName, #params, "after", anonFn(table.unpack(params)))
end
