local ConROC_Mage, ids = ...;

--General
ids.Racial = {
	Berserking = 20554,
	EscapeArtist = 20589,
	Perception = 20600,
}
ids.Spec = {
	Arcane = 1,
	Fire = 2,
	Frost = 3,
}
ids.Caster = {
	Shoot = 5019,
}
ids.Ability = {
--Arcane
	AmplifyMagic = 1008,
	ArcaneBrilliance = 23028,
	ArcaneExplosion = 1449,
	ArcaneIntellect = 1459,
	ArcaneMissiles = 5143,
	ArcanePower = 12042,
	Blink = 1953,
	ConjureFood = 587,
	ConjureManaAgate = 759,
	ConjureManaJade = 3552,
	ConjureManaCitrine = 10053,
	ConjureManaRuby = 10054,
	ConjureWater = 5504,
	Counterspell = 2139,
	DampenMagic = 604,
	DetectMagic = 2855,
	Evocation = 12051,
	MageArmor = 6117,
	ManaShield = 1463,
	RemoveLesserCurse = 475,
	SlowFall = 130,
	Polymorph = 118,
	PresenceofMind = 12043,
--Fire
	BlastWave = 11113,
	Combustion = 11129,
	FireBlast = 2136,
	FireWard = 543,
	Fireball = 133,
	Flamestrike = 2120,
	FlamestrikeDR = 2120,
	Pyroblast = 11366,
	Scorch = 2948,
--Frost
	Blizzard = 10,
	ColdSnap = 12472,
	ConeofCold = 120,
	FrostNova = 122,
	FrostWard = 6143,
	Frostbolt = 116,
	IceBarrier = 11426,
	IceBlock = 11958,
	IceArmor = 168,
}
ids.Rank = {
--Arcane
	AmplifyMagicRank1 = 1008,
	AmplifyMagicRank2 = 8455,
	AmplifyMagicRank3 = 10169,
	AmplifyMagicRank4 = 10170,
	ArcaneExplosionRank1 = 1449,
	ArcaneExplosionRank2 = 8437,
	ArcaneExplosionRank3 = 8438,
	ArcaneExplosionRank4 = 8439,
	ArcaneExplosionRank5 = 10201,
	ArcaneExplosionRank6 = 10202,
	ArcaneIntellectRank1 = 1459,
	ArcaneIntellectRank2 = 1460,
	ArcaneIntellectRank3 = 1461,
	ArcaneIntellectRank4 = 10156,
	ArcaneIntellectRank5 = 10157,
	ArcaneMissilesRank1 = 5143,
	ArcaneMissilesRank2 = 5144,
	ArcaneMissilesRank3 = 5145,
	ArcaneMissilesRank4 = 8416,
	ArcaneMissilesRank5 = 8417,
	ArcaneMissilesRank6 = 10211,
	ArcaneMissilesRank7 = 10212,
	ConjureFoodRank1 = 587,
	ConjureFoodRank2 = 597,
	ConjureFoodRank3 = 990,
	ConjureFoodRank4 = 6129,
	ConjureFoodRank5 = 10144,
	ConjureFoodRank6 = 10145,
	ConjureFoodRank7 = 28612,
	ConjureWaterRank1 = 5504,
	ConjureWaterRank2 = 5505,
	ConjureWaterRank3 = 5506,
	ConjureWaterRank4 = 6127,
	ConjureWaterRank5 = 10138,
	ConjureWaterRank6 = 10139,
	ConjureWaterRank7 = 10140,
	DampenMagicRank1 = 604,
	DampenMagicRank2 = 8450,
	DampenMagicRank3 = 8451,
	DampenMagicRank4 = 10173,
	DampenMagicRank5 = 10174,
	MageArmorRank1 = 6117,
	MageArmorRank2 = 22782,
	MageArmorRank3 = 22783,
	ManaShieldRank1 = 1463,
	ManaShieldRank2 = 8494,
	ManaShieldRank3 = 8495,
	ManaShieldRank4 = 10191,
	ManaShieldRank5 = 10192,
	ManaShieldRank6 = 10193,
	PolymorphRank1 = 118,
	PolymorphRank2 = 12824,
	PolymorphRank3 = 12825,
	PolymorphRank4 = 12826,
--Fire
	BlastWaveRank1 = 11113,
	BlastWaveRank2 = 13018,
	BlastWaveRank3 = 13019,
	BlastWaveRank4 = 13020,
	BlastWaveRank5 = 13021,
	FireBlastRank1 = 2136,
	FireBlastRank2 = 2137,
	FireBlastRank3 = 2138,
	FireBlastRank4 = 8412,
	FireBlastRank5 = 8413,
	FireBlastRank6 = 10197,
	FireBlastRank7 = 10199,
	FireBlastSoDRank1 = 400618,
	FireBlastSoDRank2 = 400619,
	FireBlastSoDRank3 = 400616,
	FireBlastSoDRank4 = 400620,
	FireBlastSoDRank5 = 400621,
	FireBlastSoDRank6 = 400622,
	FireBlastSoDRank7 = 400623,
	FireWardRank1 = 543,
	FireWardRank2 = 8457,
	FireWardRank3 = 8458,
	FireWardRank4 = 10223,
	FireWardRank5 = 10225,
	FireballRank1 = 133,
	FireballRank2 = 143,
	FireballRank3 = 145,
	FireballRank4 = 3140,
	FireballRank5 = 8400,
	FireballRank6 = 8401,
	FireballRank7 = 8402,
	FireballRank8 = 10148,
	FireballRank9 = 10149,
	FireballRank10 = 10150,
	FireballRank11 = 10151,
	FlamestrikeRank1 = 2120,
	FlamestrikeRank2 = 2121,
	FlamestrikeRank3 = 8422,
	FlamestrikeRank4 = 8423,
	FlamestrikeRank5 = 10215,
	FlamestrikeRank6 = 10216,
	PyroblastRank1 = 11366,
	PyroblastRank2 = 12505,
	PyroblastRank3 = 12522,
	PyroblastRank4 = 12523,
	PyroblastRank5 = 12524,
	PyroblastRank6 = 12525,
	PyroblastRank7 = 12526,
	PyroblastRank8 = 18809,
	ScorchRank1 = 2948,
	ScorchRank2 = 8444,
	ScorchRank3 = 8445,
	ScorchRank4 = 8446,
	ScorchRank5 = 10205,
	ScorchRank6 = 10206,
	ScorchRank7 = 10207,
--Frost
	BlizzardRank1 = 10,
	BlizzardRank2 = 6141,
	BlizzardRank3 = 8427,
	BlizzardRank4 = 10185,
	BlizzardRank5 = 10186,
	BlizzardRank6 = 10187,
	ConeofColdRank1 = 120,
	ConeofColdRank2 = 8492,
	ConeofColdRank3 = 10159,
	ConeofColdRank4 = 10160,
	ConeofColdRank5 = 10161,
	FrostArmorRank1 = 168,
	FrostArmorRank2 = 7300,
	FrostArmorRank3 = 7301,
	FrostNovaRank1 = 122,
	FrostNovaRank2 = 865,
	FrostNovaRank3 = 6131,
	FrostNovaRank4 = 10230,
	FrostWardRank1 = 6143,
	FrostWardRank2 = 8461,
	FrostWardRank3 = 8462,
	FrostWardRank4 = 10177,
	FrostWardRank5 = 28609,
	FrostboltRank1 = 116,
	FrostboltRank2 = 205,
	FrostboltRank3 = 837,
	FrostboltRank4 = 7322,
	FrostboltRank5 = 8406,
	FrostboltRank6 = 8407,
	FrostboltRank7 = 8408,
	FrostboltRank8 = 10179,
	FrostboltRank9 = 10180,
	FrostboltRank10 = 10181,
	FrostboltRank11 = 25304,
	IceBarrierRank1 = 11426,
	IceBarrierRank2 = 13031,
	IceBarrierRank3 = 13032,
	IceBarrierRank4 = 13033,
	IceArmorRank1 = 7302,
	IceArmorRank2 = 7320,
	IceArmorRank3 = 10219,
	IceArmorRank4 = 10220,
}
ids.Arcane_Talent = {
	ArcaneSubtlety =  1,
	ArcaneConcentration =  2,
	ArcaneFocus =  3,
	ArcaneMind =  4,
	WandSpecialization =  5,
	ImprovedArcaneMissiles =  6,
	ImprovedArcaneExplosion =  7,
	MagicAttunement =  8,
	ImprovedManaShield =  9,
	ArcaneResilience =  10,
	PresenceofMind =  11,
	ArcanePower =  12,
	ImprovedCounterspell =  13,
	ArcaneInstability =  14,
	ArcaneMeditation =  15,
	MagicAbsorption =  16,
}
ids.Fire_Talent = {
	BurningSoul =  1,
	ImprovedFireWard =  2,
	ImprovedScorch =  3,
	ImprovedFireball =  4,
	ImprovedFireBlast =  5,
	FlameThrowing =  6,
	Pyroblast =  7,
	Impact =  8,
	ImprovedFlamestrike =  9,
	BlastWave =  10,
	CriticalMass =  11,
	Ignite =  12,
	FirePower =  13,
	Combustion =  14,
	Incinerate =  15,
	MasterofElements =  16,
}
ids.Frost_Talent = {
	ImprovedFrostbolt =  1,
	Frostbite =  2,
	PiercingIce =  3,
	ImprovedFrostNova =  4,
	ImprovedBlizzard =  5,
	ImprovedConeofCold =  6,
	Permafrost =  7,
	FrostChanneling =  8,
	Shatter =  9,
	WintersChill =  10,
	ColdSnap =  11,
	FrostWarding =  12,
	IceBarrier =  13,
	IceBlock =  14,
	IceShards =  15,
	ArcticReach =  16,
	ElementalPrecision =  17,
}
ids.Engrave = {
	--Cloak--
	Overheat = 6734,
}
ids.Runes = {
	ArcaneSurge = 425124,
	FrostfireBolt = 401502,
	FrozenOrb = 440802,
	IceLance = 400640,
	MoltenArmor = 428741,

	ArcaneBlast = 400574,
	IcyVeins = 425121,
	LivingBomb = 400613,
	LivingFlame = 401556,
	MassRegeneration = 412510,
	Regeneration = 401417,
	RewindTime = 401462,
	MissileBarrage = 400589, --Phase 2 - Buff
	SpellfrostBolt = 412532, --Phase 2 - Debuff
	ChronostaticPreservation_Store = 425187, --Phase 2
	ChronostaticPreservation_Heal = 436517, --Phase 2
}
-- Auras
ids.Buff = {
	TemporalBeacon = 400735,
	FingersofFrost = 400647,
}
ids.Debuff = {
	Chilled = 6136,
	FireVulnerability = 22959,
	WintersChill = 12579,
	LivingFlame = 401558,
}

function ConROC:UpdateSpellID()
	--Ranks
	if IsSpellKnown(ids.Rank.AmplifyMagicRank4) then ids.Ability.AmplifyMagic = ids.Rank.AmplifyMagicRank4;
	elseif IsSpellKnown(ids.Rank.AmplifyMagicRank3) then ids.Ability.AmplifyMagic = ids.Rank.AmplifyMagicRank3;
	elseif IsSpellKnown(ids.Rank.AmplifyMagicRank2) then ids.Ability.AmplifyMagic = ids.Rank.AmplifyMagicRank2; end

	if IsSpellKnown(ids.Rank.ArcaneExplosionRank6) then ids.Ability.ArcaneExplosion = ids.Rank.ArcaneExplosionRank6;
	elseif IsSpellKnown(ids.Rank.ArcaneExplosionRank5) then ids.Ability.ArcaneExplosion = ids.Rank.ArcaneExplosionRank5;
	elseif IsSpellKnown(ids.Rank.ArcaneExplosionRank4) then ids.Ability.ArcaneExplosion = ids.Rank.ArcaneExplosionRank4;
	elseif IsSpellKnown(ids.Rank.ArcaneExplosionRank3) then ids.Ability.ArcaneExplosion = ids.Rank.ArcaneExplosionRank3;
	elseif IsSpellKnown(ids.Rank.ArcaneExplosionRank2) then ids.Ability.ArcaneExplosion = ids.Rank.ArcaneExplosionRank2; end

	if IsSpellKnown(ids.Rank.ArcaneIntellectRank5) then ids.Ability.ArcaneIntellect = ids.Rank.ArcaneIntellectRank5;
	elseif IsSpellKnown(ids.Rank.ArcaneIntellectRank4) then ids.Ability.ArcaneIntellect = ids.Rank.ArcaneIntellectRank4;
	elseif IsSpellKnown(ids.Rank.ArcaneIntellectRank3) then ids.Ability.ArcaneIntellect = ids.Rank.ArcaneIntellectRank3;
	elseif IsSpellKnown(ids.Rank.ArcaneIntellectRank2) then ids.Ability.ArcaneIntellect = ids.Rank.ArcaneIntellectRank2; end

	if IsSpellKnown(ids.Rank.ArcaneMissilesRank7) then ids.Ability.ArcaneMissiles = ids.Rank.ArcaneMissilesRank7;
	elseif IsSpellKnown(ids.Rank.ArcaneMissilesRank6) then ids.Ability.ArcaneMissiles = ids.Rank.ArcaneMissilesRank6;
	elseif IsSpellKnown(ids.Rank.ArcaneMissilesRank5) then ids.Ability.ArcaneMissiles = ids.Rank.ArcaneMissilesRank5;
	elseif IsSpellKnown(ids.Rank.ArcaneMissilesRank4) then ids.Ability.ArcaneMissiles = ids.Rank.ArcaneMissilesRank4;
	elseif IsSpellKnown(ids.Rank.ArcaneMissilesRank3) then ids.Ability.ArcaneMissiles = ids.Rank.ArcaneMissilesRank3;
	elseif IsSpellKnown(ids.Rank.ArcaneMissilesRank2) then ids.Ability.ArcaneMissiles = ids.Rank.ArcaneMissilesRank2; end

	if IsSpellKnown(ids.Rank.DampenMagicRank5) then ids.Ability.DampenMagic = ids.Rank.DampenMagicRank5;
	elseif IsSpellKnown(ids.Rank.DampenMagicRank4) then ids.Ability.DampenMagic = ids.Rank.DampenMagicRank4;
	elseif IsSpellKnown(ids.Rank.DampenMagicRank3) then ids.Ability.DampenMagic = ids.Rank.DampenMagicRank3;
	elseif IsSpellKnown(ids.Rank.DampenMagicRank2) then ids.Ability.DampenMagic = ids.Rank.DampenMagicRank2; end

	if IsSpellKnown(ids.Rank.BlastWaveRank5) then ids.Ability.BlastWave = ids.Rank.BlastWaveRank5;
	elseif IsSpellKnown(ids.Rank.BlastWaveRank4) then ids.Ability.BlastWave = ids.Rank.BlastWaveRank4;
	elseif IsSpellKnown(ids.Rank.BlastWaveRank3) then ids.Ability.BlastWave = ids.Rank.BlastWaveRank3;
	elseif IsSpellKnown(ids.Rank.BlastWaveRank2) then ids.Ability.BlastWave = ids.Rank.BlastWaveRank2; end

	if ConROC.Seasons.IsSoD and ConROC:RuneEquipped(ids.Engrave.Overheat, "back") then
		if IsSpellKnown(ids.Rank.FireBlastRank7) then ids.Ability.FireBlast = ids.Rank.FireBlastSoDRank7;
		elseif IsSpellKnown(ids.Rank.FireBlastRank6) then ids.Ability.FireBlast = ids.Rank.FireBlastSoDRank6;
		elseif IsSpellKnown(ids.Rank.FireBlastRank5) then ids.Ability.FireBlast = ids.Rank.FireBlastSoDRank5;
		elseif IsSpellKnown(ids.Rank.FireBlastRank4) then ids.Ability.FireBlast = ids.Rank.FireBlastSoDRank4;
		elseif IsSpellKnown(ids.Rank.FireBlastRank3) then ids.Ability.FireBlast = ids.Rank.FireBlastSoDRank3;
		elseif IsSpellKnown(ids.Rank.FireBlastRank2) then ids.Ability.FireBlast = ids.Rank.FireBlastSoDRank2;
		elseif IsSpellKnown(ids.Rank.FireBlastRank1) then ids.Ability.FireBlast = ids.Rank.FireBlastSoDRank1; end
	else
		if IsSpellKnown(ids.Rank.FireBlastRank7) then ids.Ability.FireBlast = ids.Rank.FireBlastRank7;
		elseif IsSpellKnown(ids.Rank.FireBlastRank6) then ids.Ability.FireBlast = ids.Rank.FireBlastRank6;
		elseif IsSpellKnown(ids.Rank.FireBlastRank5) then ids.Ability.FireBlast = ids.Rank.FireBlastRank5;
		elseif IsSpellKnown(ids.Rank.FireBlastRank4) then ids.Ability.FireBlast = ids.Rank.FireBlastRank4;
		elseif IsSpellKnown(ids.Rank.FireBlastRank3) then ids.Ability.FireBlast = ids.Rank.FireBlastRank3;
		elseif IsSpellKnown(ids.Rank.FireBlastRank2) then ids.Ability.FireBlast = ids.Rank.FireBlastRank2; end
	end

	if IsSpellKnown(ids.Rank.FireWardRank5) then ids.Ability.FireWard = ids.Rank.FireWardRank5;
	elseif IsSpellKnown(ids.Rank.FireWardRank4) then ids.Ability.FireWard = ids.Rank.FireWardRank4;
	elseif IsSpellKnown(ids.Rank.FireWardRank3) then ids.Ability.FireWard = ids.Rank.FireWardRank3;
	elseif IsSpellKnown(ids.Rank.FireWardRank2) then ids.Ability.FireWard = ids.Rank.FireWardRank2; end

	if IsSpellKnown(ids.Rank.FireballRank11) then ids.Ability.Fireball = ids.Rank.FireballRank11;
	elseif IsSpellKnown(ids.Rank.FireballRank10) then ids.Ability.Fireball = ids.Rank.FireballRank10;
	elseif IsSpellKnown(ids.Rank.FireballRank9) then ids.Ability.Fireball = ids.Rank.FireballRank8;
	elseif IsSpellKnown(ids.Rank.FireballRank8) then ids.Ability.Fireball = ids.Rank.FireballRank9;
	elseif IsSpellKnown(ids.Rank.FireballRank7) then ids.Ability.Fireball = ids.Rank.FireballRank7;
	elseif IsSpellKnown(ids.Rank.FireballRank6) then ids.Ability.Fireball = ids.Rank.FireballRank6;
	elseif IsSpellKnown(ids.Rank.FireballRank5) then ids.Ability.Fireball = ids.Rank.FireballRank5;
	elseif IsSpellKnown(ids.Rank.FireballRank4) then ids.Ability.Fireball = ids.Rank.FireballRank4;
	elseif IsSpellKnown(ids.Rank.FireballRank3) then ids.Ability.Fireball = ids.Rank.FireballRank3;
	elseif IsSpellKnown(ids.Rank.FireballRank2) then ids.Ability.Fireball = ids.Rank.FireballRank2; end

	if IsSpellKnown(ids.Rank.FlamestrikeRank6) then ids.Ability.Flamestrike = ids.Rank.FlamestrikeRank6;
	elseif IsSpellKnown(ids.Rank.FlamestrikeRank5) then ids.Ability.Flamestrike = ids.Rank.FlamestrikeRank5;
	elseif IsSpellKnown(ids.Rank.FlamestrikeRank4) then ids.Ability.Flamestrike = ids.Rank.FlamestrikeRank4;
	elseif IsSpellKnown(ids.Rank.FlamestrikeRank3) then ids.Ability.Flamestrike = ids.Rank.FlamestrikeRank3;
	elseif IsSpellKnown(ids.Rank.FlamestrikeRank2) then ids.Ability.Flamestrike = ids.Rank.FlamestrikeRank2; end

	--down ranked Flamestrike
	if IsSpellKnown(ids.Rank.FlamestrikeRank6) then ids.Ability.FlamestrikeDR = ids.Rank.FlamestrikeRank5;
	elseif IsSpellKnown(ids.Rank.FlamestrikeRank5) then ids.Ability.FlamestrikeDR = ids.Rank.FlamestrikeRank4;
	elseif IsSpellKnown(ids.Rank.FlamestrikeRank4) then ids.Ability.FlamestrikeDR = ids.Rank.FlamestrikeRank3;
	elseif IsSpellKnown(ids.Rank.FlamestrikeRank3) then ids.Ability.FlamestrikeDR = ids.Rank.FlamestrikeRank2;
	elseif IsSpellKnown(ids.Rank.FlamestrikeRank2) then ids.Ability.FlamestrikeDR = ids.Rank.FlamestrikeRank1; end

	if IsSpellKnown(ids.Rank.PyroblastRank8) then ids.Ability.Pyroblast = ids.Rank.PyroblastRank8;
	elseif IsSpellKnown(ids.Rank.PyroblastRank7) then ids.Ability.Pyroblast = ids.Rank.PyroblastRank7;
	elseif IsSpellKnown(ids.Rank.PyroblastRank6) then ids.Ability.Pyroblast = ids.Rank.PyroblastRank6;
	elseif IsSpellKnown(ids.Rank.PyroblastRank5) then ids.Ability.Pyroblast = ids.Rank.PyroblastRank5;
	elseif IsSpellKnown(ids.Rank.PyroblastRank4) then ids.Ability.Pyroblast = ids.Rank.PyroblastRank4;
	elseif IsSpellKnown(ids.Rank.PyroblastRank3) then ids.Ability.Pyroblast = ids.Rank.PyroblastRank3;
	elseif IsSpellKnown(ids.Rank.PyroblastRank2) then ids.Ability.Pyroblast = ids.Rank.PyroblastRank2; end

	if IsSpellKnown(ids.Rank.ScorchRank7) then ids.Ability.Scorch = ids.Rank.ScorchRank7;
	elseif IsSpellKnown(ids.Rank.ScorchRank6) then ids.Ability.Scorch = ids.Rank.ScorchRank6;
	elseif IsSpellKnown(ids.Rank.ScorchRank5) then ids.Ability.Scorch = ids.Rank.ScorchRank5;
	elseif IsSpellKnown(ids.Rank.ScorchRank4) then ids.Ability.Scorch = ids.Rank.ScorchRank4;
	elseif IsSpellKnown(ids.Rank.ScorchRank3) then ids.Ability.Scorch = ids.Rank.ScorchRank3;
	elseif IsSpellKnown(ids.Rank.ScorchRank2) then ids.Ability.Scorch = ids.Rank.ScorchRank2; end

	if IsSpellKnown(ids.Rank.BlizzardRank6) then ids.Ability.Blizzard = ids.Rank.BlizzardRank6;
	elseif IsSpellKnown(ids.Rank.BlizzardRank5) then ids.Ability.Blizzard = ids.Rank.BlizzardRank5;
	elseif IsSpellKnown(ids.Rank.BlizzardRank4) then ids.Ability.Blizzard = ids.Rank.BlizzardRank4;
	elseif IsSpellKnown(ids.Rank.BlizzardRank3) then ids.Ability.Blizzard = ids.Rank.BlizzardRank3;
	elseif IsSpellKnown(ids.Rank.BlizzardRank2) then ids.Ability.Blizzard = ids.Rank.BlizzardRank2; end

	if IsSpellKnown(ids.Rank.ConeofColdRank5) then ids.Ability.ConeofCold = ids.Rank.ConeofColdRank5;
	elseif IsSpellKnown(ids.Rank.ConeofColdRank4) then ids.Ability.ConeofCold = ids.Rank.ConeofColdRank4;
	elseif IsSpellKnown(ids.Rank.ConeofColdRank3) then ids.Ability.ConeofCold = ids.Rank.ConeofColdRank3;
	elseif IsSpellKnown(ids.Rank.ConeofColdRank2) then ids.Ability.ConeofCold = ids.Rank.ConeofColdRank2; end

	if IsSpellKnown(ids.Rank.FrostWardRank5) then ids.Ability.FrostWard = ids.Rank.FrostWardRank5;
	elseif IsSpellKnown(ids.Rank.FrostWardRank4) then ids.Ability.FrostWard = ids.Rank.FrostWardRank4;
	elseif IsSpellKnown(ids.Rank.FrostWardRank3) then ids.Ability.FrostWard = ids.Rank.FrostWardRank3;
	elseif IsSpellKnown(ids.Rank.FrostWardRank2) then ids.Ability.FrostWard = ids.Rank.FrostWardRank2; end

	if IsSpellKnown(ids.Rank.FrostboltRank10) then ids.Ability.Frostbolt = ids.Rank.FrostboltRank10;
	elseif IsSpellKnown(ids.Rank.FrostboltRank9) then ids.Ability.Frostbolt = ids.Rank.FrostboltRank9;
	elseif IsSpellKnown(ids.Rank.FrostboltRank8) then ids.Ability.Frostbolt = ids.Rank.FrostboltRank8;
	elseif IsSpellKnown(ids.Rank.FrostboltRank7) then ids.Ability.Frostbolt = ids.Rank.FrostboltRank7;
	elseif IsSpellKnown(ids.Rank.FrostboltRank6) then ids.Ability.Frostbolt = ids.Rank.FrostboltRank6;
	elseif IsSpellKnown(ids.Rank.FrostboltRank5) then ids.Ability.Frostbolt = ids.Rank.FrostboltRank5;
	elseif IsSpellKnown(ids.Rank.FrostboltRank4) then ids.Ability.Frostbolt = ids.Rank.FrostboltRank4;
	elseif IsSpellKnown(ids.Rank.FrostboltRank3) then ids.Ability.Frostbolt = ids.Rank.FrostboltRank3;
	elseif IsSpellKnown(ids.Rank.FrostboltRank2) then ids.Ability.Frostbolt = ids.Rank.FrostboltRank2; end

	--Ranks Defensive
	if IsSpellKnown(ids.Rank.MageArmorRank3) then ids.Ability.MageArmor = ids.Rank.MageArmorRank3;
	elseif IsSpellKnown(ids.Rank.MageArmorRank2) then ids.Ability.MageArmor = ids.Rank.MageArmorRank2; end

	if IsSpellKnown(ids.Rank.ManaShieldRank6) then ids.Ability.ManaShield = ids.Rank.ManaShieldRank6;
	elseif IsSpellKnown(ids.Rank.ManaShieldRank5) then ids.Ability.ManaShield = ids.Rank.ManaShieldRank5;
	elseif IsSpellKnown(ids.Rank.ManaShieldRank4) then ids.Ability.ManaShield = ids.Rank.ManaShieldRank4;
	elseif IsSpellKnown(ids.Rank.ManaShieldRank3) then ids.Ability.ManaShield = ids.Rank.ManaShieldRank3;
	elseif IsSpellKnown(ids.Rank.ManaShieldRank2) then ids.Ability.ManaShield = ids.Rank.ManaShieldRank2; end

	if IsSpellKnown(ids.Rank.IceBarrierRank4) then ids.Ability.IceBarrier = ids.Rank.IceBarrierRank4;
	elseif IsSpellKnown(ids.Rank.IceBarrierRank3) then ids.Ability.IceBarrier = ids.Rank.IceBarrierRank3;
	elseif IsSpellKnown(ids.Rank.IceBarrierRank2) then ids.Ability.IceBarrier = ids.Rank.IceBarrierRank2; end

	if IsSpellKnown(ids.Rank.IceArmorRank4) then ids.Ability.IceArmor = ids.Rank.IceArmorRank4;
	elseif IsSpellKnown(ids.Rank.IceArmorRank3) then ids.Ability.IceArmor = ids.Rank.IceArmorRank3;
	elseif IsSpellKnown(ids.Rank.IceArmorRank2) then ids.Ability.IceArmor = ids.Rank.IceArmorRank2;
	elseif IsSpellKnown(ids.Rank.IceArmorRank1) then ids.Ability.IceArmor = ids.Rank.IceArmorRank1;	
	elseif IsSpellKnown(ids.Rank.FrostArmorRank3) then ids.Ability.IceArmor = ids.Rank.FrostArmorRank3;
	elseif IsSpellKnown(ids.Rank.FrostArmorRank2) then ids.Ability.IceArmor = ids.Rank.FrostArmorRank2; end

	if IsSpellKnown(ids.Rank.FrostNovaRank4) then ids.Ability.FrostNova = ids.Rank.FrostNovaRank4;
	elseif IsSpellKnown(ids.Rank.FrostNovaRank3) then ids.Ability.FrostNova = ids.Rank.FrostNovaRank3;
	elseif IsSpellKnown(ids.Rank.FrostNovaRank2) then ids.Ability.FrostNova = ids.Rank.FrostNovaRank2; end
end