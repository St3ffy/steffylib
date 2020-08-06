concommand.Add("pos", function(ply)
	print("Vector(" .. math.Round(ply:GetPos().x) .. ", " .. math.Round(ply:GetPos().y) .. ", " .. math.Round(ply:GetPos().z) .. ")") 
end)

concommand.Add("pgroups", function(ply)
	if not ply:IsUserGroup("user") then
		for k,v in pairs(player.GetAll()) do
			print(v:Nick() .. " | " .. v:GetUserGroup())
		end
	end
end)

concommand.Add("pid", function(ply,cmd,args)
	local nick = args[1]
	nick = string.lower(nick)

	for k,v in pairs(player.GetAll()) do
		if string.find(string.lower(v:Nick()), nick) then
			print("Player SteamID: " .. v:SteamID())

			return
		end
	end

	print("This player not finded")
end)