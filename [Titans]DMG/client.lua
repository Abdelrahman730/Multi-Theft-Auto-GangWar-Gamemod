
local alpha = 0
local BloodBlur = false
local maxAlpha = 0

local newID = 0

local Damages = {}
local PlayersDamages = {}
local DTimer = {}

--[[for i=1,6 do
createPed(120, 0+i, 0, 3)
end]]


addEventHandler ( "onClientPedDamage", root,function()
	--cancelEvent()
end)


function onDamage ( attacker, weapon , bodypart , loss)
	if source == localPlayer then
		createDamageText( source, attacker, loss, weapon)
	elseif attacker == localPlayer then
		createDMGText(math.floor(loss))
		createDamageText( source, attacker, loss, weapon)
		exports["[Titans]Sounds"]:playCustomSound(3)
	end
end
addEvent("[Titans]Dmg",true)
addEventHandler("[Titans]Dmg",root,onDamage)
--addEventHandler ( "onClientPedDamage", root, onDamage,true,"low")
--addEventHandler ( "onClientPlayerDamage", root, onDamage,true,"low")



local completion = {}


	 
local function prerender(deltaTime)
	for k,v in pairs(Damages)do
		if completion[k] then
			if (completion[k] < 1) then
				completion[k] = completion[k] + deltaTime / 1000 -- It'll take 3 seconds to scroll the text to the edge of the screen
				if completion[k] > 1 then
					completion[k] = 1
					Damages[k] = nil
				end
			end
		end
	end
end
addEventHandler("onClientPreRender", root, prerender)


local screenW, screenH = guiGetScreenSize()

addEventHandler("onClientRender", root,
function()
	for k,v in pairs(Damages)do
		Damages[k].x = interpolateBetween(0.5125, 0, 0, 0.6130, 0, 0, completion[k], "Linear")
		Damages[k].y = interpolateBetween(0.3594, 0, 0, 0.2490, 0, 0, completion[k], "SineCurve")
		
        dxDrawText(Damages[k].dmg, screenW * Damages[k].x, screenH * Damages[k].y, screenW * 0.5727, screenH * 0.4736, tocolor(255, 255, 255, 255), screenH*0.00146484375, "sans", "center", "center", false, false, false, false, false)
	end
end
)


addEventHandler("onClientPreRender", root,
function(tick)
	for k,v in pairs(PlayersDamages) do
		if not v.fade then
			if v.alpha + tick <= 255 then
				v.alpha = v.alpha + tick
			else
				if not isTimer(DTimer[k]) then
					v.alpha = 255
					DTimer[k] = setTimer(
					function()
						v.fade = true
					end,3000,1)
				end
			end
		else
			if v.alpha - tick >= 0 then
				v.alpha = v.alpha - tick
			else
				v.alpha = 0
				removeRow(k)				
			end
		end
		if isElement(v.Player) then
			if getElementType(v.Player) == "ped" then
				Pname = "ped"
			elseif getElementType(v.Player) == "player" then
				Pname = getPlayerName(v.Player)
			end
		end
		
		if isElement(v.Attacker) then
			if getElementType(v.Attacker) == "ped" then
				Aname = "ped"
			elseif getElementType(v.Attacker) == "player" then
				Aname = getPlayerName(v.Attacker)
			end
		else
			Aname = ""
		end
		if v.Player == localPlayer then
			if v.dmg and Aname and v.weapon then
				dxDrawText("-"..math.floor(v.dmg).." "..Aname.." ("..getWeaponNameFromID (v.weapon)..")", screenW * 0.7070, screenH * (0.4131 + (v.height*0.022)), screenW * 0.8477, screenH * (0.4351 + (v.height*0.022)), tocolor(255, 0, 0, v.alpha), screenH*0.0009765625, "sans", "left", "center", false, false, false, false, false)
			end
		elseif v.Attacker == localPlayer then
			if v.dmg and Pname and v.weapon then
				dxDrawText("-"..math.floor(v.dmg).." "..Pname.." ("..getWeaponNameFromID (v.weapon)..")", screenW * 0.7070, screenH * (0.4131 + (v.height*0.022)), screenW * 0.8477, screenH * (0.4351 + (v.height*0.022)), tocolor(0, 255, 0, v.alpha), screenH*0.0009765625, "sans", "left", "center", false, false, false, false, false)
			end
		end
	end
end
)
function removeRow(key)
	for k,v in pairs(PlayersDamages) do
		if PlayersDamages[k].height > PlayersDamages[key].height then
			PlayersDamages[k].height = PlayersDamages[k].height - 1
		end
	end
	PlayersDamages[key] = nil
	
end



function createDMGText(damage)
	local k = (#Damages + 1)
	completion[k] = 0
	Damages[k] = {}
	Damages[k].dmg = damage
	Damages[k].x = 0.5242
	Damages[k].y = 0.3936
end



function createDamageText( fired, attacker, damage, weap)
	local isTable = false
	for i,v in pairs(PlayersDamages) do
		if PlayersDamages[i] and PlayersDamages[i].Player == fired and PlayersDamages[i].Attacker == attacker and PlayersDamages[i].weapon == weap then
			PlayersDamages[i].dmg = PlayersDamages[i].dmg + damage
			PlayersDamages[i].fade = false
			if isTimer(DTimer[i]) then
				killTimer(DTimer[i])
			end
			isTable = true
			break
		end
	end
	if not isTable then
		newID = newID + 1
		local k = 0
		for i,v in pairs(PlayersDamages) do
			k = k + 1
		end
		if k == 0 then
			newID = 0
		end
		PlayersDamages[newID] = {}
		PlayersDamages[newID].dmg = damage
		PlayersDamages[newID].alpha = 0
		PlayersDamages[newID].Player = fired
		PlayersDamages[newID].Attacker = attacker
		PlayersDamages[newID].weapon = weap
		PlayersDamages[newID].fade = false
		PlayersDamages[newID].height = k
	end
end









