Ext.Osiris.RegisterListener("FlagSet", 3, "after", function (flag, objectUUID, dialogInstance)
  local characters = Osi.DB_DialogPlayers:Get(dialogInstance, _, 1)
  for _, character in pairs(characters) do
    -- HandlePaladinOath(character)
    -- Loop through Paladin Tags,
    if Osi.IsTagged(character[1], "PALADIN_DEVOTION_2de0a4fc-5831-4439-94d3-a7ff9b7aacf6") then
      Osi.PROC_GLO_PaladinOathbreaker_BrokeOath(character[1])
    end
  end
end)

