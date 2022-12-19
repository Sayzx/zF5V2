ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
        
        if StateEngine then
            DisplayStateEngine = "Allumé"
            SetVehicleEngineOn(vehicle, true, false, true)
        else
            DisplayStateEngine = "Éteint"
            SetVehicleEngineOn(vehicle, false, false, true)
        end
    end
end)


local name = GetPlayerName(PlayerId())
local Index = {
    List = 1,
    List1 = 1,
    List2 = 1,
    List3 = 1,
    List4 = 1,
    List5 = 1,
    List6 = 1,
    List7 = 1,
    List8 = 1,
}

StateEngine = true
DisplayStateEngine = "Allumé"


f5open = false
local menuf5 = RageUI.CreateMenu(zF5V2.Local.FR.Menu.Title, zF5V2.Local.FR.Menu.SubTitle:format(GetPlayerServerId(PlayerId())), 0,0, zF5V2.Option.zbanner, zF5V2.Option.zbanner)
local inventory = RageUI.CreateSubMenu(menuf5, zF5V2.Local.FR.Menu.InventoryTitle, zF5V2.Local.FR.Menu.SubTitle:format(GetPlayerServerId(PlayerId())), 0,0, zF5V2.Option.zbanner, zF5V2.Option.zbanner)
local wallet = RageUI.CreateSubMenu(menuf5, zF5V2.Local.FR.Menu.WalletTitle, zF5V2.Local.FR.Menu.SubTitle:format(GetPlayerServerId(PlayerId())), 0,0, zF5V2.Option.zbanner, zF5V2.Option.zbanner)
local weapon = RageUI.CreateSubMenu(menuf5, zF5V2.Local.FR.Menu.GetWeaponTitle, zF5V2.Local.FR.Menu.SubTitle:format(GetPlayerServerId(PlayerId())), 0,0, zF5V2.Option.zbanner, zF5V2.Option.zbanner)
local garmes = RageUI.CreateSubMenu(weapon, zF5V2.Local.FR.Menu.GetWeaponTitle, zF5V2.Local.FR.Menu.SubTitle:format(GetPlayerServerId(PlayerId())), 0,0, zF5V2.Option.zbanner, zF5V2.Option.zbanner)
local clothes = RageUI.CreateSubMenu(menuf5, zF5V2.Local.FR.Menu.ClothesTitle, zF5V2.Local.FR.Menu.SubTitle:format(GetPlayerServerId(PlayerId())), 0,0, zF5V2.Option.zbanner, zF5V2.Option.zbanner)
local cargestion = RageUI.CreateSubMenu(menuf5, zF5V2.Local.FR.Menu.cargestionTitle, zF5V2.Local.FR.Menu.SubTitle:format(GetPlayerServerId(PlayerId())), 0,0, zF5V2.Option.zbanner, zF5V2.Option.zbanner)
local divers = RageUI.CreateSubMenu(menuf5, zF5V2.Local.FR.Menu.DiversTitle, zF5V2.Local.FR.Menu.SubTitle:format(GetPlayerServerId(PlayerId())), 0,0, zF5V2.Option.zbanner, zF5V2.Option.zbanner)
local admin = RageUI.CreateSubMenu(menuf5, zF5V2.Local.FR.Menu.AdminTitle, zF5V2.Local.FR.Menu.SubTitle:format(GetPlayerServerId(PlayerId())), 0,0, zF5V2.Option.zbanner, zF5V2.Option.zbanner)
local walletmoney = RageUI.CreateSubMenu(wallet, zF5V2.Local.FR.Menu.WalletCashTitle, zF5V2.Local.FR.Menu.SubTitle:format(GetPlayerServerId(PlayerId())), 0,0, zF5V2.Option.zbanner, zF5V2.Option.zbanner)
local walletdirty = RageUI.CreateSubMenu(wallet, zF5V2.Local.FR.Menu.WalletDirtyTitle, zF5V2.Local.FR.Menu.SubTitle:format(GetPlayerServerId(PlayerId())), 0,0, zF5V2.Option.zbanner, zF5V2.Option.zbanner)
local walletbank = RageUI.CreateSubMenu(wallet, zF5V2.Local.FR.Menu.WalletBankTitle, zF5V2.Local.FR.Menu.SubTitle:format(GetPlayerServerId(PlayerId())), 0,0, zF5V2.Option.zbanner, zF5V2.Option.zbanner)
local gestione = RageUI.CreateSubMenu(menuf5, zF5V2.Local.FR.Menu.gestione, zF5V2.Local.FR.Menu.SubTitle:format(GetPlayerServerId(PlayerId())), 0,0, zF5V2.Option.zbanner, zF5V2.Option.zbanner)
local gestiong = RageUI.CreateSubMenu(menuf5, zF5V2.Local.FR.Menu.gestiong, zF5V2.Local.FR.Menu.SubTitle:format(GetPlayerServerId(PlayerId())), 0,0, zF5V2.Option.zbanner, zF5V2.Option.zbanner)
menuf5.closed = function()
    f5open = false
end
OpenMenu = function()
    if f5open then
        f5open = false
        RageUI.Visible(menuf5, false)
    else
        
        f5open = true
        GetGroup()
        GetInfPlayer()
        RageUI.Visible(menuf5, true)
        Citizen.CreateThread(function()
        ESX.TriggerServerCallback('zf5:getweapon', function(weapons)
                while f5open do
                    interval = 850
                    Wait(1)
                    RageUI.IsVisible(menuf5, function()
                        RageUI.Line()
                        RageUI.Separator(zF5V2.Local.FR.Menu.Server)
                       
                       
                        RageUI.Button(zF5V2.Local.FR.Menu.Inventory, nil, {RightLabel = "→→→"}, true, {
                            onSelected = function()
                                GetInfPlayer()
                            end
                        }, inventory)
                        RageUI.Button(zF5V2.Local.FR.Menu.Wallet, zF5V2.Local.FR.Menu.WalletSubTitle:format(GetPlayerName(PlayerId())), {RightLabel = "→→→"}, true, {}, wallet)
                        RageUI.Button(zF5V2.Local.FR.Menu.GetWeapon, zF5V2.Local.FR.Menu.GetWeapon:format(GetPlayerName(PlayerId())), {RightLabel = "→→→"}, true, {}, weapon)
                       
                        if IsPedInAnyVehicle(PlayerPedId(), false) then
                            RageUI.Button(zF5V2.Local.FR.Menu.cargestion, zF5V2.Local.FR.Menu.GetSub:format(GetPlayerName(PlayerId())), {RightLabel = "→→→"}, true, {}, cargestion)
                        end
                        
                        RageUI.Button(zF5V2.Local.FR.Menu.Clothes, zF5V2.Local.FR.Menu.GetSub:format(GetPlayerName(PlayerId())), {RightLabel = "→→→"}, true, {}, clothes)
                        
                        
                        if ESX.PlayerData.job.grade_name == 'boss' then
                            RageUI.Button("~b~→ ~s~"..zF5V2.Local.FR.Menu.gestione, zF5V2.Local.FR.Menu.GetSub:format(GetPlayerName(PlayerId())), {RightLabel = "→→→"}, true, {}, gestione)
                        end
                        if ESX.PlayerData.job2.grade_name == 'boss' then
                            RageUI.Button("~b~→ ~s~"..zF5V2.Local.FR.Menu.gestiong, zF5V2.Local.FR.Menu.GetSub:format(GetPlayerName(PlayerId())), {RightLabel = "→→→"}, true, {}, gestiong)
                        end
                        RageUI.Button(zF5V2.Local.FR.Menu.Divers, zF5V2.Local.FR.Menu.GetSub:format(GetPlayerName(PlayerId())), {RightLabel = "→→→"}, true, {}, divers)


                       
                        RageUI.Line()
                        if zF5V2.Option.showadminbutton == true then
                            if PlayerGroup == 'superadmin' or PlayerGroup == 'admin' then
                                RageUI.Button(zF5V2.Local.FR.Menu.Admin, zF5V2.Local.FR.Menu.GetSub:format(GetPlayerName(PlayerId())), {RightLabel = "→→→"}, true, {}, admin)
                            else
                            RageUI.Button(zF5V2.Local.FR.Menu.Admin, zF5V2.Local.FR.Menu.GetSub:format(GetPlayerName(PlayerId())), {RightLabel = "→→→"}, false, {},  admin)
                            end
                        else
                            if PlayerGroup == 'superadmin' or PlayerGroup == 'admin' then
                                RageUI.Button(zF5V2.Local.FR.Menu.Admin, zF5V2.Local.FR.Menu.GetSub:format(GetPlayerName(PlayerId())), {RightLabel = "→→→"}, true, {}, admin)
                            end
                        end
                    end)
                    RageUI.IsVisible(wallet, function()
                        RageUI.Separator(zF5V2.Local.FR.Menu.Wallet)
                        local MoneyPlayer = ESX.Math.GroupDigits(ESX.PlayerData.money)
                        local MoneyPlayerBank = ESX.Math.GroupDigits(ESX.PlayerData.accounts[2].money)
                        local MoneyPlayerSalle = ESX.Math.GroupDigits(ESX.PlayerData.accounts[1].money)
                        local job1 = ESX.PlayerData.job.label
                        local job2 = ESX.PlayerData.job.grade_label
                        local job3 = ESX.PlayerData.job.grade
                        local job4 = ESX.PlayerData.job.name
                        RageUI.Separator("↓ ~b~Informations ~s~↓")
                        RageUI.Button('~b~→~s~ Nom : ~b~'..GetPlayerName(PlayerId()), nil, {RightLabel = "→→→"}, true, {})
                        RageUI.Button('~b~→~s~ Job : ~b~'..job1, nil, {RightLabel = "→→→"}, true, {})
                        RageUI.Button('~b~→~s~ Grade : ~b~'..job2, nil, {RightLabel = "→→→"}, true, {})
                        RageUI.Separator("↓ ~b~Argent ~s~↓")
                        RageUI.Button('~b~→~s~ Liquide [~g~'..MoneyPlayer..'$~s~]', nil, {RightLabel = "→→→"}, true, {}, walletmoney)
                        RageUI.Button('~b~→~s~ Banque [~g~'..MoneyPlayerBank..'$~s~]', nil, {RightLabel = "→→→"}, true, {})
                        RageUI.Button('~b~→~s~ Sale [~g~'..MoneyPlayerSalle..'$~s~]', nil, {RightLabel = "→→→"}, true, {}, walletdirty)
                        RageUI.Separator("↓ ~b~Actions ~s~↓")
                        RageUI.List('~b~→~s~ Carte Identitée', {"~b~Regarder~s~", "~b~Donner~s~"}, Index.List, nil, {}, true, {
                            onListChange = function(i, item)
                                Index.List = i;
                            end,
                            onSelected = function(Index, Item)
                                if Index == 1 then
                                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
                                elseif Index == 2 then
                                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                                    if closestDistance ~= -1 and closestDistance <= 3.0 then
                                        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer))
                                    else
                                        ESX.ShowNotification('Aucun joueur ~r~proche !')
                                    end
                                end
                                
                                
                            end})
                            RageUI.List('~b~→~s~ Permis de Conduire', {"~b~Regarder~s~", "~b~Donner~s~"}, Index.List, nil, {}, true, {
                                onListChange = function(i, item)
                                    Index.List = i;
                                end,
                                onSelected = function(Index, Item)
                                    if Index == 1 then
                                        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
                                    elseif Index == 2 then
                                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                                        if closestDistance ~= -1 and closestDistance <= 3.0 then
                                            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'driver')
                                        else
                                            ESX.ShowNotification('Aucun joueur ~r~proche !')
                                        end
                                    end
                                    
                                    
                                end})
                            RageUI.List('~b~→~s~ Permis PPA', {"~b~Regarder~s~", "~b~Donner~s~"}, Index.List, nil, {}, true, {
                                onListChange = function(i, item)
                                    Index.List = i;
                                end,
                                onSelected = function(Index, Item)
                                    if Index == 1 then
                                        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
                                    elseif Index == 2 then
                                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                        if closestDistance ~= -1 and closestDistance <= 3.0 then
                                            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'weapon')
                                        else
                                            ESX.ShowNotification('Aucun joueur ~r~proche !')
                                        end
                                    end
                                end})
                            end)
                            RageUI.IsVisible(weapon, function()
                                RageUI.Separator('↓ ~b~Armes ~s~↓')
                                for i=1, #weapons, 1 do
                                    RageUI.Button(weapons[i].label, nil, {RightLabel = weapons[i].count}, true, {
                                        onSelected = function()
                                            zF5V2.WeaponSelect = weapons[i]                                      
                                        end
                                    }, garmes)
                                end
                            end)
                            RageUI.IsVisible(garmes, function()
                                RageUI.Separator('↓ ~b~Armes ~s~↓')
                                local closestPlayer, distance = ESX.Game.GetClosestPlayer()
                                local playerPed = PlayerPedId()
                                if closestPlayer ~= -1 and distance <= 3.0 then
                                RageUI.Button("Donner l'armes", nil, {RightLabel = "→→→"}, true, {
                                    onSelected = function()
                                        TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_weapon', zF5V2.WeaponSelect.name, zF5V2.WeaponSelect.count)
                                end})                           
                                else   
                                    ESX.ShowNotification("Aucun joueur à proximité")     
                                end
                                RageUI.Button("Jeter armes", nil, {RightLabel = "→→→"}, true, {
                                    onSelected = function()
                                        -- TriggerServerEvent('zf5:removeWeapon', zF5V2.WeaponSelect.name)    
                                        TriggerServerEvent('esx:removeInventoryItem', 'item_weapon', zF5V2.WeaponSelect.name)                               
                                    end})
                            end)
                                                            
                        
                    
                            RageUI.IsVisible(walletmoney, function()
                                RageUI.Separator('↓ ~b~Argent liquide ~s~↓')
                                RageUI.Button('~r~→~s~ Donner', nil, {RightLabel = "→→→"}, true, {
                                    onSelected = function()
                                        local closestPlayer, distance = ESX.Game.GetClosestPlayer()
                                        local playerPed = PlayerPedId()
                                        if closestPlayer ~= -1 and distance <= 3.0 then
                                            local amount = KeyboardInput("Montant", "", 8)
                                            if amount == nil then
                                                ESX.ShowNotification("Montant invalide")
                                            else
                                                TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_money', 'money', amount)
                                            end
                                        else
                                            ESX.ShowNotification("Aucun joueur à proximité")
                                        end
                                    end})
                            end)


                        
                    
                    
                            RageUI.IsVisible(walletdirty, function()
                                RageUI.Separator('↓ ~b~Argent sale ~s~↓')
                                RageUI.Button('~r~→~s~ Donner', nil, {RightLabel = "→→→"}, true, {
                                    onSelected = function()
                                        local closestPlayer, distance = ESX.Game.GetClosestPlayer()
                                        local playerPed = PlayerPedId()
                                        if closestPlayer ~= -1 and distance <= 3.0 then
                                            local amount = KeyboardInput("Montant", "", 8)
                                            if amount == nil then
                                                ESX.ShowNotification("Montant invalide")
                                            else
                                                TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_account', 'black_money', amount)
                                            end
                                        else
                                            ESX.ShowNotification("Aucun joueur à proximité")
                                        end
                                    end})
                            end)
                    RageUI.IsVisible(clothes, function()
                        RageUI.Separator('↓ ~b~Vêtements ~s~↓')
                        -- create RageUI.List for equip and remove clothes
                        RageUI.List('~b~→~s~ ', {"~b~Vêtements~s~", "~b~Accessoires~s~"}, Index.List6, nil, {}, true, {
                            onListChange = function(i, item)
                                Index.List6 = i;
                            end,
                        })
                                if Index.List6 == 1 then


                                    RageUI.Button('~b~→~s~ Torse', nil, {RightLabel = "→→"}, true, {
                                        onSelected = function()
                                            
                                            setUniform('torso', plyPed)
                                        end
                                    })

                                    RageUI.Button('~b~→~s~ T-shirt', nil, {RightLabel = "→→"}, true, {
                                        onSelected = function()
                                            
                                            setUniform('tshirt', plyPed)
                                        end
                                    })

                
                                    RageUI.Button('~b~→~s~ Jeans', nil, {RightLabel = "→→"}, true, {
                                        onSelected = function()
                                            
                                            setUniform('pants', plyPed)
                                        end
                                    })

                                    RageUI.Button('~b~→~s~ Chaussures', nil, {RightLabel = "→→"}, true, {
                                        onSelected = function()
                                            
                                            setUniform('shoes', plyPed)
                                        end
                                    })

                                    RageUI.Button('~b~→~s~ Chapeau', nil, {RightLabel = "→→"}, true, {
                                        onSelected = function()
                                            
                                            setUniform('helmet', plyPed)
                                        end
                                    })
                             
                                
                    
                                end
                                if Index.List6 == 2 then
                                    RageUI.Button('~b~→~s~ Gilet par balle', nil, {RightLabel = "→→"}, true, {
                                        onSelected = function()
                                            
                                            setUniform('bproof', plyPed)
                                        
                                        end
                                    })

                                    RageUI.Button('~b~→~s~ Masque', nil, {RightLabel = "→→"}, true, {
                                        onSelected = function()
                                            
                                            setUniform('mask', plyPed)
                                        end
                                    })

                                    RageUI.Button('~b~→~s~ Lunettes', nil, {RightLabel = "→→"}, true, {
                                        onSelected = function()
                                            
                                            setUniform('glasses', plyPed)
                                        end
                                    })

                                    RageUI.Button('~b~→~s~ Bracelet', nil, {RightLabel = "→→"}, true, {
                                        onSelected = function()
                                            
                                            setUniform('bracelets', plyPed)
                                        end
                                    })

                                    RageUI.Button('~b~→~s~ Sac à dos', nil, {RightLabel = "→→"}, true, {
                                        onSelected = function()
                                            
                                            setUniform('bag', plyPed)
                                        end
                                    })


                                end

                       
                    
                    end)
                    RageUI.IsVisible(inventory, function()
                        RageUI.Separator('↓ ~b~Menu Personel ~s~↓')
                        RageUI.List('~b~→~s~ Inventaire', {"~b~Inventaire~s~"}, Index.List, nil, {}, true, {
                            onListChange = function(i, item)
                                Index.List = i;
                                
                                
                            end,
                        })
                        if Index.List == 1 then
                            ESX.PlayerData = ESX.GetPlayerData()
                            RageUI.Separator('↓ ~b~Inventaire ~s~↓')
                                for k, v in pairs(ESX.PlayerData.inventory) do
                                    if v.count >= 1 then
                                        RageUI.List('~p~→~s~ [~y~x'..v.count..'~s~] ~s~'..v.label..'', {'~b~Utiliser~s~', '~b~Donner~s~', '~b~Jeter~s~'}, Index.List1, nil, {}, true, {
                                            onListChange = function(i, Item)
                                                Index.List1 = i;
                                            end,

                                            onSelected = function(i)         
                                                Item = v                      
                                                if i == 1 then
                                                    if Item.usable then
                                                        TriggerServerEvent('esx:useItem', Item.name)
                                                       else
                                                        ESX.ShowNotification('l\'items n\'est pas utilisable', Item.label)
                                                           end
                                                elseif i == 2 then           
                                                    local sonner,quantity = zCheck(KeyboardInput("Nombres d'items que vous voulez donner", '', '', 100))
                                                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                                    local pPed = GetPlayerPed(-1)
                                                    local coords = GetEntityCoords(pPed)
                                                    local x,y,z = table.unpack(coords)
                                                    DrawMarker(2, x, y, z+1.5, 0, 0, 0, 180.0,nil,nil, 0.5, 0.5, 0.5, 0, 0, 255, 120, true, true, p19, true)
                                
                                                    if sonner then
                                                        if closestDistance ~= -1 and closestDistance <= 3 then
                                                            local closestPed = GetPlayerPed(closestPlayer)
                                
                                                            if IsPedOnFoot(closestPed) then
                                                                    TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_standard', Item.name, quantity)
                                                                    --RageUI.CloseAll()
                                                                else
                                                                    ESX.ShowNotification("~r~ Nombres d'items invalid !")
                                                                end
                                                           
                                                        else
                                                            ESX.ShowNotification("~s~ Aucun joueur ~r~Proche~n~ !")
                                                            end
                                                        end
                                                elseif i == 3 then
                                                    if Item.name then
                                                            TriggerServerEvent('esx:removeInventoryItem', 'item_standard', Item.name, 1)
                                                end
                                            end
                                        end
                                        })
                                    end
                                end
                            end
                       
                    end)
                    RageUI.IsVisible(cargestion, function()
                        RageUI.Separator('↓ ~b~Gestion Vehicule ~s~↓')
                        RageUI.Separator('↓ ~b~Vehicule ~s~↓')
                        local vehiclename = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), false))))
                        local plque = GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false))
                        local GetSourcevehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                        local zengine = GetVehicleEngineHealth(GetSourcevehicle)/10
                        local healcar = math.floor(zengine)
                        RageUI.Separator('~p~→ ~s~Véhicule : '..vehiclename)
                        RageUI.Separator('~p~→ ~s~Plaque : '..plque)
                        RageUI.Separator('~p~→ ~s~Etat : '.. healcar ..'%')
                        RageUI.Separator('↓ ~b~Gestion ~s~↓')
                        local status = "Démarré"
                        RageUI.Checkbox("~p~→ Status Moteur : "..DisplayStateEngine, "Gérer le status de votre moteur", StateEngine, {RightLabel = ""}, {
                            onChecked = function()
                                StateEngine = true
                            end,
                            onUnChecked = function()
                                StateEngine = false
                            end
                        })
                        RageUI.List("~p~→ ~s~Vérouillage Portes", {"~b~Ouvrir~s~", "~b~Fermer~s~"}, Index.List2, nil, {}, true, {
                            onListChange = function(i, item)
                                Index.List2 = i;
                            end,
                            onSelected = function(i)
                                if i == 1 then
                                    SetVehicleDoorsLocked(GetSourcevehicle, 1)
                                    SetVehicleDoorsLockedForAllPlayers(GetSourcevehicle, false)
                                    ESX.ShowNotification("~s~Vous avez ~g~ouvert~s~ les portes de votre véhicule")
                                elseif i == 2 then
                                    SetVehicleDoorsLocked(GetSourcevehicle, 2)
                                    SetVehicleDoorsLockedForAllPlayers(GetSourcevehicle, true)
                                    ESX.ShowNotification("~s~Vous avez ~r~fermer~s~ les portes de votre véhicule")
                                end
                            end
                        })
                        
                        RageUI.List("~p~→ ~s~Gestion Portières ", {"~b~Porte Conducteur ~s~", "~b~Porte Passager~s~", "~b~Porte Arrière Gauche~s~", "~b~Porte Arrière Droite~s~", "~b~Capot~s~", "~b~Coffre~s~"}, Index.List3, nil, {}, true, {
                            onListChange = function(i, item)
                                Index.List3 = i;
                            end,
                            onSelected = function(i)
                                if i == 1 then
                                    SetVehicleDoorOpen(GetSourcevehicle, 0, false, false)
                                    ESX.ShowNotification("~s~Vous avez ~g~ouvert~s~ la porte conducteur")
                                elseif i == 2 then
                                    SetVehicleDoorOpen(GetSourcevehicle, 1, false, false)
                                    ESX.ShowNotification("~s~Vous avez ~g~ouvert~s~ la porte passager")
                                elseif i == 3 then
                                    SetVehicleDoorOpen(GetSourcevehicle, 2, false, false)
                                    ESX.ShowNotification("~s~Vous avez ~g~ouvert~s~ la porte arrière gauche")
                                elseif i == 4 then
                                    SetVehicleDoorOpen(GetSourcevehicle, 3, false, false)
                                    ESX.ShowNotification("~s~Vous avez ~g~ouvert~s~ la porte arrière droite")
                                elseif i == 5 then
                                    SetVehicleDoorOpen(GetSourcevehicle, 4, false, false)
                                    ESX.ShowNotification("~s~Vous avez ~g~ouvert~s~ le capot")
                                elseif i == 6 then
                                    SetVehicleDoorOpen(GetSourcevehicle, 5, false, false)
                                    ESX.ShowNotification("~s~Vous avez ~g~ouvert~s~ le coffre")
                                end
                            end
                        })
                    end)
                    RageUI.IsVisible(divers, function()
                        RageUI.Separator('↓ ~b~Divers ~s~↓')
                        if zF5V2.Option.twitter == true then
                        RageUI.Button("~b~→ ~s~Faire un tweet", nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                local tweet = KeyboardInput("Tapez votre tweet", "", 100)
                                local playername = GetPlayerName(PlayerId())
                                for k, v in pairs(zF5V2.BanWord) do
                                
                                    if tweet == v.name then 
                                        
                                        return(ESX.ShowNotification("~r~Vous ne pouvez pas faire de tweet avec ce mot"))
                                    end
                      
                                    
                                end
                                if tweet ~= nil then
                                    TriggerServerEvent('zf5v2:sendtweet', playername, tweet)
                                end
                            end})
                        else end    
                        RageUI.Checkbox("~b~→ ~s~Afficher / Cacher le HUD", nil, zF5V2.Option.hud, {RightLabel = ""}, {
                            onChecked = function()
                                zF5V2.Option.hud = true
                                DisplayRadar(true)

                            end,
                            onUnChecked = function()
                                zF5V2.Option.hud = false
                                DisplayRadar(false)
                            end})
                            RageUI.Button("~b~→ ~s~Tomber", "Ragdoll", {RightLabel = "→→"}, true, {
                                onSelected = function()
                                    ragdolling = not ragdolling
                                    RageUI.CloseAll()
                                    isMenuOpen = false
                                    while ragdolling do
                                        Wait(0)
                                        local myPed = GetPlayerPed(-1)
                                        SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
                                        ResetPedRagdollTimer(myPed)
                                        AddTextEntry(GetCurrentResourceName(), ('Appuyez sur ~INPUT_JUMP~ pour vous ~b~Réveillé'))
                                        DisplayHelpTextThisFrame(GetCurrentResourceName(), false)
                                        ResetPedRagdollTimer(myPed)
                                        if IsControlJustPressed(0, 22) then 
                                            ragdolling = false
                                        end
                                    end
                                end
                            }) 
                            
                       
                        RageUI.List('~b~→~s~ Voir', {"~b~Ton ID~s~", "~b~ID Joueur~s~"}, Index.List, nil, {}, true, {
                            onListChange = function(i, item)
                                Index.List = i;
                            end,
                            onSelected = function(Index, Item)
                                if Index == 1 then
                                    ESX.ShowNotification("Votre ID : "..GetPlayerServerId(PlayerId()))
                                elseif Index == 2 then
                                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                                    if closestDistance ~= -1 and closestDistance <= 3.0 then
                                        ESX.ShowNotification("Joueur Proche : "..GetPlayerName(closestPlayer).." "..GetPlayerServerId(closestPlayer))
                                    else
                                        ESX.ShowNotification('Aucun joueur ~r~proche !')
                                    end
                                end
                                
                                
                            end})
                            
                        
                    
                    end)
                    RageUI.IsVisible(admin, function()
                        RageUI.Separator('↓ ~b~Administration ~s~↓')
                        local name = GetPlayerName(PlayerId())
                        -- 
                        local nombreco = "Il y a actuellement "..#GetActivePlayers().." joueurs en ligne"
                        local uptime = "Vous etes en ligne depuis"..GetConvar("sv_uptime", "0").." minutes"
                        local rank = PlayerGroup
                        local id  = GetPlayerServerId(PlayerId())
                        if PlayerGroup == "superadmin" then
                        rank = "~r~Owner ~s~"
                        RageUI.Separator(rank.." [~b~"..id.."~s~] ~s~"..name)
                        RageUI.Separator(nombreco)
                        RageUI.Line({Line = {14, 204, 238, 255}}) -- zF5V2.Option.LineColor
                        RageUI.Checkbox("~b~→ ~s~NoClip ~s~", "Activer le NoClip", NoClip, {RightLabel = ""}, {
                            onChecked = function()
                                NoClip = true
                                print("NoClip Activé")
                                ToggleNoClipMode()
                            end,
                            onUnChecked = function()
                                NoClip = false
                                print("NoClip Désactivé")
                                ToggleNoClipMode()
                            end
                        })
                        end
                        RageUI.Button("~b~→ ~s~Téléportation Marker", nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                -- Teleport player to marker 
                                local playerPed = PlayerPedId()
                                local waypoint = GetFirstBlipInfoId(8)
                                if DoesBlipExist(waypoint) then
                                    local waypointCoords = GetBlipInfoIdCoord(waypoint)
                                    SetEntityCoords(playerPed, waypointCoords)
                                    ESX.ShowNotification("~s~Vous avez été ~g~téléporté~s~ au ~b~marker")
                                else
                                    ESX.ShowNotification("~s~Vous n'avez pas de ~b~marker~s~ sur votre carte")
                                end
                            end
                        })
                        RageUI.Button("~b~→ ~s~Téléportation Coordonnées", nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                -- Teleport player to coords
                                local x = KeyboardInput("X", "", 100)
                                local y = KeyboardInput("Y", "", 100)
                                local z = KeyboardInput("Z", "", 100)
                                if x ~= nil and y ~= nil and z ~= nil then
                                    SetEntityCoords(PlayerPedId(), x + 0.0, y + 0.0, z + 0.0)
                                    ESX.ShowNotification("~s~Vous avez été ~g~téléporté~s~ aux ~b~coordonnées")
                                end
                            end
                        })
                        RageUI.Button("~b~→ ~s~Téléportation Joueur", nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                -- Teleport player to player id 
                                local playerid = KeyboardInput("ID du joueur", "", 100)
                                local playerped = GetPlayerPed(GetPlayerFromServerId(playerid))
                                local playercoords = GetEntityCoords(playerped)
                                if playerid ~= nil then
                                    SetEntityCoords(PlayerPedId(), playercoords)
                                    ESX.ShowNotification("~s~Vous avez été ~g~téléporté~s~ au joueur ~b~"..playerid)
                                end
                            end
                             
                        })
                        RageUI.Separator('↓ ~b~Administration ~s~↓')
                        RageUI.Button("~b~→ ~s~Revive Joueur", nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                -- Revive player
                                local slt = KeyboardInput("ID du joueur", "", 100)
                                if playerid ~= nil then
                                    ExecuteCommand("revive "..slt)
                                    ESX.ShowNotification("~s~Vous avez ~g~réanimé~s~ le joueur ~b~"..playerid)
                                    TriggerServerEvent("zLogs:send", "Revive", "Joueur : "..name , "Ce Joueur vien de revive un "..slt, "https://discord.com/api/webhooks/1044748586816122952/X6oi-iey0qj6NTm4Aq7l7a8ePEGIK0obagrCduDt6j9WEx-8Kd2NBbrH9ez8s0q6w-zI")
                                end
                            end
                        })
                        RageUI.Separator('↓ ~b~Véhicule ~s~↓')
                        RageUI.Button("~b~→ ~s~Réparer Véhicule", nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                -- Repair vehicle
                                local playerped = PlayerPedId()
                                local vehicle = GetVehiclePedIsIn(playerped, false)
                                SetVehicleFixed(vehicle)
                                SetVehicleDirtLevel(vehicle, 0.0)
                                ESX.ShowNotification("~s~Vous avez ~g~réparé~s~ le véhicule")
                                TriggerServerEvent("zLogs:send", "VehicleLogs", "Joueur : "..name , "Ce Joueur vien de réparer son/un véhicule", "https://discord.com/api/webhooks/1044748586816122952/X6oi-iey0qj6NTm4Aq7l7a8ePEGIK0obagrCduDt6j9WEx-8Kd2NBbrH9ez8s0q6w-zI")
                            end
                        })
                        RageUI.Button("~b~→ ~s~Spawn Véhicule", nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                -- Spawn vehicle
                                local vehicle = KeyboardInput("Nom du véhicule", "", 100)
                                if vehicle ~= nil then
                                    ESX.Game.SpawnVehicle(vehicle, GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), function(callback_vehicle)
                                        TaskWarpPedIntoVehicle(PlayerPedId(), callback_vehicle, -1)
                                    end)
                                    ESX.ShowNotification("~s~Vous avez ~g~spawn~s~ le véhicule ~b~"..vehicle)
                                    TriggerServerEvent("zLogs:send", "VehicleLogs", "Joueur : "..name , "Ce Joueur vien de faire spawn un véhicule", "https://discord.com/api/webhooks/1044748586816122952/X6oi-iey0qj6NTm4Aq7l7a8ePEGIK0obagrCduDt6j9WEx-8Kd2NBbrH9ez8s0q6w-zI")
                                end
                            end
                        })
                        RageUI.Button("~b~→ ~s~Supprimer Véhicule", nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                -- Delete vehicle
                                local playerped = PlayerPedId()
                                local vehicle = GetVehiclePedIsIn(playerped, false)
                                DeleteEntity(vehicle)
                                ESX.ShowNotification("~s~Vous avez ~r~supprimé~s~ le véhicule")
                                TriggerServerEvent("zLogs:send", "VehicleLogs", "Joueur : "..name , "Ce Joueur vien de supprimer un véhicule", "https://discord.com/api/webhooks/1044748586816122952/X6oi-iey0qj6NTm4Aq7l7a8ePEGIK0obagrCduDt6j9WEx-8Kd2NBbrH9ez8s0q6w-zI")
                            end
                        })
                        RageUI.Separator('↓ ~b~Autres ~s~↓')
                        RageUI.Button("~b~→ ~s~Spectate Joueur", nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                -- Spectate player
                                local playerid = KeyboardInput("ID du joueur", "", 100)
                                local playerped = GetPlayerPed(GetPlayerFromServerId(playerid))
                                local playercoords = GetEntityCoords(playerped)
                                if playerid ~= nil then
                                    SetEntityCoords(PlayerPedId(), playercoords)
                                    
                                    TriggerServerEvent("zLogs:send", "SpectateLogs", "Joueur : "..name , "Ce Joueur vien de spectate l'ID : "..playerid, "https://discord.com/api/webhooks/1044748586816122952/X6oi-iey0qj6NTm4Aq7l7a8ePEGIK0obagrCduDt6j9WEx-8Kd2NBbrH9ez8s0q6w-zI")
                                    ESX.ShowNotification("~s~Vous avez été ~g~téléporté~s~ au joueur ~b~"..playerid)
                                end
                            end
                        })
                    end)
                    RageUI.IsVisible(gestiong, function()
                        RageUI.Separator('↓ ~b~Gestion Gangs~s~↓')
                        RageUI.Separator('↓ ~b~Informations ~s~↓')
                        local gang = ESX.PlayerData.job2.label
                        local ganggrade = ESX.PlayerData.job2.grade_label
                        RageUI.Separator("~b~→ ~s~Nom du Gang : ~b~"..gang)
                        RageUI.Separator("~b~→ ~s~Grade : ~b~"..ganggrade)
                        RageUI.Separator('↓ ~b~Gestion ~s~↓')
                        RageUI.Button("~b~→ ~s~Recruter un ~b~Joueur", nil, {RighLabel = "→"}, true, { 
                            onSelected = function()
                                if ESX.PlayerData.job2.name == 'boss' then 
                                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            
                                    if closestPlayer == -1 or closestDistance > 3.0 then
                                        ESX.ShowNotification('Aucun joueur à proximité')
                                    else
                                        ESX.ShowNotification('Vous avez recruté ~b~' .. GetPlayerName(closestPlayer))
                                        TriggerServerEvent('zf5v2:server:recrut2', GetPlayerServerId(closestPlayer))
                                    end
                                else
                                    ESX.ShowNotification('Vous n\'êtes pas le ~b~boss')
                                end
                            end})

                            RageUI.Button("~b~→ ~s~Virer un ~b~Joueur", nil, {RighLabel = "→"}, true, { 
                                onSelected = function()
                                    if ESX.PlayerData.job2.name == 'boss' then 
                                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                
                                        if closestPlayer == -1 or closestDistance > 3.0 then
                                            ESX.ShowNotification('Aucun joueur à proximité')
                                        else
                                            ESX.ShowNotification('Vous avez virer ~b~' .. GetPlayerName(closestPlayer))
                                            TriggerServerEvent('zf5v2:server:virer2', GetPlayerServerId(closestPlayer))
                                        end
                                    else
                                        ESX.ShowNotification('Vous n\'êtes pas le ~b~boss')
                                    end
                                                            
                                       
                                    
                                end})

                                RageUI.Button("~b~→ ~s~Promote un ~b~Joueur", nil, {RighLabel = "→"}, true, { 
                                    onSelected = function()
                                        if ESX.PlayerData.job2.name == 'boss' then 
                                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    
                                            if closestPlayer == -1 or closestDistance > 3.0 then
                                                ESX.ShowNotification('Aucun joueur à proximité')
                                            else
                                                ESX.ShowNotification('Vous avez virer ~b~' .. GetPlayerName(closestPlayer))
                                                TriggerServerEvent('zf5v2:server:promote2', GetPlayerServerId(closestPlayer))
                                            end
                                        else
                                            ESX.ShowNotification('Vous n\'êtes pas le ~b~boss')
                                        end
                                    end})
                                
                                    RageUI.Button("~b~→ ~s~Derank un ~b~Joueur", nil, {RighLabel = "→"}, true, { 
                                        onSelected = function()
                                            if ESX.PlayerData.job2.name == 'boss' then 
                                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        
                                                if closestPlayer == -1 or closestDistance > 3.0 then
                                                    ESX.ShowNotification('Aucun joueur à proximité')
                                                else
                                                    ESX.ShowNotification('Vous avez virer ~b~' .. GetPlayerName(closestPlayer))
                                                    TriggerServerEvent('zf5v2:server:derank2', GetPlayerServerId(closestPlayer))
                                                end
                                            else
                                                ESX.ShowNotification('Vous n\'êtes pas le ~b~boss')
                                            end
                                        end})
                                    
                                           
                                        
                                    

                            
                            


                    end)
                    
                    RageUI.IsVisible(gestione, function()
                        RageUI.Separator('↓ ~b~Gestion Entreprise~s~↓')
                        RageUI.Separator("~o~"..ESX.PlayerData.job.grade_label.." - ~g~"..ESX.PlayerData.job.label)
          
                        
                        RageUI.Button("~b~→ ~s~Recruter un ~b~Joueur", nil, {RighLabel = "→"}, true, {
                        onSelected = function()
                            if ESX.PlayerData.job2.grade_name == 'boss' then
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            
                                if closestPlayer == -1 or closestDistance > 3.0 then
                                    ESX.ShowNotification('Aucun joueur proche')
                                else
                                    TriggerServerEvent('zf5v2:server:recrut', GetPlayerServerId(closestPlayer))
                                    
                                end
                            else
                                ESX.ShowNotification('Vous n\'avez pas les ~r~droits~w~')
                            end

                        end})
                    RageUI.Button("~b~→ ~s~Virer un ~b~Joueur", nil, {RighLabel = "→"}, true, { 
                        onSelected = function()
                            if ESX.PlayerData.job2.grade_name == 'boss' then
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            
                                if closestPlayer == -1 or closestDistance > 3.0 then
                                    ESX.ShowNotification('Aucun joueur proche')
                                else
                                    TriggerServerEvent('zf5v2:server:virer', GetPlayerServerId(closestPlayer))
                                    
                                end
                            else
                                ESX.ShowNotification('Vous n\'avez pas les ~r~droits~w~')
                            end

                        end})
                        
                    RageUI.Button("~b~→ ~s~Promouvoir un ~b~Joueur", nil, {RighLabel = "→"}, true, { 
                        onSelected = function()
                            if ESX.PlayerData.job2.grade_name == 'boss' then
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            
                                if closestPlayer == -1 or closestDistance > 3.0 then
                                    ESX.ShowNotification('Aucun joueur proche')
                                else
                                    TriggerServerEvent('zf5v2:server:promote', GetPlayerServerId(closestPlayer))
                                    
                                end
                            else
                                ESX.ShowNotification('Vous n\'avez pas les ~r~droits~w~')
                            end

                        end})


                    RageUI.Button("~b~→ ~s~Rétrograder un ~b~Joueur", nil, {RighLabel = "→"}, true, { 
                        onSelected = function()
                            if ESX.PlayerData.job2.grade_name == 'boss' then
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            
                                if closestPlayer == -1 or closestDistance > 3.0 then
                                    ESX.ShowNotification('Aucun joueur proche')
                                else
                                    TriggerServerEvent('zf5v2:server:destituer', GetPlayerServerId(closestPlayer))
                                    
                                end
                            else
                                ESX.ShowNotification('Vous n\'avez pas les ~r~droits~w~')
                            end

                        end})
                    end)
                
                end
                
            end) 
        end)
    end
end

RegisterCommand("open", function()
    OpenMenu()
end)

RegisterKeyMapping('open', 'Ouvrir le menu F5', 'keyboard', 'F5')

