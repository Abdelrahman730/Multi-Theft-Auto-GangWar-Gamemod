createTeam("Criminals", 255, 0, 0)
setTeamFriendlyFire(createTeam("Grove",   0, 500, 0   ), false)
setTeamFriendlyFire(createTeam("Vagos",   255, 200, 0 ), false)
setTeamFriendlyFire(createTeam("Ballas",   128, 0, 128), false)
--setTeamFriendlyFire(createTeam("Mafia",   154,205,50  ), false)
--setTeamFriendlyFire(createTeam("Russians",   160,82,45), false)
--setTeamFriendlyFire(createTeam("Triads",   104,104,104), false)
--setTeamFriendlyFire(createTeam("Rifa",    250,128,114 ), false)
--setTeamFriendlyFire(createTeam("Da Nang",    255,42,213 ), false)
--setTeamFriendlyFire(createTeam("Street",    250,128,0 ), false)
setTeamFriendlyFire(createTeam("Aztecas", 24, 198, 238), false)
setTeamFriendlyFire(createTeam("Medic",  24, 255, 255 ), false)
setTeamFriendlyFire(createTeam("Police",    0, 0, 255 ), false)

local DataBase = dbConnect( "sqlite", "Accounts.db" )
dbExec(DataBase, "CREATE TABLE IF NOT EXISTS Accounts ( AccountName, Password , Serial , Money , BankBalance , Level , Exp , Team_Skins)")
--dbExec(DataBase, "ALTER TABLE Accounts ADD Team_Skins DEFAULT "..0) 



--[[for i , v in pairs (getAccounts() ) do
	local AccountName = getAccountName(v)
	local Password = getAccountData(v,"Password")
	local Serial = (getAccountData(v,"ows") or "None" )
	local Money = (getAccountData(v,"Money") or 0 )
	local BankBalance = (getAccountData(v,"Bank") or 0 )
	local Level = (getAccountData(v,"Level") or 1 )
	local Exp = (getAccountData(v,"xp") or 0 )
	local Team_Skins = 0
	dbExec(DataBase, "INSERT INTO Accounts VALUES(?, ?, ? , ? , ? , ? , ? , ?)",AccountName,Password,Serial,Money,BankBalance,Level,Exp,Team_Skins)
end

local Data = dbPoll(dbQuery(DataBase, "SELECT * FROM Accounts"), -1)
local Money = 0
local Exp = 0
local  BankMoney = 0
local Level = 0
for i , v in pairs (Data) do
	Money = v["Money"] + Money
	Exp = v["Exp"] + Exp
	BankMoney = v["BankBalance"] + BankMoney
	Level = v["Level"] + Level
end
outputChatBox("Money : "..Money)
outputChatBox("Exp : "..Exp)
outputChatBox("Level : "..Level)
outputChatBox("BankBalance : "..BankMoney)
outputChatBox("Money : "..Money)]]

local TeamsSpawns = {
	["Criminals"] = {
		{1803.3000488281,-1651.9000244141,14.5,90},
      	{1310.1999511719,-853.79998779297,39.599998474121,90},
    		{2050.8999023438,-1913.1999511719,13.5,90},
    		{1352.1999511719,-1755.0999755859,13.39999961853,90},
    		{1518.8000488281,-1459.9000244141,9.5,90},
    		{1973.1999511719,-1284.5999755859,28.5,90},
            {1786.6999511719,-1421.4000244141,15.800000190735,90},
    		{1727,-1634.4000244141,20.200000762939,90},
    		{1427.8000488281,-1089.5999755859,17.60000038147,90},
    		{1841.5999755859,-1866.5,13.39999961853,90},
    		{1183.8000488281,-1258.8000488281,18.89999961853,90}
	},
	["Grove"] = {
		
  		{2510.8999023438,-1652.5,13.800000190735,90},
            {2486.5,-1646.3000488281,14.10000038147,90},		
    		{2495.1999511719,-1686.6999511719,13.5,90},
    		{2528.5,-1667.5,15.199999809265,90},
    		{2459.5,-1689.5,13.5,90},
	},
	["Vagos"] = {
		{2263.6999511719,-1095,42.599998474121,90},
    		{2280.6999511719,-1082.8000488281,47.700000762939,90},
    		{2276.5,-1101.5999755859,42.599998474121,90},
    		{2287.8999023438,-1106.5,38,90},
    		{2253.5,-1099.4000244141,41.599998474121,90},
	},
	["Ballas"] = {
		{2230.1000976563,-1283.5,25.39999961853,90},
    		{2215,-1314.5999755859,24,90},
    		{2229.8999023438,-1333,24,90},
    		{2243.3000488281,-1319.3000488281,24,90},
	},
	["Mafia"] = {
		{-1954,1339.6999511719,7.1999998092651},
    		{-1974.3000488281,1339.0999755859,7.1999998092651,90},
	
	},
	["Russians"] = {
		{-2099.8000488281,898.79998779297,76.699996948242,90},
    		{-2116.8999023438,926.70001220703,86.099998474121,90},
	},
	["Triads"] = {
		{-2025.9000244141,135.30000305176,28.799999237061,90},
    		{-2035.3000488281,170.10000610352,28.799999237061,90},
	},
	["Rifa"] = {
		{-1703.1999511719,1340.0999755859,7.1999998092651,90},
    		{-1689.5,1350.5,9.8000001907349,90},
	},
	["Da Nang"] = {
		{2006,691.40002441406,11.5,90},
    		{2075.6000976563,691.29998779297,11.39999961853,90},
    		{2050.1000976563,654.09997558594,11.5,90},
	},
	["Aztecas"] = {
		{1757.3000488281,-1894.1999511719,13.60000038147,90},
    		{1764.0999755859,-1930.0999755859,13.60000038147,90},
    		{1793.1999511719,-1935.0999755859,13.39999961853,90},
	},
	["Medic"] = {
		{1177.9000244141,-1323.8000488281,14.10000038147,90},
    		{1178.1999511719,-1338.8000488281,13.89999961853,90},
	},
	["Police"] = {
		{1552.5,-1675.6999511719,16.200000762939,90},
    		{1580.0999755859,-1635.4000244141,13.60000038147,90},
    		{1604.0999755859,-1618.5,13.5,90},
    		{1544,-1609.8000488281,13.39999961853,90},
    		{1549.4000244141,-1698.5,13.5,90},
    		{1550.8000488281,-1653.0999755859,13.60000038147,90},
    		
	},
}

function setAccountNewPassword(AccountName,Newpassword)
	dbExec(DataBase, "UPDATE Accounts SET Password = ? WHERE AccountName = ? ",Newpassword,AccountName )
end

function getTeamSpawnsNumbers (Team)
	local Index = 0
	for i , v in pairs (TeamsSpawns[Team] ) do
		Index = Index + 1
	end
	return Index
end

function isAccountExist (AccountName)
	local Data = dbPoll(dbQuery(DataBase, "SELECT AccountName FROM Accounts WHERE AccountName = ? ", AccountName), -1)
	local abc = false
	for i, Data in ipairs (Data) do
		if Data["AccountName"] == AccountName then
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



-- Special
--[[for i , v in pairs (getAccounts() ) do
	removeAccount(v)
end

local Datas = dbPoll(dbQuery(DataBase, "SELECT * FROM Accounts"), -1)
for i, v in ipairs (Datas) do
	local Account = getAccount(v["AccountName"])
	if not(Account) then
		addAccount (v["AccountName"],v["Password"],true)
	end
end]]





function isSerialHaveTwoAccounts (Serial)
	local Data = dbPoll(dbQuery(DataBase, "SELECT Serial FROM Accounts WHERE Serial = ? ", Serial), -1)
	local Accounts = 0
	for i, Data in ipairs (Data) do
		if Data["Serial"] == Serial then
			Accounts = Accounts + 1
		end
	end
	if Accounts <= 2 then
		return true
	else
		return false
	end
end

function getAccountsFromSerial (Serial)
	local Data = dbPoll(dbQuery(DataBase, "SELECT * FROM Accounts WHERE Serial = ? ", Serial), -1)
	local Accounts = {}
	for i, Data in ipairs (Data) do
		if Data["Serial"] == Serial then
			local secured = (getAccountData(getAccount(Data["AccountName"]) ,"secured") or "false")
			table.insert(Accounts,{Data["AccountName"],Data["Password"],Data["Money"],Data["BankBalance"],Data["Level"],secured})
		end
	end
	return Accounts
end

function getAccountTeams_Skins (Account)
	local Data = dbPoll(dbQuery(DataBase, "SELECT Team_Skins FROM Accounts WHERE AccountName = ? ", getAccountName(Account)), -1)
	local Accounts = {}
	for i, Data in ipairs (Data) do
		if Data["Team_Skins"] then
			return Data["Team_Skins"]
		end
	end
end

local Ranks = {
	{"Developer",0,135,255},
	{"Manager",255,200,0},
	{"Co-Manager",255,255,0},
	{"HeadAdmin",150,0,0},
	{"Admin",200,0,0},
	{"Trusted",0,200,0},
	{"LV5",150,0,150},
	{"LV4",150,0,150},
	{"LV3",150,0,150},
	{"LV2",150,0,150},
	{"LV1",150,0,150},
	{"Support",255,255,255},
}

function getAdminsOnline ()
	local Table = {}
	for i , v in pairs (getElementsByType("player") ) do
		local Account = getPlayerAccount(v)
		if not(isGuestAccount(Account) ) then
			if getElementData(v,"isPlayerStaff") then
				for Index , Data in pairs (Ranks) do
					if isObjectInACLGroup("user."..getAccountName(Account) ,aclGetGroup(Data[1])) then
						table.insert(Table,{getPlayerName(v),Data[1],Data[2],Data[3],Data[4]})
					end
				end
			end
		end
	end
	return Table
end

addEvent("GameMod",true)
addEventHandler("GameMod",root,
function(Type,Value1,Value2,Value3,Value4)
	if Type == "SetTeamAndSkin" then
		local VipSpawn = getElementData(source,"VipSpawn")
		local DeathMatchSpawn = getElementData(source,"DeathMatchSpawn")
		local Team = getTeamFromName(Value1[2])
		if VipSpawn then
			spawnPlayer(source,VipSpawn[1],VipSpawn[2],VipSpawn[3],0,Value1[1],0,0,Team)
			setPlayerNametagColor(source,false)
			unbindKey(source,"M","down",MedicMarker)
			takeWeapon(source,3)
			if Value1[2] == "Medic" then
				bindKey(source,"M","down",MedicMarker)
			elseif Value1[2] == "Police" then
				giveWeapon(source,3)
			end
		elseif DeathMatchSpawn then
			local x,y,z = unpack( DeathMatchSpawn[math.random(1,#DeathMatchSpawn) ] )
			spawnPlayer(source,x,y,z,0,Value1[1],0,2121,getTeamFromName("PVP"))
			setPlayerNametagColor(source,false)
			unbindKey(source,"M","down",MedicMarker)
			takeWeapon(source,3)
			if Value1[2] == "Medic" then
				bindKey(source,"M","down",MedicMarker)
			elseif Value1[2] == "Police" then
				giveWeapon(source,3)
			end
		else
			local RandomSpawn = math.random (1,getTeamSpawnsNumbers(Value1[2]) )
			spawnPlayer(source,TeamsSpawns[Value1[2]][RandomSpawn][1],TeamsSpawns[Value1[2]][RandomSpawn][2],TeamsSpawns[Value1[2]][RandomSpawn][3],TeamsSpawns[Value1[2]][RandomSpawn][4],Value1[1],0,0,Team)
			setPlayerNametagColor(source,false)
			unbindKey(source,"M","down",MedicMarker)
			takeWeapon(source,3)
			if Value1[2] == "Medic" then
				bindKey(source,"M","down",MedicMarker)
			elseif Value1[2] == "Police" then
				giveWeapon(source,3)
			end
		end
	elseif Type == "Register" then
		if not (Value1 == "") then
			if not (Value2 == "") then
				if not (Value3 == "") then
					if Value2 == Value3 then
						if isAccountExist(Value1) == false then
							local Serial = getPlayerSerial(source)
							if isSerialHaveTwoAccounts(Serial) then
								dbExec(DataBase, "INSERT INTO Accounts VALUES(?, ?, ? , ? , ? , ? , ? , ?)",Value1 , Value2 , Serial , 100000 , 0 , 1, 0,0)
								local AccountCreated = addAccount (Value1,Value2,true)
								setAccountData(AccountCreated,"secured","true")
								setAccountData(AccountCreated,"ows",Serial)
								--exports["[Titans]Alert"]:addAlert(source,"#00FF0CRegister","You have successfully registered , We hope you have a great time here.")
								triggerClientEvent(source,"GameMod",source,"RegError","تم تسجيل حساب  جديد")
								local Table = getAccountsFromSerial(Serial)
								triggerClientEvent(source,"GameMod",source,"Register",Table)
							else
								--exports["[Titans]Alert"]:addAlert(source,"ERROR / #FF0000Register","You have reached the max number of accounts which serial can have \n which is two if you want to delete one \n contact one of the admins")
								triggerClientEvent(source,"GameMod",source,"RegError","الحد الاقصي للحسابات هو 3")
							end
						else
							--exports["[Titans]Alert"]:addAlert(source,"ERROR / #FF0000Register","Username is already taken find other one , try to have a special username it helps some how.")
							triggerClientEvent(source,"GameMod",source,"RegError","اسم الحساب مستخدم من قبل")
						end
					else
						--exports["[Titans]Alert"]:addAlert(source,"ERROR / #FF0000Register","Make sure the password equal the Confirm password \n you can't even make the same password in the both edit bars \n try to find another password please.")
						triggerClientEvent(source,"GameMod",source,"RegError","كلمة السر لا توافق تأكيد كلمة السر")
					end
				else
					--exports["[Titans]Alert"]:addAlert(source,"ERROR / #FF0000Register","Make sure the password equal the Confirm password \n you can't even make the same password in the both edit bars \n try to find another password please.")
				end
			else
				--exports["[Titans]Alert"]:addAlert(source,"ERROR / #FF0000Register","Can't Figer out Password ? \n Try something special use your mind think think !\n Don't use spaces in password please.")
			end
		else
			--exports["[Titans]Alert"]:addAlert(source,"ERROR / #FF0000Register","Can't Figer out username ? \n Try something special use your mind think think !\n Don't use spaces in username please.")
		end
	elseif Type == "Login" then
		if not (Value1 == "") then
			if not (Value2 == "") then
				if isAccountExist(Value1) then
					local account = getAccount ( Value1, Value2 )
					if ( account ~= false ) then
						for i, p in ipairs (getElementsByType("player")) do
							if getElementData(p,"Account") == Value1 then
								if getPlayerSerial(source) ~= "F83AFCDCB02B46ABA3F339BCF7A0C9F4" then
									setElementData(source,"AccHack", true)
									--exports["[Titans]Alert"]:addAlert(source,"ERROR / #FF0000Login","Someone useing the current account \n contact any admin to report that \n other wise you will be punished")
									kickPlayer( source, "a nother player using this account right now", "يوجد لاعب يستخدم هذا الحساب حالياً" )
									break
								end
							end
						end
						if getElementData(source,"AccHack") then return end
						if source then
							logIn (source, account, tostring (Value2))
							--exports["[Titans]Alert"]:addAlert(source,"#00FF0CLogin","Welcome to the server boss \n We hope you have a great time here.")
							local Skin  = getAccountTeams_Skins(account)
							triggerClientEvent(source,"GameMod",source,"Login",(Skin or 0),{Value1,Value2} )
						end
					else	
						--exports["[Titans]Alert"]:addAlert(source,"ERROR / #FF0000Login","Are your sure your remmber the username and password correctly ? \n if not try to contact and admin or try to remmber it \n Shame on you !")
						triggerClientEvent(source,"GameMod",source,"LoginError","معلومات الحساب خطأ")
					end
				else
					--exports["[Titans]Alert"]:addAlert(source,"ERROR / #FF0000Login","This username isn't even made , are you sure you had registered? , \n if not Press on 'Register' button to create and Account . ")
					triggerClientEvent(source,"GameMod",source,"LoginError","معلومات الحساب خطأ")
				end
			else
				--exports["[Titans]Alert"]:addAlert(source,"ERROR / #FF0000Login","Can't Figer out Password ? \n Try something special use your mind think think !\n Don't use spaces in password please.")
			end
		else
			--exports["[Titans]Alert"]:addAlert(source,"ERROR / #FF0000Login","Can't Figer out username ? \n Try something special use your mind think think !\n Don't use spaces in username please.")
			triggerClientEvent(source,"GameMod",source,"LoginError","")
		end
	elseif Type == "SendAccounts" then
		local serial = getPlayerSerial(source)
		local Table = getAccountsFromSerial(serial)
		triggerClientEvent(source,"GameMod",source,Type,Table)
	elseif Type == "RefreshOnlineAdmins" then
		local Table = getAdminsOnline ()
		triggerClientEvent(source,"GameMod",source,Type,Table)
	elseif Type == "AccountSecured" then
		if Value1 ~= "" then
			setAccountData(getAccount(Value1) ,"secured",Value2)
			setAccountData(getAccount(Value1) ,"ows",getPlayerSerial(source) )
			--outputChatBox(Value1.." | "..Value2)
			if Value2 == "true" then
				triggerClientEvent(source,"GameMod",source,"MyAccountsError","Your Account ("..Value1..") is now secured")
			else
				triggerClientEvent(source,"GameMod",source,"MyAccountsError","Your Account ("..Value1..") is now unsecured")
			end
		end
	elseif Type == "RefreshAccountsDatas" then
		local Result = dbPoll(dbQuery(DataBase, "SELECT * FROM Accounts"), -1)
		triggerClientEvent(source,"[Titans]AccountsMaanger",source,"RefreshAccountsDatas",Result)
	elseif Type == "DeleteAccount" then
		dbExec(DataBase, "DELETE FROM Accounts WHERE AccountName = ? AND Serial = ?", Value1,Value2)
		local Account = getAccount(Value1)
		removeAccount(Account)
		triggerEvent("GameMod",source,"RefreshAccountsDatas")
		outputChatBox(Value1.." has been deleted",source,255,255,255)
	elseif Type == "EditAccount" then
		local AccountName = Value1
		local Serial = Value2
		local DataName = Value3
		local NewValue = Value4
		dbExec(DataBase, "UPDATE Accounts SET "..DataName.." = ? WHERE AccountName = ? AND Serial = ?",NewValue,AccountName,Serial )
		triggerEvent("GameMod",source,"RefreshAccountsDatas")
		outputChatBox(ValAccountNameue1.." has been updated",source,255,255,255)
	end
end)

function giveAccountMoney(AccountName,Amount)
	local data = dbPoll(dbQuery(DataBase, "SELECT * FROM Accounts WHERE AccountName = ? ", AccountName ), -1)
	for i, Data in ipairs (data) do
		if Data then
			dbExec(DataBase, "UPDATE Accounts SET Money = ? WHERE AccountName = ?", Data["Money"]+Amount , AccountName)
		end
	end
end

function SaveAccountDatas (player)
	local Account = getPlayerAccount(player)
	if Account and  not isGuestAccount (Account) then
		local Money = getPlayerMoney(player)
		local Exp = (getElementData(player,"Exp") or 0 )
		local Level = (getElementData(player,"Level") or 1 )
		local BankMoney = (getElementData(player,"BankMoney") or 0 )
		local TeamsSkin = (getElementData(player,"Teams/Skins") or 0 )
		local Serial = getPlayerSerial(player)
		dbExec(DataBase, "UPDATE Accounts SET Money = ?, BankBalance = ?  , Level = ? , Exp = ? , Team_Skins = ? , Serial = ?  WHERE AccountName = ?", Money , BankMoney , Level , Exp, TeamsSkin , Serial ,getAccountName(Account))
	end
end

function loadAccountData( player )
	local account = getPlayerAccount(player)
	if account and not isGuestAccount(account) then
		local data = dbPoll(dbQuery(DataBase, "SELECT * FROM Accounts WHERE AccountName = ? ", getAccountName(account)), -1)
		for i, Data in ipairs (data) do
			if Data then
				givePlayerMoney(player,Data["Money"])
				setElementData(player,"Level",Data["Level"])
				setElementData(player,"Exp",Data["Exp"])
				setElementData(player,"BankMoney",Data["BankBalance"])
				setElementData(player,"Teams/Skins",Data["Team_Skins"])
			end
		end
	end
end

addEventHandler("onPlayerQuit",root,
function()
	SaveAccountDatas(source)
end)

addEventHandler("onPlayerLogin",root,
function()
	loadAccountData(source)
end)

addEventHandler("onResourceStop", root,
function(res)
	if res == getThisResource() then
		for i , v in pairs (getElementsByType("player") ) do
			SaveAccountDatas(v)
			logOut(v)
		end
	end
end)

function onPlayerCommand(command)
    if command == "logout" or command == "login" or command == "chgmypass" or command == "register" or command == "msg" then
		cancelEvent()
	return end 
end
addEventHandler("onPlayerCommand", root, onPlayerCommand)


local healAmount = 200
local medicMarker = {}
local medicTimer = {}


function MedicMarker (player, cmd)
	local team = getPlayerTeam(player)
	local medicTeam = getTeamFromName("Medic")
	if team and medicTeam and team == medicTeam then
		if isElement(medicMarker[player]) then
			destroyElement(medicMarker[player])
			medicMarker[player] = nil
			setElementFrozen(player, false)
			toggleAllControls(player, true)
			exports["guimessages"]:outputServer(player, "Medic marker unloaded successfully.", 255, 255, 0)
		else
			if (getElementData(player, "WantLvl") or 0) > 0 then
				exports["guimessages"]:outputServer(player, "Your wanted level prevent you from doing this action.", 255, 0, 0)
			elseif (getElementData(player, "LegalStatus") or 0) == 2 then
				exports["guimessages"]:outputServer(player, "You can't do this action right now, because you're Jailed.", 255, 0, 0)
			elseif isPedDead(player) then
				exports["guimessages"]:outputServer(player, "only alives can do this action!", 255, 0, 0)
			elseif isPedInVehicle(player) then
				exports["guimessages"]:outputServer(player, "You must be on foot to do this action.", 255, 0, 0)
			elseif not isPedOnGround(player) then
				exports["guimessages"]:outputServer(player, "You must be on the ground to do this action.", 255, 0, 0)
			else
				setElementFrozen(player, true)
				toggleAllControls(player, false, true, false)
				if isTimer(medicTimer[player]) then killTimer(medicTimer[player]) end
				medicTimer[player] = setTimer(function(player)
					local x, y, z = getElementPosition(player)
					if isElement(medicMarker[player]) then destroyElement(medicMarker[player]) medicMarker[player] = nil end
					medicMarker[player] = createMarker(x, y, z-1, "cylinder", 2.2, 100, 100, 255, 125)
					setElementInterior(medicMarker[player], getElementInterior(player))
					setElementDimension(medicMarker[player], getElementDimension(player))
					exports["guimessages"]:outputServer(player, "Medic marker created successfully.", 0, 255, 0)
					exports["guimessages"]:outputServer(player, "Do '"..cmd.."' again to unload.", 100, 100, 255)
				end, 200, 1, player)
			end
		end
	end
end
addCommandHandler("medic",MedicMarker)

function eventCheck()
	if isElement(medicMarker[source]) then
		destroyElement(medicMarker[source])
		medicMarker[source] = nil
		setElementFrozen(source, false)
		toggleAllControls(source, true)
	end
end
addEventHandler("onPlayerQuit", root, eventCheck)
addEventHandler("onPlayerWasted", root, eventCheck)

setTimer(function()
	for heller, marker in pairs(medicMarker) do
		for i, helled in ipairs(getElementsWithinColShape(getElementColShape(marker), "player")) do
			if helled ~= heller then
				heal(helled, heller)
			end
		end
	end
end, 3000, 0)

function heal(helled, heller)
	local money = getPlayerMoney(helled)
	if (healAmount <= money) then
		local health = getElementHealth(helled)
		local maxHealth = getPlayerMaxHealth(helled) or 100
		if (health <= (maxHealth - 25)) then
			setElementHealth(helled, health + 25)
			payTheMoney(heller, helled)
		elseif (health <= (maxHealth - 5)) and (health > (maxHealth - 25)) and (health < maxHealth) then
			setElementHealth(helled, health + (maxHealth - health))
			payTheMoney(heller, helled)
		end
	end
end

function getPlayerMaxHealth(player)
	local currentHealth = math.ceil(getElementHealth(player))
	setElementHealth(player, 200)
	local MaxHealth = math.ceil(getElementHealth(player))
	setElementHealth(player, currentHealth)
	return MaxHealth
end

function payTheMoney(heller, helled)
	takePlayerMoney(helled,healAmount)
	givePlayerMoney(heller,healAmount)
	exports["guimessages"]:outputServer(heller, "You have earned $"..healAmount, 0, 255, 0)
	exports["guimessages"]:outputServer(helled, "You've paid $"..healAmount.." for medical services.", 255, 125, 0)
end

--[[local AddAccounts = {
	"ManOfHere",
	"BatManMeow",
	"MezoFeZO",
	"NastyGuy123",
	"Xx7AMODxX",
	"MeowMeOW",
	"MezooooFeZO",
	"SmallButBig",
}
for i , v in pairs (AddAccounts) do
	dbExec(DataBase, "INSERT INTO Accounts VALUES(?, ?, ? , ? , ? , ? , ? , ?)",v , "123456789" , "F23123123131312" , 100000 , 0 , 1, 0,0)
	addAccount (v,"123456789",true)
end]]]