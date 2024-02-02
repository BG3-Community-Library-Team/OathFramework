`DB_GLO_PaladinOathbreaker_ProtectedNPCs`
`PROC_GLO_PaladinOathbreaker_BrokeOath`
`QRY_GLO_PaladinOathbreaker_WillBecomeOathbreaker`
`GetFlag(GLO_PaladinOathbreaker_State_AboutToBecomeOathbreaker_3ad5db08-0191-4308-b127-ad1cdc6f8718, _Var1, 1)`
`SetFlag(GLO_PaladinOathbreaker_Event_BrokeOath_0246da96-5ef8-4c65-9f0d-c2856bd17674, _Var1);`

I think Oath Framework is going to be even more simple than Inspiration Framework was

`DB_GLO_PaladinOathbreaker_ProtectedNPCs`
```json
[
        [
                "PALADIN_DEVOTION_2de0a4fc-5831-4439-94d3-a7ff9b7aacf6",
                "S_FOR_Courier_Dog_3059f69c-068d-4e28-8491-55953c027901"
        ],
        [
                "PALADIN_ANCIENTS_7c89622b-4194-41df-b2ff-145a5056ee49",
                "S_FOR_Courier_Dog_3059f69c-068d-4e28-8491-55953c027901"
        ],
        [
                "PALADIN_VENGEANCE_a1aa47b2-4d0a-4c97-931b-2c53353d5b23",
                "S_FOR_Courier_Dog_3059f69c-068d-4e28-8491-55953c027901"
        ]
]
```
The only entries when the game starts

```sql
IF
FlagSet(HAG_Hag_State_HagTookMother_38dc6752-5ab3-e108-64ed-fe63971d69fd, _, (INTEGER)_Var2)
AND
DB_DialogPlayers(_Var2, _Var3, 1)
AND
IsTagged(_Var3, PALADIN_DEVOTION_2de0a4fc-5831-4439-94d3-a7ff9b7aacf6, 1)
THEN
PROC_GLO_PaladinOathbreaker_BrokeOath(_Var3);
```

Translates to Something something:
```lua
Ext.Osiris.RegisterListener("FlagSet", 3, "after", function(flag, objectUUID, dialogInstance)
  characters = Osi.DB_DialogPlayers:Get(dialogInstance, _, 1)
  for _, character in pairs(characters) do
    if IsTagged(character[1], "PALADIN_DEVOTION_2de0a4fc-5831-4439-94d3-a7ff9b7aacf6") then
      Osi.PROC_GLO_PaladinOathbreaker_BrokeOath(character[1])
    end
  end
end)
```

Hrm wonder if this is even worth a framework lol. I guess I could just make listener generator that's fed data(Subclass tag ID,  function to listen for, params needed, specific conditions to check for, etc), through the API
Literally all that (should) be needed is "Conditions met? Cool you broke your oath" 😂
Guess I need to actually test it now though