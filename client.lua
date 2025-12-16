RegisterCommand("sirene_test", function()
    local dureeSirene = 91000 -- 1 min 31 s (ajuste si besoin)

    for i = 1, 3 do
        SendNUIMessage({ action = "play" })
        Wait(dureeSirene)

        if i < 3 then
            Wait(5000) -- pause 5 secondes entre chaque cycle
        end
    end
end, false)
