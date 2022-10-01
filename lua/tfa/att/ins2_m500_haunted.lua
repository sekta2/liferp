if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Abstract Cult"
ATTACHMENT.Description = {
	TFA.AttachmentColors["+"], "Glows in the dark",
	TFA.AttachmentColors["-"], "Glows in the dark",
	-- TFA.AttachmentColors["="], "", "good job you found a haunted one"
}
ATTACHMENT.Icon = "entities/tfa_ins2_m500_haunted.png"
ATTACHMENT.ShortName = "CULT"

ATTACHMENT.WeaponTable = {
	["MaterialTable_V"] = {
		[1] = "models/weapons/tfa_ins2/m500/m500_occult",
	},
	["MaterialTable_W"] = {
		[1] = "models/weapons/tfa_ins2/m500/m500_occult",
	}
}

local function resetMatCache(att, wep)
	wep.MaterialCached = false
end

ATTACHMENT.Attach = resetMatCache
ATTACHMENT.Detach = resetMatCache

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
