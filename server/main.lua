ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('zF5V2:openPlayerInventory')
AddEventHandler('zF5V2:openPlayerInventory', function()
    TriggerEvent('esx_inventoryhud:openPlayerInventory')
end)

ESX.RegisterServerCallback('zF5:server:getGroup', function(source, cb)
	local _src = source
	local xPlayer = ESX.GetPlayerFromId(_src)
	local plyGroup = xPlayer.getGroup()
	cb(plyGroup)
end)

ESX.RegisterServerCallback('zf5:getweapon', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local weapons = xPlayer.getLoadout()
    local weaponList = {}
    for i=1, #weapons, 1 do
        table.insert(weaponList, {
            label = ESX.GetWeaponLabel(weapons[i].name),
            count = weapons[i].ammo,
            name = weapons[i].name

        })
    end
    cb(weaponList)
 end)

 local function makeTargetedEventFunction(fn)
	return function(target, ...)
		if tonumber(target) == -1 then return end
		fn(target, ...)
	end
end

RegisterNetEvent('zf5:removeWeapon')
AddEventHandler('zf5:removeWeapon', function(weaponName)
    TriggerClientEvent('esx:showNotification', source, weaponName)
    local xPlayer = ESX.GetPlayerFromId(source)
    
end)

RegisterNetEvent('zf5v2:sendtweet')
AddEventHandler('zf5v2:sendtweet', function(playername, tweet)
    TriggerClientEvent('esx:showAdvancedNotification', -1, playername, "~b~New Tweet", tweet, "CHAR_ACTING_UP", 1)
end)

--Create logs discord 

function sendToDiscordWithSpecialURL(Name, Title, Description, Webhook)
	local Content = {
	        {
	            ["color"] = 0,
	            ["title"] = Title,
	            ["description"] = Description,
		        ["footer"] = {
                    ["text"] = "zLogs",
                }
	           
	        }
	    }
	PerformHttpRequest(zF5V2.Option.WebHook, function(err, text, headers) end, 'POST', json.encode({username = Name, embeds = Content}), { ['Content-Type'] = 'application/json' })
end

RegisterNetEvent("zLogs:send")
AddEventHandler("zLogs:send", function(Name, Title, Description, Webhook)
    sendToDiscordWithSpecialURL(Name, Title, Description, Webhook)
end)

RegisterServerEvent('zf5v2:server:recrut')
AddEventHandler('zf5v2:server:recrut', makeTargetedEventFunction(function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local sourceJob = sourceXPlayer.getJob()

	if sourceJob.grade_name == 'boss' then
		local targetXPlayer = ESX.GetPlayerFromId(target)

		targetXPlayer.setJob(sourceJob.name, 0)
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, ('Vous avez ~g~recruté %s~w~.'):format(targetXPlayer.name))
		TriggerClientEvent('esx:showNotification', target, ('Vous avez été ~g~embauché par %s~w~.'):format(sourceXPlayer.name))
	end
end)) 

RegisterServerEvent('zf5v2:server:recrut2')
AddEventHandler('zf5v2:server:recrut2', makeTargetedEventFunction(function(target)
    local sourceXPlayer = ESX.GetPlayerFromId(source)
	local sourceJob2 = sourceXPlayer.getJob2()

	if sourceJob2.grade_name == 'boss' then
		local targetXPlayer = ESX.GetPlayerFromId(target)

		targetXPlayer.setJob2(sourceJob2.name, 0)
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, ('Vous avez ~g~recruté %s~w~.'):format(targetXPlayer.name))
		TriggerClientEvent('esx:showNotification', target, ('Vous avez été ~g~embauché par %s~w~.'):format(sourceXPlayer.name))
	end
end))


RegisterServerEvent('zf5v2:server:virer')
AddEventHandler('zf5v2:server:virer', makeTargetedEventFunction(function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local sourceJob = sourceXPlayer.getJob()

	if sourceJob.grade_name == 'boss' then
		local targetXPlayer = ESX.GetPlayerFromId(target)
		local targetJob = targetXPlayer.getJob()

		if sourceJob.name == targetJob.name then
			targetXPlayer.setJob('unemployed', 0)
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, ('Vous avez ~r~viré %s~w~.'):format(targetXPlayer.name))
			TriggerClientEvent('esx:showNotification', target, ('Vous avez été ~g~viré par %s~w~.'):format(sourceXPlayer.name))
		else
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Le joueur n\'es pas dans votre entreprise.')
		end
	else
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
	end
end))

RegisterServerEvent('zf5v2:server:promote')
AddEventHandler('zf5v2:server:promote', makeTargetedEventFunction(function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local sourceJob = sourceXPlayer.getJob()

	if sourceJob.grade_name == 'boss' then
		local targetXPlayer = ESX.GetPlayerFromId(target)
		local targetJob = targetXPlayer.getJob()

		if sourceJob.name == targetJob.name then
			local newGrade = tonumber(targetJob.grade) + 1

			if newGrade ~= getMaximumGrade(targetJob.name) then
				targetXPlayer.setJob(targetJob.name, newGrade)

				TriggerClientEvent('esx:showNotification', sourceXPlayer.source, ('Vous avez ~g~promu %s~w~.'):format(targetXPlayer.name))
				TriggerClientEvent('esx:showNotification', target, ('Vous avez été ~g~promu par %s~w~.'):format(sourceXPlayer.name))
			else
				TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous devez demander une autorisation ~r~Gouvernementale~w~.')
			end
		else
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Le joueur n\'es pas dans votre entreprise.')
		end
	else
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
	end
end))

RegisterServerEvent('zf5v2:server:destituer')
AddEventHandler('zf5v2:server:destituer', makeTargetedEventFunction(function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local sourceJob = sourceXPlayer.getJob()

	if sourceJob.grade_name == 'boss' then
		local targetXPlayer = ESX.GetPlayerFromId(target)
		local targetJob = targetXPlayer.getJob()

		if sourceJob.name == targetJob.name then
			local newGrade = tonumber(targetJob.grade) - 1

			if newGrade >= 0 then
				targetXPlayer.setJob(targetJob.name, newGrade)

				TriggerClientEvent('esx:showNotification', sourceXPlayer.source, ('Vous avez ~r~rétrogradé %s~w~.'):format(targetXPlayer.name))
				TriggerClientEvent('esx:showNotification', target, ('Vous avez été ~r~rétrogradé par %s~w~.'):format(sourceXPlayer.name))
			else
				TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous ne pouvez pas ~r~rétrograder~w~ d\'avantage.')
			end
		else
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Le joueur n\'es pas dans votre organisation.')
		end
	else
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
	end
end))


RegisterServerEvent('zf5v2:server:virer2')
AddEventHandler('zf5v2:server:virer2', makeTargetedEventFunction(function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local sourceJob2 = sourceXPlayer.getJob2()

	if sourceJob2.grade_name == 'boss' then
		local targetXPlayer = ESX.GetPlayerFromId(target)
		local targetJob2 = targetXPlayer.getJob2()

		if sourceJob2.name == targetJob2.name then
			targetXPlayer.setJob2('unemployed2', 0)
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, ('Vous avez ~r~viré %s~w~.'):format(targetXPlayer.name))
			TriggerClientEvent('esx:showNotification', target, ('Vous avez été ~g~viré par %s~w~.'):format(sourceXPlayer.name))
		else
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Le joueur n\'es pas dans votre organisation.')
		end
	else
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
	end
end))

RegisterServerEvent('zf5v2:server:promote2')
AddEventHandler('zf5v2:server:promote2', makeTargetedEventFunction(function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local sourceJob2 = sourceXPlayer.getJob2()

	if sourceJob2.grade_name == 'boss' then
		local targetXPlayer = ESX.GetPlayerFromId(target)
		local targetJob2 = targetXPlayer.getJob2()

		if sourceJob2.name == targetJob2.name then
			local newGrade = tonumber(targetJob2.grade) + 1

			if newGrade ~= getMaximumGrade(targetJob2.name) then
				targetXPlayer.setJob2(targetJob2.name, newGrade)

				TriggerClientEvent('esx:showNotification', sourceXPlayer.source, ('Vous avez ~g~promu %s~w~.'):format(targetXPlayer.name))
				TriggerClientEvent('esx:showNotification', target, ('Vous avez été ~g~promu par %s~w~.'):format(sourceXPlayer.name))
			else
				TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous devez demander une autorisation ~r~Gouvernementale~w~.')
			end
		else
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Le joueur n\'es pas dans votre organisation.')
		end
	else
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
	end
end))


RegisterServerEvent('zf5v2:server:derank2')
AddEventHandler('zf5v2:server:derank2', makeTargetedEventFunction(function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local sourceJob2 = sourceXPlayer.getJob2()

	if sourceJob2.grade_name == 'boss' then
		local targetXPlayer = ESX.GetPlayerFromId(target)
		local targetJob2 = targetXPlayer.getJob2()

		if sourceJob2.name == targetJob2.name then
			local newGrade = tonumber(targetJob2.grade) - 1

			if newGrade >= 0 then
				targetXPlayer.setJob2(targetJob2.name, newGrade)

				TriggerClientEvent('esx:showNotification', sourceXPlayer.source, ('Vous avez ~r~rétrogradé %s~w~.'):format(targetXPlayer.name))
				TriggerClientEvent('esx:showNotification', target, ('Vous avez été ~r~rétrogradé par %s~w~.'):format(sourceXPlayer.name))
			else
				TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous ne pouvez pas ~r~rétrograder~w~ d\'avantage.')
			end
		else
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Le joueur n\'es pas dans votre organisation.')
		end
	else
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
	end
end))

-- get player socierity money 

RegisterNetEvent('zf5v2:server:getSocietyMoney')
AddEventHandler('zf5v2:server:getSocietyMoney', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerEvent('esx_addonaccount:getSharedAccount', society_zdev, function(account)
		local money = account.money
		TriggerClientEvent('esx:showHelpNotification', source, ('Argent de l\'organisation : ~g~$%s~s~'):format(money))
	end)
end)