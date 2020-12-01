

AccountsManagerEditor = {
		edit = {},
		gridlist = {},
		window = {},
		button = {},
		combobox = {},
		edit = {}
	}

			AccountsManagerEditor.window[1] = guiCreateWindow(0.30, 0.23, 0.39, 0.58, "Accounts Manager", true)
			guiWindowSetSizable(AccountsManagerEditor.window[1], false)
			guiSetVisible(AccountsManagerEditor.window[1],false)

			AccountsManagerEditor.gridlist[1] = guiCreateGridList(0.01, 0.14, 0.65, 0.85, true, AccountsManagerEditor.window[1])
			guiGridListAddColumn(AccountsManagerEditor.gridlist[1], "ID", 0.1)
			guiGridListAddColumn(AccountsManagerEditor.gridlist[1], "Account Name", 0.2)
			guiGridListAddColumn(AccountsManagerEditor.gridlist[1], "Password", 0.3)
			guiGridListAddColumn(AccountsManagerEditor.gridlist[1], "Serial", 0.4)
			guiGridListAddColumn(AccountsManagerEditor.gridlist[1], "Money", 0.1)
			guiGridListAddColumn(AccountsManagerEditor.gridlist[1], "Bank", 0.1)
			guiGridListAddColumn(AccountsManagerEditor.gridlist[1], "Level", 0.1)
			guiGridListAddColumn(AccountsManagerEditor.gridlist[1], "Exp", 0.1)
			guiGridListSetSortingEnabled(AccountsManagerEditor.gridlist[1],false)
			AccountsManagerEditor.edit[1] = guiCreateEdit(0.02, 0.06, 0.65, 0.05, "", true, AccountsManagerEditor.window[1])
			AccountsManagerEditor.combobox[1] = guiCreateComboBox(0.70, 0.06, 0.28, 0.52, "Password", true, AccountsManagerEditor.window[1])
			guiComboBoxAddItem(AccountsManagerEditor.combobox[1], "Password")
			guiComboBoxAddItem(AccountsManagerEditor.combobox[1], "Serial")
			guiComboBoxAddItem(AccountsManagerEditor.combobox[1], "Money")
			guiComboBoxAddItem(AccountsManagerEditor.combobox[1], "BankBalance")
			guiComboBoxAddItem(AccountsManagerEditor.combobox[1], "Level")
			guiComboBoxAddItem(AccountsManagerEditor.combobox[1], "Exp")
			AccountsManagerEditor.button[1] = guiCreateButton(0.71, 0.89, 0.26, 0.07, "Close", true, AccountsManagerEditor.window[1])
			guiSetProperty(AccountsManagerEditor.button[1], "NormalTextColour", "FFFF0000")
			AccountsManagerEditor.button[2] = guiCreateButton(0.71, 0.79, 0.26, 0.07, "Delete", true, AccountsManagerEditor.window[1])
			guiSetProperty(AccountsManagerEditor.button[2], "NormalTextColour", "FF71FE00")
			AccountsManagerEditor.button[3] = guiCreateButton(0.71, 0.69, 0.26, 0.07, "Edit", true, AccountsManagerEditor.window[1])
			guiSetProperty(AccountsManagerEditor.button[3], "NormalTextColour", "FF71FE00")
			AccountsManagerEditor.edit[2] = guiCreateEdit(0.71, 0.60, 0.26, 0.07, "", true, AccountsManagerEditor.window[1])    


local serverAccounts = {}

function SearchInAccounts ()
	if (source == AccountsManagerEditor.edit[1]) then
		local Text = guiGetText(source)
		guiGridListClear(AccountsManagerEditor.gridlist[1])
		if Text ~= "" then
			for i , v in pairs (serverAccounts) do
				if string.find(string.lower(v[2]),string.lower(Text)) or string.find(string.lower(v[4]),string.lower(Text)) then
					local Row = guiGridListAddRow(AccountsManagerEditor.gridlist[1])
					guiGridListSetItemText(AccountsManagerEditor.gridlist[1],Row,1,v[1],false,false)
					guiGridListSetItemText(AccountsManagerEditor.gridlist[1],Row,2,v[2],false,false)
					guiGridListSetItemText(AccountsManagerEditor.gridlist[1],Row,3,v[3],false,false)
					guiGridListSetItemText(AccountsManagerEditor.gridlist[1],Row,4,v[4],false,false)
					guiGridListSetItemText(AccountsManagerEditor.gridlist[1],Row,5,v[5],false,false)
					guiGridListSetItemText(AccountsManagerEditor.gridlist[1],Row,6,v[6],false,false)
					guiGridListSetItemText(AccountsManagerEditor.gridlist[1],Row,7,v[7],false,false)
					guiGridListSetItemText(AccountsManagerEditor.gridlist[1],Row,8,v[8],false,false)
				end
			end
		elseif Text == "" then
			for i , v in pairs (serverAccounts) do
				local Row = guiGridListAddRow(AccountsManagerEditor.gridlist[1])
				guiGridListSetItemText(AccountsManagerEditor.gridlist[1],Row,1,v[1],false,false)
				guiGridListSetItemText(AccountsManagerEditor.gridlist[1],Row,2,v[2],false,false)
				guiGridListSetItemText(AccountsManagerEditor.gridlist[1],Row,3,v[3],false,false)
				guiGridListSetItemText(AccountsManagerEditor.gridlist[1],Row,4,v[4],false,false)
				guiGridListSetItemText(AccountsManagerEditor.gridlist[1],Row,5,v[5],false,false)
				guiGridListSetItemText(AccountsManagerEditor.gridlist[1],Row,6,v[6],false,false)
				guiGridListSetItemText(AccountsManagerEditor.gridlist[1],Row,7,v[7],false,false)
				guiGridListSetItemText(AccountsManagerEditor.gridlist[1],Row,8,v[8],false,false)
			end
		end
	end
end
addEventHandler("onClientGUIChanged",AccountsManagerEditor.edit[1],SearchInAccounts)

addEventHandler("onClientGUIClick",root,
function()
	if (source == AccountsManagerEditor.button[1]) then
		guiSetVisible(AccountsManagerEditor.window[1],false)
		showCursor(false)
	elseif (source == AccountsManagerEditor.button[2]) then
		local Selected = guiGridListGetSelectedItem(AccountsManagerEditor.gridlist[1])
		if Selected ~= -1 then
			local AccountName = guiGridListGetItemText(AccountsManagerEditor.gridlist[1],Selected,2)
			local Serial = guiGridListGetItemText(AccountsManagerEditor.gridlist[1],Selected,4)
			triggerServerEvent("GameMod",localPlayer,"DeleteAccount",AccountName,Serial)
		end
	elseif (source == AccountsManagerEditor.button[3]) then
		local Selected = guiComboBoxGetSelected(AccountsManagerEditor.combobox[1])
		if Selected then
			local Text = guiComboBoxGetItemText(AccountsManagerEditor.combobox[1],Selected)
			local GridSelected = guiGridListGetSelectedItem(AccountsManagerEditor.gridlist[1])
			if GridSelected ~= -1 then
				local AccountName = guiGridListGetItemText(AccountsManagerEditor.gridlist[1],GridSelected,2)
				local Serial = guiGridListGetItemText(AccountsManagerEditor.gridlist[1],GridSelected,4)
				local EditText = guiGetText(AccountsManagerEditor.edit[2])
				if EditText ~= "" and EditText ~= "" then
					outputChatBox("Done")
					triggerServerEvent("GameMod",localPlayer,"EditAccount",AccountName,Serial,Text,EditText)
				end
			end
		end
	end
end)


addEvent("[Titans]AccountsMaanger",true)
addEventHandler("[Titans]AccountsMaanger",root,
function(Type,Data)
	if Type == "OpenPanel" then
		guiSetVisible(AccountsManagerEditor.window[1],true)
		showCursor(true)
	elseif Type == "RefreshAccountsDatas" then
		serverAccounts = {}
		for i , v in pairs (Data) do
			local Row = guiGridListAddRow(AccountsManagerEditor.gridlist[1])
			guiGridListSetItemText(AccountsManagerEditor.gridlist[1],Row,1,i,false,false)
			guiGridListSetItemText(AccountsManagerEditor.gridlist[1],Row,2,v["AccountName"],false,false)
			guiGridListSetItemText(AccountsManagerEditor.gridlist[1],Row,3,v["Password"],false,false)
			guiGridListSetItemText(AccountsManagerEditor.gridlist[1],Row,4,v["Serial"],false,false)
			guiGridListSetItemText(AccountsManagerEditor.gridlist[1],Row,5,v["Money"],false,false)
			guiGridListSetItemText(AccountsManagerEditor.gridlist[1],Row,6,v["BankBalance"],false,false)
			guiGridListSetItemText(AccountsManagerEditor.gridlist[1],Row,7,v["Level"],false,false)
			guiGridListSetItemText(AccountsManagerEditor.gridlist[1],Row,8,v["Exp"],false,false)
			table.insert(serverAccounts,{i,v["AccountName"],v["Password"],v["Serial"],v["Money"],v["BankBalance"],v["Level"],v["Exp"]   })
		end
		SearchInAccounts()
	end
end)









