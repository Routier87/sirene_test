RegisterNetEvent("sirene_test:play")
AddEventHandler("sirene_test:play", function()
    local dureeSirene = 91000 -- durée réelle du .ogg

    CreateThread(function()
        for i = 1, 3 do
            SendNUIMessage({ action = "play" })
            Wait(dureeSirene)

            if i < 3 then
                Wait(5000)
            end
        end
    end)
end)

RegisterCommand("sirene_test", function()
    TriggerServerEvent("sirene_test:playAll")
end, false)
