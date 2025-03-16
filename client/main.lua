-- https://marolliscripts.pl/
local ox_target = exports.ox_target
local ox_inventory = exports.ox_inventory
local marolliscripts = Config.MarolliScripts
local debug = Config.MarolliScripts.Debug
local player = PlayerPedId()

CreateThread(function ()
    local blip = AddBlipForCoord(marolliscripts.Blip.Coords)
    SetBlipSprite(blip, marolliscripts.Blip.Sprite)
    SetBlipDisplay(blip, 2)
    SetBlipScale(blip, marolliscripts.Blip.Scale)
    SetBlipColour(blip, marolliscripts.Blip.Colour)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(marolliscripts.Blip.Name)
    EndTextCommandSetBlipName(blip)
end)

CreateThread(function()
    ox_target:addBoxZone({
        coords = marolliscripts.Zone,
        size = vec3(0.2, 25, 30),
        rotation = 50,
        debug = debug,
        drawSprite = true,
        options = {
            {
                name = 'rybkarzchuj',
                icon = 'fa-solid fa-fish-fins',
                label = marolliscripts.Label,
                onSelect = function ()
                    if marolliscripts.Requirejob then
                        if ESX.PlayerData.job.name ~= marolliscripts.JobName then
                            ESX.ShowNotification('Musisz być zatrudniony, aby zacząć łowić ryby!')
                            return
                        end
                    else
                        local mawedke = ox_inventory:Search('count', marolliscripts.Items.Wedka) > 0
                        if mawedke then
                            TaskStartScenarioInPlace(player, "WORLD_HUMAN_STAND_FISHING", 0, true)
                            FreezeEntityPosition(player, true)

                            local sigma = math.random(marolliscripts.FishingTime.min, marolliscripts.FishingTime.max)
                            if debug == true then print('Łowienie nastąpi za: ' ..sigma.. ' sekund!') end
                            Wait(sigma * 1000)

                            ESX.ShowNotification('Spławik się poruszył!')
                            Wait(1000)
                            if lib.progressBar({
                                duration = 8000,
                                label = 'Łowienie ryby',
                                useWhileDead = false,
                                canCancel = true,
                                disable = {
                                    car = true,
                                    move = true,
                                },
                            })
                            then
    
                                local zlapanaryba = marolliscripts.Items.Ryby[math.random(1, #marolliscripts.Items.Ryby)]
                                if debug == true then print('Złapano: ' ..zlapanaryba) end

                                TriggerServerEvent('m_fisherjob:collectfish', zlapanaryba, true)
    
                                ClearPedTasks(player)
                                FreezeEntityPosition(player, false)
                            end
                        else
                            ESX.ShowNotification('Musisz mieć przy sobie wędkę, aby zacząć łowić ryby!')
                        end
                    end
                end
            }
        }
    })

    RequestModel(marolliscripts.ShopPed.Ped)
    while not HasModelLoaded(marolliscripts.ShopPed.Ped) do
        Wait(0)
    end
    
    local ped = CreatePed(4, marolliscripts.ShopPed.Ped, marolliscripts.ShopPed.PedCoords, marolliscripts.ShopPed.PedHeading, false, true)
    
    SetEntityHeading(ped, marolliscripts.ShopPed.PedHeading)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_AA_COFFEE", 0, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    
    ox_target:addLocalEntity(ped, {
        {
            name = 'buywedke',
            icon = 'fa-solid fa-shop',
            label = marolliscripts.ShopPed.PedOptions[1],
            onSelect = function()
                ox_inventory:openInventory('shop', { type = 'wedkarski', id = 1 })
            end
        },
        {
            name = 'sellryby',
            icon = 'fa-solid fa-fish-fins',
            label = marolliscripts.ShopPed.PedOptions[2],
            onSelect = function()
                local fishOptions = {
                    { title = 'Okoń, Dorsz', item = {'okon', 'dorsz'}, percent = 'okondorsz' },
                    { title = 'Szczupak', item = {'szczupak'}, percent = 'szczupak' },
                    { title = 'Złota ryba', item = {'zlotaryba'}, percent = 'zlotaryba' },
                    { title = 'Perła', item = {'perla'}, percent = 'perla' }
                }
                
                local options = {}
                for _, fish in ipairs(fishOptions) do
                    local totalFish = 0
                    for _, item in ipairs(fish.item) do
                        totalFish = totalFish + ox_inventory:Search('count', item)
                    end
                    
                    table.insert(options, {
                        title = fish.title,
                        description = 'Sprzedaj ' .. fish.title .. '.',
                        icon = 'fas fa-fish',
                        disable = totalFish == 0,
                        onSelect = function()
                            TriggerServerEvent('m_fisherjob:sellfish', fish.item, fish.percent, totalFish)
                        end
                    })
                end
                
                lib.registerContext({
                    id = 'sellrybsy',
                    title = 'Bazar rybny',
                    description = 'Sprzedaj złowione ryby!',
                    options = options
                })
                
                lib.showContext('sellrybsy')
            end
        }
    })
end)