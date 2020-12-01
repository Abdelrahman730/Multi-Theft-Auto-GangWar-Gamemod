GUIEditor = {
    gridlist = {},
    window = {},
    button = {}
}

cars = {
    {598},
	{597},
	{596},
	{523},
	{599},
	{427},
  --{carID},
	}



local l, w = guiGetScreenSize()
GUIEditor.window[1] = guiCreateWindow((l - 250) / 2, (w - 300) / 2, 215, 348, "Vehicles Police", false)
guiWindowSetSizable(GUIEditor.window[1], false)
guiSetVisible(GUIEditor.window[1],false)
guiSetAlpha(GUIEditor.window[1], 1.00)
guiSetProperty(GUIEditor.window[1], "NormalTextColour", "FF0000FE")  

GUIEditor.gridlist[1] = guiCreateGridList(9, 10, 197, 280, false, GUIEditor.window[1])
guiGridListAddColumn(GUIEditor.gridlist[1], "#", 0.2)
guiGridListAddColumn(GUIEditor.gridlist[1], "Vehicle", 0.7)
GUIEditor.button[1] = guiCreateButton(9, 301, 89, 37, "Use", false, GUIEditor.window[1])
guiSetFont(GUIEditor.button[1], "default-bold-small")
guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FF0000FE")  
GUIEditor.button[2] = guiCreateButton(118, 301, 88, 37, "X", false, GUIEditor.window[1])
guiSetFont(GUIEditor.button[2], "default-bold-small")
guiSetProperty(GUIEditor.button[2], "NormalTextColour", "FF0000FE")  


for i,v in ipairs (cars) do
    local carName = getVehicleNameFromModel (v[1])
    local row = guiGridListAddRow (GUIEditor.gridlist[1])
	guiGridListSetItemText (GUIEditor.gridlist[1], row, 1, i.."-", false, true)
    guiGridListSetItemText (GUIEditor.gridlist[1], row, 2, carName, false, true)
end



addEvent ("openMeanaaa", true)
function openMean ()
if (getLocalPlayer() == source) then
guiSetVisible(GUIEditor.window[1],true)
showCursor(true)
end
end
addEventHandler ("openMeanaaa", getRootElement(), openMean)

addEvent ("closeOpenMeanaaa", true)
function closeOpenMean ()
if (getLocalPlayer() == source) then
guiSetVisible(GUIEditor.window[1],false)
showCursor(false)
end
end
addEventHandler ("closeOpenMeanaaa", getRootElement(), closeOpenMean)

addEventHandler ("onClientGUIClick", GUIEditor.button[2],
function (button, state, absoluteX, absoluteYe)
 guiSetVisible(GUIEditor.window[1],false)
 showCursor(false)
end)
function trigger ()
if (guiGridListGetSelectedItem (GUIEditor.gridlist[1])) then
local car = guiGridListGetItemText (GUIEditor.gridlist[1], guiGridListGetSelectedItem (GUIEditor.gridlist[1]), 2)
if car == "" or car == nil then outputChatBox( "please selected car from list.",255,0,0,true ) return end
  triggerServerEvent ("getCaraaa", getLocalPlayer(), car)
  guiSetVisible(GUIEditor.window[1],false)
  showCursor(false)
end
end

addEventHandler ("onClientGUIClick", GUIEditor.button[1],
function (button, state, absoluteX, absoluteYe)
trigger(getLocalPlayer())
end)

addEventHandler ("onClientGUIDoubleClick", GUIEditor.gridlist[1],
function (button, state, absoluteX, absoluteYe)
trigger(getLocalPlayer())
end)


function renderIng( )
	local x, y, z = getCameraMatrix( )
	local dimension = getElementDimension( localPlayer )
	for key, pickup in ipairs ( getElementsByType( "pickup" ) ) do
		if getElementDimension( pickup ) == dimension then
			local px, py, pz = getElementPosition( pickup )
			local distance = getDistanceBetweenPoints3D( px, py, pz, x, y, z )
			if distance <= 20 then
				local text = getElementData( pickup, "message" )	
				if text and ( distance < 2 or isLineOfSightClear( x, y, z, px, py, pz + 0.7, true, true, true, true, false, false, true, localPlayer ) ) then
					local sx, sy = getScreenFromWorldPosition( px, py, pz + 0.7 )
					if sx and sy then
						local w = dxGetTextWidth( tostring( text ) )
						local h = ( text and 2 or 1 ) * dxGetFontHeight( )
						dxDrawRectangle( sx - w / 2 - 5, sy - h / 2 - 5, w + 10, h + 10, tocolor( 0, 0, 0, 200 ) )
						dxDrawText( tostring( text ), sx, sy, sx, sy, tocolor( 255, 255, 255, 255 ), 1, "default", "center", "center" )

					end
				end
			end
		end
	end	
end
addEventHandler( "onClientRender", getRootElement( ),renderIng)