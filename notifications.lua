-- Notificações futuristas
local Notifications = {}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

function Notifications.Show(message, title)
    -- Cria notificação simples
    game.StarterGui:SetCore("SendNotification", {
        Title = title or "Nexus Hub",
        Text = message,
        Duration = 3
    })
end

function Notifications.ShowError(message)
    Notifications.Show(message, "Erro")
end

return Notifications
