
--fonts
surface.CreateFont("lrp.cmenubuttonfont", {
	font = "Montserrat SemiBold",
	weight = 200,
	size = 30,
	extended = true
})
local panel = nil

local function createButton(x,y,icon,doclick)
	local but = vgui.Create("DButton", panel)
	but:SetSize(200,200)
	but:SetPos(x,y)
	but:SetText("")
	but.hover = false
	but.Paint = function(self,w,h)
		draw.RoundedBox(2000, 0, 0, w, h, Color(77,77,77,133))
		if self:IsHovered() then
			if but.hover==false then surface.PlaySound("liferp/hover.mp3") end
			but.hover=true
			surface.SetMaterial(Material(icon))
			surface.SetDrawColor(255,255,255,255)
			surface.DrawTexturedRect(10, 10, 200-20, 200-20)
		else
			but.hover=false
			surface.SetMaterial(Material(icon))
			surface.SetDrawColor(255,255,255,255)
			surface.DrawTexturedRect(20, 20, 200-40, 200-40)
		end
	end
	but.DoClick = function() surface.PlaySound("liferp/click.mp3") doclick() end
end

local function loadMenu1()
	
	createButton(ScrW()/2-200,ScrH()/2-200/2,"lrp-roleplay.png",function()
		local menu = vgui.Create("DMenu", panel)
		menu:SetPos(gui.MouseX(),gui.MouseY())

		local chatmenu = menu:AddSubMenu(lrpGetPhrase("lrp.chat"))
		chatmenu:AddOption(lrpGetPhrase("lrp.chat.me"), function() 
			Derma_StringRequest(lrpGetPhrase("lrp.chat.me"), lrpGetPhrase("lrp.chat.text"), "", function(text)
				net.Start("lrp.chat") net.WriteString("me") net.WriteString(text) net.SendToServer()
			end, nil, lrpGetPhrase("lrp.send"), lrpGetPhrase("lrp.cancel"))
		end)
		chatmenu:AddOption(lrpGetPhrase("lrp.chat.do"), function() 
			Derma_StringRequest(lrpGetPhrase("lrp.chat.do"), lrpGetPhrase("lrp.chat.text"), "", function(text)
				net.Start("lrp.chat") net.WriteString("do") net.WriteString(text) net.SendToServer()
			end, nil, lrpGetPhrase("lrp.send"), lrpGetPhrase("lrp.cancel"))
		end)
		chatmenu:AddOption(lrpGetPhrase("lrp.chat.roll"), function() net.Start("lrp.chat") net.WriteString("roll") net.SendToServer() end)
		chatmenu:AddOption(lrpGetPhrase("lrp.chat.try"), function() 
			Derma_StringRequest(lrpGetPhrase("lrp.chat.try"), lrpGetPhrase("lrp.chat.text"), "", function(text)
				net.Start("lrp.chat") net.WriteString("try") net.WriteString(text) net.SendToServer()
			end, nil, lrpGetPhrase("lrp.send"), lrpGetPhrase("lrp.cancel"))
		end)
		chatmenu:AddOption(lrpGetPhrase("lrp.chat.shout"), function() 
			Derma_StringRequest(lrpGetPhrase("lrp.chat.shout"), lrpGetPhrase("lrp.chat.text"), "", function(text)
				net.Start("lrp.chat") net.WriteString("shout") net.WriteString(text) net.SendToServer()
			end, nil, lrpGetPhrase("lrp.send"), lrpGetPhrase("lrp.cancel"))
		end)

		local gesturesmenu = menu:AddSubMenu(lrpGetPhrase("lrp.gestures"))
		gesturesmenu:AddOption(lrpGetPhrase("lrp.gestures.dance"),function() RunConsoleCommand("act","dance") end)
		gesturesmenu:AddOption(lrpGetPhrase("lrp.gestures.striptease"),function() RunConsoleCommand("act","muscle") end)
		gesturesmenu:AddOption(lrpGetPhrase("lrp.gestures.robot"),function() RunConsoleCommand("act","robot") end)
		gesturesmenu:AddSpacer()
		gesturesmenu:AddOption(lrpGetPhrase("lrp.gestures.greet"),function() RunConsoleCommand("act","wave") end)
		gesturesmenu:AddOption(lrpGetPhrase("lrp.gestures.salute"),function() RunConsoleCommand("act","salute") end)
		gesturesmenu:AddOption(lrpGetPhrase("lrp.gestures.bow"),function() RunConsoleCommand("act","bow") end)
		gesturesmenu:AddOption(lrpGetPhrase("lrp.gestures.laugh"),function() RunConsoleCommand("act","laugh") end)
		gesturesmenu:AddOption(lrpGetPhrase("lrp.gestures.agree"),function() RunConsoleCommand("act","agree") end)
		gesturesmenu:AddOption(lrpGetPhrase("lrp.gestures.becon"),function() RunConsoleCommand("act","becon") end)
		gesturesmenu:AddOption(lrpGetPhrase("lrp.gestures.cheer"),function() RunConsoleCommand("act","cheer") end)
		gesturesmenu:AddOption(lrpGetPhrase("lrp.gestures.forward"),function() RunConsoleCommand("act","forward") end)
		gesturesmenu:AddOption(lrpGetPhrase("lrp.gestures.group"),function() RunConsoleCommand("act","group") end)
		gesturesmenu:AddOption(lrpGetPhrase("lrp.gestures.halt"),function() RunConsoleCommand("act","halt") end)
		gesturesmenu:AddOption(lrpGetPhrase("lrp.gestures.pers"),function() RunConsoleCommand("act","pers") end)
		gesturesmenu:AddOption(lrpGetPhrase("lrp.gestures.zombie"),function() RunConsoleCommand("act","zombie") end)

	end)
	createButton(ScrW()/2,ScrH()/2-200/2,"lrp-settings.png",function()
		local menu = vgui.Create("DMenu", panel)
		menu:SetPos(gui.MouseX(),gui.MouseY())

		local cameramode = menu:AddSubMenu(lrpGetPhrase("lrp.cameramode"))
		cameramode:AddOption(lrpGetPhrase("lrp.cameramode.firstperson1"), function() RunConsoleCommand("lrp-cameramode", "0") end)
		cameramode:AddOption(lrpGetPhrase("lrp.cameramode.firstperson2"), function() RunConsoleCommand("lrp-cameramode", "2") end)
		cameramode:AddOption(lrpGetPhrase("lrp.cameramode.thirdperson"), function() RunConsoleCommand("lrp-cameramode", "1") end)

		local languane = menu:AddSubMenu(lrpGetPhrase("lrp.languane"))
		languane:AddOption(lrpGetPhrase("lrp.russian"), function() RunConsoleCommand("lrp-languane", "ru") end)
		languane:AddOption(lrpGetPhrase("lrp.english"), function() RunConsoleCommand("lrp-languane", "en") end)

		menu:AddCVar(lrpGetPhrase("lrp.cursor"), "lrp-cursor", "1", "0")
	end)

end

local function lrpCmenu()
	panel = vgui.Create("DFrame")
	panel:SetSize(ScrW(),ScrH())
	panel:ShowCloseButton(false)
	panel:SetTitle("")
	panel:SetDraggable(false)
	panel:MakePopup()
	panel.Paint = function(self,w,h)
		draw.RoundedBox(0, 0, 0, w, h, Color(77,77,77,111))
	end

	loadMenu1()

end

hook.Add("OnContextMenuOpen", "lrp.cmenuopen", function() lrpCmenu() end)
hook.Add("OnContextMenuClose", "lrp.cmenuclose", function() panel:Remove() end)