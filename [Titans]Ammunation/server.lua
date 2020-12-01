createBlip(2400, -1982, 0, 6,2, 255, 0, 0, 255, 255, 600 )
createBlip(1369, -1280, 0, 6,2, 255, 0, 0, 255, 255, 600 )
createBlip(2546, 2085, 0, 6,2, 255, 0, 0, 255, 255, 600 )
createBlip(2159, 943, 0, 6,2, 255, 0, 0, 255, 255, 600 )
createBlip(777, 1871, 0, 6,2, 255, 0, 0, 255, 255, 600 )
createBlip(-2625, 208, 0, 6,2, 255, 0, 0, 255, 255, 600 )
createBlip(-2093, -2464, 0, 6,2, 255, 0, 0, 255, 255, 600 )
createBlip(2333, 61, 0, 6,2, 255, 0, 0, 255, 255, 600 )
createBlip(242, -178, 0, 6,2, 255, 0, 0, 255, 255, 600 )
createBlip(-315, 829, 0, 6,2, 255, 0, 0, 255, 255, 600 )
addEvent("BuyWeapon", true)
addEventHandler("BuyWeapon", root,
function(Cost, CompatAmmo, SawnOffAmmo,ShoutgunAmmo , M4Ammo, SniperAmmo, AkAmmo, PistolAmmo, DeagleAmmo, TecAmmo ,  Mp5Ammo, GrenadaAmmo, LauncherAmmo) 
	if getPlayerMoney(source) >= tonumber(Cost) then
		if getPlayerPing(source) <= 300 then
			takePlayerMoney(source, Cost)
			if CompatAmmo[1] > 0 then giveWeapon(source, CompatAmmo[2], CompatAmmo[1]) end
			if SawnOffAmmo[1] > 0 then giveWeapon(source, SawnOffAmmo[2], SawnOffAmmo[1]) end
			--if RiflesAmmo[1] > 0 then giveWeapon(source, RiflesAmmo[2], RiflesAmmo[1]) end
			if ShoutgunAmmo[1] > 0 then giveWeapon(source, ShoutgunAmmo[2], ShoutgunAmmo[1]) end
			if M4Ammo[1] > 0 then giveWeapon(source, M4Ammo[2], M4Ammo[1]) end
			if SniperAmmo[1] > 0 then giveWeapon(source, SniperAmmo[2], SniperAmmo[1]) end
			if AkAmmo[1] > 0 then giveWeapon(source, AkAmmo[2], AkAmmo[1]) end
			if PistolAmmo[1] > 0 then giveWeapon(source, PistolAmmo[2], PistolAmmo[1]) end
			-- if SilencedAmmo[1] > 0 then giveWeapon(source, SilencedAmmo[2], SilencedAmmo[1]) end
			if DeagleAmmo[1] > 0 then giveWeapon(source, DeagleAmmo[2], DeagleAmmo[1]) end
			if TecAmmo[1] > 0 then giveWeapon(source, TecAmmo[2], TecAmmo[1]) end
			--if UziAmmo[1] > 0 then giveWeapon(source, UziAmmo[2], UziAmmo[1]) end
			if Mp5Ammo[1] > 0 then giveWeapon(source, Mp5Ammo[2], Mp5Ammo[1]) end
			if GrenadaAmmo[1] > 0 then giveWeapon(source, GrenadaAmmo[2], GrenadaAmmo[1]) end
			--if TeargasAmmo[1] > 0 then giveWeapon(source, TeargasAmmo[2], TeargasAmmo[1]) end
			--if SatchelAmmo[1] > 0 then giveWeapon(source, SatchelAmmo[2], SatchelAmmo[1]) end
			
			
			if LauncherAmmo[1] > 0 then setElementData(source, LauncherAmmo[2], (getElementData(source, LauncherAmmo[2]) or 0) + LauncherAmmo[1]) end
			exports ["guimessages"] : outputServer(source,"#009cff[ Weapons Shop ] #00ff00You bought Weapons for $"..Cost..".", 0, 255, 0)
		else
			exports ["guimessages"] : outputServer(source,"#009cff[ Weapons Shop ] #ff0000Your Ping is More than 300", 255, 0, 0)		
		end
	else
		exports ["guimessages"] : outputServer(source,"#009cff[ Weapons Shop ] #ff0000You don't have enough money to buy weapons!", 255, 0, 0)
	end
end)

addEventHandler("onResourceStart", resourceRoot,
function()
	db = dbConnect("sqlite", "database.db")
	dbExec(db, "CREATE TABLE IF NOT EXISTS Weapons ( Slot, WeaponID, Account, Ammo)")
end)

addEvent("BuyArmor", true)
addEventHandler("BuyArmor", root,
function(armsPlayer)
	if getPedArmor(source) <= 99 then
		if getPlayerMoney(source) >= 500 then
			takePlayerMoney(source, 500)
			setPedArmor(source, 100)
			exports ["guimessages"] : outputServer(source,"#009cff[ Weapons Shop ] #00ff00You bought Armor for $500.", 0, 255, 0)
		else
			exports ["guimessages"] : outputServer(source,"#009cff[ Weapons Shop ] #ff00009You don't have enough money to buy armor!", 255, 0, 0)
		end
	else
		exports ["guimessages"] : outputServer(source,"#009cff[ Weapons Shop ] #ff0000You already have armor!", 255, 255, 0)
	end
end)


addEvent("BuyHealth", true)
addEventHandler("BuyHealth", root,
function(armsPlayer)
	if getPedStat(source,24) < 785 then
		if getPlayerMoney(source) >= 15000 then
			takePlayerMoney(source, 15000)
			setPedStat(source,24,785)
			exports ["guimessages"] : outputServer(source,"#009cff[ Weapons Shop ] #00ff00You bought 150 Health for $15,000.", 0, 255, 0)
		else
			exports ["guimessages"] : outputServer(source,"#009cff[ Weapons Shop ] #ff0000You don't have enough money to buy Health!", 255, 0, 0)
		end
	else
		exports ["guimessages"] : outputServer(source,"#009cff[ Weapons Shop ] #ff0000You already have 150 Health or more!", 255, 255, 0)
	end
end)

addEventHandler("onPlayerQuit", root,
function()
	local account = getPlayerAccount(source)
	if account and not isGuestAccount(account) then
		
		saveWeapons( source )
		
		local LauncherAmount = getElementData(source, "Launcher") or 0
		setAccountData(account, "Launcher", LauncherAmount)
	end
end)

addEventHandler("onResourceStop", root,
function()
for i,v in ipairs(getElementsByType("player")) do
	local account = getPlayerAccount(v)
	if account and not isGuestAccount(account) then
		
		local LauncherAmount = getElementData(v, "Launcher") or 0
		setAccountData(account, "Launcher", LauncherAmount)
	end
end
end)

addEventHandler("onPlayerLogin", root,
function(_, account)
	local LauncherAmount = getAccountData(account, "Launcher") or 0
	setElementData(source, "Launcher", LauncherAmount)
	
	loadWeapon( source )
end)





function saveWeapons( player )
	local account = getPlayerAccount(player)
	if account and not isGuestAccount(account) then
		for slot = 2, 8 do
			if getPedWeapon(player, slot) and getPedWeapon(player, slot) ~= 0 then
				local data = dbPoll(dbQuery(db, "SELECT Slot FROM Weapons WHERE Account = ? ", getAccountName(getPlayerAccount(player))), -1)
				local abc = false
				for i, data in ipairs (data) do
					if data["Slot"] == slot then
						abc = true
						break
					end
				end
				if abc then
					dbExec(db, "UPDATE Weapons SET WeaponID = ?, Ammo = ? WHERE Slot = ? AND Account = ?", getPedWeapon(player, slot), getPedTotalAmmo(player, slot), slot, getAccountName(getPlayerAccount(player)) )
				else
					dbExec(db, "INSERT INTO Weapons VALUES(?, ?, ?, ?)", slot,getPedWeapon(player, slot), getAccountName(getPlayerAccount(player)), getPedTotalAmmo(player, slot))
				end
			end
		end
	end
end

function loadWeapon( player )
	local account = getPlayerAccount(player)
	if account and not isGuestAccount(account) then
		local data = dbPoll(dbQuery(db, "SELECT * FROM Weapons WHERE Account = ? ", getAccountName(getPlayerAccount(player))), -1)
		for i, data in ipairs (data) do
			giveWeapon(player, data["WeaponID"], data["Ammo"])
		end
	end
end
 
addEventHandler("onPlayerSpawn", root,
function()
	loadWeapon( source )
end)
addEventHandler("onPlayerWasted", root,
function()
	if getElementData(source,"InMission") == "Battlegrounds" then return end
	saveWeapons( source )
end)