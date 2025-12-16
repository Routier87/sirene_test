local sireneActive = false

RegisterNetEvent("sirene:play")
AddEventHandler("sirene:play", function()
    if sireneActive then return end
    sireneActive = true

    CreateThread(function()
        local dureeSirene = 91000 -- durée du .ogg

        for i = 1, 3 do
            if not sireneActive then break end

            SendNUIMessage({ action = "play" })
            Wait(dureeSirene)

            if i < 3 then
                Wait(5000)
            end
        end

        sireneActive = false
    end)
end)

RegisterNetEvent("sirene:stop")
AddEventHandler("sirene:stop", function()
    sireneActive = false
    SendNUIMessage({ action = "stop" })
end)

-- === COMMANDES ===

RegisterCommand("sirenon", function()
    TriggerServerEvent("sirene:on")
end, false)

RegisterCommand("sirenoff", function()
    TriggerServerEvent("sirene:off")
end, false)

-- === SUGGESTIONS CHAT (boutons visibles) ===
CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/sirenon', '🔊 SIREN ON – Lancer la sirène nationale')
    TriggerEvent('chat:addSuggestion', '/sirenoff', '⛔ SIREN OFF – Couper la sirène immédiatement')
end)
