function liferpPrint(status,text)
	if status == "fine" then
		MsgC(Color(55,55,255),"[LIFERP-CL] ",Color(255,255,255),text,"\n")
	elseif status == "error" then
		MsgC(Color(255,55,55),"[LIFERP-CL] ",Color(255,255,255),text,"\n")
	elseif status == "success" then
		MsgC(Color(55,255,55),"[LIFERP-CL] ",Color(255,255,255),text,"\n")
	end
end

include("cl_fonts.lua")
include("languane.lua")
include("cl_hints.lua")
include("chat.lua")
include("quest.lua")
include("shared.lua")
include("cl_cursor.lua")
include("cl_hud.lua")
include("cl_thirdperson.lua")
include("hunger.lua")
include("money.lua")
include("territories.lua")
include("cl_cmenu.lua")