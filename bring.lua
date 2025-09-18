local Bring = {}
local Players = game:GetService("Players")

function Bring.ToPlayer(target, toPlayer)
    if target.Character and toPlayer.Character then
        target.Character:SetPrimaryPartCFrame(toPlayer.Character.PrimaryPart.CFrame + Vector3.new(0,5,0))
    end
end

return Bring
