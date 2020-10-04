--[[ VARIABLES ]]--

local typeIndex = 1
local obindex = 1
local types = {'Player','Vehicle','Object','Location'}
local range = {'5'}
local attachto = GetPlayerPed(-1)
local observations = {} -- Client-side obs table
local playersid = nil

--[[ MAIN FUNCTIONS ]]--

function obs()
	

	if WarMenu.ComboBox('Fixed to', types, typeIndex, typeIndex, function(current)  -- Types
			typeIndex = current
		end) then
		
	end
	
	obslist = {}
		
	for _,v in pairs(observations) do
		if v.ID == GetPlayerServerId(PlayerId()) then
			table.insert(obslist, v.Obs)
		end
	end
	
	if WarMenu.ComboBox('Active Obs (Enter - Delete)', obslist, obindex, obindex, function(current)  -- Active
			obindex = current
		end) then
		if obslist[obindex] ~= 'None' then
			delFixedObs(observations[obindex], obindex)
		end
	end
	
	if types[typeIndex] == "Vehicle" then -- Markers
	
		local veh = getVehInFront()
		
		if veh then
			marker(GetEntityCoords(veh))
			attachto = veh
		end
		
	elseif types[typeIndex] == "Object" then
		
		local obj = getObjInFront()
		
		if obj then
			marker(GetEntityCoords(obj))
			attachto = obj
		end
		
	elseif types[typeIndex] == "Player" then
	
		attachto = GetPlayerPed(-1)
	
	elseif types[typeIndex] == "Location" then
	
		attachto = GetPlayerPed(-1)
		
	end

	if WarMenu.ComboBox('Range', range, 1, 1, function() -- Range
		
	end) then
		local item = KeyboardInput("Enter number for range", "", 2)
		if tonumber(item) then
			range[1] = item
		else
			ShowNotification('Must be a number!')
		end
	elseif WarMenu.Button('Apply (Set Observation)') then
		
		if types[typeIndex] ~= 'Location' then
			SetEntityAsMissionEntity(attachto, true, true)
			local entity = NetworkGetNetworkIdFromEntity(attachto)
			SetNetworkIdCanMigrate(entity)
			SetNetworkIdExistsOnAllMachines(entity, true)
			NetworkSetNetworkIdDynamic(entity, false)
			NetworkRegisterEntityAsNetworked(ObjToNet(attachto))
		
			local observ = {}
			observ.Type = types[typeIndex]
			observ.Entity = entity
			observ.Player = GetPlayerPed(-1)
			observ.ID = GetPlayerServerId(PlayerId())
			observ.Range = range[1]
			observ.Obs = KeyboardInput("Enter observations message", "", 255)
			addFixedObs(observ)
		else
			local observ = {}
			
			local coords = GetEntityCoords(GetPlayerPed(-1))
			
			observ.Type = types[typeIndex]
			observ.Coords = coords
			observ.Player = GetPlayerPed(-1)
			observ.ID = GetPlayerServerId(PlayerId())
			observ.Range = range[1]
			observ.Obs = KeyboardInput("Enter observations message", "", 255)
			addFixedObs(observ)
		end
	end


	local coord = GetEntityCoords(attachto)
	local rotation = GetEntityRotation(attachto)
	local _,z = GetGroundZFor_3dCoord(coord.x, coord.y, coord.z, 0)
	DrawMarker(43, coord.x, coord.y, z + 0.25, 0.0, 0.0, 0.0, rotation.x, rotation.y, rotation.z, range[1] + 0.0, range[1] + 0.0, 1.0, 200, 25, 25, 200, false, false, 0, false, nil, nil, false) -- Range 2
	
	
end

--[[ OTHER FUNCTIONS ]]--

function getVehInFront()

	local pos = GetEntityCoords(PlayerPedId())
    local targetPos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, -1.0)
    local rayCast = StartShapeTestCapsule(pos.x, pos.y, pos.z, targetPos.x, targetPos.y, targetPos.z, 2, 10, PlayerPedId(), 7)
    local _,hit,_,_,veh = GetShapeTestResult(rayCast)
    if hit and DoesEntityExist(veh) and IsEntityAVehicle(veh) then
		return veh
	end

end

function getObjInFront()

	local pos = GetEntityCoords(PlayerPedId())
    local targetPos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 4.0, -1.0)
    local rayCast = StartShapeTestCapsule(pos.x, pos.y, pos.z, targetPos.x, targetPos.y, targetPos.z, 2, 16, PlayerPedId(), 7)
    local _,hit,_,_,obj = GetShapeTestResult(rayCast)
    if hit and DoesEntityExist(obj) and IsEntityAnObject(obj) then
		return obj
	end

end

function addFixedObs(data)
	if data.Obs ~= '' and data.Obs ~= nil then
		TriggerServerEvent("AddObs", data)
	end
end

function delFixedObs(data, offset)
	if data ~= nil then
		TriggerServerEvent("DelObs", data, offset)
	end
end

--[[ EVENTS ]]--

RegisterNetEvent('UpdateObs')
AddEventHandler('UpdateObs', function(newdata)
	for _,v in pairs(newdata) do
		v.First = true
	end
	observations = newdata
end)

--[[ LOOP ]]--

Citizen.CreateThread(function()
	while true do
		Wait(0)
		
		for _,v in pairs(observations) do
			local plyCoords = GetEntityCoords(GetPlayerPed(-1))
			local coords = nil
			if v.Type ~= 'Location' then
				coords = GetEntityCoords(NetToObj(v.Entity))
			else
				coords = v.Coords
			end

			local distance = GetDistanceBetweenCoords(coords.x, coords.y, coords.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
			
			if distance <= tonumber(v.Range) then
				if v.First == true then
					AdvancedNotification('CHAR_FLOYD', 'uber', 7, "~g~RPEnhanced", "~r~Observations", v.Obs)
					v.First = false
				end
			else
				if v.First == false then
					v.First = true
				end
			end
			
		
		end
		
	end
end)

function AdvancedNotification(icon1, icon2, type, sender, title, text) -- Function to display a notification with image.
    Citizen.CreateThread(function()
        Wait(1)
        SetNotificationTextEntry("STRING")
        AddTextComponentString(text)
        SetNotificationMessage(icon1, icon2, true, type, sender, title, text)
        DrawNotification(false, true)
        Citizen.Wait(60000)
    end)
end