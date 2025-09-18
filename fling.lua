local Fling = {}

function Fling.Player(plr)
    local char = plr.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local hrp = char.HumanoidRootPart
        hrp.Velocity = Vector3.new(0,500,0)
    end
end

return Fling
