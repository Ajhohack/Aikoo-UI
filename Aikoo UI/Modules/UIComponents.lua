-- UIComponents.lua
local Utility = require(script.Parent.Utility)
local ThemeManager = require(script.Parent.ThemeManager)
local Components = {}

-- Topbar
function Components:CreateTopbar(parent, props)
    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(1,0,0,40)
    bar.BackgroundColor3 = ThemeManager:GetColor("glass")
    bar.Parent = parent
    Utility:ApplyCorner(bar, 12)

    -- Title
    local title = Instance.new("TextLabel")
    title.Text = props.Title or "UI"
    title.Size = UDim2.new(1,-80,1,0)
    title.Position = UDim2.new(0,10,0,0)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextSize = 18
    title.TextColor3 = ThemeManager:GetColor("textPrimary")
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = bar

    -- Minimize
    local minBtn = Instance.new("TextButton")
    minBtn.Size = UDim2.new(0,40,1,0)
    minBtn.Position = UDim2.new(1,-80,0,0)
    minBtn.Text = "_"
    minBtn.Font = Enum.Font.GothamBold
    minBtn.TextSize = 20
    minBtn.BackgroundTransparency = 1
    minBtn.TextColor3 = ThemeManager:GetColor("textPrimary")
    minBtn.Parent = bar
    minBtn.MouseButton1Click:Connect(function()
        if props.OnMinimize then props.OnMinimize() end
    end)

    -- Close
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0,40,1,0)
    closeBtn.Position = UDim2.new(1,-40,0,0)
    closeBtn.Text = "X"
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 20
    closeBtn.BackgroundTransparency = 1
    closeBtn.TextColor3 = ThemeManager:GetColor("textPrimary")
    closeBtn.Parent = bar
    closeBtn.MouseButton1Click:Connect(function()
        if props.OnClose then props.OnClose() end
    end)

    return bar
end

-- Sidebar
function Components:CreateSidebar(parent, items)
    local side = Instance.new("Frame")
    side.Size = UDim2.new(0,80,1,-40)
    side.Position = UDim2.new(0,0,0,40)
    side.BackgroundColor3 = ThemeManager:GetColor("glass")
    side.Parent = parent
    Utility:ApplyCorner(side, 16)

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0,12)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.VerticalAlignment = Enum.VerticalAlignment.Top
    layout.Parent = side

    for _, item in ipairs(items) do
        local btn = Instance.new("ImageButton")
        btn.Size = UDim2.new(0,48,0,48)
        btn.Image = item.Icon
        btn.Name = item.Name
        btn.BackgroundTransparency = 1
        btn.Parent = side
    end

    return side
end

return Components
