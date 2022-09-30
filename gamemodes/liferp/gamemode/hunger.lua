print("h1")
liferpPrint("fine","HUNGER Loading")
print("h2")
if SERVER then

	hook.Add("PlayerSpawn", "lrp.hungerspawnply", function(ply,_)
		timer.Simple(0.5,function()
			ply:SetNWInt("lrp.hunger",100)
		end)
	end)

	timer.Create("lrp.hunger", 15, 0, function()
		for _,ply in pairs(player.GetAll()) do
			if ply:GetNWInt("lrp.hunger", 100)<=0 then
				ply:TakeDamage(20)
			else
				if ply:IsSprinting() then
					ply:SetNWInt("lrp.hunger", ply:GetNWInt("lrp.hunger", 100)-5)
				else
					ply:SetNWInt("lrp.hunger", ply:GetNWInt("lrp.hunger", 100)-2)
				end
				if ply:GetNWInt("lrp.hunger", 100)<0 then ply:SetNWInt("lrp.hunger",0) end
			end
		end
	end)
end

if CLIENT then

end
liferpPrint("success","HUNGER Loading")