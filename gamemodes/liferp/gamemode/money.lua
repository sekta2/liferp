if SERVER then
	util.AddNetworkString("lrp.dropmoney")
	util.AddNetworkString("lrp.sendmoney")

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

	function createMoney(money,pos)
		local ent = ents.Create("lrp_money")
		ent:SetPos(pos)
		ent:SetNWInt("lrp.money",money)
		ent:Spawn()
	end

	net.Receive("lrp.dropmoney",function(_,ply)
		local amount = net.ReadFloat()
		local pos = ply:LocalToWorld(Vector(20,0,50))
		ply:lrpAddMoney(-amount)
		createMoney(amount,pos)
	end)
end

if CLIENT then
	function cdropMoney(amount)
		net.Start("lrp.dropmoney")
		if amount==nil then net.WriteFloat(0) else net.WriteFloat(amount) end
		net.SendToServer()
	end
	function csendMoney(amount)
		net.Start("lrp.sendmoney")
		if amount==nil then net.WriteFloat(0) else net.WriteFloat(amount) end
		net.SendToServer()
	end
end