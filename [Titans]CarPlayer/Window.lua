local ButtonsTime = {}

GUIEditor = {
    gridlist = {},
    window = {},
    button = {}
}

local PlayerCars = {}

cars = {
    {462,0},
	{422,10000},
	{551,75000},
	{463,150000},
	{579,220000},
	{494,599999},
	{506,600000},
	{522,1000000},
	{411,2500000},
	{487,5000000}
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


GUIEditor = {
    gridlist = {},
    window = {},
    button = {},
    label = {}
}
addEventHandler("onClientResourceStart", resourceRoot,
    function()
        GUIEditor.window[1] = guiCreateWindow(0.42, 0.26, 0.17, 0.48, "Vechile Panel", true)
        guiWindowSetSizable(GUIEditor.window[1], false)
        guiSetAlpha(GUIEditor.window[1], 0.82)
		guiSetVisible(GUIEditor.window[1],false)

        GUIEditor.button[1] = guiCreateButton(0.04, 0.71, 0.40, 0.08, "Ok", true, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(0.55, 0.71, 0.40, 0.08, "Close", true, GUIEditor.window[1])
        GUIEditor.button[3] = guiCreateButton(0.04, 0.82, 0.40, 0.08, "Buy", true, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[3], "NormalTextColour", "FF00FF18")
        GUIEditor.button[4] = guiCreateButton(0.55, 0.82, 0.40, 0.08, "Sell", true, GUIEditor.window[1])
		guiSetEnabled(GUIEditor.button[4],false)
        guiSetProperty(GUIEditor.button[4], "NormalTextColour", "FF00FF18")
        GUIEditor.gridlist[1] = guiCreateGridList(0.04, 0.06, 0.92, 0.63, true, GUIEditor.window[1])
        guiGridListAddColumn(GUIEditor.gridlist[1], "Vechile", 0.5)
        guiGridListAddColumn(GUIEditor.gridlist[1], "Prices", 0.5)

        guiSetAlpha(GUIEditor.gridlist[1], 0.86)
		
		
        --[[GUIEditor.label[1] = guiCreateLabel(0.04, 0.92, 0.42, 0.04, " *تم شراء السيارة", true, GUIEditor.window[1])
        guiLabelSetColor(GUIEditor.label[1], 0, 255, 24)
        GUIEditor.label[2] = guiCreateLabel(0.46, 0.92, 0.52, 0.04, " *لم تقم بشراء السيارة", true, GUIEditor.window[1])
        guiLabelSetColor(GUIEditor.label[2], 255, 0, 0)
        GUIEditor.label[3] = guiCreateLabel(0.44, 0.92, 0.07, 0.04, "-", true, GUIEditor.window[1])    ]]
		
    end
)

function getVehiclePriceFromID (ID)
	for i , v in pairs (cars) do
		if v[1] == ID then
			return v[2]
		end
	end
end

function isPlayerHasThisID (ID)
	if table.getn(PlayerCars) ~= 0 then
		for i , v in pairs (PlayerCars) do
			if ID == v[1] then
				return true
			end
		end
	end
end

addEvent("[Titans]CarPlayer",true)
addEventHandler("[Titans]CarPlayer",root,
function(Type,Table,AccountName)
	if Type == "ShowWindow" then
		guiSetVisible(GUIEditor.window[1],true)
		showCursor(true)
	elseif Type == "HideWindow" then
		guiSetVisible(GUIEditor.window[1],false)
		showCursor(false)
	elseif Type == "Refresh" then
		PlayerCars = {}
		for index , value in pairs (Table) do
			if value["AccountName"] == AccountName then
				table.insert(PlayerCars,{value["ID"]})
			end
		end
		guiGridListClear(GUIEditor.gridlist[1])
		for i,v in ipairs (cars) do
			local carName = getVehicleNameFromModel (v[1])
			local row = guiGridListAddRow (GUIEditor.gridlist[1])
			guiGridListSetItemText (GUIEditor.gridlist[1], row, 1, i.."- "..carName, false, true)
			if v[2] == 0 then
				guiGridListSetItemText (GUIEditor.gridlist[1], row, 2, "FREE", false, true)
			else
				guiGridListSetItemText (GUIEditor.gridlist[1], row, 2, "$"..convertNumber(v[2]), false, true)
			end
			guiGridListSetItemData(GUIEditor.gridlist[1],row,1,{v[1],v[2]})
			if isPlayerHasThisID(v[1]) then
				guiGridListSetItemColor(GUIEditor.gridlist[1], row, 1, 0, 255, 0, 255)
				guiGridListSetItemColor(GUIEditor.gridlist[1], row, 2, 0, 255, 0, 255)
			else
				guiGridListSetItemColor(GUIEditor.gridlist[1], row, 1, 255, 0, 0, 255)
				guiGridListSetItemColor(GUIEditor.gridlist[1], row, 2, 255, 0, 0, 255)
			end
		end
	end
end)


addEventHandler("onClientGUIClick",guiRoot,
function()
	if (source == GUIEditor.button[2]) then
		guiSetVisible(GUIEditor.window[1],false)
		showCursor(false)
	elseif (source == GUIEditor.button[3]) then
		local Selected = guiGridListGetSelectedItem(GUIEditor.gridlist[1])
		if Selected ~= -1 then
			local Data = guiGridListGetItemData(GUIEditor.gridlist[1],Selected,1)
			triggerServerEvent("[Titans]CarPlayer",localPlayer,"BuyVehicle",Data[1],Data[2])
			stopButton(source)
		end
	elseif (source == GUIEditor.button[1]) then
		local Selected = guiGridListGetSelectedItem(GUIEditor.gridlist[1])
		if Selected ~= -1 then
			local Data = guiGridListGetItemData(GUIEditor.gridlist[1],Selected,1)
			triggerServerEvent("[Titans]CarPlayer",localPlayer,"TakeVehicle",Data[1])
			stopButton(source)
		end
	elseif (source == GUIEditor.button[4]) then
		local Selected = guiGridListGetSelectedItem(GUIEditor.gridlist[1])
		if Selected ~= -1 then
			local Data = guiGridListGetItemData(GUIEditor.gridlist[1],Selected,1)
			triggerServerEvent("[Titans]CarPlayer",localPlayer,"SellVehicle",Data[1],Data[2])
			stopButton(source)
		end
	end
end)


function stopButton (source)
	local Texts = guiGetText(source)
	guiSetEnabled(source,false)
	Timer = setTimer (guiSetEnabled,5*1000,1,source,true )
	table.insert(ButtonsTime,{Timer,source,Texts} )
end

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
			end
		end
	end
end
setTimer(DecreaseButtonClickedTimer,1000,0)


