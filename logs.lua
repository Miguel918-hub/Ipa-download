local Logs = {}

function Logs.Add(action, player, executor)
    print(string.format("[NexusHub] %s executado em %s por %s", action, player.Name, executor.Name))
    -- Aqui você pode integrar com Connect para salvar logs no DataStore
end

return Logs
