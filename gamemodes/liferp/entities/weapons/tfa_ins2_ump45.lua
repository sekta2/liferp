SWEP.Base				= "tfa_gun_base"
SWEP.Category				= "TFA Insurgency" --The category.  Please, just choose something generic or something I've already done if you plan on only doing like one swep..
SWEP.Manufacturer = "Heckler & Koch" --Gun Manufactrer (e.g. Hoeckler and Koch )
SWEP.Author				= "YuRaNnNzZZ" --Author Tooltip
SWEP.Contact				= "" --Contact Info Tooltip
SWEP.Purpose				= "" --Purpose Tooltip
SWEP.Instructions				= "" --Instructions Tooltip
SWEP.Spawnable				= (TFA and TFA.INS2) and true or false -- INSTALL SHARED PARTS
SWEP.AdminSpawnable			= true --Can an adminstrator spawn this?  Does not tie into your admin mod necessarily, unless its coded to allow for GMod's default ranks somewhere in its code.  Evolve and ULX should work, but try to use weapon restriction rather than these.
SWEP.DrawCrosshair			= true		-- Draw the crosshair?
SWEP.DrawCrosshairIS = false --Draw the crosshair in ironsights?
SWEP.PrintName				= "UMP .45"		-- Weapon name (Shown on HUD)
SWEP.Slot				= 2			-- Slot in the weapon selection menu.  Subtract 1, as this starts at 0.
SWEP.SlotPos				= 73			-- Position in the slot
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.Weight				= 30			-- This controls how "good" the weapon is for autopickup.

if TFA then
	local path = "weapons/tfa_ins2/ump45/"
	local pref = "TFA_INS2.UMP45."

	TFA.AddFireSound(pref .. "1", path .. "ump45_fp.wav", false, ")")
	TFA.AddFireSound(pref .. "2", path .. "ump45_suppressed_fp.wav", false, ")")

	TFA.AddSound(pref .. "Loop", CHAN_WEAPON, 1, 140, 100, path .. "ump_loop.wav", ")")
	TFA.AddSound(pref .. "LoopSil", CHAN_WEAPON, .8, 105, 100, path .. "ump_loop_silenced.wav", ")")
	TFA.AddSound(pref .. "LoopTail", CHAN_STATIC, 1, 140, 100, path .. "ump_loop_tail.wav", ")")
	TFA.AddSound(pref .. "LoopTailSil", CHAN_STATIC, .8, 105, 100, path .. "ump_loop_silenced_tail.wav", ")")

	TFA.AddWeaponSound(pref .. "Boltback", path .. "handling/ump45_boltback.wav")
	TFA.AddWeaponSound(pref .. "Boltlock", path .. "handling/ump45_boltlock.wav")
	TFA.AddWeaponSound(pref .. "Boltrelease", path .. "handling/ump45_boltrelease.wav")
	TFA.AddWeaponSound(pref .. "Empty", path .. "handling/ump45_empty.wav")
	TFA.AddWeaponSound(pref .. "Magrelease", path .. "handling/ump45_magrelease.wav")
	TFA.AddWeaponSound(pref .. "Magout", path .. "handling/ump45_magout.wav")
	TFA.AddWeaponSound(pref .. "Magin", path .. "handling/ump45_magin.wav")
	TFA.AddWeaponSound(pref .. "ROF", path .. "handling/ump45_fireselect.wav")
end

if killicon and killicon.Add then
	killicon.Add("tfa_ins2_ump45", "vgui/killicons/tfa_ins2_ump45", Color(255, 80, 0, 191))
end

--[[WEAPON HANDLING]]--
SWEP.Primary.Sound = Sound("TFA_INS2.UMP45.1") -- This is the sound of the weapon, when you shoot.
SWEP.Primary.SilencedSound = Sound("TFA_INS2.UMP45.2") -- This is the sound of the weapon, when silenced.

SWEP.Primary.LoopSound = Sound"TFA_INS2.UMP45.Loop"
SWEP.Primary.LoopSoundSilenced = Sound"TFA_INS2.UMP45.LoopSil"
SWEP.Primary.LoopSoundTail = Sound"TFA_INS2.UMP45.LoopTail"
SWEP.Primary.LoopSoundTailSilenced = Sound"TFA_INS2.UMP45.LoopTailSil"
SWEP.Primary.LoopSoundAutoOnly = false

SWEP.Primary.Damage = 28 -- Damage, in standard damage points.
SWEP.Primary.NumShots = 1 --The number of shots the weapon fires.  SWEP.Shotgun is NOT required for this to be >1.
SWEP.Primary.Automatic = true -- Automatic/Semi Auto
SWEP.Primary.RPM = 600 -- This is in Rounds Per Minute / RPM
SWEP.Primary.Velocity = 285 -- m/s

SWEP.FiresUnderwater = false
--Miscelaneous Sounds
SWEP.IronInSound = Sound("TFA_INS2.IronIn") --Sound to play when ironsighting in?  nil for default
SWEP.IronOutSound = Sound("TFA_INS2.IronOut") --Sound to play when ironsighting out?  nil for default
-- Selective Fire Stuff
SWEP.SelectiveFire = true --Allow selecting your firemode?
SWEP.DisableBurstFire = true --Only auto/single?
--Ammo Related
SWEP.Primary.ClipSize = 25 -- This is the size of a clip
SWEP.Primary.DefaultClip = SWEP.Primary.ClipSize * 4 -- This is the number of bullets the gun gives you, counting a clip as defined directly above.
SWEP.Primary.Ammo = "smg1" -- What kind of ammo.  Options, besides custom, include pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, and AirboatGun.
SWEP.Primary.AmmoConsumption = 1 --Ammo consumed per shot
--Pistol, buckshot, and slam like to ricochet. Use AirboatGun for a light metal peircing shotgun pellets
--Recoil Related
SWEP.Primary.KickUp = 0.4 -- This is the maximum upwards recoil (rise)
SWEP.Primary.KickDown = 0.2 -- This is the maximum downwards recoil (skeet)
SWEP.Primary.KickHorizontal = 0.1 -- This is the maximum sideways recoil (no real term)
SWEP.Primary.StaticRecoilFactor = 0.7 --Amount of recoil to directly apply to EyeAngles.  Enter what fraction or percentage (in decimal form) you want.  This is also affected by a convar that defaults to 0.5.
--Firing Cone Related
SWEP.Primary.Spread = .04 --This is hip-fire acuracy.  Less is more (1 is horribly awful, .0001 is close to perfect)
SWEP.Primary.IronAccuracy = .02 -- Ironsight accuracy, should be the same for shotguns
--Unless you can do this manually, autodetect it.  If you decide to manually do these, uncomment this block and remove this line.
SWEP.Primary.SpreadMultiplierMax = 3.5--How far the spread can expand when you shoot. Example val: 2.5
SWEP.Primary.SpreadIncrement = 0.4 --What percentage of the modifier is added on, per shot.  Example val: 1/3.5
SWEP.Primary.SpreadRecovery = 4.5--How much the spread recovers, per second. Example val: 3
--Range Related
SWEP.Primary.Range = 3415
SWEP.Primary.RangeFalloff = .8
--Misc
SWEP.IronRecoilMultiplier = 0.8 --Multiply recoil by this factor when we're in ironsights.  This is proportional, not inversely.
SWEP.CrouchAccuracyMultiplier = 0.5 --Less is more.  Accuracy * 0.5 = Twice as accurate, Accuracy * 0.1 = Ten times as accurate
--Movespeed
SWEP.MoveSpeed = 0.95 --Multiply the player's movespeed by this.
SWEP.IronSightsMoveSpeed = SWEP.MoveSpeed * 0.8 --Multiply the player's movespeed by this when sighting.
--[[VIEWMODEL]]--
SWEP.ViewModel			= "models/weapons/tfa_ins2/c_ump45.mdl" --Viewmodel path
SWEP.ViewModelFOV			= 62		-- This controls how big the viewmodel looks.  Less is more.
SWEP.ViewModelFlip			= false		-- Set this to true for CSS models, or false for everything else (with a righthanded viewmodel.)
SWEP.UseHands = true --Use gmod c_arms system.
--[[WORLDMODEL]]--
SWEP.WorldModel			= "models/weapons/tfa_ins2/w_ump45.mdl" -- Weapon world model path
SWEP.HoldType = "smg" -- This is how others view you carrying the weapon. Options include:
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive
-- You're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles
SWEP.Offset = {
	Pos = {
		Up = -1.0,
		Right = 1.5,
		Forward = 5.5
	},
	Ang = {
		Up = 5,
		Right = -10,
		Forward = 180
	},
	Scale = 0.85
} --Procedural world model animation, defaulted for CS:S purposes.
--[[SPRINTING]]--
SWEP.RunSightsPos = Vector(0, 0, 0) --Change this, using SWEP Creation Kit preferably
SWEP.RunSightsAng = Vector(-10, 0, 0) --Change this, using SWEP Creation Kit preferably
--[[IRONSIGHTS]]--
SWEP.data = {}
SWEP.data.ironsights = 1 --Enable Ironsights
SWEP.Secondary.IronFOV = 82 -- How much you 'zoom' in. Less is more!  Don't have this be <= 0.  A good value for ironsights is like 70.
SWEP.IronSightsPos = Vector(-3.36, 0, 0.85)
SWEP.IronSightsAng = Vector(0.5, 0.025, 0)

SWEP.IronSightsPos_Kobra = Vector(-3.378, 0, 0.086)
SWEP.IronSightsAng_Kobra = Vector(-0.08, 0, 0)
SWEP.Secondary.IronFOV_Kobra = 53

SWEP.IronSightsPos_EOTech = Vector(-3.378, 0, 0.098)
SWEP.IronSightsAng_EOTech = Vector(-0.085, 0, 0)
SWEP.Secondary.IronFOV_EOTech = 55

SWEP.IronSightsPos_RDS = Vector(-3.378, 0, 0.097)
SWEP.IronSightsAng_RDS = Vector(-0.085, 0, 0)
SWEP.Secondary.IronFOV_RDS = 52

SWEP.IronSightsPos_2XRDS = Vector(-3.376, 0, 0.089)
SWEP.IronSightsAng_2XRDS = Vector(0, 0, 0)
SWEP.Secondary.IronFOV_2XRDS = 50
-- SWEP.RTScopeFOV_2XRDS = 16

SWEP.IronSightsPos_C79 = Vector(-3.378, 0, -0.042)
SWEP.IronSightsAng_C79 = Vector(0, 0, 0)
SWEP.Secondary.IronFOV_C79 = 48
-- SWEP.RTScopeFOV_C79 = 14

SWEP.IronSightsPos_PO4X = Vector(-3.314, 0, 0.425)
SWEP.IronSightsAng_PO4X = Vector(0, 0, 0)
SWEP.Secondary.IronFOV_PO4X = 42
-- SWEP.RTScopeFOV_PO4X = 12

--[[INSPECTION]]--
SWEP.InspectPos = Vector(5, -5.619, -2.787)
SWEP.InspectAng = Vector(22.386, 34.417, 5)

--[[ANIMATION]]--
SWEP.StatusLengthOverride = {
	[ACT_VM_RELOAD] = 74 / 30,
	[ACT_VM_RELOAD_EMPTY] = 99 / 30,
} --Changes the status delay of a given animation; only used on reloads.  Otherwise, use SequenceLengthOverride or one of the others

SWEP.Sights_Mode = TFA.Enum.LOCOMOTION_HYBRID -- ANI = mdl, HYBRID = lua but continue idle, Lua = stop mdl animation
SWEP.Sprint_Mode = TFA.Enum.LOCOMOTION_ANI -- ANI = mdl, HYBRID = ani + lua, Lua = lua only
--MDL Animations Below
SWEP.IronAnimation = {
	["shoot"] = {
		["type"] = TFA.Enum.ANIMATION_ACT, --Sequence or act
		["value"] = ACT_VM_PRIMARYATTACK_1, --Number for act, String/Number for sequence
		["value_empty"] = ACT_VM_PRIMARYATTACK_3
	}, --What do you think
	["idle"] = {
		["type"] = TFA.Enum.ANIMATION_ACT, --Sequence or act
		["value"] = ACT_VM_IDLE_1, --Number for act, String/Number for sequence
	}, --What do you think
}

SWEP.SprintAnimation = {
	["loop"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, --Sequence or act
		["value"] = "base_sprint", --Number for act, String/Number for sequence
		["is_idle"] = true
	}
}
--[[EFFECTS]]--
--Attachments
SWEP.MuzzleAttachment			= "muzzle" 		-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellAttachment			= "shell" 		-- Should be "2" for CSS models or "shell" for hl2 models
SWEP.MuzzleFlashEnabled = true --Enable muzzle flash
SWEP.MuzzleAttachmentRaw = nil --This will override whatever string you gave.  This is the raw attachment number.  This is overridden or created when a gun makes a muzzle event.
SWEP.AutoDetectMuzzleAttachment = false --For multi-barrel weapons, detect the proper attachment?
SWEP.MuzzleFlashEffect = "tfa_muzzleflash_smg" --Change to a string of your muzzle flash effect.  Copy/paste one of the existing from the base.
--Shell eject override
SWEP.LuaShellEject = true --Enable shell ejection through lua?
SWEP.LuaShellEjectDelay = 0 --The delay to actually eject things
SWEP.LuaShellEffect = "ShellEject" --The effect used for shell ejection; Defaults to that used for blowback
--Tracer Stuff
SWEP.TracerCount 		= 3 	--0 disables, otherwise, 1 in X chance

--[[ATTACHMENTS]]--
SWEP.ViewModelBoneMods = {
	["A_Suppressor"] = { scale = Vector(0.75, 0.75, 0.75), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) } -- pretty useful for manipulating bonemerged stuff btw
}

SWEP.VElements = {
	["sight_kobra"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_kobra_l.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["sight_kobra_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_kobra") or nil,
	["sight_eotech"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_eotech.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["sight_eotech_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_eotech") or nil,
	["sight_rds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_aimpoint.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["sight_rds_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_rds") or nil,
	["scope_2xrds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_aimp2x.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["scope_c79"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_elcan_m.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["scope_po4x"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_po4x24_m.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },

	["suppressor"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_suppressor_sec.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 90, 0), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , bonemerge = true, active = false },

	["laser"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_laser_rail.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , bonemerge = true, active = false },
	["laser_beam"] = { type = "Model", model = "models/tfa/lbeam.mdl", bone = "A_Beam", rel = "laser", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(2, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },

	["flashlight"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_flashlight_rail.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , bonemerge = true, active = false },
}
SWEP.WElements = {
	["sight_eotech"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_eotech.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["sight_rds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_aimpoint.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["scope_2xrds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_magaim.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["scope_c79"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_elcan.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["sight_kobra"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_kobra.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
	["scope_po4x"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_po.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },

	["suppressor"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_sil_sec1.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },

	["laser"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/w_laser_sec.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
}

SWEP.Attachments = {
	[1] = { atts = { "ins2_br_supp" }, order = 1 },
	[2] = { atts = { "am_match", "am_magnum" }, order = 4 },
	[9] = { atts = { "ins2_si_kobra", "ins2_si_eotech", "ins2_si_rds", "ins2_si_2xrds", "ins2_si_c79", "ins2_si_po4x" }, order = 2 },
	[8] = { atts = { "ins2_ub_laser", "ins2_ub_flashlight" }, order = 3 }
}

SWEP.MuzzleAttachmentSilenced = 2

SWEP.LaserSightModAttachment = 1
SWEP.LaserSightModAttachmentWorld = 7
SWEP.LaserDotISMovement = true

DEFINE_BASECLASS( SWEP.Base )