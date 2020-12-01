DataBase = dbConnect("sqlite", "DailyMissions.db")
dbExec(DataBase, "CREATE TABLE IF NOT EXISTS Missions (Account, Days)")


local Missions = {
	[1] = {"Kill 30 Players",30}, -- Done
	[2] = {"Top 1 At Any Mission",1}, -- Done
	[3] = {"Kill 10 At Mission",10}, -- Done
	[4] = {"Kill 5 Players at Turf",5}, -- Done 
	[5] = {"Top 5 In 5 Missions",5}, -- Done
	[6] = {"Kill 40 Players",40}, -- Done
	[7] = {"Win 2 Duels",2}, 
	[8] = {"Stay Online for 2 Hours",2*60*60},
}


function getIndexFromNumber (Num)
	for i , v in pairs (Table) do
		--outputChatBox(Num.." | "..i.." | "..v)
		if Num == i then
			table.remove(Table,i)
			return i,v
		end
	end
end


function getNumberNotAtSelected ()
	local Num = math.random(1,#Table)
	local Index,Number = getIndexFromNumber(Num)
	return Number
end

function selectMissions ()
	Selected = {}
	Table = {}
	AccountsMission = {}
	for i=1, #Missions do
		table.insert(Table,i)
	end
	for i=1 , 5 do
		local Num = getNumberNotAtSelected()
		table.insert(Selected,Missions[Num])
	end
end
selectMissions()
DailyMissionTimer = setTimer(selectMissions,24*60*60*1000,0)

addEvent("[Titans]Times",true)
addEventHandler("[Titans]Times",root,
function (Type)
	if Type == "Refresh" then
		if ( isTimer(DailyMissionTimer) ) then
			local TimeLeft = getTimerDetails(DailyMissionTimer)
			triggerClientEvent(source,eventName,source,Type,{"Daily Mission",math.ceil( (TimeLeft or 0 )/1000)})
		end
	end
end)

addEvent("[Titans]DailyMission",true)
addEventHandler("[Titans]DailyMission",root,
function(Type,Data)
	if Type == "Refresh" then
		local AccountName = getElementData(source,"Account")
		local Data = (AccountsMission[AccountName] or {0,0,0,0,0,true,true,true,true,true} )
		local Days = (isAccountExist(AccountName) or 0 )
		triggerClientEvent(source,eventName,source,Type,{Selected,Data,Days})
	elseif Type == "Reward" then
		local AccountName = getElementData(source,"Account")
		local Days = (isAccountExist(AccountName) or 0 )
		if Days >= 5 then
			dbExec(DataBase, "UPDATE Missions SET Days = ? WHERE Account = ?", Days-5,AccountName)
			exports["[Titans]Donator"]:givePlayerVip(source,2*24*60*60,"Daily Mission")
			exports["guimessages"]:outputServer(source,"#7E7E7E[#FFFFFF Daily Mission #7E7E7E]#FFFFFF You have exchanged 5 Days of Mission To #35CC002 Days VIP #7E7E7E!",255,255,255)
		end
	end
end)


function getDataFromIndex (Index)
	for i , v in pairs (Missions) do
		if Index == i then
			return v[1],v[2]
		end
	end
end

function getSelectedIndexFromName (Name)
	for i , v in pairs (Selected) do
		if v[1] == Name then
			return i
		end
	end
end

function isAccountExist (AccountName)
	local Data = dbPoll(dbQuery(DataBase, "SELECT * FROM Missions WHERE Account = ?", AccountName), -1)
	local abc = false
	if #Data ~= 0 then
		for i, Data in ipairs (Data) do
			if Data["Account"] == AccountName then
				abc = Data["Days"]
				break
			end
		end
		if abc then
			return abc
		else
			return false
		end
	else 
		return false
	end
end

function isMissionFinished (AccountName)
	local Num = 5
	for i=6 , 10 do
		if AccountsMission[AccountName][i] == false then
			Num = Num -1
		end
	end
	return Num
end

function givePlayerDailyMissionProgress (player,Index,Amount)
	if player then
		if getElementType(player) == "player" then
			local AccountName = getElementData(player,"Account")
			if AccountName then
				local Name,ReqAmount = getDataFromIndex(Index)
				local SelectedIndex = getSelectedIndexFromName(Name)
				if SelectedIndex then
					local Data = (AccountsMission[AccountName])
					if Data then
						local CurrentAmount = (AccountsMission[AccountName][SelectedIndex] or 0 )
						AccountsMission[AccountName][SelectedIndex] = (CurrentAmount + Amount or Amount )
						if CurrentAmount+Amount >= ReqAmount and AccountsMission[AccountName][SelectedIndex+5] then
							exports["guimessages"]:outputServer(player,"#7E7E7E[#FFFFFF Daily Mission #7E7E7E]#FFFFFF You have finished a mission and Resived #35CC001 Game Coins #7E7E7E!",255,255,255)
							local GC  = (getElementData(player,"GameCoins") or 0 )
							setElementData(player,"GameCoins",GC + 1)
							AccountsMission[AccountName][SelectedIndex+5] = false
							if isMissionFinished(AccountName) == 0  then
								-- Give Dat DataBae
								local Days = isAccountExist(AccountName)
								if Days then
									dbExec(DataBase, "UPDATE Missions SET Days = ? WHERE Account = ?", Days+1,AccountName)
								else
									dbExec(DataBase, "INSERT INTO Missions VALUES(?, ?)",AccountName ,1)
								end
								exports["guimessages"]:outputServer(player,"#7E7E7E[#FFFFFF Daily Mission #7E7E7E]#FFFFFF You have finished the Mission of today #7E7E7E!",255,255,255)
							end
						end
					else
						AccountsMission[AccountName] = {0,0,0,0,0,true,true,true,true,true}
						AccountsMission[AccountName][SelectedIndex] = Amount
					end
				end
			end
		end
	end
end


-- 1 , 6

addEventHandler( "onPlayerWasted", getRootElement( ),
function(_,Killer)
	if Killer and source then
		if getElementType(source) == "player" and getElementType(Killer) == "player" then
			givePlayerDailyMissionProgress(Killer,1,1)
			givePlayerDailyMissionProgress(Killer,6,1)
		end
	end
end)

-- 8
setTimer(function()
	for i , v in pairs (getElementsByType("player") ) do
		local AccountName = getElementData(v,"Account")
		if AccountName then
			givePlayerDailyMissionProgress(v,8,60)
		end
	end
end,60*1000,0)



addCommandHandler("SDASDA",
function(player)
	for i=1, 8 do
		givePlayerDailyMissionProgress(player,i,10000)
	end
end)









