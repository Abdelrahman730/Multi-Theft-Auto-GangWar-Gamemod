local DataBase = dbConnect( "sqlite", "Vehicles.db" )
dbExec(DataBase, "CREATE TABLE IF NOT EXISTS Vehicles ( AccountName ,ID , Price )")
local Vehicles = {}


markers = {
	local "All" = {
		{2505,-1680,13.5 -1},
		{1784,-1845,13.6 -1},
		{1182,-1333,13.6 -1},
		{1157 , -1635 , 14 -1},
		{1737,-1746,13.5 -1},
		{2160,-1793,13 -1},
		{2226,-1367,24 -1},
		{2000,-1441,13.6 -1},
		{1811,-1109,24.1 -1},
		{408.599609375,-1568.2998046875,26.60000038147},
		{802.900390625,-1791.5,12.300000190735},
		{518.7001953125,-1350.2998046875,15.10000038147},
		{934,-1157.2998046875,22.89999961853},
		{1812,-1740.2998046875,12.60000038147},
		{1471.2001953125,-1041.5,22.799999237061},
		{1617.900390625,-1311.7998046875,16.39999961853},
		{2073.5,-1744.7001953125,12.5},
		{2683.1005859375,-1846.2998046875,8.5},
		{2237.6005859375,-1756.7998046875,12.60000038147},
		{2744.6005859375,-1465.2001953125,29.39999961853},
		{682.7998046875,1946.5,4.5999999046326},
		{2635,-1056.2001953125,68.699996948242},
		{2285.5,49.2001953125,25.5},
		{2080.5,1201.2998046875,9.8000001907349},
		{1588.2998046875,1857.2001953125,9.8000001907349},
		{-1534,599.400390625,6.1999998092651},
		{280.900390625,1389.7998046875,9.6999998092651},
		{-1587.599609375,1231.7001953125,6.3000001907349},
		{-2264,112.400390625,34.099998474121},
		{-2044.5,136.099609375,27.799999237061},
		{-2414.5,305.5,34.099998474121},
		{-2686.099609375,376.5,3.2999999523163},
		{-2410.7001953125,727.900390625,34.099998474121},
		{-2644.8994140625,627,13.39999961853},
		{2635.11670,-1264.05139,49},
		{2289.15308,-1114.12915,36.97656},
		{1784.86768,-1933.63245,12.38591},
		{1962.48596,-1153.51160,25.02914},
		{1978.5,-1274,23},
		{1808.12,-1643.5,13},
		{1518.5,-1477.3,9},
		{1427.3,-1058,22.5},
		{1310,-871,39},
		{2065,-1904,12.7},
		{1722.3,-1609,12.7},
		{1665.5,-1432,12.7},
		{1797.6,-1443.2,12.7},
	},
	local "Police" = {
		{1556.95557,-1608.03357,12.38281},
		{1569.57178, -1608.26794,12.38281},
		{1581.18384, -1608.42871,12.38281},
		{1587.38892 ,-1710.94507,4.89063},
		{1575.10901, -1711.10547,4.89063},
		{1558.94312 ,-1710.74255,4.89063},
		{1530.10681, -1684.03760,4.89063},
	}
	local "Medic" = {
		{1179,-1308,13,90},
		{1626,1856,10},
		{-2692,622,14.45},
	}
}


Markers = {}

for i,v in ipairs (markers) do
	marker = createMarker(v[1], v[2], v[3], "cylinder", 1.5, 255, 255, 255, 150)
	table.insert(Markers,{marker})
end

function isCarMarker (Marker)
	for i , v in pairs (Markers) do
		if v[1] == Marker then
			return true
		end
	end
end

function isPlayerHaveVehicle (player,ID)
	local result = dbPoll( dbQuery( DataBase, "SELECT * FROM Vehicles" ), -1 )
	if #result ~= 0 then 
		local AccountName = getAccountName(getPlayerAccount(player) )
		for i ,v in pairs (result) do
			if AccountName == v["AccountName"] then
				if v["ID"] == ID then
					return true
				end
			end
		end
	end
end

function RefreshPanel (player)
	local result = dbPoll( dbQuery( DataBase, "SELECT * FROM Vehicles" ), -1 )
	local AccountName = getAccountName(getPlayerAccount(player) )
	triggerClientEvent(player,"[Titans]CarPlayer",player,"Refresh",result,AccountName)
end

function CarMaker (player,Dim)
	if isCarMarker(source) then
		if getElementType(player) == "player" and Dim == true then
			if not(isPedInVehicle(player) ) then
				if eventName == "onMarkerHit" then
					triggerClientEvent(player,"[Titans]CarPlayer",player,"ShowWindow")
					RefreshPanel(player)
				elseif eventName == "onMarkerLeave" then
					triggerClientEvent(player,"[Titans]CarPlayer",player,"HideWindow")
				end
			end
		end
	end
end
addEventHandler("onMarkerHit",resourceRoot,CarMaker)
addEventHandler("onMarkerLeave",resourceRoot,CarMaker)



addEvent("[Titans]CarPlayer",true)
addEventHandler("[Titans]CarPlayer",root,
function(Type,ID,Price)
	if Type == "BuyVehicle" then
		if getPlayerMoney(source) >= Price then
			local AccountName = getAccountName(getPlayerAccount(source) )
			local data = dbPoll(dbQuery(DataBase, "SELECT ID FROM Vehicles WHERE AccountName = ? ", AccountName), -1)
			local abc = false
			for i, datas in ipairs (data) do
				if datas["ID"] == ID then
					abc = true
					break
				end
			end
			if abc then
				return
			else
				dbExec(DataBase, "INSERT INTO Vehicles VALUES(?, ?, ?)", AccountName , ID, Price )
				takePlayerMoney(source,Price)
				RefreshPanel(source)
			end
		end
	elseif Type == "TakeVehicle" then
		if isPlayerHaveVehicle(source,ID) then
			if getElementDimension(source) == 0 and getElementInterior(source) == 0 then
				if Vehicles[source] and isElement( Vehicles[source] ) then 
					destroyElement( Vehicles[source] ) 
					Vehicles[source] = nil 
				end
				local x,y,z = getElementPosition(source)
				Vehicles[source] = createVehicle(ID, x,y,z ,0, 0,180)
				setVehicleColor(Vehicles[source], 255, 255, 255)
				warpPedIntoVehicle(source, Vehicles[source])    
				triggerClientEvent(source,"[Titans]CarPlayer",source,"HideWindow")
			end
		end
	elseif Type == "SellVehicle" then
		local AccountName = getAccountName(getPlayerAccount(source) )
		local data = dbPoll(dbQuery(DataBase, "SELECT ID FROM Vehicles WHERE AccountName = ? ", AccountName), -1)
		local abc = false
		for i, datas in ipairs (data) do
			if datas["ID"] == ID then
				abc = true
				break
			end
		end
		if abc then
			dbExec(DataBase, "DELETE FROM Vehicles WHERE AccountName = ? AND ID = ?", AccountName,ID)
			givePlayerMoney(source,Price)
			RefreshPanel(source)
		end
	end
end)

addEventHandler ( "onPlayerQuit", getRootElement(),	
function ()
	if Vehicles[source] and isElement( Vehicles[source] ) then 
		destroyElement( Vehicles[source] ) 
		Vehicles[source] = nil 
	end
end)














	


