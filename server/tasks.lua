local QBCore = exports['qb-core']:GetCoreObject()
local taskState = {}       -- [biz][taskKey] = {completedBy = {citizenid=true}, resetAt = os.time()+dur}

-- server/tasks.lua
local function resetTasksLoop()
    while true do
        local now = os.time()

        for biz, tasks in pairs(taskState) do
            for k, v in pairs(tasks) do
                if now >= v.resetAt then
                    taskState[biz][k] = nil      -- wipe progress
                end
            end
        end

        Wait(60000)   -- 60 seconds (underscores not allowed in Lua numbers)
    end
end

CreateThread(resetTasksLoop)

AddEventHandler('onResourceStart', function(res)
    if res == GetCurrentResourceName() then
        taskState = {}
    end
end)

RegisterNetEvent('prp-businesses:taskDone', function(biz, key)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local cid = Player.PlayerData.citizenid

    taskState[biz]          = taskState[biz] or {}
    local st                = taskState[biz][key] or {completedBy = {}, resetAt = os.time() + (Config.TaskSettings.resetMinutes * 60)}
    if st.completedBy[cid] then
        return TriggerClientEvent('ox_lib:notify', src, {type="error", description="You've done that already."})
    end

    st.completedBy[cid] = true
    taskState[biz][key] = st

    local payout = (Config.businesses[biz].Tasks[key].payout or Config.TaskSettings.defaultPayout)
    Player.Functions.AddMoney('bank', payout, ('Business task %s'):format(key))

    TriggerClientEvent('ox_lib:notify', src, {type="success", description=("Task complete! You earned $%s."):format(payout)})
    TriggerClientEvent('prp-businesses:taskCache', src, taskState) -- send back cache so client hides finished tasks
end)
