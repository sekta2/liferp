liferpPrint("fine","HINTS Loading")

--fonts
surface.CreateFont("lrp.hintfont", {
	font = "Montserrat SemiBold",
	weight = 200,
	size = 30,
	extended = true
})
local oldent = nil
hook.Add("HUDPaint","lrp.enthint",function()
	local ply = LocalPlayer()
	local ent = ply:GetEyeTrace().Entity
	if ent != oldent then
		oldent = ent
		if ent:GetClass()=="class C_BaseEntity" then surface.PlaySound("liferp/hover.mp3") end
	end
	if ent:GetClass()=="class C_BaseEntity" then
		if ply:KeyReleased(IN_USE) then surface.PlaySound("liferp/click.mp3") end
		surface.SetFont("lrp.hintfont")
		local w,h = surface.GetTextSize(lrpGetPhrase("lrp.hint.use"))
		draw.RoundedBox(200, ent:GetPos():ToScreen().x, ent:GetPos():ToScreen().y-50/2, w+70, 50, Color(55,55,55,150))
		local mat = Material("lrp-use.png")
		surface.SetMaterial(mat)
		surface.SetDrawColor(255,255,255,235)
		surface.DrawTexturedRect(ent:GetPos():ToScreen().x+1, ent:GetPos():ToScreen().y-48/2+1, 48, 48)
		draw.SimpleText(lrpGetPhrase("lrp.hint.use"), "lrp.hintfont", ent:GetPos():ToScreen().x+55, ent:GetPos():ToScreen().y, Color( 255, 255, 255, 235 ), TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
	end
end)

liferpPrint("success","HINTS Loaded!")
