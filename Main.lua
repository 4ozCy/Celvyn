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
}, "PlayerSpeed")

local flying = false
local flySpeed = 16

local Slider = Tab:CreateSlider({
	Name = "Fly Speed",
	Range = {0, 200},
	Increment = 1,
	CurrentValue = 16,
	Callback = function(Value)
		flySpeed = Value
	end
})

local Toggle = Tab:CreateToggle({
	Name = "Fly Mode",
	Description = nil,
	CurrentValue = false,
	Callback = function(Value)
		flying = Value
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local root = character:WaitForChild("HumanoidRootPart")

		if flying then
			local UIS = game:GetService("UserInputService")
			local moveDirection = Vector3.new(0, 0, 0)

			local function updateDirection()
				moveDirection = Vector3.new(0, 0, 0)
				if UIS:IsKeyDown(Enum.KeyCode.W) or UIS:IsKeyDown(Enum.KeyCode.ButtonR2) then
					moveDirection = moveDirection + root.CFrame.LookVector
				end
				if UIS:IsKeyDown(Enum.KeyCode.S) or UIS:IsKeyDown(Enum.KeyCode.ButtonL2) then
					moveDirection = moveDirection - root.CFrame.LookVector
				end
				if UIS:IsKeyDown(Enum.KeyCode.A) or UIS:IsKeyDown(Enum.KeyCode.Thumbstick1) then
					moveDirection = moveDirection - root.CFrame.RightVector
				end
				if UIS:IsKeyDown(Enum.KeyCode.D) or UIS:IsKeyDown(Enum.KeyCode.Thumbstick2) then
					moveDirection = moveDirection + root.CFrame.RightVector
				end
			end

			while flying and root do
				updateDirection()
				root.Velocity = moveDirection * flySpeed
				task.wait()
			end
			root.Velocity = Vector3.new(0, 0, 0)
		end
	end
})
