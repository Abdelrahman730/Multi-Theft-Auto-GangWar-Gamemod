local AirModeEnabled = false
setWorldSpecialPropertyEnabled("aircars", false)

local EnableBoost = true
	-- player , Vehicle , Weapon
local WeaponsVehicle = {}

function isVehicleHaveGuns(Vehicle)
	for i , v in pairs (WeaponsVehicle) do
		if v[1] == Vehicle then
			return v[2]
		end
	end
end

function getIndexFromVehicle (Vehicle)
	for i , v in pairs (WeaponsVehicle) do
		if v[1] == Vehicle then
			return i
		end
	end
end

function incarcaMod (resursaPornita) 
	if(resursaPornita == getThisResource()) then 
		downloadFile('Models/600.txd')
		downloadFile('Models/582.txd')
		downloadFile('Models/580.txd')
		downloadFile('Models/588.txd')
		downloadFile('Models/550.txd')
		downloadFile('Models/362.txd')
		
		downloadFile('Models/600.dff')
		downloadFile('Models/582.dff')
		downloadFile('Models/580.dff')
		downloadFile('Models/588.dff')
		downloadFile('Models/550.dff')
		downloadFile('Models/362.dff')
		
		--[[engineImportTXD ( engineLoadTXD ( "Models/605.txd" ), 600 )
		engineReplaceModel ( engineLoadDFF ( "Models/605.dff" ), 600 )

		engineImportTXD ( engineLoadTXD ( "Models/582.txd" ), 582 )
		engineReplaceModel ( engineLoadDFF ( "Models/582.dff" ), 582 )

		engineImportTXD ( engineLoadTXD ( "Models/583.txd" ),580 )
		engineReplaceModel ( engineLoadDFF ( "Models/583.dff" ), 580 )

		engineImportTXD ( engineLoadTXD ( "Models/588.txd" ), 588 )
		engineReplaceModel ( engineLoadDFF ( "Models/588.dff" ), 588 )]]
	end 
end 



addEventHandler("onClientResourceStart", getRootElement(), incarcaMod)

function onDownloadFinish ( file, success )
    if ( source == resourceRoot ) then                            -- if the file relates to this resource
        if ( success ) then                                       -- if the file was downloaded successfully
            if ( string.find(file,"dff") ) then                        -- if the file name is what we were expecting
				local Table = split(file,".")
				local Table2 = split(Table[1],"/")
				engineImportTXD ( engineLoadTXD (Table[1]..".txd" ), tonumber(Table2[2]) )
				engineReplaceModel ( engineLoadDFF (Table[1]..".dff" ),tonumber(Table2[2]) )
            end
        end
    end
end
addEventHandler ( "onClientFileDownloadComplete", root, onDownloadFinish )

--[[engineImportTXD ( engineLoadTXD ( "Models/574.txd" ), 574 )
engineReplaceModel ( engineLoadDFF ( "Models/574.dff" ), 574 )

engineImportTXD ( engineLoadTXD ( "Models/582.txd" ), 582 )
engineReplaceModel ( engineLoadDFF ( "Models/582.dff" ), 582 )

engineImportTXD ( engineLoadTXD ( "Models/583.txd" ),583 )
engineReplaceModel ( engineLoadDFF ( "Models/583.dff" ), 583 )

engineImportTXD ( engineLoadTXD ( "Models/588.txd" ), 588 )
engineReplaceModel ( engineLoadDFF ( "Models/588.dff" ), 588 )]]

--[[function DownText (Type)
	if Type == "Show" then
		if isPedInVehicle (localPlayer) then
			local Vehicle = getPedOccupiedVehicle (localPlayer)
			local Model = getElementModel(Vehicle)
			if Model == 600 then
				Text1 = exports["[Titans]Text"]:addText("Press 'L-Shift' to Jump",0,206,184,nil,1)
			elseif Model == 582 then
				Text1 = exports["[Titans]Text"]:addText("Press 'L-Shift' to enable/disable fly",0,206,184,nil,1)
			elseif Model == 588 then
				Text1 = exports["[Titans]Text"]:addText("Press 'L-Shift' boost your vehicle",0,206,184,nil,1)
			end
		else
			exports["[Titans]Text"]:RemoveText(Text1)
			Text1 = nil
		end
	elseif Type == "Hide" then
		exports["[Titans]Text"]:RemoveText(Text1)
		Text1 = nil
	end
end]]


addEventHandler( "onClientKey", root, 
function(button,press) 
	if button == "lshift" then
		if not isPedDead (localPlayer)then
			if isPedInVehicle (localPlayer) then
				local Vehicle = getPedOccupiedVehicle (localPlayer)
				local Model = getElementModel(Vehicle)
				local Driver = getVehicleOccupant(Vehicle)
				if Driver == localPlayer then
					if Model == 600 and isPedOnGround (localPlayer) then
						triggerServerEvent ("[Titans]CoinsVehicle",localPlayer,"Jump",Vehicle)
						AirModeEnabled = false
						setWorldSpecialPropertyEnabled("aircars", false)
					elseif Model == 588 and isPedOnGround (localPlayer) and EnableBoost == true then
						triggerServerEvent ("[Titans]CoinsVehicle",localPlayer,"Boost",Vehicle)
						EnableBoost = false
						setTimer (function()
							EnableBoost = true
						end,5000,1)
						AirModeEnabled = false
						setWorldSpecialPropertyEnabled("aircars", false)
					elseif Model == 582 then
						if AirModeEnabled == true then
							AirModeEnabled = false
							setWorldSpecialPropertyEnabled("aircars", false)
						else
							AirModeEnabled = true
							setWorldSpecialPropertyEnabled("aircars", true)
						end
					--[[elseif Model == 550 then
						local Weapon = isVehicleHaveGuns(Vehicle)
						if Weapon then
							fireWeapon(Weapon)
						end]]
					else
						AirModeEnabled = false
						setWorldSpecialPropertyEnabled("aircars", false)
					end
				end
			end
		end
	end
end)

addEventHandler("onClientPreRender",root,
function()
	if getKeyState("lshift") then
		if not isPedDead (localPlayer)then
			if isPedInVehicle (localPlayer) then
				local Vehicle = getPedOccupiedVehicle (localPlayer)
				local Model = getElementModel(Vehicle)
				local Driver = getVehicleOccupant(Vehicle)
				if Driver == localPlayer then
					if Model == 550 then
						local Weapon = isVehicleHaveGuns(Vehicle)
						if Weapon then
							--local planeGun = (getElementData(localPlayer, "planeGun") or 0 )
							--if tonumber(planeGun) > 0 then
								--setElementData(localPlayer, "planeGun", (getElementData(localPlayer, "planeGun") or 0) - 5)
								triggerServerEvent("[Titans]CoinsVehicle",localPlayer,"Fire",Vehicle)
							--end
						end
					end
				end
			end
		end
	end
end)


addEvent("[Titans]CoinsVehicle",true)
addEventHandler("[Titans]CoinsVehicle",root,
function(Type,Data)
	if Type == "Show" or Type == "Hide" then
		--DownText(Type)
		if Type == "Hide" then
			AirModeEnabled = false
			setWorldSpecialPropertyEnabled("aircars", false)
		end
	elseif Type == "addWeapon" then
		local Dim = getElementDimension(Data)
		MinniGun = createWeapon("minigun",0,0,0)
		table.insert(WeaponsVehicle,{Data,MinniGun})
		attachElements(MinniGun,Data,0,0,1.7,0,10,90)
		setElementDimension(MinniGun,Dim)
	elseif Type == "removeWeapon" then
		local Index = getIndexFromVehicle(Data)
		if isElement(WeaponsVehicle[Index][2]) then
			destroyElement(WeaponsVehicle[Index][2] )
		end
		table.remove(WeaponsVehicle,Index)
	elseif Type == "Fire" then
		local Weapon = isVehicleHaveGuns(Data)
		fireWeapon(Weapon)
	end
end)