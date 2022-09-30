liferpPrint("fine","CURSOR Loading")

lrpcursor = CreateClientConVar("lrp-cursor", "1", true)
hook.Add("PostDrawOpaqueRenderables", "lrp.cursordraw", function()
	local ply = LocalPlayer()
	local pos = ply:GetEyeTrace().HitPos
	if lrpcursor:GetString()=="1" then
		cam.Start3D2D(pos, ply:GetEyeTrace().HitNormal:Angle()+Angle(90,0,0), 0.1)
		draw.RoundedBox(200, 0-35/2, 0-35/2, 35, 35, Color(185,185,185,205))
		cam.End3D2D()
	end
end)

liferpPrint("success","CURSOR Loaded")