local QBCore = exports['qb-core']:GetCoreObject()

local taskCache           = {}          -- server‑side “done” state (synced via event)
local activeTaskProgress  = {}          -- local per‑session progress
local taskCheckpoints = {}

---------------------------------------------------------------------
--  START A TASK INTERACTION
---------------------------------------------------------------------
---@param biz string
---@param taskKey string
---@param def table   -- task definition from Config
---@param spotIndex number|nil  -- which spot triggered (nil for single‑spot repeats)
local function startTask(biz, taskKey, def, spotIndex)
    -- initial per‑player task state
    activeTaskProgress[biz]              = activeTaskProgress[biz] or {}
    activeTaskProgress[biz][taskKey]     = activeTaskProgress[biz][taskKey] or {
        repeatsDone    = 0,      -- for single‑spot tasks
        completedSpots = {}      -- for multi‑spot tasks
    }

    -----------------------------------------------------------------
    -- 1) SINGLE‑SPOT REPEAT MODE  (when amountuntilcomplete is set)
    -----------------------------------------------------------------
    if def.amountuntilcomplete and def.amountuntilcomplete > 1 then
        local prog = activeTaskProgress[biz][taskKey]

        -- already finished?
        if prog.repeatsDone >= def.amountuntilcomplete then
            QBCore.Functions.Notify("That task is already finished!", "error")
            return
        end

        -----------------------------------------------------------------
        -- progress bar + animation
        -----------------------------------------------------------------
        QBCore.Functions.Progressbar("task_progress", def.label, 5000, false, true, {
            disableMovement   = true,
            disableCarMovement= true,
            disableMouse      = false,
            disableCombat     = true,
        }, {
            animDict = def.anim.dict,
            anim     = def.anim.name,
            flags    = 16,
        }, {}, {}, function() -- ✓ finished one repeat
            prog.repeatsDone += 1
            local done, goal  = prog.repeatsDone, def.amountuntilcomplete
            QBCore.Functions.Notify(("Finished %d/%d"):format(done, goal), "success")

            if done >= goal then
                TriggerServerEvent('prp-businesses:taskDone', biz, taskKey)
                activeTaskProgress[biz][taskKey] = nil        -- clear local state
            end
        end, function() -- ✗ cancel
            QBCore.Functions.Notify("Cancelled", "error")
        end)

        return -- single‑spot mode ends here
    end

    -----------------------------------------------------------------
    -- 2) MULTI‑SPOT MODE  (no amountuntilcomplete field)
    -----------------------------------------------------------------
    if not spotIndex then
        QBCore.Functions.Notify("Error: no spot index!", "error")
        return
    end

    local prog = activeTaskProgress[biz][taskKey]

    -- spot already done?
    if prog.completedSpots[spotIndex] then
        QBCore.Functions.Notify("You already did this spot!", "error")
        return
    end

    QBCore.Functions.Progressbar("task_progress", def.label, 5000, false, true, {
        disableMovement   = true,
        disableCarMovement= true,
        disableMouse      = false,
        disableCombat     = true,
    }, {
        animDict = def.anim.dict,
        anim     = def.anim.name,
        flags    = 16,
    }, {}, {}, function() -- ✓ spot done
        prog.completedSpots[spotIndex] = true

        local totalSpots     = #def.spots
        local completedCount = 0
        for _, v in pairs(prog.completedSpots) do
            if v then completedCount += 1 end
        end

        QBCore.Functions.Notify(("Spot done! %d/%d"):format(completedCount, totalSpots), "success")

        if completedCount >= totalSpots then
            TriggerServerEvent('prp-businesses:taskDone', biz, taskKey)
            activeTaskProgress[biz][taskKey] = nil
        end
    end, function() -- ✗ cancel
        QBCore.Functions.Notify("Cancelled", "error")
    end)
end
---------------------------------------------------------------------

---------------------------------------------------------------------
--  OPEN TASK BOARD (qb‑menu)
---------------------------------------------------------------------
local function openTaskMenu(biz)
    local pData   = QBCore.Functions.GetPlayerData()
    if (pData.job and pData.job.name) ~= biz then
        return QBCore.Functions.Notify("You don't work here!", "error")
    end

    local tasks   = Config.businesses[biz] and Config.businesses[biz].Tasks or {}
    if not next(tasks) then
        return QBCore.Functions.Notify("No tasks defined for this business.", "error")
    end

    local menu    = {}
    local cid     = pData.citizenid

    for key, task in pairs(tasks) do
        if task.spots and #task.spots > 0 then
            local done = taskCache[biz] and taskCache[biz][key] and
                         taskCache[biz][key].completedBy and taskCache[biz][key].completedBy[cid]

            local payout = task.payout or (Config.TaskSettings and Config.TaskSettings.defaultPayout) or 0
            menu[#menu+1] = {
                header = task.label,
                txt    = done and "✅ Completed" or ("💰 $"..payout),
                params = { event = "prp-businesses:client:taskChosen",
                           args  = { biz = biz, taskKey = key } }
            }
        end
    end

    if #menu == 0 then
        return QBCore.Functions.Notify("No tasks available!", "error")
    end

    exports['qb-menu']:openMenu(menu)
end

RegisterNetEvent("prp-businesses:client:taskChosen", function(data)
    local biz     = data.biz
    local taskKey = data.taskKey
    local task    = Config.businesses[biz].Tasks[taskKey]
    if not task   then return end

    -- Waypoint to the closest spot (even for single‑spot tasks)
    local closest = task.spots[1]
    local pc      = GetEntityCoords(PlayerPedId())
    for _, s in ipairs(task.spots) do
        if #(s.pos - pc) < #(closest.pos - pc) then closest = s end
    end
    if closest and closest.pos then
        SetNewWaypoint(closest.pos.x, closest.pos.y)
    end

    QBCore.Functions.Notify("Location set on your map.", "info")
end)
---------------------------------------------------------------------

---------------------------------------------------------------------
--  TARGET ZONES
---------------------------------------------------------------------
local function registerTargets()
    for biz, data in pairs(Config.businesses) do
        -- task action zones
        for taskKey, task in pairs(data.Tasks or {}) do
            for i, spot in ipairs(task.spots) do
                exports.ox_target:addBoxZone({
                    coords   = spot.pos,
                    size     = vec3(spot.length, spot.width, 3.0),
                    rotation = spot.heading,
                    minZ     = spot.minZ,
                    maxZ     = spot.maxZ,
                    options  = { {
                        label    = task.label,
                        icon     = "fas fa-hand",
                        distance = 1.5,
                        onSelect = function()
                            if (QBCore.Functions.GetPlayerData().job.name) ~= biz then
                                return QBCore.Functions.Notify("You don't work here!", "error")
                            end
                            startTask(biz, taskKey, task, i) -- NB: i == spotIndex
                        end
                    } }
                })
            end
        end

        -- task board target
        if data.TaskBoard then
            exports.ox_target:addBoxZone({
                coords   = data.TaskBoard.coords,
                size     = vec3(0.8, 0.8, 1.0),
                rotation = 0.0,
                options  = { {
                    label    = data.TaskBoard.label or "View Tasks",
                    icon     = data.TaskBoard.icon  or "fas fa-clipboard",
                    distance = 1.5,
                    onSelect = function() openTaskMenu(biz) end
                } }
            })
        end
    end
end
CreateThread(registerTargets)

---------------------------------------------------------------------
--  RECEIVE SERVER TASK CACHE
---------------------------------------------------------------------
RegisterNetEvent('prp-businesses:taskCache', function(cache)
    taskCache = cache
end)
