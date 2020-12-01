DataBase = dbConnect("sqlite", "Chests.db")
dbExec(DataBase, "CREATE TABLE IF NOT EXISTS Chests (Account, ChestName , Amount)")
dbExec(DataBase, "CREATE TABLE IF NOT EXISTS Keys (Account, Amount)")
local Kills = {}

local Chests = {
	{"Lightning Chest"},
	{"Legendary Chest"},
	{"Epic Chest"},
	{"Super Magical Chest"},
	{"Giant Chest"},
	{"Magical Chest"},
	{"Golden Chest"},
	{"Silver Chest"},
	{"Crown Chest"},
	{"Wooden Chest"},
}

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


function ChestTrigData (Type,Table,ChestName,ReqKeys)
	if Type == "Reward" and source then
		local Account = getPlayerAccount(source)
		if not (isGuestAccount(Account) ) then
			local AccountName = getAccountName(Account)
			local Amount = (getAmountOfChest(AccountName,ChestName) or 0 )
			local KeysAmount = (getAmountOfKeys(AccountName) or 0 )
			if Amount >= 1 then
				if KeysAmount >= tonumber(ReqKeys) then
					dbExec(DataBase, "UPDATE Keys SET Amount = ? WHERE Account = ?", KeysAmount-ReqKeys,AccountName)
					--local LuckNum = math.random(1,3)
					--if LuckNum == 1 then
						if Table[3] == "Best" then
							if string.find(Table[1],"Criminals") then
								triggerEvent("addPointToAccount",source,getAccountName(Account),"Criminals",Table[2] )
							elseif string.find(Table[1],"Police") then
								triggerEvent("addPointToAccount",source,getAccountName(Account),"Police",Table[2] )
							end
						elseif Table[3] == "Game Coins" then
							local GC = (getElementData(source,"GameCoins") or 0 )
							setElementData(source,"GameCoins",GC + Table[2])
						elseif Table[3] == "Money" then
							givePlayerMoney(source,Table[2])
						elseif Table[3] == "Exp" then
							local Exp = (getElementData(source,"Exp") or 0 )
							setElementData(source,"Exp",Exp + Table[2])
						elseif Table[3] == "Weapon" then
							if string.find(Table[1],"Rocket") then
								giveWeapon(source,36,Table[2],true)
							elseif string.find(Table[1],"Grenade") then
								giveWeapon(source,16,Table[2],true)
							end
						elseif Table[3] == "Launcher" then
							local Launcher = (getElementData(source,"Launcher") or 0 )
							setElementData(source,"Launcher",Launcher + Table[2])
						elseif Table[3] == "VIP" then
							exports["[Titans]Donator"]:givePlayerVip(source,Table[2],"Chest")
						elseif Table[3] == "Key" then
							giveAccounKeys(AccountName,Table[2])
						elseif Table[3] == "Chest" then
							for i=1 , Table[2] do
								giveAccountChest(AccountName,"Random",1)
							end
						elseif Table[3] == "Hour" then
							local CurrentTime = (getElementData(source,"Online Time") or 0 )
							setElementData(source,"Online Time",CurrentTime + (Table[2]*1000) )
						elseif Table[3] == "Vehicle" then
							--exports["[Titans]Vehicles-System"]:giveAccountVehicle(AccountName,Table[2])
							local r1, g1, b1, r2, g2, b2 = math.random(1,255) , math.random(1,255) , math.random(1,255) , math.random(1,255) , math.random(1,255) , math.random(1,255)
							triggerEvent("onBuyNewVehicle",source,Table[2],0,r1,g1,b1,r2,g2,b2,"Me")
						end
						if Table[3] == "VIP" or Table[3] == "Hour" then
							PrizeMessage = "("..secondsToTimeDesc(Table[2])..")"
						elseif Table[3] == "Vehicle" then
							PrizeMessage = ""
						else
							PrizeMessage = "("..convertNumber(Table[2])..")"
						end
						exports["guimessages"]:outputServer(source,"#00ACCF[Chests System] #00ff00You have won #ffff00  "..Table[1].." "..PrizeMessage.." #00ff00, Congratulations .",255,255,255)
						outputChatBox("#00ACCF[Chests System]#ffff00 "..getPlayerName(source).." #00ff00 had won #ffff00"..Table[1].." "..PrizeMessage.." #00ff00 From #00ffff"..ChestName.."#00ff00.",root,255,255,255,true)
						dbExec(DataBase, "UPDATE Chests SET Amount = ? WHERE Account = ? AND ChestName = ? ", Amount-1,AccountName,ChestName )
					--else
					--	exports["guimessages"]:outputServer(source,"#00ACCF[Chests System] #ff0000You have used the wrong keys .",255,255,255)
					--end
				end
				ChestTrigData("Refresh",source)
			end
		end
	elseif Type == "Refresh" then
		if Table then
			source = Table
		end
		local Account = getPlayerAccount(source)
		if not(isGuestAccount(Account)) then
			local AccountName = getAccountName(Account)
			local ChestsData = dbPoll(dbQuery(DataBase, "SELECT * FROM Chests WHERE Account = ?", AccountName), -1)
			local KeysData = dbPoll(dbQuery(DataBase, "SELECT * FROM Keys WHERE Account = ?", AccountName), -1)
			triggerClientEvent(source,eventName,source,Type,ChestsData,KeysData )
		end
	end
end
addEvent("[Titans]Chest",true)
addEventHandler("[Titans]Chest",root,ChestTrigData)

function getAmountOfChest(AccountName,ChestName)
	local Data = dbPoll(dbQuery(DataBase, "SELECT * FROM Chests WHERE Account = ? AND ChestName = ? ", AccountName,ChestName), -1)
	for i, Data in ipairs (Data) do
		if Data["Account"] == AccountName and Data["ChestName"] == ChestName then
			return Data["Amount"]
		end
	end
end

function getAmountOfKeys(AccountName)
	local Data = dbPoll(dbQuery(DataBase, "SELECT * FROM Keys WHERE Account = ?", AccountName), -1)
	for i, Data in ipairs (Data) do
		if Data["Account"] == AccountName then
			return Data["Amount"]
		end
	end
end

function isAccountExist (AccountName,ChestName)
	local Data = dbPoll(dbQuery(DataBase, "SELECT * FROM Chests WHERE Account = ? AND ChestName = ? ", AccountName,ChestName), -1)
	local abc = false
	for i, Data in ipairs (Data) do
		if Data["Account"] == AccountName and Data["ChestName"] == ChestName then
			abc = true
			break
		end
	end
	if abc then
		return true
	else
		return false
	end
end

function isAccountExist2 (AccountName)
	local Data = dbPoll(dbQuery(DataBase, "SELECT Account FROM Keys WHERE Account = ? ", AccountName), -1)
	local abc = false
	for i, Data in ipairs (Data) do
		if Data["Account"] == AccountName then
			abc = true
			break
		end
	end
	if abc then
		return true
	else
		return false
	end
end

function giveAccountChest(AccountName,ChestName,Ammount)
	if ChestName == "Random" then
		ChestName = Chests[math.random(1,#Chests)][1]
	end
	if AccountName then
		if isAccountExist(AccountName,ChestName) then
			local data = dbPoll(dbQuery(DataBase, "SELECT * FROM Chests WHERE Account = ? AND ChestName = ? ", AccountName,ChestName), -1)
			for i, Data in ipairs (data) do
				if Data then
					dbExec(DataBase, "UPDATE Chests SET Amount = ? WHERE Account = ? AND ChestName = ? ", Data["Amount"]+Ammount,AccountName,ChestName )
				end
			end
		else
			dbExec(DataBase, "INSERT INTO Chests VALUES(?, ?, ?)",AccountName ,ChestName,Ammount )
		end
	end
end

function giveAccounKeys(AccountName,Ammount)
	if AccountName then
		if isAccountExist2(AccountName) then
			local data = dbPoll(dbQuery(DataBase, "SELECT * FROM Keys WHERE Account = ?", AccountName), -1)
			for i, Data in ipairs (data) do
				if Data then
					dbExec(DataBase, "UPDATE Keys SET Amount = ? WHERE Account = ?", Data["Amount"]+Ammount,AccountName)
					local player = getAccount(AccountName)
				end
			end
		else
			dbExec(DataBase, "INSERT INTO Keys VALUES(?, ?)",AccountName,Ammount )
		end
	end
end




--giveAccounKeys("bebo1king",10)
--giveAccountChest("bebo1king",Chests[math.random(1,#Chests)][1],1)

function GiveChestOrKey (player,CommandName,Type,AccountName,Amount,ChestIndex)
	local Account = getPlayerAccount(player)
	if not isGuestAccount(Account) then
		if isObjectInACLGroup ("user."..getAccountName(Account) , aclGetGroup ( "Manager" ) ) then
			local AccountTakeGcPlayer = getAccount(AccountName)
			if AccountTakeGcPlayer then
				local TakeGcPlayer = getAccountPlayer(AccountTakeGcPlayer)
				local Amount = tonumber(Amount) 
				if Type == "Chest" then
					if tonumber(ChestIndex) then
						local ChestIndex = tonumber(ChestIndex)
						if ChestIndex <= #Chests then
							if TakeGcPlayer then
								exports["guimessages"]:outputServer(TakeGcPlayer,"#00AC9A[Chest System] #00ff00 you where given "..Chests[ChestIndex][1].." ("..Amount..") by "..getPlayerName(player),255,255,255 )
								exports["guimessages"]:outputServer(player,"#00AC9A[Chest System] #00ff00 you gived "..Chests[ChestIndex][1].." ("..Amount..") to "..getPlayerName(TakeGcPlayer),255,255,255 )
							end
							giveAccountChest(AccountName,Chests[ChestIndex][1],Amount)
						end
					end
				elseif Type == "Key" then
					if TakeGcPlayer then
						exports["guimessages"]:outputServer(TakeGcPlayer,"#00AC9A[Chest System] #00ff00 you where given Keys ("..Amount..") by "..getPlayerName(player),255,255,255 )
						exports["guimessages"]:outputServer(player,"#00AC9A[Chest System] #00ff00 you gived Keys ("..Amount..") to "..getPlayerName(TakeGcPlayer),255,255,255 )
					end
					giveAccounKeys(AccountName,Amount)
				end
			end
		end
	end
end
addCommandHandler("Chest",GiveChestOrKey)

function refreshKeys ()
	for i , v in pairs (getElementsByType("player") ) do
		local Account = getPlayerAccount(v)
		if not(isGuestAccount(Account) ) then
			local AccountName = getAccountName(Account)
			if AccountName then
				if isAccountExist2(AccountName) then
					local data = dbPoll(dbQuery(DataBase, "SELECT * FROM Keys WHERE Account = ?", AccountName), -1)
					for i, Data in ipairs (data) do
						if Data then
							setElementData(v,"Keys",Data["Amount"])
						end
					end
				else
					setElementData(v,"Keys",0)
				end
			end
		end
	end
end
setTimer(refreshKeys,5*1000,0)

refreshKeys ()



local KillsGift = 100
addEventHandler("onPlayerWasted",root,
function(_,Killer)
	if Killer and source and source ~= Killer then
		if getElementType(Killer) == "player" then
			local Account = getPlayerAccount(Killer)
			if not (isGuestAccount(Account) ) then
				local AccountName = getAccountName(Account)
				Kills[AccountName] = (Kills[AccountName] or 0 ) + 1
				if Kills[AccountName] >= KillsGift then
					local LuckyNumber = math.random(1,2)
					Kills[AccountName] = Kills[AccountName] - KillsGift
					if LuckyNumber == 1 then
						local ChestName = Chests[math.random(4,#Chests)][1]
						exports["guimessages"]:outputServer(root,"#00AC9A[Chest System] #ffff00 "..getPlayerName(Killer).." #00ff00 Had resived #00ffff"..ChestName.." (1)#00ff00 For Killing "..KillsGift.." Players .",255,255,255 )
						giveAccountChest(AccountName,ChestName,1)
					end
				end
			end
		end
	end
end)


function getRandomActivePlayer ()
	local Players = {}
	for i, v in pairs (getElementsByType("player") ) do
		local Account = getPlayerAccount(v)
		if not (isGuestAccount(Account) ) then
			table.insert(Players,v)
		end
	end
	local player = math.random(1,#Players)
	return Players[player]
end


function RandomGift  ()
	local player = getRandomActivePlayer()
	local AccountName = getAccountName ( getPlayerAccount(player)     ) 
	local ChestName = Chests[math.random(6,#Chests)][1]
	
	exports["guimessages"]:outputServer(root,"#00AC9A[Chest System] #ffff00 "..getPlayerName(player).." #00ff00 Had earned #00ffff"..ChestName.." (1)#00ff00 And $50,000",255,255,255 )
	
	giveAccountChest(AccountName,ChestName,1)
	givePlayerMoney(player,50000)
end
setTimer(RandomGift,5*60*60*1000,0)
RandomGift()



















