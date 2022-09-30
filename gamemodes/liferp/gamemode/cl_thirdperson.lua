liferpPrint("fine","THIRDPERSON Loading")
local lerpPos = Vector()
local enabled = CreateClientConVar("lrp-cameramode", "2", true)
local oldnum = "0"
hook.Add("CalcView","lrp.thirdperson",function(ply, pos, angles, fov)

	if enabled:GetString() != oldnum then
		oldnum = enabled:GetString()
		if oldnum=="1" then
			ply:ManipulateBoneScale(ply:LookupBone("ValveBiped.Bip01_Head1"), Vector(1,1,1))
			ply:ManipulateBoneScale(ply:LookupBone("ValveBiped.Bip01_Neck1"), Vector(1,1,1))
		elseif oldnum=="2" then
			ply:ManipulateBoneScale(ply:LookupBone("ValveBiped.Bip01_Head1"), Vector(0,0,0))
			ply:ManipulateBoneScale(ply:LookupBone("ValveBiped.Bip01_Neck1"), Vector(0,0,0))
		else
			ply:ManipulateBoneScale(ply:LookupBone("ValveBiped.Bip01_Head1"), Vector(1,1,1))
			ply:ManipulateBoneScale(ply:LookupBone("ValveBiped.Bip01_Neck1"), Vector(1,1,1))
		end
	end


	if enabled:GetString()=="1" then
		local posA = pos - ( angles:Forward() * 40)
		local posA = posA + ( angles:Right() * 20)
		lerpPos = lerpPos + (posA - lerpPos) / 5
		local view = {
			origin = lerpPos,
			angles = angles,
			fov = fov,
			drawviewer = true
		}
		return view
	elseif enabled:GetString()=="2" then
		local position,angless = ply:GetBonePosition(ply:LookupBone("ValveBiped.Bip01_Head1"))
		local view = {
			origin = LocalToWorld(Vector(0,0,5), Angle(), position, (ply:GetAimVector()):Angle()),
			angles = (ply:GetAimVector()):Angle(),
			fov = fov,
			drawviewer = true
		}
		return view
	end

end)

liferpPrint("success","THIRDPERSON Loaded!")