local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/4ozCy/Celvyn/refs/heads/main/0x37.lua"))()

local window = a:Window("Teleport Menu")

local function teleportToPlayer(playerName)
    local targetPlayer = b.Players:FindFirstChild(playerName)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local localPlayer = b.Players.LocalPlayer
        if localPlayer and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
            localPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
        end
    else
        warn("Player not found or invalid target")
    end
end

local playerTextbox = window:Textbox("Player Name:", "Enter player name...", function(text)
    playerName = text
end)
window:Button("Teleport", function()
    teleportToPlayer(playerName)
end)
