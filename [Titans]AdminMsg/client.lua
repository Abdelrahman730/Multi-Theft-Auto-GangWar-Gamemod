local HideMsg = true
local sWidth,sHeight = guiGetScreenSize() -- The variables

function setAdminMsg (Type)
	HideMsg = Type
end



function dxDrawFramedText(message, left, top, width, height, color, scale, sans, alignX, alignY, clip, wordBreak, postGUI, frameColor)
	message1 = string.gsub(message, "#%x%x%x%x%x%x", "")
	--dxDrawText("#000000"..message1, left + 1, top + 1, width + 1, height + 1, tocolor(0,0,0,255), scale, sans, alignX, alignY, clip, wordBreak, true,frameColor)
	--dxDrawText("#000000"..message1, left + 1, top - 1, width + 1, height - 1, tocolor(0,0,0,255), scale, sans, alignX, alignY, clip, wordBreak, true,frameColor)
	--dxDrawText("#000000"..message1, left - 1, top + 1, width - 1, height + 1, tocolor(0,0,0,255), scale, sans, alignX, alignY, clip, wordBreak, true,frameColor)
	dxDrawText("#000000"..message1, left - 1, top - 1, width - 1, height - 1, tocolor(0,0,0,225), scale, sans, alignX, alignY, clip, wordBreak, true,frameColor)
  dxDrawText(message, left, top, width, height, color, scale, sans, alignX, alignY, clip, wordBreak, true,frameColor)
end

addEventHandler("onClientPreRender", getRootElement(  ),
function (  )
	if HideMsg == true then
		local Data = (getElementData(root,"ServerMessagesInScreen") or {"",""})
		if Data then
		
			local Size,Sheight = unpack(getChatboxLayout()["chat_scale"])
			dxDrawText ( "#FF0000[Admin]:#ffffff "..(Data[1] or ""), (0.013 * sWidth) , sHeight*0.3528, sWidth, sHeight*0.3657, tocolor ( 155, 0, 255, 150 ), Size, "default-bold", "left", "center", false, false, false,true )
			dxDrawText ( "#FF0000[Updates]:#ffffff "..(Data[2] or ""), (0.013 * sWidth),sHeight*0.3806, sWidth, sHeight*0.3935, tocolor ( 155, 0, 255, 150 ), Size, "default-bold", "left", "center", false, false, false,true )
		end
	end
end )

--[[
        dxDrawText("", screenW * 0.0135, screenH * 0.3528, screenW * 0.2938, screenH * 0.3657, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
        dxDrawText("", screenW * 0.0135, screenH * 0.3806, screenW * 0.2938, screenH * 0.3935, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
 ]]
 
 

