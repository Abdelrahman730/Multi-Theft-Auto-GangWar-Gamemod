-- Tables
local theCategories = { [0]="Shirt", [1]="Haircuts", [2]="Trousers", [3]="Shoes", [4]="Tattoos: Left Upper Arm", [5]="Tattoos: Left Lower Arm", [6]="Tattoos: Right Upper Arm", [7]="Tattoos: Right Lower Arm", [8]="Tattoos: Back", [9]="Tattoos: Left Chest", [10]="Tattoos: Right Chest", [11]="Tattoos: Stomach", [12]="Tattoos: Lower Back", [13]="Necklaces", [14]="Watches", [15]="Glasses", [16]="Hats", [17]="Extras" }


local BlipsForClothesSHops = { 
[1] = {1457.3388671875, -1137.3828125, 24.964199066162},
[2] = {499.7314453125, -1360.240234375, 17.333992004395},
[3] = {2247.169921875, -1665.5107421875, 15.4765625},
[4] = {1657.0146484375, 1731.369140625, 10.82811164856},
[5] = {2573.98828125, 1904.5361328125, 11.0234375},
[6] = {-1882.0166015625, 864.1875, 35.171875},
[7] = {-2375.0673828125, 908.19921875, 45.4453125},
[8] = {2104.3, 2257.51, 11.02},
}

for i=1,#BlipsForClothesSHops do
	    local x, y = BlipsForClothesSHops[i][1], BlipsForClothesSHops[i][2]
		--exports.customblips:createCustomBlip ( x, y, 14, 14, "cl_icon.png", 250 )
		createBlip( x, y, 0, 45, 0, 0, 0, 0, 0, 0, 600 )
end

local theMarkers = {
{ 161.427734375, -84.8212890625, 1000.8046875, 18, 0 },
{ 207.658203125, -101.0400390625, 1004.2578125, 15, 0 },
{ 207.2841796875, -101.2978515625, 1004.2578125, 15, 2 },
{ 161.326171875, -85.0986328125, 1000.8046875, 18, 2 },
{ 161.453125, -85.4716796875, 1000.8046875, 18, 1 },
{ 207.5224609375, -102.0068359375, 1004.2578125, 15, 1 },
{ 207.0830078125, -130.3203125, 1002.5078125, 3, 0 },
{ 207.56, -100.41, 1004.25 , 15, 3 },
}

local x, y, z, int, dim = nil, nil, nil, nil, nil
local pricesModel = {}
local previousModel = nil

-- GUI Window
CJClothesWindow = guiCreateWindow(509,153,444,480,"CJ Clothes Shop",false)
CJClothesLabel1 = guiCreateLabel(12,22,203,16,"Categories:",false,CJClothesWindow)
guiLabelSetHorizontalAlign(CJClothesLabel1,"center",false)
guiSetFont(CJClothesLabel1,"default-bold-small")
CJClothesCatoGrid = guiCreateGridList(9,41,214,320,false,CJClothesWindow)
guiGridListSetSelectionMode(CJClothesCatoGrid,0)
CJClothesItemGrid = guiCreateGridList(225,40,210,321,false,CJClothesWindow)
guiGridListSetSelectionMode(CJClothesItemGrid,0)
CJClothesLabel2 = guiCreateLabel(230,22,203,16,"Clothes:",false,CJClothesWindow)
guiLabelSetHorizontalAlign(CJClothesLabel2,"center",false)
guiSetFont(CJClothesLabel2,"default-bold-small")
CJClothesLabel3 = guiCreateLabel(9,400,422,46,"Select The Category And Press Double Click To Show In The Skin.\n-If You Fnished Press Save Skin\nCJ This Style Will Always Safe If You Select The Cj Skin.",false,CJClothesWindow)
guiLabelSetHorizontalAlign(CJClothesLabel3,"center",false)
CJClothesLabel4 = guiCreateLabel(15,452,414,20,"Price",false,CJClothesWindow)
guiLabelSetColor(CJClothesLabel4,48,128,20)
guiLabelSetHorizontalAlign(CJClothesLabel4,"center",false)
guiSetFont(CJClothesLabel4,"default-bold-small")
CJClothesBuyButton = guiCreateButton(225,364,210,30,"Save Skin",false,CJClothesWindow)
CJClothesCancelButton = guiCreateButton(11,364,211,30,"Cancel",false,CJClothesWindow)

local column1 = guiGridListAddColumn( CJClothesCatoGrid, " Categories:", 0.8 )
local column2 = guiGridListAddColumn( CJClothesItemGrid, " widget name:", 0.6 )
local column3 = guiGridListAddColumn( CJClothesItemGrid, "  Price:", 0.3 )

local screenW,screenH=guiGetScreenSize()
local windowW,windowH=guiGetSize(CJClothesWindow,false)
local x,y = (screenW-windowW)/1,(screenH-windowH)/1
guiSetPosition(CJClothesWindow,x,y,false)

guiWindowSetMovable (CJClothesWindow, true)
guiWindowSetSizable (CJClothesWindow, false)
guiSetVisible (CJClothesWindow, false)

for i=0,17 do
	local categorie = theCategories[i]
	local row = guiGridListAddRow ( CJClothesCatoGrid )
	guiGridListSetItemText ( CJClothesCatoGrid, row, 1, categorie, false, true )
	guiGridListSetItemData ( CJClothesCatoGrid, row, 1, i )
end

function createClothesJSONString ( returnType )
	local clothesTable = {}
	local smtn = false
	for i=0,17 do
		local texture, model = getPedClothes ( localPlayer, i )
		if ( texture ) then
			local theType, theIndex = getTypeIndexFromClothes ( texture, model )
			clothesTable[theType] = theIndex
			smtn = true
		end
	end
	if ( smtn ) then
		if ( returnType == "JSON" ) then
			return "" .. toJSON( clothesTable ):gsub( " ", "" ) .. ""
		else
			return clothesTable
		end
	else
		return "NULL"
	end
end 

function updatePlayerCJSkin ( CJClothesTable )
	if ( CJClothesTable ) then
		for int, index in pairs( CJClothesTable ) do
			local texture, model = getClothesByTypeIndex ( int, index )
			if ( texture ) then
				addPedClothes ( source, texture, model, int )
			end
		end
	end
	triggerServerEvent( "onChangeClothesCJ", localPlayer, CJClothesTable, createClothesJSONString ( "JSON" ) )
end

function onClientCJMarkerHit ( hitElement, matchingDimension )
	if ( matchingDimension ) then
		if ( hitElement == localPlayer ) then
			local X,Y,Z = getElementPosition( localPlayer )
			if Z >= 1000 then
				if ( getElementModel ( localPlayer ) == 0 ) then
					fadeCamera( false, 1.0, 0, 0, 0 )
					setTimer( fadeCamera, 2000, 1, true, 1.0, 0, 0, 0 )
					
					setElementData(localPlayer,"ShopPanel",true)
					toggleAllControls ( false, true, false )
					
					local px, py, pz = getElementPosition( localPlayer )
					x, y, z, int, dim = px, py, pz, getElementInterior( localPlayer ), getElementDimension( localPlayer )
					
					pricesModel = {}
					previousModel = createClothesJSONString ( "table" )
					
					setTimer( function ()		
					
						if ( getElementInterior( localPlayer ) ~= 1 ) then
							setElementInterior( localPlayer, 1, 209.78, -33.73, 1001.92 )
						else
							setElementPosition( localPlayer, 209.78, -33.73, 1001.92 )
						end
						
						setElementFrozen( localPlayer, true )
						
						setPedRotation( localPlayer, 135.98809814453 )
						setElementDimension( localPlayer, math.random( 10,65535 ) )
						setCameraMatrix( 207.42649841309, -35.311698913574, 1002.7904052734, 212.10893249512, -33.584545135498, 1001.716003418, 0, 70 )
						
						setTimer( function ()
							guiSetVisible ( CJClothesWindow, true )
							showCursor( true )
						end, 1000, 1 )
					end, 1200, 1 )
				else
				exports["guimessages"]:outputClient( "only for CJ Skin | Model = 0", 225, 0, 0 )
				end
			end
		end
	end
end

function recountTotalPrice ()
	local totalPrice = 0
	for i=0,17 do
		if ( pricesModel[i] == nil ) then
			-- Nothing
		else
			totalPrice = ( tonumber(totalPrice) + tonumber(pricesModel[i]) )
		end
	end	
	guiSetText( CJClothesLabel4, "Total price: $"..totalPrice )
	return totalPrice
end

for i=1,#theMarkers do
	local x, y, z, int, dim = theMarkers[i][1], theMarkers[i][2], theMarkers[i][3], theMarkers[i][4], theMarkers[i][5]
	local CJMarker = createMarker( x, y, z, "cylinder", 2.0, 225, 150, 0, 150)
	setElementInterior( CJMarker, int )
	setElementDimension( CJMarker, dim )
	addEventHandler( "onClientMarkerHit", CJMarker, onClientCJMarkerHit )
end

addEventHandler( "onClientGUIClick", CJClothesCancelButton,
function ()				
	fadeCamera( false, 1.0, 0, 0, 0 )
	setTimer( fadeCamera, 2000, 1, true, 1.0, 0, 0, 0 )
	
	setElementData(localPlayer,"ShopPanel",false)
	toggleAllControls ( true, true, true )
	
	guiSetVisible ( CJClothesWindow, false )
	showCursor( false )
	
	updatePlayerCJSkin ( previousModel )
	
	setElementFrozen( localPlayer, false )
	
	setTimer( function ()
		if ( getElementInterior( localPlayer ) ~= int ) then
			setElementInterior( localPlayer, int, x, y, z )
		else
			setElementPosition( localPlayer, x, y, z )
		end			
			
		setElementDimension( localPlayer, dim )
		setCameraTarget ( localPlayer )
	end, 1200, 1 )
end
, false )

addEventHandler( "onClientGUIClick", CJClothesBuyButton,
function ()	
	if ( getPlayerMoney( localPlayer ) >= tonumber( recountTotalPrice () ) ) then
		fadeCamera( false, 1.0, 0, 0, 0 )
		setTimer( fadeCamera, 2000, 1, true, 1.0, 0, 0, 0 )
		
		toggleAllControls ( true, true, true )
		
		setElementData(localPlayer,"ShopPanel",false)
		guiSetVisible ( CJClothesWindow, false )
		showCursor( false )
		
		updatePlayerCJSkin ( createClothesJSONString ( "table" ) )
		triggerServerEvent( "onPlayerBougtSkin", localPlayer, recountTotalPrice () )
		
		setElementFrozen( localPlayer, false )
		
		setTimer( function ()
			if ( getElementInterior( localPlayer ) ~= int ) then
				setElementInterior( localPlayer, int, x, y, z )
			else
				setElementPosition( localPlayer, x, y, z )
			end			
				
			setElementDimension( localPlayer, dim )
			setCameraTarget ( localPlayer )
		end, 1200, 1 )
	else
		exports["guimessages"]:outputClient( "You do not have enough money", 225, 0, 0 )
	end
end
, false )

addEventHandler( "onClientGUIClick", CJClothesCatoGrid,
function ()
	guiGridListClear( CJClothesItemGrid )
	local theRow, theColumn = guiGridListGetSelectedItem ( CJClothesCatoGrid )
	if ( theRow == nil ) or ( theRow == -1 ) then
		return
	else
		local selectedCato = guiGridListGetItemData ( CJClothesCatoGrid, theRow, theColumn )
		if ( selectedCato ) then
			local theTable = getClothesTableByType ( selectedCato )
			for i=0,#theTable do
				local texture, model = getClothesByTypeIndex ( selectedCato, i )
				local row = guiGridListAddRow ( CJClothesItemGrid )
				guiGridListSetItemText ( CJClothesItemGrid, row, 1, texture.." - "..model, false, true )
				guiGridListSetItemText ( CJClothesItemGrid, row, 2, "$"..theTable[i], false, true )
				guiGridListSetItemData ( CJClothesItemGrid, row, 1, texture..","..model )
			end
		end
	end
end
, false )

addEventHandler( "onClientGUIDoubleClick", CJClothesItemGrid,
function ()
	local theRow, theColumn = guiGridListGetSelectedItem ( CJClothesItemGrid )
	if ( theRow == nil ) or ( theRow == -1 ) then
		return false
	else
		local selectedItem = guiGridListGetItemData ( CJClothesItemGrid, theRow, theColumn )
		local thePrice = guiGridListGetItemText ( CJClothesItemGrid, theRow, 2 )
		if ( selectedItem ) then
			local CJClothesTable = stringExplode( selectedItem, "," )
			local texture, model = CJClothesTable[1], CJClothesTable[2]
			local theType, index = getTypeIndexFromClothes ( texture, model )
			local gtexture, gmodel = getPedClothes ( localPlayer, theType )
			if ( gtexture == texture ) and ( gmodel == model ) then
				removePedClothes ( localPlayer, theType, texture, model )
			else
				pricesModel[theType] = tonumber( string.sub(thePrice, 2) )
				recountTotalPrice ()
				addPedClothes ( localPlayer, texture, model, theType )
			end
		end
	end
end
, false )

function stringExplode(self, separator)
    Check("stringExplode", "string", self, "ensemble", "string", separator, "separator")
 
    if (#self == 0) then return {} end
    if (#separator == 0) then return { self } end
 
    return loadstring("return {\""..self:gsub(separator, "\",\"").."\"}")()
end

function Check(funcname, ...)
    local arg = {...}
 
    if (type(funcname) ~= "string") then
        error("Argument type mismatch at 'Check' ('funcname'). Expected 'string', got '"..type(funcname).."'.", 2)
    end
    if (#arg % 3 > 0) then
        error("Argument number mismatch at 'Check'. Expected #arg % 3 to be 0, but it is "..(#arg % 3)..".", 2)
    end
 
    for i=1, #arg-2, 3 do
        if (type(arg[i]) ~= "string" and type(arg[i]) ~= "table") then
            error("Argument type mismatch at 'Check' (arg #"..i.."). Expected 'string' or 'table', got '"..type(arg[i]).."'.", 2)
        elseif (type(arg[i+2]) ~= "string") then
            error("Argument type mismatch at 'Check' (arg #"..(i+2).."). Expected 'string', got '"..type(arg[i+2]).."'.", 2)
        end
 
        if (type(arg[i]) == "table") then
            local aType = type(arg[i+1])
            for _, pType in next, arg[i] do
                if (aType == pType) then
                    aType = nil
                    break
                end
            end
            if (aType) then
                error("Argument type mismatch at '"..funcname.."' ('"..arg[i+2].."'). Expected '"..table.concat(arg[i], "' or '").."', got '"..aType.."'.", 3)
            end
        elseif (type(arg[i+1]) ~= arg[i]) then
            error("Argument type mismatch at '"..funcname.."' ('"..arg[i+2].."'). Expected '"..arg[i].."', got '"..type(arg[i+1]).."'.", 3)
        end
    end
end