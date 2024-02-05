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

```sql
DB_GLO_PaladinOathbreaker_SubclassOathBrokenFlags("GLO_PaladinOathbreaker_Event_VengeanceBrokeOath_1510bcc9-e974-4789-b1fa-4612f92f30a1", "PALADIN_VENGEANCE_a1aa47b2-4d0a-4c97-931b-2c53353d5b23");
DB_GLO_PaladinOathbreaker_SubclassTags"(PALADIN_VENGEANCE_a1aa47b2-4d0a-4c97-931b-2c53353d5b23", "OATHBREAKER_VENGEANCE_732db1ed-740c-4af3-8a08-7f135d3f703c");
DB_GLO_PaladinOathbreaker_EvilTags("KOBOLD_f68151f2-58ee-42e6-98ad-7d858c4a0f13");
```

```sql
IF
DB_GLO_PaladinOathbreaker_GenericCrimes(_Var1)
THEN
DB_GLO_PaladinOathbreaker_CrimesToReact("PALADIN_VENGEANCE_a1aa47b2-4d0a-4c97-931b-2c53353d5b23", _Var1, "CIVILIAN_71120d5d-3853-46e4-9762-33f59aa6b4ae");
DB_GLO_PaladinOathbreaker_CrimesToReact("PALADIN_VENGEANCE_a1aa47b2-4d0a-4c97-931b-2c53353d5b23", _Var1, "CROWDSYS_NPC_1274ffab-2fa2-4d6f-801e-751664ceb771");
DB_GLO_PaladinOathbreaker_CrimesToReact("PALADIN_VENGEANCE_a1aa47b2-4d0a-4c97-931b-2c53353d5b23", _Var1, "KID_ee978587-6c68-4186-9bfc-3b3cc719a835");
DB_GLO_PaladinOathbreaker_CrimesToReact("PALADIN_VENGEANCE_a1aa47b2-4d0a-4c97-931b-2c53353d5b23", _Var1, "GUARD_0b52f35e-fb1f-4865-bcd2-5d21ef7343cd");
```

```sql
PROC
PROC_DEN_CapturedGoblin_TryBreakOath((CHARACTER)_Var1)
AND
DB_Players(_Var1)
THEN
SetFlag("GLO_PaladinOathbreaker_Event_VengeanceBrokeOath_1510bcc9-e974-4789-b1fa-4612f92f30a1", _Var1);
```
```sql
DB_GLO_PaladinOathbreaker_SinsAndCrimeTypes("KilledProtectedNPC");
DB_GLO_PaladinOathbreaker_GenericCrimes("Murder");
DB_GLO_PaladinOathbreaker_GenericCrimes("GuardKiller");
NOT DB_GLO_PaladinOathbreaker_ProtectedNPCs(NULL_00000000-0000-0000-0000-000000000000, NULL_00000000-0000-0000-0000-000000000000);
NOT DB_GLO_PaladinOathbreaker_ProtectedNPCs(NULL_00000000-0000-0000-0000-000000000000);
DB_GLO_PaladinOathbreaker_SubclassTags(PALADIN_ANCIENTS_7c89622b-4194-41df-b2ff-145a5056ee49, OATHBREAKER_ANCIENTS_d84a8a0b-b648-464c-9bd5-1ed9b965da2a);
DB_GLO_PaladinOathbreaker_SubclassTags(PALADIN_DEVOTION_2de0a4fc-5831-4439-94d3-a7ff9b7aacf6, OATHBREAKER_DEVOTION_d274b482-4add-4f36-a0a4-a94740f6630e);
DB_GLO_PaladinOathbreaker_SubclassOathBrokenFlags(GLO_PaladinOathbreaker_Event_AncientsBrokeOath_7cf0bd9c-f089-45a3-88fb-03087d3d8b95, PALADIN_ANCIENTS_7c89622b-4194-41df-b2ff-145a5056ee49);
DB_GLO_PaladinOathbreaker_SubclassOathBrokenFlags(GLO_PaladinOathbreaker_Event_DevotionBrokeOath_fd2e1a9a-bca6-482e-8b42-2f1c16aaefee, PALADIN_DEVOTION_2de0a4fc-5831-4439-94d3-a7ff9b7aacf6);
DB_GLO_PaladinOathbreaker_EvilTags(PALADIN_BLOCK_OATHBREAK_b5825091-f2ed-4657-8d86-c0d020c358a0);
DB_GLO_PaladinOathbreaker_EvilTags(GOBLIN_608597d9-bf00-4ede-aabe-767457280925);
DB_GLO_PaladinOathbreaker_EvilTags(HOBGOBLIN_193938c4-ed1c-4648-af3f-f4b59152ec92);
NOT DB_GLO_PaladinOathbreaker_LinkedDialogues(NULL_00000000-0000-0000-0000-000000000000);
```

```sql
DB_GLO_PaladinOathbreaker_SubclassTags(PALADIN_ANCIENTS_7c89622b-4194-41df-b2ff-145a5056ee49, OATHBREAKER_ANCIENTS_d84a8a0b-b648-464c-9bd5-1ed9b965da2a);
DB_GLO_PaladinOathbreaker_SubclassTags(PALADIN_DEVOTION_2de0a4fc-5831-4439-94d3-a7ff9b7aacf6, OATHBREAKER_DEVOTION_d274b482-4add-4f36-a0a4-a94740f6630e);

```


```sql
IF
FlagSet(GLO_PaladinOathbreaker_Event_BrokeOath_0246da96-5ef8-4c65-9f0d-c2856bd17674, (CHARACTER)_Var1, (INTEGER)_Var2)
AND
IsTagged(_Var1, PALADIN_6d85ab2d-5c23-498c-a61e-98f05a00177a, 1)
THEN
PROC_GLO_PaladinOathbreaker_BrokeOath(_Var1, _Var2);
```


`PROC_GLO_PaladinOathbreaker_RedemptionObtained()` - Redeems you - respec ui

`FlagSet(GLO_PaladinOathbreaker_State_AboutToBecomeOathbreaker_3ad5db08-0191-4308-b127-ad1cdc6f8718, (CHARACTER)_Var1, _)`
or `PROC_ORI_SetupCamp(S_GLO_OathbreakerKnight_3939625d-86cc-4395-9d50-4f8b846c4231);` - Needed for Oathbreaker Knight to come to camp