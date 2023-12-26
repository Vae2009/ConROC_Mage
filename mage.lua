local printTalentsMode = false

-- Slash command for printing talent tree with talent names and ID numbers
SLASH_CONROCPRINTTALENTS1 = "/ConROCPT"
SlashCmdList["CONROCPRINTTALENTS"] = function()
    printTalentsMode = not printTalentsMode
    ConROC:PopulateTalentIDs()
end

ConROC.Mage = {};

local ConROC_Mage, ids = ...;
local optionMaxIds = ...;
local currentSpecName

function ConROC:EnableDefenseModule()
	self.NextDef = ConROC.Mage.Defense;
end

function ConROC:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
	
	ConROC:JustCasted(spellID);
end

function ConROC:PopulateTalentIDs()
    local numTabs = GetNumTalentTabs()
    
    for tabIndex = 1, numTabs do
        local tabName = GetTalentTabInfo(tabIndex) .. "_Talent"
        tabName = string.gsub(tabName, "%s", "") -- Remove spaces from tab name
        if printTalentsMode then
        	print(tabName..": ")
        else
        	ids[tabName] = {}
    	end
        
        local numTalents = GetNumTalents(tabIndex)

        for talentIndex = 1, numTalents do
            local name, _, _, _, _ = GetTalentInfo(tabIndex, talentIndex)

            if name then
                local talentID = string.gsub(name, "%s", "") -- Remove spaces from talent name
                if printTalentsMode then
                	print(talentID .." = ID no: ", talentIndex)
                else
                	ids[tabName][talentID] = talentIndex
                end
            end
        end
    end
    if printTalentsMode then printTalentsMode = false end
end
ConROC:PopulateTalentIDs()

local Racial, Spec, Caster, Arc_Ability, Arc_Talent, Fire_Ability, Fire_Talent, Frost_Ability, Frost_Talent, Player_Buff, Player_Debuff, Target_Debuff = ids.Racial, ids.Spec, ids.Caster, ids.Arc_Ability, ids.Arcane_Talent, ids.Fire_Ability, ids.Fire_Talent, ids.Frost_Ability, ids.Frost_Talent, ids.Player_Buff, ids.Player_Debuff, ids.Target_Debuff;
function ConROC:SpecUpdate()
	currentSpecName = ConROC:currentSpec()

	if currentSpecName then
	   ConROC:Print(self.Colors.Info .. "Current spec:", self.Colors.Success ..  currentSpecName)
	else
	   ConROC:Print(self.Colors.Error .. "You do not currently have a spec.")
	end
end
ConROC:SpecUpdate()
--Ranks
--Arcane
local _Evocation = Arc_Ability.Evocation;
local _PresenceofMind = Arc_Ability.PresenceofMind;
local _ArcanePower = Arc_Ability.ArcanePower;
local _AmplifyMagic = Arc_Ability.AmplifyMagicRank1;
local _ArcaneBrilliance = Arc_Ability.ArcaneBrilliance;
local _ArcaneExplosion = Arc_Ability.ArcaneExplosionRank1;
local _ArcaneIntellect = Arc_Ability.ArcaneIntellectRank1;
local _ArcaneMissiles = Arc_Ability.ArcaneMissilesRank1;
local _DampenMagic = Arc_Ability.DampenMagicRank1;
local _MageArmor = Arc_Ability.MageArmorRank1;
local _ManaShield = Arc_Ability.ManaShieldRank1;
--Fire
local _BlastWave = Fire_Ability.BlastWaveRank1;
local _Combustion = Fire_Ability.Combustion;
local _FireBlast = Fire_Ability.FireBlastRank1;
local _FireWard = Fire_Ability.FireWardRank1;
local _Fireball = Fire_Ability.FireballRank1;
local _Flamestrike = Fire_Ability.FlamestrikeRank1;
local _FlamestrikeDR = Fire_Ability.FlamestrikeRank1;
local _Pyroblast = Fire_Ability.PyroblastRank1;
local _Scorch = Fire_Ability.ScorchRank1;
--Frost	
local _Blizzard = Frost_Ability.BlizzardRank1;
local _ConeofCold = Frost_Ability.ConeofColdRank1;
local _IceBarrier = Frost_Ability.IceBarrierRank1;
local _IceArmor = Frost_Ability.FrostArmorRank1;
local _FrostNova = Frost_Ability.FrostNovaRank1;	
local _FrostWard = Frost_Ability.FrostWardRank1;
local _Frostbolt = Frost_Ability.FrostboltRank1;
--runes
local _RuneArcaneBlast = ids.Runes.ArcaneBlast;
local _RuneArcaneSurge = ids.Runes.ArcaneSurge;
local _RuneIceLance = ids.Runes.IceLance;
local _RuneIcyVeins = ids.Runes.IcyVeins;
local _RuneLivingBomb = ids.Runes.LivingBomb;
local _RuneLivingFlame = ids.Runes.LivingFlame;
local _RuneMassRegeneration = ids.Runes.MassRegeneration;
local _RuneRegeneration = ids.Runes.Regeneration;
local _RuneRewindTime = ids.Runes.RewindTime;

function ConROC:UpdateSpellID()
	--Ranks
	if IsSpellKnown(Arc_Ability.AmplifyMagicRank4) then _AmplifyMagic = Arc_Ability.AmplifyMagicRank4;
	elseif IsSpellKnown(Arc_Ability.AmplifyMagicRank3) then _AmplifyMagic = Arc_Ability.AmplifyMagicRank3;
	elseif IsSpellKnown(Arc_Ability.AmplifyMagicRank2) then _AmplifyMagic = Arc_Ability.AmplifyMagicRank2; end

	if IsSpellKnown(Arc_Ability.ArcaneExplosionRank6) then _ArcaneExplosion = Arc_Ability.ArcaneExplosionRank6;
	elseif IsSpellKnown(Arc_Ability.ArcaneExplosionRank5) then _ArcaneExplosion = Arc_Ability.ArcaneExplosionRank5;
	elseif IsSpellKnown(Arc_Ability.ArcaneExplosionRank4) then _ArcaneExplosion = Arc_Ability.ArcaneExplosionRank4;
	elseif IsSpellKnown(Arc_Ability.ArcaneExplosionRank3) then _ArcaneExplosion = Arc_Ability.ArcaneExplosionRank3;
	elseif IsSpellKnown(Arc_Ability.ArcaneExplosionRank2) then _ArcaneExplosion = Arc_Ability.ArcaneExplosionRank2; end

	if IsSpellKnown(Arc_Ability.ArcaneIntellectRank5) then _ArcaneIntellect = Arc_Ability.ArcaneIntellectRank5;
	elseif IsSpellKnown(Arc_Ability.ArcaneIntellectRank4) then _ArcaneIntellect = Arc_Ability.ArcaneIntellectRank4;
	elseif IsSpellKnown(Arc_Ability.ArcaneIntellectRank3) then _ArcaneIntellect = Arc_Ability.ArcaneIntellectRank3;
	elseif IsSpellKnown(Arc_Ability.ArcaneIntellectRank2) then _ArcaneIntellect = Arc_Ability.ArcaneIntellectRank2; end

	if IsSpellKnown(Arc_Ability.ArcaneMissilesRank7) then _ArcaneMissiles = Arc_Ability.ArcaneMissilesRank7;
	elseif IsSpellKnown(Arc_Ability.ArcaneMissilesRank6) then _ArcaneMissiles = Arc_Ability.ArcaneMissilesRank6;
	elseif IsSpellKnown(Arc_Ability.ArcaneMissilesRank5) then _ArcaneMissiles = Arc_Ability.ArcaneMissilesRank5;
	elseif IsSpellKnown(Arc_Ability.ArcaneMissilesRank4) then _ArcaneMissiles = Arc_Ability.ArcaneMissilesRank4;
	elseif IsSpellKnown(Arc_Ability.ArcaneMissilesRank3) then _ArcaneMissiles = Arc_Ability.ArcaneMissilesRank3;
	elseif IsSpellKnown(Arc_Ability.ArcaneMissilesRank2) then _ArcaneMissiles = Arc_Ability.ArcaneMissilesRank2; end

	if IsSpellKnown(Arc_Ability.DampenMagicRank5) then _DampenMagic = Arc_Ability.DampenMagicRank5;
	elseif IsSpellKnown(Arc_Ability.DampenMagicRank4) then _DampenMagic = Arc_Ability.DampenMagicRank4;
	elseif IsSpellKnown(Arc_Ability.DampenMagicRank3) then _DampenMagic = Arc_Ability.DampenMagicRank3;
	elseif IsSpellKnown(Arc_Ability.DampenMagicRank2) then _DampenMagic = Arc_Ability.DampenMagicRank2; end	

	if IsSpellKnown(Fire_Ability.BlastWaveRank5) then _BlastWave = Fire_Ability.BlastWaveRank5;
	elseif IsSpellKnown(Fire_Ability.BlastWaveRank4) then _BlastWave = Fire_Ability.BlastWaveRank4;
	elseif IsSpellKnown(Fire_Ability.BlastWaveRank3) then _BlastWave = Fire_Ability.BlastWaveRank3;
	elseif IsSpellKnown(Fire_Ability.BlastWaveRank2) then _BlastWave = Fire_Ability.BlastWaveRank2; end

	if IsSpellKnown(Fire_Ability.FireBlastRank7) then _FireBlast = Fire_Ability.FireBlastRank7;
	elseif IsSpellKnown(Fire_Ability.FireBlastRank6) then _FireBlast = Fire_Ability.FireBlastRank6;
	elseif IsSpellKnown(Fire_Ability.FireBlastRank5) then _FireBlast = Fire_Ability.FireBlastRank5;
	elseif IsSpellKnown(Fire_Ability.FireBlastRank4) then _FireBlast = Fire_Ability.FireBlastRank4;
	elseif IsSpellKnown(Fire_Ability.FireBlastRank3) then _FireBlast = Fire_Ability.FireBlastRank3;
	elseif IsSpellKnown(Fire_Ability.FireBlastRank2) then _FireBlast = Fire_Ability.FireBlastRank2; end

	if IsSpellKnown(Fire_Ability.FireWardRank5) then _FireWard = Fire_Ability.FireWardRank5;
	elseif IsSpellKnown(Fire_Ability.FireWardRank4) then _FireWard = Fire_Ability.FireWardRank4;
	elseif IsSpellKnown(Fire_Ability.FireWardRank3) then _FireWard = Fire_Ability.FireWardRank3;
	elseif IsSpellKnown(Fire_Ability.FireWardRank2) then _FireWard = Fire_Ability.FireWardRank2; end

	if IsSpellKnown(Fire_Ability.FireballRank11) then _Fireball = Fire_Ability.FireballRank11;
	elseif IsSpellKnown(Fire_Ability.FireballRank10) then _Fireball = Fire_Ability.FireballRank10;
	elseif IsSpellKnown(Fire_Ability.FireballRank9) then _Fireball = Fire_Ability.FireballRank8;
	elseif IsSpellKnown(Fire_Ability.FireballRank8) then _Fireball = Fire_Ability.FireballRank9;
	elseif IsSpellKnown(Fire_Ability.FireballRank7) then _Fireball = Fire_Ability.FireballRank7;	
	elseif IsSpellKnown(Fire_Ability.FireballRank6) then _Fireball = Fire_Ability.FireballRank6;
	elseif IsSpellKnown(Fire_Ability.FireballRank5) then _Fireball = Fire_Ability.FireballRank5;
	elseif IsSpellKnown(Fire_Ability.FireballRank4) then _Fireball = Fire_Ability.FireballRank4;
	elseif IsSpellKnown(Fire_Ability.FireballRank3) then _Fireball = Fire_Ability.FireballRank3;
	elseif IsSpellKnown(Fire_Ability.FireballRank2) then _Fireball = Fire_Ability.FireballRank2; end

	if IsSpellKnown(Fire_Ability.FlamestrikeRank6) then _Flamestrike = Fire_Ability.FlamestrikeRank6;
	elseif IsSpellKnown(Fire_Ability.FlamestrikeRank5) then _Flamestrike = Fire_Ability.FlamestrikeRank5;
	elseif IsSpellKnown(Fire_Ability.FlamestrikeRank4) then _Flamestrike = Fire_Ability.FlamestrikeRank4;
	elseif IsSpellKnown(Fire_Ability.FlamestrikeRank3) then _Flamestrike = Fire_Ability.FlamestrikeRank3;
	elseif IsSpellKnown(Fire_Ability.FlamestrikeRank2) then _Flamestrike = Fire_Ability.FlamestrikeRank2; end

	--down ranked Flamestrike
	if IsSpellKnown(Fire_Ability.FlamestrikeRank6) then _FlamestrikeDR = Fire_Ability.FlamestrikeRank5;
	elseif IsSpellKnown(Fire_Ability.FlamestrikeRank5) then _FlamestrikeDR = Fire_Ability.FlamestrikeRank4;
	elseif IsSpellKnown(Fire_Ability.FlamestrikeRank4) then _FlamestrikeDR = Fire_Ability.FlamestrikeRank3;
	elseif IsSpellKnown(Fire_Ability.FlamestrikeRank3) then _FlamestrikeDR = Fire_Ability.FlamestrikeRank2;
	elseif IsSpellKnown(Fire_Ability.FlamestrikeRank2) then _FlamestrikeDR = Fire_Ability.FlamestrikeRank1; end

	if IsSpellKnown(Fire_Ability.PyroblastRank8) then _Pyroblast = Fire_Ability.PyroblastRank8;
	elseif IsSpellKnown(Fire_Ability.PyroblastRank7) then _Pyroblast = Fire_Ability.PyroblastRank7;
	elseif IsSpellKnown(Fire_Ability.PyroblastRank6) then _Pyroblast = Fire_Ability.PyroblastRank6;
	elseif IsSpellKnown(Fire_Ability.PyroblastRank5) then _Pyroblast = Fire_Ability.PyroblastRank5;
	elseif IsSpellKnown(Fire_Ability.PyroblastRank4) then _Pyroblast = Fire_Ability.PyroblastRank4;
	elseif IsSpellKnown(Fire_Ability.PyroblastRank3) then _Pyroblast = Fire_Ability.PyroblastRank3;
	elseif IsSpellKnown(Fire_Ability.PyroblastRank2) then _Pyroblast = Fire_Ability.PyroblastRank2; end

	if IsSpellKnown(Fire_Ability.ScorchRank7) then _Scorch = Fire_Ability.ScorchRank7;
	elseif IsSpellKnown(Fire_Ability.ScorchRank6) then _Scorch = Fire_Ability.ScorchRank6;
	elseif IsSpellKnown(Fire_Ability.ScorchRank5) then _Scorch = Fire_Ability.ScorchRank5;
	elseif IsSpellKnown(Fire_Ability.ScorchRank4) then _Scorch = Fire_Ability.ScorchRank4;
	elseif IsSpellKnown(Fire_Ability.ScorchRank3) then _Scorch = Fire_Ability.ScorchRank3;
	elseif IsSpellKnown(Fire_Ability.ScorchRank2) then _Scorch = Fire_Ability.ScorchRank2; end

	if IsSpellKnown(Frost_Ability.BlizzardRank6) then _Blizzard = Frost_Ability.BlizzardRank6;
	elseif IsSpellKnown(Frost_Ability.BlizzardRank5) then _Blizzard = Frost_Ability.BlizzardRank5;
	elseif IsSpellKnown(Frost_Ability.BlizzardRank4) then _Blizzard = Frost_Ability.BlizzardRank4;
	elseif IsSpellKnown(Frost_Ability.BlizzardRank3) then _Blizzard = Frost_Ability.BlizzardRank3;
	elseif IsSpellKnown(Frost_Ability.BlizzardRank2) then _Blizzard = Frost_Ability.BlizzardRank2; end

	if IsSpellKnown(Frost_Ability.ConeofColdRank5) then _ConeofCold = Frost_Ability.ConeofColdRank5;
	elseif IsSpellKnown(Frost_Ability.ConeofColdRank4) then _ConeofCold = Frost_Ability.ConeofColdRank4;
	elseif IsSpellKnown(Frost_Ability.ConeofColdRank3) then _ConeofCold = Frost_Ability.ConeofColdRank3;
	elseif IsSpellKnown(Frost_Ability.ConeofColdRank2) then _ConeofCold = Frost_Ability.ConeofColdRank2; end

	if IsSpellKnown(Frost_Ability.FrostWardRank5) then _FrostWard = Frost_Ability.FrostWardRank5;
	elseif IsSpellKnown(Frost_Ability.FrostWardRank4) then _FrostWard = Frost_Ability.FrostWardRank4;
	elseif IsSpellKnown(Frost_Ability.FrostWardRank3) then _FrostWard = Frost_Ability.FrostWardRank3;
	elseif IsSpellKnown(Frost_Ability.FrostWardRank2) then _FrostWard = Frost_Ability.FrostWardRank2; end

	if IsSpellKnown(Frost_Ability.FrostboltRank10) then _Frostbolt = Frost_Ability.FrostboltRank10;
	elseif IsSpellKnown(Frost_Ability.FrostboltRank9) then _Frostbolt = Frost_Ability.FrostboltRank9;
	elseif IsSpellKnown(Frost_Ability.FrostboltRank8) then _Frostbolt = Frost_Ability.FrostboltRank8;
	elseif IsSpellKnown(Frost_Ability.FrostboltRank7) then _Frostbolt = Frost_Ability.FrostboltRank7;	
	elseif IsSpellKnown(Frost_Ability.FrostboltRank6) then _Frostbolt = Frost_Ability.FrostboltRank6;
	elseif IsSpellKnown(Frost_Ability.FrostboltRank5) then _Frostbolt = Frost_Ability.FrostboltRank5;
	elseif IsSpellKnown(Frost_Ability.FrostboltRank4) then _Frostbolt = Frost_Ability.FrostboltRank4;
	elseif IsSpellKnown(Frost_Ability.FrostboltRank3) then _Frostbolt = Frost_Ability.FrostboltRank3;
	elseif IsSpellKnown(Frost_Ability.FrostboltRank2) then _Frostbolt = Frost_Ability.FrostboltRank2; end

	--Ranks Defensive
	if IsSpellKnown(Arc_Ability.MageArmorRank3) then _MageArmor = Arc_Ability.MageArmorRank3;
	elseif IsSpellKnown(Arc_Ability.MageArmorRank2) then _MageArmor = Arc_Ability.MageArmorRank2; end

	if IsSpellKnown(Arc_Ability.ManaShieldRank6) then _ManaShield = Arc_Ability.ManaShieldRank6;
	elseif IsSpellKnown(Arc_Ability.ManaShieldRank5) then _ManaShield = Arc_Ability.ManaShieldRank5;
	elseif IsSpellKnown(Arc_Ability.ManaShieldRank4) then _ManaShield = Arc_Ability.ManaShieldRank4;
	elseif IsSpellKnown(Arc_Ability.ManaShieldRank3) then _ManaShield = Arc_Ability.ManaShieldRank3;
	elseif IsSpellKnown(Arc_Ability.ManaShieldRank2) then _ManaShield = Arc_Ability.ManaShieldRank2; end

	if IsSpellKnown(Frost_Ability.IceBarrierRank4) then _IceBarrier = Frost_Ability.IceBarrierRank4;
	elseif IsSpellKnown(Frost_Ability.IceBarrierRank3) then _IceBarrier = Frost_Ability.IceBarrierRank3;
	elseif IsSpellKnown(Frost_Ability.IceBarrierRank2) then _IceBarrier = Frost_Ability.IceBarrierRank2; end

	if IsSpellKnown(Frost_Ability.IceArmorRank4) then _IceArmor = Frost_Ability.IceArmorRank4;
	elseif IsSpellKnown(Frost_Ability.IceArmorRank3) then _IceArmor = Frost_Ability.IceArmorRank3;
	elseif IsSpellKnown(Frost_Ability.IceArmorRank2) then _IceArmor = Frost_Ability.IceArmorRank2;
	elseif IsSpellKnown(Frost_Ability.IceArmorRank1) then _IceArmor = Frost_Ability.IceArmorRank1;	
	elseif IsSpellKnown(Frost_Ability.FrostArmorRank3) then _IceArmor = Frost_Ability.FrostArmorRank3;
	elseif IsSpellKnown(Frost_Ability.FrostArmorRank2) then _IceArmor = Frost_Ability.FrostArmorRank2; end

	if IsSpellKnown(Frost_Ability.FrostNovaRank4) then _FrostNova = Frost_Ability.FrostNovaRank4;
	elseif IsSpellKnown(Frost_Ability.FrostNovaRank3) then _FrostNova = Frost_Ability.FrostNovaRank3;
	elseif IsSpellKnown(Frost_Ability.FrostNovaRank2) then _FrostNova = Frost_Ability.FrostNovaRank2; end

	ids.optionMaxIds = {
		--Arcane
		Evocation = _Evocation,
		PresenceofMind = _PresenceofMind,
		ArcanePower = _ArcanePower,
		AmplifyMagic = _AmplifyMagic,
		ArcaneBrilliance = _ArcaneBrilliance,
		ArcaneExplosion = _ArcaneExplosion,
		ArcaneIntellect = _ArcaneIntellect,
		ArcaneMissiles = _ArcaneMissiles,
		DampenMagic = _DampenMagic,
		MageArmor = _MageArmor,
		--Fire
		BlastWave = _BlastWave,
		Combustion = _Combustion,
		FireBlast =_FireBlast,
		FireWard =_FireWard,
		Fireball = _Fireball,
		Flamestrike = _Flamestrike,
		FlamestrikeDR = _FlamestrikeDR,
		Pyroblast =_Pyroblast,
		Scorch =_Scorch,
		--Frost
		Blizzard = _Blizzard,
		ConeofCold = _ConeofCold,
		Frostbolt = _Frostbolt,
		IceBarrier = _IceBarrier,
		IceArmor = _IceArmor,
		FrostNova = _FrostNova,
		FrostWard = _FrostWard,
		--Runes
		RuneArcaneBlast = _RuneArcaneBlast,
		RuneArcaneSurge = _RuneArcaneSurge,
		RuneIceLance = _RuneIceLance,
		RuneIcyVeins = _RuneIcyVeins,
		RuneLivingBomb = _RuneLivingBomb,
		RuneLivingFlame = _RuneLivingFlame,
		RuneMassRegeneration = _RuneMassRegeneration,
		RuneRegeneration = _RuneRegeneration,
		RuneRewindTime = _RuneRewindTime,
	}
end
ConROC:UpdateSpellID()

local wChillEXP = 0;
local fVulEXP = 0;
local fStrikeEXP = 0;
local fStrikeDREXP = 0;

function ConROC:EnableRotationModule()
	self.Description = "Mage";
	self.NextSpell = ConROC.Mage.Damage;

	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self:RegisterEvent("PLAYER_TALENT_UPDATE");
	self.lastSpellId = 0;
	
	ConROC:SpellmenuClass();	
end
function ConROC:PLAYER_TALENT_UPDATE()
	ConROC:SpecUpdate();
    ConROC:closeSpellmenu();
end

function ConROC.Mage.Damage(_, timeShift, currentSpell, gcd)
	ConROC:UpdateSpellID()

--Character
	local plvl	= UnitLevel('player');
--Racials

--Resources
	local mana = UnitPower('player', Enum.PowerType.Mana);
	local manaMax = UnitPowerMax('player', Enum.PowerType.Mana);
	local manaPercent = math.max(0, mana) / math.max(1, manaMax) * 100;


--Abilties	
	local ampMagRDY	= ConROC:AbilityReady(_AmplifyMagic, timeShift);
		local ampMagBUFF = ConROC:Buff(_AmplifyMagic, timeShift);
	local aExpRDY = ConROC:AbilityReady(_ArcaneExplosion, timeShift);
	local aIntRDY = ConROC:AbilityReady(_ArcaneIntellect, timeShift);
		local aIntBUFF = ConROC:Buff(_ArcaneIntellect, timeShift);
		local aBriBUFF = ConROC:Buff(_ArcaneBrilliance, timeShift);
	local aMissRDY = ConROC:AbilityReady(_ArcaneMissiles, timeShift);
	local aPowerRDY = ConROC:AbilityReady(_ArcanePower, timeShift);
	local blinkRDY = ConROC:AbilityReady(Arc_Ability.Blink, timeShift);
	local conAgateRDY = ConROC:AbilityReady(Arc_Ability.ConjureManaAgate, timeShift);
	local conJadeRDY = ConROC:AbilityReady(Arc_Ability.ConjureManaJade, timeShift);
	local conCitRDY = ConROC:AbilityReady(Arc_Ability.ConjureManaCitrine, timeShift);
	local conRubyRDY = ConROC:AbilityReady(Arc_Ability.ConjureManaRuby, timeShift);
	local cSpellRDY = ConROC:AbilityReady(Arc_Ability.Counterspell, timeShift);
	local dampenMagRDY = ConROC:AbilityReady(_DampenMagic, timeShift);
		local dampenMagBUFF = ConROC:Buff(_DampenMagic, timeShift);
	local evoRDY = ConROC:AbilityReady(_Evocation, timeShift);
	local pomRDY = ConROC:AbilityReady(_PresenceofMind, timeShift);
		local pomBUFF = ConROC:Buff(_PresenceofMind, timeShift);
	local bWaveRDY = ConROC:AbilityReady(_BlastWave, timeShift);
	if ConROC:TalentChosen(Spec.Fire, Fire_Talent.Combustion) then
        local combRDY = ConROC:AbilityReady(_Combustion, timeShift);
    end
	local fBlastRDY = ConROC:AbilityReady(_FireBlast, timeShift);
	local fBallRDY = ConROC:AbilityReady(_Fireball, timeShift);
		local fBallDEBUFF = ConROC:TargetDebuff(_Fireball, timeShift);
	local fStrikeRDY = ConROC:AbilityReady(_Flamestrike, timeShift);
		local fStrikeDUR = fStrikeEXP - GetTime();
    local fStrikeDRRDY = ConROC:AbilityReady(_FlamestrikeDR, timeShift);
        local fStrikeDRDUR = fStrikeDREXP - GetTime();
	local pBlastRDY = ConROC:AbilityReady(_Pyroblast, timeShift);
	local scorRDY = ConROC:AbilityReady(_Scorch, timeShift);
	local blizRDY = ConROC:AbilityReady(_Blizzard, timeShift);
	local cSnapRDY = ConROC:AbilityReady(Frost_Ability.ColdSnap, timeShift);
	local cofcRDY = ConROC:AbilityReady(_ConeofCold, timeShift);
	local frBoltRDY = ConROC:AbilityReady(_Frostbolt, timeShift);
		local frBoltDEBUFF = ConROC:TargetDebuff(_Frostbolt, timeShift);
	
	   local chillDEBUFF = ConROC:TargetDebuff(Target_Debuff.Chilled, timeShift);
	   local wChillDEBUFF, wChillCount = ConROC:TargetDebuff(Target_Debuff.WintersChill);
	   local wChillDUR = wChillEXP - GetTime();
	   local fVulDEBUFF, fVulCount = ConROC:TargetDebuff(Target_Debuff.FireVulnerability);
	   local fVulDUR = fVulEXP - GetTime();
	   local frNovaDEBUFF = ConROC:TargetDebuff(_FrostNova);
			
	local _, impArcPoints = ConROC:TalentChosen(Spec.Arcane, Arc_Talent.ImprovedArcaneMissiles)
	
--runes
	local raBlastRDY = ConROC:AbilityReady(_RuneArcaneBlast, timeShift);
		local raBlastDEBUFF, raBlastCount = ConROC:TargetDebuff(Target_Debuff.ArcaneBlast);
	local raSurgeRDY = ConROC:AbilityReady(_RuneArcaneSurge, timeShift);
	local riLanceRDY = ConROC:AbilityReady(_RuneIceLance, timeShift);
	local riVeinsRDY = ConROC:AbilityReady(_RuneIcyVeins, timeShift);
	local rlBombRDY = ConROC:AbilityReady(_RuneLivingBomb, timeShift);
		local rlBombDEBUFF = ConROC:TargetDebuff(_RuneLivingBomb, timeShift);
	local rlFlameRDY = ConROC:AbilityReady(_RuneLivingFlame, timeShift);
		local rlFlameDEBUFF = ConROC:TargetDebuff(Target_Debuff.LivingFlame, timeShift);
	local rmRegenRDY = ConROC:AbilityReady(_RuneMassRegeneration, timeShift);
	local rRegenRDY = ConROC:AbilityReady(_RuneRegeneration, timeShift);
	local rrTimeRDY = ConROC:AbilityReady(_RuneRewindTime, timeShift);
	local rFoFBUFF, rFoFDUR = ConROC:BuffName(Player_Buff.FingersofFrost, timeShift);

--Conditions
	local inMelee = CheckInteractDistance("target", 3);		
	local targetPh = ConROC:PercentHealth('target');		
	local hasWand = HasWandEquipped();
   	local moving = ConROC:PlayerSpeed();	
   	local incombat = UnitAffectingCombat('player');
    local resting = IsResting();
    local mounted = IsMounted();
    local onVehicle = UnitHasVehicleUI("player");
	
    if onVehicle then
        return nil
    end
	
--Indicators	
	ConROC:AbilityBurst(_Evocation, evoRDY and manaPercent <= 25);
	ConROC:AbilityBurst(_PresenceofMind, pomRDY and incombat);
	ConROC:AbilityBurst(_ArcanePower, aPowerRDY and incombat and (not ConROC:TalentChosen(Spec.Frost, Frost_Talent.WintersChill) or (ConROC:TalentChosen(Spec.Frost, Frost_Talent.WintersChill) and wChillCount == 5))) ;	
	ConROC:AbilityBurst(_Combustion, combRDY and incombat and (not ConROC:TalentChosen(Spec.Fire, Fire_Talent.ImprovedScorch) or (ConROC:TalentChosen(Spec.Fire, Fire_Talent.ImprovedScorch) and fVuCount == 5)));

	ConROC:AbilityRaidBuffs(_ArcaneIntellect, aIntRDY and not (aIntBUFF or aBriBUFF));
	
--Warnings
	--[[
	if not incombat and not ConROC:TarHostile() and ConROC:CheckBox(ConROC_SM_Option_HideRotation) then
		ConROCWindow:Hide();
	else
		ConROCWindow:Show();
	end
	--]]
--Rotations
	--print("IsSpellKnown(_RuneIceLance)",IsSpellKnown(_RuneIceLance))
	--print("IsSpellKnownOrOverridesKnown(_RuneIceLance)",IsSpellKnownOrOverridesKnown(_RuneIceLance))
	--print("ConROC.Seasons.IsSoD",ConROC.Seasons.IsSoD)
	if ConROC:CheckBox(ConROC_SM_CD_Evocation) and evoRDY and manaPercent < 25 then
		return _Evocation;
	end

	if ConROC.Seasons.IsSoD then --DPS rotation for SoD
	    if ConROC:CheckBox(ConROC_SM_Rune_IcyVeins) and riVeinsRDY then --and fBallRDY then
	    	return _RuneIcyVeins;
	    end
	    if ConROC:CheckBox(ConROC_SM_Rune_LivingBomb) and rlBombRDY and not rlBombDEBUFF and ((targetPh >= 5 and ConROC:Raidmob()) or (targetPh >= 20 and not ConROC:Raidmob())) then
	    	return _RuneLivingBomb;
	    end
	    if ConROC:CheckBox(ConROC_SM_Rune_LivingFlame) and rlFlameRDY and ConROC_AoEButton:IsVisible() then --and fBallRDY then
	    	return _RuneLivingFlame;
	    end
	    if ConROC:CheckBox(ConROC_SM_Rune_ArcaneBlast) and raBlastRDY and raBlastCount < 4 then --and fBallRDY then
	    	return _RuneArcaneBlast;
	    end
	    if ConROC:CheckBox(ConROC_SM_Rune_ArcaneSurge) and raSurgeRDY then --and fBallRDY then
	    	return _RuneArcaneSurge;
	    end
	    if ConROC:CheckBox(ConROC_SM_Rune_IceLance) and riLanceRDY and (moving or rFoFBUFF) then --and fBallRDY then
	    	return _RuneIceLance;
	    end
	    if ConROC:CheckBox(ConROC_SM_Rune_MassRegeneration) and rmRegenRDY then --and fBallRDY then
	    	return _RuneMassRegeneration;
	    end
	    if ConROC:CheckBox(ConROC_SM_Rune_Regeneration) and rRegenRDY then --and fBallRDY then
	    	return _RuneRegeneration;
	    end
	    if ConROC:CheckBox(ConROC_SM_Rune_RewindTime) and rrTimeRDY then --and fBallRDY then
	    	return _RuneRewindTime;
	    end
	    if ConROC_AoEButton:IsVisible() then
	    	if ConROC:CheckBox(ConROC_SM_AoE_ArcaneExplosion) and aExpRDY and inMelee then
		        return _ArcaneExplosion;
		    end

		    if ConROC:CheckBox(ConROC_SM_AoE_Flamestrike) and fStrikeRDY and not inMelee and fStrikeDUR <= 2 then
		        return _Flamestrike;
		    end 
		    
		    if ConROC:CheckBox(ConROC_SM_AoE_Blizzard) and blizRDY and not inMelee then
		        return _Blizzard;
		    end
		end
       	if fBlastRDY and (targetPh <= 25 or inMelee) and not ConROC_AoEButton:IsVisible() then
	        return _FireBlast;
	    end
	    if ConROC:CheckBox(ConROC_SM_Filler_Fireball) and fBallRDY then
	        return _Fireball;
	    end
    	if ConROC:CheckBox(ConROC_SM_Filler_ArcaneMissiles) and aMissRDY then
	        return _ArcaneMissiles;
	    end
        if ConROC:CheckBox(ConROC_SM_Filler_Frostbolt) and frBoltRDY then
	        return _Frostbolt;
	    end 

	else --DPS rotation for Classic Era & Classic HC


		if ConROC:CheckBox(ConROC_SM_CD_Evocation) and evoRDY and manaPercent < 25 then
			return _Evocation;
		end
		
	    if pBlastRDY and (not incombat or pomBUFF) then
	        return _Pyroblast;
	    end
	    
	    if wChillCount >= 1 and wChillDUR <= 4 then
	        return _Frostbolt;
	    end
	    
	    if fVulCount >= 1 and fVulDUR <= 4 then
	        return _Scorch;
	    end 
	    
	    if cofcRDY and frNovaDEBUFF and inMelee then
	        return _ConeofCold;
	    end
	    
	    if fBlastRDY and (targetPh <= 25 or inMelee) and not ConROC_AoEButton:IsVisible() then
	        return _FireBlast;
	    end

	    if ConROC:CheckBox(ConROC_SM_Option_UseWand) and hasWand and ((manaPercent <= 20 and not evoRDY) or targetPh <= 5) then
	        return Caster.Shoot;
	    end
	    
	    if ConROC_AoEButton:IsVisible() and bWaveRDY and inMelee then 
	        return _BlastWave;
	    end
	    
	    if ConROC_AoEButton:IsVisible() and ConROC:CheckBox(ConROC_SM_AoE_ArcaneExplosion) and aExpRDY and inMelee then
	        return _ArcaneExplosion;
	    end

	    if ConROC_AoEButton:IsVisible() and ConROC:CheckBox(ConROC_SM_AoE_Flamestrike) and fStrikeRDY and not inMelee and fStrikeDUR <= 2 then
	        return _Flamestrike;
	    end 
	    
	    if ConROC_AoEButton:IsVisible() and ConROC:CheckBox(ConROC_SM_AoE_Blizzard) and blizRDY and not inMelee then
	        return _Blizzard;
	    end 
	    if ConROC:CheckBox(ConROC_SM_CD_Combustion) and combRDY and incombat and ConROC:TalentChosen(Spec.Fire, Fire_Talent.Combustion) and fVulCount == 5 then
	        return _Combustion
	    end
	    if scorRDY and ConROC:TalentChosen(Spec.Fire, Fire_Talent.ImprovedScorch) and fVulCount < 5 then
	        return _Scorch;
	    end
	    
	    if ConROC:CheckBox(ConROC_SM_Filler_Fireball) and fBallRDY then
	        return _Fireball;
	    end
	    
	    if ConROC:CheckBox(ConROC_SM_Filler_ArcaneMissiles) and aMissRDY then
	        return _ArcaneMissiles;
	    end
	    
	    if ConROC:CheckBox(ConROC_SM_Filler_Frostbolt) and frBoltRDY then
	        return _Frostbolt;
	    end 
    end

    return nil; 		
end

function ConROC.Mage.Defense(_, timeShift, currentSpell, gcd)
--Character
	local plvl	= UnitLevel('player');

--Racials

--Resources
	local mana			= UnitPower('player', Enum.PowerType.Mana);
	local manaMax		= UnitPowerMax('player', Enum.PowerType.Mana);
	local manaPercent	= math.max(0, mana) / math.max(1, manaMax) * 100;
	
--Abilties
	local mageArmorRDY = ConROC:AbilityReady(_MageArmor, timeShift);
		local mageArmorBUFF = ConROC:Buff(_MageArmor, timeShift);
	local manaShieldRDY = ConROC:AbilityReady(_ManaShield, timeShift);
		local manaShieldBUFF = ConROC:Buff(_ManaShield, timeShift);	
	local iBarRDY = ConROC:AbilityReady(_IceBarrier, timeShift);
		local iBarBUFF = ConROC:Buff(_IceBarrier, timeShift);	
	local iArmorRDY = ConROC:AbilityReady(_IceArmor, timeShift);
		local iArmorBUFF = ConROC:Buff(_IceArmor, timeShift);	
	local frNovaRDY = ConROC:AbilityReady(_FrostNova, timeShift);

--Conditions
	local inMelee = CheckInteractDistance("target", 3);	
	local targetPh = ConROC:PercentHealth('target');
    local onVehicle = UnitHasVehicleUI("player");
	
    if onVehicle then
        return nil
    end
	
--Indicators

	
--Rotations
	if ConROC:CheckBox(ConROC_SM_Armor_Ice) and iArmorRDY and not iArmorBUFF then
		return _IceArmor;
	end
	
	if ConROC:CheckBox(ConROC_SM_Armor_Mage) and mageArmorRDY and not mageArmorBUFF then
		return _MageArmor;
	end
	
	if frNovaRDY and inMelee and targetPh >= 20 then
		return _FrostNova;
	end	

	if iBarRDY and not iBarBUFF then
		return _IceBarrier;
	end
	
	return nil;
end

function ConROC:JustCasted(spellID)
	if spellID == _Frostbolt then
		local expTime = GetTime() + 15;
		wChillEXP = expTime;
	end

    if spellID == _Flamestrike then
		local expTime = GetTime() + 8;
		fStrikeEXP = expTime;
	end

    if spellID == _FlamestrikeDR then
        local expTime = GetTime() + 8;
        fStrikeDREXP = expTime;
    end

    if spellID == _Scorch then
		local expTime = GetTime() + 30;
		fVulEXP = expTime;
	end
end