-- Caixa de confirmação Aceitar/Cancelar
local Confirmation = {}

function Confirmation.Ask(title, message, onAccept, onCancel)
    -- Apenas exemplo simples
    local accept = true -- Aqui você faria interface real
    if accept then
        onAccept()
    else
        if onCancel then onCancel() end
    end
end

return Confirmation
