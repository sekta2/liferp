if SERVER then
	hook.Add("PlayerInitialSpawn", "lrp.plyspawnmoney", function(ply)
		ply:SetNWInt("lrp.money", ply:GetPData("lrp.money", 0))
	end)

	local ply = FindMetaTable("Player")
	function ply:lrpSetMoney(count)
		self:SetPData("lrp.money", count)
		self:SetNWInt("lrp.money", self:GetPData("lrp.money",0))
	end

	function ply:lrpAddMoney(count)
		local money = self:GetPData("lrp.money",0)
		self:SetPData("lrp.money", money+count)
		self:SetNWInt("lrp.money", self:GetPData("lrp.money",0))
	end
end

if CLIENT then

end