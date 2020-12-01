local ControlsTable = {
	[1] = {"Freez/UnFreez Vehicles",false},
	[2] = {"Nitro/UnNitro Vehicles",false},
	[3] = {"DamageAble/UnDamageAble Vehicles",false},
	[4] = {"Freez/UnFreez Players",false},
	[5] = {"GhostMode/UnGhostMode Players",false},
	[6] = {"DamageAble/UnDamageAble Players",false},
	[7] = {"Enable/Disable Weapons",false},
}


GUIEditor = {
    label = {},
    edit = {},
    button = {},
    window = {},
    gridlist = {},
    combobox = {}
}
---------------------------------------------------------------------------------------------------------------------------------------------------------
        GUIEditor.window[1] = guiCreateWindow(0.28, 0.20, 0.44, 0.63, "لوحة المسـابقـات", true)
        guiWindowSetSizable(GUIEditor.window[1], false)
		guiSetVisible(GUIEditor.window[1],false)

        GUIEditor.gridlist[1] = guiCreateGridList(0.01, 0.05, 0.22, 0.92, true, GUIEditor.window[1])
        guiGridListAddColumn(GUIEditor.gridlist[1], "players", 0.9)
		guiGridListSetSortingEnabled(GUIEditor.gridlist[1],false)
        GUIEditor.combobox[1] = guiCreateComboBox(0.76, 0.03, 0.23, 0.25, "", true, GUIEditor.window[1])
        GUIEditor.gridlist[2] = guiCreateGridList(0.71, 0.29, 0.29, 0.69, true, GUIEditor.window[1])
        guiGridListAddColumn(GUIEditor.gridlist[2], "Controls", 1)
		guiGridListSetSortingEnabled(GUIEditor.gridlist[2],false)
        GUIEditor.button[1] = guiCreateButton(0.26, 0.06, 0.20, 0.07, "احدثيات الدخول", true, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FFFEEA00")
        GUIEditor.label[1] = guiCreateLabel(0.26, 0.16, 0.32, 0.03, "X:  | Y: | Z:", true, GUIEditor.window[1])
        GUIEditor.label[2] = guiCreateLabel(0.26, 0.19, 0.32, 0.03, "Dimensions: ", true, GUIEditor.window[1])
        GUIEditor.label[3] = guiCreateLabel(0.26, 0.24, 0.32, 0.03, "Interiors: ", true, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(0.26, 0.88, 0.16, 0.08, "بدأ المسابقة", true, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[2], "NormalTextColour", "FF00FD8F")
        GUIEditor.button[3] = guiCreateButton(0.54, 0.88, 0.16, 0.08, "قـفـل الد خول", true, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[3], "NormalTextColour", "FFFBE100")
        GUIEditor.button[4] = guiCreateButton(0.40, 0.79, 0.16, 0.08, " الغأء المسابقة", true, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[4], "NormalTextColour", "FFFC0000")
        GUIEditor.edit[1] = guiCreateEdit(0.26, 0.29, 0.16, 0.04, "", true, GUIEditor.window[1])
        GUIEditor.button[5] = guiCreateButton(0.44, 0.29, 0.16, 0.04, "اعطاء فلوس للاعب", true, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[5], "NormalTextColour", "FFFC0000")    
---------------------------------------------------------------------------------------------------------------------------------------------------------

-- Teams
guiComboBoxAddItem(GUIEditor.combobox[1],"All")
for i , v in pairs (getElementsByType("team") ) do
	local TeamName = getTeamName(v)
	guiComboBoxAddItem(GUIEditor.combobox[1],TeamName)
end
guiComboBoxSetSelected(GUIEditor.combobox[1],0)

-- Controls
for i=1 , #ControlsTable do
	local Row = guiGridListAddRow(GUIEditor.gridlist[2])
	guiGridListSetItemText(GUIEditor.gridlist[2],Row,1,ControlsTable[i][1],false,false)
	guiGridListSetItemColor(GUIEditor.gridlist[2],Row,1,255,0,0)
end






addEvent("[Titans]Competions",true)
addEventHandler("[Titans]Competions",root,
function(Type,Data)
	if Type == "Panel" then
		guiSetVisible(GUIEditor.window[1],not(guiGetVisible(GUIEditor.window[1]) )  )
		showCursor((guiGetVisible(GUIEditor.window[1]) ))
	elseif Type == "Refresh" then
		-- Position
		local x,y,z,Dim,Int = unpack(Data["Position"] )
		guiSetText(GUIEditor.label[1],"X:"..math.ceil(x).." | Y:"..math.ceil(y).." | Z:"..math.ceil(z))
		guiSetText(GUIEditor.label[2],"Dimensions: "..Dim)
		guiSetText(GUIEditor.label[3],"Interiors: "..Int)
		-- players 
		guiGridListClear(GUIEditor.gridlist[1])
		local Players = Data["Players"]
		for i , v in pairs (Players) do
			local Row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],Row,1,getPlayerName(v),false,false)
			guiGridListSetItemData(GUIEditor.gridlist[1],Row,1,v)
		end
		-- Controls
		if #Data["Control"] > 0 then
			local ControlsZ = Data["Control"]
			ControlsTable = Data["Control"]
			for i , v in pairs (ControlsZ) do
				if v[2] == false then
					guiGridListSetItemColor(GUIEditor.gridlist[2],i-1,1,255,0,0)
				else
					guiGridListSetItemColor(GUIEditor.gridlist[2],i-1,1,0,255,0)
				end
			end
		end
		--
	end
end)



addEventHandler("onClientGUIClick",root,
function()
	if (source == GUIEditor.button[1]) then
		local x,y,z = getElementPosition(localPlayer)
		local Dim = getElementDimension(localPlayer)
		local Int = getElementInterior(localPlayer)
		triggerServerEvent("[Titans]Competions",localPlayer,"RefreshPosition",{x,y,z,Dim,Int})
	elseif (source == GUIEditor.button[2]) then
		local TeamName = guiComboBoxGetItemText(GUIEditor.combobox[1], guiComboBoxGetSelected(GUIEditor.combobox[1])  )
		if TeamName then
			triggerServerEvent("[Titans]Competions",localPlayer,"StartEvent",TeamName)
		end
	elseif (source == GUIEditor.gridlist[2]) then
		local Selected = guiGridListGetSelectedItem(source)
		if Selected ~= -1 then
			DataType = ControlsTable[Selected+1][2]
			ControlsTable[Selected+1][2] = not(DataType)
		end
		triggerServerEvent("[Titans]Competions",localPlayer,"RefreshControls",ControlsTable)
	elseif (source == GUIEditor.button[3]) then
		triggerServerEvent("[Titans]Competions",localPlayer,"CloseEvent")
	elseif (source == GUIEditor.button[4]) then
		triggerServerEvent("[Titans]Competions",localPlayer,"CancelEevent")
	elseif (source == GUIEditor.button[5]) then
		local Selected = guiGridListGetSelectedItem(GUIEditor.gridlist[1])
		if Selected ~= -1 then
			local Money = guiGetText(GUIEditor.edit[1])
			if tonumber(Money) then
				if tonumber(Money) <= 100000 then
					local players = guiGridListGetItemData(GUIEditor.gridlist[1],Selected,1)
					triggerServerEvent("[Titans]Competions",localPlayer,"GiveMoney",{tonumber(Money),players})
				end
			end
		end
	end
end)


addEventHandler("onClientPlayerWeaponSwitch",root,
function(newSlot)
	local Data = getElementData(source,"inEvent")
	if Data then
		if Data[2] then
			setPedWeaponSlot(source,0)
		end
	end
end)


addEventHandler("onClientPlayerDamage",root,
function(newSlot)
	local Data = getElementData(source,"inEvent")
	if Data then
		if Data[1] then
			cancelEvent()
		end
	end
end)




