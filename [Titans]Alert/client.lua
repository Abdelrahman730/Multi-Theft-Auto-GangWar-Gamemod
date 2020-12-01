local screenW, screenH = guiGetScreenSize()
local Text = {}
local WaitingList = {}
local Anmation = nil


addEvent("[Titans]Alert",true)
addEventHandler("[Titans]Alert",root,
function(v1,v2)
	addAlert(v1,v2)
end)


function addAlert (Message,Alert)
	if Message then
		if table.getn(Text) == 0 then
			table.insert (Text,{Message,Alert})
			Anmation = nil
			Anmation = {}
			Anmation.startPos = {0.3854, 0.2500, 0}
			Anmation.startTime = getTickCount()
			Anmation.endPos = {0, 1, 0}
			Anmation.endTime = Anmation.startTime + 1000
			RemoveMessage()
		else
			table.insert (WaitingList,{Message,Alert})
		end
	end
end

function RefreshMessages ()
	local Index = table.getn(WaitingList)
	if Index >= 1 then
		local M = WaitingList[1][1]
		local A = WaitingList[1][2]
		table.remove (WaitingList,1)
		table.insert (Text,{M,A})
		RemoveMessage()
		Anmation = nil
		Anmation = {}
		Anmation.startPos = {0.3854, 0.2500, 0}
		Anmation.startTime = getTickCount()
		Anmation.endPos = {0, 1, 0}
		Anmation.endTime = Anmation.startTime + 1000
	end
end

function RemoveMessage ()
	setTimer (function ()
		table.remove(Text,1)
		RefreshMessages ()
	end,5*1000,1)
end

addEventHandler("onClientRender", root,
function()
	if table.getn(Text) ~= 0 then
		for i , v in ipairs (Text) do
			local now = getTickCount()
			local elapsedTime = now - Anmation.startTime
			local duration = Anmation.endTime - Anmation.startTime
			local progress = elapsedTime / duration
			
			local x1, y1, z1 = unpack(Anmation.startPos)
			local x2, y2, z2 = unpack(Anmation.endPos)
			local x, y, z = interpolateBetween ( 
				x1, y1, z1,
				x2, y2, z2, 
				progress, "InOutBack")
			
			dxDrawRectangle(screenW * x, screenH * 0.5000, screenW * y, screenH * 0.1852, tocolor(0,0,0, 130), true)
			dxDrawText(v[1], screenW * x, screenH * 0.4981, screenW *  y , screenH * 0.5676, tocolor(255, 255, 255, 255), screenW/640, "default-bold", "center", "center", false, false, true, true, false)
			dxDrawText(v[2], screenW * x, screenH * 0.5676, screenW *  y , screenH * 0.6852, tocolor(255, 255, 255, 255), screenW/screenW, "default-bold", "center", "top", false, false, true, false, false)
		end
	end
end)