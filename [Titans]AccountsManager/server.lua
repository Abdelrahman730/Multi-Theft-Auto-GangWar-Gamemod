








function OpenDonatorPanel (player)
	if player then
		local account = getPlayerAccount(player)
		if account and not isGuestAccount(account) then
			local AccountName = getAccountName(account)
			if AccountName == "bebo1king" or AccountName == "anoose112233" then
			--if isObjectInACLGroup ( "user." .. getAccountName(account) , aclGetGroup ( "Manager" ) ) then
				triggerClientEvent(player,"[Titans]AccountsMaanger",player,"OpenPanel")
				triggerEvent("GameMod",player,"RefreshAccountsDatas")
			end
		end
	end
end
addCommandHandler("AM",OpenDonatorPanel)



















