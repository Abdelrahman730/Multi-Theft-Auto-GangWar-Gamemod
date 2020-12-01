local Chests = {
	-- Money
	-- Exp 
	-- GC
	-- Rocket
	-- Luncher 
	-- Grenade
	-- VIP
	["Wooden Chest"] = {
		["Color"] = {255,255,255},
		["Keys"] = {0},
	
		{"Money",1000,"Money"}, -- 1k Money
		{"Exp",10,"Exp"}, -- 10 Exp
		{"Game Coins",1,"Game Coins"}, -- 2 Game Coins
		{"Rocket Launcher",1,"Weapon"},
		{"Launcher",1,"Launcher"},
		{"Grenade",1,"Weapon"},
		{"Points Criminals",1,"Best"},
		{"Points Police",1,"Best"},
	},
	["Crown Chest"] = {
		["Color"] = {255,255,255},
		["Keys"] = {0},
	
		{"Money",10000,"Money"}, -- 10k Money
		{"Exp",100,"Exp"}, -- 100 Exp
		{"Game Coins",2,"Game Coins"}, -- 2 Game Coins
		{"Rocket Launcher",10,"Weapon"},
		{"Launcher",2,"Launcher"},
		{"Grenade",2,"Weapon"},
		{"Points Criminals",10,"Best"},
		{"Points Police",10,"Best"},
	},
	["Silver Chest"] = {
		["Color"] = {255,255,255},
		["Keys"] = {0},
	
		{"Money",25000,"Money"}, -- 25k Money
		{"Exp",250,"Exp"}, -- 250 Exp
		{"Game Coins",3,"Game Coins"}, -- 3 Game Coins
		{"Rocket Launcher",10,"Weapon"},
		{"Launcher",2,"Launcher"},
		{"Grenade",2,"Weapon"},
		{"Points Criminals",10,"Best"},
		{"Points Police",10,"Best"},
	},
	["Golden Chest"] = {
		["Color"] = {255,255,255},
		["Keys"] = {1},
	
		{"Money",50000,"Money"}, -- 50k Money
		{"Exp",500,"Exp"}, -- 500 exp
		{"Game Coins",5,"Game Coins"}, -- 5 Game Coins
		{"Rocket Launcher",2,"Weapon"},
		{"Launcher",2,"Launcher"},
		{"Grenade",2,"Weapon"},
		{"Points Criminals",10,"Best"},
		{"Points Police",10,"Best"},
	},
	["Magical Chest"] = {
		["Color"] = {255,255,255},
		["Keys"] = {1},
	
		{"VIP",6*60*60,"VIP"}, -- 12 Hour
		{"Money",100000,"Money"}, -- 100k Money
		{"Exp",1*1000,"Exp"}, -- 1k Exp
		{"Game Coins",10,"Game Coins"}, -- 10 Game Coins
		{"Rocket Launcher",5,"Weapon"},
		{"Launcher",5,"Launcher"},
		{"Grenade",5,"Weapon"},
		{"Points Criminals",25,"Best"},
		{"Points Police",25,"Best"},
	},
	["Giant Chest"] = {
		["Color"] = {100,100,100},
		["Keys"] = {1},
	
		{"VIP",12*60*60,"VIP"}, -- 12 Hour
		{"Money",500000,"Money"}, -- 500k Money
		{"Exp",5*1000,"Exp"}, -- 5k Exp
		{"Game Coins",50,"Game Coins"}, -- 50 Game Coins
		{"Rocket Launcher",10,"Weapon"},
		{"Launcher",10,"Launcher"},
		{"Grenade",10,"Weapon"},
		{"Points Criminals",50,"Best"},
		{"Points Police",50,"Best"},
	},
	["Super Magical Chest"] = {
		["Color"] = {0,135,255},
		["Keys"] = {2},
	
		{"VIP",12*60*60,"VIP"}, -- 12 Hour
		{"Money",500000,"Money"}, -- 500k Money
		{"Exp",5*1000,"Exp"}, -- 5k Exp
		{"Game Coins",50,"Game Coins"}, -- 50 Game Coins
		{"Rocket Launcher",10,"Weapon"},
		{"Launcher",10,"Launcher"},
		{"Grenade",10,"Weapon"},
		{"Points Criminals",50,"Best"},
		{"Points Police",50,"Best"},
	},
	["Epic Chest"] = {
		["Color"] = {255,50,0},
		["Keys"] = {3},
		
		{"VIP",1*24*60*60,"VIP"}, -- 1 Days
		{"Money",1000000,"Money"}, -- 1 Million
		{"Exp",10*1000,"Exp"}, -- 10k Exp
		{"Game Coins",100,"Game Coins"}, -- 100 Game Coins
		{"Rocket Launcher",10,"Weapon"},
		{"Launcher",10,"Launcher"},
		{"Grenade",10,"Weapon"},
		{"Points Criminals",100,"Best"},
		{"Points Police",100,"Best"},
	},
	["Legendary Chest"] = {
		["Color"] = {0,200,255},
		["Keys"] = {4},
		
		{"VIP",3*24*60*60,"VIP"}, -- 3 Days
		{"Money",5000000,"Money"}, -- 5 Million
		{"Exp",25*1000,"Exp"}, -- 25k Exp
		{"Game Coins",250,"Game Coins"}, -- 250 Game Coins
		{"Rocket Launcher",50,"Weapon"},
		{"Launcher",15,"Launcher"},
		{"Grenade",15,"Weapon"},
		{"Points Criminals",500,"Best"},
		{"Points Police",500,"Best"},
	},
	["Lightning Chest"] = {
		["Color"] = {255,200,0},
		["Keys"] = {5},
	
		{"VIP",7*24*60*60,"VIP"}, -- 7 Days
		{"Money",10000000,"Money"}, -- 10 Million
		{"Exp",50*1000,"Exp"}, -- 50k Exp
		{"Game Coins",500,"Game Coins"}, -- 500 Game Coins
		{"Rocket Launcher",100,"Weapon"},
		{"Launcher",30,"Launcher"},
		{"Grenade",30,"Weapon"},
		{"Points Criminals",1000,"Best"},
		{"Points Police",1000,"Best"},
	},
}


--[[for i , v in pairs (Chests) do
	outputChatBox ("{"..i.."}")
end]]


GUIEditor = {
    gridlist = {},
    window = {},
    button = {},
    label = {}
}
------------------------------------------------------------------------------------------------------------------------------------------------
       --[[ GUIEditor.window[1] = guiCreateWindow(732, 345, 447, 436, "Chests", false)
        guiWindowSetSizable(GUIEditor.window[1], false)
        guiSetProperty(GUIEditor.window[1], "CaptionColour", "FF00B8D9")
		guiSetVisible(GUIEditor.window[1],false)

        GUIEditor.label[1] = guiCreateLabel(0.00, 0.05, 1.00, 0.05, "Total Keys: ", true, GUIEditor.window[1])
        guiSetFont(GUIEditor.label[1], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[1], 219, 195, 0)
        guiLabelSetHorizontalAlign(GUIEditor.label[1], "center", false)
        guiLabelSetVerticalAlign(GUIEditor.label[1], "center")
        GUIEditor.gridlist[1] = guiCreateGridList(0.02, 0.14, 0.96, 0.65, true, GUIEditor.window[1])
        guiGridListAddColumn(GUIEditor.gridlist[1], "Chests Name", 0.4)
		guiGridListAddColumn(GUIEditor.gridlist[1], "Amount", 0.4)
        guiGridListAddColumn(GUIEditor.gridlist[1], "Keys", 0.2)
		guiGridListSetSortingEnabled(GUIEditor.gridlist[1],false)
        GUIEditor.button[1] = guiCreateButton(0.03, 0.83, 0.38, 0.11, "Open", true, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FF1EDA00")
        GUIEditor.button[2] = guiCreateButton(0.56, 0.83, 0.38, 0.11, "Close", true, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[2], "NormalTextColour", "FFDA0000")    ]]
------------------------------------------------------------------------------------------------------------------------------------------------

addEvent("[Titans]Chest",true)
addEventHandler("[Titans]Chest",root,
function(Type,Data,Data2)
	
end)


addEventHandler("onClientGUIClick",guiRoot,
function()
	--[[if (source == GUIEditor.button[1]) then
		local Selected = guiGridListGetSelectedItem(GUIEditor.gridlist[1])
		if Selected ~= -1 then
			local ChestName = guiGridListGetItemText(GUIEditor.gridlist[1],Selected,1)
			local ReqKeys = guiGridListGetItemText(GUIEditor.gridlist[1],Selected,3)
			local RewardIndex = math.random(1,#Chests[ChestName])
			triggerServerEvent("[Titans]Chest",localPlayer,"Reward",Chests[ChestName][RewardIndex],ChestName,ReqKeys)
		end
	elseif (source == GUIEditor.button[2]) then
		guiSetVisible(GUIEditor.window[1],false)
		showCursor(false)
	end]]
end)


--[[
bindKey("F2","down",
function()
	if guiGetVisible(GUIEditor.window[1]) then
		guiSetVisible(GUIEditor.window[1],false)
		showCursor(false)
	else
		guiSetVisible(GUIEditor.window[1],true)
		showCursor(true)
		triggerServerEvent("[Titans]Chest",localPlayer,"Refresh")
	end
end)

]]









