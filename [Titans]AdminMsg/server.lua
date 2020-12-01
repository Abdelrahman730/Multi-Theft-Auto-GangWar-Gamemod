Groups = { 
"Developer",
"Manager",
"Co-Manager",
"HeadAdmin", 
"Admin", 
} 



function check ( thePlayer, commandName, ... )
	local accName = getAccountName ( getPlayerAccount ( thePlayer ) ) 
	local veve = { ... }
	local message = table.concat ( veve, " " )
	for i, v in ipairs ( Groups ) do
		if isObjectInACLGroup ( "user."..accName, aclGetGroup ( v ) ) then		
			Admin = message
			setElementData(root,"ServerMessagesInScreen",{message,Updates})
		end
	end
end
addCommandHandler( "Admin", check )


function check2 ( thePlayer, commandName, ... )
	local accName = getAccountName ( getPlayerAccount ( thePlayer ) ) 
	local veve = { ... }
	local message = table.concat ( veve, " " )
	for i, v in ipairs ( Groups ) do
		if isObjectInACLGroup ( "user."..accName, aclGetGroup ( v ) ) then		
			Updates = message
			setElementData(root,"ServerMessagesInScreen",{Admin,message})
		end
	end
end
addCommandHandler( "Updates", check2 )
