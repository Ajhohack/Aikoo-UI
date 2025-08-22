local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AikooXMainUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = playerGui

-- Blur background
local blur = Instance.new("BlurEffect")
blur.Size = 12
blur.Parent = game:GetService("Lighting")

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 750, 0, 500)
MainFrame.Position = UDim2.new(0.5, -375, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
MainFrame.BackgroundTransparency = 0.35
MainFrame.Parent = ScreenGui

-- Rounded corners
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 24)
UICorner.Parent = MainFrame

-- Drag system
local dragging, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)
MainFrame.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)
MainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Minimize button
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 32, 0, 32)
MinBtn.Position = UDim2.new(1, -70, 0, 10)
MinBtn.Text = "–"
MinBtn.Parent = MainFrame

-- Close button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 32, 0, 32)
CloseBtn.Position = UDim2.new(1, -35, 0, 10)
CloseBtn.Text = "X"
CloseBtn.Parent = MainFrame

-- Bubble (muncul setelah minimize)
local Bubble = Instance.new("TextButton")
Bubble.Size = UDim2.new(0, 50, 0, 50)
Bubble.Position = UDim2.new(0.05, 0, 0.85, 0)
Bubble.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
Bubble.Text = "⚡"
Bubble.Visible = false
Bubble.Parent = ScreenGui

MinBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    Bubble.Visible = true
end)

Bubble.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    Bubble.Visible = false
end)
