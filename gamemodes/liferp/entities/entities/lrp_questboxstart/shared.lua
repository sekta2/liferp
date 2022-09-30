AddCSLuaFile()
ENT.Type = "anim"
ENT.Base = "base_anim"

ENT.PrintName = "Quest Box Start"

ENT.Spawnable = false

if SERVER then
	function ENT:Initialize()
		self:SetModel("models/props/cs_office/crates_indoor.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:DropToFloor()
		self:SetSolid(SOLID_VPHYSICS)
		self:SetUseType(SIMPLE_USE)

		local phys = self:GetPhysicsObject()

		if IsValid(phys) then
			phys:EnableMotion(false)
		end
	end

	function ENT:Use(ply)
		if ply:getQuestEnabled()==true and ply:getQuest()=="boxquest" then
			if !ply:HasWeapon("weapon_boxquest") then
				ply:Give("weapon_boxquest",true)
				ply:SelectWeapon("weapon_boxquest")
				ply:lrpChat({lrpGetPhrase("lrp.quests.box.take")})
			else
				ply:lrpChat({lrpGetPhrase("lrp.quests.box.taked")})
			end
		else
			ply:lrpChat({lrpGetPhrase("lrp.quests.get")})
		end
	end
end

if CLIENT then
	function ENT:Draw()
		self:DrawModel()
		local ply = LocalPlayer()

		if ply:getQuestEnabled()==true and ply:getQuest()=="boxquest" and !ply:HasWeapon("weapon_boxquest") and ply:GetPos():Distance(self:GetPos())>=450 then
			cam.Start2D()
				local mat = Material("lrp-here.png")
				local pos = self:GetPos()
				pos.z=ply:GetPos().z+30
				draw.RoundedBox(200, pos:ToScreen().x, pos:ToScreen().y-50/2, 50, 50, Color(55,55,55,150))
				surface.SetMaterial(mat)
				surface.SetDrawColor(255,255,255,235)
				surface.DrawTexturedRect(pos:ToScreen().x+1, pos:ToScreen().y-48/2+1, 48, 48)
			cam.End2D()
		end

		if ply:GetEyeTrace().Entity == self and ply:GetPos():Distance(self:GetPos())<=300 then
			cam.Start2D()
				surface.SetFont("lrp.hintfont")
				local w,h = surface.GetTextSize(lrpGetPhrase("lrp.quests.box.use") or "nil")
				draw.RoundedBox(200, ply:GetEyeTrace().HitPos:ToScreen().x, ply:GetEyeTrace().HitPos:ToScreen().y-50/2, w+70, 50, Color(55,55,55,150))
				local mat = Material("lrp-use.png")
				surface.SetMaterial(mat)
				surface.SetDrawColor(255,255,255,235)
				surface.DrawTexturedRect(ply:GetEyeTrace().HitPos:ToScreen().x+1, ply:GetEyeTrace().HitPos:ToScreen().y-48/2+1, 48, 48)
				draw.SimpleText(lrpGetPhrase("lrp.quests.box.use"), "lrp.hintfont", ply:GetEyeTrace().HitPos:ToScreen().x+55, ply:GetEyeTrace().HitPos:ToScreen().y, Color( 255, 255, 255, 235 ), TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
			cam.End2D()
		end
	end
end