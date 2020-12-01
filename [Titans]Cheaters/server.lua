
	checkModels = { "airportgate.dff", "drydock1_sfse.dff", "drydock1_sfse01.dff"}
 
function handleOnPlayerModInfo ( filename, modList )
	if filename == "gta_int.img" then
		outputDebugString ( "" .. getPlayerName(source) .. " Has Kicked For used non-standard gta_int.img." , 3, 0, 255, 0)
		kickPlayer( source, "This server does not allow non-standard gta_int.img." )
		return 
	end
    for _,item in ipairs(modList) do			-- Check each modified item
        for _,checkName in ipairs(checkModels) do
            if item.name == checkName then		-- See if modified item is in our check list
				outputDebugString ( "" .. getPlayerName(source) .. " Has Kicked For used gta3.img modified." , 3, 0, 255, 0)
                kickPlayer( source, "This server does not allow your gta3.img modified." )
            end
        end
    end
end
 
addEventHandler ( "onPlayerModInfo", getRootElement(), handleOnPlayerModInfo )
 
-- Ensure no one gets missed when the resource is (re)started
addEventHandler( "onResourceStart", resourceRoot,
    function()
        for _,plr in ipairs( getElementsByType("player") ) do
            resendPlayerModInfo( plr )
        end
    end
)