local Objects = {}
local ObjectsData = {}
local Cols = {}
local Blips = {}
local Hats = {}
local Index = 0
local DataBase = dbConnect( "sqlite", "Donator.db" )
dbExec(DataBase, "CREATE TABLE IF NOT EXISTS Donators ( Giver, Date, Account, Rank, Expeire)")


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

local gWeekDays = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" }
function FormatDate(format, escaper, timestamp)
	Check("FormatDate", "string", format, "format", {"nil","string"}, escaper, "escaper", {"nil","string"}, timestamp, "timestamp")
	
	escaper = (escaper or "'"):sub(1, 1)
	local time = getRealTime(timestamp)
	local formattedDate = ""
	local escaped = false

	time.year = time.year + 1900
	time.month = time.month + 1
	
	local datetime = { d = ("%02d"):format(time.monthday), h = ("%02d"):format(time.hour), i = ("%02d"):format(time.minute), m = ("%02d"):format(time.month), s = ("%02d"):format(time.second), w = gWeekDays[time.weekday+1]:sub(1, 2), W = gWeekDays[time.weekday+1], y = tostring(time.year):sub(-2), Y = time.year }
	
	for char in format:gmatch(".") do
		if (char == escaper) then escaped = not escaped
		else formattedDate = formattedDate..(not escaped and datetime[char] or char) end
	end
	
	return formattedDate
end


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

addEvent("Donator",true)
addEventHandler("Donator",root,
function(Type,Value1,Value2,Value3,Value4,Value5,Value6)
	if Type == "BuyObject" then
		if Value1 and Value2 and Value3 and Value4 and source then
			if getPlayerMoney(source) >= Value3 then
				if getElementDimension(source) == 0 and getElementInterior(source) == 0 then
					takePlayerMoney(source,Value3)
					Objects[source] = createObject(Value1,Value4[1],Value4[2],Value4[3],0,0,Value4[4])
					table.insert (ObjectsData,{source,Objects[source],Value2,Value5,Value6,Value1})
					Index = Index + 1
					triggerClientEvent(root,"Donator.setObjectTexture",source,Objects[source],Value2,Value5)
					triggerClientEvent(source,"Donator.RefreshObjects",source,ObjectsData)
					if Value1 == 2892 then
						local x2, y2, z2 = getElementPosition(Objects[source]) 
						setElementPosition(Objects[source],x2,y2,z2-1)
						Cols[source] = createColSphere(x2, y2, z2, 3) 
						setElementParent(Cols[source],Objects[source]) 
					end
					setTimer(function(Items,source)
						if Items then
							destroyElement(Items)
							table.remove(ObjectsData,Index)
							Index = Index - 1
							triggerClientEvent(source,"Donator.RefreshObjects",source,ObjectsData)
						end
					end,5*60*1000,1,Objects[source],source)
				end
			end
		end
	elseif Type == "DeleteObject" then
		destroyElement(Value1)
		table.remove(ObjectsData,Value2)
		Index = Index - 1
		triggerClientEvent(source,"Donator.RefreshObjects",source,ObjectsData)
	elseif Type == "ChangePosition" then
		setElementPosition(Value1,Value2[1],Value2[2],Value2[3])
		setElementRotation(Value1,0,0,Value2[4])
	elseif Type == "Give DL" then
		if Value1 and Value2 then
			local Data = dbPoll(dbQuery(DataBase, "SELECT Account FROM Donators WHERE Account = ? ", Value2), -1)
			local abc = false
			for i, Data in ipairs (Data) do
				if Data["Account"] == Value2 then
					abc = true
					break
				end
			end
			if abc then
				exports["guimessages"]:outputServer(source,"This player already have a rank remove it first",150,0,0)
			else
				dbExec(DataBase, "INSERT INTO Donators VALUES(?, ?, ?, ? , ?)",getAccountName(getPlayerAccount(source) ) ,FormatDate("d/m/Y , h:i:s"),Value2,Value1,60*60*24*tonumber(Value3) )
				local result = dbPoll( dbQuery( DataBase, "SELECT * FROM Donators" ), -1 )
				triggerClientEvent(source,"RefreshDonatorsPanel",source,result)
			end
		end
	elseif Type == "Remove DL" then
		if Value1 then
			local Result  = dbPoll(dbQuery(DataBase, "SELECT * FROM Donators WHERE Account=?", Value1 ), -1)
			if (not (#Result == 0)) then
				dbExec(DataBase, "DELETE FROM Donators WHERE Account = ?", Value1)
				local result = dbPoll( dbQuery( DataBase, "SELECT * FROM Donators" ), -1 )
				triggerClientEvent(source,"RefreshDonatorsPanel",source,result)
			end
		end
	elseif Type == "SetSkin" then
		setElementModel(source,Value1)
	elseif Type == "putHat" then
		if not Hats[source] then
			Hats[source] = createObject(Value1,0,0,0)
			exports["bone_attach"]:attachElementToBone (Hats[source],source,Value2[1],Value2[2],Value2[3],Value2[4],Value3[1],Value3[2],Value3[3])
		else
			destroyElement(Hats[source])
			Hats[source] = createObject(Value1,0,0,0)
			exports["bone_attach"]:attachElementToBone (Hats[source],source,Value2[1],Value2[2],Value2[3],Value2[4],Value3[1],Value3[2],Value3[3])
		end
	elseif Type == "removeHat" then
		if Hats[source] then
			destroyElement(Hats[source])
		end
	elseif Type == "JetPack" then
		if source then
			local Account = getPlayerAccount(source)
			if Account and not isGuestAccount(Account) then
				local AccountName = getAccountName(Account)
				local Result  = dbPoll(dbQuery(DataBase, "SELECT * FROM Donators WHERE Account=?", AccountName ), -1)
				if (not (#Result == 0)) then
					local Rank = Result[1]["Rank"]
					if Rank == "Donator Level 3" then
						local Team = getPlayerTeam(source)
						if Team and getTeamName(Team) ~= "Staff" then
							if doesPedHaveJetPack (source) then           
								removePedJetPack (source)
							else
								givePedJetPack (source)
							end
						end
					end
				end
			end
		end
	end
end)


addEventHandler("onColShapeHit",root, 
function (player) 
	if player and getElementType(player) == "player" then 
		if source == Cols[player] then
			if isPedInVehicle(player) then 
				local WL = (getElementData(player, "WantLvl") or 0)
				if WL > 2 then
					local pveh = getPedOccupiedVehicle(player)      
					setVehicleWheelStates(pveh,1,1,1,1)
				end
			end
		end 
	end 
end) 


function OpenDonatorPanel (player)
	if player then
		local account = getPlayerAccount(player)
		if account and not isGuestAccount(account) then
			if getAccountName(account) == "bebo1king" or getAccountName(account) == "zm2001" or getAccountName(account) == "anoose112233" then
			--if isObjectInACLGroup ( "user." .. getAccountName(account) , aclGetGroup ( "Manager" ) ) then
				triggerClientEvent(player,"DonatorPanel",player,1)
				local result = dbPoll( dbQuery( DataBase, "SELECT * FROM Donators" ), -1 )
				triggerClientEvent(player,"RefreshDonatorsPanel",player,result)
			end
		end
	end
end
addCommandHandler("ds",OpenDonatorPanel)

function getVipTimeLeft(AccountName)
	local Result  = dbPoll(dbQuery(DataBase, "SELECT * FROM Donators WHERE Account=?", AccountName ), -1)
	if (not (#Result == 0)) then
		local Expeire = Result[1]["Expeire"]
		if Expeire and Expeire ~= "Perment" then
			return Expeire
		else
			return "Perment"
		end
	end
end

--[[function VipPanel(player)
	if player then
		local Account = getPlayerAccount(player)
		if Account and not isGuestAccount(Account) then
			local AccountName = getAccountName(Account)
			local Result  = dbPoll(dbQuery(DataBase, "SELECT * FROM Donators WHERE Account=?", AccountName ), -1)
			if (not (#Result == 0)) then
				local Rank = Result[1]["Rank"]
				if Rank == "VIP" or Rank == "Donator Level 1" or Rank == "Donator Level 2" or Rank == "Donator Level 3" then
					triggerClientEvent(player,"DonatorPanel",player,5,getVipTimeLeft(AccountName) )
				end
			else
				triggerClientEvent(player,"DonatorPanel",player,6)
			end
		end
	end
end
addCommandHandler("vip",VipPanel)]]





function PlaceObjectPanel(player)
	if player then
		local Account = getPlayerAccount(player)
		if Account and not isGuestAccount(Account) then
			local AccountName = getAccountName(Account)
			local Result  = dbPoll(dbQuery(DataBase, "SELECT * FROM Donators WHERE Account=?", AccountName ), -1)
			if (not (#Result == 0)) then
				local Rank = Result[1]["Rank"]
				if Rank == "Donator Level 3" then
					triggerClientEvent(player,"DonatorPanel",player,2)
				end
			end
		end
	end
end
addCommandHandler("po",PlaceObjectPanel)

function VipSkins(player)
	if player then
		local Account = getPlayerAccount(player)
		if Account and not isGuestAccount(Account) then
			local AccountName = getAccountName(Account)
			local Result  = dbPoll(dbQuery(DataBase, "SELECT * FROM Donators WHERE Account=?", AccountName ), -1)
			if (not (#Result == 0)) then
				local Rank = Result[1]["Rank"]
				if Rank == "VIP" or Rank == "Donator Level 1" or Rank == "Donator Level 2" or Rank == "Donator Level 3" then
					triggerClientEvent(player,"DonatorPanel",player,3)
				end
			end
		end
	end
end
addCommandHandler("vipskins",VipSkins)

function Viphats(player)
	if player then
		local Account = getPlayerAccount(player)
		if Account and not isGuestAccount(Account) then
			local AccountName = getAccountName(Account)
			local Result  = dbPoll(dbQuery(DataBase, "SELECT * FROM Donators WHERE Account=?", AccountName ), -1)
			if (not (#Result == 0)) then
				local Rank = Result[1]["Rank"]
				if Rank == "VIP" or Rank == "Donator Level 1" or Rank == "Donator Level 2" or Rank == "Donator Level 3" then
					triggerClientEvent(player,"DonatorPanel",player,4)
				end
			end
		end
	end
end
addCommandHandler("viphats",Viphats)

function VipWalkingStyle(player)
	if player then
		local Account = getPlayerAccount(player)
		if Account and not isGuestAccount(Account) then
			local AccountName = getAccountName(Account)
			local Result  = dbPoll(dbQuery(DataBase, "SELECT * FROM Donators WHERE Account=?", AccountName ), -1)
			if (not (#Result == 0)) then
				local Rank = Result[1]["Rank"]
				if Rank == "VIP" or Rank == "Donator Level 1" or Rank == "Donator Level 2" or Rank == "Donator Level 3" then
					triggerClientEvent(player,"showPanel",player)
				end
			end
		end
	end
end
addCommandHandler("vipwalk",VipWalkingStyle)

addEventHandler("onPlayerSpawn",root,
function()
	if source then
		local Account = getPlayerAccount(source)
		if Account and not isGuestAccount(Account) then
			local AccountName = getAccountName(Account)
			local Result  = dbPoll(dbQuery(DataBase, "SELECT * FROM Donators WHERE Account=?", AccountName ), -1)
			if (not (#Result == 0)) then
				local Rank = Result[1]["Rank"]
				if Rank == "VIP" or Rank == "Donator Level 1" or Rank == "Donator Level 2" or Rank == "Donator Level 3" then
					setTimer (function(player)
						setPedArmor(player,100)
					end,5000,1,source)
				end
			end
		end
	end
end)

--[[function Teleport(player)
	if player then
		local Account = getPlayerAccount(player)
		if Account and not isGuestAccount(Account) then
			local AccountName = getAccountName(Account)
			local Result  = dbPoll(dbQuery(DataBase, "SELECT * FROM Donators WHERE Account=?", AccountName ), -1)
			if (not (#Result == 0)) then
				local Rank = Result[1]["Rank"]
				if Rank == "Donator Level 2" or Rank == "Donator Level 3" then
					triggerClientEvent(player,"DonatorTeleport",player)
				end
			end
		end
	end
end
addCommandHandler("teleport",Teleport)]]

function isPlayerVIP (player)
	if player then
		local Account = getPlayerAccount(player)
		if Account and not isGuestAccount(Account) then
			local AccountName = getAccountName(Account)
			local Result  = dbPoll(dbQuery(DataBase, "SELECT * FROM Donators WHERE Account=?", AccountName ), -1)
			if (not (#Result == 0)) then
				local Rank = Result[1]["Rank"]
				if Rank == "VIP" or Rank == "Donator Level 1" or Rank == "Donator Level 2" or Rank == "Donator Level 3" then
					--if getElementData(player,"HideTag") == false then
						return Rank
					--else
					--	return false
					--end
				else
					return false
				end
			else
				return false
			end
		else 
			return false
		end
	end
end

local Vehicles = {}

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

addEvent("VIP",true)
addEventHandler("VIP",root,
function(Type,Kind)
	if Type == "VIPInfo" then
		if isPlayerVIP(source) then
			local Account = getPlayerAccount(source)
			local AccountName = getAccountName(Account)
			local Time = getVipTimeLeft(AccountName)
			triggerClientEvent(source,"[Titans]F1",source,Type,{"Activated",Time})
			--outputChatBox("1")
		else
			--outputChatBox("2")
			triggerClientEvent(source,"[Titans]F1",source,Type,{"Non-Activated",0})
		end
	elseif isPlayerVIP(source) then
		if getElementDimension(source) == 0 and getElementInterior(source) == 0 then
			if Type == "Health" then
				setPedStat(source,24,1000)
				setElementHealth(source,200)
			elseif Type == "SetBounty" then
				SetBounty(source,"hitme",50000)
			elseif Type == "Armor" then
				setPedArmor(source,100)
			elseif Type == "Skins" then
				triggerClientEvent(source,"DonatorPanel",source,3)
			elseif Type == "WalkStyle" then
				triggerClientEvent(source,"showPanel",source)
			elseif Type == "Spawn" then
				triggerClientEvent(source,"VipSpawnManager",source)
			elseif Type == "HideTag" then
				setElementData(source,"HideTag",Kind)
			elseif Type == "Hats" then	
				triggerClientEvent(source,"DonatorPanel",source,4)
			elseif Type == "Turbo" then
				local Vehicle = getPedOccupiedVehicle(source)
				local MaxSpeed = getVehicleHandlingProperty(Vehicle,"maxVelocity")
				local Speed = getVehicleHandlingProperty (Vehicle,"engineAcceleration")
				for i , v in pairs (ZclassHanlding) do
					if v[1] == "maxVelocity" or v[1] == "engineAcceleration" then
						setVehicleHandling (Vehicle,v[1],v[2])
					end
				end
				setTimer (function (Vehicle,MaxSpeed,Speed)
					setVehicleHandling(Vehicle,"maxVelocity",MaxSpeed)
					setVehicleHandling(Vehicle,"engineAcceleration",Speed)
				end,15*1000,1,Vehicle,MaxSpeed,Speed)
			elseif Type == "Launcher" then
				setElementData(source,"Launcher",2)
			elseif Type == "Fix" then
				local Vehicle = getPedOccupiedVehicle(source)
				fixVehicle(Vehicle)
			elseif Type == "Maverick" then
				if Vehicles[source] then
					destroyElement(Vehicles[source])
				end
				local x,y,z = getElementPosition(source)
				Vehicles[source] = createVehicle(487,x,y,z)
				warpPedIntoVehicle(source,Vehicles[source])
				local r, g, b = math.random( 255 ), math.random( 255 ), math.random( 255 )
				setVehicleColor( Vehicles[source], r, g, b )
			elseif Type == "Hydra" then
				if Vehicles[source] then
					destroyElement(Vehicles[source])
				end
				local x,y,z = getElementPosition(source)
				Vehicles[source] = createVehicle(520,x,y,z)
				warpPedIntoVehicle(source,Vehicles[source])
				local r, g, b = math.random( 255 ), math.random( 255 ), math.random( 255 )
				setVehicleColor( Vehicles[source], r, g, b )
			elseif Type == "Car" then
				if Vehicles[source] then
					destroyElement(Vehicles[source])
				end
				local x,y,z = getElementPosition(source)
				Vehicles[source] = createVehicle(470,x,y,z)
				warpPedIntoVehicle(source,Vehicles[source])
				local r, g, b = math.random( 255 ), math.random( 255 ), math.random( 255 )
				setVehicleColor( Vehicles[source], r, g, b )
				for i , v in pairs (ZclassHanlding) do
					if v[1] == "maxVelocity" or v[1] == "engineAcceleration" then
						var = tonumber(v[2]*2)
					else
						var = v[2]
					end
					setVehicleHandling (Vehicles[source],v[1],var)
				end
			elseif Type == "ArabicName" then
				setPlayerNametagText(source,Kind)
			end
			exports["guimessages"]:outputServer(source,"#F3FF00[VIP]#00ff00 You have used "..Type.." #F3FF00!!")
		else
			exports["guimessages"]:outputServer(source,"#F3FF00[VIP] #ff0000 you can't open vip panel here",255,255,255)
		end
	else
		exports["guimessages"]:outputServer(source,"#F3FF00[VIP] #ff0000 You must buy VIP first",255,255,255)
	end
end)






function SetBounty(player,cmd,Amount)
	if player and Amount then
		local Account = getPlayerAccount(player)
		if Account and not isGuestAccount(Account) then
			local AccountName = getAccountName(Account)
			local Result  = dbPoll(dbQuery(DataBase, "SELECT * FROM Donators WHERE Account=?", AccountName ), -1)
			if (not (#Result == 0)) then
				local Rank = Result[1]["Rank"]
				if Rank == "VIP" or Rank == "Donator Level 1" or Rank == "Donator Level 2" or Rank == "Donator Level 3" then
					if tonumber (Amount) ~= nil then
						if getPlayerMoney(player) >= tonumber(Amount) then
							if ( tonumber(Amount) >= 50000 ) then
								if getElementData(player,"Bounty") then return end
								takePlayerMoney(player,tonumber(Amount))
								exports["guimessages"]:outputServer(root,getPlayerName(player).." #ff0000 has set bounty on killing him $"..convertNumber(tonumber(Amount)),0,150,0)
								setElementData(player,"Bounty",tonumber(Amount))
								Blips[player] = createBlipAttachedTo(player,37)
								local x, y, z = getElementPosition(player)
								triggerClientEvent(root,"BountyOfPlayer",player,1,tonumber(Amount))
							end
						end
					end
				end
			end
		end
	end
end
addCommandHandler("hitme",SetBounty)

addEventHandler("onPlayerWasted",root,
function(nothing, killer)
	if killer and source then
		local Amount = getElementData(source,"Bounty")
		if Amount then
			givePlayerMoney(killer,Amount)
			setElementData(source,"Bounty",nil)
			exports["guimessages"]:outputServer(root,getPlayerName(killer).." #ff0000 has killed "..getPlayerName(source).." and won $"..convertNumber(Amount),0,150,0)
			destroyElement(Blips[source])
			triggerClientEvent(root,"BountyOfPlayer",source,2)
		end
	end
end)


addEventHandler("onPlayerQuit",root,
function()
	if Blips[source] then
		destroyElement(Blips[source])
		triggerClientEvent(root,"BountyOfPlayer",source,2)
	end
	if Hats[source] then
		destroyElement(Hats[source])
	end
	if Vehicles[source] then
		destroyElement(Vehicles[source])
	end
end)

function secondsToTimeDesc( seconds )
	if seconds then
		local results = {}
		local sec = ( seconds %60 )
		local min = math.floor ( ( seconds % 3600 ) /60 )
		local hou = math.floor ( ( seconds % 86400 ) /3600 )
		local day = math.floor ( seconds /86400 )
		
		if day > 0 then table.insert( results, day .. ( day == 1 and " day" or " days" ) ) end
		if hou > 0 then table.insert( results, hou .. ( hou == 1 and " hour" or " hours" ) ) end
		if min > 0 then table.insert( results, min .. ( min == 1 and " minute" or " minutes" ) ) end
		if sec > 0 then table.insert( results, sec .. ( sec == 1 and " second" or " seconds" ) ) end
		
		return string.reverse ( table.concat ( results, ", " ):reverse():gsub(" ,", " dna ", 1 ) )
	end
	return ""
end

function DecreaseTime ()
	for i , v in pairs (getAccounts() ) do
		local AccountName = getAccountName(v)
		if AccountName then
			local Result  = dbPoll(dbQuery(DataBase, "SELECT * FROM Donators WHERE Account=?", AccountName ), -1)
			if (not (#Result == 0)) then
				local Expeire = Result[1]["Expeire"]
				if Expeire and Expeire ~= "Perment" then
					dbExec( DataBase, "UPDATE Donators SET Expeire = ? WHERE Account = ?", Expeire - (1*60*60), AccountName )
					if Expeire <= 0 then
						dbExec(DataBase, "DELETE FROM Donators WHERE Account = ?", AccountName)
					end
				end
			end
		end
	end
end
setTimer(DecreaseTime,1*60*60*1000,0) -- 


function givePlayerVip (player,Time,From)
	if isElement(player) and getElementType(player) == "player" then
		Account = getPlayerAccount(player)
	elseif type(player) == "string" then
		Account = getAccount(player)
	end
	if not From then
		From = "Daily Gift"
	end
	if Account and not (isGuestAccount(Account) ) then
		local AccountName = getAccountName(Account)
		local Data = dbPoll(dbQuery(DataBase, "SELECT * FROM Donators WHERE Account = ? ", getAccountName(Account) ), -1)
		local abc = false
		for i, Data in ipairs (Data) do
			if Data["Account"] == getAccountName(Account) then
				abc = true
				break
			end
		end
		if abc == false then
			dbExec(DataBase, "INSERT INTO Donators VALUES(?, ?, ?, ? , ?)",From,FormatDate("d/m/Y , h:i:s"),AccountName,"VIP",Time )
		else
			local Expeire = Data[1]["Expeire"]
			dbExec( DataBase, "UPDATE Donators SET Expeire = ? WHERE Account = ?", Expeire + (Time), AccountName )
		end
	end
end


function ShareVipToServer (player,_,Hours)
	local Account = getPlayerAccount(player)
	if not isGuestAccount(Account) then
		if getAccountName(Account) == "bebo1king" or  getAccountName(Account) == "zm2001" or getAccountName(Account) == "anoose112233" then
			exports["guimessages"]:outputServer(root,"#7E7E7E[4Sky] #FFF141"..getPlayerName(player).." #00FFAEWanted to express his love to server community , so he just said",255,255,255 )
			exports["guimessages"]:outputServer(root,"#00FFAEWhat about sending #F3FF00VIP to all , so he did it",255,255,255 )
			exports["guimessages"]:outputServer(root,"#7E7E7E[4Sky] #00FFAEYou all have eanred Free #F3FF00VIP for "..Hours.." Hours !!!",255,255,255 )
			for i , v in pairs (getElementsByType("player")) do
				if getElementData(v,"Account") then
					givePlayerVip(v,tonumber(Hours)*60*60,"TWZ3")
				end
			end
		end
	end
end
addCommandHandler("giveAllVip",ShareVipToServer)


--[[function HealAllNearbyPlayersInGroup ()
	for i , player in pairs (getElementsByType("player") ) do
		local Account = getPlayerAccount(player)
		if Account and not isGuestAccount(Account) then
			local AccountName = getAccountName(Account)
			local Result  = dbPoll(dbQuery(DataBase, "SELECT * FROM Donators WHERE Account=?", AccountName ), -1)
			if (not (#Result == 0)) then
				local Rank = Result[1]["Rank"]
				if Rank == "Donator Level 1" or Rank == "Donator Level 2" or Rank == "Donator Level 3" then
					for i , v in pairs (getElementsByType("player") ) do
						local x,y,z = getElementPosition(v)
						local x1,y1,z1 = getElementPosition(player)
						local DonatorGroup = getElementData(player,"Group")
						local PlayerGroup = getElementData(v,"Group")
						local Dist = getDistanceBetweenPoints3D(x,y,z,x1,y1,z1)
						if Dist < 20 then
							if DonatorGroup and PlayerGroup then							
								if DonatorGroup == PlayerGroup then
									local Health = getElementHealth(v)
									local DonatorHealth = getElementHealth(player)
									setElementHealth(v,Health + 2 )
									setElementHealth(player,DonatorHealth + 4 )
								end
							end
						end
					end
				end
			end
		end
	end
end
setTimer(HealAllNearbyPlayersInGroup,10*1000,0)]]













