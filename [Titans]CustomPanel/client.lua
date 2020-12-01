local Accounts = {
	["anoose112233"] = true,
	["bebo1king"] = true,
}


GUIEditor = {
    gridlist = {},
    window = {},
    button = {},
    edit = {}
}
------------------------------------------------------------------------------------------------------------------------------------------------------
        GUIEditor.window[1] = guiCreateWindow(0.33, 0.29, 0.31, 0.35, "Bots Panel", true)
        guiWindowSetSizable(GUIEditor.window[1], false)
        guiSetProperty(GUIEditor.window[1], "CaptionColour", "FFFF0000")
		guiSetVisible(GUIEditor.window[1],false)

        GUIEditor.gridlist[1] = guiCreateGridList(0.02, 0.06, 0.30, 0.92, true, GUIEditor.window[1])
        guiGridListAddColumn(GUIEditor.gridlist[1], "Bots", 0.9)
        GUIEditor.edit[1] = guiCreateEdit(0.31, 0.08, 0.66, 0.07, "", true, GUIEditor.window[1])
        guiEditSetMaxLength(GUIEditor.edit[1], 100)
        GUIEditor.button[1] = guiCreateButton(0.32, 0.17, 0.66, 0.07, "Say", true, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(0.33, 0.35, 0.25, 0.09, "Spectate", true, GUIEditor.window[1])
        GUIEditor.button[3] = guiCreateButton(0.71, 0.35, 0.25, 0.09, "Un Spectate", true, GUIEditor.window[1])
        GUIEditor.button[4] = guiCreateButton(0.33, 0.50, 0.25, 0.10, "Warp Into Vehicle", true, GUIEditor.window[1])
        GUIEditor.button[5] = guiCreateButton(0.33, 0.83, 0.65, 0.09, "Close", true, GUIEditor.window[1])    
------------------------------------------------------------------------------------------------------------------------------------------------------

bindKey("=","down",
function()
	local AccountName = getElementData(localPlayer,"Account")
	if AccountName then
		if Accounts[AccountName] then
			guiSetVisible(GUIEditor.window[1],not(guiGetVisible(GUIEditor.window[1])  )  ) 
			showCursor(guiGetVisible(GUIEditor.window[1])  )
			toggleControl("chatbox",not(guiGetVisible(GUIEditor.window[1])))
			if guiGetVisible(GUIEditor.window[1]) then
				triggerServerEvent("[Titans]CustomPanel",localPlayer,"Refresh")
			end
		end
	end
end)

addEventHandler("onClientGUIClick",root,
function()
	if (source == GUIEditor.button[1]) then
		local Text = guiGetText(GUIEditor.edit[1])
		local Selected = guiGridListGetSelectedItem(GUIEditor.gridlist[1])
		if Selected ~= -1 then
			local PlayerName = guiGridListGetItemText(GUIEditor.gridlist[1],Selected,1)
			local player = getPlayerFromName(PlayerName)
			if player then
				triggerServerEvent("[Titans]CustomPanel",localPlayer,"Say",{player,Text})
			end
		end
	elseif (source == GUIEditor.button[2]) then
		local Selected = guiGridListGetSelectedItem(GUIEditor.gridlist[1])
		if Selected ~= -1 then
			local PlayerName = guiGridListGetItemText(GUIEditor.gridlist[1],Selected,1)
			local player = getPlayerFromName(PlayerName)
			if player then
				setCameraTarget(player)
			end
		end
	elseif (source == GUIEditor.button[3]) then
		setCameraTarget(localPlayer)
	elseif (source == GUIEditor.button[4]) then
		local Selected = guiGridListGetSelectedItem(GUIEditor.gridlist[1])
		if Selected ~= -1 then
			local PlayerName = guiGridListGetItemText(GUIEditor.gridlist[1],Selected,1)
			local player = getPlayerFromName(PlayerName)
			if player then
				triggerServerEvent("[Titans]CustomPanel",localPlayer,"WarpVehicle",player)
			end
		end
	end
end)

addEvent("[Titans]CustomPanel",true)
addEventHandler("[Titans]CustomPanel",root,
function(Type,Data)
	if Type == "Refresh" then
		guiGridListClear(GUIEditor.gridlist[1])
		for i , v in pairs (Data) do
			local Name = getPlayerName(v)
			local Row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],Row,1,Name,false,false)
		end
	end
end)









