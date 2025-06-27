--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]

-- Instances: 110 | Scripts: 27 | Modules: 1 | Tags: 0
local G2L = {};

-- StarterGui.YardHaxx V1.2.x
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["Name"] = [[YardHaxx V1.2.x]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


-- StarterGui.YardHaxx V1.2.x.MainFrame
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["Active"] = true;
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(89, 89, 89);
G2L["2"]["Selectable"] = true;
G2L["2"]["Size"] = UDim2.new(0, 836, 0, 543);
G2L["2"]["Position"] = UDim2.new(0, 65, 0, 126);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Name"] = [[MainFrame]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.Title
G2L["3"] = Instance.new("TextLabel", G2L["2"]);
G2L["3"]["TextWrapped"] = true;
G2L["3"]["TextStrokeTransparency"] = 0;
G2L["3"]["BorderSizePixel"] = 0;
G2L["3"]["TextSize"] = 14;
G2L["3"]["TextScaled"] = true;
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(240, 118, 47);
G2L["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3"]["Size"] = UDim2.new(0, 834, 0, 36);
G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["Text"] = [[YardHaxx V1.2]];
G2L["3"]["Name"] = [[Title]];
G2L["3"]["Position"] = UDim2.new(-0, 0, 0.00045, 0);


-- StarterGui.YardHaxx V1.2.x.MainFrame.Close
G2L["4"] = Instance.new("TextButton", G2L["2"]);
G2L["4"]["TextWrapped"] = true;
G2L["4"]["TextStrokeTransparency"] = 0;
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["TextSize"] = 14;
G2L["4"]["TextScaled"] = true;
G2L["4"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
G2L["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4"]["Size"] = UDim2.new(0, 36, 0, 36);
G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["Text"] = [[X]];
G2L["4"]["Name"] = [[Close]];
G2L["4"]["Position"] = UDim2.new(0, 800, 0, 0);


-- StarterGui.YardHaxx V1.2.x.MainFrame.AK
G2L["5"] = Instance.new("TextButton", G2L["2"]);
G2L["5"]["TextWrapped"] = true;
G2L["5"]["TextStrokeTransparency"] = 0;
G2L["5"]["BorderSizePixel"] = 0;
G2L["5"]["TextSize"] = 14;
G2L["5"]["TextScaled"] = true;
G2L["5"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5"]["BackgroundColor3"] = Color3.fromRGB(127, 245, 255);
G2L["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5"]["Size"] = UDim2.new(0, 96, 0, 28);
G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5"]["Text"] = [[AK-47]];
G2L["5"]["Name"] = [[AK]];
G2L["5"]["Position"] = UDim2.new(0, 32, 0, 95);


-- StarterGui.YardHaxx V1.2.x.MainFrame.GunSectionTitle
G2L["6"] = Instance.new("TextLabel", G2L["2"]);
G2L["6"]["TextWrapped"] = true;
G2L["6"]["TextStrokeTransparency"] = 0;
G2L["6"]["BorderSizePixel"] = 0;
G2L["6"]["TextSize"] = 14;
G2L["6"]["TextScaled"] = true;
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["6"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6"]["BackgroundTransparency"] = 1;
G2L["6"]["Size"] = UDim2.new(0, 463, 0, 30);
G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["Text"] = [[--[Gun Section]--]];
G2L["6"]["Name"] = [[GunSectionTitle]];
G2L["6"]["Position"] = UDim2.new(0, 7, 0, 52);


-- StarterGui.YardHaxx V1.2.x.MainFrame.Pistol
G2L["7"] = Instance.new("TextButton", G2L["2"]);
G2L["7"]["TextWrapped"] = true;
G2L["7"]["TextStrokeTransparency"] = 0;
G2L["7"]["BorderSizePixel"] = 0;
G2L["7"]["TextSize"] = 14;
G2L["7"]["TextScaled"] = true;
G2L["7"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7"]["BackgroundColor3"] = Color3.fromRGB(127, 245, 255);
G2L["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["7"]["Size"] = UDim2.new(0, 96, 0, 28);
G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7"]["Text"] = [[M9]];
G2L["7"]["Name"] = [[Pistol]];
G2L["7"]["Position"] = UDim2.new(0, 138, 0, 95);


-- StarterGui.YardHaxx V1.2.x.MainFrame.Shotgun
G2L["8"] = Instance.new("TextButton", G2L["2"]);
G2L["8"]["TextWrapped"] = true;
G2L["8"]["TextStrokeTransparency"] = 0;
G2L["8"]["BorderSizePixel"] = 0;
G2L["8"]["TextSize"] = 14;
G2L["8"]["TextScaled"] = true;
G2L["8"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["8"]["BackgroundColor3"] = Color3.fromRGB(127, 245, 255);
G2L["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["8"]["Size"] = UDim2.new(0, 96, 0, 28);
G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8"]["Text"] = [[Remington 870]];
G2L["8"]["Name"] = [[Shotgun]];
G2L["8"]["Position"] = UDim2.new(0, 243, 0, 95);


-- StarterGui.YardHaxx V1.2.x.MainFrame.AllGuns
G2L["9"] = Instance.new("TextButton", G2L["2"]);
G2L["9"]["TextWrapped"] = true;
G2L["9"]["TextStrokeTransparency"] = 0;
G2L["9"]["BorderSizePixel"] = 0;
G2L["9"]["TextSize"] = 14;
G2L["9"]["TextScaled"] = true;
G2L["9"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["9"]["BackgroundColor3"] = Color3.fromRGB(101, 101, 101);
G2L["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["9"]["Size"] = UDim2.new(0, 96, 0, 28);
G2L["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9"]["Text"] = [[All Guns]];
G2L["9"]["Name"] = [[AllGuns]];
G2L["9"]["Position"] = UDim2.new(0, 346, 0, 95);


-- StarterGui.YardHaxx V1.2.x.MainFrame.Seperator1
G2L["a"] = Instance.new("Frame", G2L["2"]);
G2L["a"]["BorderSizePixel"] = 0;
G2L["a"]["BackgroundColor3"] = Color3.fromRGB(236, 236, 236);
G2L["a"]["Size"] = UDim2.new(0, 463, 0, 1);
G2L["a"]["Position"] = UDim2.new(0, 7, 0, 139);
G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a"]["Name"] = [[Seperator1]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.SlaughterSection Title
G2L["b"] = Instance.new("TextLabel", G2L["2"]);
G2L["b"]["TextWrapped"] = true;
G2L["b"]["TextStrokeTransparency"] = 0;
G2L["b"]["BorderSizePixel"] = 0;
G2L["b"]["TextSize"] = 14;
G2L["b"]["TextScaled"] = true;
G2L["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["b"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["b"]["BackgroundTransparency"] = 1;
G2L["b"]["Size"] = UDim2.new(0, 463, 0, 30);
G2L["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b"]["Text"] = [[--[Game Section]--]];
G2L["b"]["Name"] = [[SlaughterSection Title]];
G2L["b"]["Position"] = UDim2.new(0, 7, 0, 151);


-- StarterGui.YardHaxx V1.2.x.MainFrame.Seperator2
G2L["c"] = Instance.new("Frame", G2L["2"]);
G2L["c"]["BorderSizePixel"] = 0;
G2L["c"]["BackgroundColor3"] = Color3.fromRGB(236, 236, 236);
G2L["c"]["Size"] = UDim2.new(0, 463, 0, 1);
G2L["c"]["Position"] = UDim2.new(0, 7, 0, 334);
G2L["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["c"]["Name"] = [[Seperator2]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.KillAll
G2L["d"] = Instance.new("TextButton", G2L["2"]);
G2L["d"]["TextWrapped"] = true;
G2L["d"]["TextStrokeTransparency"] = 0;
G2L["d"]["BorderSizePixel"] = 0;
G2L["d"]["TextSize"] = 14;
G2L["d"]["TextScaled"] = true;
G2L["d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["d"]["BackgroundColor3"] = Color3.fromRGB(152, 255, 107);
G2L["d"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["d"]["Size"] = UDim2.new(0, 202, 0, 28);
G2L["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["d"]["Text"] = [[Kill All]];
G2L["d"]["Name"] = [[KillAll]];
G2L["d"]["Position"] = UDim2.new(0, 32, 0, 229);


-- StarterGui.YardHaxx V1.2.x.MainFrame.KillAll.Rainbow
G2L["e"] = Instance.new("LocalScript", G2L["d"]);
G2L["e"]["Name"] = [[Rainbow]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.KillInmates
G2L["f"] = Instance.new("TextButton", G2L["2"]);
G2L["f"]["TextWrapped"] = true;
G2L["f"]["TextStrokeTransparency"] = 0;
G2L["f"]["BorderSizePixel"] = 0;
G2L["f"]["TextSize"] = 14;
G2L["f"]["TextScaled"] = true;
G2L["f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["f"]["BackgroundColor3"] = Color3.fromRGB(152, 255, 107);
G2L["f"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["f"]["Size"] = UDim2.new(0, 96, 0, 28);
G2L["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["f"]["Text"] = [[Kill Inmates]];
G2L["f"]["Name"] = [[KillInmates]];
G2L["f"]["Position"] = UDim2.new(0, 139, 0, 194);


-- StarterGui.YardHaxx V1.2.x.MainFrame.KillInmates.Rainbow
G2L["10"] = Instance.new("LocalScript", G2L["f"]);
G2L["10"]["Name"] = [[Rainbow]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.KillCops
G2L["11"] = Instance.new("TextButton", G2L["2"]);
G2L["11"]["TextWrapped"] = true;
G2L["11"]["TextStrokeTransparency"] = 0;
G2L["11"]["BorderSizePixel"] = 0;
G2L["11"]["TextSize"] = 14;
G2L["11"]["TextScaled"] = true;
G2L["11"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["11"]["BackgroundColor3"] = Color3.fromRGB(152, 255, 107);
G2L["11"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["11"]["Size"] = UDim2.new(0, 96, 0, 28);
G2L["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["11"]["Text"] = [[Kill Cops]];
G2L["11"]["Name"] = [[KillCops]];
G2L["11"]["Position"] = UDim2.new(0, 244, 0, 194);


-- StarterGui.YardHaxx V1.2.x.MainFrame.KillCops.Rainbow
G2L["12"] = Instance.new("LocalScript", G2L["11"]);
G2L["12"]["Name"] = [[Rainbow]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.KillCrims
G2L["13"] = Instance.new("TextButton", G2L["2"]);
G2L["13"]["TextWrapped"] = true;
G2L["13"]["TextStrokeTransparency"] = 0;
G2L["13"]["BorderSizePixel"] = 0;
G2L["13"]["TextSize"] = 14;
G2L["13"]["TextScaled"] = true;
G2L["13"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["13"]["BackgroundColor3"] = Color3.fromRGB(152, 255, 107);
G2L["13"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["13"]["Size"] = UDim2.new(0, 96, 0, 28);
G2L["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["13"]["Text"] = [[Kill Criminals]];
G2L["13"]["Name"] = [[KillCrims]];
G2L["13"]["Position"] = UDim2.new(0, 347, 0, 194);


-- StarterGui.YardHaxx V1.2.x.MainFrame.KillCrims.Rainbow
G2L["14"] = Instance.new("LocalScript", G2L["13"]);
G2L["14"]["Name"] = [[Rainbow]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.KillAura
G2L["15"] = Instance.new("TextButton", G2L["2"]);
G2L["15"]["TextWrapped"] = true;
G2L["15"]["TextStrokeTransparency"] = 0;
G2L["15"]["BorderSizePixel"] = 0;
G2L["15"]["TextSize"] = 14;
G2L["15"]["TextScaled"] = true;
G2L["15"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["15"]["BackgroundColor3"] = Color3.fromRGB(152, 255, 107);
G2L["15"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["15"]["Size"] = UDim2.new(0, 199, 0, 28);
G2L["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["15"]["Text"] = [[Kill Aura: OFF]];
G2L["15"]["Name"] = [[KillAura]];
G2L["15"]["Position"] = UDim2.new(0, 243, 0, 229);


-- StarterGui.YardHaxx V1.2.x.MainFrame.KillAura.Rainbow
G2L["16"] = Instance.new("LocalScript", G2L["15"]);
G2L["16"]["Name"] = [[Rainbow]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.TeleportSection Title
G2L["17"] = Instance.new("TextLabel", G2L["2"]);
G2L["17"]["TextWrapped"] = true;
G2L["17"]["TextStrokeTransparency"] = 0;
G2L["17"]["BorderSizePixel"] = 0;
G2L["17"]["TextSize"] = 14;
G2L["17"]["TextScaled"] = true;
G2L["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["17"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["17"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["17"]["BackgroundTransparency"] = 1;
G2L["17"]["Size"] = UDim2.new(0, 438, 0, 27);
G2L["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["17"]["Text"] = [[--[Teams Section]--]];
G2L["17"]["Name"] = [[TeleportSection Title]];
G2L["17"]["Position"] = UDim2.new(0, 23, 0, 341);


-- StarterGui.YardHaxx V1.2.x.MainFrame.Criminal
G2L["18"] = Instance.new("TextButton", G2L["2"]);
G2L["18"]["TextWrapped"] = true;
G2L["18"]["TextStrokeTransparency"] = 0;
G2L["18"]["BorderSizePixel"] = 0;
G2L["18"]["TextSize"] = 14;
G2L["18"]["TextScaled"] = true;
G2L["18"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["18"]["BackgroundColor3"] = Color3.fromRGB(255, 80, 83);
G2L["18"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["18"]["Size"] = UDim2.new(0, 101, 0, 30);
G2L["18"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["18"]["Text"] = [[Become Criminal]];
G2L["18"]["Name"] = [[Criminal]];
G2L["18"]["Position"] = UDim2.new(0, 20, 0, 378);


-- StarterGui.YardHaxx V1.2.x.MainFrame.Seperator3
G2L["19"] = Instance.new("Frame", G2L["2"]);
G2L["19"]["BorderSizePixel"] = 0;
G2L["19"]["BackgroundColor3"] = Color3.fromRGB(236, 236, 236);
G2L["19"]["Size"] = UDim2.new(0, 438, 0, 0);
G2L["19"]["Position"] = UDim2.new(0, 16, 0, 418);
G2L["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["19"]["Name"] = [[Seperator3]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.Inmate
G2L["1a"] = Instance.new("TextButton", G2L["2"]);
G2L["1a"]["TextWrapped"] = true;
G2L["1a"]["TextStrokeTransparency"] = 0;
G2L["1a"]["BorderSizePixel"] = 0;
G2L["1a"]["TextSize"] = 14;
G2L["1a"]["TextScaled"] = true;
G2L["1a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 229, 75);
G2L["1a"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1a"]["Size"] = UDim2.new(0, 101, 0, 30);
G2L["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1a"]["Text"] = [[Become Inmate]];
G2L["1a"]["Name"] = [[Inmate]];
G2L["1a"]["Position"] = UDim2.new(0, 132, 0, 378);


-- StarterGui.YardHaxx V1.2.x.MainFrame.Guard
G2L["1b"] = Instance.new("TextButton", G2L["2"]);
G2L["1b"]["TextWrapped"] = true;
G2L["1b"]["TextStrokeTransparency"] = 0;
G2L["1b"]["BorderSizePixel"] = 0;
G2L["1b"]["TextSize"] = 14;
G2L["1b"]["TextScaled"] = true;
G2L["1b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1b"]["BackgroundColor3"] = Color3.fromRGB(64, 161, 214);
G2L["1b"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1b"]["Size"] = UDim2.new(0, 101, 0, 30);
G2L["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1b"]["Text"] = [[Become Guard]];
G2L["1b"]["Name"] = [[Guard]];
G2L["1b"]["Position"] = UDim2.new(0, 244, 0, 378);


-- StarterGui.YardHaxx V1.2.x.MainFrame.Misc Title
G2L["1c"] = Instance.new("TextLabel", G2L["2"]);
G2L["1c"]["TextWrapped"] = true;
G2L["1c"]["TextStrokeTransparency"] = 0;
G2L["1c"]["BorderSizePixel"] = 0;
G2L["1c"]["TextSize"] = 14;
G2L["1c"]["TextScaled"] = true;
G2L["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1c"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1c"]["BackgroundTransparency"] = 1;
G2L["1c"]["Size"] = UDim2.new(0, 438, 0, 27);
G2L["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1c"]["Text"] = [[--[Miscellaneous]--]];
G2L["1c"]["Name"] = [[Misc Title]];
G2L["1c"]["Position"] = UDim2.new(0, 23, 0, 427);


-- StarterGui.YardHaxx V1.2.x.MainFrame.Noclip
G2L["1d"] = Instance.new("TextButton", G2L["2"]);
G2L["1d"]["TextWrapped"] = true;
G2L["1d"]["TextStrokeTransparency"] = 0;
G2L["1d"]["BorderSizePixel"] = 0;
G2L["1d"]["TextSize"] = 14;
G2L["1d"]["TextScaled"] = true;
G2L["1d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1d"]["BackgroundColor3"] = Color3.fromRGB(255, 178, 88);
G2L["1d"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1d"]["Size"] = UDim2.new(0, 118, 0, 31);
G2L["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1d"]["Text"] = [[Noclip: OFF]];
G2L["1d"]["Name"] = [[Noclip]];
G2L["1d"]["Position"] = UDim2.new(0, 53, 0, 461);


-- StarterGui.YardHaxx V1.2.x.MainFrame.OpenTrickerUI
G2L["1e"] = Instance.new("TextButton", G2L["2"]);
G2L["1e"]["TextWrapped"] = true;
G2L["1e"]["TextStrokeTransparency"] = 0;
G2L["1e"]["BorderSizePixel"] = 0;
G2L["1e"]["TextSize"] = 14;
G2L["1e"]["TextScaled"] = true;
G2L["1e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1e"]["BackgroundColor3"] = Color3.fromRGB(255, 178, 88);
G2L["1e"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1e"]["Size"] = UDim2.new(0, 118, 0, 31);
G2L["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1e"]["Text"] = [[Humanoid Tricker]];
G2L["1e"]["Name"] = [[OpenTrickerUI]];
G2L["1e"]["Position"] = UDim2.new(0, 177, 0, 461);


-- StarterGui.YardHaxx V1.2.x.MainFrame.OpenGunHaxxUI
G2L["1f"] = Instance.new("TextButton", G2L["2"]);
G2L["1f"]["TextWrapped"] = true;
G2L["1f"]["TextStrokeTransparency"] = 0;
G2L["1f"]["BorderSizePixel"] = 0;
G2L["1f"]["TextSize"] = 14;
G2L["1f"]["TextScaled"] = true;
G2L["1f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1f"]["BackgroundColor3"] = Color3.fromRGB(255, 178, 88);
G2L["1f"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1f"]["Size"] = UDim2.new(0, 118, 0, 31);
G2L["1f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1f"]["Text"] = [[Gun Mods]];
G2L["1f"]["Name"] = [[OpenGunHaxxUI]];
G2L["1f"]["Position"] = UDim2.new(0, 301, 0, 461);


-- StarterGui.YardHaxx V1.2.x.MainFrame.AutoRespawn
G2L["20"] = Instance.new("TextButton", G2L["2"]);
G2L["20"]["TextWrapped"] = true;
G2L["20"]["TextStrokeTransparency"] = 0;
G2L["20"]["BorderSizePixel"] = 0;
G2L["20"]["TextSize"] = 14;
G2L["20"]["TextScaled"] = true;
G2L["20"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["20"]["BackgroundColor3"] = Color3.fromRGB(152, 255, 107);
G2L["20"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["20"]["Size"] = UDim2.new(0, 366, 0, 31);
G2L["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["20"]["Text"] = [[Auto Respawn: ON]];
G2L["20"]["Name"] = [[AutoRespawn]];
G2L["20"]["Position"] = UDim2.new(0, 53, 0, 502);


-- StarterGui.YardHaxx V1.2.x.MainFrame.AutoRespawn.Rainbow
G2L["21"] = Instance.new("LocalScript", G2L["20"]);
G2L["21"]["Name"] = [[Rainbow]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.Seperator1
G2L["22"] = Instance.new("Frame", G2L["2"]);
G2L["22"]["BorderSizePixel"] = 0;
G2L["22"]["BackgroundColor3"] = Color3.fromRGB(236, 236, 236);
G2L["22"]["Size"] = UDim2.new(0, -1, 0, 481);
G2L["22"]["Position"] = UDim2.new(0, 497, 0, 52);
G2L["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["22"]["Name"] = [[Seperator1]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.Uni Title
G2L["23"] = Instance.new("TextLabel", G2L["2"]);
G2L["23"]["TextWrapped"] = true;
G2L["23"]["TextStrokeTransparency"] = 0;
G2L["23"]["BorderSizePixel"] = 0;
G2L["23"]["TextSize"] = 14;
G2L["23"]["TextScaled"] = true;
G2L["23"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["23"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["23"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["23"]["BackgroundTransparency"] = 1;
G2L["23"]["Size"] = UDim2.new(0, 463, 0, 30);
G2L["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["23"]["Text"] = [[--[Universal Section]--]];
G2L["23"]["Name"] = [[Uni Title]];
G2L["23"]["Position"] = UDim2.new(0, 439, 0, 52);


-- StarterGui.YardHaxx V1.2.x.MainFrame.BTools
G2L["24"] = Instance.new("TextButton", G2L["2"]);
G2L["24"]["TextWrapped"] = true;
G2L["24"]["TextStrokeTransparency"] = 0;
G2L["24"]["BorderSizePixel"] = 0;
G2L["24"]["TextSize"] = 14;
G2L["24"]["TextScaled"] = true;
G2L["24"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["24"]["BackgroundColor3"] = Color3.fromRGB(152, 255, 107);
G2L["24"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["24"]["Size"] = UDim2.new(0, 90, 0, 28);
G2L["24"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["24"]["Text"] = [[Building Tools]];
G2L["24"]["Name"] = [[BTools]];
G2L["24"]["Position"] = UDim2.new(0, 529, 0, 88);


-- StarterGui.YardHaxx V1.2.x.MainFrame.Doors
G2L["25"] = Instance.new("TextButton", G2L["2"]);
G2L["25"]["TextWrapped"] = true;
G2L["25"]["TextStrokeTransparency"] = 0;
G2L["25"]["BorderSizePixel"] = 0;
G2L["25"]["TextSize"] = 14;
G2L["25"]["TextScaled"] = true;
G2L["25"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["25"]["BackgroundColor3"] = Color3.fromRGB(152, 255, 107);
G2L["25"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["25"]["Size"] = UDim2.new(0, 90, 0, 28);
G2L["25"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["25"]["Text"] = [[Destroy Doors]];
G2L["25"]["Name"] = [[Doors]];
G2L["25"]["Position"] = UDim2.new(0, 626, 0, 88);


-- StarterGui.YardHaxx V1.2.x.MainFrame.RDoors
G2L["26"] = Instance.new("TextButton", G2L["2"]);
G2L["26"]["TextWrapped"] = true;
G2L["26"]["TextStrokeTransparency"] = 0;
G2L["26"]["BorderSizePixel"] = 0;
G2L["26"]["TextSize"] = 14;
G2L["26"]["TextScaled"] = true;
G2L["26"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["26"]["BackgroundColor3"] = Color3.fromRGB(152, 255, 107);
G2L["26"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["26"]["Size"] = UDim2.new(0, 90, 0, 28);
G2L["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["26"]["Text"] = [[Restore Doors]];
G2L["26"]["Name"] = [[RDoors]];
G2L["26"]["Position"] = UDim2.new(0, 722, 0, 88);


-- StarterGui.YardHaxx V1.2.x.MainFrame.FERS
G2L["27"] = Instance.new("TextButton", G2L["2"]);
G2L["27"]["TextWrapped"] = true;
G2L["27"]["TextStrokeTransparency"] = 0;
G2L["27"]["BorderSizePixel"] = 0;
G2L["27"]["TextSize"] = 14;
G2L["27"]["TextScaled"] = true;
G2L["27"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["27"]["BackgroundColor3"] = Color3.fromRGB(152, 255, 107);
G2L["27"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["27"]["Size"] = UDim2.new(0, 90, 0, 28);
G2L["27"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["27"]["Text"] = [[FE Rainbow Sword]];
G2L["27"]["Name"] = [[FERS]];
G2L["27"]["Position"] = UDim2.new(0, 529, 0, 123);


-- StarterGui.YardHaxx V1.2.x.MainFrame.FERS.Rainbow
G2L["28"] = Instance.new("LocalScript", G2L["27"]);
G2L["28"]["Name"] = [[Rainbow]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.STitle
G2L["29"] = Instance.new("TextLabel", G2L["2"]);
G2L["29"]["TextWrapped"] = true;
G2L["29"]["TextStrokeTransparency"] = 0;
G2L["29"]["BorderSizePixel"] = 0;
G2L["29"]["TextSize"] = 14;
G2L["29"]["TextScaled"] = true;
G2L["29"]["BackgroundColor3"] = Color3.fromRGB(240, 240, 240);
G2L["29"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["29"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["29"]["Size"] = UDim2.new(0, 836, 0, 23);
G2L["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["29"]["Text"] = [[Made By Spartan X on Youtube]];
G2L["29"]["Name"] = [[STitle]];
G2L["29"]["Position"] = UDim2.new(0, 0, 0.9986, 0);


-- StarterGui.YardHaxx V1.2.x.MainFrame.STitle.Rainbow
G2L["2a"] = Instance.new("LocalScript", G2L["29"]);
G2L["2a"]["Name"] = [[Rainbow]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.FlingAll
G2L["2b"] = Instance.new("TextButton", G2L["2"]);
G2L["2b"]["TextWrapped"] = true;
G2L["2b"]["TextStrokeTransparency"] = 0;
G2L["2b"]["BorderSizePixel"] = 0;
G2L["2b"]["TextSize"] = 14;
G2L["2b"]["TextScaled"] = true;
G2L["2b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2b"]["BackgroundColor3"] = Color3.fromRGB(152, 255, 107);
G2L["2b"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["2b"]["Size"] = UDim2.new(0, 90, 0, 28);
G2L["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2b"]["Text"] = [[Fling All]];
G2L["2b"]["Name"] = [[FlingAll]];
G2L["2b"]["Position"] = UDim2.new(0, 626, 0, 123);


-- StarterGui.YardHaxx V1.2.x.MainFrame.FlingAll.Rainbow
G2L["2c"] = Instance.new("LocalScript", G2L["2b"]);
G2L["2c"]["Name"] = [[Rainbow]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.ESP
G2L["2d"] = Instance.new("TextButton", G2L["2"]);
G2L["2d"]["TextWrapped"] = true;
G2L["2d"]["TextStrokeTransparency"] = 0;
G2L["2d"]["BorderSizePixel"] = 0;
G2L["2d"]["TextSize"] = 14;
G2L["2d"]["TextScaled"] = true;
G2L["2d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2d"]["BackgroundColor3"] = Color3.fromRGB(152, 255, 107);
G2L["2d"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["2d"]["Size"] = UDim2.new(0, 90, 0, 28);
G2L["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2d"]["Text"] = [[ESP: OFF]];
G2L["2d"]["Name"] = [[ESP]];
G2L["2d"]["Position"] = UDim2.new(0, 722, 0, 123);


-- StarterGui.YardHaxx V1.2.x.MainFrame.ESP.Rainbow
G2L["2e"] = Instance.new("LocalScript", G2L["2d"]);
G2L["2e"]["Name"] = [[Rainbow]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.CrimBase
G2L["2f"] = Instance.new("TextButton", G2L["2"]);
G2L["2f"]["TextWrapped"] = true;
G2L["2f"]["TextStrokeTransparency"] = 0;
G2L["2f"]["BorderSizePixel"] = 0;
G2L["2f"]["TextSize"] = 14;
G2L["2f"]["TextScaled"] = true;
G2L["2f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2f"]["BackgroundColor3"] = Color3.fromRGB(203, 98, 255);
G2L["2f"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["2f"]["Size"] = UDim2.new(0, 90, 0, 28);
G2L["2f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2f"]["Text"] = [[Criminal Base]];
G2L["2f"]["Name"] = [[CrimBase]];
G2L["2f"]["Position"] = UDim2.new(0, 529, 0, 159);


-- StarterGui.YardHaxx V1.2.x.MainFrame.GasStation
G2L["30"] = Instance.new("TextButton", G2L["2"]);
G2L["30"]["TextWrapped"] = true;
G2L["30"]["TextStrokeTransparency"] = 0;
G2L["30"]["BorderSizePixel"] = 0;
G2L["30"]["TextSize"] = 14;
G2L["30"]["TextScaled"] = true;
G2L["30"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["30"]["BackgroundColor3"] = Color3.fromRGB(203, 98, 255);
G2L["30"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["30"]["Size"] = UDim2.new(0, 90, 0, 28);
G2L["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["30"]["Text"] = [[Gas Station]];
G2L["30"]["Name"] = [[GasStation]];
G2L["30"]["Position"] = UDim2.new(0, 626, 0, 159);


-- StarterGui.YardHaxx V1.2.x.MainFrame.Yard
G2L["31"] = Instance.new("TextButton", G2L["2"]);
G2L["31"]["TextWrapped"] = true;
G2L["31"]["TextStrokeTransparency"] = 0;
G2L["31"]["BorderSizePixel"] = 0;
G2L["31"]["TextSize"] = 14;
G2L["31"]["TextScaled"] = true;
G2L["31"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["31"]["BackgroundColor3"] = Color3.fromRGB(203, 98, 255);
G2L["31"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["31"]["Size"] = UDim2.new(0, 90, 0, 28);
G2L["31"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["31"]["Text"] = [[Yard]];
G2L["31"]["Name"] = [[Yard]];
G2L["31"]["Position"] = UDim2.new(0, 722, 0, 159);


-- StarterGui.YardHaxx V1.2.x.MainFrame.Nexus
G2L["32"] = Instance.new("TextButton", G2L["2"]);
G2L["32"]["TextWrapped"] = true;
G2L["32"]["TextStrokeTransparency"] = 0;
G2L["32"]["BorderSizePixel"] = 0;
G2L["32"]["TextSize"] = 14;
G2L["32"]["TextScaled"] = true;
G2L["32"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["32"]["BackgroundColor3"] = Color3.fromRGB(203, 98, 255);
G2L["32"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["32"]["Size"] = UDim2.new(0, 90, 0, 28);
G2L["32"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["32"]["Text"] = [[Nexus]];
G2L["32"]["Name"] = [[Nexus]];
G2L["32"]["Position"] = UDim2.new(0, 529, 0, 194);


-- StarterGui.YardHaxx V1.2.x.MainFrame.Neigh
G2L["33"] = Instance.new("TextButton", G2L["2"]);
G2L["33"]["TextWrapped"] = true;
G2L["33"]["TextStrokeTransparency"] = 0;
G2L["33"]["BorderSizePixel"] = 0;
G2L["33"]["TextSize"] = 14;
G2L["33"]["TextScaled"] = true;
G2L["33"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["33"]["BackgroundColor3"] = Color3.fromRGB(203, 98, 255);
G2L["33"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["33"]["Size"] = UDim2.new(0, 90, 0, 28);
G2L["33"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["33"]["Text"] = [[Neighbourhood]];
G2L["33"]["Name"] = [[Neigh]];
G2L["33"]["Position"] = UDim2.new(0, 626, 0, 194);


-- StarterGui.YardHaxx V1.2.x.MainFrame.Mansion
G2L["34"] = Instance.new("TextButton", G2L["2"]);
G2L["34"]["TextWrapped"] = true;
G2L["34"]["TextStrokeTransparency"] = 0;
G2L["34"]["BorderSizePixel"] = 0;
G2L["34"]["TextSize"] = 14;
G2L["34"]["TextScaled"] = true;
G2L["34"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["34"]["BackgroundColor3"] = Color3.fromRGB(203, 98, 255);
G2L["34"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["34"]["Size"] = UDim2.new(0, 90, 0, 28);
G2L["34"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["34"]["Text"] = [[Mansion]];
G2L["34"]["Name"] = [[Mansion]];
G2L["34"]["Position"] = UDim2.new(0, 722, 0, 194);


-- StarterGui.YardHaxx V1.2.x.MainFrame.Uni Title
G2L["35"] = Instance.new("TextLabel", G2L["2"]);
G2L["35"]["TextWrapped"] = true;
G2L["35"]["TextStrokeTransparency"] = 0;
G2L["35"]["BorderSizePixel"] = 0;
G2L["35"]["TextSize"] = 14;
G2L["35"]["TextScaled"] = true;
G2L["35"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["35"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["35"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["35"]["BackgroundTransparency"] = 1;
G2L["35"]["Size"] = UDim2.new(0, 463, 0, 30);
G2L["35"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["35"]["Text"] = [[--[HOT Scripts]--]];
G2L["35"]["Name"] = [[Uni Title]];
G2L["35"]["Position"] = UDim2.new(0, 439, 0, 310);


-- StarterGui.YardHaxx V1.2.x.MainFrame.IY
G2L["36"] = Instance.new("TextButton", G2L["2"]);
G2L["36"]["TextWrapped"] = true;
G2L["36"]["TextStrokeTransparency"] = 0;
G2L["36"]["BorderSizePixel"] = 0;
G2L["36"]["TextSize"] = 14;
G2L["36"]["TextScaled"] = true;
G2L["36"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["36"]["BackgroundColor3"] = Color3.fromRGB(152, 255, 107);
G2L["36"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["36"]["Size"] = UDim2.new(0, 90, 0, 28);
G2L["36"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["36"]["Text"] = [[Infinite Yield]];
G2L["36"]["Name"] = [[IY]];
G2L["36"]["Position"] = UDim2.new(0, 529, 0, 347);


-- StarterGui.YardHaxx V1.2.x.MainFrame.IY.Rainbow
G2L["37"] = Instance.new("LocalScript", G2L["36"]);
G2L["37"]["Name"] = [[Rainbow]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.FVR
G2L["38"] = Instance.new("TextButton", G2L["2"]);
G2L["38"]["TextWrapped"] = true;
G2L["38"]["TextStrokeTransparency"] = 0;
G2L["38"]["BorderSizePixel"] = 0;
G2L["38"]["TextSize"] = 14;
G2L["38"]["TextScaled"] = true;
G2L["38"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["38"]["BackgroundColor3"] = Color3.fromRGB(152, 255, 107);
G2L["38"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["38"]["Size"] = UDim2.new(0, 90, 0, 28);
G2L["38"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["38"]["Text"] = [[FE Void's Revenge]];
G2L["38"]["Name"] = [[FVR]];
G2L["38"]["Position"] = UDim2.new(0, 625, 0, 347);


-- StarterGui.YardHaxx V1.2.x.MainFrame.FVR.Rainbow
G2L["39"] = Instance.new("LocalScript", G2L["38"]);
G2L["39"]["Name"] = [[Rainbow]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.AdminV2
G2L["3a"] = Instance.new("TextButton", G2L["2"]);
G2L["3a"]["TextWrapped"] = true;
G2L["3a"]["TextStrokeTransparency"] = 0;
G2L["3a"]["BorderSizePixel"] = 0;
G2L["3a"]["TextSize"] = 14;
G2L["3a"]["TextScaled"] = true;
G2L["3a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3a"]["BackgroundColor3"] = Color3.fromRGB(152, 255, 107);
G2L["3a"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3a"]["Size"] = UDim2.new(0, 90, 0, 28);
G2L["3a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3a"]["Text"] = [[Admin V2]];
G2L["3a"]["Name"] = [[AdminV2]];
G2L["3a"]["Position"] = UDim2.new(0, 722, 0, 347);


-- StarterGui.YardHaxx V1.2.x.MainFrame.AdminV2.Rainbow
G2L["3b"] = Instance.new("LocalScript", G2L["3a"]);
G2L["3b"]["Name"] = [[Rainbow]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.Prizz
G2L["3c"] = Instance.new("TextButton", G2L["2"]);
G2L["3c"]["TextWrapped"] = true;
G2L["3c"]["TextStrokeTransparency"] = 0;
G2L["3c"]["BorderSizePixel"] = 0;
G2L["3c"]["TextSize"] = 14;
G2L["3c"]["TextScaled"] = true;
G2L["3c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3c"]["BackgroundColor3"] = Color3.fromRGB(152, 255, 107);
G2L["3c"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3c"]["Size"] = UDim2.new(0, 90, 0, 28);
G2L["3c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3c"]["Text"] = [[PrizzLife]];
G2L["3c"]["Name"] = [[Prizz]];
G2L["3c"]["Position"] = UDim2.new(0, 529, 0, 381);


-- StarterGui.YardHaxx V1.2.x.MainFrame.Prizz.Rainbow
G2L["3d"] = Instance.new("LocalScript", G2L["3c"]);
G2L["3d"]["Name"] = [[Rainbow]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.Pan
G2L["3e"] = Instance.new("TextButton", G2L["2"]);
G2L["3e"]["TextWrapped"] = true;
G2L["3e"]["TextStrokeTransparency"] = 0;
G2L["3e"]["BorderSizePixel"] = 0;
G2L["3e"]["TextSize"] = 14;
G2L["3e"]["TextScaled"] = true;
G2L["3e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3e"]["BackgroundColor3"] = Color3.fromRGB(152, 255, 107);
G2L["3e"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3e"]["Size"] = UDim2.new(0, 90, 0, 28);
G2L["3e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3e"]["Text"] = [[Admin Panel]];
G2L["3e"]["Name"] = [[Pan]];
G2L["3e"]["Position"] = UDim2.new(0, 625, 0, 381);


-- StarterGui.YardHaxx V1.2.x.MainFrame.Pan.Rainbow
G2L["3f"] = Instance.new("LocalScript", G2L["3e"]);
G2L["3f"]["Name"] = [[Rainbow]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.KillNeutral
G2L["40"] = Instance.new("TextButton", G2L["2"]);
G2L["40"]["TextWrapped"] = true;
G2L["40"]["TextStrokeTransparency"] = 0;
G2L["40"]["BorderSizePixel"] = 0;
G2L["40"]["TextSize"] = 14;
G2L["40"]["TextScaled"] = true;
G2L["40"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["40"]["BackgroundColor3"] = Color3.fromRGB(152, 255, 107);
G2L["40"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["40"]["Size"] = UDim2.new(0, 96, 0, 28);
G2L["40"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["40"]["Text"] = [[Kill Neutrals]];
G2L["40"]["Name"] = [[KillNeutral]];
G2L["40"]["Position"] = UDim2.new(0, 32, 0, 194);


-- StarterGui.YardHaxx V1.2.x.MainFrame.KillNeutral.Rainbow
G2L["41"] = Instance.new("LocalScript", G2L["40"]);
G2L["41"]["Name"] = [[Rainbow]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.OpenAllDoors
G2L["42"] = Instance.new("TextButton", G2L["2"]);
G2L["42"]["TextWrapped"] = true;
G2L["42"]["TextStrokeTransparency"] = 0;
G2L["42"]["BorderSizePixel"] = 0;
G2L["42"]["TextSize"] = 14;
G2L["42"]["TextScaled"] = true;
G2L["42"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["42"]["BackgroundColor3"] = Color3.fromRGB(81, 151, 255);
G2L["42"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["42"]["Size"] = UDim2.new(0, 87, 0, 28);
G2L["42"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["42"]["Text"] = [[Open Doors]];
G2L["42"]["Name"] = [[OpenAllDoors]];
G2L["42"]["Position"] = UDim2.new(0, 49, 0, 266);


-- StarterGui.YardHaxx V1.2.x.MainFrame.OpenAllGates
G2L["43"] = Instance.new("TextButton", G2L["2"]);
G2L["43"]["TextWrapped"] = true;
G2L["43"]["TextStrokeTransparency"] = 0;
G2L["43"]["BorderSizePixel"] = 0;
G2L["43"]["TextSize"] = 14;
G2L["43"]["TextScaled"] = true;
G2L["43"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["43"]["BackgroundColor3"] = Color3.fromRGB(81, 151, 255);
G2L["43"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["43"]["Size"] = UDim2.new(0, 87, 0, 28);
G2L["43"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["43"]["Text"] = [[Open Gates]];
G2L["43"]["Name"] = [[OpenAllGates]];
G2L["43"]["Position"] = UDim2.new(0, 146, 0, 266);


-- StarterGui.YardHaxx V1.2.x.MainFrame.Keycard
G2L["44"] = Instance.new("TextButton", G2L["2"]);
G2L["44"]["TextWrapped"] = true;
G2L["44"]["TextStrokeTransparency"] = 0;
G2L["44"]["BorderSizePixel"] = 0;
G2L["44"]["TextSize"] = 14;
G2L["44"]["TextScaled"] = true;
G2L["44"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["44"]["BackgroundColor3"] = Color3.fromRGB(81, 151, 255);
G2L["44"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["44"]["Size"] = UDim2.new(0, 87, 0, 28);
G2L["44"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["44"]["Text"] = [[Give Keycard]];
G2L["44"]["Name"] = [[Keycard]];
G2L["44"]["Position"] = UDim2.new(0, 242, 0, 266);


-- StarterGui.YardHaxx V1.2.x.MainFrame.UnESP
G2L["45"] = Instance.new("TextButton", G2L["2"]);
G2L["45"]["TextWrapped"] = true;
G2L["45"]["TextStrokeTransparency"] = 0;
G2L["45"]["BorderSizePixel"] = 0;
G2L["45"]["TextSize"] = 14;
G2L["45"]["TextScaled"] = true;
G2L["45"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["45"]["BackgroundColor3"] = Color3.fromRGB(152, 255, 107);
G2L["45"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["45"]["Size"] = UDim2.new(0, 90, 0, 28);
G2L["45"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["45"]["Text"] = [[Unnamed ESP]];
G2L["45"]["Name"] = [[UnESP]];
G2L["45"]["Position"] = UDim2.new(0, 722, 0, 381);


-- StarterGui.YardHaxx V1.2.x.MainFrame.UnESP.Rainbow
G2L["46"] = Instance.new("LocalScript", G2L["45"]);
G2L["46"]["Name"] = [[Rainbow]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.AutoGun
G2L["47"] = Instance.new("TextButton", G2L["2"]);
G2L["47"]["TextWrapped"] = true;
G2L["47"]["TextStrokeTransparency"] = 0;
G2L["47"]["BorderSizePixel"] = 0;
G2L["47"]["TextSize"] = 14;
G2L["47"]["TextScaled"] = true;
G2L["47"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["47"]["BackgroundColor3"] = Color3.fromRGB(81, 151, 255);
G2L["47"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["47"]["Size"] = UDim2.new(0, 87, 0, 28);
G2L["47"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["47"]["Text"] = [[Auto Guns: OFF]];
G2L["47"]["Name"] = [[AutoGun]];
G2L["47"]["Position"] = UDim2.new(0, 340, 0, 266);


-- StarterGui.YardHaxx V1.2.x.MainFrame.AutoGun.Rainbow
G2L["48"] = Instance.new("LocalScript", G2L["47"]);
G2L["48"]["Name"] = [[Rainbow]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.InfJumps
G2L["49"] = Instance.new("TextButton", G2L["2"]);
G2L["49"]["TextWrapped"] = true;
G2L["49"]["TextStrokeTransparency"] = 0;
G2L["49"]["BorderSizePixel"] = 0;
G2L["49"]["TextSize"] = 14;
G2L["49"]["TextScaled"] = true;
G2L["49"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["49"]["BackgroundColor3"] = Color3.fromRGB(203, 98, 255);
G2L["49"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["49"]["Size"] = UDim2.new(0, 90, 0, 28);
G2L["49"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["49"]["Text"] = [[InfJump: OFF]];
G2L["49"]["Name"] = [[InfJumps]];
G2L["49"]["Position"] = UDim2.new(0, 529, 0, 229);


-- StarterGui.YardHaxx V1.2.x.MainFrame.Neutral
G2L["4a"] = Instance.new("TextButton", G2L["2"]);
G2L["4a"]["TextWrapped"] = true;
G2L["4a"]["TextStrokeTransparency"] = 0;
G2L["4a"]["BorderSizePixel"] = 0;
G2L["4a"]["TextSize"] = 14;
G2L["4a"]["TextScaled"] = true;
G2L["4a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4a"]["BackgroundColor3"] = Color3.fromRGB(126, 126, 126);
G2L["4a"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4a"]["Size"] = UDim2.new(0, 101, 0, 30);
G2L["4a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4a"]["Text"] = [[Become Neutral]];
G2L["4a"]["Name"] = [[Neutral]];
G2L["4a"]["Position"] = UDim2.new(0, 356, 0, 378);


-- StarterGui.YardHaxx V1.2.x.MainFrame.Hitboxes
G2L["4b"] = Instance.new("TextButton", G2L["2"]);
G2L["4b"]["TextWrapped"] = true;
G2L["4b"]["TextStrokeTransparency"] = 0;
G2L["4b"]["BorderSizePixel"] = 0;
G2L["4b"]["TextSize"] = 14;
G2L["4b"]["TextScaled"] = true;
G2L["4b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4b"]["BackgroundColor3"] = Color3.fromRGB(203, 98, 255);
G2L["4b"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4b"]["Size"] = UDim2.new(0, 90, 0, 28);
G2L["4b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4b"]["Text"] = [[Hit Box Enlarge: OFF]];
G2L["4b"]["Name"] = [[Hitboxes]];
G2L["4b"]["Position"] = UDim2.new(0, 626, 0, 229);


-- StarterGui.YardHaxx V1.2.x.MainFrame.Hitboxes.Rainbow
G2L["4c"] = Instance.new("LocalScript", G2L["4b"]);
G2L["4c"]["Name"] = [[Rainbow]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.GearGUI
G2L["4d"] = Instance.new("TextButton", G2L["2"]);
G2L["4d"]["TextWrapped"] = true;
G2L["4d"]["TextStrokeTransparency"] = 0;
G2L["4d"]["BorderSizePixel"] = 0;
G2L["4d"]["TextSize"] = 14;
G2L["4d"]["TextScaled"] = true;
G2L["4d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4d"]["BackgroundColor3"] = Color3.fromRGB(152, 255, 107);
G2L["4d"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4d"]["Size"] = UDim2.new(0, 90, 0, 28);
G2L["4d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4d"]["Text"] = [[FE Gear GUI]];
G2L["4d"]["Name"] = [[GearGUI]];
G2L["4d"]["Position"] = UDim2.new(0, 529, 0, 415);


-- StarterGui.YardHaxx V1.2.x.MainFrame.GearGUI.Rainbow
G2L["4e"] = Instance.new("LocalScript", G2L["4d"]);
G2L["4e"]["Name"] = [[Rainbow]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.AdminOG
G2L["4f"] = Instance.new("TextButton", G2L["2"]);
G2L["4f"]["TextWrapped"] = true;
G2L["4f"]["TextStrokeTransparency"] = 0;
G2L["4f"]["BorderSizePixel"] = 0;
G2L["4f"]["TextSize"] = 14;
G2L["4f"]["TextScaled"] = true;
G2L["4f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4f"]["BackgroundColor3"] = Color3.fromRGB(152, 255, 107);
G2L["4f"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4f"]["Size"] = UDim2.new(0, 90, 0, 28);
G2L["4f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4f"]["Text"] = [[OG Admin]];
G2L["4f"]["Name"] = [[AdminOG]];
G2L["4f"]["Position"] = UDim2.new(0, 625, 0, 415);


-- StarterGui.YardHaxx V1.2.x.MainFrame.AdminOG.Rainbow
G2L["50"] = Instance.new("LocalScript", G2L["4f"]);
G2L["50"]["Name"] = [[Rainbow]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.JakeGUI
G2L["51"] = Instance.new("TextButton", G2L["2"]);
G2L["51"]["TextWrapped"] = true;
G2L["51"]["TextStrokeTransparency"] = 0;
G2L["51"]["BorderSizePixel"] = 0;
G2L["51"]["TextSize"] = 14;
G2L["51"]["TextScaled"] = true;
G2L["51"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["51"]["BackgroundColor3"] = Color3.fromRGB(152, 255, 107);
G2L["51"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["51"]["Size"] = UDim2.new(0, 90, 0, 28);
G2L["51"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["51"]["Text"] = [[Jake11Price GUI]];
G2L["51"]["Name"] = [[JakeGUI]];
G2L["51"]["Position"] = UDim2.new(0, 722, 0, 415);


-- StarterGui.YardHaxx V1.2.x.MainFrame.JakeGUI.Rainbow
G2L["52"] = Instance.new("LocalScript", G2L["51"]);
G2L["52"]["Name"] = [[Rainbow]];


-- StarterGui.YardHaxx V1.2.x.MainFrame.Fly
G2L["53"] = Instance.new("TextButton", G2L["2"]);
G2L["53"]["TextWrapped"] = true;
G2L["53"]["TextStrokeTransparency"] = 0;
G2L["53"]["BorderSizePixel"] = 0;
G2L["53"]["TextSize"] = 14;
G2L["53"]["TextScaled"] = true;
G2L["53"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["53"]["BackgroundColor3"] = Color3.fromRGB(203, 98, 255);
G2L["53"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["53"]["Size"] = UDim2.new(0, 90, 0, 28);
G2L["53"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["53"]["Text"] = [[Fly: OFF]];
G2L["53"]["Name"] = [[Fly]];
G2L["53"]["Position"] = UDim2.new(0, 722, 0, 229);


-- StarterGui.YardHaxx V1.2.x.MainFrame.Fly.Rainbow
G2L["54"] = Instance.new("LocalScript", G2L["53"]);
G2L["54"]["Name"] = [[Rainbow]];


-- StarterGui.YardHaxx V1.2.x.ScriptClient
G2L["55"] = Instance.new("LocalScript", G2L["1"]);
G2L["55"]["Name"] = [[ScriptClient]];


-- StarterGui.YardHaxx V1.2.x.ScriptClient.YardHaxxAPI
G2L["56"] = Instance.new("ModuleScript", G2L["55"]);
G2L["56"]["Name"] = [[YardHaxxAPI]];


-- StarterGui.YardHaxx V1.2.x.HumanoidFrame
G2L["57"] = Instance.new("Frame", G2L["1"]);
G2L["57"]["Visible"] = false;
G2L["57"]["Active"] = true;
G2L["57"]["BorderSizePixel"] = 0;
G2L["57"]["BackgroundColor3"] = Color3.fromRGB(89, 89, 89);
G2L["57"]["Selectable"] = true;
G2L["57"]["Size"] = UDim2.new(0, 386, 0, 272);
G2L["57"]["Position"] = UDim2.new(0, 1099, 0, 82);
G2L["57"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["57"]["Name"] = [[HumanoidFrame]];


-- StarterGui.YardHaxx V1.2.x.HumanoidFrame.Title
G2L["58"] = Instance.new("TextLabel", G2L["57"]);
G2L["58"]["TextWrapped"] = true;
G2L["58"]["TextStrokeTransparency"] = 0;
G2L["58"]["BorderSizePixel"] = 0;
G2L["58"]["TextSize"] = 14;
G2L["58"]["TextScaled"] = true;
G2L["58"]["BackgroundColor3"] = Color3.fromRGB(214, 240, 42);
G2L["58"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["58"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["58"]["Size"] = UDim2.new(0, 385, 0, 29);
G2L["58"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["58"]["Text"] = [[Humanoid Tricker]];
G2L["58"]["Name"] = [[Title]];
G2L["58"]["Position"] = UDim2.new(0, 0, 0, 0);


-- StarterGui.YardHaxx V1.2.x.HumanoidFrame.Title.Rainbow
G2L["59"] = Instance.new("LocalScript", G2L["58"]);
G2L["59"]["Name"] = [[Rainbow]];


-- StarterGui.YardHaxx V1.2.x.HumanoidFrame.SpeedTitle
G2L["5a"] = Instance.new("TextLabel", G2L["57"]);
G2L["5a"]["TextWrapped"] = true;
G2L["5a"]["TextStrokeTransparency"] = 0;
G2L["5a"]["BorderSizePixel"] = 0;
G2L["5a"]["TextSize"] = 14;
G2L["5a"]["TextScaled"] = true;
G2L["5a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5a"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5a"]["BackgroundTransparency"] = 1;
G2L["5a"]["Size"] = UDim2.new(0, 372, 0, 24);
G2L["5a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5a"]["Text"] = [[--[Walk Speed Section]--]];
G2L["5a"]["Name"] = [[SpeedTitle]];
G2L["5a"]["Position"] = UDim2.new(0, 6, 0, 44);


-- StarterGui.YardHaxx V1.2.x.HumanoidFrame.Seperator1
G2L["5b"] = Instance.new("Frame", G2L["57"]);
G2L["5b"]["BorderSizePixel"] = 0;
G2L["5b"]["BackgroundColor3"] = Color3.fromRGB(236, 236, 236);
G2L["5b"]["Size"] = UDim2.new(0, 372, 0, 1);
G2L["5b"]["Position"] = UDim2.new(0, 5, 0, 259);
G2L["5b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5b"]["Name"] = [[Seperator1]];


-- StarterGui.YardHaxx V1.2.x.HumanoidFrame.Close
G2L["5c"] = Instance.new("TextButton", G2L["57"]);
G2L["5c"]["TextWrapped"] = true;
G2L["5c"]["TextStrokeTransparency"] = 0;
G2L["5c"]["BorderSizePixel"] = 0;
G2L["5c"]["TextSize"] = 14;
G2L["5c"]["TextScaled"] = true;
G2L["5c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5c"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
G2L["5c"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5c"]["Size"] = UDim2.new(0, 32, 0, 29);
G2L["5c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5c"]["Text"] = [[X]];
G2L["5c"]["Name"] = [[Close]];
G2L["5c"]["Position"] = UDim2.new(0, 354, 0, 0);


-- StarterGui.YardHaxx V1.2.x.HumanoidFrame.WSBox
G2L["5d"] = Instance.new("TextBox", G2L["57"]);
G2L["5d"]["TextStrokeTransparency"] = 0;
G2L["5d"]["Name"] = [[WSBox]];
G2L["5d"]["BorderSizePixel"] = 0;
G2L["5d"]["TextWrapped"] = true;
G2L["5d"]["TextSize"] = 14;
G2L["5d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5d"]["TextScaled"] = true;
G2L["5d"]["BackgroundColor3"] = Color3.fromRGB(118, 118, 118);
G2L["5d"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5d"]["PlaceholderText"] = [[WalkSpeed Here]];
G2L["5d"]["Size"] = UDim2.new(0, 193, 0, 38);
G2L["5d"]["Position"] = UDim2.new(0, 96, 0, 83);
G2L["5d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5d"]["Text"] = [[]];


-- StarterGui.YardHaxx V1.2.x.HumanoidFrame.JumpTitle
G2L["5e"] = Instance.new("TextLabel", G2L["57"]);
G2L["5e"]["TextWrapped"] = true;
G2L["5e"]["TextStrokeTransparency"] = 0;
G2L["5e"]["BorderSizePixel"] = 0;
G2L["5e"]["TextSize"] = 14;
G2L["5e"]["TextScaled"] = true;
G2L["5e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5e"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5e"]["BackgroundTransparency"] = 1;
G2L["5e"]["Size"] = UDim2.new(0, 372, 0, 24);
G2L["5e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5e"]["Text"] = [[--[Jump Power Section]--]];
G2L["5e"]["Name"] = [[JumpTitle]];
G2L["5e"]["Position"] = UDim2.new(0, 6, 0, 164);


-- StarterGui.YardHaxx V1.2.x.HumanoidFrame.JPBox
G2L["5f"] = Instance.new("TextBox", G2L["57"]);
G2L["5f"]["TextStrokeTransparency"] = 0;
G2L["5f"]["Name"] = [[JPBox]];
G2L["5f"]["BorderSizePixel"] = 0;
G2L["5f"]["TextWrapped"] = true;
G2L["5f"]["TextSize"] = 14;
G2L["5f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5f"]["TextScaled"] = true;
G2L["5f"]["BackgroundColor3"] = Color3.fromRGB(118, 118, 118);
G2L["5f"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5f"]["PlaceholderText"] = [[JumpPower Here]];
G2L["5f"]["Size"] = UDim2.new(0, 193, 0, 38);
G2L["5f"]["Position"] = UDim2.new(0, 96, 0, 202);
G2L["5f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5f"]["Text"] = [[]];


-- StarterGui.YardHaxx V1.2.x.HumanoidFrame.Seperator1
G2L["60"] = Instance.new("Frame", G2L["57"]);
G2L["60"]["BorderSizePixel"] = 0;
G2L["60"]["BackgroundColor3"] = Color3.fromRGB(236, 236, 236);
G2L["60"]["Size"] = UDim2.new(0, 372, 0, 1);
G2L["60"]["Position"] = UDim2.new(0, 6, 0, 143);
G2L["60"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["60"]["Name"] = [[Seperator1]];


-- StarterGui.YardHaxx V1.2.x.GunFrame
G2L["61"] = Instance.new("Frame", G2L["1"]);
G2L["61"]["Visible"] = false;
G2L["61"]["Active"] = true;
G2L["61"]["BorderSizePixel"] = 0;
G2L["61"]["BackgroundColor3"] = Color3.fromRGB(89, 89, 89);
G2L["61"]["Selectable"] = true;
G2L["61"]["Size"] = UDim2.new(0, 386, 0, 315);
G2L["61"]["Position"] = UDim2.new(0, 1099, 0, 366);
G2L["61"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["61"]["Name"] = [[GunFrame]];


-- StarterGui.YardHaxx V1.2.x.GunFrame.Title
G2L["62"] = Instance.new("TextLabel", G2L["61"]);
G2L["62"]["TextWrapped"] = true;
G2L["62"]["TextStrokeTransparency"] = 0;
G2L["62"]["BorderSizePixel"] = 0;
G2L["62"]["TextSize"] = 14;
G2L["62"]["TextScaled"] = true;
G2L["62"]["BackgroundColor3"] = Color3.fromRGB(214, 240, 42);
G2L["62"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["62"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["62"]["Size"] = UDim2.new(0, 385, 0, 33);
G2L["62"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["62"]["Text"] = [[GunHaxx V1.0.0]];
G2L["62"]["Name"] = [[Title]];


-- StarterGui.YardHaxx V1.2.x.GunFrame.Title.Rainbow
G2L["63"] = Instance.new("LocalScript", G2L["62"]);
G2L["63"]["Name"] = [[Rainbow]];


-- StarterGui.YardHaxx V1.2.x.GunFrame.GunTitle
G2L["64"] = Instance.new("TextLabel", G2L["61"]);
G2L["64"]["TextWrapped"] = true;
G2L["64"]["TextStrokeTransparency"] = 0;
G2L["64"]["BorderSizePixel"] = 0;
G2L["64"]["TextSize"] = 14;
G2L["64"]["TextScaled"] = true;
G2L["64"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["64"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["64"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["64"]["BackgroundTransparency"] = 1;
G2L["64"]["Size"] = UDim2.new(0, 372, 0, 29);
G2L["64"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["64"]["Text"] = [[--[Gun Name]--]];
G2L["64"]["Name"] = [[GunTitle]];
G2L["64"]["Position"] = UDim2.new(0, 7, 0, 59);


-- StarterGui.YardHaxx V1.2.x.GunFrame.Seperator1
G2L["65"] = Instance.new("Frame", G2L["61"]);
G2L["65"]["BorderSizePixel"] = 0;
G2L["65"]["BackgroundColor3"] = Color3.fromRGB(236, 236, 236);
G2L["65"]["Size"] = UDim2.new(0, 372, 0, 1);
G2L["65"]["Position"] = UDim2.new(0, 5, 0, 299);
G2L["65"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["65"]["Name"] = [[Seperator1]];


-- StarterGui.YardHaxx V1.2.x.GunFrame.Close
G2L["66"] = Instance.new("TextButton", G2L["61"]);
G2L["66"]["TextWrapped"] = true;
G2L["66"]["TextStrokeTransparency"] = 0;
G2L["66"]["BorderSizePixel"] = 0;
G2L["66"]["TextSize"] = 14;
G2L["66"]["TextScaled"] = true;
G2L["66"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["66"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
G2L["66"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["66"]["Size"] = UDim2.new(0, 32, 0, 33);
G2L["66"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["66"]["Text"] = [[X]];
G2L["66"]["Name"] = [[Close]];
G2L["66"]["Position"] = UDim2.new(0, 354, 0, 0);


-- StarterGui.YardHaxx V1.2.x.GunFrame.GunNameBox
G2L["67"] = Instance.new("TextBox", G2L["61"]);
G2L["67"]["TextStrokeTransparency"] = 0;
G2L["67"]["Name"] = [[GunNameBox]];
G2L["67"]["BorderSizePixel"] = 0;
G2L["67"]["TextWrapped"] = true;
G2L["67"]["TextSize"] = 14;
G2L["67"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["67"]["TextScaled"] = true;
G2L["67"]["BackgroundColor3"] = Color3.fromRGB(118, 118, 118);
G2L["67"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["67"]["PlaceholderText"] = [[Gun Name Here]];
G2L["67"]["Size"] = UDim2.new(0, 193, 0, 44);
G2L["67"]["Position"] = UDim2.new(0, 96, 0, 96);
G2L["67"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["67"]["Text"] = [[]];


-- StarterGui.YardHaxx V1.2.x.GunFrame.ColorTitle
G2L["68"] = Instance.new("TextLabel", G2L["61"]);
G2L["68"]["TextWrapped"] = true;
G2L["68"]["TextStrokeTransparency"] = 0;
G2L["68"]["BorderSizePixel"] = 0;
G2L["68"]["TextSize"] = 14;
G2L["68"]["TextScaled"] = true;
G2L["68"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["68"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["68"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["68"]["BackgroundTransparency"] = 1;
G2L["68"]["Size"] = UDim2.new(0, 372, 0, 29);
G2L["68"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["68"]["Text"] = [[--[Gun Color]--]];
G2L["68"]["Name"] = [[ColorTitle]];
G2L["68"]["Position"] = UDim2.new(0, 6, 0, 196);


-- StarterGui.YardHaxx V1.2.x.GunFrame.ColorBox
G2L["69"] = Instance.new("TextBox", G2L["61"]);
G2L["69"]["TextStrokeTransparency"] = 0;
G2L["69"]["Name"] = [[ColorBox]];
G2L["69"]["BorderSizePixel"] = 0;
G2L["69"]["TextWrapped"] = true;
G2L["69"]["TextSize"] = 14;
G2L["69"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["69"]["TextScaled"] = true;
G2L["69"]["BackgroundColor3"] = Color3.fromRGB(118, 118, 118);
G2L["69"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["69"]["PlaceholderText"] = [[Color Here]];
G2L["69"]["Size"] = UDim2.new(0, 193, 0, 44);
G2L["69"]["Position"] = UDim2.new(0, 96, 0, 233);
G2L["69"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["69"]["Text"] = [[]];


-- StarterGui.YardHaxx V1.2.x.GunFrame.Seperator1
G2L["6a"] = Instance.new("Frame", G2L["61"]);
G2L["6a"]["BorderSizePixel"] = 0;
G2L["6a"]["BackgroundColor3"] = Color3.fromRGB(236, 236, 236);
G2L["6a"]["Size"] = UDim2.new(0, 372, 0, 1);
G2L["6a"]["Position"] = UDim2.new(0, 6, 0, 165);
G2L["6a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6a"]["Name"] = [[Seperator1]];


-- StarterGui.YardHaxx V1.2.x.Open
G2L["6b"] = Instance.new("TextButton", G2L["1"]);
G2L["6b"]["TextWrapped"] = true;
G2L["6b"]["TextStrokeTransparency"] = 0;
G2L["6b"]["BorderSizePixel"] = 0;
G2L["6b"]["TextSize"] = 14;
G2L["6b"]["TextScaled"] = true;
G2L["6b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6b"]["BackgroundColor3"] = Color3.fromRGB(199, 199, 199);
G2L["6b"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["6b"]["Size"] = UDim2.new(0, 160, 0, 39);
G2L["6b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6b"]["Text"] = [[Open YardHaxx V1.2]];
G2L["6b"]["Name"] = [[Open]];
G2L["6b"]["Visible"] = false;
G2L["6b"]["Position"] = UDim2.new(0.00593, 0, 0.93063, 0);


-- StarterGui.YardHaxx V1.2.x.Open.UICorner
G2L["6c"] = Instance.new("UICorner", G2L["6b"]);



-- StarterGui.YardHaxx V1.2.x.Open.UIStroke
G2L["6d"] = Instance.new("UIStroke", G2L["6b"]);
G2L["6d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["6d"]["Thickness"] = 4;


-- StarterGui.YardHaxx V1.2.x.Open.UIStroke.Rainbow
G2L["6e"] = Instance.new("LocalScript", G2L["6d"]);
G2L["6e"]["Name"] = [[Rainbow]];


-- Require G2L wrapper
local G2L_REQUIRE = require;
local G2L_MODULES = {};
local function require(Module:ModuleScript)
    local ModuleState = G2L_MODULES[Module];
    if ModuleState then
        if not ModuleState.Required then
            ModuleState.Required = true;
            ModuleState.Value = ModuleState.Closure();
        end
        return ModuleState.Value;
    end;
    return G2L_REQUIRE(Module);
end

G2L_MODULES[G2L["56"]] = {
Closure = function()
    local script = G2L["56"];local YardHaxxAPI = {}

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Teams = game:GetService("Teams")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer


-- SharedTables
local YardHaxxAPI_Bools = {
	KillAura = false;
	Noclip = false;
	ESP = false;
}

local YardHaxxAPI_Numbers = {
	WS = 18; -- Default
	JP = 50;
}

local YardHaxxAPI_Storage = {
	PreviousCameraPosition = nil;
	Connections = {};
	Storage = {
		InfiniteJump = false;
		AntiArrest = false;
		AutoRespawn = true;
		OGMethod = false;
		AutoGuns = false;
		EnlargedHitBoxes = false;
		Fly = false;
	};
	Saved = {
		AutoRespawn = nil;
	};
}

-- Local Functions
local PerformAction = function(state:string, plrstate)

	local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

	if char then
		if not plrstate then
			if state:lower() == "sit" or state:lower() == "seat" then
				char['Humanoid'].Sit = true
			elseif state:lower() == "unseat" or state:lower() == "unsit" then
				for i = 1, 10 do
					RunService.Heartbeat:Wait()

					char['Humanoid'].Sit = false

					RunService.RenderStepped:Wait()

					char['Humanoid'].Sit = false

					RunService.Stepped:Wait()

					char['Humanoid'].Sit = false
				end
			elseif state:lower() == "unequip" then
				LocalPlayer.Character:FindFirstChild("Humanoid"):UnequipTools()
			elseif state:lower() == "die" or state:lower() == "kill" then
				LocalPlayer.Character:FindFirstChild("Humanoid").Health = 0
			elseif state:lower() == "died" or state:lower() == "ondeath" then
				LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
			elseif state:lower() == "jump" or state:lower() == "fakejump" then
				LocalPlayer.Character:FindFirstChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
			end
		elseif plrstate then
			if state:lower() == "setspeed" or state:lower() == "speed" then
				char['Humanoid'].WalkSpeed = plrstate
			elseif state:lower() == "setjump" or state:lower() == "setjp" then
				char['Humanoid'].JumpPower = plrstate
			elseif state:lower() == "setstate" then
				LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(plrstate)
			elseif state:lower() == "equip" then
				LocalPlayer.Character:FindFirstChild("Humanoid"):EquipTool(plrstate)
			end
		end
	end
end

local WaitForTask = function(source,args,Interval)
	local interval = Interval or 5
	local timeout = tick() + interval
	repeat 
		RunService.Stepped:Wait()
	until
	source:FindFirstChild(args) or tick() - timeout >= 0
	timeout = nil

	if source:FindFirstChild(args) then
		return source:FindFirstChild(args)
	else
		return nil
	end
end

local SetCFrame = function(x : CFrame)
	LocalPlayer.Character['HumanoidRootPart'].CFrame = x;
end

local GrabItem = function(itemorigin, item)
	local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
	local timeout = tick() + 5

	if hrp then 
		YardHaxxAPI_Storage.Saved.GetGunOldPos = not YardHaxxAPI_Storage.Saved.GetGunOldPos and hrp.CFrame or YardHaxxAPI_Storage.Saved.GetGunOldPos;
	end

	local ItemToGrab = itemorigin:FindFirstChild(item)
	local IP = ItemToGrab['ITEMPICKUP']
	local IPPos= IP.Position

	if hrp then 
		SetCFrame(CFrame.new(IPPos));
	end; 

	repeat task.wait()

		pcall(function()
			LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = false;
			SetCFrame(CFrame.new(IP))
		end); 
		task.spawn(function()
			game:GetService("Workspace").Remote.ItemHandler:InvokeServer(IP)
		end)

	until LocalPlayer.Backpack:FindFirstChild(item) or LocalPlayer.Character:FindFirstChild(item) or tick() - timeout >=0

	pcall(function() 
		SetCFrame(YardHaxxAPI_Storage.Saved.GetGunOldPos);
	end) 


	YardHaxxAPI_Storage.Saved.GetGunOldPos = nil
end

local GiveItem = function(gungiver, gun)
	if gungiver and gungiver == "old" then
		game:GetService("Workspace").Remote.ItemHandler:InvokeServer(gun)
		return
	end
	
	if YardHaxxAPI_Storage.Storage.OGMethod then
		if gungiver then
			GrabItem(gungiver,gun)
		else
			for _, givers in pairs(workspace.Prison_ITEMS:GetChildren()) do
				if givers:FindFirstChild(gun) then
					GrabItem(gungiver, gun)
					break
				end

				return
			end
		end
		
		return
	end

	if gungiver then
		workspace.Remote.ItemHandler:InvokeServer({Position = LocalPlayer.Character.Head.Position, Parent = gungiver:FindFirstChild(gun)})
	else
		workspace.Remote.ItemHandler:InvokeServer({Position = LocalPlayer.Character.Head.Position, Parent = workspace.Prison_ITEMS.giver:FindFirstChild(gun) or workspace.Prison_ITEMS.single:FindFirstChild(gun)})
	end
end

local SaveCameraPosition = function()
	YardHaxxAPI_Storage.PreviousCameraPosition = workspace.Camera.CFrame
end

local LoadCameraPosition = function()
	RunService.RenderStepped:Wait()
	workspace['Camera'].CFrame = YardHaxxAPI_Storage.PreviousCameraPosition or workspace['Camera'].CFrame
end

local SetHRPCframe = function(pos)
	LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = pos
end

local SpecialPing = function(v)
	if v then
		task.wait(v)
	end
	local SP1 = tick()
	pcall(function()
		workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.buttons["Car Spawner"]["Car Spawner"])
	end)
	local SP2 = tick()
	local SkibidiMath = (SP2-SP1) * 1000
	return SkibidiMath
end

-- Global Functions (Can be called through client and server scripts)
function YardHaxxAPI.ObtainWeapon(gunGet)
	local gun = gunGet;

	local PG = { -- Possible Guns to Spawn
		["AK-47"] = true,
		["Remington 870"] = true,
		["M9"] = true,
		["All"] = true
	}

	local SpawnGun = function(guntogive : string)
		if guntogive ~= "All" then
			workspace.Remote.ItemHandler:InvokeServer({
				Position = LocalPlayer.Character.Head.Position,
				Parent = workspace.Prison_ITEMS.giver:FindFirstChild(guntogive)
					or workspace.Prison_ITEMS.single:FindFirstChild(guntogive)
			})
		else
			for gunName, _ in pairs(PG) do
				if gunName ~= "All" then
					workspace.Remote.ItemHandler:InvokeServer({
						Position = LocalPlayer.Character.Head.Position,
						Parent = workspace.Prison_ITEMS.giver:FindFirstChild(gunName)
							or workspace.Prison_ITEMS.single:FindFirstChild(gunName)
					})
				end
			end
		end
	end

	task.spawn(function()
		local guntask = function()
			if PG[gun] and gun ~= "All" then
				SpawnGun(gun);
			else
				SpawnGun("All");
			end
		end

		guntask()
	end)
end

function YardHaxxAPI.SetFly(toggle: boolean)
	YardHaxxAPI_Storage.Storage.Fly = toggle

	local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local hrp = char:WaitForChild("HumanoidRootPart")
	local hum = char:FindFirstChild("Humanoid")
	if not hum then return end

	local speed = 50
	local flying = toggle
	local upVel, forwardVel, rightVel = 0, 0, 0

	local bodyGyro, bodyVelocity

	if toggle then
		bodyGyro = Instance.new("BodyGyro", hrp)
		bodyGyro.P = 9e4
		bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
		bodyGyro.CFrame = hrp.CFrame

		bodyVelocity = Instance.new("BodyVelocity", hrp)
		bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)

		hum.PlatformStand = true

		local move = {
			E = speed, Space = speed, Q = -speed,
			W = speed, S = -speed, A = -speed, D = speed
		}

		local inputBeganConn = UserInputService.InputBegan:Connect(function(input, gpe)
			if gpe or not flying then return end
			local key = input.KeyCode.Name
			if move[key] then
				if key == "E" or key == "Space" or key == "Q" then
					upVel = move[key]
				elseif key == "W" or key == "S" then
					forwardVel = move[key]
				elseif key == "A" or key == "D" then
					rightVel = move[key]
				end
			end
		end)

		local inputEndedConn = UserInputService.InputEnded:Connect(function(input)
			if not flying then return end
			local key = input.KeyCode.Name
			if key == "E" or key == "Space" or key == "Q" then
				upVel = 0
			elseif key == "W" or key == "S" then
				forwardVel = 0
			elseif key == "A" or key == "D" then
				rightVel = 0
			end
		end)

		local renderConn
		renderConn = RunService.RenderStepped:Connect(function()
			if not flying or not YardHaxxAPI_Storage.Storage.Fly then
				if inputBeganConn then inputBeganConn:Disconnect() end
				if inputEndedConn then inputEndedConn:Disconnect() end
				if renderConn then renderConn:Disconnect() end
				if bodyGyro then bodyGyro:Destroy() end
				if bodyVelocity then bodyVelocity:Destroy() end
				if hum then hum.PlatformStand = false end
				return
			end

			bodyGyro.CFrame = workspace.CurrentCamera.CFrame
			bodyVelocity.Velocity =
				workspace.CurrentCamera.CFrame.LookVector * forwardVel +
				workspace.CurrentCamera.CFrame.RightVector * rightVel +
				Vector3.new(0, upVel, 0)
		end)
	else
		YardHaxxAPI_Storage.Storage.Fly = false
	end
end

function YardHaxxAPI.ToggleAura(toggle:boolean)
	YardHaxxAPI_Bools.KillAura = toggle
end

function YardHaxxAPI.RegisterUI(Title, Message, BC, BT, NWC)
	local Title                  = Title;
	local AboutMessage           = Message;
	local BackgroundColor        = BC;
	local BackgroundTransparency = BT;
	local NotifyWhenChanged = NWC


	-- Variables (I recommend you not change this stuff tehee)
	local Players     = game:GetService("Players");
	local LocalPlayer = Players.LocalPlayer;
	local PUI         = LocalPlayer.PlayerGui;

	local Home         = PUI['Home'];
	local hud          = Home['hud'];
	local Topbar       = hud['Topbar'];
	local Pulldownmenu = Topbar['Pulldownmenu'];
	local titleBar     = Topbar['titleBar'];
	local Frame        = Pulldownmenu['Frame']
	local Desc         = Frame['Description']

	task.spawn(function()
		if NotifyWhenChanged then
			game:GetService("StarterGui"):SetCore("SendNotification",{
				Title = ("Successfully Changed Title Bar Text To: "..Title);
				Text = ("Successfully Changed About Message To: "..AboutMessage);
			})
		end

		local titletask = function()
			task.wait()

			titleBar.Title.Text             = Title;
			Desc.Text                       = AboutMessage;
			titleBar.BackgroundColor3       = BackgroundColor;
			titleBar.BackgroundTransparency = BackgroundTransparency
		end

		pcall(function() titletask() end)

		titleBar.Title:GetPropertyChangedSignal("Text"):Connect(function()
			pcall(function() titletask() end)
		end)
	end)
end

function YardHaxxAPI.Notify(text:string,dur:number)
	StarterGui:SetCore("SendNotification",{
		Title = "YardHaxx API";
		Text = text;
		Duration = dur or 5;
	})
end

function YardHaxxAPI.SetTeam(team:string)
	local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

	if char then

		local savedPosition = char['HumanoidRootPart'].CFrame
		YardHaxxAPI_Storage.Saved.AutoRespawn = savedPosition
		SaveCameraPosition()

		if team:lower() == "criminal" or team:lower() == "crim" then
			if LocalPlayer.TeamColor.Name == "Medium stone grey" then
				workspace.Remote['TeamEvent']:FireServer("Bright orange")
			end
			workspace["Criminals Spawn"].SpawnLocation.CanCollide = false
			repeat
				pcall(function()
					workspace["Criminals Spawn"].SpawnLocation.CFrame = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
				end)

				RunService.Stepped:Wait()
			until LocalPlayer.TeamColor == BrickColor.new("Really red")
			return

		elseif team:lower() == "guard" or team:lower() == "cop" then
			workspace.Remote['TeamEvent']:FireServer("Bright blue")
			if #Teams.Guards:GetPlayers() > 7 then
				YardHaxxAPI.Notify("Guards team is full.")
				return
			end
		elseif team:lower() == "inmate" or team:lower() == "prisoner" then
			workspace.Remote['TeamEvent']:FireServer("Bright orange")
		end
		LocalPlayer.CharacterAdded:Wait();
		WaitForTask(char, "HumanoidRootPart", 5)
		LoadCameraPosition()
	end
end

YardHaxxAPI_Storage.Saved.AutoRespawn = false
local diedevent
local char0 = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local function ondiedevent()
	coroutine.wrap(function()
		diedevent:Disconnect();
		SaveCameraPosition()
		YardHaxxAPI_Storage.Saved.AutoRespawn = char0:WaitForChild("HumanoidRootPart", 1) and LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
	end)()
	if YardHaxxAPI_Storage.Storage.AutoRespawn then
		local playerTeam = LocalPlayer.TeamColor
		if playerTeam == BrickColor.new("Really red") then
			if #Teams.Guards:GetPlayers() < 8 then
				workspace.Remote['TeamEvent']:FireServer("Bright blue")
			else
				workspace.Remote['TeamEvent']:FireServer("Bright orange")
			end

			workspace['Criminals Spawn'].SpawnLocation.CanCollide = false
			workspace['Criminals Spawn'].SpawnLocation.CFrame = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
			LocalPlayer.CharacterAdded:Wait()
			repeat 
				task.wait()
				pcall(function()
					workspace['Criminals Spawn'].SpawnLocation.CFrame = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
				end)
			until
			LocalPlayer.TeamColor == BrickColor.new("Really red");
		elseif playerTeam == BrickColor.new("Bright blue") then
			if #Teams.Guards:GetPlayers() == 8 then
				workspace.Remote['TeamEvent']:FireServer("Bright orange")
			end;

			workspace.Remote['TeamEvent']:FireServer("Bright blue")
		elseif playerTeam == BrickColor.new("Bright orange") then
			workspace.Remote['TeamEvent']:FireServer("Bright orange")
		else
			workspace.Remote['TeamEvent']:FireServer("Medium stone grey")
		end
	end
end

local function AddCharacterTask()
	diedevent:Disconnect()
	local Humanoid = char0:WaitForChild("Humanoid", 1)
	if Humanoid then
		diedevent = Humanoid.Died:Connect(ondiedevent)
		if YardHaxxAPI_Storage.Connections['Humanation'] then
			YardHaxxAPI_Storage.Connections['Humanation']:Disconnect();
			YardHaxxAPI_Storage.Connections['Humanation'] = nil
		end

		YardHaxxAPI_Storage.Connections['Humanation'] = Humanoid.AnimationPlayed:Connect(function(description)
			if YardHaxxAPI_Storage.Storage.AntiArrest and description.Animation.AnimationId == "rbxassetid://287112271" then
				description:Stop();
				description:Destroy()

				task.delay(4.95, function()
					local hrp, hascriminalrecord = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame, LocalPlayer.TeamColor.Name == "Really red" or nil;
					YardHaxxAPI_Storage.Saved.AutoRespawn = hrp;
					SaveCameraPosition()

					LocalPlayer.CharacterAdded:Wait();
					WaitForTask(LocalPlayer.Character, "HumanoidRootPart", 1).CFrame = hrp;
					LoadCameraPosition()

					if hascriminalrecord then
						YardHaxxAPI.SetTeam("crim")
					end
				end)

				task.delay(0, function()
					PerformAction("speed", YardHaxxAPI_Numbers.WS);
					task.wait(0.3);
					PerformAction("jump", YardHaxxAPI_Numbers.JP)
				end)
			end
		end)
	end
end

local function OnCharacterAdded()
	char0 = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	coroutine.wrap(AddCharacterTask)()
	if YardHaxxAPI_Storage.Saved.AutoRespawn and YardHaxxAPI_Storage.Storage.AutoRespawn then
		local hrp = char0:WaitForChild("HumanoidRootPart", 1)

		if hrp then
			hrp.CFrame = YardHaxxAPI_Storage.Saved.AutoRespawn;
			LoadCameraPosition();
			hrp.CFrame = YardHaxxAPI_Storage.Saved.AutoRespawn

			task.spawn(function()
				for i=1,3 do
					task.wait();

					hrp.CFrame = YardHaxxAPI_Storage.Saved.AutoRespawn
				end
			end)

			if wait() and not hrp:FindFirstChildWhichIsA("ForceField") then
				for i=1,4 do
					hrp.CFrame = YardHaxxAPI_Storage.Saved.AutoRespawn;
					WaitForTask(LocalPlayer.Character, "HumanoidRootPart", 1).CFrame = YardHaxxAPI_Storage.Saved.AutoRespawn
				end;

				char0:WaitForChild("HumanoidRootPart", 1).CFrame = YardHaxxAPI_Storage.Saved.AutoRespawn
			end
		end
	end

	char0:WaitForChild("Humanoid", 1):SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
	char0:WaitForChild("Humanoid", 1):SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
end

diedevent = char0:WaitForChild("Humanoid").Died:Connect(ondiedevent)
YardHaxxAPI_Storage.Connections['CharacterAdded'] = LocalPlayer.CharacterAdded:Connect(OnCharacterAdded)

function YardHaxxAPI.VarietyKill(plrs, exclude)
	local gun = LocalPlayer.Backpack:FindFirstChild("AK-47") or LocalPlayer.Character:FindFirstChild("AK-47")

	if not gun and LocalPlayer.TeamColor ~= BrickColor.new("Bright blue") then
		YardHaxxAPI.ObtainWeapon("AK-47")
		task.wait()
		gun = LocalPlayer.Backpack:FindFirstChild("AK-47") or LocalPlayer.Character:FindFirstChild("AK-47")
	elseif LocalPlayer.TeamColor == BrickColor.new("Bright blue") then
		gun = LocalPlayer.Backpack:FindFirstChild("M9") or LocalPlayer.Character:FindFirstChild("M9")
	end

	local nkill = false
	local gotPlayers = false
	local ShootEvents = {}

	for _, x in pairs(plrs:GetPlayers()) do
		if x ~= LocalPlayer and x ~= exclude then
			local char = x.Character
			local hum = char and char:FindFirstChild("Humanoid")
			if char and hum and hum.Health > 0 and not char:FindFirstChildWhichIsA("ForceField") then
				gotPlayers = true

				if x.TeamColor == LocalPlayer.TeamColor then
					if x.TeamColor == BrickColor.new("Bright orange") then
						YardHaxxAPI.SetTeam("criminal")
					elseif x.TeamColor == BrickColor.new("Really red") or x.TeamColor == BrickColor.new("Bright blue") then
						nkill = true
					end
				end

				for i = 1, 10 do
					ShootEvents[#ShootEvents + 1] = {
						Hit = char:FindFirstChildWhichIsA("Part");
						Cframe = CFrame.new();
						RayObject = Ray.new(Vector3.new(), Vector3.new());
						Distance = 0;
					}
				end
			elseif char and char:FindFirstChildWhichIsA("ForceField") then
				YardHaxxAPI.Notify("Could not kill " .. x.Name .. " because they have a forcefield.", 5)
			end
		end
	end

	if not gotPlayers then
		return
	end

	task.spawn(function()
		for i = 1, 20 do
			ReplicatedStorage.ReloadEvent:FireServer(gun)
			task.wait(0.1)
		end
	end)

	if nkill then
		YardHaxxAPI_Storage.Saved.AutoRespawn = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
		SaveCameraPosition()
		YardHaxxAPI.SetTeam("neutral")
		ReplicatedStorage.ShootEvent:FireServer(ShootEvents, gun)
		task.wait(0.06)
		YardHaxxAPI.SetTeam("inmate")
	else
		ReplicatedStorage.ShootEvent:FireServer(ShootEvents, gun)
	end
end

function YardHaxxAPI.SetNoclip(toggle:boolean)
	YardHaxxAPI_Bools.Noclip = toggle
end

function YardHaxxAPI.SetSpeed(ws:number)
	YardHaxxAPI_Numbers.WS = ws
end

function YardHaxxAPI.SetJump(jp:number)
	YardHaxxAPI_Numbers.JP = jp
end

local SetHRPCframe = function(CFrame)
	local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

	if char then
		char['HumanoidRootPart'].CFrame = CFrame
	end
end

function YardHaxxAPI.Teleport(teleport:string)
	local Teleports = {
		nspawn = CFrame.new(879, 28, 2349);
		cells = CFrame.new(918.9735107421875, 99.98998260498047, 2451.423583984375);
		nexus = CFrame.new(877.929688, 99.9899826, 2373.57031, 0.989495575, 1.64841456e-08, 0.144563332, -3.13438235e-08, 1, 1.00512544e-07, -0.144563332, -1.0398788e-07, 0.989495575);
		armory = CFrame.new(836.130432, 99.9899826, 2284.55908, 0.999849498, 5.64007507e-08, -0.0173475463, -5.636889e-08, 1, 2.3254485e-09, 0.0173475463, -1.34723666e-09, 0.999849498);
		yard = CFrame.new(787.560425, 97.9999237, 2468.32056, -0.999741256, -7.32754017e-08, -0.0227459427, -7.49895506e-08, 1, 7.45077955e-08, 0.0227459427, 7.6194226e-08, -0.999741256);
		crimbase = CFrame.new(-864.760071, 94.4760284, 2085.87671, 0.999284029, 1.78674284e-08, 0.0378339142, -1.85715123e-08, 1, 1.82584365e-08, -0.0378339142, -1.89479969e-08, 0.999284029);
		cafe = CFrame.new(884.492798, 99.9899368, 2293.54907, -0.0628612712, -2.14097344e-08, -0.998022258, -9.52544568e-08, 1, -1.54524784e-08, 0.998022258, 9.40947018e-08, -0.0628612712);
		kitchen = CFrame.new(936.633118, 99.9899368, 2224.77148, -0.00265917974, -9.30829671e-08, 0.999996483, -3.28682326e-08, 1, 9.29958901e-08, -0.999996483, -3.26208252e-08, -0.00265917974);
		roof = CFrame.new(918.694092, 139.709427, 2266.60986, -0.998788536, -7.55880691e-08, -0.0492084064, -7.8453354e-08, 1, 5.62961198e-08, 0.0492084064, 6.00884817e-08, -0.998788536);
		vents = CFrame.new(933.55376574342, 121.534234671875, 2232.7952174975);
		office = CFrame.new(706.1928465, 103.14982749, 2344.3957382525);
		ytower = CFrame.new(786.731873, 125.039917, 2587.79834, -0.0578307845, 8.82393678e-08, 0.998326421, 6.09781523e-08, 1, -8.48549675e-08, -0.998326421, 5.59688687e-08, -0.0578307845);
		gtower = CFrame.new(505.551605, 125.039917, 2127.41138, -0.99910152, 5.44945458e-08, 0.0423811078, 5.36830491e-08, 1, -2.02856469e-08, -0.0423811078, -1.79922726e-08, -0.99910152);
		garage = CFrame.new(618.705566, 98.039917, 2469.14136, 0.997341573, 1.85835844e-08, -0.0728682056, -1.79448154e-08, 1, 9.42077172e-09, 0.0728682056, -8.0881204e-09, 0.997341573);
		sewers = CFrame.new(917.123657, 78.6990509, 2297.05298, -0.999281704, -9.98203404e-08, -0.0378962979, -1.01324503e-07, 1, 3.77708638e-08, 0.0378962979, 4.15835579e-08, -0.999281704);
		neighborhood = CFrame.new(-281.254669, 54.1751289, 2484.75513, 0.0408788249, 3.26279768e-08, 0.999164104, -3.88249717e-08, 1, -3.10668256e-08, -0.999164104, -3.75225433e-08, 0.0408788249);
		gas = CFrame.new(-497.284821, 54.3937759, 1686.3175, 0.585129559, -4.33374865e-08, -0.810939848, 5.33533938e-13, 1, -5.34406759e-08, 0.810939848, 3.12692876e-08, 0.585129559);
		deadend = CFrame.new(-979.852478, 54.1750259, 1382.78967, 0.0152699631, 8.88235174e-09, 0.999883413, 6.75286884e-08, 1, -9.9146682e-09, -0.999883413, 6.76722109e-08, 0.0152699631);
		store = CFrame.new(455.089508, 11.4253607, 1222.89746, 0.99995482, -3.92535604e-09, 0.00950394664, 2.84450263e-09, 1, 1.1374032e-07, -0.00950394664, -1.13708147e-07, 0.99995482);
		roadend = CFrame.new(1060.81995, 67.5668106, 1847.08923, 0.0752086118, -1.01192255e-08, -0.997167826, 4.30985886e-10, 1, -1.01154605e-08, 0.997167826, 3.31004502e-10, 0.0752086118);
		trapbuilding = CFrame.new(-306.715485, 84.2401199, 1984.13367, -0.802221119, 5.70582088e-08, -0.597027004, 4.81801123e-08, 1, 3.08312771e-08, 0.597027004, -4.0313255e-09, -0.802221119);
		mansion = CFrame.new(-315.790436, 64.5724411, 1840.83521, 0.80697298, -4.47871713e-08, 0.590588331, 1.14004006e-08, 1, 6.02574701e-08, -0.590588331, -4.18932053e-08, 0.80697298);
		trapbase = CFrame.new(-943.973145, 94.1287613, 1919.73694, 0.025614135, -1.48015129e-08, 0.999671876, 1.00375175e-07, 1, 1.22345032e-08, -0.999671876, 1.00028863e-07, 0.025614135);
		buildingroof = CFrame.new(-317.689331, 118.838821, 2009.28186, 0.749499857, 2.48145682e-09, 0.662004471, 3.51757373e-10, 1, -4.14664703e-09, -0.662004471, 3.34077632e-09, 0.749499857);
	};

	if teleport:lower() == "nexus" then
		SetHRPCframe(Teleports.nexus)
	elseif teleport:lower() == "criminal base" or teleport:lower() == "crimbase" then
		SetHRPCframe(Teleports.crimbase)
	elseif teleport:lower() == "yard" then
		SetHRPCframe(Teleports.yard)
	elseif teleport:lower() == "neigh" then
		SetHRPCframe(Teleports.neighborhood)
	elseif teleport:lower() == "mansion" then
		SetHRPCframe(Teleports.mansion)
	elseif teleport:lower() == "gas" then
		SetHRPCframe(Teleports.gas)
	end
end

function YardHaxxAPI.SetAutoRespawn(toggle:boolean)
	YardHaxxAPI_Storage.Storage.AutoRespawn = toggle
end

function YardHaxxAPI.SpawnBuildingTools()
	local hammer = Instance.new("HopperBin", LocalPlayer.Backpack)
	local gametool = Instance.new("HopperBin", LocalPlayer.Backpack)
	local scriptt = Instance.new("HopperBin", LocalPlayer.Backpack)
	local grab = Instance.new("HopperBin", LocalPlayer.Backpack)
	local clonee = Instance.new("HopperBin", LocalPlayer.Backpack)
	hammer.BinType = "Hammer"
	gametool.BinType = "GameTool"
	scriptt.BinType = "Script"
	grab.BinType = "Grab"
	clonee.BinType = "Clone"
end

function YardHaxxAPI.ToggleDoors(toggle:boolean)
	if toggle then
		local doors = ReplicatedStorage:FindFirstChild("Doors")
		if doors then
			doors.Parent = workspace
		else
			YardHaxxAPI.Notify("Doors already exists!")
		end
	else
		local doors = workspace:FindFirstChild("Doors")
		if doors then
			doors.Parent = ReplicatedStorage
		else
			YardHaxxAPI.Notify("Doors already destroyed!")
		end
	end
end

function YardHaxxAPI.SpawnNeonSword()
	local rainbow_sword = Instance.new("Tool")
	rainbow_sword.Grip = CFrame.fromMatrix(Vector3.new(-1.399998664855957, 0.1999998539686203, -5.881091169612773e-08), Vector3.new(-5.212530643119821e-16, -1.1924880638503055e-08, 1), Vector3.new(1, -4.371138828673793e-08, 0), Vector3.new(4.371138828673793e-08, 1, 1.1924880638503055e-08))
	rainbow_sword.GripForward = Vector3.new(-4.371138828673793e-08, -1, -1.1924880638503055e-08)
	rainbow_sword.GripPos = Vector3.new(-1.399998664855957, 0.1999998539686203, -5.881091169612773e-08)
	rainbow_sword.GripRight = Vector3.new(-5.212530643119821e-16, -1.1924880638503055e-08, 1)
	rainbow_sword.GripUp = Vector3.new(1, -4.371138828673793e-08, 0)
	rainbow_sword.WorldPivot = CFrame.fromMatrix(Vector3.new(64.5, 0.5000039935112, -12.125), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
	rainbow_sword.Name = "Rainbow Sword"
	rainbow_sword.Parent = game.Players.LocalPlayer.Backpack

	local handle = Instance.new("Part")
	handle.BottomSurface = Enum.SurfaceType.Smooth
	handle.BrickColor = BrickColor.new(0.06666667014360428, 0.06666667014360428, 0.06666667014360428)
	handle.CFrame = CFrame.fromMatrix(Vector3.new(63.875, 0.5000039935112, -12.125), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
	handle.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
	handle.Material = Enum.Material.Neon
	handle.Size = Vector3.new(3.625, 0.75, 0.75)
	handle.TopSurface = Enum.SurfaceType.Smooth
	handle.Name = "Handle"
	handle.Parent = rainbow_sword

	local sounds = Instance.new("Folder")
	sounds.Name = "Sounds"
	sounds.Parent = rainbow_sword

	local slash = Instance.new("Sound")
	slash.SoundId = "rbxassetid://88633606"
	slash.Volume = 1
	slash.Name = "Slash"
	slash.Parent = sounds

	local anims = Instance.new("Folder")
	anims.Name = "Anims"
	anims.Parent = handle

	local swing = Instance.new("Animation")
	swing.AnimationId = "rbxassetid://218504594"
	swing.Name = "Swing"
	swing.Parent = anims

	local AnimTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(swing)


	rainbow_sword.Activated:Connect(function()local a=game.Players.LocalPlayer local b="74894663"local c=Instance.new("Animation")c.AnimationId="rbxassetid://218504594"..b local a=a.Character.Humanoid:LoadAnimation(c)a:Play()a:AdjustSpeed(2)local c=Instance.new("Sound")c.Parent=handle c.MaxDistance=math.huge c.SoundId="rbxassetid://88633606"c.Volume=2 wait()c:Play()for a,b in pairs(game.Players:GetChildren())do if b.Name~=game.Players.LocalPlayer.Name then for a=1,10 do game.ReplicatedStorage.meleeEvent:FireServer(b)c:Destroy()end end end end)

	rainbow_sword.Activated:Connect(function()
		AnimTrack:Play()
		slash:Play()
	end)

	task.spawn(function()
		local speed = 1
		local hue = 0

		while true do
			handle.Color = Color3.fromHSV(hue, 1, 1)
			hue += 0.01 * speed

			if hue > 1 then
				hue -= 1
			end

			task.wait(0.03)
		end
	end)
end

function YardHaxxAPI.SkidFlingAll()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CorgiSideExploits/OrionLib/refs/heads/main/SkidFling", true))()
end

function YardHaxxAPI.ToggleESP(toggle:boolean)
	YardHaxxAPI_Bools.ESP = toggle
end

function YardHaxxAPI.OpenAllDoors(opengate)
	local prevTeam = nil
	if #Teams.Guards:GetPlayers() >= 8 and not (LocalPlayer.TeamColor == BrickColor.new("Bright blue")) then
		YardHaxxAPI.Notify("Guards team is full. Could not open doors.")
		return
	elseif not (LocalPlayer.TeamColor == BrickColor.new("Bright blue")) then
		prevTeam = LocalPlayer.TeamColor
		SaveCameraPosition()
		YardHaxxAPI.SetTeam("cop")
		WaitForTask(LocalPlayer.Character, "HumanoidRootPart", 3)
	end

	if opengate then
		local prevPos = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
		local gate = workspace["Prison_ITEMS"].buttons["Prison Gate"]["Prison Gate"]
		for i = 1, 4 do
			SetHRPCframe(gate:GetPivot())
			workspace.Remote.ItemHandler:InvokeServer(gate)
		end
		SetHRPCframe(prevPos)
	end

	local Collisions = {}
	for _, door in pairs(workspace.Doors:GetChildren()) do
		if door:IsA("Model") then
			local original = door:GetPivot()
			door:PivotTo(LocalPlayer.Character:GetPivot())
			for _, part in pairs(door:GetDescendants()) do
				if part:IsA("BasePart") and part.CanCollide then
					Collisions[part] = true
					part.CanCollide = false
				end
			end
			task.delay(0, function()
				door:PivotTo(original)
				for _, part in pairs(door:GetDescendants()) do
					if part:IsA("BasePart") and Collisions[part] then
						part.CanCollide = true
					end
				end
			end)
		end
	end

	SpecialPing(0.03)

	if prevTeam then
		task.wait(2)
		SaveCameraPosition()
		if prevTeam == BrickColor.new("Really red") then
			YardHaxxAPI.SetTeam("crim")
		elseif prevTeam == BrickColor.new("Bright orange") then
			YardHaxxAPI.SetTeam("inmate")
		end
	end
end

function YardHaxxAPI.SetEnlargedHitboxes(toggle:boolean)
	YardHaxxAPI_Storage.Storage.EnlargedHitBoxes = toggle
end

function YardHaxxAPI.SpawnKeycard(targetPlayer)
	local function waitForKeycardNearPlayer(player)
		local found = false
		while task.wait() do
			for _, v in pairs(workspace.Prison_ITEMS.single:GetChildren()) do
				if v.Name == "Key card" and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
					local vp = v.ITEMPICKUP.Position
					local pp = player.Character.HumanoidRootPart.Position
					if (vp - pp).Magnitude <= 15 then
						found = true
						break
					end
				end
			end
			if found then break end
		end
	end

	targetPlayer = targetPlayer or LocalPlayer

	if targetPlayer == LocalPlayer then
		if workspace.Prison_ITEMS.single:FindFirstChild("Key card") then
			GiveItem(false, "Key card")
		else
			local oldTeam = LocalPlayer.TeamColor
			local oldPos = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.HumanoidRootPart.CFrame
			YardHaxxAPI_Storage.Saved.AutoRespawn = oldPos

			repeat
				task.wait()
				if LocalPlayer.TeamColor ~= BrickColor.new("Bright blue") then
					if #Teams.Guards:GetPlayers() > 7 then
						YardHaxxAPI.Notify("Guards team is full, could not spawn keycard.")
						break
					end
					YardHaxxAPI.SetTeam("cop")
				end
				PerformAction("died")
				if not YardHaxxAPI_Storage.Storage.AutoRespawn then
					YardHaxxAPI.SetTeam("cop")
				else
					LocalPlayer.CharacterAdded:Wait()
				end
				task.wait(0.1)
			until workspace.Prison_ITEMS.single:FindFirstChild("Key card")

			SetCFrame(oldPos)
			if oldTeam == BrickColor.new("Bright orange") then
				YardHaxxAPI.SetTeam("inmate")
			elseif oldTeam == BrickColor.new("Really red") then
				YardHaxxAPI.SetTeam("crim")
			end

			for _ = 1, 5 do
				GiveItem(false, "Key card")
			end
		end
	else
		local keyFound = false
		local oldTeam = LocalPlayer.TeamColor
		local oldPos = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.HumanoidRootPart.CFrame
		YardHaxxAPI_Storage.Saved.AutoRespawn = oldPos

		task.spawn(function()
			waitForKeycardNearPlayer(targetPlayer)
			keyFound = true
		end)

		repeat
			task.wait()
			if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
				local pos = targetPlayer.Character.HumanoidRootPart.CFrame
				SetCFrame(pos)
				if LocalPlayer.TeamColor ~= BrickColor.new("Bright blue") then
					if #Teams.Guards:GetPlayers() > 7 then
						keyFound = true
						break
					end
					YardHaxxAPI.SetTeam("cop")
					LocalPlayer.CharacterAdded:Wait()
					LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = pos
				end
				PerformAction("died")
				if YardHaxxAPI_Storage.Storage.AutoRespawn then
					LocalPlayer.CharacterAdded:Wait()
					LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = pos
				else
					YardHaxxAPI.SetTeam("cop")
				end
			else
				keyFound = true
				break
			end
			task.wait(0.1)
		until keyFound

		SetCFrame(oldPos)
		if oldTeam == BrickColor.new("Bright orange") then
			YardHaxxAPI.SetTeam("inmate")
		elseif oldTeam == BrickColor.new("Really red") then
			YardHaxxAPI.SetTeam("crim")
		end
	end
end

function YardHaxxAPI.SetInfJump(toggle:boolean)
	YardHaxxAPI_Storage.Storage.InfiniteJump = toggle
end

function YardHaxxAPI.SetAutoGuns(toggle:boolean)
	YardHaxxAPI_Storage.Storage.AutoGuns = toggle
end

-- Tasks
task.spawn(function()
	RunService.RenderStepped:Connect(function()
		if YardHaxxAPI_Bools['KillAura'] then
			for i,x in pairs(Players:GetPlayers()) do
				if x ~= LocalPlayer then
					ReplicatedStorage['meleeEvent']:FireServer(x)
				end
			end
		end

		local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

		if char then

			task.spawn(function()
				for i,x in pairs(char:GetDescendants()) do
					if x:IsA("BasePart") then
						if YardHaxxAPI_Bools.Noclip then
							x.CanCollide = false
						elseif not YardHaxxAPI_Bools.Noclip then
							if x.Name == "Torso" then
								x.CanCollide = true
							end
						end
					end
				end
			end)
			task.spawn(function()
				char['Humanoid'].WalkSpeed = YardHaxxAPI_Numbers.WS;
				char['Humanoid'].JumpPower = YardHaxxAPI_Numbers.JP;
			end)
		end
	end)
end)

task.spawn(function()
	while true do
		if YardHaxxAPI_Bools.ESP then
			for _, v in pairs(Players:GetPlayers()) do
				if v ~= LocalPlayer and v.Character then
					local existing = v.Character:FindFirstChild("Highlight")
					if not existing then
						local highlight = Instance.new("Highlight")
						highlight.Name = "Highlight"
						highlight.FillColor = v.TeamColor.Color
						highlight.Enabled = true
						highlight.Parent = v.Character
					else
						existing.FillColor = v.TeamColor.Color
						existing.Enabled = true
					end
				end
			end
		else
			for _, v in pairs(Players:GetPlayers()) do
				if v ~= LocalPlayer and v.Character then
					local h = v.Character:FindFirstChild("Highlight")
					if h then
						h:Destroy()
					end
				end
			end
		end
		task.wait(0.2)
	end
end)

task.spawn(function()
	UserInputService.InputBegan:Connect(function(input,gameProcessedEvent)
		if YardHaxxAPI_Storage.Storage.InfiniteJump then
			if input.KeyCode == Enum.KeyCode.Space then
				local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

				if char then
					char:FindFirstChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
				end
			end
		end
	end)
end)

task.spawn(function()
	_G.HeadSize = 8
	_G.Disabled = true
	_G.Reset = true

	RunService.RenderStepped:Connect(function()
		for _, x in pairs(Players:GetPlayers()) do
			if x.Name ~= LocalPlayer.Name then
				local char = x.Character or x.CharacterAdded:Wait()
				local hrp = char:FindFirstChild("HumanoidRootPart")
				if hrp then
					pcall(function()
						if YardHaxxAPI_Storage.Storage.EnlargedHitBoxes and _G.Disabled then
							hrp.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
							hrp.Transparency = 0.9
							hrp.BrickColor = x.TeamColor
							hrp.Material = Enum.Material.Neon
							hrp.CanCollide = false
						else
							hrp.Size = Vector3.new(2, 2, 1)
							hrp.Transparency = 1
							hrp.BrickColor = BrickColor.new("Medium stone grey")
							hrp.Material = Enum.Material.Plastic
							hrp.CanCollide = true
						end
					end)

					if _G.Reset and char:FindFirstChild("Humanoid") and char.Humanoid.Health <= 0 then
						hrp.Size = Vector3.new(2, 2, 1)
					end
				end
			end
		end
	end)
end)

task.spawn(function()
	RunService.RenderStepped:Connect(function()
		if YardHaxxAPI_Storage.Storage.AutoGuns then
			
			local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
			
			local gun = not LocalPlayer.Backpack:FindFirstChild("AK-47") or not char:FindFirstChild("AK-47") or not LocalPlayer.Backpack:FindFirstChild("Remington 870") or not char:FindFirstChild("Remington 870") or not LocalPlayer.Backpack:FindFirstChild("M9") or not char:FindFirstChild("M9")
			
			if gun then
				if char then
					YardHaxxAPI.ObtainWeapon("All")
				end
			end
		end
	end)
end)

return YardHaxxAPI

end;
};
-- StarterGui.YardHaxx V1.2.x.MainFrame.KillAll.Rainbow
local function C_e()
local script = G2L["e"];
	local part = script.Parent
	
	local speed = 1 -- How fast the color cycles (1 = normal, 2 = double speed, etc.)
	local hue = 0 -- Starting hue (0 to 1)
	
	while true do
		part.BackgroundColor3 = Color3.fromHSV(hue, 1, 1) -- Full saturation and brightness
		hue += 0.01 * speed
	
		if hue > 1 then
			hue -= 1
		end
	
		task.wait(0.03) -- Adjust for smoothness and performance
	end
end;
task.spawn(C_e);
-- StarterGui.YardHaxx V1.2.x.MainFrame.KillInmates.Rainbow
local function C_10()
local script = G2L["10"];
	local part = script.Parent
	
	local speed = 1 -- How fast the color cycles (1 = normal, 2 = double speed, etc.)
	local hue = 0 -- Starting hue (0 to 1)
	
	while true do
		part.BackgroundColor3 = Color3.fromHSV(hue, 1, 1) -- Full saturation and brightness
		hue += 0.01 * speed
	
		if hue > 1 then
			hue -= 1
		end
	
		task.wait(0.03) -- Adjust for smoothness and performance
	end
end;
task.spawn(C_10);
-- StarterGui.YardHaxx V1.2.x.MainFrame.KillCops.Rainbow
local function C_12()
local script = G2L["12"];
	local part = script.Parent
	
	local speed = 1 -- How fast the color cycles (1 = normal, 2 = double speed, etc.)
	local hue = 0 -- Starting hue (0 to 1)
	
	while true do
		part.BackgroundColor3 = Color3.fromHSV(hue, 1, 1) -- Full saturation and brightness
		hue += 0.01 * speed
	
		if hue > 1 then
			hue -= 1
		end
	
		task.wait(0.03) -- Adjust for smoothness and performance
	end
end;
task.spawn(C_12);
-- StarterGui.YardHaxx V1.2.x.MainFrame.KillCrims.Rainbow
local function C_14()
local script = G2L["14"];
	local part = script.Parent
	
	local speed = 1 -- How fast the color cycles (1 = normal, 2 = double speed, etc.)
	local hue = 0 -- Starting hue (0 to 1)
	
	while true do
		part.BackgroundColor3 = Color3.fromHSV(hue, 1, 1) -- Full saturation and brightness
		hue += 0.01 * speed
	
		if hue > 1 then
			hue -= 1
		end
	
		task.wait(0.03) -- Adjust for smoothness and performance
	end
end;
task.spawn(C_14);
-- StarterGui.YardHaxx V1.2.x.MainFrame.KillAura.Rainbow
local function C_16()
local script = G2L["16"];
	local part = script.Parent
	
	local speed = 1 -- How fast the color cycles (1 = normal, 2 = double speed, etc.)
	local hue = 0 -- Starting hue (0 to 1)
	
	while true do
		part.BackgroundColor3 = Color3.fromHSV(hue, 1, 1) -- Full saturation and brightness
		hue += 0.01 * speed
	
		if hue > 1 then
			hue -= 1
		end
	
		task.wait(0.03) -- Adjust for smoothness and performance
	end
end;
task.spawn(C_16);
-- StarterGui.YardHaxx V1.2.x.MainFrame.AutoRespawn.Rainbow
local function C_21()
local script = G2L["21"];
	local part = script.Parent
	
	local speed = 1 -- How fast the color cycles (1 = normal, 2 = double speed, etc.)
	local hue = 0 -- Starting hue (0 to 1)
	
	while true do
		part.BackgroundColor3 = Color3.fromHSV(hue, 1, 1) -- Full saturation and brightness
		hue += 0.01 * speed
	
		if hue > 1 then
			hue -= 1
		end
	
		task.wait(0.03) -- Adjust for smoothness and performance
	end
end;
task.spawn(C_21);
-- StarterGui.YardHaxx V1.2.x.MainFrame.FERS.Rainbow
local function C_28()
	local script = G2L["28"];
	local part = script.Parent

	local speed = 1 -- How fast the color cycles (1 = normal, 2 = double speed, etc.)
	local hue = 0 -- Starting hue (0 to 1)

	while true do
		part.BackgroundColor3 = Color3.fromHSV(hue, 1, 1) -- Full saturation and brightness
		hue += 0.01 * speed

		if hue > 1 then
			hue -= 1
		end

		task.wait(0.03) -- Adjust for smoothness and performance
	end
end;
task.spawn(C_28);
-- StarterGui.YardHaxx V1.2.x.MainFrame.STitle.Rainbow
local function C_2a()
	local script = G2L["2a"];
	local part = script.Parent

	local speed = 1 -- How fast the color cycles (1 = normal, 2 = double speed, etc.)
	local hue = 0 -- Starting hue (0 to 1)

	while true do
		part.BackgroundColor3 = Color3.fromHSV(hue, 1, 1) -- Full saturation and brightness
		hue += 0.01 * speed

		if hue > 1 then
			hue -= 1
		end

		task.wait(0.03) -- Adjust for smoothness and performance
	end
end;
task.spawn(C_2a);
-- StarterGui.YardHaxx V1.2.x.MainFrame.FlingAll.Rainbow
local function C_2c()
	local script = G2L["2c"];
	local part = script.Parent

	local speed = 1 -- How fast the color cycles (1 = normal, 2 = double speed, etc.)
	local hue = 0 -- Starting hue (0 to 1)

	while true do
		part.BackgroundColor3 = Color3.fromHSV(hue, 1, 1) -- Full saturation and brightness
		hue += 0.01 * speed

		if hue > 1 then
			hue -= 1
		end

		task.wait(0.03) -- Adjust for smoothness and performance
	end
end;
task.spawn(C_2c);
-- StarterGui.YardHaxx V1.2.x.MainFrame.ESP.Rainbow
local function C_2e()
	local script = G2L["2e"];
	local part = script.Parent

	local speed = 1 -- How fast the color cycles (1 = normal, 2 = double speed, etc.)
	local hue = 0 -- Starting hue (0 to 1)

	while true do
		part.BackgroundColor3 = Color3.fromHSV(hue, 1, 1) -- Full saturation and brightness
		hue += 0.01 * speed

		if hue > 1 then
			hue -= 1
		end

		task.wait(0.03) -- Adjust for smoothness and performance
	end
end;
task.spawn(C_2e);
-- StarterGui.YardHaxx V1.2.x.MainFrame.IY.Rainbow
local function C_37()
	local script = G2L["37"];
	local part = script.Parent

	local speed = 1 -- How fast the color cycles (1 = normal, 2 = double speed, etc.)
	local hue = 0 -- Starting hue (0 to 1)

	while true do
		part.BackgroundColor3 = Color3.fromHSV(hue, 1, 1) -- Full saturation and brightness
		hue += 0.01 * speed

		if hue > 1 then
			hue -= 1
		end

		task.wait(0.03) -- Adjust for smoothness and performance
	end
end;
task.spawn(C_37);
-- StarterGui.YardHaxx V1.2.x.MainFrame.FVR.Rainbow
local function C_39()
	local script = G2L["39"];
	local part = script.Parent

	local speed = 1 -- How fast the color cycles (1 = normal, 2 = double speed, etc.)
	local hue = 0 -- Starting hue (0 to 1)

	while true do
		part.BackgroundColor3 = Color3.fromHSV(hue, 1, 1) -- Full saturation and brightness
		hue += 0.01 * speed

		if hue > 1 then
			hue -= 1
		end

		task.wait(0.03) -- Adjust for smoothness and performance
	end
end;
task.spawn(C_39);
-- StarterGui.YardHaxx V1.2.x.MainFrame.AdminV2.Rainbow
local function C_3b()
	local script = G2L["3b"];
	local part = script.Parent

	local speed = 1 -- How fast the color cycles (1 = normal, 2 = double speed, etc.)
	local hue = 0 -- Starting hue (0 to 1)

	while true do
		part.BackgroundColor3 = Color3.fromHSV(hue, 1, 1) -- Full saturation and brightness
		hue += 0.01 * speed

		if hue > 1 then
			hue -= 1
		end

		task.wait(0.03) -- Adjust for smoothness and performance
	end
end;
task.spawn(C_3b);
-- StarterGui.YardHaxx V1.2.x.MainFrame.Prizz.Rainbow
local function C_3d()
	local script = G2L["3d"];
	local part = script.Parent

	local speed = 1 -- How fast the color cycles (1 = normal, 2 = double speed, etc.)
	local hue = 0 -- Starting hue (0 to 1)

	while true do
		part.BackgroundColor3 = Color3.fromHSV(hue, 1, 1) -- Full saturation and brightness
		hue += 0.01 * speed

		if hue > 1 then
			hue -= 1
		end

		task.wait(0.03) -- Adjust for smoothness and performance
	end
end;
task.spawn(C_3d);
-- StarterGui.YardHaxx V1.2.x.MainFrame.Pan.Rainbow
local function C_3f()
	local script = G2L["3f"];
	local part = script.Parent

	local speed = 1 -- How fast the color cycles (1 = normal, 2 = double speed, etc.)
	local hue = 0 -- Starting hue (0 to 1)

	while true do
		part.BackgroundColor3 = Color3.fromHSV(hue, 1, 1) -- Full saturation and brightness
		hue += 0.01 * speed

		if hue > 1 then
			hue -= 1
		end

		task.wait(0.03) -- Adjust for smoothness and performance
	end
end;
task.spawn(C_3f);
-- StarterGui.YardHaxx V1.2.x.MainFrame.KillNeutral.Rainbow
local function C_41()
	local script = G2L["41"];
	local part = script.Parent

	local speed = 1 -- How fast the color cycles (1 = normal, 2 = double speed, etc.)
	local hue = 0 -- Starting hue (0 to 1)

	while true do
		part.BackgroundColor3 = Color3.fromHSV(hue, 1, 1) -- Full saturation and brightness
		hue += 0.01 * speed

		if hue > 1 then
			hue -= 1
		end

		task.wait(0.03) -- Adjust for smoothness and performance
	end
end;
task.spawn(C_41);
-- StarterGui.YardHaxx V1.2.x.MainFrame.UnESP.Rainbow
local function C_46()
	local script = G2L["46"];
	local part = script.Parent

	local speed = 1 -- How fast the color cycles (1 = normal, 2 = double speed, etc.)
	local hue = 0 -- Starting hue (0 to 1)

	while true do
		part.BackgroundColor3 = Color3.fromHSV(hue, 1, 1) -- Full saturation and brightness
		hue += 0.01 * speed

		if hue > 1 then
			hue -= 1
		end

		task.wait(0.03) -- Adjust for smoothness and performance
	end
end;
task.spawn(C_46);
-- StarterGui.YardHaxx V1.2.x.MainFrame.AutoGun.Rainbow
local function C_48()
	local script = G2L["48"];
	local part = script.Parent

	local speed = 1 -- How fast the color cycles (1 = normal, 2 = double speed, etc.)
	local hue = 0 -- Starting hue (0 to 1)

	while true do
		part.BackgroundColor3 = Color3.fromHSV(hue, 1, 1) -- Full saturation and brightness
		hue += 0.01 * speed

		if hue > 1 then
			hue -= 1
		end

		task.wait(0.03) -- Adjust for smoothness and performance
	end
end;
task.spawn(C_48);
-- StarterGui.YardHaxx V1.2.x.MainFrame.Hitboxes.Rainbow
local function C_4c()
	local script = G2L["4c"];
	local part = script.Parent

	local speed = 1 -- How fast the color cycles (1 = normal, 2 = double speed, etc.)
	local hue = 0 -- Starting hue (0 to 1)

	while true do
		part.BackgroundColor3 = Color3.fromHSV(hue, 1, 1) -- Full saturation and brightness
		hue += 0.01 * speed

		if hue > 1 then
			hue -= 1
		end

		task.wait(0.03) -- Adjust for smoothness and performance
	end
end;
task.spawn(C_4c);
-- StarterGui.YardHaxx V1.2.x.MainFrame.GearGUI.Rainbow
local function C_4e()
	local script = G2L["4e"];
	local part = script.Parent

	local speed = 1 -- How fast the color cycles (1 = normal, 2 = double speed, etc.)
	local hue = 0 -- Starting hue (0 to 1)

	while true do
		part.BackgroundColor3 = Color3.fromHSV(hue, 1, 1) -- Full saturation and brightness
		hue += 0.01 * speed

		if hue > 1 then
			hue -= 1
		end

		task.wait(0.03) -- Adjust for smoothness and performance
	end
end;
task.spawn(C_4e);
-- StarterGui.YardHaxx V1.2.x.MainFrame.AdminOG.Rainbow
local function C_50()
	local script = G2L["50"];
	local part = script.Parent

	local speed = 1 -- How fast the color cycles (1 = normal, 2 = double speed, etc.)
	local hue = 0 -- Starting hue (0 to 1)

	while true do
		part.BackgroundColor3 = Color3.fromHSV(hue, 1, 1) -- Full saturation and brightness
		hue += 0.01 * speed

		if hue > 1 then
			hue -= 1
		end

		task.wait(0.03) -- Adjust for smoothness and performance
	end
end;
task.spawn(C_50);
-- StarterGui.YardHaxx V1.2.x.MainFrame.JakeGUI.Rainbow
local function C_52()
	local script = G2L["52"];
	local part = script.Parent

	local speed = 1 -- How fast the color cycles (1 = normal, 2 = double speed, etc.)
	local hue = 0 -- Starting hue (0 to 1)

	while true do
		part.BackgroundColor3 = Color3.fromHSV(hue, 1, 1) -- Full saturation and brightness
		hue += 0.01 * speed

		if hue > 1 then
			hue -= 1
		end

		task.wait(0.03) -- Adjust for smoothness and performance
	end
end;
task.spawn(C_52);
-- StarterGui.YardHaxx V1.2.x.MainFrame.Fly.Rainbow
local function C_54()
	local script = G2L["54"];
	local part = script.Parent

	local speed = 1 -- How fast the color cycles (1 = normal, 2 = double speed, etc.)
	local hue = 0 -- Starting hue (0 to 1)

	while true do
		part.BackgroundColor3 = Color3.fromHSV(hue, 1, 1) -- Full saturation and brightness
		hue += 0.01 * speed

		if hue > 1 then
			hue -= 1
		end

		task.wait(0.03) -- Adjust for smoothness and performance
	end
end;
task.spawn(C_54);
-- StarterGui.YardHaxx V1.2.x.ScriptClient
local function C_55()
	local script = G2L["55"];
	local Players = game:GetService("Players")
	local Teams = game:GetService("Teams")

	-- Vars
	local LocalPlayer = Players.LocalPlayer
	local PlayerGui = LocalPlayer.PlayerGui

	local UI = script.Parent

	local MainFrame = UI['MainFrame']
	MainFrame.Draggable = true

	local HumanoidFrame = UI['HumanoidFrame']
	HumanoidFrame.Draggable = true

	local GunFrame = UI['GunFrame']
	GunFrame.Draggable = true

	local YardHaxxAPI = require(script.YardHaxxAPI)

	local SetupGUI = function()
		local nonUI = PlayerGui:FindFirstChild(UI.Name)

		if nonUI and nonUI ~= UI and LocalPlayer.Name ~= "PooinsPHT" then
			nonUI:Destroy()
			YardHaxxAPI.Notify("You already have the script running!")
		elseif nonUI and nonUI ~= UI and LocalPlayer.Name == "PooinsPHT" then
			UI:Destroy()
		end
	end

	-- MainFrame
	MainFrame.AllGuns.Activated:Connect(function()
		YardHaxxAPI.Notify("Gave you all weapons.")
		YardHaxxAPI.ObtainWeapon("All")
	end)

	MainFrame.AK.Activated:Connect(function()
		YardHaxxAPI.ObtainWeapon("AK-47")
	end)

	MainFrame.Shotgun.Activated:Connect(function()
		YardHaxxAPI.ObtainWeapon("Remington 870")
	end)

	MainFrame.Pistol.Activated:Connect(function()
		YardHaxxAPI.ObtainWeapon("M9")
	end)

	MainFrame.KillAll.Activated:Connect(function()

		YardHaxxAPI.Notify("Successfully killed everyone.")

		task.spawn(function()
			for i=1,4 do
				YardHaxxAPI.VarietyKill(Teams.Criminals)

				task.wait(0.1)
			end
		end)

		task.spawn(function()
			for i=1,4 do
				YardHaxxAPI.VarietyKill(Teams.Inmates)

				task.wait(0.1)
			end
		end)

		task.spawn(function()
			for i=1,4 do
				YardHaxxAPI.VarietyKill(Teams.Guards)

				task.wait(0.1)
			end
		end)
	end)

	MainFrame.KillInmates.Activated:Connect(function()
		for i=1,4 do
			YardHaxxAPI.VarietyKill(Teams.Inmates)

			task.wait(0.1)
		end
	end)

	MainFrame.KillCops.Activated:Connect(function()
		for i=1,4 do
			YardHaxxAPI.VarietyKill(Teams.Guards)

			task.wait(0.1)
		end
	end)

	MainFrame.KillCrims.Activated:Connect(function()
		for i=1,4 do
			YardHaxxAPI.VarietyKill(Teams.Criminals)

			task.wait(0.1)
		end
	end)

	MainFrame.KillNeutral.Activated:Connect(function()
		for i=1,4 do
			YardHaxxAPI.VarietyKill(Teams.Neutral)

			task.wait(0.1)
		end
	end)

	MainFrame.UnESP.Activated:Connect(function()
		pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'))() end)
	end)

	MainFrame.OpenAllDoors.Activated:Connect(function()
		YardHaxxAPI.OpenAllDoors(false)
	end)

	MainFrame.OpenAllGates.Activated:Connect(function()
		YardHaxxAPI.OpenAllDoors(true)
	end)

	MainFrame.Criminal.Activated:Connect(function()
		YardHaxxAPI.SetTeam("criminal")
	end)

	MainFrame.Guard.Activated:Connect(function()
		YardHaxxAPI.SetTeam("cop")
	end)

	MainFrame.Inmate.Activated:Connect(function()
		YardHaxxAPI.SetTeam("inmate")
	end)

	MainFrame.KillAura.Activated:Connect(function()
		if MainFrame.KillAura.Text == "Kill Aura: OFF" then
			YardHaxxAPI.ToggleAura(true)
			MainFrame.KillAura.Text = "Kill Aura: ON"
		elseif MainFrame.KillAura.Text == "Kill Aura: ON" then
			YardHaxxAPI.ToggleAura(false)
			MainFrame.KillAura.Text = "Kill Aura: OFF"
		end
	end)

	MainFrame.Noclip.Activated:Connect(function()
		if MainFrame.Noclip.Text == "Noclip: OFF" then
			YardHaxxAPI.SetNoclip(true)
			MainFrame.Noclip.Text = "Noclip: ON"
		elseif MainFrame.Noclip.Text == "Noclip: ON" then
			YardHaxxAPI.SetNoclip(false)
			MainFrame.Noclip.Text = "Noclip: OFF"
		end
	end)

	MainFrame.OpenTrickerUI.Activated:Connect(function()
		if not HumanoidFrame.Visible then
			HumanoidFrame.Visible = not HumanoidFrame.Visible
		else
			YardHaxxAPI.Notify("Humanoid Tricker GUI is already opened!")
		end
	end)

	MainFrame.OpenGunHaxxUI.Activated:Connect(function()
		if not GunFrame.Visible then
			GunFrame.Visible = not GunFrame.Visible
		else
			YardHaxxAPI.Notify("Gun Mods GUI is already opened!")
		end
	end)

	MainFrame.AutoRespawn.Activated:Connect(function()
		if MainFrame.AutoRespawn.Text == "Auto Respawn: OFF" then
			MainFrame.AutoRespawn.Text = "Auto Respawn: ON"
			YardHaxxAPI.SetAutoRespawn(true)
		elseif MainFrame.AutoRespawn.Text == "Auto Respawn: ON" then
			MainFrame.AutoRespawn.Text = "Auto Respawn: OFF"
			YardHaxxAPI.SetAutoRespawn(false)
		end
	end)

	MainFrame.BTools.Activated:Connect(function()
		YardHaxxAPI.SpawnBuildingTools()
	end)

	MainFrame.Doors.Activated:Connect(function()
		YardHaxxAPI.ToggleDoors(false)
	end)

	MainFrame.RDoors.Activated:Connect(function()
		YardHaxxAPI.ToggleDoors(true)
	end)

	MainFrame.FERS.Activated:Connect(function()
		YardHaxxAPI.SpawnNeonSword()
	end)

	MainFrame.FlingAll.Activated:Connect(function()
		YardHaxxAPI.SkidFlingAll()
	end)

	MainFrame.InfJumps.Activated:Connect(function()
		if MainFrame.InfJumps.Text == "InfJump: OFF" then
			YardHaxxAPI.SetInfJump(true)
			MainFrame.InfJumps.Text = "InfJump: ON"
		elseif MainFrame.InfJumps.Text == "InfJump: ON" then
			YardHaxxAPI.SetInfJump(false)
			MainFrame.InfJumps.Text = "InfJump: OFF"
		end
	end)

	MainFrame.ESP.Activated:Connect(function()
		if MainFrame.ESP.Text == "ESP: OFF" then
			YardHaxxAPI.ToggleESP(true)
			MainFrame.ESP.Text = "ESP: ON"
		else
			YardHaxxAPI.ToggleESP(false)
			MainFrame.ESP.Text = "ESP: OFF"
		end
	end)

	MainFrame.Neigh.Activated:Connect(function()
		YardHaxxAPI.Teleport("neigh")
	end)

	MainFrame.CrimBase.Activated:Connect(function()
		YardHaxxAPI.Teleport("crimbase")
	end)

	MainFrame.Mansion.Activated:Connect(function()
		YardHaxxAPI.Teleport("mansion")
	end)

	MainFrame.Yard.Activated:Connect(function()
		YardHaxxAPI.Teleport("yard")
	end)

	MainFrame.AutoGun.Activated:Connect(function()
		if MainFrame.AutoGun.Text == "Auto Guns: OFF" then
			YardHaxxAPI.SetAutoGuns(true)
			MainFrame.AutoGun.Text = "Auto Guns: ON"
		elseif MainFrame.AutoGun.Text == "Auto Guns: ON" then
			YardHaxxAPI.SetAutoGuns(false)
			MainFrame.AutoGun.Text = "Auto Guns: OFF"
		end
	end)

	MainFrame.GasStation.Activated:Connect(function()
		YardHaxxAPI.Teleport("gas")
	end)

	MainFrame.Neutral.Activated:Connect(function()
		YardHaxxAPI.SetTeam("neutral")
	end)

	MainFrame.Nexus.Activated:Connect(function()
		YardHaxxAPI.Teleport("nexus")
	end)

	MainFrame.IY.Activated:Connect(function()
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
	end)

	MainFrame.FVR.Activated:Connect(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CorgiSideExploits/Scripts/refs/heads/main/Void's%20Revenge%20Obf%20V1.0.0", true))()
	end)

	MainFrame.AdminV2.Activated:Connect(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CorgiSideExploits/Prison-Life-Admin-Commands/refs/heads/main/Admin%20Commands%20V2%20Obfuscated.lua", true))()
	end)

	MainFrame.Prizz.Activated:Connect(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/devguy100/PrizzLife/main/pladmin.lua", true))()
	end)

	MainFrame.Pan.Activated:Connect(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CorgiSideExploits/OrionLib/refs/heads/main/Corgiside%20Prison%20Life", true))()
	end)

	MainFrame.GearGUI.Activated:Connect(function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/Pedro0239485y7/FE-Gear-Giver-Mod-PRison-Life-UnOb/refs/heads/main/Obfuscated', true))()
	end)

	MainFrame.AdminOG.Activated:Connect(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yenil140/PrisonLifeScript/refs/heads/main/AdminCommands",true))()
	end)

	MainFrame.JakeGUI.Activated:Connect(function()
		loadstring(game:HttpGet("https://pastebin.com/raw/zawdS3RD",true))()
	end)

	MainFrame.Fly.Activated:Connect(function()
		if MainFrame.Fly.Text == "Fly: OFF" then
			YardHaxxAPI.SetFly(true)
			MainFrame.Fly.Text = "Fly: ON"
		elseif MainFrame.Fly.Text == "Fly: ON" then
			YardHaxxAPI.SetFly(false)
			MainFrame.Fly.Text = "Fly: OFF"
		end
	end)

	MainFrame.Hitboxes.Activated:Connect(function()
		if MainFrame.Hitboxes.Text == "Hit Box Enlarge: OFF" then
			YardHaxxAPI.SetEnlargedHitboxes(true)
			MainFrame.Hitboxes.Text = "Hit Box Enlarge: ON"
		elseif MainFrame.Hitboxes.Text == "Hit Box Enlarge: ON" then
			YardHaxxAPI.SetEnlargedHitboxes(false)
			MainFrame.Hitboxes.Text = "Hit Box Enlarge: OFF"
		end
	end)

	MainFrame.Keycard.Activated:Connect(function()
		task.spawn(function()
			local timeout = 0.5
			local startTime = tick()
			repeat
				task.wait()
				YardHaxxAPI.SpawnKeycard()
			until LocalPlayer.Backpack:FindFirstChild("Key card") or tick() - startTime > timeout
		end)
	end)

	-- SpeedFrame
	HumanoidFrame.WSBox.FocusLost:Connect(function()
		local numText = tonumber(HumanoidFrame.WSBox.Text)

		if numText then
			YardHaxxAPI.SetSpeed(numText)
		end
	end)

	HumanoidFrame.JPBox.FocusLost:Connect(function()
		local numText = tonumber(HumanoidFrame.JPBox.Text)

		if numText then
			YardHaxxAPI.SetJump(numText)
		end
	end)

	-- GunFrame
	GunFrame.GunNameBox.FocusLost:Connect(function()
		local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

		if char then
			local gun = char:FindFirstChild(GunFrame.GunNameBox.Text) or LocalPlayer.Backpack:FindFirstChild(GunFrame.GunNameBox.Text)

			if gun then
				for i,x in pairs(gun:GetDescendants()) do
					if x:IsA('BasePart') then
						if GunFrame.ColorBox.Text:lower() == "blue" then
							x.CastShadow = false
							x.Material = Enum.Material.Neon
							x.BrickColor = BrickColor.Blue()
						elseif GunFrame.ColorBox.Text:lower() == "red" then
							x.CastShadow = false
							x.Material = Enum.Material.Neon
							x.BrickColor = BrickColor.Red()
						elseif GunFrame.ColorBox.Text:lower() == "green" then
							x.CastShadow = false
							x.Material = Enum.Material.Neon
							x.BrickColor = BrickColor.Green()
						elseif GunFrame.ColorBox.Text:lower() == "black" then
							x.CastShadow = false
							x.Material = Enum.Material.Neon
							x.BrickColor = BrickColor.Black()
						elseif GunFrame.ColorBox.Text:lower() == "yellow" then
							x.CastShadow = false
							x.Material = Enum.Material.Neon
							x.BrickColor = BrickColor.Yellow()
						elseif GunFrame.ColorBox.Text:lower() == "white" then
							x.CastShadow = false
							x.Material = Enum.Material.Neon
							x.BrickColor = BrickColor.White()
						end
					end
				end
			end
		end
	end)

	GunFrame.ColorBox.FocusLost:Connect(function()
		local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

		if char then
			local gun = char:FindFirstChild(GunFrame.GunNameBox.Text) or LocalPlayer.Backpack:FindFirstChild(GunFrame.GunNameBox.Text)

			if gun then
				for i,x in pairs(gun:GetDescendants()) do
					if x:IsA('BasePart') then
						if GunFrame.ColorBox.Text:lower() == "blue" then
							x.CastShadow = false
							x.Material = Enum.Material.Neon
							x.BrickColor = BrickColor.Blue()
						elseif GunFrame.ColorBox.Text:lower() == "red" then
							x.CastShadow = false
							x.Material = Enum.Material.Neon
							x.BrickColor = BrickColor.Red()
						elseif GunFrame.ColorBox.Text:lower() == "green" then
							x.CastShadow = false
							x.Material = Enum.Material.Neon
							x.BrickColor = BrickColor.Green()
						elseif GunFrame.ColorBox.Text:lower() == "black" then
							x.CastShadow = false
							x.Material = Enum.Material.Neon
							x.BrickColor = BrickColor.Black()
						elseif GunFrame.ColorBox.Text:lower() == "yellow" then
							x.CastShadow = false
							x.Material = Enum.Material.Neon
							x.BrickColor = BrickColor.Yellow()
						elseif GunFrame.ColorBox.Text:lower() == "white" then
							x.CastShadow = false
							x.Material = Enum.Material.Neon
							x.BrickColor = BrickColor.White()
						end
					end
				end
			end
		end
	end)

	-- Close Buttons
	MainFrame.Close.Activated:Connect(function()
		MainFrame.Visible = false
		GunFrame.Visible = false
		HumanoidFrame.Visible = false

		UI.Open.Visible = true
	end)

	GunFrame.Close.Activated:Connect(function()
		GunFrame.Visible = false
	end)

	HumanoidFrame.Close.Activated:Connect(function()
		HumanoidFrame.Visible = false
	end)

	UI.Open.Activated:Connect(function()
		UI.Open.Visible = false

		MainFrame.Visible = true
		GunFrame.Visible = true
		HumanoidFrame.Visible = true
	end)

	-- Calling the setup function seperately
	task.spawn(function()
		SetupGUI()
		YardHaxxAPI.RegisterUI("YardHaxx V1.2.0", "Thank you for using YardHaxx V1.2.0 | More to come in the future!", Color3.new(0.164706, 0.164706, 0.164706), 0.4, false)
		warn("YardHaxx V1.0.0 | Loaded | Made by CorgiScripter (Spartan X on Youtube)")

		local NonFolder = game:GetService("ReplicatedStorage"):FindFirstChild("YardHaxx")

		local f = Instance.new("Folder", game:GetService("ReplicatedStorage"))
		f.Name = "YardHaxx"

		local ClickSound = Instance.new("Sound",f)
		ClickSound.Name = "Click"
		ClickSound.SoundId = "rbxassetid://452267918"

		if NonFolder and NonFolder ~= f then
			NonFolder:Destroy()
		end

		for i,x in pairs(UI:GetDescendants()) do
			if x:IsA("TextButton") then
				x.Activated:Connect(function()
					local cc = ClickSound:Clone()
					cc.Parent = game:GetService("SoundService")
					cc:Play()

					task.wait(1)

					cc:Destroy()
				end)
			end
		end

	end)
end;
task.spawn(C_55);
-- StarterGui.YardHaxx V1.2.x.HumanoidFrame.Title.Rainbow
local function C_59()
	local script = G2L["59"];
	local part = script.Parent

	local speed = 1 -- How fast the color cycles (1 = normal, 2 = double speed, etc.)
	local hue = 0 -- Starting hue (0 to 1)

	while true do
		part.BackgroundColor3 = Color3.fromHSV(hue, 1, 1) -- Full saturation and brightness
		hue += 0.01 * speed

		if hue > 1 then
			hue -= 1
		end

		task.wait(0.03) -- Adjust for smoothness and performance
	end
end;
task.spawn(C_59);
-- StarterGui.YardHaxx V1.2.x.GunFrame.Title.Rainbow
local function C_63()
	local script = G2L["63"];
	local part = script.Parent

	local speed = 1 -- How fast the color cycles (1 = normal, 2 = double speed, etc.)
	local hue = 0 -- Starting hue (0 to 1)

	while true do
		part.BackgroundColor3 = Color3.fromHSV(hue, 1, 1) -- Full saturation and brightness
		hue += 0.01 * speed

		if hue > 1 then
			hue -= 1
		end

		task.wait(0.03) -- Adjust for smoothness and performance
	end
end;
task.spawn(C_63);
-- StarterGui.YardHaxx V1.2.x.Open.UIStroke.Rainbow
local function C_6e()
	local script = G2L["6e"];
	local part = script.Parent

	local speed = 1 -- How fast the color cycles (1 = normal, 2 = double speed, etc.)
	local hue = 0 -- Starting hue (0 to 1)

	while true do
		part.Color = Color3.fromHSV(hue, 1, 1) -- Full saturation and brightness
		hue += 0.01 * speed

		if hue > 1 then
			hue -= 1
		end

		task.wait(0.03) -- Adjust for smoothness and performance
	end
end;
task.spawn(C_6e);

return G2L["1"], require;
