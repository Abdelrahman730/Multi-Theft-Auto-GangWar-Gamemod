local Answer = ""
local QuestionEnabled = false
--[[local Words = {
	{"Arab War 4 Ever"},
	{"Arab War 4 Ever"},
	{"Arab War 4 Ever"},
	{"Arab War 4 Ever"},
	{"Arab War 4 Ever"},
	{"Arab War 4 Ever"},
	{"Arab War 4 Ever"},
}

function outputWord ()
	QuestionEnabled = true
	local OneOfThem  = math.random(1,7)
	Answer = Words[OneOfThem][1]
	exports["guimessages"]:outputServer(root,"#767676==================#FFFFFF[ #FFCD00Chat Comptetion #FFFFFF]#767676======================",0,0,0)
	exports["guimessages"]:outputServer(root,"#767676[ #FFCD00"..Answer.." #767676]",255,0,0)
	exports["guimessages"]:outputServer(root,"#767676=================================================================================",0,0,0)
end
setTimer (outputWord,3*60*1000,0)]]

addEventHandler( "onPlayerChat", root,
function ( message, messageType )
	if QuestionEnabled == true then
		if Answer ~= "" then
			if message == Answer then
				QuestionEnabled = false
				exports["guimessages"]:outputServer(root,"#00FF2B"..getPlayerName(source).." #0015FFHad Win 1 Game Coins (GC)",0,0,0)
				local GCc = (getElementData(source,"GameCoins") or 0 )
				setElementData(source,"GameCoins",GCc + 1)
			end
		end
	end
end)

function AdminCom(plr,_,...)
	local AccountName = getAccountName(getPlayerAccount(plr))
	if isObjectInACLGroup ("user."..AccountName, aclGetGroup ( "Developer" ) ) or isObjectInACLGroup ("user."..AccountName, aclGetGroup ( "Manager" ) ) or isObjectInACLGroup("user."..AccountName,aclGetGroup("Co-Manager") )  then
		local message = table.concat({...}, " ")
		if (message == "") then
				return
			else
				QuestionEnabled = true
				Answer = message
				exports["guimessages"]:outputServer(root,"#767676==================#FFFFFF[ #FFCD00Chat Comptetion #FFFFFF]#767676======================",0,0,0)
				exports["guimessages"]:outputServer(root,"#767676[ #FFCD00"..Answer.." #767676]",255,0,0)
				exports["guimessages"]:outputServer(root,"#767676=================================================================================",0,0,0)
			end
		end
	end
addCommandHandler("Question", AdminCom)



