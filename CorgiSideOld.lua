--https://github.com/Chaosscripter/Prison-Life-Admin-Commands/blob/main/Old-Gui
--[[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88 
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER
]]

-- Instances: 99 | Scripts: 33 | Modules: 0
local G2L = {};

-- StarterGui.ScreenGui
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

-- StarterGui.ScreenGui.CorgiPrison Life
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2"]["Size"] = UDim2.new(0, 459, 0, 397);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Position"] = UDim2.new(0.1347457766532898, 0, 0.06841614097356796, 0);
G2L["2"]["Name"] = [[CorgiPrison Life]];

-- StarterGui.ScreenGui.CorgiPrison Life.UIStroke
G2L["3"] = Instance.new("UIStroke", G2L["2"]);


-- StarterGui.ScreenGui.CorgiPrison Life.ImageLabel
G2L["4"] = Instance.new("ImageLabel", G2L["2"]);
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4"]["Image"] = [[http://www.roblox.com/asset/?id=288158064]];
G2L["4"]["Size"] = UDim2.new(0, 112, 0, 103);
G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["Position"] = UDim2.new(0.37690630555152893, 0, 0.12342569231987, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.ESP
G2L["5"] = Instance.new("TextButton", G2L["2"]);
G2L["5"]["TextWrapped"] = true;
G2L["5"]["BorderSizePixel"] = 0;
G2L["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5"]["TextSize"] = 20;
G2L["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5"]["Size"] = UDim2.new(0, 110, 0, 49);
G2L["5"]["Name"] = [[ESP]];
G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5"]["Text"] = [[Esp]];

-- StarterGui.ScreenGui.CorgiPrison Life.ESP.UIStroke
G2L["6"] = Instance.new("UIStroke", G2L["5"]);
G2L["6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.ESP.LocalScript
G2L["7"] = Instance.new("LocalScript", G2L["5"]);


-- StarterGui.ScreenGui.CorgiPrison Life.Aimlock
G2L["8"] = Instance.new("TextButton", G2L["2"]);
G2L["8"]["TextWrapped"] = true;
G2L["8"]["BorderSizePixel"] = 0;
G2L["8"]["BackgroundColor3"] = Color3.fromRGB(40, 193, 196);
G2L["8"]["TextSize"] = 20;
G2L["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["8"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["8"]["Size"] = UDim2.new(0, 90, 0, 49);
G2L["8"]["Name"] = [[Aimlock]];
G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8"]["Text"] = [[Aimlock]];
G2L["8"]["Position"] = UDim2.new(0, 0, 0.12342569231987, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.Aimlock.UIStroke
G2L["9"] = Instance.new("UIStroke", G2L["8"]);
G2L["9"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.Aimlock.LocalScript
G2L["a"] = Instance.new("LocalScript", G2L["8"]);


-- StarterGui.ScreenGui.CorgiPrison Life.Noclip
G2L["b"] = Instance.new("TextButton", G2L["2"]);
G2L["b"]["TextWrapped"] = true;
G2L["b"]["BorderSizePixel"] = 0;
G2L["b"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b"]["TextSize"] = 20;
G2L["b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["b"]["TextColor3"] = Color3.fromRGB(230, 0, 0);
G2L["b"]["Size"] = UDim2.new(0, 83, 0, 49);
G2L["b"]["Name"] = [[Noclip]];
G2L["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b"]["Text"] = [[Noclip]];
G2L["b"]["Position"] = UDim2.new(0.19607843458652496, 0, 0.12342569231987, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.Noclip.UIStroke
G2L["c"] = Instance.new("UIStroke", G2L["b"]);
G2L["c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.Noclip.LocalScript
G2L["d"] = Instance.new("LocalScript", G2L["b"]);


-- StarterGui.ScreenGui.CorgiPrison Life.Fly
G2L["e"] = Instance.new("TextButton", G2L["2"]);
G2L["e"]["TextWrapped"] = true;
G2L["e"]["BorderSizePixel"] = 0;
G2L["e"]["BackgroundColor3"] = Color3.fromRGB(186, 174, 0);
G2L["e"]["TextSize"] = 20;
G2L["e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["e"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["e"]["Size"] = UDim2.new(0, 83, 0, 54);
G2L["e"]["Name"] = [[Fly]];
G2L["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["e"]["Text"] = [[Fly]];
G2L["e"]["Position"] = UDim2.new(0, 0, 0.24685138463974, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.Fly.UIStroke
G2L["f"] = Instance.new("UIStroke", G2L["e"]);
G2L["f"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.Fly.LocalScript
G2L["10"] = Instance.new("LocalScript", G2L["e"]);


-- StarterGui.ScreenGui.CorgiPrison Life.Doors
G2L["11"] = Instance.new("TextButton", G2L["2"]);
G2L["11"]["TextWrapped"] = true;
G2L["11"]["BorderSizePixel"] = 0;
G2L["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["11"]["TextSize"] = 20;
G2L["11"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["11"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["11"]["Size"] = UDim2.new(0, 90, 0, 54);
G2L["11"]["Name"] = [[Doors]];
G2L["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["11"]["Text"] = [[Destroy Doors]];
G2L["11"]["Position"] = UDim2.new(0.18082788586616516, 0, 0.24685138463974, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.Doors.UIStroke
G2L["12"] = Instance.new("UIStroke", G2L["11"]);
G2L["12"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.Doors.LocalScript
G2L["13"] = Instance.new("LocalScript", G2L["11"]);


-- StarterGui.ScreenGui.CorgiPrison Life.CrimBase
G2L["14"] = Instance.new("TextButton", G2L["2"]);
G2L["14"]["TextWrapped"] = true;
G2L["14"]["BorderSizePixel"] = 0;
G2L["14"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["14"]["TextSize"] = 20;
G2L["14"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["14"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["14"]["Size"] = UDim2.new(0, 110, 0, 51);
G2L["14"]["Name"] = [[CrimBase]];
G2L["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["14"]["Text"] = [[Criminal Base]];
G2L["14"]["Position"] = UDim2.new(0, 0, 0.38287153840065, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.CrimBase.UIStroke
G2L["15"] = Instance.new("UIStroke", G2L["14"]);
G2L["15"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.CrimBase.LocalScript
G2L["16"] = Instance.new("LocalScript", G2L["14"]);


-- StarterGui.ScreenGui.CorgiPrison Life.Yard
G2L["17"] = Instance.new("TextButton", G2L["2"]);
G2L["17"]["TextWrapped"] = true;
G2L["17"]["BorderSizePixel"] = 0;
G2L["17"]["BackgroundColor3"] = Color3.fromRGB(130, 130, 130);
G2L["17"]["TextSize"] = 20;
G2L["17"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["17"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["17"]["Size"] = UDim2.new(0, 110, 0, 51);
G2L["17"]["Name"] = [[Yard]];
G2L["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["17"]["Text"] = [[Yard]];
G2L["17"]["Position"] = UDim2.new(0, 0, 0.511335015296936, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.Yard.UIStroke
G2L["18"] = Instance.new("UIStroke", G2L["17"]);
G2L["18"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.Yard.LocalScript
G2L["19"] = Instance.new("LocalScript", G2L["17"]);


-- StarterGui.ScreenGui.CorgiPrison Life.KillAll
G2L["1a"] = Instance.new("TextButton", G2L["2"]);
G2L["1a"]["TextWrapped"] = true;
G2L["1a"]["BorderSizePixel"] = 0;
G2L["1a"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1a"]["TextSize"] = 20;
G2L["1a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1a"]["TextColor3"] = Color3.fromRGB(255, 0, 0);
G2L["1a"]["Size"] = UDim2.new(0, 80, 0, 51);
G2L["1a"]["Name"] = [[KillAll]];
G2L["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1a"]["Text"] = [[Kill All]];
G2L["1a"]["Position"] = UDim2.new(0.2396514117717743, 0, 0.511335015296936, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.KillAll.UIStroke
G2L["1b"] = Instance.new("UIStroke", G2L["1a"]);
G2L["1b"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.KillAll.LocalScript
G2L["1c"] = Instance.new("LocalScript", G2L["1a"]);


-- StarterGui.ScreenGui.CorgiPrison Life.Armory
G2L["1d"] = Instance.new("TextButton", G2L["2"]);
G2L["1d"]["TextWrapped"] = true;
G2L["1d"]["BorderSizePixel"] = 0;
G2L["1d"]["BackgroundColor3"] = Color3.fromRGB(153, 0, 0);
G2L["1d"]["TextSize"] = 20;
G2L["1d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1d"]["Size"] = UDim2.new(0, 123, 0, 51);
G2L["1d"]["Name"] = [[Armory]];
G2L["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1d"]["Text"] = [[Armory]];
G2L["1d"]["Position"] = UDim2.new(0, 0, 0.6397984623908997, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.Armory.UIStroke
G2L["1e"] = Instance.new("UIStroke", G2L["1d"]);
G2L["1e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.Armory.LocalScript
G2L["1f"] = Instance.new("LocalScript", G2L["1d"]);


-- StarterGui.ScreenGui.CorgiPrison Life.Speed
G2L["20"] = Instance.new("TextButton", G2L["2"]);
G2L["20"]["TextWrapped"] = true;
G2L["20"]["BorderSizePixel"] = 0;
G2L["20"]["BackgroundColor3"] = Color3.fromRGB(95, 95, 95);
G2L["20"]["TextSize"] = 20;
G2L["20"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["20"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["20"]["Size"] = UDim2.new(0, 110, 0, 51);
G2L["20"]["Name"] = [[Speed]];
G2L["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["20"]["Text"] = [[Sonic]];
G2L["20"]["Position"] = UDim2.new(0, 0, 0.7682619690895081, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.Speed.UIStroke
G2L["21"] = Instance.new("UIStroke", G2L["20"]);
G2L["21"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.Speed.LocalScript
G2L["22"] = Instance.new("LocalScript", G2L["20"]);


-- StarterGui.ScreenGui.CorgiPrison Life.Jump
G2L["23"] = Instance.new("TextButton", G2L["2"]);
G2L["23"]["TextWrapped"] = true;
G2L["23"]["BorderSizePixel"] = 0;
G2L["23"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["23"]["TextSize"] = 20;
G2L["23"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["23"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["23"]["Size"] = UDim2.new(0, 143, 0, 51);
G2L["23"]["Name"] = [[Jump]];
G2L["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["23"]["Text"] = [[High Jump]];
G2L["23"]["Position"] = UDim2.new(0.2396514117717743, 0, 0.7682619690895081, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.Jump.UIStroke
G2L["24"] = Instance.new("UIStroke", G2L["23"]);
G2L["24"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.Jump.LocalScript
G2L["25"] = Instance.new("LocalScript", G2L["23"]);


-- StarterGui.ScreenGui.CorgiPrison Life.Aura
G2L["26"] = Instance.new("TextButton", G2L["2"]);
G2L["26"]["TextWrapped"] = true;
G2L["26"]["BorderSizePixel"] = 0;
G2L["26"]["BackgroundColor3"] = Color3.fromRGB(0, 18, 255);
G2L["26"]["TextSize"] = 20;
G2L["26"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["26"]["TextColor3"] = Color3.fromRGB(241, 241, 241);
G2L["26"]["Size"] = UDim2.new(0, 141, 0, 49);
G2L["26"]["Name"] = [[Aura]];
G2L["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["26"]["Text"] = [[Kill Aura (K TOGGLE)]];
G2L["26"]["Position"] = UDim2.new(0.43572986125946045, 0, 0, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.Aura.UIStroke
G2L["27"] = Instance.new("UIStroke", G2L["26"]);
G2L["27"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.Aura.LocalScript
G2L["28"] = Instance.new("LocalScript", G2L["26"]);


-- StarterGui.ScreenGui.CorgiPrison Life.Serverlag
G2L["29"] = Instance.new("TextButton", G2L["2"]);
G2L["29"]["TextWrapped"] = true;
G2L["29"]["BorderSizePixel"] = 0;
G2L["29"]["BackgroundColor3"] = Color3.fromRGB(142, 142, 142);
G2L["29"]["TextSize"] = 20;
G2L["29"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["29"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["29"]["Size"] = UDim2.new(0, 118, 0, 49);
G2L["29"]["Name"] = [[Serverlag]];
G2L["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["29"]["Text"] = [[Server Killer]];
G2L["29"]["Position"] = UDim2.new(0.742919385433197, 0, 0, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.Serverlag.UIStroke
G2L["2a"] = Instance.new("UIStroke", G2L["29"]);
G2L["2a"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.Serverlag.LocalScript
G2L["2b"] = Instance.new("LocalScript", G2L["29"]);


-- StarterGui.ScreenGui.CorgiPrison Life.InfJump
G2L["2c"] = Instance.new("TextButton", G2L["2"]);
G2L["2c"]["TextWrapped"] = true;
G2L["2c"]["BorderSizePixel"] = 0;
G2L["2c"]["BackgroundColor3"] = Color3.fromRGB(0, 101, 195);
G2L["2c"]["TextSize"] = 20;
G2L["2c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["2c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2c"]["Size"] = UDim2.new(0, 106, 0, 49);
G2L["2c"]["Name"] = [[InfJump]];
G2L["2c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2c"]["Text"] = [[Inf Jump]];
G2L["2c"]["Position"] = UDim2.new(0.6209150552749634, 0, 0.12342569231987, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.InfJump.UIStroke
G2L["2d"] = Instance.new("UIStroke", G2L["2c"]);
G2L["2d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.InfJump.LocalScript
G2L["2e"] = Instance.new("LocalScript", G2L["2c"]);


-- StarterGui.ScreenGui.CorgiPrison Life.Gui
G2L["2f"] = Instance.new("LocalScript", G2L["2"]);
G2L["2f"]["Name"] = [[Gui]];

-- StarterGui.ScreenGui.CorgiPrison Life.Punch
G2L["30"] = Instance.new("TextButton", G2L["2"]);
G2L["30"]["TextWrapped"] = true;
G2L["30"]["BorderSizePixel"] = 0;
G2L["30"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["30"]["TextSize"] = 20;
G2L["30"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["30"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["30"]["Size"] = UDim2.new(0, 68, 0, 49);
G2L["30"]["Name"] = [[Punch]];
G2L["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["30"]["Text"] = [[Super Punch]];
G2L["30"]["Position"] = UDim2.new(0.8518518805503845, 0, 0.12342569231987, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.Punch.UIStroke
G2L["31"] = Instance.new("UIStroke", G2L["30"]);
G2L["31"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.Punch.LocalScript
G2L["32"] = Instance.new("LocalScript", G2L["30"]);


-- StarterGui.ScreenGui.CorgiPrison Life.FlingGui
G2L["33"] = Instance.new("TextButton", G2L["2"]);
G2L["33"]["TextWrapped"] = true;
G2L["33"]["BorderSizePixel"] = 0;
G2L["33"]["BackgroundColor3"] = Color3.fromRGB(192, 195, 0);
G2L["33"]["TextSize"] = 20;
G2L["33"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["33"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["33"]["Size"] = UDim2.new(0, 174, 0, 53);
G2L["33"]["Name"] = [[FlingGui]];
G2L["33"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["33"]["Text"] = [[FE Fling Gui]];
G2L["33"]["Position"] = UDim2.new(0.6209150552749634, 0, 0.24685138463974, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.FlingGui.UIStroke
G2L["34"] = Instance.new("UIStroke", G2L["33"]);
G2L["34"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.FlingGui.LocalScript
G2L["35"] = Instance.new("LocalScript", G2L["33"]);


-- StarterGui.ScreenGui.CorgiPrison Life.Inmate
G2L["36"] = Instance.new("TextButton", G2L["2"]);
G2L["36"]["TextWrapped"] = true;
G2L["36"]["BorderSizePixel"] = 0;
G2L["36"]["BackgroundColor3"] = Color3.fromRGB(149, 149, 149);
G2L["36"]["TextSize"] = 20;
G2L["36"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["36"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["36"]["Size"] = UDim2.new(0, 105, 0, 51);
G2L["36"]["Name"] = [[Inmate]];
G2L["36"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["36"]["Text"] = [[Become Inmate]];
G2L["36"]["Position"] = UDim2.new(0.413943350315094, 0, 0.38287153840065, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.Inmate.UIStroke
G2L["37"] = Instance.new("UIStroke", G2L["36"]);
G2L["37"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.Inmate.LocalScript
G2L["38"] = Instance.new("LocalScript", G2L["36"]);


-- StarterGui.ScreenGui.CorgiPrison Life.Neutral
G2L["39"] = Instance.new("TextButton", G2L["2"]);
G2L["39"]["TextWrapped"] = true;
G2L["39"]["BorderSizePixel"] = 0;
G2L["39"]["BackgroundColor3"] = Color3.fromRGB(131, 0, 0);
G2L["39"]["TextSize"] = 20;
G2L["39"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["39"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["39"]["Size"] = UDim2.new(0, 95, 0, 51);
G2L["39"]["Name"] = [[Neutral]];
G2L["39"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["39"]["Text"] = [[Neutral Spawn]];
G2L["39"]["Position"] = UDim2.new(0.7930282950401306, 0, 0.38287153840065, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.Neutral.UIStroke
G2L["3a"] = Instance.new("UIStroke", G2L["39"]);
G2L["3a"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.Neutral.LocalScript
G2L["3b"] = Instance.new("LocalScript", G2L["39"]);


-- StarterGui.ScreenGui.CorgiPrison Life.Gates
G2L["3c"] = Instance.new("TextButton", G2L["2"]);
G2L["3c"]["TextWrapped"] = true;
G2L["3c"]["BorderSizePixel"] = 0;
G2L["3c"]["BackgroundColor3"] = Color3.fromRGB(160, 155, 0);
G2L["3c"]["TextSize"] = 20;
G2L["3c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3c"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3c"]["Size"] = UDim2.new(0, 95, 0, 51);
G2L["3c"]["Name"] = [[Gates]];
G2L["3c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3c"]["Text"] = [[Destroy Gates]];
G2L["3c"]["Position"] = UDim2.new(0.413943350315094, 0, 0.511335015296936, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.Gates.UIStroke
G2L["3d"] = Instance.new("UIStroke", G2L["3c"]);
G2L["3d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.Gates.LocalScript
G2L["3e"] = Instance.new("LocalScript", G2L["3c"]);


-- StarterGui.ScreenGui.CorgiPrison Life.MapKiller
G2L["3f"] = Instance.new("TextButton", G2L["2"]);
G2L["3f"]["TextWrapped"] = true;
G2L["3f"]["BorderSizePixel"] = 0;
G2L["3f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3f"]["TextSize"] = 20;
G2L["3f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3f"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3f"]["Size"] = UDim2.new(0, 81, 0, 51);
G2L["3f"]["Name"] = [[MapKiller]];
G2L["3f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3f"]["Text"] = [[Map Killer]];
G2L["3f"]["Position"] = UDim2.new(0.413943350315094, 0, 0.6397984623908997, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.MapKiller.UIStroke
G2L["40"] = Instance.new("UIStroke", G2L["3f"]);
G2L["40"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.MapKiller.LocalScript
G2L["41"] = Instance.new("LocalScript", G2L["3f"]);


-- StarterGui.ScreenGui.CorgiPrison Life.Cafe
G2L["42"] = Instance.new("TextButton", G2L["2"]);
G2L["42"]["TextWrapped"] = true;
G2L["42"]["BorderSizePixel"] = 0;
G2L["42"]["BackgroundColor3"] = Color3.fromRGB(0, 196, 255);
G2L["42"]["TextSize"] = 20;
G2L["42"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["42"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["42"]["Size"] = UDim2.new(0, 98, 0, 51);
G2L["42"]["Name"] = [[Cafe]];
G2L["42"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["42"]["Text"] = [[Cafe]];
G2L["42"]["Position"] = UDim2.new(0.6209150552749634, 0, 0.5113350749015808, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.Cafe.UIStroke
G2L["43"] = Instance.new("UIStroke", G2L["42"]);
G2L["43"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.Cafe.LocalScript
G2L["44"] = Instance.new("LocalScript", G2L["42"]);


-- StarterGui.ScreenGui.CorgiPrison Life.Cell
G2L["45"] = Instance.new("TextButton", G2L["2"]);
G2L["45"]["TextWrapped"] = true;
G2L["45"]["BorderSizePixel"] = 0;
G2L["45"]["BackgroundColor3"] = Color3.fromRGB(126, 126, 126);
G2L["45"]["TextSize"] = 20;
G2L["45"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["45"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["45"]["Size"] = UDim2.new(0, 124, 0, 51);
G2L["45"]["Name"] = [[Cell]];
G2L["45"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["45"]["Text"] = [[Prison Cell]];
G2L["45"]["Position"] = UDim2.new(0.7298474907875061, 0, 0.7682619690895081, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.Cell.UIStroke
G2L["46"] = Instance.new("UIStroke", G2L["45"]);
G2L["46"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.Cell.LocalScript
G2L["47"] = Instance.new("LocalScript", G2L["45"]);


-- StarterGui.ScreenGui.CorgiPrison Life.Prison
G2L["48"] = Instance.new("TextButton", G2L["2"]);
G2L["48"]["TextWrapped"] = true;
G2L["48"]["BorderSizePixel"] = 0;
G2L["48"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["48"]["TextSize"] = 20;
G2L["48"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["48"]["TextColor3"] = Color3.fromRGB(255, 0, 0);
G2L["48"]["Size"] = UDim2.new(0, 95, 0, 51);
G2L["48"]["Name"] = [[Prison]];
G2L["48"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["48"]["Text"] = [[Prison]];
G2L["48"]["Position"] = UDim2.new(0.7930282950401306, 0, 0.6397984623908997, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.Prison.UIStroke
G2L["49"] = Instance.new("UIStroke", G2L["48"]);
G2L["49"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.Prison.LocalScript
G2L["4a"] = Instance.new("LocalScript", G2L["48"]);


-- StarterGui.ScreenGui.CorgiPrison Life.BTools
G2L["4b"] = Instance.new("TextButton", G2L["2"]);
G2L["4b"]["TextWrapped"] = true;
G2L["4b"]["BorderSizePixel"] = 0;
G2L["4b"]["BackgroundColor3"] = Color3.fromRGB(45, 45, 45);
G2L["4b"]["TextSize"] = 20;
G2L["4b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4b"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4b"]["Size"] = UDim2.new(0, 93, 0, 51);
G2L["4b"]["Name"] = [[BTools]];
G2L["4b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4b"]["Text"] = [[BTools]];
G2L["4b"]["Position"] = UDim2.new(0.5904139280319214, 0, 0.6397984623908997, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.BTools.UIStroke
G2L["4c"] = Instance.new("UIStroke", G2L["4b"]);
G2L["4c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.BTools.LocalScript
G2L["4d"] = Instance.new("LocalScript", G2L["4b"]);


-- StarterGui.ScreenGui.CorgiPrison Life.Cat
G2L["4e"] = Instance.new("TextButton", G2L["2"]);
G2L["4e"]["TextWrapped"] = true;
G2L["4e"]["BorderSizePixel"] = 0;
G2L["4e"]["BackgroundColor3"] = Color3.fromRGB(0, 105, 153);
G2L["4e"]["TextSize"] = 20;
G2L["4e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4e"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4e"]["Size"] = UDim2.new(0, 67, 0, 51);
G2L["4e"]["Name"] = [[Cat]];
G2L["4e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4e"]["Text"] = [[2006 ROBLOX]];
G2L["4e"]["Position"] = UDim2.new(0.2679738700389862, 0, 0.6397984623908997, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.Cat.UIStroke
G2L["4f"] = Instance.new("UIStroke", G2L["4e"]);
G2L["4f"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.Cat.LocalScript
G2L["50"] = Instance.new("LocalScript", G2L["4e"]);


-- StarterGui.ScreenGui.CorgiPrison Life.WeaponGet
G2L["51"] = Instance.new("TextButton", G2L["2"]);
G2L["51"]["TextWrapped"] = true;
G2L["51"]["BorderSizePixel"] = 0;
G2L["51"]["BackgroundColor3"] = Color3.fromRGB(0, 131, 122);
G2L["51"]["TextSize"] = 20;
G2L["51"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["51"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["51"]["Size"] = UDim2.new(0, 82, 0, 51);
G2L["51"]["Name"] = [[WeaponGet]];
G2L["51"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["51"]["Text"] = [[Get Weapons]];
G2L["51"]["Position"] = UDim2.new(0.5511982440948486, 0, 0.7682619690895081, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.WeaponGet.UIStroke
G2L["52"] = Instance.new("UIStroke", G2L["51"]);
G2L["52"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.WeaponGet.LocalScript
G2L["53"] = Instance.new("LocalScript", G2L["51"]);


-- StarterGui.ScreenGui.CorgiPrison Life.CrimBase
G2L["54"] = Instance.new("TextButton", G2L["2"]);
G2L["54"]["TextWrapped"] = true;
G2L["54"]["BorderSizePixel"] = 0;
G2L["54"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["54"]["TextSize"] = 20;
G2L["54"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["54"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["54"]["Size"] = UDim2.new(0, 80, 0, 51);
G2L["54"]["Name"] = [[CrimBase]];
G2L["54"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["54"]["Text"] = [[ShutDown Server]];
G2L["54"]["Position"] = UDim2.new(0.2396514117717743, 0, 0.38287153840065, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.CrimBase.UIStroke
G2L["55"] = Instance.new("UIStroke", G2L["54"]);
G2L["55"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.CrimBase.LocalScript
G2L["56"] = Instance.new("LocalScript", G2L["54"]);


-- StarterGui.ScreenGui.CorgiPrison Life.Inmate
G2L["57"] = Instance.new("TextButton", G2L["2"]);
G2L["57"]["TextWrapped"] = true;
G2L["57"]["BorderSizePixel"] = 0;
G2L["57"]["BackgroundColor3"] = Color3.fromRGB(149, 149, 149);
G2L["57"]["TextSize"] = 20;
G2L["57"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["57"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["57"]["Size"] = UDim2.new(0, 69, 0, 51);
G2L["57"]["Name"] = [[Inmate]];
G2L["57"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["57"]["Text"] = [[FE Sword]];
G2L["57"]["Position"] = UDim2.new(0.6427015066146851, 0, 0.38287153840065, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.Inmate.UIStroke
G2L["58"] = Instance.new("UIStroke", G2L["57"]);
G2L["58"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.Inmate.LocalScript
G2L["59"] = Instance.new("LocalScript", G2L["57"]);


-- StarterGui.ScreenGui.CorgiPrison Life.Cafe
G2L["5a"] = Instance.new("TextButton", G2L["2"]);
G2L["5a"]["TextWrapped"] = true;
G2L["5a"]["BorderSizePixel"] = 0;
G2L["5a"]["TextScaled"] = true;
G2L["5a"]["BackgroundColor3"] = Color3.fromRGB(90, 90, 90);
G2L["5a"]["TextSize"] = 20;
G2L["5a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5a"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5a"]["Size"] = UDim2.new(0, 77, 0, 51);
G2L["5a"]["Name"] = [[Cafe]];
G2L["5a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5a"]["Text"] = [[Energy Scythe (NOT FINISHED)]];
G2L["5a"]["Position"] = UDim2.new(0.8344226479530334, 0, 0.5113350749015808, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.Cafe.UIStroke
G2L["5b"] = Instance.new("UIStroke", G2L["5a"]);
G2L["5b"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.Cafe.LocalScript
G2L["5c"] = Instance.new("LocalScript", G2L["5a"]);


-- StarterGui.ScreenGui.CorgiPrison Life.ESP
G2L["5d"] = Instance.new("TextButton", G2L["2"]);
G2L["5d"]["TextWrapped"] = true;
G2L["5d"]["BorderSizePixel"] = 0;
G2L["5d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5d"]["TextSize"] = 20;
G2L["5d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5d"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5d"]["Size"] = UDim2.new(0, 90, 0, 49);
G2L["5d"]["Name"] = [[ESP]];
G2L["5d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5d"]["Text"] = [[Invisible (E TOGGLE)]];
G2L["5d"]["Position"] = UDim2.new(0.2396514117717743, 0, 0, 0);

-- StarterGui.ScreenGui.CorgiPrison Life.ESP.UIStroke
G2L["5e"] = Instance.new("UIStroke", G2L["5d"]);
G2L["5e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.ScreenGui.CorgiPrison Life.ESP.LocalScript
G2L["5f"] = Instance.new("LocalScript", G2L["5d"]);


-- StarterGui.ScreenGui.CorgiPrison Life.OnExecuted
G2L["60"] = Instance.new("LocalScript", G2L["2"]);
G2L["60"]["Name"] = [[OnExecuted]];

-- StarterGui.ScreenGui.Open/Close
G2L["61"] = Instance.new("TextButton", G2L["1"]);
G2L["61"]["TextWrapped"] = true;
G2L["61"]["BorderSizePixel"] = 0;
G2L["61"]["TextScaled"] = true;
G2L["61"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["61"]["TextSize"] = 14;
G2L["61"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["61"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["61"]["Size"] = UDim2.new(0, 132, 0, 43);
G2L["61"]["Name"] = [[Open/Close]];
G2L["61"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["61"]["Text"] = [[Open/Close Gui]];
G2L["61"]["Position"] = UDim2.new(0.8544652462005615, 0, 0.7755101919174194, 0);

-- StarterGui.ScreenGui.Open/Close.UICorner
G2L["62"] = Instance.new("UICorner", G2L["61"]);


-- StarterGui.ScreenGui.Open/Close.LocalScript
G2L["63"] = Instance.new("LocalScript", G2L["61"]);


-- StarterGui.ScreenGui.CorgiPrison Life.ESP.LocalScript
local function C_7()
local script = G2L["7"];
	script.Parent.MouseButton1Click:Connect(function()
	local esp_settings = { 
		textsize = 8,
		colour = 255,255,255
	}
	
	local gui = Instance.new("BillboardGui")
	local esp = Instance.new("TextLabel",gui)
	
	
	
	gui.Name = "Cracked esp";
	gui.ResetOnSpawn = false
	gui.AlwaysOnTop = true;
	gui.LightInfluence = 0;
	gui.Size = UDim2.new(1.75, 0, 1.75, 0);
	esp.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	esp.Text = ""
	esp.Size = UDim2.new(0.0001, 0.00001, 0.0001, 0.00001);
	esp.BorderSizePixel = 4;
	esp.BorderColor3 = Color3.new(esp_settings.colour)
	esp.BorderSizePixel = 0
	esp.Font = "GothamSemibold"
	esp.TextSize = esp_settings.textsize
	esp.TextColor3 = Color3.fromRGB(esp_settings.colour) -- text colour
	
	game:GetService("RunService").RenderStepped:Connect(function()
		for i,v in pairs (game:GetService("Players"):GetPlayers()) do
			if v ~= game:GetService("Players").LocalPlayer and v.Character.Head:FindFirstChild("Cracked esp")==nil  then
				esp.Text = "{"..v.Name.."}"
				gui:Clone().Parent = v.Character.Head
			end
		end
		end)
		end)
end;
task.spawn(C_7);
-- StarterGui.ScreenGui.CorgiPrison Life.Aimlock.LocalScript
local function C_a()
local script = G2L["a"];
	script.Parent.MouseButton1Click:Connect(function()
	--FE Simple AimLock Script | Released Nov 2021 | Working.
	local Area = game:GetService("Workspace")
	local RunService = game:GetService("RunService")
	local UIS = game:GetService("UserInputService")
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local MyCharacter = LocalPlayer.Character
	local MyRoot = MyCharacter:FindFirstChild("HumanoidRootPart")
	local MyHumanoid = MyCharacter:FindFirstChild("Humanoid")
	local Mouse = LocalPlayer:GetMouse()
	local MyView = Area.CurrentCamera
	local MyTeamColor = LocalPlayer.TeamColor
	local HoldingM2 = false
	local Active = false
	local Lock = false
	local Epitaph = .187 ---Note: The Bigger The Number, The More Prediction.
	local HeadOffset = Vector3.new(0, .1, 0)
	
	_G.TeamCheck = false
	_G.AimPart = "HumanoidRootPart"
	_G.Sensitivity = 0
	_G.CircleSides = 64
	_G.CircleColor = Color3.fromRGB(255, 0, 130)
	_G.CircleTransparency = 0
	_G.CircleRadius = 200
	_G.CircleFilled = false
	_G.CircleVisible = true
	_G.CircleThickness = 1
	
	local FOVCircle = Drawing.new("Circle")
	FOVCircle.Position = Vector2.new(MyView.ViewportSize.X / 2, MyView.ViewportSize.Y / 2)
	FOVCircle.Radius = _G.CircleRadius
	FOVCircle.Filled = _G.CircleFilled
	FOVCircle.Color = _G.CircleColor
	FOVCircle.Visible = _G.CircleVisible
	FOVCircle.Transparency = _G.CircleTransparency
	FOVCircle.NumSides = _G.CircleSides
	FOVCircle.Thickness = _G.CircleThickness
	
	local function CursorLock()
		UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
	end
	local function UnLockCursor()
		HoldingM2 = false Active = false Lock = false 
		UIS.MouseBehavior = Enum.MouseBehavior.Default
	end
	function FindNearestPlayer()
		local dist = math.huge
		local Target = nil
		for _, v in pairs(Players:GetPlayers()) do
			if v ~= LocalPlayer and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("Humanoid").Health > 0 and v.Character:FindFirstChild("HumanoidRootPart") and v then
				local TheirCharacter = v.Character
				local CharacterRoot, Visible = MyView:WorldToViewportPoint(TheirCharacter[_G.AimPart].Position)
				if Visible then
					local RealMag = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(CharacterRoot.X, CharacterRoot.Y)).Magnitude
					if RealMag < dist and RealMag < FOVCircle.Radius then
						dist = RealMag
						Target = TheirCharacter
					end
				end
			end
		end
		return Target
	end
	
	UIS.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton2 then
			HoldingM2 = true
			Active = true
			Lock = true
			if Active then
				local The_Enemy = FindNearestPlayer()
				while HoldingM2 do task.wait(.000001)
					if Lock and The_Enemy ~= nil then
						local Future = The_Enemy.HumanoidRootPart.CFrame + (The_Enemy.HumanoidRootPart.Velocity * Epitaph + HeadOffset)
						MyView.CFrame = CFrame.lookAt(MyView.CFrame.Position, Future.Position)
						CursorLock()
					end
				end
			end
		end
	end)
	UIS.InputEnded:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton2 then
			UnLockCursor()
		end
	end)
		game.StarterGui:SetCore("SendNotification", {Title = "Working.", Text = "Success, Script Loaded.", Duration = 4,})
		end)
end;
task.spawn(C_a);
-- StarterGui.ScreenGui.CorgiPrison Life.Noclip.LocalScript
local function C_d()
local script = G2L["d"];
	local Workspace = game:GetService("Workspace")
	local CoreGui = game:GetService("CoreGui")
	local Players = game:GetService("Players")
	local UserInputService = game:GetService("UserInputService")
	local Plr = Players.LocalPlayer
	local Clipon = false
	local Dragging = false
	local Offset = Vector2.new(0, 0)
	
	local function ToggleNoclip(enabled)
		Clipon = enabled
		if enabled then
			for a, b in pairs(Workspace:GetChildren()) do
				if b.Name == Plr.Name then
					for i, v in pairs(b:GetDescendants()) do
						if v:IsA("BasePart") then
							v.CanCollide = false
						end
					end
				end
			end
		else
			for a, b in pairs(Workspace:GetChildren()) do
				if b.Name == Plr.Name then
					for i, v in pairs(b:GetDescendants()) do
						if v:IsA("BasePart") then
							v.CanCollide = true
						end
					end
				end
			end
		end
	end
	
	script.Parent.MouseButton1Click:Connect(function()
		ToggleNoclip(true)
	end)
	
	
	
	ToggleNoclip(false) -- Noclip
end;
task.spawn(C_d);
-- StarterGui.ScreenGui.CorgiPrison Life.Fly.LocalScript
local function C_10()
local script = G2L["10"];
	script.Parent.MouseButton1Click:Connect(function()
	local FlyGui = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local TextButton = Instance.new("TextButton")
	local TextLabel = Instance.new("TextLabel")
	
	--Properties:
	
	FlyGui.Name = "FlyGui"
	FlyGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	
	Frame.Parent = FlyGui
	Frame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.0685602352, 0, 0.168769717, 0)
	Frame.Size = UDim2.new(0.264544547, 0, 0.100000024, 0)
	
	TextButton.Parent = Frame
	TextButton.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
	TextButton.BorderSizePixel = 0
	TextButton.Position = UDim2.new(0.06324628, 0, 0.400667697, 0)
	TextButton.Size = UDim2.new(0.871157169, 0, 0.495614201, 0)
	TextButton.Font = Enum.Font.ArialBold
	TextButton.Text = "Fly"
	TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton.TextScaled = true
	TextButton.TextSize = 14.000
	TextButton.TextStrokeTransparency = 0.000
	TextButton.TextWrapped = true
	
	TextLabel.Parent = Frame
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.Size = UDim2.new(0, 86, 0, 24)
	TextLabel.Font = Enum.Font.Oswald
	TextLabel.Text = "Made by 7alexv7"
	TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 14.000
	TextLabel.TextWrapped = true
	
	-- Scripts:
	
	local function NQWSTGE_fake_script() -- Frame.Fly 
		local script = Instance.new('LocalScript', Frame)
	
		local plr = script.Parent.Parent.Parent.Parent
		repeat wait() until plr and plr.Character and plr.Character:findFirstChild("HumanoidRootPart") and plr.Character:findFirstChild("Humanoid") 
		local mouse = game.Players.LocalPlayer:GetMouse()  
		repeat wait() until mouse
	
		local torso = plr.Character.HumanoidRootPart 
		local flying = false
		local deb = true 
		local ctrl = {f = 0, b = 0, l = 0, r = 0} 
		local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
		local maxspeed = 1000 
		local speed = 50
		function Fly() 
			local bg = Instance.new("BodyGyro", torso) 
			bg.P = 9e4 
			bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
			bg.cframe = torso.CFrame 
			local bv = Instance.new("BodyVelocity", torso) 
			bv.velocity = Vector3.new(0,0.1,0) 
			bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
			repeat wait() 
				plr.Character.Humanoid.PlatformStand = true 
				if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then 
					speed = speed+.5+(speed/maxspeed) 
					if speed > maxspeed then 
						speed = maxspeed 
					end 
				elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then 
					speed = speed-1 
					if speed < 0 then 
						speed = 0
					else
						speed = 50
					end 
				end 
				if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then 
					bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
					lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
				elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
					bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
				else 
					bv.velocity = Vector3.new(0,0.1,0) 
				end 
				bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
			until not flying 
			ctrl = {f = 0, b = 0, l = 0, r = 0} 
			lastctrl = {f = 0, b = 0, l = 0, r = 0} 
	
			bg:Destroy() 
			bv:Destroy() 
			plr.Character.Humanoid.PlatformStand = false 
			speed = 50
		end 
	
		mouse.KeyDown:connect(function(key) 
			if key:lower() == "e" then 
				if flying then flying = false 
					speed = 50
				else 
					flying = true 
					Fly()
	
				end 
			elseif key:lower() == "w" then 
				ctrl.f = 1 
			elseif key:lower() == "s" then 
				ctrl.b = -1 
			elseif key:lower() == "a" then 
				ctrl.l = -1 
			elseif key:lower() == "d" then 
				ctrl.r = 1 
			end 
		end) 
		mouse.KeyUp:connect(function(key) 
			if key:lower() == "w" then 
				ctrl.f = 0 
			elseif key:lower() == "s" then 
				ctrl.b = 0 
			elseif key:lower() == "a" then 
				ctrl.l = 0 
			elseif key:lower() == "d" then 
				ctrl.r = 0 
			end 
		end)
	
		plr.Character.Humanoid.StateChanged:Connect(function(o,n)
			if n == Enum.HumanoidStateType.Running then
				ctrl.f = 1
			else
				ctrl.f = 0
			end
	
		end)
		script.Parent.TextButton.MouseButton1Click:Connect(function()
			if flying then
				flying = false
				speed = 50
			else
				flying = true
				Fly()
			end
		end)
	
	end
	coroutine.wrap(NQWSTGE_fake_script)()
	local function RAQA_fake_script() -- Frame.Buttons 
		local script = Instance.new('LocalScript', Frame)
	
		local Trigger = script.Parent.MiniTrext
		local IsMini = false
		function CreateTween(Instance,Style,Direction,Time,table,RepeatCount,CanRepeat,Delay)
			local ts = game:GetService("TweenService")
			local TweenInfo = TweenInfo.new(Time,Style,Direction,RepeatCount,CanRepeat,Delay)
			local Tween = ts:Create(Instance,TweenInfo,table)
			repeat wait() until Tween ~= nil
			return Tween
	
		end
		Trigger.MouseButton1Click:Connect(function()
			if IsMini then
				CreateTween(script.Parent,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0.5,{Size = UDim2.new(0.265, 0,0.1, 0)},0,false,0.1):Play()
				IsMini = false
				Trigger.Text = "-"
			else
				CreateTween(script.Parent,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0.5,{Size = UDim2.new(0.265, 0,0.042, 0)},0,false,0.1):Play()
				IsMini = true
				Trigger.Text = "+"
			end
		end)
		script.Parent.Delete.MouseButton1Click:Connect(function()
			script.Parent.Parent:Destroy()
		end)
	end
	coroutine.wrap(RAQA_fake_script)()
	local function TKVUMP_fake_script() -- Frame.Drag Gui 
		local script = Instance.new('LocalScript', Frame)
	
		local UserInputService = game:GetService("UserInputService")
	
		local gui = script.Parent
	
		local dragging
		local dragInput
		local dragStart
		local startPos
	
		local function update(input)
			local delta = input.Position - dragStart
			gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
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
		coroutine.wrap(TKVUMP_fake_script)()
		end)
end;
task.spawn(C_10);
-- StarterGui.ScreenGui.CorgiPrison Life.Doors.LocalScript
local function C_13()
local script = G2L["13"];
	script.Parent.MouseButton1Click:Connect(function()
	game.Workspace.Doors:Destroy()
		end)
end;
task.spawn(C_13);
-- StarterGui.ScreenGui.CorgiPrison Life.CrimBase.LocalScript
local function C_16()
local script = G2L["16"];
	script.Parent.MouseButton1Click:Connect(function()
		local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
		local location = CFrame.new(-975.896118, 110.223793, 2070.50464, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		local humanoid = game.Players.LocalPlayer.Character.Humanoid
		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		wait(0.1)
		pl.CFrame = location
	end)
end;
task.spawn(C_16);
-- StarterGui.ScreenGui.CorgiPrison Life.Yard.LocalScript
local function C_19()
local script = G2L["19"];
	script.Parent.MouseButton1Click:Connect(function()
		local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
		local location = CFrame.new(736.4671630859375, 97.99992370605469, 2517.583740234375)
		local humanoid = game.Players.LocalPlayer.Character.Humanoid
		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		wait(0.1)
		pl.CFrame = location
	end)
end;
task.spawn(C_19);
-- StarterGui.ScreenGui.CorgiPrison Life.KillAll.LocalScript
local function C_1c()
local script = G2L["1c"];
	script.Parent.MouseButton1Click:Connect(function()
	local Targets = {"All"} -- "All", "Target Name", "arian_was_here"
	
	local Players = game:GetService("Players")
	local Player = Players.LocalPlayer
	
	local AllBool = false
	
	local GetPlayer = function(Name)
		Name = Name:lower()
		if Name == "all" or Name == "others" then
			AllBool = true
			return
		elseif Name == "random" then
			local GetPlayers = Players:GetPlayers()
			if table.find(GetPlayers,Player) then table.remove(GetPlayers,table.find(GetPlayers,Player)) end
			return GetPlayers[math.random(#GetPlayers)]
		elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
			for _,x in next, Players:GetPlayers() do
				if x ~= Player then
					if x.Name:lower():match("^"..Name) then
						return x;
					elseif x.DisplayName:lower():match("^"..Name) then
						return x;
					end
				end
			end
		else
			return
		end
	end
	
	local Message = function(_Title, _Text, Time)
		game:GetService("StarterGui"):SetCore("SendNotification", {Title = _Title, Text = _Text, Duration = Time})
	end
	
	local SkidFling = function(TargetPlayer)
		local Character = Player.Character
		local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
		local RootPart = Humanoid and Humanoid.RootPart
	
		local TCharacter = TargetPlayer.Character
		local THumanoid
		local TRootPart
		local THead
		local Accessory
		local Handle
	
		if TCharacter:FindFirstChildOfClass("Humanoid") then
			THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
		end
		if THumanoid and THumanoid.RootPart then
			TRootPart = THumanoid.RootPart
		end
		if TCharacter:FindFirstChild("Head") then
			THead = TCharacter.Head
		end
		if TCharacter:FindFirstChildOfClass("Accessory") then
			Accessory = TCharacter:FindFirstChildOfClass("Accessory")
		end
		if Accessoy and Accessory:FindFirstChild("Handle") then
			Handle = Accessory.Handle
		end
	
		if Character and Humanoid and RootPart then
			if RootPart.Velocity.Magnitude < 50 then
				getgenv().OldPos = RootPart.CFrame
			end
			if THumanoid and THumanoid.Sit and not AllBool then
				return Message("Error Occurred", "Targeting is sitting", 5) -- u can remove dis part if u want lol
			end
			if THead then
				workspace.CurrentCamera.CameraSubject = THead
			elseif not THead and Handle then
				workspace.CurrentCamera.CameraSubject = Handle
			elseif THumanoid and TRootPart then
				workspace.CurrentCamera.CameraSubject = THumanoid
			end
			if not TCharacter:FindFirstChildWhichIsA("BasePart") then
				return
			end
	
			local FPos = function(BasePart, Pos, Ang)
				RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
				Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
				RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
				RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
			end
	
			local SFBasePart = function(BasePart)
				local TimeToWait = 2
				local Time = tick()
				local Angle = 0
	
				repeat
					if RootPart and THumanoid then
						if BasePart.Velocity.Magnitude < 50 then
							Angle = Angle + 100
	
							FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
							task.wait()
	
							FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
							task.wait()
	
							FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
							task.wait()
	
							FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
							task.wait()
	
							FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
							task.wait()
	
							FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
							task.wait()
						else
							FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
	
							FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
							task.wait()
	
							FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
	
							FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
	
							FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
							task.wait()
	
							FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
	
							FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
	
							FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
							task.wait()
	
							FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
							task.wait()
	
							FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
							task.wait()
						end
					else
						break
					end
				until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
			end
	
			workspace.FallenPartsDestroyHeight = 0/0
	
			local BV = Instance.new("BodyVelocity")
			BV.Name = "EpixVel"
			BV.Parent = RootPart
			BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
			BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
	
			Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
	
			if TRootPart and THead then
				if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
					SFBasePart(THead)
				else
					SFBasePart(TRootPart)
				end
			elseif TRootPart and not THead then
				SFBasePart(TRootPart)
			elseif not TRootPart and THead then
				SFBasePart(THead)
			elseif not TRootPart and not THead and Accessory and Handle then
				SFBasePart(Handle)
			else
				return Message("Error Occurred", "Target is missing everything", 5)
			end
	
			BV:Destroy()
			Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
			workspace.CurrentCamera.CameraSubject = Humanoid
	
			repeat
				RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
				Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
				Humanoid:ChangeState("GettingUp")
				table.foreach(Character:GetChildren(), function(_, x)
					if x:IsA("BasePart") then
						x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
					end
				end)
				task.wait()
			until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
			workspace.FallenPartsDestroyHeight = getgenv().FPDH
		else
			return Message("Error Occurred", "Random error", 5)
		end
	end
	
	if not Welcome then Message("Script by AnthonyIsntHere", "Enjoy!", 5) end
	getgenv().Welcome = true
	if Targets[1] then for _,x in next, Targets do GetPlayer(x) end else return end
	
	if AllBool then
		for _,x in next, Players:GetPlayers() do
			SkidFling(x)
		end
	end
	
	for _,x in next, Targets do
		if GetPlayer(x) and GetPlayer(x) ~= Player then
			if GetPlayer(x).UserId ~= 1414978355 then
				local TPlayer = GetPlayer(x)
				if TPlayer then
					SkidFling(TPlayer)
				end
			else
				Message("Error Occurred", "This user is whitelisted! (Owner)", 5)
			end
		elseif not GetPlayer(x) and not AllBool then
			Message("Error Occurred", "Username Invalid", 5)
		end
	end
	end)
end;
task.spawn(C_1c);
-- StarterGui.ScreenGui.CorgiPrison Life.Armory.LocalScript
local function C_1f()
local script = G2L["1f"];
	script.Parent.MouseButton1Click:Connect(function()
		local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
		local location = CFrame.new(837.2889404296875, 99.98998260498047, 2270.99658203125)
		local humanoid = game.Players.LocalPlayer.Character.Humanoid
		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		wait(0.1)
		pl.CFrame = location
	end)
end;
task.spawn(C_1f);
-- StarterGui.ScreenGui.CorgiPrison Life.Speed.LocalScript
local function C_22()
local script = G2L["22"];
	script.Parent.MouseButton1Click:Connect(function()
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 60
	end)
end;
task.spawn(C_22);
-- StarterGui.ScreenGui.CorgiPrison Life.Jump.LocalScript
local function C_25()
local script = G2L["25"];
	script.Parent.MouseButton1Click:Connect(function()
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = 150
	end)
end;
task.spawn(C_25);
-- StarterGui.ScreenGui.CorgiPrison Life.Aura.LocalScript
local function C_28()
local script = G2L["28"];
	script.Parent.MouseButton1Click:Connect(function()
		mainRemotes = game.ReplicatedStorage
		meleeRemote = mainRemotes['meleeEvent']
	
		killAura = true
	
		contextactionservice = game.ContextActionService
	
		function toggleKillAura(actionName, inputState, inputObject)
			print('Doing the action : ' .. actionName)
			if inputState == Enum.UserInputState.Begin then
				if killAura == true then
					killAura = false
				else
					killAura = true
				end
			end
		end
	
		contextactionservice:BindAction('ToggleKillAura', toggleKillAura, false, Enum.KeyCode.K)
	
		while wait() do
			if killAura == true then
				for _, plr in pairs (game:GetService('Players'):GetChildren()) do
					if plr.Name ~= game.Players.LocalPlayer.Name then
						meleeRemote:FireServer(plr)
					end
				end
			end
		end
		end)
end;
task.spawn(C_28);
-- StarterGui.ScreenGui.CorgiPrison Life.Serverlag.LocalScript
local function C_2b()
local script = G2L["2b"];
	script.Parent.MouseButton1Click:Connect(function()
		while true do
			wait(0.1)
	local Targets = {"All"} -- "All", "Target Name", "arian_was_here"
	
	local Players = game:GetService("Players")
	local Player = Players.LocalPlayer
	
	local AllBool = false
	
	local GetPlayer = function(Name)
		Name = Name:lower()
		if Name == "all" or Name == "others" then
			AllBool = true
			return
		elseif Name == "random" then
			local GetPlayers = Players:GetPlayers()
			if table.find(GetPlayers,Player) then table.remove(GetPlayers,table.find(GetPlayers,Player)) end
			return GetPlayers[math.random(#GetPlayers)]
		elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
			for _,x in next, Players:GetPlayers() do
				if x ~= Player then
					if x.Name:lower():match("^"..Name) then
						return x;
					elseif x.DisplayName:lower():match("^"..Name) then
						return x;
					end
				end
			end
		else
			return
		end
	end
	
	local Message = function(_Title, _Text, Time)
		game:GetService("StarterGui"):SetCore("SendNotification", {Title = _Title, Text = _Text, Duration = Time})
	end
	
	local SkidFling = function(TargetPlayer)
		local Character = Player.Character
		local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
		local RootPart = Humanoid and Humanoid.RootPart
	
		local TCharacter = TargetPlayer.Character
		local THumanoid
		local TRootPart
		local THead
		local Accessory
		local Handle
	
		if TCharacter:FindFirstChildOfClass("Humanoid") then
			THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
		end
		if THumanoid and THumanoid.RootPart then
			TRootPart = THumanoid.RootPart
		end
		if TCharacter:FindFirstChild("Head") then
			THead = TCharacter.Head
		end
		if TCharacter:FindFirstChildOfClass("Accessory") then
			Accessory = TCharacter:FindFirstChildOfClass("Accessory")
		end
		if Accessoy and Accessory:FindFirstChild("Handle") then
			Handle = Accessory.Handle
		end
	
		if Character and Humanoid and RootPart then
			if RootPart.Velocity.Magnitude < 50 then
				getgenv().OldPos = RootPart.CFrame
			end
			if THumanoid and THumanoid.Sit and not AllBool then
				return Message("Error Occurred", "Targeting is sitting", 5) -- u can remove dis part if u want lol
			end
			if THead then
				workspace.CurrentCamera.CameraSubject = THead
			elseif not THead and Handle then
				workspace.CurrentCamera.CameraSubject = Handle
			elseif THumanoid and TRootPart then
				workspace.CurrentCamera.CameraSubject = THumanoid
			end
			if not TCharacter:FindFirstChildWhichIsA("BasePart") then
				return
			end
	
			local FPos = function(BasePart, Pos, Ang)
				RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
				Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
				RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
				RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
			end
	
			local SFBasePart = function(BasePart)
				local TimeToWait = 2
				local Time = tick()
				local Angle = 0
	
				repeat
					if RootPart and THumanoid then
						if BasePart.Velocity.Magnitude < 50 then
							Angle = Angle + 100
	
							FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
							task.wait()
	
							FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
							task.wait()
	
							FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
							task.wait()
	
							FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
							task.wait()
	
							FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
							task.wait()
	
							FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
							task.wait()
						else
							FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
	
							FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
							task.wait()
	
							FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
	
							FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
	
							FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
							task.wait()
	
							FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
	
							FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
	
							FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
							task.wait()
	
							FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
							task.wait()
	
							FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
							task.wait()
						end
					else
						break
					end
				until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
			end
	
			workspace.FallenPartsDestroyHeight = 0/0
	
			local BV = Instance.new("BodyVelocity")
			BV.Name = "EpixVel"
			BV.Parent = RootPart
			BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
			BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
	
			Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
	
			if TRootPart and THead then
				if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
					SFBasePart(THead)
				else
					SFBasePart(TRootPart)
				end
			elseif TRootPart and not THead then
				SFBasePart(TRootPart)
			elseif not TRootPart and THead then
				SFBasePart(THead)
			elseif not TRootPart and not THead and Accessory and Handle then
				SFBasePart(Handle)
			else
				return Message("Error Occurred", "Target is missing everything", 5)
			end
	
			BV:Destroy()
			Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
			workspace.CurrentCamera.CameraSubject = Humanoid
	
			repeat
				RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
				Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
				Humanoid:ChangeState("GettingUp")
				table.foreach(Character:GetChildren(), function(_, x)
					if x:IsA("BasePart") then
						x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
					end
				end)
				task.wait()
			until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
			workspace.FallenPartsDestroyHeight = getgenv().FPDH
		else
			return Message("Error Occurred", "Random error", 5)
		end
	end
	
	if not Welcome then Message("Script by AnthonyIsntHere", "Enjoy!", 5) end
	getgenv().Welcome = true
	if Targets[1] then for _,x in next, Targets do GetPlayer(x) end else return end
	
	if AllBool then
		for _,x in next, Players:GetPlayers() do
			SkidFling(x)
		end
	end
	
	for _,x in next, Targets do
		if GetPlayer(x) and GetPlayer(x) ~= Player then
			if GetPlayer(x).UserId ~= 1414978355 then
				local TPlayer = GetPlayer(x)
				if TPlayer then
					SkidFling(TPlayer)
				end
			else
				Message("Error Occurred", "This user is whitelisted! (Owner)", 5)
			end
		elseif not GetPlayer(x) and not AllBool then
			Message("Error Occurred", "Username Invalid", 5)
		end
			end
			end
	end)
end;
task.spawn(C_2b);
-- StarterGui.ScreenGui.CorgiPrison Life.InfJump.LocalScript
local function C_2e()
local script = G2L["2e"];
	
	
	
	
	
	
	
	
		 -- InfiniteJump.EnableDisableInfJump 
			
			local infjumpenabled = false
	
		
	
	
		script.Parent.MouseButton1Click:Connect(function()
			if infjumpenabled == false then
				infjumpenabled = true
				script.Parent.Text = "Enabled"
			elseif infjumpenabled == true then
				infjumpenabled = false
				script.Parent.Text = "Disabled"
			end
		end)
	
	
	
		game:GetService("UserInputService").JumpRequest:Connect(function()
			if infjumpenabled == true then
				game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):ChangeState("Jumping")
			end
		end)
	
end;
task.spawn(C_2e);
-- StarterGui.ScreenGui.CorgiPrison Life.Gui
local function C_2f()
local script = G2L["2f"];
	game:GetService("StarterGui"):SetCore("SendNotification", { 
		Title = "Script By";
		Text  = "BlueCorgi99";
		Icon  = "rbxassetid://1251371070"})
	Duration = 16
	
	script.Parent.Draggable = true
	script.Parent.Selectable = true
	script.Parent.Active = true
end;
task.spawn(C_2f);
-- StarterGui.ScreenGui.CorgiPrison Life.Punch.LocalScript
local function C_32()
local script = G2L["32"];
	script.Parent.MouseButton1Click:Connect(function()
		mainRemotes = game.ReplicatedStorage
		meleeRemote = mainRemotes['meleeEvent']
		mouse = game.Players.LocalPlayer:GetMouse()
		punching = false
		cooldown = false
	
		function punch()
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
	
	
		mouse.KeyDown:connect(function(key)
			if cooldown == false then
				if key:lower() == "f" then
	
					punch()
	
				end
			end
		end)
	
	end)
	
		
end;
task.spawn(C_32);
-- StarterGui.ScreenGui.CorgiPrison Life.FlingGui.LocalScript
local function C_35()
local script = G2L["35"];
	script.Parent.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet("https://pastebin.com/raw/x2mEi7YX"))()
	
	
	end)
	
		
end;
task.spawn(C_35);
-- StarterGui.ScreenGui.CorgiPrison Life.Inmate.LocalScript
local function C_38()
local script = G2L["38"];
	script.Parent.MouseButton1Click:Connect(function()
		Workspace.Remote.TeamEvent:FireServer("Bright orange")
	end)
end;
task.spawn(C_38);
-- StarterGui.ScreenGui.CorgiPrison Life.Neutral.LocalScript
local function C_3b()
local script = G2L["3b"];
	script.Parent.MouseButton1Click:Connect(function()
	local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
		local location = CFrame.new(882.199951, 27.2899876, 2334.80005, 0, 0, -1, 0, 1, 0, 1, 0, 0)
	local humanoid = game.Players.LocalPlayer.Character.Humanoid
	humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	wait(0.1)
		pl.CFrame = location
		end)
end;
task.spawn(C_3b);
-- StarterGui.ScreenGui.CorgiPrison Life.Gates.LocalScript
local function C_3e()
local script = G2L["3e"];
	script.Parent.MouseButton1Click:Connect(function()
		
	game.Workspace["Prison_Fences"]:Destroy()
	end)
end;
task.spawn(C_3e);
-- StarterGui.ScreenGui.CorgiPrison Life.MapKiller.LocalScript
local function C_41()
local script = G2L["41"];
	script.Parent.MouseButton1Click:Connect(function()
		game.Workspace.Prison_CellBlock:Destroy()
		game.Workspace.Prison_OuterWall:Destroy()
		game.Workspace.Prison_Halls:Destroy()
		end)
end;
task.spawn(C_41);
-- StarterGui.ScreenGui.CorgiPrison Life.Cafe.LocalScript
local function C_44()
local script = G2L["44"];
	script.Parent.MouseButton1Click:Connect(function()
		local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
		local location = CFrame.new(918.994873046875, 99.98993682861328, 2325.73095703125)
		local humanoid = game.Players.LocalPlayer.Character.Humanoid
		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		wait(0.1)
		pl.CFrame = location
	end)
end;
task.spawn(C_44);
-- StarterGui.ScreenGui.CorgiPrison Life.Cell.LocalScript
local function C_47()
local script = G2L["47"];
	script.Parent.MouseButton1Click:Connect(function()
		local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
		local location = CFrame.new(919.5551147460938, 99.98998260498047, 2441.700927734375)
		local humanoid = game.Players.LocalPlayer.Character.Humanoid
		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		wait(0.1)
		pl.CFrame = location
	end)
end;
task.spawn(C_47);
-- StarterGui.ScreenGui.CorgiPrison Life.Prison.LocalScript
local function C_4a()
local script = G2L["4a"];
	script.Parent.MouseButton1Click:Connect(function()
	local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
		local location = CFrame.new(932.173279, 99.9899826, 2383.02783, 0.999904513, -1.842696e-09, 0.0138192605, 1.68528935e-09, 1, 1.14020251e-08, -0.0138192605, -1.13776473e-08, 0.999904513)
	local humanoid = game.Players.LocalPlayer.Character.Humanoid
	humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	wait(0.1)
		pl.CFrame = location
		end)
end;
task.spawn(C_4a);
-- StarterGui.ScreenGui.CorgiPrison Life.BTools.LocalScript
local function C_4d()
local script = G2L["4d"];
	script.Parent.MouseButton1Click:Connect(function()
		local tool1 = Instance.new("HopperBin",game.Players.LocalPlayer.Backpack)
		local tool2 = Instance.new("HopperBin",game.Players.LocalPlayer.Backpack)
		local tool3 = Instance.new("HopperBin",game.Players.LocalPlayer.Backpack)
		local tool4 = Instance.new("HopperBin",game.Players.LocalPlayer.Backpack)
		local tool5 = Instance.new("HopperBin",game.Players.LocalPlayer.Backpack)
		tool1.BinType = "Clone"
		tool2.BinType = "GameTool"
		tool3.BinType = "Hammer"
		tool4.BinType = "Script"
		tool5.BinType = "Grab"
		end)
end;
task.spawn(C_4d);
-- StarterGui.ScreenGui.CorgiPrison Life.Cat.LocalScript
local function C_50()
local script = G2L["50"];
	script.Parent.MouseButton1Click:Connect(function()
		--BROUGHT TO YOU BY RSCRIPTS.NET!--
	
		game.Players.LocalPlayer.Character:BreakJoints()
		game.Players.LocalPlayer.Character=nil
		Connection = game.Workspace.DescendantAdded:Connect(function(c)
			if c.Name == "Animate" then
				c.Disabled=true        
			end
		end)
		repeat wait() until game.Players.LocalPlayer.Character
		Char = game.Players.LocalPlayer.Character
		Died = game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Died:Connect(function()
			Connection:Disconnect()
			Died:Disconnect()
		end)
		wait(.1)
		function waitForChild(parent, childName)
			local child = parent:findFirstChild(childName)
			if child then return child end
			while true do
				child = parent.ChildAdded:wait()
				if child.Name==childName then return child end
			end
		end
	
		-- ANIMATION
	
		-- declarations
	
		local Figure = game.Players.LocalPlayer.Character
		local Torso = waitForChild(Figure, "Torso")
		local RightShoulder = waitForChild(Torso, "Right Shoulder")
		local LeftShoulder = waitForChild(Torso, "Left Shoulder")
		local RightHip = waitForChild(Torso, "Right Hip")
		local LeftHip = waitForChild(Torso, "Left Hip")
		local Neck = waitForChild(Torso, "Neck")
		local Humanoid = waitForChild(Figure, "Humanoid")
		local pose = "Standing"
	
		local toolAnim = "None"
		local toolAnimTime = 0
	
		local jumpMaxLimbVelocity = 0.75
	
		-- functions
	
		function onRunning(speed)
			if speed>0 then
				pose = "Running"
			else
				pose = "Standing"
			end
		end
	
		function onDied()
			pose = "Dead"
		end
	
		function onJumping()
			pose = "Jumping"
		end
	
		function onClimbing()
			pose = "Climbing"
		end
	
		function onGettingUp()
			pose = "GettingUp"
		end
	
		function onFreeFall()
			pose = "FreeFall"
		end
	
		function onFallingDown()
			pose = "FallingDown"
		end
	
		function onSeated()
			pose = "Seated"
		end
	
		function onPlatformStanding()
			pose = "PlatformStanding"
		end
	
		function onSwimming(speed)
			if speed>0 then
				pose = "Running"
			else
				pose = "Standing"
			end
		end
	
		function moveJump()
			RightShoulder.MaxVelocity = jumpMaxLimbVelocity
			LeftShoulder.MaxVelocity = jumpMaxLimbVelocity
			RightShoulder:SetDesiredAngle(3.14)
			LeftShoulder:SetDesiredAngle(-3.14)
			RightHip:SetDesiredAngle(0)
			LeftHip:SetDesiredAngle(0)
		end
	
	
		-- same as jump for now
	
		function moveFreeFall()
			RightShoulder.MaxVelocity = jumpMaxLimbVelocity
			LeftShoulder.MaxVelocity = jumpMaxLimbVelocity
			RightShoulder:SetDesiredAngle(3.14)
			LeftShoulder:SetDesiredAngle(-3.14)
			RightHip:SetDesiredAngle(0)
			LeftHip:SetDesiredAngle(0)
		end
	
		function moveSit()
			RightShoulder.MaxVelocity = 0.15
			LeftShoulder.MaxVelocity = 0.15
			RightShoulder:SetDesiredAngle(3.14 /2)
			LeftShoulder:SetDesiredAngle(-3.14 /2)
			RightHip:SetDesiredAngle(3.14 /2)
			LeftHip:SetDesiredAngle(-3.14 /2)
		end
	
		function getTool()
			for _, kid in ipairs(Figure:GetChildren()) do
				if kid.className == "Tool" then return kid end
			end
			return nil
		end
	
		function getToolAnim(tool)
			for _, c in ipairs(tool:GetChildren()) do
				if c.Name == "toolanim" and c.className == "StringValue" then
					return c
				end
			end
			return nil
		end
	
		function animateTool()
	
			if (toolAnim == "None") then
				RightShoulder:SetDesiredAngle(1.57)
				return
			end
	
			if (toolAnim == "Slash") then
				RightShoulder.MaxVelocity = 0.5
				RightShoulder:SetDesiredAngle(0)
				return
			end
	
			if (toolAnim == "Lunge") then
				RightShoulder.MaxVelocity = 0.5
				LeftShoulder.MaxVelocity = 0.5
				RightHip.MaxVelocity = 0.5
				LeftHip.MaxVelocity = 0.5
				RightShoulder:SetDesiredAngle(1.57)
				LeftShoulder:SetDesiredAngle(1.0)
				RightHip:SetDesiredAngle(1.57)
				LeftHip:SetDesiredAngle(1.0)
				return
			end
		end
	
		function move(time)
			local amplitude
			local frequency
	
			if (pose == "Jumping") then
				moveJump()
				return
			end
	
			if (pose == "FreeFall") then
				moveFreeFall()
				return
			end
	
			if (pose == "Seated") then
				moveSit()
				return
			end
	
			local climbFudge = 0
	
			if (pose == "Running") then
				if (RightShoulder.CurrentAngle > 1.5 or RightShoulder.CurrentAngle < -1.5) then
					RightShoulder.MaxVelocity = jumpMaxLimbVelocity
				else  
					RightShoulder.MaxVelocity = 0.15
				end
				if (LeftShoulder.CurrentAngle > 1.5 or LeftShoulder.CurrentAngle < -1.5) then
					LeftShoulder.MaxVelocity = jumpMaxLimbVelocity
				else  
					LeftShoulder.MaxVelocity = 0.15
				end
				amplitude = 1
				frequency = 9
			elseif (pose == "Climbing") then
				RightShoulder.MaxVelocity = 0.5
				LeftShoulder.MaxVelocity = 0.5
				amplitude = 1
				frequency = 9
				climbFudge = 3.14
			else
				amplitude = 0.1
				frequency = 1
			end
	
			desiredAngle = amplitude * math.sin(time*frequency)
	
			RightShoulder:SetDesiredAngle(desiredAngle + climbFudge)
			LeftShoulder:SetDesiredAngle(desiredAngle - climbFudge)
			RightHip:SetDesiredAngle(-desiredAngle)
			LeftHip:SetDesiredAngle(-desiredAngle)
	
	
			local tool = getTool()
	
			if tool then
	
				animStringValueObject = getToolAnim(tool)
	
				if animStringValueObject then
					toolAnim = animStringValueObject.Value
					-- message recieved, delete StringValue
					animStringValueObject.Parent = nil
					toolAnimTime = time + .3
				end
	
				if time > toolAnimTime then
					toolAnimTime = 0
					toolAnim = "None"
				end
	
				animateTool()
	
	
			else
				toolAnim = "None"
				toolAnimTime = 0
			end
		end
	
	
		-- connect events
	
		Humanoid.Died:connect(onDied)
		Humanoid.Running:connect(onRunning)
		Humanoid.Jumping:connect(onJumping)
		Humanoid.Climbing:connect(onClimbing)
		Humanoid.GettingUp:connect(onGettingUp)
		Humanoid.FreeFalling:connect(onFreeFall)
		Humanoid.FallingDown:connect(onFallingDown)
		Humanoid.Seated:connect(onSeated)
		Humanoid.PlatformStanding:connect(onPlatformStanding)
		Humanoid.Swimming:connect(onSwimming)
		-- main program
	
		local runService = game:service("RunService");
	
		while Figure.Parent~=nil do
			local _, time = wait(0.1)
			move(time)
		end
	end)
end;
task.spawn(C_50);
-- StarterGui.ScreenGui.CorgiPrison Life.WeaponGet.LocalScript
local function C_53()
local script = G2L["53"];
	script.Parent.MouseButton1Click:Connect(function()
		--[[
		WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
	]]
		-- Version Life
		-- support game : prison life
	
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Chaosscripter/Version/main/version%20life.lua.txt"))()
	end)
end;
task.spawn(C_53);
-- StarterGui.ScreenGui.CorgiPrison Life.CrimBase.LocalScript
local function C_56()
local script = G2L["56"];
	script.Parent.MouseButton1Click:Connect(function()
		game:Shutdown()
	end)
end;
task.spawn(C_56);
-- StarterGui.ScreenGui.CorgiPrison Life.Inmate.LocalScript
local function C_59()
local script = G2L["59"];
	script.Parent.MouseButton1Click:Connect(function()
		-- Made by LittleBrick#3470 on discord --
		cors={}mas=Instance.new("Model",game:GetService("Lighting"))Tool0=Instance.new("Tool")Part1=Instance.new("Part")SpecialMesh2=Instance.new("SpecialMesh")Tool0.Name="LinkedSword"Tool0.Parent=mas Tool0.TextureId="rbxasset://Textures/Sword128.png"Tool0.Grip=CFrame.new(0,0,-1.5,0,0,1,1,0,0,0,1,0)Tool0.GripForward=Vector3.new(-1,-0,-0)Tool0.GripPos=Vector3.new(0,0,-1.5)Tool0.GripRight=Vector3.new(0,1,0)Tool0.GripUp=Vector3.new(0,0,1)Part1.Name="Handle"Part1.Parent=Tool0 Part1.CFrame=CFrame.new(-9.41724396,0.400011986,35.7144165,-3.42285489e-08,0,-1,0,1,0,1,0,-3.42285489e-08)Part1.Orientation=Vector3.new(0,-90,0)Part1.Position=Vector3.new(-9.41724396,0.400011986,35.7144165)Part1.Rotation=Vector3.new(0,-90,0)Part1.Color=Color3.new(0.388235,0.372549,0.384314)Part1.Size=Vector3.new(1,0.800000012,4)Part1.BottomSurface=Enum.SurfaceType.Smooth Part1.BrickColor=BrickColor.new("Dark stone grey")Part1.Reflectance=0.40000000596046 Part1.TopSurface=Enum.SurfaceType.Smooth Part1.brickColor=BrickColor.new("Dark stone grey")Part1.FormFactor=Enum.FormFactor.Plate Part1.formFactor=Enum.FormFactor.Plate SpecialMesh2.Parent=Part1 SpecialMesh2.MeshId="rbxasset://fonts/sword.mesh"SpecialMesh2.TextureId="rbxasset://textures/SwordTexture.png"SpecialMesh2.MeshType=Enum.MeshType.FileMesh Tool0.Activated:Connect(function()local a=game.Players.LocalPlayer local b="74894663"local c=Instance.new("Animation")c.AnimationId="rbxassetid://"..b local a=a.Character.Humanoid:LoadAnimation(c)a:Play()a:AdjustSpeed(2)local c=Instance.new("Sound")c.Parent=workspace c.MaxDistance=math.huge c.SoundId="rbxassetid://608537390"c.Volume=2 wait()c:Play()for a,b in pairs(game.Players:GetChildren())do if b.Name~=game.Players.LocalPlayer.Name then for a=1,10 do game.ReplicatedStorage.meleeEvent:FireServer(b)c:Destroy()end end end end)for a,a in pairs(mas:GetChildren())do a.Parent=game:GetService("Players").LocalPlayer.Backpack pcall(function()a:MakeJoints()end)end
	end)
end;
task.spawn(C_59);
-- StarterGui.ScreenGui.CorgiPrison Life.Cafe.LocalScript
local function C_5c()
local script = G2L["5c"];
	script.Parent.MouseButton1Click:Connect(function()
		
			-- Made by LittleBrick#3470 on discord --
		cors={}mas=Instance.new("Model",game:GetService("Lighting"))Tool0=Instance.new("Tool")Part1=Instance.new("Part")SpecialMesh2=Instance.new("SpecialMesh")Tool0.Name="Energy Scythe"Tool0.Parent=mas Tool0.TextureId="rbxassetid://"Tool0.Grip=CFrame.new(0, -1, -0.55)Tool0.GripForward=Vector3.new(-1,-0,-0)Tool0.GripPos=Vector3.new(0,0,-1.5)Tool0.GripRight=Vector3.new(0,1,0)Tool0.GripUp=Vector3.new(0,0,1)Part1.Name="Handle"Part1.Parent=Tool0 Part1.CFrame=CFrame.new(-9.41724396,0.400011986,35.7144165,-3.42285489e-08,0,-1,0,1,0,1,0,-3.42285489e-08)Part1.Orientation=Vector3.new(0,-90,0)Part1.Position=Vector3.new(-9.41724396,0.400011986,35.7144165)Part1.Rotation=Vector3.new(0,-90,0)Part1.Color=Color3.new(0.388235,0.372549,0.384314)Part1.Size=Vector3.new(1, 8, 1)Part1.BottomSurface=Enum.SurfaceType.Smooth Part1.BrickColor=BrickColor.new("Dark stone grey")Part1.Reflectance=0.40000000596046 Part1.TopSurface=Enum.SurfaceType.Smooth Part1.brickColor=BrickColor.new("Dark stone grey")Part1.FormFactor=Enum.FormFactor.Plate Part1.formFactor=Enum.FormFactor.Plate SpecialMesh2.Parent=Part1 SpecialMesh2.MeshId="rbxassetid://218497396"SpecialMesh2.TextureId=""SpecialMesh2.MeshType=Enum.MeshType.FileMesh Tool0.Activated:Connect(function()local a=game.Players.LocalPlayer local b="218504594"local c=Instance.new("Animation")c.AnimationId="rbxassetid://845822608"..b local a=a.Character.Humanoid:LoadAnimation(c)a:Play()a:AdjustSpeed(2)local c=Instance.new("Sound")c.Parent=workspace c.MaxDistance=math.huge c.SoundId="rbxassetid://88633606"c.Volume=2 wait()c:Play()for a,b in pairs(game.Players:GetChildren())do if b.Name~=game.Players.LocalPlayer.Name then for a=1,10 do game.ReplicatedStorage.meleeEvent:FireServer(b)c:Destroy()end end end end)for a,a in pairs(mas:GetChildren())do a.Parent=game:GetService("Players").LocalPlayer.Backpack pcall(function()a:MakeJoints()end)end
		
	end)
end;
task.spawn(C_5c);
-- StarterGui.ScreenGui.CorgiPrison Life.ESP.LocalScript
local function C_5f()
local script = G2L["5f"];
	script.Parent.MouseButton1Click:Connect(function()
		--Settings:
		local ScriptStarted = false
		local Keybind = "E" --Set to whatever you want, has to be the name of a KeyCode Enum.
		local Transparency = true --Will make you slightly transparent when you are invisible. No reason to disable.
		local NoClip = false --Will make your fake character no clip.
		local Player = game:GetService("Players").LocalPlayer
		local RealCharacter = Player.Character or Player.CharacterAdded:Wait()
		local IsInvisible = false
		RealCharacter.Archivable = true
		local FakeCharacter = RealCharacter:Clone()
		local Part
		Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Size = Vector3.new(200, 1, 200)
		Part.CFrame = CFrame.new(0, -500, 0) --Set this to whatever you want, just far away from the map.
		Part.CanCollide = true
		FakeCharacter.Parent = workspace
		FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
		for i, v in pairs(RealCharacter:GetChildren()) do
			if v:IsA("LocalScript") then
				local clone = v:Clone()
				clone.Disabled = true
				clone.Parent = FakeCharacter
			end
		end
		if Transparency then
			for i, v in pairs(FakeCharacter:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Transparency = 0.7
				end
			end
		end
		local CanInvis = true
		function RealCharacterDied()
			CanInvis = false
			RealCharacter:Destroy()
			RealCharacter = Player.Character
			CanInvis = true
			isinvisible = false
			FakeCharacter:Destroy()
			workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid
			RealCharacter.Archivable = true
			FakeCharacter = RealCharacter:Clone()
			Part:Destroy()
			Part = Instance.new("Part", workspace)
			Part.Anchored = true
			Part.Size = Vector3.new(200, 1, 200)
			Part.CFrame = CFrame.new(9999, 9999, 9999) --Set this to whatever you want, just far away from the map.
			Part.CanCollide = true
			FakeCharacter.Parent = workspace
			FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
			for i, v in pairs(RealCharacter:GetChildren()) do
				if v:IsA("LocalScript") then
					local clone = v:Clone()
					clone.Disabled = true
					clone.Parent = FakeCharacter
				end
			end
			if Transparency then
				for i, v in pairs(FakeCharacter:GetDescendants()) do
					if v:IsA("BasePart") then
						v.Transparency = 0.7
					end
				end
			end
			RealCharacter.Humanoid.Died:Connect(function()
				RealCharacter:Destroy()
				FakeCharacter:Destroy()
			end)
			Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
		end
		RealCharacter.Humanoid.Died:Connect(function()
			RealCharacter:Destroy()
			FakeCharacter:Destroy()
		end)
		Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
		local PseudoAnchor
		game:GetService "RunService".RenderStepped:Connect(
			function()
				if PseudoAnchor ~= nil then
					PseudoAnchor.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
				end
				if NoClip then
					FakeCharacter.Humanoid:ChangeState(11)
				end
			end
		)
		PseudoAnchor = FakeCharacter.HumanoidRootPart
		local function Invisible()
			if IsInvisible == false then
				local StoredCF = RealCharacter.HumanoidRootPart.CFrame
				RealCharacter.HumanoidRootPart.CFrame = FakeCharacter.HumanoidRootPart.CFrame
				FakeCharacter.HumanoidRootPart.CFrame = StoredCF
				RealCharacter.Humanoid:UnequipTools()
				Player.Character = FakeCharacter
				workspace.CurrentCamera.CameraSubject = FakeCharacter.Humanoid
				PseudoAnchor = RealCharacter.HumanoidRootPart
				for i, v in pairs(FakeCharacter:GetChildren()) do
					if v:IsA("LocalScript") then
						v.Disabled = false
					end
				end
				IsInvisible = true
			else
				local StoredCF = FakeCharacter.HumanoidRootPart.CFrame
				FakeCharacter.HumanoidRootPart.CFrame = RealCharacter.HumanoidRootPart.CFrame
	
				RealCharacter.HumanoidRootPart.CFrame = StoredCF
	
				FakeCharacter.Humanoid:UnequipTools()
				Player.Character = RealCharacter
				workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid
				PseudoAnchor = FakeCharacter.HumanoidRootPart
				for i, v in pairs(FakeCharacter:GetChildren()) do
					if v:IsA("LocalScript") then
						v.Disabled = true
					end
				end
				IsInvisible = false
			end
		end
		game:GetService("UserInputService").InputBegan:Connect(
		function(key, gamep)
			if gamep then
				return
			end
			if key.KeyCode.Name:lower() == Keybind:lower() and CanInvis and RealCharacter and FakeCharacter then
				if RealCharacter:FindFirstChild("HumanoidRootPart") and FakeCharacter:FindFirstChild("HumanoidRootPart") then
					Invisible()
				end
			end
		end
		)
		local Sound = Instance.new("Sound",game:GetService("SoundService"))
		Sound.SoundId = "rbxassetid://232127604"
		Sound:Play()
		game:GetService("StarterGui"):SetCore("SendNotification",{["Title"] = "Invisible Toggle Loaded",["Text"] = "Press "..Keybind.." to become change visibility.",["Duration"] = 20,["Button1"] = "Okay."})
		end)
end;
task.spawn(C_5f);
-- StarterGui.ScreenGui.CorgiPrison Life.OnExecuted
local function C_60()
local script = G2L["60"];
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 32
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = 65
end;
task.spawn(C_60);
-- StarterGui.ScreenGui.Open/Close.LocalScript
local function C_63()
local script = G2L["63"];
	local Gui = script.Parent.Parent["CorgiPrison Life"]
	
	script.Parent.MouseButton1Click:Connect(function()
		if Gui.Visible == true then
			Gui.Visible = false
		else
			Gui.Visible = true
		end
	end)
end;
task.spawn(C_63);

return G2L["1"], require;
