AddCSLuaFile()
ENT.Type = "ai"
ENT.Base = "base_ai"

ENT.PrintName = "Quest Box Npc"

ENT.Spawnable = false

if SERVER then
	function ENT:Initialize()
		self:SetModel("models/Humans/Group01/male_02.mdl")
		self:SetHullType( HULL_HUMAN )
		self:SetHullSizeNormal()
		self:SetSolid( SOLID_BBOX )
		self:CapabilitiesAdd( CAP_ANIMATEDFACE )
		self:CapabilitiesAdd( CAP_TURN_HEAD )
		self:DropToFloor()
		self:SetMoveType( MOVETYPE_NONE )
		self:SetCollisionGroup( COLLISION_GROUP_PLAYER )
		self:SetUseType( SIMPLE_USE )

		local phys = self:GetPhysicsObject()

		if IsValid(phys) then
			phys:EnableMotion(false)
		end
	end
end

if CLIENT then

	local function uiCreateButton(title,x,y,doclick)
		if ui3d2d.isHovering(x, y, 100, 25) then
			if ui3d2d.isPressed() then doclick() end
			surface.SetDrawColor(Color(165,165,165,255))
			surface.DrawOutlinedRect(x, y, 100, 25, 2)
			draw.SimpleText(title, "lrp.font4", x+100/2, y+25/2-1, Color( 165, 165, 165, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		else
			surface.SetDrawColor(Color(255,255,255,255))
			surface.DrawOutlinedRect(x, y, 100, 25, 2)
			draw.SimpleText(title, "lrp.font4", x+100/2, y+25/2-1, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	end

	function ENT:Draw()
		self:DrawModel()
		local ply = LocalPlayer()

		if self:GetPos():Distance(ply:GetPos())<=300 then
			if not ui3d2d.startDraw(self:LocalToWorld(Vector(10,0,50)),self:LocalToWorldAngles(Angle(0,90,90)),0.1) then return end

			draw.SimpleText(lrpGetPhrase(lrpquests["boxquest"]["name"]), "lrp.font5", -50, -20, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			draw.SimpleText(lrpGetPhrase(lrpquests["boxquest"]["description"]), "lrp.font4", -50, 0, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			local x,y = -50,25

			if ply:getQuestEnabled()==false then
				uiCreateButton(lrpGetPhrase("lrp.accept"),x,y,function()
					lrpGetQuest("boxquest")
				end)
				x = x+105
			end

			if ply:getQuest()=="boxquest" and ply:getQuestEnabled()==true then
				uiCreateButton(lrpGetPhrase("lrp.cancel"),x,y,function()
					lrpCancelQuest("boxquest")
				end)
			end
			ui3d2d.endDraw()
		end
	end
end