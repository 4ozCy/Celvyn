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
    LogoID = "",
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
        SaveInRoot = true,
        SaveKey = true,
        Key = {"Celvyn"},
        SecondAction = {
            Enabled = true,
            Type = "Link",
            Parameter = ""
        }
    }
})

Window:CreateHomeTab({
    SupportedExecutors = {},
    DiscordInvite = "1234",
    Icon = 2,
})

local Tab = Window:CreateTab({
    Name = "Universe",
    Icon = "view_in_ar",
    ImageSource = "Material",
    ShowTitle = true
})

local Label = Tab:CreateLabel({
    Text = "Universe",
    Style = 1
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
