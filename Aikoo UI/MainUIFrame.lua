-- MainUIFrame.lua
local Utility = require(script.Parent.Modules.Utility)
local ThemeManager = require(script.Parent.Modules.ThemeManager)
local UIComponents = require(script.Parent.Modules.UIComponents)

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "AikooXUI"
gui.Parent = game:GetService("CoreGui")

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 750, 0, 500)
mainFrame.Position = UDim2.new(0.5, -375, 0.5, -250)
mainFrame.BackgroundColor3 = ThemeManager:GetColor("glass")
mainFrame.BackgroundTransparency = 0.15
mainFrame.Parent = gui

Utility:ApplyCorner(mainFrame, 16)
Utility:ApplyBlur(true)

-- Drag system
Utility:MakeDraggable(mainFrame)

-- Topbar
local topbar = UIComponents:CreateTopbar(mainFrame, {
    Title = "Aikoo X Lua",
    OnMinimize = function()
        mainFrame.Visible = false
        Utility:ApplyBlur(false)
    end,
    OnClose = function()
        gui:Destroy()
        Utility:ApplyBlur(false)
    end
})

-- Sidebar (navigasi kiri)
local sidebar = UIComponents:CreateSidebar(mainFrame, {
    {Name="Home", Icon="rbxassetid://..."},
    {Name="Main", Icon="rbxassetid://..."},
    {Name="Inventory", Icon="rbxassetid://..."},
    {Name="Shop", Icon="rbxassetid://..."},
    {Name="Settings", Icon="rbxassetid://..."},
})

-- Default buka halaman Home
require(script.Parent.Pages.Home)(mainFrame)
