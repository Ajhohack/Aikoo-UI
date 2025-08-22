local module = {}

function module.CreateSwitch(parent, title, default, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, -10, 0, 40)
    Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    Frame.BackgroundTransparency = 0.25
    Frame.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = Frame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.7, 0, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = title
    Label.TextColor3 = Color3.fromRGB(255,255,255)
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 18
    Label.Parent = Frame

    local Toggle = Instance.new("TextButton")
    Toggle.Size = UDim2.new(0.25, 0, 0.6, 0)
    Toggle.Position = UDim2.new(0.7, 0, 0.2, 0)
    Toggle.Text = default and "ON" or "OFF"
    Toggle.BackgroundColor3 = default and Color3.fromRGB(0,200,100) or Color3.fromRGB(200,50,50)
    Toggle.Parent = Frame

    Toggle.MouseButton1Click:Connect(function()
        default = not default
        Toggle.Text = default and "ON" or "OFF"
        Toggle.BackgroundColor3 = default and Color3.fromRGB(0,200,100) or Color3.fromRGB(200,50,50)
        if callback then callback(default) end
    end)

    return Frame
end

return module
