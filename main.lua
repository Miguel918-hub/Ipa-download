local Config = require(script.config)
local PlayerList = require(script.modules.playerList)
local KillModule = require(script.modules.kill)
local Notifications = require(script.utils.notifications)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Tela de carregamento
local function LoadingScreen()
    local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
    local Frame = Instance.new("Frame", ScreenGui)
    Frame.Size = UDim2.new(1,0,1,0)
    Frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
    local TextLabel = Instance.new("TextLabel", Frame)
    TextLabel.Size = UDim2.new(1,0,1,0)
    TextLabel.TextColor3 = Color3.fromRGB(0,255,0)
    TextLabel.Text = "Carregando Nexus Hub...\n01010101..."
    TextLabel.TextScaled = true
    wait(2)
    ScreenGui:Destroy()
end

-- Hub principal
local function CreateHub()
    local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
    local HubFrame = Instance.new("Frame", ScreenGui)
    HubFrame.Size = UDim2.new(0, 300, 0, 400)
    HubFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
    HubFrame.BackgroundColor3 = Config.HubColor

    local NameLabel = Instance.new("TextLabel", HubFrame)
    NameLabel.Size = UDim2.new(1,0,0,50)
    NameLabel.Text = Config.HubName
    NameLabel.TextColor3 = Color3.fromRGB(255,255,255)
    NameLabel.TextScaled = true
    NameLabel.BackgroundTransparency = 1

    -- Lista de jogadores
    local PlayerListFrame = Instance.new("ScrollingFrame", HubFrame)
    PlayerListFrame.Size = UDim2.new(1, -10, 0, 200)
    PlayerListFrame.Position = UDim2.new(0,5,0,60)
    PlayerListFrame.BackgroundTransparency = 0.5

    for i, plr in ipairs(Players:GetPlayers()) do
        PlayerList.RegisterPlayer(plr)
        local btn = Instance.new("TextButton", PlayerListFrame)
        btn.Size = UDim2.new(1, -10, 0, 30)
        btn.Position = UDim2.new(0,5,0,(i-1)*35)
        btn.Text = plr.Name
        btn.MouseButton1Click:Connect(function()
            KillModule.KillPlayer(plr)
        end)
    end
end

-- Execução
LoadingScreen()
CreateHub()
