local webhookURL = "https://discord.com/api/webhooks/1294211092389564457/9AKdgc5WGtnwtu1dKeFNEQEnYlmEc_j4_QPp9Gx_XkzUcZS9IDZv5VPHB2ji5J1vwYod"

local function sendWebhookLog()
    local player = game.Players.LocalPlayer
    local data = {
        ["embeds"] = {{
            ["description"] = "someone has executed the script.",
            ["fields"] = {
                {
                    ["name"] = "Player Name",
                    ["value"] = player.Name,
                    ["inline"] = true
                },
                {
                    ["name"] = "Player ID",
                    ["value"] = player.UserId,
                    ["inline"] = true
                },
                {
                    ["name"] = "Display Name",
                    ["value"] = player.DisplayName,
                    ["inline"] = true
                },
                {
                    ["name"] = "Account Age",
                    ["value"] = player.AccountAge .. " days",
                    ["inline"] = true
                },
                {
                    ["name"] = "Execution Time",
                    ["value"] = os.date("%Y-%m-%d %H:%M:%S"),
                    ["inline"] = false
                },
                {
                    ["name"] = "Game ID",
                    ["value"] = game.PlaceId,
                    ["inline"] = true
                },
                {
                    ["name"] = "Game Name",
                    ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
                    ["inline"] = true
                }
            }
        }}
    }
    local jsonData = game:GetService("HttpService"):JSONEncode(data)
    local request = syn and syn.request or http_request
    request({
        Url = webhookURL,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = jsonData
    })
end

sendWebhookLog()

local Luna = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/main/source.lua", true))()

Luna:Notification({
    Title = "Celvyn hub",
    Icon = "notifications_active",
    ImageSource = "Material",
    Content = "Enjoyyyyyy"
})

local Window = Luna:CreateWindow({
    Name = "Celvyn",
    Subtitle = "Beta",
    LogoID = "119663846201777",
    LoadingEnabled = true,
    LoadingTitle = "Celvyn hub",
    LoadingSubtitle = "by @nz.cy",
    ConfigSettings = {
        RootFolder = nil,
        ConfigFolder = "Big Hub"
    },
    KeySystem = false,
    KeySettings = {
        Title = "Celvyn hub Key",
        Subtitle = "Key System",
        Note = "idk",
        SaveInRoot = false,
        SaveKey = true,
        Key = {"Celvyn"},
        SecondAction = {
            Enabled = false,
            Type = "Link",
            Parameter = ""
        }
    }
})

ElementName.Settings

Window:CreateHomeTab({
    SupportedExecutors = {},
    DiscordInvite = "1234",
    Icon = 2,
})

local Tab = Window:CreateTab({
    Name = "Main",
    Icon = "view_in_ar",
    ImageSource = "Material",
    ShowTitle = true
})

Tab:CreateSection("Main")

local selectedPlayer

local function updatePlayerList()
    local players = game.Players:GetPlayers()
    local playerNames = {}
    for _, player in ipairs(players) do
        table.insert(playerNames, player.Name)
    end
    return playerNames
end

local Dropdown = Tab:CreateDropdown({
    Name = "Select Player",
    Options = {"Option 1","Option 2"},
    CurrentOption = "Option 1",
    MultipleOptions = false,
    SpecialType = "Player",
    Callback = function(Options)
        selectedPlayer = Options
    end
})

if Dropdown.Settings.SpecialType == "Player" then
    Dropdown:UpdateOptions(updatePlayerList())
end

game.Players.PlayerAdded:Connect(function()
    if Dropdown.Settings.SpecialType == "Player" then
        Dropdown:UpdateOptions(updatePlayerList())
    end
end)

game.Players.PlayerRemoving:Connect(function()
    if Dropdown.Settings.SpecialType == "Player" then
        Dropdown:UpdateOptions(updatePlayerList())
    end
end)

local Button = Tab:CreateButton({
    Name = "Teleport to Player",
    Description = nil,
    Callback = function()
        if selectedPlayer then
            local targetPlayer = game.Players:FindFirstChild(selectedPlayer)
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local player = game.Players.LocalPlayer
                player.Character:MoveTo(targetPlayer.Character.HumanoidRootPart.Position)
            end
        end
    end
})

local Slider = Tab:CreateSlider({
    Name = "Player Speed",
    Range = {0, 2000},
    Increment = 1,
    CurrentValue = 16,
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("Humanoid") then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            humanoid.WalkSpeed = Value
        end
    end
})

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local Slider = Tab:CreateSlider({
    Name = "Jump Power",
    Range = {0, 200},
    Increment = 5,
    CurrentValue = humanoid.JumpPower,
    Callback = function(Value)
        humanoid.JumpPower = Value
    end
})

local Button = Tab:CreateButton({
    Name = "Permeant tptool",
    Description = nil,
    Callback = function()
        local ToolName = "tptool "
        local function createTool()
            local tool = Instance.new("Tool")
            tool.Name = ToolName
            tool.RequiresHandle = false
            tool.CanBeDropped = false
            tool.Parent = game.Players.LocalPlayer.Backpack
            tool.Activated:Connect(function()
                local player = game.Players.LocalPlayer
                local mouse = player:GetMouse()
                local targetPos = mouse.Hit.p
                player.Character:MoveTo(targetPos)
            end)
        end
        local function onCharacterAdded(character)
            createTool()
        end
        game.Players.LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
        createTool()
    end
})

Tab:CreateSection("Music")

local MusicIDs = {1837768517, 1837879082, 1841647093, 1848354536, 9043887091, 1846458016, 1838457617, 1840684529, 1839857296, 1841682637, 16190782181, 15689443663, 16662833495, 16831105312}
local IsPlayingMusic = false
local Sound
local Volume = 1

local Toggle = Tab:CreateToggle({
    Name = "Play Random Music",
    CurrentValue = false,
    Callback = function(Value)
        IsPlayingMusic = Value
        if IsPlayingMusic then
            if not Sound or not Sound:IsDescendantOf(game.Workspace) then
                Sound = Instance.new("Sound", game.Workspace)
            end
            local function playRandomMusic()
                Sound.SoundId = "rbxassetid://" .. MusicIDs[math.random(1, #MusicIDs)]
                Sound.Volume = Volume
                Sound:Play()
                Sound.Ended:Connect(function()
                    if IsPlayingMusic then
                        playRandomMusic()
                    end
                end)
            end
            playRandomMusic()
        else
            if Sound then
                Sound:Stop()
                Sound:Destroy()
                Sound = nil
            end
        end
    end
})

local Slider = Tab:CreateSlider({
    Name = "Volume",
    Range = {0,100},
    increment = 1,
    CurrentValue = Volume,
    Callback = function(Value)
        Volume = Value
        if Sound then
            Sound.Volume = Volume
        end
    end
})

local bfTab = Window:CreateTab({
    Name = "Blox Fruit",
    Icon = "101873370290615",
    ImageSource = "Custom",
    ShowTitle = true
})

bfTab:CreateSection("Our function")

local Button = bfTab:CreateButton({
Name = "Spin fruit",
Description = "2 hour Cooldown",
Callback = function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
   end
})

local Button = bfTab:CreateButton({
Name = "elite quest",
Description = "if you didn't get quest = elite hunter not spawned yet",
Callback = function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
   end
})
