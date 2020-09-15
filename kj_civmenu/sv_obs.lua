local observations = {}

RegisterServerEvent('AddObs')
AddEventHandler('AddObs', function(data)
	table.insert(observations, data)
	TriggerClientEvent('UpdateObs', -1, observations)
end)

RegisterServerEvent('DelObs')
AddEventHandler('DelObs', function(data, offset)
	if data['ID'] == source then
		table.remove(observations, offset)
		TriggerClientEvent('UpdateObs', -1, observations)
	end
end)