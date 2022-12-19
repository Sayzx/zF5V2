ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

CreateThread(function()
    while true do 
        Wait(1)
        
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsUsing(ped)

        if StateEngine then
            DisplayStateEngine = "~g~Allumé"
            SetVehicleEngineOn(vehicle, true, false, true)
        else
            DisplayStateEngine = "~r~Éteint"
            SetVehicleEngineOn(vehicle, false, false, true)
        end
    end
end)
function GetInfPlayer()
    CreateThread(function()
        Wait(250)
        ESX.PlayerData = ESX.GetPlayerData()
    end)
end

function setUniform(value, plyPed)
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:getSkin', function(skina)
			if value == 'torso' then
                TaskStartScenarioInPlace(plyPed, "WORLD_HUMAN_COP_IDLES", 0, true)
				Citizen.Wait(550)
				ClearPedTasks(plyPed)

				if skin.torso_1 ~= skina.torso_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['torso_1'] = skin.torso_1, ['torso_2'] = skin.torso_2, ['tshirt_1'] = skin.tshirt_1, ['tshirt_2'] = skin.tshirt_2, ['arms'] = skin.arms})
				else
					TriggerEvent('skinchanger:loadClothes', skina, {['torso_1'] = 15, ['torso_2'] = 0, ['tshirt_1'] = 15, ['tshirt_2'] = 0, ['arms'] = 15})
				end
			elseif value == 'pants' then
				if skin.pants_1 ~= skina.pants_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['pants_1'] = skin.pants_1, ['pants_2'] = skin.pants_2})
				else
					if skin.sex == 0 then
						TriggerEvent('skinchanger:loadClothes', skina, {['pants_1'] = 61, ['pants_2'] = 1})
					else
						TriggerEvent('skinchanger:loadClothes', skina, {['pants_1'] = 15, ['pants_2'] = 0})
					end
				end
			elseif value == 'shoes' then
				if skin.shoes_1 ~= skina.shoes_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['shoes_1'] = skin.shoes_1, ['shoes_2'] = skin.shoes_2})
				else
					if skin.sex == 0 then
						TriggerEvent('skinchanger:loadClothes', skina, {['shoes_1'] = 34, ['shoes_2'] = 0})
					else
						TriggerEvent('skinchanger:loadClothes', skina, {['shoes_1'] = 35, ['shoes_2'] = 0})
					end
				end
			elseif value == 'bag' then
				if skin.bags_1 ~= skina.bags_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['bags_1'] = skin.bags_1, ['bags_2'] = skin.bags_2})
				else
					TriggerEvent('skinchanger:loadClothes', skina, {['bags_1'] = 0, ['bags_2'] = 0})
				end
			elseif value == 'bproof' then
				
                TaskStartScenarioInPlace(plyPed, "try_tie_neutral_a", 0, true)
				Citizen.Wait(1000)
				ClearPedTasks(plyPed)

				if skin.bproof_1 ~= skina.bproof_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['bproof_1'] = skin.bproof_1, ['bproof_2'] = skin.bproof_2})
				else
					TriggerEvent('skinchanger:loadClothes', skina, {['bproof_1'] = 0, ['bproof_2'] = 0})
				end

            elseif value == 'mask' then
                if skin.mask_1 ~= skina.mask_1 then
                    TriggerEvent('skinchanger:loadClothes', skina, {['mask_1'] = skin.mask_1, ['mask_2'] = skin.mask_2})
                else
                    TriggerEvent('skinchanger:loadClothes', skina, {['mask_1'] = 0, ['mask_2'] = 0})
                end
            
            elseif value == 'helmet' then
                if skin.helmet_1 ~= skina.helmet_1 then
                    TriggerEvent('skinchanger:loadClothes', skina, {['helmet_1'] = skin.helmet_1, ['helmet_2'] = skin.helmet_2})
                else
                    TriggerEvent('skinchanger:loadClothes', skina, {['helmet_1'] = -1, ['helmet_2'] = 0})
                end

            elseif value == 'glasses' then
                if skin.glasses_1 ~= skina.glasses_1 then
                    TriggerEvent('skinchanger:loadClothes', skina, {['glasses_1'] = skin.glasses_1, ['glasses_2'] = skin.glasses_2})
                else
                    TriggerEvent('skinchanger:loadClothes', skina, {['glasses_1'] = -1, ['glasses_2'] = 0})
                end

            elseif value == 'vest' then
                if skin.vest_1 ~= skina.vest_1 then
                    TriggerEvent('skinchanger:loadClothes', skina, {['vest_1'] = skin.vest_1, ['vest_2'] = skin.vest_2})
                else
                    TriggerEvent('skinchanger:loadClothes', skina, {['vest_1'] = 0, ['vest_2'] = 0})
                end
			end

  
		end)
	end)
end

function GetGroup()
    ESX.TriggerServerCallback("zF5:server:getGroup", function(group) 
        PlayerGroup = group
    end)
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
	AddTextEntry('FMMC_KEY_TIP1', TextEntry)
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght) 
	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do Wait(0) end
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Wait(500) 
		return result
	else
		Wait(500) 
		return nil 
	end
end

function zCheck(number)
    number = tonumber(number)
  
    if type(number) == 'number' then
      number = ESX.Math.Round(number)
  
      if number > 0 then
        return true, number
      end
    end
  
    return false, number
  end


function Invinsible()
    zdev = not zdev
    local ped = GetPlayerPed(-1)
    if zdev then -- activé
      SetEntityInvincible(ped, true)
      SetEntityVisible(ped, false, false)
      invisible = true
      Visual.Subtitle("~r~↓ ~y~zDéveloppement ~r~↓~n~ ~b~Grade : ~g~ "..zName.."~n~ ~r~Invisible", timems)
  
    else -- désactivé
      SetEntityInvincible(ped, false)
      SetEntityVisible(ped, true, false)
      invisible = false
      Visual.Subtitle("", 0)
    end
  end

  

-- NoClip 


-- Constants --
MOVE_UP_KEY = 111
MOVE_DOWN_KEY = 110
CHANGE_SPEED_KEY = 21
MOVE_LEFT_RIGHT = 30
MOVE_UP_DOWN = 31
NOCLIP_TOGGLE_KEY = 289
NO_CLIP_NORMAL_SPEED = 0.5
NO_CLIP_FAST_SPEED = 1.0
ENABLE_TOGGLE_NO_CLIP = false
ENABLE_NO_CLIP_SOUND = true

local eps = 0.01


-- Variables --
local isNoClipping = false
local playerPed = PlayerPedId()
local playerId = PlayerId()
local speed = NO_CLIP_NORMAL_SPEED
local input = vector3(0, 0, 0)
local previousVelocity = vector3(0, 0, 0)
local breakSpeed = 10.0;
local offset = vector3(0, 0, 1);

local noClippingEntity = playerPed;

function ToggleNoClipMode()
    return SetNoClip(not isNoClipping)
end

function IsControlAlwaysPressed(inputGroup, control) return IsControlPressed(inputGroup, control) or IsDisabledControlPressed(inputGroup, control) end

function IsControlAlwaysJustPressed(inputGroup, control) return IsControlJustPressed(inputGroup, control) or IsDisabledControlJustPressed(inputGroup, control) end

function Lerp (a, b, t) return a + (b - a) * t end

function IsPedDrivingVehicle(ped, veh)
    return ped == GetPedInVehicleSeat(veh, -1);
end

function SetInvincible(val, id)
    SetEntityInvincible(id, val)
    return SetPlayerInvincible(id, val)
end

function SetNoClip(val)

    if (isNoClipping ~= val) then

        noClippingEntity = playerPed;

        if IsPedInAnyVehicle(playerPed, false) then
            local veh = GetVehiclePedIsIn(playerPed, false);
            if IsPedDrivingVehicle(playerPed, veh) then
                noClippingEntity = veh;
            end
        end

        local isVeh = IsEntityAVehicle(noClippingEntity);

        isNoClipping = val;

        if ENABLE_NO_CLIP_SOUND then

            if isNoClipping then
                PlaySoundFromEntity(-1, "SELECT", playerPed, "HUD_LIQUOR_STORE_SOUNDSET", 0, 0)
            else
                PlaySoundFromEntity(-1, "CANCEL", playerPed, "HUD_LIQUOR_STORE_SOUNDSET", 0, 0)
            end

        end

        TriggerEvent('msgprinter:addMessage', ((isNoClipping and ":airplane: No-clip enabled") or ":rock: No-clip disabled"), GetCurrentResourceName());
        SetUserRadioControlEnabled(not isNoClipping);

        if (isNoClipping) then

            TriggerEvent('instructor:add-instruction', { MOVE_LEFT_RIGHT, MOVE_UP_DOWN }, "move", RESSOURCE_NAME);
            TriggerEvent('instructor:add-instruction', { MOVE_UP_KEY, MOVE_DOWN_KEY }, "move up/down", RESSOURCE_NAME);
            TriggerEvent('instructor:add-instruction', { 1, 2 }, "Turn", RESSOURCE_NAME);
            TriggerEvent('instructor:add-instruction', CHANGE_SPEED_KEY, "(hold) fast mode", RESSOURCE_NAME);
            TriggerEvent('instructor:add-instruction', NOCLIP_TOGGLE_KEY, "Toggle No-clip", RESSOURCE_NAME);
            SetEntityAlpha(noClippingEntity, 51, 0)

            -- Start a No CLip thread
            Citizen.CreateThread(function()

                local clipped = noClippingEntity
                local pPed = playerPed;
                local isClippedVeh = isVeh;
                -- We start with no-clip mode because of the above if --
                SetInvincible(true, clipped);

                if not isClippedVeh then
                    ClearPedTasksImmediately(pPed)
                end

                while isNoClipping do
                    Citizen.Wait(0);

                    FreezeEntityPosition(clipped, true);
                    SetEntityCollision(clipped, false, false);

                    SetEntityVisible(clipped, false, false);
                    SetLocalPlayerVisibleLocally(true);
                    SetEntityAlpha(clipped, 51, false)

                    SetEveryoneIgnorePlayer(pPed, true);
                    SetPoliceIgnorePlayer(pPed, true);

                    -- `(a and b) or c`, is basically `a ? b : c` --
                    input = vector3(GetControlNormal(0, MOVE_LEFT_RIGHT), GetControlNormal(0, MOVE_UP_DOWN), (IsControlAlwaysPressed(1, MOVE_UP_KEY) and 1) or ((IsControlAlwaysPressed(1, MOVE_DOWN_KEY) and -1) or 0))
                    speed = ((IsControlAlwaysPressed(1, CHANGE_SPEED_KEY) and NO_CLIP_FAST_SPEED) or NO_CLIP_NORMAL_SPEED) * ((isClippedVeh and 2.75) or 1)

                    MoveInNoClip();

                end

                Citizen.Wait(0);

                FreezeEntityPosition(clipped, false);
                SetEntityCollision(clipped, true, true);

                SetEntityVisible(clipped, true, false);
                SetLocalPlayerVisibleLocally(true);
                ResetEntityAlpha(clipped);

                SetEveryoneIgnorePlayer(pPed, false);
                SetPoliceIgnorePlayer(pPed, false);
                ResetEntityAlpha(clipped);

                Citizen.Wait(500);

                -- We're done with the while so we aren't in no-clip mode anymore --
                -- Wait until the player starts falling or is completely stopped --
                if isClippedVeh then

                    while (not IsVehicleOnAllWheels(clipped)) and not isNoClipping do
                        Citizen.Wait(0);
                    end

                    while not isNoClipping do

                        Citizen.Wait(0);

                        if IsVehicleOnAllWheels(clipped) then

                            -- We hit land. We can safely remove the invincibility --
                            return SetInvincible(false, clipped);

                        end

                    end

                else

                    if (IsPedFalling(clipped) and math.abs(1 - GetEntityHeightAboveGround(clipped)) > eps) then
                        while (IsPedStopped(clipped) or not IsPedFalling(clipped)) and not isNoClipping do
                            Citizen.Wait(0);
                        end
                    end

                    while not isNoClipping do

                        Citizen.Wait(0);

                        if (not IsPedFalling(clipped)) and (not IsPedRagdoll(clipped)) then

                            -- We hit land. We can safely remove the invincibility --
                            return SetInvincible(false, clipped);

                        end

                    end

                end

            end)

        else
            ResetEntityAlpha(noClippingEntity)
            TriggerEvent('instructor:flush', RESSOURCE_NAME);
        end

    end

end

function MoveInNoClip()

    SetEntityRotation(noClippingEntity, GetGameplayCamRot(0), 0, false)
    local forward, right, up, c = GetEntityMatrix(noClippingEntity);
    previousVelocity = Lerp(previousVelocity, (((right * input.x * speed) + (up * -input.z * speed) + (forward * -input.y * speed))), Timestep() * breakSpeed);
    c = c + previousVelocity
    SetEntityCoords(noClippingEntity, c - offset, true, true, true, false)

end

function MoveCarInNoClip()

    SetEntityRotation(noClippingEntity, GetGameplayCamRot(0), 0, false)
    local forward, right, up, c = GetEntityMatrix(noClippingEntity);
    previousVelocity = Lerp(previousVelocity, (((right * input.x * speed) + (up * input.z * speed) + (forward * -input.y * speed))), Timestep() * breakSpeed);
    c = c + previousVelocity
    SetEntityCoords(noClippingEntity, (c - offset) + (vec(0, 0, .3)), true, true, true, false)

end

AddEventHandler('playerSpawned', function()

    playerPed = PlayerPedId()
    playerId = PlayerId()

end)

AddEventHandler('RCC:newPed', function()

    playerPed = PlayerPedId()
    playerId = PlayerId()

end)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == RESSOURCE_NAME then
        SetNoClip(false);
        FreezeEntityPosition(noClippingEntity, false);
        SetEntityCollision(noClippingEntity, true, true);

        SetEntityVisible(noClippingEntity, true, false);
        SetLocalPlayerVisibleLocally(true);
        ResetEntityAlpha(noClippingEntity);

        SetEveryoneIgnorePlayer(playerPed, false);
        SetPoliceIgnorePlayer(playerPed, false);
        ResetEntityAlpha(noClippingEntity);
        SetInvincible(false, noClippingEntity);
    end
end)

Citizen.CreateThread(function()

   

        RegisterCommand("noClip", function(source, args, rawCommand)
            SetNoClip(tonumber(args[1]) == 1)
        end)

        RegisterCommand("+noClip", function(source, rawCommand)
            SetNoClip(true)
        end)
        RegisterCommand("-noClip", function(source, rawCommand)
            SetNoClip(false)
        end)

        RegisterCommand("toggleNoClip", function(source, rawCommand)
            ToggleNoClipMode()
        end)

        if PlayerGroup == "superadmin" or PlayerGroup == "admin" then
            RegisterKeyMapping("toggleNoClip", "No Clip", "keyboard", zF5V2.Options.NoClipKey);
            
        end
        
    

end)

