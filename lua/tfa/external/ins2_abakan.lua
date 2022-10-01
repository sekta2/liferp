local path = "weapons/tfa_ins2/abakan/"
local pref = "TFA_INS2.AN94"
local hudcolor = Color(255, 80, 0, 191)

TFA.AddFireSound(pref .. ".1", path .. "fire.wav", false, ")")
TFA.AddFireSound(pref .. ".2", path .. "suppressed_fp.wav", false, ")")

TFA.AddWeaponSound(pref .. ".Boltback", path .. "boltbackcombo.wav")
TFA.AddWeaponSound(pref .. ".Boltrelease", path .. "boltforward.wav")
TFA.AddWeaponSound(pref .. ".Empty", path .. "empty.wav")
TFA.AddWeaponSound(pref .. ".Magin", path .. "magincombo.wav")
TFA.AddWeaponSound(pref .. ".Magout", path .. "magout.wav")
TFA.AddWeaponSound(pref .. ".ROF", {path .. "fireselect_1.wav", path .. "fireselect_2.wav"})
TFA.AddWeaponSound(pref .. ".Rattle", path .. "rattle.wav")

if killicon and killicon.Add then
	killicon.Add("tfa_ins2_abakan", "vgui/killicons/tfa_ins2_abakan", hudcolor)
end