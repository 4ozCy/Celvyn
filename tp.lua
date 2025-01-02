local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/Revenant", true))()
local Flags = Library.Flags

local Window = Library:Window({
   Text = "Celvyn"
})

local function teleportToPlayer(playerName)
    local targetPlayer = game.Players:FindFirstChild(playerName)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local localPlayer = game.Players.LocalPlayer
        if localPlayer and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
            localPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
        end
    else
        warn("Player not found or invalid target")
    end
end

local selectedPlayerName

local function updatePlayerDropdown()
    local playerNames = {}
    for _, player in pairs(game.Players:GetPlayers()) do
        table.insert(playerNames, player.Name)
    end

    Window:Dropdown({
        Text = "Select Player",
        List = playerNames,
        Callback = function(selectedPlayer)
            selectedPlayerName = selectedPlayer
        end
    })
end

updatePlayerDropdown()

spawn(function()
    while true do
        updatePlayerDropdown()
        wait(5)
    end
end)

Window:Button({
   Text = "Teleport",
   Callback = function()
       teleportToPlayer(selectedPlayerName)
   end
})
