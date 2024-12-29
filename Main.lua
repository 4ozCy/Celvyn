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
        RootFolder = true,
        ConfigFolder = "Celvyn Hub"
    },
    KeySystem = true,
    KeySettings = {
        Title = "Celvyn hub Key",
        Subtitle = "Key System",
        Note = "it easy",
        SaveInRoot = true,
        SaveKey = true,
        Key = {"Celvyn"},
        SecondAction = {
            Enabled = true,
            Type = "Link",
            Parameter = "https://celvyn.vercel.app/getkey.html"
        }
    }
})

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

local function getMusicIDs()
    local musicIDs = {}
    local file = game:HttpGet("https://raw.githubusercontent.com/4ozCy/Celvyn/main/music_ids.txt")
    for line in file:gmatch("[^\r\n]+") do
        table.insert(musicIDs, tonumber(line))
    end
    return musicIDs
end

local MusicIDs = getMusicIDs()
local IsPlayingMusic = false
local Sound
local Volume = 1

local function playRandomMusic()
    if not Sound or not Sound:IsDescendantOf(game.Workspace) then
        Sound = Instance.new("Sound", game.Workspace)
    end
    Sound.SoundId = "rbxassetid://" .. MusicIDs[math.random(1, #MusicIDs)]
    Sound.Volume = Volume
    Sound:Play()
    Sound.Ended:Connect(function()
        if IsPlayingMusic then
            playRandomMusic()
        end
    end)
end

local Toggle = Tab:CreateToggle({
    Name = "Play Random Music",
    CurrentValue = false,
    Callback = function(Value)
        IsPlayingMusic = Value
        if IsPlayingMusic then
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

local Button = Tab:CreateButton({
    Name = "Skip",
    Description = nil,
    Callback = function()
        if Sound then
            Sound:Stop()
            playRandomMusic()
        end
    end
})
