function liferpPrint(status,text)
	if status == "fine" then
		MsgC(Color(55,55,255),"[LIFERP-SV] ",Color(255,255,255),text,"\n")
	elseif status == "error" then
		MsgC(Color(255,55,55),"[LIFERP-SV] ",Color(255,255,255),text,"\n")
	elseif status == "success" then
		MsgC(Color(55,255,55),"[LIFERP-SV] ",Color(255,255,255),text,"\n")
	end
end

include("languane.lua")
include("quest.lua")
include("chat.lua")
include("hunger.lua")
include("money.lua")
include("territories.lua")

AddCSLuaFile("cl_fonts.lua")
AddCSLuaFile("languane.lua")
AddCSLuaFile("cl_hints.lua")
AddCSLuaFile("chat.lua")
AddCSLuaFile("quest.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_cursor.lua")
AddCSLuaFile("cl_hud.lua")
AddCSLuaFile("cl_thirdperson.lua")
AddCSLuaFile("hunger.lua")
AddCSLuaFile("money.lua")
AddCSLuaFile("territories.lua")
AddCSLuaFile("cl_cmenu.lua")

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

RunConsoleCommand("mp_falldamage", "1")

function GM:PlayerInitialSpawn(ply)
	ply:SetModel("models/player/kleiner.mdl")
end
