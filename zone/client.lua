-- I am assuming the distance is in meters? No idea honestly. All you have to do is change the coords and the
-- distance which you want to be covered. The distance is the RADIUS of a circle. So if you do 50, it will be a 100(unit) diameter.
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local player = GetPlayerPed( -1 )
        local pedpos = GetEntityCoords(player)
        local inzone = 0
        local dist = GetDistanceBetweenCoords(pedpos,1847.916015625,3675.8190917968,33.767009735108,true)
    
        if dist <= 50.0 then
            inzone = 1
            if not notifIn then
                TriggerEvent("pNotify:SendNotification",{
                    text = "<b style='color:#1E90FF'>You are in a SafeZone</b>",
                    type = "success",
                    timeout = (3000),
                    layout = "bottomcenter",
                    queue = "global"
                })
                notifIn = true
                notifOut = false
            end
        elseif dist >= 50.1 then
            inzone = 0
            if not notifOut then
                TriggerEvent("pNotify:SendNotification",{
                    text = "<b style='color:#1E90FF'>You are in NO LONGER a SafeZone</b>",
                    type = "error",
                    timeout = (3000),
                    layout = "bottomcenter",
                queue = "global"
                })
                notifOut = true
                notifIn = false
            end
        end
        
        if inzone == 1 then
            SetEntityInvincible(player,true)
        elseif inzone == 0 then
            SetEntityInvincible(player,false)
        end
    end
end)

local firstspawn = true

AddEventHandler("playerSpawned", function(spawn)
    if firstSpawn then
        TriggerServerEvent('restartZones')
        firstSpawn = false
    end
end)
    
    function DrawMissionText2(m_text, showtime)
        ClearPrints()
        SetTextEntry_2("STRING")
        AddTextComponentString(m_text)
        DrawSubtitleTimed(showtime, 1)
    end