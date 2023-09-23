local QBCore = exports['qb-core']:GetCoreObject()


local models = {
    'prop_cs_dumpster_01a',
    'p_dumpster_t',
    'prop_dumpster_3a',
    'prop_dumpster_4a',
    'prop_dumpster_01a',
    'prop_dumpster_02b',
    'prop_dumpster_02a',
    'prop_cs_bin_02',
    'prop_bin_07b',
    'prop_bin_01a',
    'prop_dumpster_4b'
}

exports['qb-target']:AddTargetModel(models, {
    options = {
        {
        type = "client",
        event = "serrulata-dumpster:client:search",
        icon = 'fa-sharp fa-solid fa-arrow-up-from-bracket',
        label = 'Search Bin',
        }
    },
  distance = 2.5,
})

RegisterNetEvent('serrulata-dumpster:client:search', function(data)
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(GetPlayerPed(-1))
    local closestBINObject = nil
    local closestDistance = 999.0 

    for _, model in ipairs(models) do
        local binObject = GetClosestObjectOfType(playerCoords.x, playerCoords.y, playerCoords.z, 5.0, GetHashKey(model), false, false, false)

        if DoesEntityExist(binObject) then
            local distance = #(playerCoords - GetEntityCoords(binObject))

            if distance < closestDistance then
                closestBINObject = binObject
                closestDistance = distance
            end
        end
    end

    if closestBINObject then
        local binObjectNetId = NetworkGetNetworkIdFromEntity(closestBINObject)

        TriggerServerEvent('serrulata-dumpster:server:dive', binObjectNetId)
    else
        print('[^1Serrulata Dumster Diving^7] Error: No Bin found nearby')
    end
end)

RegisterNetEvent('serrulata-dumpster:client:looted', function(data)
    QBCore.Functions.Notify('This Dumpster Has Recently been looted', 'error', 5000)
end)

function AnimationRun()
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic2"})
    Wait(3000)
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
end

RegisterNetEvent('serrulata-dumpster:client:diving', function(isCoolDown)
    local src = source

    exports['ps-ui']:Circle(function(success)
        if success then
            AnimationRun()
            --Wait(3000)
            TriggerServerEvent('serrulata-dumpster:server:reward')
        else
            -- add a Debuff if you want or a punishment for failing the minigame
        end
    end, Config.Circles, Config.HackTime)
end)