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
	LogoID = "73436256413697",
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

local Tab = Window:CreateTab({
	Name = "Main",
	Icon = "view_in_ar",
	ImageSource = "Material",
	ShowTitle = true
})

local Label = Tab:CreateLabel({
	Text = "Main",
	Style = 1
})

local Button = Tab:CreateButton({
	Name = "test",
	Description = nil,
    	Callback = function()
         print("test")
    	end
})
