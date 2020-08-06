surface.CreateFont("Intro", {
    font = "Arial",
    size = ScreenScale(10),
    weight = 1000,
    blursize = 0,
    scanlines = 0,
    extended = true,
    shadow = true
})

local introBool = 1

if introBool == 1 then
	panel = vgui.Create("DPanel")
		panel:SetSize(ScrW(), ScrH())
		panel:SetPos(0,0)
		panel.Paint = function(s,w,h)
			surface.SetDrawColor(Color(0,0,0,255))
			surface.DrawRect(0,0,w,h)

			if IsValid(LocalPlayer()) then
				draw.SimpleText("Нажмите SPACE для продолжения...", "Intro", w/2, h*.8, Color(255,255,255,255), 1, 1)
			else
				draw.SimpleText("Подождите...", "Intro", w/2, h*.8, Color(255, 255, 255, 255 * cin), 1, 1)
			end
		end
		
	hook.Add("PlayerBindPress", "ForContinue", function(ply,bind,pressed)
		if bind == "+jump" then
			panel:Remove()
			hook.Remove("PlayerBindPress","ForContinue")

			return false
		end
	end)
end