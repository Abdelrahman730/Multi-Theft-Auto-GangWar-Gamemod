local CustomVehicles = {
	["600"]= 1,
	["582"]= 2,
	["580"]= 3,
	["588"]= 4,
	["550"]= 5,
}


function getVehicleHandlingProperty ( element, property )
    if isElement ( element ) and getElementType ( element ) == "vehicle" and type ( property ) == "string" then
        local handlingTable = getVehicleHandling ( element )
        local value = handlingTable[property]
		return value
    end
end

local ZclassHanlding = {}
local GetDataVehicle = createVehicle(411,0,0,3)
local Data = getVehicleHandling(GetDataVehicle)

for i , v in pairs (Data) do
	table.insert(ZclassHanlding,{i,v})
end
destroyElement(GetDataVehicle)

setTimer(function ()
	for i , v in pairs (getElementsByType("vehicle") ) do
		if getElementModel(v) == 550 then
			setVehicleApplity(v,getElementModel(v) )
		end
	end
end,1500,1)


function setVehicleApplity (Vehicles,ID)
	Type = CustomVehicles[tostring(ID)]
	if Type then
		for i , v in pairs (ZclassHanlding) do
			setVehicleHandling (Vehicles,v[1],v[2])
		end
		if Type == 3 then
			setVehicleDamageProof(Vehicles,true)
		elseif Type == 5 then
			triggerClientEvent(root,"[Titans]CoinsVehicle",root,"addWeapon",Vehicles)
		end
	end
end

addEvent("[Titans]CoinsVehicle",true)
addEventHandler("[Titans]CoinsVehicle",root,
function(Type,Vehicle)
	if Type == "Boost" then
		local x,y,z = getElementVelocity(Vehicle)
		setElementVelocity(Vehicle,x*2,y*2,z)
	elseif Type == "Jump" then
		local speedx, speedy, speedz = getElementVelocity (Vehicle)
		setElementVelocity (Vehicle,speedx,speedy,0.3)
	elseif Type == "Fire" then
		triggerClientEvent(root,eventName,root,Type,Vehicle)
	end
end)


function CheckVehicle (vehicle)
	if eventName == "onElementDestroy" then
		if getElementType(source) == "vehicle" then
			local Model = getElementModel(source)
			if Model == 550 then
				triggerClientEvent(root,"[Titans]CoinsVehicle",root,"removeWeapon",source)
			end
			vehicle = source
			source = getVehicleOccupant ( vehicle )
			if isElement(source) and getElementType(source) == "player" then
				triggerClientEvent(source,"[Titans]CoinsVehicle",source,"Hide")
			end
		end
	elseif eventName == "onPlayerVehicleEnter" then
		if getElementModel(vehicle) == 580 then
			setVehicleDamageProof(vehicle,true)
		end
		triggerClientEvent(source,"[Titans]CoinsVehicle",source,"Show")
	elseif eventName == "onPlayerVehicleExit" then
		triggerClientEvent(source,"[Titans]CoinsVehicle",source,"Hide")
	elseif eventName == "onPlayerWasted" then
		triggerClientEvent(source,"[Titans]CoinsVehicle",source,"Hide")
	end
end
addEventHandler("onPlayerVehicleEnter",root,CheckVehicle)
addEventHandler("onPlayerVehicleExit",root,CheckVehicle)
addEventHandler("onElementDestroy",root,CheckVehicle)
addEventHandler("onPlayerWasted",root,CheckVehicle)