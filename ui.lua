for i, v in pairs(game.CoreGui:GetChildren()) do
    if v.Name == "UiLib" then
        v:Destroy()
    end
end

local UiLib = Instance.new("ScreenGui")
UiLib.Name = "UiLib"
UiLib.Parent = game.CoreGui
UiLib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local function getNextWindowPos()
    local biggest = 0
    local ok = nil
    for i, v in pairs(UiLib:GetChildren()) do
        if v.Position.X.Offset > biggest then
            biggest = v.Position.X.Offset
            ok = v
        end
    end
    if biggest == 0 then
        biggest = biggest + 15
    else
        biggest = biggest + ok.Size.X.Offset + 10
    end
    return biggest
end

local Library = {}

function Library:Window(title)
    local Top = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Container = Instance.new("Frame")
    local UIListLayout_2 = Instance.new("UIListLayout")
    local Line = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local Minimize = Instance.new("ImageButton")

    Top.Name = "Top"
    Top.Parent = UiLib
    Top.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Top.BorderSizePixel = 0
    Top.Position = UDim2.new(0, getNextWindowPos(), 0.01, 0)
    Top.Size = UDim2.new(0, 204, 0, 28)
    Top.Active = true
    Top.Draggable = true

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = Top

    Container.Name = "Container"
    Container.Parent = Top
    Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Container.BackgroundTransparency = 1.000
    Container.ClipsDescendants = true
    Container.Position = UDim2.new(0, 0, 1, 0)
    Container.Size = UDim2.new(0, 204, 0, 762)

    UIListLayout_2.Parent = Container
    UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

    Line.Name = "Line"
    Line.Parent = Top
    Line.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Line.BorderSizePixel = 0
    Line.Position = UDim2.new(0, 0, 0.892857134, 0)
    Line.Size = UDim2.new(0, 204, 0, 3)

    Title.Name = "Title"
    Title.Parent = Top
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.Position = UDim2.new(0.0245098043, 0, 0.142857149, 0)
    Title.Size = UDim2.new(0, 174, 0, 20)
    Title.Font = Enum.Font.GothamSemibold
    Title.Text = title
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextScaled = true
    Title.TextSize = 14.000
    Title.TextWrapped = true
    Title.TextXAlignment = Enum.TextXAlignment.Left

    Minimize.Name = "Minimize"
    Minimize.Parent = Top
    Minimize.BackgroundTransparency = 1.000
    Minimize.Position = UDim2.new(0.877451003, 0, 0, 0)
    Minimize.Rotation = 90.000
    Minimize.Size = UDim2.new(0, 25, 0, 25)
    Minimize.ZIndex = 2
    Minimize.Image = "rbxassetid://3926307971"
    Minimize.ImageColor3 = Color3.fromRGB(0, 255, 102)
    Minimize.ImageRectOffset = Vector2.new(764, 244)
    Minimize.ImageRectSize = Vector2.new(36, 36)

    local function UZVNGAL_fake_script()
        local script = Instance.new('Script', Minimize)
        script.Parent.MouseButton1Click:Connect(function()
            if script.Parent.Parent.Container.Size == UDim2.new(0, 204, 0, 762) then
                game:GetService("TweenService"):Create(script.Parent, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 180}):Play()
                game:GetService("TweenService"):Create(script.Parent, TweenInfo.new(0.25), {ImageColor3 = Color3.fromRGB(255, 0, 68)}):Play()
                script.Parent.Parent.Container:TweenSize(UDim2.new(0, 204, 0, 0), "InOut", "Sine", 0.25, true)
                wait(0.1)
                script.Parent.Parent.Line.Visible = false
            else
                game:GetService("TweenService"):Create(script.Parent, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 90}):Play()
                game:GetService("TweenService"):Create(script.Parent, TweenInfo.new(0.25), {ImageColor3 = Color3.fromRGB(0, 255, 102)}):Play()
                script.Parent.Parent.Container:TweenSize(UDim2.new(0, 204, 0, 762), "InOut", "Sine", 0.2, true)
                script.Parent.Parent.Line.Visible = true
            end
        end)
    end
    coroutine.wrap(UZVNGAL_fake_script)()

    local Lib = {}

    function Lib:Button(name, callback)
        local ButtonContainer = Instance.new("Frame")
        local Button = Instance.new("TextButton")
        local ButtonAni = Instance.new("Frame")
        local UICorner_2 = Instance.new("UICorner")
        local UIListLayout = Instance.new("UIListLayout")
        local ButtonName = Instance.new("TextLabel")

        ButtonContainer.Name = "ButtonContainer"
        ButtonContainer.Parent = Container
        ButtonContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        ButtonContainer.BorderSizePixel = 0
        ButtonContainer.Size = UDim2.new(0, 204, 0, 28)

        Button.Name = "Button"
        Button.Parent = ButtonContainer
        Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Button.BackgroundTransparency = 1.000
        Button.Size = UDim2.new(0, 204, 0, 28)
        Button.Font = Enum.Font.SourceSans
        Button.Text = ""
        Button.TextColor3 = Color3.fromRGB(0, 0, 0)
        Button.TextSize = 14.000
        Button.MouseButton1Click:Connect(function()
            callback()
        end)

        ButtonAni.Name = "ButtonAni"
        ButtonAni.Parent = Button
        ButtonAni.BackgroundColor3 = Color3.fromRGB(0, 255, 102)
        ButtonAni.Position = UDim2.new(0.0245098043, 0, 0.0714285746, 0)

        UICorner_2.CornerRadius = UDim.new(0, 4)
        UICorner_2.Parent = ButtonAni

        UIListLayout.Parent = Button
        UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

        ButtonName.Name = "ButtonName"
        ButtonName.Parent = ButtonContainer
        ButtonName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ButtonName.BackgroundTransparency = 1.000
        ButtonName.Position = UDim2.new(0.0245098043, 0, 0.142857149, 0)
        ButtonName.Size = UDim2.new(0, 194, 0, 20)
        ButtonName.ZIndex = 3
        ButtonName.Font = Enum.Font.GothamSemibold
        ButtonName.Text = name
        ButtonName.TextColor3 = Color3.fromRGB(255, 255, 255)
        ButtonName.TextScaled = true
        ButtonName.TextSize = 14.000
        ButtonName.TextWrapped = true

        local function ZNVYM_fake_script()
            local script = Instance.new('Script', Button)
            script.Parent.MouseButton1Click:Connect(function()
                script.Parent.ButtonAni:TweenSize(UDim2.new(0, 194, 0, 24), 'InOut', "Sine", 0.3, true)
                wait(0.45)
                script.Parent.ButtonAni:TweenSize(UDim2.new(0, 0, 0, 0), "InOut", "Sine", 0.3, true)
            end)
        end
        coroutine.wrap(ZNVYM_fake_script)()
    end

    function Lib:Textbox(name, placeholderText, callback)
    local TextboxContainer = Instance.new("Frame")
    local TextboxLabel = Instance.new("TextLabel")
    local Textbox = Instance.new("TextBox")
    local UICorner = Instance.new("UICorner")

    TextboxContainer.Name = "TextboxContainer"
    TextboxContainer.Parent = Container
    TextboxContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TextboxContainer.BorderSizePixel = 0
    TextboxContainer.Size = UDim2.new(0, 204, 0, 40)

    TextboxLabel.Name = "TextboxLabel"
    TextboxLabel.Parent = TextboxContainer
    TextboxLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextboxLabel.BackgroundTransparency = 1.000
    TextboxLabel.Position = UDim2.new(0.0245098043, 0, 0.1, 0)
    TextboxLabel.Size = UDim2.new(0, 150, 0, 20)
    TextboxLabel.Font = Enum.Font.GothamSemibold
    TextboxLabel.Text = name
    TextboxLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextboxLabel.TextScaled = true
    TextboxLabel.TextSize = 14.000
    TextboxLabel.TextWrapped = true
    TextboxLabel.TextXAlignment = Enum.TextXAlignment.Left

    Textbox.Name = "Textbox"
    Textbox.Parent = TextboxContainer
    Textbox.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
    Textbox.Position = UDim2.new(0.75, 0, 0.1, 0)
    Textbox.Size = UDim2.new(0, 50, 0, 20)
    Textbox.Font = Enum.Font.SourceSans
    Textbox.Text = ""
    Textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
    Textbox.TextSize = 17.000
    Textbox.PlaceholderText = placeholderText

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = Textbox

    Textbox:GetPropertyChangedSignal("Text"):Connect(function()
        if callback then
            callback(Textbox.Text)
        end
    end)
end

    function Lib:Slider(name, min, max, initial, callback)
    local SliderContainer = Instance.new("Frame")
    local SliderLabel = Instance.new("TextLabel")
    local Slider = Instance.new("Frame")
    local SliderButton = Instance.new("TextButton")
    local SliderValue = Instance.new("TextLabel")
    local UICorner = Instance.new("UICorner")

    SliderContainer.Name = "SliderContainer"
    SliderContainer.Parent = Container
    SliderContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    SliderContainer.BorderSizePixel = 0
    SliderContainer.Size = UDim2.new(0, 204, 0, 50)

    SliderLabel.Name = "SliderLabel"
    SliderLabel.Parent = SliderContainer
    SliderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SliderLabel.BackgroundTransparency = 1.000
    SliderLabel.Position = UDim2.new(0.0245098043, 0, 0.1, 0)
    SliderLabel.Size = UDim2.new(0, 150, 0, 20)
    SliderLabel.Font = Enum.Font.GothamSemibold
    SliderLabel.Text = name
    SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    SliderLabel.TextScaled = true
    SliderLabel.TextSize = 14.000
    SliderLabel.TextWrapped = true
    SliderLabel.TextXAlignment = Enum.TextXAlignment.Left

    Slider.Name = "Slider"
    Slider.Parent = SliderContainer
    Slider.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
    Slider.Position = UDim2.new(0.0245098043, 0, 0.5, 0)
    Slider.Size = UDim2.new(0, 150, 0, 10)
    Slider.ClipsDescendants = true

    SliderButton.Name = "SliderButton"
    SliderButton.Parent = Slider
    SliderButton.BackgroundColor3 = Color3.fromRGB(0, 255, 102)
    SliderButton.Size = UDim2.new(0, 20, 0, 20)
    SliderButton.Position = UDim2.new((initial - min) / (max - min), -10, -0.5, 0)
    SliderButton.AutoButtonColor = false
    SliderButton.Text = ""

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = SliderButton

    SliderValue.Name = "SliderValue"
    SliderValue.Parent = SliderContainer
    SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SliderValue.BackgroundTransparency = 1.000
    SliderValue.Position = UDim2.new(0.75, 0, 0.1, 0)
    SliderValue.Size = UDim2.new(0, 50, 0, 20)
    SliderValue.Font = Enum.Font.GothamSemibold
    SliderValue.Text = initial
    SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
    SliderValue.TextScaled = true
    SliderValue.TextSize = 14.000
    SliderValue.TextWrapped = true

    local dragging = false
    local function update(input)
        local pos = UDim2.new(math.clamp((input.Position.X - Slider.AbsolutePosition.X) / Slider.AbsoluteSize.X, 0, 1), -10, -0.5, 0)
        SliderButton.Position = pos
        local value = math.floor(min + (pos.X.Scale * (max - min)))
        SliderValue.Text = value
        callback(value)
    end

    SliderButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    SliderButton.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input == dragInput then
            update(input)
        end
    end)
    end
    
   return Lib
end

return Library
