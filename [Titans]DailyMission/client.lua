GUIEditor = {
    label = {},
    staticimage = {}
}
local Anmation = {}


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        GUIEditor.staticimage[1] = guiCreateStaticImage(0.36, 0.20, 0.27, 0.64, "Images/dot_white.png", true)
        guiSetProperty(GUIEditor.staticimage[1], "ImageColours", "tl:5D000000 tr:5D000000 bl:5D000000 br:5D000000")
		guiSetVisible(GUIEditor.staticimage[1],false)

        GUIEditor.staticimage[2] = guiCreateStaticImage(0.00, 0.00, 1.00, 0.04, "Images/dot_white.png", true, GUIEditor.staticimage[1])
        guiSetProperty(GUIEditor.staticimage[2], "ImageColours", "tl:FEFFFF00 tr:FEFFFF00 bl:FEFFFF00 br:FEFFFF00")

        GUIEditor.label[1] = guiCreateLabel(0.00, 0.00, 1.00, 1.00, "Daily Missions", true, GUIEditor.staticimage[2])
        guiSetFont(GUIEditor.label[1], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[1], 0, 0, 0)
        guiLabelSetHorizontalAlign(GUIEditor.label[1], "center", false)
        guiLabelSetVerticalAlign(GUIEditor.label[1], "center")

        GUIEditor.staticimage[3] = guiCreateStaticImage(0.05, 0.13, 0.9, 0.03, "Images/dot_white.png", true, GUIEditor.staticimage[1])
        guiSetProperty(GUIEditor.staticimage[3], "ImageColours", "tl:FEFEFEFE tr:FEFEFEFE bl:FEFEFEFE br:FEFEFEFE")

        GUIEditor.staticimage[4] = guiCreateStaticImage(0.00, 0.00, 0.00, 1.00, "Images/dot_white.png", true, GUIEditor.staticimage[3])
        guiSetProperty(GUIEditor.staticimage[4], "ImageColours", "tl:FEFFFF00 tr:FEFFFF00 bl:FEFFFF00 br:FEFFFF00")
        GUIEditor.label[2] = guiCreateLabel(0.00, 0.00, 0.20, 1.00, "Day 1", true, GUIEditor.staticimage[3])
        guiSetFont(GUIEditor.label[2], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[2], 0, 0, 0)
        guiLabelSetHorizontalAlign(GUIEditor.label[2], "center", false)
        guiLabelSetVerticalAlign(GUIEditor.label[2], "center")
        GUIEditor.label[3] = guiCreateLabel(0.20, 0.00, 0.20, 1.00, "Day 2", true, GUIEditor.staticimage[3])
        guiSetFont(GUIEditor.label[3], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[3], 0, 0, 0)
        guiLabelSetHorizontalAlign(GUIEditor.label[3], "center", false)
        guiLabelSetVerticalAlign(GUIEditor.label[3], "center")
        GUIEditor.label[4] = guiCreateLabel(0.40, 0.00, 0.20, 1.00, "Day 3", true, GUIEditor.staticimage[3])
        guiSetFont(GUIEditor.label[4], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[4], 0, 0, 0)
        guiLabelSetHorizontalAlign(GUIEditor.label[4], "center", false)
        guiLabelSetVerticalAlign(GUIEditor.label[4], "center")
        GUIEditor.label[5] = guiCreateLabel(0.60, 0.00, 0.20, 1.00, "Day 4", true, GUIEditor.staticimage[3])
        guiSetFont(GUIEditor.label[5], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[5], 0, 0, 0)
        guiLabelSetHorizontalAlign(GUIEditor.label[5], "center", false)
        guiLabelSetVerticalAlign(GUIEditor.label[5], "center")
        GUIEditor.label[6] = guiCreateLabel(0.80, 0.00, 0.20, 1.00, "Day 5", true, GUIEditor.staticimage[3])
        guiSetFont(GUIEditor.label[6], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[6], 0, 0, 0)
        guiLabelSetHorizontalAlign(GUIEditor.label[6], "center", false)
        guiLabelSetVerticalAlign(GUIEditor.label[6], "center")

        GUIEditor.staticimage[5] = guiCreateStaticImage(0.31, 0.18, 0.38, 0.25, "Images/11.png", true, GUIEditor.staticimage[1])

        GUIEditor.label[7] = guiCreateLabel(0.00, 0.80, 1.00, 0.20, "2 Days VIP", true, GUIEditor.staticimage[5])
        guiSetFont(GUIEditor.label[7], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[7], 255, 255, 0)
        guiLabelSetHorizontalAlign(GUIEditor.label[7], "center", false)
        guiLabelSetVerticalAlign(GUIEditor.label[7], "center")

        GUIEditor.staticimage[6] = guiCreateStaticImage(0.34, 0.44, 0.32, 0.07, "Images/dot_white.png", true, GUIEditor.staticimage[1])
        guiSetProperty(GUIEditor.staticimage[6], "ImageColours", "tl:9E000000 tr:9E000000 bl:9E000000 br:9E000000")

        GUIEditor.staticimage[7] = guiCreateStaticImage(0.00, 0.00, 1.00, 0.15, "Images/dot_white.png", true, GUIEditor.staticimage[6])
        guiSetProperty(GUIEditor.staticimage[7], "ImageColours", "tl:FEFFFF00 tr:FEFFFF00 bl:FEFFFF00 br:FEFFFF00")
        GUIEditor.label[8] = guiCreateLabel(0.00, 0.00, 1.00, 1.00, "Take Reward", true, GUIEditor.staticimage[6])
        guiLabelSetHorizontalAlign(GUIEditor.label[8], "center", false)
        guiLabelSetVerticalAlign(GUIEditor.label[8], "center")

     
		--
		local MissionTable = {}
		for i=1 , 5 do
			local Height = (i*0.08)-0.07
			
			GUIEditor.staticimage[8+i] = guiCreateStaticImage(0.02, 0.55+Height, 0.96, 0.07, "Images/dot_white.png", true, GUIEditor.staticimage[1])
			guiSetProperty(GUIEditor.staticimage[8+i], "ImageColours", "tl:86000000 tr:86000000 bl:86000000 br:86000000")
			
			GUIEditor.label[9+i] = guiCreateLabel(0.00, 0.00, 0.35, 1.00, i, true, GUIEditor.staticimage[8+i])
			guiSetFont(GUIEditor.label[9+i], "default-bold-small")
			guiLabelSetHorizontalAlign(GUIEditor.label[9+i], "center", false)
			guiLabelSetVerticalAlign(GUIEditor.label[9+i], "center")
			
			GUIEditor.staticimage[9+i] = guiCreateStaticImage(0.35, 0.3, 0.4, 0.5, "Images/dot_white.png", true, GUIEditor.staticimage[8+i])
			guiSetProperty(GUIEditor.staticimage[9+i], "ImageColours", "tl:FEFEFEFE tr:FEFEFEFE bl:FEFEFEFE br:FEFEFEFE")
			
			GUIEditor.staticimage[10+i] = guiCreateStaticImage(0,0,0,1, "Images/dot_white.png", true, GUIEditor.staticimage[9+i])
			guiSetProperty(GUIEditor.staticimage[10+i], "ImageColours", "tl:FEFFFF00 tr:FEFFFF00 bl:FEFFFF00 br:FEFFFF00")
			
			GUIEditor.label[10+i] = guiCreateLabel(0.75, 0.00, 0.25, 1.00, "1 Game Coins", true, GUIEditor.staticimage[8+i])
			guiSetFont(GUIEditor.label[10+i], "default-bold-small")
			guiLabelSetHorizontalAlign(GUIEditor.label[10+i], "center", false)
			guiLabelSetVerticalAlign(GUIEditor.label[10+i], "center")    
			
			GUIEditor.label[11+i] = guiCreateLabel(0.00, 0.00, 1.00, 1.00, "0", true, GUIEditor.staticimage[9+i])
			guiSetFont(GUIEditor.label[11+i], "default-bold-small")
			guiLabelSetHorizontalAlign(GUIEditor.label[11+i], "center", false)
			guiLabelSetVerticalAlign(GUIEditor.label[11+i], "center")  
			guiLabelSetColor(GUIEditor.label[11+i], 0, 0, 0)
			
			-- Progges ,Mission Name , Reawd , Percent Text
			table.insert(MissionTable,{GUIEditor.staticimage[10+i],GUIEditor.label[9+i],GUIEditor.label[10+i],GUIEditor.label[11+i]})
		end
		--
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

addEventHandler("onClientGUIClick",root,
function()
	if (source == GUIEditor.label[8]) then
		triggerServerEvent("[Titans]DailyMission",localPlayer,"Reward")
		guiSetEnabled(source,false)
		setTimer(guiSetEnabled,5000,1,source,true )
	end
end)


bindKey("F7","down",
function()
	if getElementData(localPlayer,"Account") then
		ss = not ss
		if ss then
			guiSetVisible(GUIEditor.staticimage[1],true)
			showCursor(true)
			triggerServerEvent("[Titans]DailyMission",localPlayer,"Refresh")
		else
			guiSetVisible(GUIEditor.staticimage[1],false)
			showCursor(false)
		end
	end
end)


addEvent("[Titans]DailyMission",true)
addEventHandler("[Titans]DailyMission",root,
function(Type,Data)
	if Type == "Refresh" then
		local StartTimer = getTickCount()
		for i , v in pairs (Data[1]) do
			guiSetText(MissionTable[i][2],v[1])
			
			local ReqiuredNum = v[2]
			local CurrentNum = Data[2][i]
			--guiSetSize(MissionTable[i][1],CurrentNum/ReqiuredNum,1,true)
			table.insert(Anmation,  {StartTimer,0,1,0   ,CurrentNum/ReqiuredNum,1,0, StartTimer+2500, MissionTable[i][1] ,"Linear",2500,1  } )
			guiSetText(MissionTable[i][4],CurrentNum.."/"..ReqiuredNum)
			local Rewarded = Data[2][i+5]
			if Rewarded then
				guiSetText(MissionTable[i][3],"1 Game Coins")
			else
				guiSetText(MissionTable[i][3],"Rewarded")
			end
		end
		--guiSetSize(GUIEditor.staticimage[4],Data[3]/5,1,true)
		local StartTimer = getTickCount()
		table.insert(Anmation,  {StartTimer,0,1,0   ,Data[3]/5,1,0, StartTimer+2500, GUIEditor.staticimage[4] ,"Linear",2500,1  } )
	end
end)



addEventHandler("onClientRender", root,
function()
	if #Anmation ~= 0 then 
		for i , v in pairs (Anmation) do
			local now = getTickCount()
			local elapsedTime = now - v[1]
			local duration = v[8] - v[1]
			local progress = elapsedTime / duration
			
			local x1, y1, z1 = v[2],v[3],v[4]
			local x2, y2, z2 = v[5],v[6],v[7]
			local x, y, z = interpolateBetween (  x1, y1, z1, x2, y2, z2, progress, v[10])
			if v[12] == 1 then
				guiSetSize(v[9],x,y,true)
			end
			v[11] = v[11] - 1
			if v[11] <= 0 then
				table.remove(Anmation,i)
			end
		end
	end
end)











