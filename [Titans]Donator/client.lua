local screenW, screenH = guiGetScreenSize()
local ItemsList = {}
local Labels = {}
local Textures = {
	{"Normal"},
	{"Gold"},
	{"Police"},
	{"Black_Millitary"},
	{"Green_Millitary"},
	{"Metal"},
	{"Sand"},


}

local Objects = {
	Blocker = {
		{"Block 1",1423,"CJ_ROAD_SIGN1",35000},
		{"Block 2",1424,"cj_S_POLE",25000},
		{"Block 3",1427,"CJ_orangebarrier2",5000},
		{"Stinger",2892,"banding3_64HV",15000},
	}	
}


-- Name , Model , Bone , x,y,z ,rx,ry,rz
local Hatas = {
	{"Hat 1",961,1,0,0.03,0.2,0,-90,0},
	{"Hat 2",960,3,0,-0.1,0,0,0,0},
	{"Hat 3",952,11,0,0,0,0,-90,0},
	{"Hat 4",933,1,0,0,0.1,0,0,0},
	{"Hat 5",932,1,0,0,0,0,-90,0},
	{"Hat 6",928,1,0,0,0,05,0,90},
	{"Hat 7",926,1,0,0,0.05,0,0,90},
	{"Hat 8",924,3,0,0.05,0,0,-90,0},
	{"Hat 9",921,1,0,0,0.15,0,-90,0},
	{"Hat 10",917,1,0,-0.05,0.12,0,0,0},
	{"Hat 11",916,1,0,0.03,0.065,90,0,180},
}


local Skins = {
	{"Skin 1",63},
	{"Skin 2",64},
	{"Skin 3",75},
	{"Skin 4",85},
}

function convertNumber ( number )  
	local formatted = number  
	while true do      
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')    
		if ( k==0 ) then      
			break   
		end  
	end  
	return formatted
end

function secondsToTimeDesc( seconds )
	if seconds then
		local results = {}
		local sec = ( seconds %60 )
		local min = math.floor ( ( seconds % 3600 ) /60 )
		local hou = math.floor ( ( seconds % 86400 ) /3600 )
		local day = math.floor ( seconds /86400 )
		
		if day > 0 then table.insert( results, day .. ( day == 1 and " day" or " days" ) ) end
		if hou > 0 then table.insert( results, hou .. ( hou == 1 and " hour" or " hours" ) ) end
		if min > 0 then table.insert( results, min .. ( min == 1 and " minute" or " minutes" ) ) end
		if sec > 0 then table.insert( results, sec .. ( sec == 1 and " second" or " seconds" ) ) end
		
		return string.reverse ( table.concat ( results, ", " ):reverse():gsub(" ,", " dna ", 1 ) )
	end
	return ""
end



GUIEditor = {
    label = {},
    edit = {},
    button = {},
    window = {},
    gridlist = {},
    memo = {},
	combobox = {}
}

addEventHandler("onClientResourceStart", resourceRoot,
    function()
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        GUIEditor.window[1] = guiCreateWindow(0.25, 0.26, 0.50, 0.58, "Place Objects", true)
        guiWindowSetSizable(GUIEditor.window[1], false)
        guiSetProperty(GUIEditor.window[1], "CaptionColour", "FF0060B2")
		guiSetVisible(GUIEditor.window[1],false)

        GUIEditor.gridlist[1] = guiCreateGridList(0.01, 0.04, 0.23, 0.70, true, GUIEditor.window[1])
        guiGridListAddColumn(GUIEditor.gridlist[1], "Name", 0.5)
        guiGridListAddColumn(GUIEditor.gridlist[1], "Price", 0.4)
        GUIEditor.gridlist[2] = guiCreateGridList(0.25, 0.04, 0.23, 0.70, true, GUIEditor.window[1])
        guiGridListAddColumn(GUIEditor.gridlist[2], "Textures", 0.9)
        GUIEditor.button[1] = guiCreateButton(0.87, 0.58, 0.11, 0.07, "Buy", true, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FF0CB100")
        GUIEditor.button[2] = guiCreateButton(0.87, 0.68, 0.11, 0.07, "Close", true, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[2], "NormalTextColour", "FFB00000")
        GUIEditor.memo[1] = guiCreateMemo(0.01, 0.76, 0.98, 0.22, "Any object you gone buy will be deleted after 10 mins\nif you but object in troll place you will be banned from the window and may take other punisnments\n\n1- Choose the object which you gone put\n2- Choose Object Texture\n3- Make sure you have Enought Money\n4- The Required Level for the object is 50\n5- Place the object where it should be", true, GUIEditor.window[1])
        guiMemoSetReadOnly(GUIEditor.memo[1], true)
        GUIEditor.button[3] = guiCreateButton(0.73, 0.68, 0.11, 0.07, "Delete", true, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[3], "NormalTextColour", "FF0CB100")
        GUIEditor.gridlist[3] = guiCreateGridList(0.49, 0.04, 0.23, 0.70, true, GUIEditor.window[1])
        guiGridListAddColumn(GUIEditor.gridlist[3], "Object", 0.5)
        guiGridListAddColumn(GUIEditor.gridlist[3], "Texture", 0.4)
        GUIEditor.button[4] = guiCreateButton(0.73, 0.58, 0.11, 0.07, "Edit Object", true, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[4], "NormalTextColour", "FF0CB100")
        GUIEditor.edit[1] = guiCreateEdit(0.78, 0.08, 0.20, 0.05, "0", true, GUIEditor.window[1])
        GUIEditor.label[1] = guiCreateLabel(0.73, 0.08, 0.04, 0.05, "X", true, GUIEditor.window[1])
        guiLabelSetColor(GUIEditor.label[1], 0, 186, 254)
        guiLabelSetHorizontalAlign(GUIEditor.label[1], "center", false)
        guiLabelSetVerticalAlign(GUIEditor.label[1], "center")
        GUIEditor.edit[2] = guiCreateEdit(0.78, 0.14, 0.20, 0.05, "0", true, GUIEditor.window[1])
        GUIEditor.label[2] = guiCreateLabel(0.73, 0.14, 0.04, 0.05, "Y", true, GUIEditor.window[1])
        guiLabelSetColor(GUIEditor.label[2], 0, 186, 254)
        guiLabelSetHorizontalAlign(GUIEditor.label[2], "center", false)
        guiLabelSetVerticalAlign(GUIEditor.label[2], "center")
        GUIEditor.edit[3] = guiCreateEdit(0.78, 0.21, 0.20, 0.05, "0", true, GUIEditor.window[1])
        GUIEditor.label[3] = guiCreateLabel(0.73, 0.21, 0.04, 0.05, "Z", true, GUIEditor.window[1])
        guiLabelSetColor(GUIEditor.label[3], 0, 186, 254)
        guiLabelSetHorizontalAlign(GUIEditor.label[3], "center", false)
        guiLabelSetVerticalAlign(GUIEditor.label[3], "center")
        GUIEditor.edit[4] = guiCreateEdit(0.78, 0.27, 0.20, 0.05, "0", true, GUIEditor.window[1])
        GUIEditor.label[4] = guiCreateLabel(0.73, 0.27, 0.04, 0.05, "R", true, GUIEditor.window[1])
        guiLabelSetColor(GUIEditor.label[4], 179, 253, 0)
        guiLabelSetHorizontalAlign(GUIEditor.label[4], "center", false)
        guiLabelSetVerticalAlign(GUIEditor.label[4], "center")
        GUIEditor.button[5] = guiCreateButton(0.75, 0.34, 0.23, 0.05, "Put My Coordination", true, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[5], "NormalTextColour", "FFFC5300")    
		
		for i , v in pairs (Textures) do
			local Row =  guiGridListAddRow(GUIEditor.gridlist[2])
			guiGridListSetItemText ( GUIEditor.gridlist[2], Row, 1, v[1], false, false )
		end

		for i , v in pairs (Objects.Blocker) do
			local Row =  guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText ( GUIEditor.gridlist[1], Row, 1, v[1], false, false )
			guiGridListSetItemText ( GUIEditor.gridlist[1], Row, 2, convertNumber (v[4]), false, false )
			guiGridListSetItemData ( GUIEditor.gridlist[1], Row, 1, {v[2],v[3],v[4]})
		end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        GUIEditor.window[2] = guiCreateWindow(0.28, 0.27, 0.36, 0.56, "Donator Panel", true)
        guiWindowSetSizable(GUIEditor.window[1], false)
        guiSetProperty(GUIEditor.window[1], "CaptionColour", "FF00FFB9")
		guiSetVisible(GUIEditor.window[2],false)

        GUIEditor.edit[5] = guiCreateEdit(0.01, 0.05, 0.25, 0.04, "", true, GUIEditor.window[2])
        GUIEditor.gridlist[4] = guiCreateGridList(0.01, 0.10, 0.25, 0.89, true, GUIEditor.window[2])
        guiGridListAddColumn(GUIEditor.gridlist[4], "Accounts", 0.5)
        guiGridListAddColumn(GUIEditor.gridlist[4], "DL", 0.5)
        GUIEditor.edit[6] = guiCreateEdit(0.71, 0.29, 0.27, 0.03, "", true, GUIEditor.window[2])
        GUIEditor.combobox[1] = guiCreateComboBox(0.69, 0.04, 0.29, 0.24, "VIP", true, GUIEditor.window[2])
        guiSetFont(GUIEditor.combobox[1], "default-bold-small")
        guiSetProperty(GUIEditor.combobox[1], "NormalEditTextColour", "FFA30000")
        guiComboBoxAddItem(GUIEditor.combobox[1], "VIP")
        guiComboBoxAddItem(GUIEditor.combobox[1], "Donator Level 1")
        guiComboBoxAddItem(GUIEditor.combobox[1], "Donator Level 2")
        guiComboBoxAddItem(GUIEditor.combobox[1], "Donator Level 3")
        GUIEditor.combobox[2] = guiCreateComboBox(0.37, 0.04, 0.29, 0.24, "", true, GUIEditor.window[2])
        guiSetFont(GUIEditor.combobox[2], "default-bold-small")
        guiSetProperty(GUIEditor.combobox[2], "NormalEditTextColour", "FFA30000")
        GUIEditor.label[5] = guiCreateLabel(0.28, 0.14, 0.41, 0.04, "Account Name : ", true, GUIEditor.window[2])
        guiSetFont(GUIEditor.label[5], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[5], 0, 255, 185)
        GUIEditor.label[6] = guiCreateLabel(0.28, 0.20, 0.41, 0.04, "Donator Ends in : ", true, GUIEditor.window[2])
        guiSetFont(GUIEditor.label[6], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[6], 0, 255, 185)
        GUIEditor.label[7] = guiCreateLabel(0.28, 0.27, 0.41, 0.04, "Rank : ", true, GUIEditor.window[2])
        guiSetFont(GUIEditor.label[7], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[7], 0, 255, 185)
        GUIEditor.label[8] = guiCreateLabel(0.28, 0.33, 0.41, 0.04, "Date Gived in : ", true, GUIEditor.window[2])
        guiSetFont(GUIEditor.label[8], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[8], 0, 255, 185)
        GUIEditor.label[9] = guiCreateLabel(0.28, 0.39, 0.41, 0.04, "Give account Name : ", true, GUIEditor.window[2])
        guiSetFont(GUIEditor.label[9], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[9], 0, 255, 185)
       -- GUIEditor.label[10] = guiCreateLabel(0.28, 0.45, 0.41, 0.04, "Donator Level : ", true, GUIEditor.window[2])
        --guiSetFont(GUIEditor.label[10], "default-bold-small")
      --  guiLabelSetColor(GUIEditor.label[10], 0, 255, 185)
        GUIEditor.button[6] = guiCreateButton(0.71, 0.36, 0.27, 0.04, "Give DL", true, GUIEditor.window[2])
        guiSetProperty(GUIEditor.button[6], "NormalTextColour", "FF00A217")
        GUIEditor.button[7] = guiCreateButton(0.71, 0.42, 0.27, 0.04, "Remove DL", true, GUIEditor.window[2])
        guiSetProperty(GUIEditor.button[7], "NormalTextColour", "FFA10000")
    --    GUIEditor.button[8] = guiCreateButton(0.71, 0.48, 0.27, 0.04, "Reset Date", true, GUIEditor.window[2])
      --  guiSetProperty(GUIEditor.button[8], "NormalTextColour", "FF0071A0")
        GUIEditor.button[9] = guiCreateButton(0.72, 0.93, 0.27, 0.04, "Close", true, GUIEditor.window[2])
        guiSetProperty(GUIEditor.button[9], "NormalTextColour", "FF8B009F")   

		for i=1 , 200 do
			if i == 1 then
				guiComboBoxAddItem(GUIEditor.combobox[2],i.." Day")
			else
				guiComboBoxAddItem(GUIEditor.combobox[2],i.." Days")
			end
		end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


        GUIEditor.window[3] = guiCreateWindow(0.77, 0.32, 0.21, 0.46, "VIP Skins", true)
        guiWindowSetSizable(GUIEditor.window[3], false)
        guiSetProperty(GUIEditor.window[3], "CaptionColour", "FFFF0000")
		guiSetVisible(GUIEditor.window[3],false)

        GUIEditor.gridlist[5] = guiCreateGridList(0.04, 0.07, 0.53, 0.91, true, GUIEditor.window[3])
        guiGridListAddColumn(GUIEditor.gridlist[5], "Name", 0.7)
		guiGridListAddColumn(GUIEditor.gridlist[5], "ID", 0.2)
        GUIEditor.button[10] = guiCreateButton(0.60, 0.75, 0.34, 0.08, "Set", true, GUIEditor.window[3])
        guiSetProperty(GUIEditor.button[10], "NormalTextColour", "FE208A00")
        GUIEditor.button[11] = guiCreateButton(0.60, 0.86, 0.34, 0.08, "Close", true, GUIEditor.window[3])
        guiSetProperty(GUIEditor.button[11], "NormalTextColour", "FE8B0000")
        GUIEditor.label[10] = guiCreateLabel(0.59, 0.08, 0.35, 0.65, "VIP Skins\n\nThis future is only\nallowed to VIP users\nin order to set skin \nChoose one of the\nSkins in gridlist\nand then press Set", true, GUIEditor.window[3])
        guiSetFont(GUIEditor.label[10], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[10], 126, 137, 0)
        guiLabelSetHorizontalAlign(GUIEditor.label[10], "center", false)
        guiLabelSetVerticalAlign(GUIEditor.label[10], "center")  
		
		for i , v in pairs (Skins) do
			local Row = guiGridListAddRow(GUIEditor.gridlist[5])
			guiGridListSetItemText(GUIEditor.gridlist[5],Row,1,v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[5],Row,2,v[2],false,false)
		end
		
		
		GUIEditor.window[4] = guiCreateWindow(0.77, 0.32, 0.21, 0.46, "VIP Hats", true)
        guiWindowSetSizable(GUIEditor.window[4], false)
        guiSetProperty(GUIEditor.window[4], "CaptionColour", "FFFF0000")
		guiSetVisible(GUIEditor.window[4],false)

        GUIEditor.gridlist[6] = guiCreateGridList(0.04, 0.07, 0.53, 0.91, true, GUIEditor.window[4])
        guiGridListAddColumn(GUIEditor.gridlist[6], "Name", 0.9)
        GUIEditor.button[12] = guiCreateButton(0.60, 0.75, 0.34, 0.08, "Set", true, GUIEditor.window[4])
        guiSetProperty(GUIEditor.button[12], "NormalTextColour", "FE208A00")
        GUIEditor.button[13] = guiCreateButton(0.60, 0.86, 0.34, 0.08, "Close", true, GUIEditor.window[4])
        guiSetProperty(GUIEditor.button[13], "NormalTextColour", "FE8B0000")
        GUIEditor.label[11] = guiCreateLabel(0.59, 0.08, 0.35, 0.53, "VIP Skins\n\nThis future is only\nallowed to VIP users\nin order to set Hats\nChoose one of the\nHats in gridlist\nand then press Set", true, GUIEditor.window[4])
        guiSetFont(GUIEditor.label[11], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[11], 126, 137, 0)
        guiLabelSetHorizontalAlign(GUIEditor.label[11], "center", false)
        guiLabelSetVerticalAlign(GUIEditor.label[11], "center")    
		GUIEditor.button[14] = guiCreateButton(0.60, 0.64, 0.34, 0.08, "Remove", true, GUIEditor.window[4])
        guiSetProperty(GUIEditor.button[14], "NormalTextColour", "FE005388")    
		
		
		for i , v in pairs (Hatas) do
			local Row = guiGridListAddRow(GUIEditor.gridlist[6])
			guiGridListSetItemText(GUIEditor.gridlist[6],Row,1,v[1],false,false)
			guiGridListSetItemData(GUIEditor.gridlist[6],Row,1,{v[2],v[3],v[4],v[5],v[6],v[7],v[8],v[9]},false,false)
		end
    end
)


VIP = {
    button = {},
}
addEventHandler("onClientResourceStart", resourceRoot,
    function()
        VIP.button[1] = guiCreateButton(0.55, 0.28, 0.10, 0.02, "Set Bounty", true)
        guiSetProperty(VIP.button[1], "NormalTextColour", "FEFFF231")


        VIP.button[2] = guiCreateButton(0.55, 0.32, 0.05, 0.02, "Health", true)
        guiSetProperty(VIP.button[2], "NormalTextColour", "FE8D8D8D")


        VIP.button[3] = guiCreateButton(0.60, 0.32, 0.05, 0.02, "Armor", true)
        guiSetProperty(VIP.button[3], "NormalTextColour", "FE8D8D8D")


        VIP.button[4] = guiCreateButton(0.55, 0.35, 0.05, 0.02, "Skins", true)
        guiSetProperty(VIP.button[4], "NormalTextColour", "FE8D8D8D")


        VIP.button[5] = guiCreateButton(0.60, 0.35, 0.05, 0.02, "Style", true)
        guiSetProperty(VIP.button[5], "NormalTextColour", "FE8D8D8D")


        VIP.button[6] = guiCreateButton(0.55, 0.38, 0.05, 0.02, "Spawn", true)
        guiSetProperty(VIP.button[6], "NormalTextColour", "FE8D8D8D")


        VIP.button[7] = guiCreateButton(0.60, 0.38, 0.05, 0.02, "Soon", true)
        guiSetProperty(VIP.button[7], "NormalTextColour", "FE8D8D8D")


        VIP.button[8] = guiCreateButton(0.55, 0.42, 0.10, 0.02, "Maverick", true)
        guiSetProperty(VIP.button[8], "NormalTextColour", "FE8D8D8D")


        VIP.button[9] = guiCreateButton(0.55, 0.46, 0.05, 0.02, "Hats", true)
        guiSetProperty(VIP.button[9], "NormalTextColour", "FE8D8D8D")


        VIP.button[10] = guiCreateButton(0.60, 0.46, 0.05, 0.02, "Soon", true)
        guiSetProperty(VIP.button[10], "NormalTextColour", "FE8D8D8D")


        VIP.button[11] = guiCreateButton(0.55, 0.49, 0.05, 0.02, "Launcher ", true)
        guiSetProperty(VIP.button[11], "NormalTextColour", "FE8D8D8D")


        VIP.button[12] = guiCreateButton(0.60, 0.49, 0.05, 0.02, "Hide Tag", true)
        guiSetProperty(VIP.button[12], "NormalTextColour", "FE8D8D8D")


        VIP.button[13] = guiCreateButton(0.55, 0.52, 0.05, 0.02, "Soon", true)
        guiSetProperty(VIP.button[13], "NormalTextColour", "FE8D8D8D")


        VIP.button[14] = guiCreateButton(0.60, 0.52, 0.05, 0.02, "Fix", true)
        guiSetProperty(VIP.button[14], "NormalTextColour", "FE8D8D8D")


        VIP.button[15] = guiCreateButton(0.55, 0.56, 0.10, 0.02, "Car", true)
        guiSetProperty(VIP.button[15], "NormalTextColour", "FE8D8D8D")


        VIP.button[16] = guiCreateButton(0.34, 0.59, 0.04, 0.02, "Close", true)
        guiSetProperty(VIP.button[16], "NormalTextColour", "FEFF3030")

		for i=1,16 do
			guiSetVisible(VIP.button[i],false)
		end
    end
)




ActiveVip = "not Active"

function VipDx ()
	local Name = (getPlayerName(localPlayer) or "" )
        dxDrawRectangle(screenW * 0.3419, screenH * 0.2331, screenW * 0.3170, screenH * 0.3841, tocolor(0, 0, 0, 208), false)
        dxDrawRectangle(screenW * 0.3419, screenH * 0.2331, screenW * 0.3170, screenH * 0.0234, tocolor(255, 242, 49, 254), false)
        dxDrawText("• VIP Panel", screenW * 0.3455, screenH * 0.2331, screenW * 0.3946, screenH * 0.2539, tocolor(0, 0, 0, 255), screenW/screenW, "default", "left", "top", false, false, false, false, false)
        dxDrawLine((screenW * 0.3455) - 1, (screenH * 0.2695) - 1, (screenW * 0.3455) - 1, screenH * 0.3841, tocolor(61, 61, 61, 101), 1, false)
        dxDrawLine(screenW * 0.5432, (screenH * 0.2695) - 1, (screenW * 0.3455) - 1, (screenH * 0.2695) - 1, tocolor(61, 61, 61, 101), 1, false)
        dxDrawLine((screenW * 0.3455) - 1, screenH * 0.3841, screenW * 0.5432, screenH * 0.3841, tocolor(61, 61, 61, 101), 1, false)
        dxDrawLine(screenW * 0.5432, screenH * 0.3841, screenW * 0.5432, (screenH * 0.2695) - 1, tocolor(61, 61, 61, 101), 1, false)
        dxDrawRectangle(screenW * 0.3455, screenH * 0.2695, screenW * 0.1977, screenH * 0.1146, tocolor(0, 0, 0, 169), false)
        dxDrawText("Name :", screenW * 0.3492, screenH * 0.2826, screenW * 0.4327, screenH * 0.2982, tocolor(255, 255, 255, 254), screenW/screenW, "default", "left", "top", false, false, false, false, false)
        dxDrawText(Name, screenW * 0.3492, screenH * 0.3047, screenW * 0.4327, screenH * 0.3203, tocolor(73, 255, 48, 254), screenW/screenW, "default", "left", "top", false, false, false, false, false)
        dxDrawText("Subscribe Status :", screenW * 0.3492, screenH * 0.3333, screenW * 0.4327, screenH * 0.3490, tocolor(255, 255, 255, 254), screenW/screenW, "default", "left", "top", false, false, false, false, false)
		if ActiveVip == "not Active" then
			rs,gs,bs = 255,48,48
		else
			rs,gs,bs = 48,255,48
		end
		dxDrawText(ActiveVip, screenW * 0.3492, screenH * 0.3555, screenW * 0.4327, screenH * 0.3711, tocolor(rs,gs,bs, 254), screenW/screenW, "default", "left", "top", false, false, false, false, false)
end




--[[bindKey("9","down",
function()
	Whatever = not Whatever
	if Whatever then
		showCursor(true)
		for i=1,16 do
			guiSetVisible(VIP.button[i],true)
		end
		addEventHandler("onClientRender", root,VipDx)
	else
		showCursor(false)
		for i=1,16 do
			guiSetVisible(VIP.button[i],false)
		end
		removeEventHandler("onClientRender", root,VipDx)
	end
end)]]






------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


addEvent("DonatorPanel",true)
addEventHandler("DonatorPanel",root,
function(Type,Timelft)
	if Type == 1 then
		guiSetVisible(GUIEditor.window[2],true)
		showCursor(true)
	elseif Type == 2 then
		guiSetVisible(GUIEditor.window[1],true)
		showCursor(true)
	elseif Type == 3 then
		guiSetVisible(GUIEditor.window[3],true)
		showCursor(true)
	elseif Type == 4 then
		guiSetVisible(GUIEditor.window[4],true)
		showCursor(true)
	elseif Type == 5 then
		if not( guiGetVisible(VIP.button[1])) then
			if getElementDimension(localPlayer) == 0 and getElementInterior(localPlayer) == 0 then
				showCursor(true)
				for i=1,16 do
					guiSetVisible(VIP.button[i],true)
				end
				addEventHandler("onClientRender", root,VipDx)
				if type(Timelft) == "string" then
					ActiveVip = "Active ( "..Timelft.." )"
				else
					ActiveVip = "Active ( "..secondsToTimeDesc(Timelft).." )"
				end
			else
				exports["guimessages"]:outputClient("#F3FF00[VIP] #ff0000 you can't open vip panel here")
			end
		else
			showCursor(false)
			for i=1,16 do
				guiSetVisible(VIP.button[i],false)
			end
			removeEventHandler("onClientRender", root,VipDx)
		end
	elseif Type == 6 then
		if not( guiGetVisible(VIP.button[1])) then
			showCursor(true)
			for i=1,16 do
				guiSetVisible(VIP.button[i],true)
				if i <= 15 then
					guiSetEnabled(VIP.button[i],false)
				end
			end
			addEventHandler("onClientRender", root,VipDx)
			ActiveVip = "not Active"
		else
			showCursor(false)
			for i=1,16 do
				guiSetVisible(VIP.button[i],false)
			end
			removeEventHandler("onClientRender", root,VipDx)
		end
	end
end)


bindKey("J","down",
function()
	triggerServerEvent("Donator",localPlayer,"JetPack")
end)

local ButtonsTime = {}

addEventHandler("onClientGUIClick",guiRoot,
function()
	--[[if (source == GUIEditor.gridlist[2]) or (source == GUIEditor.gridlist[1]) then
		if guiGridListGetSelectedItem(GUIEditor.gridlist[1]) ~= -1 and guiGridListGetSelectedItem(GUIEditor.gridlist[2]) ~= -1 then
			if ViewObject and getElementType(ViewObject) == "object" then
				destroyElement(ViewObject)
			end
			local Data = guiGridListGetItemData ( GUIEditor.gridlist[1],  guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1 )
			
			local x,y,z = getElementPosition(localPlayer)
			ViewObject = createObject(Data[1],x,y+5,z)
			local TextureName = guiGridListGetItemText ( GUIEditor.gridlist[2], guiGridListGetSelectedItem ( GUIEditor.gridlist[2] ), 1 )
			if TextureName ~= "Normal" then
				dxSetShaderValue(Shader, "MarkerSkin", dxCreateTexture("Textures/"..TextureName..".jpg"))
				engineApplyShaderToWorldTexture(Shader, Data[2],ViewObject)
				setElementAlpha(ViewObject,100)
			end
		else
			if ViewObject and getElementType(ViewObject) == "object" then
				destroyElement(ViewObject)
			end
		end]]
	if (source == GUIEditor.button[5] ) then
		local x,y,z = getElementPosition(localPlayer)
		local rx,ry,rz = getElementRotation(localPlayer)
		guiSetText(GUIEditor.edit[1],tostring(x))
		guiSetText(GUIEditor.edit[2],tostring(y))
		guiSetText(GUIEditor.edit[3],tostring(z))
		guiSetText(GUIEditor.edit[4],tostring(rz))
	elseif (source == GUIEditor.button[2]) then
		guiSetVisible(GUIEditor.window[1],false)
		if guiGetVisible(VIP.button[2]) == false then
			showCursor(false)
		end
	elseif (source == GUIEditor.button[1]) then
		if guiGridListGetSelectedItem(GUIEditor.gridlist[1]) ~= -1 and guiGridListGetSelectedItem(GUIEditor.gridlist[2]) ~= -1 then
			local Data = guiGridListGetItemData ( GUIEditor.gridlist[1],  guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1 )
			local TextureName = guiGridListGetItemText ( GUIEditor.gridlist[2], guiGridListGetSelectedItem ( GUIEditor.gridlist[2] ), 1 )
			local ObjectName = guiGridListGetItemText ( GUIEditor.gridlist[1], guiGridListGetSelectedItem ( GUIEditor.gridlist[1] ), 1 )
			local X = guiGetText(GUIEditor.edit[1])
			local Y = guiGetText(GUIEditor.edit[2])
			local Z = guiGetText(GUIEditor.edit[3])
			local R = guiGetText(GUIEditor.edit[4])
			if tonumber(X) ~= nil and tonumber(Y) ~= nil and  tonumber(Z) ~= nil and  tonumber(R)  ~= nil then
				triggerServerEvent("Donator",localPlayer,"BuyObject",Data[1],Data[2],Data[3],{tonumber(X),tonumber(Y),tonumber(Z),tonumber(R)},TextureName,ObjectName )
			end
		end
	elseif (source == GUIEditor.button[3]) then
		if guiGridListGetSelectedItem(GUIEditor.gridlist[3]) ~= -1 then
			local Data = guiGridListGetItemData ( GUIEditor.gridlist[3],  guiGridListGetSelectedItem(GUIEditor.gridlist[3]), 1 )
			if Data then
				triggerServerEvent("Donator",localPlayer,"DeleteObject",Data[2],Data[4])
			end
		end
	elseif (source == GUIEditor.button[4]) then
		if guiGridListGetSelectedItem(GUIEditor.gridlist[3]) ~= -1 then
			local Data = guiGridListGetItemData ( GUIEditor.gridlist[3],  guiGridListGetSelectedItem(GUIEditor.gridlist[3]), 1 )
			if Data then
				local X = guiGetText(GUIEditor.edit[1])
				local Y = guiGetText(GUIEditor.edit[2])
				local Z = guiGetText(GUIEditor.edit[3])
				local R = guiGetText(GUIEditor.edit[4])
				if tonumber(X) ~= nil and tonumber(Y) ~= nil and  tonumber(Z) ~= nil and  tonumber(R)  ~= nil then
					triggerServerEvent("Donator",localPlayer,"ChangePosition",Data[2],{tonumber(X),tonumber(Y),tonumber(Z),tonumber(R)},Data[5])
				end
			end
		end
	elseif (source == GUIEditor.button[9]) then
		guiSetVisible(GUIEditor.window[2],false)
		if guiGetVisible(VIP.button[2]) == false then
			showCursor(false)
		end
	elseif (source == GUIEditor.button[6]) then
		local ComboSelected = guiComboBoxGetSelected(GUIEditor.combobox[1])
		if ComboSelected ~= -1 then
			local Rank = guiComboBoxGetItemText(GUIEditor.combobox[1],ComboSelected)
			local AccountName = guiGetText(GUIEditor.edit[6])
			local  ComboSelcted = guiComboBoxGetSelected(GUIEditor.combobox[2])
			if ComboSelcted ~= -1 and AccountName ~= "" then
				local Days = gettok ( guiComboBoxGetItemText(GUIEditor.combobox[2],ComboSelcted), 1, string.byte(' ') )
				triggerServerEvent("Donator",localPlayer,"Give DL",Rank,AccountName,Days)
			end
		end
	elseif (source == GUIEditor.gridlist[4]) then
		local Selected = guiGridListGetSelectedItem(GUIEditor.gridlist[4])
		if Selected ~= -1 then
			local Data = guiGridListGetItemData ( GUIEditor.gridlist[4],  Selected, 1 )
			guiSetText(GUIEditor.label[5],"Account Name : "..Data[3])
			if Data[5] == "Perment" then
				guiSetText(GUIEditor.label[6],"Donator Ends in : "..Data[5])
			else
				guiSetText(GUIEditor.label[6],"Donator Ends in : "..secondsToTimeDesc(Data[5]))
			end
			guiSetText(GUIEditor.label[7],"Rank : "..Data[4])
			guiSetText(GUIEditor.label[8],"Date Gived in : "..Data[2])
			guiSetText(GUIEditor.label[9],"Giver Account Name : "..Data[1])
		else
			guiSetText(GUIEditor.label[5],"Account Name : ")
			guiSetText(GUIEditor.label[6],"Donator Ends in : ")
			guiSetText(GUIEditor.label[7],"Rank : ")
			guiSetText(GUIEditor.label[8],"Date Gived in : ")
			guiSetText(GUIEditor.label[9],"Giver Account Name : ")
		end
	elseif (source == GUIEditor.button[7]) then
		local Selected = guiGridListGetSelectedItem(GUIEditor.gridlist[4])
		if Selected ~= -1 then
			local Data = guiGridListGetItemData ( GUIEditor.gridlist[4],  Selected, 1 )
			triggerServerEvent("Donator",localPlayer,"Remove DL",Data[3])
		end
	elseif (source == GUIEditor.button[10]) then
		local Selected = guiGridListGetSelectedItem(GUIEditor.gridlist[5])
		if Selected ~= -1 then
			local SkinNumber = guiGridListGetItemText(GUIEditor.gridlist[5],Selected,2)
			triggerServerEvent("Donator",localPlayer,"SetSkin",tonumber(SkinNumber) )
		end
	elseif (source == GUIEditor.button[11]) then
		guiSetVisible(GUIEditor.window[3],false)
		if guiGetVisible(VIP.button[2]) == false then
			showCursor(false)
		end
	elseif (source == GUIEditor.button[12]) then
		local Selected = guiGridListGetSelectedItem(GUIEditor.gridlist[6])
		if Selected ~= -1 then
			local Data = guiGridListGetItemData(GUIEditor.gridlist[6],Selected,1)
			triggerServerEvent("Donator",localPlayer,"putHat",Data[1],{Data[2],Data[3],Data[4],Data[5]},{Data[6],Data[7],Data[8]})
		end
	elseif (source == GUIEditor.button[13]) then
		guiSetVisible(GUIEditor.window[4],false)
		if guiGetVisible(VIP.button[2]) == false then
			showCursor(false)
		end
	elseif (source == GUIEditor.button[14]) then
		triggerServerEvent("Donator",localPlayer,"removeHat")
	elseif (source == VIP.button[1]) then	
		triggerServerEvent("VIP",localPlayer,"SetBounty")
	elseif (source == VIP.button[2]) then
		local Text = guiGetText(source)
		guiSetEnabled(source,false)
		Timer = setTimer (guiSetEnabled,5*60*1000,1,source,true )
		table.insert(ButtonsTime,{Timer,source,Text} )
		triggerServerEvent("VIP",localPlayer,"Health")
	elseif (source == VIP.button[3]) then
		local Text = guiGetText(source)
		guiSetEnabled(source,false)
		Timer = setTimer (guiSetEnabled,5*60*1000,1,source,true )
		table.insert(ButtonsTime,{Timer,source,Text} )
		triggerServerEvent("VIP",localPlayer,"Armor")
	elseif (source == VIP.button[4]) then
		triggerServerEvent("VIP",localPlayer,"Skins")
	elseif (source == VIP.button[5]) then
		triggerServerEvent("VIP",localPlayer,"WalkStyle")
	elseif (source == VIP.button[6]) then
		triggerServerEvent("VIP",localPlayer,"Spawn")
	elseif (source == VIP.button[7]) then
		triggerServerEvent("VIP",localPlayer,"PlaceObjects")
	elseif (source == VIP.button[9]) then	
		triggerServerEvent("VIP",localPlayer,"Hats")
	elseif (source == VIP.button[12]) then	
		local  Text = guiGetText(source)
		if Text == "Hide Tag" then
			triggerServerEvent("VIP",localPlayer,"HideTag",true)
			guiSetText(source,"Show Tag")
		else
			triggerServerEvent("VIP",localPlayer,"HideTag",false)
			guiSetText(source,"Hide Tag")
		end
	elseif (source == VIP.button[11]) then
		local Text = guiGetText(source)
		guiSetEnabled(source,false)
		Timer = setTimer (guiSetEnabled,10*60*1000,1,source,true )
		table.insert(ButtonsTime,{Timer,source,Text} )
		triggerServerEvent("VIP",localPlayer,"Launcher")
	elseif (source == VIP.button[10]) then
		--[[if isPedInVehicle(localPlayer) then
			local Text = guiGetText(source)
			guiSetEnabled(source,false)
			Timer = setTimer (guiSetEnabled,5*60*1000,1,source,true )
			table.insert(ButtonsTime,{Timer,source,Text} )
			triggerServerEvent("VIP",localPlayer,"Turbo")
		end]]
	elseif (source == VIP.button[14]) then
		if isPedInVehicle(localPlayer) then
			local Text = guiGetText(source)
			guiSetEnabled(source,false)
			Timer = setTimer (guiSetEnabled,5*60*1000,1,source,true )
			table.insert(ButtonsTime,{Timer,source,Text} )
			triggerServerEvent("VIP",localPlayer,"Fix")
		end
	elseif (source == VIP.button[8]) then
		local Text = guiGetText(source)
		guiSetEnabled(source,false)
		Timer = setTimer (guiSetEnabled,1*60*1000,1,source,true )
		table.insert(ButtonsTime,{Timer,source,Text} )
		triggerServerEvent("VIP",localPlayer,"Maverick")
	elseif (source == VIP.button[15]) then
		local Text = guiGetText(source)
		guiSetEnabled(source,false)
		Timer = setTimer (guiSetEnabled,1*60*1000,1,source,true )
		table.insert(ButtonsTime,{Timer,source,Text} )
		triggerServerEvent("VIP",localPlayer,"Car")
	elseif (source == VIP.button[16]) then
		showCursor(false)
		for i=1,16 do
			guiSetVisible(VIP.button[i],false)
		end
		removeEventHandler("onClientRender", root,VipDx)
	end
end)

addEventHandler ( "onClientPlayerDamage", root,
function ( attacker, weapon, bodypart )
	if getElementData(source,"Passive") then
		cancelEvent()
	end
end)


function getTimeLeft(Timer)
	if isTimer(Timer) then
		ms = getTimerDetails(Timer)
	else
		return "0"
	end
	if ms then
		local m = math.floor(ms/60000)
		local s = math.floor((ms-m*60000)/1000)
		if m < 10 then m = ""..m end
		if s < 10 then s = "0"..s end
		return "("..m..":"..s..")"
	else
		return "0"
	end
end

function DecreaseButtonClickedTimer ()
	if table.getn(ButtonsTime) ~= 0 then
		for i , v in pairs (ButtonsTime) do
			local Timelft = getTimeLeft(v[1])
			guiSetText(v[2],Timelft)
			if Timelft == "0" then
				guiSetText(v[2],v[3])
				guiSetEnabled(v[2],true)
				table.remove(ButtonsTime,i)
				exports["guimessages"]:outputClient("#F3FF00[VIP]#00ff00 You are allowed to Reuse "..v[3].." button now #F3FF00!!")
			end
		end
	end
end
setTimer(DecreaseButtonClickedTimer,1000,0)


addEvent("Donator.setObjectTexture",true)
addEventHandler("Donator.setObjectTexture",root,
function(Object,Texture,TextureRelpace)
	setObjectBreakable(Object,false)
	if TextureRelpace ~= "Normal" then
		local Shader = dxCreateShader( "Shader/shader.fx" )
		dxSetShaderValue(Shader, "MarkerSkin", dxCreateTexture("Textures/"..TextureRelpace..".jpg"))
		engineApplyShaderToWorldTexture(Shader, Texture,Object)
	end
end)

addEvent("Donator.RefreshObjects",true)
addEventHandler("Donator.RefreshObjects",root,
function(Data)
	if source == localPlayer then
		guiGridListClear(GUIEditor.gridlist[3])
		for i , v in pairs (Data) do
			if v[1] == localPlayer then
				local Row =  guiGridListAddRow(GUIEditor.gridlist[3])
				guiGridListSetItemText ( GUIEditor.gridlist[3], Row, 1, v[5], false, false )
				guiGridListSetItemText ( GUIEditor.gridlist[3], Row, 2, v[4], false, false )
				guiGridListSetItemData ( GUIEditor.gridlist[3], Row, 1, {v[1],v[2],v[3],i,v[6]})
			end
		end
	end
end)


addEvent("RefreshDonatorsPanel",true)
addEventHandler("RefreshDonatorsPanel",root,
function(Data)
	guiGridListClear(GUIEditor.gridlist[4])
	for i , v in pairs (Data) do
		local Row =  guiGridListAddRow(GUIEditor.gridlist[4])
		guiGridListSetItemText ( GUIEditor.gridlist[4], Row, 1, v["Account"], false, false )
		guiGridListSetItemText ( GUIEditor.gridlist[4], Row, 2, v["Rank"], false, false )
		guiGridListSetItemData ( GUIEditor.gridlist[4], Row, 1, {v["Giver"],v["Date"],v["Account"],v["Rank"],v["Expeire"]})
	end
end)


addEvent("BountyOfPlayer",true)
addEventHandler("BountyOfPlayer",root,
function(Type,Value)
	if Type == 1 then
		Labels[source] =  exports["[Titans]3DLabel"]:create3DTextLabel("$#FFFFFF"..convertNumber(Value), tocolor (255,255,255,255), 0,0,10, 100, -1,"default-bold",2) 
		exports["[Titans]3DLabel"]:attach3DTextLabelToElement(Labels[source], source)
	elseif Type == 2 then
		exports["[Titans]3DLabel"]:delete3DTextLabel(Labels[source],source)
	end
end)



--					Objects
engineImportTXD ( engineLoadTXD ( "Models/Hats/rastahat.txd" ), 961 )

engineReplaceModel ( engineLoadDFF ( "Models/Hats/rastahat.dff" ), 961 )

engineImportTXD ( engineLoadTXD ( "Models/Hats/scythe.txd" ), 960 )

engineReplaceModel ( engineLoadDFF ( "Models/Hats/scythe.dff" ), 960 )

engineImportTXD ( engineLoadTXD ( "Models/Hats/shield.txd" ), 952 )

engineReplaceModel ( engineLoadDFF ( "Models/Hats/shield.dff" ), 952 )

engineImportTXD ( engineLoadTXD ( "Models/Hats/sombrero.txd" ), 933 )

engineReplaceModel ( engineLoadDFF ( "Models/Hats/sombrero.dff" ), 933 )

engineImportTXD ( engineLoadTXD ( "Models/Hats/trooper.txd" ), 932 )

engineReplaceModel ( engineLoadDFF ( "Models/Hats/trooper.dff" ), 932 )

engineImportTXD ( engineLoadTXD ( "Models/Hats/turbant.txd" ), 928 )

engineReplaceModel ( engineLoadDFF ( "Models/Hats/turbant.dff" ), 928 )

engineImportTXD ( engineLoadTXD ( "Models/Hats/vader2.txd" ), 926 )

engineReplaceModel ( engineLoadDFF ( "Models/Hats/vader2.dff" ), 926 )

engineImportTXD ( engineLoadTXD ( "Models/Hats/vest.txd" ), 924 )

engineReplaceModel ( engineLoadDFF ( "Models/Hats/vest.dff" ), 924 )

engineImportTXD ( engineLoadTXD ( "Models/Hats/whelmet.txd" ), 921 )

engineReplaceModel ( engineLoadDFF ( "Models/Hats/whelmet.dff" ), 921 )

engineImportTXD ( engineLoadTXD ( "Models/Hats/xmashat.txd" ), 917 )

engineReplaceModel ( engineLoadDFF ( "Models/Hats/xmashat.dff" ), 917 )

engineImportTXD ( engineLoadTXD ( "Models/Hats/xray.txd" ), 916 )

engineReplaceModel ( engineLoadDFF ( "Models/Hats/xray.dff" ), 916 )




--					Skins
engineImportTXD ( engineLoadTXD ( "Models/Skins/Freddy.txd" ), 63 )

engineReplaceModel ( engineLoadDFF ( "Models/Skins/Freddy.dff" ), 63 )

engineImportTXD ( engineLoadTXD ( "Models/Skins/Hitman.txd" ), 64 )

engineReplaceModel ( engineLoadDFF ( "Models/Skins/Hitman.dff" ), 64 )

engineImportTXD ( engineLoadTXD ( "Models/Skins/Sasquatch.txd" ), 75 )

engineReplaceModel ( engineLoadDFF ( "Models/Skins/Sasquatch.dff" ), 75 )

engineImportTXD ( engineLoadTXD ( "Models/Skins/tommy.txd" ), 85 )

engineReplaceModel ( engineLoadDFF ( "Models/Skins/tommy.dff" ), 85 )






























