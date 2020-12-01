local Lagers = {}   
  
function pingCheck ( ) 
	for index,player in ipairs( getElementsByType("player") ) do 
		if getPlayerPing ( player ) >= 1500 then 
			if Lagers[player] then 
				Lagers[player] = Lagers[player] + 1 
            else 
                Lagers[player] = 1 
            end 
            if Lagers[player] == 10 then   
               kickPlayer(player,"Hight Ping Detected over 5x times")
            end 
        else 
            Lagers[player] = 0 
        end 
    end 
end   
setTimer ( pingCheck, 5000, 0 ) 