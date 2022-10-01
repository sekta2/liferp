local path = "/weapons/tfa_ins2/nova/"
local pref = "TFA_INS2.NOVA"
local hudcolor = Color(255, 80, 0, 191)

TFA.AddFireSound(pref .. ".1", path .. "nova_fp.wav", true, ")")
TFA.AddFireSound(pref .. ".2", path .. "nova_suppressed_fp.wav", true, ")")

TFA.AddWeaponSound(pref .. ".Boltback", path .. "nova_pumpback.wav")
TFA.AddWeaponSound(pref .. ".Boltrelease", path .. "nova_pumpforward.wav")
TFA.AddWeaponSound(pref .. ".Empty", path .. "nova_empty.wav")
TFA.AddWeaponSound(pref .. ".ShellInsert", {path .. "nova_shell_insert_1.wav", path .. "nova_shell_insert_2.wav", path .. "nova_shell_insert_3.wav"})
TFA.AddWeaponSound(pref .. ".ShellInsertSingle", {path .. "nova_single_shell_insert_1.wav", path .. "nova_single_shell_insert_2.wav", path .. "nova_single_shell_insert_3.wav"})

if killicon and killicon.Add then
	killicon.Add("tfa_ins2_nova", "vgui/killicons/tfa_ins2_nova", hudcolor)
end