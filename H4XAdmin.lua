--https://github.com/Chaosscripter/Riotscripter/blob/main/H4X%20Admin
getgenv().FavoriteColor = Color3.fromRGB(0, 0, 255) --(Red, Green, Blue) from 0 to 255
getgenv().Slotguns = "1" --Change slots 1 to 6 (Maybe bug for guard)
 
--[[
slot mode 1 = m9,m4a1,shotgun,ak
slot mode 2 = m9,ak,shotgun,m4a1
slot mode 3 = m4a1,shotgun,ak,m9
slot mode 4 = ak,shotgun,m4a1,m9
slot mode 5 = m4a1,ak,shotgun,m9
slot mode 6 = m4a1,ak,shotgun,m9
]]--
 
--[[Function Adds:
st / slot [1 to 6] - Change your Slots (Maybe bug for guard)
aoped / autoopendoors [true,yes,y,on] - open doors in loop (to disable [false,no,n,off]).
]]--

repeat task.wait() until game:IsLoaded() and game.Workspace[game.Players.LocalPlayer.Name]

if UNLOAD_support then 
	UNLOAD_support()
end

local SCRIPT_UNLOADED = false
local Gotton_by_H17S3 = "Gotton_by_H17S3"

if not game.PlaceId == 155615604 then
	game.Players.LocalPlayer:Kick("[ERROR]: You are in the wrong game, return nil")
	wait(5)
	game:Shutdown()
end

local prefix = "?"
local version = ""
local esp = false

local Blacklist = {""}
local Allcmds = {
	prefix.."cmd / cmds / command / commands - Show all cmds",
	prefix.."k / kl / kill [plr] or [all,guard,inmate,criminal] - Killing Targets.",
	prefix.."k2 / kl2 / kill2 [plr] or [all,guard,inmate,criminal] - Killing Target version Update.",
	prefix.."t / ts / taser [plr] or [all,inmate,criminal] - Tasing Targets.",
	prefix.."to / goto [plr] - Teleport To Target.",
	prefix.."a / at / arrest [plr] or [all,criminal] - Arresting Targets.",
	prefix.."w / wt / whitelist [plr] - Removing Player of Kill all or Taser all.",
	prefix.."rw / rwt / removewhitelist [plr] - Removing Player of Whitelist.",
	prefix.."cw / cwt / clearwhitelist - Clean All Player of Whitelist.",
	prefix.."ky / key - Getting key.",
	prefix.."rj / - Rejoining in Game.",
	prefix.."sh / shop / serverhop - Changing To Another Server.",
	prefix.."ls / lower / lowersever - Changing To A Lower Server.",
	prefix.."re / refresh - Refreshing your Character.",
	prefix.."gs / guns [true,yes,y,on] - turn on guns (to disable [false,no,n,off])",
	prefix.."nd / nodoors - Removing all Doors.",
	prefix.."d / doors - Putting all Doors Again.",
	prefix.."nw / nowalls - Removing all Walls.",
	prefix.."w / walls - Puting all Walls Again.",
	prefix.."nf / nofences - Removing all Fences.",
	prefix.."f / fences - Puting all Fences Again.",
	prefix.."nx / nexus - teleporting to nexus.",
	prefix.."bk / back - teleporting to back.",
	prefix.."cf / cafe - teleporting to cafe.",
	prefix.."yd / yard - teleporting to yard.",
	prefix.."ay / arm / armory - teleporting to armory.",
	prefix.."tw / tower - teleporting to tower.",
	prefix.."rf / roof - teleporting to roof.",
	prefix.."cs / cell / cells - teleporting to cells.",
	prefix.."bc / basecrim - teleporting to base criminal.",
	prefix.."sppt / support [plr] - Giving Support to Player.",
	prefix.."rsppt / removesupport [plr] - Removing Player of Support.",
	prefix.."csppt / clearsupport - Clean All Player of Supports.",
	prefix.."sppts / showsupports - Show All Player of Supports in Chat.",
	prefix.."prefix [prefix] - change your prefix.",
	prefix.."lk / loopkill [plr] - Loopkill Target.",
	prefix.."unlk / unloopkill [plr] - Removing Target of Loopkill.",
	prefix.."clrlk / clearloopkill - Clean All Player of loopkill.",
	prefix.."lk2 / loopkill2 [plr] - Loopkill Target version Update [Recomended To Kill Exploits].",
	prefix.."unlk2 / unloopkill2 [plr] - Removing Target of Loopkill2.",
	prefix.."clrlk2 / clearloopkill2 - Clean All Player of Loopkill2.",
	prefix.."la / looparrest [plr] - Looparrest Target [Is in bad area, Player automatic arrested].",
	prefix.."unla / unlooparrest [plr] - Removing Target of Looparrest.",
	prefix.."clrla / clearlooparrest - Clean All Player of Looparrest.",
	prefix.."lt / looptase [plr] - Looptase Target [Only Criminal and Inmate].",
	prefix.."unlt / unlooptase [plr] - Removing Target of Looptase.",
	prefix.."clrlt / clearlooptase - Clean All Player of Looptase.",
	prefix.."g / guard - Change to Guard.",
	prefix.."i / inmate - Change to Inmate.",
	prefix.."c / criminal - Change to Criminal.",
	prefix.."autore / autorefresh [true,yes,y,on] - Auto Refreshing your Character [Activated] (to disable [false,no,n,off]).",
	prefix.."antiaf / antiafk [true,yes,y,on] - Auto Not Kicking your Character when Afk in 20 Minutes [Activated] (to disable [false,no,n,off]).",
	prefix.."autork / autoremovekits [true,yes,y,on] - Auto Removing kits of guard [taser and cuffs] (to disable [false,no,n,off]).",
	prefix.."antifi / antifling [true,yes,y,on] - Preople cant Fling You [Activated] (to disable [false,no,n,off]).",
	prefix.."hcc / hitcicler [true,yes,y,on] - Hit Circle (to disable [false,no,n,off]).",
	prefix.."fp / fastpunch [true,yes,y,on] - More Fast in Punching (to disable [false,no,n,off]).",
	prefix.."sp / superpunch [true,yes,y,on] - More Strenght in Punching (to disable [false,no,n,off]).",
	prefix.."ka / killaura [true,yes,y,on] -  Killing aura (to disable [false,no,n,off]).",
	prefix.."aa / arrestaura [true,yes,y,on] - Arresting aura (to disable [false,no,n,off]).",
	prefix.."prefix [prefix] - Make your Own Prefix.",
	prefix.."bcr / bringcar - Getting a Car.",
	prefix.."scar / spamcar - Spamming Cars.",
	prefix.."lck / lock [true,yes,y,on] - Locking Character [Bypass Taser, Sprint and Etc] (to disable [false,no,n,off]).",
	prefix.."ff / forcefield [true,yes,y,on] - Make ForceField in Character (to disable [false,no,n,off]).",
	prefix.."msppt / mobilesupport - Make Mobile Support Gui.",
	prefix.."rip / crash / byebye - Crashing Server.",
	prefix.."ck / clickkill [true,yes,y,on] - Killing Target in Click (to disable [false,no,n,off]).",
	prefix.."ca / clickarrest [true,yes,y,on] - Arresting Target in Click (to disable [false,no,n,off]).",
	prefix.."antiar / antiarrest [true,yes,y,on] - When guard equip Cuffs get Killed (to disable [false,no,n,off]).",
	prefix.."oped / opendoors [true,yes,y,on] - Opening All Doors (to disable [false,no,n,off]).",
	prefix.."antitc / antitouch [true,yes,y,on] - Who Touch you get Killed (to disable [false,no,n,off]).",
	prefix.."infammo / infiniteammo [true,yes,y,on] - Make your Guns with Infinite Ammo (to disable [false,no,n,off]).",
	prefix.."esp - Show all Characters Players.",
	prefix.."unesp - Stop esp.",
	prefix.."ap / autopunch - Hold to AutoPunch.",
	prefix.."unap / unautopunch - Stop AutoPunch.",
	prefix.."jp / jump / jumppower [amount] - Change your Jump",
	prefix.."ws / speed / walkspeed [amount] - Change your Speed.",
	prefix.."fly - Flying for Mobile and Pc [it have flycar too].",
	prefix.."st / slot [1 to 6] - Change your Slots [Maybe bug for guard].",
	prefix.."aoped / autoopendoors - Automatic Open doors.",
	prefix.."unaoped / unautoopendoors - Stop Automatic Open doors.",
	prefix.."m4a1 - Get M4A1 [Require Gamepass].",
	prefix.."ak - Get AK-47.",
	prefix.."shotgun - Get Remington-870.",
	prefix.."m9 - Get M9.",
	"PRESS R TO RELOAD ALL GUNS",
}

local Owner = {
	"Owner Commands only:",
	"?checkusers - Check all users is Using H4X Admin "..version,
	"?kc / kick [plr] [reason] - Kicking Player is Using H4X Admin "..version,
}

for i,v in pairs(Owner) do
	print(v)
end

local WAIT = task.wait
local TBINSERT = table.insert
local TBFIND = table.find
local TBREMOVE = table.remove
local V2 = Vector2.new
local ROUND = math.round

local RS = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local To2D = Camera.WorldToViewportPoint

-- Only thing for now is Skeleton
local Library = {};
Library.__index = Library;

-- Functions
function Library:NewLine(info)
	local l = Drawing.new("Line")
	l.Visible = info.Visible or true;
	l.Color = info.Color or getgenv().FavoriteColor;
	l.Transparency = info.Transparency or 1;
	l.Thickness = info.Thickness or 1;
	return l
end

function Library:Smoothen(v)
	return V2(ROUND(v.X), ROUND(v.Y))
end

-- Skeleton Object
local Skeleton = {
	Removed = false;
	Player = nil;
	Visible = false;
	Lines = {};
	Color = getgenv().FavoriteColor;
	Alpha = 1;
	Thickness = 1;
	DoSubsteps = true;
}
Skeleton.__index = Skeleton;

function Skeleton:UpdateStructure()
	if not self.Player.Character then return end

	self:RemoveLines();

	for i, part in next, self.Player.Character:GetChildren() do		
		if not part:IsA("BasePart") then
			continue;
		end

		for i, link in next, part:GetChildren() do			
			if not link:IsA("Motor6D") then
				continue;
			end

			TBINSERT(
				self.Lines,
				{
					Library:NewLine({
						Visible = self.Visible;
						Color = self.Color;
						Transparency = self.Alpha;
						Thickness = self.Thickness;
					}),
					Library:NewLine({
						Visible = self.Visible;
						Color = self.Color;
						Transparency = self.Alpha;
						Thickness = self.Thickness;
					}),
					part.Name,
					link.Name
				}
			);
		end
	end
end

function Skeleton:SetVisible(State)
	for i,l in pairs(self.Lines) do
		l[1].Visible = State;
		l[2].Visible = State;
	end
end

function Skeleton:SetColor(Color)
	self.Color = Color;
	for i,l in pairs(self.Lines) do
		l[1].Color = Color;
		l[2].Color = Color;
	end
end

function Skeleton:SetAlpha(Alpha)
	self.Alpha = Alpha;
	for i,l in pairs(self.Lines) do
		l[1].Transparency = Alpha;
		l[2].Transparency = Alpha;
	end
end

function Skeleton:SetThickness(Thickness)
	self.Thickness = Thickness;
	for i,l in pairs(self.Lines) do
		l[1].Thickness = Thickness;
		l[2].Thickness = Thickness;
	end
end

function Skeleton:SetDoSubsteps(State)
	self.DoSubsteps = State;
end

-- Main Update Loop
function Skeleton:Update()
	if self.Removed then
		return;
	end

	local Character = self.Player.Character;
	if not Character then
		self:SetVisible(false);
		if not self.Player.Parent then
			self:Remove();
		end
		return;
	end

	local Humanoid = Character:FindFirstChildOfClass("Humanoid");
	if not Humanoid then
		self:SetVisible(false);
		return;
	end

	self:SetColor(self.Color);
	self:SetAlpha(self.Alpha);
	self:SetThickness(self.Thickness);

	local update = false;
	for i, l in pairs(self.Lines) do
		local part = Character:FindFirstChild(l[3])
		if not part then
			l[1].Visible = false;
			l[2].Visible = false;
			update = true;
			continue;
		end

		local link = part:FindFirstChild(l[4])
		if not (link and link.part0 and link.part1) then
			l[1].Visible = false;
			l[2].Visible = false;
			update = true;
			continue;
		end

		local part0 = link.Part0;
		local part1 = link.Part1;

		if self.DoSubsteps and link.C0 and link.C1 then
			local c0 = link.C0;
			local c1 = link.C1;

			-- Center of part0 to c0
			local part0p, v1 = To2D(Camera, part0.CFrame.p);
			local part0cp, v2 = To2D(Camera, (part0.CFrame * c0).p);

			if v1 and v2 then
				l[1].From = V2(part0p.x, part0p.y);
				l[1].To = V2(part0cp.x, part0cp.y);

				l[1].Visible = true;
			else 
				l[1].Visible = false;
			end

			-- Center of part1 to c1
			local part1p, v3 = To2D(Camera, part1.CFrame.p);
			local part1cp, v4 = To2D(Camera, (part1.CFrame * c1).p);

			if v3 and v4 then
				l[2].From = V2(part1p.x, part1p.y);
				l[2].To = V2(part1cp.x, part1cp.y);

				l[2].Visible = true;
			else 
				l[2].Visible = false;
			end
		else					
			local part0p, v1 = To2D(Camera, part0.CFrame.p);
			local part1p, v2 = To2D(Camera, part1.CFrame.p);

			if v1 and v2 then
				l[1].From = V2(part0p.x, part0p.y);
				l[1].To = V2(part1p.x, part1p.y);

				l[1].Visible = true;
			else 
				l[1].Visible = false;
			end

			l[2].Visible = false;
		end
	end

	if update or #self.Lines == 0 then
		self:UpdateStructure();
	end
end

function Skeleton:Toggle()
	self.Visible = not self.Visible;

	if self.Visible then 
		self:RemoveLines();
		self:UpdateStructure();

		local c;c = RS.Heartbeat:Connect(function()
			if not self.Visible then
				self:SetVisible(false);
				c:Disconnect();
				return;
			end

			self:Update();
		end)
	end
end

function Skeleton:RemoveLines()
	for i,l in pairs(self.Lines) do
		l[1]:Remove();
		l[2]:Remove();
	end
	self.Lines = {};
end

function Skeleton:Remove()
	self.Removed = true;
	self:RemoveLines();
end

-- Create Skeleton Function
function Library:NewSkeleton(Player, Visible, Color, Alpha, Thickness, DoSubsteps)
	if not Player then
		error("Missing Player argument (#1)")
	end

	local s = setmetatable({}, Skeleton);

	s.Player = Player;
	s.Bind = Player.UserId;

	if DoSubsteps ~= nil then
		s.DoSubsteps = DoSubsteps;
	end

	if Color then
		s:SetColor(Color)
	end

	if Alpha then
		s:SetAlpha(Alpha)
	end

	if Thickness then
		s:SetThickness(Thickness)
	end

	if Visible then
		s:Toggle();
	end

	return s;
end

-- TEST
local Skeletons = {}
game.Players.PlayerAdded:Connect(function(Player)
	if esp then
		table.insert(Skeletons, Library:NewSkeleton(Player, true));
	end
end)

task.spawn(function()
	while task.wait(1) do 
		pcall(function()
			for i, s in next, Skeletons do
				s:SetColor(getgenv().FavoriteColor)
				s:SetAlpha(math.random())
				s:SetThickness(math.random(10))
			end
		end)
	end
end)

function Notif(text)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "H4X ADMIN";
		Text = text;
	})
end


local H4XAdmin = Instance.new("ScreenGui")
local LoadingScreen = Instance.new("ImageLabel")
local ChangeColorLoadingScreen = Instance.new("UIGradient")
local FirstPartLoading = Instance.new("Frame")
local SecondPartLoading = Instance.new("Frame")
local LoadingMessage = Instance.new("TextLabel")
local TextH4X = Instance.new("TextLabel")
local TextAdmin = Instance.new("TextLabel")
local HomeScreen = Instance.new("ImageLabel")
local TextHome = Instance.new("TextLabel")
local TextScreen  = Instance.new("TextLabel")
local MessageWelcome = Instance.new("TextLabel")
local MessageThanks = Instance.new("TextLabel")
local MessageByOwner = Instance.new("TextLabel")
local ChangeColorHomeScreen = Instance.new("UIGradient")
local Image = Instance.new("ImageLabel")
local ScreencmdBar = Instance.new("ImageLabel")
local ChangeColorScreencmdBar = Instance.new("UIGradient")
local Textcmd = Instance.new("TextLabel")
local TextBar = Instance.new("TextLabel")
local BarExecution = Instance.new("TextBox")
local ScreenShowcmds = Instance.new("ImageLabel")
local ChangeColorScreenShowcmds = Instance.new("UIGradient")
local Show = Instance.new("TextLabel")
local cmds = Instance.new("TextLabel")
local Searchcmds = Instance.new("TextBox")
local cmdList = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local SearchIcon = Instance.new("ImageLabel")
local CloseButton = Instance.new("ImageButton")
local MinimizerButton =  Instance.new("ImageButton")
local ScreenTransparency = Instance.new("ImageLabel")
local XText = Instance.new("TextLabel")
local AdminText = Instance.new("TextLabel")
local VersionText = Instance.new("TextLabel")

H4XAdmin.Name = "H4XAdmin"
H4XAdmin.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
H4XAdmin.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
H4XAdmin.ResetOnSpawn  = false

LoadingScreen.Name = "LoadingScreen"
LoadingScreen.Parent = H4XAdmin
LoadingScreen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoadingScreen.BackgroundTransparency = 1.000
LoadingScreen.Position = UDim2.new(0, 425, 0, 150)
LoadingScreen.Size = UDim2.new(0, 400, 0, 0)
LoadingScreen.Image = "rbxassetid://3570695787"
LoadingScreen.ScaleType = Enum.ScaleType.Slice
LoadingScreen.SliceCenter = Rect.new(100, 100, 100, 100)
LoadingScreen.SliceScale = 0.120
LoadingScreen.Active = false
LoadingScreen.Draggable = true
LoadingScreen.Visible = false

ChangeColorLoadingScreen.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(0.51, Color3.fromRGB(20, 20, 20)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(25, 25, 25))}
ChangeColorLoadingScreen.Parent = LoadingScreen

FirstPartLoading.Name = "FirstPartLoading"
FirstPartLoading.Parent = LoadingScreen
FirstPartLoading.AnchorPoint = Vector2.new(0.5, 0.5)
FirstPartLoading.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
FirstPartLoading.BorderSizePixel = 0
FirstPartLoading.Position = UDim2.new(0.489852607, 0, 0.470588237, 10)
FirstPartLoading.Size = UDim2.new(0, 248, 0, 20)
FirstPartLoading.Visible = false

SecondPartLoading.Name = "SecondPartLoading"
SecondPartLoading.Parent = FirstPartLoading
SecondPartLoading.AnchorPoint = Vector2.new(1, 0)
SecondPartLoading.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SecondPartLoading.BorderSizePixel = 0
SecondPartLoading.Position = UDim2.new(1, 0, 0, 0)
SecondPartLoading.Size = UDim2.new(0, 248, 0, 20)
SecondPartLoading.Visible = false

LoadingMessage.Name = "LoadingMessage"
LoadingMessage.Parent = LoadingScreen
LoadingMessage.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
LoadingMessage.BackgroundTransparency = 5.000
LoadingMessage.BorderSizePixel = 0
LoadingMessage.Position = UDim2.new(0, 75, 0, 95)
LoadingMessage.Size = UDim2.new(0, 249, 0, 18)
LoadingMessage.Font = Enum.Font.SourceSans
LoadingMessage.Text = "Checking Version..."
LoadingMessage.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadingMessage.TextSize = 14.000
LoadingMessage.Visible = false

TextH4X.Name = "TextH4X"
TextH4X.Parent = LoadingScreen
TextH4X.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextH4X.BackgroundTransparency = 1.000
TextH4X.Position = UDim2.new(0, 45, 0, 5)
TextH4X.Size = UDim2.new(0.545604885, 0, 0.625000536, 0)
TextH4X.Font = Enum.Font.SourceSansBold
TextH4X.Text = "H4X"
TextH4X.TextColor3 = getgenv().FavoriteColor
TextH4X.TextSize = 30.000
TextH4X.Visible = false

TextAdmin.Name = "TextAdmin"
TextAdmin.Parent = LoadingScreen
TextAdmin.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextAdmin.BackgroundTransparency = 1.000
TextAdmin.Position = UDim2.new(0, 145, 0, 5)
TextAdmin.Size = UDim2.new(0.345114082, 0, 0.625, 0)
TextAdmin.Font = Enum.Font.SourceSansBold
TextAdmin.Text = "Admin"
TextAdmin.TextColor3 = Color3.fromRGB(255, 255, 255)
TextAdmin.TextSize = 30.000
TextAdmin.Visible = false

game:GetService("TweenService"):Create(H4XAdmin.LoadingScreen, TweenInfo.new(1, Enum.EasingStyle.Quint), {
	Size = UDim2.new(0, 400, 0, 200),
}):Play()
LoadingScreen.Visible = true
task.wait(1)
FirstPartLoading.Visible = true
SecondPartLoading.Visible = true
LoadingMessage.Visible = true
TextH4X.Visible = true
TextAdmin.Visible = true
task.wait(math.random(1, 5))
LoadingMessage.Text = "Checking Blacklist..."
for i,v in pairs(Blacklist) do
	if v == game.Players.LocalPlayer then
		game.Players.LocalPlayer:Kick("[ERROR]: You is in Blacklist, return nil")
		return
	end
end
SecondPartLoading.Size = UDim2.new(0, 208, 0, 20)
task.wait(math.random(1, 5))
LoadingMessage.Text = "Checking Device..."
SecondPartLoading.Size = UDim2.new(0, 188, 0, 20)
task.wait(math.random(1, 5))
local UserInputService = game:GetService("UserInputService")
if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
	Notif("Mobile device")
elseif not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
	Notif("Computer device")
elseif UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
	Notif("Computer device with touchscreen")
elseif UserInputService.GamepadEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
	Notif("Console device")
end
LoadingMessage.Text = "Checking Data..."
SecondPartLoading.Size = UDim2.new(0, 160, 0, 20)
task.wait(math.random(1, 5))
if os.date then
	Notif(os.date())
end
LoadingMessage.Text = "Loading UI..."
SecondPartLoading.Size = UDim2.new(0, 80, 0, 20)
task.wait(math.random(1, 5))
LoadingMessage.Text = "Finalizing..."
SecondPartLoading.Size = UDim2.new(0, 0, 0, 20)
task.wait(math.random(1, 5))
game:GetService("TweenService"):Create(H4XAdmin.LoadingScreen, TweenInfo.new(1, Enum.EasingStyle.Quint), {
	Size = UDim2.new(0, 400, 0, 0),
}):Play()
FirstPartLoading.Visible = false
SecondPartLoading.Visible = false
LoadingMessage.Visible = false
TextH4X.Visible = false
TextAdmin.Visible = false
task.wait(1)
LoadingScreen.Visible = false

HomeScreen.Name = "HomeScreen"
HomeScreen.Parent = H4XAdmin
HomeScreen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HomeScreen.BackgroundTransparency = 1.000
HomeScreen.BorderSizePixel = 0
HomeScreen.Position = UDim2.new(0, 480, 0, 80)
HomeScreen.Size = UDim2.new(0, 300, 0, 0)
HomeScreen.Image = "rbxassetid://3570695787"
HomeScreen.ScaleType = Enum.ScaleType.Slice
HomeScreen.SliceCenter = Rect.new(100, 100, 100, 100)
HomeScreen.SliceScale = 0.120
HomeScreen.Active = false
HomeScreen.Draggable = true
HomeScreen.Visible = false

TextHome.Name = "TextHome"
TextHome.Parent = HomeScreen
TextHome.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextHome.BackgroundTransparency = 1.000
TextHome.Position = UDim2.new(0, 35, 0, -65)
TextHome.Size = UDim2.new(0.545604885, 0, 0.625000536, 0)
TextHome.Font = Enum.Font.SourceSansBold
TextHome.Text = "Home"
TextHome.TextColor3 = getgenv().FavoriteColor
TextHome.TextSize = 30.000
TextHome.Visible = false

TextScreen.Name = "TextScreen"
TextScreen.Parent = HomeScreen
TextScreen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextScreen.BackgroundTransparency = 1.000
TextScreen.Position = UDim2.new(0, 135, 0, -65)
TextScreen.Size = UDim2.new(0.345114082, 0, 0.625, 0)
TextScreen.Font = Enum.Font.SourceSansBold
TextScreen.Text = "Screen"
TextScreen.TextColor3 = Color3.fromRGB(255, 255, 255)
TextScreen.TextSize = 30.000
TextScreen.Visible = false

MessageWelcome.Name = "MessageWelcome"
MessageWelcome.Parent = HomeScreen
MessageWelcome.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MessageWelcome.BackgroundTransparency = 5.000
MessageWelcome.BorderSizePixel = 0
MessageWelcome.Position = UDim2.new(0, 30, 0, 165)
MessageWelcome.Size = UDim2.new(0, 249, 0, 18)
MessageWelcome.Font = Enum.Font.SourceSans
MessageWelcome.Text = "Welcome "..game:GetService("Players").LocalPlayer.DisplayName.."!"
MessageWelcome.TextColor3 = Color3.fromRGB(255, 255, 255)
MessageWelcome.TextSize = 14.000
MessageWelcome.Visible = false

MessageThanks.Name = "MessageThanks"
MessageThanks.Parent = HomeScreen
MessageThanks.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MessageThanks.BackgroundTransparency = 5.000
MessageThanks.BorderSizePixel = 0
MessageThanks.Position = UDim2.new(0, 30, 0, 180)
MessageThanks.Size = UDim2.new(0, 249, 0, 18)
MessageThanks.Font = Enum.Font.SourceSans
MessageThanks.Text = "Thank you for using my script."
MessageThanks.TextColor3 = Color3.fromRGB(255, 255, 255)
MessageThanks.TextSize = 14.000
MessageThanks.Visible = false

MessageByOwner.Name = "MessageByOwner"
MessageByOwner.Parent = HomeScreen
MessageByOwner.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MessageByOwner.BackgroundTransparency = 5.000
MessageByOwner.BorderSizePixel = 0
MessageByOwner.Position = UDim2.new(0, 30, 0, 195)
MessageByOwner.Size = UDim2.new(0, 249, 0, 18)
MessageByOwner.Font = Enum.Font.SourceSans
MessageByOwner.Text = " Owner - H17S3"
MessageByOwner.TextColor3 = Color3.fromRGB(255, 255, 255)
MessageByOwner.TextSize = 14.000
MessageByOwner.Visible = false

ChangeColorHomeScreen.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(0.51, Color3.fromRGB(20, 20, 20)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(25, 25, 25))}
ChangeColorHomeScreen.Parent = HomeScreen

Image.Parent = HomeScreen
Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Image.BackgroundTransparency = 5.000
Image.Position = UDim2.new(0, 100, 0, 50)
Image.Size = UDim2.new(0, 100, 0, 100)
Image.Image = game:GetService("Players"):GetUserThumbnailAsync(game:GetService("Players").LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
Image.Visible = false

game:GetService("TweenService"):Create(H4XAdmin.HomeScreen, TweenInfo.new(1, Enum.EasingStyle.Quint), {
	Size = UDim2.new(0, 300, 0, 300),
}):Play()
HomeScreen.Visible = true
task.wait(1)
TextHome.Visible = true
TextScreen.Visible = true
MessageWelcome.Visible = true
MessageThanks.Visible = true
MessageByOwner.Visible = true
Image.Visible = true
task.wait(4)
game:GetService("TweenService"):Create(H4XAdmin.HomeScreen, TweenInfo.new(1, Enum.EasingStyle.Quint), {
	Size = UDim2.new(0, 300, 0, 0),
}):Play()
TextHome.Visible = false
TextScreen.Visible = false
MessageWelcome.Visible = false
MessageThanks.Visible = false
MessageByOwner.Visible = false
Image.Visible = false
task.wait(1)
HomeScreen.Visible = false

ScreencmdBar.Name = "ScreencmdBar"
ScreencmdBar.Parent = H4XAdmin
ScreencmdBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreencmdBar.BackgroundTransparency = 1.000
ScreencmdBar.Position = UDim2.new(0, 35, 0, 370)
ScreencmdBar.Size = UDim2.new(0, 250, 0, 100)
ScreencmdBar.Image = "rbxassetid://3570695787"
ScreencmdBar.ScaleType = Enum.ScaleType.Slice
ScreencmdBar.SliceCenter = Rect.new(100, 100, 100, 100)
ScreencmdBar.SliceScale = 0.120
ScreencmdBar.Active = true
ScreencmdBar.Draggable = true

ChangeColorScreencmdBar.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(0.51, Color3.fromRGB(20, 20, 20)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(25, 25, 25))}
ChangeColorScreencmdBar.Parent = ScreencmdBar

Textcmd.Name = "Textcmd"
Textcmd.Parent = ScreencmdBar
Textcmd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Textcmd.BackgroundTransparency = 1.000
Textcmd.Position = UDim2.new(0, 26, 0, -5)
Textcmd.Size = UDim2.new(0.545604885, 0, 0.625000536, 0)
Textcmd.Font = Enum.Font.SourceSansBold
Textcmd.Text = "Command"
Textcmd.TextColor3 = getgenv().FavoriteColor
Textcmd.TextSize = 30.000

TextBar.Name = "TextBar"
TextBar.Parent = ScreencmdBar
TextBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBar.BackgroundTransparency = 1.000
TextBar.Position = UDim2.new(0, 125, 0, -5)
TextBar.Size = UDim2.new(0.345114082, 0, 0.625, 0)
TextBar.Font = Enum.Font.SourceSansBold
TextBar.Text = "Bar"
TextBar.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBar.TextSize = 30.000

BarExecution.Name = "BarExecution"
BarExecution.Parent = ScreencmdBar
BarExecution.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
BarExecution.BackgroundTransparency = 5.000
BarExecution.BorderColor3 = Color3.fromRGB(255, 0, 0)
BarExecution.Position = UDim2.new(0.097, 0, 0.436, 0)
BarExecution.Size = UDim2.new(0, 200, 0, 30)
BarExecution.Font = Enum.Font.SourceSans
BarExecution.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
BarExecution.PlaceholderText = "Press "..prefix.." To Enter"
BarExecution.Text = ""
BarExecution.TextColor3 = Color3.fromRGB(255, 255, 255)
BarExecution.TextSize = 14.000
BarExecution.TextWrapped = true

ScreenShowcmds.Name = "ScreenShowcmds"
ScreenShowcmds.Parent = H4XAdmin
ScreenShowcmds.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreenShowcmds.BackgroundTransparency = 1.000
ScreenShowcmds.Position = UDim2.new(0, 480, 0, 80)
ScreenShowcmds.Size = UDim2.new(0, 300, 0, 400)
ScreenShowcmds.Image = "rbxassetid://3570695787"
ScreenShowcmds.ScaleType = Enum.ScaleType.Slice
ScreenShowcmds.SliceCenter = Rect.new(100, 100, 100, 100)
ScreenShowcmds.SliceScale = 0.120
ScreenShowcmds.Active = true
ScreenShowcmds.Draggable = true
ScreenShowcmds.Visible = false

ChangeColorScreenShowcmds.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(0.51, Color3.fromRGB(20, 20, 20)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(25, 25, 25))}
ChangeColorScreenShowcmds.Parent = ScreenShowcmds

Show.Name = "Show"
Show.Parent = ScreenShowcmds
Show.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Show.BackgroundTransparency = 1.000
Show.Position = UDim2.new(0, 15, 0, -90)
Show.Size = UDim2.new(0.545604885, 0, 0.625000536, 0)
Show.Font = Enum.Font.SourceSansBold
Show.Text = "Show"
Show.TextColor3 = getgenv().FavoriteColor
Show.TextSize = 30.000

cmds.Name = "cmds"
cmds.Parent = ScreenShowcmds
cmds.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
cmds.BackgroundTransparency = 1.000
cmds.Position = UDim2.new(0, 135, 0, -90)
cmds.Size = UDim2.new(0.345114082, 0, 0.625, 0)
cmds.Font = Enum.Font.SourceSansBold
cmds.Text = "Command"
cmds.TextColor3 = Color3.fromRGB(255, 255, 255)
cmds.TextSize = 30.000

Searchcmds.Name = "Searchcmds"
Searchcmds.Parent = ScreenShowcmds
Searchcmds.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Searchcmds.BackgroundTransparency = 5.000
Searchcmds.BorderSizePixel = 0
Searchcmds.Position = UDim2.new(0, 25, 0, 55)
Searchcmds.Size = UDim2.new(0, 259, 0, 25)
Searchcmds.Font = Enum.Font.SourceSans
Searchcmds.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
Searchcmds.PlaceholderText = "Search"
Searchcmds.Text = ""
Searchcmds.TextColor3 = Color3.fromRGB(255, 255, 255)
Searchcmds.TextScaled = true
Searchcmds.TextSize = 14.000
Searchcmds.TextWrapped = true

cmdList.Name = "cmdList"
cmdList.Parent = ScreenShowcmds
cmdList.Active = true
cmdList.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
cmdList.BackgroundTransparency = 5.000
cmdList.BorderSizePixel = 0
cmdList.Position = UDim2.new(0, 15, 0, 95)
cmdList.Size = UDim2.new(0, 275, 0, 270)
cmdList.CanvasSize = UDim2.new(0, 0, 2, 0)
cmdList.ScrollBarThickness = 6
cmdList.CanvasSize = UDim2.new(3, 0, 8, 0)

SearchIcon.Name = "SearchIcon"
SearchIcon.Parent = ScreenShowcmds
SearchIcon.BackgroundTransparency = 1.000
SearchIcon.Position = UDim2.new(0, 88, 0, -131)
SearchIcon.Size = UDim2.new(0.0936583355, 0, 1, 0)
SearchIcon.Image = "rbxassetid://3605509925"
SearchIcon.ScaleType = Enum.ScaleType.Fit

CloseButton.Name = "CloseButton"
CloseButton.Parent = ScreenShowcmds
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundTransparency = 1.000
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(0.915253282, 0, 0, 0)
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Image = "rbxassetid://3944676352"

MinimizerButton.Name = "MinimizerButton"
MinimizerButton.Parent = ScreenShowcmds
MinimizerButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MinimizerButton.BackgroundTransparency = 1.000
MinimizerButton.BorderSizePixel = 0
MinimizerButton.Position = UDim2.new(0.831919968, 0, 0, 0)
MinimizerButton.Rotation = 90.000
MinimizerButton.Size = UDim2.new(0, 25, 0, 25)
MinimizerButton.Image = "rbxassetid://4400703447"

function Addcmd(Pos, Name)
	local Newcmd = Instance.new("TextLabel")

	Newcmd.Name = "Newcmd"..Pos
	Newcmd.Parent = cmdList
	Newcmd.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
	Newcmd.BackgroundTransparency = 1.000
	Newcmd.BorderSizePixel = 0
	Newcmd.Size = UDim2.new(0, 275, 0, 25)
	Newcmd.Font = Enum.Font.SourceSans
	Newcmd.Text = Name
	Newcmd.TextColor3 = Color3.fromRGB(255, 255, 255)
	Newcmd.TextSize = 14.000
	Newcmd.TextXAlignment = Enum.TextXAlignment.Left
	Newcmd.TextWrapped = true
end

for i = 1, #Allcmds do
	Addcmd(i, Allcmds[i])
end

UIListLayout.Parent = cmdList
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 1)

ScreenTransparency.Name = "ScreenTransparency"
ScreenTransparency.Parent = H4XAdmin
ScreenTransparency.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreenTransparency.BackgroundTransparency = 5.000
ScreenTransparency.BorderSizePixel = 0
ScreenTransparency.Position = UDim2.new(0, 515, 0, -10)
ScreenTransparency.Size = UDim2.new(0, 211, 0, 32)
ScreenTransparency.Image = "rbxassetid://3570695787"
ScreenTransparency.ImageTransparency = 5.000
ScreenTransparency.ScaleType = Enum.ScaleType.Slice
ScreenTransparency.SliceCenter = Rect.new(100, 100, 100, 100)
ScreenTransparency.SliceScale = 0.120
ScreenTransparency.Active = false
ScreenTransparency.Draggable = true

XText.Name = "XText"
XText.Parent = ScreenTransparency
XText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
XText.BackgroundTransparency = 1.000
XText.Position = UDim2.new(0, -5, 0, -5)
XText.Size = UDim2.new(0.545604885, 0, 0.625000536, 0)
XText.Font = Enum.Font.SourceSansBold
XText.Text = "H4X"
XText.TextColor3 = getgenv().FavoriteColor
XText.TextSize = 30.000

AdminText.Name = "AdminText"
AdminText.Parent = ScreenTransparency
AdminText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AdminText.BackgroundTransparency = 1.000
AdminText.Position = UDim2.new(0, 75, 0, -5)
AdminText.Size = UDim2.new(0.345114082, 0, 0.625, 0)
AdminText.Font = Enum.Font.SourceSansBold
AdminText.Text = "Admin"
AdminText.TextColor3 = Color3.fromRGB(255, 255, 255)
AdminText.TextSize = 30.000

VersionText.Name = "VersionText"
VersionText.Parent = ScreenTransparency
VersionText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
VersionText.BackgroundTransparency = 1.000
VersionText.Position = UDim2.new(0, 145, 0, 2)
VersionText.Size = UDim2.new(0.241706163, 0, 0.4375, 0)
VersionText.Font = Enum.Font.SourceSans
VersionText.Text = version
VersionText.TextColor3 = Color3.fromRGB(255, 255, 255)
VersionText.TextSize = 15.000
VersionText.TextXAlignment = Enum.TextXAlignment.Left

local function WKWHX_fake_script() -- ScreenShowcmds.LocalScript 
	local script = Instance.new("LocalScript", ScreenShowcmds)

	local searchBar = script.Parent.Searchcmds
	local cmdlist = script.Parent.cmdList
	local searchIcon = script.Parent.SearchIcon
	script.Parent.Searchcmds.PlaceholderText = "Search"

	function updateSearch()
		while wait(.2) do
			for i,label in pairs(cmdlist:GetChildren()) do
				if label:IsA("TextLabel") then
					local searchText = string.lower(searchBar.Text)
					if searchText ~= "" then
						local labelText = string.lower(label.Text)
						if string.find(labelText, searchText) then
							label.Visible = true
						else
							label.Visible = false
						end
					else
						label.Visible = true
					end
				end
			end
		end
	end

	spawn(updateSearch)
end
if not Gotton_by_H17S3 or #Gotton_by_H17S3 ~= 15 then
	return
end
coroutine.wrap(WKWHX_fake_script)()
local function ZWPHND_fake_script() -- ScreenShowcmds.LocalScript 
	local script = Instance.new("LocalScript", ScreenShowcmds)

	script.Parent.Visible = true
	script.Parent.Position = UDim2.new(0, -480, 0, 80)
	script.Parent:TweenPosition(UDim2.new(0, 480, 0, 80), "Out", "Sine", 1, true)
	script.Parent.Draggable = true
	script.Parent.Active = true

	local MinimizerButton = script.Parent.MinimizerButton
	local CloseButton = script.Parent.CloseButton
	local cmdoslist = script.Parent.cmdList

	getgenv().Minimized = false

	MinimizerButton.MouseButton1Click:Connect(function()
		if getgenv().Minimized == false then
			cmdList.Visible = false
			script.Parent.Searchcmds.Visible = false
			script.Parent.SearchIcon.Visible = false
			script.Parent.Show.Visible = false
			script.Parent.cmds.Visible = false
			script.Parent:TweenSize(UDim2.new(0, 300,0, 37), "In", "Sine", 1, true)
			getgenv().Minimized = true
		else
			script.Parent:TweenSize(UDim2.new(0, 300,0, 375), "In", "Sine", 1, true)
			wait(1)
			cmdList.Visible = true
			script.Parent.Searchcmds.Visible = true
			script.Parent.SearchIcon.Visible = true
			script.Parent.Show.Visible = true
			script.Parent.cmds.Visible = true
			getgenv().Minimized = false
		end
	end)

	CloseButton.MouseButton1Click:Connect(function()
		script.Parent:TweenPosition(UDim2.new(0, -480, 0, 80), "Out", "Bounce", 1, true)
		wait(1.5)
		script.Parent.Visible = false
	end)
end
coroutine.wrap(ZWPHND_fake_script)()


local players = game:GetService("Players")
local run = game:GetService("RunService")
local localplayer = players.LocalPlayer
local character = localplayer.Character
local humroot = character:FindFirstChild("HumanoidRootPart")
local backpack = localplayer.Backpack
local humanoid = character:FindFirstChild("Humanoid")

local usingcmd = false

--[[ General Functions ]]

states = {
	autorefresh = true,
	antiafk = true,
	autoguns = false,
	autoremovekits = false,
	antifling = true,
	hitcircler = false,
	fastpunch = false,
	superpunch = false,
	killaura = false,
	arrestaura = false,
	autolock = false,
	autochat = true,
	forcefield = false,
	clickkill = false,
	clickarrest = false,
	clicktase = false,
	holdpunch = false,
	antitouch = false,
	antiarrest = false,
	infammo = false,
	autoopendoors = false,
	butterfly = false,
	butterflycar = false,
}

whitelisted = {}
supports = {}
owners = {"QZX4likePS4676"}
whitelisted = {}
loopkills = {}
loopkills2 = {}
looparrets = {}
looptases = {}
connections = {}

--[[ Command Functions ]]

function MoveToJunk(v)
	v.CFrame = CFrame.new(0,5^5,0)
end

function unsit()
	repeat task.wait() until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	game.Players.LocalPlayer.Character.Humanoid.Sit = false
end

function getpos()
	repeat task.wait() until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.HumanoidRootPart
	return game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end

function GetTeam()
	return game.Players.LocalPlayer.TeamColor.Name
end

function MoveTo(Pos,t)
	unsit()
	pcall(function()
		if typeof(Pos):lower() == "position" then
			Pos = CFrame.new(Pos)
		end
		unsit()
		for i =1, 5 do
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
		end
	end)
end

function WaitForRespawn()
	task.spawn(function()
		Waiting = true
		local RepeatPos = getpos()
		repeat task.wait() until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.HumanoidRootPart
		task.spawn(function()
			Waiting2 = game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
				repeat task.wait() until char and char.HumanoidRootPart
				Waiting = false
				MoveTo(RepeatPos)
			end)
		end)
		repeat task.wait()
			RepeatPos = getpos()
		until Waiting == false
		Waiting2:Disconnect()
	end)
	return
end

function ReturnGun()
	for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if v and v:IsA("Tool") and v:FindFirstChildOfClass("ModuleScript") then
			return v
		end
	end
	return nil
end

function ChangeTeam(Team)
	if Team == game.Teams.Criminals then
		local pos = getpos()
		local crimpad = workspace["Criminals Spawn"].SpawnLocation
		crimpad.CanCollide = false
		crimpad.Transparency = 1
		repeat task.wait()crimpad.CFrame = getpos() until game.Players.LocalPlayer.Team == game.Teams.Criminals
		wait()
		MoveTo(pos)
		MoveToJunk(crimpad)
		return
	end
	local a,b,c= nil,getpos(),game.Workspace.CurrentCamera.CFrame
	a = game.Players.LocalPlayer.CharacterAdded:Connect(function(Char)
		task.spawn(function()
			game.Workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Wait()
			for i =1,5 do
				game.Workspace.CurrentCamera.CFrame = c
			end
		end)
		Char:WaitForChild("HumanoidRootPart")
		MoveTo(b)
		a:Disconnect()
	end)
	local ohString1 = Team.TeamColor.Name
	game.Workspace.Remote.TeamEvent:FireServer(ohString1)
	return
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
		local a,b,c = nil,getpos(),game.Workspace.CurrentCamera.CFrame
		a = game.Players.LocalPlayer.CharacterAdded:Connect(function(Char)
			task.spawn(function()
				game.Workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Wait()
				for i =1,5 do
					game.Workspace.CurrentCamera.CFrame = c
				end
			end)
			game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
			MoveTo(b)
			a:Disconnect()
		end)
		local Team = Valid_Team(Lastteam)
		if Team and Team~=1 then
			local pos = getpos()
			game.Workspace.Remote.TeamEvent:FireServer(Lastteam)
		elseif Team and Team == 1 then
			game.Workspace.Remote.TeamEvent:FireServer("Bright orange")
			local crimpad = game.Workspace["Criminals Spawn"].SpawnLocation
			crimpad.CanCollide = false
			crimpad.Transparency = 1
			repeat task.wait() crimpad.CFrame = getpos() until game.Players.LocalPlayer.Team == game.Teams.Criminals
			MoveToJunk(crimpad)
		end
	end)
end

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

Events = {
	TeamEvent = game.Workspace.Remote.TeamEvent,
	ShootEvent = game:GetService("ReplicatedStorage").ShootEvent,
	loadchar = function()
		if game.Players.LocalPlayer.Team == game.Teams.Inmates then
			local ohString1 = "Bright orange"
			game.Workspace.Remote.TeamEvent:FireServer(ohString1)
		elseif game.Players.LocalPlayer.Team == game.Teams.Guards then
			game.Workspace.Remote.TeamEvent:FireServer("Bright orange")
			wait()
			local ohString1 = "Bright blue"
			game.Workspace.Remote.TeamEvent:FireServer(ohString1)
		elseif game.Players.LocalPlayer.Team == game.Teams.Criminals then
			game.Workspace.Remote.TeamEvent:FireServer("Bright orange")
			local crimpad = game.Workspace["Criminals Spawn"].SpawnLocation
			crimpad.CanCollide = false
			crimpad.Transparency = 1
			repeat task.wait() crimpad.CFrame = getpos() until game.Players.LocalPlayer.Team == game.Teams.Criminals
			MoveToJunk(crimpad)
		end
	end,
}

function refresh(Pos)
	if not Pos then
		Pos = getpos()
	end
	local Goto = Pos or getpos()
	local Connections = {}
	local Cam = game.Workspace.CurrentCamera.CFrame
	Connections[1] = game.Players.LocalPlayer.CharacterAdded:Connect(function(charnew)
		pcall(function()
			task.spawn(function()
				game.Workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Wait()
				for i =1,5 do
					game.Workspace.CurrentCamera.CFrame = Cam
				end
			end)
			repeat task.wait() until charnew and charnew:FindFirstChild("HumanoidRootPart")
			MoveTo(Goto)
			task.spawn(function()
				wait(.01)
				for i =1,5 do
					MoveTo(Goto)
				end
			end)
			Connections[1]:Disconnect()
		end)
	end)
	Events.loadchar()
	return
end

function GetGun(name) game.Workspace.Remote.ItemHandler:InvokeServer({Parent=game.Workspace.Prison_ITEMS:FindFirstChild(name, true), Position=game.Players.LocalPlayer.Character.Head.Position}) end

function All_Guns()
	if game.Players.LocalPlayer.Backpack:FindFirstChild("AK-47") or game.Players.LocalPlayer.Character:FindFirstChild("AK-47") and game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870") or game.Players.LocalPlayer.Character:FindFirstChild("Remington 870") or game.Players.LocalPlayer.Backpack:FindFirstChild("M9") and game.Players.LocalPlayer.Character:FindFirstChild("M9") then
		return
	else
		if getgenv().Slotguns == "1" then
			local saved = game.Players.LocalPlayer.Character:GetPrimaryPartCFrame()
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("M9") and not game.Players.LocalPlayer.Character:FindFirstChild("M9") then
				repeat wait()
					GetGun("M9",true)
				until game.Players.LocalPlayer.Backpack:FindFirstChild("M9") or game.Players.LocalPlayer.Character:FindFirstChild("M9")
			end
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("M4A1") and not game.Players.LocalPlayer.Character:FindFirstChild("M4A1") then
				if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 96651) then
					repeat wait()
						GetGun("M4A1",true)
					until game.Players.LocalPlayer.Backpack:FindFirstChild("M4A1") or game.Players.LocalPlayer.Character:FindFirstChild("M4A1")
				end
			end
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870") and not game.Players.LocalPlayer.Character:FindFirstChild("Remington 870") then
				repeat wait()
					GetGun("Remington 870",true)
				until game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870") or game.Players.LocalPlayer.Character:FindFirstChild("Remington 870")
			end
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("AK-47") and not game.Players.LocalPlayer.Character:FindFirstChild("AK-47") then
				repeat wait()
					GetGun("AK-47",true)
					require(game.Players.LocalPlayer.Backpack:FindFirstChild("AK-47"):FindFirstChild("GunStates"))["FireRate"] = 0.09
				until game.Players.LocalPlayer.Backpack:FindFirstChild("AK-47") or game.Players.LocalPlayer.Character:FindFirstChild("AK-47")
			end
			wait()
			task.spawn(function()
				game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(saved)
			end)
		elseif getgenv().Slotguns == "2" then
			local saved = game.Players.LocalPlayer.Character:GetPrimaryPartCFrame()
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("M9") and not game.Players.LocalPlayer.Character:FindFirstChild("M9") then
				repeat wait()
					GetGun("M9",true)
				until game.Players.LocalPlayer.Backpack:FindFirstChild("M9") or game.Players.LocalPlayer.Character:FindFirstChild("M9")
			end
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("AK-47") and not game.Players.LocalPlayer.Character:FindFirstChild("AK-47") then
				repeat wait()
					GetGun("AK-47",true)
					require(game.Players.LocalPlayer.Backpack:FindFirstChild("AK-47"):FindFirstChild("GunStates"))["FireRate"] = 0.09
				until game.Players.LocalPlayer.Backpack:FindFirstChild("AK-47") or game.Players.LocalPlayer.Character:FindFirstChild("AK-47")
			end
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870") and not game.Players.LocalPlayer.Character:FindFirstChild("Remington 870") then
				repeat wait()
					GetGun("Remington 870",true)
				until game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870") or game.Players.LocalPlayer.Character:FindFirstChild("Remington 870")
			end
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("M4A1") and not game.Players.LocalPlayer.Character:FindFirstChild("M4A1") then
				if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 96651) then
					repeat wait()
						GetGun("M4A1",true)
					until game.Players.LocalPlayer.Backpack:FindFirstChild("M4A1") or game.Players.LocalPlayer.Character:FindFirstChild("M4A1")
				end
			end
			wait()
			task.spawn(function()
				game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(saved)
			end)
		elseif getgenv().Slotguns == "3" then
			local saved = game.Players.LocalPlayer.Character:GetPrimaryPartCFrame()
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("M4A1") and not game.Players.LocalPlayer.Character:FindFirstChild("M4A1") then
				if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 96651) then
					repeat wait()
						GetGun("M4A1",true)
					until game.Players.LocalPlayer.Backpack:FindFirstChild("M4A1") or game.Players.LocalPlayer.Character:FindFirstChild("M4A1")
				end
			end
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870") and not game.Players.LocalPlayer.Character:FindFirstChild("Remington 870") then
				repeat wait()
					GetGun("Remington 870",true)
				until game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870") or game.Players.LocalPlayer.Character:FindFirstChild("Remington 870")
			end
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("AK-47") and not game.Players.LocalPlayer.Character:FindFirstChild("AK-47") then
				repeat wait()
					GetGun("AK-47",true)
					require(game.Players.LocalPlayer.Backpack:FindFirstChild("AK-47"):FindFirstChild("GunStates"))["FireRate"] = 0.09
				until game.Players.LocalPlayer.Backpack:FindFirstChild("AK-47") or game.Players.LocalPlayer.Character:FindFirstChild("AK-47")
			end
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("M9") and not game.Players.LocalPlayer.Character:FindFirstChild("M9") then
				repeat wait()
					GetGun("M9",true)
				until game.Players.LocalPlayer.Backpack:FindFirstChild("M9") or game.Players.LocalPlayer.Character:FindFirstChild("M9")
			end
			wait()
			task.spawn(function()
				game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(saved)
			end)
		elseif getgenv().Slotguns == "4" then
			local saved = game.Players.LocalPlayer.Character:GetPrimaryPartCFrame()
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("AK-47") and not game.Players.LocalPlayer.Character:FindFirstChild("AK-47") then
				repeat wait()
					GetGun("AK-47",true)
					require(game.Players.LocalPlayer.Backpack:FindFirstChild("AK-47"):FindFirstChild("GunStates"))["FireRate"] = 0.09
				until game.Players.LocalPlayer.Backpack:FindFirstChild("AK-47") or game.Players.LocalPlayer.Character:FindFirstChild("AK-47")
			end
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870") and not game.Players.LocalPlayer.Character:FindFirstChild("Remington 870") then
				repeat wait()
					GetGun("Remington 870",true)
				until game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870") or game.Players.LocalPlayer.Character:FindFirstChild("Remington 870")
			end
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("M4A1") and not game.Players.LocalPlayer.Character:FindFirstChild("M4A1") then
				if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 96651) then
					repeat wait()
						GetGun("M4A1",true)
					until game.Players.LocalPlayer.Backpack:FindFirstChild("M4A1") or game.Players.LocalPlayer.Character:FindFirstChild("M4A1")
				end
			end
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("M9") and not game.Players.LocalPlayer.Character:FindFirstChild("M9") then
				repeat wait()
					GetGun("M9",true)
				until game.Players.LocalPlayer.Backpack:FindFirstChild("M9") or game.Players.LocalPlayer.Character:FindFirstChild("M9")
			end
			wait()
			task.spawn(function()
				game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(saved)
			end)
		elseif getgenv().Slotguns == "5" then
			local saved = game.Players.LocalPlayer.Character:GetPrimaryPartCFrame()
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("M4A1") and not game.Players.LocalPlayer.Character:FindFirstChild("M4A1") then
				if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 96651) then
					repeat wait()
						GetGun("M4A1",true)
					until game.Players.LocalPlayer.Backpack:FindFirstChild("M4A1") or game.Players.LocalPlayer.Character:FindFirstChild("M4A1")
				end
			end
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("AK-47") and not game.Players.LocalPlayer.Character:FindFirstChild("AK-47") then
				repeat wait()
					GetGun("AK-47",true)
					require(game.Players.LocalPlayer.Backpack:FindFirstChild("AK-47"):FindFirstChild("GunStates"))["FireRate"] = 0.09
				until game.Players.LocalPlayer.Backpack:FindFirstChild("AK-47") or game.Players.LocalPlayer.Character:FindFirstChild("AK-47")
			end
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870") and not game.Players.LocalPlayer.Character:FindFirstChild("Remington 870") then
				repeat wait()
					GetGun("Remington 870",true)
				until game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870") or game.Players.LocalPlayer.Character:FindFirstChild("Remington 870")
			end
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("M9") and not game.Players.LocalPlayer.Character:FindFirstChild("M9") then
				repeat wait()
					GetGun("M9",true)
				until game.Players.LocalPlayer.Backpack:FindFirstChild("M9") or game.Players.LocalPlayer.Character:FindFirstChild("M9")
			end
			wait()
			task.spawn(function()
				game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(saved)
			end)
		elseif getgenv().Slotguns == "6" then
			local saved = game.Players.LocalPlayer.Character:GetPrimaryPartCFrame()
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("AK-47") and not game.Players.LocalPlayer.Character:FindFirstChild("AK-47") then
				repeat wait()
					GetGun("AK-47",true)
					require(game.Players.LocalPlayer.Backpack:FindFirstChild("AK-47"):FindFirstChild("GunStates"))["FireRate"] = 0.09
				until game.Players.LocalPlayer.Backpack:FindFirstChild("AK-47") or game.Players.LocalPlayer.Character:FindFirstChild("AK-47")
			end
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("M4A1") and not game.Players.LocalPlayer.Character:FindFirstChild("M4A1") then
				if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 96651) then
					repeat wait()
						GetGun("M4A1",true)
					until game.Players.LocalPlayer.Backpack:FindFirstChild("M4A1") or game.Players.LocalPlayer.Character:FindFirstChild("M4A1")
				end
			end
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870") and not game.Players.LocalPlayer.Character:FindFirstChild("Remington 870") then
				repeat wait()
					GetGun("Remington 870",true)
				until game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870") or game.Players.LocalPlayer.Character:FindFirstChild("Remington 870")
			end
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("M9") and not game.Players.LocalPlayer.Character:FindFirstChild("M9") then
				repeat wait()
					GetGun("M9",true)
				until game.Players.LocalPlayer.Backpack:FindFirstChild("M9") or game.Players.LocalPlayer.Character:FindFirstChild("M9")
			end
			wait()
			task.spawn(function()
				game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(saved)
			end)
		end
	end
end

function Kill_All(TeamS,plr)
	local a = GetTeam()
	local saved = getpos()
	local Team = GetTeam()
	if TeamS == "all" then
		ChangeTeam(game.Teams.Inmates)
	end
	if TeamS then
		if TeamS == "guards" then
			ChangeTeam(game.Teams.Inmates)
			wait()
			GetGun("Remington 870")
			repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870")
			local Gun = game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870")
			local Gen = {}
			for i,v in pairs(game.Players:GetPlayers()) do
				if not table.find(whitelisted,v.Name) and v ~= plr  and v ~= game.Players.LocalPlayer then
					if v.Team == game.Teams.Guards then
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
			WaitForRespawn()
			wait(.4)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = saved
			Notif("All Guard Players has been Killed.")
			if plr then
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: All Guard Players has been Killed.", "All")
			end
		elseif TeamS == "inmates" then
			ChangeTeam(game.Teams.Criminals)
			wait()
			GetGun("Remington 870")
			repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870")
			local Gun = game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870")
			local Gen = {}
			for i,v in pairs(game.Players:GetPlayers()) do
				if not table.find(whitelisted,v.Name) and v ~= plr and v ~= game.Players.LocalPlayer then
					if v.Team == game.Teams.Inmates then
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
			WaitForRespawn()
			wait(.4)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = saved
			Notif("All Inmates Players has been Killed.")
			if plr then
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: All Inmates Players has been Killed.", "All")
			end
		elseif TeamS == "criminals" then
			ChangeTeam(game.Teams.Inmates)
			GetGun("M9")
			repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870")
			local Gun = game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870")
			local Gen = {}
			for i,v in pairs(game.Players:GetPlayers()) do
				if not table.find(whitelisted,v.Name) and v ~= plr and v ~= game.Players.LocalPlayer then
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
			wait(.1)
			Last_Team(a)
			WaitForRespawn()
			wait(0.4)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = saved
			Notif("All Criminal Players has been Killed.")
			if plr then
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: All Criminal Players has been Killed.", "All")
			end
		end
	end
	if TeamS == "all" then
		GetGun("Remington 870")
		repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870")
		local Gun = game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870")
		local Gen = {}
		for i,v in pairs(game.Players:GetPlayers()) do
			if not table.find(whitelisted,v.Name) and v ~= plr and v ~= game.Players.LocalPlayer then
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
	if TeamS == "all" then
		ChangeTeam(game.Teams.Criminals)
	end
	GetGun("Remington 870")
	repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870")
	local Gun = game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870")
	local Gen = {}
	for i,v in pairs(game.Players:GetPlayers()) do
		if not table.find(whitelisted,v.Name) and v ~= plr and v ~= game.Players.LocalPlayer then
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
	WaitForRespawn()
	wait(0.4)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = saved
end

function keycard()
	if game.Players.LocalPlayer.Character:FindFirstChild("Key card") or game.Players.LocalPlayer.Backpack:FindFirstChild("Key card") then
		return Notif("You already have a keycard!")
	end
	if game:GetService("Workspace")["Prison_ITEMS"].single:FindFirstChild("Key card") then
		local a =getpos()
		local Key = game.Workspace.Prison_ITEMS.single["Key card"].ITEMPICKUP
		MoveTo(CFrame.new(game.Workspace.Prison_ITEMS.single["Key card"].ITEMPICKUP.Position))
		wait()
		repeat wait(.1)
			local a =pcall(function()
				local Key = game.Workspace.Prison_ITEMS.single["Key card"].ITEMPICKUP
				game.Workspace.Remote["ItemHandler"]:InvokeServer(Key)
				MoveTo(CFrame.new(workspace.Prison_ITEMS.single["Key card"].ITEMPICKUP.Position+Vector3.new(0,3,0)))
			end)
			if not a then
				break
			end
		until game.Players.LocalPlayer.Backpack:FindFirstChild("Key card")
		wait()
		MoveTo(a)
		return
	end
	local a,b= getpos(),game.Players.LocalPlayer.TeamColor.Name
	local On2 = states.autoguns
	local On3 = states.forcefield
	On2 = On2
	On3 = On3
	states.autoguns = false
	states.forcefield = false
	if a then
		ChangeTeam(game.Teams.Guards)
		WaitForRespawn()
		wait(.6)
		if game.Players.LocalPlayer.Team ~= game.Teams.Guards then
			Notif("Team Guard Is Full.")
			autoguns = On2
			forcefield = On3
		end
		repeat wait(.1)
			pcall(function()
				if not game.Players.LocalPlayer.Team.Name == game.Teams.Guards then
					return
				else
					game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").BreakJointsOnDeath = false
					game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health = 0
					wait(.2)
					ChangeTeam(game.Teams.Guards)
				end
			end)
		until game:GetService("Workspace")["Prison_ITEMS"].single:FindFirstChild("Key card")
	end
	wait(.1)
	Last_Team(b)
	WaitForRespawn()
	wait(.6)
	MoveTo(CFrame.new(game.Workspace.Prison_ITEMS.single["Key card"].ITEMPICKUP.Position))
	repeat task.wait(.1)
		local a =pcall(function()
			local Key = game.Workspace.Prison_ITEMS.single["Key card"].ITEMPICKUP
			game.Workspace.Remote["ItemHandler"]:InvokeServer(Key)
			MoveTo(CFrame.new(game.Workspace.Prison_ITEMS.single["Key card"].ITEMPICKUP.Position+Vector3.new(0,3,0)))
		end)
		if not a then
			break
		end
	until game.Players.LocalPlayer.Backpack:FindFirstChild("Key card")
	wait(.2)
	MoveTo(a)
	states.autoguns = On2
	states.forcefield = On3
	if game.Players.LocalPlayer.Backpack:FindFirstChild("Key card") or game.Players.LocalPlayer.Character:FindFirstChild("Key card") then
		Notif("You got keycard.")
	end
end

function MKILL(target,STOP,P)
	if target == game.Players.LocalPlayer or target == game.Players.LocalPlayer.Name then
		return
	end
	if not STOP then STOP =1 end
	if not target or not target.Character or not target.Character:FindFirstChild("Humanoid") or target.Character:FindFirstChildOfClass("ForceField") or target.Character:FindFirstChild("Humanoid").Health<1 or not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")  then
		return
	end
	unsit()
	local saved = getpos()
	if not P then P = saved else saved = P end
	repeat task.wait()
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
	until not target or not target.Character or not target.Character:FindFirstChild("Humanoid") or target.Character:FindFirstChild("Humanoid").Health > 1 
	wait(.2)
	for i =1,15 do
		task.spawn(function()
			game.ReplicatedStorage["meleeEvent"]:FireServer(target)
		end)
	end
	wait(.1)
	if target and target.Character and target.Character:FindFirstChild("Humanoid") and target.Character:FindFirstChild("Humanoid").Health >1 and STOP ~= 10 then
		MKILL(target,STOP+1,P)
		return
	end
	wait(0.6)
	MoveTo(saved)
end

function kill(player, plr)
	wait(0.1)
	if player then
		if player == game.Players.LocalPlayer or player == game.Players.LocalPlayer.Name then
			return Notif("Can't kill Yourself?")
		end
		if table.find(whitelisted,player.Name) then
			return Notif("This player is Whitelisted.")
		end
		if player.Character:FindFirstChildOfClass("Humanoid") and player.Character:FindFirstChildOfClass("Humanoid").Health > 1 then
			local On2 = states.autoguns
			local On3 = states.forcefield
			On = On
			On2 = On2
			On3 = On3
			states.autoguns = false
			states.forcefield = false
			local a = GetTeam()
			local saved = getpos()
			wait(.1)
			if player.Team == game.Teams.Guards then
				ChangeTeam(game.Teams.Criminals)
			elseif player.Team == game.Teams.Criminals then
				ChangeTeam(game.Teams.Inmates)
			elseif player.Team == game.Teams.Inmates then
				ChangeTeam(game.Teams.Criminals)
			end
			wait(0.3)
			local Gun = ReturnGun()
			if not Gun then
				GetGun("M9")
				repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("M9")
			end
			Gun = ReturnGun()
			if Gun and game.Players.LocalPlayer.Team ~= player.Team and player.Character:WaitForChild("Head") then
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
			end
			wait(1)
			if player.Character:FindFirstChildOfClass("Humanoid") and player.Character:FindFirstChildOfClass("Humanoid").Health <1 then
				Notif(player.DisplayName.." has been killed")
				wait(.2)
				Last_Team(a)
				WaitForRespawn()
				wait(.6)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = saved
				if plr then
					game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: "..player.DisplayName.." has been killed.", "All")
				end
				states.autoguns = On2
				states.forcefield = On3
			else
				Notif("Failed to kill player")
				Last_Team(a)
				WaitForRespawn()
				wait(.6)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = saved
				if plr then
					game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: Failed to kill player.", "All")
				end
				states.autoguns = On2
				states.forcefield = On3
			end
		end
	end
end
if not Gotton_by_H17S3 or #Gotton_by_H17S3 ~= 15 then
	return
end
function loop_kill(player, plr)
	wait(0.1)
	if player then
		if player == game.Players.LocalPlayer or player == game.Players.LocalPlayer.Name then
			return Notif("Can't kill Yourself?")
		end
		if table.find(whitelisted,player.Name) then
			return Notif("This player is Whitelisted.")
		end
		if player and player.Character and player.Character:FindFirstChild("Humanoid") and not player.Character:FindFirstChildOfClass("ForceField") and player.Character.Humanoid.Health > 1 then
			local On2 = states.autoguns
			local On3 = states.forcefield
			On = On
			On2 = On2
			On3 = On3
			states.autoguns = false
			states.forcefield = false
			local saved = getpos()
			wait(.1)
			if player.Team == game.Teams.Guards then
				ChangeTeam(game.Teams.Criminals)
			elseif player.Team == game.Teams.Criminals then
				ChangeTeam(game.Teams.Inmates)
			elseif player.Team == game.Teams.Inmates then
				ChangeTeam(game.Teams.Criminals)
			end
			wait(0.3)
			local Gun = game.Players.LocalPlayer.Backpack:FindFirstChild("M9") and game.Players.LocalPlayer.Character:FindFirstChild("M9")
			if not Gun then
				GetGun("M9")
				repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("M9")
			end
			Gun = ReturnGun()
			if Gun and game.Players.LocalPlayer.Team ~= player.Team and player.Character:WaitForChild("Head") then
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
			end
			wait(1)
			if player.Character:FindFirstChildOfClass("Humanoid") and player.Character:FindFirstChildOfClass("Humanoid").Health <1 then
				Notif(player.DisplayName.." has been killed")
				wait(.1)
				WaitForRespawn()
				wait(.6)
				states.autoguns = On2
				states.forcefield = On3
			else
				Notif("Failed to kill player")
				WaitForRespawn()
				wait(.6)
				states.autoguns = On2
				states.forcefield = On3
			end
		end
	end
end

function tase_all(TeamS,plr)
	if not Gotton_by_H17S3 or #Gotton_by_H17S3 ~= 15 then
		return
	end
	local On2 = states.autoguns
	local On3 = states.autoremovekits
	local On4 = states.forcefield
	On2 = On2
	On3 = On3
	On4 = On4
	states.autoguns = false
	states.autoremovekits = false
	states.forcefield = false
	if TeamS then
		if TeamS == "inmates" then
			local lastteam,Last = game.Players.LocalPlayer.TeamColor.Name,getpos()
			local Table = {}
			for i,v in pairs(game.Players:GetPlayers()) do
				if v and v.Team == game:GetService("Teams").Inmates and v.Team ~= game:GetService("Teams").Guards and v ~= game.Players.LocalPlayer and not table.find(whitelisted,v.Name) and v ~= plr and v.Character.HumanoidRootPart then
					Table[#Table+1]={
						["RayObject"] = Ray.new(Vector3.new(972.877869, 101.489967, 2362.66821), Vector3.new(-53.8579292, -7.45228672, 83.9272766)),
						["Distance"] = 1,
						["Cframe"] = CFrame.new(969.60144, 100.734177, 2369.42334, 0.777441919, -0.0313242674, -0.628174186, 1.86264515e-09, 0.998758912, -0.0498036928, 0.628954709, 0.038719479, 0.776477098),
						["Hit"] = v.Character.HumanoidRootPart
					}
				end
			end
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("Taser") then
				local ohString1 = "Bright blue"
				task.spawn(function()
					game.Players.LocalPlayer.CharacterAdded:Wait():WaitForChild("HumanoidRootPart").CFrame = Last
				end)
				game.Workspace.Remote.TeamEvent:FireServer(ohString1)
			end
			WaitForRespawn()
			wait(.6)
			if game.Players.LocalPlayer.Team ~= game.Teams.Guards then
				Notif("Team Guard Is Full")
				states.autoguns = On2
				states.autoremovekits = On3
				states.forcefield = On4
				return nil
			end
			if plr and game.Players.LocalPlayer.Team ~= game.Teams.Guards then
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: Team Guard Is Full, I can't Tase all.", "All")
			end
			repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("Taser")
			game:GetService("ReplicatedStorage").ShootEvent:FireServer(Table, game.Players.LocalPlayer.Backpack:FindFirstChild("Taser"))
			task.spawn(function() game:GetService("ReplicatedStorage").ReloadEvent:FireServer(game.Players.LocalPlayer.Backpack:FindFirstChild("Taser")) end)
			wait(.3)
			Last_Team(lastteam)
			WaitForRespawn()
			wait(.6)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Last
			Notif("All Inmates Players has been Tased.")
			if plr2 then
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr2.Name.." [H4XAdmin]: All Players has been Tased.", "All")
			end
		elseif TeamS == "criminals" then
			local lastteam,Last = game.Players.LocalPlayer.TeamColor.Name,getpos()
			local Table = {}
			for i,v in pairs(game.Players:GetPlayers()) do
				if v and v.Team == game:GetService("Teams").Criminals and v.Team ~= game:GetService("Teams").Guards and v ~= game.Players.LocalPlayer and not table.find(whitelisted,v.Name) and v ~= plr and v.Character.HumanoidRootPart then
					Table[#Table+1]={
						["RayObject"] = Ray.new(Vector3.new(972.877869, 101.489967, 2362.66821), Vector3.new(-53.8579292, -7.45228672, 83.9272766)),
						["Distance"] = 1,
						["Cframe"] = CFrame.new(969.60144, 100.734177, 2369.42334, 0.777441919, -0.0313242674, -0.628174186, 1.86264515e-09, 0.998758912, -0.0498036928, 0.628954709, 0.038719479, 0.776477098),
						["Hit"] = v.Character.HumanoidRootPart
					}
				end
			end
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("Taser") then
				local ohString1 = "Bright blue"
				task.spawn(function()
					game.Players.LocalPlayer.CharacterAdded:Wait():WaitForChild("HumanoidRootPart").CFrame = Last
				end)
				game.Workspace.Remote.TeamEvent:FireServer(ohString1)
			end
			WaitForRespawn()
			wait(.6)
			if game.Players.LocalPlayer.Team ~= game.Teams.Guards then
				Notif("Team Guard Is Full")
				states.autoguns = On2
				states.autoremovekits = On3
				states.forcefield = On4
				return nil
			end
			if plr and game.Players.LocalPlayer.Team ~= game.Teams.Guards then
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: Team Guard Is Full, I can't Tase all.", "All")
			end
			repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("Taser")
			game:GetService("ReplicatedStorage").ShootEvent:FireServer(Table, game.Players.LocalPlayer.Backpack:FindFirstChild("Taser"))
			task.spawn(function() game:GetService("ReplicatedStorage").ReloadEvent:FireServer(game.Players.LocalPlayer.Backpack:FindFirstChild("Taser")) end)
			wait(.3)
			Last_Team(lastteam)
			WaitForRespawn()
			wait(.6)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Last
			Notif("All Criminals Players has been Tased.")
			if plr2 then
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr2.Name.." [H4XAdmin]: All Criminals Players has been Tased.", "All")
			end
		end
	elseif TeamS == "all" then
		local lastteam,Last = game.Players.LocalPlayer.TeamColor.Name,getpos()
		local Table = {}
		for i,v in pairs(game.Players:GetPlayers()) do
			if v and v.Team ~= game:GetService("Teams").Guards and v ~= game.Players.LocalPlayer and not table.find(whitelisted,v.Name) and v ~= plr and v.Character.HumanoidRootPart then
				Table[#Table+1]={
					["RayObject"] = Ray.new(Vector3.new(972.877869, 101.489967, 2362.66821), Vector3.new(-53.8579292, -7.45228672, 83.9272766)),
					["Distance"] = 1,
					["Cframe"] = CFrame.new(969.60144, 100.734177, 2369.42334, 0.777441919, -0.0313242674, -0.628174186, 1.86264515e-09, 0.998758912, -0.0498036928, 0.628954709, 0.038719479, 0.776477098),
					["Hit"] = v.Character.HumanoidRootPart
				}
			end
		end
		if not game.Players.LocalPlayer.Backpack:FindFirstChild("Taser") then
			local ohString1 = "Bright blue"
			task.spawn(function()
				game.Players.LocalPlayer.CharacterAdded:Wait():WaitForChild("HumanoidRootPart").CFrame = Last
			end)
			game.Workspace.Remote.TeamEvent:FireServer(ohString1)
		end
		WaitForRespawn()
		wait(.6)
		if game.Players.LocalPlayer.Team ~= game.Teams.Guards then
			Notif("Team Guard Is Full")
			states.autoguns = On2
			states.autoremovekits = On3
			states.forcefield = On4
			return nil
		end
		if plr and game.Players.LocalPlayer.Team ~= game.Teams.Guards then
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: Team Guard Is Full, I can't Tase all.", "All")
		end
		repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("Taser")
		game:GetService("ReplicatedStorage").ShootEvent:FireServer(Table, game.Players.LocalPlayer.Backpack:FindFirstChild("Taser"))
		task.spawn(function() game:GetService("ReplicatedStorage").ReloadEvent:FireServer(game.Players.LocalPlayer.Backpack:FindFirstChild("Taser")) end)
		wait(.3)
		Last_Team(lastteam)
		WaitForRespawn()
		wait(.6)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Last
		Notif("All Players has been Tased.")
		if plr2 then
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr2.Name.." [H4XAdmin]: All Players has been Tased.", "All")
		end
	end
	states.autoguns = On2
	states.autoremovekits = On3
	states.forcefield = On4
end

function tase(player,plr)
	wait(0.1)
	local lastteam,Last = game.Players.LocalPlayer.TeamColor.Name,getpos()
	if table.find(whitelisted,player.Name) then
		return Notif("This player is Whitelisted")
	end
	local On2 = states.autoguns
	local On3 = states.autoremovekits
	local On4 = states.forcefield
	On2 = On2
	On3 = On3
	On4 = On4
	states.autoguns = false
	states.autoremovekits = false
	states.forcefield = false
	if not game.Players.LocalPlayer.Backpack:FindFirstChild("Taser") then
		local ohString1 = "Bright blue"
		task.spawn(function()
			game.Players.LocalPlayer.CharacterAdded:Wait():WaitForChild("HumanoidRootPart").CFrame = Last
		end)
		game.Workspace.Remote.TeamEvent:FireServer(ohString1)
	end
	WaitForRespawn()
	wait(.6)
	if game.Players.LocalPlayer.Team ~= game.Teams.Guards then
		Notif("Team Guard Is Full")
		states.autoguns = On2
		states.autoremovekits = On3
		states.forcefield = On4
		return nil
	end
	if plr and game.Players.LocalPlayer.Team ~= game.Teams.Guards then
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: Team Guard Is Full, I can't Tase "..player.DisplayName, "All")
	end
	repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("Taser")
	wait(.3)
	if player.Character.HumanoidRootPart then
		game:GetService("ReplicatedStorage").ShootEvent:FireServer({
			[1] = {
				["RayObject"] = Ray.new(Vector3.new(972.877869, 101.489967, 2362.66821), Vector3.new(-53.8579292, -7.45228672, 83.9272766)),
				["Distance"] = 1,
				["Cframe"] = CFrame.new(969.60144, 100.734177, 2369.42334, 0.777441919, -0.0313242674, -0.628174186, 1.86264515e-09, 0.998758912, -0.0498036928, 0.628954709, 0.038719479, 0.776477098),
				["Hit"] = player.Character.HumanoidRootPart
			}
		}, game.Players.LocalPlayer.Backpack:FindFirstChild("Taser"))
	end
	task.spawn(function() game:GetService("ReplicatedStorage").ReloadEvent:FireServer(game.Players.LocalPlayer.Backpack:FindFirstChild("Taser")) end)
	wait(.4)
	Last_Team(lastteam)
	WaitForRespawn()
	wait(.6)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Last
	Notif(player.DisplayName.." has been Tased.") 
	if plr then
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr2.Name.." [H4XAdmin]: "..player.DisplayName.." has been Tased.", "All")
	end
	states.autoguns = On2
	states.autoremovekits = On3
	states.forcefield = On4
end

function loop_tase(player,plr)
	wait(0.1)
	local lastteam,Last = game.Players.LocalPlayer.TeamColor.Name,getpos()
	if table.find(whitelisted,player.Name) then
		return Notif("This player is Whitelisted")
	end
	local On2 = states.autoguns
	local On3 = states.autoremovekits
	local On4 = states.forcefield
	On2 = On2
	On3 = On3
	On4 = On4
	states.autoguns = false
	states.autoremovekits = false
	states.forcefield = false
	if not game.Players.LocalPlayer.Backpack:FindFirstChild("Taser") then
		local ohString1 = "Bright blue"
		task.spawn(function()
			game.Players.LocalPlayer.CharacterAdded:Wait():WaitForChild("HumanoidRootPart").CFrame = Last
		end)
		game.Workspace.Remote.TeamEvent:FireServer(ohString1)
	end
	WaitForRespawn()
	wait(.6)
	if game.Players.LocalPlayer.Team ~= game.Teams.Guards then
		Notif("Team Guard Is Full")
		states.autoguns = On2
		states.autoremovekits = On3
		states.forcefield = On4
		return nil
	end
	if plr and game.Players.LocalPlayer.Team ~= game.Teams.Guards then
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: Team Guard Is Full, I can't Tase "..player.DisplayName, "All")
	end
	repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("Taser")
	wait(.3)
	if player.Character.HumanoidRootPart then
		game:GetService("ReplicatedStorage").ShootEvent:FireServer({
			[1] = {
				["RayObject"] = Ray.new(Vector3.new(972.877869, 101.489967, 2362.66821), Vector3.new(-53.8579292, -7.45228672, 83.9272766)),
				["Distance"] = 1,
				["Cframe"] = CFrame.new(969.60144, 100.734177, 2369.42334, 0.777441919, -0.0313242674, -0.628174186, 1.86264515e-09, 0.998758912, -0.0498036928, 0.628954709, 0.038719479, 0.776477098),
				["Hit"] = player.Character.HumanoidRootPart
			}
		}, game.Players.LocalPlayer.Backpack:FindFirstChild("Taser"))
	end
	task.spawn(function() game:GetService("ReplicatedStorage").ReloadEvent:FireServer(game.Players.LocalPlayer.Backpack:FindFirstChild("Taser")) end)
	wait(.6)
	Notif(player.DisplayName.." has been Tased.") 
	if plr then
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr2.Name.." [H4XAdmin]: "..player.DisplayName.." has been Tased.", "All")
	end
	states.autoguns = On2
	states.autoremovekits = On3
	states.forcefield = On4
end

function crashserver()
	task.spawn(function()
		while task.wait() do
			coroutine.wrap(function()
				pcall(function()
					local Remington = game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870") and game.Players.LocalPlayer.Character:FindFirstChild("Remington 870")
					if not Remington then
						repeat task.wait()
							GetGun("Remington 870")
						until game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870") or game.Players.LocalPlayer.Character:FindFirstChild("Remington 870")
					end
					local Gun = ReturnGun()

					local args = {
						[1] = {
							["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
							["Distance"] = math.huge, 
							["Cframe"] = CFrame.new(), 
							["Hit"] = workspace[game.Players.LocalPlayer.Name].Head
						}, [2] = {
							["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
							["Distance"] = math.huge,
							["Cframe"] = CFrame.new(), 
							["Hit"] = workspace[game.Players.LocalPlayer.Name].Head
						}, [3] = {
							["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
							["Distance"] = math.huge,
							["Cframe"] = CFrame.new(), 
							["Hit"] = workspace[game.Players.LocalPlayer.Name].Head
						}, [4] = {
							["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
							["Distance"] = math.huge,
							["Cframe"] = CFrame.new(), 
							["Hit"] = workspace[game.Players.LocalPlayer.Name].Head
						}, [5] = {
							["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
							["Distance"] = math.huge,
							["Cframe"] = CFrame.new(), 
							["Hit"] = workspace[game.Players.LocalPlayer.Name].Head
						}, [6] = {
							["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
							["Distance"] = math.huge,
							["Cframe"] = CFrame.new(), 
							["Hit"] = workspace[game.Players.LocalPlayer.Name].Head
						}, [7] = {
							["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
							["Distance"] = math.huge,
							["Cframe"] = CFrame.new(), 
							["Hit"] = workspace[game.Players.LocalPlayer.Name].Head
						}, [8] = {
							["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
							["Distance"] = math.huge,
							["Cframe"] = CFrame.new(), 
							["Hit"] = workspace[game.Players.LocalPlayer.Name].Head
						}, [9] = {
							["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
							["Distance"] = math.huge,
							["Cframe"] = CFrame.new(), 
							["Hit"] = workspace[game.Players.LocalPlayer.Name].Head
						}, [10] = {
							["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
							["Distance"] = math.huge,
							["Cframe"] = CFrame.new(), 
							["Hit"] = workspace[game.Players.LocalPlayer.Name].Head
						}
					}
					Notif("Crashing Server...") 
					local args2 = {}
					for i = 1, 10, 1 do
						args2[i] = args
					end
					for i = 1, 10, 1 do
						game:GetService("ReplicatedStorage").ShootEvent:FireServer(args2, Gun)
					end
				end)
			end)()
		end
	end)
end

function lowestserver()
	local Http = game:GetService("HttpService")
	local TPS = game:GetService("TeleportService")
	local Api = "https://games.roblox.com/v1/games/"

	local _place = game.PlaceId
	local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
	function ListServers(cursor)
		local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
		return Http:JSONDecode(Raw)
	end

	local Server, Next; repeat
		local Servers = ListServers(Next)
		Server = Servers.data[1]
		Next = Servers.nextPageCursor
	until Server

	TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
end

function serverhop()
	local Player = game.Players.LocalPlayer    
	local Http = game:GetService("HttpService")
	local TPS = game:GetService("TeleportService")
	local Api = "https://games.roblox.com/v1/games/"

	local _place,_id = game.PlaceId, game.JobId
	local _servers = Api.._place.."/servers/Public?sortOrder=Desc&limit=100"
	function ListServers(cursor)
		local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
		return Http:JSONDecode(Raw)
	end

	local Next; repeat
		local Servers = ListServers(Next)
		for i,v in next, Servers.data do
			if v.playing < v.maxPlayers and v.id ~= _id then
				local s,r = pcall(TPS.TeleportToPlaceInstance,TPS,_place,v.id,Player)
				if s then break end
			end
		end

		Next = Servers.nextPageCursor
	until not Next
end

function mobile()
	if keypress then
		local ScreenGui = Instance.new("ScreenGui")
		local F = Instance.new("TextButton")
		local UICorner = Instance.new("UICorner")
		local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
		local C = Instance.new("TextButton")
		local UICorner_2 = Instance.new("UICorner")
		local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
		local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
		local Sprint = Instance.new("TextButton")
		local UICorner_3 = Instance.new("UICorner")
		local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
		local UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint")
		local Console = Instance.new("TextButton")
		local UICorner_4 = Instance.new("UICorner")
		local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
		local UITextSizeConstraint_4 = Instance.new("UITextSizeConstraint")
		local HideShow = Instance.new("TextButton")
		local UICorner_5 = Instance.new("UICorner")
		local UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")
		local UITextSizeConstraint_5 = Instance.new("UITextSizeConstraint")

		--Properties:

		ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
		ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		ScreenGui.ResetOnSpawn = false

		F.Name = "F"
		F.Parent = ScreenGui
		F.Active = false
		F.BackgroundColor3 = Color3.fromRGB(138, 138, 138)
		F.BackgroundTransparency = 0.500
		F.Position = UDim2.new(0.84203732, 0, 0.48365292, 0)
		F.Selectable = false
		F.Size = UDim2.new(0.0691562966, 0, 0.133689836, 0)
		F.Font = Enum.Font.SourceSans
		F.Text = "F"
		F.TextColor3 = Color3.fromRGB(255, 255, 255)
		F.TextScaled = true
		F.TextSize = 14.000
		F.TextWrapped = true

		UICorner.CornerRadius = UDim.new(0.150000006, 0)
		UICorner.Parent = F

		UIAspectRatioConstraint.Parent = F
		UIAspectRatioConstraint.AspectRatio = 1.000

		UITextSizeConstraint.Parent = F
		UITextSizeConstraint.MaxTextSize = 49

		C.Name = "C"
		C.Parent = ScreenGui
		C.Active = false
		C.BackgroundColor3 = Color3.fromRGB(138, 138, 138)
		C.BackgroundTransparency = 0.500
		C.Position = UDim2.new(0.75351727, 0, 0.638733149, 0)
		C.Selectable = false
		C.Size = UDim2.new(0.0691562966, 0, 0.133689836, 0)
		C.Font = Enum.Font.SourceSans
		C.Text = "C"
		C.TextColor3 = Color3.fromRGB(255, 255, 255)
		C.TextScaled = true
		C.TextSize = 14.000
		C.TextWrapped = true

		UICorner_2.CornerRadius = UDim.new(0.150000006, 0)
		UICorner_2.Parent = C

		UIAspectRatioConstraint_2.Parent = C
		UIAspectRatioConstraint_2.AspectRatio = 1.000

		UITextSizeConstraint_2.Parent = C
		UITextSizeConstraint_2.MaxTextSize = 49

		Sprint.Name = "Sprint"
		Sprint.Parent = ScreenGui
		Sprint.Active = false
		Sprint.BackgroundColor3 = Color3.fromRGB(138, 138, 138)
		Sprint.BackgroundTransparency = 0.500
		Sprint.Position = UDim2.new(0.172604382, 0, 0.542476475, 0)
		Sprint.Selectable = false
		Sprint.Size = UDim2.new(0.0691562966, 0, 0.133689836, 0)
		Sprint.Font = Enum.Font.SourceSans
		Sprint.Text = "Sprint"
		Sprint.TextColor3 = Color3.fromRGB(255, 255, 255)
		Sprint.TextScaled = true
		Sprint.TextSize = 14.000
		Sprint.TextWrapped = true

		UICorner_3.CornerRadius = UDim.new(0.150000006, 0)
		UICorner_3.Parent = Sprint

		UIAspectRatioConstraint_3.Parent = Sprint
		UIAspectRatioConstraint_3.AspectRatio = 1.000

		UITextSizeConstraint_3.Parent = Sprint
		UITextSizeConstraint_3.MaxTextSize = 22

		Console.Name = "Console"
		Console.Parent = ScreenGui
		Console.Active = false
		Console.BackgroundColor3 = Color3.fromRGB(138, 138, 138)
		Console.BackgroundTransparency = 0.500
		Console.Position = UDim2.new(0.869000018, 0, 0.0820000023, 0)
		Console.Selectable = false
		Console.Size = UDim2.new(0.0414937772, 0, 0.0802139044, 0)
		Console.Font = Enum.Font.SourceSans
		Console.Text = "CONSOLE"
		Console.TextColor3 = Color3.fromRGB(255, 255, 255)
		Console.TextScaled = true
		Console.TextSize = 14.000
		Console.TextWrapped = true

		UICorner_4.CornerRadius = UDim.new(0.150000006, 0)
		UICorner_4.Parent = Console

		UIAspectRatioConstraint_4.Parent = Console

		UITextSizeConstraint_4.Parent = Console
		UITextSizeConstraint_4.MaxTextSize = 8

		HideShow.Name = "HideShow"
		HideShow.Parent = ScreenGui
		HideShow.Active = false
		HideShow.BackgroundColor3 = Color3.fromRGB(138, 138, 138)
		HideShow.BackgroundTransparency = 0.500
		HideShow.Position = UDim2.new(0.916999996, 0, 0.0820000023, 0)
		HideShow.Selectable = false
		HideShow.Size = UDim2.new(0.0414937772, 0, 0.0802139044, 0)
		HideShow.ZIndex = 11
		HideShow.Font = Enum.Font.SourceSans
		HideShow.Text = "HIDE BUTTON"
		HideShow.TextColor3 = Color3.fromRGB(255, 255, 255)
		HideShow.TextScaled = true
		HideShow.TextSize = 14.000
		HideShow.TextWrapped = true

		UICorner_5.CornerRadius = UDim.new(0.150000006, 0)
		UICorner_5.Parent = HideShow

		UIAspectRatioConstraint_5.Parent = HideShow

		UITextSizeConstraint_5.Parent = HideShow
		UITextSizeConstraint_5.MaxTextSize = 19

		-- Scripts:

		local function IKJFSC_fake_script() -- F.Script 
			local script = Instance.new('Script', F)

			script.Parent.MouseButton1Click:Connect(function()
				pcall(function() if keypress then
						keypress(Enum.KeyCode[string.upper("F")])
					end
				end)
			end)
		end
		coroutine.wrap(IKJFSC_fake_script)()
		local function TTZYCWP_fake_script() -- C.Script 
			local script = Instance.new('Script', C)

			script.Parent.MouseButton1Click:Connect(function()
				pcall(function() if keypress then
						keypress(Enum.KeyCode[string.upper("C")])
					end
				end)
			end)
		end
		coroutine.wrap(TTZYCWP_fake_script)()
		local function UZHMT_fake_script() -- Sprint.Script 
			local script = Instance.new('Script', Sprint)

			script.Parent.MouseButton1Click:Connect(function()
				if game.Players.LocalPlayer.Character.Humanoid.WalkSpeed == 16 then
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 24
				elseif game.Players.LocalPlayer.Character.Humanoid.WalkSpeed == 24 then
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
				end
			end)
		end
		coroutine.wrap(UZHMT_fake_script)()
		local function HXGRRA_fake_script() -- Console.Script 
			local script = Instance.new('Script', Console)

			script.Parent.MouseButton1Click:Connect(function()
				pcall(function() if keypress then
						keypress(Enum.KeyCode[string.upper("F9")])
					end
				end)
			end)
		end
		coroutine.wrap(HXGRRA_fake_script)()
		local function ILHHCCK_fake_script() -- HideShow.Script 
			local script = Instance.new('Script', HideShow)

			script.Parent.MouseButton1Click:Connect(function()
				if script.Parent.Parent.HideShow.Text == "HIDE BUTTON" then
					script.Parent.Parent.Sprint.Visible = false
					script.Parent.Parent.F.Visible = false
					script.Parent.Parent.C.Visible = false
					script.Parent.Parent.Console.Visible = false
					script.Parent.Parent.HideShow.Text = "SHOW BUTTON"
				elseif script.Parent.Parent.HideShow.Text == "SHOW BUTTON" then
					script.Parent.Parent.Sprint.Visible = true
					script.Parent.Parent.F.Visible = true
					script.Parent.Parent.C.Visible = true
					script.Parent.Parent.Console.Visible = true
					script.Parent.Parent.HideShow.Text = "HIDE BUTTON"
				end
			end)
		end
		coroutine.wrap(ILHHCCK_fake_script)()
	else
		Notif("Exploit not compatible with this feature.")
	end
end

function mobilefly(speed, vfly)
	local controlModule = require(game.Players.LocalPlayer.PlayerScripts:WaitForChild('PlayerModule'):WaitForChild("ControlModule"))
	local bv = Instance.new("BodyVelocity")
	bv.Name = "VelocityHandler"
	bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
	bv.MaxForce = Vector3.new(0,0,0)
	bv.Velocity = Vector3.new(0,0,0)

	local bg = Instance.new("BodyGyro")
	bg.Name = "GyroHandler"
	bg.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
	bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
	bg.P = 1000
	bg.D = 50

	connection1 = game.Players.LocalPlayer.CharacterAdded:Connect(function(NewChar)
		local bv = Instance.new("BodyVelocity")
		bv.Name = "VelocityHandler"
		bv.Parent = NewChar:WaitForChild("Humanoid").RootPart
		bv.MaxForce = Vector3.new(0,0,0)
		bv.Velocity = Vector3.new(0,0,0)

		local bg = Instance.new("BodyGyro")
		bg.Name = "GyroHandler"
		bg.Parent = NewChar:WaitForChild("Humanoid").RootPart
		bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
		bg.P = 1000
		bg.D = 50
	end)
	table.insert(connections, connection1)

	local camera = game.Workspace.CurrentCamera

	connection2 = game:GetService"RunService".RenderStepped:Connect(function()
		if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.RootPart and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityHandler") and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("GyroHandler") then

			if vfly and not connection3 then
				connection3 = game.Players.LocalPlayer.Character.HumanoidRootPart.Touched:Connect(function(hit)
					if hit:IsA("Seat") then
						hit:Sit(game:GetService("Players").LocalPlayer.Character.Humanoid)
					end
				end)
				table.insert(connections, connection3)
			end

			game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.MaxForce = Vector3.new(9e9,9e9,9e9)
			game.Players.LocalPlayer.Character.HumanoidRootPart.GyroHandler.MaxTorque = Vector3.new(9e9,9e9,9e9)
			if not vfly and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
				game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
			end

			game.Players.LocalPlayer.Character.HumanoidRootPart.GyroHandler.CFrame = camera.CoordinateFrame
			local direction = controlModule:GetMoveVector()
			game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = Vector3.new()
			if direction.X > 0 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity + camera.CFrame.RightVector*(direction.X*speed)
			end
			if direction.X < 0 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity + camera.CFrame.RightVector*(direction.X*speed)
			end
			if direction.Z > 0 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity - camera.CFrame.LookVector*(direction.Z*speed)
			end
			if direction.Z < 0 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity - camera.CFrame.LookVector*(direction.Z*speed)
			end
		end
	end)
	table.insert(connections, connection2)
end

function unmobilefly()
	game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler:Destroy()
	game.Players.LocalPlayer.Character.HumanoidRootPart.GyroHandler:Destroy()
	game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
	for index, connection in pairs(connections) do 
		if typeof(connection) == "RBXScriptConnection" then 
			connection:disconnect()
		elseif typeof(connection) == "string" then 
			pcall(function()
				game:service("RunService"):UnbindFromRenderStep(connection)
			end)
		end
	end
end


FLYING = false
QEfly = true
iyflyspeed = 1
vehicleflyspeed = 1
function sFLY(vfly)
	repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.HumanoidRootPart and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')
	repeat wait() until game.Players.LocalPlayer:GetMouse()
	if flyKeyDown or flyKeyUp or flySit then flyKeyDown:Disconnect() flyKeyUp:Disconnect() flySit:Disconnect() end

	local T = game.Players.LocalPlayer.Character.HumanoidRootPart
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
				if vfly then
					flySit = game.Players.LocalPlayer.Character.HumanoidRootPart.Touched:Connect(function(hit)
						if hit:IsA("Seat") then
							hit:Sit(game:GetService("Players").LocalPlayer.Character.Humanoid)
						end
					end)
				end
				if not vfly and game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
					game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
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
			if game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
				game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
			end
		end)
	end
	flyKeyDown = game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 's' then
			CONTROL.B = - (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 'a' then
			CONTROL.L = - (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 'd' then 
			CONTROL.R = (vfly and vehicleflyspeed or iyflyspeed)
		elseif QEfly and KEY:lower() == 'e' then
			CONTROL.Q = (vfly and vehicleflyspeed or iyflyspeed)*2
		elseif QEfly and KEY:lower() == 'q' then
			CONTROL.E = -(vfly and vehicleflyspeed or iyflyspeed)*2
		end
		pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
	end)
	flyKeyUp = game.Players.LocalPlayer:GetMouse().KeyUp:Connect(function(KEY)
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
	if flyKeyDown or flyKeyUp or flySit then flyKeyDown:Disconnect() flyKeyUp:Disconnect() flySit:Disconnect() end
	if game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
		game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
	end
	pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
end

function GetPlayerFromString(nameString, playerString)
	if not nameString then return end
	local yes = {}
	if nameString:lower() == "me" then
		return playerString
	elseif nameString:lower() == "." or nameString:lower() == "r" or nameString:lower() == "random" then
		for i,plrs in ipairs(game:GetService("Players"):GetPlayers()) do
			if plrs.Name or plrs.DisplayName then
				table.insert(yes, plrs)
			end
		end
		return yes[math.random(1, #yes)]
	else
		for i,plrs in ipairs(game:GetService("Players"):GetPlayers()) do
			if string.lower(plrs.Name):match(string.lower(nameString)) or string.lower(plrs.DisplayName):match(string.lower(nameString)) then
				table.insert(yes, plrs)
			end
		end
	end
	if #yes > 0 then
		return yes[1]
	elseif #yes < 1 then
		return nil
	end
end

function GetBoolFromString(String)
	if String and String:lower() == "true" or String:lower() == "yes" or String:lower() == "y" or String:lower() == "on" then
		return true
	elseif String and String:lower() == "false" or String:lower() == "no" or String:lower() == "n" or String:lower() == "off" then
		return false
	else
		return nil 
	end
end 

function GetNumberFromString(NumberString)
	if tonumber(NumberString) ~= nil or typeof(NumberString):lower() == "inf" or typeof(NumberString):lower() == "infinite" then
		return true
	end
end

function command(cmd, plr)
	if plr and supports[plr.Name] then 
		return arg1:lower() == supports[plr.Name].prefix..string.lower(cmd)
	end
	return arg1:lower() == prefix..cmd
end

function usecmd(msg)
	if not Gotton_by_H17S3 or #Gotton_by_H17S3 ~= 15 then
		return
	end
	arg = string.lower(msg):split(" ")
	arg1 = arg[1]
	arg2 = arg[2]
	arg3 = arg[3]
	for i = 4,#arg do
		arg3 = arg3.." "..arg[i]
	end
	usingcmd = true
	if command("cmd") or command("cmds") or command("Cmd") or command("CMD") then
		game.Players.LocalPlayer:WaitForChild("PlayerGui").H4XAdmin.ScreenShowcmds.Visible = true
		game.Players.LocalPlayer:WaitForChild("PlayerGui").H4XAdmin.ScreenShowcmds:TweenPosition(UDim2.new(0, 480, 0, 80), "Out", "Bounce", 1, true)
	end

	if command("k") or command("kl") or command("kill") then
		if arg2:lower() == "all" then
			Kill_All()
		elseif arg2:lower() == "i" or arg2:lower() == "inmate" or arg2:lower() == "inmates" then
			for i,v in pairs(game.Players:GetPlayers()) do
				if not table.find(whitelisted,v.Name) and v ~= game.Players.LocalPlayer then
					if v.Team == game.Teams.Inmates then
						MKILL(v)
					end
				end
			end
		elseif arg2:lower() == "g" or arg2:lower() == "guard" or arg2:lower() == "guards" then
			for i,v in pairs(game.Players:GetPlayers()) do
				if not table.find(whitelisted,v.Name) and v ~= game.Players.LocalPlayer then
					if v.Team == game.Teams.Guards then
						MKILL(v)
					end
				end
			end
		elseif arg2:lower() == "c" or arg2:lower() == "criminal" or arg2:lower() == "criminals" then
			for i,v in pairs(game.Players:GetPlayers()) do
				if not table.find(whitelisted,v.Name) and v ~= game.Players.LocalPlayer then
					if v.Team == game.Teams.Criminals then
						MKILL(v)
					end
				end
			end
		else
			local player = GetPlayerFromString(arg2, game:GetService("Players").LocalPlayer)
			if player ~= nil then
				MKILL(player)
			end
		end
	end

	if command("k2") or command("kl2") or command("kill2") then
		if arg2:lower() == "all" then
			Kill_All()
		elseif arg2:lower() == "i" or arg2:lower() == "inmate" or arg2:lower() == "inmates" then
			Kill_All("inmates")
		elseif arg2:lower() == "g" or arg2:lower() == "guard" or arg2:lower() == "guards" then
			Kill_All("guards")
		elseif arg2:lower() == "c" or arg2:lower() == "criminal" or arg2:lower() == "criminals" then
			Kill_All("criminals")
		else
			local player = GetPlayerFromString(arg2, game:GetService("Players").LocalPlayer)
			if player ~= nil then
				kill(player)
			end
		end
	end

	if command("t") or command("ts") or command("tase") then
		if arg2:lower() == "all" then
			tase_all()
		elseif arg2:lower() == "i" or arg2:lower() == "inmate" or arg2:lower() == "inmates" then
			tase_all("inmates")
		elseif arg2:lower() == "c" or arg2:lower() == "criminal" or arg2:lower() == "criminals" then
			tase_all("criminals")
		else
			wait(0.3)
			local player = GetPlayerFromString(arg2, game:GetService("Players").LocalPlayer)
			if player ~= nil then
				tase(player)
			end
		end
	end

	if command("to") or command("goto") then
		local player = GetPlayerFromString(arg2, game:GetService("Players").LocalPlayer)
		if player then 
			MoveTo(player.Character["Head"].CFrame)
		end
	end

	if command("a") or command("at") or command("arrest") then
		if arg2 then
			if arg2:lower() == "all" then
				local l = getpos()
				for i,v in pairs(game:GetService("Players"):GetChildren()) do
					if v and v.Team ~= game.Teams.Guards and v.Team ~= game.Teams.Neutral and v ~= game.Players.LocalPlayer and BadArea(v) or v.Team == game.Teams.Criminals then
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
			elseif arg2:lower() == "c" or arg2:lower() == "criminal" or arg2:lower() == "criminals" then
				local l = getpos()
				for i,v in pairs(game:GetService("Players"):GetChildren()) do
					if v and v.Team ~= game.Teams.Guards and v.Team ~= game.Teams.Neutral and v ~= game.Players.LocalPlayer and v.Team == game.Teams.Criminals then
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
				local r = GetPlayerFromString(arg2, game:GetService("Players").LocalPlayer)
				if r  then
					local v = r
					local p = getpos()
					if v and v.Team ~= game.Teams.Guards and v.Team ~= game.Teams.Neutral and v ~= game.Players.LocalPlayer and BadArea(v) or v.Team == game.Teams.Criminals then
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
	end

	if command("w") or command("wt") or command("whitelist") then
		wait(0.3)
		local player = GetPlayerFromString(arg2, game:GetService("Players").LocalPlayer)
		if player ~= nil and not table.find(whitelisted,player.Name) then
			whitelisted[#whitelisted+1] = player.Name
			chat("/w "..player.Name.." [H4XAdmin]: You now is in Whitelist of "..game.Players.LocalPlayer.Name.." You are Protected of tase all, tase [player], kill2 all, kill2 [player] and kill aura, (not Protected of kill [player]) from  "..game.Players.LocalPlayer.Name)
		end
	end

	if command("rw") or command("rwt") or command("removewhitelist") then
		wait(0.3)
		local player = GetPlayerFromString(arg2, game:GetService("Players").LocalPlayer)
		if player ~= nil and table.find(whitelisted,player.Name) then
			table.remove(whitelisted,table.find(whitelisted,player.Name))
			chat("/w "..player.Name.." [H4XAdmin]: You has removed in Whitelist of "..game.Players.LocalPlayer.Name)
		end
	end

	if command("cw") or command("cwt") or command("clearwhitelist") then
		whitelisted = {}
		Notif("Cleaned Whitelist")
	end

	if command("ky") or command("key") then
		keycard()
	end

	if command("rj") or command("rejoin") then
		game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
	end

	if command("sh") or command("shop") or command("serverhop") then
		serverhop()
	end

	if command("ls") or command("lower") or command("lowerserver") then
		lowestserver()
	end

	if command("r") or command("re") or command("refresh") then
		refresh()
	end

	if command("gs") or command("guns") then
		if arg2 then
			states.autoguns = GetBoolFromString(arg2)
			refresh()
			Notif("Wait some seconds...")
		else
			All_Guns()
			Notif("Wait some seconds...")
		end
	end

	if command("nd") or command("nodoors") then
		game.Workspace.Doors.Parent = game.Lighting
		game.Workspace.Prison_Cellblock.doors.Parent = game.Lighting
	end

	if command("d") or command("doors") then
		game.Lighting.Doors.Parent = game.workspace
		game.Lighting.doors.Parent = workspace.Prison_Cellblock
	end

	if command("nw") or command("nowalls") then
		L = game.Lighting
		PH = workspace.Prison_Halls
		PGO = workspace.Prison_Guard_Outpost
		PA = workspace.Prison_Administration
		PCB = workspace.Prison_Cellblock
		CFT = workspace.Prison_Cafeteria
		GA = workspace.Garages
		PGB = workspace.GuardBooth
		PH.walls.Parent = game.Lighting
		PH.lights.Parent = game.Lighting
		PH.roof.Parent = game.Lighting
		PH.glass.Parent = game.Lighting
		PGO.doorwindow.Parent = game.Lighting
		PGO.wall.Parent = game.Lighting
		PGO.lights.Parent = game.Lighting
		PGO.wallsegment.Parent = game.Lighting
		PGO.wallsegment.Parent = game.Lighting
		PGO.wallsegment.Parent = game.Lighting
		PGO.wallsegment.Parent = game.Lighting
		PGO.wallsegment.Parent = game.Lighting
		PGO.wallsegment.Parent = game.Lighting
		PGO.wallsegment.Parent = game.Lighting
		PGO.part.Parent = game.Lighting
		PGO.Part.Parent = game.Lighting
		PA.walls.Parent = game.Lighting
		PA.Part.Parent = game.Lighting
		PA.Part.Parent = game.Lighting
		PA.Part.Parent = game.Lighting
		PA.trim.Parent = game.Lighting
		PA.trim.Parent = game.Lighting
		PA.trimboi.Parent = game.Lighting
		PA.front.Parent = game.Lighting
		PCB.b_front.Parent = game.Lighting
		PCB.b_wall.Parent = game.Lighting
		PCB.c_wall.Parent = game.Lighting
		PCB.a_walls.Parent = game.Lighting
		PCB.a_front.Parent = game.Lighting
		PCB.c_ceiling.Parent = game.Lighting
		PCB.a_ceiling.Parent = game.Lighting
		PCB.b_ceiling.Parent = game.Lighting
		PCB.a_outerwall.Parent = game.Lighting
		PCB.b_outerwall.Parent = game.Lighting
		PCB.a_lights.Parent = game.Lighting
		PCB.b_lights.Parent = game.Lighting
		PCB.c_lights.Parent = game.Lighting
		PCB.Wedge.Parent = game.Lighting
		PCB.Wedge.Parent = game.Lighting
		CFT.building.Parent = game.Lighting
		CFT.lights.Parent = game.Lighting
		CFT.glassdividers.Parent = game.Lighting
		CFT.Wedge.Parent = L
		CFT.Wedge.Parent = L
		CFT.Wedge.Parent = L
		PCB.c_hallwall.Parent = L
		PCB.c_hallwall.Parent = L
		PCB.c_hallwall.Parent = L
		PCB.c_hallwall.Parent = L
		PCB.c_corner.Parent = L
		PCB.c_corner.Parent = L
		PCB.c_corner.Parent = L
		PCB.c_corner.Parent = L
		PCB.c_glass.Parent = L
		CFT.Floor.Parent = L
		CFT.Floor.Parent = L
		CFT.Floor.Parent = L
		CFT.Floor.Parent = L
		CFT.Model.Parent = L
		CFT.Model.Parent = L
		CFT.glass.Parent = L
		PGO.window.Parent = L
		PA.light_floor1.Parent = L
		PA.light_floor2.Parent = L
		PA.Part.Parent = L
		GA.Parent = L
		PGB.Prison_bollards.Parent = L
		PGB.Wedge.Parent = L
		PGB.Wedge.Parent = L
		PGB.Stonewall.Parent = L
		PGB.Stonewall.Parent = L
		PGB.Stonewall.Parent = L
		PGB.Stonewall.Parent = L
		PGB.Stonewall.Parent = L
		PGB.Stonewall.Parent = L
		PGB.Stonewall.Parent = L
		PGB.Stonewall.Parent = L
		PGB.Stonewall.Parent = L
		PGB.Stonewall.Parent = L
		PGB.Stonewall.Parent = L
		PGB.Stonewall.Parent = L
		PGB.Stonewall.Parent = L
		PGB.Stonewall.Parent = L
		PGB.Stonewall.Parent = L
		PGB.Stonewall.Parent = L
		PGB.Stonewall.Parent = L
		PGB.Stonewall.Parent = L
		PGB.Stonewall.Parent = L
		PGB.Stonewall.Parent = L
		PGB.Stonewall.Parent = L
		PGB.Stonewall.Parent = L
		PGB.Stonewall.Parent = L
		PGB.Part.Parent = L
		PGB.Part.Parent = L
		PGB.Model.Parent = L
		PGB.Model.Parent = L
	end

	if command("w") or command("walls") then
		PH = workspace.Prison_Halls
		PGO = workspace.Prison_Guard_Outpost
		PA = workspace.Prison_Administration
		PCB = workspace.Prison_Cellblock
		CFT = workspace.Prison_Cafeteria
		GA = L.Garages
		PGB = workspace.GuardBooth
		L.walls.Parent = PH
		L.lights.Parent = PH
		L.roof.Parent = PH
		L.glass.Parent = PH
		L.doorwindow.Parent = PGO
		L.wall.Parent = PGO
		L.lights.Parent = PGO
		L.wallsegment.Parent = PGO
		L.wallsegment.Parent = PGO
		L.wallsegment.Parent = PGO
		L.wallsegment.Parent = PGO
		L.wallsegment.Parent = PGO
		L.wallsegment.Parent = PGO
		L.wallsegment.Parent = PGO
		L.part.Parent = PGO
		L.Part.Parent = PGO
		L.walls.Parent = PA
		L.Part.Parent = PA
		L.Part.Parent = PA
		L.Part.Parent = PA
		L.trim.Parent = PA
		L.trim.Parent = PA
		L.trimboi.Parent = PA
		L.front.Parent = PA
		L.b_front.Parent = PCB
		L.b_wall.Parent = PCB
		L.c_wall.Parent = PCB
		L.a_walls.Parent = PCB
		L.a_front.Parent = PCB
		L.c_ceiling.Parent = PCB
		L.a_ceiling.Parent = PCB
		L.b_ceiling.Parent = PCB
		L.a_outerwall.Parent = PCB
		L.b_outerwall.Parent = PCB
		L.a_lights.Parent = PCB
		L.b_lights.Parent = PCB
		L.c_lights.Parent = PCB
		L.Wedge.Parent = PCB
		L.Wedge.Parent = PCB
		L.building.Parent = CFT
		L.lights.Parent = CFT
		L.glassdividers.Parent = CFT
		L.Wedge.Parent = CFT
		L.Wedge.Parent = CFT
		L.Wedge.Parent = CFT
		L.c_hallwall.Parent = PCB
		L.c_hallwall.Parent = PCB
		L.c_hallwall.Parent = PCB
		L.c_hallwall.Parent = PCB
		L.c_corner.Parent = PCB
		L.c_corner.Parent = PCB
		L.c_corner.Parent = PCB
		L.c_corner.Parent = PCB
		L.c_glass.Parent = PCB
		L.Floor.Parent = CFT
		L.Floor.Parent = CFT
		L.Floor.Parent = CFT
		L.Floor.Parent = CFT
		L.Model.Parent = CFT
		L.Model.Parent = CFT
		L.glass.Parent = CFT
		L.window.Parent = PGO
		L.light_floor1.Parent = PA
		L.light_floor2.Parent = PA
		L.Part.Parent = PA
		GA.Parent = workspace
		L.Prison_bollards.Parent = PGB
		L.Wedge.Parent = PGB
		L.Wedge.Parent = PGB
		L.Stonewall.Parent = PGB
		L.Stonewall.Parent = PGB
		L.Stonewall.Parent = PGB
		L.Stonewall.Parent = PGB
		L.Stonewall.Parent = PGB
		L.Stonewall.Parent = PGB
		L.Stonewall.Parent = PGB
		L.Stonewall.Parent = PGB
		L.Stonewall.Parent = PGB
		L.Stonewall.Parent = PGB
		L.Stonewall.Parent = PGB
		L.Stonewall.Parent = PGB
		L.Stonewall.Parent = PGB
		L.Stonewall.Parent = PGB
		L.Stonewall.Parent = PGB
		L.Stonewall.Parent = PGB
		L.Stonewall.Parent = PGB
		L.Stonewall.Parent = PGB
		L.Stonewall.Parent = PGB
		L.Stonewall.Parent = PGB
		L.Stonewall.Parent = PGB
		L.Stonewall.Parent = PGB
		L.Stonewall.Parent = PGB
		L.Part.Parent = PGB
		L.Part.Parent = PGB
		L.Model.Parent = PGB
		L.Model.Parent = PGB
		L.PGBGlass.Parent = PGB
	end

	if command("nf") or command("nofences") then
		game.Workspace.Prison_Fences.Parent = game.Lighting
		game.Workspace.Prison_Fences.Parent = game.Lighting
	end

	if command("f") or command("fences") then
		game.Lighting.Prison_Fences.Parent = game.workspace
		game.Lighting.Prison_Fences.Parent = workspace.Prison_Fences
	end

	if command("nx") or command("nexus") then
		unsit()
		wait(.1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(879,99,2377)
	end

	if command("bk") or command("back") then
		unsit()
		wait(.1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(980, 101, 2327)
	end

	if command("cf") or command("cafe") then
		unsit()
		wait(.1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(879,99,2247)
	end

	if command("yd") or command("yard") then
		unsit()
		wait(.1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(779,99,2477)	
	end

	if command("ay") or command("arm") or command("armory") then
		unsit()
		wait(.1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(798,99,2260)
	end

	if command("tw") or command("tower") then
		unsit()
		wait(.1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(795.592, 122.32, 2592.388)
	end

	if command("rf") or command("roof") then
		unsit()
		wait(.1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(933.268, 134.784, 2463.6)
	end

	if command("cs") or command("cell") or command("cells") then
		unsit()
		wait(.1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(910,99,2477)
	end

	if command("bc") or command("basecrim") then
		unsit()
		wait(.1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-944,95,2068)
	end

	if command("sppt") or command("support") then
		wait(0.3)
		local plr = GetPlayerFromString(arg2, game:GetService("Players").LocalPlayer)
		if plr ~= nil then
			if plr and not supports[plr.Name] then
				supports[plr.Name] = {plr = plr, prefix = prefix}
				local PF = supports[plr.Name].prefix
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: You now is Support of "..game.Players.LocalPlayer.DisplayName.." say "..PF.."cmds for see Commands.", "All")
			end
		end
	end

	if command("unsppt") or command("unsupport") then
		wait(0.3)
		local plr = GetPlayerFromString(arg2, game:GetService("Players").LocalPlayer)
		if plr ~= nil then
			if plr and supports[plr.Name] then
				supports[plr.Name] = nil
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: You now not is but Support of "..game.Players.LocalPlayer.DisplayName.." your cmds has removed.", "All")
			end
		end
	end

	if command("csppt") or command("clearsupport") then
		supports = {}
		Notif("Cleaned Supports")
	end

	if command("sppts") or command("showsupports") then
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			if v ~= game:GetService("Players").LocalPlayer then
				if supports[v.Name] then 
					print("All supports, Names: "..v.Name.." DisplayName:"..v.DisplayName)
					game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)
				end
			end
		end
	end

	if command("lk") or command("loopkill") then
		local player = GetPlayerFromString(arg2, game:GetService("Players").LocalPlayer)
		if player and not loopkills[player.UserId] then 
			Notif("Adding: "..player.Name.." to LoopKill table!")
			loopkills[player.UserId] = { player = player } 
		end 
	end

	if command("unlk") or command("unloopkill") then
		local player = GetPlayerFromString(arg2, game:GetService("Players").LocalPlayer)
		if player and loopkills[player.UserId] then 
			Notif("Removing: "..player.Name.." to LoopKill table!")
			loopkills[player.UserId] = nil 
		end 
	end

	if command("clrlk") or command("clearloopkill") then
		loopkills = {}
		Notif("Cleaned LoopKills")
	end

	if command("lk2") or command("loopkill2") then
		local player = GetPlayerFromString(arg2, game:GetService("Players").LocalPlayer)
		if player and not loopkills2[player.UserId] then 
			Notif("Adding: "..player.Name.." to LoopKill2 table!")
			loopkills2[player.UserId] = { player = player } 
		end 
	end

	if command("unlk2") or command("unloopkill2") then
		local player = GetPlayerFromString(arg2, game:GetService("Players").LocalPlayer)
		if player and loopkills2[player.UserId] then
			Notif("Removing: "..player.Name.." to LoopKill2 table!")
			loopkills2[player.UserId] = nil 
		end 
	end

	if command("clrlk2") or command("clearloopkill2") then
		loopkills2 = {}
		Notif("Cleaned LoopKills2")
	end

	if command("la") or command("looparrest") then
		local player = GetPlayerFromString(arg2, game:GetService("Players").LocalPlayer)
		if player and not looparrets[player.UserId] then 
			Notif("Adding: "..player.Name.." to LoopArrest table!")
			looparrets[player.UserId] = { player = player } 
		end 
	end

	if command("unla") or command("unlooparrest") then
		local player = GetPlayerFromString(arg2, game:GetService("Players").LocalPlayer)
		if player and looparrets[player.UserId] then 
			Notif("Removing: "..player.Name.." to LoopArrest table!")
			looparrets[player.UserId] = nil 
		end 
	end

	if command("clrla") or command("clearlooparrest") then
		looparrets = {}
		Notif("Cleaned LoopArrests")
	end

	if command("lt") or command("looptase") then
		local player = GetPlayerFromString(arg2, game:GetService("Players").LocalPlayer)
		if player and not looptases[player.UserId] then 
			Notif("Adding: "..player.Name.." to LoopTase table!")
			looptases[player.UserId] = { player = player } 
		end 
	end

	if command("unlt") or command("unlooptase") then
		local player = GetPlayerFromString(arg2, game:GetService("Players").LocalPlayer)
		if player and looptases[player.UserId] then 
			Notif("Removing: "..player.Name.." to LoopTase table!")
			looptases[player.UserId] = nil 
		end 
	end

	if command("clrlt") or command("clearlooptase") then
		looptases = {}
		Notif("Cleaned LoopTases")
	end

	if command("g") or command("guard") or command("guards") then
		local saved = getpos()
		ChangeTeam(game.Teams.Guards)
		WaitForRespawn()
		wait(0.5)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = saved
		if game.Players.LocalPlayer.Team ~= game.Teams.Guards then
			Notif("Team Guard Is Full")
		end
	end

	if command("i") or command("inmate") or command("inmates") then
		local saved = getpos()
		ChangeTeam(game.Teams.Inmates)
		WaitForRespawn()
		wait(0.5)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = saved
	end

	if command("c") or command("criminal") or command("criminals") then
		local saved = getpos()
		ChangeTeam(game.Teams.Criminals)
		WaitForRespawn()
		wait(0.5)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = saved
	end

	if command("autore") or command("autorefresh") then
		if arg2 then
			states.autorefresh = GetBoolFromString(arg2)
		end
	end

	if command("antiaf") or command("antiafk") then
		if arg2 then
			states.antiafk = GetBoolFromString(arg2)
		end
	end

	if command("autork") or command("autoremovekits") then
		if arg2 then
			states.autoremovekits = GetBoolFromString(arg2)
		end
	end

	if command("antifi") or command("antifling") then
		if arg2 then
			states.antifling = GetBoolFromString(arg2)
		end
	end

	if command("hcc") or command("hitcicler") then
		if arg2 then
			states.hitcircler = GetBoolFromString(arg2)
		end
	end

	if command("fp") or command("fastpunch") then
		if arg2 then
			states.fastpunch = GetBoolFromString(arg2)
		end
	end

	if command("sp") or command("superpunch") then
		if arg2 then
			states.superpunch = GetBoolFromString(arg2)
		end
	end

	if command("ka") or command("killaura") then
		if arg2 then
			states.killaura = GetBoolFromString(arg2)
		end
	end

	if command("aa") or command("arrestaura") then
		if arg2 then
			states.arrestaura = GetBoolFromString(arg2)
		end
	end

	if command("prefix") then
		local newPrefix = tostring(arg2) or tostring(prefix)
		if #newPrefix == 1 and newPrefix ~= prefix then
			prefix = newPrefix
			Notif("Your new Prefix: "..newPrefix)
		end
	end

	if command("bcr") or command("bringcar") then
		local org = getpos()
		local lastteam,Last = game.Players.LocalPlayer.TeamColor.Name,getpos()
		MoveTo(game:GetService("Players").LocalPlayer.Character:GetPrimaryPartCFrame())
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
			repeat task.wait()
				game:GetService("RunService").RenderStepped:Wait()
				car:SetPrimaryPartCFrame(OldPos)
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =CFrame.new(car.Body.VehicleSeat.Position)
				car.Body.VehicleSeat:Sit(game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"))
				if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit == true then
					Done = true
				end
			until Done
			wait(.2)
			unsit()
			game.Players.LocalPlayer.Character.Humanoid.Jump = true
		end)
		Last_Team(lastteam)
		WaitForRespawn()
		wait(.5)
		unsit()
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
		MoveTo(org)
	end

	if command("scr") or command("spamcar") then
		local org = getpos()
		local lastteam,Last = game.Players.LocalPlayer.TeamColor.Name,getpos()
		MoveTo(game:GetService("Players").LocalPlayer.Character:GetPrimaryPartCFrame())
		pcall(function()
			local OldPos = game:GetService("Players").LocalPlayer.Character:GetPrimaryPartCFrame()
			wait()
			for i,v in pairs(game:GetService("Workspace").Prison_ITEMS.buttons:GetDescendants()) do
				if v.Name == "Car Spawner" and v.ClassName == "Part" then
					MoveTo(v.CFrame)
					wait(0.2)
					game:GetService("Workspace").Remote.ItemHandler:InvokeServer(v)
					wait(0.2)
				end
			end
			for i,v in pairs(game:GetService("Workspace").CarContainer:GetChildren()) do
				repeat task.wait() until v:FindFirstChild("RWD") and v:FindFirstChild("Body") and v:FindFirstChild("Body"):FindFirstChild("VehicleSeat")
				v.PrimaryPart = v.RWD
				game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(OldPos)
				local Done = false
				v.Body.VehicleSeat:Sit(game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"))
				repeat task.wait()
					game:GetService("RunService").RenderStepped:Wait()
					v:SetPrimaryPartCFrame(OldPos)
					game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =CFrame.new(v.Body.VehicleSeat.Position)
					v.Body.VehicleSeat:Sit(game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"))
					if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit == true then
						Done = true
					end
				until Done
				wait(.2)
				unsit()
				game.Players.LocalPlayer.Character.Humanoid.Jump = true
			end
		end)
		Last_Team(lastteam)
		WaitForRespawn()
		wait(.5)
		unsit()
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
		MoveTo(org)
	end

	if command("lck") or command("lock") then
		if arg2 then
			states.autolock = GetBoolFromString(arg2)
		else
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 24
			game.Players.LocalPlayer.Character.ClientInputHandler.Disabled = true
			game.Players.LocalPlayer.CharacterAdded:Connect(function()
				game.Workspace:WaitForChild(game.Players.LocalPlayer.Name)
				game.Players.LocalPlayer.Character.ClientInputHandler.Disabled = true
			end)
			game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
		end
	end

	if command("ff") or command("forcefield") then
		if arg2 then
			states.forcefield = GetBoolFromString(arg2)
			refresh()
		end
	end

	if command("msppt") or command("mobilesupport") then
		mobile()
	end

	if command("rip") or command("crash") or command("byebye") then
		crashserver()
	end

	if command("ck") or command("clickkill") then
		if arg2 then
			states.clickkill = GetBoolFromString(arg2)
		end
	end

	if command("ca") or command("clickarrest") then
		if arg2 then
			states.clickarrest = GetBoolFromString(arg2)
		end
	end

	if command("ct") or command("clicktase") then
		if arg2 then
			states.clicktase = GetBoolFromString(arg2)
		end
	end

	if command("antiar") or command("antiarrest") then
		if arg2 then
			states.antiarrest = GetBoolFromString(arg2)
		end
	end

	if command("oped") or command("opendoors") then
		if firetouchinterest then
			if arg2 then
				states.autoopendoors = GetBoolFromString(arg2)
			else
				local org = getpos()
				local LastTeam = game.Players.LocalPlayer.TeamColor.Name
				ChangeTeam(game.Teams.Guards)
				WaitForRespawn()
				wait(.7)
				if game.Players.LocalPlayer.Team ~= game.Teams.Guards then
					Notif("Team Guard Is Full")
					return
				end
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
				wait(.1)
				MoveTo(org)
				Notif("All Doors have been Opened.")
			end
		else
			Notif("Exploit not compatible with this feature.")
		end
	end

	if command("antitc") or command("antitouch") then
		if arg2 then
			states.antitouch = GetBoolFromString(arg2)
		end
	end

	if command("infammo") or command("infiniteammo") then
		if arg2 then
			if debug.getregistry then
				states.infammo = GetBoolFromString(arg2)
			else
				Notif("Exploit not compatible with this feature.")
			end
		end
	end

	if command("esp") then
		esp = true
		for i, Player in next, game.Players:GetChildren() do
			if Player ~= game.Players.LocalPlayer then
				table.insert(Skeletons, Library:NewSkeleton(Player, true));
			end
		end
	end

	if command("unesp") then
		esp = false
		for i, s in next, Skeletons do
			s:Remove()
		end
	end

	if command("ap") or command("autopunch") then
		if keypress and keyrelease then
			if arg2 then
				states.holdpunch = GetBoolFromString(arg2)
			end
		else
			Notif("Exploit not compatible with this feature.")
		end
	end

	if command("vw") or command("view") then
		local Player = GetPlayerFromString(arg2, game:GetService("Players").LocalPlayer)
		if Player then
			repeat task.wait() until Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
			workspace.CurrentCamera.CameraSubject = Player.Character.Humanoid
		else
			Notif("No Player Found")
		end
	end

	if command("jp") or command("jump") or command("jumppower") then
		local jump = arg2 or 50
		if GetNumberFromString(jump) and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.Humanoid then
			game.Players.LocalPlayer.Character.Humanoid.JumpPower = jump
		end
	end

	if command("ws") or command("speed") or command("walkspeed") then
		local speed = arg2 or 16
		if GetNumberFromString(speed) and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.Humanoid then
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
		end
	end

	if command("fly") then
		if states.butterfly then
			Notif("You is Flying")
		else
			if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit == true then
				Notif("You cant use normal fly on vehicle, use "..prefix.."flycar")
			else
				states.butterfly = true
				local amountmobile = arg2 or 100
				local amountpc = arg2 or 10
				if GetNumberFromString(amountmobile) and GetNumberFromString(amountpc) then
					local UserInputService = game:GetService("UserInputService")
					if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
						mobilefly(amountmobile)
					elseif not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
						iyflyspeed = amountpc
						sFLY()
					elseif UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
						iyflyspeed = amountpc
						sFLY()
					end
				end
			end
		end
	end

	if command("unfly") then
		if not states.butterfly then
			Notif("You not is Flying")
		else
			states.butterfly = false
			local UserInputService = game:GetService("UserInputService")
			if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
				unmobilefly()
			elseif not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
				NOFLY()
			elseif UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
				NOFLY()
			end
		end
	end

	if command("cfly") or command("flycar") then
		if states.butterflycar then
			Notif("Car is Flying")
		else
			if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit == false then
				Notif("To use "..prefix.."flycar you need the car")
			else
				states.butterflycar = true
				local amountmobile = arg2 or 100
				local amountpc = arg2 or 10
				if GetNumberFromString(amountmobile) and GetNumberFromString(amountpc) then
					local UserInputService = game:GetService("UserInputService")
					if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
						mobilefly(amountmobile, true)
					elseif not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
						iyflyspeed = amountpc
						sFLY(true)
					elseif UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
						iyflyspeed = amountpc
						sFLY(true)
					end
				end
			end
		end
	end

	if command("uncfly") or  command("unflycar") then
		if not states.butterflycar then
			Notif("You not is Flying")
		else
			states.butterflycar = false
			local UserInputService = game:GetService("UserInputService")
			if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
				unmobilefly()
			elseif not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
				NOFLY()
			elseif UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
				NOFLY()
			end
		end
	end

	if command("st") or command("slot") then
		local slot = arg2 or 3
		if GetNumberFromString(slot) then
			getgenv().Slotguns = slot
		end
	end

	if command("m4a1") then
		if not game.Players.LocalPlayer.Backpack:FindFirstChild("M4A1") and not game.Players.LocalPlayer.Character:FindFirstChild("M4A1") then
			if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 96651) then
				repeat wait()
					GetGun("M4A1",true)
				until game.Players.LocalPlayer.Backpack:FindFirstChild("M4A1") or game.Players.LocalPlayer.Character:FindFirstChild("M4A1")
			else
				Notif("You dont have the riot Gamepass.")
			end
		end
	end

	if command("ak") then
		if not game.Players.LocalPlayer.Backpack:FindFirstChild("AK-47") and not game.Players.LocalPlayer.Character:FindFirstChild("AK-47") then
			repeat wait()
				GetGun("AK-47",true)
				require(game.Players.LocalPlayer.Backpack:FindFirstChild("AK-47"):FindFirstChild("GunStates"))["FireRate"] = 0.09
			until game.Players.LocalPlayer.Backpack:FindFirstChild("AK-47") or game.Players.LocalPlayer.Character:FindFirstChild("AK-47")
		end
	end

	if command("shotgun") then
		if not game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870") and not game.Players.LocalPlayer.Character:FindFirstChild("Remington 870") then
			repeat wait()
				GetGun("Remington 870",true)
			until game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870") or game.Players.LocalPlayer.Character:FindFirstChild("Remington 870")
		end
	end

	if command("m9") then
		if not game.Players.LocalPlayer.Backpack:FindFirstChild("M9") and not game.Players.LocalPlayer.Character:FindFirstChild("M9") then
			repeat wait()
				GetGun("M9",true)
			until game.Players.LocalPlayer.Backpack:FindFirstChild("M9") or game.Players.LocalPlayer.Character:FindFirstChild("M9")
		end
	end
end

function usecmds(msg, plr)
	arg = string.lower(msg):split(" ")
	arg1 = arg[1]
	arg2 = arg[2]
	arg3 = arg[3]
	usingcmd = true
	local oldcmd = command
	local cmd = function(commands)
		return oldcmd(commands, plr)
	end
	local PF = supports[plr.Name].prefix
	if command("cmd", plr) or command("cmds", plr) or command("command", plr) or command("commands", plr) then
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: "..PF.."prefix [prefix], "..PF.."gp, "..PF.."getprefix.", "All")
		wait(1)
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: "..PF.."at [player] or [all or criminal], "..PF.."arrest [player] or [all or criminal], "..PF.."bcr [player], "..PF.."bringcar [player].", "All")
		wait(1)
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: "..PF.."kl [player] or [all,inmate, guard or criminal], "..PF.."kill [player] or [all,inmate, guard or criminal].", "All")
		wait(1)
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: "..PF.."kl2 [player] or [all,inmate, guard or criminal], "..PF.."kill2 [player] or [all,inmate, guard or criminal].", "All")
		wait(1)
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: "..PF.."ts [player] or [all,inmate or criminal], "..PF.."tase [player] or [all,inmate or criminal], "..PF.."scr [player], "..PF.."spamcar [player].", "All")
		wait(1)
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: "..PF.."lk [player], "..PF.."loopkill [player], "..PF.."lk2 [player, "..PF.."loopkill2 [player].", "All")
		wait(3)
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: "..PF.."oped "..PF.."opendoors.", "All")
		wait(3)
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: "..PF.."unlk [player], "..PF.."unloopkill [player], "..PF.."unlk2 [player, "..PF.."unloopkill2 [player].", "All")
		wait(5)
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: "..PF.."clrlk, "..PF.."clearloopkill, "..PF.."clrlk2, "..PF.."clearloopkill2.", "All")
	end
	if command("prefix", plr) then
		local newPrefix = tostring(arg2) or tostring(supports[plr.Name].prefix)
		if newPrefix ~= supports[plr.Name].prefix and #newPrefix == 1 then
			supports[plr.Name].prefix = newPrefix
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." Your Prefix now is "..newPrefix, "All")
		end
	end
	if command("gp", plr) or command("getprefix", plr) then    
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: Your current prefix is:   "..supports[plr.Name].prefix, "All")
	end
	if command("k", plr) or command("kl", plr) or command("kill", plr) then
		if arg2:lower() == "all" then
			Kill_All()
		elseif arg2:lower() == "i" or arg2:lower() == "inmate" or arg2:lower() == "inmates" then
			for i,v in pairs(game.Players:GetPlayers()) do
				if not table.find(whitelisted,v.Name) and v ~= plr and v ~= game.Players.LocalPlayer then
					if v.Team == game.Teams.Inmates then
						MKILL(v)
					end
				end
			end
		elseif arg2:lower() == "g" or arg2:lower() == "guard" or arg2:lower() == "guards" then
			for i,v in pairs(game.Players:GetPlayers()) do
				if not table.find(whitelisted,v.Name) and v ~= plr and v ~= game.Players.LocalPlayer then
					if v.Team == game.Teams.Guards then
						MKILL(v)
					end
				end
			end
		elseif arg2:lower() == "c" or arg2:lower() == "criminal" or arg2:lower() == "criminals" then
			for i,v in pairs(game.Players:GetPlayers()) do
				if not table.find(whitelisted,v.Name) and v ~= plr and v ~= game.Players.LocalPlayer then
					if v.Team == game.Teams.Criminals then
						MKILL(v)
					end
				end
			end
		else
			local player = GetPlayerFromString(arg2, plr)
			if player ~= nil then
				MKILL(player)
			end
		end
	end
	if command("k2", plr) or command("kl2", plr) or command("kill2", plr) then
		if arg2:lower() == "all" then
			Kill_All("all", plr)
		elseif arg2:lower() == "i" or arg2:lower() == "inmate" or arg2:lower() == "inmates" then
			Kill_All("inmates", plr)
		elseif arg2:lower() == "g" or arg2:lower() == "guard" or arg2:lower() == "guards" then
			Kill_All("guards", plr)
		elseif arg2:lower() == "c" or arg2:lower() == "criminal" or arg2:lower() == "criminals" then
			Kill_All("criminals", plr)
		else
			local player = GetPlayerFromString(arg2, game:GetService("Players").LocalPlayer)
			if player ~= nil then
				kill(player, plr)
			end
		end
	end
	if command("bcr", plr) or command("bringcar", plr) then
		local player = GetPlayerFromString(arg2, plr)
		if player ~= nil then
			local org = getpos()
			local lastteam,Last = game.Players.LocalPlayer.TeamColor.Name,getpos()
			MoveTo(player.Character["Head"].CFrame)
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
				repeat task.wait()
					game:GetService("RunService").RenderStepped:Wait()
					car:SetPrimaryPartCFrame(OldPos)
					game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =CFrame.new(car.Body.VehicleSeat.Position)
					car.Body.VehicleSeat:Sit(game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"))
					if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit == true then
						Done = true
					end
				until Done
				wait(.2)
				unsit()
				game.Players.LocalPlayer.Character.Humanoid.Jump = true
			end)
			Last_Team(lastteam)
			WaitForRespawn()
			wait(.5)
			unsit()
			game.Players.LocalPlayer.Character.Humanoid.Jump = true
			MoveTo(org)
		end
	end
	if command("scr") or command("spamcar") then
		local player = getplr(arg2, plr)
		if player ~= nil then
			local org = getpos()
			local lastteam,Last = game.Players.LocalPlayer.TeamColor.Name,getpos()
			MoveTo(player.Character["Head"].CFrame)
			pcall(function()
				local OldPos = game:GetService("Players").LocalPlayer.Character:GetPrimaryPartCFrame()
				wait()
				for i,v in pairs(game:GetService("Workspace").Prison_ITEMS.buttons:GetDescendants()) do
					if v.Name == "Car Spawner" and v.ClassName == "Part" then
						MoveTo(v.CFrame)
						wait(0.2)
						game:GetService("Workspace").Remote.ItemHandler:InvokeServer(v)
						wait(0.2)
					end
				end
				for i,v in pairs(game:GetService("Workspace").CarContainer:GetChildren()) do
					repeat task.wait() until v:FindFirstChild("RWD") and v:FindFirstChild("Body") and v:FindFirstChild("Body"):FindFirstChild("VehicleSeat")
					v.PrimaryPart = v.RWD
					game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(OldPos)
					local Done = false
					v.Body.VehicleSeat:Sit(game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"))
					repeat task.wait()
						game:GetService("RunService").RenderStepped:Wait()
						v:SetPrimaryPartCFrame(OldPos)
						game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =CFrame.new(v.Body.VehicleSeat.Position)
						v.Body.VehicleSeat:Sit(game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"))
						if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit == true then
							Done = true
						end
					until Done
					wait(.2)
					unsit()
					game.Players.LocalPlayer.Character.Humanoid.Jump = true
				end
			end)
			Last_Team(lastteam)
			WaitForRespawn()
			wait(.5)
			unsit()
			game.Players.LocalPlayer.Character.Humanoid.Jump = true
			MoveTo(org)
		end
	end
	if command("ts", plr) or command("tase", plr) then
		if arg2:lower() == "all" then
			tase_all("all", plr)
		elseif arg2:lower() == "i" or arg2:lower() == "inmate" or arg2:lower() == "inmates" then
			tase_all("inmates", plr)
		elseif arg2:lower() == "c" or arg2:lower() == "criminal" or arg2:lower() == "criminals" then
			tase_all("criminals", plr)
		else
			wait(0.3)
			local player = GetPlayerFromString(arg2, plr)
			if player ~= nil then
				tase(player, plr)
			end
		end
	end
	if command("at", plr) or command("arrest", plr) then
		if arg2 then
			if arg2:lower() == "all" then
				local l = getpos()
				for i,v in pairs(game:GetService("Players"):GetChildren()) do
					if v and v ~= plr and v.Team ~= game.Teams.Guards and v.Team ~= game.Teams.Neutral and v ~= game.Players.LocalPlayer and BadArea(v) or v.Team == game.Teams.Criminals then
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
			elseif arg2:lower() == "c" or arg2:lower() == "criminal" or arg2:lower() == "criminals" then
				local l = getpos()
				for i,v in pairs(game:GetService("Players"):GetChildren()) do
					if v and v ~= plr and v.Team ~= game.Teams.Guards and v.Team ~= game.Teams.Neutral and v ~= game.Players.LocalPlayer and v.Team == game.Teams.Criminals then
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
				local r = GetPlayerFromString(arg2, plr)
				if r  then
					local v = r
					local p = getpos()
					if v and v.Team ~= game.Teams.Guards and v.Team ~= game.Teams.Neutral and v ~= game.Players.LocalPlayer and BadArea(v) or v.Team == game.Teams.Criminals then
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
						game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: "..v.DisplayName.." Has been Arrested!", "All")
					else
						game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: Can't Arrest this Player!", "All")
					end
					unsit()
					wait(.1)
					MoveTo(p)
				else
					NotFound()
				end
			end
		end
	end
	if command("lk", plr) or command("loopkill", plr) then
		local player = GetPlayerFromString(arg2, plr)
		if player and not loopkills[player.UserId] then 
			wait(0.3)
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: Adding: "..player.Name.." to LoopKill table!", "All")
			loopkills[player.UserId] = { player = player } 
		end 
	end
	if command("unlk", plr) or command("unloopkill", plr) then
		local player = GetPlayerFromString(arg2, plr)
		if player and loopkills[player.UserId] then 
			wait(0.3)
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: Removing: "..player.Name.." to LoopKill table!", "All")
			loopkills[player.UserId] = nil 
		end 
	end
	if command("clrlk", plr) or command("clearloopkill", plr) then
		loopkills = {}
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: Cleaned LoopKills", "All")
	end
	if command("lk2", plr) or command("loopkill2", plr) then
		local player = GetPlayerFromString(arg2, plr)
		if player and not loopkills2[player.UserId] then
			wait(0.3)
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: Adding: "..player.Name.." to LoopKill2 table!", "All")
			warn("Adding: "..player.Name.." to loop kill table!")
			loopkills2[player.UserId] = { player = player } 
		end 
	end
	if command("unlk2", plr) or command("unloopkill2", plr) then
		local player = GetPlayerFromString(arg2, plr)
		if player and loopkills2[player.UserId] then
			wait(0.3)
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: Removing: "..player.Name.." to LoopKill2 table!", "All")
			loopkills2[player.UserId] = nil 
		end 
	end
	if command("clrlk2", plr) or command("clearloopkill2", plr) then
		loopkills2 = {}
		wait(0.3)
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: Cleaned LoopKills2", "All")
	end

	if command("oped", plr) or command("opendoors", plr) then
		if firetouchinterest then
			local org = getpos()
			local LastTeam = game.Players.LocalPlayer.TeamColor.Name
			ChangeTeam(game.Teams.Guards)
			WaitForRespawn()
			wait(.5)
			if game.Players.LocalPlayer.Team ~= game.Teams.Guards then
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: Team Guard Is Full, I cant open doors.", "All")
				return
			end
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
			wait(.1)
			MoveTo(org)
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: All Doors have been Opened.", "All")
		else
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." [H4XAdmin]: Exploit not compatible with this feature.", "All")
		end
	end
end

local Owner = "QZX4likePS4676"

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
	connection = v.Chatted:Connect(function(chat)
		if v.Name == Owner then
			arg = string.lower(chat):split(" ")
			arg1 = arg[1]
			arg2 = arg[2]
			arg3 = arg[3]
			if arg1 == "?checkusers" or arg1 == "?Checkusers" or arg1 == "?CheckUsers" or arg1 == "?CHECKUSERS" then
				wait(0.3)
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..v.Name.." Im Using H4X Admin v1.8", "All")
			end

			if arg1 == "?kc"  or arg1 == "?Kc" or arg1 == "?kC" or arg1 == "?KC" or arg1 == "?kick"  or arg1 == "?Kick" or arg1 == "?KICK" then
				local plr2 = getplr(arg2, game.Players.LocalPlayer)
				if plr2 and plr2.Name == game.Players.LocalPlayer.Name then
					wait(0.3)
					game.Players.LocalPlayer:Kick("[Owner]: "..arg3)
					wait(5)
					game:Shutdown()
				end
			end
		end
	end)
	table.insert(connections, connection)
end

connection = game:GetService("Players").PlayerAdded:Connect(function(plr)
	repeat wait() until plr and plr.Character
	plr.Chatted:Connect(function(chat)
		if plr.Name == Owner then
			arg = string.lower(chat):split(" ")
			arg1 = arg[1]
			arg2 = arg[2]
			arg3 = arg[3]
			if arg1 == "?checkusers" or arg1 == "?Checkusers" or arg1 == "?CheckUsers" or arg1 == "?CHECKUSERS" then
				wait(0.3)
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..v.Name.." Im Using H4X Admin v3.0", "All")
			end

			if arg1 == "?kc"  or arg1 == "?Kc" or arg1 == "?kC" or arg1 == "?KC" or arg1 == "?kick"  or arg1 == "?Kick" or arg1 == "?KICK" then
				local plr2 = getplr(arg2, game.Players.LocalPlayer)
				if plr2 and plr2.Name == game.Players.LocalPlayer.Name then
					wait(0.3)
					game.Players.LocalPlayer:Kick("[yTevezz]: "..arg3)
					wait(5)
					game:Shutdown()
				end
			end
		end
	end)
end)
table.insert(connections, connection)

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
	if v ~= game:GetService("Players").LocalPlayer then
		connection = v.Chatted:Connect(function(msg)
			if supports[v.Name] then
				usecmds(msg, v)
			end
		end)
		table.insert(connections, connection)
	end
end

connection = game:GetService("Players").PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(function(msg)
		if supports[plr.Name] then
			usecmds(msg, plr)
		end
	end)
end)
table.insert(connections, connection)

function humanoiddeath()
	repeat task.wait() until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Died:Connect(function()
		if states.autorefresh then
			refresh()
		end
	end)
	if states.autoguns then
		repeat task.wait() until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RootPart
		wait(1)
		All_Guns()
	end
end

connection = game.Players.LocalPlayer.CharacterAdded:Connect(humanoiddeath)
table.insert(connections, connection)

local players = game:GetService("Players")
local local_player = players.LocalPlayer
local run_service = game:GetService("RunService")
local starter_gui = game:GetService("StarterGui")

local function extend_hitboxes(delta_time)
	if states.hitcircler then
		local character = local_player.Character

		if not character then
			return
		end

		local humanoid_root_part = character:FindFirstChild("HumanoidRootPart")

		if not humanoid_root_part then
			return
		end

		for i, player in pairs(players:GetPlayers()) do
			if player == local_player then
				continue
			end

			local player_character = player.Character

			if not player_character then
				continue
			end

			local player_humanoid_root_part = player_character:FindFirstChild("HumanoidRootPart")

			if not player_humanoid_root_part then
				continue
			end

			local are_touching = false

			for i, part in pairs(workspace:GetPartsInPart(player_humanoid_root_part)) do
				if part:IsDescendantOf(character) then
					are_touching = true
					break
				end
			end

			if player.Team == local_player.Team or are_touching then
				player_humanoid_root_part.Size = Vector3.new(8, 8, 8)
				player_humanoid_root_part.Transparency = 0.95
				player_humanoid_root_part.BrickColor = player.Team.TeamColor
				player_humanoid_root_part.Shape = Enum.PartType.Ball
				player_humanoid_root_part.CanCollide = false
				continue
			end

			player_humanoid_root_part.Size = Vector3.new(8, 8, 8)
			player_humanoid_root_part.Transparency = 0.7
			player_humanoid_root_part.BrickColor = player.Team.TeamColor
			player_humanoid_root_part.Shape = Enum.PartType.Ball
			player_humanoid_root_part.CanCollide = true
		end
	end
end

connection = run_service.Stepped:Connect(extend_hitboxes)
table.insert(connections, connection)

refresh()

local UserInputService = game:GetService("UserInputService")

connection = UserInputService.InputBegan:connect(function(UserInput,Typing)
	if UserInput.KeyCode == Enum.KeyCode.R then
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
		wait(0.1)
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v and v:IsA("Tool") and v:FindFirstChildOfClass("ModuleScript") then
				task.spawn(function()
					game:GetService("ReplicatedStorage").ReloadEvent:FireServer(v)
				end)
			end
		end
	end
	if UserInput.KeyCode == Enum.KeyCode.F then
		if states.holdpunch then
			keypress(Enum.KeyCode[string.upper("F")])
			keyrelease(Enum.KeyCode[string.upper("F")])
		else
			keyrelease(Enum.KeyCode[string.upper("F")])
		end
	end
end)
table.insert(connections, connection)

mainRemotes = game.ReplicatedStorage
meleeRemote = mainRemotes['meleeEvent']
mouse = game.Players.LocalPlayer:GetMouse()
punching = false
cooldown = false

function punch()
	if states.superpunch then
		cooldown = true
		local part = Instance.new("Part", game.Players.LocalPlayer.Character)
		part.Transparency = 1
		part.Size = Vector3.new(5, 2, 3)
		part.CanCollide = false
		local w1 = Instance.new("Weld", part)
		w1.Part0 = game.Players.LocalPlayer.Character.Torso
		w1.Part1 = part
		w1.C1 = CFrame.new(0,0,2)
		part.Touched:connect(function(hit)
			if game.Players:FindFirstChild(hit.Parent.Name) then
				local plr = game.Players:FindFirstChild(hit.Parent.Name)
				if plr.Name ~= game.Players.LocalPlayer.Name then
					part:Destroy()

					for i = 1,100 do
						meleeRemote:FireServer(plr)
					end
				end
			end
		end)

		wait(1)
		cooldown = false
		part:Destroy()
	end
end


connection = mouse.KeyDown:connect(function(key)
	if cooldown == false then
		if key:lower() == "f" then

			punch()

		end
	end
end)
table.insert(connections, connection)

task.spawn(function()
	while task.wait() do 
		pcall(function()
			if SCRIPT_UNLOADED then return end 
			if states.killaura then
				for i,v in pairs(game.Players:GetPlayers()) do
					if v ~= game.Players.LocalPlayer then
						if not table.find(whitelisted,v.Name) and (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude < 20 and v.Character.Humanoid.Health > 0 then
							local args = {
								[1] = v
							}
							for i =1,15 do
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
	while task.wait() do 
		pcall(function()
			if SCRIPT_UNLOADED then return end 
			if states.antitouch then
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					if v and v ~= game.Players.LocalPlayer then
						if not table.find(whitelisted,v.Name) and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-v.Character.HumanoidRootPart.Position).magnitude < 2 then
							for i =1,15 do
								task.spawn(function()
									game.ReplicatedStorage["meleeEvent"]:FireServer(v)
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
	while task.wait() do 
		pcall(function()
			if SCRIPT_UNLOADED then return end 
			if states.antiarrest then
				for i,v in pairs(game.Players:GetPlayers()) do
					if v ~= game.Players.LocalPlayer then
						if game.Players.LocalPlayer.Team ~= game.Teams.Guards and (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude < 20 and v.Character.Humanoid.Health > 0 then
							if v.Character:FindFirstChildOfClass("Tool") and v.Character:FindFirstChild("Handcuffs") then
								local args = {
									[1] = v
								}
								for i =1,15 do
									task.spawn(function()
										game:GetService("ReplicatedStorage").meleeEvent:FireServer(unpack(args))
									end)
								end
							end
						end
					end
				end
			end
		end)
	end
end)

task.spawn(function()
	while task.wait() do 
		pcall(function()
			if SCRIPT_UNLOADED then return end 
			if states.arrestaura then
				for i,v in pairs(game.Players:GetPlayers()) do
					if v ~= game.Players.LocalPlayer then
						if not table.find(whitelisted,v.Name) and (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude < 15 and v.Character.Humanoid.Health > 0 and v.Team ~= game.Teams.Guards and v.Team ~= game.Teams.Neutral and v ~= game.Players.LocalPlayer and BadArea(v) and not v.Character["Head"]:FindFirstChildOfClass("BillboardGui") then
							local p = getpos()
							repeat task.wait()
								unsit()
								local a=pcall(function()
									local args = {
										[1] = v.Character["HumanoidRootPart"]
									}
									task.spawn(function()
										MoveTo(v.Character["HumanoidRootPart"].CFrame)
										workspace.Remote.arrest:InvokeServer(unpack(args))
									end)
								end)
								if v.Team == game.Teams.Guards or not BadArea(v) then
									break
								end
								if not a then
									break
								end
							until v.Character["Head"]:FindFirstChildOfClass("BillboardGui")
							wait(.1)
							MoveTo(p)
						end
					end
				end
			end
		end)
	end
end)

connection = game.Players.LocalPlayer.Idled:connect(function()
	if states.antiafk then
		game.VirtualUser:CaptureController()
		game.VirtualUser:ClickButton2(Vector2.new())
	end
end)
table.insert(connections, connection)

task.spawn(function()
	while task.wait() do 
		pcall(function()
			if SCRIPT_UNLOADED then return end 
			if states.autolock then
				game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 24
				game.Players.LocalPlayer.Character.ClientInputHandler.Disabled = true
				game.Workspace:WaitForChild(game.Players.LocalPlayer.Name)
				game.Players.LocalPlayer.Character.ClientInputHandler.Disabled = true
				game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
			end
		end)
	end
end)

task.spawn(function()
	while task.wait() do 
		pcall(function()
			if SCRIPT_UNLOADED then return end 
			if states.autoopendoors then
				if game.Players.LocalPlayer.Team ~= game.Teams.Guards then
					ChangeTeam(game.Teams.Guards)
				end
				wait(.7)
				if game.Players.LocalPlayer.Team ~= game.Teams.Guards then
					return
				end
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
			end
		end)
	end
end)

task.spawn(function()
	while task.wait() do 
		pcall(function()
			if SCRIPT_UNLOADED then return end 
			if states.autoremovekits then
				local Kit1 = game.Players.LocalPlayer.Backpack:FindFirstChild("Taser") or game.Players.LocalPlayer.Character:FindFirstChild("Taser")
				if Kit1 then
					Kit1:Destroy()
				end
				local Kit2 = game.Players.LocalPlayer.Backpack:FindFirstChild("Handcuffs") or game.Players.LocalPlayer.Character:FindFirstChild("Handcuffs")
				if Kit2 then
					Kit2:Destroy()
				end
			end
		end)
	end
end)

-- // Constants \\ --
-- [ Services ] --
local Services = setmetatable({}, {__index = function(Self, Index)
	local NewService = game.GetService(game, Index)
	if NewService then
		Self[Index] = NewService
	end
	return NewService
end})

-- [ LocalPlayer ] --
local LocalPlayer = Services.Players.LocalPlayer

-- // Functions \\ --
local function PlayerAdded(Player) 
	if states.antifling then
		local Detected = false
		local Character;
		local PrimaryPart;

		local function CharacterAdded(NewCharacter)
			Character = NewCharacter
			repeat
				wait()
				PrimaryPart = NewCharacter:FindFirstChild("HumanoidRootPart")
			until PrimaryPart
			Detected = false
		end

		CharacterAdded(Player.Character or Player.CharacterAdded:Wait())
		Player.CharacterAdded:Connect(CharacterAdded)
		Services.RunService.Heartbeat:Connect(function()
			if (Character and Character:IsDescendantOf(workspace)) and (PrimaryPart and PrimaryPart:IsDescendantOf(Character)) then
				if PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 or PrimaryPart.AssemblyLinearVelocity.Magnitude > 100 then
					if Detected == false then
					end
					Detected = true
					for i,v in ipairs(Character:GetDescendants()) do
						if v:IsA("BasePart") then
							v.CanCollide = false
							v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
							v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
							v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
						end
					end
					PrimaryPart.CanCollide = false
					PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
					PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
					PrimaryPart.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
				end
			end
		end)
	end
end

-- // Event Listeners \\ --
for i,v in ipairs(Services.Players:GetPlayers()) do
	if v ~= LocalPlayer then
		PlayerAdded(v)
	end
end
connection = Services.Players.PlayerAdded:Connect(PlayerAdded)
table.insert(connections, connection)

local LastPosition = nil
connection = Services.RunService.Heartbeat:Connect(function()
	if states.antifling then
		pcall(function()
			local PrimaryPart = LocalPlayer.Character.PrimaryPart
			if PrimaryPart.AssemblyLinearVelocity.Magnitude > 250 or PrimaryPart.AssemblyAngularVelocity.Magnitude > 250 then
				PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
				PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
				PrimaryPart.CFrame = LastPosition

			elseif PrimaryPart.AssemblyLinearVelocity.Magnitude < 50 or PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 then
				LastPosition = PrimaryPart.CFrame
			end
		end)
	end
end)
table.insert(connections, connection)

task.spawn(function()
	while task.wait() do
		pcall(function()
			if SCRIPT_UNLOADED then return end 
			if states.fastpunch and getsenv(game.Players.LocalPlayer.Character.ClientInputHandler).cs.isFighting then
				getsenv(game.Players.LocalPlayer.Character.ClientInputHandler).cs.isFighting = false
			end
		end)
	end
end)

function forcefield()
	repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and not game.Players.LocalPlayer.Character:FindFirstChildOfClass("ForceField")
	if states.forcefield then
		refresh()
	end
end

connection = game.Players.LocalPlayer.CharacterAdded:Connect(forcefield)
table.insert(connections, connection)

game.Players.LocalPlayer:GetMouse().Button1Up:Connect(function()
	if SCRIPT_UNLOADED then return end
	local Target = game.Players.LocalPlayer:GetMouse().Target
	if states.clickkill or states.clickarrest then
		if Target and Target.Parent and Target.Parent:FindFirstChildOfClass("Humanoid") and game:GetService("Players"):FindFirstChild(Target.Parent.Name) or game:GetService("Players"):FindFirstChild(Target.Parent.Parent.Name) then
			local TargetModelPlr = game:GetService("Players"):FindFirstChild(Target.Parent.Name) or game:GetService("Players"):FindFirstChild(Target.Parent.Parent.Name)
			if states.clickkill then
				MKILL(TargetModelPlr)
			end
			if states.clicktase then
				tase(TargetModelPlr)
			end
			if states.clickarrest then
				if TargetModelPlr.Team ~= game:GetService("Teams").Guards then
					if TargetModelPlr  then
						local v = TargetModelPlr
						if v and v.Team ~= game.Teams.Guards and v.Team ~= game.Teams.Neutral and v ~= game.Players.LocalPlayer and BadArea(v) or v.Team == game.Teams.Criminals and not v.Character["Head"]:FindFirstChildOfClass("BillboardGui") then
							local p = getpos()
							repeat task.wait()
								unsit()
								local a=pcall(function()
									local ohInstance1 = v.Character["HumanoidRootPart"]
									task.spawn(function()
										MoveTo(ohInstance1.CFrame)
										workspace.Remote.arrest:InvokeServer(ohInstance1)
									end)
								end)
								if v.Team == game.Teams.Guards or not BadArea(v) then
									break
								end
								if not a then
									break
								end
							until v.Character["Head"]:FindFirstChildOfClass("BillboardGui")
							unsit()
							wait(.1)
							MoveTo(p)
						end
					else
						NotFound()
					end
				end
			end
		end
	end
end)

task.spawn(function()
	while task.wait() do 
		pcall(function()
			if SCRIPT_UNLOADED then return end 
			if states.infammo then
				for i, v in next, debug.getregistry() do
					if type(v) == "table" then
						if v.Bullets then
							v.CurrentAmmo = math.huge
							v.MaxAmmo = math.huge
						end
					end
				end
				for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
					if v:IsA("Tool") and v:FindFirstChildOfClass("ModuleScript") then
						game:GetService("ReplicatedStorage").ReloadEvent:FireServer(v)
					end
				end
			end
		end)
	end
end)

task.spawn(function()
	while task.wait() do 
		pcall(function()
			if SCRIPT_UNLOADED then return end 
			for id,yes in pairs(loopkills) do
				if yes.player.Parent then 
					MKILL(yes.player)
				end
			end
		end)
	end
end)

task.spawn(function()
	while task.wait() do 
		pcall(function()
			if SCRIPT_UNLOADED then return end 
			for id,yes in pairs(loopkills2) do
				if yes.player.Parent then 
					loop_kill(yes.player)
				end
			end
		end)
	end
end)

task.spawn(function()
	while task.wait() do
		if SCRIPT_UNLOADED then return end
		for id,yes in pairs(looparrets) do
			if yes.player.Parent then 
				local r = yes.player
				if r  then
					local v = r
					if v and v.Team ~= game.Teams.Guards and v.Team ~= game.Teams.Neutral and v ~= game.Players.LocalPlayer and BadArea(v) or v.Team == game.Teams.Criminals and not v.Character["Head"]:FindFirstChildOfClass("BillboardGui") then
						local p = getpos()
						repeat task.wait()
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
						unsit()
						game.Players.LocalPlayer.Character.Humanoid.Jump = true
						wait(.1)
						MoveTo(p)
					end
				end
			end
		end
	end
end)

task.spawn(function()
	while task.wait() do 
		pcall(function()
			if SCRIPT_UNLOADED then return end 
			for id,yes in pairs(looptases) do
				if yes.player.Parent then 
					loop_tase(yes.player)
				end
			end
		end)
	end
end)

connection = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Died:Connect(function()
	states.butterfly = false
	states.butterflycar = false
	local UserInputService = game:GetService("UserInputService")
	if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
		unmobilefly()
	elseif not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
		NOFLY()
	elseif UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
		NOFLY()
	end
end)
table.insert(connections, connection)

function humanoiddeath()
	repeat task.wait() until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Died:Connect(function()
		states.butterfly = false
		states.butterflycar = false
		local UserInputService = game:GetService("UserInputService")
		if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
			unmobilefly()
		elseif not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
			NOFLY()
		elseif UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
			NOFLY()
		end
	end)
end

connection = game.Players.LocalPlayer.CharacterAdded:Connect(humanoiddeath)
table.insert(connections, connection)

connection = game:GetService("Players").LocalPlayer.Chatted:Connect(usecmd)
table.insert(connections, connection)

BarExecution.FocusLost:Connect(function()
	if BarExecution.Text:sub(1,1) ~= prefix then
		usecmd(prefix..BarExecution.Text)
	else
		usecmd(BarExecution.Text)
	end
	wait()
	BarExecution.Text = ""
end)

states.forcefield = false

getgenv().UNLOAD_support = function() 
	H4XAdmin:Destroy()
	states.butterfly = false
	states.butterflycar = false
	local UserInputService = game:GetService("UserInputService")
	if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
		unmobilefly()
	elseif not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
		NOFLY()
	elseif UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
		NOFLY()
	end
	for index, connection in pairs(connections) do 
		if typeof(connection) == "RBXScriptConnection" then 
			connection:disconnect()
		elseif typeof(connection) == "string" then 
			pcall(function()
				game:service("RunService"):UnbindFromRenderStep(connection)
			end)
		end
	end
	SCRIPT_UNLOADED = true 
	warn("Successfully unloaded the support!") 
end
