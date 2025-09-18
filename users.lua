local Users = {}
local Connect = require(script.Parent.connect)

Users.RegisteredPlayers = {}

function Users.Register(player)
    if not Users.RegisteredPlayers[player.UserId] then
        Users.RegisteredPlayers[player.UserId] = {tags = {}, isActive = true}
        Connect.SaveData(player, "NexusHub", Users.RegisteredPlayers[player.UserId])
    end
end

function Users.Get(player)
    return Users.RegisteredPlayers[player.UserId]
end

return Users
