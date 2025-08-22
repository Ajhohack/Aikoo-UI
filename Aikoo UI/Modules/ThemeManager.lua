-- ThemeManager.lua
local ThemeManager = {}

ThemeManager.CurrentTheme = "Navy"

local themes = {
    Navy = {
        glass = Color3.fromRGB(40, 50, 70),
        textPrimary = Color3.fromRGB(255,255,255),
        neon = Color3.fromRGB(0,255,150),
    },
    Silver = {
        glass = Color3.fromRGB(180, 180, 190),
        textPrimary = Color3.fromRGB(30,30,30),
        neon = Color3.fromRGB(0,200,255),
    },
    Purple = {
        glass = Color3.fromRGB(70, 40, 90),
        textPrimary = Color3.fromRGB(255,255,255),
        neon = Color3.fromRGB(255,0,255),
    }
}

function ThemeManager:SetTheme(name)
    if themes[name] then
        self.CurrentTheme = name
    end
end

function ThemeManager:GetColor(type)
    return themes[self.CurrentTheme][type]
end

return ThemeManager
