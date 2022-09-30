liferpPrint("fine","HUD Loading")
--hide default hud
local huds = {"CHudHealth","CHudBattery","CHudAmmo","CHudAltAmmo"}
hook.Add("HUDShouldDraw", "lrp.hidedefaulthud", function(hud)
	for _,v in pairs(huds) do
		if hud == v then return false end
	end
end)

--fonts
surface.CreateFont("lrp.moneyfont", {
	font = "Montserrat SemiBold",
	weight = 200,
	size = 24,
	extended = true
})

--life rp hud
local lerphealth = 0
local lerpfood = 0
hook.Add("HUDPaint","lrp.hud",function()
	local ply = LocalPlayer()
	local x,y = 30,ScrH()-30

	local health = (ply:Health() * 150) / ply:GetMaxHealth()
	if health>150 then health = 150 end
	lerphealth = lerphealth + (health - lerphealth) / 50
	draw.RoundedBox(5, x+35, y, 150, 20, Color(55,55,55,77))
	surface.SetMaterial(Material("lrp-health.png"))
	surface.SetDrawColor(Color(255,55,55,100))
	surface.DrawTexturedRect(x, y-5, 30, 30)
	x = x+35
	draw.RoundedBox(5, x, y, lerphealth, 20, Color(255,55,55,100))
	x = x+150+20

	local food = (ply:GetNWInt("lrp.hunger", 100) * 150) / 100
	if food>150 then food = 150 end
	lerpfood = lerpfood + (food - lerpfood) / 50
	draw.RoundedBox(5, x+35, y, 150, 20, Color(55,55,55,77))
	surface.SetMaterial(Material("lrp-food.png"))
	surface.SetDrawColor(Color(255,255,55,100))
	surface.DrawTexturedRect(x, y-5, 30, 30)
	x = x+35
	draw.RoundedBox(5, x, y, lerpfood, 20, Color(255,255,55,100))
	x = x+150+20

	surface.SetFont("lrp.moneyfont")
	local xx,yy = surface.GetTextSize(tostring(ply:GetNWInt("lrp.money"),0).."$")
	draw.RoundedBox(5, x, y, xx+10, 20, Color(55,55,55,77))
	draw.SimpleText(tostring(ply:GetNWInt("lrp.money"),0).."$", "lrp.moneyfont", x+5,y+20/2, Color( 55, 255, 55, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
end)

liferpPrint("success","HUD Loaded!")