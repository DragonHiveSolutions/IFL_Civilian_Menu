local natureIndex = 1
local beachIndex = 1
local constructionIndex = 1
local drugsIndex = 1
local weaponsIndex = 1
local foodIndex = 1
local farmingIndex = 1
local equipmentIndex = 1
local bodiesIndex = 1
local miscIndex = 1

local spawnedIndex = 1
local spawned = {}

local Scale = nil
local instructions = nil
local movespeed = 0.1
local rotspeed = 1.0 

local attachType = nil
local attachtypes = {"Vehicle - Vehicle", "Object - Ped"}
local bones = {"IK_Root", "IK_L_Hand", "IK_R_Hand", "IK_L_Foot", "IK_R_Foot", "IK_Head"}
local attachIndex = 1
local boneIndex = 1
local attached = false
local position = {['x'] = 0.0, ['y'] = 0.0, ['z'] = 0.0}
local rotation = {['x'] = 0.0, ['y'] = 0.0, ['z'] = 0.0}

local veh1 = nil
local veh2 = nil
local currentveh = nil
local vehattached = false
local vehposition = {['x'] = 0.0, ['y'] = 0.0, ['z'] = 0.0}
local vehrotation = {['x'] = 0.0, ['y'] = 0.0, ['z'] = 0.0}

Citizen.CreateThread(function()

	Scale = RequestScaleformMovie("INSTRUCTIONAL_BUTTONS");
    while not HasScaleformMovieLoaded(Scale) do
		Wait(0)
    end

end)

function props()
	if WarMenu.MenuButton('Manipulation', 'manipulate') then

	elseif WarMenu.MenuButton('Spawning', 'spawning') then

	elseif WarMenu.MenuButton('Attaching', 'attaching') then
	
	elseif WarMenu.Button('Delete All Props') then
		DeleteAll()
	end
	
end

function spawning()

	local Nature = { }
	local Beach = { }
	local Construction = { }
	local Drugs = { }
	local Weapons = { }
	local Food = { }
	local Farming = { }
	local Equipment = { }
	local Bodies = { }
	local Misc = { }
	
	for k,v in pairs(Objects) do 
	
		if k == "Nature" then
			for k,v in pairs(v) do 
				table.insert(Nature, v.Displayname)
			end
		elseif k == "Beach" then
			for k,v in pairs(v) do 
				table.insert(Beach, v.Displayname)
			end
		elseif k == "Construction" then
			for k,v in pairs(v) do 
				table.insert(Construction, v.Displayname)
			end
		elseif k == "Drugs" then
			for k,v in pairs(v) do 
				table.insert(Drugs, v.Displayname)
			end
		elseif k == "Weapons" then
			for k,v in pairs(v) do 
				table.insert(Weapons, v.Displayname)
			end
		elseif k == "Food" then
			for k,v in pairs(v) do 
				table.insert(Food, v.Displayname)
			end
		elseif k == "Farming" then
			for k,v in pairs(v) do 
				table.insert(Farming, v.Displayname)
			end
		elseif k == "Equipment" then
			for k,v in pairs(v) do 
				table.insert(Equipment, v.Displayname)
			end
		elseif k == "Bodies" then
			for k,v in pairs(v) do 
				table.insert(Bodies, v.Displayname)
			end
		elseif k == "Misc" then
			for k,v in pairs(v) do 
				table.insert(Misc, v.Displayname)
			end
		end
	end
		
		if WarMenu.ComboBox('Nature', Nature, natureIndex, natureIndex, function(current) 
			natureIndex = current 
		end) then
		
		
			if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
				SpawnItem(Objects.Nature[natureIndex]['Object'])
			else
				ShowNotification("~r~You can't be in a vehicle!")
			end
			
		
		elseif WarMenu.ComboBox('Beach', Beach, beachIndex, beachIndex, function(current) 
			beachIndex = current 
		end) then
		
			if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
				SpawnItem(Objects.Beach[beachIndex]['Object'])
			else
				ShowNotification("~r~You can't be in a vehicle!")
			end
		
		elseif WarMenu.ComboBox('Construction', Construction, constructionIndex, constructionIndex, function(current) 
			constructionIndex = current 
		end) then
		
		
			if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
				SpawnItem(Objects.Construction[constructionIndex]['Object'])
			else
				ShowNotification("~r~You can't be in a vehicle!")
			end
			
		
		elseif WarMenu.ComboBox('Drugs', Drugs, drugsIndex, drugsIndex, function(current) 
			drugsIndex = current 
		end) then
		
		
			if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
				SpawnItem(Objects.Drugs[drugsIndex]['Object'])
			else
				ShowNotification("~r~You can't be in a vehicle!")
			end
		
		
		elseif WarMenu.ComboBox('Weapons', Weapons, weaponsIndex, weaponsIndex, function(current) 
			weaponsIndex = current 
		end) then
		
		
			if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
				SpawnItem(Objects.Weapons[weaponsIndex]['Object'])
			else
				ShowNotification("~r~You can't be in a vehicle!")
			end
		
		
		elseif WarMenu.ComboBox('Food', Food, foodIndex, foodIndex, function(current) 
			foodIndex = current 
		end) then
		
		
			if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
				SpawnItem(Objects.Food[foodIndex]['Object'])
			else
				ShowNotification("~r~You can't be in a vehicle!")
			end
		
		elseif WarMenu.ComboBox('Farming', Farming, farmingIndex, farmingIndex, function(current) 
			farmingIndex = current 
		end) then
		
		
			if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
				SpawnItem(Objects.Farming[farmingIndex]['Object'])
			else
				ShowNotification("~r~You can't be in a vehicle!")
			end
			
		elseif WarMenu.ComboBox('Equipment', Equipment, equipmentIndex, equipmentIndex, function(current) 
			equipmentIndex = current 
		end) then
		
		
			if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
				SpawnItem(Objects.Equipment[equipmentIndex]['Object'])
			else
				ShowNotification("~r~You can't be in a vehicle!")
			end
			
		elseif WarMenu.ComboBox('Bodies', Bodies, bodiesIndex, bodiesIndex, function(current) 
			bodiesIndex = current 
		end) then
		
		
			if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
				SpawnItem(Objects.Bodies[bodiesIndex]['Object'])
			else
				ShowNotification("~r~You can't be in a vehicle!")
			end
			
		elseif WarMenu.ComboBox('Misc', Misc, miscIndex, miscIndex, function(current) 
			miscIndex = current 
		end) then
		
		
			if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
				SpawnItem(Objects.Misc[miscIndex]['Object'])
			else
				ShowNotification("~r~You can't be in a vehicle!")
			end
		
		end

end

function manipulate()

	if WarMenu.ComboBox('Selected Object', spawned, spawnedIndex, spawnedIndex, function(current) 
			spawnedIndex = current
			local object = spawned[current]
			
			if DoesEntityExist(object) then
				marker(GetEntityCoords(object))
			end
	end) then end
	
	if WarMenu.Button('Delete') then -- Delete Object
		SetEntityAsMissionEntity(spawned[spawnedIndex])
		DeleteObject(spawned[spawnedIndex])
		table.remove(spawned, spawnedIndex)
	elseif WarMenu.Button('Rotate') then
		instructions = 'Rotate'
	elseif WarMenu.Button('Move') then
		instructions = 'Move'
	elseif WarMenu.Button('Set on Ground') then
		PlaceObjectOnGroundProperly(spawned[spawnedIndex])
	end
	
	if instructions == 'Rotate' then -- Keys
	
	if IsControlPressed(0, 118) and GetLastInputMethod( 0 ) then -- Rotation Keys
		local currentrot = GetEntityRotation(spawned[spawnedIndex], 2)
		SetEntityRotation(spawned[spawnedIndex], currentrot.x, currentrot.y, currentrot.z + rotspeed, 2, true)
	elseif IsControlPressed(0, 117) and GetLastInputMethod( 0 ) then
		local currentrot = GetEntityRotation(spawned[spawnedIndex], 2)
		SetEntityRotation(spawned[spawnedIndex], currentrot.x, currentrot.y, currentrot.z - rotspeed, 2, true)
	elseif IsControlPressed(0, 121) and GetLastInputMethod( 0 ) then
		local currentrot = GetEntityRotation(spawned[spawnedIndex], 2)
		SetEntityRotation(spawned[spawnedIndex], currentrot.x + rotspeed, currentrot.y, currentrot.z, 2, true)
	elseif IsControlPressed(0, 178) and GetLastInputMethod( 0 ) then
		local currentrot = GetEntityRotation(spawned[spawnedIndex], 2)
		SetEntityRotation(spawned[spawnedIndex], currentrot.x - rotspeed, currentrot.y, currentrot.z, 2, true)
	elseif IsControlPressed(0, 207) and GetLastInputMethod( 0 ) then
		local currentrot = GetEntityRotation(spawned[spawnedIndex], 2)
		SetEntityRotation(spawned[spawnedIndex], currentrot.x, currentrot.y + rotspeed, currentrot.z, 2, true)
	elseif IsControlJustReleased(0, 208) and GetLastInputMethod( 0 ) then
		local currentrot = GetEntityRotation(spawned[spawnedIndex], 2)
		SetEntityRotation(spawned[spawnedIndex], currentrot.x, currentrot.y - rotspeed, currentrot.z, 2, true)
	elseif IsControlJustReleased(0, 21) and GetLastInputMethod( 0 ) then
		if rotspeed < 5.0 then
			rotspeed = rotspeed + 1.0
		else
			ShowNotification('Cannot go faster')
		end
	elseif IsControlPressed(0, 132) and GetLastInputMethod( 0 ) then
		if rotspeed > 0.5 then
			rotspeed = rotspeed - 0.5
		else
			ShowNotification('Cannot go slower')
		end
	end
	
	elseif instructions == 'Move' then
	
	if IsControlPressed(0, 108) and GetLastInputMethod( 0 ) then -- Movement Keys
		local currentpos = GetEntityCoords(spawned[spawnedIndex])
		SetEntityCoords(spawned[spawnedIndex], currentpos.x - movespeed, currentpos.y, currentpos.z, 1, 0, 0, 0)
	elseif IsControlPressed(0, 107) and GetLastInputMethod( 0 ) then
		local currentpos = GetEntityCoords(spawned[spawnedIndex])
		SetEntityCoords(spawned[spawnedIndex], currentpos.x + movespeed, currentpos.y, currentpos.z, 1, 0, 0, 0)
	elseif IsControlPressed(0, 112) and GetLastInputMethod( 0 ) then
		local currentpos = GetEntityCoords(spawned[spawnedIndex])
		SetEntityCoords(spawned[spawnedIndex], currentpos.x, currentpos.y + movespeed, currentpos.z, 1, 0, 0, 0)
	elseif IsControlPressed(0, 111) and GetLastInputMethod( 0 ) then
		local currentpos = GetEntityCoords(spawned[spawnedIndex])
		SetEntityCoords(spawned[spawnedIndex], currentpos.x, currentpos.y - movespeed, currentpos.z, 1, 0, 0, 0)
	elseif IsControlPressed(0, 313) and GetLastInputMethod( 0 ) then
		local currentpos = GetEntityCoords(spawned[spawnedIndex])
		SetEntityCoords(spawned[spawnedIndex], currentpos.x, currentpos.y, currentpos.z + movespeed, 1, 0, 0, 0)
	elseif IsControlPressed(0, 312) and GetLastInputMethod( 0 ) then
		local currentpos = GetEntityCoords(spawned[spawnedIndex])
		SetEntityCoords(spawned[spawnedIndex], currentpos.x, currentpos.y, currentpos.z - movespeed, 1, 0, 0, 0)
	elseif IsControlJustReleased(0, 21) and GetLastInputMethod( 0 ) then
		if movespeed < 2.0 then
			movespeed = movespeed + 0.5
		else
			ShowNotification('Cannot go faster')
		end
	elseif IsControlJustReleased(0, 132) and GetLastInputMethod( 0 ) then
		if movespeed > 0.1 then
			movespeed = movespeed - 0.1
		else
			ShowNotification('Cannot go slower')
		end
	end
	
	end
	
	if instructions == 'Move' then -- Instructional Buttons (Move/Rotate)
		
		BeginScaleformMovieMethod(Scale, "CLEAR_ALL");
		EndScaleformMovieMethod();
	
		BeginScaleformMovieMethod(Scale, "SET_DATA_SLOT");
		ScaleformMovieMethodAddParamInt(0);
		PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 108));
		PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 107));
		PushScaleformMovieMethodParameterString("Move X");
		EndScaleformMovieMethod();
	
		BeginScaleformMovieMethod(Scale, "SET_DATA_SLOT");
		ScaleformMovieMethodAddParamInt(1);
		PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 112));
		PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 111));
		PushScaleformMovieMethodParameterString("Move Y");
		EndScaleformMovieMethod();
	
		BeginScaleformMovieMethod(Scale, "SET_DATA_SLOT");
		ScaleformMovieMethodAddParamInt(2);
		PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 313));
		PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 312));
		PushScaleformMovieMethodParameterString("Move Z");
		EndScaleformMovieMethod();
		
		BeginScaleformMovieMethod(Scale, "SET_DATA_SLOT");
		ScaleformMovieMethodAddParamInt(3);
		PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 21));
		PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 36));
		PushScaleformMovieMethodParameterString("Change Speed");
		EndScaleformMovieMethod();
	
		BeginScaleformMovieMethod(Scale, "DRAW_INSTRUCTIONAL_BUTTONS");
		ScaleformMovieMethodAddParamInt(0);
		EndScaleformMovieMethod();
	
		DrawScaleformMovieFullscreen(Scale, 255, 255, 255, 255, 0);
	
	elseif instructions == 'Rotate' then
	
		BeginScaleformMovieMethod(Scale, "CLEAR_ALL");
		EndScaleformMovieMethod();
	
		BeginScaleformMovieMethod(Scale, "SET_DATA_SLOT");
		ScaleformMovieMethodAddParamInt(0);
		PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 118));
		PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 117));
		PushScaleformMovieMethodParameterString("Rotate Z");
		EndScaleformMovieMethod();
	
		BeginScaleformMovieMethod(Scale, "SET_DATA_SLOT");
		ScaleformMovieMethodAddParamInt(1);
		PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 121));
		PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 178));
		PushScaleformMovieMethodParameterString("Rotate X");
		EndScaleformMovieMethod();
	
		BeginScaleformMovieMethod(Scale, "SET_DATA_SLOT");
		ScaleformMovieMethodAddParamInt(2);
		PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 207));
		PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 208));
		PushScaleformMovieMethodParameterString("Rotate Y");
		EndScaleformMovieMethod();
		
		BeginScaleformMovieMethod(Scale, "SET_DATA_SLOT");
		ScaleformMovieMethodAddParamInt(3);
		PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 21));
		PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 36));
		PushScaleformMovieMethodParameterString("Change Speed");
		EndScaleformMovieMethod();
	
		BeginScaleformMovieMethod(Scale, "DRAW_INSTRUCTIONAL_BUTTONS");
		ScaleformMovieMethodAddParamInt(0);
		EndScaleformMovieMethod();
	
		DrawScaleformMovieFullscreen(Scale, 255, 255, 255, 255, 0);
		
	end
	
end

function attaching()

	if WarMenu.ComboBox('Type', attachtypes, attachIndex, attachIndex, function(current)  -- Attach type
		attachType = attachtypes[attachIndex]
		attachIndex = current
	end) then end
	
	
	if attachType == 'Object - Ped' then
		if WarMenu.ComboBox('Object', spawned, spawnedIndex, spawnedIndex, function(current) 
			spawnedIndex = current
			local object = spawned[current]
			
			if DoesEntityExist(object) then
				marker(GetEntityCoords(object))
			end
		end) then
		
		elseif WarMenu.ComboBox('Ped Bone', bones, boneIndex, boneIndex, function(current) 
			boneIndex = current
		end) then
		
		elseif WarMenu.Button('Attach') then
			DetachEntity(spawned[spawnedIndex], false, false)
			SetEntityAsMissionEntity(spawned[spawnedIndex])
			attached = true
			FreezeEntityPosition(spawned[spawnedIndex], false)
			AttachEntityToEntity(spawned[spawnedIndex], GetPlayerPed(-1), GetEntityBoneIndexByName(GetPlayerPed(-1), bones[boneIndex]), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, true, false, 0, true)
		elseif WarMenu.Button('Detach') then
			DetachEntity(spawned[spawnedIndex], false, false)
			attached = false
		end
		
		if attached then
		
			if IsControlPressed(0, 118) and GetLastInputMethod( 0 ) then -- Rotation Keys
				rotation['x'] = rotation['x'] + 1
				AttachEntityToEntity(spawned[spawnedIndex], GetPlayerPed(-1), GetEntityBoneIndexByName(GetPlayerPed(-1), bones[boneIndex]), position['x'], position['y'], position['z'], rotation['x'], rotation['y'], rotation['z'], false, false, true, false, 0, true)
			elseif IsControlPressed(0, 117) and GetLastInputMethod( 0 ) then
				rotation['x'] = rotation['x'] - 1
				AttachEntityToEntity(spawned[spawnedIndex], GetPlayerPed(-1), GetEntityBoneIndexByName(GetPlayerPed(-1), bones[boneIndex]), position['x'], position['y'], position['z'], rotation['x'], rotation['y'], rotation['z'], false, false, true, false, 0, true)
			elseif IsControlPressed(0, 121) and GetLastInputMethod( 0 ) then
				rotation['y'] = rotation['y'] + 1
				AttachEntityToEntity(spawned[spawnedIndex], GetPlayerPed(-1), GetEntityBoneIndexByName(GetPlayerPed(-1), bones[boneIndex]), position['x'], position['y'], position['z'], rotation['x'], rotation['y'], rotation['z'], false, false, true, false, 0, true)
			elseif IsControlPressed(0, 178) and GetLastInputMethod( 0 ) then
				rotation['y'] = rotation['y'] - 1
				AttachEntityToEntity(spawned[spawnedIndex], GetPlayerPed(-1), GetEntityBoneIndexByName(GetPlayerPed(-1), bones[boneIndex]), position['x'], position['y'], position['z'], rotation['x'], rotation['y'], rotation['z'], false, false, true, false, 0, true)
			elseif IsControlPressed(0, 207) and GetLastInputMethod( 0 ) then
				rotation['z'] = rotation['z'] + 1
				AttachEntityToEntity(spawned[spawnedIndex], GetPlayerPed(-1), GetEntityBoneIndexByName(GetPlayerPed(-1), bones[boneIndex]), position['x'], position['y'], position['z'], rotation['x'], rotation['y'], rotation['z'], false, false, true, false, 0, true)
			elseif IsControlJustReleased(0, 208) and GetLastInputMethod( 0 ) then
				rotation['z'] = rotation['z'] - 1
				AttachEntityToEntity(spawned[spawnedIndex], GetPlayerPed(-1), GetEntityBoneIndexByName(GetPlayerPed(-1), bones[boneIndex]), position['x'], position['y'], position['z'], rotation['x'], rotation['y'], rotation['z'], false, false, true, false, 0, true)
			elseif IsControlPressed(0, 108) and GetLastInputMethod( 0 ) then -- Movement Keys
				position['x'] = position['x'] + 0.025
				AttachEntityToEntity(spawned[spawnedIndex], GetPlayerPed(-1), GetEntityBoneIndexByName(GetPlayerPed(-1), bones[boneIndex]), position['x'], position['y'], position['z'], rotation['x'], rotation['y'], rotation['z'], false, false, true, false, 0, true)
			elseif IsControlPressed(0, 107) and GetLastInputMethod( 0 ) then
				position['x'] = position['x'] - 0.025
				AttachEntityToEntity(spawned[spawnedIndex], GetPlayerPed(-1), GetEntityBoneIndexByName(GetPlayerPed(-1), bones[boneIndex]), position['x'], position['y'], position['z'], rotation['x'], rotation['y'], rotation['z'], false, false, true, false, 0, true)
			elseif IsControlPressed(0, 112) and GetLastInputMethod( 0 ) then
				position['y'] = position['y'] + 0.025
				AttachEntityToEntity(spawned[spawnedIndex], GetPlayerPed(-1), GetEntityBoneIndexByName(GetPlayerPed(-1), bones[boneIndex]), position['x'], position['y'], position['z'], rotation['x'], rotation['y'], rotation['z'], false, false, true, false, 0, true)
			elseif IsControlPressed(0, 111) and GetLastInputMethod( 0 ) then
				position['y'] = position['y'] - 0.025
				AttachEntityToEntity(spawned[spawnedIndex], GetPlayerPed(-1), GetEntityBoneIndexByName(GetPlayerPed(-1), bones[boneIndex]), position['x'], position['y'], position['z'], rotation['x'], rotation['y'], rotation['z'], false, false, true, false, 0, true)
			elseif IsControlPressed(0, 313) and GetLastInputMethod( 0 ) then
				position['z'] = position['z'] + 0.025
				AttachEntityToEntity(spawned[spawnedIndex], GetPlayerPed(-1), GetEntityBoneIndexByName(GetPlayerPed(-1), bones[boneIndex]), position['x'], position['y'], position['z'], rotation['x'], rotation['y'], rotation['z'], false, false, true, false, 0, true)
			elseif IsControlPressed(0, 312) and GetLastInputMethod( 0 ) then
				position['z'] = position['z'] - 0.025
				AttachEntityToEntity(spawned[spawnedIndex], GetPlayerPed(-1), GetEntityBoneIndexByName(GetPlayerPed(-1), bones[boneIndex]), position['x'], position['y'], position['z'], rotation['x'], rotation['y'], rotation['z'], false, false, false, true, 0, true)
			end
		
			BeginScaleformMovieMethod(Scale, "CLEAR_ALL");
			EndScaleformMovieMethod();
	
			BeginScaleformMovieMethod(Scale, "SET_DATA_SLOT");
			ScaleformMovieMethodAddParamInt(0);
			PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 108));
			PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 107));
			PushScaleformMovieMethodParameterString("Move X");
			EndScaleformMovieMethod();
	
			BeginScaleformMovieMethod(Scale, "SET_DATA_SLOT");
			ScaleformMovieMethodAddParamInt(1);
			PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 112));
			PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 111));
			PushScaleformMovieMethodParameterString("Move Y");
			EndScaleformMovieMethod();
	
			BeginScaleformMovieMethod(Scale, "SET_DATA_SLOT");
			ScaleformMovieMethodAddParamInt(2);
			PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 313));
			PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 312));
			PushScaleformMovieMethodParameterString("Move Z");
			EndScaleformMovieMethod();
		
			BeginScaleformMovieMethod(Scale, "SET_DATA_SLOT");
			ScaleformMovieMethodAddParamInt(3);
			PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 118));
			PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 117));
			PushScaleformMovieMethodParameterString("Rotate Z");
			EndScaleformMovieMethod();
	
			BeginScaleformMovieMethod(Scale, "SET_DATA_SLOT");
			ScaleformMovieMethodAddParamInt(4);
			PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 121));
			PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 178));
			PushScaleformMovieMethodParameterString("Rotate X");
			EndScaleformMovieMethod();
	
			BeginScaleformMovieMethod(Scale, "SET_DATA_SLOT");
			ScaleformMovieMethodAddParamInt(5);
			PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 207));
			PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 208));
			PushScaleformMovieMethodParameterString("Rotate Y");
			EndScaleformMovieMethod();
		
			BeginScaleformMovieMethod(Scale, "DRAW_INSTRUCTIONAL_BUTTONS");
			ScaleformMovieMethodAddParamInt(0);
			EndScaleformMovieMethod();
	
			DrawScaleformMovieFullscreen(Scale, 255, 255, 255, 255, 0);
			
		end
		
	elseif attachType == 'Vehicle - Vehicle' then
	
		if not veh1 then
			local pos = GetEntityCoords(PlayerPedId())
			local targetPos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, -1.0)
            local rayCast = StartShapeTestCapsule(pos.x, pos.y, pos.z, targetPos.x, targetPos.y, targetPos.z, 2, 10, PlayerPedId(), 7)
            local _,hit,_,_,veh = GetShapeTestResult(rayCast)
            if hit and DoesEntityExist(veh) and IsEntityAVehicle(veh) and veh1 ~= veh then
                currentveh = veh
				marker(GetEntityCoords(veh))
			end
		elseif not veh2 then
		
			marker2(GetEntityCoords(veh1))
			local pos = GetEntityCoords(PlayerPedId())
			local targetPos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, -1.0)
            local rayCast = StartShapeTestCapsule(pos.x, pos.y, pos.z, targetPos.x, targetPos.y, targetPos.z, 2, 10, PlayerPedId(), 7)
            local _,hit,_,_,veh = GetShapeTestResult(rayCast)
            if hit and DoesEntityExist(veh) and IsEntityAVehicle(veh) and veh1 ~= veh then
                currentveh = veh
				
				marker(GetEntityCoords(veh))
			end
		
		else
		
			marker2(GetEntityCoords(veh1))
			marker2(GetEntityCoords(veh2))
		
		end
		
		if vehattached then
		
			if IsControlPressed(0, 118) and GetLastInputMethod( 0 ) then -- Rotation Keys
				vehrotation['x'] = vehrotation['x'] + 1
				AttachEntityToEntity(veh1, veh2, -1, vehposition['x'], vehposition['y'], vehposition['z'], vehrotation['x'], vehrotation['y'], vehrotation['z'], false, false, true, false, 0, true)
			elseif IsControlPressed(0, 117) and GetLastInputMethod( 0 ) then
				vehrotation['x'] = vehrotation['x'] - 1
				AttachEntityToEntity(veh1, veh2, -1, vehposition['x'], vehposition['y'], vehposition['z'], vehrotation['x'], vehrotation['y'], vehrotation['z'], false, false, true, false, 0, true)
			elseif IsControlPressed(0, 121) and GetLastInputMethod( 0 ) then
				vehrotation['y'] = vehrotation['y'] + 1
				AttachEntityToEntity(veh1, veh2, -1, vehposition['x'], vehposition['y'], vehposition['z'], vehrotation['x'], vehrotation['y'], vehrotation['z'], false, false, true, false, 0, true)
			elseif IsControlPressed(0, 178) and GetLastInputMethod( 0 ) then
				vehrotation['y'] = vehrotation['y'] - 1
				AttachEntityToEntity(veh1, veh2, -1, vehposition['x'], vehposition['y'], vehposition['z'], vehrotation['x'], vehrotation['y'], vehrotation['z'], false, false, true, false, 0, true)
			elseif IsControlPressed(0, 207) and GetLastInputMethod( 0 ) then
				vehrotation['z'] = vehrotation['z'] + 1
				AttachEntityToEntity(veh1, veh2, -1, vehposition['x'], vehposition['y'], vehposition['z'], vehrotation['x'], vehrotation['y'], vehrotation['z'], false, false, true, false, 0, true)
			elseif IsControlJustReleased(0, 208) and GetLastInputMethod( 0 ) then
				vehrotation['z'] = vehrotation['z'] - 1
				AttachEntityToEntity(veh1, veh2, -1, vehposition['x'], vehposition['y'], vehposition['z'], vehrotation['x'], vehrotation['y'], vehrotation['z'], false, false, true, false, 0, true)
			elseif IsControlPressed(0, 108) and GetLastInputMethod( 0 ) then -- Movement Keys
				vehposition['x'] = vehposition['x'] + 0.025
				AttachEntityToEntity(veh1, veh2, -1, vehposition['x'], vehposition['y'], vehposition['z'], vehrotation['x'], vehrotation['y'], vehrotation['z'], false, false, true, false, 0, true)
			elseif IsControlPressed(0, 107) and GetLastInputMethod( 0 ) then
				vehposition['x'] = vehposition['x'] - 0.025
				AttachEntityToEntity(veh1, veh2, -1, vehposition['x'], vehposition['y'], vehposition['z'], vehrotation['x'], vehrotation['y'], vehrotation['z'], false, false, true, false, 0, true)
			elseif IsControlPressed(0, 112) and GetLastInputMethod( 0 ) then
				vehposition['y'] = vehposition['y'] + 0.025
				AttachEntityToEntity(veh1, veh2, -1, vehposition['x'], vehposition['y'], vehposition['z'], vehrotation['x'], vehrotation['y'], vehrotation['z'], false, false, true, false, 0, true)
			elseif IsControlPressed(0, 111) and GetLastInputMethod( 0 ) then
				vehposition['y'] = vehposition['y'] - 0.025
				AttachEntityToEntity(veh1, veh2, -1, vehposition['x'], vehposition['y'], vehposition['z'], vehrotation['x'], vehrotation['y'], vehrotation['z'], false, false, true, false, 0, true)
			elseif IsControlPressed(0, 313) and GetLastInputMethod( 0 ) then
				vehposition['z'] = vehposition['z'] + 0.025
				AttachEntityToEntity(veh1, veh2, -1, vehposition['x'], vehposition['y'], vehposition['z'], vehrotation['x'], vehrotation['y'], vehrotation['z'], false, false, true, false, 0, true)
			elseif IsControlPressed(0, 312) and GetLastInputMethod( 0 ) then
				vehposition['z'] = vehposition['z'] - 0.025
				AttachEntityToEntity(veh1, veh2, -1, vehposition['x'], vehposition['y'], vehposition['z'], vehrotation['x'], vehrotation['y'], vehrotation['z'], false, false, false, true, 0, true)
			end
		
			BeginScaleformMovieMethod(Scale, "CLEAR_ALL");
			EndScaleformMovieMethod();
	
			BeginScaleformMovieMethod(Scale, "SET_DATA_SLOT");
			ScaleformMovieMethodAddParamInt(0);
			PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 108));
			PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 107));
			PushScaleformMovieMethodParameterString("Move X");
			EndScaleformMovieMethod();
	
			BeginScaleformMovieMethod(Scale, "SET_DATA_SLOT");
			ScaleformMovieMethodAddParamInt(1);
			PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 112));
			PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 111));
			PushScaleformMovieMethodParameterString("Move Y");
			EndScaleformMovieMethod();
	
			BeginScaleformMovieMethod(Scale, "SET_DATA_SLOT");
			ScaleformMovieMethodAddParamInt(2);
			PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 313));
			PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 312));
			PushScaleformMovieMethodParameterString("Move Z");
			EndScaleformMovieMethod();
		
			BeginScaleformMovieMethod(Scale, "SET_DATA_SLOT");
			ScaleformMovieMethodAddParamInt(3);
			PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 118));
			PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 117));
			PushScaleformMovieMethodParameterString("Rotate Z");
			EndScaleformMovieMethod();
	
			BeginScaleformMovieMethod(Scale, "SET_DATA_SLOT");
			ScaleformMovieMethodAddParamInt(4);
			PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 121));
			PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 178));
			PushScaleformMovieMethodParameterString("Rotate X");
			EndScaleformMovieMethod();
	
			BeginScaleformMovieMethod(Scale, "SET_DATA_SLOT");
			ScaleformMovieMethodAddParamInt(5);
			PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 207));
			PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 208));
			PushScaleformMovieMethodParameterString("Rotate Y");
			EndScaleformMovieMethod();
		
			BeginScaleformMovieMethod(Scale, "DRAW_INSTRUCTIONAL_BUTTONS");
			ScaleformMovieMethodAddParamInt(0);
			EndScaleformMovieMethod();
	
			DrawScaleformMovieFullscreen(Scale, 255, 255, 255, 255, 0);
		
		end
	
		if WarMenu.Button('Set Vehicle 1') then
			if not veh1 then
				veh1 = currentveh
				ShowNotification('~g~Vehicle 1 set!')
			else
				ShowNotification('~r~Vehicle 1 already set!')
			end
		elseif WarMenu.Button('Set Vehicle 2') then
			if currentveh ~= veh1 then
				veh2 = currentveh
				ShowNotification('~g~Vehicle 2 set!')
			else
				ShowNotification('~r~Cannot use same as Vehicle 1!')
			end
		end
		
		if veh1 and veh2 then
			if WarMenu.Button('Attach') then
				currentveh = nil
				
				AttachEntityToEntity(veh1, veh2, -1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
				vehattached = true
			
			elseif WarMenu.Button('Detach') then
			
				DetachEntity(veh1, false, false)
				DetachEntity(veh2, false, false)
				veh1 = nil
				veh2 = nil
				currentveh = nil
				vehattached = true
			
			elseif WarMenu.Button('Reset') then
				
				DetachEntity(veh1, false, false)
				DetachEntity(veh2, false, false)
				veh1 = nil
				veh2 = nil
				currentveh = nil
				vehattached = true
				
			end
		elseif veh1 or not veh2 then
			if WarMenu.Button('Reset') then
				
				DetachEntity(veh1, false, false)
				DetachEntity(veh2, false, false)
				veh1 = nil
				veh2 = nil
				currentveh = nil
				vehattached = true
				
			end
		end
	
	end
	
end


-- Other Functions --

function DeleteAll()
	for k,v in pairs(spawned) do
		SetEntityAsMissionEntity(v)
		DeleteObject(v)
	end
	
	for k,v in pairs(spawned) do
		spawned[k] = nil
	end
end

function SpawnItem(object)
	local Player = GetPlayerPed(-1)
    local heading = GetEntityHeading(Player)
    local x, y, z = table.unpack(GetEntityCoords(Player, true))
	
	RequestModel(object)
	while not HasModelLoaded(object) do
		Citizen.Wait(1)
	end
	local obj = CreateObject(GetHashKey(object), x, y, z, true, false, false);
	table.insert(spawned, obj)
	PlaceObjectOnGroundProperly(obj)
	SetEntityHeading(obj, heading)
	FreezeEntityPosition(obj, true)
	return
	
end

function marker2(pos) 

local markerType = 0
local scale = 0.3
local alpha = 255
local bounce = true
local faceCam = false
local iUnk = 0
local rotate = false
local textureDict = nil
local textureName = nil
local drawOnents = false

DrawMarker(markerType, pos.x, pos.y, pos.z + 2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, scale, scale, scale - 0.1, 255, 0, 0, alpha, bounce, faceCam, iUnk, rotate, textureDict, textureName, drawOnents)

end