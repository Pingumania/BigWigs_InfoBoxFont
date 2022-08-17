local infoboxPlugin = BigWigs:GetPlugin("InfoBox")
local plugin = BigWigs:NewPlugin("InfoBoxFont")
if not infoboxPlugin and plugin then return end

local lib = LibStub("LibSharedMedia-3.0")
local font = lib.DefaultMedia.font
local flag = ""
local size = 14

if PhanxFontDB then
	font = lib:Fetch("font", PhanxFontDB.normal)
end

local function RestyleWindow()
	local display = BigWigsInfoBox
	if not display then return end

	local oldFont = display.title:GetFont()
	if font == oldFont then return end
	-- display.background:SetColorTexture(0, 0, 0, 0)
	display.title:SetFont(font, size + 2, flag)
	for i = 1, 40 do
		display.text[i]:SetFont(font, size, flag)
	end
end

function plugin:OnPluginEnable()
	self:RegisterMessage("BigWigs_ShowInfoBox", RestyleWindow)
	self:RegisterMessage("BigWigs_ProfileUpdate", RestyleWindow)
	self:RegisterMessage("BigWigs_SetInfoBoxTitle", RestyleWindow)
	self:RegisterMessage("BigWigs_SetInfoBoxLine", RestyleWindow)
	RestyleWindow()
end