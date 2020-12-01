local SpawnPosition = {
	{234,2781,91.027191162109},
	{228,2659,91.027191162109},
	{312,2594,91.012191772461},
	{422,2607,90.9921875},
	{425,2722,90.9921875},
	{331,2716,91.007186889648},
	{353,2810,100.22478485107},
	{320,2730,91.012191772461},
	{444,2710,95.262191772461},
	{354,2806,101.3205947876},
	{354,2806,101.3205947876},
}


GUIEditor = {
    staticimage = {},
    label = {},
}

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
		GUIEditor.staticimage[1] = guiCreateStaticImage(0.34, 0.34, 0.28, 0.41, "Images/dot_white.png", true)
		guiSetProperty(GUIEditor.staticimage[1], "ImageColours", "tl:36000000 tr:36000000 bl:36000000 br:36000000")
		guiSetVisible(GUIEditor.staticimage[1],false)

		GUIEditor.staticimage[2] = guiCreateStaticImage(0.00, 0.00, 1.00, 0.05, "Images/dot_white.png", true, GUIEditor.staticimage[1])
		guiSetProperty(GUIEditor.staticimage[2], "ImageColours", "tl:FFF8FB00 tr:FFF8FB00 bl:FFF8FB00 br:FFF8FB00")
		

		GUIEditor.staticimage[3] = guiCreateStaticImage(0.03, 0.06, 0.93, 0.48, "Images/BackGround.png", true, GUIEditor.staticimage[1])
		
        GUIEditor.label[1] = guiCreateLabel(0.03, 0.56, 0.93, 0.18, "DeathMatch\n\nSpawn in diffrent posotion bring up your stratgy and make it count ,\n The more you kill the more your gifted so make it count as always", true, GUIEditor.staticimage[1])
        guiSetFont(GUIEditor.label[1], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[1], 254, 251, 0)
        guiLabelSetHorizontalAlign(GUIEditor.label[1], "center", false)
        guiLabelSetVerticalAlign(GUIEditor.label[1], "center")
        --GUIEditor.button[2] = guiCreateButton(0.03, 0.77, 0.93, 0.18, "", true, GUIEditor.staticimage[1])
		
		
		GUIEditor.staticimage[4] = guiCreateStaticImage(0.03, 0.77, 0.93, 0.18, "Images/dot_white.png", true, GUIEditor.staticimage[1])
		guiSetProperty(GUIEditor.staticimage[4], "ImageColours", "tl:57000000 tr:57000000 bl:57000000 br:57000000")
		
		GUIEditor.staticimage[5] = guiCreateStaticImage(0.00, 0.00, 1.00, 0.16, "Images/dot_white.png", true, GUIEditor.staticimage[4])
		guiSetProperty(GUIEditor.staticimage[5], "ImageColours", "tl:FFF8FB00 tr:FFF8FB00 bl:FFF8FB00 br:FFF8FB00")
		GUIEditor.label[2] = guiCreateLabel(0, 0, 1, 1, "Enter DeathMatch"  , true, GUIEditor.staticimage[4])
		guiLabelSetHorizontalAlign(GUIEditor.label[2],"center")
		guiLabelSetVerticalAlign(GUIEditor.label[2],"center")
		 guiSetFont(GUIEditor.label[2], "default-bold-small")
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

function setDeathMatchVisible(Type)
	guiSetVisible(GUIEditor.staticimage[1],Type)
end

addEventHandler("onClientGUIClick",root,
function()
	if source == GUIEditor.label[2] then
		--
		if  getElementData(localPlayer, "LegalStatus") == "Jailed" then exports["guimessages"]:outputClient("#FF00FF[DeathMatch] #ff0000You can't enter Police team while your jailed") return end
		if (getElementData(localPlayer, "WantLvl") or 0) > 0 then exports["guimessages"]:outputClient ("#FF00FF[DeathMatch] #ff0000You can't enter Police team while your wanted level is higer than 0") return end
		setElementData(localPlayer,"DeathMatchSpawn",SpawnPosition)
		local Skin = (getElementData(localPlayer,"Teams/Skins") or 0 )
		triggerServerEvent("GameMod",localPlayer,"SetTeamAndSkin",{Skin,"PVP"} )
		exports["[Titans]GameMod"]:HideMainWindow()
		setDeathMatchVisible(false)
	end
end)