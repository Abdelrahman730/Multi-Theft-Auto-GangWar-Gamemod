local PanelData = {
	["Position"] = {0,0,3,0,0},
	["Control"] = {},
	["Team"] = "All",
	["State"] = "Closed",
	["Players"] = {},
}

function refreshControls(player)
	local Data = PanelData["Control"]
	local Data2 = getElementData(player,"inEvent")
	if #Data > 0 then
		if Data2 then
			-- Damage
			local Data2 = getElementData(player,"inEvent")
			if Data[6][2] == true then
				setElementData(player,"inEvent",{true,Data2[2]})
			else
				setElementData(player,"inEvent",{false,Data2[2]})
			end
			-- Weapons
			local Data2 = getElementData(player,"inEvent")
			if Data[7][2] == true then
				setElementData(player,"inEvent",{Data2[1],true})
				setPedWeaponSlot(player,0)
			else
				setElementData(player,"inEvent",{Data2[1],false})
			end
			-- Freez
			setElementFrozen(player,Data[4][2])
			setElementCollisionsEnabled(player,not(Data[5][2]))
		end
	end
end


function refreshPanelToAdmins ()
	for i, player in pairs (getElementsByType("player") ) do
		local Account = getElementData(player,"Account")
		if Account then
			if getElementData(player,"isPlayerStaff") then
				triggerClientEvent(player,"[Titans]Competions",player,"Refresh",PanelData)
			end
		end
	end
end

function getTeamPlayersTaple (TeamName)
	local Table = {}
	for i , v in pairs (getElementsByType("player") ) do
		local Team = getPlayerTeam(v)
		if Team then
			if getTeamName(Team) == TeamName or TeamName == "All" then
				table.insert(Table,v)
			end
		end
	end
	return Table
end

function getVehiclesInDimAndInt(Dim,Int)
	local Table = {}
	for i , v in pairs (getElementsByType("vehicle") ) do
		local Dim1 = getElementDimension(v)
		if Dim == Dim1 then
			local Int1 = getElementInterior(v)
			if Int == Int1 then
				table.insert(Table,v)
			end
		end
	end
	return Table
end


addEvent("[Titans]Competions",true)
addEventHandler("[Titans]Competions",root,
function(Type,Data)
	if Type == "RefreshPosition" then
		PanelData["Position"] = Data
		refreshPanelToAdmins()
	elseif Type == "StartEvent" then
		-- Data
		PanelData["Team"] = Data
		PanelData["State"] = "Started"
		--
		-- Team Players
		for i , v in pairs (getTeamPlayersTaple(Data)) do
			outputChatBox("#00A061[Event System]#6F6F6F Event has started type #00ff00/eventwarp #6F6F6Fto join",v,255,255,255,true)
		end
	elseif Type == "RefreshControls" then
		PanelData["Control"] = Data
		refreshPanelToAdmins()
		--if PanelData["State"] == "Started" then
			for i , v in pairs (PanelData["Players"]) do
				refreshControls(v)
			end
			local Dim,Int = PanelData["Position"][4],PanelData["Position"][5]
			for i , v in pairs (getVehiclesInDimAndInt(Dim,Int) ) do
				setElementFrozen(v,PanelData["Control"][1][2])
				if PanelData["Control"][2][2] then
					addVehicleUpgrade(v,1010)
				else
					removeVehicleUpgrade(v,1010)
				end
				setVehicleDamageProof(v,PanelData["Control"][3][2])
			end
		--end
	elseif Type == "CloseEvent" then
		PanelData["State"] = "Closed"
		outputChatBox("#00A061[Event System]#6F6F6F Event has been Closed",root,255,255,255,true)
	elseif Type == "CancelEevent" then
		PanelData["State"] = "Closed"
		for i , v in pairs (PanelData["Players"]) do
			setElementData(v,"inEvent",false)
			killPed(v)
		end
		PanelData["Players"] = {}
		outputChatBox("#00A061[Event System]#6F6F6F Event has been Canceled",root,255,255,255,true)
	elseif Type == "GiveMoney" then
		givePlayerMoney(Data[2],Data[1])
		outputChatBox("#00A061[Event System] #ffff00"..getPlayerName(source).." #6F6F6F has gived #00ff00$"..Data[1].."#6F6F6F to #ffff00"..getPlayerName(Data[2]),root,255,255,255,true)
	end
end)

addCommandHandler("EP",
function(player)
	local Account = getElementData(player,"Account")
	if Account then
		if getElementData(player,"isPlayerStaff") then
			triggerClientEvent(player,"[Titans]Competions",player,"Panel")
			triggerClientEvent(player,"[Titans]Competions",player,"Refresh",PanelData)
		end
	end
end)


addCommandHandler("eventwarp",
function(player)
	local Account = getElementData(player,"Account")
	if Account then
		if PanelData["State"] == "Started" then
			local Team = getPlayerTeam(player)
			if Team then
				if getTeamName(Team) == PanelData["Team"] or PanelData["Team"] == "All" then
					if exports["[Titans]AntiBugExports"]:checkPlayer(player,"[Event System]") then
						-- Enter
						local x,y,z,Dim,Int = unpack(PanelData["Position"] )
						setElementPosition(player,x,y,z)
						setElementDimension(player,Dim)
						setElementInterior(player,Int)
						setPedWeaponSlot(player,0)
						-- Data
						table.insert(PanelData["Players"],player)
						setElementData(player,"inEvent",{nil,nil})
						refreshPanelToAdmins()
						-- Controls
						refreshControls(player)
					end
				end
			end
		end
	end
end)


setTimer(function ()
	local Dim,Int = PanelData["Position"][4],PanelData["Position"][5]
	for i , v in pairs (PanelData["Players"]) do
		if v then
			if getElementDimension(v) ~= Dim or getElementInterior(v) ~= Int then
				setElementData(v,"inEvent",false)
				table.remove(PanelData["Players"],i)
			end
		else
			table.remove(PanelData["Players"],i)
		end
 	end
end,1000,0)


addEventHandler("onResourceStop", getResourceRootElement(getThisResource()  ),
function()
	for i , v in pairs (getElementsByType("player") ) do
		if getElementData(v,"inEvent") then
			setElementData(v,"inEvent",false)
		end
	end
end)










