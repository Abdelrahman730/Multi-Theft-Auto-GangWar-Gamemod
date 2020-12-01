local Gifts = {}

function doesPlayerTokeGift (player)
	local Account = getPlayerAccount(player)
	if not isGuestAccount (Account) then
		for i , v in pairs (Gifts) do
			if v[1] == getAccountName(Account) then
				return true
			end
		end
	end
end


addEvent("[Titans]DailyGift",true)
addEventHandler("[Titans]DailyGift",root,
function(Type,Table)
	if Type == "Gift" and source then
		local Account = getPlayerAccount(source)
		if not (isGuestAccount(Account) ) then
			if not (doesPlayerTokeGift(source) ) then
				if Table[3] == "Group" then
					local Group = getElementData(source,"Group")
					if Group then
						triggerEvent(source,"addPointToGroup",source,Group,Table[2])
					end
				elseif Table[3] == "Best" then
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
					exports["[Titans]Donator"]:givePlayerVip(source,Table[2],"Daily Gift")
				end
				exports["guimessages"]:outputServer(source,"#00ACCF[Daily Gift] #00ff00 You have won #ffff00  "..Table[1].." #00ff00, Congratulations .",255,255,255)
				outputChatBox("#00ACCF[Daily Gift] #ffff00 "..getPlayerName(source).." #00ff00 had won #ffff00"..Table[1].." #00ff00.",root,255,255,255,true)
				table.insert(Gifts,{getAccountName(Account),24*60*60})
				triggerClientEvent(source,"[Titans]DailyGift",source,"Refresh",24*60*60)
			else
				exports["guimessages"]:outputServer(source,"#00ACCF[Daily Gift] #ff0000 you already have won a gift before",255,255,255)
			end
		end
	end
end)

setTimer(
function ()
	if table.getn(Gifts) ~= 0 then
		for i , v in pairs (Gifts) do
			v[2] = v[2] - (60)
			local player = getAccountPlayer(getAccount(v[1]))
			if player then
				triggerClientEvent(player,"[Titans]DailyGift",player,"Refresh",v[2])
			end
			if v[2] <= 0 then
				table.remove(Gifts,i)
			end
		end
	end
end,60*1000,0) -- 60*1000

function ReDailyGift (player)
	if player then
		local Account = getPlayerAccount(player)
		if not ( isGuestAccount(Account) ) then
			if getAccountName(Account) == "bebo1king" or getAccountName(Account) == "Nissan" then
				Gifts = {}
				exports["guimessages"]:outputServer(root,"#00ACCF[Daily Gift] #00ff00 Daily Gifts had been rested by  #ffff00"..getPlayerName(player).." #00ff00 ." ,255,255,255)
			end
		end
	end
end
addCommandHandler("RDG",ReDailyGift)