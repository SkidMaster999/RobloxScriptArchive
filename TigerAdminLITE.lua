--NPhC:\Users\Yash\Documents\Scripts\TigerAdmin.lua
--[[
  _______ _____ _____ ______ _____             _____  __  __ _____ _   _ 
 |__   __|_   _/ ____|  ____|  __ \      /\   |  __ \|  \/  |_   _| \ | | PL LITE
    | |    | || |  __| |__  | |__) |    /  \  | |  | | \  / | | | |  \| |
    | |    | || | |_ |  __| |  _  /    / /\ \ | |  | | |\/| | | | | . ` |
    | |   _| || |__| | |____| | \ \   / ____ \| |__| | |  | |_| |_| |\  |
    |_|  |_____\_____|______|_|  \_\ /_/    \_\_____/|_|  |_|_____|_| \_|     
    Created by H17S3
    https://www.youtube.com/watch?v=cL-d_GOXa28
]]

repeat task.wait() until game:IsLoaded()
do --//Instances
	Debug = false
	BETA = false
	Folder = Instance.new("Folder")
	ScreenGui = Instance.new("ScreenGui")
	CmdBarFrame = Instance.new("Frame")
	UICorner = Instance.new("UICorner")
	Out = Instance.new("ImageLabel")
	UICorner_2 = Instance.new("UICorner")
	CommandBar = Instance.new("TextBox")
	UIStroke = Instance.new("UIStroke")
	Commands = Instance.new("ImageLabel")
	UICorner_3 = Instance.new("UICorner")
	UIStroke_2 = Instance.new("UIStroke")
	CommandsList = Instance.new("ScrollingFrame")
	UIListLayout = Instance.new("UIListLayout")
	TEMP_CMD = Instance.new("TextLabel")
	plr = game:GetService("Players").LocalPlayer
	UIS,UserInputService = game:GetService'UserInputService',game:GetService("UserInputService")
	char = plr.Character
	Mouse = plr:GetMouse()
	RunService = game:GetService("RunService")
	gethui=gethui or nil
	SearchBar = Instance.new("TextBox")
	Folder.Name = "Tiger_PL"
	--
	HasFireTouch = false
	unloaded=false
	SavedAdmins = {}
	firetouchinterest=firetouchinterest
	firetouch = firetouchinterest
	oldprint = print
	IsBringing = false
	loopkilling = {}
end
do
	--//Top functions & tables
	TigerGuis = {}
	function AddGui(Gui)
		TigerGuis[#TigerGuis+1]=Gui
	end
end
do
	--Tables
	States = {
		autore = true,
		KillAura = false,
		SilentAim= false,
		AntiPunch = false,
		AntiTase = false,
		FastPunch = false,
		ClickArrest = false,
		Godmode = false,
		Antibring = true,
		OnePunch = false,
		AntiTouch = false,
		ClickKill = false,
		noclip = false,
		AntiShield = false,
		AutoItems = false,
		AntiArrest = false,
		Admined = {},
	}
	Reload_Guns = {}
	Whitelisted = {}
	Parts = {}
	Temp = {}
	Whitelisted_ITEMS = {}
end
if game:FindFirstChild("Tiger_PL") then
	ScreenGui:Destroy()
	unloaded = true
	return
end
do
	function Tween(Obj,Prop,New,Time)
		if not Time then Time = .5 end
		task.spawn(function()
			local TweenService = game:GetService("TweenService")
			local info = TweenInfo.new(
				Time, 
				Enum.EasingStyle.Quart, 
				Enum.EasingDirection.Out, 
				0, 
				false,
				0
			)
			local propertyTable = {
				[Prop] = New,
			}

			TweenService:Create(Obj, info, propertyTable):Play()
		end)
	end
	--Loading.
	Temp.Respawned_132 = false
	local LoadingGUI = Instance.new("ScreenGui")
	local Loading = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIStroke = Instance.new("UIStroke")
	local Darken = Instance.new("Frame")
	local Outter = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local Tweener = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local Text = Instance.new("TextLabel")
	local UIGradient = Instance.new("UIGradient")
	LoadingGUI.Name = "LoadingGUI"
	LoadingGUI.Parent = (game:GetService("CoreGui") or gethui())
	LoadingGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Loading.Name = "Loading"
	Loading.Parent = LoadingGUI
	Loading.AnchorPoint = Vector2.new(0.5, 0.5)
	Loading.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Loading.BackgroundTransparency=1
	Loading.Position = UDim2.new(0.5, 0, 0.5, 0)
	Loading.Size = UDim2.new(0, 404, 0, 172)
	UICorner.CornerRadius = UDim.new(0, 3)
	UICorner.Parent = Loading
	Darken.Name = "Darken"
	Darken.Parent = Loading
	Darken.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Darken.BackgroundTransparency = 1
	Darken.BorderSizePixel = 0
	Darken.Size = UDim2.new(0, 404, 0, 172)
	Outter.Name = "Outter"
	Outter.Parent = Darken
	Outter.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Outter.Position = UDim2.new(0.297029704, 0, 0.645348847, 0)
	Outter.Size = UDim2.new(0, 164, 0, 5)
	UICorner_2.Parent = Outter
	Tweener.Name = "Tweener"
	Tweener.Parent = Outter
	Tweener.BackgroundColor3 = Color3.fromRGB(3, 196, 255)
	Tweener.Position = UDim2.new(-0.00175066688, 0, 0, 0)
	Tweener.Size = UDim2.new(0, 0, 0, 5)
	UICorner_3.Parent = Tweener
	Text.Name = "Text"
	Text.Parent = Loading
	Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Text.BackgroundTransparency = 1.000
	Text.Position = UDim2.new(0.252475262, 0, 0.401162773, 0)
	Text.Size = UDim2.new(0, 200, 0, 33)
	Text.Font = Enum.Font.Gotham
	Text.Text = "Loading"
	Text.TextColor3 = Color3.fromRGB(255, 255, 255)
	Text.TextSize = 18.000
	task.spawn(function()
		Text.Text = "Loading {Guis}"
		game:GetService("ContentProvider"):PreloadAsync({
			Commands,
			Out,
			Commands,
		})
		Tweener:TweenSize(UDim2.new(.1, 0,0, 5),"Out","Quart",.06)
		wait(.1)
		Tweener:TweenSize(UDim2.new(.5, 0,0, 5),"Out","Quart",.06)
		Text.Text = "Loading {Scripts/Character}"
		repeat task.wait() until Temp.Respawned_132 == true
		Tweener.Size = UDim2.new(1,0,1,0)
		wait(.7)
		repeat wait() Tweener.Size = UDim2.new(1,0,1,0) until Tweener.Size == UDim2.new(1,0,1,0)
		Text.Text = "Finished loading!"
		wait(.4)
		Loading:TweenPosition(Loading.Position-UDim2.new(0,0,1,0),"Out","Quart",.6)
		wait(1.5)
		Loading:Destroy()
	end)
end
function MoveToJunk(v)
	v.CFrame = CFrame.new(0,5^5,0)
end
for i,v in pairs(workspace["Criminals Spawn"]:GetChildren()) do
	if v and v:IsA("Part") then
		MoveToJunk(v)
	end
end
function UneqTools()
	plr.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
end
workspace.FallenPartsDestroyHeight = -math.huge
task.spawn(function()
	local FirePart =Instance.new("Part")
	if not firetouchinterest then
		HasFireTouch = false
	end
	FirePart.Touched:Connect(function()
		HasFireTouch = true
		FirePart:Destroy()
	end)
	plr.Character:WaitForChild("Head")
	for i =1,2 do
		if firetouchinterest then
			if FirePart then
				firetouchinterest(plr.Character.Head,FirePart,0)
				firetouchinterest(plr.Character.Head,FirePart,1)
			end
		end
		wait(.4)
	end
end)
function Msg(player,Text)
	local ohString1 = "/w "..player.Name.." "..Text
	local ohString2 = "All"
	game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(ohString1, ohString2)
end
if writefile and makefolder and readfile and isfile then
	if isfile("Tiger Admin") == false or isfile("Tiger_Admin/Invite.json") == false then
		makefolder("Tiger_Admin")
		if isfile("Tiger_Admin/Invite.json") == false then
			writefile("Tiger_Admin/Invite.json",game:GetService("HttpService"):JSONEncode({
				Invite_To_Server = true
			}))
		end
		if isfile("Tiger_Admin/SavedAdmins.json") == false then
			writefile("Tiger_Admin/SavedAdmins.json",game:GetService("HttpService"):JSONEncode({}))
		else
			local Content = game:GetService("HttpService"):JSONDecode(readfile("Tiger_Admin/SavedAdmins.json"))
			for i,v in pairs(Content) do
				if v then
					print(v)
					States.Admined[#States.Admined+1] = v
				end
			end
		end
	end
end
do --//Main Gui
	ScreenGui.Parent = (game:GetService("CoreGui") or gethui())
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.Name = math.random()
	AddGui(ScreenGui)
	CmdBarFrame.Name = "CmdBarFrame"
	CmdBarFrame.Parent = ScreenGui
	CmdBarFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	CmdBarFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CmdBarFrame.BackgroundTransparency = 1.000
	CmdBarFrame.BorderSizePixel = 0
	CmdBarFrame.Position = UDim2.new(0.5, 0, 0.899999998, 0)
	CmdBarFrame.Position = CmdBarFrame.Position+UDim2.new(0,0,1.1,0)
	CmdBarFrame.Size = UDim2.new(0, 577, 0, 65)

	UICorner.CornerRadius = UDim.new(0, 3)
	UICorner.Parent = CmdBarFrame
	do
		CmdsIcon = Instance.new("ImageLabel")
		UICornera = Instance.new("UICorner")
		UIStroke12 = Instance.new("UIStroke")
		CmdButton = Instance.new("ImageButton")

		CmdsIcon.Name = "CmdsIcon"
		CmdsIcon.Parent = CmdBarFrame
		CmdsIcon.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		CmdsIcon.Position = UDim2.new(-0.132423401, 0, 0.0226149559, 0)
		CmdsIcon.Size = UDim2.new(0.121672593, 0, 0.945454538, 0)
		CmdsIcon.Image = "rbxassetid://12661800163"
		CmdsIcon.ImageTransparency = 0.030

		UICornera.CornerRadius = UDim.new(0, 6)
		UICornera.Parent = CmdsIcon

		UIStroke12.Parent = CmdsIcon

		CmdButton.Name = "CmdButton"
		CmdButton.Parent = CmdsIcon
		CmdButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		CmdButton.BackgroundTransparency = 1.000
		CmdButton.Position = UDim2.new(0.298999995, 0, 0.27700001, 0)
		CmdButton.Size = UDim2.new(0, 27, 0, 27)
		CmdButton.Image = "rbxassetid://11570802781"
		CmdButton.ImageTransparency = 0.430
		CmdButton.MouseButton1Up:Connect(function()
			if not Temp.CmdsC then
				Temp.CmdsC = true
				if Commands.Visible == false then
					Commands.Position = Commands.Position+UDim2.new(0,0,1,0)
					wait(.1)
					Commands:TweenPosition(SavedCmdsPosition,"Out","Quart",1)
					Commands.Visible = true
				else
					Commands:TweenPosition(SavedCmdsPosition+UDim2.new(0,0,1,0),"Out","Quart",1)
					wait(.5)
					Commands.Visible = false
				end
				wait(.7)
				Temp.CmdsC = false
			end
		end)
		CmdButton.MouseEnter:Connect(function()
			CmdButton.ImageColor3 = Color3.new(0.588235, 0.588235, 0.588235)
		end)
		CmdButton.MouseLeave:Connect(function()
			CmdButton.ImageColor3 = Color3.new(1, 1, 1)
		end)
	end
	do
		Toggles = Instance.new("ImageLabel")
		local Stokeee = Instance.new("UIStroke")
		local Corrrer = Instance.new("UICorner")
		local ToggleScroll = Instance.new("ScrollingFrame")
		local kewkfwe = Instance.new("UIListLayout")
		local tempb = Instance.new("TextButton")
		local UIStroke = Instance.new("UIStroke")
		local UICorner = Instance.new("UICorner")

		Toggles.Name = "Toggles"
		Toggles.Parent = ScreenGui
		Toggles.AnchorPoint = Vector2.new(0.5, 0.5)
		Toggles.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Toggles.Position = UDim2.new(0.499593854, 0, 0.499376595, 0)+UDim2.new(0,0,1,0)
		Toggles.Size = UDim2.new(0, 539, 0, 409)
		Toggles.Visible = false
		Toggles.Image = "rbxassetid://12011977394"
		Toggles.ImageTransparency = 0.260

		Stokeee.Parent = Toggles
		Stokeee.Name = "Stokeee"

		Corrrer.Name = "Corrrer"
		Corrrer.Parent = Toggles

		ToggleScroll.Name = "ToggleScroll"
		ToggleScroll.Parent = Toggles
		ToggleScroll.Active = true
		ToggleScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ToggleScroll.BackgroundTransparency = 1.000
		ToggleScroll.Size = UDim2.new(0, 539, 0, 408)
		ToggleScroll.ScrollBarThickness = 4

		kewkfwe.Name = "kewkfwe"
		kewkfwe.Parent = ToggleScroll
		kewkfwe.SortOrder = Enum.SortOrder.LayoutOrder
		kewkfwe.Padding = UDim.new(0, 5)

		tempb.Name = "tempb"
		tempb.Parent = ScreenGui
		tempb.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		tempb.BackgroundTransparency = 0.550
		tempb.Position = UDim2.new(0, 0, -7.47979882e-08, 0)
		tempb.Size = UDim2.new(0, 539, 0, 44)
		tempb.Visible = false
		tempb.Font = Enum.Font.SourceSans
		tempb.Text = "Autorespawn [OFF]"
		tempb.TextColor3 = Color3.fromRGB(255, 255, 255)
		tempb.TextSize = 14.000

		UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		UIStroke.Parent = tempb

		UICorner.CornerRadius = UDim.new(0, 3)
		UICorner.Parent = tempb
		for i,v in pairs(States) do
			if v == true or v == false then --//lazy for typeof function
				local p = tempb:Clone()
				p.Visible = true
				p.Parent = ToggleScroll
				p.Text = tostring(i).." ["..tostring(v).."]"
				p.MouseButton1Up:Connect(function()
					States[i]=not States[i]
					p.Text = tostring(i).." ["..tostring(States[i]).."]"
				end)
			end
		end
	end
	do
		TogglesButton = Instance.new("ImageLabel")
		UICornera = Instance.new("UICorner")
		UIStroke12 = Instance.new("UIStroke")
		CmdButton2 = Instance.new("ImageButton")

		TogglesButton.Name = "CmdsIcon"
		TogglesButton.Parent = CmdBarFrame
		TogglesButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		TogglesButton.Position = UDim2.new(-0.132423401, 0, 0.0226149559, 0)+UDim2.new(1.15,0,0,0)
		TogglesButton.Size = UDim2.new(0.121672593, 0, 0.945454538, 0)
		TogglesButton.Image = "rbxassetid://12661800163"
		TogglesButton.ImageTransparency = 0

		UICornera.CornerRadius = UDim.new(0, 6)
		UICornera.Parent = TogglesButton

		UIStroke12.Parent = TogglesButton

		CmdButton2.Name = "ToggleButton"
		CmdButton2.Parent = TogglesButton
		CmdButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		CmdButton2.BackgroundTransparency = 1.000
		CmdButton2.Position = UDim2.new(0.298999995, 0, 0.27700001, 0)
		CmdButton2.Size = UDim2.new(0, 27, 0, 27)
		CmdButton2.Image = "rbxassetid://11698445336"
		CmdButton2.ImageTransparency = 0.430
		CmdButton2.MouseButton1Up:Connect(function()
			if not Temp.CmdsC then
				Temp.CmdsC = true
				if Toggles.Visible == false then
					Toggles.Position = Toggles.Position+UDim2.new(0,0,1,0)
					wait(.1)
					Toggles:TweenPosition(SavedCmdsPosition,"Out","Quart",1)
					Toggles.Visible = true
				else
					Toggles:TweenPosition(SavedCmdsPosition+UDim2.new(0,0,1,0),"Out","Quart",1)
					wait(.5)
					Toggles.Visible = false
				end
				wait(.7)
				Temp.CmdsC = false
			end
		end)
		CmdButton2.MouseEnter:Connect(function()
			CmdButton2.ImageColor3 = Color3.new(0.588235, 0.588235, 0.588235)
		end)
		CmdButton2.MouseLeave:Connect(function()
			CmdButton2.ImageColor3 = Color3.new(1, 1, 1)
		end)
	end
	Out.Name = "Out"
	Out.Parent = CmdBarFrame
	Out.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Out.Position = UDim2.new(0.0200897697, 0, 0.022615375, 0)
	Out.Size = UDim2.new(0.974358976, 0, 0.945454538, 0)
	Out.Image = "rbxassetid://11789397066"
	Out.ImageTransparency = 0.240

	UICorner_2.CornerRadius = UDim.new(0, 6)
	UICorner_2.Parent = Out

	CommandBar.Name = "CommandBar"
	CommandBar.Parent = Out
	CommandBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CommandBar.BackgroundTransparency = 1.000
	CommandBar.BorderSizePixel = 0
	CommandBar.Position = UDim2.new(0.0359953903, 0, 0.128254473, 0)
	CommandBar.Size = UDim2.new(0, 519, 0, 46)
	CommandBar.Font = Enum.Font.SourceSans
	CommandBar.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	CommandBar.PlaceholderText = "Command bar"
	CommandBar.Text = ""
	CommandBar.TextColor3 = Color3.fromRGB(255, 255, 255)
	CommandBar.TextSize = 24.000
	CommandBar.TextTransparency = 0.140
	CommandBar.TextWrapped = true

	UIStroke.Parent = Out

	Commands.Name = "Commands"
	Commands.Parent = ScreenGui
	Commands.AnchorPoint = Vector2.new(0.5, 0.5)
	Commands.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Commands.Position = UDim2.new(0.5, 0, 0.5, 0)
	Commands.Size = UDim2.new(0, 455, 0, 297)
	Commands.Image = "rbxassetid://12011977394"
	Commands.ImageTransparency = 0.200
	Commands.Visible = false

	UICorner_3.CornerRadius = UDim.new(0, 6)
	UICorner_3.Parent = Commands

	UIStroke_2.Parent = Commands

	CommandsList.Parent = Commands
	CommandsList.Active = true
	CommandsList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CommandsList.BackgroundTransparency = 1.000
	CommandsList.Position = UDim2.new(0, 0, 0.077441074, 0)
	CommandsList.Size = UDim2.new(0, 455, 0, 274)
	CommandsList.ScrollBarThickness = 5
	CommandsList.AutomaticCanvasSize="Y"
	UIListLayout.Parent = CommandsList
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 8)

	TEMP_CMD.Parent = Folder
	TEMP_CMD.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
	TEMP_CMD.BackgroundTransparency = 0.750
	TEMP_CMD.Size = UDim2.new(0, 455, 0, 14)
	TEMP_CMD.Font = Enum.Font.SourceSans
	TEMP_CMD.Text = "sex"--//yes
	TEMP_CMD.TextColor3 = Color3.fromRGB(255, 255, 255)
	TEMP_CMD.TextSize = 14.000
	SavedCmdsPosition = Commands.Position
	SearchBar.Parent = Commands
	SearchBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SearchBar.BackgroundTransparency = 1.000
	SearchBar.Size = UDim2.new(0, 455, 0, 17)
	SearchBar.Font = Enum.Font.SourceSans
	SearchBar.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	SearchBar.PlaceholderText = "Search here"
	SearchBar.Text = ""
	SearchBar.TextColor3 = Color3.fromRGB(234, 234, 234)
	SearchBar.TextSize = 14.000
	local function dragify(Frame) --//shit annoying
		local dragToggle = nil
		local dragSpeed = 0.50
		local dragInput = nil
		local dragStart = nil
		local dragPos = nil
		local startPos = nil
		local function updateInput(input)
			local Delta = input.Position - dragStart
			local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
			game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.30), {Position = Position}):Play()
		end
		Frame.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
				dragToggle = true
				dragStart = input.Position
				startPos = Frame.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end)
		Frame.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if input == dragInput and dragToggle then
				updateInput(input)
			end
		end)
	end
	dragify(Toggles)
	dragify(Commands)
	function Notif(Text,Dur)
		task.spawn(function()
			if not Dur then Dur = 1.57 end
			local Notif = Instance.new("ScreenGui")
			local Frame_1 = Instance.new("Frame")
			local TextLabel = Instance.new("TextLabel")
			Notif.Parent = (game:GetService("CoreGui") or gethui())
			Notif.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			Frame_1.Parent = Notif
			Frame_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Frame_1.BackgroundTransparency=1
			Frame_1.BorderSizePixel = 0
			Frame_1.Position = UDim2.new(0, 0, 0.0500000007, 0)
			Frame_1.Size = UDim2.new(1, 0, 0.100000001, 0)
			TextLabel.Parent = Frame_1
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.TextTransparency =1
			TextLabel.Size = UDim2.new(1, 0, 1, 0)
			TextLabel.Font = Enum.Font.Highway
			TextLabel.Text = Text or "Text not found"
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 21.000
			Tween(Frame_1,"BackgroundTransparency",0.350,.5)
			Tween(TextLabel,"TextTransparency",0,.5)
			wait(Dur+.7)
			Tween(Frame_1,"BackgroundTransparency",1,.5)
			Tween(TextLabel,"TextTransparency",1,.5)
			wait(.7)
			Notif:Destroy()
		end)
		return
	end
	Folder.Parent = game
	do--Watermark
		local Water = Instance.new("ScreenGui")
		local TextLabel = Instance.new("TextLabel")
		local UIGradient = Instance.new("UIGradient")
		Water.Name = game:GetService("HttpService"):GenerateGUID(true)
		Water.Parent = (game:GetService("CoreGui") or gethui())
		Water.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		TextLabel.Parent = Water
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Position = UDim2.new(0.00658436213, 0, 0, 0)-UDim2.new(0,0,1,0)
		TextLabel.Size = UDim2.new(0, 200, 0, 32)
		TextLabel.Font = Enum.Font.Cartoon
		TextLabel.Text = "Tiger-admin v1.1 PL"
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextScaled = true
		TextLabel.TextSize = 14.000
		TextLabel.TextWrapped = true
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel:TweenPosition(UDim2.new(0.00658436213, 0, 0, 0),"Out","Quart",1)
		AddGui(Water)
		UIGradient.Color =ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(196, 8, 202)), ColorSequenceKeypoint.new(0.13, Color3.fromRGB(199, 15, 191)), ColorSequenceKeypoint.new(0.48, Color3.fromRGB(247, 127, 28)), ColorSequenceKeypoint.new(0.89, Color3.fromRGB(254, 7, 59)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 2, 61))}
		UIGradient.Parent = TextLabel
		task.spawn(function()
			while game do
				task.wait()
				UIGradient.Rotation +=.05
			end
		end)
	end
	do
		--Load guis
		game:GetService("ContentProvider"):PreloadAsync({
			Commands,
			Out,
		})
	end

	for i,v in pairs(ScreenGui:GetDescendants()) do v.Name = game:GetService("HttpService"):GenerateGUID(true) end
	if game:GetService("UserInputService").TouchEnabled and not game:GetService("UserInputService").KeyboardEnabled then
		CommandBar.Position=CommandBar.Position-UDim2.new(0,0,.05,0)
		TogglesButton=TogglesButton.Position-UDim2.new(0,0,.2,0)
		CmdButton=CmdButton.Position-UDim2.new(0,0,.2,0)
	end
end
do--//Command handler
	Prefix = "!"
	CommandsGot = 0
	TableCommands={}
	CommandsRawList = {}
	GetArgs = function(Args)
		return Args:split(" ")
	end
end

Verify_Command=function(NAME)
	NAME = NAME:lower()
	if not string.find(NAME,Prefix) then
		NAME = Prefix..NAME
	end
	return NAME
end
ValidCommand=function(Name)
	local Saved_Name = Name
	if not string.find(Saved_Name," ") then
		Saved_Name = Saved_Name.." "
	end
	for i,v in pairs(TableCommands) do
		if v then
			if v["Name"]:lower() == Saved_Name:split(" ")[1] then
				return true
			end
		end
	end
	return nil
end
Execute_Command = function(Name,Raw)
	local p = nil
	if unloaded then return end
	Name = Name:lower()
	local Saved_Name = Name
	if not string.find(Saved_Name," ") then
		Saved_Name = Saved_Name.." "
	end
	if Verify_Command(Name) then
		for i,v in pairs(TableCommands) do
			if v then
				if v["Name"]:lower() == Saved_Name:split(" ")[1] then
					p = true
					coroutine.wrap(function()
						v["Callback"](Raw)
					end)()
				end
			end
		end
		print(p)
		return p
	end
end
FindPlayer = function(h,h2)
	if string.lower(h) == "me" then
		return plr
	else
		h = h:gsub("%s+", "")
		for m, n in pairs(game:GetService("Players"):GetPlayers()) do
			if n.Name:lower():match("^" .. h:lower()) or n.DisplayName:lower():match("^" .. h:lower()) then
				return n
			end
		end
	end
	return nil
end
FindString = function(String,Table)
	String = String:gsub("%s+", "")
	for m, n in pairs(Table) do
		if n:lower():match("^" .. String:lower()) then
			return n
		end
	end
	return nil
end
Add_Command = function(Name,Callback,Does,PlayerCommand,R)
	task.spawn(function()
		if Name and Callback then
			if PlayerCommand and PlayerCommand == "PLAYER_COMMAND" then
				PlayerCommand = " [PLAYER]"
			elseif PlayerCommand == "TOGGLE_COMMAND" then
				PlayerCommand = " ON/OFF"
			elseif PlayerCommand == "NUMBER_COMMAND" then
				PlayerCommand = " NUMBER"
			elseif PlayerCommand == "STRING_COMMAND" then
				PlayerCommand = " STRING"
			end
			if PlayerCommand == nil then
				PlayerCommand=""
			end
			local CloneTXT = TEMP_CMD:Clone()

			if typeof(PlayerCommand):lower()~="string" then
				CloneTXT.Text = Prefix..tostring(Name).."".." | "..Does or ""
			else
				CloneTXT.Text = Prefix..tostring(Name)..PlayerCommand.." | "..Does or ""
			end
			CloneTXT.Parent = CommandsList
			CloneTXT.Visible = true
			if Does and Does == true or Does == "true" or PlayerCommand == true then
				CloneTXT.Visible = false
				CloneTXT.Changed:Connect(function()
					CloneTXT.Visible = false
				end)
			end
			CommandsGot+=1
			CommandsRawList[#CommandsRawList+1]=CloneTXT
			TableCommands[#TableCommands+1] = {
				["Name"] = Prefix..Name,
				["Callback"] = Callback,
				["Does"] = Does or ""
			}
		end
	end)
end
do
	--//Temp set up
	Temp.CmdsC = false
	Temp.Waiting2 = nil
	Temp.Waiting = false
	Temp.Esps={}
	Temp.RankCooldown = false
end

do
	--//Prison life stuff functions
	function GetHumanoid()
		return plr.Character:FindFirstChildOfClass("Humanoid")
	end
	function WaitForRespawn()
		task.spawn(function()
			Temp.Waiting = true
			local RepeatPos = getpos()
			task.spawn(function()
				Temp.Waiting2 = plr.CharacterAdded:Connect(function(char)
					repeat task.wait() until char and char:FindFirstChild("HumanoidRootPart")
					Temp.Waiting = false
					MoveTo(RepeatPos)
				end)
			end)
			repeat task.wait()
				RepeatPos = getpos()
			until Temp.Waiting == false
			Temp.Waiting2:Disconnect()
		end)
		return
	end
	HasGamepass = false
	function swait()--//fast wait
		game:GetService("RunService").Stepped:Wait()
	end
	function Godmode()
		local Hats = {}
		repeat task.wait() until plr.Character:FindFirstChildOfClass("Accessory")
		do
			--//Fix the stupid hat falling off because it looks good without it falling and because im not gay
			for i,v in pairs(plr.Character:GetChildren()) do
				if v and v:IsA("Accessory") then
					pcall(function()
						v.Handle.CanTouch = false
						Hats[#Hats+1] = {
							Hat = v,
							OldPosition = v.Handle:FindFirstChildOfClass("Weld").C0,
							OldPosition2 = v.Handle:FindFirstChildOfClass("Weld").C1
						}
						v.Handle.Anchored = true
					end)

				end
			end
		end
		do--//Glitch Humanoid
			task.spawn(function()
				plr.Character:FindFirstChildOfClass("Humanoid"):Destroy()
				Instance.new("Humanoid",plr.Character)
				pcall(function()
					plr.Character:FindFirstChild("Animate").Disabled = true
					plr.Character:FindFirstChild("Animate").Disabled = false
				end)
			end)
		end
		do
			local function FindHat(a)
				for i,v in pairs(Hats) do
					if v and v == a then
						return v
					end
				end
				return nil
			end
			--Fix hats 2
			for i,v in pairs(Hats) do
				if v then
					pcall(function()
						local Hat = v.Hat
						local NewWeld = Instance.new("Weld",Hat.Handle)
						NewWeld.Part0 = Hat.Handle
						NewWeld.Part1 = plr.Character.Head
						NewWeld.C0 = v.OldPosition
						NewWeld.C1 = v.OldPosition2
						Hat.Handle.Anchored = false
					end)
				end
			end
		end
	end
	function ChangeTeam(Team)
		if Team == game.Teams.Criminals then
			local pos = getpos()
			local crimpad = workspace["Criminals Spawn"].SpawnLocation
			crimpad.CanCollide = false
			crimpad.Transparency = 1
			repeat task.wait()crimpad.CFrame = getpos() until plr.Team == game.Teams.Criminals
			wait()
			MoveTo(pos)
			MoveToJunk(crimpad)
			return
		end
		local a,b,c= nil,getpos(),workspace.CurrentCamera.CFrame
		a =plr.CharacterAdded:Connect(function(Char)
			task.spawn(function()
				workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Wait()
				for i =1,5 do
					workspace.CurrentCamera.CFrame = c
				end
			end)
			Char:WaitForChild("HumanoidRootPart")
			MoveTo(b)
			a:Disconnect()
		end)
		local ohString1 = Team.TeamColor.Name
		workspace.Remote.TeamEvent:FireServer(ohString1)
		return
	end
	function unsit()
		plr.Character:FindFirstChildOfClass("Humanoid").Sit = false
	end
	if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(plr.UserId, 96651) then
		HasGamepass = true
	end
	Events = {
		TeamEvent = workspace.Remote.TeamEvent,
		ShootEvent = game:GetService("ReplicatedStorage").ShootEvent,
		loadchar = function()
			if plr.Team == game.Teams.Inmates then
				local ohString1 = "Bright orange"
				workspace.Remote.TeamEvent:FireServer(ohString1)
			elseif plr.Team == game.Teams.Guards then

				local ohString1 = "Bright blue"
				workspace.Remote.TeamEvent:FireServer(ohString1)
			elseif plr.Team == game.Teams.Criminals then
				workspace.Remote.TeamEvent:FireServer("Bright orange")
				wait(.3)
				local crimpad = workspace["Criminals Spawn"].SpawnLocation
				crimpad.CanCollide = false
				crimpad.Transparency = 1
				repeat task.wait()crimpad.CFrame = getpos() until plr.Team == game.Teams.Criminals
				MoveToJunk(crimpad)
			end
		end,
	}
	function BadArea(Player)
		local mod = require(game.ReplicatedStorage["Modules_client"]["RegionModule_client"])
		local a =pcall(function()
			if mod.findRegion(Player.Character) then
				mod = mod.findRegion(Player.Character)["Name"]
			end
		end)
		if not a then
			return
		end
		for i,v in pairs(game:GetService("ReplicatedStorage").PermittedRegions:GetChildren()) do
			if v and mod == v.Value then
				return false
			end
		end
		return true
	end
	--//pretend this doesnt exist okay?
	FLYING = false
	QEfly = true
	flyspeed = 1
	vehicleflyspeed = 1
	function sFLY(vfly)
		repeat wait() until game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart") and game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		repeat wait() until game:GetService("Players").LocalPlayer:GetMouse()
		if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end

		local T = game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")
		local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
		local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
		local SPEED = 0

		local function FLY()
			FLYING = true
			local BG = Instance.new('BodyGyro')
			local BV = Instance.new('BodyVelocity')
			BG.P = 9e4
			BG.Parent = T
			BV.Parent = T
			BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
			BG.cframe = T.CFrame
			BV.velocity = Vector3.new(0, 0, 0)
			BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
			task.spawn(function()
				repeat wait()
					if not vfly and game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
						game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
					end
					if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
						SPEED = 50
					elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
						SPEED = 0
					end
					if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
						BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
						lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
					elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
						BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					else
						BV.velocity = Vector3.new(0, 0, 0)
					end
					BG.cframe = workspace.CurrentCamera.CoordinateFrame
				until not FLYING
				CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
				lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
				SPEED = 0
				BG:Destroy()
				BV:Destroy()
				if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
					game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
				end
			end)
		end
		flyKeyDown = game:GetService("Players").LocalPlayer:GetMouse().KeyDown:Connect(function(KEY)
			if KEY:lower() == 'w' then
				CONTROL.F = (vfly and vehicleflyspeed or flyspeed)
			elseif KEY:lower() == 's' then
				CONTROL.B = - (vfly and vehicleflyspeed or flyspeed)
			elseif KEY:lower() == 'a' then
				CONTROL.L = - (vfly and vehicleflyspeed or flyspeed)
			elseif KEY:lower() == 'd' then 
				CONTROL.R = (vfly and vehicleflyspeed or flyspeed)
			elseif QEfly and KEY:lower() == 'e' then
				CONTROL.Q = (vfly and vehicleflyspeed or flyspeed)*2
			elseif QEfly and KEY:lower() == 'q' then
				CONTROL.E = -(vfly and vehicleflyspeed or flyspeed)*2
			end
			pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
		end)
		flyKeyUp = game:GetService("Players").LocalPlayer:GetMouse().KeyUp:Connect(function(KEY)
			if KEY:lower() == 'w' then
				CONTROL.F = 0
			elseif KEY:lower() == 's' then
				CONTROL.B = 0
			elseif KEY:lower() == 'a' then
				CONTROL.L = 0
			elseif KEY:lower() == 'd' then
				CONTROL.R = 0
			elseif KEY:lower() == 'e' then
				CONTROL.Q = 0
			elseif KEY:lower() == 'q' then
				CONTROL.E = 0
			end
		end)
		FLY()
	end

	function NOFLY()
		FLYING = false
		if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
		if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
			game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
		end
		pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
	end
	function GetGun(Item,Ignore)
		local saved = game:GetService("Players").LocalPlayer.Character:GetPrimaryPartCFrame()
		if workspace.Prison_ITEMS.giver:FindFirstChild(Item) and workspace.Prison_ITEMS.giver:FindFirstChild(Item):FindFirstChild("ITEMPICKUP") then
			Item =workspace.Prison_ITEMS.giver:FindFirstChild(Item)
			local ohInstance1 = Item:FindFirstChildOfClass("Part")
			MoveTo(CFrame.new(ohInstance1.Position))
			repeat wait()
				local ohInstance1 = Item:FindFirstChildOfClass("Part")
				MoveTo(CFrame.new(ohInstance1.Position))
				task.spawn(function()
					workspace.Remote.ItemHandler:InvokeServer(ohInstance1)
				end)
				wait()
			until plr.Backpack:FindFirstChild(Item.Name) or plr.Character:FindFirstChild(Item.Name)
		end
		if Ignore ~= true then
			plr.Character:SetPrimaryPartCFrame(Ignore or saved)
		end
	end
	function Fly(Enable,SpeedNew)
		if Enable then
			if Temp.FlyConnection then
				return
			end
			Temp.FlyConnection= RunService.Heartbeat:Connect(function()
				if true then
					plr.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(plr.Character:WaitForChild("HumanoidRootPart").Position, plr.Character:WaitForChild("HumanoidRootPart").Position + Vector3.new(Mouse.Hit.lookVector.x, Mouse.Hit.lookVector.Y, Mouse.Hit.lookVector.z))
				end
			end)

			local Speed = tonumber(SpeedNew)/2 or .1
			local Y = 1
			local State = 8
			local StartingPosition = plr.Character.PrimaryPart.CFrame

			local Keys = {
				w = false,
				a = false,
				s = false,
				d = false,
			}
			local function MoveBy(a)
				if not Temp.FlyConnection then
					return
				end
				plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame *a
			end
			Mouse.KeyUp:Connect(function(Key)
				if Key and Keys[Key:lower()] ~= nil and Temp.FlyConnection then
					Keys[Key:lower()] = false
				end
			end)
			Mouse.KeyDown:Connect(function(Key)
				if Key and Keys[Key:lower()] ~= nil and Temp.FlyConnection then
					Keys[Key:lower()] = true
				end
			end)

			plr.Character.HumanoidRootPart.Changed:Connect(function()
				if true and Temp.FlyConnection then
					plr.Character.HumanoidRootPart.Velocity = Vector3.new(0,Y,0)
				end
			end)
			RunService.RenderStepped:Connect(function()
				if true and Temp.FlyConnection then
					plr.Character.HumanoidRootPart.Velocity = Vector3.new(0,Y,0)
					if Keys.w then
						MoveBy(CFrame.new(0,0,-Speed))
					end
					if Keys.a then
						MoveBy(CFrame.new(-Speed,0,0))
					end
					if Keys.s then
						MoveBy(CFrame.new(0,0,Speed))
					end
					if Keys.d then
						MoveBy(CFrame.new(Speed,0,0))
					end
				end
			end)
			task.spawn(function()
				repeat wait(.4)
					if unloaded then
						break
					end
					pcall(function()
						plr.Character:FindFirstChildOfClass("Humanoid").StateChanged:Connect(function()
							if not Temp.FlyConnection then
								return
							end
							plr.Character:FindFirstChildOfClass("Humanoid"):ChangeState(State)
						end)
						plr.Character:FindFirstChildOfClass("Humanoid"):ChangeState(State)
					end)
				until not Temp.FlyConnection
			end)
			local function rwait(a)
				if true then
					wait(a)
				end
			end
			local function rwait2()
				if true then
					task.wait()
				end
			end
			task.spawn(function()
				repeat wait(1)
					if unloaded then
						break
					end
					if true and Temp.FlyConnection then
						pcall(function()
							State = 7--//Landed
							rwait(.1)
							State=8--//Running
							rwait(1)
							State = 3--//Jumping
							rwait2()
							State = 5--//Falling
						end)
					end
				until not Temp.FlyConnection

			end)
			local function onInputBegan(input, _gameProcessed)
				if input.KeyCode == Enum.KeyCode.Space then
					Y = 20
				end
				if input.KeyCode == Enum.KeyCode.LeftShift then
					Y = -20
				end
			end
			local function onInputEnded(input, _gameProcessed)

				if input.KeyCode == Enum.KeyCode.Space then
					Y = 1
				end
				if input.KeyCode == Enum.KeyCode.LeftShift then
					Y = 1
				end
			end
			UserInputService.InputBegan:Connect(onInputBegan)

			UserInputService.InputEnded:Connect(onInputEnded)

		else
			pcall(function()
				Temp.FlyConnection:Disconnect()
				Temp.FlyConnection=nil
			end)
			pcall(function()
				wait(.1)
				plr.Character:FindFirstChildOfClass("Humanoid"):ChangeState(18)
				wait(.04)
				char:FindFirstChildOfClass("Humanoid"):ChangeState(8)
			end)
		end

	end
	function All_Guns()
		local saved = game:GetService("Players").LocalPlayer.Character:GetPrimaryPartCFrame()
		if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(plr.UserId, 96651) then
			GetGun("M4A1",true)
		end
		GetGun("AK-47",true)
		task.spawn(function()
			GetGun("Remington 870",true)
		end)
		GetGun("M9",true)
		game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(saved)
	end
	function GetTeam()
		return plr.TeamColor.Name
	end
	function GenerateShootTable(Hit)
		local Generated = {}
		for i=1,15 do
			Generated[#Generated+1]={
				["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
				["Distance"] =0, 
				["Cframe"] = CFrame.new(), 
				["Hit"] = Hit
			}
		end
		return Generated
	end

	function Valid_Team(Team)
		if Team and typeof(Team):lower()=="string" then
			local Valid = {
				"Bright orange",
				"Bright blue",
			}
			if table.find(Valid,Team) then
				return true
			elseif Team == "Really red" then
				return 1
			end
			return nil
		end
	end
	function Last_Team(Lastteam)
		task.spawn(function()
			local a,b,c= nil,getpos(),workspace.CurrentCamera.CFrame
			a =plr.CharacterAdded:Connect(function(Char)
				task.spawn(function()
					workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Wait()
					for i =1,5 do
						workspace.CurrentCamera.CFrame = c
					end
				end)
				Char:WaitForChild("HumanoidRootPart")
				MoveTo(b)
				a:Disconnect()
			end)
			local Team = Valid_Team(Lastteam)
			if Team and Team~=1 then
				local pos = getpos()
				workspace.Remote.TeamEvent:FireServer(Lastteam)
			elseif Team and Team == 1 then
				workspace.Remote.TeamEvent:FireServer("Bright orange")
				local crimpad = workspace["Criminals Spawn"].SpawnLocation
				crimpad.CanCollide = false
				crimpad.Transparency = 1
				repeat task.wait()crimpad.CFrame = getpos() until plr.Team == game.Teams.Criminals
				MoveToJunk(crimpad)
			end
		end)
	end
	function GetPlayersPart(player)
		if player and player.Character then
			return player.Character:FindFirstChild("Head") or player.Character:FindFirstChildOfClass("Part") or player.Character:FindFirstChildOfClass("MeshPart")
		end
	end
	function CreateKillPart()
		if Parts[1] then
			pcall(function()
				Parts[1]:Destroy()
			end)
			Parts[1] = nil
		end
		local Part = Instance.new("Part",plr.Character)
		local hilight = Instance.new("Highlight",Part)
		hilight.FillTransparency = 1

		Part.Anchored = true
		Part.CanCollide = false
		Part.CanTouch = false
		Part.Material = Enum.Material.SmoothPlastic
		Part.Transparency = .98
		Part.Material = Enum.Material.SmoothPlastic
		Part.BrickColor = BrickColor.White()
		Part.Size = Vector3.new(20,2,20)
		Part.Name = "KillAura"
		Parts[1] = Part
	end
	function MKILL(target,STOP,P)
		if target == plr or target == plr.Name then
			return
		end
		if typeof(target):lower() == "string" and game:GetService("Players"):FindFirstChild(target) then
			target = game:GetService("Players"):FindFirstChild(target)
		end
		if not STOP then STOP =1 end
		if not target or not target.Character or not target.Character:FindFirstChild("Humanoid") or target.Character:FindFirstChildOfClass("ForceField") or target.Character:FindFirstChild("Humanoid").Health<1 or not plr.Character or not plr.Character:FindFirstChildOfClass("Humanoid") or not plr.Character:FindFirstChild("HumanoidRootPart")  then
			return
		end
		unsit()
		local saved = getpos()
		if not P then P = saved else saved = P end
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character:FindFirstChild("Head").CFrame
		wait(.2)
		for i =1,10 do
			task.spawn(function()
				game.ReplicatedStorage["meleeEvent"]:FireServer(target)
			end)
		end
		wait(.1)
		if target and target.Character and target.Character:FindFirstChild("Humanoid") and target.Character:FindFirstChild("Humanoid").Health >1 and STOP ~=3 then
			MKILL(target,STOP+1,P)
			return
		end
		MoveTo(saved)
	end
	function Kill_All(TeamS)
		local a = GetTeam()
		local saved = getpos()
		local Team = GetTeam()
		if not TeamS then
			ChangeTeam(game.Teams.Inmates)
		end
		GetGun("M9")
		repeat task.wait() until plr.Backpack:FindFirstChild("M9")
		local Gun = plr.Backpack:FindFirstChild("M9")
		local Gen = {}
		if TeamS then
			if TeamS == game.Teams.Guards then
				ChangeTeam(game.Teams.Inmates)
			elseif TeamS == game.Teams.Inmates then
				ChangeTeam(game.Teams.Criminals)
			end
		end
		if not TeamS then
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				if not table.find(Whitelisted,v.Name) and v ~= plr then
					if v.Team == game.Teams.Criminals then
						for i =1,10 do
							Gen[#Gen+1]={
								["RayObject"] = Ray.new(Vector3.new(0,0,0), Vector3.new(0,0,0)),
								["Distance"] = .1,
								["Cframe"] = CFrame.new(),
								["Hit"] = v.Character:WaitForChild("Head")
							}
						end
					end
				end
			end
			game:GetService("ReplicatedStorage").ShootEvent:FireServer(Gen, Gun)
		end
		--
		if not TeamS then
			ChangeTeam(game.Teams.Criminals)
		end
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			if not table.find(Whitelisted,v.Name) and v ~= plr then
				if (TeamS and v.Team == TeamS) or not TeamS then
					for i =1,10 do
						Gen[#Gen+1]={
							["RayObject"] = Ray.new(Vector3.new(0,0,0), Vector3.new(0,0,0)),
							["Distance"] = .1,
							["Cframe"] = CFrame.new(),
							["Hit"] = v.Character:WaitForChild("Head")
						}
					end
				end
			end
		end
		game:GetService("ReplicatedStorage").ShootEvent:FireServer(Gen, Gun)
		wait(.1)
		Last_Team(a)
		wait(.4)
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = saved
	end
	function keycard()
		if plr.Character:FindFirstChild("Key card") or plr.Backpack:FindFirstChild("Key card") then
			return Notif("You already have a keycard!")
		end
		if game:GetService("Workspace")["Prison_ITEMS"].single:FindFirstChild("Key card") then
			local a =getpos()
			local Key = workspace.Prison_ITEMS.single["Key card"].ITEMPICKUP
			MoveTo(CFrame.new(workspace.Prison_ITEMS.single["Key card"].ITEMPICKUP.Position))
			wait()
			repeat wait(.1)
				local a =pcall(function()
					local Key = workspace.Prison_ITEMS.single["Key card"].ITEMPICKUP
					game.Workspace.Remote["ItemHandler"]:InvokeServer(Key)
					MoveTo(CFrame.new(workspace.Prison_ITEMS.single["Key card"].ITEMPICKUP.Position+Vector3.new(0,3,0)))
				end)
				if not a then
					break
				end
			until plr.Backpack:FindFirstChild("Key card")
			wait()
			MoveTo(a)
			return
		end
		local a,b= getpos(),plr.TeamColor.Name
		local HadOn = States.autore
		if HadOn then
			States.autore = false
		end
		ChangeTeam(game.Teams.Guards)
		repeat wait(.2)
			pcall(function()
				plr.Character:FindFirstChildOfClass("Humanoid").Health =0
				wait(.2)
				ChangeTeam(game.Teams.Guards)
			end)
		until game:GetService("Workspace")["Prison_ITEMS"].single:FindFirstChild("Key card")
		if HadOn then
			States.autore = true
		end
		Last_Team(b)
		wait(.1)
		MoveTo(CFrame.new(workspace.Prison_ITEMS.single["Key card"].ITEMPICKUP.Position))
		wait()
		repeat wait(.1)
			local a =pcall(function()
				local Key = workspace.Prison_ITEMS.single["Key card"].ITEMPICKUP
				game.Workspace.Remote["ItemHandler"]:InvokeServer(Key)
				MoveTo(CFrame.new(workspace.Prison_ITEMS.single["Key card"].ITEMPICKUP.Position+Vector3.new(0,3,0)))
			end)
			if not a then
				break
			end
		until plr.Backpack:FindFirstChild("Key card")
		wait()
		MoveTo(a)

	end
	function ReturnGun()
		for i,v in pairs(plr.Backpack:GetChildren()) do
			if v and v:IsA("Tool") and v:FindFirstChildOfClass("ModuleScript") then
				return v
			end
		end
		return nil
	end
	function kill(player,Type)
		if typeof(player):lower() == "string" then
			if game:GetService("Players"):FindFirstChild(player) then
				player = game:GetService("Players"):FindFirstChild(player)
			else
				return
			end
		end
		if player == plr or player == plr.Name then
			return Notif("Can't kill yourself????")
		end
		local Gun = ReturnGun()
		if table.find(Whitelisted,player.Name) then
			print("error is whitelisted - 1")
			return Notif("This player is whitelisted")
		end
		if Gun and plr.Team ~= player.Team then
			local Gen = {}
			for i =1,15 do
				Gen[#Gen+1]={
					["RayObject"] = Ray.new(Vector3.new(0,0,0), Vector3.new(0,0,0)),
					["Distance"] = .1,
					["Cframe"] = CFrame.new(),
					["Hit"] = player.Character:WaitForChild("Head")
				}
			end

			game:GetService("ReplicatedStorage").ShootEvent:FireServer(Gen, Gun)
		else
			MKILL(player)
		end
		wait(.3)
		if player.Character:FindFirstChildOfClass("Humanoid") and player.Character:FindFirstChildOfClass("Humanoid").Health <1 then
			Notif("Player has been killed")
		else
			Notif("Failed to kill player")
		end
	end
	function tase_all()
		local lastteam,Last = plr.TeamColor.Name,getpos()
		local Table = {}
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			if v and v.Team ~= game:GetService("Teams").Guards and v ~= plr then
				Table[#Table+1]={
					["RayObject"] = Ray.new(Vector3.new(972.877869, 101.489967, 2362.66821), Vector3.new(-53.8579292, -7.45228672, 83.9272766)),
					["Distance"] = 1,
					["Cframe"] = CFrame.new(969.60144, 100.734177, 2369.42334, 0.777441919, -0.0313242674, -0.628174186, 1.86264515e-09, 0.998758912, -0.0498036928, 0.628954709, 0.038719479, 0.776477098),
					["Hit"] = v.Character.HumanoidRootPart
				}
			end
		end
		if plr.Team ~= game.Teams.Guards then
			local ohString1 = "Bright blue"
			task.spawn(function()
				plr.CharacterAdded:Wait():WaitForChild("HumanoidRootPart").CFrame = Last
			end)
			workspace.Remote.TeamEvent:FireServer(ohString1)
		end
		repeat task.wait() until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Taser")
		game:GetService("ReplicatedStorage").ShootEvent:FireServer(Table, game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Taser"))
		task.spawn(function() game:GetService("ReplicatedStorage").ReloadEvent:FireServer(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Taser")) end)
		wait(.3)
		Last_Team(lastteam)
		plr.CharacterAdded:Wait():WaitForChild("HumanoidRootPart").CFrame = Last
	end
	function tase(player)
		print("Called")
		local lastteam,Last = plr.TeamColor.Name,getpos()
		if typeof(player):lower() == "string" then
			if game:GetService("Players"):FindFirstChild(player) then
				player = game:GetService("Players"):FindFirstChild(player)

			end
		end
		if table.find(Whitelisted,player.Name) then
			print("error is whitelisted - 1")
			return Notif("This player is whitelisted")
		end
		if plr.Team ~= game.Teams.Guards then
			local ohString1 = "Bright blue"
			task.spawn(function()
				plr.CharacterAdded:Wait():WaitForChild("HumanoidRootPart").CFrame = Last
			end)
			workspace.Remote.TeamEvent:FireServer(ohString1)
		end
		repeat task.wait() until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Taser")
		wait(.3)
		game:GetService("ReplicatedStorage").ShootEvent:FireServer({
			[1] = {
				["RayObject"] = Ray.new(Vector3.new(972.877869, 101.489967, 2362.66821), Vector3.new(-53.8579292, -7.45228672, 83.9272766)),
				["Distance"] = 1,
				["Cframe"] = CFrame.new(969.60144, 100.734177, 2369.42334, 0.777441919, -0.0313242674, -0.628174186, 1.86264515e-09, 0.998758912, -0.0498036928, 0.628954709, 0.038719479, 0.776477098),
				["Hit"] = player.Character.HumanoidRootPart
			}
		}, game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Taser"))
		print('ShotBullet')
		task.spawn(function() game:GetService("ReplicatedStorage").ReloadEvent:FireServer(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Taser")) end)
		print('Reloaded')
		wait(.4)
		Last_Team(lastteam)
		plr.CharacterAdded:Wait():WaitForChild("HumanoidRootPart").CFrame = Last
	end
	function touch(Toucher,TouchThis)
		if not Toucher or not TouchThis then
			return
		end
		task.spawn(function()
			firetouch(Toucher,TouchThis,0)
			firetouch(Toucher,TouchThis,1)
			print("Touch")
		end)
	end
	function MoveTo(Pos,t)
		unsit()
		pcall(function()
			if typeof(Pos):lower() == "position" then
				Pos = CFrame.new(Pos)
			end
			for i =1,3 do
				plr.Character:FindFirstChild("HumanoidRootPart").CFrame = Pos
			end
		end)
	end
	function getpos()
		return plr.Character:FindFirstChild("HumanoidRootPart").CFrame
	end
	function AntiPunchC(v2)
		pcall(function()
			if v2 == plr then
				return
			end
			v2.Character:FindFirstChildOfClass("Humanoid").AnimationPlayed:Connect(function(animationTrack)
				if States.AntiPunch and not unloaded then
					if animationTrack.Animation.AnimationId == "rbxassetid://484200742" or animationTrack.Animation.AnimationId =="rbxassetid://484926359" then
						if (plr.Character.HumanoidRootPart.Position-v2.Character.HumanoidRootPart.Position).magnitude <3.5 and not table.find(Whitelisted,v2.Name) and not IsBringing then
							for i =1,13 do
								task.spawn(function()
									game.ReplicatedStorage["meleeEvent"]:FireServer(v2)
								end)
							end
						end
					end
				end
			end)
		end)
	end


	function refresh(Pos)
		if not Pos then
			Pos = getpos()
		end
		Resfreshing = true
		local Goto = Pos or getpos()
		local Connections = {}
		local Cam = workspace.CurrentCamera.CFrame
		Connections[1] = plr.CharacterAdded:Connect(function(charnew)
			pcall(function()
				task.spawn(function()
					workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Wait()
					for i =1,5 do
						workspace.CurrentCamera.CFrame = Cam
					end
				end)
				repeat task.wait() until charnew and charnew:FindFirstChild("HumanoidRootPart")
				MoveTo(Goto)
				task.spawn(function()
					wait(.05)
					MoveTo(Goto)
					Resfreshing = false
				end)
				Connections[1]:Disconnect()
			end)
		end)
		Events.loadchar()
		print("Refreshed")
		return
	end
	--//
	function FixHats(Hats)
		local function FindHat(a)
			for i,v in pairs(Hats) do
				if v and v == a then
					return v
				end
			end
			return nil
		end
		--Fix hats 2
		for i,v in pairs(Hats) do
			if v then
				pcall(function()
					local Hat = v.Hat
					local NewWeld = Instance.new("Weld",Hat.Handle)
					NewWeld.Part0 = Hat.Handle
					NewWeld.Part1 = plr.Character.Head
					NewWeld.C0 = v.OldPosition
					NewWeld.C1 = v.OldPosition2
					Hat.Handle.Anchored = false
				end)
			end
		end
	end

end

do
	--//Commands
	function NotFound()
		Notif("Player left or is not in server!")
	end
	function Toggle(a,b)
		if not a then
			States[b] = not States[b]
		elseif a == "on" then
			States[b] = true
		elseif a == "off" then
			States[b] = false
		end
		Notif(b.." is now set to "..tostring(States[b]))
	end
	Add_Command("cmds",function(Args)

		local Args = GetArgs(Args)
		if not Temp.CmdsC then
			Temp.CmdsC = true
			if Commands.Visible == false then
				Commands.Position = Commands.Position+UDim2.new(0,0,1,0)
				wait(.1)
				Commands:TweenPosition(SavedCmdsPosition,"Out","Quart",1)
				Commands.Visible = true
			else
				Commands:TweenPosition(SavedCmdsPosition+UDim2.new(0,0,1,0),"Out","Quart",1)
				wait(.5)
				Commands.Visible = false
			end
			wait(.7)
			Temp.CmdsC = false
		end
		Notif("Type cmds again to close the gui!")
	end,"Shows commands gui")
	Add_Command("rejoin",function(Args)
		local Args = GetArgs(Args)
		Notif("Rejoining...")
		wait(.3)
		if #game:GetService("Players"):GetPlayers() ==1 then
			game:GetService("Players").LocalPlayer:Kick("Please wait.")
			game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
		else
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
		end
	end,"Rejoins the server")
	Add_Command("opendoors",function(Args)
		local Args = GetArgs(Args)
		local LastTeam =plr.TeamColor.Name
		ChangeTeam(game.Teams.Guards)
		wait(.7)
		task.spawn(function()
			local Arg_1 = game:GetService("Workspace")["Prison_ITEMS"].buttons["Prison Gate"]["Prison Gate"]
			local Event = game:GetService("Workspace").Remote.ItemHandler
			Event:InvokeServer(Arg_1)
		end)
		for i,v in pairs(game:GetService("Workspace").Doors:GetChildren()) do
			if v then
				if v:FindFirstChild("block") and v:FindFirstChild("block"):FindFirstChild("hitbox") then
					firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.block.hitbox,0)
					firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.block.hitbox,1)
				end
			end
		end
		wait(1)
		Last_Team(LastTeam)
	end,"Opens every door")
	Add_Command("prefix",function(Args)
		local Args = GetArgs(Args)
		if Args[2] and tostring(Args[2]) then
			Prefix = tostring(Args[2])
			for i,v in pairs(TableCommands) do
				if v then
					v.Name = Prefix..string.sub(v.Name,2,#v.Name)
				end
			end
			for i,v in pairs(CommandsRawList) do
				if v then
					v.Text = Prefix..string.sub(v.Text,2,#v.Text)
				end
			end
			Notif("prefix set to "..Args[2])
		else
			Notif("no prefix selected?")
		end

	end,"sets a prefix","STRING_COMMAND")
	Add_Command("keycard",function(Args)
		local Args = GetArgs(Args)
		keycard()
	end,"true",true)
	Add_Command("btools",function(Args)
		local Args = GetArgs(Args)
		Instance.new("HopperBin",plr.Backpack).BinType = 3
		Instance.new("HopperBin",plr.Backpack).BinType = 4
	end,"client sided btools that you can only see")
	Add_Command("key",function(Args)
		local Args = GetArgs(Args)
		keycard()
	end,"Gives you a keycard")
	Add_Command("view",function(Args)
		local Args = GetArgs(Args)
		local r = FindPlayer(Args[2])
		if r then
			Temp.Viewing = nil
			wait(.04)
			Temp.Viewing = r
			workspace.CurrentCamera.CameraSubject = r.Character:FindFirstChildOfClass("Humanoid")
			repeat wait()
				workspace.CurrentCamera.CameraSubject = r.Character:FindFirstChildOfClass("Humanoid")
			until Temp.Viewing == nil
		else
			NotFound()
		end
	end,"views a player","PLAYER_COMMAND")
	Add_Command("unview",function(Args)
		local Args = GetArgs(Args)
		Temp.Viewing = nil
		wait()
		workspace.CurrentCamera.CameraSubject = plr.Character:FindFirstChildOfClass("Humanoid")
	end,"unviews")
	Add_Command("m9",function(Args)
		local Args = GetArgs(Args)
		GetGun("M9")
	end,"Gets m9")
	Add_Command("m4a1",function(Args)
		local Args = GetArgs(Args)
		GetGun("M4A1")
	end,"Gets M4A1")
	Add_Command("tase",function(Args)
		local Args = GetArgs(Args)
		local r = FindPlayer(Args[2])
		if Args[2] == "all" then
			tase_all()
			return
		end
		if r then
			tase(r)
		end
	end,"tases a player","PLAYER_COMMAND")
	Add_Command("ak",function(Args)
		local Args = GetArgs(Args)
		GetGun("AK-47")
	end,"Gets ak47")
	Add_Command("shotgun",function(Args)
		local Args = GetArgs(Args)
		GetGun("Remington 870")
	end,"Gets a shotgun")
	Add_Command("rj",function(Args)
		local Args = GetArgs(Args)
		Execute_Command("!rejoin","!rejoin")
	end,"true",true)
	Add_Command("refresh",function(Args)
		local Args = GetArgs(Args)
		refresh()
	end,"Respawns your character")
	Add_Command("car",function(Args)
		local Args = GetArgs(Args)
		pcall(function()
			local OldPos = game:GetService("Players").LocalPlayer.Character:GetPrimaryPartCFrame()
			game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-910, 95, 2157))
			wait()
			local car = nil
			task.spawn(function()
				car = game:GetService("Workspace").CarContainer.ChildAdded:Wait()
			end)
			repeat wait(.1)
				local ohInstance1 = game:GetService("Workspace").Prison_ITEMS.buttons:GetChildren()[8]["Car Spawner"]
				workspace.Remote.ItemHandler:InvokeServer(ohInstance1)
			until car
			repeat task.wait() until car:FindFirstChild("RWD") and car:FindFirstChild("Body") and car:FindFirstChild("Body"):FindFirstChild("VehicleSeat")
			car.PrimaryPart = car.RWD
			game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(OldPos)
			local Done = false
			car.Body.VehicleSeat:Sit(game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"))
			repeat 
				game:GetService("RunService").RenderStepped:Wait()
				car:SetPrimaryPartCFrame(OldPos)
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =CFrame.new(car.Body.VehicleSeat.Position)
				car.Body.VehicleSeat:Sit(game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"))
				if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit == true then
					Done = true
				end
			until Done
		end)
	end,"Brings a car to your location")
	Add_Command("re",function(Args)
		local Args = GetArgs(Args)
		Execute_Command("!refresh","!refresh")
	end,"true",true,true,true)
	Add_Command("godmode",function(Args)
		local Args = GetArgs(Args)
		Toggle(Args[2],"Godmode")
		if States.Godmode then--//Long ass godmode
			Godmode()
			local OldP = getpos()
			Temp.IsG = false
			wait()
			Temp.IsG = true
			Temp.ST =false
			local Cam = workspace.CurrentCamera.CFrame
			Temp.Godmode = plr.CharacterAdded:Connect(function(a)
				Temp.ST = true
				task.spawn(function()
					workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Wait()
					for i =1,5 do
						workspace.CurrentCamera.CFrame = Cam
					end
				end)
				repeat task.wait() until a and a:FindFirstChildOfClass("Humanoid")
				MoveTo(OldP)
				Godmode()
				wait()
				Temp.ST = false
				task.spawn(function()
					task.wait(.04)
					MoveTo(OldP)
				end)
			end)
			repeat swait()
				if not States.Godmode or unloaded then
					if unloaded then
						pcall(function()
							Temp.IsG = false
							Temp.ST = nil
							Temp.Godmode:Disconnect()
						end)
					end
					break
				end
				if not Temp.ST then
					Cam = workspace.CurrentCamera.CFrame
					OldP = getpos()
				end
			until States.Godmode == false
		else
			pcall(function()
				Temp.IsG = false
				Temp.ST = nil
				Temp.Godmode:Disconnect()
			end)
			wait()
			refresh()
		end
	end,"Makes you in godmode","TOGGLE_COMMAND")
	Add_Command("unload",function(Args)
		local Args = GetArgs(Args)
		unloaded= true
		for i,v in pairs(Temp) do
			if v and typeof(v) == "RBXScriptConnection" then
				v:Disconnect()
			end
		end
		Temp = {}
		for i,v in pairs(States) do v = false end
		for i,v in pairs(TigerGuis) do if v then v:Destroy() end end
		pcall(function()
			game:GetService("Players").LocalPlayer.PlayerScripts.ClientGunReplicator.Disabled = false
		end)
		Folder:Destroy()
		do
			Temp.Viewing = nil
			wait()
			workspace.CurrentCamera.CameraSubject = plr.Character:FindFirstChildOfClass("Humanoid")
		end
		Notif("Tiger admin is now unloaded, see you soon!")
	end,"Unloads everything")

	Add_Command("kill",function(Args)
		local Args = GetArgs(Args)
		local Check1 = function(ar)
			for i,v in pairs(game:GetService("Teams"):GetChildren()) do
				if v and v.Name:lower() == ar:lower() then
					return v
				end
			end
			return nil
		end
		if Args[2] then
			if Args[2] == "all" then
				Kill_All()
			elseif Check1(Args[2])  then
				Kill_All(Check1(Args[2]))
			else
				local r = FindPlayer(Args[2])
				if r then
					kill(r)
				else
					NotFound()
				end
			end
		else
			Notif("Missing arg2 !kill player")
		end
	end,"kills a player","PLAYER_COMMAND")
	Add_Command("serverhop",function(Args)
		local Args = GetArgs(Args)
		local Ids = {}
		for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
			if typeof(v) == "table" and v['maxPlayers'] > v['playing'] and v['id'] ~= game['JobId'] then
				table.insert(Ids,v.id)
			end
		end
		return game:GetService("TeleportService"):TeleportToPlaceInstance(game['PlaceId'], Ids[math.random(1, #Ids)])
	end,"Joins another server")
	Add_Command("loopkill",function(Args)
		local Args = GetArgs(Args)
		local r =FindPlayer(Args[2])
		if Args[2]=="all" then
			task.spawn(function()
				if Temp.LkAll==false then
					Temp.LkAll = true
					repeat wait()
						Kill_All()
					until Temp.LkAll == nil
				end
			end)
			return
		end
		if r then
			loopkilling[#loopkilling+1]=r.Name
			Notif("loop killing "..r.Name)
		else
			NotFound()
		end
	end,"loop kills a player","PLAYER_COMMAND")
	Add_Command("unloopkill",function(Args)
		local Args = GetArgs(Args)
		local r =FindPlayer(Args[2])
		if Args[2]=="all" then
			Notif("Unloop killed all")
			Temp.LkAll = nil
			return
		end
		if r then
			table.remove(loopkilling,table.find(loopkilling,r.Name))
			Notif("unlooped "..r.Name)
		else
			NotFound()
		end
	end,"unloop kills a player","PLAYER_COMMAND")
	Add_Command("whitelist",function(Args)
		local Args = GetArgs(Args)
		local r =FindPlayer(Args[2])
		if r then
			Whitelisted[#Whitelisted+1]=r.Name
			Notif("whitelisted "..r.Name)
		else
			NotFound()
		end
	end,"Cant harm that player with commands","PLAYER_COMMAND")
	Add_Command("unwhitelist",function(Args)
		local Args = GetArgs(Args)
		local r =FindPlayer(Args[2])
		if r then
			table.remove(Whitelisted,table.find(Whitelisted,r.Name))
			Notif("unwhitelisted "..r.Name)
		else
			NotFound()
		end
	end,"unwhitelists a player","PLAYER_COMMAND")
	Add_Command("admins",function(Args)
		local Args = GetArgs(Args)
		local Found = ""
		for i,v in pairs(States.Admined) do
			Found = Found..v.." "
		end
		Notif(Found,3)
	end,"Shows you all the players you admined")
	Add_Command("autoadmin",function(Args)
		local Args = GetArgs(Args)
		local r =FindPlayer(Args[2])
		if r then
			States.Admined[#States.Admined+1]=r.Name
			Notif("Admined "..r.Name)
			Msg(r,"You have been admined say !cmds to get started!")
			SavedAdmins[#SavedAdmins+1] = r.Name
			if writefile and readfile then
				local New = {}
				local Content = game:GetService("HttpService"):JSONDecode(readfile("Tiger_Admin/SavedAdmins.json"))
				for i,v in pairs(Content) do
					if v then
						table.insert(New,v)
					end
				end
				table.insert(New,r.Name)
				writefile("Tiger_Admin/SavedAdmins.json",game:GetService("HttpService"):JSONEncode(New))
			end
		else
			NotFound()
		end
	end,"when you execute script it saves all admins","PLAYER_COMMAND")
	Add_Command("unautoadmin",function(Args)
		local Args = GetArgs(Args)
		if writefile and readfile then
			local Content = game:GetService("HttpService"):JSONDecode(readfile("Tiger_Admin/SavedAdmins.json"))
			local Found = FindString(Args[2],Content)
			local New = {}
			if Found then
				for i,v in pairs(Content) do
					warn(v)
					if v and v ~= Found then
						table.insert(New,v)
					else
						warn("removed")
					end
				end
				Notif("Removed admin from player")
			end
			writefile("Tiger_Admin/SavedAdmins.json",game:GetService("HttpService"):JSONEncode(New))
		end
	end,"removes autoadmin from a player","PLAYER_COMMAND")
	Add_Command("admin",function(Args)
		local Args = GetArgs(Args)
		local r =FindPlayer(Args[2])
		if r then
			States.Admined[#States.Admined+1]=r.Name
			Notif("Admined "..r.Name)
			Msg(r,"You have been admined say !cmds to get started!")
		else
			NotFound()
		end
	end,"Admins a player","PLAYER_COMMAND")
	Add_Command("laggun",function(Args)
		local Args = GetArgs(Args)
		if plr.Character:FindFirstChildOfClass("Tool") then
			local Tool = plr.Character:FindFirstChildOfClass("Tool")
			if not Tool:FindFirstChild("GunStates") then
				return Notif("Needs to be a gun!")
			end
			local cc = require(Tool.GunStates)
			cc["Damage"] = 9e9
			cc["FireRate"] = -math.huge
			cc["Range"] = math.huge
			cc["MaxAmmo"] = math.huge
			cc["StoredAmmo"] = math.huge
			cc["AmmoPerClip"] = math.huge
			cc["CurrentAmmo"] = math.huge
			if Tool.Name ~= "Remington 870" then
				cc["Bullets"] = 100
				cc["AutoFire"] = true
			end
			Reload_Guns[#Reload_Guns+1]=Tool
			UneqTools()
		else
			Notif("You need to hold the tool you want to mod!")
		end
	end,"you shoot server gone")
	Add_Command("modgun",function(Args)
		local Args = GetArgs(Args)
		if plr.Character:FindFirstChildOfClass("Tool") then
			local Tool = plr.Character:FindFirstChildOfClass("Tool")
			if not Tool:FindFirstChild("GunStates") then
				return Notif("Needs to be a gun!")
			end
			local cc = require(Tool.GunStates)
			cc["Damage"] = 9e9
			cc["FireRate"] = 0.001
			cc["Range"] = math.huge
			cc["MaxAmmo"] = math.huge
			cc["StoredAmmo"] = math.huge
			cc["AmmoPerClip"] = math.huge
			cc["CurrentAmmo"] = math.huge
			if Tool.Name ~= "Remington 870" then
				cc["Bullets"] = 1
				cc["AutoFire"] = true
			end
			Reload_Guns[#Reload_Guns+1]=Tool
			UneqTools()
		else
			Notif("You need to hold the tool you want to mod!")
		end
	end,"Mods your gun")
	Add_Command("autofire",function(Args)
		local Args = GetArgs(Args)
		if plr.Character:FindFirstChildOfClass("Tool") then
			local Tool = plr.Character:FindFirstChildOfClass("Tool")
			if not Tool:FindFirstChild("GunStates") then
				return Notif("Needs to be a gun!")
			end
			local cc = require(Tool.GunStates)
			cc["AutoFire"] = true
			Reload_Guns[#Reload_Guns+1]=Tool
			UneqTools()
		else
			Notif("You need to hold the tool you want to mod!")
		end
	end,"Makes your gun autofire")
	Add_Command("firerate",function(Args)
		local Args = GetArgs(Args)
		if plr.Character:FindFirstChildOfClass("Tool") then
			local Tool = plr.Character:FindFirstChildOfClass("Tool")
			if not Tool:FindFirstChild("GunStates") then
				return Notif("Needs to be a gun!")
			end
			local cc = require(Tool.GunStates)
			cc["FireRate"] = -math.huge
			Reload_Guns[#Reload_Guns+1]=Tool
			UneqTools()
		else
			Notif("You need to hold the tool you want to mod!")
		end
	end,"Shoot very fast")
	Add_Command("infammo",function(Args)
		local Args = GetArgs(Args)
		if plr.Character:FindFirstChildOfClass("Tool") then
			local Tool = plr.Character:FindFirstChildOfClass("Tool")
			if not Tool:FindFirstChild("GunStates") then
				return Notif("Needs to be a gun!")
			end
			Reload_Guns[#Reload_Guns+1]=Tool
			local cc = require(Tool.GunStates)
			cc["MaxAmmo"] = math.huge
			cc["StoredAmmo"] = math.huge
			cc["AmmoPerClip"] = math.huge
			cc["CurrentAmmo"] = math.huge
			UneqTools()
		else
			Notif("You need to hold the tool you want to mod!")
		end
	end,"makes your gun have inf ammo")
	Add_Command("unadmin",function(Args)
		local Args = GetArgs(Args)
		local r = Args[2]
		if States.Admined and r then
			table.remove(States.Admined,table.find(States.Admined,r.Name))
			Notif("Unadmined "..r.Name)
		else
			NotFound()
		end
	end,"Admins a player","PLAYER_COMMAND")
	Add_Command("jump",function(Args)
		local Args = GetArgs(Args)
		local r = Args[2]
		if r and tonumber(r) then
			plr.Character:FindFirstChildOfClass("Humanoid").JumpPower = r
		end
	end,"jumppower what else do you think","NUMBER_COMMAND")
	Add_Command("speed",function(Args)
		local Args = GetArgs(Args)
		local r = Args[2]
		if r and tonumber(r) then
			plr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = r
		end
	end,"Speed what else do you think","NUMBER_COMMAND")
	Add_Command("goto",function(Args)
		local Args = GetArgs(Args)
		local r = FindPlayer(Args[2])
		if r then
			MoveTo(r.Character["Head"].CFrame)
		else
			NotFound()
		end
	end,"teleports to a player")
	Add_Command("clickkill",function(Args)
		local Args = GetArgs(Args)
		Toggle(Args[2],"ClickKill")
	end,"Click to kill people","TOGGLE_COMMAND")
	Add_Command("clickarrest",function(Args)
		local Args = GetArgs(Args)
		Toggle(Args[2],"ClickArrest")
	end,"Click to arrest people","TOGGLE_COMMAND")
	Add_Command("autorespawn",function(Args)
		local Args = GetArgs(Args)
		Toggle(Args[2],"autore")
	end,"Respawns at death position","TOGGLE_COMMAND")
	Add_Command("onepunch",function(Args)
		local Args = GetArgs(Args)
		Toggle(Args[2],"OnePunch")
	end,"Kills anyone that you punch 1 shot","TOGGLE_COMMAND")
	Add_Command("AntiShield",function(Args)
		local Args = GetArgs(Args)
		Toggle(Args[2],"AntiShield")
		if States.AntiShield then
			wait(1)
			Notif("All shields are being removed until disabled.")
		end
	end,"Kills anyone that you punch 1 shot","TOGGLE_COMMAND")
	Add_Command("fastpunch",function(Args)
		local Args = GetArgs(Args)
		Toggle(Args[2],"FastPunch")
	end,"tap f as fast as you can","TOGGLE_COMMAND")
	Add_Command("killaura",function(Args)
		local Args = GetArgs(Args)
		Toggle(Args[2],"KillAura")
		if States.KillAura then
			if Parts[1] and Parts[1].Name == "KillAura" then
				Parts[1]:Destroy()
				Parts[1] = nil
			end
			wait()
			CreateKillPart()
		else
			if Parts[1] and Parts[1].Name == "KillAura" then
				Parts[1]:Destroy()
				Parts[1] = nil
			end
		end
	end,"Can't touch this but with bigger range","TOGGLE_COMMAND")
	Add_Command("autoitems",function(Args)
		local Args = GetArgs(Args)
		Toggle(Args[2],"AutoItems")
	end,"Get guns at respawn","TOGGLE_COMMAND")
	Add_Command("antiarrest",function(Args)
		local Args = GetArgs(Args)
		Toggle(Args[2],"AntiArrest")
		if States.AntiArrest then
			for i,v in pairs(getconnections(workspace:WaitForChild("Remote").arrestPlayer.OnClientEvent)) do
				v:Disable()
			end
		else
			for i,v in pairs(getconnections(workspace:WaitForChild("Remote").arrestPlayer.OnClientEvent)) do
				v:Enable()
			end
		end
	end,"Trys to prevent arresting","TOGGLE_COMMAND")
	Add_Command("antitase",function(Args)
		local Args = GetArgs(Args)
		Toggle(Args[2],"AntiTase")
		if States.AntiTase then
			for i,v in pairs(getconnections(workspace:WaitForChild("Remote").tazePlayer.OnClientEvent)) do
				v:Disable()
			end

		else
			for i,v in pairs(getconnections(workspace:WaitForChild("Remote").tazePlayer.OnClientEvent)) do
				v:Enable()
			end
		end
	end,"Trys to prevent tasing","TOGGLE_COMMAND")
	Add_Command("arrest",function(Args)
		local Args = GetArgs(Args)
		if Args[2] then
			if Args[2] == "all" then
				local l = getpos()
				for i,v in pairs(game:GetService("Players"):GetChildren()) do
					if v and v.Team ~= game.Teams.Guards and v.Team ~= game.Teams.Neutral and v ~=plr and BadArea(v) or v.Team == game.Teams.Criminals then
						local d= false
						task.spawn(function()
							repeat task.wait()
								pcall(function()
									MoveTo(v.Character["HumanoidRootPart"].CFrame*CFrame.new(0,0,-3))
								end)
							until d
						end)
						repeat wait(.2)
							local a=pcall(function()
								local ohInstance1 = v.Character["HumanoidRootPart"]
								workspace.Remote.arrest:InvokeServer(ohInstance1)
							end)
							if v.Team == game.Teams.Guards or not BadArea(v) then
								break
							end
							if not a then
								break
							end
							unsit()
						until v.Character["Head"]:FindFirstChildOfClass("BillboardGui")
						d = true
					end
				end
				unsit()
				wait(.1)
				MoveTo(l)
			else
				local r = FindPlayer(Args[2])
				if r  then
					local v = r
					local p = getpos()
					if v and v.Team ~= game.Teams.Guards and v.Team ~= game.Teams.Neutral and v ~=plr and BadArea(v) or v.Team == game.Teams.Criminals then
						local d= false
						task.spawn(function()
							repeat task.wait()
								pcall(function()
									MoveTo(v.Character["HumanoidRootPart"].CFrame*CFrame.new(0,0,-3))
								end)
							until d
						end)
						repeat wait(.2)
							unsit()
							local a=pcall(function()
								local ohInstance1 = v.Character["HumanoidRootPart"]
								workspace.Remote.arrest:InvokeServer(ohInstance1)
								MoveTo(v.Character["HumanoidRootPart"].CFrame)
							end)
							if v.Team == game.Teams.Guards or not BadArea(v) then
								break
							end
							if not a then
								break
							end
						until v.Character["Head"]:FindFirstChildOfClass("BillboardGui")
						d = true
					else
						Notif("Can't arrest this player!")
					end
					unsit()
					wait(.1)
					MoveTo(p)
				else
					NotFound()
				end
			end
		end
	end,"Arrests a person or all","PLAYER_COMMAND")
	Add_Command("noclip",function(Args)
		local Args = GetArgs(Args)
		Toggle(Args[2],"noclip")
		if States.noclip then
			pcall(function()
				Temp.Noclipping:Disconnect()
				Temp.Noclipping = nil
			end)
			wait()
			Temp.Noclipping = game:GetService("RunService").Stepped:Connect(function()
				for i,v in pairs(plr.Character:GetDescendants()) do
					if v and v:IsA("Part") or v:IsA("MeshPart") and v.CanCollide and unloaded == false then
						v.CanCollide = false
					end
				end
			end)
		else
			pcall(function()
				Temp.Noclipping:Disconnect()
				Temp.Noclipping = nil
			end)
			wait()
			refresh()
		end
	end,"Clip though walls like they don't exist","TOGGLE_COMMAND")
	Add_Command("carfly",function(Args)
		local Args = GetArgs(Args)
		local Speed = 1
		if Args[2] then
			flyspeed = tonumber(Args[2]) or 1
			vehicleflyspeed = tonumber(Args[2]) or 1
		end
		NOFLY()
		sFLY(true)
		
	end,"Fly like a bird! but in a car [PC ONLY]"," [SPEED]")
	Add_Command("uncarfly",function(Args)
		local Args = GetArgs(Args)
		local Speed = 1
		NOFLY()
		sFLY(true)
	end,"stops carfly you can also use !unfly")
	Add_Command("fly",function(Args)
		local Args = GetArgs(Args)
		local Speed = 1
		Notif("Fly has been enabled!")
		pcall(function()
			Temp.FlyConnection:Disconnect()
			Temp.FlyConnection=nil
		end)
		Fly(false)
		wait()
		Fly(true,Speed)
	end,"Fly like a bird! [PC ONLY]"," [SPEED]")
	Add_Command("unfly",function(Args)
		local Args = GetArgs(Args)
		pcall(function()
			Temp.FlyConnection:Disconnect()
			Temp.FlyConnection=nil
		end)
		Fly(false)
		NOFLY()
		Notif("Fly has been disabled!")
	end,"Makes your character stop flying")
	Add_Command("clip",function(Args)
		local Args = GetArgs(Args)
		States.noclip = false
		pcall(function()
			Temp.Noclipping:Disconnect()
			Temp.Noclipping = nil
		end)
		Notif("Noclip has been set to false")
	end,"",true)
	Add_Command("autore",function(Args)
		local Args = GetArgs(Args)
		Toggle(Args[2],"autore")
	end,"",true)
	Add_Command("addnuke",function(Args)
		local Args = GetArgs(Args)
		local Player = FindPlayer(Args[2])
		if Player then
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("!!!A NUKE HAS BEEN PLACED ON "..Player.Name.." KILLING HIM WILL GET EVERYONE DEAD!!!", "ALL")
			repeat task.wait()
				if Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") and Player.Character:FindFirstChildOfClass("Humanoid").Health <1 then
					break
				end
			until not game
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Player.Name.." IS DEAD NUKE LAUNCHING!!!", "ALL")
			wait(1.5)
			--//This is what I call perfect work 
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("LAUNCHING IN 3", "ALL")
			wait(1.5)
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("LAUNCHING IN 2", "ALL")			
			wait(1.5)
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("LAUNCHING IN 1", "ALL")
			wait(2)
			Kill_All()
			Notif("Nuke from player has been removed.")
		end
	end,"If player dies everyone dies","PLAYER_COMMAND")
	Add_Command("antibring",function(Args)
		local Args = GetArgs(Args)
		Toggle(Args[2],"Antibring")
	end,"No exploiter can bring you","TOGGLE_COMMAND")
	Add_Command("silentaim",function(Args)
		local Args = GetArgs(Args)
		Toggle(Args[2],"SilentAim")
	end,"aim anywhere and not miss","TOGGLE_COMMAND")
	Add_Command("antipunch",function(Args)
		local Args = GetArgs(Args)
		Toggle(Args[2],"AntiPunch")
		if States.AntiPunch then
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				if v and v ~= plr then
					AntiPunchC(v)
					v.CharacterAdded:Connect(function(c)
						repeat task.wait() until c and c:FindFirstChildOfClass("Humanoid")

						if States.AntiPunch then
							AntiPunchC(v)
						end
					end)
				end
			end
		end
	end,"Prevents people from punching you","TOGGLE_COMMAND")
	Add_Command("antitouch",function(Args)
		local Args = GetArgs(Args)
		Toggle(Args[2],"AntiTouch")

	end,"Can't touch this","TOGGLE_COMMAND")
	Add_Command("guard",function(Args)
		local Args = GetArgs(Args)
		ChangeTeam(game.Teams.Guards)
	end,"puts you into guards team")
	Add_Command("inmate",function(Args)
		local Args = GetArgs(Args)
		ChangeTeam(game.Teams.Inmates)
	end,"puts you into guards team")
	Add_Command("noinvite",function(Args)
		if writefile and readfile then
			writefile("Tiger_Admin/Invite.json",game:GetService("HttpService"):JSONEncode({Invite_To_Server=false}))
		end
		Notif("Invite has been disabled")
	end,"Disables invite command")
	Add_Command("criminal",function(Args)
		local Args = GetArgs(Args)
		if Args[2] then
		else
			local pos = getpos()
			local crimpad = workspace["Criminals Spawn"].SpawnLocation
			crimpad.CanCollide = false
			crimpad.Transparency = 1
			repeat task.wait()crimpad.CFrame = getpos() until plr.Team == game.Teams.Criminals
			wait()
			MoveTo(pos)
			MoveToJunk(crimpad)
		end
	end,"puts you into guards team")
	Add_Command("guns",function(Args)
		local Args = GetArgs(Args)
		All_Guns()
	end,"gives you all guns")
	Add_Command("items",function(Args)
		local Args = GetArgs(Args)
		All_Guns()
	end,"gives you all guns",true)
	Add_Command("cop",function(Args)
		local Args = GetArgs(Args)
	end,"true",true)
	--//Teleports
	Add_Command("esp",function(Args)
		local Args = GetArgs(Args)
		if workspace:FindFirstChild("HIGHLIGHTS_1000") then
			return 
		end
		local Group = Instance.new("Model",workspace)
		Group.Name = "HIGHLIGHTS_1000"
		local esp =Instance.new("Highlight",Group)
		esp.FillColor = BrickColor.White().Color
		Temp.ESP = esp
		local function EspToggle(v)
			task.spawn(function()
				pcall(function()
					if v.Character and v.Character:FindFirstChild("Head") and not v.Character:FindFirstChild("Head"):FindFirstChild("123123123123") then
						local v1 = Instance.new("BillboardGui",v.Character:FindFirstChild("Head"))
						local v2 = Instance.new("TextLabel",v1)
						Temp.Esps[#Temp.Esps+1]=v1
						Temp.Esps[#Temp.Esps+1]=v2
						v1.Adornee = v.Character.Head
						v1.Name = "123123123123"
						v1.Size = UDim2.new(0, 100, 0, 150)
						v1.StudsOffset = Vector3.new(0, 2, 0)
						v1.AlwaysOnTop = true
						v2.BackgroundTransparency = 1
						v2.TextColor3 = Color3.new(1, 1, 1)
						v2.TextStrokeTransparency = 0
						v2.TextYAlignment = Enum.TextYAlignment.Bottom
						v2.Position = UDim2.new(0, 0, 0, -50)
						v2.Size = UDim2.new(0, 120, 0, 120)
						v2.Font = Enum.Font.SourceSans
						v2.TextSize = 15
						v2.Text = v.Name
						v.Character.Parent = Group
					end
				end)
			end)
		end
		Temp.EspConnection=true
		repeat wait(.1)
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				if v and v~= game:GetService("Players").LocalPlayer then
					repeat task.wait()until v.Character and v.Character:FindFirstChild("Head")
					EspToggle(v)
				end
			end
		until Temp.EspConnection == nil
	end,"Shows every player")
	Add_Command("unesp",function(Args)
		if workspace:FindFirstChild("HIGHLIGHTS_1000") then
			pcall(function()
				Temp.EspConnection = nil
			end)
			wait(.1)
			for i,v in pairs(workspace.HIGHLIGHTS_1000:GetChildren()) do
				v.Parent = workspace
			end
			Temp.ESP:Destroy()
			for i =1,2 do
				for i,v in pairs(Temp.Esps) do
					if v then
						v:Destroy()
						Temp.Esps[i]=nil
					end
				end
				wait(.7)
			end
			workspace.HIGHLIGHTS_1000:Destroy()
		end
	end,"unesp")
	Add_Command("nex",function(Args)
		local Args = GetArgs(Args)
		local Pos = CFrame.new(918.77, 100, 2379.07)
		if Args[2] then

		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("prison",function(Args)
		local Args = GetArgs(Args)
		local Pos = CFrame.new(918.77, 100, 2379.07)
		if Args[2] then

		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place",true)
	Add_Command("yard",function(Args)
		local Args = GetArgs(Args)
		local Pos = CFrame.new(791, 98, 2498)
		if Args[2] then

		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("cbase",function(Args)
		local Args = GetArgs(Args)
		local Pos = CFrame.new(-858.08990478516, 94.476051330566, 2093.8288574219)
		if Args[2] then

		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place",true)
	Add_Command("crimbase",function(Args)
		local Args = GetArgs(Args)
		local Pos = CFrame.new(-858.08990478516, 94.476051330566, 2093.8288574219)
		if Args[2] then

		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("gatetower2",function(Args)  
		local Args = GetArgs(Args);local Pos  = CFrame.new(505, 125, 2149)
		if Args[2] then

		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("bridge",function(Args)  
		local Args = GetArgs(Args);local Pos  = CFrame.new(54, 33, 1311)
		if Args[2] then

		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("topnex",function(Args)  
		local Args = GetArgs(Args);local Pos  = CFrame.new(829, 119, 2332)
		if Args[2] then

		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("range",function(Args)  
		local Args = GetArgs(Args);local Pos  = CFrame.new(403, 11, 1173)
		if Args[2] then

		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("gas",function(Args)  
		local Args = GetArgs(Args);local Pos  = CFrame.new(-518, 54, 1655)
		if Args[2] then

		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("backcafe",function(Args) 
		local Args = GetArgs(Args);local Pos  = CFrame.new(918, 100, 2223)
		if Args[2] then

		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("gate",function(Args) 
		local Args = GetArgs(Args);local Pos  = CFrame.new(506, 118, 2251)
		if Args[2] then

		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("gatetower",function(Args) 
		local Args = GetArgs(Args);local Pos  = CFrame.new(502, 126, 2306)
		if Args[2] then

		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("cafe",function(Args) 
		local Args = GetArgs(Args);local Pos  = CFrame.new(877, 100, 2256)
		if Args[2] then

		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("lunchroom",function(Args) 
		local Args = GetArgs(Args);local Pos  = CFrame.new(905, 100, 2226)
		if Args[2] then

		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("armory",function(Args) 
		local Args = GetArgs(Args);local Pos  = CFrame.new(789, 100, 2260)
		if Args[2] then

		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("tower",function(Args) 
		local Args = GetArgs(Args);local Pos  = CFrame.new(822, 131, 2588)
		if Args[2] then

		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("sewers",function(Args) 
		local Args = GetArgs(Args);local Pos  = CFrame.new(916, 79, 2311)
		if Args[2] then

		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	--end of teleports
	Add_Command("allcmds",function(Args) 
		local Args = GetArgs(Args);local Pos  = CFrame.new(916, 79, 2311)
		Notif("Tiger admin has "..tostring(CommandsGot).." commands in total!")
	end,"Tells you how much commands tiger admin has")
end
do
	local Check_Prefix = function(TXT)
		if TXT:sub(1, #Prefix) ~= Prefix then
			return "Not"
		end
		return "Is"
	end
	Temp.Chat = plr.Chatted:Connect(function(c)
		if c then
			c = c:lower()
			Execute_Command(c,c)
		end
	end)
	Temp.CommandBar = CommandBar.FocusLost:Connect(function(IsEnter)
		if IsEnter then
			if unloaded then return end
			if Check_Prefix(CommandBar.Text) == "Not" then
				local TextGot = CommandBar.Text
				CommandBar.Text = ""
				local Executed = Execute_Command(Prefix..TextGot:lower(),Prefix..TextGot:lower())
				if not Executed then
					Notif("Unknown command!")
				end
			else
				local TextGot = CommandBar.Text
				CommandBar.Text = ""
				local Executed =Execute_Command(TextGot,TextGot)
				if not Executed then
					Notif("Unknown command!")
				end
			end
		end
	end)
	local layout = {}
	for i,v in pairs(CommandsList:GetChildren()) do
		if v and v:IsA("TextLabel") then
			layout[#layout+1]=v
		end
	end
	SearchBar.Changed:Connect(function(Changed)
		if Changed:lower() == "text"  then
			CommandsList.CanvasPosition = Vector2.new(0, 0)
			if #SearchBar.Text >0 then
				for i,v in pairs(CommandsList:GetChildren()) do
					if v:IsA("TextLabel") then
						if not string.lower(v.Text):match(string.lower(SearchBar.Text)) then
							v.Parent = ScreenGui
							v.Visible = false
						end
					end
				end
				for i,v in pairs(ScreenGui:GetChildren()) do
					if v.Name == "TEMP_CMD" then
						if string.lower(v.Text):match(string.lower(SearchBar.Text)) then
							v.Parent = CommandsList
							v.Visible = true
						end
					end
				end
			elseif #SearchBar.Text <1 then
				for i,v in pairs(layout) do
					v.Parent = ScreenGui
					v.Visible = false
				end
				task.wait()
				for i,v in pairs(layout) do
					if v then
						v.Parent = CommandsList
						v.Visible = true
					end
				end
			end
		end
	end)
	Running = false
	UIS.InputBegan:connect(function(UserInput,Typing)
		if not unloaded and not Typing then
			if UserInput.KeyCode == Enum.KeyCode.LeftShift then
				Running = true
			end
			if UserInput.KeyCode == Enum.KeyCode.Space and States.Godmode then
				game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(3)
			end
			if UserInput.KeyCode == Enum.KeyCode.F and States.OnePunch and not Running then --//Onepunch nothing advanced just to support weak exploits
				local a = getpos()*CFrame.new(0,0,2)
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					if v and v~= plr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
						if (a.Position-plr.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude <3 and not Running then
							for i =1,13 do
								task.spawn(function()
									game.ReplicatedStorage["meleeEvent"]:FireServer(v)
								end)
							end
						end
					end
				end
			end
			if UserInput.KeyCode == Enum.KeyCode.Semicolon and not unloaded then
				task.wait(.03)
				CommandBar:CaptureFocus()
			end
		end
	end)
	UIS.InputEnded:connect(function(UserInput,Typing)
		if UserInput.KeyCode == Enum.KeyCode.LeftShift then
			Running = false
		end
	end)

end
plr.CharacterAdded:Connect(function(NewChar)
	if unloaded then return end
	Temp.Respawned_132 = true
	char = NewChar
	task.spawn(function()
		--//Antibring
		if States.Antibring then
			char.ChildAdded:Connect(function(a)
				if unloaded or not a then return end
				if a:IsA("Tool") and not table.find(Whitelisted_ITEMS,a) and not a:FindFirstChild("ISWHITELISTED") then
					plr.Character:FindFirstChild("HumanoidRootPart").Anchored = true
					a:Destroy()
					task.spawn(function()
						repeat
							game:GetService("RunService").Stepped:Wait()
							a:Destroy()
						until not a or a and a.Parent == nil
					end)
					task.spawn(function()
						task.wait()
						plr.Character:FindFirstChild("HumanoidRootPart").Anchored = false
						pcall(function()
							game:GetService("Debris"):AddItem(a,0)
						end)
					end)
				end
			end)
		end
		--//Autorespawn
		if States.autore then
			repeat task.wait() until char and char:FindFirstChildOfClass("Humanoid")
			char:FindFirstChildOfClass("Humanoid").BreakJointsOnDeath = false
			char:FindFirstChildOfClass("Humanoid").Died:Connect(function()
				if unloaded then return end
				refresh()
			end)
		end
		--//AutoItems
		repeat task.wait() until char and char:FindFirstChildOfClass("Humanoid")
		task.spawn(function()
			if unloaded then return end
			wait(.6)
			if States.AutoItems then
				All_Guns()
			end
		end)
		--//Anti annoying falling thing
		task.spawn(function()
			if unloaded then return end
			char:FindFirstChildOfClass("Humanoid").StateChanged:Connect(function(_,a)
				if a == Enum.HumanoidStateType.FallingDown then
					game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(2)
				end
			end)
		end)
		--//Anti "arrest"
		task.spawn(function()
			plr.Character:FindFirstChild("Head").ChildAdded:Connect(function(a)
				if a and a:IsA("BillboardGui") and States.AntiArrest then
					refresh()
					WaitForRespawn()
				end
			end)
		end)
		--//AntiTase
		task.spawn(function()
			repeat task.wait() until plr.Character:FindFirstChild("ClientInputHandler")
			wait(.3)
			if States.AntiTase then
				for i,v in pairs(getconnections(workspace:WaitForChild("Remote").tazePlayer.OnClientEvent)) do
					v:Disable()
				end
			end
		end)
		--//Killaura part
		task.spawn(function()
			repeat task.wait()until plr.Character and char and char:FindFirstChildOfClass("Humanoid")

			if States.KillAura then
				CreateKillPart()
			end
		end)
	end)
	for i,v in pairs(plr.Backpack:GetChildren()) do
		Whitelisted_ITEMS[#Whitelisted_ITEMS+1]=v
		Instance.new("BoolValue",v).Name = "ISWHITELISTED"
	end
end)

task.spawn(function()
	local Vests = function(player)
		if not player or not player.Character then
			return 0
		end
		local i1 = 0
		for i,v in pairs(player.Character:GetChildren()) do
			if v and v.Name:lower() == "vest" then
				i1+=1
			end
		end
		return i1
	end
	while wait(.1) do
		--//Slow loop
		if unloaded then break end

		if States.FastPunch then
			getsenv(game.Players.LocalPlayer.Character.ClientInputHandler).cs.isFighting = false
		end
		if States.AntiTouch then
			pcall(function()
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					if v and v ~=plr and States.AntiTouch then
						if (plr.Character.HumanoidRootPart.Position-v.Character.HumanoidRootPart.Position).magnitude <3.5 and not IsBringing then
							for i =1,13 do
								task.spawn(function()
									game.ReplicatedStorage["meleeEvent"]:FireServer(v)
								end)
							end
						end
					end
				end
			end)
		end
		pcall(function()
			for i,v in pairs(plr.Backpack:GetChildren()) do
				if v and not v:FindFirstChild("ISWHITELISTED") then
					Whitelisted_ITEMS[#Whitelisted_ITEMS+1]=v
					Instance.new("BoolValue",v).Name = "ISWHITELISTED"
				end
			end
			for i,v in pairs(Whitelisted_ITEMS) do
				if not v or v and v.Parent == nil then
					Whitelisted_ITEMS[i]=nil
				end
			end
			game:GetService('StarterGui'):SetCoreGuiEnabled('Backpack', true)
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				local ves= Vests(v)
				if ves>1 then
					repeat game:GetService("RunService").Stepped:Wait()
						pcall(function()
							v.Character:FindFirstChild("vest"):Destroy()
						end)
					until Vests(v) <2
				end
			end
		end)
	end
end)
task.spawn(function()
	while wait(1) do --//Even SLOWER loop
		if unloaded then
			break
		end
		for i,v in pairs(Reload_Guns) do
			if v then
				task.spawn(function()
					game:GetService("ReplicatedStorage").ReloadEvent:FireServer(v)
				end)
			end
		end
		if States.AntiShield then
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				if v and v.Character and v:FindFirstChild("Torso") and v:FindFirstChild("Torso"):FindFirstChild("ShieldFolder") then
					v.Torso:FindFirstChild("ShieldFolder"):Destroy()
				end
			end
		end
		if #loopkilling>0 then
			for i,v in pairs(loopkilling) do
				if v and game:GetService("Players"):FindFirstChild(v) then
					MKILL(game:GetService("Players"):FindFirstChild(v))
					wait()
				end
			end
		end
	end
end)
do--Take over client scripts and anticrash
	pcall(function()
		game:GetService("Players").LocalPlayer.PlayerScripts.ClientGunReplicator.Disabled = true
	end)
	--ClientGunReplicator
	local BulletCoolDown = false
	Temp.GunHandler =game:GetService("ReplicatedStorage"):WaitForChild("ReplicateEvent").OnClientEvent:connect(function(Amount, Value)
		if #Amount <70 and not BulletCoolDown then
			BulletCoolDown =true
			for i = 1, #Amount do
				local Bullet = Instance.new("Part", workspace.CurrentCamera)
				Bullet.Name = "RayPart"
				Bullet.Material = Enum.Material.Neon
				Bullet.Anchored = true
				Bullet.CanCollide = false
				Bullet.Transparency = 0.5
				Bullet.formFactor = Enum.FormFactor.Custom
				Bullet.Size = Vector3.new(0.2, 0.2, Amount[i].Distance)
				Bullet.CFrame = Amount[i].Cframe
				game.Debris:AddItem(Bullet, 0.05)
				Instance.new("BlockMesh", Bullet).Scale = Vector3.new(0.5, 0.5, 1)
				if Value then
					Bullet.BrickColor = BrickColor.new("Cyan")
					local Light = Instance.new("SurfaceLight", Bullet)
					Light.Color = Color3.new(0, 0.9176470588235294, 1)
					Light.Range = 5
					Light.Face = "Bottom"
					Light.Brightness = 10
					Light.Angle = 180
					task.spawn(function()
						for v7 = 1, 10 do
							Bullet.Transparency = Bullet.Transparency + 0.1
							Light.Brightness = Light.Brightness - 1
							wait()
						end
					end)
				else
					Bullet.BrickColor = BrickColor.Yellow()
				end
			end
			wait(.01)
			BulletCoolDown = false
		end
	end)
	local CoolDown = false
	Temp.SoundHandler = game:GetService("ReplicatedStorage"):WaitForChild("SoundEvent").OnClientEvent:connect(function(Sound1, p4)
		if CoolDown then
			CoolDown = true
			local Sound = Sound1:Clone()
			Sound.Parent = Sound1.Parent
			Sound:Play()
			Sound.Played:Connect(function()
				wait()
				game:GetService("Debris"):AddItem(Sound,0.001)
			end)
			wait(.1)
			CoolDown = false
		end
	end)
	Temp.WarnHandler = game:GetService("ReplicatedStorage"):WaitForChild("WarnEvent").OnClientEvent:connect(function(Text)
		local WarnGui = game:GetService("ReplicatedStorage").gooeys.WarnGui:Clone()
		WarnGui.Parent = plr.PlayerGui
		if Text == 1 then
			WarnGui.Frame.desc.Text = "This is your last warning. You will become a prisoner if you kill an innocent player 1 more time."
		else
			WarnGui.Frame.desc.Text = "Do not kill innocent people! You will be arrested and jailed if you kill " .. Text .. " more times."
		end
		WarnGui.Frame.LocalScript.Disabled = false
	end)
end
task.spawn(function()
	local RawMetatable = getrawmetatable(game)
	local __NameCall = RawMetatable.__namecall
	local __Index = RawMetatable.__index
	local LocalPlayer = game.Players.LocalPlayer
	setreadonly(RawMetatable, false)
	local Services = {
		Players = game:GetService("Players"),
		UserInputService = game:GetService("UserInputService")
	}
	local Camera = workspace.CurrentCamera
	local function NotObstructing(Destination, Ancestor)
		local ObstructingParts = Camera.GetPartsObscuringTarget(Camera, {Destination}, {Ancestor, LocalPlayer.Character})

		for i,v in ipairs(ObstructingParts) do
			pcall(function()
				if v.Transparency >= 1 then
					table.remove(ObstructingParts, i)
				end
			end)
		end

		if #ObstructingParts <= 0 then
			return true
		end
		local RaycastParameters = RaycastParams.new()
		RaycastParameters.IgnoreWater = true
		RaycastParameters.FilterType = Enum.RaycastFilterType.Blacklist
		RaycastParameters.FilterDescendantsInstances = {LocalPlayer.Character}

		RaycastParameters.FilterDescendantsInstances = {LocalPlayer.Character}

		local Origin = Camera.CFrame.Position
		local Direction = (Destination - Origin).Unit * 500
		local RayResult = workspace.Raycast(workspace, Origin, Direction, RaycastParameters) or {
			Instance = nil;
			Position = Origin + Direction;
			Material = Enum.Material.Air;
		}

		if RayResult.Instance and (RayResult.Instance.IsDescendantOf(RayResult.Instance, Ancestor) or RayResult.Instance == Ancestor) then
			return true
		end
		return false
	end
	local function ClosestPlayerToCursor(Distance)
		local Closest = nil
		local Position = nil
		local ShortestDistance = Distance or math.huge

		local MousePosition = Services.UserInputService.GetMouseLocation(Services.UserInputService)
		for i, v in ipairs(Services.Players.GetPlayers(Services.Players)) do
			if v ~= LocalPlayer and (v.Team ~= LocalPlayer.Team) and v.Character and v.Character:FindFirstChildOfClass("Humanoid") and v.Character:FindFirstChildOfClass("Humanoid").Health>0 then

				if NotObstructing(v.Character.PrimaryPart.Position, v.Character) == false then
					continue
				end
				local ViewportPosition, OnScreen = Camera.WorldToViewportPoint(Camera, v.Character.PrimaryPart.Position)
				local Magnitude = (Vector2.new(ViewportPosition.X, ViewportPosition.Y) - MousePosition).Magnitude

				if Magnitude < ShortestDistance  then
					Closest = v
					Position = ViewportPosition
					ShortestDistance = Magnitude
				end
			end
		end

		return Closest, Position
	end

	RawMetatable.__index = newcclosure(function(Self, Index)
		if States.SilentAim and checkcaller() == false then
			if typeof(Self) == "Instance" and (Self:IsA("PlayerMouse") or Self:IsA("Mouse")) then
				if Index == "Hit" then
					local Closest = ClosestPlayerToCursor(120)
					if Closest then
						local Velocity = Closest.Character.PrimaryPart.AssemblyLinearVelocity
						local Prediction = Velocity.Unit
						if Velocity.Magnitude == 0 then
							Prediction = Vector3.new(0, 0, 0)
						end
						return CFrame.new(Closest.Character.Head.Position + Prediction)
					end
				end
			end
		end
		return __Index(Self, Index)
	end)
end)

do
	Temp.PPP = game:GetService("RunService").Stepped:Connect(function()
		if not unloaded then
			if not unloaded and Parts[1] and States.KillAura then
				Parts[1].CFrame = CFrame.new(plr.Character.HumanoidRootPart.Position)
				print(Parts[1])
			end
		end
	end)
end
plr.Backpack.ChildAdded:Connect(function(v)
	if v and v:IsA("Tool") then
		if v and v:IsA("Tool") and not table.find(Whitelisted_ITEMS,v) then
			Whitelisted_ITEMS[#Whitelisted_ITEMS+1]=v
			Instance.new("BoolValue",v).Name = "ISWHITELISTED"
		end
	end
end)
task.spawn(function()
	while task.wait() do
		if GetHumanoid() and GetHumanoid().WalkSpeed >6 and Running and Resfreshing then
			GetHumanoid().WalkSpeed = 24
		else
			if Resfreshing and GetHumanoid() then
				if GetHumanoid().WalkSpeed <6 then
					if GetHumanoid().WalkSpeed ~=0 then
						GetHumanoid().WalkSpeed = 5
					end
				else
					GetHumanoid().WalkSpeed =16
				end
			end
		end
		pcall(function()
			if States.AntiArrest == true and unloaded == false then
				for i,v in pairs(game.Players:GetPlayers()) do
					if v ~= game.Players.LocalPlayer then
						if (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).magnitude <14 and v.Character.Humanoid.Health >0 and not IsBringing then
							if v.Character:FindFirstChildOfClass("Tool") and v.Character:FindFirstChild("Handcuffs") and not v.Character:FindFirstChild("Handcuffs"):FindFirstChild("ISWHITELISTED") then
								local args = {
									[1] = v
								}
								for i =1,3 do
									task.spawn(function()
										game:GetService("ReplicatedStorage").meleeEvent:FireServer(unpack(args))
									end)
								end
								print("KILL")
							end
						end
					end
				end
			end
		end)
		pcall(function()
			if States.KillAura == true and unloaded == false then
				for i,v in pairs(game.Players:GetPlayers()) do
					if v ~= game.Players.LocalPlayer then
						if not table.find(Whitelisted,v.Name) and (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).magnitude <14 and v.Character.Humanoid.Health >0 and not IsBringing then
							local args = {
								[1] = v
							}
							for i =1,2 do
								task.spawn(function()
									game:GetService("ReplicatedStorage").meleeEvent:FireServer(unpack(args))
								end)
							end

						end
					end
				end
			end
		end)
	end
end)
task.spawn(function()
	if writefile and makefolder and readfile and isfile then
		if game:GetService("HttpService"):JSONDecode(readfile("Tiger_Admin/Invite.json")).Invite_To_Server then
			local Request_ = (syn and syn.request) or http_request or request
			Request_({
				Url = 'http://127.0.0.1:6463/rpc?v=1',
				Method = 'POST',
				Headers = {
					['Content-Type'] = 'application/json',
					Origin = 'https://discord.com'
				},
				Body = game:GetService("HttpService"):JSONEncode({
					cmd = 'INVITE_BROWSER',
					nonce = game:GetService("HttpService"):GenerateGUID(false),
					args = {code = 'zj5xRp3ZKn'}
				})
			})
		end
	end
end)
game:GetService("Players").PlayerAdded:Connect(function(p)
	repeat task.wait() until p and p.Character
	wait()
	if p ~= plr and States.AntiPunch then
		AntiPunchC(p)
	end
end)

---//poop skid fr
local Arg1_P=""
local function commandPLAYER(G)
	if Arg1_P == Prefix..G then
		return true
	else
		return false
	end
end

function AdminChatted(Text,Speaker)
	Speaker = game:GetService("Players"):FindFirstChild(Speaker)
	if unloaded or Temp.RankCooldown then return end
	local TXT = string.lower(Text)
	local SPLITED = TXT:split(" ")
	Arg1_P = SPLITED[1]
	local CmdsList = "[ADMIN]: !cmds, !kill [player,all], !car, !loopkill [player]"
	local CmdsList2 = "[ADMIN]: !unloopkill [player], !tase [player,all], !opendoors, !cuffs [player]"

	local Arg2_P = SPLITED[2]
	local Arg3_P = SPLITED[3]
	local Arg4_P = SPLITED[4]
	Temp.RankCooldown = true
	task.spawn(function()
		wait(.7852)
		Temp.RankCooldown = false
	end)
	if commandPLAYER("car") then
		local org = getpos()
		MoveTo(Speaker.Character:GetPrimaryPartCFrame())
		pcall(function()
			local OldPos = game:GetService("Players").LocalPlayer.Character:GetPrimaryPartCFrame()
			game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-910, 95, 2157))
			wait()
			local car = nil
			task.spawn(function()
				car = game:GetService("Workspace").CarContainer.ChildAdded:Wait()
			end)
			repeat wait(.1)
				local ohInstance1 = game:GetService("Workspace").Prison_ITEMS.buttons:GetChildren()[8]["Car Spawner"]
				workspace.Remote.ItemHandler:InvokeServer(ohInstance1)
			until car
			repeat task.wait() until car:FindFirstChild("RWD") and car:FindFirstChild("Body") and car:FindFirstChild("Body"):FindFirstChild("VehicleSeat")
			car.PrimaryPart = car.RWD
			game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(OldPos)
			local Done = false
			car.Body.VehicleSeat:Sit(game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"))
			repeat 
				game:GetService("RunService").RenderStepped:Wait()
				car:SetPrimaryPartCFrame(OldPos)
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =CFrame.new(car.Body.VehicleSeat.Position)
				car.Body.VehicleSeat:Sit(game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"))
				if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit == true then
					Done = true
				end
			until Done
			unsit()
		end)
		wait(.1)
		MoveTo(org)
	end
	if commandPLAYER("kill") then
		local Args = Arg2_P
		local Check1 = function(ar)
			for i,v in pairs(game:GetService("Teams"):GetChildren()) do
				if v and v.Name:lower() == ar:lower() then
					return v
				end
			end
			return nil
		end
		if Args then
			if Args == "all" then
				Kill_All()
			elseif Check1(Args)  then
				Kill_All(Check1(Args))
			else
				local r = FindPlayer(Args)
				if r then
					kill(r)
				else
					NotFound()
				end
			end
		else
			Notif("Missing arg2 !kill player")
		end
	end
	if commandPLAYER("loopkill") then
		local r = FindPlayer(Arg2_P)
		if Arg2_P=="all" then
			task.spawn(function()
				if Temp.LkAll==false then
					Temp.LkAll = true
					repeat wait()
						Kill_All()
					until Temp.LkAll == nil
				end
			end)
			return
		end
		if r then
			loopkilling[#loopkilling+1]=r.Name
			Notif("loop killing "..r.Name)
		else
			NotFound()
		end
	end
	if commandPLAYER("tase") then
		local r = FindPlayer(Arg2_P)
		if Arg2_P == "all" then
			tase_all()
			return
		end
		if r then
			tase(r)
		end
	end

	if commandPLAYER("unloopkill") then
		local r = FindPlayer(Arg2_P)
		if Arg2_P=="all" then
			Notif("Unloop killed all")
			Temp.LkAll = nil
			return
		end
		if r then
			table.remove(loopkilling,table.find(loopkilling,r.Name))
			Notif("unlooped "..r.Name)
		else
			NotFound()
		end
	end
	if commandPLAYER("opendoors") then
		local LastTeam =plr.TeamColor.Name
		ChangeTeam(game.Teams.Guards)
		wait(.7)
		task.spawn(function()
			local Arg_1 = game:GetService("Workspace")["Prison_ITEMS"].buttons["Prison Gate"]["Prison Gate"]
			local Event = game:GetService("Workspace").Remote.ItemHandler
			Event:InvokeServer(Arg_1)
		end)
		for i,v in pairs(game:GetService("Workspace").Doors:GetChildren()) do
			if v then
				if v:FindFirstChild("block") and v:FindFirstChild("block"):FindFirstChild("hitbox") then
					firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.block.hitbox,0)
					firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.block.hitbox,1)
				end
			end
		end
		wait(1)
		Last_Team(LastTeam)
	end


	if commandPLAYER("cmds") then
		Msg(Speaker,CmdsList)
		wait(.1)
		Msg(Speaker,CmdsList2)
	end
end

plr:GetMouse().Button1Up:Connect(function()
	local Target = plr:GetMouse().Target
	if States.ClickArrest or States.ClickKill then
		if Target and Target.Parent and Target.Parent:FindFirstChildOfClass("Humanoid") and game:GetService("Players"):FindFirstChild(Target.Parent.Name) or game:GetService("Players"):FindFirstChild(Target.Parent.Parent.Name) then
			local TargetModelPlr = game:GetService("Players"):FindFirstChild(Target.Parent.Name) or game:GetService("Players"):FindFirstChild(Target.Parent.Parent.Name)
			if States.ClickArrest then
				if TargetModelPlr.Team ~= game:GetService("Teams").Guards then
					local ohInstance1 = Target
					workspace.Remote.arrest:InvokeServer(ohInstance1)
				end
			end
			if States.ClickKill then
				if TargetModelPlr.Team ~= game:GetService("Teams").Guards then
					kill(TargetModelPlr)
				end
			end
		end
	end
end)
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(Data, Channel)
	if unloaded then return end
	if table.find(States.Admined,MessageData.FromSpeaker)  then
		AdminChatted(MessageData.Message,MessageData.FromSpeaker)
	end
end)
refresh()
plr.PlayerGui.Home.fadeFrame.Visible = false--//black bar
CmdBarFrame:TweenPosition(UDim2.new(0.5, 0, 0.899999998, 0)-UDim2.new(0,0,.05,0),"Out","Back",.5)
Notif("Loaded! type !noinvite to disable discord invite",3)
