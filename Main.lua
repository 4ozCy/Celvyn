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
	LogoID = "88564307965115",
	LoadingEnabled = true,
	LoadingTitle = "Celvyn hub",
	LoadingSubtitle = "by @nz.cy",

	ConfigSettings = {
		RootFolder = nil,
		ConfigFolder = "Big Hub"
	},

	KeySystem = false,
	KeySettings = {
		Title = "Luna Example Key",
		Subtitle = "Key System",
		Note = "Best Key System Ever! Also, Please Use A HWID Keysystem like Pelican, Luarmor etc. that provide key strings based on your HWID since putting a simple string is very easy to bypass",
		SaveInRoot = false,
		SaveKey = true,
		Key = {"Example Key"},
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
	Icon = 1,
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
local camera = game.Workspace.CurrentCamera
local flying = false
local speed = 10

local Slider = Tab:CreateSlider({
    Name = "Fly Speed",
    Range = {0, 500},
    Increment = 1,
    CurrentValue = 10,
    Callback = function(Value)
        speed = Value
    end
})

local Toggle = Tab:CreateToggle({
    Name = "Fly Mode",
    Description = "Toggle flying on/off",
    CurrentValue = false,
    Callback = function(Value)
        flying = Value
        if flying then
            startFlying()
        else
            stopFlying()
        end
    end
})

local function startFlying()
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
    bodyVelocity.Parent = character.PrimaryPart

    local bodyGyro = Instance.new("BodyGyro")
    bodyGyro.MaxTorque = Vector3.new(0, 0, 0)
    bodyGyro.P = 3000
    bodyGyro.Parent = character.PrimaryPart

    player.Character.Humanoid.PlatformStand = true

    game:GetService("RunService").Heartbeat:Connect(function()
        if flying then
            bodyVelocity.Velocity = (camera.CFrame.LookVector * speed)
            bodyGyro.CFrame = CFrame.new(camera.CFrame.p, camera.CFrame.p + camera.CFrame.LookVector)
        end
    end)
end

local function stopFlying()
    player.Character.Humanoid.PlatformStand = false
    for _, v in pairs(character.PrimaryPart:GetChildren()) do
        if v:IsA("BodyVelocity") or v:IsA("BodyGyro") then
            v:Destroy()
        end
    end
end

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

