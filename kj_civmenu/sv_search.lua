-- Tables --
local vitems = {}
local pitems = {}

-- Event Handling --

RegisterNetEvent('AddVItem')
AddEventHandler('AddVItem', function(vehicle, item)
    vitems[item] = vehicle
	
end)

RegisterNetEvent('DelVItem')
AddEventHandler('DelVItem', function(vehicle, item)
    vitems[item] = nil
end)

RegisterNetEvent('AddPItem')
AddEventHandler('AddPItem', function(item)
    pitems[item] = source
end)

RegisterNetEvent('DelPItem')
AddEventHandler('DelPItem', function(item)
    pitems[item] = nil
end)

RegisterNetEvent('VehicleSearch')
AddEventHandler('VehicleSearch', function(vehicle)
    targetplayer = source
	if next(vitems) == nil then
		TriggerClientEvent("ReturnSearch", targetplayer, "~r~Nothing")
	else
		for k,v in pairs(vitems) do
			if v == vehicle then
				TriggerClientEvent("ReturnSearch", targetplayer, k)
			end
		end
	end
end)

RegisterNetEvent('PersonSearch')
AddEventHandler('PersonSearch', function(player)
	targetplayer = source
	if next(pitems) == nil then
		TriggerClientEvent("ReturnSearch", targetplayer, "~r~Nothing")
	else
		for k,v in pairs(pitems) do
			if v == player then
				TriggerClientEvent("ReturnSearch", targetplayer, k)
			end
		end
	end
end)