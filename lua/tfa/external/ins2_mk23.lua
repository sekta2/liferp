local path = "weapons/tfa_ins2/mk23/"
local pref = "TFA_INS2.MK23"
local hudcolor = Color(255, 80, 0, 191)

TFA.AddFireSound(pref .. ".1", path .. "m45_fp.wav", false, ")")
TFA.AddFireSound(pref .. ".2", path .. "m45_suppressed_fp.wav", false, ")")

TFA.AddWeaponSound(pref .. ".Boltback", path .. "boltback.wav")
TFA.AddWeaponSound(pref .. ".Boltrelease", path .. "boltrelease.wav")
TFA.AddWeaponSound(pref .. ".Boltslap", path .. "boltslap.wav")
TFA.AddWeaponSound(pref .. ".Empty", path .. "empty.wav")
TFA.AddWeaponSound(pref .. ".MagHit", path .. "maghit.wav")
TFA.AddWeaponSound(pref .. ".Magin", path .. "magin.wav")
TFA.AddWeaponSound(pref .. ".Magout", path .. "magout.wav")
TFA.AddWeaponSound(pref .. ".Magrelease", path .. "magrelease.wav")

if killicon and killicon.Add then
	killicon.Add("tfa_ins2_mk23", "vgui/killicons/tfa_ins2_mk23", hudcolor)
end