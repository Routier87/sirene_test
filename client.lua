RegisterCommand("sirene_test", function()
    for i = 1, 3 do
        SendNUIMessage({ action = "play" })
        Wait(100000) -- 1 min 40 s
        if i < 3 then
            Wait(5000) -- pause 5 s
        end
    end
end)
