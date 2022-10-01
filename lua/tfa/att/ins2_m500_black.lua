if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Black Finish"
ATTACHMENT.Description = {
	Color(80, 160, 153), "- We're 100% BLACK.",
	Color(255, 255, 255), "- Me too."
}
ATTACHMENT.Icon = "entities/tfa_ins2_m500_black.png"
ATTACHMENT.ShortName = "BLACK"

ATTACHMENT.WeaponTable = {
	["MaterialTable_V"] = {
		[1] = "models/weapons/tfa_ins2/m500/m500_black",
	},
	["MaterialTable_W"] = {
		[1] = "models/weapons/tfa_ins2/m500/m500_black",
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
