liferpPrint("fine","QUESTSYSTEM Loading")
local meta = FindMetaTable("Player")

function meta:getQuestEnabled()
	return self:GetNWBool("quest.enabled", false)
end
function meta:getQuest()
	return self:GetNWString("quest.class", "none")
end
function meta:getQuestValueStr(id)
	return self:GetNWString("quest."..id, "")
end
function meta:getQuestValueNum(id)
	return self:GetNWInt("quest."..id, 0)
end
function meta:getQuestValueBool(id)
	return self:GetNWBool("quest."..id, false)
end

lrpquests = {
	["boxquest"] = {
		["name"] = "lrp.quests.box.name",
		["description"] = "lrp.quests.box.description",
		["class_npc"] = "lrp_questboxnpc",
		["pos"] = Vector(-8036.984375, 3684.933838, -39.968750),
		["entities"] = {
			["lrp_questboxstart"] = Vector(-8121.968750, 3601.257813, 30),
			["lrp_questboxend"] = Vector(-6647.011230, 3918.346680, 30),
		},
		["vars"] = {
			["boxs"] = 0,
		},
	}
}

if SERVER then

	hook.Add("InitPostEntity","lrp.quests.spawn",function()
	timer.Simple(15,function()
		print("spawning quests entities")
	for k,v in pairs(lrpquests) do
		local npc = ents.Create(v["class_npc"])
		npc:SetPos(v["pos"])
		npc:Spawn()
		for k2,v2 in pairs(v["entities"]) do
			local ent = ents.Create(k2)
			ent:SetPos(v2)
			ent:Spawn()
		end
	end
end)
end)

	util.AddNetworkString("lrp.getquest")
	util.AddNetworkString("lrp.cancelquest")

	local meta = FindMetaTable("Player")
	function meta:setQuestValueStr(id,value)
		self:SetNWString("quest."..id, value)
	end
	function meta:setQuestValueNum(id,value)
		self:SetNWInt("quest."..id, value)
	end
	function meta:setQuestValueBool(id,value)
		self:SetNWBool("quest."..id, value)
	end
	function meta:enableQuest(id)
		self:SetNWString("quest.class",id)
		self:SetNWVector("quest.pos",lrpquests[id]["pos"])
		self:SetNWString("quest.name",lrpquests[id]["name"])
		self:SetNWString("quest.description",lrpquests[id]["description"])
		self:SetNWBool("quest.enabled", true)
	end

	function meta:offQuest()
		self:SetNWBool("quest.enabled", false)
	end

	net.Receive("lrp.getquest", function(_,ply)
		local id = net.ReadString()
		if lrpquests[id] != nil then
			local pos = lrpquests[id]["pos"]
			local aimentity = ply:GetEyeTrace().Entity:GetClass()
			local class = lrpquests[id]["class_npc"]
			if ply:GetPos():Distance(pos)<=250 then
				if aimentity==class then
					ply:enableQuest(id,pos,lrp,description)
					for k,v in pairs(lrpquests[id]["vars"]) do
						print(type(v))
						if type(v)=="string" then
							ply:setQuestValueStr(k,v)
						elseif type(v)=="number" then
							ply:setQuestValueNum(k,v)
						elseif type(v)=="boolean" then
							ply:setQuestValueBool(k,v)
						end
					end

					ply:lrpChat({lrpGetPhrase(lrpquests[id]["name"]),": ",lrpGetPhrase(lrpquests[id]["description"]) })
				else
					ply:lrpChat({lrpGetPhrase("lrp.npc.aim")})
				end
			else
				ply:lrpChat({lrpGetPhrase("lrp.npc.radius")})
			end
		end
	end)

	net.Receive("lrp.cancelquest", function(_,ply)
		local id = net.ReadString()
		ply:setQuestValueBool("enabled",false)
		if lrpquests[id] != nil then
			
		end
	end)
end

if CLIENT then
	function lrpGetQuest(id)
		net.Start("lrp.getquest")
			net.WriteString(id)
		net.SendToServer()
	end

	function lrpCancelQuest(id)
		net.Start("lrp.cancelquest")
			net.WriteString(id)
		net.SendToServer()
	end
end
liferpPrint("success","QUESTSYSTEM Loaded")