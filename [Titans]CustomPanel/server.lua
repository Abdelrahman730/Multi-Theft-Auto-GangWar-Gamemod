local BotsAccount = {
	["bebo1king"] = {
		-- Damar
		"ManOfHere",
		"BatManMeow",
		"MezoFeZO",
		"NastyGuy123",
		"Xx7AMODxX",
		"MeowMeOW",
		"MezooooFeZO",
		"SmallButBig",
	},
	["anoose112233"] = {
		"ManOfHere",
		"BatManMeow",
		"MezoFeZO",
		"NastyGuy123",
		"Xx7AMODxX",
		"MeowMeOW",
		"MezooooFeZO",
		"SmallButBig",
	},
}

function getBotsElement (AccountName)
	local Table = {}
	for i , v in pairs (BotsAccount[AccountName]) do
		local Account = getAccount(v)
		if Account then
			local player = getAccountPlayer(Account)
			if player then
				table.insert(Table,player)
			end
		end
	end
	return Table
end

function RGBToHex(red, green, blue, alpha)
	
	-- Make sure RGB values passed to this function are correct
	if( ( red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255 ) or ( alpha and ( alpha < 0 or alpha > 255 ) ) ) then
		return nil
	end

	-- Alpha check
	if alpha then
		return string.format("#%.2X%.2X%.2X%.2X", red, green, blue, alpha)
	else
		return string.format("#%.2X%.2X%.2X", red, green, blue)
	end

end

function TotalPlayersInVehicle (Vehicle)
	local counter = 0
	for seat, player in pairs(getVehicleOccupants(Vehicle)) do
		counter = counter + 1
	end
	return counter
end

addEvent("[Titans]CustomPanel",true)
addEventHandler("[Titans]CustomPanel",root,
function(Type,Data)
	if Type == "Refresh" then
		local Table = getBotsElement(getElementData(source,"Account") )
		if Table then
			triggerClientEvent(source,eventName,source,Type,Table)
		end
	elseif Type == "Say" then
		local Team = getPlayerTeam(Data[1])
		if Team then
			local r,g,b = getTeamColor(Team)
			outputChatBox(RGBToHex(r,g,b)..getPlayerName(Data[1])..": #ffffff"..Data[2],root,255,255,255,true  )
		end
	elseif Type == "WarpVehicle" then
		local Vehicle = getPedOccupiedVehicle(source)
		if Vehicle then
			local seats = getVehicleMaxPassengers ( Vehicle ) + 1
			local TotalPlayers = TotalPlayersInVehicle(Vehicle)
			--outputChatBox(TotalPlayers.." | "..seats)
			if TotalPlayers < seats then
				for i=1 , seats do
					if ( not getVehicleOccupant ( Vehicle, i ) ) then
						warpPedIntoVehicle(Data,Vehicle,i)
						--outputChatBox("Test")
						break
					end
				end
			else
				--outputChatBox("Test 2")
				if isPedInVehicle(Data) then
					removePedFromVehicle(Data)
				end
				local x,y,z = getElementPosition(source)
				setElementPosition(Data,x+5,y,z)
			end
		end
	end
end)













