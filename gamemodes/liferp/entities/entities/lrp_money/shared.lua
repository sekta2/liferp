AddCSLuaFile()
ENT.Type = "anim"
ENT.Base = "base_anim"

ENT.PrintName = "Money"

ENT.Spawnable = false

if SERVER then
	function ENT:Initialize()
		self:SetModel("models/props/cs_assault/money.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
        self:SetCollisionGroup(COLLISION_GROUP_WEAPON)

		local phys = self:GetPhysicsObject()

		if IsValid(phys) then
			phys:Wake()
		end
	end

	function ENT:Use(ply)
        ply:lrpNotification(lrpGetPhrase("lrp.takedmoney") .. " " .. self:GetNWInt("lrp.money",0) .. "$")
		ply:lrpAddMoney(self:GetNWInt("lrp.money",0))
        self:Remove()
	end

    function ENT:StartTouch(entity)
		if entity:GetClass()=="lrp_money" then
            entity:Remove()
            self:SetNWInt("lrp.money",entity:GetNWInt("lrp.money",0)+self:GetNWInt("lrp.money",0))
        end
	end

end

if CLIENT then
	function ENT:Draw()
		self:DrawModel()
		local ply = LocalPlayer()

		if ply:GetEyeTrace().Entity == self and ply:GetPos():Distance(self:GetPos())<=300 then
			cam.Start2D()
				surface.SetFont("lrp.hintfont")
				local w,h = surface.GetTextSize(lrpGetPhrase("lrp.take") .. " " .. self:GetNWInt("lrp.money",0) .. "$" or "nil")
				draw.RoundedBox(200, ply:GetEyeTrace().HitPos:ToScreen().x, ply:GetEyeTrace().HitPos:ToScreen().y-50/2, w+70, 50, Color(55,55,55,150))
				local mat = Material("lrp-use.png")
				surface.SetMaterial(mat)
				surface.SetDrawColor(255,255,255,235)
				surface.DrawTexturedRect(ply:GetEyeTrace().HitPos:ToScreen().x+1, ply:GetEyeTrace().HitPos:ToScreen().y-48/2+1, 48, 48)
				draw.SimpleText(lrpGetPhrase("lrp.take") .. " " .. self:GetNWInt("lrp.money",0) .. "$", "lrp.hintfont", ply:GetEyeTrace().HitPos:ToScreen().x+55, ply:GetEyeTrace().HitPos:ToScreen().y, Color( 255, 255, 255, 235 ), TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
			cam.End2D()
		end
	end
end