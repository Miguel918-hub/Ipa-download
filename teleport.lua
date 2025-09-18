local Teleport = {}
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local PlayerList = require(script.Parent.playerList)

function Teleport.ToServerWithHubUser(player)
    for _, plr in ipairs(Players:GetPlayers()) do
        if PlayerList.IsActive(plr) and plr ~= player then
            local placeId = game.PlaceId
            TeleportService:Teleport(placeId, player)
            return
        end
    end
    warn("Nenhum jogador usando o Hub encontrado em outro servidor!")
end

return Teleport
