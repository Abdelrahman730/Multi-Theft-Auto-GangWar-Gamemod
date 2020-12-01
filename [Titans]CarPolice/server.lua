markers = {
{1556.95557,-1608.03357,13.38281 -1},
{1569.57178, -1608.26794,13.38281 -1},
{1581.18384, -1608.42871,13.38281 -1},
{1587.38892 ,-1710.94507,5.89063 -1},
{1575.10901, -1711.10547,5.89063 -1},
{1558.94312 ,-1710.74255,5.89063 -1},
{1530.10681, -1684.03760,5.89063 -1},
  }


for i,v in ipairs (markers) do
	marker = createMarker(v[1], v[2], v[3], "cylinder",2, 0, 0, 255, 255)
end

veh = {}

addEvent ("getCaraaa", true)
addEventHandler ("getCaraaa", getRootElement(),
function(car)
    if veh[source] and isElement( veh[source] ) then destroyElement( veh[source] ) 
	veh[source] = nil 
	end
    local carID = getVehicleModelFromName (car)
    local x,y,z = getElementPosition(source)
    local carName = getVehicleNameFromModel (carID)
    veh[source] = createVehicle(carID, x,y,z ,0, 0,180)
    setVehicleColor(veh[source], 255, 255, 255)
    warpPedIntoVehicle(source, veh[source])    
end
)

addEventHandler ( "onPlayerQuit", getRootElement(),	
function ()
	if veh[source] and isElement( veh[source] ) then destroyElement( veh[source] ) 
	veh[source] = nil 
	end
end)
	
function markerHit (hitPlayer, matchingDimension)
	if getElementType(hitPlayer) == "player" and matchingDimension == true and not getPedOccupiedVehicle (hitPlayer) and  getPlayerTeam( hitPlayer ) and getTeamName( getPlayerTeam( hitPlayer ) ) == "Police" then
		if getElementType(hitPlayer) == "player" then
			triggerClientEvent ("openMeanaaa", hitPlayer)
		end
	end
end
addEventHandler ("onMarkerHit", resourceRoot, markerHit)

function markerLeave (hitPlayer, matchingDimension)
if getElementType(hitPlayer) == "player" then
   triggerClientEvent ("closeOpenMeanaaa", hitPlayer)
end
end
addEventHandler ("onMarkerLeave", resourceRoot, markerLeave)