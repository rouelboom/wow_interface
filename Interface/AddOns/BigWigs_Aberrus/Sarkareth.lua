--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Scalecommander Sarkareth", 2569, 2520)
if not mod then return end
mod:RegisterEnableMob(201754)
mod:SetEncounterID(2685)
mod:SetRespawnTime(30)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Locals
--

local voidEmpowermentCount = 1
local nextStageHealth = 63

-- Stage One: The Legacy of the Dracthyr
local opressingHowlCount = 1
local glitteringSurgeCount = 1
local bombCount = 1
local massDisintergrateCount = 1
local breathCount = 1
local clawsCount = 1

-- Stage Two: A Touch of the Forbidden
local nullGlimmerMarks = {}
local nullGlimmerCollector = {}
local desolateBlossomCount = 1
local infiniteDuressCount = 1

-- Stage Three: The Seas of Infinity
local cosmicAscensionCount = 1
local hurtlingBarrageCount = 1
local scouringEternityCount = 1
local embraceOfNothingnessCount = 1

--------------------------------------------------------------------------------
-- Timers
--

local timersNormal = {
	[1] = {
		[401810] = {3.3, 94.8}, -- Glittering Surge
		[401500] = {1.1, 58.9}, -- Scorching Bomb
		[401680] = { 24.9, 23.3, 44.4}, -- Mass Disintegrate
		[402050] = {26.7, 35.5}, -- Searing Breath
	},
	[2] = {
		[404027] = {15.8, 65.3}, -- Void Bomb
		[404456] = {3.7, 46.3}, -- Abyssal Breath
		[404403] = {11.2, 46.2, 40.0}, -- Desolate Blossom
		[411241] = {20, 18.7, 22.5, 22.5, 22.5}, -- Void Claws
	},
	[3] = {
		[404027] = {30.4, 65.3, 65.3, 102.7, 65.3}, -- Void Bomb
		[403771] = {7.7, 65.3, 105.3, 62.7, 105.3}, -- Cosmic Ascension
		[405486] = {21.0, 46.7, 102.7, 65.3, 102.7}, -- Hurtling Barrage
		[403625] = {49.8, 81.5, 87.4, 81.4}, -- Scouring Eternity
		[403520] = {26.4, 118.7, 53.3, 114.7}, -- Embrace of Nothingness
		[408429] = {22.4, 38.6, 40.0, 90.7, 12.0, 25.3, 40.0}, -- Void Slash
	},
}

local timersHeroic = {
	[1] = {
		[401810] = {3.3, 97.7}, -- Glittering Surge
		[401500] = {1.1, 32.2, 26.6, 18.9}, -- Scorching Bomb
		[401680] = {24.9, 24.0, 22.7, 21.1}, -- Mass Disintegrate
		[402050] = {26.7, 15.5, 20.0}, -- Searing Breath
	},
	[2] = {
		[404027] = {15.3, 60.0}, -- Void Bomb
		[404456] = {3.5, 43.5, 35.3}, -- Abyssal Breath
		[404403] = {10.6, 43.5, 37.7}, -- Desolate Blossom
		[404288] = {29.4, 35.2}, -- Infinite Duress
		[411241] = {18.8, 17.6, 21.1, 42.3}, -- Void Claws
	},
	[3] = {
		[404027] = {28.5, 61.2, 61.2, 96.3}, -- Void Bomb
		[404288] = {5.8, 56.3, 83.8, 37.5, 36.3}, -- Infinite Duress
		[403771] = {7.3, 61.2, 98.8, 58.8}, -- Cosmic Ascension
		[405486] = {19.8, 85.0, 55.0, 35.1, 67.5}, -- Hurtling Barrage
		[403625] = {46.3, 77.8, 81.5}, -- Scouring Eternity
		[403520] = {24.8, 111.2, 50.0}, -- Embrace of Nothingness
		[408429] = {21.0, 36.3, 37.5, 85.0, 11.2, 61.3}, -- Void Slash
	},
}

local timers = mod:Easy() and timersNormal or timersHeroic

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	-- General
	L.claws = "Tank Debuff" -- (Stage 1) Burning Claws / (Stage 2) Void Claws / (Stage 3) Void Slash
	L.claws_debuff = "Tank Explodes"
	L.emptiness_between_stars = "Emptiness"

	-- Stage One: The Legacy of the Dracthyr
	L.oppressing_howl = mod:SpellName(401383) -- Opressing Howl
	L.glittering_surge = mod:SpellName(401810) -- Glittering Surge
	L.mass_disintergrate = mod:SpellName(401642) -- Mass Disintegrate
	L.mass_disintergrate_single = mod:SpellName(356995) -- Disintegrate

	-- Stage Two: A Touch of the Forbidden
	L.desolate_blossom = mod:SpellName(404403) -- Desolate Blossom
	L.infinite_duress = mod:SpellName(404288) -- Infinite Duress

	-- Stage Three: The Seas of Infinity
	L.cosmic_ascension = mod:SpellName(403771) -- Cosmic Ascension
	L.hurtling_barrage = mod:SpellName(405022) -- Hurtling Barrage
	L.scouring_eternity = mod:SpellName(403625) -- Scouring Eternity
	L.embrace_of_nothingness = "Black Hole" -- Embrace of Nothingness
	L.void_slash = "Tank Frontal"
end

--------------------------------------------------------------------------------
-- Initialization
--

local massDisintergrateMarker = mod:AddMarkerOption(true, "player", 1, 401680, 1, 2, 3, 4) -- Mass Disintegrate
local nullGlimmerMarker = mod:AddMarkerOption(true, "npc", 8, -26675, 8, 7, 6, 5) -- Null Glimmer
local infiniteDuressMarker = mod:AddMarkerOption(true, "player", 1, 404288, 1, 2) -- Infinite Duress
local hurlingBarrageMarker = mod:AddMarkerOption(true, "player", 3, 405486, 3, 4, 5, 6) -- Hurtling Barrage
function mod:GetOptions()
	return {
		-- General
		"stages",
		401951, -- Oblivion
		401215, -- Emptiness Between Stars
		403997, -- Mind Fragment
		407576, -- Astral Flare
		410625, -- End Existence

		-- Stage One: The Legacy of the Dracthyr
		401383, -- Opressing Howl
		401810, -- Glittering Surge
		401500, -- Scorching Bomb
		406989, -- Burning Ground (damage)
		{401680, "SAY", "SAY_COUNTDOWN", "ME_ONLY_EMPHASIZE"}, -- Mass Disintegrate
		massDisintergrateMarker,
		402050, -- Searing Breath
		{401330, "TANK_HEALER"}, -- Burning Claws
		401340, -- Blazing Blast

		-- Stage Two: A Touch of the Forbidden
		404027, -- Void Bomb
		{404218, "SAY", "SAY_COUNTDOWN"}, -- Void Fracture
		404456, -- Abyssal Breath
		nullGlimmerMarker,
		404754, -- Blasting Scream
		404403, -- Desolate Blossom
		{404288, "SAY", "SAY_COUNTDOWN", "ME_ONLY_EMPHASIZE"}, -- Infinite Duress
		infiniteDuressMarker,
		{411241, "TANK_HEALER"}, -- Void Claws
		411238, -- Void Blast

		-- Stage Three: The Seas of Infinity
		403771, -- Cosmic Ascension
		{405486, "SAY", "SAY_COUNTDOWN", "ME_ONLY_EMPHASIZE"}, -- Hurtling Barrage
		403625, -- Scouring Eternity
		{403520, "SAY", "SAY_COUNTDOWN", "ME_ONLY_EMPHASIZE"}, -- Embrace of Nothingness
		408429, -- Void Slash
		408457, -- Void Blast
	},{
		["stages"] = "general",
		[401383] = -26140, -- Stage One: The Legacy of the Dracthyr
		[404027] = -26142, -- Stage Two: A Touch of the Forbidden
		[403771] = -26145, -- Stage Three: The Seas of Infinity
	},{
		[401500] = CL.bombs, -- Scorching Bomb
		[402050] = CL.breath, -- Searing Breath (Breath)
		[401330] = L.claws, -- Burning Claws (Tank Debuff)
		[401340] = L.claws_debuff, -- Blazing Blast (Tank Explodes)
		[404027] = CL.bombs, -- Void Bomb
		[404218] = CL.bomb, -- Void Fracture (Bomb)
		[404456] = CL.breath, -- Abyssal Breath (Breath)
		[411241] = L.claws, -- Void Claws (Tank Debuff)
		[411238] = L.claws_debuff, -- Void Blast (Tank Explodes)
		[403520] = L.embrace_of_nothingness, -- Embrace of Nothingness (Black Hole)
		[408429] = L.void_slash, -- Void Slash (Tank Frontal)
		[408457] = L.claws_debuff, -- Void Blast (Tank Explodes)
	}
end

function mod:VerifyEnable(unit)
	return UnitHealth(unit) > 100
end

function mod:OnBossEnable()
	-- General
	self:Log("SPELL_AURA_APPLIED", "OblivionApplied", 401951)
	self:Log("SPELL_AURA_APPLIED_DOSE", "OblivionApplied", 401951)
	self:Log("SPELL_AURA_APPLIED", "EmptinessBetweenStarsApplied", 401215)
	self:Log("SPELL_AURA_REMOVED", "EmptinessBetweenStarsRemoved", 401215)
	self:Log("SPELL_AURA_APPLIED", "MindFragmentApplied", 403997)
	self:Log("SPELL_AURA_APPLIED_DOSE", "MindFragmentApplied", 403997)
	self:Log("SPELL_AURA_APPLIED", "AstralFlareApplied", 407576)
	self:Log("SPELL_AURA_APPLIED_DOSE", "AstralFlareApplied", 407576)

	self:Log("SPELL_AURA_APPLIED", "EndExistenceApplied", 410625)
	self:Log("SPELL_AURA_REMOVED", "EndExistenceRemoved", 410625)
	self:Log("SPELL_AURA_APPLIED", "StageEnd", 403284, 410654) -- Void Empowerment
	self:Log("SPELL_AURA_REMOVED", "Stage2Start", 403284)
	self:Log("SPELL_AURA_REMOVED", "Stage3Start", 410654)

	-- Ground Effects
	self:Log("SPELL_AURA_APPLIED", "GroundDamage", 406989) -- Burning Ground
	self:Log("SPELL_PERIODIC_DAMAGE", "GroundDamage", 406989)
	self:Log("SPELL_PERIODIC_MISSED", "GroundDamage", 406989)

	-- Stage One: The Legacy of the Dracthyr
	self:Log("SPELL_CAST_START", "OppressingHowl", 401383)
	self:Log("SPELL_CAST_START", "GlitteringSurge", 401810)
	self:Log("SPELL_CAST_START", "ScorchingBomb", 401500)
	self:Log("SPELL_CAST_SUCCESS", "MassDisintegrate", 401642)
	self:Log("SPELL_AURA_APPLIED", "MassDisintegrateApplied", 401680)
	self:Log("SPELL_AURA_REMOVED", "MassDisintegrateRemoved", 401680)
	self:Log("SPELL_CAST_START", "SearingBreath", 402050)
	self:Log("SPELL_CAST_START", "BurningClaws", 401325)
	self:Log("SPELL_AURA_APPLIED", "BurningClawsApplied", 401330)
	self:Log("SPELL_AURA_APPLIED_DOSE", "BurningClawsApplied", 401330)
	self:Log("SPELL_AURA_REMOVED", "BurningClawsRemoved", 401330)

	-- Stage Two: A Touch of the Forbidden
	self:Log("SPELL_CAST_START", "VoidBomb", 404027)
	self:Log("SPELL_AURA_APPLIED", "VoidFractureApplied", 404218)
	self:Log("SPELL_AURA_REMOVED", "VoidFractureRemoved", 404218)
	self:Log("SPELL_CAST_START", "AbyssalBreath", 404456)
	self:Log("SPELL_SUMMON", "NullGlimmerSummon", 404507)
	self:Log("SPELL_CAST_START", "BlastingScream", 404754)
	self:Log("SPELL_CAST_START", "DesolateBlossom", 404403, 411030) -- Heroic/Normal, Unknown
	self:Log("SPELL_CAST_SUCCESS", "InfiniteDuress", 407496, 404288) -- Heroic+, Unknown
	self:Log("SPELL_AURA_APPLIED", "InfiniteDuressApplied", 407496, 404288)
	self:Log("SPELL_AURA_REMOVED", "InfiniteDuressRemoved", 407496, 404288)
	self:Log("SPELL_CAST_START", "VoidClaws", 411236)
	self:Log("SPELL_AURA_APPLIED", "VoidClawsApplied", 411241)
	self:Log("SPELL_AURA_APPLIED_DOSE", "VoidClawsApplied", 411241)
	self:Log("SPELL_AURA_REMOVED", "VoidClawsRemoved", 411241)

	-- Stage Three: The Seas of Infinity
	self:Log("SPELL_CAST_START", "CosmicAscension", 403741)
	self:Log("SPELL_CAST_START", "HurtlingBarrage", 405022)
	self:Log("SPELL_AURA_APPLIED", "HurtlingBarrageApplied", 405486)
	self:Log("SPELL_AURA_REMOVED", "HurtlingBarrageRemoved", 405486)
	self:Log("SPELL_CAST_START", "ScouringEternity", 403625)
	self:Log("SPELL_CAST_SUCCESS", "EmbraceOfNothingness", 403517)
	self:Log("SPELL_AURA_APPLIED", "EmbraceOfNothingnessApplied", 403520)
	self:Log("SPELL_AURA_REMOVED", "EmbraceOfNothingnessRemoved", 403520)
	self:Log("SPELL_CAST_START", "VoidSlash", 408422)
	self:Log("SPELL_AURA_APPLIED", "VoidSlashApplied", 408429)
	self:Log("SPELL_AURA_APPLIED_DOSE", "VoidSlashApplied", 408429)
	self:Log("SPELL_AURA_REMOVED", "VoidSlashRemoved", 408429)
end

function mod:OnEngage()
	timers = self:Easy() and timersNormal or timersHeroic
	self:SetStage(1)
	voidEmpowermentCount = 1
	nextStageHealth = 63

	-- Stage One: The Legacy of the Dracthyr
	opressingHowlCount = 1
	glitteringSurgeCount = 1
	bombCount = 1
	massDisintergrateCount = 1
	breathCount = 1
	clawsCount = 1

	-- self:Bar(401500, 1.1, CL.count:format(CL.bombs, bombCount)) -- Scorching Bomb
	self:Bar(401810, 3.3, CL.count:format(L.glittering_surge, glitteringSurgeCount)) -- Glittering Surge
	self:Bar(401383, 14.5, CL.count:format(L.oppressing_howl, opressingHowlCount)) -- Opressing Howl
	self:Bar(401330, 20.0, CL.count:format(L.claws, clawsCount)) -- Burning Claws
	self:Bar(401680, 24.9, CL.count:format(L.mass_disintergrate, massDisintergrateCount)) -- Mass Disintegrate
	self:Bar(402050, 26.7, CL.count:format(CL.breath, breathCount)) -- Searing Breath

	self:Bar("stages", 113, CL.stage:format(2), 403284)

	self:RegisterUnitEvent("UNIT_HEALTH", nil, "boss1")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:UNIT_HEALTH(event, unit)
	if self:GetHealth(unit) < nextStageHealth then -- 60% (?) and 40%
		nextStageHealth = nextStageHealth - 20
		if nextStageHealth < 50 then
			self:UnregisterUnitEvent(event, unit)
		end
		self:Message("stages", "cyan", CL.soon:format(CL.stage:format(self:GetStage() + 1)), false)
		self:PlaySound("stages", "info")
	end
end

-- General
function mod:OblivionApplied(args)
	if self:Me(args.destGUID) then
		local amount = args.amount or 1
		if amount % 3 == 0 then -- 3, 6, 9 (You go inside at 10)
			self:StackMessage(args.spellId, "blue", args.destName, args.amount, 1)
			self:PlaySound(args.spellId, amount > 8 and "warning" or "info")
		end
	end
end

function mod:EmptinessBetweenStarsApplied(args)
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId, nil, L.emptiness_between_stars)
		self:PlaySound(args.spellId, "long")
		self:TargetBar(args.spellId, self:Easy() and 25 or 20, args.destName, L.emptiness_between_stars)
		self:CancelSayCountdown(404218) -- Void Fracture
	end
end

function mod:EmptinessBetweenStarsRemoved(args)
	if self:Me(args.destGUID) then
		self:Message(args.spellId, "green", CL.removed:format(L.emptiness_between_stars))
		self:PlaySound(args.spellId, "info")
		self:StopBar(L.emptiness_between_stars, args.destName)
	end
end

function mod:MindFragmentApplied(args)
	local amount = args.amount or 1
	if self:Me(args.destGUID) and amount < 3 then -- You leave on 3, dont want double warnings
		self:Message(args.spellId, "green", CL.count_amount:format(args.spellName, amount, 3))
	end
end

function mod:AstralFlareApplied(args)
	if self:Me(args.destGUID) then
		local amount = args.amount or 1
		if amount % 2 == 0 then -- 2, 4, 6...
			self:Message(args.spellId, "blue", ("%dx %s"):format(amount, args.spellName))
			if amount == 10 then
				self:PlaySound(args.spellId, "info")
			end
		end
	end
end

do
	local prev = 0
	function mod:GroundDamage(args)
		if self:Me(args.destGUID) and args.time - prev > 2 then
			prev = args.time
			self:PlaySound(args.spellId, "underyou")
			self:PersonalMessage(args.spellId, "underyou")
		end
	end
end

function mod:StageEnd(args)
	self:StopBar(CL.stage:format(self:GetStage() + 1))
	if voidEmpowermentCount == 1 then
		nextStageHealth = 43
	else
		self:UnregisterUnitEvent("UNIT_HEALTH", "boss1")
	end

	self:Message("stages", "cyan", CL.count:format(args.spellName, voidEmpowermentCount), args.spellId)
	self:PlaySound("stages", "info")
	voidEmpowermentCount = voidEmpowermentCount + 1

	-- Stage 1 Bars
	self:StopBar(CL.count:format(L.oppressing_howl, opressingHowlCount)) -- Opressing Howl
	self:StopBar(CL.count:format(L.glittering_surge, glitteringSurgeCount)) -- Glittering Surge
	self:StopBar(CL.count:format(CL.bombs, bombCount)) -- Scorching Bomb / Void Bomb
	self:StopBar(CL.count:format(L.mass_disintergrate, massDisintergrateCount)) -- Mass Disintegrate
	self:StopBar(CL.count:format(CL.breath, breathCount)) -- Searing Breath / Abyssal Breath
	self:StopBar(CL.count:format(L.claws, clawsCount)) -- Burning Claws / Void Claws

	-- Stage 2 Bars
	self:StopBar(CL.count:format(L.desolate_blossom, desolateBlossomCount)) --  Desolate Blossom
	self:StopBar(CL.count:format(L.infinite_duress, infiniteDuressCount)) -- Infinite Duress
end

-- Stage One: The Legacy of the Dracthyr
function mod:OppressingHowl(args)
	self:StopBar(CL.count:format(L.oppressing_howl, opressingHowlCount))
	self:Message(args.spellId, "yellow", CL.count:format(L.oppressing_howl, opressingHowlCount))
	self:PlaySound(args.spellId, "alert")
	opressingHowlCount = opressingHowlCount + 1
end

function mod:GlitteringSurge(args)
	self:StopBar(CL.count:format(L.glittering_surge, glitteringSurgeCount))
	self:Message(args.spellId, "red", CL.count:format(L.glittering_surge, glitteringSurgeCount))
	self:PlaySound(args.spellId, "long")
	glitteringSurgeCount = glitteringSurgeCount + 1
	self:Bar(args.spellId, timers[1][args.spellId][glitteringSurgeCount], CL.count:format(L.glittering_surge, glitteringSurgeCount))
end

function mod:ScorchingBomb(args)
	self:StopBar(CL.count:format(CL.bombs, bombCount))
	self:Message(args.spellId, "orange", CL.count:format(CL.bombs, bombCount))
	self:PlaySound(args.spellId, "alert")
	bombCount = bombCount + 1
	self:Bar(args.spellId, timers[1][args.spellId][bombCount], CL.count:format(CL.bombs, bombCount))
end

do
	local playerList = {}
	function mod:MassDisintegrate(args)
		self:StopBar(CL.count:format(L.mass_disintergrate, massDisintergrateCount))
		massDisintergrateCount = massDisintergrateCount + 1
		self:Bar(401680, timers[1][401680][massDisintergrateCount], CL.count:format(L.mass_disintergrate, massDisintergrateCount))
		playerList = {}
	end

	function mod:MassDisintegrateApplied(args)
		local count = #playerList+1
		playerList[count] = args.destName
		playerList[args.destName] = count -- Set raid marker
		if self:Me(args.destGUID) then
			self:PlaySound(args.spellId, "warning")
			self:Say(args.spellId, CL.rticon:format(L.mass_disintergrate_single, count))
			self:SayCountdown(args.spellId, 6, count)
		end
		self:TargetsMessage(args.spellId, "cyan", playerList, nil, CL.count:format(L.mass_disintergrate, massDisintergrateCount - 1))
		self:CustomIcon(massDisintergrateMarker, args.destName, count)
	end

	function mod:MassDisintegrateRemoved(args)
		if self:Me(args.destGUID) then
			self:CancelSayCountdown(args.spellId)
		end
		self:CustomIcon(massDisintergrateMarker, args.destName)
	end
end

function mod:SearingBreath(args)
	self:StopBar(CL.count:format(CL.breath, breathCount))
	self:Message(args.spellId, "red", CL.count:format(CL.breath, breathCount))
	self:PlaySound(args.spellId, "alert")
	breathCount = breathCount + 1
	self:Bar(args.spellId, timers[1][args.spellId][breathCount], CL.count:format(CL.breath, breathCount))
end

do
	local tankTimers = {}
	function mod:BurningClaws(args)
		self:StopBar(CL.count:format(L.claws, clawsCount))
		clawsCount = clawsCount + 1
		if clawsCount < 5 then -- only 4
			self:Bar(401330, clawsCount == 4 and 16.7 or 18.9, CL.count:format(L.claws, clawsCount))
		end
	end

	function mod:BurningClawsApplied(args)
		self:CancelTimer(tankTimers[args.destName])
		self:StopBar(L.claws, args.destName)
		if self:Tank() then
			self:StackMessage(args.spellId, "purple", args.destName, args.amount, 1, L.claws)
			local bossUnit = self:UnitTokenFromGUID(args.sourceGUID)
			if bossUnit and self:Tank() and not self:Me(args.destGUID) and not self:Tanking(bossUnit) then
				self:PlaySound(args.spellId, "warning") -- Taunt
			elseif self:Me(args.destGUID) then
				self:PlaySound(args.spellId, "alarm") -- On you
			end
		end
		-- Don't show the timer for the full 27s, only sub 10s
		tankTimers[args.destName] = self:ScheduleTimer("TargetBar", 17, 401340, 10, args.destName, L.claws_debuff) -- Blazing Blast
	end

	function mod:BurningClawsRemoved(args)
		self:StopBar(L.claws, args.destName)
		self:CancelTimer(tankTimers[args.destName])
	end
end

-- Stage Two: A Touch of the Forbidden
function mod:Stage2Start()
	self:SetStage(2)
	self:Message("stages", "cyan", CL.stage:format(2), false)
	self:PlaySound("stages", "long")

	bombCount = 1
	breathCount = 1
	clawsCount = 1
	desolateBlossomCount = 1
	infiniteDuressCount = 1

	self:Bar("stages", 110.1, CL.stage:format(3), 403284) -- XXX not sure if phase force transitions

	-- these start on End Existence _REMOVED
	self:Bar(404456, 3.5, CL.count:format(CL.breath, breathCount)) -- Abyssal Breath
	self:Bar(404403, 10.6, CL.count:format(L.desolate_blossom, desolateBlossomCount)) --  Desolate Blossom
	self:Bar(404027, 15.3, CL.count:format(CL.bombs, bombCount)) -- Void Bomb
	self:Bar(411241, 18.8, CL.count:format(L.claws, clawsCount)) -- Void Claws
	if not self:Easy() then
		self:Bar(404288, 29.4, CL.count:format(L.infinite_duress, infiniteDuressCount)) -- Infinite Duress
	end

	self:PauseBar(404456, CL.count:format(CL.breath, breathCount))
	self:PauseBar(404403, CL.count:format(L.desolate_blossom, desolateBlossomCount))
	self:PauseBar(404027, CL.count:format(CL.bombs, bombCount))
	self:PauseBar(411241, CL.count:format(L.claws, clawsCount))
	self:PauseBar(404288, CL.count:format(L.infinite_duress, infiniteDuressCount))
	self:PauseBar("stages", CL.stage:format(3))
end

function mod:EndExistenceApplied(args)
	self:Message(args.spellId, "red")
	self:PlaySound(args.spellId, "alarm")
end

function mod:EndExistenceRemoved(args)
	self:Message(args.spellId, "green", CL.over:format(args.spellName))

	self:ResumeBar(404456, CL.count:format(CL.breath, breathCount))
	self:ResumeBar(404403, CL.count:format(L.desolate_blossom, desolateBlossomCount))
	self:ResumeBar(404027, CL.count:format(CL.bombs, bombCount))
	self:ResumeBar(411241, CL.count:format(L.claws, clawsCount))
	self:ResumeBar(404288, CL.count:format(L.infinite_duress, infiniteDuressCount))
	self:ResumeBar("stages", CL.stage:format(3))
end

function mod:VoidBomb(args)
	self:StopBar(CL.count:format(CL.bombs, bombCount))
	self:Message(args.spellId, "orange", CL.count:format(CL.bombs, bombCount))
	self:PlaySound(args.spellId, "alert")
	bombCount = bombCount + 1
	self:Bar(args.spellId, timers[self:GetStage()][args.spellId][bombCount], CL.count:format(CL.bombs, bombCount))
end

function mod:VoidFractureApplied(args)
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId, nil, CL.bomb)
		self:PlaySound(args.spellId, "warning")
		self:Say(args.spellId, CL.bomb)
		local _, _, duration = self:UnitDebuff(args.destName, args.spellId)
		if duration < 2 then -- dont countdown below 2, just run
			self:SayCountdown(args.spellId, duration, nil, duration < 3 and 2) -- If we are between 3 and 2, start countdown at 2
		end
	end
end

function mod:VoidFractureRemoved(args)
	if self:Me(args.destGUID) then
		self:CancelSayCountdown(args.spellId)
	end
end

function mod:AbyssalBreath(args)
	self:StopBar(CL.count:format(CL.breath, breathCount))
	self:Message(args.spellId, "red", CL.count:format(CL.breath, breathCount))
	self:PlaySound(args.spellId, "alert")
	breathCount = breathCount + 1
	self:Bar(args.spellId, timers[2][args.spellId][breathCount], CL.count:format(CL.breath, breathCount))

	nullGlimmerMarks = {}
	nullGlimmerCollector = {}

	if self:GetOption(nullGlimmerMarker) then
		self:RegisterTargetEvents("AddMarking")
	end
end

function mod:NullGlimmerSummon(args)
	if self:GetOption(nullGlimmerMarker) then
		for i = 8, 4, -1 do -- 8, 7, 6, 5, 4
			if not nullGlimmerCollector[args.destGUID] and not nullGlimmerMarks[i] then
				nullGlimmerMarks[i] = args.destGUID
				nullGlimmerCollector[args.destGUID] = i
				return
			end
		end
	end
end

function mod:AddMarking(_, unit, guid)
	if nullGlimmerCollector[guid] then
		self:CustomIcon(nullGlimmerMarker, unit, nullGlimmerCollector[guid]) -- icon order from SPELL_SUMMON
		nullGlimmerCollector[guid] = nil
	end
end

function mod:BlastingScream(args)
	local canDo, ready = self:Interrupter(args.sourceGUID)
	if canDo then
		self:Message(args.spellId, "orange")
		if ready then
			self:PlaySound(args.spellId, "alarm")
		end
	end
end

function mod:DesolateBlossom(args)
	self:StopBar(CL.count:format(L.desolate_blossom, desolateBlossomCount))
	self:Message(404403, "yellow", CL.count:format(L.desolate_blossom, desolateBlossomCount))
	self:PlaySound(404403, "alert")
	desolateBlossomCount = desolateBlossomCount + 1
	self:Bar(404403, timers[2][404403][breathCount], CL.count:format(L.desolate_blossom, desolateBlossomCount))
end

do
	local playerList, onMe = {}, false
	local function onMeSound()
		if not onMe then
			mod:PlaySound(404288, "alert")
		end
	end

	function mod:InfiniteDuress(args)
		self:StopBar(CL.count:format(L.infinite_duress, infiniteDuressCount))
		infiniteDuressCount = infiniteDuressCount + 1
		self:Bar(404288, timers[self:GetStage()][404288][infiniteDuressCount], CL.count:format(L.infinite_duress, infiniteDuressCount))

		playerList = {}
		onMe = false
		self:SimpleTimer(onMeSound, 0.3)
	end

	function mod:InfiniteDuressApplied(args)
		local count = #playerList+1
		playerList[count] = args.destName
		playerList[args.destName] = count -- Set raid marker
		if self:Me(args.destGUID) then
			onMe = true
			self:TargetBar(404288, 16, args.destName, L.infinite_duress)
			self:Say(404288, L.infinite_duress)
			self:SayCountdown(404288, 16)
			self:PlaySound(404288, "warning")
		end
		self:TargetsMessage(404288, "cyan", playerList, 2, CL.count:format(L.infinite_duress, infiniteDuressCount - 1))
		self:CustomIcon(infiniteDuressMarker, args.destName, count)
	end

	function mod:InfiniteDuressRemoved(args)
		if self:Me(args.destGUID) then
			self:StopBar(L.infinite_duress, args.destName)
			self:CancelSayCountdown(404288)
		end
		self:CustomIcon(infiniteDuressMarker, args.destName)
	end
end

do
	local tankTimers = {}
	function mod:VoidClaws(args)
		self:StopBar(CL.count:format(L.claws, clawsCount))
		clawsCount = clawsCount + 1
		self:Bar(411241, timers[2][411241][clawsCount], CL.count:format(L.claws, clawsCount))
	end

	function mod:VoidClawsApplied(args)
		self:CancelTimer(tankTimers[args.destName])
		self:StopBar(L.claws_debuff, args.destName)
		if self:Tank() then
			self:StackMessage(args.spellId, "purple", args.destName, args.amount, 1, L.claws)
			local bossUnit = self:UnitTokenFromGUID(args.sourceGUID)
			if bossUnit and self:Tank() and not self:Me(args.destGUID) and not self:Tanking(bossUnit) then
				self:PlaySound(args.spellId, "warning") -- Taunt
			elseif self:Me(args.destGUID) then
				self:PlaySound(args.spellId, "alarm") -- On you
			end
		end
		-- Don't show the timer for the full 18s, only sub 10s
		tankTimers[args.destName] = self:ScheduleTimer("TargetBar", 8, 411238, 10, args.destName, L.claws_debuff) -- Void Blast
	end

	function mod:VoidClawsRemoved(args)
		self:StopBar(L.claws_debuff, args.destName)
		self:CancelTimer(tankTimers[args.destName])
	end
end

-- Stage Three: The Seas of Infinity
function mod:Stage3Start()
	self:SetStage(3)
	self:Message("stages", "cyan", CL.stage:format(3), false)
	self:PlaySound("stages", "long")

	bombCount = 1
	clawsCount = 1
	infiniteDuressCount = 1
	cosmicAscensionCount = 1
	hurtlingBarrageCount = 1
	scouringEternityCount = 1
	embraceOfNothingnessCount = 1

	self:Bar(403771, self:Heroic() and 7.3 or 7.7, CL.count:format(L.cosmic_ascension, cosmicAscensionCount)) -- Cosmic Ascension
	self:Bar(405486, self:Heroic() and 19.8 or 21.1, CL.count:format(L.hurtling_barrage, hurtlingBarrageCount)) -- Hurtling Barrage
	self:Bar(408429, self:Heroic() and 21 or 22.4, CL.count:format(L.claws, clawsCount)) -- Void Slash
	self:Bar(403520, self:Heroic() and 24.8 or 26.4, CL.count:format(L.embrace_of_nothingness, embraceOfNothingnessCount)) -- Embrace of Nothingness
	self:Bar(404027, self:Heroic() and 28.5 or 30.4, CL.count:format(CL.bombs, bombCount)) -- Void Bomb
	self:Bar(403625, self:Heroic() and 46.3 or 49.8, CL.count:format(L.scouring_eternity, scouringEternityCount)) -- Scouring Eternity
	if not self:Easy() then
		self:Bar(404288, 4.8, CL.count:format(L.infinite_duress, infiniteDuressCount)) -- Infinite Duress
	end
end

function mod:CosmicAscension(args)
	self:StopBar(CL.count:format(L.cosmic_ascension, cosmicAscensionCount))
	self:Message(403771, "red", CL.count:format(L.cosmic_ascension, cosmicAscensionCount))
	self:PlaySound(403771, "alarm")
	cosmicAscensionCount = cosmicAscensionCount + 1
	self:Bar(403771, timers[3][403771][cosmicAscensionCount], CL.count:format(L.cosmic_ascension, cosmicAscensionCount))

	nullGlimmerMarks = {}
	nullGlimmerCollector = {}

	if self:GetOption(nullGlimmerMarker) then
		self:RegisterTargetEvents("AddMarking")
	end
end

do
	local playerList = {}
	function mod:HurtlingBarrage(args)
		self:StopBar(CL.count:format(L.hurtling_barrage, hurtlingBarrageCount))
		self:Message(405486, "yellow", CL.count:format(L.hurtling_barrage, hurtlingBarrageCount))
		self:PlaySound(405486, "alert")
		hurtlingBarrageCount = hurtlingBarrageCount + 1
		self:Bar(405486, timers[3][405486][hurtlingBarrageCount], CL.count:format(L.hurtling_barrage, hurtlingBarrageCount))

		playerList = {}
	end

	function mod:HurtlingBarrageApplied(args)
		local count = #playerList + 1
		local icon = count + 2
		playerList[count] = args.destName
		if self:Me(args.destGUID) then
			self:PersonalMessage(args.spellId, nil, L.hurtling_barrage)
			self:PlaySound(args.spellId, "warning")
			self:Say(args.spellId, CL.rticon:format(L.hurtling_barrage, icon))
			self:SayCountdown(args.spellId, 7, icon)
		end
		self:CustomIcon(hurlingBarrageMarker, args.destName, icon)
	end

	function mod:HurtlingBarrageRemoved(args)
		if self:Me(args.destGUID) then
			self:CancelSayCountdown(args.spellId)
		end
		self:CustomIcon(hurlingBarrageMarker, args.destName)
	end
end

function mod:ScouringEternity(args)
	self:StopBar(CL.count:format(L.scouring_eternity, scouringEternityCount))
	self:Message(args.spellId, "red", CL.count:format(L.scouring_eternity, scouringEternityCount))
	self:PlaySound(args.spellId, "warning")
	scouringEternityCount = scouringEternityCount + 1
	self:Bar(args.spellId, timers[3][args.spellId][scouringEternityCount], CL.count:format(L.scouring_eternity, scouringEternityCount))
end

function mod:EmbraceOfNothingness(args)
	self:StopBar(CL.count:format(L.embrace_of_nothingness, embraceOfNothingnessCount))
	embraceOfNothingnessCount = embraceOfNothingnessCount + 1
	self:Bar(403520, timers[3][403520][embraceOfNothingnessCount], CL.count:format(L.embrace_of_nothingness, embraceOfNothingnessCount))
end

function mod:EmbraceOfNothingnessApplied(args)
	self:TargetMessage(args.spellId, "yellow", args.destName, CL.count:format(L.embrace_of_nothingness, embraceOfNothingnessCount-1))
	if self:Me(args.destGUID) then
		self:PlaySound(args.spellId, "warning")
		self:Yell(args.spellId, L.embrace_of_nothingness)
		self:YellCountdown(args.spellId, 8)
	end
end

function mod:EmbraceOfNothingnessRemoved(args)
	if self:Me(args.destGUID) then
		self:CancelSayCountdown(args.spellId)
	end
end

do
	local tankTimers = {}
	function mod:VoidSlash(args)
		self:StopBar(CL.count:format(L.void_slash, clawsCount))
		clawsCount = clawsCount + 1
		self:Bar(408429, timers[3][408429][clawsCount], CL.count:format(L.void_slash, clawsCount))
	end

	function mod:VoidSlashApplied(args)
		self:CancelTimer(tankTimers[args.destName])
		self:StopBar(L.claws_debuff, args.destName)
		if self:Tank() then
			self:StackMessage(args.spellId, "purple", args.destName, args.amount, 1, L.void_slash)
			local bossUnit = self:UnitTokenFromGUID(args.sourceGUID)
			if bossUnit and self:Tank() and not self:Me(args.destGUID) and not self:Tanking(bossUnit) then
				self:PlaySound(args.spellId, "warning") -- Taunt
			elseif self:Me(args.destGUID) then
				self:PlaySound(args.spellId, "alarm") -- On you
			end
		end
		-- Don't show the timer for the full 21s, only sub 10s
		tankTimers[args.destName] = self:ScheduleTimer("TargetBar", 11, 408457, 10, args.destName, L.claws_debuff) -- Void Blast
	end

	function mod:VoidSlashRemoved(args)
		self:StopBar(L.claws_debuff, args.destName)
		self:CancelTimer(tankTimers[args.destName])
	end
end
