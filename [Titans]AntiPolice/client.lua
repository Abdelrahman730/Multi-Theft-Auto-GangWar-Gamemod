

function handleVehicleDamage(attacker, weapon, loss, x, y, z, tyre)
	local Driver = getVehicleOccupant ( source )
	if Driver and attacker and getElementType(Driver) == "player" and getElementType(attacker) == "player" then
		if (getTeamName(getPlayerTeam(Driver)) == "Police" and getTeamName(getPlayerTeam(attacker)) == "Police") or ((getTeamName(getPlayerTeam(Driver)) ~= "Police" and getPlayerWantedLevel(Driver) < 3 ) and getTeamName(getPlayerTeam(attacker)) == "Police") then
			cancelEvent()
		--[[elseif ((getTeamName(getPlayerTeam(attacker)) == "Police" and getPlayerWantedLevel(Driver) < 6 ) and getTeamName(getPlayerTeam(Driver)) ~= "Police") then
			triggerServerEvent("setWantLevel", Driver, 6)]]
		end
    end
end
addEventHandler("onClientVehicleDamage", root, handleVehicleDamage)


function stopMinigunDamage ( attacker, weapon, bodypart )
	if source and attacker and getElementType(attacker) == "vehicle"   then
		local Driver = getVehicleOccupant ( attacker )
		if getTeamName(getPlayerTeam(Driver)) == "Police" then
			if  getTeamName(getPlayerTeam(source)) ~= "Police" and getPlayerWantedLevel(source) < 3  then
				cancelEvent()
			end
		elseif getTeamName(getPlayerTeam(Driver)) ~= "Police" then
			if getTeamName(getPlayerTeam(source)) == "Police" then
				if getPlayerWantedLevel(Driver) < 3 then
					triggerServerEvent("setWantLevel", Driver, 6)
				end
			end
		end
	end
end
addEventHandler ( "onClientPlayerDamage", getLocalPlayer(), stopMinigunDamage )

function cancelDeath()
	cancelEvent()
end
addEventHandler("onClientPlayerHeliKilled", getLocalPlayer(), cancelDeath)