ConROC.Mage = {};

local ConROC_Mage, ids = ...;

function ConROC:EnableRotationModule()
	self.Description = "Mage";
	self.NextSpell = ConROC.Mage.Damage;

	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;

	if ConROCSpellmenuClass == nil then
		ConROC:SpellmenuClass();
	end
end

function ConROC:EnableDefenseModule()
	self.NextDef = ConROC.Mage.Defense;
end

function ConROC:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end

	ConROC:JustCasted(spellID);
end

local Racial, Spec, Caster, Ability, Rank, Arc_Talent, Fire_Talent, Frost_Talent, Engrave, Runes, Buff, Debuff = ids.Racial, ids.Spec, ids.Caster, ids.Ability, ids.Rank, ids.Arcane_Talent, ids.Fire_Talent, ids.Frost_Talent, ids.Engrave, ids.Runes, ids.Buff, ids.Debuff;
local wChillEXP = 0;
local fVulEXP = 0;
local fStrikeEXP = 0;
local fStrikeDREXP = 0;

--Info
local _Player_Spec, _Player_Spec_ID = ConROC:currentSpec();
local _Player_Level = UnitLevel("player");
local _Player_Percent_Health = ConROC:PercentHealth('player');
local _is_PvP = ConROC:IsPvP();
local _in_combat = UnitAffectingCombat('player');
local _party_size = GetNumGroupMembers();
local _is_PC = UnitPlayerControlled("target");
local _is_Enemy = ConROC:TarHostile();
local _Target_Health = UnitHealth('target');
local _Target_Percent_Health = ConROC:PercentHealth('target');

--Resources
local _Mana, _Mana_Max, _Mana_Percent = ConROC:PlayerPower('Mana');

--Conditions
local _Queue = 0;
local _Has_Wand = HasWandEquipped();
local _is_moving = ConROC:PlayerSpeed();
local _enemies_in_melee, _target_in_melee = ConROC:Targets("Melee");
local _enemies_in_10yrds, _target_in_10yrds = ConROC:Targets("10");
local _enemies_in_20yrds, _target_in_20yrds = ConROC:Targets("20");
local _enemies_in_40yrds, _target_in_40yrds = ConROC:Targets("40");
local _can_Execute = _Target_Percent_Health < 20;

--Racials
local _Berserking, _Berserking_RDY = _, _;
local _EscapeArtist, _EscapeArtist_RDY = _, _;
local _Perception, _Perception_RDY = _, _;

function ConROC:Stats()
	_Player_Spec, _Player_Spec_ID = ConROC:currentSpec();
	_Player_Level = UnitLevel("player");
	_Player_Percent_Health = ConROC:PercentHealth('player');
	_is_PvP = ConROC:IsPvP();
	_in_combat = UnitAffectingCombat('player');
	_party_size = GetNumGroupMembers();
	_is_PC = UnitPlayerControlled("target");
	_is_Enemy = ConROC:TarHostile();
	_Target_Health = UnitHealth('target');
	_Target_Percent_Health = ConROC:PercentHealth('target');

	_Mana, _Mana_Max, _Mana_Percent = ConROC:PlayerPower('Mana');

	_Queue = 0;
	_Has_Wand = HasWandEquipped();
	_is_moving = ConROC:PlayerSpeed();
	_enemies_in_melee, _target_in_melee = ConROC:Targets("Melee");
	_enemies_in_10yrds, _target_in_10yrds = ConROC:Targets("10");
	_enemies_in_20yrds, _target_in_20yrds = ConROC:Targets("20");
	_enemies_in_40yrds, _target_in_40yrds = ConROC:Targets("40");
	_can_Execute = _Target_Percent_Health < 20;

	_Berserking, _Berserking_RDY = ConROC:AbilityReady(Racial.Berserking, timeShift);
	_EscapeArtist, _EscapeArtist_RDY = ConROC:AbilityReady(Racial.EscapeArtist, timeShift);
	_Perception, _Perception_RDY = ConROC:AbilityReady(Racial.Perception, timeShift);
end

function ConROC.Mage.Damage(_, timeShift, currentSpell, gcd)
	ConROC:UpdateSpellID();
	wipe(ConROC.SuggestedSpells);
	ConROC:Stats();

--Abilties	
	local _AmplifyMagic, _AmplifyMagic_RDY	= ConROC:AbilityReady(Ability.AmplifyMagic, timeShift);
		local _AmplifyMagic_BUFF = ConROC:Aura(_AmplifyMagic, timeShift);
	local _ArcaneExplosion, _ArcaneExplosion_RDY = ConROC:AbilityReady(Ability.ArcaneExplosion, timeShift);
	local _ArcaneIntellect, _ArcaneIntellect_RDY = ConROC:AbilityReady(Ability.ArcaneIntellect, timeShift);
		local _ArcaneIntellect_BUFF = ConROC:Aura(_ArcaneIntellect, timeShift);
	local _ArcaneBrilliance, _ArcaneBrilliance_RDY = ConROC:AbilityReady(Ability.ArcaneBrilliance, timeShift);
		local _ArcaneBrilliance_BUFF = ConROC:Aura(_ArcaneBrilliance, timeShift);
	local _ArcaneMissiles, _ArcaneMissiles_RDY = ConROC:AbilityReady(Ability.ArcaneMissiles, timeShift);
	local _ArcanePower, _ArcanePower_RDY = ConROC:AbilityReady(Ability.ArcanePower, timeShift);
	local _Blink, _Blink_RDY = ConROC:AbilityReady(Ability.Blink, timeShift);
	local _ConjureManaAgate, _ConjureManaAgate_RDY = ConROC:AbilityReady(Ability.ConjureManaAgate, timeShift);
	local _ConjureManaJade, _ConjureManaJade_RDY = ConROC:AbilityReady(Ability.ConjureManaJade, timeShift);
	local _ConjureManaCitrine, _ConjureManaCitrine_RDY = ConROC:AbilityReady(Ability.ConjureManaCitrine, timeShift);
	local _ConjureManaRuby, _ConjureManaRuby_RDY = ConROC:AbilityReady(Ability.ConjureManaRuby, timeShift);
	local _Counterspell, _Counterspell_RDY = ConROC:AbilityReady(Ability.Counterspell, timeShift);
	local _DampenMagic, _DampenMagic_RDY = ConROC:AbilityReady(Ability.DampenMagic, timeShift);
		local _DampenMagic_BUFF = ConROC:Aura(_DampenMagic, timeShift);
	local _Evocation, _Evocation_RDY = ConROC:AbilityReady(Ability.Evocation, timeShift);
	local _PresenceofMind, _PresenceofMind_RDY = ConROC:AbilityReady(Ability.PresenceofMind, timeShift);
		local _PresenceofMind_BUFF = ConROC:Aura(_PresenceofMind, timeShift);
	local _BlastWave, _BlastWave_RDY = ConROC:AbilityReady(Ability.BlastWave, timeShift);
    local _Combustion, _Combustion_RDY = ConROC:AbilityReady(Ability.Combustion, timeShift);
	local _FireBlast, _FireBlast_RDY = ConROC:AbilityReady(Ability.FireBlast, timeShift);
	local _Fireball, _Fireball_RDY = ConROC:AbilityReady(Ability.Fireball, timeShift);
		local _Fireball_DEBUFF = ConROC:TargetAura(_Fireball, timeShift);
	local _Flamestrike, _Flamestrike_RDY = ConROC:AbilityReady(Ability.Flamestrike, timeShift);
		local _Flamestrike_DUR = fStrikeEXP - GetTime();
    local _FlamestrikeDR, _FlamestrikeDR_RDY = ConROC:AbilityReady(Ability.FlamestrikeDR, timeShift);
        local _FlamestrikeDR_DUR = fStrikeDREXP - GetTime();
	local _Pyroblast, _Pyroblast_RDY = ConROC:AbilityReady(Ability.Pyroblast, timeShift);
	local _Scorch, _Scorch_RDY = ConROC:AbilityReady(Ability.Scorch, timeShift);
	local _Blizzard, _Blizzard_RDY = ConROC:AbilityReady(Ability.Blizzard, timeShift);
	local _ColdSnap, _ColdSnap_RDY = ConROC:AbilityReady(Ability.ColdSnap, timeShift);
	local _ConeofCold, _ConeofCold_RDY = ConROC:AbilityReady(Ability.ConeofCold, timeShift);
	local _Frostbolt, _Frostbolt_RDY = ConROC:AbilityReady(Ability.Frostbolt, timeShift);
		local _Frostbolt_DEBUFF = ConROC:TargetAura(_Frostbolt, timeShift);
	local _FrostNova, _FrostNova_RDY = ConROC:AbilityReady(Ability.FrostNova, timeShift);
		local _FrostNova_DEBUFF = ConROC:TargetAura(_FrostNova);

	   	local _Chilled_DEBUFF = ConROC:TargetAura(Debuff.Chilled, timeShift);
	   	local _WintersChill_DEBUFF, _WintersChill_COUNT = ConROC:TargetAura(Debuff.WintersChill);
	   	local _WintersChill_DUR = wChillEXP - GetTime();
	   	local _FireVulnerability_DEBUFF, _FireVulnerability_COUNT = ConROC:TargetAura(Debuff.FireVulnerability);
	   	local _FireVulnerability_DUR = fVulEXP - GetTime();

	local _, impArcPoints = ConROC:TalentChosen(Spec.Arcane, Arc_Talent.ImprovedArcaneMissiles)

--Runes
	local _ArcaneBlast, _ArcaneBlast_RDY = ConROC:AbilityReady(Runes.ArcaneBlast, timeShift);
		local _, _ArcaneBlast_COUNT = ConROC:TargetAura(_ArcaneBlast);
	local _ArcaneSurge, _ArcaneSurge_RDY = ConROC:AbilityReady(Runes.ArcaneSurge, timeShift);
	local _FrostfireBolt, _FrostfireBolt_RDY = ConROC:AbilityReady(Runes.FrostfireBolt, timeShift);
	local _IceLance, _IceLance_RDY = ConROC:AbilityReady(Runes.IceLance, timeShift);
	local _IcyVeins, _IcyVeins_RDY = ConROC:AbilityReady(Runes.IcyVeins, timeShift);
	local _LivingBomb, _LivingBomb_RDY = ConROC:AbilityReady(Runes.LivingBomb, timeShift);
		local _LivingBomb_DEBUFF = ConROC:TargetAura(_LivingBomb, timeShift);
	local _LivingFlame, _LivingFlame_RDY = ConROC:AbilityReady(Runes.LivingFlame, timeShift);
		local _LivingFlame_DEBUFF = ConROC:TargetAura(Debuff.LivingFlame, timeShift);
	local _MassRegeneration, _MassRegeneration_RDY = ConROC:AbilityReady(Runes.MassRegeneration, timeShift);
	local _Regeneration, _Regeneration_RDY = ConROC:AbilityReady(Runes.Regeneration, timeShift);
	local _RewindTime, _RewindTime_RDY = ConROC:AbilityReady(Runes.RewindTime, timeShift);
	local _FingersofFrost_BUFF, _FingersofFrost_COUNT, _FingersofFrost_DUR = ConROC:Aura(Buff.FingersofFrost, timeShift);

--Conditions
    local resting = IsResting();
    local mounted = IsMounted();
    local onVehicle = UnitHasVehicleUI("player");

    if onVehicle then
        return nil
    end

--Indicators	
	ConROC:AbilityBurst(_Evocation, _Evocation_RDY and _Mana_Percent <= 10);
	ConROC:AbilityBurst(_PresenceofMind, _PresenceofMind_RDY and _in_combat);
	ConROC:AbilityBurst(_ArcanePower, _ArcanePower_RDY and _in_combat and (not ConROC:TalentChosen(Spec.Frost, Frost_Talent.WintersChill) or (ConROC:TalentChosen(Spec.Frost, Frost_Talent.WintersChill) and _WintersChill_COUNT == 5))) ;
	ConROC:AbilityBurst(_Combustion, _Combustion_RDY and _in_combat and (not ConROC:TalentChosen(Spec.Fire, Fire_Talent.ImprovedScorch) or (ConROC:TalentChosen(Spec.Fire, Fire_Talent.ImprovedScorch) and _FireVulnerability_COUNT == 5)));

	ConROC:AbilityRaidBuffs(_ArcaneIntellect, _ArcaneIntellect_RDY and not (_ArcaneIntellect_BUFF or _ArcaneBrilliance_BUFF));
    ConROC:AbilityInterrupt(_Counterspell, _Counterspell_RDY and ConROC:Interrupt())

--Warnings

--Rotations
	repeat
		while(true) do
			if ConROC:CheckBox(ConROC_SM_CD_Evocation) and ((_Evocation_RDY and _Mana_Percent < 10) or currentSpell == _Evocation) then
				tinsert(ConROC.SuggestedSpells, _Evocation);
				_Evocation_RDY = false;
				_Queue = _Queue + 1;
				break;
			end

			if ConROC.Seasons.IsSoD then --DPS rotation for SoD
				if _Player_Level < 10 or not _Player_Spec_ID then
					if ConROC:CheckBox(ConROC_SM_Rune_IcyVeins) and _IcyVeins_RDY then
						tinsert(ConROC.SuggestedSpells, _IcyVeins);
						_IcyVeins_RDY = false;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Rune_LivingFlame) and _LivingFlame_RDY then
						tinsert(ConROC.SuggestedSpells, _LivingFlame);
						_LivingFlame_RDY = false;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Rune_LivingBomb) and _LivingBomb_RDY and not _LivingBomb_DEBUFF and ((_Target_Percent_Health >= 5 and ConROC:Raidmob()) or (_Target_Percent_Health >= 20 and not ConROC:Raidmob())) then
						tinsert(ConROC.SuggestedSpells, _LivingBomb);
						_LivingBomb_DEBUFF = true;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Rune_ArcaneBlast) and _ArcaneBlast_RDY and _ArcaneBlast_COUNT < ConROC_SM_Rune_ArcaneBlastCount:GetNumber() then
						tinsert(ConROC.SuggestedSpells, _ArcaneBlast);
						_ArcaneBlast_COUNT = _ArcaneBlast_COUNT + 1;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Rune_ArcaneSurge) and _ArcaneSurge_RDY then
						tinsert(ConROC.SuggestedSpells, _ArcaneSurge);
						_ArcaneSurge_RDY = false;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Rune_IceLance) and _IceLance_RDY and (_is_moving or _FingersofFrost_COUNT > 1) then
						tinsert(ConROC.SuggestedSpells, _IceLance);
						_FingersofFrost_COUNT = _FingersofFrost_COUNT - 1;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Rune_MassRegeneration) and _MassRegeneration_RDY then
						tinsert(ConROC.SuggestedSpells, _MassRegeneration);
						_MassRegeneration_RDY = false;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Rune_Regeneration) and _Regeneration_RDY then
						tinsert(ConROC.SuggestedSpells, _Regeneration);
						_Regeneration_RDY = false;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Rune_RewindTime) and _RewindTime_RDY then
						tinsert(ConROC.SuggestedSpells, _RewindTime);
						_RewindTime_RDY = false;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC_AoEButton:IsVisible() then
						if ConROC:CheckBox(ConROC_SM_AoE_ArcaneExplosion) and _ArcaneExplosion_RDY and _target_in_melee then
							tinsert(ConROC.SuggestedSpells, _ArcaneExplosion);
							_Queue = _Queue + 1;
							break;
						end

						if ConROC:CheckBox(ConROC_SM_AoE_Flamestrike) and _Flamestrike_RDY and not _target_in_melee and _Flamestrike_DUR <= 2 then
							tinsert(ConROC.SuggestedSpells, _Flamestrike);
							_Queue = _Queue + 1;
							break;
						end

						if ConROC:CheckBox(ConROC_SM_AoE_Blizzard) and _Blizzard_RDY and not _target_in_melee then
							tinsert(ConROC.SuggestedSpells, _Blizzard);
							_Queue = _Queue + 1;
							break;
						end
					end

					if _FireBlast_RDY and (_Target_Percent_Health <= 25 or _target_in_melee) and not ConROC_AoEButton:IsVisible() then
						tinsert(ConROC.SuggestedSpells, _FireBlast);
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Filler_Frostbolt) and _Frostbolt_RDY and _FingersofFrost_COUNT == 1 then
						tinsert(ConROC.SuggestedSpells, _Frostbolt);
						_Queue = _Queue + 1;
						break;
					end
					if ConROC:CheckBox(ConROC_SM_Rune_IceLance) and _IceLance_RDY and (_is_moving or _FingersofFrost_BUFF) then
						tinsert(ConROC.SuggestedSpells, _IceLance);
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Option_UseWand) and _Has_Wand and ((_Mana_Percent <= 10 and not _Evocation_RDY) or _Target_Percent_Health <= 5) then
						tinsert(ConROC.SuggestedSpells, Caster.Shoot);
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Filler_FrostfireBolt) and _FrostfireBolt_RDY then
						tinsert(ConROC.SuggestedSpells, _FrostfireBolt);
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Filler_Fireball) and _Fireball_RDY then
						tinsert(ConROC.SuggestedSpells, _Fireball);
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Filler_ArcaneMissiles) and _ArcaneMissiles_RDY then
						tinsert(ConROC.SuggestedSpells, _ArcaneMissiles);
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Filler_Frostbolt) and _Frostbolt_RDY then
						tinsert(ConROC.SuggestedSpells, _Frostbolt);
						_Queue = _Queue + 1;
						break;
					end
				else
					if (_Player_Spec_ID == ids.Spec.Arcane) then
						if ConROC_AoEButton:IsVisible() then
							if ConROC:CheckBox(ConROC_SM_Rune_LivingFlame) and _LivingFlame_RDY then
								tinsert(ConROC.SuggestedSpells, _LivingFlame);
								_LivingFlame_RDY = false;
								_Queue = _Queue + 1;
								break;
							end

							--[[if ConROC:CheckBox(ConROC_SM_Rune_ArcaneBlast) and _ArcaneBlast_RDY and _ArcaneBlast_COUNT < ConROC_SM_Rune_ArcaneBlastCount:GetNumber() then
								tinsert(ConROC.SuggestedSpells, _ArcaneBlast);
								_ArcaneBlast_COUNT = _ArcaneBlast_COUNT + 1;
								_Queue = _Queue + 1;
								break;
							end]]

							if _ArcaneExplosion_RDY and _target_in_melee then
								tinsert(ConROC.SuggestedSpells, _ArcaneExplosion);
								_Queue = _Queue + 1;
								break;
							end
						else
							if ConROC:CheckBox(ConROC_SM_Rune_LivingFlame) and _LivingFlame_RDY then
								tinsert(ConROC.SuggestedSpells, _LivingFlame);
								_LivingFlame_RDY = false;
								_Queue = _Queue + 1;
								break;
							end

							if ConROC:CheckBox(ConROC_SM_Rune_ArcaneBlast) and _ArcaneBlast_RDY and _ArcaneBlast_COUNT < ConROC_SM_Rune_ArcaneBlastCount:GetNumber() then
								tinsert(ConROC.SuggestedSpells, _ArcaneBlast);
								_ArcaneBlast_COUNT = _ArcaneBlast_COUNT + 1;
								_Queue = _Queue + 1;
								break;
							end

							if ConROC:CheckBox(ConROC_SM_Filler_ArcaneMissiles) and _ArcaneMissiles_RDY then
								tinsert(ConROC.SuggestedSpells, _ArcaneMissiles);
								_Queue = _Queue + 1;
								break;
							end
						end
					elseif (_Player_Spec_ID == ids.Spec.Fire) then
						if ConROC_AoEButton:IsVisible() then
							if _ArcaneExplosion_RDY and (_Target_Percent_Health <= 25 or _target_in_melee) and _enemies_in_10yrds > 2 then
								tinsert(ConROC.SuggestedSpells, _ArcaneExplosion);
								_Queue = _Queue + 1;
								break;
							elseif _FireBlast_RDY and (_Target_Percent_Health <= 25 or _target_in_melee) then
								tinsert(ConROC.SuggestedSpells, _FireBlast);
								_FireBlast_RDY = false;
								_Queue = _Queue + 1;
								break;
							end

							if ConROC:CheckBox(ConROC_SM_Rune_LivingBomb) and _LivingBomb_RDY and not _LivingBomb_DEBUFF and ((_Target_Percent_Health >= 5 and ConROC:Raidmob()) or (_Target_Percent_Health >= 20 and not ConROC:Raidmob())) then
								tinsert(ConROC.SuggestedSpells, _LivingBomb);
								_LivingBomb_DEBUFF = true;
								_Queue = _Queue + 1;
								break;
							end

							if ConROC:CheckBox(ConROC_SM_Rune_LivingFlame) and _LivingFlame_RDY and ConROC_AoEButton:IsVisible() then
								tinsert(ConROC.SuggestedSpells, _LivingFlame);
								_LivingFlame_RDY = false;
								_Queue = _Queue + 1;
								break;
							end

							if _ArcaneExplosion_RDY and _target_in_melee then
								tinsert(ConROC.SuggestedSpells, _ArcaneExplosion);
								_Queue = _Queue + 1;
								break;
							end
						else
							if _Pyroblast_RDY and not _in_combat then
								tinsert(ConROC.SuggestedSpells, _Pyroblast);
								_in_combat = true;
								_Queue = _Queue + 1;
								break;
							end

							if _ArcaneExplosion_RDY and (_Target_Percent_Health <= 25 or _target_in_melee) and _enemies_in_10yrds > 2 then
								tinsert(ConROC.SuggestedSpells, _ArcaneExplosion);
								_Queue = _Queue + 1;
								break;
							end

							if _FireBlast_RDY and (_Target_Percent_Health <= 25 or _target_in_melee) then
								tinsert(ConROC.SuggestedSpells, _FireBlast);
								_FireBlast_RDY = false;
								_Queue = _Queue + 1;
								break;
							end

							if ConROC:CheckBox(ConROC_SM_Rune_LivingFlame) and _LivingFlame_RDY then
								tinsert(ConROC.SuggestedSpells, _LivingFlame);
								_LivingFlame_RDY = false;
								_Queue = _Queue + 1;
								break;
							end

							if _Scorch_RDY and ConROC:TalentChosen(Spec.Fire, Fire_Talent.ImprovedScorch) and _FireVulnerability_COUNT < 5 then
								tinsert(ConROC.SuggestedSpells, _Scorch);
								_FireVulnerability_COUNT = _FireVulnerability_COUNT + 1;
								_Queue = _Queue + 1;
								break;
							end

							if ConROC:CheckBox(ConROC_SM_Rune_LivingBomb) and _LivingBomb_RDY and not _LivingBomb_DEBUFF and ((_Target_Percent_Health >= 5 and ConROC:Raidmob()) or (_Target_Percent_Health >= 20 and not ConROC:Raidmob())) then
								tinsert(ConROC.SuggestedSpells, _LivingBomb);
								_LivingBomb_DEBUFF = true;
								_Queue = _Queue + 1;
								break;
							end

							if ConROC:CheckBox(ConROC_SM_Rune_IcyVeins) and _IcyVeins_RDY then
								tinsert(ConROC.SuggestedSpells, _IcyVeins);
								_IcyVeins_RDY = false;
								_Queue = _Queue + 1;
								break;
							end

							if ConROC:CheckBox(ConROC_SM_Option_UseWand) and _Has_Wand and ((_Mana_Percent <= 10 and not _Evocation_RDY) or _Target_Percent_Health <= 5) then
								tinsert(ConROC.SuggestedSpells, Caster.Shoot);
								_Queue = _Queue + 1;
								break;
							end

							if ConROC:CheckBox(ConROC_SM_Filler_FrostfireBolt) and _FrostfireBolt_RDY then
								tinsert(ConROC.SuggestedSpells, _FrostfireBolt);
								_Queue = _Queue + 1;
								break;
							end

							if ConROC:CheckBox(ConROC_SM_Filler_Fireball) and _Fireball_RDY then
								tinsert(ConROC.SuggestedSpells, _Fireball);
								_Queue = _Queue + 1;
								break;
							end
						end
					elseif (_Player_Spec_ID == ids.Spec.Frost) then
						if ConROC_AoEButton:IsVisible() then
							if _ArcaneExplosion_RDY and ((_Target_Percent_Health <= 25 and _target_in_melee) or _target_in_melee) then
								tinsert(ConROC.SuggestedSpells, _ArcaneExplosion);
								_Queue = _Queue + 1;
								break;
							end

							if ConROC:CheckBox(ConROC_SM_Rune_LivingBomb) and _LivingBomb_RDY and not _LivingBomb_DEBUFF and ((_Target_Percent_Health >= 5 and ConROC:Raidmob()) or (_Target_Percent_Health >= 20 and not ConROC:Raidmob())) then
								tinsert(ConROC.SuggestedSpells, _LivingBomb);
								_LivingBomb_DEBUFF = true;
								_Queue = _Queue + 1;
								break;
							end

							if ConROC:CheckBox(ConROC_SM_Rune_LivingFlame) and _LivingFlame_RDY and ConROC_AoEButton:IsVisible() then
								tinsert(ConROC.SuggestedSpells, _LivingFlame);
								_LivingFlame_RDY = false;
								_Queue = _Queue + 1;
								break;
							end

							if _Blizzard_RDY then
								tinsert(ConROC.SuggestedSpells, _Blizzard);
								_Queue = _Queue + 1;
								break;
							end
						else
							if _ArcaneExplosion_RDY and (_Target_Percent_Health <= 25 or _target_in_melee) and _enemies_in_10yrds > 2 then
								tinsert(ConROC.SuggestedSpells, _ArcaneExplosion);
								_Queue = _Queue + 1;
								break;
							end

							if _FireBlast_RDY and (_Target_Percent_Health <= 25 or _target_in_melee) then
								tinsert(ConROC.SuggestedSpells, _FireBlast);
								_FireBlast_RDY = false;
								_Queue = _Queue + 1;
								break;
							end

							if ConROC:CheckBox(ConROC_SM_Rune_IceLance) and _IceLance_RDY and (_is_moving or _FingersofFrost_COUNT > 1) then
								tinsert(ConROC.SuggestedSpells, _IceLance);
								_FingersofFrost_COUNT = _FingersofFrost_COUNT - 1;
								_Queue = _Queue + 1;
								break;
							end

							if ConROC:CheckBox(ConROC_SM_Rune_LivingBomb) and _LivingBomb_RDY and not _LivingBomb_DEBUFF and ((_Target_Percent_Health >= 5 and ConROC:Raidmob()) or (_Target_Percent_Health >= 20 and not ConROC:Raidmob())) then
								tinsert(ConROC.SuggestedSpells, _LivingBomb);
								_LivingBomb_DEBUFF = true;
								_Queue = _Queue + 1;
								break;
							end

							if ConROC:CheckBox(ConROC_SM_Rune_IcyVeins) and _IcyVeins_RDY then
								tinsert(ConROC.SuggestedSpells, _IcyVeins);
								_IcyVeins_RDY = false;
								_Queue = _Queue + 1;
								break;
							end

							if ConROC:CheckBox(ConROC_SM_Filler_FrostfireBolt) and _FrostfireBolt_RDY and _FingersofFrost_COUNT == 1 then
								tinsert(ConROC.SuggestedSpells, _FrostfireBolt);
								_Queue = _Queue + 1;
								break;
							end

							if ConROC:CheckBox(ConROC_SM_Filler_Frostbolt) and _Frostbolt_RDY and _FingersofFrost_COUNT == 1 then
								tinsert(ConROC.SuggestedSpells, _Frostbolt);
								_FingersofFrost_COUNT = _FingersofFrost_COUNT - 1;
								_Queue = _Queue + 1;
								break;
							end

							if ConROC:CheckBox(ConROC_SM_Rune_IceLance) and _IceLance_RDY and (_is_moving or _FingersofFrost_COUNT >= 1) then
								tinsert(ConROC.SuggestedSpells, _IceLance);
								_FingersofFrost_COUNT = _FingersofFrost_COUNT - 1;
								_Queue = _Queue + 1;
								break;
							end

							if ConROC:CheckBox(ConROC_SM_Option_UseWand) and _Has_Wand and ((_Mana_Percent <= 10 and not _Evocation_RDY) or _Target_Percent_Health <= 5) then
								tinsert(ConROC.SuggestedSpells, Caster.Shoot);
								_Queue = _Queue + 1;
								break;
							end

							if ConROC:CheckBox(ConROC_SM_Filler_FrostfireBolt) and _FrostfireBolt_RDY then
								tinsert(ConROC.SuggestedSpells, _FrostfireBolt);
								_Queue = _Queue + 1;
								break;
							end

							if ConROC:CheckBox(ConROC_SM_Filler_Frostbolt) and _Frostbolt_RDY then
								tinsert(ConROC.SuggestedSpells, _Frostbolt);
								_Queue = _Queue + 1;
								break;
							end
						end
					end
				end
			else --DPS rotation for Classic Era & Classic HC
				if _Pyroblast_RDY and (not _in_combat or _PresenceofMind_BUFF) then
					tinsert(ConROC.SuggestedSpells, _Pyroblast);
					_in_combat = true;
					_PresenceofMind_BUFF = false;
					_Queue = _Queue + 1;
					break;
				end

				if _WintersChill_COUNT >= 1 and _WintersChill_DUR <= 4 then
					tinsert(ConROC.SuggestedSpells, _Frostbolt);
					_WintersChill_COUNT = _WintersChill_COUNT + 1
					_WintersChill_DUR = 15;
					_Queue = _Queue + 1;
					break;
				end

				if _FireVulnerability_COUNT >= 1 and _FireVulnerability_DUR <= 4 then
					tinsert(ConROC.SuggestedSpells, _Scorch);
					_FireVulnerability_COUNT = _FireVulnerability_COUNT + 1;
					_FireVulnerability_DUR = 30;
					_Queue = _Queue + 1;
					break;
				end

				if _ConeofCold_RDY and _FrostNova_DEBUFF and _target_in_10yrds then
					tinsert(ConROC.SuggestedSpells, _ConeofCold);
					_ConeofCold_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if _FireBlast_RDY and (_Target_Percent_Health <= 25 or _target_in_melee) and not ConROC_AoEButton:IsVisible() then
					tinsert(ConROC.SuggestedSpells, _FireBlast);
					_FireBlast_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Option_UseWand) and _Has_Wand and ((_Mana_Percent <= 10 and not _Evocation_RDY) or _Target_Percent_Health <= 5) then
					tinsert(ConROC.SuggestedSpells, Caster.Shoot);
					_Queue = _Queue + 1;
					break;
				end

				if ConROC_AoEButton:IsVisible() and _BlastWave_RDY and _target_in_melee then
					tinsert(ConROC.SuggestedSpells, _BlastWave);
					_BlastWave_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC_AoEButton:IsVisible() and ConROC:CheckBox(ConROC_SM_AoE_ArcaneExplosion) and _ArcaneExplosion_RDY and _target_in_melee then
					tinsert(ConROC.SuggestedSpells, _ArcaneExplosion);
					_Queue = _Queue + 1;
					break;
				end

				if ConROC_AoEButton:IsVisible() and ConROC:CheckBox(ConROC_SM_AoE_Flamestrike) and _Flamestrike_RDY and not _target_in_melee and _Flamestrike_DUR <= 2 then
					tinsert(ConROC.SuggestedSpells, _Flamestrike);
					_Flamestrike_DUR = 8;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC_AoEButton:IsVisible() and ConROC:CheckBox(ConROC_SM_AoE_Blizzard) and _Blizzard_RDY and not _target_in_melee then
					tinsert(ConROC.SuggestedSpells, _Blizzard);
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_CD_Combustion) and _Combustion_RDY and _in_combat and _FireVulnerability_COUNT == 5 then
					tinsert(ConROC.SuggestedSpells, _Combustion);
					_Combustion_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if _Scorch_RDY and ConROC:TalentChosen(Spec.Fire, Fire_Talent.ImprovedScorch) and _FireVulnerability_COUNT < 5 then
					tinsert(ConROC.SuggestedSpells, _Scorch);
					_FireVulnerability_COUNT = _FireVulnerability_COUNT + 1;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Filler_Fireball) and _Fireball_RDY then
					tinsert(ConROC.SuggestedSpells, _Fireball);
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Filler_ArcaneMissiles) and _ArcaneMissiles_RDY then
					tinsert(ConROC.SuggestedSpells, _ArcaneMissiles);
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Filler_Frostbolt) and _Frostbolt_RDY then
					tinsert(ConROC.SuggestedSpells, _Frostbolt);
					_Queue = _Queue + 1;
					break;
				end
			end

			tinsert(ConROC.SuggestedSpells, 26008); --Waiting Spell Icon
			_Queue = _Queue + 3;
			break;
		end
	until _Queue >= 3;
return nil;
end

function ConROC.Mage.Defense(_, timeShift, currentSpell, gcd)
	ConROC:UpdateSpellID();
	wipe(ConROC.SuggestedDefSpells);
	ConROC:Stats();

--Abilties
	local _IceArmor, _IceArmor_RDY = ConROC:AbilityReady(Ability.IceArmor, timeShift);
		local _IceArmor_BUFF = ConROC:Aura(_IceArmor, timeShift);
	local _IceBarrier, _IceBarrier_RDY = ConROC:AbilityReady(Ability.IceBarrier, timeShift);
		local _IceBarrier_BUFF = ConROC:Aura(_IceBarrier, timeShift);
	local _FrostNova, _FrostNova_RDY = ConROC:AbilityReady(Ability.FrostNova, timeShift);
	local _MageArmor, _MageArmor_RDY = ConROC:AbilityReady(Ability.MageArmor, timeShift);
		local _MageArmor_BUFF = ConROC:Aura(_MageArmor, timeShift);
	local _ManaShield, _ManaShield_RDY = ConROC:AbilityReady(Ability.ManaShield, timeShift);
		local _ManaShield_BUFF = ConROC:Aura(_ManaShield, timeShift);

	local _MoltenArmor, _MoltenArmor_RDY = ConROC:AbilityReady(Runes.MoltenArmor, timeShift);
		local _MoltenArmor_BUFF = ConROC:Aura(_MoltenArmor, timeShift);


--Conditions

--Indicators

--Rotations
	if ConROC:CheckBox(ConROC_SM_Armor_Ice) and _IceArmor_RDY and not _IceArmor_BUFF then
		tinsert(ConROC.SuggestedDefSpells, _IceArmor);
	end

	if ConROC:CheckBox(ConROC_SM_Armor_Mage) and _MageArmor_RDY and not _MageArmor_BUFF then
		tinsert(ConROC.SuggestedDefSpells, _MageArmor);
	end

	if ConROC:CheckBox(ConROC_SM_Armor_MoltenArmor) and _MoltenArmor_RDY and not _MoltenArmor_BUFF then
		tinsert(ConROC.SuggestedDefSpells, _MoltenArmor);
	end

	if _FrostNova_RDY and _target_in_melee and _Target_Percent_Health >= 20 then
		tinsert(ConROC.SuggestedDefSpells, _FrostNova);
	end

	if _IceBarrier_RDY and not _IceBarrier_BUFF then
		tinsert(ConROC.SuggestedDefSpells, _IceBarrier);
	end
return nil;
end

function ConROC:JustCasted(spellID)
	if spellID == Ability.Frostbolt then
		local expTime = GetTime() + 15;
		wChillEXP = expTime;
	end

    if spellID == Ability.Flamestrike then
		local expTime = GetTime() + 8;
		fStrikeEXP = expTime;
	end

    if spellID == Ability.FlamestrikeDR then
        local expTime = GetTime() + 8;
        fStrikeDREXP = expTime;
    end

    if spellID == Ability.Scorch then
		local expTime = GetTime() + 30;
		fVulEXP = expTime;
	end
end
