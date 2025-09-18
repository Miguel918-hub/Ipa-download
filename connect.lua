local Connect = {}

-- Aqui você pode colocar conexão com DataStore ou servidor de dados
Connect.DataStoreService = game:GetService("DataStoreService")
Connect.HubDataStore = Connect.DataStoreService:GetDataStore("NexusHubData")

function Connect.SaveData(player, key, value)
    local success, err = pcall(function()
        Connect.HubDataStore:SetAsync(player.UserId .. "_" .. key, value)
    end)
    if not success then
        warn("Erro ao salvar dados: "..err)
    end
end

function Connect.LoadData(player, key)
    local success, data = pcall(function()
        return Connect.HubDataStore:GetAsync(player.UserId .. "_" .. key)
    end)
    if success then
        return data
    else
        warn("Erro ao carregar dados: "..data)
        return nil
    end
end

return Connect
