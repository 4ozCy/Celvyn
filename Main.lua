loadstring(game:HttpGet("https://raw.githubusercontent.com/Pixeluted/adoniscries/main/Source.lua", true))() -- Adonis Bypass

task.wait(0.6)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

Rayfield:Notify({
   Title = "Welcome To Celvyn!",
   Content = "Thanks for using our script.",
   Duration = 5,
   Image = 119663846201777,
})

local Window = Rayfield:CreateWindow({
   Name = "Celvyn | Beta",
   Icon = 119663846201777,
   LoadingTitle = "Celvyn",
   LoadingSubtitle = "by @.03cc",
   Theme = "Default",
   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true,
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

local Section = Tab:CreateSection("Main Section")

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

local Button = Tab:CreateButton({
    Name = "Infinite yeld",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end,
})

local Button = Tab:CreateButton({
     Name = "Dex Mobile",
     Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/raelhubfunctions/Save-scripts/refs/heads/main/DexMobile.lua"))()
    end,
})

local Button = Tab:CreateButton({
     Name = "Tool Giver",
     Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/gametoolgiver.lua"))()
    end,
})
			
local Button = Tab:CreateButton({
    Name = "Permeant tptool",
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
    end,
})

local Button = Tab:CreateButton({
    Name = "Shift lock",
    Callback = function()
   loadstring(game:HttpGet('https://pastebin.com/raw/CjNsnSDy'))()
   end,
})

local Button = Tab:CreateButton({
    Name = "Unc Test",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-UNC-Test-13114"))()
    end,
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
    end,
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
    end,
})

local Section = Tab:CreateSection("Extra Section")

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
    end,
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
    CurrentValue = true,
    Callback = function(Value)
        antiAFK = Value
        if antiAFK then
            enableAntiAFK()
        else
            disableAntiAFK()
        end
    end,
})       

local pTab = Window:CreateTab("Player", "user")

local Section = pTab:CreateSection("Player Section")

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

local inputText = ""
local currentTween = nil
local tweenSpeed = 16
local isTweening = false
local MIN_DISTANCE = 2

local tweenCache = {}

local function findPlayerByShortName(partialName)
    if not partialName or partialName == "" then return nil end
    partialName = partialName:lower()
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and (
            player.Name:lower():find(partialName, 1, true) or
            (player.DisplayName and player.DisplayName:lower():find(partialName, 1, true))
        ) then
            return player
        end
    end
    return nil
end

local function getTargetHRP(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return nil end
    local hrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
    if hrp and targetPlayer.Character.Humanoid.Health > 0 then
        return hrp
    end
    return nil
end

local function createFollowTween(targetHRP, toggle)
    if not targetHRP or isTweening then return end
    
    isTweening = true
    local connection
    
    local function updateTween()
        local distance = (targetHRP.Position - HumanoidRootPart.Position).Magnitude
        if distance <= MIN_DISTANCE then
            isTweening = false
            if connection then connection:Disconnect() end
            toggle:SetValue(false)
            return
        end

        local duration = distance / math.clamp(tweenSpeed, 1, 1000)
        local tweenInfo = TweenInfo.new(
            duration,
            Enum.EasingStyle.Sine,
            Enum.EasingDirection.Out,
            0,
            false,
            0
        )
        
        local goal = { CFrame = targetHRP.CFrame + Vector3.new(0, 3, 0) }
        if currentTween then
            currentTween:Cancel()
        end
        
        currentTween = TweenService:Create(HumanoidRootPart, tweenInfo, goal)
        currentTween:Play()
    end
    
    connection = RunService.Heartbeat:Connect(updateTween)
    tweenCache.connection = connection
end

local Input = pTab:CreateInput({
    Name = "Teleport to Player",
    CurrentValue = "",
    PlaceholderText = "Enter Username",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        inputText = text
    end,
})

local Button = pTab:CreateButton({
    Name = "Teleport",
    Callback = function()
        local targetPlayer = findPlayerByShortName(inputText)
        local targetHRP = getTargetHRP(targetPlayer)
        
        if targetHRP then
            Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
            HumanoidRootPart.CFrame = targetHRP.CFrame + Vector3.new(0, 3, 0)
        else
            Rayfield:Notify({
   Title = "Celvyn Notification.",
   Content = "Target player not found or invalid.",
   Duration = 5,
   Image = 119663846201777,
})
        end
    end,
})

local Toggle = pTab:CreateToggle({
    Name = "Tween to Player",
    CurrentValue = false,
    Callback = function(isOn)
        if isOn then
            local targetPlayer = findPlayerByShortName(inputText)
            local targetHRP = getTargetHRP(targetPlayer)
            
            if targetHRP then
                createFollowTween(targetHRP, Toggle)
            else
                Rayfield:Notify({
   Title = "Celvyn Notification.",
   Content = "Target player not found or invalid.",
   Duration = 5,
   Image = 119663846201777,
})
                Toggle:Set(false)
            end
        else
            isTweening = false
            if currentTween then
                currentTween:Cancel()
                currentTween = nil
            end
            if tweenCache.connection then
                tweenCache.connection:Disconnect()
                tweenCache.connection = nil
            end
        end
    end,
})

local Slider = pTab:CreateSlider({
    Name = "Tween Speed",
    Range = {1, 1000},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = tweenSpeed,
    Callback = function(value)
        tweenSpeed = value
    end,
})

LocalPlayer.CharacterAdded:Connect(function(newChar)
    Character = newChar
    HumanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
    if isTweening then
        local targetPlayer = findPlayerByShortName(inputText)
        local targetHRP = getTargetHRP(targetPlayer)
        if targetHRP then
            createFollowTween(targetHRP, Toggle)
        end
    end
end)

local Section = pTab:CreateSection("Slider Section")

local Slider = pTab:CreateSlider({
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
    end,
})

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local Slider = pTab:CreateSlider({
    Name = "Jump Power",
    Range = {0, 200},
    Increment = 5,
    CurrentValue = humanoid.JumpPower,
    Callback = function(Value)
        humanoid.JumpPower = Value
    end,
})

local Field0fView = 70

local Slider = pTab:CreateSlider({
    Name = "Field of View",
    Range = {10, 120},
    Increment = 1,
    CurrentValue = workspace.CurrentCamera.FieldOfView,
    Callback = function(Value)
        workspace.CurrentCamera.FieldOfView = Value
    end,
})

local cTab = Window:CreateTab("Combat", "swords")

local Section = cTab:CreateSection("Aimbot Section")

local Button = cTab:CreateButton({
    Name = "Celvyn Aimbot",
    Callback = function()
        loadstring(game:HttpGet("https://celvyn.site/aimbot"))()
    end,
})

local Section = cTab:CreateSection("Esp Section")

local Button = cTab:CreateButton({
    Name = "Celvyn esp",
    Callback = function()
        loadstring(game:HttpGet("https://celvyn.site/esp"))()
    end,
})

local Button = cTab:CreateButton({
    Name = "Arrow esp",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/Hsvmj2mw"))()
    end,
})

local Button = cTab:CreateButton({
    Name = "Radar esp",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/3KMbR7vL', true))()
    end,
})

local sTab = Window:CreateTab("Server", "server")

local Section = sTab:CreateSection("Server Section")

local Button = sTab:CreateButton({
    Name = "Random Server Hop",
    Callback = function()
      loadstring(game:HttpGet('https://pastebin.com/raw/nKJ2FB1S'))()
    end,
})

local Button = sTab:CreateButton({
    Name = "low Player Server Hop",
    Callback = function()
      loadstring(game:HttpGet('https://pastebin.com/raw/Tbmzndze'))()
    end,
})

local Button = sTab:CreateButton({
    Name = "low Ping Server Hop",
    Callback = function()
     loadstring(game:HttpGet('https://pastebin.com/raw/Xvqs6paK'))()
    end,
})

local Button = sTab:CreateButton({
    Name = "Rejoin",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
    end,
})

local mTab = Window:CreateTab("Music", "music")

local Section = mTab:CreateSection("Music Section")

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
local LoopMusic = false
local ReverbEnabled = false
local ReverbEffect

local function playRandomMusic()
    if not Sound or not Sound:IsDescendantOf(game.Workspace) then
        Sound = Instance.new("Sound", game.Workspace)
        ReverbEffect = Instance.new("ReverbSoundEffect", Sound)
        ReverbEffect.Enabled = ReverbEnabled
        ReverbEffect.DecayTime = 3
        ReverbEffect.Density = 0.8
        ReverbEffect.Diffusion = 0.8
        ReverbEffect.DryLevel = 0
        ReverbEffect.WetLevel = -6
    end
    Sound.SoundId = "rbxassetid://" .. MusicIDs[math.random(1, #MusicIDs)]
    Sound.Volume = Volume
    Sound.PlaybackSpeed = Pitch
    Sound.Looped = LoopMusic
    Sound:Play()
    Sound.Ended:Connect(function()
        if IsPlayingMusic and not LoopMusic then
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
                EchoEffect = nil
            end
        end
    end,
})

local Toggle = mTab:CreateToggle({
    Name = "Loop Music",
    CurrentValue = false,
    Callback = function(Value)
        LoopMusic = Value
        if Sound then
            Sound.Looped = LoopMusic
        end
    end,
})

local Toggle = mTab:CreateToggle({
    Name = "Reverb Effect",
    CurrentValue = false,
    Callback = function(Value)
        ReverbEnabled = Value
        if Sound and ReverbEffect then
            ReverbEffect.Enabled = ReverbEnabled
        end
    end,
})

local Input = mTab:CreateInput({
    Name = "Volume",
    CurrentValue = tostring(Volume),
    PlaceholderText = "Enter Volume 0 - 200",
    RemoveTextAfterFocusLost = false,
    Flag = "VolumeInput",
    Callback = function(text)
        local value = tonumber(text)
        if value then
            Volume = math.clamp(value, 0, 200)
            if Sound then
                Sound.Volume = Volume
            end
        end
    end,
})

local Input = mTab:CreateInput({
    Name = "Pitch",
    CurrentValue = tostring(Pitch),
    PlaceholderText = "Enter Pitch 0.5 - 2.0",
    RemoveTextAfterFocusLost = false,
    Flag = "PitchInput",
    Callback = function(text)
        local value = tonumber(text)
        if value then
            Pitch = math.clamp(value, 0.5, 2)
            if Sound then
                Sound.PlaybackSpeed = Pitch
            end
        end
    end,
})

local Button = mTab:CreateButton({
    Name = "Skip",
    Callback = function()
        if Sound then
            Sound:Stop()
            playRandomMusic()
        end
    end,
})

local sgTab = Window:CreateTab("Setting", "settings")

local Section = sgTab:CreateSection("Setting Section")

local Button = sgTab:CreateButton({
    Name = "Destroy Ui",
    Callback = function()
        Rayfield:Destroy()
    end,
})
