steffyLib = {}

function onLoad(msg, prt)
	if prt == "server" then
		MsgC(Color( 137, 222, 255 ), "[SteffyLIB - Server] ", Color( 137, 222, 255 ), msg .. "\n")
	end
	if prt == "client" then
		MsgC(Color( 137, 222, 255 ), "[SteffyLIB - Client] ", Color( 137, 222, 255 ), msg .. "\n")
	end
	if prt == "shared" then
		MsgC(Color( 137, 222, 255 ), "[SteffyLIB - Shared] ", Color( 137, 222, 255 ), msg .. "\n")
	end
end

include_sv = (SERVER) and include or function() end
include_cl = (SERVER) and AddCSLuaFile() or include

function include_sh(name)
	include_sv(name)
	include_cl(name)
end

function Load()
	local files, folder = file.Find("autorun/lib/shared/", "LUA")

	for k, v in pairs(files) do
		include_sh("autorun/lib/shared/" .. v)
	end

	local cl_files, folder = file.Find("autorun/client/", "LUA")

	for k, v in pairs(cl_files) do
		include_cl("autorun/client/" .. v)
	end
end
Load()

onLoad("library has been loaded!", "server")