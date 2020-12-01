--[[local text = xmlNodeGetValue(xmlLoadFile(tostring("Files/About.xml")))
local Table = {}
local x, y = guiGetScreenSize()
AboutEditor = {
    label = {},
    staticimage = {}
}

function table.len(table)
	local value = 0
	for i,v in pairs(table) do
		value = value + 1
	end
	return value
end


function sHmatch(String,t)
	local sl = string.len(String)
	local s2 = string.len(t)
	local HM
	local f
	local index = 1
	if string.sub(String,1,2) ~= "\n" then
		f = 1
		HM = 1
	else
		f = 3
		HM = 3
	end
	for i=1,(sl-1) do
		if t == string.sub(String,f,f+s2-1) then
			Table[index] = string.sub(String,HM,f-1)
			index = index + 1
			HM = f+s2		
		end
		f = f+1
	end
	Table[index] = string.sub(String,HM,f)
end


sHmatch(text,"\n")

	AboutEditor.staticimage[1] = guiCreateStaticImage(0.2, 0.28, 0.60, 0.44, "Images/not.png", true)
	guiSetProperty(AboutEditor.staticimage[1], "ImageColours", "tl:5E505050 tr:5E505050 bl:5E505050 br:5E505050")
	guiSetVisible(AboutEditor.staticimage[1],false)
	
	local font0_PetitFormalScript = guiCreateFont("Fonts/ntailub.ttf", 15)
	local ly = 0.5
	for i,v in ipairs(Table) do
		AboutEditor.label[i] = guiCreateLabel(0.2, ly, 0.60, 1.00, v, true, AboutEditor.staticimage[1])
		guiLabelSetHorizontalAlign(AboutEditor.label[i], "center", false)
		guiLabelSetVerticalAlign(AboutEditor.label[i], "center") 
		guiSetFont(AboutEditor.label[i], font0_PetitFormalScript)   
			
		local w = (guiLabelGetFontHeight (AboutEditor.label[i])*2)/y
		guiSetSize ( AboutEditor.label[i], 1, w, true )	
		ly = ly+w
		guiSetVisible(AboutEditor.label[i],false)
	end
		
		

function LabelMove()
	for i,v in pairs(Table) do
		if AboutEditor.label[i] then
			if guiGetVisible(AboutEditor.label[i]) and guiGetVisible(AboutEditor.staticimage[1]) then
				local x,y = guiGetPosition ( AboutEditor.label[i] , true)
				local h,w = guiGetSize ( AboutEditor.label[i], true )	
				if y > 0-w then
					guiSetPosition ( AboutEditor.label[i], 0, y - 0.001, true)
				elseif i == (table.len(Table)-1) and y <= 0-w then
					CloseAbout()
				elseif y <= 0-w then
					guiSetVisible(AboutEditor.label[i],false)
				end
			else
				guiSetVisible(AboutEditor.staticimage[1],false)
			end
		end
	end
end

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
    if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
        local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
        if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
            for i, v in ipairs( aAttachedFunctions ) do
                if v == func then
                    return true
                end
            end
        end
    end
    return false
end

function OpenAbout()
	guiSetVisible(AboutEditor.staticimage[1],true)
	if not isEventHandlerAdded( "onClientRender", root, LabelMove ) then
		addEventHandler("onClientRender", root, LabelMove)
	end
	local ly = 0.5
	for i,v in ipairs(Table) do
		guiSetVisible(AboutEditor.label[i],true)
		guiSetPosition(AboutEditor.label[i],0,ly, true)
		local w = (guiLabelGetFontHeight (AboutEditor.label[i])*2)/y
		ly = ly+w
	end
end

function CloseAbout()
	guiSetVisible(AboutEditor.staticimage[1],false)
	--if isEventHandlerAdded( "onClientRender", root, LabelMove ) then
		removeEventHandler("onClientRender", root, LabelMove)
	--end
end]]


--[[addCommandHandler("dd",
function()
	OpenAbout()
end
)

addCommandHandler("ss",
function()
	CloseAbout()
end
)]]