if SERVER then
	util.AddNetworkString("lrp.chat")
	util.AddNetworkString("lrp.notification")
	net.Receive("lrp.chat", function(_,ply)
		local type = net.ReadString()
		local plys = {}
		if type == "me" then
			for _,v in pairs(player.GetAll()) do if ply:GetPos():Distance(v:GetPos())<=300 then table.Add(plys, {v}) end end
			net.Start("lrp.chat") net.WriteTable({Color(55,255,55),ply:Nick()," ",net.ReadString()}) net.Broadcast(plys)
		elseif type == "do" then
			for _,v in pairs(player.GetAll()) do if ply:GetPos():Distance(v:GetPos())<=300 then table.Add(plys, {v}) end end
			net.Start("lrp.chat") net.WriteTable({Color(55,55,255),ply:Nick()," ",net.ReadString()}) net.Broadcast(plys)
		elseif type == "roll" then
			for _,v in pairs(player.GetAll()) do if ply:GetPos():Distance(v:GetPos())<=300 then table.Add(plys, {v}) end end
			net.Start("lrp.chat") net.WriteTable({Color(55,55,255),ply:Nick()," ",lrpGetPhrase("lrp.chat.rolling")," ",tostring(math.random(0, 100))}) net.Broadcast(plys)
		elseif type == "try" then
			for _,v in pairs(player.GetAll()) do if ply:GetPos():Distance(v:GetPos())<=300 then table.Add(plys, {v}) end end
			local chance1 = math.Rand(0, 100)
			if chance1>50 then
				net.Start("lrp.chat") net.WriteTable({Color(255,255,255),ply:Nick()," ",net.ReadString(),Color(55,255,55)," [",lrpGetPhrase("lrp.chat.true"),"]"}) net.Broadcast(plys)
			else
				net.Start("lrp.chat") net.WriteTable({Color(255,255,255),ply:Nick()," ",net.ReadString(),Color(255,55,55)," [",lrpGetPhrase("lrp.chat.false"),"]"}) net.Broadcast(plys)
			end
		elseif type == "shout" then
			for _,v in pairs(player.GetAll()) do if ply:GetPos():Distance(v:GetPos())<=1200 then table.Add(plys, {v}) end end
			net.Start("lrp.chat") net.WriteTable({Color(255,255,55),ply:Nick()," ",lrpGetPhrase("lrp.shouting")," ",Color(255,255,255),net.ReadString()}) net.Broadcast(plys)
		end
	end)

	local meta = FindMetaTable("Player")
	function meta:lrpChat(tbl)
		net.Start("lrp.chat")
		net.WriteTable(tbl)
		net.Send(self)
	end

	function meta:lrpNotification(text)
		net.Start("lrp.notification")
		net.WriteString(text)
		net.Send(self)
	end

	hook.Add("PlayerCanSeePlayersChat", "lrp.localchat", function(text,team,listener,speaker)
		return (speaker:GetPos():Distance(listener:GetPos())<=300)
	end)
end

if CLIENT then
	net.Receive("lrp.chat", function()
		local tbl = net.ReadTable()
		chat.AddText(unpack(tbl))
	end)

	net.Receive("lrp.notification", function()
		local text = net.ReadString()
		notification.AddLegacy(text, NOTIFY_GENERIC, 5)
	end) 
end