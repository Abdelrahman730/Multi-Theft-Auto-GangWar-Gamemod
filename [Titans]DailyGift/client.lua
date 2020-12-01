local Gifts = {
	-- Money
	-- Exp 
	-- GC
	-- Rocket
	-- Luncher 
	-- Grenade
	-- VIP
	
	-- Name , Give , Kind
	{"Money ( 10,000 )",10000,"Money"},
	{"Exp ( 100 )",100,"Exp"},
	{"GC ( 1 )",1,"Game Coins"},
	{"Rocket Launcher ( 2 )",2,"Weapon"},
	{"Launcher ( 1 )",1,"Launcher"},
	{"Grenade ( 1 )",1,"Weapon"},
	{"Points Group ( 5 )",5,"Group"},
	{"Points Criminals ( 5 )",5,"Best"},
	{"Points Police ( 5 )",5,"Best"},
	--{"VIP ( 1 Hours )",60*60,"VIP"},
	{"Money ( 50,000 )",50000,"Money"},
	{"Exp ( 200 )",200,"Exp"},
	{"GC ( 2 )",2,"Game Coins"},
	{"Rocket Launcher ( 4 )",4,"Weapon"},
	{"Launcher ( 2 )",2,"Launcher"},
	{"Grenade ( 2 )",2,"Weapon"},
	{"Points Group ( 10 )",10,"Group"},
	{"Points Criminals ( 10 )",10,"Best"},
	{"Points Police ( 10 )",10,"Best"},
	--{"VIP ( 2 Hours )",2*60*60,"VIP"},
	{"Money ( 100,000 )",100000,"Money"},
	{"Exp ( 500 )",500,"Exp"},
	{"GC ( 5 )",5,"Game Coins"},
	{"Rocket Launcher ( 5 )",5,"Weapon"},
	{"Launcher ( 2 )",2,"Launcher"},
	{"Grenade ( 2 )",2,"Weapon"},
	{"Points Group ( 15 )",15,"Group"},
	{"Points Criminals ( 15 )",15,"Best"},
	{"Points Police ( 15 )",15,"Best"},
	--{"VIP ( 2 Hours )",2*60*60,"VIP"},
	{"Money ( 300,000 )",300000,"Money"},
	{"Exp ( 600 )",600,"Exp"},
	{"GC ( 7 )",7,"Game Coins"},
	{"Rocket Launcher ( 7 )",7,"Weapon"},
	{"Launcher ( 2 )",2,"Launcher"},
	{"Grenade ( 2 )",2,"Weapon"},
	{"Points Group ( 50 )",50,"Group"},
	{"Points Criminals ( 50 )",50,"Best"},
	{"Points Police ( 50 )",50,"Best"},
	--{"VIP ( 4 Hours )",4*60*60,"VIP"},
	{"Money ( 500,000 )",500000,"Money"},
	{"Exp ( 1000 )",1000,"Exp"},
	{"GC ( 10 )",10,"Game Coins"},
	{"Rocket Launcher ( 10 )",10,"Weapon"},
	{"Launcher ( 3 )",3,"Launcher"},
	{"Grenade ( 3 )",3,"Weapon"},
	{"Points Group ( 100 )",100,"Group"},
	{"Points Criminals ( 100 )",100,"Best"},
	{"Points Police ( 100 )",100,"Best"},
	--{"VIP ( 6 Hours )",6*60*60,"VIP"},
}



GUIEditor = {
    gridlist = {},
    staticimage = {},
    button = {},
    label = {}
}

        GUIEditor.staticimage[1] = guiCreateStaticImage(0.35, 0.17, 0.29, 0.66, "dot_white.png", true)
        guiSetProperty(GUIEditor.staticimage[1], "ImageColours", "tl:83000000 tr:83000000 bl:83000000 br:83000000")
		guiSetVisible(GUIEditor.staticimage[1],false)

        GUIEditor.gridlist[1] = guiCreateGridList(0.01, 0.06, 0.97, 0.74, true, GUIEditor.staticimage[1])
        guiGridListAddColumn(GUIEditor.gridlist[1], "#", 0.9)
		guiSetEnabled(GUIEditor.gridlist[1],false)
        
        GUIEditor.label[1] = guiCreateLabel(0.09, 0.02, 1.01, 0.04, "الهدية اليومية يمكنك استلام الهدية كل 24 ساعة / نوع الهدية تعتمد على الحظ   ", true, GUIEditor.staticimage[1])
        guiSetFont(GUIEditor.label[1], "default-small")
        guiLabelSetColor(GUIEditor.label[1], 97, 243, 0)
        GUIEditor.button[1] = guiCreateButton(0.54, 0.82, 0.33, 0.06, "استلام الجائزة ", true, GUIEditor.staticimage[1])
        guiSetFont(GUIEditor.button[1], "default-bold-small")
        guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FFFFF600")
        GUIEditor.button[2] = guiCreateButton(0.10, 0.82, 0.33, 0.06, "اغلاق", true, GUIEditor.staticimage[1])
        guiSetFont(GUIEditor.button[2], "default-bold-small")
        guiSetProperty(GUIEditor.button[2], "NormalTextColour", "C8FFFFFF")
        GUIEditor.label[2] = guiCreateLabel(0, 0.95, 1, 0.04, "", true, GUIEditor.staticimage[1])
        guiSetFont(GUIEditor.label[2], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[2], 5, 217, 0)   
		guiLabelSetVerticalAlign(GUIEditor.label[2],"center")		
		guiLabelSetHorizontalAlign(GUIEditor.label[2],"center")	
		

function getColor (Gift)
	if Gift == "Money" then
		return  0,150,0
	elseif Gift == "Exp" then
		return  30,0,170
	elseif Gift == "Game Coins" then
		return  0,150,0
	elseif Gift == "Weapon" then
		return  198,42,0
	elseif Gift == "Launcher" then
		return  0,177,200
	elseif Gift == "VIP" then
		return  255,255,0
	elseif Gift == "Group" then
		return 255,0,0
	elseif Gift == "Best" then
		return 0,0,255
	end
end		

for i , v in pairs (Gifts) do
	local Row = guiGridListAddRow(GUIEditor.gridlist[1])
	guiGridListSetItemText(GUIEditor.gridlist[1],Row,1,v[1],false,false)
	guiGridListSetItemData(GUIEditor.gridlist[1],Row,1,v)
	local r,g,b = getColor(v[3])
	guiGridListSetItemColor ( GUIEditor.gridlist[1], Row, 1, r, g, b )
end


function setDailyGiftsWindow (Type)
	guiSetVisible(GUIEditor.staticimage[1],Type)
	showCursor(Type)
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



addEventHandler("onClientGUIClick",guiRoot,
function()
	if (source == GUIEditor.button[1]) then
		local TotalRows = guiGridListGetRowCount(GUIEditor.gridlist[1])
		local GiftRow = math.random(1,TotalRows)
		local Start = 0
		guiSetEnabled(source,false)
		setTimer (function ()
			playSoundFrontEnd(45)
			guiGridListSetSelectedItem(GUIEditor.gridlist[1],Start,1)
			guiGridListSetVerticalScrollPosition(GUIEditor.gridlist[1],Start*2)
			Start = Start + 1
			if Start == TotalRows then
				Start = 0
				setTimer (function ()
					playSoundFrontEnd(45)
					guiGridListSetSelectedItem(GUIEditor.gridlist[1],Start,1)
					guiGridListSetVerticalScrollPosition(GUIEditor.gridlist[1],Start*2)
					Start = Start + 1
					if Start == GiftRow then
						guiSetEnabled(GUIEditor.button[1],true)
						local Data = guiGridListGetItemData(GUIEditor.gridlist[1],GiftRow-1,1)
						triggerServerEvent("[Titans]DailyGift",localPlayer,"Gift",Data)
					end
				end,150,GiftRow)
			end
		end,50,TotalRows)
	elseif (source == GUIEditor.button[2]) then
		guiSetVisible(GUIEditor.staticimage[1],false)
		showCursor(false)
	end
end)




addEvent("[Titans]DailyGift",true)
addEventHandler("[Titans]DailyGift",root,
function(Type,Time)
	if Type == "Refresh" then
		if Time > 0 then
			guiSetText(GUIEditor.label[2],secondsToTimeDesc(Time) )
		else
			guiSetText(GUIEditor.label[2],"")
		end
	end
end)











