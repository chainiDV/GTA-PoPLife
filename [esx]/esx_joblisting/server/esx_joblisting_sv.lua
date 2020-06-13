ESX = nil
myJobs = {}
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_joblisting:getJobsList', function(source, cb)
	MySQL.Async.fetchAll(
		'SELECT * FROM jobs',
		{},
		function(result)
			local data = {}
			for i,v in pairs(result) do
				if v.name == "police" or v.name == "ambulance" or v.name == "polioff" or v.name =="emsoff" then

				else
					if v.name == "pizza" or v.name == "minero" or v.name == "trash" or v.name =="farmer" or v.name == "unemployed" then
					table.insert(data, {
						value   = v.name,
						label   = v.label
					})
					else
						if myJobs[source] == nil then

						else
							for a,b in pairs(myJobs[source]) do
								if  b == v.name then
									table.insert(data, {
										value   = v.name,
										label   = v.label
									})
								end
							end
						end
					end
				end
			end
			cb(data)
		end
	)
end)

RegisterServerEvent('esx_joblisting:setJob')
AddEventHandler('esx_joblisting:setJob', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob(job, 0)
end)

RegisterServerEvent('pop_university:setJobs')
AddEventHandler('pop_university:setJobs', function(skills)
	myJobs[source] = skills
end)

--[[

]]