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
  for i,v in next, (workspace:GetDescendants()) do
 if v:IsA("Part") then v.Material = Enum.Material.SmoothPlastic
 end
end
   end
})

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
