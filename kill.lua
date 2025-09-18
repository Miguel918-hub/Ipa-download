local KillModule = {}
local PlayerList = require(script.Parent.playerList)
local Notifications = require(script.Parent.Parent.utils.notifications)

function KillModule.KillPlayer(plr)
    if not PlayerList.IsActive(plr) then
        Notifications.ShowError("Erro: jogador não está usando o Hub")
        return
    end
    local character = plr.Character
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid.Health = 0
        Notifications.Show("Você eliminou: "..plr.Name)
    end
end

return KillModule
