-- I am assuming the distance is in meters? No idea honestly. All you have to do is change the coords and the
-- distance which you want to be covered. The distance is the RADIUS of a circle. So if you do 50, it will be a 100(unit) diameter.
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local player = GetPlayerPed( -1 )
        local pedpos = GetEntityCoords(player)
        local inzone = 0
        local dist = GetDistanceBetweenCoords(pedpos,1847.916015625,3675.8190917968,33.767009735108,true)
        
        if GetDistanceBetweenCoords(pedpos,1847.916015625,3675.8190917968,33.767009735108,true) <= 50.0 then
            inzone = 1
        elseif GetDistanceBetweenCoords(pedpos,1847.916015625,3675.8190917968,33.767009735108,true) >= 50.1 then
            inzone = 0
        end
        
        if inzone == 1 then
            SetEntityInvincible(player,true)
            DrawMissionText2("You are in a ~g~Safe Zone~w~.", 5000)
        elseif inzone == 0 then
            SetEntityInvincible(player,false)
            DrawMissionText2("You are ~r~NO LONGER~w~ in a ~g~Safe Zone~w~.", 5000)
        end
    end
end)

function DrawMissionText2(m_text, showtime)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(m_text)
    DrawSubtitleTimed(showtime, 1)
end
