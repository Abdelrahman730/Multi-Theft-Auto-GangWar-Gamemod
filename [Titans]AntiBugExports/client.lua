
function checkPlayer (player,ModName)
	if not getElementData(player, "DONATE") then
		if not (getElementData(player,"InMission"))  then
			local LegalStatus = getElementData(player,"LegalStatus")
			if LegalStatus == "Free" then
				if not (getElementData(player, "Kidnapper")) then
					if getElementInterior(player) ~= 5 then
						if getElementDimension(player) == 0 and getElementInterior(player) == 0 then
							if (not isPedDead(player)) then
								if (isPedInVehicle(player) == false) then
									if not getElementData(player, "bag") then
										if not getElementData(player,"Pickpocket") then
											return true
										else
											exports["guimessages"]:outputClient("#0055AA["..ModName.."] #ff0000You can't do the current action while haveing somone Pocket.",255,0,0)
										end
									else
										exports["guimessages"]:outputClient("#0055AA["..ModName.."] #ff0000You can't do the current action while haveing Bag.",255,0,0)
									end
								else
									exports["guimessages"]:outputClient("#0055AA["..ModName.."] #ff0000You can't do the current action while in a vehicle.",255,0,0)
								end
							else
								exports["guimessages"]:outputClient("#0055AA["..ModName.."] #ff0000You can't do the current action while you are dead.",255,0,0)
							end
						else
							exports["guimessages"]:outputClient("#0055AA["..ModName.."] #ff0000You can't do the current action while in other dimension or interior", 255, 0, 0)
						end
					else
						exports["guimessages"]:outputClient("#0055AA["..ModName.."] #ff0000You can't do the current action while in this Interior", 255, 0, 0)
					end
				else
					exports["guimessages"]:outputClient("#0055AA["..ModName.."] #ff0000You can't do the current action while you are Not Free", 255, 0, 0)
				end
			else
				exports["guimessages"]:outputClient("#0055AA["..ModName.."] #ff0000You can't do the current action while your not free", 255, 0, 0)
			end
		else
			exports["guimessages"]:outputClient("#0055AA["..ModName.."] #ff0000You can't do the current action while PacketStats is High", 255, 0, 0)
		end
	else
		exports["guimessages"]:outputClient("#0055AA["..ModName.."] #ff0000You can't do the current action while action asking for Donnation", 255, 0, 0)
	end
end