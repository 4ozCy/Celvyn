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

local flying = false
local flySpeed = 50
local flyGyro = nil
local bodyVelocity = nil

local FlySpeedSlider = Tab:CreateSlider({
    Name = "Fly Speed",
    Range = {0, 200},
    Increment = 5,
    CurrentValue = flySpeed,
    Callback = function(Value)
        flySpeed = Value
    end
}, "FlySpeedSlider")

local ToggleFly = Tab:CreateToggle({
    Name = "Fly Mode",
    Description = "Enable to fly",
    CurrentValue = false,
    Callback = function(Value)
        flying = Value
        toggleFly()
    end
})

local function toggleFly()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
    if flying then
        createFlyGyroAndVelocity(humanoidRootPart)
    else
        removeFlyGyroAndVelocity()
    end
end

local function createFlyGyroAndVelocity(humanoidRootPart)
    flyGyro = Instance.new("BodyGyro")
    bodyVelocity = Instance.new("BodyVelocity")

    flyGyro.MaxTorque = Vector3.new(400000, 400000, 400000)
    flyGyro.CFrame = humanoidRootPart.CFrame
    flyGyro.P = 30000
    flyGyro.D = 1000
    flyGyro.Parent = humanoidRootPart

    bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.Parent = humanoidRootPart

    while flying and humanoidRootPart do
        local direction = Vector3.new(0, 0, 0)
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
            direction = direction + humanoidRootPart.CFrame.LookVector
        end
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
            direction = direction - humanoidRootPart.CFrame.LookVector
        end
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
            direction = direction - humanoidRootPart.CFrame.RightVector
        end
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
            direction = direction + humanoidRootPart.CFrame.RightVector
        end

        bodyVelocity.Velocity = direction * flySpeed
        flyGyro.CFrame = humanoidRootPart.CFrame
        wait(0.1)
    end
end

local function removeFlyGyroAndVelocity()
    if flyGyro then
        flyGyro:Destroy()
    end
    if bodyVelocity then
        bodyVelocity:Destroy()
    end
end
