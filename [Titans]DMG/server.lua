


function playerDamage_text ( attacker, weapon, bodypart, loss )
	if wasEventCancelled() then return end
		triggerClientEvent("[Titans]Dmg",source,attacker, weapon, bodypart, loss)
	--end
end
addEventHandler ( "onPlayerDamage", getRootElement (), playerDamage_text )