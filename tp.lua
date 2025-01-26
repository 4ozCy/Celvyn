local Noti = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()

Noti.new("success", "Welcome To Celvyn!", "Thank you for using our script.", true, 5)

local library = loadstring(game:HttpGet('https://pastebin.com/raw/EsSJE8Zm', true))()
    
local w = library:Window("Celvyn Hub")

w:Textbox("Username", "", function(text)
    targetUsername = text
end)

w:Button("Teleport", function()
local function getPlayer(username, speaker)
        local foundPlayers = {}
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Name:lower():sub(1, #username) == username:lower() then
                table.insert(foundPlayers, player.Name)
            end
        end
        return foundPlayers
    end

    local function getRoot(character)
        return character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
    end

    local players = getPlayer(targetUsername, game.Players.LocalPlayer)
    
    for i, v in pairs(players) do
        if game.Players[v] and game.Players[v].Character then
            local speaker = game.Players.LocalPlayer
            local humanoid = speaker.Character:FindFirstChildOfClass('Humanoid')

            if humanoid and humanoid.SeatPart then
                humanoid.Sit = false
                wait(0.1)
            end
            
            local speakerRoot = getRoot(speaker.Character)
            local targetRoot = getRoot(game.Players[v].Character)
            speakerRoot.CFrame = targetRoot.CFrame + Vector3.new(1, 1, 1)
        end
    end
end)
