local screenW, screenH = guiGetScreenSize()
local ShowMenu = false
local AboutText = xmlNodeGetValue(xmlLoadFile(tostring("Files/About.xml")))
local MainMenu = {
	{"Play",true,255,255,255},
	{"Skin/Team",false,255,255,255},
	{"DeathMatch",false,255,255,255},
	{"Gift",false,255,255,255},
	{"Lottery",false,255,255,255},
}
--local SelectedSkin = (getElementData(localPlayer,"Teams/Skins") or 0 )
local SelectedSkinDx = false
local SortedTeams = {
	{"Criminals",138},
	{"Grove",7},
	{"Ballas",4},
	{"Vagos",3},
	--{"Mafia",3},
	--{"Russians",3},
	--{"Triads",3},
	--{"Rifa",3},
	--{"Da Nang",3},
	{"Aztecas",3},
	{"Medic",4},
	{"Police",18},
}
local CurrentPanel = "Login"
local XC,YC,ZC = 921.7,-1016.4,82.9
local Anmation = nil

local PlayerAccounts = {}

local Cameras = {
	{1494.09,2634.399,15.899,1398.59,2634.1999,12.8,1398.59,2634.1999,12.8,1343.3,2634.19,10.8},
	{-1919.099,718.2999,48.299,-1935.69,670.09997,70.4,-1931.199,644.29,46.5,-1951.09,658.5,102.69},
	{725.2,-1918,1,723.2,-1490.5,1.89,723.2,-1490.5,1.89,725.2,-1576.19,14.7},
	{1278.8,-1181.8,94.2,1275.8,-796.7,88.3,1267,-876.2,75.8,1275.8,-796.7,88.3},
}

local PedSelection = {
	{921.7,-1016.4,82.9		,927.2,-1020.7,82,45},
}

local dxfont0_segoeprb = dxCreateFont("Fonts/segoeprb.ttf", 25)

local TeamsData = {
	["Criminals"] = {
		["Camera"] = {2450.81,-1343.7,26},
		["Ped"] = {2450.9,-1335,23.8,180},
	},
	["Grove"] = {
		["Camera"] = {2484,-1669,18},
		["Ped"] = {2495.8,-1670,13.3,90},
	},
	["Ballas"] = {
		["Camera"] = {2224.27,-1342,27},
		["Ped"] = {2223.46,-1350.7,24,0},
	},
	["Vagos"] = {
		["Camera"] = {2258.4,-1105.6,43},
		["Ped"] = {2252,-1096,41.6,200},
	},
	["Aztecas"] = {
		["Camera"] = {1791.63,-1913.3,17},
		["Ped"] = {1786,-1922,13.39,330},
	},
	["Medic"] = {
		["Camera"] = {1195.27,-1330.9,17},
		["Ped"] = {1203.55,-1331.44,13.39,90},
	},
	["Police"] = {
		["Camera"] = {1578,-1619.9,17},
		["Ped"] = {1588.7,-1619.4,13.38,90},
	},
}

local TeamsSkins = {
	[SortedTeams[1][1]] = {
		{0},
    		{261},
    		{134},
    		{132},
    		{136},
    		{137},
    		{230}, -- 
    		{191},
    		{233},
    		{193},
    		{195},
    		{160},
    		{170},
    		{176},
    		{177},
    		{180},
    		{188},
    		{212},
    		{210},
    		{209},
    		{234},
    		{235},
    		{229}, --
    		{236},
    		{253},
    		{252},
    		{250},
    		{305},
    		{306},
    		{310},
    		{1},
    		{2},
    		{7},
    		{14},
    		{15},
    		{16},
    		{17},
    		{18},
    		{19},
    		{20},
    		{21},
    		{22},
    		{23},
    		{24},
    		{25},
    		{26},
    		{27},
    		{28},	
    		{29},
    		{30},
    		{32},
    		{33},
    		{34},
    		{35},
    		{36},
    		{37},
    		{44},
    		{45},
    		{46},
    		{47},
    		{48},
    		{49},
    		{50},
    		{51},
    		{52},
    		{57},
    		{58},
    		{59},
    		{60},
    		{61},
    		{62},
    		{66},
    		{67},
    		{72},
    		{78},
    		{79},
    		{80},
    		{81},
    		{82},
    		{83},
    		{84},
    		{94},
    		{95},
    		{96},
    		{97},
    		{98},
    		{99},
    		{100},
    		{101},
    		{133},
    		{142},
    		{143},
    		{144},
    		{146},
    		{147},
    		{154},
    		{155},
    		{156},
    		{158},
    		{159},
    		{161},
    		{162},
    		{168},
    		{179},
    		{181},
    		{182},
    		{183},
    		{184},
    		{185},
            {189},
    		{202},
    		{203},
    		{204},
    		{206},
    		{220},
    		{221},
    		{222},
    		{223},
    		{247},
    		{248},
    		{254},
    		{255},
    		{258},
    		{259},
    		{260},
    		{262},
    		{268},
    		{291},
    		{294},
    		{295},
    		{296},
    		{297},
    		{299},
    		{302},
    		{303},
    		{307},
    		{308},
    		{309},
    		{264},
	},
	[SortedTeams[2][1]] = {
		{105},
		{106},	
    		{107},	
    		{270},	
    		{269},
    		{271},
    		{311},
	},
	[SortedTeams[3][1]] = {
				{102},
    		{103},
    		{104},
    		{293},
	},
	[SortedTeams[4][1]] = {

			
			{108},
    		{109},
    		{110},
	},--[=====[ 
	[SortedTeams[5][1]] = {
		{125},
    		{126},
    		{127},
	
	},
	[SortedTeams[6][1]] = {
            {111},
    		{112},
    		{113},
	
	},
	[SortedTeams[7][1]] = {
		{117},
    		{118},
    		{120},
	},
	[SortedTeams[8][1]] = {
		{173},
    		{174},
    		{175},
	},
	[SortedTeams[9][1]] = {
		{122},
    		{121},
    		{123},
	},]=====]--
	[SortedTeams[5][1]] = {--10
		{114},
    		{115},
    		{116},
    		{292},
    
	},
	[SortedTeams[6][1]] = {--11
		{275},
    		{274},
    		{70},
    		{276},
    
	},
	[SortedTeams[7][1]] = {--12
		{280},
    		{312},
    		{267},
    		{163},
    		{164},
    		{165},
    		{166},
    		{281},
    		{282},
    		{265},
    		{283},
    		{286},
    		{71},
    		{266},
    		{284},
    		{288},
    		{285},
    		{287},
	},
}


GUIEditor = {
     checkbox = {},
    staticimage = {},
    edit = {},
    label = {},
	gridlist = {},
}
LoginEditor = {
     checkbox = {},
    staticimage = {},
    edit = {},
    label = {},
	gridlist = {},
}

RegisterEditor = {
    checkbox = {},
    staticimage = {},
    edit = {},
    label = {},
	gridlist = {},
}


MyAccountEditor = {
    checkbox = {},
    staticimage = {},
    edit = {},
    label = {},
	gridlist = {},
}

AboutEditor = {
   checkbox = {},
    staticimage = {},
    edit = {},
    label = {},
	gridlist = {},
}
AdminsOnlineEditor = {
	 checkbox = {},
    staticimage = {},
    edit = {},
    label = {},
	gridlist = {},
}

local LoginPanelStaff = {
	["Main"] = {},
	["Login"] = {},
	["Register"] = {},
	["My Accounts"] = {},
	["About"] = {},
	["Admins Online"] = {},
}


addEventHandler("onClientResourceStart", resourceRoot,
    function()
		-- Login
      --[[ GUIEditor.button[1] = guiCreateButton(0.13, 0.29, 0.08, 0.04, "login", true)
        guiSetAlpha(GUIEditor.button[1], 0.40)
        guiSetFont(GUIEditor.button[1], "default-bold-small")
        guiSetProperty(GUIEditor.button[1], "NormalTextColour", "CBFDFDFD")

        GUIEditor.button[2] = guiCreateButton(0.07, 0.79, 0.12, 0.04, "New Account ", true)
        guiSetAlpha(GUIEditor.button[2], 0.61)
        guiSetFont(GUIEditor.button[2], "default-bold-small")
        guiSetProperty(GUIEditor.button[2], "NormalTextColour", "CBFDFDFD")


        GUIEditor.button[3] = guiCreateButton(0.04, 0.84, 0.07, 0.03, "Replay Videos", true)
        guiSetAlpha(GUIEditor.button[3], 0.40)
        guiSetFont(GUIEditor.button[3], "default-bold-small")
        guiSetProperty(GUIEditor.button[3], "NormalTextColour", "CBFDFDFD")


        GUIEditor.button[4] = guiCreateButton(0.14, 0.84, 0.07, 0.03, "Visit Website ", true)
        guiSetAlpha(GUIEditor.button[4], 0.40)
        guiSetFont(GUIEditor.button[4], "default-bold-small")
        guiSetProperty(GUIEditor.button[4], "NormalTextColour", "CBFDFDFD")


        GUIEditor.label[1] = guiCreateLabel(0.05, 0.30, 0.06, 0.02, "Save Password ", true)


        GUIEditor.label[2] = guiCreateLabel(0.06, 0.76, 0.13, 0.02, "Create your Account ", true)
        guiLabelSetColor(GUIEditor.label[2], 254, 140, 27)
		guiLabelSetColor(GUIEditor.label[2], 254, 140, 27)
        guiLabelSetHorizontalAlign(GUIEditor.label[2], "center", false)


        GUIEditor.label[3] = guiCreateLabel(0.09, 0.74, 0.06, 0.02, "No Account ? ", true)
        guiLabelSetColor(GUIEditor.label[3], 253, 253, 253)
		guiLabelSetHorizontalAlign(GUIEditor.label[3], "center", false)


        GUIEditor.label[4] = guiCreateLabel(0.04, 0.10, 0.17, 0.03, "Server Middle East GangWar", true)
        guiSetAlpha(GUIEditor.label[4], 0.72)
        local font0_ntailub = guiCreateFont("Fonts/ntailub.ttf", 13)
        guiSetFont(GUIEditor.label[4], font0_ntailub)


        GUIEditor.checkbox[1] = guiCreateCheckBox(0.03, 0.30, 0.06, 0.02, "", true, true)


        GUIEditor.edit[1] = guiCreateEdit(0.04, 0.17, 0.16, 0.03, "", true)


        GUIEditor.edit[2] = guiCreateEdit(0.04, 0.24, 0.16, 0.03, "", true) 
		guiEditSetMasked(GUIEditor.edit[2],true)

		-- Register
		
		GUIEditor.button[5] = guiCreateButton(0.13, 0.36, 0.08, 0.04, "Register", true)
        guiSetAlpha(GUIEditor.button[5], 0.40)
        guiSetFont(GUIEditor.button[5], "default-bold-small")
        guiSetProperty(GUIEditor.button[5], "NormalTextColour", "CBFDFDFD")


        GUIEditor.button[6] = guiCreateButton(0.07, 0.79, 0.12, 0.04, "Back", true)
        guiSetAlpha(GUIEditor.button[6], 0.61)
        guiSetFont(GUIEditor.button[6], "default-bold-small")
        guiSetProperty(GUIEditor.button[6], "NormalTextColour", "CBFDFDFD")



        GUIEditor.label[5] = guiCreateLabel(0.05, 0.37, 0.06, 0.02, "Show Password", true)


        GUIEditor.label[6] = guiCreateLabel(0.06, 0.76, 0.13, 0.02, "Press back to cancel account Registration", true)
        guiLabelSetColor(GUIEditor.label[6], 254, 140, 27)
        guiLabelSetHorizontalAlign(GUIEditor.label[6], "center", false)


        GUIEditor.label[7] = guiCreateLabel(0.08, 0.74, 0.09, 0.02, "Already Have account ?", true)
        guiLabelSetColor(GUIEditor.label[7], 253, 253, 253)
        guiLabelSetHorizontalAlign(GUIEditor.label[7], "center", false)




        GUIEditor.checkbox[2] = guiCreateCheckBox(0.03, 0.37, 0.06, 0.02, "", false, true)


        GUIEditor.edit[3] = guiCreateEdit(0.04, 0.17, 0.16, 0.03, "", true)


        GUIEditor.edit[4] = guiCreateEdit(0.04, 0.24, 0.16, 0.03, "", true)
		guiEditSetMasked(GUIEditor.edit[4],true)


        GUIEditor.edit[5] = guiCreateEdit(0.04, 0.31, 0.16, 0.03, "", true)    
		guiEditSetMasked(GUIEditor.edit[5],true)]]
		
		
		
		
		
		
		-- New Login


        --[[GUIEditor.staticimage[1] = guiCreateStaticImage(0.36, 0.47, 0.28, 0.14, "Images/6.png", true)

        GUIEditor.label[1] = guiCreateLabel(0.28, 0.09, 0.67, 0.20, "Account Name: None", true, GUIEditor.staticimage[1])
        guiSetFont(GUIEditor.label[1], "default-bold-small")
        GUIEditor.label[2] = guiCreateLabel(0.28, 0.29, 0.67, 0.20, "Money: $0", true, GUIEditor.staticimage[1])
        guiSetFont(GUIEditor.label[2], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[2], 209, 209, 209)
        GUIEditor.label[3] = guiCreateLabel(0.28, 0.49, 0.67, 0.20, "Bank Money: $0", true, GUIEditor.staticimage[1])
        guiSetFont(GUIEditor.label[3], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[3], 209, 209, 209)
        GUIEditor.label[4] = guiCreateLabel(0.28, 0.69, 0.67, 0.20, "Level: 0", true, GUIEditor.staticimage[1])
        guiSetFont(GUIEditor.label[4], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[4], 209, 209, 209)


        GUIEditor.staticimage[2] = guiCreateStaticImage(0.36, 0.32, 0.28, 0.14, "Images/7.png", true)

        GUIEditor.label[5] = guiCreateLabel(0.28, 0.09, 0.70, 0.18, "Account Name: None", true, GUIEditor.staticimage[2])
        guiSetFont(GUIEditor.label[5], "default-bold-small")
        GUIEditor.label[6] = guiCreateLabel(0.28, 0.27, 0.70, 0.18, "Money: $0", true, GUIEditor.staticimage[2])
        guiSetFont(GUIEditor.label[6], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[6], 209, 209, 209)
        GUIEditor.label[7] = guiCreateLabel(0.28, 0.45, 0.70, 0.18, "Bank Money: $0", true, GUIEditor.staticimage[2])
        guiSetFont(GUIEditor.label[7], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[7], 209, 209, 209)
        GUIEditor.label[8] = guiCreateLabel(0.28, 0.63, 0.70, 0.18, "Level: 0", true, GUIEditor.staticimage[2])
        guiSetFont(GUIEditor.label[8], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[8], 209, 209, 209)


        GUIEditor.staticimage[3] = guiCreateStaticImage(0.36, 0.62, 0.28, 0.14, "Images/8.png", true)

        GUIEditor.label[9] = guiCreateLabel(0.27, 0.09, 0.63, 0.17, "Account Name: None", true, GUIEditor.staticimage[3])
        guiSetFont(GUIEditor.label[9], "default-bold-small")
        GUIEditor.label[10] = guiCreateLabel(0.27, 0.26, 0.63, 0.17, "Money: $0", true, GUIEditor.staticimage[3])
        guiSetFont(GUIEditor.label[10], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[10], 209, 209, 209)
        GUIEditor.label[11] = guiCreateLabel(0.27, 0.43, 0.63, 0.17, "Bank Money: $0", true, GUIEditor.staticimage[3])
        guiSetFont(GUIEditor.label[11], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[11], 209, 209, 209)
        GUIEditor.label[12] = guiCreateLabel(0.27, 0.60, 0.63, 0.17, "Level: 0", true, GUIEditor.staticimage[3])
        guiSetFont(GUIEditor.label[12], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[12], 209, 209, 209)


		-- Reiger
		-- Images = 4 to 7 , labels = 13 to 17 , edit = 1 to 2 , checkbox = 1
        GUIEditor.staticimage[4] = guiCreateStaticImage(0.36, 0.77, 0.27, 0.03, "Images/dot_white.png", true)
        guiSetProperty(GUIEditor.staticimage[4], "ImageColours", "tl:AF000000 tr:AF000000 bl:AF000000 br:AF000000")

        GUIEditor.label[13] = guiCreateLabel(0, 0, 1, 1, "اضغط على الصورة للدخول الى الحساب او تسجيل حساب جديد", true, GUIEditor.staticimage[4])
        guiSetFont(GUIEditor.label[13], "default-small")  
		guiLabelSetVerticalAlign(GUIEditor.label[13],"center")		
		guiLabelSetHorizontalAlign(GUIEditor.label[13],"center")	
		
		
		
		
		
		GUIEditor.staticimage[5] = guiCreateStaticImage(0.68, 0.33, 0.25, 1.00, "Images/dot_white.png", true)
        guiSetProperty(GUIEditor.staticimage[5], "ImageColours", "tl:DA000000 tr:DA000000 bl:DA000000 br:DA000000")

        GUIEditor.edit[1] = guiCreateEdit(0.06, 0.12, 0.87, 0.04, "", true, GUIEditor.staticimage[5])
        GUIEditor.edit[2] = guiCreateEdit(0.06, 0.24, 0.87, 0.04, "", true, GUIEditor.staticimage[5])
		guiEditSetMasked(GUIEditor.edit[2],true)
        GUIEditor.label[14] = guiCreateLabel(0.06, 0.07, 0.60, 0.04, "Username:", true, GUIEditor.staticimage[5])
        local font0_segoeprb = guiCreateFont("Fonts/segoeprb.ttf", 15)
        guiSetFont(GUIEditor.label[14], font0_segoeprb)
        GUIEditor.label[15] = guiCreateLabel(0.06, 0.19, 0.60, 0.04, "Password:", true, GUIEditor.staticimage[5])
        guiSetFont(GUIEditor.label[15], font0_segoeprb)
        GUIEditor.staticimage[6] = guiCreateStaticImage(0.17, 0.35, 0.69, 0.04, "Images/dot_white.png", true, GUIEditor.staticimage[5])
        guiSetProperty(GUIEditor.staticimage[6], "ImageColours", "tl:DA1BFF21 tr:DA1BFF21 bl:DA1BFF21 br:DA1BFF21")

        GUIEditor.label[16] = guiCreateLabel(0, 0, 1, 1, "Login", true, GUIEditor.staticimage[6])
        guiSetFont(GUIEditor.label[16], font0_segoeprb)
		guiLabelSetVerticalAlign(GUIEditor.label[16],"center")		
		guiLabelSetHorizontalAlign(GUIEditor.label[16],"center")	

        GUIEditor.staticimage[7] = guiCreateStaticImage(0.17, 0.40, 0.69, 0.04, "Images/dot_white.png", true, GUIEditor.staticimage[5])
        guiSetProperty(GUIEditor.staticimage[7], "ImageColours", "tl:DA1BFF21 tr:DA1BFF21 bl:DA1BFF21 br:DA1BFF21")

        GUIEditor.label[17] = guiCreateLabel(0, 0, 1, 1, "Register", true, GUIEditor.staticimage[7])
        local font1_segoeprb = guiCreateFont("Fonts/segoeprb.ttf", 17)
        guiSetFont(GUIEditor.label[17], font1_segoeprb)
		guiLabelSetVerticalAlign(GUIEditor.label[17],"center")		
		guiLabelSetHorizontalAlign(GUIEditor.label[17],"center")	

        GUIEditor.checkbox[1] = guiCreateCheckBox(0.18, 0.29, 0.41, 0.02, "Show Password", false, true, GUIEditor.staticimage[5])
        guiSetFont(GUIEditor.checkbox[1], "default-bold-small")  ]]
		
		
		
		
		
		
		GUIEditor.staticimage[1] = guiCreateStaticImage(0.21, 0.26, 0.49, 0.49, "Images/dot_white.png", true)
        guiSetProperty(GUIEditor.staticimage[1], "ImageColours", "tl:5D000000 tr:5D000000 bl:5D000000 br:5D000000")

        GUIEditor.staticimage[2] = guiCreateStaticImage(0.02, 0.03, 0.21, 0.09, "Images/dot_white.png", true, GUIEditor.staticimage[1])
        guiSetProperty(GUIEditor.staticimage[2], "ImageColours", "tl:5B000000 tr:5B000000 bl:5B000000 br:5B000000")

        GUIEditor.staticimage[3] = guiCreateStaticImage(0.00, 0.00, 1.00, 0.12, "Images/dot_white.png", true, GUIEditor.staticimage[2])
        guiSetProperty(GUIEditor.staticimage[3], "ImageColours", "tl:FFF2FB00 tr:FFF2FB00 bl:FFF2FB00 br:FFF2FB00")
        GUIEditor.label[1] = guiCreateLabel(0, 0, 1, 1, "Login", true, GUIEditor.staticimage[2])
		guiLabelSetHorizontalAlign(GUIEditor.label[1],"center")
		guiLabelSetVerticalAlign(GUIEditor.label[1],"center")

        GUIEditor.staticimage[4] = guiCreateStaticImage(0.02, 0.16, 0.21, 0.09, "Images/dot_white.png", true, GUIEditor.staticimage[1])
        guiSetProperty(GUIEditor.staticimage[4], "ImageColours", "tl:5B000000 tr:5B000000 bl:5B000000 br:5B000000")

        GUIEditor.staticimage[5] = guiCreateStaticImage(0.00, 0.00, 1.00, 0.12, "Images/dot_white.png", true, GUIEditor.staticimage[4])
        guiSetProperty(GUIEditor.staticimage[5], "ImageColours", "tl:FFF2FB00 tr:FFF2FB00 bl:FFF2FB00 br:FFF2FB00")
        GUIEditor.label[2] = guiCreateLabel(0, 0, 1, 1, "Register", true, GUIEditor.staticimage[4])
		guiLabelSetHorizontalAlign(GUIEditor.label[2],"center")
		guiLabelSetVerticalAlign(GUIEditor.label[2],"center")

        GUIEditor.staticimage[6] = guiCreateStaticImage(0.02, 0.29, 0.21, 0.09, "Images/dot_white.png", true, GUIEditor.staticimage[1])
        guiSetProperty(GUIEditor.staticimage[6], "ImageColours", "tl:5B000000 tr:5B000000 bl:5B000000 br:5B000000")

        GUIEditor.staticimage[7] = guiCreateStaticImage(0.00, 0.00, 0.99, 0.12, "Images/dot_white.png", true, GUIEditor.staticimage[6])
        guiSetProperty(GUIEditor.staticimage[7], "ImageColours", "tl:FFF2FB00 tr:FFF2FB00 bl:FFF2FB00 br:FFF2FB00")
        GUIEditor.label[3] = guiCreateLabel(0, 0, 1, 1, "My Accounts", true, GUIEditor.staticimage[6])
		guiLabelSetHorizontalAlign(GUIEditor.label[3],"center")
		guiLabelSetVerticalAlign(GUIEditor.label[3],"center")

        GUIEditor.staticimage[8] = guiCreateStaticImage(0.02, 0.41, 0.21, 0.09, "Images/dot_white.png", true, GUIEditor.staticimage[1])
        guiSetProperty(GUIEditor.staticimage[8], "ImageColours", "tl:5B000000 tr:5B000000 bl:5B000000 br:5B000000")

        GUIEditor.staticimage[9] = guiCreateStaticImage(0.00, 0.00, 1.00, 0.12, "Images/dot_white.png", true, GUIEditor.staticimage[8])
        guiSetProperty(GUIEditor.staticimage[9], "ImageColours", "tl:FFF2FB00 tr:FFF2FB00 bl:FFF2FB00 br:FFF2FB00")
        GUIEditor.label[4] = guiCreateLabel(0, 0, 1, 1, "About", true, GUIEditor.staticimage[8])
		guiLabelSetHorizontalAlign(GUIEditor.label[4],"center")
		guiLabelSetVerticalAlign(GUIEditor.label[4],"center")

        GUIEditor.staticimage[10] = guiCreateStaticImage(0.02, 0.55, 0.21, 0.09, "Images/dot_white.png", true, GUIEditor.staticimage[1])
        guiSetProperty(GUIEditor.staticimage[10], "ImageColours", "tl:5B000000 tr:5B000000 bl:5B000000 br:5B000000")

        GUIEditor.staticimage[11] = guiCreateStaticImage(0.00, 0.00, 0.99, 0.12, "Images/dot_white.png", true, GUIEditor.staticimage[10])
        guiSetProperty(GUIEditor.staticimage[11], "ImageColours", "tl:FFF2FB00 tr:FFF2FB00 bl:FFF2FB00 br:FFF2FB00")
        GUIEditor.label[5] = guiCreateLabel(0, 0, 1, 1, "Admins Online", true, GUIEditor.staticimage[10])
		guiLabelSetHorizontalAlign(GUIEditor.label[5],"center")
		guiLabelSetVerticalAlign(GUIEditor.label[5],"center")

        GUIEditor.staticimage[12] = guiCreateStaticImage(0.24, 0.11, 0.71, 0.83, "Images/dot_white.png", true, GUIEditor.staticimage[1])
        guiSetProperty(GUIEditor.staticimage[12], "ImageColours", "tl:5B000000 tr:5B000000 bl:5B000000 br:5B000000")

        GUIEditor.staticimage[13] = guiCreateStaticImage(0.00, 0.00, 1.00, 0.02, "Images/dot_white.png", true, GUIEditor.staticimage[12])
        guiSetProperty(GUIEditor.staticimage[13], "ImageColours", "tl:FFF2FB00 tr:FFF2FB00 bl:FFF2FB00 br:FFF2FB00")
        GUIEditor.staticimage[14] = guiCreateStaticImage(0.03, 0.17, 0.95, 0.70, "Images/dot_white.png", true, GUIEditor.staticimage[12])
        guiSetProperty(GUIEditor.staticimage[14], "ImageColours", "tl:5D000000 tr:5D000000 bl:5D000000 br:5D000000")
		
		
		
		GUIEditor.staticimage[15] = guiCreateStaticImage(0.21, 0.21, 0.12, 0.05, "Images/dot_white.png", true)
        guiSetProperty(GUIEditor.staticimage[15], "ImageColours", "tl:5D000000 tr:5D000000 bl:5D000000 br:5D000000")

        GUIEditor.staticimage[16] = guiCreateStaticImage(0.00, 0.00, 1.00, 0.14, "Images/dot_white.png", true, GUIEditor.staticimage[15])
        guiSetProperty(GUIEditor.staticimage[16], "ImageColours", "tl:FFF2FB00 tr:FFF2FB00 bl:FFF2FB00 br:FFF2FB00")
        GUIEditor.label[6] = guiCreateLabel(0, 0, 1, 1, "« Login Panel »", true, GUIEditor.staticimage[15])
		guiLabelSetHorizontalAlign(GUIEditor.label[6],"center")
		guiLabelSetVerticalAlign(GUIEditor.label[6],"center")
		
		
		GUIEditor.staticimage[17] = guiCreateStaticImage(0.03, 0.05, 0.95, 0.08, "Images/dot_white.png", true, GUIEditor.staticimage[12])
        guiSetProperty(GUIEditor.staticimage[17], "ImageColours", "tl:5D000000 tr:5D000000 bl:5D000000 br:5D000000")

        GUIEditor.label[7] = guiCreateLabel(0, 0, 1, 1, "Login", true, GUIEditor.staticimage[17])
		guiLabelSetHorizontalAlign(GUIEditor.label[7],"center")
		guiLabelSetVerticalAlign(GUIEditor.label[7],"center")

        
		
		
		

		-- Login
		LoginEditor.edit[1] = guiCreateEdit(0.31, 0.17, 0.39, 0.10, "", true, GUIEditor.staticimage[14])
        LoginEditor.label[1] = guiCreateLabel(0.31, 0.07, 0.18, 0.10, "- Username:", true, GUIEditor.staticimage[14])
        LoginEditor.edit[2] = guiCreateEdit(0.31, 0.41, 0.39, 0.10, "", true, GUIEditor.staticimage[14])
        LoginEditor.checkbox[1] = guiCreateCheckBox(0.31, 0.54, 0.25, 0.08, "Show Password!", true, true, GUIEditor.staticimage[14])
        LoginEditor.label[2] = guiCreateLabel(0.31, 0.31, 0.18, 0.10, "- Password:", true, GUIEditor.staticimage[14])
        LoginEditor.staticimage[1] = guiCreateStaticImage(0.31, 0.77, 0.39, 0.14, "Images/dot_white.png", true, GUIEditor.staticimage[14])
        guiSetProperty(LoginEditor.staticimage[1], "ImageColours", "tl:87000000 tr:87000000 bl:87000000 br:87000000")

        LoginEditor.staticimage[2] = guiCreateStaticImage(0.00, 0.00, 1.00, 0.13, "Images/dot_white.png", true, LoginEditor.staticimage[1])
        guiSetProperty(LoginEditor.staticimage[2], "ImageColours", "tl:FFF2FB00 tr:FFF2FB00 bl:FFF2FB00 br:FFF2FB00")
        LoginEditor.label[3] = guiCreateLabel(0, 0, 1, 1, "Login", true, LoginEditor.staticimage[1])
		guiLabelSetHorizontalAlign(LoginEditor.label[3],"center")
		guiLabelSetVerticalAlign(LoginEditor.label[3],"center")
		
		
		LoginEditor.staticimage[3] = guiCreateStaticImage(0.03, 0.89, 0.95, 0.08, "Images/dot_white.png", true, GUIEditor.staticimage[12])
        guiSetProperty(LoginEditor.staticimage[3], "ImageColours", "tl:5D000000 tr:5D000000 bl:5D000000 br:5D000000")

        LoginEditor.label[4] = guiCreateLabel(0, 0, 1, 1, "ادخل بياناتك وسجل دخولك!", true, LoginEditor.staticimage[3])
        guiLabelSetColor(LoginEditor.label[4], 35, 251, 0)
		guiLabelSetHorizontalAlign(LoginEditor.label[4],"center")
		guiLabelSetVerticalAlign(LoginEditor.label[4],"center")
		


		-- Register
		RegisterEditor.label[1] = guiCreateLabel(0.31, 0.03, 0.18, 0.10, "- Username:", true, GUIEditor.staticimage[14])
		RegisterEditor.label[2] = guiCreateLabel(0.31, 0.24, 0.18, 0.10, "- Password:", true, GUIEditor.staticimage[14])
		RegisterEditor.label[3] = guiCreateLabel(0.31, 0.43, 0.18, 0.10, "- Confirm Password:", true, GUIEditor.staticimage[14])
		
		RegisterEditor.edit[1] = guiCreateEdit(0.31, 0.11, 0.39, 0.10, "", true, GUIEditor.staticimage[14]) -- Username
        RegisterEditor.edit[2] = guiCreateEdit(0.31, 0.32, 0.39, 0.10, "", true, GUIEditor.staticimage[14]) -- Password
		RegisterEditor.edit[3] = guiCreateEdit(0.31, 0.52, 0.39, 0.10, "", true, GUIEditor.staticimage[14]) -- Confirm Password
		
		
        RegisterEditor.checkbox[1] = guiCreateCheckBox(0.31, 0.65, 0.25, 0.08, "Show Password!", true, true, GUIEditor.staticimage[14])

		
		
        RegisterEditor.staticimage[1] = guiCreateStaticImage(0.31, 0.77, 0.39, 0.14, "Images/dot_white.png", true, GUIEditor.staticimage[14])
        guiSetProperty(RegisterEditor.staticimage[1], "ImageColours", "tl:87000000 tr:87000000 bl:87000000 br:87000000")

        RegisterEditor.staticimage[2] = guiCreateStaticImage(0.00, 0.00, 1.00, 0.13, "Images/dot_white.png", true, RegisterEditor.staticimage[1])
        guiSetProperty(RegisterEditor.staticimage[2], "ImageColours", "tl:FFF2FB00 tr:FFF2FB00 bl:FFF2FB00 br:FFF2FB00")
        RegisterEditor.label[4] = guiCreateLabel(0, 0, 1, 1, "Register", true, RegisterEditor.staticimage[1])
		guiLabelSetHorizontalAlign(RegisterEditor.label[4],"center")
		guiLabelSetVerticalAlign(RegisterEditor.label[4],"center")
		
		
		RegisterEditor.staticimage[3] = guiCreateStaticImage(0.03, 0.89, 0.95, 0.08, "Images/dot_white.png", true, GUIEditor.staticimage[12])
        guiSetProperty(RegisterEditor.staticimage[3], "ImageColours", "tl:5D000000 tr:5D000000 bl:5D000000 br:5D000000")

        RegisterEditor.label[5] = guiCreateLabel(0, 0, 1, 1, "-", true, RegisterEditor.staticimage[3])
        guiLabelSetColor(RegisterEditor.label[5], 35, 251, 0)
		guiLabelSetHorizontalAlign(RegisterEditor.label[5],"center")
		guiLabelSetVerticalAlign(RegisterEditor.label[5],"center")
		
		
		
		--My Accounts

		MyAccountEditor.staticimage[1] = guiCreateStaticImage(0, 0, 0.3, 1, "Images/dot_white.png", true, GUIEditor.staticimage[14])-- 1
		guiSetProperty(MyAccountEditor.staticimage[1], "ImageColours", "tl:5D000000 tr:5D000000 bl:5D000000 br:5D000000")
		
		MyAccountEditor.staticimage[2] = guiCreateStaticImage(0.35, 0, 0.3, 1, "Images/dot_white.png", true, GUIEditor.staticimage[14])-- 1
		guiSetProperty(MyAccountEditor.staticimage[2], "ImageColours", "tl:5D000000 tr:5D000000 bl:5D000000 br:5D000000")
		
		MyAccountEditor.staticimage[3] = guiCreateStaticImage(0.7, 0, 0.3, 1, "Images/dot_white.png", true, GUIEditor.staticimage[14])-- 1
		guiSetProperty(MyAccountEditor.staticimage[3], "ImageColours", "tl:5D000000 tr:5D000000 bl:5D000000 br:5D000000")
		
		-- 4kl fo2
		MyAccountEditor.staticimage[4] = guiCreateStaticImage(0.00, 0.00, 1, 0.03, "Images/dot_white.png", true, MyAccountEditor.staticimage[1])-- 1
		guiSetProperty(MyAccountEditor.staticimage[4], "ImageColours", "tl:FFF8FB00 tr:FFF8FB00 bl:FFF8FB00 br:FFF8FB00")
		
		MyAccountEditor.staticimage[5] = guiCreateStaticImage(0.00, 0.00, 1, 0.03, "Images/dot_white.png", true, MyAccountEditor.staticimage[2])-- 1
		guiSetProperty(MyAccountEditor.staticimage[5], "ImageColours", "tl:FFF8FB00 tr:FFF8FB00 bl:FFF8FB00 br:FFF8FB00")
		
		MyAccountEditor.staticimage[6] = guiCreateStaticImage(0.00, 0.00, 1, 0.03, "Images/dot_white.png", true, MyAccountEditor.staticimage[3])-- 1
		guiSetProperty(MyAccountEditor.staticimage[6], "ImageColours", "tl:FFF8FB00 tr:FFF8FB00 bl:FFF8FB00 br:FFF8FB00")
		
		for i=0 , 2 do
			--local Width = (i*0.35)

			--                   2
			MyAccountEditor.edit[1+(i*2)] = guiCreateEdit(0.08, 0.15, 0.83, 0.10, "", true, MyAccountEditor.staticimage[i+1])
			MyAccountEditor.edit[2+(i*2)] = guiCreateEdit(0.08, 0.41, 0.83, 0.10, "", true, MyAccountEditor.staticimage[i+1])
			guiEditSetReadOnly(MyAccountEditor.edit[1+(i*2)],true)
			guiEditSetReadOnly(MyAccountEditor.edit[2+(i*2)],true)
			
			MyAccountEditor.label[1+(i*3)] = guiCreateLabel(0.23, 0.07, 0.46, 0.08, "Username:", true, MyAccountEditor.staticimage[i+1])
			MyAccountEditor.label[2+(i*3)] = guiCreateLabel(0.29, 0.34, 0.41, 0.07, "Password:", true, MyAccountEditor.staticimage[i+1])
			
			MyAccountEditor.staticimage[i+7] = guiCreateStaticImage(0.08, 0.81, 0.82, 0.14, "Images/dot_white.png", true, MyAccountEditor.staticimage[i+1]) -- 0
			guiSetProperty(MyAccountEditor.staticimage[i+7], "ImageColours", "tl:87000000 tr:87000000 bl:87000000 br:87000000")
			MyAccountEditor.label[3+(i*3)] = guiCreateLabel(0, 0, 1, 1, "Login", true, MyAccountEditor.staticimage[i+7])
			guiLabelSetHorizontalAlign(MyAccountEditor.label[3+(i*3)],"center")
			guiLabelSetVerticalAlign(MyAccountEditor.label[3+(i*3)],"center")

			MyAccountEditor.checkbox[i+1] = guiCreateCheckBox(0.08, 0.56, 0.77, 0.09, "حماية", false, true, MyAccountEditor.staticimage[i+1])
			guiSetProperty(MyAccountEditor.checkbox[i+1], "NormalTextColour", "FF05FE00")
		end
		
		MyAccountEditor.staticimage[10] = guiCreateStaticImage(0.03, 0.89, 0.95, 0.08, "Images/dot_white.png", true, GUIEditor.staticimage[12])-- 1
        guiSetProperty(MyAccountEditor.staticimage[10], "ImageColours", "tl:5D000000 tr:5D000000 bl:5D000000 br:5D000000")

        MyAccountEditor.label[10] = guiCreateLabel(0.20, 0.12, 0.60, 0.80, "عند إلغاء حماية الحساب ستعرض حسابك للاختراق", true, MyAccountEditor.staticimage[10])-- 1
        guiLabelSetColor(MyAccountEditor.label[10], 248, 251, 0)
		guiLabelSetHorizontalAlign(MyAccountEditor.label[10],"center")
		guiLabelSetVerticalAlign(MyAccountEditor.label[10],"center")
		
		-- About
		AboutEditor.label[1] = guiCreateLabel(0, 0, 1, 1, (AboutText or "Hello It's Me"), true, GUIEditor.staticimage[14])
		guiLabelSetHorizontalAlign(AboutEditor.label[1],"center")
		guiLabelSetVerticalAlign(AboutEditor.label[1],"center")
		guiLabelSetColor(AboutEditor.label[1],255,255,0)
		-- Admins Online
		AdminsOnlineEditor.gridlist[1] = guiCreateGridList(0, 0, 1, 1, true, GUIEditor.staticimage[14])
        guiGridListAddColumn(AdminsOnlineEditor.gridlist[1], "Name", 0.6)
		guiGridListAddColumn(AdminsOnlineEditor.gridlist[1], "Rank", 0.35)
		
		
		for i=1,30 do
			table.insert(LoginPanelStaff["Main"],{  (GUIEditor.staticimage[i] or nil)  ,  (GUIEditor.edit[i] or nil)  ,  (GUIEditor.label[i] or nil) , (GUIEditor.checkbox[i] or nil)  }  )
			table.insert(LoginPanelStaff["Login"],{  (LoginEditor.staticimage[i] or nil)  ,  (LoginEditor.edit[i] or nil)  ,  (LoginEditor.label[i] or nil) , (LoginEditor.checkbox[i] or nil)  }  )
			table.insert(LoginPanelStaff["Register"],{  (RegisterEditor.staticimage[i] or nil)  ,  (RegisterEditor.edit[i] or nil)  ,  (RegisterEditor.label[i] or nil) , (RegisterEditor.checkbox[i] or nil)  }  )
			table.insert(LoginPanelStaff["My Accounts"],{  (MyAccountEditor.staticimage[i] or nil)  ,  (MyAccountEditor.edit[i] or nil)  ,  (MyAccountEditor.label[i] or nil) , (MyAccountEditor.checkbox[i] or nil)  }  )
			table.insert(LoginPanelStaff["About"],{  (AboutEditor.label[i] or nil)  ,  (AboutEditor.edit[i] or nil)  ,  (AboutEditor.label[i] or nil) , (AboutEditor.checkbox[i] or nil)  }  )
			table.insert(LoginPanelStaff["Admins Online"],{  (AdminsOnlineEditor.gridlist[i] or nil)  ,  (AdminsOnlineEditor.edit[i] or nil)  ,  (AdminsOnlineEditor.label[i] or nil) , (AdminsOnlineEditor.checkbox[i] or nil)  }  )
		end
		
		
	
		
		
		
		
	-- Skin
		TeamLeft = guiCreateButton(0.41, 0.74, 0.03, 0.04, "", true)


        SkinLeft = guiCreateButton(0.43, 0.78, 0.03, 0.04, "", true)


        SkinRight = guiCreateButton(0.52, 0.78, 0.03, 0.04, "", true)


        TeamRight = guiCreateButton(0.55, 0.75, 0.03, 0.04, "", true)   

		guiSetVisible (TeamLeft,false)
		guiSetVisible (TeamRight,false)
		guiSetVisible (SkinLeft,false)
		guiSetVisible (SkinRight,false)
		
		guiSetAlpha(TeamLeft,0)
		guiSetAlpha(TeamRight,0)
		guiSetAlpha(SkinLeft,0)
		guiSetAlpha(SkinRight,0)
    end
)





function RGBToHex(red, green, blue, alpha)
	if((red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255) or (alpha and (alpha < 0 or alpha > 255))) then
		return nil
	end
	if(alpha) then
		return string.format("%.2X%.2X%.2X%.2X", red,green,blue,alpha)
	else
		return string.format("%.2X%.2X%.2X", red,green,blue)
	end
end

local AccountsColor = {
	[1] = {255,255,0},
	[2] = {0,255,0},
	[3] = {0,255,255},
}

--[[function EnterExitMain ()
	for i=1,3 do
		if source == GUIEditor.staticimage[i] then
			local r,g,b = unpack(AccountsColor[i])
			if eventName == "onClientMouseEnter" then
				i = i -1
				guiLabelSetColor(GUIEditor.label[1+(i*4)],r,g,b)
				guiLabelSetColor(GUIEditor.label[2+(i*4)],r,g,b)
				guiLabelSetColor(GUIEditor.label[3+(i*4)],r,g,b)
				guiLabelSetColor(GUIEditor.label[4+(i*4)],r,g,b)
				
				guiSetProperty(GUIEditor.staticimage[6], "ImageColours", "tl:"..RGBToHex(255,r,g,b).." tr:"..RGBToHex(255,r,g,b).." bl:"..RGBToHex(255,r,g,b).." br:"..RGBToHex(255,r,g,b) ) 
				guiSetProperty(GUIEditor.staticimage[7], "ImageColours", "tl:"..RGBToHex(255,r,g,b).." tr:"..RGBToHex(255,r,g,b).." bl:"..RGBToHex(255,r,g,b).." br:"..RGBToHex(255,r,g,b) ) 
				
				for ss=14,15 do
					guiLabelSetColor(GUIEditor.label[ss],r,g,b)
				end
			else
				i = i -1
				guiLabelSetColor(GUIEditor.label[1+(i*4)],255,255,255)
				guiLabelSetColor(GUIEditor.label[2+(i*4)],255,255,255)
				guiLabelSetColor(GUIEditor.label[3+(i*4)],255,255,255)
				guiLabelSetColor(GUIEditor.label[4+(i*4)],255,255,255)
				
				guiSetProperty(GUIEditor.staticimage[6], "ImageColours", "tl:"..RGBToHex(255,255,255,255).." tr:"..RGBToHex(255,255,255,255).." bl:"..RGBToHex(255,255,255,255).." br:"..RGBToHex(255,255,255,255) ) 
				guiSetProperty(GUIEditor.staticimage[7], "ImageColours", "tl:"..RGBToHex(255,255,255,255).." tr:"..RGBToHex(255,255,255,255).." bl:"..RGBToHex(255,255,255,255).." br:"..RGBToHex(255,255,255,255) ) 
				
				for ss=14,15 do
					guiLabelSetColor(GUIEditor.label[ss],255,255,255)
				end
			end
		end
	end
end
addEventHandler("onClientMouseEnter",guiRoot,EnterExitMain)
addEventHandler("onClientMouseLeave",guiRoot,EnterExitMain)]]

function guiChangeLoginPanel (Type)
	if Type == "Login" then
		for i=5 , 7 do
			guiSetVisible(GUIEditor.staticimage[i],false)
		end
		for i=14 , 17 do
			guiSetVisible(GUIEditor.label[i],false)
		end
		guiSetVisible(GUIEditor.checkbox[1],false)
		guiSetVisible(GUIEditor.edit[1],false)
		guiSetVisible(GUIEditor.edit[2],false)
	elseif Type == "Register" then
		for i=1 , 7 do
			guiSetVisible(GUIEditor.staticimage[i],true)
		end
		for i=1 , 17 do
			guiSetVisible(GUIEditor.label[i],true)
		end
		guiSetVisible(GUIEditor.checkbox[1],true)
		guiSetVisible(GUIEditor.edit[1],true)
		guiSetVisible(GUIEditor.edit[2],true)
	end
	CurrentPanel = Type
end

function guiShowLoginPanel (Type,Window)
	if Type == false then
		for i , v in pairs (LoginPanelStaff) do
			for Index , Data in pairs (LoginPanelStaff[i]) do
				if isElement(Data[1]) then
					guiSetVisible(Data[1],Type)
				end
				if isElement(Data[2]) then
					guiSetVisible(Data[2],Type)
				end
				if isElement(Data[3]) then
					guiSetVisible(Data[3],Type)
				end
				if isElement(Data[4]) then
					guiSetVisible(Data[4],Type)
				end
			end
		end
	elseif Type == true then
		for i , v in pairs (LoginPanelStaff) do
			if i == "Main" or i == Window then
				for Index , Data in pairs (LoginPanelStaff[i]) do
					if isElement(Data[1]) then
						guiSetVisible(Data[1],Type)
					end
					if isElement(Data[2]) then
						guiSetVisible(Data[2],Type)
					end
					if isElement(Data[3]) then
						guiSetVisible(Data[3],Type)
					end
					if isElement(Data[4]) then
						guiSetVisible(Data[4],Type)
					end
				end
			end
		end
	end
end






local dxfont0_ntailub = dxCreateFont("Fonts/ntailub.ttf", 11)
local dxfont1_ntailub = dxCreateFont("Fonts/ntailub.ttf", 10)







function isLabelFromMainMenu (Element)
	for i , v in pairs  (MainMenuLabels) do
		if MainMenuLabels[i] == Element then 
			return true
		end
	end
	return false
end

function mainMenuSetSelected (SelectedName)
	for i , v in pairs (MainMenu) do
		if SelectedName and v[1] == SelectedName then
			local Team = getTeamFromSkinID((SelectedSkin or 0)  )
			local r,g,b = getTeamColor(getTeamFromName(Team)) 
			exports["[Titans]SideWindow"]:ChangeSideWindowColor(r,g,b)
			v[2] = true
			v[3] = r
			v[4] = g
			v[5] = b
		else
			v[2] = false
			v[3] = 255
			v[4] = 255
			v[5] = 255
		end
	end
end

function refreshMenuColor ()
	for i , v in pairs (MainMenu) do
		if v[2] == true then
			local Team = getTeamFromSkinID((SelectedSkin or 0)  )
			local r,g,b = getTeamColor(getTeamFromName(Team)) 
			v[3] = r
			v[4] = g
			v[5] = b
		end
	end
end

function getTeamFromSkinID (ID)
	for i , v in pairs (TeamsSkins) do
		for Index , Data in pairs (TeamsSkins[i] ) do
			if Data[1] == ID then
				return i
			end
		end
	end
end

function getTeamSkinsNumbers (Team)
	for i , v in pairs (SortedTeams) do
		if v[1] == Team then
			return v[2]
		end
	end
end

function getTeamTotalSkinsAndSelectedSkin (Team,ID)
	for i , v in pairs (SortedTeams) do
		if v[1] == Team then
			for Index , Element in pairs( TeamsSkins[Team] ) do
				if Element[1] == ID then
					return Index.."/"..getTeamSkinsNumbers(Team)
				end
			end
		end
	end
end

function getTeamSkinIndex (Team,ID)
	for Index , Element in pairs( TeamsSkins[Team] ) do
		if Element[1] == ID then
			return Index
		end
	end
end

function getNextTeamFromName (Team)
	for i , v in pairs (SortedTeams) do
		if v[1] == Team then
			if (i+1) <= #SortedTeams then--12
				return SortedTeams[i+1][1]
			else
				return SortedTeams[1][1]
			end
		end
	end
end

function getPrevTeamFromName (Team)
	for i , v in pairs (SortedTeams) do
		if v[1] == Team then
			if (i-1) >= 1 then
				return SortedTeams[i-1][1]
			else
				return SortedTeams[#SortedTeams][1]--12
			end
		end
	end
end


function getNextSkinFromID(ID)
	for i , v in pairs (TeamsSkins) do
		for Index , Data in pairs (TeamsSkins[i] ) do
			if Data[1] == ID then
				if (getTeamSkinIndex(i,ID) + 1) <= getTeamSkinsNumbers(i)  then
					return TeamsSkins[i][Index+1][1]
				end
			end
		end
	end
end

function getPrevSkinFromID(ID)
	for i , v in pairs (TeamsSkins) do
		for Index , Data in pairs (TeamsSkins[i] ) do
			if Data[1] == ID then
				if (getTeamSkinIndex(i,ID) - 1) ~= 0 and (getTeamSkinIndex(i,ID) - 1) <= getTeamSkinsNumbers(i)  then
					return TeamsSkins[i][Index-1][1]
				end
			end
		end
	end
end

function getCameraPositionFromMenu (Name)
	for i , v in pairs (MainMenu) do
		if Name == MainMenu[2][1] then
			return XC , YC , ZC , 927.2,-1020.7,82 , 923.5,-1018.79,82.5 , 927.2,-1020.7,82
		elseif Name == MainMenu[3][1] then
			return XC , YC , ZC , 927.2,-1020.7,82 , 925.2,-1019.7,82.5 , 927.2,-1020.7,82
		elseif Name == MainMenu[4][1] then
			return XC , YC , ZC , 925.9,-1022.5,82.69 , 926.29,-1022.5,83 , 926.299,-1025.8,83
		elseif Name == MainMenu[5][1] then
			return XC , YC , ZC , 925.9,-1022.5,82.69 , 926.29,-1022.5,83 , 926.299,-1025.8,83
		end
	end
end

function convertNumber ( number )  
	local formatted = number  
	while true do      
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')    
		if ( k==0 ) then      
			break   
		end  
	end  
	return formatted
end

local sm = {}
sm.moov = 0
sm.object1,sm.object2 = nil,nil
 
local function removeCamHandler()
	if(sm.moov == 1)then
		sm.moov = 0
	end
end
 
local function camRender()
	if (sm.moov == 1) then
		local x1,y1,z1 = getElementPosition(sm.object1)
		local x2,y2,z2 = getElementPosition(sm.object2)
		setCameraMatrix(x1,y1,z1,x2,y2,z2)
	end
end
addEventHandler("onClientPreRender",root,camRender)
 
function smoothMoveCamera(x1,y1,z1,x1t,y1t,z1t,x2,y2,z2,x2t,y2t,z2t,time)
	if(sm.moov == 1)then return false end
	sm.object1 = createObject(1337,x1,y1,z1)
	sm.object2 = createObject(1337,x1t,y1t,z1t)
	setElementAlpha(sm.object1,0)
	setElementAlpha(sm.object2,0)
	setObjectScale(sm.object1,0.01)
	setObjectScale(sm.object2,0.01)
	moveObject(sm.object1,time,x2,y2,z2,0,0,0,"InOutQuad")
	moveObject(sm.object2,time,x2t,y2t,z2t,0,0,0,"InOutQuad")
	sm.moov = 1
	setTimer(removeCamHandler,time,1)
	setTimer(destroyElement,time,1,sm.object1)
	setTimer(destroyElement,time,1,sm.object2)
	return true
end


function dxDrawFramedText(message, left, top, width, height, color, scale, sans, alignX, alignY, clip, wordBreak, postGUI, frameColor)
  if not color then
    color = tocolor(255, 255, 255, 255)
  end
  if not frameColor then
    frameColor = tocolor(0, 0, 0, 255)
  end
  if not scale then
    scale = 1
  end
  if not sans then
    sans = "sans"
  end
  if not alignX then
    alignX = "center"
  end
  if not alignY then
    alignY = "top"
  end
  if not clip then
    clip = false
  end
  if not wordBreak then
    wordBreak = false
  end
  message1 = string.gsub(message, "#%x%x%x%x%x%x", "")
  dxDrawText(message, left + 1, top + 1, width + 1, height + 1, frameColor, scale, sans, alignX, alignY, clip, wordBreak, true)
  dxDrawText(message, left + 1, top - 1, width + 1, height - 1, frameColor, scale, sans, alignX, alignY, clip, wordBreak, true)
  dxDrawText(message, left - 1, top + 1, width - 1, height + 1, frameColor, scale, sans, alignX, alignY, clip, wordBreak, true)
  dxDrawText(message, left - 1, top - 1, width - 1, height - 1, frameColor, scale, sans, alignX, alignY, clip, wordBreak, true)
  dxDrawText(message, left, top, width, height, color, scale, sans, alignX, alignY, clip, wordBreak, true)
end

starTick = getTickCount()




--changeTeam = false

function onChangeTeam()
    if changeTeam == false then
        changeTeam = true
		--exports["guimessages"]:outputClient("You Can Now Change Team", 0, 0, 255)
    elseif changeTeam == true then
	    changeTeam = false
	    --exports["guimessages"]:outputClient("You Can't Now Change Team", 255, 0, 0)
    end
end
--bindKey("F4","down", onChangeTeam)

MainMenuLabels = {}
for i , v in pairs (MainMenu) do
	local Widths = (0.0472*i)
	MainMenuLabels[i] = guiCreateLabel(0.0432, (0.4676+Widths), 0.1464, 0.0444, v[1], true)
	guiLabelSetHorizontalAlign(MainMenuLabels[i], "center", false)
	guiLabelSetVerticalAlign(MainMenuLabels[i], "bottom")   
	guiSetAlpha(MainMenuLabels[i],0)
	guiSetVisible(MainMenuLabels[i],false)
end




function EnterOrExitLabel (x,y,GUI)
	if source then
		if isLabelFromMainMenu(source) then
			if eventName == "onClientMouseEnter" then
			--	mainMenuSetSelected( guiGetText(source) )
			elseif eventName == "onClientMouseLeave" then
				--mainMenuSetSelected()
			end
		end
	end
end
addEventHandler("onClientMouseEnter",root,EnterOrExitLabel)
addEventHandler("onClientMouseLeave",root,EnterOrExitLabel)


ButtonsTime = {}

function HideMainWindow ()
	exports["[Titans]SideWindow"]:HidesideWindow()
	setElementData(localPlayer,"Teams/Skins",SelectedSkin)
	XC,YC,ZC = 921.7,-1016.4,82.9
	sm.moov = 0
	SelectedSkinDx = false
	guiSetVisible (TeamLeft,false)
	guiSetVisible (TeamRight,false)
	guiSetVisible (SkinLeft,false)
	guiSetVisible (SkinRight,false)
	destroyElement(SkinPed)
	setCameraTarget(localPlayer)
	ShowMenu = false
	showCursor (false)
	showChat(true)
	setPlayerHudComponentVisible("all",true)
	for i=1 , #MainMenu do
		guiSetVisible(MainMenuLabels[i],false)
	end
	setElementDimension(localPlayer,0)
end

addEventHandler("onClientGUIClick",root,
function()
	if isLabelFromMainMenu(source) then
		local Text = guiGetText(source)
		--[[if Text ~= MainMenu[1][1] then
			local x1,y2,z1, x2,y2,z3, x3,y3,z3, x4,y4,z4 = getCameraPositionFromMenu(Text)
			XC,YC,ZC = x1,y2,z1
			sm.moov = 0
			smoothMoveCamera(x1,y2,z1, x2,y2,z3, x3,y3,z3, x4,y4,z4,1000)
		end]]
		exports["[Titans]SideWindow"]:HidesideWindow()
		--exports["[Titans]YouTupe"]:setYoutupeVisiable(false)
		exports["[Titans]DeathMatch"]:setDeathMatchVisible(false)
		exports["[Titans]DailyGift"]:setDailyGiftsWindow(false)
		exports["[Titans]Lottary"]:setLotteryVisible(false)
		--CloseAbout()
		Anmation = nil
		Anmation = {}
		Anmation.startPos = {0.0432, 0, 0}
		Anmation.startTime = getTickCount()
		Anmation.endPos = {0.02, 0, 0}
		Anmation.endTime = Anmation.startTime + 1000
		mainMenuSetSelected( Text)
		if Text == MainMenu[1][1] then
			local Team = getTeamFromSkinID(SelectedSkin)
			if Team == "Police" and getElementData(localPlayer, "LegalStatus") == "Jailed" then exports["guimessages"]:outputClient("#FF0000[Play] #ff0000You can't enter Police team while your jailed") return end
			if Team == "Police" and (getElementData(localPlayer, "WantLvl") or 0) > 0 then exports["guimessages"]:outputClient ("#FF0000[Play] #ff0000You can't enter Police team while your wanted level is higer than 0") return end
			if Team == "Police" and getElementData(localPlayer,"PoliceBan") == 1 then exports["guimessages"]:outputClient ("#FF0000[Play] #ff0000You can't enter Police Team while your ban on it") return end
			if SelectedSkin == 285 and getElementData(localPlayer,"Group") ~= "[S.W.A.T]" then exports["guimessages"]:outputClient ("#FF0000[Play] #ff0000this skin is only available to [S.W.A.T] group !") return end
			if SelectedSkin == 287 and getElementData(localPlayer,"Group") ~= "[ARMY]" then exports["guimessages"]:outputClient ("#FF0000[Play] #ff0000this skin is only available to [ARMY] group !") return end
			setElementData(localPlayer,"DeathMatchSpawn",false)
			setElementData(localPlayer,"Teams/Skins",SelectedSkin)
			XC,YC,ZC = 921.7,-1016.4,82.9
			sm.moov = 0
			triggerServerEvent("GameMod",localPlayer,"SetTeamAndSkin",{SelectedSkin,Team} )
			SelectedSkinDx = false
			guiSetVisible (TeamLeft,false)
			guiSetVisible (TeamRight,false)
			guiSetVisible (SkinLeft,false)
			guiSetVisible (SkinRight,false)
			destroyElement(SkinPed)
			setCameraTarget(localPlayer)
			ShowMenu = false
			showCursor (false)
			showChat(true)
			setPlayerHudComponentVisible("all",true)
			for i=1 , #MainMenu do
				guiSetVisible(MainMenuLabels[i],false)
			end
			setElementDimension(localPlayer,0)
		elseif Text == MainMenu[2][1] then
			SelectedSkinDx = true
			guiSetVisible (TeamLeft,true)
			guiSetVisible (TeamRight,true)
			guiSetVisible (SkinLeft,true)
			guiSetVisible (SkinRight,true)
			exports["[Titans]SideWindow"]:showSideWindow(" Skins and Teams"," you can change your current team by \nPress '<' '>' button in from of you\nand you can change your skin too by]\npressing ofer '<' '>' buttons too", "Teams ","Recantly most actives \nteam we got is : Criminals and Police \n Make your gang control your team")
		elseif Text == MainMenu[3][1] then
			--exports["[Titans]YouTupe"]:setYoutupeVisiable(true)
			exports["[Titans]DeathMatch"]:setDeathMatchVisible(true)
			SelectedSkinDx = false
			guiSetVisible (TeamLeft,false)
			guiSetVisible (TeamRight,false)
			guiSetVisible (SkinLeft,false)
			guiSetVisible (SkinRight,false)
			exports["[Titans]SideWindow"]:showSideWindow(" DeathMatch"," Here is the deathmatch arena which \nyou have been waiting for !!","  What i can find inside ?"," You will find enemeys in PVP team in which \nyou should kill to stay alive . \n the more you kill the more your gifted \n so make it count")
		--[[elseif Text == MainMenu[4][1] then
			OpenAbout()
			SelectedSkinDx = false
			guiSetVisible (TeamLeft,false)
			guiSetVisible (TeamRight,false)
			guiSetVisible (SkinLeft,false)
			guiSetVisible (SkinRight,false)
			exports["[Titans]SideWindow"]:showSideWindow(" About","We had worked hard to draw this smile\nin your faces guys , we will be always greatfull to you","Who Developed the server ?","TITANS TEAM has developed the server\n\nSpecial Thanks to :\n\n BeBo1 \n Nissan")]]
		elseif Text == MainMenu[4][1] then
			SelectedSkinDx = false
			guiSetVisible (TeamLeft,false)
			guiSetVisible (TeamRight,false)
			guiSetVisible (SkinLeft,false)
			guiSetVisible (SkinRight,false)
			exports["[Titans]SideWindow"]:showSideWindow(" Gifts","As we said we love to draw that smile\nin your faces guys , we wanted to gift you daily !","What i resived from Gifts ?","you may earn such great reward \n such points of top \n Game Coins \ Money \n Exp \n Weapons \n Who knows ?")
			exports["[Titans]DailyGift"]:setDailyGiftsWindow(true)
		elseif Text == MainMenu[5][1] then
			SelectedSkinDx = false
			guiSetVisible (TeamLeft,false)
			guiSetVisible (TeamRight,false)
			guiSetVisible (SkinLeft,false)
			guiSetVisible (SkinRight,false)
			exports["[Titans]SideWindow"]:showSideWindow(" Gifts","As we said we love to draw that smile\nin your faces guys , we wanted to gift you daily !","What i resived from Gifts ?","you may earn such great reward \n such points of top \n Game Coins \ Money \n Exp \n Weapons \n Who knows ?")
			exports["[Titans]Lottary"]:setLotteryVisible(true)
		end
	elseif (source == LoginEditor.label[3]) then
		local Username = guiGetText(LoginEditor.edit[1])
		local Password = guiGetText(LoginEditor.edit[2])
		triggerServerEvent("GameMod",localPlayer,"Login",Username,Password)
		local Text = guiGetText(source)
		guiSetEnabled(source,false)
		Timer = setTimer (guiSetEnabled,5*1000,1,source,true )
		table.insert(ButtonsTime,{Timer,source,Text} )
	elseif (source == RegisterEditor.label[4]) then
		local Username = guiGetText(RegisterEditor.edit[1])
		local Password = guiGetText(RegisterEditor.edit[2])
		local ConPassword = guiGetText(RegisterEditor.edit[3])
		triggerServerEvent("GameMod",localPlayer,"Register",Username,Password,ConPassword)
		local Text = guiGetText(source)
		guiSetEnabled(source,false)
		Timer = setTimer (guiSetEnabled,5*1000,1,source,true )
		table.insert(ButtonsTime,{Timer,source,Text} )
	elseif (source == MyAccountEditor.label[3]) then
		local Username = guiGetText(MyAccountEditor.edit[1])
		local Password = guiGetText(MyAccountEditor.edit[2])
		triggerServerEvent("GameMod",localPlayer,"Login",Username,Password)
		local Text = guiGetText(source)
		guiSetEnabled(source,false)
		Timer = setTimer (guiSetEnabled,5*1000,1,source,true )
		table.insert(ButtonsTime,{Timer,source,Text} )
	elseif (source == MyAccountEditor.label[6]) then
		local Username = guiGetText(MyAccountEditor.edit[3])
		local Password = guiGetText(MyAccountEditor.edit[4])
		triggerServerEvent("GameMod",localPlayer,"Login",Username,Password)
		local Text = guiGetText(source)
		guiSetEnabled(source,false)
		Timer = setTimer (guiSetEnabled,5*1000,1,source,true )
		table.insert(ButtonsTime,{Timer,source,Text} )
	elseif (source == MyAccountEditor.label[9]) then
		local Username = guiGetText(MyAccountEditor.edit[5])
		local Password = guiGetText(MyAccountEditor.edit[6])
		triggerServerEvent("GameMod",localPlayer,"Login",Username,Password)
		local Text = guiGetText(source)
		guiSetEnabled(source,false)
		Timer = setTimer (guiSetEnabled,5*1000,1,source,true )
		table.insert(ButtonsTime,{Timer,source,Text} )
	elseif (source == LoginEditor.checkbox[1]) then
		if guiCheckBoxGetSelected(source) then
			guiEditSetMasked(LoginEditor.edit[2],false)
		else
			guiEditSetMasked(LoginEditor.edit[2],true)
		end
	elseif (source == RegisterEditor.checkbox[1]) then
		if guiCheckBoxGetSelected(source) then
			guiEditSetMasked(RegisterEditor.edit[2],false)
		else
			guiEditSetMasked(RegisterEditor.edit[2],true)
		end
	elseif (source == MyAccountEditor.checkbox[1]) then
		local Username = guiGetText(MyAccountEditor.edit[1])
		if guiCheckBoxGetSelected(source) then
			triggerServerEvent("GameMod",localPlayer,"AccountSecured",Username,"true")
		else
			triggerServerEvent("GameMod",localPlayer,"AccountSecured",Username,"false")
		end
	elseif (source == MyAccountEditor.checkbox[2]) then
		local Username = guiGetText(MyAccountEditor.edit[3])
		if guiCheckBoxGetSelected(source) then
			triggerServerEvent("GameMod",localPlayer,"AccountSecured",Username,"true")
		else
			triggerServerEvent("GameMod",localPlayer,"AccountSecured",Username,"false")
		end
	elseif (source == MyAccountEditor.checkbox[3]) then
		local Username = guiGetText(MyAccountEditor.edit[5])
		if guiCheckBoxGetSelected(source) then
			triggerServerEvent("GameMod",localPlayer,"AccountSecured",Username,"true")
		else
			triggerServerEvent("GameMod",localPlayer,"AccountSecured",Username,"false")
		end
	elseif (source == TeamLeft) then
		local SelectedTeam = getTeamFromSkinID(SelectedSkin)
		local LeftTeam = getPrevTeamFromName(SelectedTeam)
		if LeftTeam then
			setElementModel(SkinPed,TeamsSkins[LeftTeam][1][1] )
			SelectedSkin = TeamsSkins[LeftTeam][1][1]
			setElementData(localPlayer,"Teams/Skins",SelectedSkin)
			--
			local x,y,z,r = TeamsData[getTeamFromSkinID(SelectedSkin)]["Ped"][1],TeamsData[getTeamFromSkinID(SelectedSkin)]["Ped"][2],TeamsData[getTeamFromSkinID(SelectedSkin)]["Ped"][3],TeamsData[getTeamFromSkinID(SelectedSkin)]["Ped"][4]
			local xc,yc,zc = TeamsData[getTeamFromSkinID(SelectedSkin)]["Camera"][1],TeamsData[getTeamFromSkinID(SelectedSkin)]["Camera"][2],TeamsData[getTeamFromSkinID(SelectedSkin)]["Camera"][3]
			setCameraMatrix(xc,yc,zc,x,y,z)
			setElementPosition(SkinPed,x,y,z)
			setElementRotation(SkinPed,0,0,r)
			--
			local Team = getTeamFromSkinID((SelectedSkin or 0)  )
			local r,g,b = getTeamColor(getTeamFromName(Team)) 
			exports["[Titans]SideWindow"]:ChangeSideWindowColor(r,g,b)
			refreshMenuColor()
		end
	elseif (source == TeamRight) then
		local SelectedTeam = getTeamFromSkinID(SelectedSkin)
		local RightTeam = getNextTeamFromName(SelectedTeam)
		if RightTeam then
			setElementModel(SkinPed,TeamsSkins[RightTeam][1][1] )
			SelectedSkin = TeamsSkins[RightTeam][1][1]
			setElementData(localPlayer,"Teams/Skins",SelectedSkin)
			--
			local x,y,z,r = TeamsData[getTeamFromSkinID(SelectedSkin)]["Ped"][1],TeamsData[getTeamFromSkinID(SelectedSkin)]["Ped"][2],TeamsData[getTeamFromSkinID(SelectedSkin)]["Ped"][3],TeamsData[getTeamFromSkinID(SelectedSkin)]["Ped"][4]
			local xc,yc,zc = TeamsData[getTeamFromSkinID(SelectedSkin)]["Camera"][1],TeamsData[getTeamFromSkinID(SelectedSkin)]["Camera"][2],TeamsData[getTeamFromSkinID(SelectedSkin)]["Camera"][3]
			setCameraMatrix(xc,yc,zc,x,y,z)
			setElementPosition(SkinPed,x,y,z)
			setElementRotation(SkinPed,0,0,r)
			--
			local Team = getTeamFromSkinID((SelectedSkin or 0)  )
			local r,g,b = getTeamColor(getTeamFromName(Team)) 
			exports["[Titans]SideWindow"]:ChangeSideWindowColor(r,g,b)
			refreshMenuColor()
		end
	elseif (source == SkinLeft) then
		local SelectedTeam = getTeamFromSkinID(SelectedSkin)
		local ID = getPrevSkinFromID(SelectedSkin)
		if ID then
			setElementModel(SkinPed,ID )
			SelectedSkin = ID
			setElementData(localPlayer,"Teams/Skins",SelectedSkin)
			setPedAnimation (SkinPed, "CRACK","Bbalbat_Idle_02")
		end
	elseif (source == SkinRight) then
		local SelectedTeam = getTeamFromSkinID(SelectedSkin)
		local ID = getNextSkinFromID(SelectedSkin)
		if ID then
			setElementModel(SkinPed,ID )
			SelectedSkin = ID
			setElementData(localPlayer,"Teams/Skins",SelectedSkin)
			setPedAnimation (SkinPed, "CRACK","Bbalbat_Idle_02")
		end
	--[[elseif (source == GUIEditor.staticimage[1]) or (source == GUIEditor.staticimage[2]) or (source == GUIEditor.staticimage[3]) then
		if source == GUIEditor.staticimage[1] then
			SelectedAccount = 1
		elseif source == GUIEditor.staticimage[2] then
			SelectedAccount = 2
		elseif (source == GUIEditor.staticimage[3]) then
			SelectedAccount = 3
		end
		guiChangeLoginPanel("Register")
		RegisterMove = nil
		RegisterMove = {}
		RegisterMove.startPos = {0.68, 1, 0}
		RegisterMove.startTime = getTickCount()
		RegisterMove.endPos = {0.68, 0.33, 0}
		RegisterMove.endTime = RegisterMove.startTime + 1000
		
		
		if PlayerAccounts[SelectedAccount] then
			guiSetText(GUIEditor.edit[1],PlayerAccounts[SelectedAccount][1])
			guiSetText(GUIEditor.edit[2],PlayerAccounts[SelectedAccount][2])
		end
		local r,g,b = unpack(AccountsColor[SelectedAccount])
		i = SelectedAccount -1
		for is=1, 12 do
			guiLabelSetColor(GUIEditor.label[is],255,255,255)
		end
		guiLabelSetColor(GUIEditor.label[1+(i*4)],r,g,b)
		guiLabelSetColor(GUIEditor.label[2+(i*4)],r,g,b)
		guiLabelSetColor(GUIEditor.label[3+(i*4)],r,g,b)
		guiLabelSetColor(GUIEditor.label[4+(i*4)],r,g,b)
				
		guiSetProperty(GUIEditor.staticimage[6], "ImageColours", "tl:"..RGBToHex(255,r,g,b).." tr:"..RGBToHex(255,r,g,b).." bl:"..RGBToHex(255,r,g,b).." br:"..RGBToHex(255,r,g,b) ) 
		guiSetProperty(GUIEditor.staticimage[7], "ImageColours", "tl:"..RGBToHex(255,r,g,b).." tr:"..RGBToHex(255,r,g,b).." bl:"..RGBToHex(255,r,g,b).." br:"..RGBToHex(255,r,g,b) ) 
				
		for ss=14,15 do
			guiLabelSetColor(GUIEditor.label[ss],r,g,b)
		end]]
	else
		for i=1,5 do 
			if (source == GUIEditor.label[i]) then
				local Panel = guiGetText(source)
				guiShowLoginPanel(false)
				guiShowLoginPanel(true,Panel)
				guiSetText(GUIEditor.label[7],Panel)
			end
		end
 	end
end)

function getTimeLeft(Timer)
	if isTimer(Timer) then
		ms = getTimerDetails(Timer)
	else
		return "0"
	end
	if ms then
		local m = math.floor(ms/60000)
		local s = math.floor((ms-m*60000)/1000)
		if m < 10 then m = ""..m end
		if s < 10 then s = "0"..s end
		return "("..m..":"..s..")"
	else
		return "0"
	end
end

function DecreaseButtonClickedTimer ()
	if table.getn(ButtonsTime) ~= 0 then
		for i , v in pairs (ButtonsTime) do
			local Timelft = getTimeLeft(v[1])
			--guiSetText(v[2],Timelft)
			if Timelft == "0" then
				--guiSetText(v[2],v[3])
				guiSetEnabled(v[2],true)
				table.remove(ButtonsTime,i)
			end
		end
	end
end
setTimer(DecreaseButtonClickedTimer,1000,0)


addEventHandler("onClientRender", root,
function()
	if ShowMenu == true then
		for i , v in pairs (MainMenu) do
			if v[2] == true then
				if Anmation then
					local now = getTickCount()
					local elapsedTime = now - Anmation.startTime
					local duration = Anmation.endTime - Anmation.startTime
					local progress = elapsedTime / duration
					
					local x1, y1, z1 = unpack(Anmation.startPos)
					local x2, y2, z2 = unpack(Anmation.endPos)
					xss, y, z = interpolateBetween ( 
						x1, y1, z1,
						x2, y2, z2, 
						progress, "InOutBack")
				else
					xss = 0.0432
				end
			else
				xss = 0.0432
			end
			local Hight = (0.0472*i)
			local Hight2 = (0.0463*i)
			
			dxDrawRectangle(screenW * (xss or 0.0432), screenH * (0.4676+Hight), screenW * 0.1464, screenH * 0.0444, tocolor(0, 0, 0, 178), false)
			dxDrawText(v[1], screenW * (xss or 0.0432), screenH * (0.4657+Hight2), screenW * 0.1896, screenH * (0.5120+Hight2), tocolor(v[3],v[4],v[5], 200), screenW/960, "default-bold", "center", "center", false, false, false, false, false)
		end
	end
	
	if SelectedSkinDx == true then
		local Team = getTeamFromSkinID(SelectedSkin)
		local TeamElement = getTeamFromName(Team)
		local r,g,b = getTeamColor(TeamElement)
		dxDrawRectangle(screenW * 0.4333, screenH * 0.7463, screenW * 0.1130, screenH * 0.0370, tocolor(0, 0, 0, 230), false)
        dxDrawRectangle(screenW * 0.5464, screenH * 0.7463, screenW * 0.0266, screenH * 0.0370, tocolor(r,g,b, 230), false)
        dxDrawRectangle(screenW * 0.4068, screenH * 0.7463, screenW * 0.0266, screenH * 0.0370, tocolor(r,g,b, 230), false)
        dxDrawRectangle(screenW * 0.4333, screenH * 0.7833, screenW * 0.0266, screenH * 0.0370, tocolor(r,g,b, 230), false)
        dxDrawRectangle(screenW * 0.5198, screenH * 0.7833, screenW * 0.0266, screenH * 0.0370, tocolor(r,g,b, 230), false)
        dxDrawRectangle(screenW * 0.4599, screenH * 0.7833, screenW * 0.0599, screenH * 0.0370, tocolor(0, 0, 0, 230), false)
        dxDrawText(Team, screenW * 0.4333, screenH * 0.7472, screenW * 0.5464, screenH * 0.7833, tocolor(r,g,b, 230), screenW/960, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText(getTeamTotalSkinsAndSelectedSkin(Team,SelectedSkin) , screenW * 0.4599, screenH * 0.7843, screenW * 0.5198, screenH * 0.8204, tocolor(254, 254, 254, 230), screenW/960, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("<", screenW * 0.4057, screenH * 0.7454, screenW * 0.4333, screenH * 0.7833, tocolor(255, 255, 255, 255), screenW/960, "bankgothic", "center", "center", false, false, false, false, false)
        dxDrawText("<", screenW * 0.4333, screenH * 0.7843, screenW * 0.4609, screenH * 0.8222, tocolor(255, 255, 255, 255), screenW/960, "bankgothic", "center", "center", false, false, false, false, false)
        dxDrawText(">", screenW * 0.5453, screenH * 0.7463, screenW * 0.5729, screenH * 0.7843, tocolor(255, 255, 255, 255), screenW/960, "bankgothic", "center", "center", false, false, false, false, false)
        dxDrawText(">", screenW * 0.5188, screenH * 0.7843, screenW * 0.5464, screenH * 0.8222, tocolor(255, 255, 255, 255), screenW/960, "bankgothic", "center", "center", false, false, false, false, false)
	end
end)


--initBrowser = guiCreateBrowser(0,0, screenW, screenH, true, false, false)
--theBrowser = guiGetBrowser( initBrowser )

--IntroImage = guiCreateStaticImage(0,0,(screenW),(screenH),"Images/Intro.png",false)
local IntroAnmation = nil
local EasingTaple ={ "Linear", "InQuad", "OutQuad", "InOutQuad", "OutInQuad", "InElastic", "OutElastic", "InOutElastic", "OutInElastic", "InBack", "OutBack", "InOutBack", "OutInBack", "InBounce", "OutBounce", "InOutBounce", "OutInBounce"}
local EasingRandom = EasingTaple[math.random(1,#EasingTaple) ]


function IntroImageRender ()
	local now = getTickCount()
	local elapsedTime = now - IntroAnmation.startTime
	local duration = IntroAnmation.endTime - IntroAnmation.startTime
	local progress = elapsedTime / duration
			
	local x1, y1, z1 = unpack(IntroAnmation.startPos)
	local x2, y2, z2 = unpack(IntroAnmation.endPos)
	local x, y, z = interpolateBetween ( 
		x1, y1, z1,
		x2, y2, z2, 
	progress, EasingRandom)
	--guiSetPosition(IntroImage,(screenW/2)-(x/2),(screenH/2)-(y/2),false)
	--guiSetSize(IntroImage,x,y,false)
	dxDrawRectangle(0,0,screenW,screenH,tocolor(0,0,0,255),false)
	dxDrawImage((screenW/2)-(x/2),(screenH/2)-(y/2),x,y,"Images/Intro.png",z)
end

addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), 
function(ss)
	if ss == getThisResource() then
		IntroSound = exports["[Titans]Sounds"]:playCustomSound(19)
		setElementDimension(localPlayer,300)
		setElementInterior(localPlayer,0)
		toggleControl("chatbox",false)
		guiShowLoginPanel(false)
		showChat(false)
		showPlayerHudComponent("all",false)
		--loadBrowserURL(theBrowser, "http://mta/[Titans]GameMod/index.html")
		IntroAnmation = nil
		IntroAnmation = {}
		IntroAnmation.startPos = {screenW, screenH, 0}
		IntroAnmation.startTime = getTickCount()
		IntroAnmation.endPos = {screenW/2, screenH/2, 360}
		IntroAnmation.endTime = IntroAnmation.startTime + 4000
		setTimer(function ()
			IntroAnmation = nil
			IntroAnmation = {}
			IntroAnmation.startPos = {screenW/2, screenH/2, 0}
			IntroAnmation.startTime = getTickCount()
			IntroAnmation.endPos = {screenW, screenH, 0}
			IntroAnmation.endTime = IntroAnmation.startTime + 4000
		end,4000,1)
		addEventHandler("onClientRender",root,IntroImageRender)
		--[[for i=5 , 6 do
			guiSetVisible(GUIEditor.button[i],false)
		end
		for i=5 , 7 do
			guiSetVisible(GUIEditor.label[i],false)
		end
		guiSetVisible(GUIEditor.checkbox[2],false)
		for i=3 , 5 do
			guiSetVisible(GUIEditor.edit[i],false)
		end]]
		setTimer (function ()
			local RandomCam = math.random(1,4)
			smoothMoveCamera(Cameras[RandomCam][1],Cameras[RandomCam][2],Cameras[RandomCam][3],Cameras[RandomCam][4],Cameras[RandomCam][5],Cameras[RandomCam][6],Cameras[RandomCam][7],Cameras[RandomCam][8],Cameras[RandomCam][9],Cameras[RandomCam][10],Cameras[RandomCam][11],Cameras[RandomCam][12],15000)
			fadeCamera(true, 5,20)  
			--destroyElement(initBrowser)
			--destroyElement(IntroImage)
			removeEventHandler("onClientRender",root,IntroImageRender)
			guiShowLoginPanel(true,"Login")
			local Username , Password = loadLoginFromXML()
			guiSetText(LoginEditor.edit[1],Username)
			guiSetText(LoginEditor.edit[2],Password)
			--guiChangeLoginPanel("Login")
			showCursor(true)
			triggerServerEvent("GameMod",localPlayer,"SendAccounts")
			triggerServerEvent("GameMod",localPlayer,"RefreshOnlineAdmins")
			--[[for i=5 , 6 do
				guiSetVisible(GUIEditor.button[i],false)
			end
			for i=5 , 7 do
				guiSetVisible(GUIEditor.label[i],false)
			end
			guiSetVisible(GUIEditor.checkbox[2],false)
			for i=3 , 5 do
				guiSetVisible(GUIEditor.edit[i],false)
			end
			local username, password = loadLoginFromXML()
			if not( username == "" or password == "") then
				guiCheckBoxSetSelected ( GUIEditor.checkbox[1], true )
				guiSetText(GUIEditor.edit[1],username)
				guiSetText(GUIEditor.edit[2],password)
			end]]
		end,11*1000,1)
	end
end)



function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
    if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
        local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
        if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
            for i, v in ipairs( aAttachedFunctions ) do
                if v == func then
                    return true
                end
            end
        end
    end
    return false
end


function ChangeCamerIntro()
	if guiGetVisible(GUIEditor.staticimage[1]) then
		local RandomCam = math.random(1,4)
		smoothMoveCamera(Cameras[RandomCam][1],Cameras[RandomCam][2],Cameras[RandomCam][3],Cameras[RandomCam][4],Cameras[RandomCam][5],Cameras[RandomCam][6],Cameras[RandomCam][7],Cameras[RandomCam][8],Cameras[RandomCam][9],Cameras[RandomCam][10],Cameras[RandomCam][11],Cameras[RandomCam][12],15000)
		fadeCamera(true, 5) 
	end
end
setTimer(ChangeCamerIntro,5000,0)




function reSpawning ()
	if getElementData ( localPlayer, "changeSkin" ) then
		--XC,YC,ZC = 921.7,-1016.4,82.9
		ShowMenu = true
		local LastSkin = (getElementData(localPlayer,"Teams/Skins") or 0 )
		SelectedSkin = LastSkin
		--local Selection = math.random (1,table.getn(PedSelection))
		local x,y,z,r = TeamsData[getTeamFromSkinID(SelectedSkin)]["Ped"][1],TeamsData[getTeamFromSkinID(SelectedSkin)]["Ped"][2],TeamsData[getTeamFromSkinID(SelectedSkin)]["Ped"][3],TeamsData[getTeamFromSkinID(SelectedSkin)]["Ped"][4]
		local xc,yc,zc = TeamsData[getTeamFromSkinID(SelectedSkin)]["Camera"][1],TeamsData[getTeamFromSkinID(SelectedSkin)]["Camera"][2],TeamsData[getTeamFromSkinID(SelectedSkin)]["Camera"][3]
		setCameraMatrix(xc,yc,zc,x,y,z)
		SkinPed = createPed(SelectedSkin,x,y,z,r)
		setElementDimension(SkinPed,300)
		setElementDimension(localPlayer,300)
		setElementInterior(localPlayer,0)
		setElementFrozen(SkinPed,true)
		setPedAnimation (SkinPed, "CRACK","Bbalbat_Idle_02")
		--changeTeam = false
		setElementData(localPlayer,"changeSkin",false)
		showCursor(true)
		for i=1 , #MainMenu do
			guiSetVisible(MainMenuLabels[i],true)
		end
		setElementDimension(localPlayer,300)
	else
		local Team = getTeamFromSkinID(SelectedSkin)
		triggerServerEvent("GameMod",localPlayer,"SetTeamAndSkin",{SelectedSkin,Team} )
		SelectedSkinDx = false
		setCameraTarget(localPlayer)
	end
end

addEvent("GameMod",true)
addEventHandler("GameMod",root,
function (Type,Table,Data)
	if Type == "Login" then
		--local Username = guiGetText(LoginEditor.edit[1])
		--local Password = guiGetText(LoginEditor.edit[2])
		saveLoginToXML(Data[1],Data[2])
		exports["[Titans]Sounds"]:playCustomSound(17)
		guiShowLoginPanel(false)
		ShowMenu = true
		toggleControl("chatbox",true)
		sm.moov = 0
		--local Selection = math.random (1,table.getn(PedSelection))
		local x,y,z,r = TeamsData[getTeamFromSkinID(Table)]["Ped"][1],TeamsData[getTeamFromSkinID(Table)]["Ped"][2],TeamsData[getTeamFromSkinID(Table)]["Ped"][3],TeamsData[getTeamFromSkinID(Table)]["Ped"][4]
		local xc,yc,zc = TeamsData[getTeamFromSkinID(Table)]["Camera"][1],TeamsData[getTeamFromSkinID(Table)]["Camera"][2],TeamsData[getTeamFromSkinID(Table)]["Camera"][3]
		setCameraMatrix(xc,yc,zc,x,y,z)
		SelectedSkin = Table
		SkinPed = createPed(Table,x,y,z,r)
		setElementDimension(SkinPed,300)
		setElementFrozen(SkinPed,true)
		setPedAnimation (SkinPed, "CRACK","Bbalbat_Idle_02")
		for i=1 , #MainMenu do
			guiSetVisible(MainMenuLabels[i],true)
		end
		setElementDimension(localPlayer,300)
	elseif Type == "Register" then
		--guiChangeLoginPanel("Login")
		for i , v in pairs (Table) do
			i = i -1
			guiSetText(MyAccountEditor.edit[1+(i*2)],v[1])
			guiSetText(MyAccountEditor.edit[2+(i*2)],v[2])
		end
		PlayerAccounts = Table
	elseif Type == "SendAccounts" then
		for i , v in pairs (Table) do
			i = i -1
			guiSetText(MyAccountEditor.edit[1+(i*2)],v[1])
			guiSetText(MyAccountEditor.edit[2+(i*2)],v[2])
			if v[6] == "true" then
				guiCheckBoxSetSelected(MyAccountEditor.checkbox[i+1],true)
			else
				guiCheckBoxSetSelected(MyAccountEditor.checkbox[i+1],false)
			end
		end
		PlayerAccounts = Table
	elseif Type == "RefreshOnlineAdmins" then
		if #Table ~= 0 then
			for i , v in pairs (Table) do
				local r,g,b = v[3],v[4],v[5]
				local Row = guiGridListAddRow(AdminsOnlineEditor.gridlist[1])
				
				guiGridListSetItemText(AdminsOnlineEditor.gridlist[1],Row,1,v[1],false,false)
				guiGridListSetItemText(AdminsOnlineEditor.gridlist[1],Row,2,v[2],false,false)
				
				guiGridListSetItemColor(AdminsOnlineEditor.gridlist[1],Row,1,r,g,b)
				guiGridListSetItemColor(AdminsOnlineEditor.gridlist[1],Row,2,r,g,b)
			end
		end
	elseif Type == "RegError" then
		guiSetText(RegisterEditor.label[5],Table)
	elseif Type == "LoginError" then
		guiSetText(LoginEditor.label[4],Table)
	elseif Type == "MyAccountsError" then
		guiSetText(MyAccountEditor.label[10],Table)
	end
end)


addEventHandler("onClientPlayerWasted", getLocalPlayer(),
function ()
setTimer(reSpawning,4000,1,source)
end)


addEventHandler("onClientVehicleEnter", root,
function(thePlayer, seat)
	if thePlayer == localPlayer then
		setRadioChannel(0)
	end
end)

function saveLoginToXML(username, password)
    local xml_save_log_File = xmlLoadFile ("files/xml/userdata.xml")
    if not xml_save_log_File then
        xml_save_log_File = xmlCreateFile("files/xml/userdata.xml", "login")
    end
	if (username ~= "") then
		local usernameNode = xmlFindChild (xml_save_log_File, "username", 0)
		if not usernameNode then
			usernameNode = xmlCreateChild(xml_save_log_File, "username")
		end
		xmlNodeSetValue (usernameNode, tostring(username))
	end
	if (password ~= "") then
		local passwordNode = xmlFindChild (xml_save_log_File, "password", 0)
		if not passwordNode then
			passwordNode = xmlCreateChild(xml_save_log_File, "password")
		end		
		xmlNodeSetValue (passwordNode, tostring(password))
	end
    xmlSaveFile(xml_save_log_File)
    xmlUnloadFile (xml_save_log_File)
end


function loadLoginFromXML()
	local xml_save_log_File = xmlLoadFile ("files/xml/userdata.xml")
    if not xml_save_log_File then
        xml_save_log_File = xmlCreateFile("files/xml/userdata.xml", "login")
    end
    local usernameNode = xmlFindChild (xml_save_log_File, "username", 0)
    local passwordNode = xmlFindChild (xml_save_log_File, "password", 0)
    if usernameNode and passwordNode then
        return xmlNodeGetValue(usernameNode), xmlNodeGetValue(passwordNode)
    else
		return "", ""
    end
    xmlUnloadFile ( xml_save_log_File )
end





