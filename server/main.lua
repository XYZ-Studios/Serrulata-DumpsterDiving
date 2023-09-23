local QBCore = exports['qb-core']:GetCoreObject()
local BIN = {} local CoolDown = {} 

function IsBINInTable(binObjectNetId)
    for i, v in ipairs(BIN) do
        if v == binObjectNetId then
            return true
        end
    end
    return false
end

RegisterServerEvent('serrulata-dumpster:server:dive', function(binObjectNetId)
    local src = source
    local objecid = binObjectNetId

    if not IsBINInTable(objecid) then
        table.insert(BIN, objecid)

        print('[^2Serrulata Dumpster ^7] Bin with ID ' .. objecid .. ' is now in the table')

        TriggerEvent('serrulata-dumpster:server:timer', binObjectNetId)
        TriggerClientEvent('serrulata-dumpster:client:diving', src, binObjectNetId)
    else
        if CoolDown[objecid] then
            TriggerEvent('serrulata-dumpster:client:looted')
        else
            print('[^2Serrulata Dumpster ^7] Bin with ID ' .. objecid .. ' is already in the table.')
        end
    end

    for i, v in ipairs(BIN) do
        print('[^2Serrulata Dumpster ^7] Bin with ID ' .. v .. ' is now in the table.')
    end
end)

RegisterServerEvent('serrulata-dumpster:server:timer', function(binObjectNetId)
    if CoolDown[binObjectNetId] == nil then
        CoolDown[binObjectNetId] = true
        local timer = Config.CoolDown * (60 * 1000)
        while timer > 0 do
            Wait(1000)
            timer = timer - 1000
        end
        CoolDown[binObjectNetId] = false
        print('[^2Serrulata Dumpster ^7] Bin with ID ' .. binObjectNetId .. ' is now available.')

        for i, v in ipairs(BIN) do
            if v == binObjectNetId then
                table.remove(BIN, i)
                print('[^2Serrulata Dumpster ^7] Bin with ID ' .. binObjectNetId .. ' removed from table.')
                break 
            end
        end
    end
end)

-- Reward System
RegisterNetEvent("serrulata-dumpster:server:reward",function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for _ = 1, math.random(1, Config.MaxItemsReceived), 1 do
        local randItem = Config.ItemTable[math.random(1, #Config.ItemTable)]
        local amount = math.random(Config.MinItemReceivedQty, Config.MaxItemReceivedQty)
        Player.Functions.AddItem(randItem, amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add')
    end
end)

-- Console Events
-- Starting Events 
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
       print('[^2Serrulata Dumpster^7] Started ^2Successfully^7')
    end
 end)
 
 AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
         print('[^2Serrulata Dumpster^7] Stopped ^2Successfully^7')
    end
 end)