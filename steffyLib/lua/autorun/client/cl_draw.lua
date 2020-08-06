for i = 1, 100 do
	surface.CreateFont("font_" .. i, {
		font = "Verdana",
		size = i,
		weight = 550
	})
end

local blur = Material('pp/blurscreen')
function steffyLib.Blur(panel, amount) -- Thanks nutscript
	local x, y = panel:LocalToScreen(0, 0)
	local scrW, scrH = ScrW(), ScrH()
	surface_SetDrawColor(255, 255, 255)
	surface_SetMaterial(blur)
	for i = 1, 3 do
		blur:SetFloat('$blur', (i / 3) * (amount or 6))
		blur:Recompute()
		render_UpdateScreenEffectTexture()
		surface_DrawTexturedRect(x * -1, y * -1, scrW, scrH)
	end
end

function steffyLib.Rect(x,y,w,h,clr)
	surface.SetDrawColor(clr)
	surface.DrawRect(x,y,w,h)
end

function steffyLib.Text(txt,size,x,y,clr,align1,align2)
	if not align1 then aligh1 = 0 end
	if not align2 then align2 = 0 end
	if clr == nil then clr = Color(0,0,0,180) end

	draw.SimpleText(txt,"font_"..size,x,y,clr,align1,align2)
end

function steffyLib.OutlinedRect(x,y,w,h,clr)
	if not clr then clr = Color(0,0,0,180) end

	surface.SetDrawColor(clr)
	surface.DrawOutlinedRect(x,y,w,h)
end

function steffyLib.CBox(x, y, w, h, lclr, clr) -- min w, h is 11
	if not clr then clr = Color(0,0,0,180) end

	surface.SetDrawColor(clr)
	surface.DrawRect(x,y,w,h)

	surface.SetDrawColor(lclr)

	surface.DrawLine(x+0, y+0, x+0, y+10)
	surface.DrawLine(x+0, y+0, x+10, y+0)

	surface.DrawLine(x+0, y+h-1, x+10, y+h-1)
	surface.DrawLine(x+0, y+h-1, x+0, y+h-11)

	surface.DrawLine(x+w-10, y+0, x+w-1, y+0)
	surface.DrawLine(x+w-1, y+0, x+w-1, y+10)

	surface.DrawLine(x+w-1, y+h-1, x+w-1, y+h-11)
	surface.DrawLine(x+w-1, y+h-1, x+w-11, y+0+h-1)
end