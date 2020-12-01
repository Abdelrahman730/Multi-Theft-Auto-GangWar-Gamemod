local CameraMarker = createMarker(-2664.54834,376.26883,3,"cylinder",4,255,255,255,150)
local Cameras = {
	{"Camera 1",1689.19,-1180.599,548.79,1688.599,-1268.8,542},
	{"Camera 2",1747.59,-1247.09,539.799,1745.099,-1268.199,533.4},
	{"Camera 3",1747.199,-1288.09,539.59,1745.099,-1268.199,533.4},
	{"Camera 4",1689.19,-1354,548.79,1688.599,-1268.8,542},
	{"Camera 5",1629,-1350.8,539.5,1654,-1339.69,533.4},
	{"Camera 6",1629.699,-1284.5,540,1632.69,-1268.9,533.4},
	{"Camera 7",1629.669,-1247.599,539.79,1632.69,-1268.9,533.4},
	{"Camera 8",1636,-1178.4,536.5,1636,-1193.09,533.4},
	{"Camera 9",1740.4,-1355,536.4,1740.69,-1337.9,533.4},
	{"Camera 10",1688.599,-1268.8,585,1688.599,-1268.8,542},
}

		Camera_Window = guiCreateWindow(0.00, 0.62, 0.16, 0.39, "Clan War Cameras", true)
        guiSetProperty(Camera_Window, "CaptionColour", "FF00D1FD")
		guiSetVisible(Camera_Window,false)

        Cameras_GridList = guiCreateGridList(0.03, 0.08, 0.91, 0.67, true, Camera_Window)
        guiGridListAddColumn(Cameras_GridList, "Cameras", 0.9)
        SetCamera_Button = guiCreateButton(0.07, 0.77, 0.33, 0.17, "Set Camera", true, Camera_Window)
        guiSetProperty(SetCamera_Button, "NormalTextColour", "FF00D1FD")
        Exit_Button = guiCreateButton(0.55, 0.77, 0.33, 0.17, "Exit", true, Camera_Window)
        guiSetFont(Exit_Button, "default-bold-small")
        guiSetProperty(Exit_Button, "NormalTextColour", "FFFE0000")  


for i , v in pairs (Cameras) do
	local Row = guiGridListAddRow(Cameras_GridList)
	guiGridListSetItemText(Cameras_GridList,Row,1,v[1],false,false)
	guiGridListSetItemColor(Cameras_GridList,Row,1,255,255,0)
	guiGridListSetItemData (Cameras_GridList,Row, 1,{v[2],v[3],v[4],v[5],v[6],v[7]})
end		

addEventHandler("onClientMarkerHit",root,
function(player)
	if (source == CameraMarker) then
		if player == localPlayer then
			if not isPedInVehicle(player) then
				guiSetVisible(Camera_Window,true)
				showCursor(true)
				setElementFrozen(player,true)
			end
		end
	end
end)

addEventHandler("onClientGUIClick",guiRoot,
function()
	if (source == SetCamera_Button) then
		if guiGridListGetSelectedItem(Cameras_GridList) ~= -1 then
			local Data = guiGridListGetItemData(Cameras_GridList, guiGridListGetSelectedItem(Cameras_GridList), 1)
			if Data then
				setCameraMatrix(Data[1],Data[2],Data[3],Data[4],Data[5],Data[6])
				setElementDimension(localPlayer,200)
				setElementInterior(localPlayer,3)
				showChat(false)
				setPlayerHudComponentVisible("all",false)
			end
		end
	elseif (source == Exit_Button) then
		guiSetVisible(Camera_Window,false)
		showCursor(false)
		setElementDimension(localPlayer,0)
		setElementInterior(localPlayer,0)
		setCameraTarget(localPlayer)
		showChat(true)
		setPlayerHudComponentVisible("all",true)
		setElementFrozen(localPlayer,false)
	end
end)




---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        StartWar_Window = guiCreateWindow(0.10, 0.04, 0.87, 0.75, ".:[ Clan Wars ]:.", true)
        guiWindowSetMovable(StartWar_Window, false)
        guiWindowSetSizable(StartWar_Window, false)
		guiSetVisible(StartWar_Window,false)

        Group1_GridList = guiCreateGridList(0.02, 0.04, 0.20, 0.78, true, StartWar_Window)
        guiGridListAddColumn(Group1_GridList, "Groups", 0.9)
        Players1_GridList = guiCreateGridList(0.23, 0.04, 0.19, 0.78, true, StartWar_Window)
        guiGridListAddColumn(Players1_GridList, "Players", 0.9)
        BeginWar_Button = guiCreateButton(0.44, 0.83, 0.13, 0.06, "Begin War", true, StartWar_Window)
        guiSetProperty(BeginWar_Button, "NormalTextColour", "FFAAAAAA")
        StartWar_Button = guiCreateButton(0.44, 0.76, 0.13, 0.06, "Start War", true, StartWar_Window)
        guiSetProperty(StartWar_Button, "NormalTextColour", "FFAAAAAA")
        Close_Button = guiCreateButton(0.44, 0.93, 0.13, 0.05, "Close", true, StartWar_Window)
        guiSetProperty(Close_Button, "NormalTextColour", "FFAAAAAA")
        Points_EditBox = guiCreateEdit(0.44, 0.68, 0.13, 0.04, "", true, StartWar_Window)
        Points_Label = guiCreateLabel(0.46, 0.65, 0.08, 0.03, "Points :", true, StartWar_Window)
        guiSetFont(Points_Label, "default-bold-small")
        guiLabelSetHorizontalAlign(Points_Label, "center", false)
        Money_Edit = guiCreateEdit(0.44, 0.60, 0.13, 0.04, "", true, StartWar_Window)
        Money_Label = guiCreateLabel(0.46, 0.57, 0.08, 0.03, "Money :", true, StartWar_Window)
        guiSetFont(Money_Label, "default-bold-small")
        guiLabelSetHorizontalAlign(Money_Label, "center", false)
        Players2_GridList = guiCreateGridList(0.58, 0.04, 0.19, 0.78, true, StartWar_Window)
        guiGridListAddColumn(Players2_GridList, "Players", 0.9)
        Group2_GridList = guiCreateGridList(0.78, 0.04, 0.20, 0.78, true, StartWar_Window)
        guiGridListAddColumn(Group2_GridList, "Groups", 0.9)
        Number2_Label = guiCreateLabel(0.04, 0.90, 0.08, 0.03, "Number :", true, StartWar_Window)
        guiSetFont(Number2_Label, "default-bold-small")
        guiLabelSetHorizontalAlign(Number2_Label, "center", false)
        Number2_Label = guiCreateLabel(0.61, 0.90, 0.08, 0.03, "Number :", true, StartWar_Window)
        guiSetFont(Number2_Label, "default-bold-small")
        guiLabelSetHorizontalAlign(Number2_Label, "center", false)
		Group1Number_Edit = guiCreateEdit(0.16, 0.90, 0.13, 0.03, "7", true, StartWar_Window)    
        Group2Number_Edit = guiCreateEdit(0.74, 0.90, 0.13, 0.03, "7", true, StartWar_Window)

if getCameraTarget () ~= localPlayer then
setCameraTarget(localPlayer)
end
local screenW, screenH = guiGetScreenSize()

local theGroup1 = ""

local theGroup2 = ""

function dx1()
for i,v in ipairs(getElementsByType("player")) do
refreshGL1(v)
refreshGL2(v)
end
dxDrawText(theGroup1, screenW * 0.4902, screenH * 0.2409, screenW * 0.5801, screenH * 0.2969, tocolor(255, 0, 0, 255), 1.00, "bankgothic", "center", "center", false, false, true, false, false)
dxDrawText("VS", screenW * 0.4902, screenH * 0.3099, screenW * 0.5801, screenH * 0.3659, tocolor(255, 255, 255, 255), 1.00, "bankgothic", "center", "center", false, false, true, false, false)
dxDrawText(theGroup2, screenW * 0.4902, screenH * 0.3789, screenW * 0.5801, screenH * 0.4349, tocolor(0, 0, 255, 255), 1.00, "bankgothic", "center", "center", false, false, true, false, false)
end





---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


        CW_Windows = guiCreateWindow(0.15, 0.14, 0.70, 0.65, "Clans War", true)
        guiWindowSetMovable(CW_Windows, false)
        guiWindowSetSizable(CW_Windows, false)
		guiSetVisible(CW_Windows,false)

        G1Players_GridList = guiCreateGridList(0.07, 0.13, 0.29, 0.68, true, CW_Windows)
        guiGridListAddColumn(G1Players_GridList, "Players", 0.9)
        G2Players_GridList = guiCreateGridList(0.66, 0.13, 0.29, 0.68, true, CW_Windows)
        guiGridListAddColumn(G2Players_GridList, "Players", 0.9)
        EndWar_Button = guiCreateButton(0.41, 0.89, 0.19, 0.09, "End War", true, CW_Windows)
        guiSetProperty(EndWar_Button, "NormalTextColour", "FFAAAAAA")
        Close2_Button = guiCreateButton(0.87, 0.92, 0.12, 0.06, "Close", true, CW_Windows)
        guiSetProperty(Close2_Button, "NormalTextColour", "FFAAAAAA")
        Slap_Button = guiCreateButton(0.37, 0.75, 0.28, 0.06, "Slap", true, CW_Windows)
        guiSetProperty(Slap_Button, "NormalTextColour", "FFAAAAAA")
        Spectat_Button = guiCreateButton(0.37, 0.65, 0.28, 0.06, "Spectat", true, CW_Windows)
        guiSetProperty(Spectat_Button, "NormalTextColour", "FFAAAAAA")   

		
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


        Spectat_Window = guiCreateWindow(0.73, 0.26, 0.26, 0.47, "Spectat", true)
        guiWindowSetSizable(Spectat_Window, false)
		guiSetVisible(Spectat_Window,false)

        Spectat_GridList = guiCreateGridList(0.04, 0.08, 0.90, 0.65, true, Spectat_Window)
        guiGridListAddColumn(Spectat_GridList, "Players", 0.9)
        Spectat_Slap_Button = guiCreateButton(0.25, 0.75, 0.49, 0.11, "Slap", true, Spectat_Window)
        Spectat_Back_Button = guiCreateButton(0.33, 0.88, 0.34, 0.09, "Back", true, Spectat_Window)    
    


countdown_Label = guiCreateLabel(0.31, 0.15, 0.37, 0.31, "", true)
guiSetVisible(countdown_Label,false)
guiSetFont(countdown_Label, "sa-gothic")
guiLabelSetColor(countdown_Label, 0, 255, 0)
guiLabelSetHorizontalAlign(countdown_Label, "center", false)
guiLabelSetVerticalAlign(countdown_Label, "center")   

function countdown(Time)
	if tonumber(Time) then
		guiSetVisible(countdown_Label,true)
		guiSetText(countdown_Label, Time)
		setTimer (function()
		Time = Time - 1
			if Time > 0 then
				guiSetText(countdown_Label, Time)
			elseif Time == 0 then
				guiSetText(countdown_Label, "Go")
				triggerServerEvent("openDoors", root)
			else
				guiSetVisible(countdown_Label,false)
			end
		end,1000,Time+1)
	end
end
addEvent("CountDown", true)
addEventHandler("CountDown",root, countdown)
	
	

function dx2()
dxDrawText(theGroup1 or "", screenW * 0.2275, screenH * 0.1745, screenW * 0.3711, screenH * 0.2396, tocolor(255, 0, 0, 255), 1.00, "bankgothic", "center", "center", false, false, true, false, false)
dxDrawText("VS", screenW * 0.4277, screenH * 0.1745, screenW * 0.5713, screenH * 0.2396, tocolor(255, 255, 255, 255), 1.00, "bankgothic", "center", "center", false, false, true, false, false)
dxDrawText(theGroup2 or "", screenW * 0.6338, screenH * 0.1745, screenW * 0.7773, screenH * 0.2396, tocolor(0, 0, 255, 255), 1.00, "bankgothic", "center", "center", false, false, true, false, false)
end



addEvent("GetGroups", true)
addEventHandler("GetGroups",root,
function(groups)
guiGridListClear(Group1_GridList)
guiGridListClear(Group2_GridList)
for i,group in ipairs(groups) do
local row1 = guiGridListAddRow(Group1_GridList)
local row2 = guiGridListAddRow(Group2_GridList)
guiGridListSetItemText(Group1_GridList, row1, 1, group.group_name, false, false)
guiGridListSetItemText(Group2_GridList, row2, 1, group.group_name, false, false)
end
end)

addEvent("GetPlayers", true)
addEventHandler("GetPlayers",root,
function(M1,M2)
guiGridListClear(G1Players_GridList)
guiGridListClear(G2Players_GridList)
for i,players in ipairs(M1) do
local row = guiGridListAddRow(G1Players_GridList)
guiGridListSetItemText(G1Players_GridList, row, 1, getPlayerName(players), false, false)
end
for i,players in ipairs(M2) do
local row = guiGridListAddRow(G2Players_GridList)
guiGridListSetItemText(G2Players_GridList, row, 1, getPlayerName(players), false, false)
end
end)


function showSW()
	if guiGetVisible(StartWar_Window) then
		guiSetVisible(StartWar_Window, false)
		showCursor(false)
		removeEventHandler("onClientRender", root,dx1)
	else
		guiSetVisible(StartWar_Window, true)
		showCursor(true)
		addEventHandler("onClientRender", root,dx1)
		triggerServerEvent("GettheGroups", localPlayer)
		local CWar = getElementData(root,"ClansWar")
		if CWar then
			guiSetEnabled(StartWar_Button,true)
			guiSetEnabled(BeginWar_Button,false)
		else
			guiSetEnabled(StartWar_Button,false)
			guiSetEnabled(BeginWar_Button,true)
		end
	end
end
addEvent("showSW", true)
addEventHandler("showSW",root,showSW)





function showCW()
	if guiGetVisible(CW_Windows) then
		guiSetVisible(CW_Windows, false)
		showCursor(false)
		removeEventHandler("onClientRender", root,dx2)
	else
		guiSetVisible(CW_Windows, true)
		showCursor(true)
		addEventHandler("onClientRender", root,dx2)
		triggerServerEvent("GetthePlayers", localPlayer)
	end
end
addEvent("showCW", true)
addEventHandler("showCW",root,showCW)


function hideSW()
guiSetVisible(StartWar_Window, false)
showCursor(false)
removeEventHandler("onClientRender", root,dx1)
end
addEvent("hideSW", true)
addEventHandler("hideSW",root,hideSW)

function hideCW()
guiSetVisible(CW_Windows, false)
showCursor(false)
removeEventHandler("onClientRender", root,dx2)
end
addEvent("hideCW", true)
addEventHandler("hideCW",root,hideCW)

addEvent("GetMembersOnline1", true)
addEventHandler("GetMembersOnline1",root,
function(members)
guiGridListClear(Players1_GridList)
for i,member in ipairs(members) do
local playerStat = getElementData(member,"WJoin") or false
if playerStat then
	r = 0
	g= 255
	b= 0
else
	r = 255
	g= 0
	b= 0
end
local row = guiGridListAddRow(Players1_GridList)
guiGridListSetItemText(Players1_GridList, row, 1, getPlayerName(member), false, false)
guiGridListSetItemColor ( Players1_GridList, row, 1, r, g, b)
end
end)


addEvent("GetMembersOnline2", true)
addEventHandler("GetMembersOnline2",root,
function(members)
guiGridListClear(Players2_GridList)
for i,member in ipairs(members) do
local row = guiGridListAddRow(Players2_GridList)
guiGridListSetItemText(Players2_GridList, row, 1, getPlayerName(member), false, false)
local playerStat = getElementData(member,"WJoin") or false
if playerStat then
	r = 0
	g= 255
	b= 0
else
	r = 255
	g= 0
	b= 0
end
guiGridListSetItemColor ( Players2_GridList, row, 1, r, g, b)
end
end)






function refreshGL2(player)
local Srow = guiGridListGetSelectedItem( Players2_GridList )
	if getElementData(player,"WJoin") then
		guiGridListSetItemColor ( Players2_GridList, Srow, 1, 0, 255, 0)
	else
		guiGridListSetItemColor ( Players2_GridList, Srow, 1, 255, 0, 0)
	end
end

function refreshGL1(player)
local Srow = guiGridListGetSelectedItem( Players1_GridList )
	if getElementData(player,"WJoin") then
		guiGridListSetItemColor ( Players1_GridList, Srow, 1, 0, 255, 0)
	else
		guiGridListSetItemColor ( Players1_GridList, Srow, 1, 255, 0, 0)
	end
end

function SpectatGridList()
local SpectatPlayers = {}
	for i,v in ipairs(getElementsByType("player")) do
	local WJoin = getElementData(v,"WJoin")
		if WJoin and WJoin[1] == true then
			table.insert(SpectatPlayers,v)
		end
	end
guiGridListClear(Spectat_GridList)
	for i,player in ipairs(SpectatPlayers) do
	local row = guiGridListAddRow(Spectat_GridList)
	guiGridListSetItemText(Spectat_GridList, row, 1, getPlayerName(player), false, false)
	end
end

addEventHandler( "onClientGUIDoubleClick", root,
function()
if source == Group1_GridList then
	if guiGridListGetSelectedItem( Group1_GridList ) ~= -1 then
		local Srow = guiGridListGetSelectedItem( Group1_GridList )
		local GroupName = guiGridListGetItemText( Group1_GridList, Srow, 1)
		theGroup1 = GroupName
		triggerServerEvent("GettheMembersOnline1",localPlayer,GroupName)
	else
		theGroup1 = ""
	end
elseif source == Group2_GridList then
	if guiGridListGetSelectedItem( Group2_GridList ) ~= -1 then
		local Srow = guiGridListGetSelectedItem( Group2_GridList )
		local GroupName = guiGridListGetItemText( Group2_GridList, Srow, 1)
		theGroup2 = GroupName
		triggerServerEvent("GettheMembersOnline2",localPlayer,GroupName)
	else
		theGroup2 = ""
	end
elseif source == Players1_GridList then
	if guiGridListGetSelectedItem( Players1_GridList ) ~= -1 then
		local Srow = guiGridListGetSelectedItem( Players1_GridList )
		local PlayerName = guiGridListGetItemText( Players1_GridList, Srow, 1)
		triggerServerEvent("WJoinData",getPlayerFromName(PlayerName), 1)
		refreshGL1(getPlayerFromName(PlayerName))
	end
elseif source == Players2_GridList then
	if guiGridListGetSelectedItem( Players2_GridList ) ~= -1 then
		local Srow = guiGridListGetSelectedItem( Players2_GridList )
		local PlayerName = guiGridListGetItemText( Players2_GridList, Srow, 1)
		triggerServerEvent("WJoinData",getPlayerFromName(PlayerName), 2)
		refreshGL2(getPlayerFromName(PlayerName))
	end
end
end)

function ShowCur()
showCursor(not isCursorShowing ())
end

addEventHandler( "onClientGUIClick", root,
function()
	local clanwar = getElementData(root,"ClansWar")
	if source == Close_Button then
		hideSW()
	elseif source == Close2_Button then
		hideCW()
	elseif source == BeginWar_Button then
		if theGroup1 ~= "" and theGroup2 ~= "" then
			triggerServerEvent("BeginWar",localPlayer, theGroup1, theGroup2, tonumber(guiGetText(Money_Edit)), (guiGetText(Group1Number_Edit) or 0), (guiGetText(Group2Number_Edit) or 0), tonumber(guiGetText(Points_EditBox)))
			guiSetEnabled(StartWar_Button,true)
			guiSetEnabled(BeginWar_Button,false)
		end
	elseif source == StartWar_Button then
		triggerServerEvent("StartWar",localPlayer)
		if clanwar then
			hideSW()
		end
	elseif source == EndWar_Button then
		triggerServerEvent("EndWar",localPlayer)
		hideCW()
	elseif source == G1Players_GridList then
		guiGridListSetSelectedItem(G2Players_GridList,0,0)
	elseif source == G2Players_GridList then
		guiGridListSetSelectedItem(G1Players_GridList,0,0)
	elseif source == Slap_Button then
		if guiGridListGetSelectedItem( G1Players_GridList ) ~= -1 then
			local Srow = guiGridListGetSelectedItem( G1Players_GridList )
			local PlayerName = guiGridListGetItemText( G1Players_GridList, Srow, 1)
			triggerServerEvent("SlapPlayer",localPlayer, PlayerName)
		elseif guiGridListGetSelectedItem( G2Players_GridList ) ~= -1 then
			local Srow = guiGridListGetSelectedItem( G2Players_GridList )
			local PlayerName = guiGridListGetItemText( G2Players_GridList, Srow, 1)
			triggerServerEvent("SlapPlayer",localPlayer, PlayerName)
		end
	elseif source == Spectat_Button then
		if guiGridListGetSelectedItem( G1Players_GridList ) ~= -1 then
			local Srow = guiGridListGetSelectedItem( G1Players_GridList )
			local PlayerName = guiGridListGetItemText( G1Players_GridList, Srow, 1)
			setCameraTarget(getPlayerFromName(PlayerName))
		elseif guiGridListGetSelectedItem( G2Players_GridList ) ~= -1 then
			local Srow = guiGridListGetSelectedItem( G2Players_GridList )
			local PlayerName = guiGridListGetItemText( G2Players_GridList, Srow, 1)
			setCameraTarget(getPlayerFromName(PlayerName))
		end
		guiSetVisible(Spectat_Window,true)
		hideCW()
		SpectatGridList()
		bindKey("mouse2","up",ShowCur)
	elseif source == Spectat_Back_Button then
		setCameraTarget(localPlayer)
		guiSetVisible(Spectat_Window,false)
		showCursor(false)
		unbindKey("mouse2","up",ShowCur)
	elseif source == Spectat_Slap_Button then
		local Srow = guiGridListGetSelectedItem(Spectat_GridList)
		local PlayerName = guiGridListGetItemText(Spectat_GridList, Srow, 1)
		triggerServerEvent("SlapPlayer",localPlayer, PlayerName)
		setTimer(SpectatGridList,500,1)
	end
end)

addEventHandler( "onClientGUIChanged", root,
function()
local Text = guiGetText(source)
local Text = tonumber(Text)
if source == Money_Edit then
	if not Text then
		guiSetText(source,"0")
	end
elseif source == Points_EditBox then
	if not Text then
		guiSetText(source,"0")
	end
elseif source == Group1Number_Edit then
	if not Text then
		guiSetText(source,"0")
	end
elseif source == Group2Number_Edit then
	if not Text then
		guiSetText(source,"0")
	end
end
end)


--[[
addEventHandler("onClientRender", root,
function()
	if getElementData(localPlayer, "InCW") then
		if getElementData(localPlayer, "InCW") == true then
			if getElementDimension(localPlayer) ~= 200 and getElementInterior(localPlayer) ~= 3 then
				setElementData(localPlayer,"InCW",false)
			end
			if getTeamFromName("[War-Clans]"..theGroup1) and getTeamFromName("[War-Clans]"..theGroup2) then
				pN = countPlayersInTeam ( getTeamFromName("[War-Clans]"..theGroup1) )
				cN = countPlayersInTeam ( getTeamFromName("[War-Clans]"..theGroup2) )
			else
				pN = 0
				cN = 0
			end
			dxDrawLine((screenW * 0.8500) - 1, (screenH * 0.9444) - 1, (screenW * 0.8500) - 1, screenH * 0.9852, tocolor(0, 0, 0, 255), 1, false)
			dxDrawLine(screenW * 0.9974, (screenH * 0.9444) - 1, (screenW * 0.8500) - 1, (screenH * 0.9444) - 1, tocolor(0, 0, 0, 255), 1, false)
			dxDrawLine((screenW * 0.8500) - 1, screenH * 0.9852, screenW * 0.9974, screenH * 0.9852, tocolor(0, 0, 0, 255), 1, false)
			dxDrawLine(screenW * 0.9974, screenH * 0.9852, screenW * 0.9974, (screenH * 0.9444) - 1, tocolor(0, 0, 0, 255), 1, false)
			dxDrawRectangle(screenW * 0.8500, screenH * 0.9444, screenW * 0.1474, screenH * 0.0407, tocolor(254, 254, 254, 0), false)
			dxDrawText(pN.." vs "..cN, (screenW * 0.8484) - 1, (screenH * 0.9417) - 1, (screenW * 0.9974) - 1, (screenH * 0.9852) - 1, tocolor(0, 0, 0, 255), 1.50, "default-bold", "center", "center", false, false, false, true, false)
			dxDrawText(pN.." vs "..cN, (screenW * 0.8484) + 1, (screenH * 0.9417) - 1, (screenW * 0.9974) + 1, (screenH * 0.9852) - 1, tocolor(0, 0, 0, 255), 1.50, "default-bold", "center", "center", false, false, false, true, false)
			dxDrawText(pN.." vs "..cN, (screenW * 0.8484) - 1, (screenH * 0.9417) + 1, (screenW * 0.9974) - 1, (screenH * 0.9852) + 1, tocolor(0, 0, 0, 255), 1.50, "default-bold", "center", "center", false, false, false, true, false)
			dxDrawText(pN.." vs "..cN, (screenW * 0.8484) + 1, (screenH * 0.9417) + 1, (screenW * 0.9974) + 1, (screenH * 0.9852) + 1, tocolor(0, 0, 0, 255), 1.50, "default-bold", "center", "center", false, false, false, true, false)
			dxDrawText("#000000"..pN.." #FFFFFFvs #909090"..cN, screenW * 0.8484, screenH * 0.9417, screenW * 0.9974, screenH * 0.9852, tocolor(200, 200, 255, 255), 1.50, "default-bold", "center", "center", false, false, false, true, false)
		end
	end
end
)

              ]]
			  
			  


local screenW, screenH = guiGetScreenSize()

addEventHandler("onClientRender", root,
function()
	if getElementData(localPlayer, "InCW") then
		local data = getElementData(root,"ClansWar")
		if getElementDimension(localPlayer) ~= 200 and getElementInterior(localPlayer) ~= 3 then
				setElementData(localPlayer,"InCW",false)
		end
		if data[4] and data[5] then
			pN = countPlayersInTeam ( data[4] )
			cN = countPlayersInTeam ( data[5] )
		else
			pN = 0
			cN = 0
		end
		
        dxDrawLine((screenW * 0.7754) - 1, (screenH * 0.8737) - 1, (screenW * 0.7754) - 1, screenH * 0.9779, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(screenW * 0.9707, (screenH * 0.8737) - 1, (screenW * 0.7754) - 1, (screenH * 0.8737) - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine((screenW * 0.7754) - 1, screenH * 0.9779, screenW * 0.9707, screenH * 0.9779, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(screenW * 0.9707, screenH * 0.9779, screenW * 0.9707, (screenH * 0.8737) - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawRectangle(screenW * 0.7754, screenH * 0.8737, screenW * 0.1953, screenH * 0.1042, tocolor(77, 77, 77, 150), false)
        dxDrawText(data[2].." : "..pN, (screenW * 0.7852) + 1, (screenH * 0.8737) + 1, (screenW * 0.9707) + 1, (screenH * 0.9258) + 1, tocolor(0, 0, 0, 255), 1.50, "default-bold", "left", "center", false, false, false, false, false)
        dxDrawText(data[2].." : "..pN, screenW * 0.7852, screenH * 0.8737, screenW * 0.9707, screenH * 0.9258, tocolor(255, 0, 0, 255), 1.50, "default-bold", "left", "center", false, false, false, false, false)
        dxDrawText(data[3].." : "..cN, (screenW * 0.7852) + 1, (screenH * 0.9258) + 1, (screenW * 0.9707) + 1, (screenH * 0.9779) + 1, tocolor(0, 0, 0, 255), 1.50, "default-bold", "left", "center", false, false, false, false, false)
        dxDrawText(data[3].." : "..cN, screenW * 0.7852, screenH * 0.9258, screenW * 0.9707, screenH * 0.9779, tocolor(255, 0, 0, 255), 1.50, "default-bold", "left", "center", false, false, false, false, false)
        dxDrawLine(screenW * 0.7754, screenH * 0.9258, screenW * 0.9707, screenH * 0.9258, tocolor(0, 0, 0, 255), 1, false)
	end
end
)

