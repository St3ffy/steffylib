surface.CreateFont("slib_font_15", {
		font = "Arial",
		size = 15,
		weight = 550
	})

local PANEL = {}

function PANEL:Init()
	self:SetDraggable(false)
	self:ShowCloseButton(false)
	self:SetTitle("")

	self.name = ""
	self.namesize = 18
	self.namex = self:GetWide()/2
	self.nameclr = Color(255,255,255)
end

function PANEL:Center()
	local x = ScrW()/2-(self:GetWide()/2)
	local y = ScrH()/2-(self:GetTall()/2)

	self:SetPos(x,y)
end

function PANEL:Paint()
	self.alpha = Lerp(0.1,5,1)

	steffyLib.BlurMenu(self,6,11,255*self.alpha)
	steffyLib.Rect(0,0,self:GetWide(),31,Color(0,0,0,150))
	steffyLib.Rect(0,self:GetTall()-3,self:GetWide(),3,Color(230,41,45,255))
	steffyLib.Rect(0,0,self:GetWide(),self:GetTall(),Color(0,0,0,100))

	steffyLib.Text(self.name or "", self.namesize,self.namex,5,self.nameclr,1)
end

vgui.Register("slib_dframe", PANEL, "DFrame")

local PANEL = {}

function PANEL:DockToFrame()
	self:SetPos(0,0)
	self:SetSize(self:GetParent():GetWide()-10,self:GetParent():GetTall()-(y+5))
end

function PANEL:Paint()
	self.alpha = Lerp(0.1,5,1)

	steffyLib.BlurMenu(self,6,11,255*self.alpha)
	steffyLib.Rect(0,0,self:GetWide(),31,Color(0,0,0,150))
	steffyLib.Rect(0,self:GetTall()-3,self:GetWide(),3,Color(230,41,45,255))
	steffyLib.Rect(0,0,self:GetWide(),self:GetTall(),Color(0,0,0,100))
end

vgui.Register("slib_panel", PANEL, "Panel")

local PANEL = {}

function PANEL:Init()
	self:SetText("")
	self:SetPos(self:GetParent():GetWide()-50, 0)
	self:SetSize(50,30)

	self.text = "X"
	self.textS = 15
	self.clickable = true
	self.color = Color(150,25,25,80)

	self.DoClick = function()
		if (IsValid(self:GetParent())) then
			self:GetParent():Remove()
		end
	end
end

function PANEL:Paint(w,h)
	local clr = self.color
	local text = self.text
	local size = self.textS

	if self.clickable then
		steffyLib.Rect(0,0,w,h,clr)
	else
		steffyLib.Rect(0,0,w,h,Color(150,25,25,25))
	end

	steffyLib.Text(text, size, w/2, h/2, Color(255,255,255,255), 1, 1)
end

vgui.Register("slib_dclose", PANEL, "DButton")