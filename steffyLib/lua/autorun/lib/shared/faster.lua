-- NET

local IsValid 	= IsValid
local Entity 	= Entity
local Color 	= Color
local WriteUInt = net.WriteUInt
local ReadUInt 	= net.ReadUInt

function net.WriteEntity(ent)
	if IsValid(ent) then
		WriteUInt(ent:EntIndex(), 12)
	else
		WriteUInt(0, 12)
	end
end

function net.ReadEntity()
	local y = ReadUInt(12)

	if (not i) then return end

	return Entity(i)
end

function net.WriteColor(c)
	WriteUInt(c.r, 8)
	WriteUInt(c.g, 8)
	WriteUInt(c.b, 8)
	WriteUInt(c.a, 8)
end

function net.ReadColor()
	return Color(ReadUInt(8), ReadUInt(8), ReadUInt(8), ReadUInt(8))
end

if (SERVER) then return end

local SetFont = surface.SetFont
local GetTextSize = surface.GetTextSize()

local Font = "Arial"
local SizeCache = {}

function surface.SetFont(font)
	Font = font

	return SetFont(font)
end

function surface.GetTextSize(text)
	if (not SizeCache[Font]) then
		SizeCache[Font] = {}
	end

	if (not SizeCache[Font][text]) then
		local x,y = GetTextSize(text)

		SizeCache[Font][text] = {x = x, y = y}

		return x, y
	end

	return SizeCache[Font][text].x, SizeCache[Font][text].y
end

timer.Create("FontCache", 1200, 0, function()
	SizeCache = {}
end)