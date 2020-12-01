--setElementPosition(getPlayerFromName("BeBo1"),-17.8,569.599,900)
local MissionGates = {}
addEventHandler("onResourceStart",getResourceRootElement(getThisResource()),
function()
local Objects = getElementsByType("object", getResourceRootElement(getThisResource()))
for i , v in pairs (Objects) do
	local Model = getElementModel(v)
	if Model == 980 then
		local x,y,z = getElementPosition(v)
		table.insert(MissionGates,{v,x,y,z})
	end
end
end)

--[[local theDoor1 = createObject (980,1636.69,-1202.19,533.2,0,0,0)
local theDoor2 = createObject (980,1740.1999,-1330.9,533.7,0,0,0)
setElementDimension(theDoor1,200)
setElementDimension(theDoor2,200)
setElementInterior(theDoor1,3)
setElementInterior(theDoor2,3)]]

function ClanWarDoor(Type)
	for i , v in pairs (MissionGates) do
		local Obj,x,y,z = unpack(v)
		if Type == "Open" then
			moveObject(Obj, 1000, x,y,z+15)
		else
			moveObject(Obj, 1000, x,y,z)
		end
	end
end


TopKiller = {}
TopKill = {}
function showMissionResult()
end



setElementData(root,"ClansWar",false)
for i,v in ipairs(getElementsByType("player")) do
setElementData(v,"WJoin",false)
setElementData(v, "InCW", false)
end

-- setElementData(root,"ClansWar",{false begin true start, group1, group2, team1, team2, money, MaxP1, MaxP2}) 
-- setElementData(playerSource,"WJoin",{in war,groupN})

addEvent("GettheGroups", true)
addEventHandler("GettheGroups",root,
function()
triggerClientEvent(source, "GetGroups", source, exports["Group"]:getGroups())
end)

addEvent("openDoors", true)
addEventHandler("openDoors",root,
function()
--[[local x,y,z = getElementPosition(theDoor1)
local x1,y1,z1 = getElementPosition(theDoor2)
moveObject(theDoor1, 3000, x,y,z-10)
moveObject(theDoor2, 3000, x1,y1,z1-10)]]
ClanWarDoor("Open")
end)

addEvent("GetthePlayers", true)
addEventHandler("GetthePlayers",root,
function()
local players1,NumP1 = getTeam1Players()
local players2,NumP2 = getTeam2Players()
triggerClientEvent(source, "GetPlayers", source, players1, players2)
end)

addEvent("GettheMembersOnline1", true)
addEventHandler("GettheMembersOnline1",root,
function(group)
triggerClientEvent(source, "GetMembersOnline1", source, exports["Group"]:getGroupOnlineMember(group))
end)

addEvent("GettheMembersOnline2", true)
addEventHandler("GettheMembersOnline2",root,
function(group)
triggerClientEvent(source, "GetMembersOnline2", source, exports["Group"]:getGroupOnlineMember(group))
end)

addEvent("WJoinData", true)
addEventHandler("WJoinData",root,
function(groupN)
if getElementData(source,"WJoin") == false then
setElementData(source,"WJoin",{false,groupN})
else
setElementData(source,"WJoin",false)
end
end)

Groups = { 
"Developer",
"Manager",
"Co-Manager",
"HeadAdmin", 
"Admin", 
} 

addCommandHandler("cwar",
function(thePlayer)
	local clanwar = getElementData(root,"ClansWar") or false
	local accName = getAccountName ( getPlayerAccount ( thePlayer ) ) 
	for i, v in ipairs ( Groups ) do
		if isObjectInACLGroup ( "user."..accName, aclGetGroup ( v ) ) then		
			if clanwar == false or clanwar[1] == false then
				triggerClientEvent(thePlayer, "showSW", thePlayer)
			else
				triggerClientEvent(thePlayer, "showCW", thePlayer)
			end
		end
	end
end)
TopKill = {}
addEventHandler("onPlayerDamage",root,
function(attacker, weapon, bodypart, loss)
	if attacker and getElementData(attacker, "InCW") then
		local Team = getPlayerTeam(attacker)
		local OtherTeam = getPlayerTeam(source)      
		if getTeamName(Team) ~= getTeamName(OtherTeam) then
			local TheDamage = math.ceil(loss)
			TopKill[attacker] = (TopKill[attacker] or 0) + TheDamage
		end
	end
end)

addEventHandler ( "onPlayerQuit", getRootElement(), 
function()
	local CWar = getElementData(root,"ClansWar")
	local WJoin = getElementData(source,"WJoin")
	if CWar and WJoin and WJoin[1] == true then
		setElementData(source,"WJoin", false)
		setElementData(source,"InCW",false)
		refreshMatch()
	end
end)

addEventHandler ( "onPlayerWasted", getRootElement(), 
function(_,attaker)
local CWar = getElementData(root,"ClansWar")
local WJoin = getElementData(source,"WJoin")
	if CWar and WJoin and WJoin[1] == true then
		setElementData(source,"WJoin",{false,WJoin[2]})
		TopKiller[attaker] = (TopKiller[attaker] or 0) + 1
		exports["guimessages"]:outputServer(root, "#A4A4A4[#FFFF00Clan Wars#A4A4A4] #FF0000"..getPlayerName(attaker).."#A4A4A4(#FFFF00"..TopKiller[attaker].."#A4A4A4) Has Kill #FF0000"..getPlayerName(source).."#A4A4A4(#FFFF00"..(TopKiller[source] or 0).."#A4A4A4)", 255, 255, 0)
		-- exports["[Titans]Notification"]:noticeServer(root,2,getPlayerName(attaker).."("..(TopKiller[attaker] or 0)..") killed "..getPlayerName(source).."("..(TopKiller[source] or 0)..")",0,0,0)
		setElementData(source,"InCW",false)
	end
	refreshMatch()
end)

function refreshMatch()
	local CWar = getElementData(root,"ClansWar")
	if CWar and CWar[1] == true then
		if not stat then
			stat = true
			setTimer(
			function()
				local players1, number1 = getTeam1Players()
				local players2, number2 = getTeam2Players()
				local CWar = getElementData(root,"ClansWar")
				if number1 == 0 and number2 == 0 then
					NoWinner()
					showMissionResult()
				elseif number1 == 0 and number2 > 0 then
					ClanWin(CWar[3])
					showMissionResult()
				elseif number1 > 0 and number2 == 0 then
					ClanWin(CWar[2])
					showMissionResult()
				end
				stat = false
			end,5000,1)
		end
	end
end

function ClanWin(groupName)
local CWar = getElementData(root,"ClansWar")
exports["guimessages"]:outputServer(root, "#A4A4A4[#FFFF00Clan Wars#A4A4A4] #FF0000"..groupName.."#A4A4A4 Won This Match", 255, 255, 0)
-- exports["[Titans]Notification"]:noticeServer(root,2,groupName.." had Won This Round",0,0,0)
exports["Group"]:giveGroupMoney(groupName,tonumber(CWar[6]))
exports["Group"]:giveGroupPoint(groupName,tonumber(CWar[9]))
triggerEvent("EndWar", root)
end

function NoWinner()
exports["guimessages"]:outputServer(root, "#A4A4A4[#FFFF00Clan Wars#A4A4A4] There is no Winner This Match", 255, 255, 0)
triggerEvent("EndWar", root)
end



function getTeam1Players()
local Team1Players = {}
local Team1PlayersN = 0
local CWar = getElementData(root,"ClansWar")
	for i,v in ipairs(getElementsByType("player")) do
		local WJoin = getElementData(v,"WJoin")
		if WJoin and (WJoin[1] == true) and (CWar[2] == getElementData(v,"Group")) then
			table.insert(Team1Players,v)
			Team1PlayersN = Team1PlayersN +1
		end
	end
	return Team1Players,Team1PlayersN
end

function getTeam2Players()
local Team2Players = {}
local Team2PlayersN = 0
local CWar = getElementData(root,"ClansWar")
	for i,v in ipairs(getElementsByType("player")) do
		local WJoin = getElementData(v,"WJoin")
		if WJoin and (WJoin[1] == true) and (CWar[3] == getElementData(v,"Group")) then
			table.insert(Team2Players,v)
			Team2PlayersN = Team2PlayersN +1
		end
	end
	return Team2Players,Team2PlayersN
end



addCommandHandler("wjoin",
function(playerSource)
local CWar = getElementData(root,"ClansWar")
local WJoin = getElementData(playerSource,"WJoin")
local players1,NumP1 = getTeam1Players()
local players2,NumP2 = getTeam2Players()
if CWar and CWar[1] == false and WJoin and (not isPedInVehicle(playerSource)) then
	if WJoin[1] == false then
		if WJoin[2] == 1 or WJoin[2] == CWar[2] then
			if CWar[2] == getElementData(playerSource,"Group") and NumP1 < tonumber(CWar[7])  then
				setElementPosition(playerSource, 347,475,441.2)
				setElementInterior ( playerSource, 0)
				setElementDimension ( playerSource, 200)
				setElementData(playerSource,"WJoin",{true,WJoin[2]})
				setPlayerTeam(playerSource,CWar[4])
				setPedStat(playerSource, 24, 1000)
				setPedArmor (playerSource, 100)
				setElementHealth(playerSource,200)
				setElementData(playerSource,"InCW",true)
			end
		elseif WJoin[2] == 2 or WJoin[2] == CWar[3] then
			if CWar[3] == getElementData(playerSource,"Group") and NumP2 < tonumber(CWar[8])  then
				setElementPosition(playerSource, -69,463.7,441.19)
				setElementInterior ( playerSource, 0)
				setElementDimension ( playerSource, 200)
				setElementData(playerSource,"WJoin",{true,WJoin[2]})
				setPlayerTeam(playerSource,CWar[5])
				setPedStat(playerSource, 24, 1000)
				setPedArmor (playerSource, 100)
				setElementHealth(playerSource,200)
				setElementData(playerSource,"InCW",true)
			end
		end
	end
end
end)

addEvent("BeginWar", true)
addEventHandler("BeginWar",root,
function(group1,group2,money,maxp1,maxp2,point)
if not getElementData(root,"ClansWar") then
	local Team1 = createTeam ("[Clan Wars]"..group1,255,255,0) 
	setTeamFriendlyFire (Team1,false)
	local Team2 = createTeam ("[Clan Wars]"..group2,0,255,255)
	setTeamFriendlyFire (Team2,false)	
	setElementData(root,"ClansWar",{false, group1,group2,Team1,Team2,money,maxp1,maxp2,point})
	for i,v in ipairs(getElementsByType("player")) do
	local WJoin = getElementData(v,"WJoin")
		if WJoin then
			outputChatBox ( "#A4A4A4[#FFFF00Clan Wars#A4A4A4] Write 'wjoin' In F8 To Join To Clan Wars", v, 255, 0, 0, true )
		end
	end
end
end)

addEvent("StartWar", true)
addEventHandler("StartWar",root,
function()
local data = getElementData(root,"ClansWar")
if data then
	TopKill = {}
	TopKiller = {} 
	setElementData(root,"ClansWar",{true,data[2],data[3],data[4],data[5],data[6],data[7],data[8],data[9]})
	exports["guimessages"]:outputServer(root, "#A4A4A4[#FFFF00Clan Wars#A4A4A4] The War Start Between #FF0000"..data[2].."#A4A4A4 and #FF0000"..data[3], 255, 255, 0)
	for i,v in ipairs(getElementsByType("player")) do
		local WJoin = getElementData(v,"WJoin")
		if WJoin and WJoin[1] == true then
			triggerClientEvent(v, "CountDown", v,5)
		end
	end
end
end)

addEvent("EndWar", true)
addEventHandler("EndWar",root,
function()
local CWar = getElementData(root,"ClansWar")
destroyElement(CWar[4])
destroyElement(CWar[5])
setElementData(root,"ClansWar",false)
	for i,v in ipairs(getElementsByType("player")) do
		local WJoin = getElementData(v,"WJoin")
		if WJoin and WJoin[1] == true then
			setElementData(v,"WJoin",false)
			setElementHealth(v,0)
			ClanWarDoor()
		end
	end
end)


addEvent("SlapPlayer", true)
addEventHandler("SlapPlayer",root,
function(PlayerName)
local thePlayer = getPlayerFromName(PlayerName)
setElementHealth(thePlayer,0)
end)



