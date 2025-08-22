-- Utility.lua
local Utility = {}

function Utility:ApplyCorner(obj, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = obj
end

function Utility:ApplyBlur(enable)
    local lighting = game:GetService("Lighting")
    local blur = lighting:FindFirstChild("AikooXUIBlur") or Instance.new("BlurEffect")
    blur.Name = "AikooXUIBlur"
    blur.Size = 15
    blur.Parent = lighting
    blur.Enabled = enable
end

function Utility:MakeDraggable(frame)
    local UIS = game:GetService("UserInputService")
    local dragToggle, dragInput, dragStart, startPos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragToggle = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragToggle and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                                       startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

return Utility
