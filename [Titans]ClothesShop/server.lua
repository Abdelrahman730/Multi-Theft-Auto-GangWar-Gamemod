addEvent( "onChangeClothesCJ", true )
addEventHandler( "onChangeClothesCJ", root,
function ( CJClothesTable, CJClothesString )
	if ( CJClothesTable ) then
		for int, index in pairs( CJClothesTable ) do
			local texture, model = getClothesByTypeIndex ( int, index )
			if ( texture ) then
				addPedClothes ( source, texture, model, int )
				saveClothes(source)
			end
		end
	end
end
)

addEvent( "onPlayerBougtSkin", true )
addEventHandler( "onPlayerBougtSkin", root,
function ( thePrice )
	if ( thePrice ) then
		--takePlayerMoney( source, tonumber(thePrice) )
		local PlayerMoney = getPlayerMoney(source)
		if PlayerMoney >= thePrice then
		takePlayerMoney(source,thePrice)
		else
		exports["guimessages"]:outputServer(source, "You dont Have Money!", 255, 0, 0)
		end
	end
end
)


function saveClothes()
	local account = getPlayerAccount(source);
	if ( not isGuestAccount(account) ) and ( getElementModel(source) == 0 ) then
		local texture = {};
		local model = {};
		for i=0, 17, 1 do
			local clothesTexture, clothesModel = getPedClothes(source, i);
			if ( clothesTexture ~= false ) then
				table.insert(texture, clothesTexture);
				table.insert(model, clothesModel);
			else
				table.insert(texture, " ");
				table.insert(model, " ");
			end
		end
		local allTextures = table.concat(texture, ",");
		local allModels = table.concat(model, ",");
		setAccountData(account, "Clothessaver:Texture", allTextures);
		setAccountData(account, "Clothessaver:Model", allModels);
		texture = {};
		model = {};
	end
end
addEventHandler("onPlayerQuit", root, saveClothes);

function setClothes()
	local account = getPlayerAccount(source);
	if ( not isGuestAccount(account) ) then
		local textureString = getAccountData(account, "Clothessaver:Texture");
		local modelString = getAccountData(account, "Clothessaver:Model");
		if type(textureString) == "string" and type(modelString) == "string" then
			local textures = split(textureString, 44);
			local models = split(modelString, 44);
			for i=0, 17, 1 do
				if ( textures[i+1] ~= " " ) then
					addPedClothes(source, textures[i+1], models[i+1], i);
				end
			end
			textures = {};
			models = {};
		end
	end
end
addEventHandler("onPlayerLogin", root, setClothes);

function loadClothes(player)
	if isElement(player) and getElementType(player) == "player" then
		local account = getPlayerAccount(player);
		if not isGuestAccount(account) then
			local textureString = getAccountData(account, "Clothessaver:Texture");
			local modelString = getAccountData(account, "Clothessaver:Model");
			if textureString then
				local textures = split(textureString, 44);
				local models = split(modelString, 44);
				for i=0, 17, 1 do
					if ( textures[i+1] ~= " " ) then
						addPedClothes(player, textures[i+1], models[i+1], i);
					end
				end
				textures = {};
				models = {};
			end
		end
	end
end

function saveClothes(player)
	if isElement(player) and getElementType(player) == "player" then
		local account = getPlayerAccount(player);
		if not isGuestAccount(account) then
			if getElementModel(player) == 0 then
				local texture = {};
				local model = {};
				for i=0, 17, 1 do
					local clothesTexture, clothesModel = getPedClothes(player, i);
					if ( clothesTexture ~= false ) then
						table.insert(texture, clothesTexture);
						table.insert(model, clothesModel);
					else
						table.insert(texture, " ");
						table.insert(model, " ");
					end
				end
				local allTextures = table.concat(texture, ",");
				local allModels = table.concat(model, ",");
				setAccountData(account, "Clothessaver:Texture", allTextures);
				setAccountData(account, "Clothessaver:Model", allModels);
				texture = {};
				model = {};
			end
		end
	end
end

addEventHandler("onPlayerSpawn", root,
function ()
	if getPlayerTeam(source) and getTeamName(getPlayerTeam(source)) == "Criminals" then
		if getElementModel(source) == 0 then
			HyperTimer = setTimer(
			function ( source )
				loadClothes(source);
				exports["guimessages"]:outputServer(source, "Your CJ Clothes has been placed", 0, 255, 0)
			end, 2000, 1,source );
		end
	end
end );
