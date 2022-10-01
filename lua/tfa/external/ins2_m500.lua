local path = "/weapons/tfa_ins2/m500/"
local pref = "TFA_INS2.M500"
local hudcolor = Color(255, 80, 0, 191)

TFA.AddFireSound(pref .. ".1", path .. "m500_fp.wav", true, ")")
TFA.AddFireSound(pref .. ".2", path .. "m500_suppressed_fp.wav", true, ")")

TFA.AddWeaponSound(pref .. ".Boltback", path .. "m500_pumpback.wav")
TFA.AddWeaponSound(pref .. ".Boltrelease", path .. "m500_pumpforward.wav")
TFA.AddWeaponSound(pref .. ".Empty", path .. "m500_empty.wav")
TFA.AddWeaponSound(pref .. ".ShellInsert", {path .. "m500_shell_insert_1.wav", path .. "m500_shell_insert_2.wav", path .. "m500_shell_insert_3.wav"})
TFA.AddWeaponSound(pref .. ".ShellInsertSingle", {path .. "m500_single_shell_insert_1.wav", path .. "m500_single_shell_insert_2.wav", path .. "m500_single_shell_insert_3.wav"})

if killicon and killicon.Add then
	killicon.Add("tfa_ins2_m500", "vgui/killicons/tfa_ins2_m500", hudcolor)
end