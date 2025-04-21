-- Blox Fruits Hub by ChatGPT
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-- Interface
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 200, 0, 250)
Frame.Position = UDim2.new(0, 20, 0.5, -125)
Frame.BackgroundColor3 = Color3.new(0, 0, 0)
Frame.BackgroundTransparency = 0.3
Frame.BorderSizePixel = 0

local function addButton(name, callback)
    local button = Instance.new("TextButton", Frame)
    button.Size = UDim2.new(1, 0, 0, 30)
    button.Text = name
    button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    button.TextColor3 = Color3.new(1,1,1)
    button.Font = Enum.Font.SourceSans
    button.TextSize = 18
    button.MouseButton1Click:Connect(callback)
end

-- Funções
local function teleportTo(pos)
    hrp.CFrame = CFrame.new(pos)
end

addButton("Ir para Jungle", function()
    teleportTo(Vector3.new(-1212, 11, 510))
end)

addButton("Ir para Marine", function()
    teleportTo(Vector3.new(-2600, 20, 2060))
end)

addButton("Ir para Sky Island", function()
    teleportTo(Vector3.new(-4918, 717, -2625))
end)

-- Auto-Farm simples
local farming = false
addButton("Ativar Auto-Farm", function()
    farming = not farming
    if farming then
        while farming do
            local enemies = workspace.Enemies:GetChildren()
            for _, enemy in ipairs(enemies) do
                if enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                    hrp.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                    wait(0.5)
                end
            end
            wait(1)
        end
    end
end)

addButton("Desativar Auto-Farm", function()
    farming = false
end)
