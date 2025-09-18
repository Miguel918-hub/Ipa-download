-- database/connect.lua
-- Conexão com PostgreSQL para Nexus Hub || Admin
-- Requer suporte a LuaSocket ou algum wrapper de PostgreSQL no executor

local pgsql = {}

-- Configurações do banco (altere para os seus dados)
pgsql.host = "localhost"       -- IP ou hostname do servidor PostgreSQL
pgsql.port = 5432              -- Porta padrão do PostgreSQL
pgsql.user = "seu_usuario"     -- Usuário do banco
pgsql.password = "sua_senha"   -- Senha do usuário
pgsql.database = "nexushub"    -- Nome do banco de dados

-- Função para criar a conexão
function pgsql.connect()
    local success, db
    pcall(function()
        -- Dependendo do executor, você pode usar luasocket + luasql-postgres
        local luasql = require("luasql.postgres")  -- Certifique-se de ter o módulo disponível
        local env = luasql.postgres()
        db = env:connect(pgsql.database, pgsql.user, pgsql.password, pgsql.host, pgsql.port)
        success = true
    end)
    if not success then
        warn("Erro ao conectar ao PostgreSQL!")
        return nil
    end
    print("Conexão com PostgreSQL estabelecida com sucesso!")
    return db
end

return pgsql
