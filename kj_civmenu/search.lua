-- Client-Side Tables --

local cvitems = {"Select One..."}
local cpitems = {"Select One..."}


local currentItemIndex = 1
local selectedItemIndex = 1

function searchciv()

	if WarMenu.Button('Search Vehicle') then
		local playerPos = GetEntityCoords( GetPlayerPed( -1 ), 1 )
        local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( GetPlayerPed( -1 ), 0.0, 5.0, 0.0 )
        local vehicle = GetVehicleInDirection( playerPos, inFrontOfPlayer )
		local netID = NetworkGetNetworkIdFromEntity(vehicle)
		
		if vehicle ~= 0 then
			TriggerServerEvent('VehicleSearch', netID)
		else
			ShowNotification("~r~No vehicle detected.")
		end
		
	elseif WarMenu.Button('Search Person') then
		
		local player,playerdist = GetClosestPlayer()

		if playerdist ~= -1 and playerdist < 2 then
			TriggerServerEvent('PersonSearch', player)
		else
			ShowNotification("~r~Nobody detected")
		end
		
	elseif
		
		WarMenu.Button('Add Vehicle Item') then
		if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
			local item = KeyboardInput("Vehicle Item", "", 25)
			local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)

			AddvItem(NetworkGetNetworkIdFromEntity(vehicle), item)
		else
			ShowNotification("~r~You must be in a vehicle!")
		end

	elseif WarMenu.Button('Add Person Item') then
		
		local item = KeyboardInput("Person Item", "", 25)
        AddpItem(item)
		
	elseif WarMenu.MenuButton('Veh Items', 'searchitemsv') then
	elseif WarMenu.MenuButton('Pers. Items', 'searchitemsp') then
	end

end

function itemsv()
	
	for k,v in pairs(cvitems) do
		local numberplate = GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false))
		local netID = NetworkGetNetworkIdFromEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false))
		
		if k == netID then
			if WarMenu.Button(v) then
				DelvItem(netID, v)
			end
		end
	end
	
end

function itemsp()
	
	for k,v in pairs(cpitems) do
		
		if v ~= 'Select One...' then
			if WarMenu.Button(v) then
				DelPItem(v)
			end
		end
	end
	
end


-- Functions --


function AddpItem(item)
	
    if not item then return end
    ShowNotification("~g~Added ~o~" .. item .. "~g~ to your person.")
	
    table.insert(cpitems, item)
	--print(GetPlayerServerId(PlayerId())) -- Get Player's Server ID
	
	TriggerServerEvent('AddPItem', item)
	
end

function AddvItem(vehicle, item)

    if not item then return end
    ShowNotification("~g~Added ~o~" .. item .. "~g~ to your vehicle.")

	cvitems[vehicle] = item
	
	TriggerServerEvent('AddVItem', vehicle, item)

end

function DelvItem(vehicle, item)

    if not item then return end
    ShowNotification("~g~Removed ~o~" .. item .. "~g~ from your vehicle.")

	for k,v in pairs(cvitems) do
		if v == item and k == vehicle then
			cvitems[vehicle] = nil
		end
	end
	
	TriggerServerEvent('DelVItem', vehicle, item)

end

function DelPItem(item)

    if not item then return end
    ShowNotification("~g~Removed ~o~" .. item .. "~g~ from your person.")

	for k,v in pairs(cpitems) do
		if v == item then
			cpitems[k] = nil
		end
	end
	
	TriggerServerEvent('DelPItem', item)

end

-- Client Events --

RegisterNetEvent("ReturnSearch")
AddEventHandler("ReturnSearch", function(items)
    ShowNotification("~g~You found: ~o~" .. items)
end)