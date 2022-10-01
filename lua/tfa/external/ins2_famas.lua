local path = "weapons/tfa_ins2/famas/"
local pref = "TFA_INS2.FAMAS"
local hudcolor = Color(255, 80, 0, 191)

TFA.AddFireSound(pref .. ".1", path .. "famas_fp.wav", false, ")")
TFA.AddFireSound(pref .. ".2", path .. "famas_suppressed_fp.wav", false, ")")

TFA.AddWeaponSound(pref .. ".Empty", path .. "famas_empty.wav")
TFA.AddWeaponSound(pref .. ".Boltback", path .. "famas_boltback.wav")
TFA.AddWeaponSound(pref .. ".Boltrelease", path .. "famas_boltrelease.wav")
TFA.AddWeaponSound(pref .. ".Magrelease", path .. "famas_magrelease.wav")
TFA.AddWeaponSound(pref .. ".Magout", path .. "famas_magout.wav")
TFA.AddWeaponSound(pref .. ".Magin", path .. "famas_magin.wav")
TFA.AddWeaponSound(pref .. ".Rattle", path .. "famas_rattle.wav")
TFA.AddWeaponSound(pref .. ".ROF", path .. "famas_fireselect.wav")

if killicon and killicon.Add then
	killicon.Add("tfa_ins2_famas", "vgui/killicons/tfa_ins2_famas", hudcolor)
end