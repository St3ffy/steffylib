local ply = FindMetaTable("Player")

function ply:ConsolePrint(msg)
	self:PrintMessage(HUD_PRINTCONSOLE, msg)
end

function ply:ChatPrint(msg)
	self:PrintMessage(HUD_PRINTTALK, msg)
end

function ply:CenterPrint(msg)
	self:PrintMessage(HUD_PRINTCENTER, msg)
end

function ply:NotifyPrint(msg)
	self:PrintMessage(HUD_PRINTNOTIFY, msg)
end