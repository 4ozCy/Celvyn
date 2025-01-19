local Luna = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/main/source.lua", true))()

Luna:Notification({
    Title = "Celvyn hub",
    Icon = "notifications_active",
    ImageSource = "Material",
    Content = "Enjoyyyyyy"
})

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local FPSTextLabel = Instance.new("TextLabel")
FPSTextLabel.Size = UDim2.new(0, 200, 0, 30)
FPSTextLabel.Position = UDim2.new(0, 10, 0, 10)
FPSTextLabel.BackgroundTransparency = 1
FPSTextLabel.TextColor3 = Color3.fromRGB(144, 238, 144)
FPSTextLabel.TextScaled = true
FPSTextLabel.Font = Enum.Font.PatrickHand
FPSTextLabel.Parent = ScreenGui

local UIS = game:GetService("UserInputService")
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    FPSTextLabel.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

FPSTextLabel.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = FPSTextLabel.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

FPSTextLabel.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

local function updateFPS()
    local lastTime = tick()
    local frameCount = 0
    
    game:GetService("RunService").RenderStepped:Connect(function()
        frameCount = frameCount + 1
        local currentTime = tick()
        if currentTime - lastTime >= 1 then
            local fps = frameCount / (currentTime - lastTime)
            FPSTextLabel.Text = string.format("fps:%.2f", fps)
            frameCount = 0
            lastTime = currentTime
        end
    end)
end

updateFPS()

local Window = Luna:CreateWindow({
    Name = "Celvyn",
    Subtitle = "Beta",
    LogoID = "119663846201777",
    LoadingEnabled = false,
    LoadingTitle = "Celvyn hub",
    LoadingSubtitle = "by Chatgpt & Copilot",
    ConfigSettings = {
        RootFolder = nil,
        ConfigFolder = "Celvyn Hub"
    },
    KeySystem = false,
    KeySettings = {
        Title = "Celvyn hub Key",
        Subtitle = "Key System",
        Note = "it easy",
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

Window:CreateHomeTab({
    SupportedExecutors = {},
    DiscordInvite = "123",
    Icon = 2,
})

local Tab = Window:CreateTab({
    Name = "Main",
    Icon = "view_in_ar",
    ImageSource = "Material",
    ShowTitle = true
})

local noclip = false
local function enableNoclip()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") and part.CanCollide then
            part.CanCollide = false
        end
    end
end

local function disableNoclip()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") and not part.CanCollide then
            part.CanCollide = true
        end
    end
end

local Toggle = Tab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Callback = function(Value)
        noclip = Value
        if noclip then
            enableNoclip()
        else
            disableNoclip()
        end
    end
})

local antiAFK = false
local connections = {}

local function enableAntiAFK()
    local vu = game:GetService("VirtualUser")
    connections[#connections + 1] = game:GetService("Players").LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
end

local function disableAntiAFK()
    for _, connection in ipairs(connections) do
        connection:Disconnect()
    end
    connections = {}
end

local Toggle = Tab:CreateToggle({
    Name = "Anti-AFK",
    CurrentValue = false,
    Callback = function(Value)
        antiAFK = Value
        if antiAFK then
            enableAntiAFK()
        else
            disableAntiAFK()
        end
    end
})

Tab:CreateDivider()

local TeleportButton = Tab:CreateButton({
    Name = "Teleport to Player",
    Description = nil,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/4ozCy/Celvyn/refs/heads/main/tp.lua"))()
    end
})

local Button = Tab:CreateButton({
    Name = "Unc Test",
    Description = nil,
    Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-UNC-Test-13114"))()
  end
})

local Button = Tab:CreateButton({
  Name = "low-gfx",
  Callback = function()
  local ToDisable = {
	Textures = true,
	VisualEffects = true,
	Parts = true,
	Particles = true,
	Sky = true
}

local ToEnable = {
	FullBright = false
}

local Stuff = {}

for _, v in next, game:GetDescendants() do
	if ToDisable.Parts then
		if v:IsA("Part") or v:IsA("Union") or v:IsA("BasePart") then
			v.Material = Enum.Material.SmoothPlastic
			table.insert(Stuff, 1, v)
		end
	end
	
	if ToDisable.Particles then
		if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Explosion") or v:IsA("Sparkles") or v:IsA("Fire") then
			v.Enabled = false
			table.insert(Stuff, 1, v)
		end
	end
	
	if ToDisable.VisualEffects then
		if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("SunRaysEffect") then
			v.Enabled = false
			table.insert(Stuff, 1, v)
		end
	end
	
	if ToDisable.Textures then
		if v:IsA("Decal") or v:IsA("Texture") then
			v.Texture = ""
			table.insert(Stuff, 1, v)
		end
	end
	
	if ToDisable.Sky then
		if v:IsA("Sky") then
			v.Parent = nil
			table.insert(Stuff, 1, v)
		end
	end
end

game:GetService("TestService"):Message("Effects Disabler Script : Successfully disabled "..#Stuff.." assets / effects. Settings :")

for i, v in next, ToDisable do
	print(tostring(i)..": "..tostring(v))
end

if ToEnable.FullBright then
    local Lighting = game:GetService("Lighting")
    
    Lighting.FogColor = Color3.fromRGB(255, 255, 255)
    Lighting.FogEnd = math.huge
    Lighting.FogStart = math.huge
    Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    Lighting.Brightness = 5
    Lighting.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
    Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
    Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    Lighting.Outlines = true
        end
   end
})

local Button = Tab:CreateButton({
   Name = "Tpwalk",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TheRealXORA/Roblox/refs/heads/Main/Scripts%20/Universal%20/Tpwalk.lua"))()
  end
});

Tab:CreateDivider()

local Button = Tab:CreateButton({
   Name = "Aimbot & Esp",
   Description = nil,
   Callback = function()
local function get(url)
    local script = game:HttpGet(url, true)
    loadstring(script)()
end

get("https://raw.githubusercontent.com/4ozCy/Script-hub/main/esp.lua")
get("https://raw.githubusercontent.com/4ozCy/Script-hub/main/aimbot.lua")
  end
})

local Button = Tab:CreateButton({
  Name = "Arrow esp",
  Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Eazvy/UILibs/refs/heads/main/ESP/Arrows/Example"))()
    end
})
        
Tab:CreateDivider()

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

local Slider = Tab:CreateSlider({
    Name = "Field of View",
    Range = {70, 120},
    Increment = 1,
    CurrentValue = workspace.CurrentCamera.FieldOfView,
    Callback = function(Value)
        workspace.CurrentCamera.FieldOfView = Value
    end
})


Tab:CreateDivider()

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

local Button = Tab:CreateButton({
   Name = "Rejoin",
   Description = nil,
   Callback = function()
   game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
    end 
})

local Button = Tab:CreateButton({
   Name = "Server Hop",
   Description = nil,
   Callback = function()
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function getServerList()
    local servers = {}
    local success, result = pcall(function()
        return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
    end)
    if success then
        for _, server in pairs(result.data) do
            if server.playing < server.maxPlayers then
                table.insert(servers, {id = server.id, players = server.playing})
            end
        end
        table.sort(servers, function(a, b) return a.players < b.players end)
    end
    return servers
end

local function serverHop()
    local servers = getServerList()
    if #servers > 0 then
        TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[1].id, LocalPlayer)
    else
       Luna:Notification({
    Title = "Celvyn hub",
    Icon = "notifications_active",
    ImageSource = "Material",
    Content = "no server available"
})
    end
end
         
serverHop()
    end
})

local Button = Tab:CreateButton({
  Name = "Server hop least ping",
  Callback = function()
  local HTTPService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local StatsService = game:GetService("Stats")

local function fetchServersData(placeId, limit)
    local url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?limit=%d", placeId, limit)
    local success, response = pcall(function()
        return HTTPService:JSONDecode(game:HttpGet(url))
    end)

    if success and response and response.data then
        return response.data
    end

    return nil
end

local placeId = game.PlaceId
local serverLimit = 100
local servers = fetchServersData(placeId, serverLimit)

if not servers then
    return
end

local lowestPingServer = servers[1]

for _, server in pairs(servers) do
    if server["ping"] < lowestPingServer["ping"] and server.maxPlayers > server.playing then
        lowestPingServer = server
    end
end

local commonLoadTime = 5
task.wait(commonLoadTime)

local pingThreshold = 100
local serverStats = StatsService.Network.ServerStatsItem
local dataPing = serverStats["Data Ping"]:GetValueString()
local pingValue = tonumber(dataPing:match("(%d+)"))

if pingValue >= pingThreshold then
    TeleportService:TeleportToPlaceInstance(placeId, lowestPingServer.id)
else
   end 
  end 
})

local mTab = Window:CreateTab({
    Name = "Music",
    Icon = "library_music",
    ImageSource = "Material",
    ShowTitle = true
})

mTab:CreateDivider()

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
local Pitch = 1

local function playRandomMusic()
    if not Sound or not Sound:IsDescendantOf(game.Workspace) then
        Sound = Instance.new("Sound", game.Workspace)
    end
    Sound.SoundId = "rbxassetid://" .. MusicIDs[math.random(1, #MusicIDs)]
    Sound.Volume = Volume
    Sound.PlaybackSpeed = Pitch
    Sound:Play()
    Sound.Ended:Connect(function()
        if IsPlayingMusic then
            playRandomMusic()
        end
    end)
end

local Toggle = mTab:CreateToggle({
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

local Toggle = mTab:CreateToggle({
    Name = "Loop Music",
    CurrentValue = false,
    Callback = function(Value)
        LoopMusic = Value
        if Sound then
            Sound.Looped = LoopMusic
        end
    end
})

local Slider = mTab:CreateSlider({
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

local Slider = mTab:CreateSlider({
    Name = "Pitch",
    Range = {0.5, 2},
    Increment = 0.1,
    CurrentValue = Pitch,
    Callback = function(Value)
        Pitch = Value
        if Sound then
            Sound.PlaybackSpeed = Pitch
        end
    end
})

local Button = mTab:CreateButton({
    Name = "Skip",
    Description = nil,
    Callback = function()
        if Sound then
            Sound:Stop()
            playRandomMusic()
        end
    end   
})
