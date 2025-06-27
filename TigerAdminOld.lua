--https://github.com/sstvskids/TigerAdmin/blob/main/old-script
--[[
  _______ _____ _____ ______ _____             _____  __  __ _____ _   _ 
 |__   __|_   _/ ____|  ____|  __ \      /\   |  __ \|  \/  |_   _| \ | | PL LITE
    | |    | || |  __| |__  | |__) |    /  \  | |  | | \  / | | | |  \| |
    | |    | || | |_ |  __| |  _  /    / /\ \ | |  | | |\/| | | | | . ` |
    | |   _| || |__| | |____| | \ \   / ____ \| |__| | |  | |_| |_| |\  |
    |_|  |_____\_____|______|_|  \_\ /_/    \_\_____/|_|  |_|_____|_| \_|     
    
]]
repeat task.wait() until game:IsLoaded()
do--//Instances
	Debug = false
	BETA = true
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
	Folder.Name = "Tiger1.1Loaded"
	--
	AnnouncementLink = "https://pastebin.com/raw/XABq2ziW"
	HasFireTouch = false
	unloaded=false
	firetouchinterest=firetouchinterest
	firetouch = firetouchinterest
	oldprint = print
	loopkilling = {}
	print = function(...)
		if Debug then
			oldprint(...)
		end
	end
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
		Godmode = false,
		Antibring = true,
		AntiTouch = false,
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
function MoveToJunk(v)
	v.CFrame = CFrame.new(0,5^5,0)
end
for i,v in pairs(workspace["Criminals Spawn"]:GetChildren()) do
	if v and v:IsA("Part") then
		MoveToJunk(v)
	end
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
local http = game:GetService("HttpService")
if writefile and isfile then
	if isfile("Tiger.Admin") == false then
		Settings = {
			Discord_Invite_On_Execution = true
		}
		thingy = http:JSONEncode(Settings)
		writefile("Tiger.Admin",thingy)
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
	SearchBar.TextColor3 = Color3.fromRGB(0, 0, 0)
	SearchBar.TextSize = 14.000
	local UIS = game:GetService("UserInputService")
	local function dragify(Frame) --//shit annoying
		dragToggle = nil
		local dragSpeed = 0.50
		dragInput = nil
		dragStart = nil
		local dragPos = nil
		function updateInput(input)
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

	dragify(Commands)
	function Notif(Text,Dur)
		task.spawn(function()
			if not Dur then Dur = 1.57 end
			local NotifGuiScreen = Instance.new("ScreenGui")
			local Frame = Instance.new("Frame")
			local UIGradient = Instance.new("UIGradient")
			local TextLabel = Instance.new("TextLabel")
			local UICorner = Instance.new("UICorner")
			local UIStroke = Instance.new("UIStroke")

			NotifGuiScreen.Parent = (game:GetService("CoreGui") or gethui())
			NotifGuiScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

			Frame.Parent = NotifGuiScreen
			Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Frame.Position = UDim2.new(0.00906095561, 0, 0.921446383, 0)+UDim2.new(0,0,.4,0)
			Frame.Size = UDim2.new(0, 326, 0, 49)

			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(127, 20, 148)), ColorSequenceKeypoint.new(0.29, Color3.fromRGB(82, 40, 174)), ColorSequenceKeypoint.new(0.64, Color3.fromRGB(184, 63, 11)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 30, 0))}
			UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.30), NumberSequenceKeypoint.new(1.00, 0.30)}
			UIGradient.Parent = Frame

			TextLabel.Parent = Frame
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.Position = UDim2.new(0, 0, -0.020833334, 0)
			TextLabel.Size = UDim2.new(0, 326, 0, 49)
			TextLabel.Font = Enum.Font.SourceSans
			TextLabel.TextTransparency = .1
			TextLabel.Text = tostring(Text) or "Missing text"
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 21.000
			TextLabel.TextStrokeTransparency = 0.740
			TextLabel.TextWrapped = true

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Frame

			UIStroke.Parent = Frame
			wait(.1)
			Frame:TweenPosition(UDim2.new(0.00906095561, 0, 0.921446383, 0),"Out","Quart",.6)
			wait(Dur+.7)
			Frame:TweenPosition(UDim2.new(0.00906095561, 0, 0.921446383, 0)+UDim2.new(0,0,.2,0),"Out","Quart",1)
			wait(1)
			NotifGuiScreen:Destroy()
		end)
		return
	end
	if game:FindFirstChild("Tiger1.1Loaded") then
		ScreenGui:Destroy()
		unloaded = true
		Notif("Tiger admin is already loaded!")
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

end
do--//Command handler
	Prefix = "/"
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
	task.spawn(function()
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
						v["Callback"](Raw)
					end
				end
			end
		end
	end)
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
				PlayerCommand = " STRING_COMMAND"
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
end

do
	--//Prison life stuff functions
	function WaitForRespawn()
		task.spawn(function()
			local RepeatPos = getpos()
			Temp.Waiting2 = plr.CharacterAdded:Connect(function(char)
				Temp.Waiting = false
				repeat task.wait() until char and char:FindFirstChild("HumanoidRootPart")
				MoveTo(RepeatPos)
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
			else
				local ohString1 = "Bright blue"
				workspace.Remote.TeamEvent:FireServer(ohString1)
			end
		end,
	}
	function BadArea(Player)
		local mod = require(game.ReplicatedStorage["Modules_client"]["RegionModule_client"])
		if mod.findRegion(Player.Character) then
			mod = mod.findRegion(Player.Character)["Name"]
		end
		for i,v in pairs(game:GetService("ReplicatedStorage").PermittedRegions:GetChildren()) do
			if v and mod == v.Value then
				return false
			end
		end
		return true
	end
	function All_Guns()
		local saved = game:GetService("Players").LocalPlayer.Character:GetPrimaryPartCFrame()
		game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP.Position))
		for i =1,2 do
			local ohInstance1 = game:GetService("Workspace").Prison_ITEMS.giver.M9:GetChildren()[6]
			workspace.Remote.ItemHandler:InvokeServer(ohInstance1)
			task.spawn(function()
				for i =1,3 do
					workspace.Remote.ItemHandler:InvokeServer(ohInstance1)
				end		
			end)
			local ohInstance2 = workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP
			workspace.Remote.ItemHandler:InvokeServer(ohInstance2)
			task.spawn(function()
				for i =1,3 do
					workspace.Remote.ItemHandler:InvokeServer(ohInstance2)
				end		
			end)
			local ohInstance3 = game:GetService("Workspace").Prison_ITEMS.giver["AK-47"]:GetChildren()[51]
			wait()
			game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(game:GetService("Workspace").Prison_ITEMS.giver["AK-47"]:GetChildren()[51].Position+Vector3.new(0,4,0)))
			workspace.Remote.ItemHandler:InvokeServer(ohInstance3)
			task.spawn(function()
				for i =1,3 do
					workspace.Remote.ItemHandler:InvokeServer(ohInstance3)
				end		
			end)
		end
		game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(saved)
	end
	function GetGun(String,a)
		local saved = game:GetService("Players").LocalPlayer.Character:GetPrimaryPartCFrame()
		if String and game:GetService("Workspace").Prison_ITEMS.giver:FindFirstChild(String) then
			local RandomPart = game:GetService("Workspace").Prison_ITEMS.giver:FindFirstChild(String):FindFirstChildOfClass("Part")
			MoveTo(CFrame.new(RandomPart.Position))
			wait()
			for i =1,3 do
				task.spawn(function()
					workspace.Remote.ItemHandler:InvokeServer(RandomPart)
				end)
			end
		else
			return
		end
		if not plr.Backpack:FindFirstChild(String) then
			GetGun(String,saved)
		end
		game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(a or saved)
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
				"Medium stone grey",
				"Bright orange",
				"Bright blue",
			}
			if table.find(Valid,Team) then
				return true
			elseif  Team == "Really red" then
				return 1
			end
			return nil
		end
	end
	function Last_Team(Lastteam)
		task.spawn(function()
			if Valid_Team(Lastteam) then
				local pos = getpos()
				workspace.Remote.TeamEvent:FireServer(Lastteam)
				wait(.1)
				MoveTo(pos)
			elseif Valid_Team(Lastteam) == 1 then
				local pos = getpos()
				local crimpad = workspace["Criminals Spawn"].SpawnLocation
				crimpad.CanCollide = false
				crimpad.Transparency = 1
				repeat task.wait()crimpad.CFrame = getpos() until plr.Team == game.Teams.Criminals
				wait()
				MoveTo(pos)
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
	function Kill_All(Team)
		local saved = getpos()
		local Team = GetTeam()
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			if v and v~= plr and not table.find(Whitelisted,v.Name) then
				MKILL(v)
			end
		end
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = saved
	end
	function kill(player,Type)
		if typeof(player):lower() == "string" then
			if game:GetService("Players"):FindFirstChild(player) then
				player = game:GetService("Players"):FindFirstChild(player)
			end
		end
		if table.find(Whitelisted,player.Name) then
			print("error is whitelisted - 1")
			return Notif("This player is whitelisted")
		end
		MKILL(player)
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
		if typeof(Pos):lower() == "position" then
			Pos = CFrame.new(Pos)
		end
		for i =1,3 do
			plr.Character:FindFirstChild("HumanoidRootPart").CFrame = Pos
		end
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
						if (plr.Character.HumanoidRootPart.Position-v2.Character.HumanoidRootPart.Position).magnitude <3.5 and not table.find(Whitelisted,v2.Name) then
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
				end)
				Connections[1]:Disconnect()
			end)
		end)
		Events.loadchar()
		print("Refreshed")
		return
	end
	--//Shits 100 lines :skull:
	function bring(player,pos,Type,Extra)
		if player then
			local lastteam = plr.TeamColor.Name
			if plr.Team ~= game.Teams.Guards then
				local ohString1 = "Bright blue"
				workspace.Remote.TeamEvent:FireServer(ohString1)
			end
			task.spawn(function()
				wait(.1)
				if plr.Team ~= game.Teams.Guards then
					Notif("Guards team full or server laggy.")
				end
			end)
			wait()
			local Done = false
			local _MAX = 0
			local Last = getpos()
			local Handcuffs = plr.Backpack:FindFirstChild("Handcuffs")
			local hrp = plr.Character:WaitForChild("HumanoidRootPart")
			if not pos then
				pos = getpos()
			end
			local Goto = pos
			repeat task.wait() Handcuffs = plr.Backpack:FindFirstChild("Handcuffs")  until Handcuffs and Handcuffs:FindFirstChild("Handle")
			Handcuffs.Handle:FindFirstChildOfClass("SpecialMesh"):Destroy()
			wait(.1)
			if pos then
				MoveTo(pos)
				wait()
			end
			wait(.1)
			local Hats = {}
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
			repeat task.wait()
				pcall(function()
					plr.Character:FindFirstChildOfClass("Humanoid"):EquipTool(Handcuffs)
				end)
			until Handcuffs.Parent == plr.Character
			local crimpad = workspace["Criminals Spawn"].SpawnLocation
			crimpad.CanCollide = false
			crimpad.Transparency = 1
			repeat game:GetService("RunService").RenderStepped:Wait()
				if Handcuffs and Handcuffs:FindFirstChild("Handle") then
					task.spawn(function()
						_MAX+=1
						MoveTo(Goto)
						player.Character:SetPrimaryPartCFrame(Handcuffs.Handle.CFrame)
						wait(.1)
					end)
				end
				if Handcuffs and Handcuffs:FindFirstChild("Handle") then
					touch(GetPlayersPart(player),Handcuffs.Handle)
					if Extra == "crim" then
						crimpad.CFrame = player.Character:GetPrimaryPartCFrame()
						touch(GetPlayersPart(player),crimpad)
					end
				end
			until Handcuffs.Parent ~= plr.Character or _MAX>200
			if pos then
				wait(.2)
				MoveToJunk(crimpad)
			end
			if Extra =="fling" then
				local b = Instance.new("BodyThrust",plr.Character.HumanoidRootPart)
				b.Force = Vector3.new(99999,10000,999999)
				b.Location = plr.Character.HumanoidRootPart.Position
				wait(.2)

			end
			game:GetService("Players").LocalPlayer.Character:MoveTo(player.Character.Head.Position)
			MoveTo(Last)--//stupid fix for it killing
			Last_Team(lastteam)
			plr.CharacterAdded:Wait():WaitForChild("HumanoidRootPart").CFrame = Last
			Done = true
			task.spawn(function()
				wait(.4)
				if player.Character:FindFirstChild("HumanoidRootPart") and (player.Character:FindFirstChild("HumanoidRootPart").Position-Goto.Position).Magnitude >6 then
					if Extra and Extra == true and Extra ~="crim" or Extra == "fling" then
					else
						return bring(player,Goto,Type,true)
					end
				end
			end)
			if pos then
				wait(.1)
			end
			return
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
	Add_Command("fling",function(Args)
		local Args = GetArgs(Args)
		local r = FindPlayer(Args[2])
		if r then
			bring(r,nil,nil,"fling")
		else
			NotFound()
		end
	end,"flings a player","PLAYER_COMMAND")
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
	Add_Command("getusers",function(Args)
		local Args = GetArgs(Args)
		local Concat = {}
		for i,v in pairs(game:GetService("Players"):GetChildren()) do
			if v and v.Character and v.Character:FindFirstChild("Animate") and not v.Character.Animate:FindFirstChild("ScaleDampeningPercent") then
				Concat[#Concat+1]=v.Name..", "
			end
		end
		Notif("users: "..tostring(table.concat(Concat)),5)
	end,"Shows all tiger admin users")
	Add_Command("loopkill",function(Args)
		local Args = GetArgs(Args)
		local r =FindPlayer(Args[2])
		if Args[2]=="all" then
			task.spawn(function()
				Temp.LkAll = true
				repeat wait()
					Kill_All()
				until Temp.LkAll == nil
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
			Reload_Guns[#Reload_Guns]=Tool
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
			Reload_Guns[#Reload_Guns]=Tool
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
			Reload_Guns[#Reload_Guns]=Tool
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
			local cc = require(Tool.GunStates)
			cc["MaxAmmo"] = math.huge
			cc["StoredAmmo"] = math.huge
			cc["AmmoPerClip"] = math.huge
			cc["CurrentAmmo"] = math.huge
			Reload_Guns[#Reload_Guns]=Tool
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
	Add_Command("bring",function(Args)
		local Args = GetArgs(Args)
		if Args[2] == "all" then
			local pos = getpos()
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				if v and v~= plr then
					bring(v,pos)
				end
			end
			wait()
			MoveTo(pos)
		else
			local r = FindPlayer(Args[2])
			if r then
				bring(r)
			else
				NotFound()
			end
		end
	end,"Brings a player to you","PLAYER_COMMAND")
	Add_Command("void",function(Args)
		local Args = GetArgs(Args)
		if Args[2] == "all" then
			local pos = getpos()
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				if v and v~= plr then
					bring(v,CFrame.new(9999999999999,9999999999999999,999999999999999))
				end
			end
			wait()
			MoveTo(pos)
		else
			local r = FindPlayer(Args[2])
			if r then
				bring(r,CFrame.new(9999999999999,9999999999999999,999999999999999))
			else
				NotFound()
			end
		end
	end,"Brings a player to the void","PLAYER_COMMAND")
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
	Add_Command("autorespawn",function(Args)
		local Args = GetArgs(Args)
		Toggle(Args[2],"autore")
	end,"Respawns at death position","TOGGLE_COMMAND")
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
	Add_Command("autore",function(Args)
		local Args = GetArgs(Args)
		Toggle(Args[2],"autore")
	end,"",true)
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
		local pos = getpos()
		local ohString1 = "Bright blue"
		workspace.Remote.TeamEvent:FireServer(ohString1)
		wait(.1)
		MoveTo(pos)
	end,"puts you into guards team")
	Add_Command("crashserver",function(Args)
		local Args = GetArgs(Args)
		All_Guns()
		wait(.7)
		local T = {}
		for i =1,12000 do
			T[#T+1] = unpack({
				["RayObject"] = Ray.new(Vector3.new(780.852478, 99.4999161, 2568.36914), Vector3.new(308.161377, -90.2463608, -238.520844)),
				["Distance"] = 195.429909706115723,
				["Cframe"] = CFrame.new(790.130249, 97.1738739, 2562.07666, -0.683907807, 0.18761155, 0.705033362, 0, 0.966370463, -0.257154137, -0.729568481, -0.175869718, -0.660908222),
				["Hit"] = workspace:FindFirstChildOfClass("Part")
			})
		end
		local ohInstance2 = game:GetService("Players").LocalPlayer.Backpack["Remington 870"]
		for i =1,40 do
			task.spawn(function()
				game:GetService("ReplicatedStorage").ShootEvent:FireServer(T, ohInstance2)
			end)
		end
		wait(.7)
		while task.wait() do
			game:GetService("ReplicatedStorage").ShootEvent:FireServer(T, ohInstance2)
		end
	end,"Crashes the server")
	Add_Command("lag",function(Args)
		local Args = GetArgs(Args)
		All_Guns()
		wait(.7)
		local T = {}
		for i =1,100 do
			T[#T+1] = unpack({
				["RayObject"] = Ray.new(Vector3.new(780.852478, 99.4999161, 2568.36914), Vector3.new(308.161377, -90.2463608, -238.520844)),
				["Distance"] = 15.429909706115723,
				["Cframe"] = CFrame.new(790.130249, 97.1738739, 2562.07666, -0.683907807, 0.18761155, 0.705033362, 0, 0.966370463, -0.257154137, -0.729568481, -0.175869718, -0.660908222),
				["Hit"] = workspace:FindFirstChildOfClass("Part")
			})
		end
		local ohInstance2 = game:GetService("Players").LocalPlayer.Backpack["Remington 870"]

		for i =1,30 do
			task.spawn(function()
				game:GetService("ReplicatedStorage").ShootEvent:FireServer(T, ohInstance2)
			end)
		end
	end,"lags the server")
	Add_Command("inmate",function(Args)
		local Args = GetArgs(Args)
		local pos = getpos()
		local ohString1 = "Bright orange"
		workspace.Remote.TeamEvent:FireServer(ohString1)
		wait(.1)
		MoveTo(pos)
	end,"puts you into guards team")
	Add_Command("noinvite",function(Args)
		local Settings = {
			Discord_Invite_On_Execution = false
		}
		local http = game:GetService("HttpService")
		local thingy = http:JSONEncode(Settings)
		if writefile then
			writefile("Tiger.Admin",thingy)
		end
		Notif("Invite disabled")
	end,"Disables invite command")
	Add_Command("criminal",function(Args)
		local Args = GetArgs(Args)
		if Args[2] then
			local r = FindPlayer(Args[2])
			if r then
				bring(r,nil,nil,"crim")
			else
				NotFound()
			end
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
	Add_Command("prison",function(Args)
		local Args = GetArgs(Args)
		local Pos = CFrame.new(918.77, 100, 2379.07)
		if Args[2] then
			local r = FindPlayer(Args[2])
			if r then
				bring(r,Pos)
			else
				NotFound()
			end
		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("nex",function(Args)
		local Args = GetArgs(Args)
		local Pos = CFrame.new(918.77, 100, 2379.07)
		if Args[2] then
			local r = FindPlayer(Args[2])
			if r then
				bring(r,Pos)
			else
				NotFound()
			end
		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("prison",function(Args)
		local Args = GetArgs(Args)
		local Pos = CFrame.new(918.77, 100, 2379.07)
		if Args[2] then
			local r = FindPlayer(Args[2])
			if r then
				bring(r,Pos)
			else
				NotFound()
			end
		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place",true)
	Add_Command("yard",function(Args)
		local Args = GetArgs(Args)
		local Pos = CFrame.new(791, 98, 2498)
		if Args[2] then
			local r = FindPlayer(Args[2])
			if r then
				bring(r,Pos)
			else
				NotFound()
			end
		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("cbase",function(Args)
		local Args = GetArgs(Args)
		local Pos = CFrame.new(-858.08990478516, 94.476051330566, 2093.8288574219)
		if Args[2] then
			local r = FindPlayer(Args[2])
			if r then
				bring(r,Pos)
			else
				NotFound()
			end
		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place",true)
	Add_Command("crimbase",function(Args)
		local Args = GetArgs(Args)
		local Pos = CFrame.new(-858.08990478516, 94.476051330566, 2093.8288574219)
		if Args[2] then
			local r = FindPlayer(Args[2])
			if r then
				bring(r,Pos)
			else
				NotFound()
			end
		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("gatetower2",function(Args)  
		local Args = GetArgs(Args);local Pos  = CFrame.new(505, 125, 2149)
		if Args[2] then
			local r = FindPlayer(Args[2])
			if r then
				bring(r,Pos)
			else
				NotFound()
			end
		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("bridge",function(Args)  
		local Args = GetArgs(Args);local Pos  = CFrame.new(54, 33, 1311)
		if Args[2] then
			local r = FindPlayer(Args[2])
			if r then
				bring(r,Pos)
			else
				NotFound()
			end
		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("topnex",function(Args)  
		local Args = GetArgs(Args);local Pos  = CFrame.new(829, 119, 2332)
		if Args[2] then
			local r = FindPlayer(Args[2])
			if r then
				bring(r,Pos)
			else
				NotFound()
			end
		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("range",function(Args)  
		local Args = GetArgs(Args);local Pos  = CFrame.new(403, 11, 1173)
		if Args[2] then
			local r = FindPlayer(Args[2])
			if r then
				bring(r,Pos)
			else
				NotFound()
			end
		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("gas",function(Args)  
		local Args = GetArgs(Args);local Pos  = CFrame.new(-518, 54, 1655)
		if Args[2] then
			local r = FindPlayer(Args[2])
			if r then
				bring(r,Pos)
			else
				NotFound()
			end
		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("backcafe",function(Args) 
		local Args = GetArgs(Args);local Pos  = CFrame.new(918, 100, 2223)
		if Args[2] then
			local r = FindPlayer(Args[2])
			if r then
				bring(r,Pos)
			else
				NotFound()
			end
		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("gate",function(Args) 
		local Args = GetArgs(Args);local Pos  = CFrame.new(506, 118, 2251)
		if Args[2] then
			local r = FindPlayer(Args[2])
			if r then
				bring(r,Pos)
			else
				NotFound()
			end
		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("gatetower",function(Args) 
		local Args = GetArgs(Args);local Pos  = CFrame.new(502, 126, 2306)
		if Args[2] then
			local r = FindPlayer(Args[2])
			if r then
				bring(r,Pos)
			else
				NotFound()
			end
		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("cafe",function(Args) 
		local Args = GetArgs(Args);local Pos  = CFrame.new(877, 100, 2256)
		if Args[2] then
			local r = FindPlayer(Args[2])
			if r then
				bring(r,Pos)
			else
				NotFound()
			end
		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("lunchroom",function(Args) 
		local Args = GetArgs(Args);local Pos  = CFrame.new(905, 100, 2226)
		if Args[2] then
			local r = FindPlayer(Args[2])
			if r then
				bring(r,Pos)
			else
				NotFound()
			end
		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("armory",function(Args) 
		local Args = GetArgs(Args);local Pos  = CFrame.new(789, 100, 2260)
		if Args[2] then
			local r = FindPlayer(Args[2])
			if r then
				bring(r,Pos)
			else
				NotFound()
			end
		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("tower",function(Args) 
		local Args = GetArgs(Args);local Pos  = CFrame.new(822, 131, 2588)
		if Args[2] then
			local r = FindPlayer(Args[2])
			if r then
				bring(r,Pos)
			else
				NotFound()
			end
		else
			MoveTo(Pos)
		end
	end,"Teleports you to that place")
	Add_Command("sewers",function(Args) 
		local Args = GetArgs(Args);local Pos  = CFrame.new(916, 79, 2311)
		if Args[2] then
			local r = FindPlayer(Args[2])
			if r then
				bring(r,Pos)
			else
				NotFound()
			end
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
				Execute_Command(Prefix..TextGot:lower(),Prefix..TextGot:lower())

			else
				local TextGot = CommandBar.Text
				CommandBar.Text = ""
				Execute_Command(TextGot,TextGot)
			end
		end
	end)
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
				for i,v in pairs(CommandsList:GetChildren()) do
					if v:IsA("TextLabel") then
						if v.Name == "TEMP_CMD" then
							v.Parent = ScreenGui
							v.Visible = false
						end
					end
				end
				for i,v in pairs(CommandsRawList) do
					if v then
						v.Parent = CommandsList
						v.Visible = true
					end
				end
			end
		end
	end)
	UIS.InputBegan:connect(function(UserInput,Typing)
		if unloaded then
			return
		end
		if UserInput.KeyCode == Enum.KeyCode.Semicolon and not Typing and not unloaded then
			task.wait(.03)
			CommandBar:CaptureFocus()
		end
	end)
end
plr.CharacterAdded:Connect(function(char)
	if unloaded then return end
	task.spawn(function()
		--//Antibring
		if States.Antibring then
			char.ChildAdded:Connect(function(a)
				if unloaded then return end
				if a and a:IsA("Tool") and not table.find(Whitelisted_ITEMS,a) and not a:FindFirstChild("ISWHITELISTED") and not unloaded then
					plr.Character:FindFirstChild("HumanoidRootPart").Anchored = true
					a:Destroy()
					task.wait()
					plr.Character:FindFirstChild("HumanoidRootPart").Anchored = false
					game:GetService("Debris"):AddItem(a,0)
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
		pcall(function()
			plr.Character.Animate.ScaleDampeningPercent:Destroy()
		end)
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
						if (plr.Character.HumanoidRootPart.Position-v.Character.HumanoidRootPart.Position).magnitude <3.5 then
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
				if v and not v:FindFirstChildOfClass("BoolValue") then
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
		if #Reload_Guns>0 then
			for i,v in pairs(Reload_Guns) do
				if v then
					task.spawn(function()
						game:GetService("ReplicatedStorage").ReloadEvent:FireServer(v)
					end)
					wait()
				end
				if v == nil or v and v.Parent == nil then
					Reload_Guns[i]=nil
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
		pcall(function()
			if States.AntiArrest == true and unloaded == false then
				for i,v in pairs(game.Players:GetPlayers()) do
					if v ~= game.Players.LocalPlayer then
						if (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).magnitude <14 and v.Character.Humanoid.Health >0 and v.Character:FindFirstChild("Handcuffs") then
							local args = {
								[1] = v
							}
							for i =1,13 do
								task.spawn(function()
									game:GetService("ReplicatedStorage").meleeEvent:FireServer(unpack(args))
								end)
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
						if not table.find(Whitelisted,v.Name) and (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).magnitude <14 and v.Character.Humanoid.Health >0 then
							local args = {
								[1] = v
							}
							for i =1,20 do
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
	if isfile and isfile("Tiger.Admin") then
		local requesttype = nil
		if identifyexecutor() == "Synapse X" then
			requesttype = syn.request;
		else
			requesttype = http_request;
		end
		local http = game:GetService("HttpService")
		local file = http:JSONDecode(readfile("Tiger.Admin"))
		if file.Discord_Invite_On_Execution == true then
			local http = game:GetService('HttpService') 
			local req = requesttype
			if req then
				requesttype({
					Url = 'http://127.0.0.1:6463/rpc?v=1',
					Method = 'POST',
					Headers = {
						['Content-Type'] = 'application/json',
						Origin = 'https://discord.com'
					},
					Body = http:JSONEncode({
						cmd = 'INVITE_BROWSER',
						nonce = http:GenerateGUID(false),
						args = {code = 'zj5xRp3ZKn'}
					})
				})
			end
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
	if unloaded then return end
	local TXT = string.lower(Text)
	local SPLITED = TXT:split(" ")
	Arg1_P = SPLITED[1]
	local CmdsList = "[ADMIN]: !bring player, !cmds, !criminal player, !goto player"
	local Arg2_P = SPLITED[2]
	local Arg3_P = SPLITED[3]
	local Arg4_P = SPLITED[4]
	if commandPLAYER("bring") then
		local r = FindPlayer(Arg2_P)
		if r then
			if r.Character:FindFirstChildOfClass("Humanoid") and r.Character:FindFirstChildOfClass("Humanoid").Health <1 then
				Msg(Speaker,"[ADMIN]: Player is dead please try again.")
				return
			end
			if not Speaker.Character then
				Notif("Please try again (Character not found).")
				return
			end
			bring(r,Speaker.Character:GetPrimaryPartCFrame()*CFrame.new(0,5,0))
		else
			Msg(Speaker,"Player not found!")
			NotFound()
		end
	end
	if commandPLAYER("criminal") then
		local r = FindPlayer(Arg2_P)
		if r then
			if r.Character:FindFirstChildOfClass("Humanoid") and r.Character:FindFirstChildOfClass("Humanoid").Health <1 then
				Msg(Speaker,"[ADMIN]: Player is dead please try again.")
				return
			end
			if not Speaker.Character then
				Notif("Please try again (Character not found).")
				return
			end
			bring(r,r.Character:GetPrimaryPartCFrame()*CFrame.new(0,1,0),nil,"crim")
		else
			Msg(Speaker,"[ADMIN]: Player not found!")
			NotFound()
		end
	end
	if commandPLAYER("goto") then
		local r = FindPlayer(Arg2_P)
		if r then
			if not Speaker.Character then
				Notif("Please try again (Character not found).")
				return
			end
			bring(Speaker,r.Character:GetPrimaryPartCFrame()*CFrame.new(0,1,0),nil,"crim")
		else
			Msg(Speaker,"[ADMIN]: Player not found!")
			NotFound()
		end
	end
	if commandPLAYER("cmds") then
		Msg(Speaker,CmdsList)
	end
end
task.spawn(function()
	while wait(5) do
		local String = game:HttpGet(AnnouncementLink)
		if String ~= "nil" and String ~= nil and String ~="" then


			local MainAnn = Instance.new("ScreenGui")
			local Frame = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local TextLabel = Instance.new("TextLabel")
			local TextLabel_2 = Instance.new("TextLabel")
			local TextButton = Instance.new("TextButton")
			local UIGradient = Instance.new("UIGradient")

			MainAnn.Name = "MainAnn"
			MainAnn.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
			MainAnn.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

			Frame.Parent = MainAnn
			Frame.AnchorPoint = Vector2.new(0.5, 0.5)
			Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
			Frame.Size = UDim2.new(0, 624, 0, 401)

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Frame

			TextLabel.Parent = Frame
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.Position = UDim2.new(0.339743584, 0, 0, 0)
			TextLabel.Size = UDim2.new(0, 200, 0, 26)
			TextLabel.Font = Enum.Font.Gotham
			TextLabel.Text = "announcement"
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextScaled = true
			TextLabel.TextSize = 14.000
			TextLabel.TextWrapped = true

			TextLabel_2.Parent = Frame
			TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_2.BackgroundTransparency = 1.000
			TextLabel_2.Position = UDim2.new(0.0769230723, 0, 0.433915228, 0)
			TextLabel_2.Size = UDim2.new(0, 528, 0, 53)
			TextLabel_2.Font = Enum.Font.Gotham
			TextLabel_2.Text = tostring(String)
			TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_2.TextScaled = true
			TextLabel_2.TextSize = 14.000
			TextLabel_2.TextWrapped = true

			TextButton.Parent = Frame
			TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.BackgroundTransparency = 1.000
			TextButton.Position = UDim2.new(0.21955128, 0, 0.78553617, 0)
			TextButton.Size = UDim2.new(0, 368, 0, 50)
			TextButton.Font = Enum.Font.SourceSans
			TextButton.Text = "Cool I don't care"
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.TextSize = 27.000
			TextButton.TextWrapped = true
			local uis = Instance.new("UIStroke",TextButton)
			uis.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uis.Color = Color3.new(1, 1, 1)
			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 19, 133)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 124, 10)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(206, 12, 255))}
			UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.50), NumberSequenceKeypoint.new(1.00, 0.50)}
			UIGradient.Parent = Frame

			TextButton.MouseButton1Up:Connect(function()
				MainAnn:Destroy()
			end)
			wait(9e9)
			
		end
	end
end)
local DefaultChatSystemChatEvents = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents
DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(MessageData, ChannelName)
	if unloaded then return end
	if table.find(States.Admined,MessageData.FromSpeaker)  then
		AdminChatted(MessageData.Message,MessageData.FromSpeaker)
	end
end)
refresh()
plr.PlayerGui.Home.fadeFrame.Visible = false--//black bar
CmdBarFrame:TweenPosition(UDim2.new(0.5, 0, 0.899999998, 0),"Out","Back",.5)
Notif("Tiger Admin",10)
