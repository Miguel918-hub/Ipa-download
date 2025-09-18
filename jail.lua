local Jail = {}
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local jailed = {}

function Jail.JailPlayer(plr)
    if not plr.Character then return end
    local char = plr.Character
    local base = Instance.new("Part", workspace)
    base.Size = Vector3.new(6,6,6)
    base.Position = char.HumanoidRootPart.Position
    base.Anchored = true
    base.Transparency = 0.5
    base.BrickColor = BrickColor.new("Royal purple")
    jailed[plr] = base

    char.HumanoidRootPart.CFrame = base.CFrame + Vector3.new(0,3,0)
end

function Jail.UnjailPlayer(plr)
    if jailed[plr] then
        jailed[plr]:Destroy()
        jailed[plr] = nil
    end
end

return Jail
