RegisterCommand('mapper', function(source, args)
	if source ~= 0 then
		TriggerClientEvent('es_mapper:toggle', source)
	end
end)