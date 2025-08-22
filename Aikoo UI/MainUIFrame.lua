-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

-- Player
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- UI ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AikooUI"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

-- Blur Effect
local blur = Instance.new("BlurEffect")
blur.Size = 12
blur.Parent = Lighting

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- UICorner
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = mainFrame

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleText = Instance.new("TextLabel")
titleText.Text = "Aikoo UI"
titleText.Size = UDim2.new(1, -80, 1, 0)
titleText.Position = UDim2.new(0, 10, 0, 0)
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.BackgroundTransparency = 1
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 18
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

-- Close Button
local closeBtn = Instance.new("TextButton")
closeBtn.Text = "X"
closeBtn.Size = UDim2.new(0, 40, 1, 0)
closeBtn.Position = UDim2.new(1, -40, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 16
closeBtn.Parent = titleBar

-- Minimize Button
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Text = "-"
minimizeBtn.Size = UDim2.new(0, 40, 1, 0)
minimizeBtn.Position = UDim2.new(1, -80, 0, 0)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 200)
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 16
minimizeBtn.Parent = titleBar

-- Minimized Frame (ikon kecil)
local minimizedFrame = Instance.new("TextButton")
minimizedFrame.Text = "Aikoo UI"
minimizedFrame.Size = UDim2.new(0, 100, 0, 30)
minimizedFrame.Position = UDim2.new(0, 20, 1, -40)
minimizedFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
minimizedFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizedFrame.Font = Enum.Font.GothamBold
minimizedFrame.TextSize = 14
minimizedFrame.Visible = false
minimizedFrame.Parent = screenGui

-- Tween settings
local function tween(obj, props, time)
    TweenService:Create(obj, TweenInfo.new(time, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props):Play()
end

-- Minimize logic
local isMinimized = false
minimizeBtn.MouseButton1Click:Connect(function()
    if not isMinimized then
        tween(mainFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.3)
        blur.Enabled = false -- blur dimatikan pas minimize
        task.wait(0.3)
        mainFrame.Visible = false
        minimizedFrame.Visible = true
        isMinimized = true
    end
end)

-- Restore UI
minimizedFrame.MouseButton1Click:Connect(function()
    if isMinimized then
        mainFrame.Visible = true
        tween(mainFrame, {Size = UDim2.new(0, 400, 0, 300)}, 0.3)
        blur.Enabled = true -- blur aktif lagi pas restore
        minimizedFrame.Visible = false
        isMinimized = false
    end
end)

-- Close UI
closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
    blur:Destroy()
end)
