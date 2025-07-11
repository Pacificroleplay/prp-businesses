local QBCore = exports['qb-core']:GetCoreObject()
local PlayerJob, OnDuty = {}, false
local zoneHandles = {}

---@param job string
---@param z table
local function buildZone(job, z)
    local opts = {
        debug    = z.debug or Config.Debug or false,
        inside   = function() end,
        onExit   = function()
            if PlayerJob.name == job and OnDuty then
                TriggerServerEvent('QBCore:ToggleDuty')
                lib.notify({ description = ('You left %s and are now off duty.'):format(job), type = 'inform' })
            end
        end
    }

    if lib and lib.zones then
        if z.type == 'poly' and z.points then
            opts.thickness = (z.maxZ or z.minZ + 10) - (z.minZ or 0)
            opts.points    = z.points
            opts.minZ      = z.minZ or 0
            zoneHandles[#zoneHandles+1] = lib.zones.poly(opts)

        elseif z.type == 'sphere' and z.center and z.radius then
            opts.coords  = z.center
            opts.radius  = z.radius
            zoneHandles[#zoneHandles+1] = lib.zones.sphere(opts)
        end
    end
end

CreateThread(function()
    while not lib do Wait(100) end
    while not LocalPlayer.state.isLoggedIn do Wait(100) end

    for job, business in pairs(Config.businesses) do
        if business.DutyZones then
            for _, z in pairs(business.DutyZones) do
                buildZone(job, z)
            end
        end
    end
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    PlayerJob = job
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    OnDuty = duty
end)

CreateThread(function()
    while true do
        local pdata = QBCore.Functions.GetPlayerData()
        if pdata.job.name then
            PlayerJob = pdata.job
            OnDuty = pdata.job.onduty
            break
        end
        Wait(250)
    end
end)
