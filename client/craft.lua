local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('prp-businesses:open:craft', function(data)
    local menu = {
        {
            header = "Crafting table",
            isMenuHeader = true
        },
    }  
    for k, v in pairs(Config.businesses[data.job]['Craft'][data.craft].items) do
        menu[#menu+1] = {
            header = v.label,
            txt = "Required items: "..v.requiredLabel.."$",
            icon = "fa-solid fa-drumstick-bite",
            params = {
                event = "prp-businesses:craft:item",
                args = {
                    required = v.required,
                    result = v.result
                }
            }
        }               
    end
    menu[#menu+1] = {
        header = "< close",      
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent("prp-businesses:craft:item", function(data)
    QBCore.Functions.TriggerCallback('prp-businesses:can:craft:item', function(result)
        if not result then 
            QBCore.Functions.Notify('You don\'t have all required items to craft this item', 'error', 7500)
        else
            QBCore.Functions.Progressbar('prp-businesses:crafting', 'Crafting...', 5000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = 'anim@gangops@facility@servers@',
                anim = 'hotwire',
                flags = 16,
            }, {}, {}, function() 
                ClearPedTasks(PlayerPedId())
                TriggerServerEvent('prp-business:craft:item', data)
            end, function()
                ClearPedTasks(PlayerPedId())
            end)
        end
    end, data)
end)