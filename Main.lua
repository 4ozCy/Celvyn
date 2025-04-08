local Noti = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()
Noti.new("success", "Welcome To Celvyn!", "Thank you for using our script.", true, 5)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Celvyn - Beta",
   Icon = 119663846201777,
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by Sirius",
   Theme = "Default",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = false
   },

   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})

local Tab = Window:CreateTab("Main", "box")

local Section = Tab:CreateSection("Main")

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

local Section = Tab:CreateSection("Extra Section")

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

local TeleportButton = Tab:CreateButton({
    Name = "Teleport to Player",
    Description = nil,
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/XSmS9zZQ"))()
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
  Name = "disable leaderboard (Permanent)",
  Callback = function()
 local StarterGui = game:GetService("StarterGui")

local function disableLeaderboard()
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
end

disableLeaderboard()

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    disableLeaderboard()
end)
    end 
})		

local Section = Tab:CreateSection("Sider Section")

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

local Field0fView = 70

local Slider = Tab:CreateSlider({
    Name = "Field of View",
    Range = {10, 120},
    Increment = 1,
    CurrentValue = workspace.CurrentCamera.FieldOfView,
    Callback = function(Value)
        workspace.CurrentCamera.FieldOfView = Value
    end
})

local cTab = Window:CreateTab("Combat", "swords")

local Section = cTab:CreateSection("Aimbot Section")

local Button = cTab:CreateButton({
  Name = "Celvyn Aimbot",
  Callback = function()
loadstring(game:HttpGet("https://celvyn.site/aimbot"))()
    end
})

local Section = cTab:CreateSection("Esp Section")

local Button = cTab:CreateButton({
  Name = "Celvyn esp",
  Callback = function()
loadstring(game:HttpGet("https://celvyn.site/esp"))()
    end
})

local Button = cTab:CreateButton({
  Name = "Arrow esp",
  Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/Hsvmj2mw"))()
    end
})

local Button = cTab:CreateButton({
  Name = "Radar esp",
  Callback = function()
loadstring(game:HttpGet('https://pastebin.com/raw/3KMbR7vL', true))()
    end 
})

local sTab = Window:CreateTab("Server", "server")

local selectedOption

local Dropdown = sTab:CreateDropdown({
    Name = "Server Hop Options",
    Options = {"None", "Random Server", "low Player Server", "low ping Server"},
    CurrentOption = {"None"},
    MultipleOptions = false,
    Callback = function(option)
        selectedOption = option
    end
})

local function notify(title, message, duration)
    Noti.new("info", title, message, true, duration or 5)
end

local function getServers()
    local HttpService = game:GetService("HttpService")
    local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    
    local success, response = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(url))
    end)
    
    if not success or not response or not response.data then
        notify("Server Hop", "Failed to fetch server list", 5)
        return nil
    end
    
    local currentJobId = tostring(game.JobId)
    local filtered = {}
    
    for _, server in ipairs(response.data) do
        if tostring(server.id) ~= currentJobId and server.playing < server.maxPlayers then
            table.insert(filtered, server)
        end
    end
    
    return filtered
end

local function teleportToServer(serverId)
    local TeleportService = game:GetService("TeleportService")
    pcall(function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, serverId)
    end)
end

local Button = sTab:CreateButton({
    Name = "Server Hop",
    Callback = function()
        if selectedOption == "None" then 
            notify("Celvyn Hub", "Please choose an option first", 5)
            return
        end
        
        local servers = getServers()
        if not servers or #servers == 0 then
            notify("Celvyn Hub", "No available servers found", 5)
            return
        end
        
        local targetServer = nil
        
        if selectedOption == "Random Server" then
            targetServer = servers[math.random(1, #servers)]
        elseif selectedOption == "low Player Server" then
            table.sort(servers, function(a, b) return a.playing < b.playing end)
            targetServer = servers[1]
        elseif selectedOption == "low ping Server" then
            targetServer = servers[math.random(1, math.min(10, #servers))]
        end
        
        if targetServer then
            notify("Celvyn Hub", "Attempting to server hop...", 3)
            teleportToServer(targetServer.id)
        else
            notify("Celvyn Hub", "Failed to select a server", 5)
        end
    end
})

local Button = sTab:CreateButton({
   Name = "Rejoin",
   Description = nil,
   Callback = function()
   game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
    end 
})

local mTab = Window:CreateTab("Music", "music")

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

local sgTab = Window:CreateTab("Setting", "settings")

local Button = sgTab:CreateButton({
  Name = "Destroy Ui",
  Callback = function()
Rayfield:Destroy()
   end 
})
