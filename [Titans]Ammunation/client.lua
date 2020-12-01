local x, y = guiGetScreenSize()


GUIEditor = {
    button = {},
    staticimage = {},
    edit = {},
    label = {}
}


		--[[GUIEditor.staticimage[1] = guiCreateWindow((x-448)/2, (y-602)/2, 458, 610, "Weapons Shop", false)
		guiWindowSetSizable(GUIEditor.staticimage[1], false)
        guiSetAlpha(GUIEditor.staticimage[1], 0.86)
        guiSetProperty(GUIEditor.staticimage[1], "CaptionColour", "FFFEFEFE")		
		guiSetVisible(GUIEditor.staticimage[1], false)
		
		
		
		
		
		
		
        Ak47_Edit = guiCreateEdit(26, 133, 61, 15, "0", false, GUIEditor.staticimage[1])
        label2 = guiCreateLabel(126, 116, 63, 16, "$30", false, GUIEditor.staticimage[1])
        guiLabelSetColor(label2, 213, 255, 255)
		guiLabelSetHorizontalAlign(label2, "center", false)
        M4_Edit = guiCreateEdit(127, 133, 61, 15, "m4", false, GUIEditor.staticimage[1])
        Rifle_Edit = guiCreateEdit(26, 259, 61, 15, "rifle", false, GUIEditor.staticimage[1])
        label3 = guiCreateLabel(25, 242, 63, 16, "$15", false, GUIEditor.staticimage[1])
        guiLabelSetColor(label3, 213, 255, 255)
		guiLabelSetHorizontalAlign(label3, "center", false)
        Sniper_Edit = guiCreateEdit(125, 259, 61, 15, "sniper", false, GUIEditor.staticimage[1])
        label4 = guiCreateLabel(125, 243, 63, 16, "$20", false, GUIEditor.staticimage[1])
        guiLabelSetColor(label4, 213, 255, 255)
		guiLabelSetHorizontalAlign(label4, "center", false)
        label5 = guiCreateLabel(25, 362, 63, 16, "$30", false, GUIEditor.staticimage[1])
        guiLabelSetColor(label5, 213, 255, 255)
		guiLabelSetHorizontalAlign(label5, "center", false)
        Cshutgun_Edit = guiCreateEdit(26, 378, 61, 15, "spaz", false, GUIEditor.staticimage[1])
        label6 = guiCreateLabel(125, 362, 63, 16, "$33", false, GUIEditor.staticimage[1])
        guiLabelSetColor(label6, 213, 255, 255)
		guiLabelSetHorizontalAlign(label6, "center", false)
        Sawedoff_Edit = guiCreateEdit(125, 378, 61, 15, "sawed", false, GUIEditor.staticimage[1])
        label7 = guiCreateLabel(285, 116, 63, 16, "$15", false, GUIEditor.staticimage[1])
        guiLabelSetColor(label7, 213, 255, 255)
		guiLabelSetHorizontalAlign(label7, "center", false)
        Colt_Edit = guiCreateEdit(285, 133, 61, 15, "colt", false, GUIEditor.staticimage[1])
        label8 = guiCreateLabel(378, 116, 63, 16, "$20", false, GUIEditor.staticimage[1])
        guiLabelSetColor(label8, 213, 255, 255)
		guiLabelSetHorizontalAlign(label8, "center", false)
        Deagle_Edit = guiCreateEdit(378, 133, 61, 15, "deagle", false, GUIEditor.staticimage[1])
        label9 = guiCreateLabel(285, 240, 63, 16, "$15", false, GUIEditor.staticimage[1])
        guiLabelSetColor(label9, 213, 255, 255)
		guiLabelSetHorizontalAlign(label9, "center", false)
        Uzi_Edit = guiCreateEdit(285, 256, 61, 15, "uzi", false, GUIEditor.staticimage[1])
        label10 = guiCreateLabel(376, 240, 63, 16, "$20", false, GUIEditor.staticimage[1])
        guiLabelSetColor(label10, 213, 255, 255)
		guiLabelSetHorizontalAlign(label10, "center", false)
        MP5_Edit = guiCreateEdit(378, 256, 61, 15, "mp5", false, GUIEditor.staticimage[1])
        label11 = guiCreateLabel(275, 481, 81, 16, "$4,000", false, GUIEditor.staticimage[1])
        guiLabelSetColor(label11, 213, 255, 255)
		guiLabelSetHorizontalAlign(label11, "center", false)
        GL_Edit = guiCreateEdit(275, 497, 61, 15, "0", false, GUIEditor.staticimage[1])
        label12 = guiCreateLabel(116, 481, 81, 16, "$15,000", false, GUIEditor.staticimage[1])
        guiLabelSetColor(label12, 213, 255, 255)
		guiLabelSetHorizontalAlign(label12, "center", false)
        Health_Button = guiCreateButton(116, 497, 81, 16, "150 Health", false, GUIEditor.staticimage[1])
        guiSetProperty(Health_Button, "NormalTextColour", "FF24FE00")
        Armor_Button = guiCreateButton(20, 497, 81, 16, "Buy Armour", false, GUIEditor.staticimage[1])
        guiSetProperty(Armor_Button, "NormalTextColour", "FF24FE00")
        label13 = guiCreateLabel(20, 481, 81, 16, "$500", false, GUIEditor.staticimage[1])
        guiLabelSetColor(label13, 213, 255, 255)
		guiLabelSetHorizontalAlign(label13, "center", false)
        label14 = guiCreateLabel(369, 481, 80, 16, "$8,000", false, GUIEditor.staticimage[1])
        guiLabelSetColor(label14, 213, 255, 255)
		guiLabelSetHorizontalAlign(label14, "center", false)
        Satchel_Edit = guiCreateEdit(369, 497, 61, 15, "0", false, GUIEditor.staticimage[1])
        Gaz_Edit = guiCreateEdit(275, 376, 61, 15, "0", false, GUIEditor.staticimage[1])
        Grenard_Edit = guiCreateEdit(369, 376, 61, 15, "0", false, GUIEditor.staticimage[1])
        label15 = guiCreateLabel(275, 360, 81, 16, "$1,500", false, GUIEditor.staticimage[1])
        guiLabelSetColor(label15, 213, 255, 255)
		guiLabelSetHorizontalAlign(label15, "center", false)
        label16 = guiCreateLabel(369, 360, 80, 16, "$1,600", false, GUIEditor.staticimage[1])
        guiLabelSetColor(label16, 213, 255, 255)
		guiLabelSetHorizontalAlign(label16, "center", false)
        
		
		
		Image1 = guiCreateStaticImage(15, 29, 83, 83, "icons/1.png", false, GUIEditor.staticimage[1])
        Image2 = guiCreateStaticImage(116, 29, 82, 83, "icons/2.png", false, GUIEditor.staticimage[1])
        Image3 = guiCreateStaticImage(15, 158, 83, 84, "icons/3.png", false, GUIEditor.staticimage[1])
        Image4 = guiCreateStaticImage(116, 158, 82, 84, "icons/4.png", false, GUIEditor.staticimage[1])
        Image5 = guiCreateStaticImage(116, 278, 82, 84, "icons/5.png", false, GUIEditor.staticimage[1])
        Image6 = guiCreateStaticImage(17, 278, 81, 84, "icons/6.png", false, GUIEditor.staticimage[1])
        Image7 = guiCreateStaticImage(276, 29, 82, 83, "icons/7.png", false, GUIEditor.staticimage[1])
        Image8 = guiCreateStaticImage(368, 29, 81, 83, "icons/8.png", false, GUIEditor.staticimage[1])
        Image9 = guiCreateStaticImage(276, 278, 80, 82, "icons/9.png", false, GUIEditor.staticimage[1])
        Image10 = guiCreateStaticImage(368, 278, 81, 82, "icons/10.png", false, GUIEditor.staticimage[1])
        Image11 = guiCreateStaticImage(370, 157, 79, 83, "icons/11.png", false, GUIEditor.staticimage[1])
        Image12 = guiCreateStaticImage(277, 157, 81, 83, "icons/12.png", false, GUIEditor.staticimage[1])
        Image13 = guiCreateStaticImage(277, 398, 81, 83, "icons/13.png", false, GUIEditor.staticimage[1])
        Image14 = guiCreateStaticImage(116, 399, 80, 82, "icons/14.png", false, GUIEditor.staticimage[1])
        Image15 = guiCreateStaticImage(18, 399, 79, 84, "icons/15.png", false, GUIEditor.staticimage[1])
        Image16 = guiCreateStaticImage(367, 398, 81, 83, "icons/16.png", false, GUIEditor.staticimage[1])]]
		
		
		
		

        GUIEditor.staticimage[1] = guiCreateStaticImage(0.21, 0.26, 0.49, 0.49, "Icons//dot_white.png", true)
        guiSetProperty(GUIEditor.staticimage[1], "ImageColours", "tl:5D000000 tr:5D000000 bl:5D000000 br:5D000000")
		guiSetVisible(GUIEditor.staticimage[1],false)

        GUIEditor.staticimage[2] = guiCreateStaticImage(0.02, 0.03, 0.21, 0.09, "Icons//dot_white.png", true, GUIEditor.staticimage[1])
        guiSetProperty(GUIEditor.staticimage[2], "ImageColours", "tl:5B000000 tr:5B000000 bl:5B000000 br:5B000000")

        GUIEditor.staticimage[3] = guiCreateStaticImage(0.00, 0.00, 1.00, 0.12, "Icons//dot_white.png", true, GUIEditor.staticimage[2])
        guiSetProperty(GUIEditor.staticimage[3], "ImageColours", "tl:FFF2FB00 tr:FFF2FB00 bl:FFF2FB00 br:FFF2FB00")
        Buy_Button = guiCreateLabel(0,0,1,1, "Buy", true, GUIEditor.staticimage[2])
		guiLabelSetHorizontalAlign(Buy_Button,"center")
		guiLabelSetVerticalAlign(Buy_Button,"center")

        GUIEditor.staticimage[4] = guiCreateStaticImage(0.02, 0.16, 0.21, 0.09, "Icons//dot_white.png", true, GUIEditor.staticimage[1])
        guiSetProperty(GUIEditor.staticimage[4], "ImageColours", "tl:5B000000 tr:5B000000 bl:5B000000 br:5B000000")

        GUIEditor.staticimage[5] = guiCreateStaticImage(0.00, 0.00, 1.00, 0.12, "Icons//dot_white.png", true, GUIEditor.staticimage[4])
        guiSetProperty(GUIEditor.staticimage[5], "ImageColours", "tl:FFF2FB00 tr:FFF2FB00 bl:FFF2FB00 br:FFF2FB00")
        Close_Button = guiCreateLabel(0,0,1,1, "Close", true, GUIEditor.staticimage[4])
		guiLabelSetHorizontalAlign(Close_Button,"center")
		guiLabelSetVerticalAlign(Close_Button,"center")

        GUIEditor.label[3] = guiCreateLabel(0.24, 0.05, 0.16, 0.06, "« Weapon Shop »", true, GUIEditor.staticimage[1])
        GUIEditor.staticimage[6] = guiCreateStaticImage(0.24, 0.11, 0.72, 0.84, "Icons//dot_white.png", true, GUIEditor.staticimage[1])
        guiSetProperty(GUIEditor.staticimage[6], "ImageColours", "tl:5B000000 tr:5B000000 bl:5B000000 br:5B000000")

        GUIEditor.staticimage[7] = guiCreateStaticImage(0.00, 0.00, 1.00, 0.02, "Icons//dot_white.png", true, GUIEditor.staticimage[6])
        guiSetProperty(GUIEditor.staticimage[7], "ImageColours", "tl:FFF2FB00 tr:FFF2FB00 bl:FFF2FB00 br:FFF2FB00")
        GUIEditor.staticimage[8] = guiCreateStaticImage(0.58, 0.09, 0.40, 0.12, "Icons//dot_white.png", true, GUIEditor.staticimage[6])
        guiSetProperty(GUIEditor.staticimage[8], "ImageColours", "tl:62000000 tr:62000000 bl:62000000 br:62000000")

        GUIEditor.staticimage[9] = guiCreateStaticImage(0.50, 0.11, 0.45, 0.78, "Icons//10.png", true, GUIEditor.staticimage[8])
        Ak47_Edit = guiCreateEdit(0.05, 0.16, 0.41, 0.53, "0", true, GUIEditor.staticimage[8])
        GUIEditor.label[4] = guiCreateLabel(0.50, 0.56, 0.31, 0.44, "AK-47", true, GUIEditor.staticimage[8])
        guiSetFont(GUIEditor.label[4], "default-small")

        GUIEditor.staticimage[10] = guiCreateStaticImage(0.58, 0.24, 0.40, 0.12, "Icons//dot_white.png", true, GUIEditor.staticimage[6])
        guiSetProperty(GUIEditor.staticimage[10], "ImageColours", "tl:62000000 tr:62000000 bl:62000000 br:62000000")

        GUIEditor.staticimage[11] = guiCreateStaticImage(0.50, 0.11, 0.45, 0.78, "Icons//11.png", true, GUIEditor.staticimage[10])
        GUIEditor.label[5] = guiCreateLabel(0.53, 0.58, 0.26, 0.42, "M4", true, GUIEditor.staticimage[10])
		M4_Edit = guiCreateEdit(0.05, 0.16, 0.41, 0.53, "0", true, GUIEditor.staticimage[10])
        guiSetFont(GUIEditor.label[5], "default-small")

        GUIEditor.staticimage[12] = guiCreateStaticImage(0.58, 0.83, 0.40, 0.12, "Icons//dot_white.png", true, GUIEditor.staticimage[6])
        guiSetProperty(GUIEditor.staticimage[12], "ImageColours", "tl:62000000 tr:62000000 bl:62000000 br:62000000")

        GUIEditor.staticimage[13] = guiCreateStaticImage(0.50, 0.11, 0.45, 0.78, "Icons//12.png", true, GUIEditor.staticimage[12])
        GUIEditor.label[6] = guiCreateLabel(0.50, 0.58, 0.33, 0.37, "Sawed-off", true, GUIEditor.staticimage[12])
		Sawedoff_Edit = guiCreateEdit(0.05, 0.16, 0.41, 0.53, "0", true, GUIEditor.staticimage[12])
        guiSetFont(GUIEditor.label[6], "default-small")

        GUIEditor.staticimage[14] = guiCreateStaticImage(0.58, 0.53, 0.40, 0.12, "Icons//dot_white.png", true, GUIEditor.staticimage[6])
        guiSetProperty(GUIEditor.staticimage[14], "ImageColours", "tl:62000000 tr:62000000 bl:62000000 br:62000000")

        GUIEditor.staticimage[15] = guiCreateStaticImage(0.50, 0.11, 0.45, 0.78, "Icons//13.png", true, GUIEditor.staticimage[14])
        GUIEditor.label[7] = guiCreateLabel(0.50, 0.58, 0.30, 0.42, "Shotgun", true, GUIEditor.staticimage[14])
		Shutgun_Edit = guiCreateEdit(0.05, 0.16, 0.41, 0.53, "0", true, GUIEditor.staticimage[14])
        guiSetFont(GUIEditor.label[7], "default-small")

        GUIEditor.staticimage[16] = guiCreateStaticImage(0.58, 0.68, 0.40, 0.12, "Icons//dot_white.png", true, GUIEditor.staticimage[6])
        guiSetProperty(GUIEditor.staticimage[16], "ImageColours", "tl:62000000 tr:62000000 bl:62000000 br:62000000")

        GUIEditor.staticimage[17] = guiCreateStaticImage(0.50, 0.11, 0.45, 0.78, "Icons//14.png", true, GUIEditor.staticimage[16])
        GUIEditor.label[8] = guiCreateLabel(0.50, 0.64, 0.83, 0.36, "Combat Shotgun", true, GUIEditor.staticimage[16])
		Cshutgun_Edit = guiCreateEdit(0.05, 0.16, 0.41, 0.53, "0", true, GUIEditor.staticimage[16])
        guiSetFont(GUIEditor.label[8], "default-small")

        GUIEditor.staticimage[18] = guiCreateStaticImage(0.08, 0.09, 0.39, 0.12, "Icons//dot_white.png", true, GUIEditor.staticimage[6])
        guiSetProperty(GUIEditor.staticimage[18], "ImageColours", "tl:62000000 tr:62000000 bl:62000000 br:62000000")

        GUIEditor.staticimage[19] = guiCreateStaticImage(0.51, 0.00, 0.45, 0.74, "Icons//15.png", true, GUIEditor.staticimage[18])
        GUIEditor.label[9] = guiCreateLabel(0.67, 0.58, 0.40, 0.42, "Deagle", true, GUIEditor.staticimage[18])
		Deagle_Edit = guiCreateEdit(0.05, 0.16, 0.41, 0.53, "0", true, GUIEditor.staticimage[18])
        guiSetFont(GUIEditor.label[9], "default-small")

        GUIEditor.staticimage[20] = guiCreateStaticImage(0.08, 0.24, 0.39, 0.12, "Icons//dot_white.png", true, GUIEditor.staticimage[6])
        guiSetProperty(GUIEditor.staticimage[20], "ImageColours", "tl:62000000 tr:62000000 bl:62000000 br:62000000")

        GUIEditor.staticimage[21] = guiCreateStaticImage(0.51, 0.00, 0.45, 0.74, "Icons//16.png", true, GUIEditor.staticimage[20])
        GUIEditor.label[10] = guiCreateLabel(0.66, 0.58, 0.38, 0.47, "Colt 45", true, GUIEditor.staticimage[20])
		Colt_Edit = guiCreateEdit(0.05, 0.16, 0.41, 0.53, "0", true, GUIEditor.staticimage[20])
        guiSetFont(GUIEditor.label[10], "default-small")

        GUIEditor.staticimage[22] = guiCreateStaticImage(0.08, 0.53, 0.39, 0.12, "Icons//dot_white.png", true, GUIEditor.staticimage[6])
        guiSetProperty(GUIEditor.staticimage[22], "ImageColours", "tl:62000000 tr:62000000 bl:62000000 br:62000000")

        GUIEditor.staticimage[23] = guiCreateStaticImage(0.50, 0.11, 0.45, 0.78, "Icons//18.png", true, GUIEditor.staticimage[22])
        GUIEditor.label[11] = guiCreateLabel(0.69, 0.55, 0.38, 0.39, "MP5", true, GUIEditor.staticimage[22])
		MP5_Edit = guiCreateEdit(0.05, 0.16, 0.41, 0.53, "0", true, GUIEditor.staticimage[22])
        guiSetFont(GUIEditor.label[11], "default-small")

        GUIEditor.staticimage[24] = guiCreateStaticImage(0.08, 0.68, 0.39, 0.12, "Icons//dot_white.png", true, GUIEditor.staticimage[6])
        guiSetProperty(GUIEditor.staticimage[24], "ImageColours", "tl:62000000 tr:62000000 bl:62000000 br:62000000")

        GUIEditor.staticimage[25] = guiCreateStaticImage(0.50, 0.00, 0.45, 0.78, "Icons//19.png", true, GUIEditor.staticimage[24])
        GUIEditor.label[12] = guiCreateLabel(0.66, 0.47, 0.39, 0.39, "TEC-9", true, GUIEditor.staticimage[24])
		Tec9_Edit = guiCreateEdit(0.05, 0.16, 0.41, 0.53, "0", true, GUIEditor.staticimage[24])
        guiSetFont(GUIEditor.label[12], "default-small")

        GUIEditor.staticimage[26] = guiCreateStaticImage(0.08, 0.82, 0.39, 0.12, "Icons//dot_white.png", true, GUIEditor.staticimage[6])
        guiSetProperty(GUIEditor.staticimage[26], "ImageColours", "tl:62000000 tr:62000000 bl:62000000 br:62000000")

        GUIEditor.staticimage[27] = guiCreateStaticImage(0.51, 0.00, 0.45, 0.74, "Icons//20.png", true, GUIEditor.staticimage[26])
        GUIEditor.label[13] = guiCreateLabel(0.60, 0.53, 0.35, 0.47, "Sniper", true, GUIEditor.staticimage[26])
		Sniper_Edit = guiCreateEdit(0.05, 0.16, 0.41, 0.53, "0", true, GUIEditor.staticimage[26])
        guiSetFont(GUIEditor.label[13], "default-small")


        GUIEditor.staticimage[28] = guiCreateStaticImage(0.02, 0.84, 0.21, 0.10, "Icons//dot_white.png", true, GUIEditor.staticimage[1])
        guiSetProperty(GUIEditor.staticimage[28], "ImageColours", "tl:5B000000 tr:5B000000 bl:5B000000 br:5B000000")

        GUIEditor.staticimage[29] = guiCreateStaticImage(0.31, 0.13, 0.62, 0.74, "Icons//31.png", true, GUIEditor.staticimage[28])
        Armor_Button = guiCreateButton(0.07, 0.26, 0.40, 0.55, "$200", true, GUIEditor.staticimage[28])
        GUIEditor.label[14] = guiCreateLabel(0.51, 0.53, 0.41, 0.37, "A: 100", true, GUIEditor.staticimage[28])
        guiSetFont(GUIEditor.label[14], "default-small")

        GUIEditor.staticimage[30] = guiCreateStaticImage(0.02, 0.71, 0.21, 0.10, "Icons//dot_white.png", true, GUIEditor.staticimage[1])
        guiSetProperty(GUIEditor.staticimage[30], "ImageColours", "tl:5B000000 tr:5B000000 bl:5B000000 br:5B000000")

        GUIEditor.staticimage[31] = guiCreateStaticImage(0.34, 0.11, 0.62, 0.74, "Icons//30.png", true, GUIEditor.staticimage[30])
        GUIEditor.label[15] = guiCreateLabel(0.51, 0.58, 0.43, 0.42, "H: 150", true, GUIEditor.staticimage[30])
        guiSetFont(GUIEditor.label[15], "default-small")
        Health_Button = guiCreateButton(0.07, 0.21, 0.38, 0.53, "$2K", true, GUIEditor.staticimage[30])

        GUIEditor.staticimage[32] = guiCreateStaticImage(0.02, 0.58, 0.21, 0.10, "Icons//dot_white.png", true, GUIEditor.staticimage[1])
        guiSetProperty(GUIEditor.staticimage[32], "ImageColours", "tl:5B000000 tr:5B000000 bl:5B000000 br:5B000000")

        GL_Edit = guiCreateEdit(0.07, 0.26, 0.35, 0.47, "0", true, GUIEditor.staticimage[32])
        GUIEditor.label[16] = guiCreateLabel(0.52, 0.55, 0.36, 0.45, "Launcher", true, GUIEditor.staticimage[32])
        guiSetFont(GUIEditor.label[16], "default-small")
        GUIEditor.staticimage[33] = guiCreateStaticImage(0.56, 0.03, 0.39, 0.71, "Icons//33.png", true, GUIEditor.staticimage[32])

        GUIEditor.staticimage[34] = guiCreateStaticImage(0.02, 0.45, 0.21, 0.10, "Icons//dot_white.png", true, GUIEditor.staticimage[1])
        guiSetProperty(GUIEditor.staticimage[34], "ImageColours", "tl:5B000000 tr:5B000000 bl:5B000000 br:5B000000")

        Grenard_Edit = guiCreateEdit(0.07, 0.26, 0.35, 0.47, "0", true, GUIEditor.staticimage[34])
        GUIEditor.label[17] = guiCreateLabel(0.51, 0.63, 0.38, 0.37, "Grenade", true, GUIEditor.staticimage[34])
        guiSetFont(GUIEditor.label[17], "default-small")
        GUIEditor.staticimage[35] = guiCreateStaticImage(0.79, 0.03, 0.17, 0.87, "Icons//32.png", true, GUIEditor.staticimage[34])

        Total_Label = guiCreateLabel(0.06, 0.28, 0.12, 0.06, "Price: $0", true, GUIEditor.staticimage[1])
        guiLabelSetColor(Total_Label, 11, 254, 0)


        GUIEditor.staticimage[36] = guiCreateStaticImage(0.21, 0.21, 0.12, 0.05, "Icons//dot_white.png", true)
        guiSetProperty(GUIEditor.staticimage[36], "ImageColours", "tl:5D000000 tr:5D000000 bl:5D000000 br:5D000000")
		guiSetVisible(GUIEditor.staticimage[36],false)

        GUIEditor.staticimage[37] = guiCreateStaticImage(0.00, 0.00, 1.00, 0.14, "Icons//dot_white.png", true, GUIEditor.staticimage[36])
        guiSetProperty(GUIEditor.staticimage[37], "ImageColours", "tl:FFF2FB00 tr:FFF2FB00 bl:FFF2FB00 br:FFF2FB00")
        GUIEditor.label[19] = guiCreateLabel(0.15, 0.26, 0.63, 0.61, "« Weapon Shop »", true, GUIEditor.staticimage[36])    



		
LauncherSetting = {["Max"] = 2, ["Cost"] = 6000}
SatchelSetting = {["Max"] = 4, ["Cost"] = 10000}
TeargasSetting = {["Max"] = 4, ["Cost"] = 3000}
GrenadaSetting = {["Max"] = 4, ["Cost"] = 4000}
Mp5Setting = {["Max"] = 1500, ["Cost"] = 40}
UziSetting = {["Max"] = 1500, ["Cost"] = 30}
TecSetting = {["Max"] = 1200, ["Cost"] = 26}
DeagleSetting = {["Max"] = 1000, ["Cost"] = 40}
SilencedSetting = {["Max"] = 1000, ["Cost"] = 16}
PistolSetting = {["Max"] = 1500, ["Cost"] = 30}
AkSetting = {["Max"] = 1500, ["Cost"] = 50}
SniperSetting = {["Max"] = 1500, ["Cost"] = 200}
M4Setting = {["Max"] = 1500, ["Cost"] = 60}
ShoutgunSetting = {["Max"] = 1500, ["Cost"] = 40}
RiflesSetting = {["Max"] = 1500, ["Cost"] = 30}
SawnOffSetting = {["Max"] = 1500, ["Cost"] = 66}
CompatSetting = {["Max"] = 1500, ["Cost"] = 60}



function showwindow()
	guiSetVisible(GUIEditor.staticimage[1],true)
	guiSetVisible(GUIEditor.staticimage[36],true)
	setElementFrozen(localPlayer,true)
	showCursor(true)
	guiSetText(Colt_Edit, "0")
	-- guiSetText(Silense_Edit, "0")
	guiSetText(Deagle_Edit, "0")
	guiSetText(Shutgun_Edit, "0")
	guiSetText(Sawedoff_Edit, "0")
	guiSetText(Cshutgun_Edit, "0")
	guiSetText(Tec9_Edit, "0")
	---guiSetText(Uzi_Edit, "0")
	guiSetText(MP5_Edit, "0")
	guiSetText(M4_Edit, "0")
	guiSetText(Ak47_Edit, "0")
	guiSetText(Grenard_Edit, "0")
	--guiSetText(Satchel_Edit, "0")
	guiSetText(GL_Edit, "0")
	--guiSetText(Rifle_Edit, "0")
	guiSetText(Sniper_Edit, "0")
	--guiSetText(Gaz_Edit, "0")
end

local OpenShopMarker1 = createMarker(295.5, -37.4, 1000.5, "cylinder", 2, 18 , 212 , 255, 150)
setElementInterior(OpenShopMarker1, 1)
local OpenShopMarker2 = createMarker(295.62, -79, 1000.5, "cylinder", 2, 18 , 212 , 255, 150)
setElementInterior(OpenShopMarker2, 4)
local OpenShopMarker3 = createMarker(289.4, -108.5, 1000.51, "cylinder", 2, 18 , 212 , 255, 150)
setElementInterior(OpenShopMarker3, 6)
local OpenShopMarker4 = createMarker(311.65, -164.95, 998.6, "cylinder", 2, 18 , 212 , 255, 150)
setElementInterior(OpenShopMarker4, 6)
local OpenShopMarker5 = createMarker(313.13, -133.44, 998.6, "cylinder", 2, 18 , 212 , 255, 150)
setElementInterior(OpenShopMarker5, 7)


local OpenShopMarker6 = createMarker(270.13, -95.44, 1684.63, "cylinder", 2, 18 , 212 , 255, 150)
setElementInterior(OpenShopMarker6, 15)
setElementDimension(OpenShopMarker6,500)

--[[local OpenShopMarker7 = createMarker(153,1376,1083, "cylinder", 2, 18 , 212 , 255, 150)
setElementInterior(OpenShopMarker7, 5)]]

local team = getPlayerTeam(localPlayer)
if team and getTeamName(team) == "Police" then
	OpenPoliceShopMarker = createMarker(254, 65.9, 1002.7, "cylinder", 2, 200, 150, 0, 150)
	setElementInterior(OpenPoliceShopMarker, 6)
end


addEventHandler("onClientMarkerHit", resourceRoot,
function(player,md)
	if player == localPlayer and not isPedInVehicle(player) then
		local x,y,z = getElementPosition(player)
		if ( source == OpenShopMarker1 or source == OpenShopMarker2 or source == OpenShopMarker3 or source == OpenShopMarker4 or source == OpenShopMarker5 ) and z < 1600 then
			showwindow()
		elseif source == OpenShopMarker6 then
			if getTeamName(getPlayerTeam(localPlayer)) == "Police" then
				showwindow()
			end
		end
	end
end)

function cancelPedDamage ( attacker )
	if (source == localPlayer) then
		if isElementWithinMarker(source,OpenShopMarker1) or isElementWithinMarker(source,OpenShopMarker2) or isElementWithinMarker(source,OpenShopMarker3) or isElementWithinMarker(source,OpenShopMarker4) or isElementWithinMarker(source,OpenShopMarker5) or isElementWithinMarker(source,OpenShopMarker6) then
			if guiGetVisible(GUIEditor.staticimage[1]) then
				cancelEvent() -- cancel any damage done to peds
			end
		end
	end
end
addEventHandler ( "onClientPlayerDamage", getRootElement(), cancelPedDamage )


addEventHandler("onClientGUIChanged", guiRoot,
function()
	local Text = tonumber(guiGetText(source))
	if source == Cshutgun_Edit then
		guiSetText(Sawedoff_Edit, "0")
		guiSetText(Shutgun_Edit, "0")
		local Ammo = getPedTotalAmmo(localPlayer, 3)
		if not Text or Text < 0 then
			guiSetText(source, "0")
		elseif Text+Ammo > CompatSetting["Max"] then
			guiSetText(source, CompatSetting["Max"]-Ammo >= 0 and CompatSetting["Max"]-Ammo or "0")
		elseif Text > 0 and Text < 1 then
			guiSetText(source, "0")
		end
		CompatCost = tonumber(guiGetText(source)) * CompatSetting["Cost"]
	elseif source == Sawedoff_Edit then
		guiSetText(Cshutgun_Edit, "0")
		 guiSetText(Shutgun_Edit, "0")
		local Ammo = getPedTotalAmmo(localPlayer, 3)
		if not Text  or Text < 0 then
			guiSetText(source, "0")
		elseif Text+Ammo > SawnOffSetting["Max"] then
			guiSetText(source, SawnOffSetting["Max"]-Ammo >= 0 and SawnOffSetting["Max"]-Ammo or "0")
		elseif Text > 0 and Text < 1 then
			guiSetText(source, "0")
		end
		SawnOffCost = tonumber(guiGetText(source)) * SawnOffSetting["Cost"]
	--[[elseif source == Rifle_Edit then
		guiSetText(Sniper_Edit, "0")
		local Ammo = getPedTotalAmmo(localPlayer, 6)
		if not Text  or Text < 0 then
			guiSetText(source, "0")
		elseif Text+Ammo > RiflesSetting["Max"] then
			guiSetText(source, RiflesSetting["Max"]-Ammo >= 0 and RiflesSetting["Max"]-Ammo or "0")
		end
		RiflesCost = tonumber(guiGetText(source)) * RiflesSetting["Cost"]]
	 elseif source == Shutgun_Edit then
		 guiSetText(Cshutgun_Edit, "0")
		 guiSetText(Sawedoff_Edit, "0")
		 local Ammo = getPedTotalAmmo(localPlayer, 3)
		 if not Text  or Text < 0 then
			 guiSetText(source, "0")
		 elseif Text+Ammo > ShoutgunSetting["Max"] then
			guiSetText(source, ShoutgunSetting["Max"]-Ammo >= 0 and ShoutgunSetting["Max"]-Ammo or "0")
		elseif Text > 0 and Text < 1 then
			guiSetText(source, "0")
		 end
		 ShoutgunCost = tonumber(guiGetText(source)) * ShoutgunSetting["Cost"]
	elseif source == M4_Edit then
		guiSetText(Ak47_Edit, "0")
		local Ammo = getPedTotalAmmo(localPlayer, 5)
		if not Text  or Text < 0 then
			guiSetText(source, "0")
		elseif Text+Ammo > M4Setting["Max"] then
			guiSetText(source, M4Setting["Max"]-Ammo >= 0 and M4Setting["Max"]-Ammo or "0")
		elseif Text > 0 and Text < 1 then
			guiSetText(source, "0")
		end
		M4Cost = tonumber(guiGetText(source)) * M4Setting["Cost"]
	elseif source == Sniper_Edit then
		--guiSetText(Rifle_Edit, "0")
		local Ammo = getPedTotalAmmo(localPlayer, 6)
		if not Text  or Text < 0 then
			guiSetText(source, "0")
		elseif Text+Ammo > SniperSetting["Max"] then
			guiSetText(source, SniperSetting["Max"]-Ammo >= 0 and SniperSetting["Max"]-Ammo or "0")
		elseif Text > 0 and Text < 1 then
			guiSetText(source, "0")
		end
		SniperCost = tonumber(guiGetText(source)) * SniperSetting["Cost"]
	elseif source == Ak47_Edit then
		guiSetText(M4_Edit, "0")
		local Ammo = getPedTotalAmmo(localPlayer, 5)
		if not Text  or Text < 0 then
			guiSetText(source, "0")
		elseif Text+Ammo > AkSetting["Max"] then
			guiSetText(source, AkSetting["Max"]-Ammo >= 0 and AkSetting["Max"]-Ammo or "0")
		elseif Text > 0 and Text < 1 then
			guiSetText(source, "0")
		end
		AkCost = tonumber(guiGetText(source)) * AkSetting["Cost"]
	elseif source == Colt_Edit then
		-- guiSetText(Silense_Edit, "0")
		guiSetText(Deagle_Edit, "0")
		local Ammo = getPedTotalAmmo(localPlayer, 2)
		if not Text  or Text < 0 then
			guiSetText(source, "0")
		elseif Text+Ammo > PistolSetting["Max"] then
			guiSetText(source, PistolSetting["Max"]-Ammo >= 0 and PistolSetting["Max"]-Ammo or "0")
		elseif Text > 0 and Text < 1 then
			guiSetText(source, "0")
		end
		PistolCost = tonumber(guiGetText(source)) * PistolSetting["Cost"]
	-- elseif source == Silense_Edit then
		-- guiSetText(Colt_Edit, "0")
		-- guiSetText(Deagle_Edit, "0")
		-- local Ammo = getPedTotalAmmo(localPlayer, 2)
		-- if not Text  or Text < 0 then
			-- guiSetText(source, "0")
		-- elseif Text+Ammo > SilencedSetting["Max"] then
			-- guiSetText(source, SilencedSetting["Max"]-Ammo >= 0 and SilencedSetting["Max"]-Ammo or "0")
		-- end
		-- SilencedCost = tonumber(guiGetText(source)) * SilencedSetting["Cost"]
	elseif source == Deagle_Edit then
		guiSetText(Colt_Edit, "0")
		-- guiSetText(Silense_Edit, "0")
		local Ammo = getPedTotalAmmo(localPlayer, 2)
		if not Text  or Text < 0 then
			guiSetText(source, "0")
		elseif Text+Ammo > DeagleSetting["Max"] then
			guiSetText(source, DeagleSetting["Max"]-Ammo >= 0 and DeagleSetting["Max"]-Ammo or "0")
		elseif Text > 0 and Text < 1 then
			guiSetText(source, "0")
		end
		DeagleCost = tonumber(guiGetText(source)) * DeagleSetting["Cost"]
	 elseif source == Tec9_Edit then
		--guiSetText(Uzi_Edit, "0")
		guiSetText(MP5_Edit, "0")
		local Ammo = getPedTotalAmmo(localPlayer, 4)
		if not Text  or Text < 0 then
			guiSetText(source, "0")
		elseif Text+Ammo > TecSetting["Max"] then
			guiSetText(source, TecSetting["Max"]-Ammo >=0 and TecSetting["Max"]-Ammo or "0")
		elseif Text > 0 and Text < 1 then
			guiSetText(source, "0")
		end
		TecCost = tonumber(guiGetText(source)) * TecSetting["Cost"]
	--[[elseif source == Uzi_Edit then
		-- guiSetText(Tec9_Edit, "0")
		guiSetText(MP5_Edit, "0")
		local Ammo = getPedTotalAmmo(localPlayer, 4)
		if not Text  or Text < 0 then
			guiSetText(source, "0")
		elseif Text+Ammo > UziSetting["Max"] then
			guiSetText(source, UziSetting["Max"]-Ammo >= 0 and UziSetting["Max"]-Ammo or "0")
		end]]
		UziCost = tonumber(guiGetText(source)) * UziSetting["Cost"]
	elseif source == MP5_Edit then
		guiSetText(Tec9_Edit, "0")
		--guiSetText(Uzi_Edit, "0")
		local Ammo = getPedTotalAmmo(localPlayer, 4)
		if not Text  or Text < 0 then
			guiSetText(source, "0")
		elseif Text+Ammo > Mp5Setting["Max"] then
			guiSetText(source, Mp5Setting["Max"]-Ammo >= 0 and Mp5Setting["Max"]-Ammo or "0")
		elseif Text > 0 and Text < 1 then
			guiSetText(source, "0")
		end
		Mp5Cost = tonumber(guiGetText(source)) * Mp5Setting["Cost"]
	elseif source == Grenard_Edit then
		--guiSetText(Gaz_Edit, "0")
		--guiSetText(Satchel_Edit, "0")
		local Ammo = getPedTotalAmmo(localPlayer, 8)
		if not Text  or Text < 0 then
			guiSetText(source, "0")
		elseif Text+Ammo > GrenadaSetting["Max"] then
			guiSetText(source, GrenadaSetting["Max"]-Ammo >= 0 and GrenadaSetting["Max"]-Ammo or "0")
		elseif Text > 0 and Text < 1 then
			guiSetText(source, "0")
		end
		GrenadaCost = tonumber(guiGetText(source)) * GrenadaSetting["Cost"]
	--[[elseif source == Gaz_Edit then
		guiSetText(Grenard_Edit, "0")
		guiSetText(Satchel_Edit, "0")
		local Ammo = getPedTotalAmmo(localPlayer, 8)
		if not Text  or Text < 0 then
			guiSetText(source, "0")
		elseif Text+Ammo > TeargasSetting["Max"] then
			guiSetText(source, TeargasSetting["Max"]-Ammo >= 0 and TeargasSetting["Max"]-Ammo or "0")
		end
		TeargasCost = tonumber(guiGetText(source)) * TeargasSetting["Cost"]
	elseif source == Satchel_Edit then
		guiSetText(Grenard_Edit, "0")
		guiSetText(Gaz_Edit, "0")
		local Ammo = getPedTotalAmmo(localPlayer, 8)
		if not Text or Text < 0 then
			guiSetText(source, "0")
		elseif Text+Ammo > SatchelSetting["Max"] then
			guiSetText(source, SatchelSetting["Max"]-Ammo >= 0 and SatchelSetting["Max"]-Ammo or "0")
		end
		SatchelCost = tonumber(guiGetText(source)) * SatchelSetting["Cost"]]
	elseif source == GL_Edit then
		local Ammo = getElementData(localPlayer, "Launcher") or 0
		if not Text  or Text < 0 then
			guiSetText(source, "0")
		elseif Text+Ammo > LauncherSetting["Max"] then
			guiSetText(source, LauncherSetting["Max"]-Ammo >= 0 and LauncherSetting["Max"]-Ammo or "0")
		elseif Text > 0 and Text < 1 then
			guiSetText(source, "0")
		end
		LauncherCost = tonumber(guiGetText(source)) * LauncherSetting["Cost"]
	end
	local WeaponsCost = (CompatCost or 0) + (SawnOffCost or 0) + (RiflesCost or 0) + (ShoutgunCost or 0) + (M4Cost or 0) + (SniperCost or 0) + (AkCost or 0) + (PistolCost or 0) + (SilencedCost or 0) + (DeagleCost or 0) + (TecCost or 0) + (UziCost or 0) + (Mp5Cost or 0) + (GrenadaCost or 0) + (TeargasCost or 0) + (SatchelCost or 0) + (LauncherCost or 0)
	guiSetText(Total_Label, "$"..WeaponsCost)
	if getPlayerMoney() < WeaponsCost then
		guiLabelSetColor(Total_Label,255,0,0)
	else
		guiLabelSetColor(Total_Label,0,255,0)
	end
end)

-- Reenable = true

-- function ResetEnable ()
	-- Reenable = true
-- end


function disableButton(button,Time)
	guiSetEnabled(button,false)
	setTimer(guiSetEnabled,Time,1,button,true)
end

addEventHandler("onClientGUIClick", guiRoot,
function()
	if source == Buy_Button then
		if Reenable == false then return end
		disableButton(source,3000)
		local CompatAmmo = {(tonumber(guiGetText(Cshutgun_Edit)) or 0), 27}
		local SawnOffAmmo = {(tonumber(guiGetText(Sawedoff_Edit)) or 0), 26}
		--local RiflesAmmo = {(tonumber(guiGetText(Rifle_Edit)) or 0), 33}
		local ShoutgunAmmo = {(tonumber(guiGetText(Shutgun_Edit)) or 0), 25}
		local M4Ammo = {(tonumber(guiGetText(M4_Edit)) or 0), 31}
		local SniperAmmo = {(tonumber(guiGetText(Sniper_Edit)) or 0), 34}
		local AkAmmo = {(tonumber(guiGetText(Ak47_Edit)) or 0), 30}
		local PistolAmmo = {(tonumber(guiGetText(Colt_Edit)) or 0), 22}
		--local SilencedAmmo = {(tonumber(guiGetText(Silense_Edit)) or 0), 23}
		local DeagleAmmo = {(tonumber(guiGetText(Deagle_Edit)) or 0), 24}
		local TecAmmo = {(tonumber(guiGetText(Tec9_Edit)) or 0), 32}
		--ocal UziAmmo = {(tonumber(guiGetText(Uzi_Edit)) or 0), 28}
		local Mp5Ammo = {(tonumber(guiGetText(MP5_Edit)) or 0), 29}
		local GrenadaAmmo = {(tonumber(guiGetText(Grenard_Edit)) or 0), 16}
		--local TeargasAmmo = {(tonumber(guiGetText(Gaz_Edit)) or 0), 17}
		--local SatchelAmmo = {(tonumber(guiGetText(Satchel_Edit)) or 0), 39}
		local LauncherAmmo = {(tonumber(guiGetText(GL_Edit)) or 0), "Launcher"}
		
		exports["[Titans]Sounds"]:playCustomSound(8)

		
		local Cost = tonumber(string.sub(guiGetText(Total_Label), 2))
		if Cost > 0 then
			
				triggerServerEvent("BuyWeapon", localPlayer, Cost, CompatAmmo, SawnOffAmmo,ShoutgunAmmo , M4Ammo, SniperAmmo, AkAmmo, PistolAmmo, DeagleAmmo, TecAmmo ,  Mp5Ammo, GrenadaAmmo, LauncherAmmo) 
				

			guiSetText(Colt_Edit, "0")
			-- guiSetText(Silense_Edit, "0")
			guiSetText(Deagle_Edit, "0")
			guiSetText(Shutgun_Edit, "0")
			guiSetText(Sawedoff_Edit, "0")
			guiSetText(Cshutgun_Edit, "0")
			guiSetText(Tec9_Edit, "0")
			---guiSetText(Uzi_Edit, "0")
			guiSetText(MP5_Edit, "0")
			guiSetText(M4_Edit, "0")
			guiSetText(Ak47_Edit, "0")
			guiSetText(Grenard_Edit, "0")
			--guiSetText(Satchel_Edit, "0")
			guiSetText(GL_Edit, "0")
			--guiSetText(Rifle_Edit, "0")
			guiSetText(Sniper_Edit, "0")
			--guiSetText(Gaz_Edit, "0")
			
		end

	elseif source == Armor_Button then
		if Reenable == false then return end
		disableButton(source,3000)

			triggerServerEvent("BuyArmor", localPlayer)
	elseif source == Health_Button then
		if Reenable == false then return end
		disableButton(source,3000)
		triggerServerEvent("BuyHealth", localPlayer)
	elseif source == Close_Button then
		guiSetVisible(GUIEditor.staticimage[1],false)
		guiSetVisible(GUIEditor.staticimage[36],false)
		setElementFrozen(localPlayer,false)
		showCursor(false)
	end
end)

ableToShot = true

bindKey("sprint", "down",
function()
	local wpSlot = (getPedWeaponSlot(localPlayer) == 5)
	local LauncherAmmo = (getElementData(localPlayer, "Launcher") or 0)
	if LauncherAmmo > 0 and wpSlot and getControlState("aim_weapon") and ableToShot and getElementInterior(localPlayer) == 0 and getElementDimension(localPlayer) == 0 and not getElementData(localPlayer, "MissionProtection") then
		playSound("sounds/launcher_fire.mp3", false)
		setTimer (open, 1000, 1)
		setTimer (Greload, 700, 1)
		local widh, height = guiGetScreenSize()
		local x, y, z = getPedWeaponMuzzlePosition(localPlayer)
		local cax , cay, caz = getCameraMatrix()
		local tx , ty, tz = getWorldFromScreenPosition(widh/1.89,height/2.5,7)
		local sx, sy, sz = (tx-cax)/5, (ty-cay)/5, (tz-caz)/5
		createProjectile(localPlayer, 21, x, y, z, 1, nil, 0, 0, 360-getPedRotation(localPlayer), sx, sy, sz)
		setElementData(localPlayer, "Launcher", LauncherAmmo-1)
		ableToShot = false
		setTimer(function() ableToShot = true end, 2500, 1)
	end
end)

function Greload()
	--outputDebugString("Greload")
	setPedAnimation(localPlayer, "TEC", "TEC_reload", 1, false, false)
end

function open()
	--outputDebugString("open")
	playSound("sounds/launcher_open.mp3", false)
	setTimer(insert, 600, 1)
end

function insert()
	--outputDebugString("insert")
	playSound("sounds/launcher_insert.mp3", false)
	setTimer(Sclose, 50, 1)
end

function Sclose()
	--outputDebugString("close")
	playSound("sounds/launcher_close.mp3", false)
end


addEventHandler("onClientRender", root,
function()
local screenW, screenH = guiGetScreenSize()
	if (getPedWeaponSlot(localPlayer) == 5) and ableToShot == true then
		if getElementInterior(localPlayer) ~= 0 or getElementDimension (localPlayer) ~= 0 then return end
		dxDrawRectangle(screenW * 0.7796, screenH * 0.0430, screenW * 0.0673, screenH * 0.0208, tocolor(0, 0, 0, 196), false)
        dxDrawText("Launchers: "..(getElementData(localPlayer, "Launcher") or 0), screenW * 0.7870, screenH * 0.0430, screenW * 0.8192, screenH * 0.0560, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, false, false, false)
	end
end)

addEventHandler("onClientMarkerLeave", root,
function(player)
	if player == localPlayer then
		if source == OpenShopMarker1 or OpenShopMarker2 or OpenShopMarker3 or OpenShopMarker4 or OpenShopMarker5 then 
			guiSetVisible(GUIEditor.staticimage[1],false)
			guiSetVisible(GUIEditor.staticimage[36],false)
			setElementFrozen(localPlayer,false)
			showCursor(false)
		end
	end
end)

local DisabledID = {
	16,
	17,
	35,
	36,
	37,
	39,
}

function isNewSlotDisabled (Slot)
	for i , v in pairs (DisabledID) do
		if Slot == v then
			return true
		end
	end
end

function disableMinigunOnSwitch ( prevSlot, newSlot )
	local x,y,z = getElementPosition(localPlayer)
	local location = getZoneName ( x, y, z,true )
	local Dim = getElementDimension(localPlayer)
	local Int = getElementInterior(localPlayer)
	local ID = getPedWeapon(localPlayer,newSlot)
	if Int ~= 0 or Dim ~= 0 or (Dim == 0 and Int == 0 and location == "Las Venturas"   ) then
		--if getPedWeapon(getLocalPlayer(),newSlot) == 16 or getPedWeapon(getLocalPlayer(),newSlot) == 17 or getPedWeapon(getLocalPlayer(),newSlot) == 35 or getPedWeapon(getLocalPlayer(),newSlot) == 36 or getPedWeapon(getLocalPlayer(),newSlot) == 37 or getPedWeapon(localPlayer,newSlot) == 39  then
		if (location == "Las Venturas" and newSlot == 7)  or (isNewSlotDisabled(ID) and location ~= "Las Venturas") or (isNewSlotDisabled(ID) and Dim ~= 0  )  then
			toggleControl ("fire",false)
			toggleControl ("action",false)
		else
			toggleControl ("fire",true)
			toggleControl ("action",true)
		end
	end
	--[[local x,y,z = getElementPosition(localPlayer)
	local City = getZoneName(x,y,z,true)
	if getPedWeapon(localPlayer,newSlot) == 39 and ( getElementInterior(localPlayer) ~= 0 or getElementDimension(localPlayer) ~= 0 or City ~= "Las Venturas" )   then
		toggleControl ("fire",false)
		toggleControl ("action",false)
	else
		toggleControl ("fire",true)
		toggleControl ("action",true)
	end]]
end
addEventHandler ( "onClientPlayerWeaponSwitch", getRootElement(), disableMinigunOnSwitch )

