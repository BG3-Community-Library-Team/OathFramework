--- Register crimes with GLO_PaladinOathbreaker_CrimesToReact DB
--- @param subclassTag string NAME_UUID of Paladin Subclass Tag
--- @param crime string Name of Crime
function Actions.RegisterCrimes(subclassTag, crime)
  Osi.DB_GLO_PaladinOathbreaker_CrimesToReact(subclassTag, crime, "CIVILIAN_71120d5d-3853-46e4-9762-33f59aa6b4ae")
  Osi.DB_GLO_PaladinOathbreaker_CrimesToReact(subclassTag, crime, "CROWDSYS_NPC_1274ffab-2fa2-4d6f-801e-751664ceb771")
  Osi.DB_GLO_PaladinOathbreaker_CrimesToReact(subclassTag, crime, "KID_ee978587-6c68-4186-9bfc-3b3cc719a835")
  Osi.DB_GLO_PaladinOathbreaker_CrimesToReact(subclassTag, crime, "GUARD_0b52f35e-fb1f-4865-bcd2-5d21ef7343cd")
end
