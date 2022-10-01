if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Chrome Finish"
ATTACHMENT.Description = { TFA.AttachmentColors["+"], "Chrome", "Shiny" }
ATTACHMENT.Icon = "entities/tfa_ins2_usp_match_chrome.png"
ATTACHMENT.ShortName = "CHROME"

ATTACHMENT.WeaponTable = {}

ATTACHMENT.MaterialTable = {
	[1] = "models/weapons/tfa_ins2/usp_match/skins/chrome/usp_weapon",
	[2] = "models/weapons/tfa_ins2/usp_match/skins/chrome/usp_match",
}

function ATTACHMENT:Attach(wep)
	wep.MaterialTable = wep.MaterialTable or {}
	for k, v in pairs(self.MaterialTable or {}) do
		wep.MaterialTable[k] = self.MaterialTable[k]
	end
	wep.MaterialCached = false
end

function ATTACHMENT:Detach(wep)
	wep.MaterialTable = wep.MaterialTable or {}
	for k, v in pairs(self.MaterialTable or {}) do
		wep.MaterialTable[k] = nil
	end
	wep.MaterialCached = false
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
