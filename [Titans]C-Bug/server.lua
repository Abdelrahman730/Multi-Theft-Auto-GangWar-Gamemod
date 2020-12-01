--[[function resourceStart ()
setGlitchEnabled ( "quickreload", true )
setGlitchEnabled ( "fastmove", true )
setGlitchEnabled ( "fastfire", true )
setGlitchEnabled ( "crouchbug", true )
end
addEventHandler ( "onResourceStart", getResourceRootElement ( ), resourceStart )]]

function resourceStop ()
setGlitchEnabled ( "quickreload", false )
setGlitchEnabled ( "fastmove", false )
setGlitchEnabled ( "fastfire", false )
setGlitchEnabled ( "crouchbug", false )
outputChatBox("#009cff[C-Bug] #A5A5A5C-Bug is now #ff0000Disabled",root,0, 255, 0,true)
end
addEventHandler ( "onResourceStop", getResourceRootElement ( ), resourceStop )

function CBUG ()
	CurrentState = not(CurrentState)
	setGlitchEnabled ( "quickreload", CurrentState )
	setGlitchEnabled ( "fastmove", CurrentState )
	setGlitchEnabled ( "fastfire", CurrentState )
	setGlitchEnabled ( "crouchbug", CurrentState )
	if CurrentState then
		outputChatBox("#009cff[C-Bug] #A5A5A5C-Bug is now #00ff00Enabled",root,0, 255, 0,true)
	else
		outputChatBox("#009cff[C-Bug] #A5A5A5C-Bug is now #ff0000Disabled",root,0, 255, 0,true)
	end
end
CBUGTimer = setTimer(CBUG,2*60*60*1000,0) -- 2*60*60*1000
CBUG()


addEvent("[Titans]Times",true)
addEventHandler("[Titans]Times",root,
function (Type)
	if Type == "Refresh" then
		if ( isTimer(CBUGTimer) ) then
			local TimeLeft = getTimerDetails(CBUGTimer)
			if CurrentState then
				triggerClientEvent(source,eventName,source,Type,{"C-Bug",math.ceil( (TimeLeft or 0 )/1000)})
			else
				triggerClientEvent(source,eventName,source,Type,{"C-Bug",math.ceil( (TimeLeft or 0 )/1000)})
			end
		end
	end
end)

addCommandHandler("CB",
function(player)
	local AccountName = getElementData(player,"Account")
	if AccountName then
		if AccountName == "bebo1king" or AccountName == "anoose112233" then
			CBUG()
		end
	end
end)