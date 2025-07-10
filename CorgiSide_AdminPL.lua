--https://github.com/Chaosscripter/Prison-Life-Admin-Commands/blob/main/Admin%20Commands%20V2
--[[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]]

-- Instances: 65 | Scripts: 1 | Modules: 1 | Tags: 0
local G2L = {};

-- StarterGui.ChaosAdminGUI
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["Name"] = [[ChaosAdminGUI]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


-- StarterGui.ChaosAdminGUI.MainFrame
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["Active"] = true;
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
G2L["2"]["Selectable"] = true;
G2L["2"]["Size"] = UDim2.new(0.26427, 0, 0.61036, 0);
G2L["2"]["Position"] = UDim2.new(0.34035, 0, 0.21478, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Name"] = [[MainFrame]];


-- Close Button for MainFrame
G2L["CloseCmd"] = Instance.new("TextButton", G2L["2"]);
G2L["CloseCmd"]["Name"] = "CloseButton";
G2L["CloseCmd"]["Text"] = "X";
G2L["CloseCmd"]["Size"] = UDim2.new(0, 24, 0, 24);
G2L["CloseCmd"]["Position"] = UDim2.new(1, -28, 0, -28);
G2L["CloseCmd"]["BackgroundColor3"] = Color3.fromRGB(200,0,0);
G2L["CloseCmd"]["TextColor3"] = Color3.fromRGB(255,255,255);
G2L["CloseCmd"]["Font"] = Enum.Font.SourceSansBold;
G2L["CloseCmd"]["TextSize"] = 14;

-- Minimize Button for MainFrame
G2L["MinCmd"] = Instance.new("TextButton", G2L["2"]);
G2L["MinCmd"]["Name"] = "MinimizeButton";
G2L["MinCmd"]["Text"] = "_";
G2L["MinCmd"]["Size"] = UDim2.new(0, 24, 0, 24);
G2L["MinCmd"]["Position"] = UDim2.new(1, -56, 0, -28);
G2L["MinCmd"]["BackgroundColor3"] = Color3.fromRGB(120,120,120);
G2L["MinCmd"]["TextColor3"] = Color3.fromRGB(255,255,255);
G2L["MinCmd"]["Font"] = Enum.Font.SourceSansBold;
G2L["MinCmd"]["TextSize"] = 14;


-- StarterGui.ChaosAdminGUI.MainFrame.Title
G2L["3"] = Instance.new("TextLabel", G2L["2"]);
G2L["3"]["TextWrapped"] = true;
G2L["3"]["BorderSizePixel"] = 0;
G2L["3"]["TextSize"] = 25;
G2L["3"]["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3"]["TextScaled"] = true;
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 5);
G2L["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["3"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3"]["Size"] = UDim2.new(1, 0, 0.10222, 0);
G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["Text"] = [[Chaos-Admin-By-Riotscripter]];
G2L["3"]["Name"] = [[Title]];


-- StarterGui.ChaosAdminGUI.MainFrame.Title.UIAspectRatioConstraint
G2L["4"] = Instance.new("UIAspectRatioConstraint", G2L["3"]);
G2L["4"]["AspectRatio"] = 8.69565;


-- StarterGui.ChaosAdminGUI.MainFrame.Title.UITextSizeConstraint
G2L["5"] = Instance.new("UITextSizeConstraint", G2L["3"]);
G2L["5"]["MaxTextSize"] = 25;


-- StarterGui.ChaosAdminGUI.MainFrame.CommandsFrame
G2L["6"] = Instance.new("ScrollingFrame", G2L["2"]);
G2L["6"]["Active"] = true;
G2L["6"]["BorderSizePixel"] = 0;
G2L["6"]["CanvasSize"] = UDim2.new(0, 0, 0.2, 0);
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6"]["Name"] = [[CommandsFrame]];
G2L["6"]["Size"] = UDim2.new(1, 0, 0.78222, 0);
G2L["6"]["Position"] = UDim2.new(0, 0, 0.22165, 0);
G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["BackgroundTransparency"] = 1;


-- StarterGui.ChaosAdminGUI.MainFrame.CommandsFrame.ReferenceCommand
G2L["7"] = Instance.new("TextButton", G2L["6"]);
G2L["7"]["TextWrapped"] = true;
G2L["7"]["BorderSizePixel"] = 0;
G2L["7"]["TextColor3"] = Color3.fromRGB(186, 186, 186);
G2L["7"]["TextSize"] = 14;
G2L["7"]["TextScaled"] = true;
G2L["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["7"]["Size"] = UDim2.new(1, -16, 0, 36); -- fills almost the full width, 36 height
G2L["7"]["BackgroundTransparency"] = 1;
G2L["7"]["Name"] = [[ReferenceCommand]];
G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7"]["Text"] = [[Reference Command]];
G2L["7"]["Visible"] = false;


G2L["7"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["7"]["TextScaled"] = false;
G2L["7"]["TextSize"] = 16;


-- StarterGui.ChaosAdminGUI.MainFrame.CommandsFrame.ReferenceCommand.UIAspectRatioConstraint
G2L["8"] = Instance.new("UIAspectRatioConstraint", G2L["7"]);
G2L["8"]["AspectRatio"] = 7.71111;


-- StarterGui.ChaosAdminGUI.MainFrame.CommandsFrame.ReferenceCommand.UITextSizeConstraint
G2L["9"] = Instance.new("UITextSizeConstraint", G2L["7"]);
G2L["9"]["MaxTextSize"] = 45;


-- StarterGui.ChaosAdminGUI.MainFrame.CommandsFrame.CommandLayout
G2L["a"] = Instance.new("UIListLayout", G2L["6"]);
G2L["a"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["a"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["a"]["Name"] = [[CommandLayout]];


-- StarterGui.ChaosAdminGUI.MainFrame.CommandsFrame.UIAspectRatioConstraint
G2L["b"] = Instance.new("UIAspectRatioConstraint", G2L["6"]);
G2L["b"]["AspectRatio"] = 1.13636;


-- StarterGui.ChaosAdminGUI.MainFrame.SearchBox
G2L["c"] = Instance.new("TextBox", G2L["2"]);
G2L["c"]["TextStrokeTransparency"] = 0;
G2L["c"]["Name"] = [[SearchBox]];
G2L["c"]["BorderSizePixel"] = 0;
G2L["c"]["TextWrapped"] = true;
G2L["c"]["TextSize"] = 14;
G2L["c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["c"]["TextScaled"] = true;
G2L["c"]["BackgroundColor3"] = Color3.fromRGB(61, 61, 61);
G2L["c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["c"]["ClearTextOnFocus"] = false;
G2L["c"]["PlaceholderText"] = [[Search For A Command]];
G2L["c"]["Size"] = UDim2.new(0.74293, 0, 0.07998, 0);
G2L["c"]["Position"] = UDim2.new(0.12853, 0, 0.12568, 0);
G2L["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["c"]["Text"] = [[]];


-- StarterGui.ChaosAdminGUI.MainFrame.SearchBox.UIStroke
G2L["d"] = Instance.new("UIStroke", G2L["c"]);
G2L["d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["d"]["Color"] = Color3.fromRGB(84, 255, 45);


-- StarterGui.ChaosAdminGUI.MainFrame.SearchBox.UIAspectRatioConstraint
G2L["e"] = Instance.new("UIAspectRatioConstraint", G2L["c"]);
G2L["e"]["AspectRatio"] = 8.25714;


-- StarterGui.ChaosAdminGUI.MainFrame.SearchBox.UITextSizeConstraint
G2L["f"] = Instance.new("UITextSizeConstraint", G2L["c"]);
G2L["f"]["MaxTextSize"] = 14;


-- StarterGui.ChaosAdminGUI.MainFrame.UIAspectRatioConstraint
G2L["10"] = Instance.new("UIAspectRatioConstraint", G2L["2"]);
G2L["10"]["AspectRatio"] = 0.88889;


-- StarterGui.ChaosAdminGUI.ExecuteFrame
G2L["11"] = Instance.new("Frame", G2L["1"]);
G2L["11"]["Active"] = true;
G2L["11"]["BorderSizePixel"] = 0;
G2L["11"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
G2L["11"]["Selectable"] = true;
G2L["11"]["Size"] = UDim2.new(0.17671, 0, 0.14127, 0);
G2L["11"]["Position"] = UDim2.new(0.11044, 0, 0.6385, 0);
G2L["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["11"]["Name"] = [[ExecuteFrame]];


-- StarterGui.ChaosAdminGUI.ExecuteFrame.Title
G2L["12"] = Instance.new("TextLabel", G2L["11"]);
G2L["12"]["TextWrapped"] = true;
G2L["12"]["BorderSizePixel"] = 0;
G2L["12"]["TextSize"] = 35;
G2L["12"]["TextScaled"] = true;
G2L["12"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
G2L["12"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["12"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["12"]["Size"] = UDim2.new(1, 0, 0.40196, 0);
G2L["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["12"]["Text"] = [[Execute Frame]];
G2L["12"]["Name"] = [[Title]];


-- StarterGui.ChaosAdminGUI.ExecuteFrame.Title.UITextSizeConstraint
G2L["13"] = Instance.new("UITextSizeConstraint", G2L["12"]);
G2L["13"]["MaxTextSize"] = 41;


-- StarterGui.ChaosAdminGUI.ExecuteFrame.CommandBox
G2L["14"] = Instance.new("TextBox", G2L["11"]);
G2L["14"]["Name"] = [[CommandBox]];
G2L["14"]["BorderSizePixel"] = 0;
G2L["14"]["TextWrapped"] = true;
G2L["14"]["TextSize"] = 14;
G2L["14"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["14"]["TextScaled"] = true;
G2L["14"]["BackgroundColor3"] = Color3.fromRGB(61, 61, 61);
G2L["14"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["14"]["ClearTextOnFocus"] = false;
G2L["14"]["PlaceholderText"] = [[Press ; To Enter A Command]];
G2L["14"]["Size"] = UDim2.new(0.82955, 0, 0.38235, 0);
G2L["14"]["Position"] = UDim2.new(0.08333, 0, 0.5, 0);
G2L["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["14"]["Text"] = [[]];


-- StarterGui.ChaosAdminGUI.ExecuteFrame.CommandBox.UIStroke
G2L["15"] = Instance.new("UIStroke", G2L["14"]);
G2L["15"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["15"]["Color"] = Color3.fromRGB(52, 255, 83);


-- StarterGui.ChaosAdminGUI.ExecuteFrame.CommandBox.UITextSizeConstraint
G2L["16"] = Instance.new("UITextSizeConstraint", G2L["14"]);
G2L["16"]["MaxTextSize"] = 14;


-- StarterGui.ChaosAdminGUI.ExecuteFrame.UIAspectRatioConstraint
G2L["17"] = Instance.new("UIAspectRatioConstraint", G2L["11"]);
G2L["17"]["AspectRatio"] = 2.5679;


-- StarterGui.ChaosAdminGUI.OutputFrame
G2L["18"] = Instance.new("Frame", G2L["1"]);
G2L["18"]["Visible"] = false;
G2L["18"]["Active"] = true;
G2L["18"]["BorderSizePixel"] = 0;
G2L["18"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
G2L["18"]["Selectable"] = true;
G2L["18"]["Size"] = UDim2.new(0.2038, 0, 0.21478, 0);
G2L["18"]["Position"] = UDim2.new(0.11209, 0, 0.21478, 0);
G2L["18"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["18"]["Name"] = [[OutputFrame]];


-- StarterGui.ChaosAdminGUI.OutputFrame.Title
G2L["19"] = Instance.new("TextLabel", G2L["18"]);
G2L["19"]["TextWrapped"] = true;
G2L["19"]["BorderSizePixel"] = 0;
G2L["19"]["TextSize"] = 35;
G2L["19"]["TextScaled"] = true;
G2L["19"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 5);
G2L["19"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["19"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["19"]["Size"] = UDim2.new(1, 0, 0.26623, 0);
G2L["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["19"]["Text"] = [[Logs]];
G2L["19"]["Name"] = [[Title]];


-- StarterGui.ChaosAdminGUI.OutputFrame.Title.UIAspectRatioConstraint
G2L["1a"] = Instance.new("UIAspectRatioConstraint", G2L["19"]);
G2L["1a"]["AspectRatio"] = 7.31707;


-- StarterGui.ChaosAdminGUI.OutputFrame.Title.UITextSizeConstraint
G2L["1b"] = Instance.new("UITextSizeConstraint", G2L["19"]);
G2L["1b"]["MaxTextSize"] = 35;


-- StarterGui.ChaosAdminGUI.OutputFrame.Logs
G2L["1c"] = Instance.new("ScrollingFrame", G2L["18"]);
G2L["1c"]["Active"] = true;
G2L["1c"]["BorderSizePixel"] = 0;
G2L["1c"]["CanvasSize"] = UDim2.new(0, 0, 0.1, 0);
G2L["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1c"]["Name"] = [[Logs]];
G2L["1c"]["Size"] = UDim2.new(0.99962, 0, 0.66883, 0);
G2L["1c"]["Position"] = UDim2.new(0, 0, 0.26623, 0);
G2L["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1c"]["BackgroundTransparency"] = 1;


-- StarterGui.ChaosAdminGUI.OutputFrame.Logs.ReferenceMessage
G2L["1d"] = Instance.new("TextLabel", G2L["1c"]);
G2L["1d"]["TextWrapped"] = true;
G2L["1d"]["TextStrokeTransparency"] = 0;
G2L["1d"]["BorderSizePixel"] = 0;
G2L["1d"]["TextSize"] = 1;
G2L["1d"]["TextScaled"] = true;
G2L["1d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["1d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1d"]["BackgroundTransparency"] = 1;
G2L["1d"]["Size"] = UDim2.new(0, 277, 0, 38);
G2L["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1d"]["Text"] = [[Loaded Script Successfully!]];
G2L["1d"]["Name"] = [[ReferenceMessage]];
G2L["1d"]["Position"] = UDim2.new(0.07336, 0, 0, 0);


G2L["1d"]["Size"] = UDim2.new(1, -16, 0, 32);
G2L["1d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["1d"]["TextScaled"] = false;
G2L["1d"]["TextSize"] = 14;


-- StarterGui.ChaosAdminGUI.OutputFrame.Logs.ReferenceMessage.UIAspectRatioConstraint
G2L["1e"] = Instance.new("UIAspectRatioConstraint", G2L["1d"]);
G2L["1e"]["AspectRatio"] = 7.28947;


-- StarterGui.ChaosAdminGUI.OutputFrame.Logs.ReferenceMessage.UITextSizeConstraint
G2L["1f"] = Instance.new("UITextSizeConstraint", G2L["1d"]);
G2L["1f"]["MaxTextSize"] = 24;


-- StarterGui.ChaosAdminGUI.OutputFrame.Logs.UIListLayout
G2L["20"] = Instance.new("UIListLayout", G2L["1c"]);
G2L["20"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["20"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.ChaosAdminGUI.OutputFrame.Logs.UIAspectRatioConstraint
G2L["21"] = Instance.new("UIAspectRatioConstraint", G2L["1c"]);
G2L["21"]["AspectRatio"] = 2.9115;


-- StarterGui.ChaosAdminGUI.OutputFrame.UIAspectRatioConstraint
G2L["22"] = Instance.new("UIAspectRatioConstraint", G2L["18"]);
G2L["22"]["AspectRatio"] = 1.94805;


-- StarterGui.ChaosAdminGUI.ScriptClient
G2L["23"] = Instance.new("LocalScript", G2L["1"]);
G2L["23"]["Name"] = [[ScriptClient]];


-- StarterGui.ChaosAdminGUI.ScriptClient.ThemeAPI
G2L["24"] = Instance.new("ModuleScript", G2L["23"]);
G2L["24"]["Name"] = [[ThemeAPI]];


-- StarterGui.ChaosAdminGUI.ThemesFrame
G2L["25"] = Instance.new("Frame", G2L["1"]);
G2L["25"]["Visible"] = false;
G2L["25"]["Active"] = true;
G2L["25"]["BorderSizePixel"] = 0;
G2L["25"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
G2L["25"]["Selectable"] = true;
G2L["25"]["Size"] = UDim2.new(0.23777, 0, 0.43515, 0);
G2L["25"]["Position"] = UDim2.new(0.61481, 0, 0.48536, 0);
G2L["25"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["25"]["Name"] = [[ThemesFrame]];


-- StarterGui.ChaosAdminGUI.ThemesFrame.Title
G2L["26"] = Instance.new("TextLabel", G2L["25"]);
G2L["26"]["TextWrapped"] = true;
G2L["26"]["BorderSizePixel"] = 0;
G2L["26"]["TextSize"] = 35;
G2L["26"]["TextScaled"] = true;
G2L["26"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 5);
G2L["26"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["26"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["26"]["Size"] = UDim2.new(1, 0, 0.16667, 0);
G2L["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["26"]["Text"] = [[Themes]];
G2L["26"]["Name"] = [[Title]];
G2L["26"]["Position"] = UDim2.new(0.00097, 0, 0, 0);


-- StarterGui.ChaosAdminGUI.ThemesFrame.Title.UITextSizeConstraint
G2L["27"] = Instance.new("UITextSizeConstraint", G2L["26"]);
G2L["27"]["MaxTextSize"] = 35;


-- StarterGui.ChaosAdminGUI.ThemesFrame.Title.UIAspectRatioConstraint
G2L["28"] = Instance.new("UIAspectRatioConstraint", G2L["26"]);
G2L["28"]["AspectRatio"] = 6.73077;


-- StarterGui.ChaosAdminGUI.ThemesFrame.ThemeScroll
G2L["29"] = Instance.new("ScrollingFrame", G2L["25"]);
G2L["29"]["Active"] = true;
G2L["29"]["BorderSizePixel"] = 0;
G2L["29"]["CanvasSize"] = UDim2.new(0, 0, 0.1, 0);
G2L["29"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["29"]["Name"] = [[ThemeScroll]];
G2L["29"]["Size"] = UDim2.new(1.09714, 0, 0.65064, 0);
G2L["29"]["Position"] = UDim2.new(-0.04571, 0, 0.19231, 0);
G2L["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["29"]["BackgroundTransparency"] = 1;


-- StarterGui.ChaosAdminGUI.ThemesFrame.ThemeScroll.UIListLayout
G2L["2a"] = Instance.new("UIListLayout", G2L["29"]);
G2L["2a"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["2a"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.ChaosAdminGUI.ThemesFrame.ThemeScroll.ReferenceTheme
G2L["2b"] = Instance.new("TextButton", G2L["29"]);
G2L["2b"]["TextWrapped"] = true;
G2L["2b"]["BorderSizePixel"] = 0;
G2L["2b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2b"]["TextSize"] = 30;
G2L["2b"]["TextScaled"] = true;
G2L["2b"]["BackgroundColor3"] = Color3.fromRGB(69, 69, 69);
G2L["2b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["2b"]["Size"] = UDim2.new(0, 233, 0, 39);
G2L["2b"]["Name"] = [[ReferenceTheme]];
G2L["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2b"]["Text"] = [[Reference Theme]];
G2L["2b"]["Visible"] = false;
G2L["2b"]["Position"] = UDim2.new(0.19531, 0, 0.47917, 0);


-- StarterGui.ChaosAdminGUI.ThemesFrame.ThemeScroll.ReferenceTheme.UIAspectRatioConstraint
G2L["2c"] = Instance.new("UIAspectRatioConstraint", G2L["2b"]);
G2L["2c"]["AspectRatio"] = 5.97436;


-- StarterGui.ChaosAdminGUI.ThemesFrame.ThemeScroll.ReferenceTheme.UITextSizeConstraint
G2L["2d"] = Instance.new("UITextSizeConstraint", G2L["2b"]);
G2L["2d"]["MaxTextSize"] = 30;


-- StarterGui.ChaosAdminGUI.ThemesFrame.ThemeScroll.UIAspectRatioConstraint
G2L["2e"] = Instance.new("UIAspectRatioConstraint", G2L["29"]);
G2L["2e"]["AspectRatio"] = 1.89163;


-- StarterGui.ChaosAdminGUI.ThemesFrame.UIAspectRatioConstraint
G2L["2f"] = Instance.new("UIAspectRatioConstraint", G2L["25"]);
G2L["2f"]["AspectRatio"] = 1.12179;


-- StarterGui.ChaosAdminGUI.OpenButton
G2L["30f"] = Instance.new("Frame", G2L["1"])
G2L["30f"].Name = "OpenButtonFrame"
G2L["30f"].Size = UDim2.new(0.11005, 0, 0.06137, 0)
G2L["30f"].Position = UDim2.new(0.01834, 0, 0.91074, 0)
G2L["30f"].BackgroundTransparency = 1

G2L["30"] = Instance.new("TextButton", G2L["30f"])
G2L["30"]["TextWrapped"] = true
G2L["30"]["TextStrokeTransparency"] = 0
G2L["30"]["BorderSizePixel"] = 0
G2L["30"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["30"]["TextSize"] = 30
G2L["30"]["TextScaled"] = true
G2L["30"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0)
G2L["30"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G2L["30"]["Size"] = UDim2.new(1, 0, 1, 0)
G2L["30"]["Position"] = UDim2.new(0, 0, 0, 0)
G2L["30"]["Name"] = [[OpenButton]]
G2L["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
G2L["30"]["Text"] = [[Open-Gui]]
G2L["30"]["Visible"] = false

local button = G2L["30"]
local frame = G2L["30f"]
local UserInputService = game:GetService("UserInputService")
local dragging = false
local dragInput
local dragStart
local startPos

button.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragInput = input
        dragStart = input.Position
        startPos = frame.Position
    end
end)

button.InputEnded:Connect(function(input)
    if input == dragInput then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)


-- StarterGui.ChaosAdminGUI.OpenButton.UIStroke
G2L["31"] = Instance.new("UIStroke", G2L["30"]);
G2L["31"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["31"]["Thickness"] = 3;


-- StarterGui.ChaosAdminGUI.OpenButton.UIAspectRatioConstraint
G2L["32"] = Instance.new("UIAspectRatioConstraint", G2L["30"]);
G2L["32"]["AspectRatio"] = 3.68182;


-- StarterGui.ChaosAdminGUI.OpenButton.UITextSizeConstraint
G2L["33"] = Instance.new("UITextSizeConstraint", G2L["30"]);
G2L["33"]["MaxTextSize"] = 30;

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

G2L_MODULES[G2L["24"]] = {
Closure = function()
    local script = G2L["24"];local ThemeAPI = {}

local SC = script.Parent
local UI = SC.Parent

function ThemeAPI.SetTheme(theme : SharedTable)
    for i,x in pairs(UI:GetDescendants()) do
        if x:IsA("Frame") or x:IsA("TextLabel") or x:IsA("TextButton") then
            if x.Name == "Title" then
                x.BackgroundColor3 = theme['PanelColor']
                x.TextColor3 = theme['ForeColor']
            elseif x:IsA("Frame") then
                x.BackgroundColor3 = theme['BackgroundColor']
            elseif x:IsA("TextButton") or x:IsA("TextLabel") and x.Name ~= "Title" and x.Parent ~= UI.ThemesFrame.ThemeScroll then
                x.BackgroundColor3 = theme['ButtonColor']
                x.TextColor3 = theme['ForeColor']
            end
        end
    end
end

return ThemeAPI
end;
};
-- StarterGui.ChaosAdminGUI.ScriptClient
local function C_23()
local script = G2L["23"];
local UI = script.Parent
    
local MainFrame = UI:WaitForChild("MainFrame")
local MinimizeButton = MainFrame:WaitForChild("MinimizeButton")
local CloseButton = MainFrame:WaitForChild("CloseButton")
local OpenButton = UI.OpenButtonFrame.OpenButton
local ExecuteFrame = UI.ExecuteFrame
local OutPutFrame = UI.OutputFrame
local ThemesFrame = UI.ThemesFrame

MainFrame.Draggable = true
ExecuteFrame.Draggable = true
OutPutFrame.Draggable = true
ThemesFrame.Draggable = true

MinimizeButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    OpenButton.Visible = true
end)

CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    OpenButton.Visible = true
end)

OpenButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    OpenButton.Visible = false
end)
    
    Logs = OutPutFrame.Logs
    
    CommandsFrame = MainFrame.CommandsFrame
    SearchBox = MainFrame.SearchBox
    local PrintCommands : boolean = true
    
    local ReferenceCommand = CommandsFrame.ReferenceCommand
    
    CommandBox = ExecuteFrame.CommandBox
    
    local ThemeAPI = require(script.ThemeAPI)
    
    if game.Players.LocalPlayer.PlayerGui:FindFirstChild("ChaosAdminGUI") then
        if game.Players.LocalPlayer.PlayerGui['ChaosAdminGUI'] ~= UI then
            game.Players.LocalPlayer.PlayerGui['ChaosAdminGUI']:Destroy()
        end
    end
    
    wait(0.05)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Chaos Exploits";
        Text = "Happy Exploiting!";
        Duration = 5;
        Icon = "rbxassetid://114193036129104"
    })
    
    local Rstorage = game:GetService("ReplicatedStorage")
    local Rservice = game:GetService("RunService")
    local Hbeat = Rservice.Heartbeat
    local Rstep = Rservice.RenderStepped
    local Stepped = Rservice.Stepped
    local Teams = game:GetService("Teams")
    local Players = game:GetService("Players")
    local Camera = game:GetService("Workspace").Camera
    
    local LocalPlayer = game.Players.LocalPlayer
    
    local Teams = game:GetService("Teams")
    
    local Threads, Tasks = nil, nil
    
    local Unloaded = false
    local RegModule = nil
    
    local SavedArgs = {};
    
    local CmdQueue = {};
    
    local Saved = {
        WalkSpeed = nil;
        RunSpeed = 25;
        NormalSpeed = 16;
        JumpPower = nil;
        NormalJump = 50;
        SpinToolRadius = 8;
        SpinToolSpeed = 10;
        KillDebounce = {};
        MKillDebounce = {};
        Cars = {};
        PCEvents = {};
        Thread = {};
    };
    
    local Settings = {
        KillauraThreshold = 17;
        JoinNotify = false;
        PrintDebug = string.sub(LocalPlayer.Name, 1, 5) == "TheDestroyer" or string.sub(LocalPlayer.Name, 1, 9) == "devang099";
        User = {
            RankedCmds = true;
            HiddenMelee = false;
            HiddenArrest = false;
            AutoDumpCar = false;
            OldItemMethod = false;
        }
    };
    
    local LocPL = {
        Gamepass = nil;
        UIN = LocalPlayer.Name;
        UID = LocalPlayer.UserId;
        ShittyExecutor = nil;
        isTouch = game:GetService("UserInputService").TouchEnabled;
        isMouse = game:GetService("UserInputService").MouseEnabled;
    };
    
    local Loops = {
        KillTeams = {
            All = false;
            Guards = false;
            Inmates = false;
            Criminals = false;
            Neutrals = false;
            Hostiles = false;
        };
        MeleeTeams = {
            All = false;
            Guards = false;
            Inmates = false;
            Criminals = false;
            Neutrals = false;
        };
        ArrestTeams = {
            Inmate = false;
            Guard = false;
            Criminal = false;
        };
        AutoArresting = {
            Plr = {};
            All = false;
        };
        TaseTeams = {
            All = false;
            Inmates = false;
            Criminals = false;
        };
        Kill = {};
        MeleeKill = {};
        RandomKill = {};
        ShootKill = {};
        PunchKill = {};
        VoidKill = {};
        Voided = {};
        Trapped = {};
        Tase = {};
        Arrest = {};
        MakeCrim = {};
        Fling = {};
        CarFling = {};
        Speed = false;
        JumpPower = 50;
        Jump = false;
    };
    local Powers = {
        Killauras = {};
        Taseauras = {};
        Antitouch = {};
        Antipunch = {};
        Antishoot = {};
        Antiarrest = {};
        Onepunch = {};
        Punchaura = {};
        Oneshot = {};
        FriendlyFire = {};
        DeathNuke = {};
    };
    
    local Toggles = {
        ok = false;
        AutoRespawn = false;
        AutoFire = false;
        AutoFireRate = false;
        AutoGuns = false;
        AutoItems = false;
        AutoInfiniteAmmo = false;
        AutoGunMods = false;
        AntiBring = false;
        AntiTase = false;
        AntiArrest = false;
        AntiPunch = false;
        AntiStun = false;
        Antishoot = false;
        AntiShield = false;
        ArrestBack = false;
        PunchAura = false;
        SpamPunch = nil;
        Onepunch = false;
        Oneshot = false;
        Headshot = false;
        Silentaim = false;
        Noclip = false;
        FriendlyFire = false;
        MeleeAura = false;
        ArrestAura = false;
        MeleeTouch = false;
        TKA = {
            Guard = false;
            Inmate = false;
            Criminal = false;
            Enemies = false;
        };
        ESP = false;
        Virus = false;
    };
    
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
    
    local States = {
        ok = false;
        Running = false;
        AntiVoid = true;
        AntiFling = false;
        AntiVelocity = false;
        Invisible = false;
        Speeding = false;
        JumpPower = false;
        IsBringing = false;
        ReplicateEvent = true;
        SpinnyTools = false;
        ForceField = false;
        LoudPunch = false;
        ClickTeleport = false;
        ClickKill = false;
        ClickArrest = false;
        ClickTase = false;
        ClickFling = false;
        ClickGoto = false;
        ClickBring = false;
    };
    
    local SavedPositions = {};
    
    local Connections = {};
    
    local Whitelisted = {};
    local RankedPlrs = {};
    
    local Notif = function(title, text, duration)
        game:GetService("StarterGui"):SetCore("SendNotification", ({
            Title = title;
            Text = text;
            Duration = duration or 5 -- When the notif function is called, if they don't set the duration, it will set the duration to five automatically
        }))
    end
    
    local UpdateMainFrameCanvasSize = function()
        local layout = CommandsFrame:FindFirstChildOfClass("UIListLayout")
        if layout then
            CommandsFrame.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y)
        end
    end
    
    local UpdateLogsFrameCanvasSize = function()
        local layout = Logs:FindFirstChildOfClass("UIListLayout")
        if layout then
            Logs.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y)
        end
    end
    
    local UpdateThemeScrollCanvasSize = function()
        local layout = ThemesFrame.ThemeScroll:FindFirstChildOfClass("UIListLayout")
        if layout then
            ThemesFrame.ThemeScroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y)
        end
    end
    
    local LoadCommandsIntoMainFrame = function()
        for name, tblcommand in pairs(Commands) do
            if typeof(tblcommand) == "table" and tblcommand.Index and tblcommand.ExecuteCommand then
                local NewCommand = ReferenceCommand:Clone()
                NewCommand.Name = name
                NewCommand.Text = (table.concat(tblcommand.Index, " / "))
                NewCommand.Parent = CommandsFrame
                NewCommand.Visible = true
            end
        end
    
        task.wait() -- just letting the uilistlayout take it's sweet, sweet time before we update the canvas
        UpdateMainFrameCanvasSize()
    end
    
    local CreateMessage = function(Message, error : boolean)
        local NewMessage = Logs.ReferenceMessage:Clone()
        NewMessage.Visible = true
        NewMessage.Parent = Logs
        NewMessage.Text = Message
    
        if error then
            NewMessage.TextColor3 = Color3.new(1, 0.164706, 0.180392) -- red
        else
            NewMessage.TextColor3 = Color3.new(0.0666667, 1, 0) -- green
        end
    
        UpdateLogsFrameCanvasSize()
    end
    
    local layout = Logs:FindFirstChildOfClass("UIListLayout")
    if layout then
        layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(UpdateLogsFrameCanvasSize)
    end
    CommandsFrame.CommandLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(UpdateMainFrameCanvasSize)
    
    local deprint = function(args)
        if Settings.PrintDebug then
            print(args)
        end
    end
    
    local dewarn = function(args)
        if Settings.PrintDebug then
            warn(args)
        end
    end
    
    local VKeyPress = function(args, args2, waits)
        if args2 == "Press" then
            game:GetService("VirtualInputManager"):SendKeyEvent(true, args, false, game)
            task.wait(.1)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, args, false, game)
        elseif args2 == "Hold" then
            game:GetService("VirtualInputManager"):SendKeyEvent(true, args, false, game)
        elseif args2 == "UnHold" then
            game:GetService("VirtualInputManager"):SendKeyEvent(false, args, false, game)
        elseif args2 == "HoldWait" and waits then
            game:GetService("VirtualInputManager"):SendKeyEvent(true, args, false, game)
            wait(waits)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, args, false, game)
        end
    end
    
    local waitfor = function(source, args, interval)
        local int = interval or 5
        local timeout = tick() + int
        repeat Stepped:wait() until source:FindFirstChild(args) or tick() - timeout >=0
        timeout = nil
        if source:FindFirstChild(args) then
            return source:FindFirstChild(args)
        else
            return nil
        end
    end
    
    local SaveCamPos = function()
        SavedPositions.OldCameraPos = Camera.CFrame
    end
    
    local LoadCamPos = function()
        Rstep:wait()
        Camera.CFrame = SavedPositions.OldCameraPos or Camera.CFrame
    end
    
    local LocTP = function(cframe)
        LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = cframe
    end
    
    local LAction = function(args, args2)
        if args == "sit" then
            LocalPlayer.Character:FindFirstChild("Humanoid").Sit = true
        elseif args == "unsit" then
            if args2 then
                local human = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                for i = 1, 8 do Hbeat:wait();human.Sit=false;Rstep:wait();human.Sit=false;Stepped:wait();human.Sit=false end
            end;LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Running)
        elseif args == "speed" then
            LocalPlayer.Character:FindFirstChild("Humanoid").WalkSpeed = args2
        elseif args == "jumppw" then
            LocalPlayer.Character:FindFirstChild("Humanoid").JumpPower = args2
        elseif args == "die" then
            LocalPlayer.Character:FindFirstChild("Humanoid").Health = 0
        elseif args == "died" then
            LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
        elseif args == "jump" then
            LocalPlayer.Character:FindFirstChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
        elseif args == "state" then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(args2)
        elseif args == "equip" then
            LocalPlayer.Character:FindFirstChild("Humanoid"):EquipTool(args2)
        elseif args == "unequip" then
            LocalPlayer.Character:FindFirstChild("Humanoid"):UnequipTools()
        end
    end
    --Command functions
    local PlrFromArgs = function(plr, args)
        if plr and plr:lower() == "me" then
            return args
        elseif not plr and not args then
            return false
        elseif not plr and args then
            return args
        end
        local foundplr = false
        for i,v in pairs(Players:GetPlayers()) do
            local Name, DisplayName = v.Name:lower(), v.DisplayName:lower()
            if Name:sub(1, #plr) == plr:lower() or DisplayName:sub(1, #plr) == plr:lower() then
                foundplr = v
            end
        end
        return foundplr
    end
    
    local GetRandomPlr = function(args)
        local DaPlayers = Players:GetPlayers()
        local DaIndex = math.random(1, #DaPlayers)
        local ToReturn = DaPlayers[DaIndex]
        if args and ToReturn.UserId == args.UserId then
            DaPlayers = Players:GetPlayers(); DaIndex = math.random(1, #DaPlayers); ToReturn = DaPlayers[DaIndex]
        end
        return ToReturn
    end
    --i made it into a whole useless function just to save my hands
    local CheckWhitelist = function(args)
        return not (Whitelisted[args.UserId] or Settings.Ranked.AutoWhitelist and RankedPlrs[args.UserId])
    end
    
    local MeleEve = function(args)
        Rstorage.meleeEvent:FireServer(args)
    end
    
    local TeamEve = function(args)
        workspace.Remote.TeamEvent:FireServer(args)
    end
    
    local ArrestEve = function(args, repeated, interval)
        if repeated then
            for i = 1, repeated do
                if interval then task.wait(interval) end
                task.spawn(function()
                    if args.Character:FindFirstChild("Humanoid") and args.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 then
                        workspace.Remote.arrest:InvokeServer(args.Character:FindFirstChildWhichIsA("Part"))
                    end
                end)
            end
        else
            workspace.Remote.arrest:InvokeServer(args.Character:FindFirstChildWhichIsA("Part"))
        end
    end
    
    
    
    local RTPing = function(value)
        if value then
            task.wait(value)
        end
        local RT1 = tick()
        pcall(function()
            workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.buttons["Car Spawner"]["Car Spawner"])
        end)
        local RT2 = tick()
        local RoundTrip = (RT2-RT1) * 1000
        return RoundTrip
    end
    
    local CPing = function(ConvertToHuman, OneWayTrip)
        if ConvertToHuman then
            return OneWayTrip and LocalPlayer:GetNetworkPing() * 1000 or game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
        else
            return OneWayTrip and LocalPlayer:GetNetworkPing() or game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() / 1000
        end
    end
    
    local TeamTo = function(args)
        local tempos = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame; SavedPositions.AutoRe = tempos; SaveCamPos()
        if args == "criminal" then
            if LocalPlayer.TeamColor.Name == "Medium stone grey" then
                TeamEve("Bright orange")
            end
            workspace["Criminals Spawn"].SpawnLocation.CanCollide = false
            repeat
                pcall(function()
                    workspace["Criminals Spawn"].SpawnLocation.CFrame = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
                end)
                Stepped:wait()
            until LocalPlayer.TeamColor == BrickColor.new("Really red")
            workspace['Criminals Spawn'].SpawnLocation.CFrame = SavedPositions.Crimpad
            return
        elseif args == "inmate" then
            TeamEve("Bright orange")
        elseif args == "guard" then
            TeamEve("Bright blue")
            if #Teams.Guards:GetPlayers() > 7 then
                return
            end
        end
        LocalPlayer.CharacterAdded:wait(); waitfor(LocalPlayer.Character, "HumanoidRootPart", 5).CFrame = tempos; LoadCamPos()
    end
    
    local ItemGrab = function(source, args)
        local lroot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart"); local timeout = tick() + 5
        if lroot then SavedPositions.GetGunOldPos = not SavedPositions.GetGunOldPos and lroot.CFrame or SavedPositions.GetGunOldPos; end
        local DaItem = source:FindFirstChild(args); local ItemPickup = DaItem.ITEMPICKUP; local IPickup = ItemPickup.Position
        if lroot then LocTP(CFrame.new(IPickup)); end; repeat task.wait()
            pcall(function()
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = false; LocTP(CFrame.new(IPickup))
            end); task.spawn(function()
                game:GetService("Workspace").Remote.ItemHandler:InvokeServer(ItemPickup)
            end)
        until LocalPlayer.Backpack:FindFirstChild(args) or LocalPlayer.Character:FindFirstChild(args) or tick() - timeout >=0
        pcall(function() LocTP(SavedPositions.GetGunOldPos); end); SavedPositions.GetGunOldPos = nil
    end
    
    local ItemHand = function(source, args)
        if source and source == "old" then
            game:GetService("Workspace").Remote.ItemHandler:InvokeServer(args)
            return
        end; if Settings.User.OldItemMethod then
            if source then
                ItemGrab(source, args)
            else
                for _,sources in pairs(workspace.Prison_ITEMS:GetChildren()) do
                    if sources:FindFirstChild(args) then
                        ItemGrab(source, args)
                        break
                    end
                end
            end
            return
        end; if source then
            workspace.Remote.ItemHandler:InvokeServer({Position = LocalPlayer.Character.Head.Position, Parent = source:FindFirstChild(args)})
        else
            workspace.Remote.ItemHandler:InvokeServer({Position = LocalPlayer.Character.Head.Position, Parent = workspace.Prison_ITEMS.giver:FindFirstChild(args) or workspace.Prison_ITEMS.single:FindFirstChild(args)})
        end
    end
    
    
    
    local Gun = function(args) 
        if Settings.User.OldItemMethod then
            ItemHand(workspace["Prison_ITEMS"].giver, args)
            return
        end; workspace.Remote.ItemHandler:InvokeServer({Position = LocalPlayer.Character.Head.Position, Parent = workspace.Prison_ITEMS.giver:FindFirstChild(args) or workspace.Prison_ITEMS.single:FindFirstChild(args)})
    end
    
    local AllGuns = function()
        if Settings.User.OldItemMethod then
            Gun("AK-47")
            Gun("Remington 870")
        else
            task.spawn(Gun, "AK-47")
            task.spawn(Gun, "Remington 870")
        end
        Gun("M9")
        task.wait()
    end
    
    local CreateClientRay = function(RayS, CustomColor)
        for i = 1, #RayS do
            local NewRay = Instance.new("Part", workspace.CurrentCamera)
            NewRay.Name = "ClientRay"
            NewRay.Material = Enum.Material.Neon
            NewRay.Anchored = true
            NewRay.CanCollide = false
            NewRay.Transparency = 0.5
            NewRay.formFactor = Enum.FormFactor.Custom
            NewRay.Size = Vector3.new(0.2, 0.2, RayS[i].Distance)
            NewRay.CFrame = RayS[i].Cframe
            local Mesh = Instance.new("BlockMesh", NewRay)
            Mesh.Scale = Vector3.new(0.5, 0.5, 1)
            if CustomColor then
                NewRay.BrickColor = BrickColor.new(CustomColor)
            else
                NewRay.BrickColor = BrickColor.Yellow()
            end
            game:GetService("Debris"):AddItem(NewRay, 0.05)
        end
    end
    
    local MultiKill = function(plrs, exclude)
        local AK = LocalPlayer.Backpack:FindFirstChild("AK-47") or LocalPlayer.Character:FindFirstChild("AK-47")
        if not AK and not (LocalPlayer.TeamColor == BrickColor.new("Bright blue")) then
        Gun("AK-47")
        task.wait()
        AK = LocalPlayer.Backpack:FindFirstChild("AK-47") or LocalPlayer.Character:FindFirstChild("AK-47")
        end
        local neutralkill, hasplayers = nil, nil
        local ShootEvents = {}
        for i,v in pairs(plrs:GetPlayers()) do
            if not (v == LocalPlayer or v == exclude) then
                if v.Character and not v.Character:FindFirstChildWhichIsA("ForceField") and not (v.Character:FindFirstChild("Humanoid").Health == 0) then
                    hasplayers = true
                    if v.TeamColor == LocalPlayer.TeamColor then
                        if v.TeamColor == BrickColor.new("Bright orange") then
                            TeamTo("criminal")
                        elseif v.TeamColor == BrickColor.new("Really red") or v.TeamColor == BrickColor.new("Bright blue") then
                            neutralkill = true
                        end
                    end
                    for i = 1, 10 do
                        ShootEvents[#ShootEvents + 1] = {
                            Hit = v.Character:FindFirstChild("Head");
                            Cframe = CFrame.new();
                            RayObject = Ray.new(Vector3.new(), Vector3.new());
                            Distance = 0;
                        }
                    end
                end
            end
        end
        if not hasplayers then
            return
        end
        task.spawn(function()
            for i = 1, 20 do
                Rstorage.ReloadEvent:FireServer(AK)
                task.wait(.1)
            end
        end)
        if neutralkill then
            SavedPositions.AutoRe = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
            SaveCamPos()
            TeamEve("Medium stone grey")
            Rstorage.ShootEvent:FireServer(ShootEvents, AK)
            task.wait(0.06)
            TeamEve("Bright orange")
        else
            Rstorage.ShootEvent:FireServer(ShootEvents, AK)
        end
    end
    
    local ShootKill = function(plr, amount, guntouse, hitpart)
        if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") and plr.Character.Humanoid.Health ~= 0 then
            if plr.TeamColor == LocalPlayer.TeamColor then
                if plr.TeamColor == BrickColor.new("Bright orange") then
                    TeamTo("criminal")
                else
                    TeamTo("inmate")
                    RTPing(0.1)
                end
            end
            local DeGun = guntouse or "AK-47"
            local HasGun = LocalPlayer.Character:FindFirstChild(DeGun) or LocalPlayer.Backpack:FindFirstChild(DeGun)
            if not HasGun then
                Gun(DeGun)
                HasGun = waitfor(LocalPlayer.Backpack, DeGun, 1)
            end
            local ToHit = hitpart or plr.Character:FindFirstChildWhichIsA("BasePart")
            local Times = amount or 15
            LAction("equip", HasGun)
            for i = 1, Times do
                if not HasGun then
                    break
                end
                local Start, End = HasGun:FindFirstChild("Muzzle").Position, plr.Character:FindFirstChild("HumanoidRootPart").Position
                local EA = {
                    [1] = {
                        Hit = ToHit;
                        Cframe = CFrame.new(End, Start) * CFrame.new(0, 0, -(Start-End).Magnitude / 2);
                        Distance = (Start-End).Magnitude;
                        RayObject = Ray.new(Vector3.new(), Vector3.new());
                    };
                };
                if DeGun == "Remington 870" then
                    for i = 1, 4 do
                        local tmp = End
                        End = End + Vector3.new(math.random(-1, 1), math.random(-1, 2), math.random(-1, 1))
                        EA[#EA+1] = {
                            Hit = ToHit;
                            Cframe = CFrame.new(End, Start) * CFrame.new(0, 0, -(Start-End).Magnitude / 2);
                            Distance = (Start-End).Magnitude;
                            RayObject = Ray.new(Vector3.new(), Vector3.new());
                        };
                        End = tmp
                        tmp = nil
                    end
                end
                CreateClientRay(EA)
                Rstorage.ShootEvent:FireServer(EA, HasGun)
                Rstorage.ReloadEvent:FireServer(HasGun)
                task.wait(.1)
                if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid").Health == 0 then
                    break
                end
            end
        end
    end
    
    SoundSpam = function()
        task.spawn(function()
            while States.SoundSpam do task.wait()
                local sounds = {}
                for ii,vv in next, workspace:GetDescendants() do
                    if vv:IsA("Sound") then
                        sounds[#sounds+1] = vv
                    end
                end; task.wait()
                pcall(function()
                    for i,v in pairs(Players:GetPlayers()) do
                        if v.Character and v.Character:FindFirstChild("Head") then
                            local vhead = v.Character:FindFirstChild("Head")
                            for ii,vv in ipairs(sounds) do
                                Rstorage.SoundEvent:FireServer(vv, vhead); vv:Play()
                            end
                        end; wait(CPing()+0.15)
                    end; sounds = nil
                end)
                task.wait(.1); RTPing()
            end
        end)
    end;
    LoopSounds = function()
        task.spawn(function()
            while States.LoopSounds do task.wait()
                pcall(function()
                    for i,v in pairs(Players:GetPlayers()) do
                        if v and v.Character then
                            local head = v.Character.Head
                            local punch = head.punchSound; punch.Volume = math.huge
                            Rstorage.SoundEvent:FireServer(punch)
                            local ring = workspace["Prison_guardspawn"].spawn.Sound
                            Rstorage.SoundEvent:FireServer(ring, head)
                            ring:Play(); punch:Play()
                        end
                    end
                end); task.wait(.08)
            end
        end)
    end;
    
    SavedPositions.AutoRe = false
    local diedevent
    local lochar = LocalPlayer.Character or LocalPlayer.CharacterAdded:wait()
    local function ondiedevent()
        coroutine.wrap(function()
            diedevent:Disconnect(); SaveCamPos()
            SavedPositions.AutoRe = lochar:WaitForChild("HumanoidRootPart", 1) and LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
        end)()
        if Toggles.AutoRespawn then
            local locteam = LocalPlayer.TeamColor
            if locteam == BrickColor.new("Really red") then
                if #Teams.Guards:GetPlayers() < 8 then
                    TeamEve("Bright blue")
                else
                    TeamEve("Bright orange")
                end
                workspace["Criminals Spawn"].SpawnLocation.CanCollide = false
                workspace["Criminals Spawn"].SpawnLocation.CFrame = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
                LocalPlayer.CharacterAdded:wait()
                repeat task.wait()
                    pcall(function()
                        workspace["Criminals Spawn"].SpawnLocation.CFrame = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
                    end)
                until LocalPlayer.TeamColor == BrickColor.new("Really red"); workspace['Criminals Spawn'].SpawnLocation.CFrame = SavedPositions.Crimpad
            elseif locteam == BrickColor.new("Bright blue") then
                if #Teams.Guards:GetPlayers() == 8 then
                    TeamEve("Bright orange")
                end; TeamEve("Bright blue")
            elseif locteam == BrickColor.new("Bright orange") then
                TeamEve("Bright orange")
            else
                TeamEve("Medium stone grey")
            end
        end
    end
    
    local SpawnClientStuff = function(arg)
        if arg == "superknife" then
            ItemHand(false, "Crude Knife")
            local knife = LocalPlayer.Backpack:FindFirstChild("Crude Knife") or LocalPlayer.Character:FindFirstChild("Crude Knife")
            local animate = Instance.new("Animation", knife)
            animate.AnimationId = "rbxassetid://218504594"
            local animtrack = LocalPlayer.Character:FindFirstChild("Humanoid"):LoadAnimation(animate)
            local attacking = false
            local inPutCon = game:GetService("UserInputService").InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Crude Knife") then
                        if not attacking then
                            attacking = true
                            animtrack:Play()
                            for i,v in pairs(Players:GetPlayers()) do
                                if not (v == LocalPlayer) then
                                    if v.Character and v.Character:FindFirstChild("Humanoid") then
                                        if not (v.Character:FindFirstChild("Humanoid").Health == 0) then
                                            local LPart, VPart = LocalPlayer.Character.PrimaryPart, v.Character.PrimaryPart
                                            if LPart and VPart then
                                                if (LPart.Position-VPart.Position).Magnitude <= 5 then
                                                    for i = 1, 15 do
                                                        MeleEve(v)
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                            task.wait(.1)
                            attacking = false
                        end
                    end
                end
            end)
            task.spawn(function()
                LocalPlayer.CharacterAdded:wait()
                inPutCon:Disconnect(); animate:Destroy()
                animate = nil; animtrack = nil; inPutCon = nil
            end)
        elseif arg == "bat" then
            local tool = Instance.new("Tool", LocalPlayer.Backpack)
            tool.GripPos = Vector3.new(0.1, -1, 0)
            tool.Name = "Bat"
            local handle = Instance.new("Part", tool)
            handle.Name = "Handle"
            handle.Size = Vector3.new(0.4, 4, 0.4)
            local animate = Instance.new("Animation", tool)
            animate.AnimationId = "rbxassetid://218504594"
            local animtrack = LocalPlayer.Character.Humanoid:LoadAnimation(animate)
            local attacking = false
            local activate = tool.Activated:Connect(function()
                if not attacking then
                    attacking = true
                    animtrack:Play()
                    task.wait(.1)
                    attacking = false
                end
            end)
            local Touched = handle.Touched:Connect(function(part)
                if attacking then
                    local human = part.Parent:FindFirstChild("Humanoid")
                    if human then
                        local plr = Players:FindFirstChild(part.Parent.Name)
                        if plr then
                            for i = 1, 10 do
                                MeleEve(plr)
                            end
                        end
                    end
                end
            end)
            task.spawn(function()
                LocalPlayer.CharacterAdded:wait()
                activate:Disconnect(); Touched:Disconnect()
                handle:Destroy(); tool:Destroy(); animate:Destroy()
                animtrack = nil; animate = nil; attacking = nil
            end)
        elseif arg == "clicktp" then
            local newTool = Instance.new("Tool")
            newTool.RequiresHandle = false
            newTool.Name = "Click-TP"
            newTool.Parent = LocalPlayer.Backpack
            local tempocon = nil
            tempocon = newTool.Activated:Connect(function()
                local Get = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                local Wi = LocalPlayer:GetMouse().Hit
                local Fi = Wi.Position + Vector3.new(0, 2.5, 0)
                local Anywhere = Fi-Get.Position
                local YouGo = Get.CFrame + Anywhere
                Get.CFrame = YouGo
            end)
            task.spawn(function()
                LocalPlayer.CharacterAdded:wait()
                newTool:Destroy(); tempocon:Disconnect()
                newTool = nil; tempocon = nil;
            end)
        elseif arg == "btools" then
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
    end
    
    
    local AllItems = function()
        AllGuns()
        if not (LocalPlayer.TeamColor == BrickColor.new("Bright blue")) then
            ItemHand(false, "Crude Knife");ItemHand(false, "Hammer")
        elseif LocPL.Gamepass then
            if LocalPlayer.TeamColor == BrickColor.new("Bright blue") then
                ItemHand(false, "Riot Shield");ItemHand(workspace.Prison_ITEMS.clothes, "Riot Police")
            end;ItemHand(workspace.Prison_ITEMS.hats, "Riot helmet");ItemHand(workspace.Prison_ITEMS.hats, "Ski mask")
        end
        local Food = workspace.Prison_ITEMS.giver:FindFirstChild("Dinner") or workspace.Prison_ITEMS.giver:FindFirstChild("Breakfast") or workspace.Prison_ITEMS.giver:FindFirstChild("Lunch")
        if Food then
            ItemHand(false, Food.Name)
        end;if workspace.Prison_ITEMS.single:FindFirstChild("Key card") then
            ItemHand(workspace.Prison_ITEMS.single, "Key card")
        end
        SpawnClientStuff("bat");SpawnClientStuff("btools")
    end
    
    local function charaddtask()
        diedevent:Disconnect()
        local LHuman = lochar:WaitForChild("Humanoid", 1)
        if LHuman then
            diedevent = LHuman.Died:Connect(ondiedevent)
            if Connections.Humanation then
                Connections.Humanation:Disconnect(); Connections.Humanation = nil
            end
            Connections.Humanation = LHuman.AnimationPlayed:Connect(function(des)
                if Toggles.AntiArrest and des.Animation.AnimationId == "rbxassetid://287112271" then
                    des:Stop(); des:Destroy()
                    task.delay(4.95, function()
                        local tempos, wascriminal = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame, LocalPlayer.TeamColor.Name == "Really red" or nil; SavedPositions.AutoRe = tempos; SaveCamPos()
                        LocalPlayer.CharacterAdded:wait(); waitfor(LocalPlayer.Character, "HumanoidRootPart", 1).CFrame = tempos; LoadCamPos()
                        if wascriminal then
                            TeamTo("criminal")
                        end
                    end); task.delay(0, function()
                        LAction("speed", Saved.NormalSpeed); task.wait(0.03); LAction("jumppw", Saved.NormalJump)
                    end)
                end
                if Toggles.AntiTase and des.Animation.AnimationId == "rbxassetid://279227693" then
                    des:Stop(); des:Destroy()
                    Hbeat:wait(); LAction("speed", Saved.NormalSpeed); task.wait(0.03); LAction("jumppw", Saved.NormalJump)
                end
            end)
            if Connections.CharacterChildAdded then
                Connections.CharacterChildAdded:Disconnect(); Connections.CharacterChildAdded = nil
            end
            Connections.CharacterChildAdded = lochar.ChildAdded:Connect(function(tool)
                if tool:FindFirstChild("GunStates") and not LocPL.ShittyExecutor then
                    if Toggles.AutoInfiniteAmmo then
                        local stat = require(tool.GunStates)
                        stat.MaxAmmo = math.huge;stat.CurrentAmmo = math.huge;stat.AmmoPerClip = math.huge;stat.StoredAmmo = math.huge
                        if not Saved.Thread.AutoInfiniteAmmo then
                            Saved.Thread.AutoInfiniteAmmo = true;Tasks.AutoInfiniteAmmo()
                        end
                    end;if Toggles.AutoFire or Toggles.AutoFireRate then
                        local sta = require(tool.GunStates)
                        if Toggles.AutoFire and not States.SpinnyTools then
                            sta.AutoFire = true
                        end
                        if Toggles.AutoFireRate then
                            sta.FireRate = 0.01
                        end
                    end;if Toggles.AutoGunMods then
                        local stat = require(tool.GunStates)
                        stat.Damage = 9e9
                        stat.FireRate = 0.01
                        stat.Range = math.huge
                        stat.MaxAmmo = math.huge
                        stat.StoredAmmo = math.huge
                        stat.AmmoPerClip = math.huge
                        stat.CurrentAmmo = math.huge
                        stat.AutoFire = true
                        stat.Bullets = 10
                        if not Toggles.AutoInfiniteAmmo and not States.SpinnyTools then
                            Tasks.ReloadGun(tool, true)
                        end
                    end;if States.SpinnyTools then
                        require(tool.GunStates).AutoFire = false
                    end
                end
            end)
        end
        if LocalPlayer.TeamColor == BrickColor.new("Medium stone grey") or not LocPL.WrongGame and LocalPlayer.PlayerGui.Home.intro.Visible then
            Threads.HideTeamGui()
        end
    end
    
    local function oncharadded()
        lochar = LocalPlayer.Character or LocalPlayer.CharacterAdded:wait()
        coroutine.wrap(charaddtask)()
        if SavedPositions.AutoRe and Toggles.AutoRespawn then
            local LRoot = lochar:WaitForChild("HumanoidRootPart", 1)
            if LRoot then
                LRoot.CFrame = SavedPositions.AutoRe; LoadCamPos(); LRoot.CFrame = SavedPositions.AutoRe
                task.spawn(function()
                    for i = 1, 3 do
                        task.wait(); LRoot.CFrame = SavedPositions.AutoRe
                    end
                end)
                if wait() and not lochar:FindFirstChildWhichIsA("ForceField") then
                    for i = 1, 4 do
                        LRoot.CFrame = SavedPositions.AutoRe; waitfor(LocalPlayer.Character, "HumanoidRootPart", 1).CFrame = SavedPositions.AutoRe
                    end; lochar:WaitForChild("HumanoidRootPart", 1).CFrame = SavedPositions.AutoRe
                    deprint("Debug_Char added with no forcefield?")
                end
            end
        end
        lochar:WaitForChild("Humanoid", 1):SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        lochar:WaitForChild("Humanoid", 1):SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
    end
    
    diedevent = lochar:WaitForChild("Humanoid").Died:Connect(ondiedevent)
    Connections.CharacterAdded = LocalPlayer.CharacterAdded:Connect(oncharadded)
    
    local GiveKeyCard = function(player)
        if player == LocalPlayer then
            if workspace.Prison_ITEMS.single:FindFirstChild("Key card") then
                ItemHand(false, "Key card")
            else
                local oldteam, oldpos = LocalPlayer.TeamColor, LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
                repeat task.wait()
                    if LocalPlayer.TeamColor ~= BrickColor.new("Bright blue") then
                        if #Teams.Guards:GetPlayers() > 7 then
                            CreateMessage("Guards Team is Full, Could Not Give Keycard.", true)
                            break
                        end; TeamTo("guard")
                    end; LAction("died")
                    if not Toggles.AutoRespawn then
                        TeamTo("guard")
                    else
                        LocalPlayer.CharacterAdded:wait()
                    end; wait(.1)
                until workspace.Prison_ITEMS.single:FindFirstChild("Key card"); LocTP(oldpos)
                if oldteam == BrickColor.new("Bright orange") then
                    TeamTo("inmate")
                elseif oldteam == BrickColor.new("Really red") then
                    TeamTo("criminal")
                end; ItemHand(false, "Key card"); ItemHand(false, "Key card"); ItemHand(false, "Key card")
            end
        else
            local finallykeycard = nil; local oldteam = LocalPlayer.TeamColor
            SavedPositions.GiveKeyCard = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
            task.spawn(function()
                while task.wait() do
                    for i,v in pairs(workspace.Prison_ITEMS.single:GetChildren()) do
                        if v.Name == "Key card" and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            local vpivot = v.ITEMPICKUP.Position
                            local ppivot = player.Character:FindFirstChild("HumanoidRootPart").Position
                            if (vpivot-ppivot).Magnitude <= 15 then
                                finallykeycard = true
                                break
                            end
                        end
                    end
                    if finallykeycard then
                        break
                    end
                end
            end)
            repeat task.wait()
                if player.Character and player.Character:FindFirstChildOfClass("Humanoid") and player.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 then
                    local temp = player.Character:FindFirstChild("HumanoidRootPart").CFrame
                    SavedPositions.AutoRe = temp; LocTP(temp)
                    if LocalPlayer.TeamColor ~= BrickColor.new("Bright blue") then
                        if #Teams.Guards:GetPlayers() > 7 then
                            finallykeycard = true
                            break
                        end
                        TeamEve("Bright blue"); LocalPlayer.CharacterAdded:wait()
                        waitfor(LocalPlayer.Character, "HumanoidRootPart", 2).CFrame = temp; RTPing(0)
                    end
                    LAction("died")
                    if Toggles.AutoRespawn then
                        LocalPlayer.CharacterAdded:wait(); waitfor(LocalPlayer.Character, "HumanoidRootPart", 2).CFrame = temp
                    else
                        TeamTo("guard")
                    end; RTPing(0.09)
                else
                    finallykeycard = true
                    break
                end
            until finallykeycard
            SavedPositions.AutoRe = SavedPositions.GiveKeyCard; LocTP(SavedPositions.GiveKeyCard)
            if oldteam == BrickColor.new("Bright orange") then
                TeamTo("inmate")
            elseif oldteam == BrickColor.new("Really red") then
                TeamTo("criminal")
            end
        end
    end
    
    local KillPL = function(plr, events, guntouse, WaitToDie) 
        local AK = LocalPlayer.Backpack:FindFirstChild("AK-47") or LocalPlayer.Character:FindFirstChild("AK-47")
        if not AK and not guntouse then
            Gun("AK-47")
            task.wait()
            AK = LocalPlayer.Backpack:FindFirstChild("AK-47") or LocalPlayer.Character:FindFirstChild("AK-47")
        elseif guntouse then
            AK = LocalPlayer.Backpack:FindFirstChild(guntouse) or LocalPlayer.Character:FindFirstChild(guntouse)
            if not AK then
                Gun(guntouse)
                task.wait()
                AK = LocalPlayer.Backpack:FindFirstChild(guntouse)
            end
        end
        if plr.Character:FindFirstChild("Humanoid").Health == 0 or plr.Character:FindFirstChildWhichIsA("ForceField") then
            return
        end
        local Eve = events or 10
        local ShootEvents = {};
        for i = 1, Eve do
            ShootEvents[#ShootEvents + 1] = {
                Hit = plr.Character:FindFirstChildOfClass("Part");
                Cframe = CFrame.new();
                RayObject = Ray.new(Vector3.new(), Vector3.new());
                Distance = 0;
            };
        end
        task.spawn(function()
            for i = 1, 6 do
                Rstorage.ReloadEvent:FireServer(AK)
                task.wait(.1)
            end
        end)
        if plr.TeamColor == LocalPlayer.TeamColor then
            if plr.TeamColor == BrickColor.new("Really red") or plr.TeamColor == BrickColor.new("Bright blue") then
                SavedPositions.AutoRe = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
                SaveCamPos()
                TeamEve("Bright orange")
                Rstorage.ShootEvent:FireServer(ShootEvents, AK)
                task.wait(0.06)
            else
                TeamTo("criminal")
                Rstorage.ShootEvent:FireServer(ShootEvents, AK)
            end
        else
            Rstorage.ShootEvent:FireServer(ShootEvents, AK)
        end
        if WaitToDie then
            repeat task.wait() until not plr.Character or not plr.Character:FindFirstChildOfClass("Humanoid") or plr.Character:FindFirstChildOfClass("Humanoid").Health == 0 or plr.Character:FindFirstChildWhichIsA("ForceField")
        end
    end
    
    local GetIllegalReg = function(args)
        local RegPlr = nil
        if args.Character and RegModule then
            for i,v in pairs(Rstorage:FindFirstChild("PermittedRegions"):GetChildren()) do
                if RegModule.findRegion(args.Character) then
                    RegPlr = RegModule.findRegion(args.Character)["Name"]
                end
                if v.Value == RegPlr then
                    return false
                end
            end
            return true
        else return true end
    end
    
    local ArrestPL = function(args, savepos, isHidden)
        SavedPositions.ArrestPlr = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
        local Timedout, readytoar = tick() + 6, tick() + CPing()
        LocTP(args.Character:FindFirstChild("HumanoidRootPart").CFrame)
        repeat task.wait()
            local potangina = args.Character and args.Character:FindFirstChild("Humanoid").Health == 0
            local gago = args.TeamColor == BrickColor.new("Bright blue") or args.TeamColor == BrickColor.new("Medium stone grey")
            local hayop = args.TeamColor ~= BrickColor.new("Really red") and not GetIllegalReg(args)
            if potangina or gago or hayop then
                break
            end;if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid").Sit then
                LAction("unsit")
            end;if isHidden or Settings.User.HiddenArrest then
                LocTP(args.Character:FindFirstChild("Head").CFrame * CFrame.new(0, -12, -1))
            else
                LocTP(args.Character:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, 0, -1))
            end;if tick() - readytoar >=0 then
                task.spawn(ArrestEve, args)
            end
        until args.Character:FindFirstChild("Head"):FindFirstChild("handcuffedGui") or tick() - Timedout >= 0; Timedout = nil
        if savepos then
            if LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                LAction("unsit", true)
            end;LocTP(SavedPositions.ArrestPlr)
        end
    end
    
    local ArrestEve = function(args, repeated, interval)
        if repeated then
            for i = 1, repeated do
                if interval then task.wait(interval) end
                task.spawn(function()
                    if args.Character:FindFirstChild("Humanoid") and args.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 then
                        workspace.Remote.arrest:InvokeServer(args.Character:FindFirstChildWhichIsA("Part"))
                    end
                end)
            end
        else
            workspace.Remote.arrest:InvokeServer(args.Character:FindFirstChildWhichIsA("Part"))
        end
    end
    
    local VirtualPunch = function(args)
        task.delay(0, function()
            if not (LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")) then
                return
            end;for _, animationTrack in ipairs(LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):FindFirstChildOfClass("Animator"):GetPlayingAnimationTracks()) do
                if animationTrack.Animation.AnimationId == "rbxassetid://484200742" or animationTrack.Animation.AnimationId == "rbxassetid://484926359" then
                    animationTrack:Stop(); animationTrack:Destroy()
                end
            end
            local Sapakan = math.random(1, 2);local animtoload = nil;local newAnim = Instance.new("Animation")
            if Sapakan == 1 then
                newAnim.AnimationId="rbxassetid://484200742";animtoload=LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):FindFirstChildOfClass("Animator"):LoadAnimation(newAnim)
            else
                newAnim.AnimationId="rbxassetid://484926359";animtoload=LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):FindFirstChildOfClass("Animator"):LoadAnimation(newAnim)
            end;animtoload.Looped=false;animtoload:Play(); task.wait(animtoload.Length); newAnim:Destroy();animtoload:Stop();animtoload:Destroy();newAnim=nil;animtoload=nil;Sapakan=nil
        end)
        local LHead = LocalPlayer.Character:FindFirstChild("Head")
        local magnit = Toggles.PunchAura and 20 or 2.5
        if not args then
            for i,v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer then
                    local VChar = v.Character
                    local VHead = VChar:FindFirstChild("Head")
                    if VHead and LHead then
                        if (LHead.Position-VHead.Position).Magnitude <= magnit then
                            local sound = VHead.punchSound; sound.Volume = 1; sound:Play()
                            if Toggles.Onepunch then
                                for i = 1, 15 do
                                    MeleEve(v)
                                end
                            else
                                MeleEve(v)
                            end; game:GetService("ReplicatedStorage").SoundEvent:FireServer(sound)
                            if not Toggles.PunchAura then
                                break
                            end
                        end
                    end
                end
            end
        elseif args then
            local AChar = args.Character
            local AHead = AChar:FindFirstChild("Head")
            if (LHead.Position-AHead.Position).Magnitude <= magnit then
                local sound = AHead.punchSound; sound.Volume = 1; sound:Play()
                if Toggles.Onepunch then
                    for i = 1, 15 do
                        MeleEve(args)
                    end
                else
                    MeleEve(args)
                end; game:GetService("ReplicatedStorage").SoundEvent:FireServer(sound)
            end
        end
        if States.LoudPunch then
            for i,v in pairs(Players:GetPlayers()) do
                if v and v.Character and v.Character:FindFirstChild("Head") then
                    local head = v.Character:FindFirstChild("Head")
                    local vol = head.punchSound
                    if v == LocalPlayer then
                        vol:Play()
                    end; Rstorage.SoundEvent:FireServer(vol)
                end
            end
        end
    end
    
    local TasePL = function(plr, args)
        local oldteam = nil
        if not (LocalPlayer.TeamColor == BrickColor.new("Bright blue")) then
            oldteam = LocalPlayer.TeamColor
            TeamTo("guard")
            task.wait()
        end
        local Taser = LocalPlayer.Backpack:FindFirstChild("Taser") or LocalPlayer.Character:FindFirstChild("Taser")
        local ShootEvents = {};
        if args == "teams" then
            for _, tea in pairs(plr:GetPlayers()) do
                if (not (tea == LocalPlayer) and not (tea.TeamColor == BrickColor.new("Bright blue"))) and tea.Character and tea.Character:FindFirstChild("Humanoid") and not (tea.Character:FindFirstChild("Humanoid").Health == 0) then
                    ShootEvents[#ShootEvents + 1] = {
                        Hit = tea.Character:FindFirstChildOfClass("Part");
                        Cframe = CFrame.new();
                        RayObject = Ray.new(Vector3.new(), Vector3.new());
                        Distance = 0;
                    };
                end
            end
        elseif args == "tables" then
            for i,v in next, plr do
                if not (v == LocalPlayer) and v.Character and v.Character:FindFirstChild("Humanoid") and not (v.Character:FindFirstChild("Humanoid").Health == 0) then
                    ShootEvents[#ShootEvents + 1] = {
                        Hit = v.Character:FindFirstChild("Head");
                        Cframe = CFrame.new();
                        RayObject = Ray.new(Vector3.new(), Vector3.new());
                        Distance = 0;
                    };
                end
            end
        else
            if plr and plr.Character and plr.Character:FindFirstChild("Humanoid") and not (plr.Character:FindFirstChild("Humanoid").Health == 0) then
                ShootEvents[#ShootEvents + 1] = {
                    Hit = plr.Character:FindFirstChildOfClass("Part");
                    Cframe = CFrame.new();
                    RayObject = Ray.new(Vector3.new(), Vector3.new());
                    Distance = 0;
                };
            end
        end
        Rstorage.ShootEvent:FireServer(ShootEvents, Taser)
        Rstorage.ReloadEvent:FireServer(Taser)
        task.wait()
        if oldteam then
            if oldteam == BrickColor.new("Really red") then
                TeamTo("criminal")
            else
                TeamTo("inmate")
            end
        end
    end
    
    local PunchKill = function(args, speed)
        local Interval = speed or 0.3
        local lastpos = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
        while task.wait(Interval) do
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                LAction("unsit")
            end
            if (not Players:FindFirstChild(args.Name) or not args.Character) or args.Character:FindFirstChild("Humanoid").Health == 0 or args.TeamColor == BrickColor.new("Medium stone grey") then
                break
            end
            LocTP(args.Character:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, 0, 1.5))
            VirtualPunch(args)
        end
        LocTP(lastpos)
    end
    
    local BringCar = function(args, usedcar, policecar)
        local Car = nil; local CarButton = workspace.Prison_ITEMS.buttons["Car Spawner"]["Car Spawner"]
        if policecar then
            CarButton = workspace.Prison_ITEMS.buttons:GetChildren()[4]["Car Spawner"]
        end; local ButtonPivot = CarButton:GetPivot()
        local LastPos = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame; States.IsBringing = true
        if usedcar then
            for i,v in pairs(workspace.CarContainer:GetChildren()) do
                if v:IsA("Model") and v:FindFirstChild("Body") and v.Body:FindFirstChild("VehicleSeat") and not v.Body.VehicleSeat.Occupant then
                    for ii,vv in pairs(v.Body:GetChildren()) do
                        if vv:IsA("Seat") and not vv.Occupant then
                            Car = v
                            break
                        end
                    end; if Car then
                        break
                    end
                end
            end; if not Car then
                CreateMessage("No Cars Found.", true)
                return
            end
        else
            task.spawn(function()
                Car = game:GetService("Workspace").CarContainer.ChildAdded:wait()
            end); repeat task.wait()
                task.spawn(function()
                    LAction("unsit"); LocTP(ButtonPivot); workspace.Remote.ItemHandler:InvokeServer(CarButton)
                end)
            until Car
        end; repeat task.wait() until Car:FindFirstChild("RWD") and Car:FindFirstChild("Body") and Car:FindFirstChild("Body"):FindFirstChild("VehicleSeat")
        local Stopped, timeout = false, tick()
        while not Stopped do task.wait()
            pcall(function()
                LocTP(CFrame.new(Car.Body.VehicleSeat.Position))
                Car.Body.VehicleSeat:Sit(LocalPlayer.Character:FindFirstChild("Humanoid"))
                Stopped = LocalPlayer.Character:FindFirstChild("Humanoid").Sit or tick() - timeout > 6
            end)
        end; Car.PrimaryPart = Car:WaitForChild("RWD")
        if args then
            local destiny = args == LocalPlayer and LastPos or args.Character:FindFirstChild("Head").CFrame
            Car:SetPrimaryPartCFrame(destiny)
            wait(.2); LAction("unsit", true); LocTP(LastPos)
        else
            Car:SetPrimaryPartCFrame(LastPos)
        end; States.IsBringing = false; Stopped = nil
        return Car
    end
    
    local TableKill = function(tables)
        local AK = LocalPlayer.Backpack:FindFirstChild("AK-47") or LocalPlayer.Character:FindFirstChild("AK-47")
        if not AK then
            Gun("AK-47")
            task.wait()
        end
        local inteam = nil
        local crimteam = nil
        local sameteam = nil
        local sameinmate = nil
        local sameguard = nil
        local samecrim = nil
        local ShootEvents = {};
        for i,v in next, tables do
            if v.Character and not v.Character:FindFirstChildWhichIsA("ForceField") and not (v.Character:FindFirstChild("Humanoid").Health == 0) then
                if not Saved.KillDebounce[v.Name] then
                    Saved.KillDebounce[v.Name] = true
                    if v.TeamColor == LocalPlayer.TeamColor then
                        sameteam = true
                        if LocalPlayer.TeamColor == BrickColor.new("Bright orange") then
                            sameinmate = true
                        elseif LocalPlayer.TeamColor == BrickColor.new("Bright blue") then
                            sameguard = true
                        elseif LocalPlayer.TeamColor == BrickColor.new("Really red") then
                            samecrim = true
                        end
                    end
                    if v.TeamColor == BrickColor.new("Bright orange") then
                        inteam = true
                    elseif v.TeamColor == BrickColor.new("Really red") then
                        crimteam = true
                    end
                    delay(1.2, function()
                        Saved.KillDebounce[v.Name] = nil
                    end)
                    for i = 1, 10 do
                        ShootEvents[#ShootEvents + 1] = {
                            Hit = v.Character:FindFirstChild("Head");
                            Cframe = CFrame.new();
                            RayObject = Ray.new(Vector3.new(), Vector3.new());
                            Distance = 0;
                        }
                    end
                end
            end
        end
        if not ShootEvents[1] then
            return
        end
        AK = LocalPlayer.Backpack:FindFirstChild("AK-47") or LocalPlayer.Character:FindFirstChild("AK-47")
        task.spawn(function()
            for i = 1, 10 do
                Rstorage.ReloadEvent:FireServer(AK)
                task.wait(.1)
            end
        end)
        if sameteam then
            if ((samecrim or sameguard) and inteam) or (sameinmate and crimteam) then
                SavedPositions.AutoRe = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
                SaveCamPos()
                TeamEve("Medium stone grey")
                Rstorage.ShootEvent:FireServer(ShootEvents, AK)
                task.wait(0.06)
                TeamEve("Bright orange")
            elseif (samecrim or sameguard) and not inteam then
                SavedPositions.AutoRe = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
                SaveCamPos()
                TeamEve("Bright orange")
                Rstorage.ShootEvent:FireServer(ShootEvents, AK)
                task.wait(0.05)
            elseif sameinmate and not crimteam then
                TeamTo("criminal")
                Rstorage.ShootEvent:FireServer(ShootEvents, AK)
            end
        else
            Rstorage.ShootEvent:FireServer(ShootEvents, AK)
        end
    end
    
    local BringPL = function(BringFrom, Destination, isCFrame, donotusecar, dontbreakyet)
        if BringFrom.TeamColor == BrickColor.new("Medium stone grey") or not (BringFrom.Character and BringFrom.Character:FindFirstChildOfClass("Humanoid") and BringFrom.Character:FindFirstChildOfClass("Humanoid").Health ~= 0) then
            CreateMessage("Error Bringing PLayer. Either dead, or in neutral team.", true);
            return
        end; if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid").Sit then LAction("unsit", true); end
        local Car = nil; local CarButton = workspace.Prison_ITEMS.buttons["Car Spawner"]["Car Spawner"]; local ButtonPivot = CarButton:GetPivot()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local LastPos = LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
            if not (BringFrom == LocalPlayer) then
                repeat task.wait()
                    for i,v in pairs(workspace.CarContainer:GetChildren()) do
                        if v:IsA("Model") and v:FindFirstChild("Body") and v.Body:FindFirstChild("VehicleSeat") and v.Name ~= "DONOTUSECAR" and not v.Body.VehicleSeat.Occupant then
                            for ii,vv in pairs(v.Body:GetChildren()) do
                                if vv:IsA("Seat") and not vv.Occupant then
                                    Car = v
                                    break
                                end
                            end
                            if Car then
                                break
                            end
                        end
                    end
                    if not Car then
                        coroutine.wrap(function()
                            LocTP(ButtonPivot)
                            workspace.Remote.ItemHandler:InvokeServer(CarButton)
                        end)()
                    end
                until Car
                if donotusecar then Car.Name = "DONOTUSECAR"; end
                if Car and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and BringFrom.Character and BringFrom.Character:FindFirstChild("Torso") and BringFrom.Character:FindFirstChildOfClass("Humanoid") then
                    repeat task.wait() until Car:FindFirstChild("RWD") and Car:FindFirstChild("Body") and Car:FindFirstChild("Body"):FindFirstChild("VehicleSeat"); States.IsBringing = true
                    local seattimeout = tick() + 8
                    local LHuman, LRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid"), LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    repeat task.wait()
                        LHuman = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid"); LRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if LHuman and LRoot then
                            LRoot.CFrame = CFrame.new(Car.Body.VehicleSeat.Position); Car.Body.VehicleSeat:Sit(LHuman)
                        end
                    until LHuman.Sit or tick() - seattimeout >=0; seattimeout = nil
                    if not LHuman or not LHuman.Sit then
                        CreateMessage("Error Bringing Car", true); LAction("unsit", true)
                        States.IsBringing = false; LocTP(LastPos); Car.Name = "DONOTUSECAR"
                        return
                    end; if BringFrom.TeamColor == BrickColor.new("Medium stone grey") then
                        CreateMessage("Error Bringing Car", true); LAction("unsit", true)
                        States.IsBringing = false; LocTP(LastPos)
                        return
                    end
                    local TargetSeat = nil
                    for i,v in pairs(Car.Body:GetChildren()) do
                        if v:IsA("Seat") and not v.Occupant then
                            TargetSeat = v
                            break
                        end
                    end; if not TargetSeat then
                        CreateMessage("Error Bringing Car", true); LocTP(LastPos)
                        return
                    end
                    local VChar = BringFrom.Character
                    local VHuman = VChar and VChar:FindFirstChildOfClass("Humanoid")
                    local VRoot = VChar and VChar:FindFirstChild("HumanoidRootPart")
                    local Timeout = tick() + 17
                    local CarSpin, SpinRad = false, 0
                    task.spawn(function()
                        Car.PrimaryPart = TargetSeat; Car:SetPrimaryPartCFrame(VRoot.CFrame * CFrame.new(0, -0.3, 0))
                        task.wait(4); CarSpin = true
                    end)
                    repeat 
                        task.wait()
                        local step1 = CPing() / 2 / 2 / 2
                        if TargetSeat.Occupant and not VHuman.Sit then
                            for i,v in pairs(Car.Body:GetChildren()) do
                                if v:IsA("Seat") and not v.Occupant then
                                    TargetSeat = v
                                    break
                                end
                            end
                        end
                        Car.PrimaryPart = TargetSeat
                        local Movement = Vector3.new(VRoot.Velocity.X, 0, VRoot.Velocity.Z)
                        local Predict = (VRoot.CFrame - (Vector3.new(0, 0, -0.1) * step1)) + (Movement * (step1 * 28))
                        if Predict.Position.Y > 1 then
                            if CarSpin then
                                SpinRad += 30
                                Car:SetPrimaryPartCFrame(Predict * CFrame.Angles(0, math.rad(SpinRad), 0))
                            else
                                Car:SetPrimaryPartCFrame(Predict)
                            end
                        else
                            Car:SetPrimaryPartCFrame(LastPos)
                        end
                        if BringFrom.TeamColor == BrickColor.new("Medium stone grey") then
                            break
                        end
                    until not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or not BringFrom.Character or not LHuman.Sit or VChar ~= BringFrom.Character or VHuman.Sit or VHuman.Health == 0 or tick() - Timeout >=0
                    Timeout = nil
                    if VHuman and not VHuman.Sit then
                        CreateMessage("Error Bringing Car", true); LAction("unsit", true); LocTP(LastPos); States.IsBringing = false
                        return
                    end
                    if isCFrame then
                        Car.PrimaryPart = Car:FindFirstChild("RWD"); Car:SetPrimaryPartCFrame(Destination)
                    else
                        Car.PrimaryPart = Car:FindFirstChild("RWD")
                        local Destiny = Destination ~= LocalPlayer and Destination.Character:FindFirstChild("HumanoidRootPart").CFrame or LastPos
                        Car:SetPrimaryPartCFrame(Destiny)
                        if Destination ~= LocalPlayer and (donotusecar or not Settings.User.AutoDumpCar) then
                            wait(.2); LAction("unsit", true); LocTP(LastPos)
                        end
                    end; SavedArgs.BringSuccess = true
                    if Settings.User.AutoDumpCar and not donotusecar and not dontbreakyet then
                        local Tinedout = tick() + 15
                        repeat task.wait() until VHuman.Health == 0 or not VHuman.Sit or tick() - Tinedout >=0 or not Players:FindFirstChild(BringFrom and BringFrom.Name or "nil"); Tinedout = nil
                        if not LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                            LastPos = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
                            repeat task.wait()
                                Car.Body.VehicleSeat:Sit(LocalPlayer.Character:FindFirstChildOfClass("Humanoid"))
                            until LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit
                        end
                        Car.PrimaryPart = Car:FindFirstChild("RWD"); Car:SetPrimaryPartCFrame(CFrame.new(0, 9, 0)); wait(.2)
                        LAction("unsit", true); LocTP(LastPos)
                    end; States.IsBringing = false
                end
            else
                if isCFrame then
                    LocTP(Destination)
                else
                    LocTP(Destination.Character:FindFirstChild("HumanoidRootPart").CFrame)
                end
            end
        end
    end
    
    local OpenDoors = function(includeGate)
        local oldteam = nil
        if #Teams.Guards:GetPlayers() >= 8 and not (LocalPlayer.TeamColor == BrickColor.new("Bright blue")) then
            CreateMessage("Guards Team Is Full. Could Not Open Doors.",true)
            return
        elseif not (LocalPlayer.TeamColor == BrickColor.new("Bright blue")) then
            oldteam = LocalPlayer.TeamColor; SaveCamPos(); TeamTo("guard"); waitfor(LocalPlayer.Character, "HumanoidRootPart", 3)
        end; if includeGate then
            local laspos = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
            local gate = game:GetService("Workspace")["Prison_ITEMS"].buttons["Prison Gate"]["Prison Gate"]
            for i = 1, 4 do
                LocTP(gate:GetPivot())
                workspace.Remote.ItemHandler:InvokeServer(gate)
            end; LocTP(laspos)
        end; local hascollision = {}
        for i,v in pairs(workspace.Doors:GetChildren()) do
            if v:IsA("Model") then
                local pivot = v:GetPivot(); v:PivotTo(LocalPlayer.Character:GetPivot())
                for _,vv in pairs(v:GetDescendants()) do
                    if vv:IsA("BasePart") and vv.CanCollide then
                        hascollision[vv] = true; vv.CanCollide = false
                    end
                end; task.delay(0, function()
                    v:PivotTo(pivot)
                    for _,vv in pairs(v:GetDescendants()) do
                        if vv:IsA("BasePart") and hascollision[vv] then
                            vv.CanCollide = true
                        end
                    end
                end)
            end
        end; RTPing(0.03)
        if oldteam then
            wait(2); SaveCamPos()
            if oldteam == BrickColor.new("Really red") then
                TeamTo("criminal")
            elseif oldteam == BrickColor.new("Bright orange") then
                TeamTo("inmate")
            end
        end
    end
    
    local FlingPL = function(args)
        local tempos = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
        for _,v in next, LocalPlayer.Character:GetChildren() do
            if v:IsA("BasePart") then
                v.CanCollide = false
                v.Massless = true
            end
        end
        local tempo = args.Character:FindFirstChild("HumanoidRootPart").CFrame; LocTP(tempo)
        local val = Toggles.Noclip; Toggles.Noclip = true
        local tempcon = Stepped:Connect(function(step)
            step = step - game.Workspace.DistributedGameTime
            local aRoot, lRoot = args.Character and args.Character:FindFirstChild("HumanoidRootPart"), LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if aRoot and lRoot then
                tempo = aRoot.CFrame + (aRoot.Velocity * (step * 28))
                if tempo.Position.Y > 1 then
                    lRoot.CFrame = tempo
                end
            end
        end); task.delay(0.35, function()
            if args.Character and args.Character:FindFirstChild("Head") and args.Character.Head.Position.Y < 699 then
                VKeyPress("C", "Press")
            end
        end); task.delay(0.05, function()
            LocalPlayer.Character.PrimaryPart.Velocity = Vector3.new(0, 131111, 0)
        end)
        local timeout = tick() + 10
        repeat task.wait()
            local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if root then
                root.CFrame = tempo.Position.Y > 1 and tempo or CFrame.new(0, 100, 0)
                if root.Velocity.Y < 6999 then
                    root.Velocity = Vector3.new(0, 1e6, 0)
                end
            end
            local human = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if human and human.Sit then
                human.Sit = false
            end
            if not Players:FindFirstChild(args.Name) then
                break
            end
        until tick() - timeout >=0 or (args.Character and args.Character:FindFirstChild("Head") and (args.Character.Head.Position.Y > 699 or args.Character.Head.Position.Y < 1))
        tempcon:Disconnect(); tempcon = nil; timeout = nil; Toggles.Noclip = val
        local tick1 = tick() + 2
        local seat = game:GetService("Workspace"):FindFirstChildWhichIsA("Seat", true)
        local LHuman = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if seat.Occupant and not LHuman.Sit then
            for i,v in next, workspace:GetDescendants() do
                if v:IsA("Seat") and not v.Occupant then
                    seat = v; break
                end
            end
        end
        repeat
            LHuman = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if LHuman and seat then
                seat:Sit(LHuman)
            end
            if LocalPlayer.Character.PrimaryPart then LocalPlayer.Character.PrimaryPart.Velocity = Vector3.new(0, 0, 0) end
            task.wait()
        until LHuman.Sit or tick() - tick1 >=0; task.wait()
        for i = 1, 9 do
            Stepped:wait()
            LHuman.Sit = false; LocalPlayer.Character.PrimaryPart.Velocity = Vector3.new(0, 0, 0); LocTP(tempos)
        end; Hbeat:wait(); LHuman.Sit = false; LocTP(tempos)
        tempos = nil; tick1 = nil; LHuman = nil
    end
    
    local CarFlingPL = function(args)
        local tempos = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
        BringPL(args, args.Character:FindFirstChild("HumanoidRootPart").CFrame, true, true)
        local char = LocalPlayer.Character
        local bv, bg = Instance.new("BodyVelocity", char.HumanoidRootPart), Instance.new("BodyGyro", char.HumanoidRootPart)
        for i = 1, 10 do
            bv.MaxForce = Vector3.new(9e9, 9e9, 9e9); bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            bg.CFrame = bg.CFrame * CFrame.new(math.random(69, 699999), math.random(69, 6966868), math.random(6996, 66886)); bv.Velocity = Vector3.new(math.random(69, 699), 1e6, math.random(69, 699))
            Stepped:wait()
        end; Stepped:wait(); Hbeat:wait()
        Tasks.Refresh(nil, tempos)
    end
    
    local MeleeKill = function(args, savepos, isHidden)
        if savepos then
            SavedPositions.MeleeKill = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
        end
        local LHead, VHead = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head"), args.Character and args.Character:FindFirstChild("Head")
        local VHuman, VRoot = args.Character and args.Character:FindFirstChildOfClass("Humanoid"), args.Character and args.Character:FindFirstChild("HumanoidRootPart")
        if LHead and VHead and VHuman and VHuman.Health ~= 0 then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = false
            if not (isHidden or Settings.User.HiddenMelee) then
                if VRoot and not Saved.MKillDebounce[args.Name] then
                    local daping = CPing(); LocTP(VRoot.CFrame); Saved.MKillDebounce[args.Name] = true
                    task.spawn(function()
                        RTPing(daping*2); Saved.MKillDebounce[args.Name] = nil
                    end); Rstep:wait(); LocTP(VRoot.CFrame); wait()
                    for i = 1, 10 do MeleEve(args); end
                    wait(0.030); LocTP(VRoot.CFrame)
                    for i = 1, 10 do MeleEve(args); end
                    wait(0.030); LocTP(VRoot.CFrame)
                    for i = 1, 10 do MeleEve(args); end
                    Rstep:wait(); LocTP(VRoot.CFrame)
                    for i = 1, 10 do MeleEve(args); end
                end; wait()
            else
                local timeout = tick() + 6
                repeat task.wait()
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                        LAction("unsit")
                    end; if args.Character and args.Character:FindFirstChildOfClass("Humanoid") and not args.Character:FindFirstChild("ForceField") then
                        if args.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 then
                            if args.Character:FindFirstChild("Humanoid").Sit then
                                LocTP(VHead.CFrame * CFrame.new(0, -8, 0))
                            else LocTP(VHead.CFrame * CFrame.new(0, -12, 0)); end
                        else break; end
                    else
                        break
                    end; for i = 1, 10 do
                        MeleEve(args)
                    end
                until tick() - timeout >=0
            end
        end; if savepos then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = false; LocTP(SavedPositions.MeleeKill)
        end
    end
    
    local MakeCrim = function(args, savepos, tpback, ArrestLater)
        if args.TeamColor == BrickColor.new("Really red") then
        else
            if args == LocalPlayer then 
                TeamTo("criminal") 
                return 
            end; SavedPositions.MakeCrimPos = savepos and LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame or nil; SavedPositions.MakeCrimPlr = args.Character:FindFirstChild("HumanoidRootPart").CFrame
            local timeout = tick() + 10
            repeat
                BringPL(args, CFrame.new(-920.947937, 92.3143158, 2138.05615, 0.997869313, 4.71007233e-08, 0.0652444065, -4.59519711e-08, 1, -1.91075955e-08, -0.0652444065, 1.6068773e-08, 0.997869313), true, nil, true)
                RTPing(0);RTPing(0)
            until args.TeamColor == BrickColor.new("Really red") or tick() - timeout >= 0; timeout = nil
            if ArrestLater then
                ArrestPL(args)
            end;if tpback then
                BringPL(args, SavedPositions.MakeCrimPlr, true); wait(.2)
            end;if savepos then
                if LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                    LAction("unsit", true)
                end;LocTP(SavedPositions.MakeCrimPos)
            end
        end
    end
    
    local SpamArrestPL = function(args)
        if States.AnnoyingPlayer then
            local plr = args
            local readytoarrest = nil
            task.delay(0, function()
                while States.AnnoyingPlayer and task.wait(.03) do
                    if readytoarrest then
                        task.spawn(ArrestEve, plr)
                    end
                    if not Players:FindFirstChild(plr.Name) then
                        Notif("Spam-arrest broken.", "Player has left the game!"); break
                    end
                end
                States.AnnoyingPlayer = nil
                plr = nil
                readytoarrest = nil
            end)
            task.spawn(function()
                while States.AnnoyingPlayer do task.wait()
                    if not Players:FindFirstChild(plr.Name) then
                        break
                    end
                    pcall(function()
                        if plr and plr.Character and plr.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 then
                            if plr.TeamColor == BrickColor.new("Really red") or (plr.TeamColor == BrickColor.new("Bright orange") and GetIllegalReg(plr)) then
                                LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = false
                                LocTP(plr.Character.HumanoidRootPart.CFrame)
                                readytoarrest = true
                            elseif plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") and plr.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 then
                                readytoarrest = false
                                repeat task.wait() until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and not (plr.TeamColor == BrickColor.new("Medium stone grey"))
                                coroutine.wrap(function()
                                    MakeCrim(plr, false, false, false)
                                end)()
                                local timeout = tick() + 5
                                local characterwasadded = nil
                                task.spawn(function()
                                    plr.CharacterAdded:wait()
                                    characterwasadded = true
                                end)
                                repeat task.wait()
                                    if not Players:FindFirstChild(plr.Name) then
                                        break
                                    end
                                    if plr.TeamColor == BrickColor.new("Medium stone grey") then
                                        LAction("unsit", true)
                                        repeat task.wait() until not (plr.TeamColor == BrickColor.new("Medium stone grey"))
                                        break
                                    end
                                    if characterwasadded then
                                        LAction("unsit", true)
                                        break
                                    end
                                    if plr.TeamColor == BrickColor.new("Really red") or (GetIllegalReg(plr) and plr.TeamColor == BrickColor.new("Bright orange")) then
                                        break
                                    end
                                until tick() - timeout >=0
                                timeout = nil
                                characterwasadded = nil
                            end
                        else
                            readytoarrest = false
                        end
                    end)
                end
            end)
        end
    end
    
    Threads = {
        ExtraSensory = function()
            if not Toggles.ESP then
                return
            end
            task.spawn(function()
                while Toggles.ESP do task.wait()
                    for i,v in pairs(Players:GetPlayers()) do
                        local LPos = LocalPlayer.Character and LocalPlayer.Character.PrimaryPart
                        local VHead, VRoot, VHuman = v.Character and v.Character:FindFirstChild("Head"), v.Character and v.Character:FindFirstChild("HumanoidRootPart"), v.Character and v.Character:FindFirstChildOfClass("Humanoid")
                        if v ~= LocalPlayer and VHead and VRoot and VHuman and LPos then
                            if VHead:FindFirstChild("ESP") then
                                local NameESP = VHead:FindFirstChild("ESP"):FindFirstChild("NameESP")
                                VRoot:FindFirstChild("RootESP").Color3 = v.TeamColor.Color
                                if v.Name == v.DisplayName then
                                    NameESP.Text = v.Name .. " | Health: " .. math.floor(VHuman.Health) .. " | Magnitude: " .. math.floor((LPos.Position-VRoot.Position).Magnitude)
                                else
                                    NameESP.Text = v.Name .. " [" .. v.DisplayName .. "] | Health: " .. math.floor(VHuman.Health) .. " | Magnitude: " .. math.floor((LPos.Position-VRoot.Position).Magnitude)
                                end; NameESP.TextColor3 = v.TeamColor.Color
                            else
                                local NameESP, Label, RootESP = Instance.new("BillboardGui"), Instance.new("TextLabel"), Instance.new("BoxHandleAdornment")
                                NameESP.Adornee = v.Character.Head;NameESP.Name = "ESP";NameESP.Parent = v.Character.Head
                                NameESP.Size = UDim2.new(0, 100, 0, 135);NameESP.StudsOffset = Vector3.new(0, 0, 0);NameESP.AlwaysOnTop = true
                                Label.Parent = NameESP;Label.Name = "NameESP";Label.BackgroundTransparency = 1
                                Label.Position = UDim2.new(0, 0, 0, -50);Label.Size = UDim2.new(0, 100, 0, 100);Label.Font = Enum.Font.SourceSansSemibold
                                Label.TextSize = 18;Label.TextColor3 = v.TeamColor.Color;Label.TextStrokeTransparency = 0
                                Label.TextYAlignment = Enum.TextYAlignment.Bottom;Label.Text = v.Name;Label.ZIndex = 10
                                RootESP.Name = "RootESP";RootESP.Parent = VRoot;RootESP.Adornee = VRoot;RootESP.AlwaysOnTop = true
                                RootESP.ZIndex = 10;RootESP.Size = VRoot.Size;RootESP.Transparency = 0.4;RootESP.Color3 = v.TeamColor.Color
                            end
                        end
                    end; Hbeat:wait()
                end
                for i,v in pairs(Players:GetPlayers()) do
                    if v ~= LocalPlayer and v.Character then
                        local lroot, lhead = v.Character:FindFirstChild("HumanoidRootPart"), v.Character:FindFirstChild("Head")
                        if lroot and lroot:FindFirstChild("RootESP") then
                            lroot:FindFirstChild("RootESP"):Destroy()
                        end; if lhead and lhead:FindFirstChild("ESP") then
                            lhead:FindFirstChild("ESP"):Destroy()
                        end
                    end
                end
            end)
        end;
        ArrestBack = function()
            if not Toggles.ArrestBack then
                return
            end
            task.spawn(function()
                while Toggles.ArrestBack do task.wait()
                    pcall(function()
                        for i,v in pairs(Teams.Guards:GetPlayers()) do
                            if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Handcuffs") then
                                local vhead, lhead = v.Character:FindFirstChild("Head"), LocalPlayer.Character:FindFirstChild("Head")
                                if vhead and lhead and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 then
                                    if (vhead.Position-lhead.Position).Magnitude <= 18 then
                                        MakeCrim(v, true, false, true)
                                    end
                                end
                            end
                        end
                    end)
                end
            end)
        end;
        AntiPay2Win = function()
            if not Toggles.AntiShield then
                return
            end
            task.spawn(function()
                while Toggles.AntiShield do task.wait()
                    for _, pay2winusers in pairs(Players:GetPlayers()) do
                        if pay2winusers ~= LocalPlayer and pay2winusers.Character and pay2winusers.Character:FindFirstChild("Torso") then
                            local folder = pay2winusers.Character.Torso:FindFirstChild("ShieldFolder"); local shield = folder and folder:FindFirstChild("shield")
                            if shield then
                                shield.Size = Vector3.new(0, 0, 0)
                            end
                        end
                    end
                end
                for _, pay2winusers in pairs(Players:GetPlayers()) do
                    if pay2winusers ~= LocalPlayer and pay2winusers.Character and pay2winusers.Character:FindFirstChild("Torso") then
                        local folder = pay2winusers.Character.Torso:FindFirstChild("ShieldFolder"); local shield = folder and folder:FindFirstChild("shield")
                        if shield then
                            shield.Size = Vector3.new(2.6, 4.2, 0.4)
                        end
                    end
                end
            end)
        end;
        AntiFling = function()
            if not States.AntiFling then
                return
            end
            task.spawn(function()
                local temp = PhysicalProperties.new(0.01, 0, 0)
                local tempfunc = function(arg)
                    for _,vv in pairs(arg.Character:GetChildren()) do
                        if vv:IsA("BasePart") or vv:IsA("Part") then
                            vv.CanCollide = false
                            if vv.CustomPhysicalProperties ~= temp then
                                vv.CustomPhysicalProperties = temp
                            end
                        end; if vv:IsA("MeshPart") then
                            vv.CanCollide = false
                        end; if vv:IsA("Accessory") then
                            local handle = vv:FindFirstChildWhichIsA("Part") or vv:FindFirstChildWhichIsA("MeshPart") or vv:FindFirstChildWhichIsA("WedgePart")
                            if handle and handle.CanCollide then
                                handle.CanCollide = false
                            end
                        end
                    end
                end
                while States.AntiFling do Stepped:wait()
                    for _,v in pairs(Players:GetPlayers()) do
                        if v ~= LocalPlayer and v.Character then
                            tempfunc(v)
                        end
                    end
                end
                tempfunc = nil; temp = nil
            end)
        end;
        AntiVelocity = function()
            if not States.AntiVelocity then
                return
            end
            task.spawn(function()
                local parts, cus = {}, PhysicalProperties.new(0, 0, 0)
                for i,v in pairs(workspace:GetDescendants()) do
                    if v:IsA("BasePart") or v:IsA("Part") and not v:IsDescendantOf(LocalPlayer.Character) then
                        parts[#parts+1] = v
                    end
                    if v:IsA("MeshPart") or v:IsA("WedgePart") and not v:IsDescendantOf(LocalPlayer.Character) then
                        parts[#parts+1] = v
                    end
                end
                coroutine.wrap(function()
                    while States.AntiVelocity do
                        wait(.1)
                        parts = {}
                        for i,v in pairs(workspace:GetDescendants()) do
                            if v:IsA("BasePart") or v:IsA("Part") and not v:IsDescendantOf(LocalPlayer.Character) then
                                parts[#parts+1] = v
                            end
                            if v:IsA("MeshPart") or v:IsA("WedgePart") and not v:IsDescendantOf(LocalPlayer.Character) then
                                parts[#parts+1] = v
                            end
                        end
                        local des = workspace:FindFirstChild(LocalPlayer.Name)
                        if des.PrimaryPart and des.PrimaryPart.AssemblyLinearVelocity.Magnitude > 50 then
                            Stepped:wait()
                            des.PrimaryPart.Velocity = Vector3.new(0, 0, 0)
                            des.PrimaryPart.RotVelocity = Vector3.new(0, 0, 0)
                            LocTP(SavedPositions.AntiFling)
                            deprint("Debug_Player was flinged")
                        elseif des.PrimaryPart and des.PrimaryPart.AssemblyLinearVelocity.Magnitude < 50 then
                            SavedPositions.AntiFling = des.PrimaryPart.CFrame
                        end
                    end
                    parts = nil; cus = nil
                end)()
                while States.AntiVelocity do
                    Stepped:wait()
                    if next(parts) then
                        for _,v in next, parts do
                            if v:IsA("BasePart") or v:IsA("Part") then
                                v.Velocity = Vector3.new(0, 0, 0)
                                v.RotVelocity = Vector3.new(0, 0, 0)
                                v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                                v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                                v.CustomPhysicalProperties = cus
                            end
                            if v:IsA("MeshPart") or v:IsA("WedgePart") then
                                v.CanCollide = false
                                v.Velocity = Vector3.new(0, 0, 0)
                                v.RotVelocity = Vector3.new(0, 0, 0)
                                v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                                v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                            end
                        end
                    end
                end
            end)
        end;
        ForceField = function()
            if not States.ForceField then
                return
            end
            task.spawn(function()
                while States.ForceField do task.wait()
                    local plc = LocalPlayer.Character
                    if plc then
                        plc = LocalPlayer.Character
                        local plr = plc and plc:FindFirstChild("HumanoidRootPart")
                        if plr then
                            task.delay(CPing(nil,true),function()SavedPositions.AutoRe = plr.CFrame;SaveCamPos() end)
                            if #Teams.Guards:GetPlayers() > 7 then
                                TeamEve("Bright orange")
                            end; TeamEve("Bright blue")
                            task.spawn(function()
                                local isholding = plc:FindFirstChildWhichIsA("Tool") and plc:FindFirstChildWhichIsA("Tool").Name
                                LocalPlayer.CharacterAdded:wait()
                                if States.ForceField then
                                    if not Toggles.AutoRespawn then
                                        waitfor(LocalPlayer.Character, "HumanoidRootPart", 1).CFrame = SavedPositions.AutoRe
                                    end; LoadCamPos()
                                    if isholding and wait() then
                                        local hastool = LocalPlayer.Backpack:FindFirstChild(isholding)
                                        if hastool then
                                            LAction("equip", hastool)
                                        else
                                            ItemHand(false, isholding); ItemHand(false, isholding); ItemHand(false, isholding)
                                            local toequip = LocalPlayer.Backpack:FindFirstChild(isholding)
                                            if toequip then
                                                LAction("equip", toequip)
                                            end
                                        end
                                    end
                                end
                            end)
                            local o = CPing() / 2; task.wait(5 - o)
                        end
                    end
                end
            end)
        end;
        ArrestAura = function()
            if not Toggles.ArrestAura then
                return
            end
            task.spawn(function()
                while Toggles.ArrestAura do task.wait()
                    for i,v in pairs(Players:GetPlayers()) do
                        if v.Character and v ~= LocalPlayer and v.TeamColor.Name ~= "Bright blue" then
                            local VHead, LHead = v.Character:FindFirstChild("Head"), LocalPlayer.Character:FindFirstChild("Head")
                            if VHead and LHead and CheckWhitelist(v) then
                                if (VHead.Position-LHead.Position).Magnitude <= 25 then
                                    if v.TeamColor == BrickColor.new("Really red") or GetIllegalReg(v) then
                                        task.spawn(ArrestEve, v); wait()
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end;
        ClickTeleport = function()
            if not States.ClickTeleport then
                return
            end
            task.spawn(function()
                while States.ClickTeleport do task.wait()
                    if States.ClickTeleport then
                        SpawnClientStuff("clicktp")
                    else break end; LocalPlayer.CharacterAdded:wait(); wait(.1); if LocalPlayer.TeamColor == BrickColor.new("Bright blue") then task.wait(1) end
                end
            end)
        end;
        Fullbright = function()
            if not States.Fullbright then
                return
            end
            task.spawn(function() pcall(function() LocalPlayer.PlayerGui.Home.fadeFrame.Visible = false end)
                local Lighting = game:GetService("Lighting"); local temp = {
                    Brightness = Lighting.Brightness,FogEnd = Lighting.FogEnd,GlobalShadows = Lighting.GlobalShadows,OutdoorAmbient = Lighting.OutdoorAmbient
                };while States.Fullbright do task.wait()
                    Lighting.Brightness = 5;Lighting.FogEnd = 100000;Lighting.GlobalShadows = false;Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
                end;Lighting.Brightness = temp.Brightness;Lighting.FogEnd = temp.FogEnd;Lighting.GlobalShadows = temp.GlobalShadows;Lighting.OutdoorAmbient = temp.OutdoorAmbient
            end)
        end;
        Invisibility = function()
            if not States.Invisible then
                return
            end
            task.spawn(function()
                AllGuns()
                local Character, FakeCharacter = LocalPlayer.Character, nil
                while States.Invisible do task.wait()
                    local root = waitfor(LocalPlayer.Character, "HumanoidRootPart", 5)
                    if root and States.Invisible then
                        local lastpos = root.CFrame
                        Character.Archivable = true
                        FakeCharacter = Character:Clone()
                        FakeCharacter.Parent = game.Lighting
                        FakeCharacter.Name = "FakeCharacter"; FakeCharacter:FindFirstChildOfClass("Humanoid").DisplayName = "[INVISIBLE]"
                        SaveCamPos()
                        root.CFrame = CFrame.new(9e9, 9e9, 9e9)
                        SavedPositions.AutoRe = lastpos; wait(.4)
                        game:GetService("Workspace").CurrentCamera.CameraType = Enum.CameraType.Scriptable
                        Hbeat:wait(); Rstep:wait()
                        game:GetService("Workspace").CurrentCamera.CameraType = Enum.CameraType.Custom
                        FakeCharacter = FakeCharacter
                        Character.Parent = game.Lighting
                        FakeCharacter.Parent = game:GetService("Workspace")
                        FakeCharacter:FindFirstChild("HumanoidRootPart").CFrame = lastpos
                        LocalPlayer.Character = FakeCharacter; Rstep:wait()
                        workspace.CurrentCamera.CameraSubject = FakeCharacter:FindFirstChildOfClass("Humanoid")
                        workspace.CurrentCamera.CameraType = "Custom"; LoadCamPos()
                        LocalPlayer.Character.Animate.Disabled = true
                        LocalPlayer.Character.Animate.Disabled = false
                        LocalPlayer.CharacterAdded:wait(); waitfor(LocalPlayer.Character, "HumanoidRootPart")
                        Character:Destroy(); Character = nil
                        FakeCharacter:Destroy(); FakeCharacter = nil
                        root = nil; lastpos = nil
                        AllGuns(); AllGuns(); AllGuns()
                        if States.Invisible then
                            Character = LocalPlayer.Character
                        else
                            break
                        end
                    end
                end; Character = nil; FakeCharacter = nil
            end)
        end;
        ShootKillPlayers = function()
            if Saved.Thread.ShootKillPlayers then
                return
            end; Saved.Thread.ShootKillPlayers = true
            task.spawn(function()
                while task.wait() do
                    if next(Loops.ShootKill) then
                        pcall(function()
                            for i,v in next, Loops.ShootKill do
                                if v and v.Character and v.Character:FindFirstChildOfClass("Humanoid") and v.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 then
                                    local tool = LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
                                    if tool and tool:FindFirstChildOfClass("ModuleScript") and tool.Name ~= "Taser" then
                                        ShootKill(v, nil, tool.Name)
                                    else
                                        ShootKill(v)
                                    end
                                end
                            end
                        end)
                    else
                        break
                    end
                end; Saved.Thread.ShootKillPlayers = nil
            end)
        end;
        RandomKillPlayers = function()
            if Saved.Thread.RandomKillPlayers then
                return
            end; Saved.Thread.RandomKillPlayers = true
            task.spawn(function()
                while wait(1) do
                    if next(Loops.RandomKill) then
                        pcall(function()
                            for i,v in next, Loops.RandomKill do
                                if v and v.Character and v ~= LocalPlayer then
                                    local meth = math.random(1, 15)
                                    if meth == 6 then
                                        KillPL(v); task.wait(.35)
                                    end
                                end
                            end
                        end)
                    else
                        break
                    end
                end; Saved.Thread.RandomKillPlayers = nil
            end)
        end;
        LoopTasePlayers = function()
            if Saved.Thread.LoopTasePlayers then
                return
            end; Saved.Thread.LoopTasePlayers = true
            task.spawn(function()
                while wait(.7) do
                    pcall(function()
                        if Loops.TaseTeams.All then
                            if LocalPlayer.TeamColor ~= BrickColor.new("Bright blue") and #Teams.Guards:GetPlayers() < 8 then
                                TeamTo("guard")
                            end; if LocalPlayer.TeamColor.Name == "Bright blue" then 
                                TasePL(Players, "teams") 
                            end
                        else
                            local temp = {}
                            if Loops.TaseTeams.Inmates then
                                for i,v in pairs(Teams.Inmates:GetPlayers()) do
                                    if v.Character and CheckWhitelist(v) and v ~= LocalPlayer and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                                        temp[#temp+1] = v
                                    end
                                end
                            end; if Loops.TaseTeams.Criminals then
                                for i,v in pairs(Teams.Criminals:GetPlayers()) do
                                    if v.Character and CheckWhitelist(v) and v ~= LocalPlayer and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                                        temp[#temp+1] = v
                                    end
                                end
                            end; if next(Loops.Tase) then
                                for i,v in next, Loops.Tase do
                                    if v.Character and v ~= LocalPlayer and not (v.Character:FindFirstChild("Humanoid").Health == 0 or v.TeamColor == BrickColor.new("Bright blue")) then
                                        temp[#temp+1] = v
                                    end
                                end
                            end; if next(Powers.Taseauras) then
                                for i,v in next, Powers.Taseauras do
                                    if v.Character and v.Character:FindFirstChild("Head") then
                                        for _,vv in pairs(Players:GetPlayers()) do
                                            if vv.Character and vv.Character:FindFirstChild("Head") and CheckWhitelist(vv) and not (vv == LocalPlayer or vv == v) then
                                                local THead, VHead = v.Character.Head, vv.Character.Head
                                                if THead and VHead and CheckWhitelist(vv) and not (vv.Character:FindFirstChildOfClass("Humanoid").Health == 0 or vv.TeamColor == BrickColor.new("Bright blue")) then
                                                    if (THead.Position-VHead.Position).Magnitude <= 17 then
                                                        temp[#temp+1] = vv
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end; if next(temp) then
                                if LocalPlayer.TeamColor ~= BrickColor.new("Bright blue") and #Teams.Guards:GetPlayers() < 8 then
                                    TeamTo("guard")
                                end; if LocalPlayer.TeamColor.Name == "Bright blue" then 
                                    TasePL(temp, "tables")
                                end
                            end; temp = nil
                        end
                    end)
                end
            end)
        end;
        DeathNukes = function()
            if Saved.Thread.DeathNukes then
                return
            end; Saved.Thread.DeathNukes = true
            task.spawn(function()
                while task.wait() do
                    if next(Powers.DeathNuke) then
                        for i,v in next, Powers.DeathNuke do
                            if v.Character and v.Character:FindFirstChildOfClass("Humanoid") then
                                if v.Character:FindFirstChildOfClass("Humanoid").Health == 0 and next(Powers.DeathNuke) then
                                    pcall(function() MultiKill(Players, v) end)
                                    RTPing(0.1); wait(5)
                                end
                            end
                        end
                    else break end
                end; Saved.Thread.DeathNukes = nil
            end)
        end;
        AutoGuns = function()
            if not Toggles.AutoGuns then
                return
            end; Toggles.AutoItems = false
            task.spawn(function()
                while Toggles.AutoGuns do task.wait()
                    pcall(AllGuns)
                    if Settings.User.OldItemMethod then
                        LocalPlayer.CharacterAdded:wait(); wait(1)
                    end
                end
            end)
        end;
        AutoItems = function()
            if not Toggles.AutoItems then
                return
            end; Toggles.AutoGuns = false
            task.spawn(function()
                while Toggles.AutoItems do task.wait()
                    task.spawn(AllItems)
                    LocalPlayer.CharacterAdded:wait()
                    if waitfor(LocalPlayer.Character, "HumanoidRootPart", 1) and Settings.User.OldItemMethod and LocalPlayer.TeamColor == BrickColor.new("Bright blue") then
                        RTPing(1)
                    end
                end
            end)
        end;
        HideTeamGui = function()
            task.spawn(function()
                task.delay(0.05, function()
                    game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
                end); for i = 1, 10 do
                    pcall(function()
                        LocalPlayer.PlayerGui:FindFirstChild("Home"):FindFirstChild("intro").Visible = false; LocalPlayer.PlayerGui:FindFirstChild("Home"):FindFirstChild("hud").Visible = true
                        game:GetService("Workspace").CurrentCamera.FieldOfView = 70; game:GetService("Workspace").CurrentCamera.CameraType = Enum.CameraType.Custom
                        game:GetService("Workspace").CurrentCamera.CameraSubject = LocalPlayer.Character:FindFirstChild("Humanoid")
                    end); task.wait()
                end
            end)
        end;
    };

    Connections.InputBegan = game:GetService("UserInputService").InputBegan:Connect(function(input)
        local textBoxHasFocus = game:GetService("UserInputService"):GetFocusedTextBox()
        if input.KeyCode == Enum.KeyCode.F and not textBoxHasFocus then
            States.IsHoldingF = true
            if States.PunchCD or Toggles.Onepunch or Toggles.PunchAura or States.LoudPunch then
                pcall(VirtualPunch)
            end
            if not States.PunchCD then
                States.PunchCD = true; wait(0.9); States.PunchCD = nil
            end
            return
        end
        if input.KeyCode == Enum.KeyCode.Semicolon and not textBoxHasFocus then
            Hbeat:wait(); CommandBox:CaptureFocus()
        end
        if input.KeyCode == Enum.KeyCode.Slash and not textBoxHasFocus then
            Hbeat:wait()
            game.Players.LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar:CaptureFocus()
        end
        if input.KeyCode == Enum.KeyCode.LeftShift then
            States.Running = true; LAction("speed", Saved.RunSpeed)
        end
    end)
    Connections.InputEnded = game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.LeftShift then
            States.Running = false; LAction("speed", Saved.NormalSpeed)
        end
        if input.KeyCode == Enum.KeyCode.F then
            States.IsHoldingF = false
        end
    end)

    Tasks = {
        ReloadGun = function(arg, arg2)
            if not arg then
                return
            end
            task.spawn(function()
                local tool = arg.Name
                while wait() do
                    local findchild = LocalPlayer.Character:FindFirstChild(tool) or LocalPlayer.Backpack:FindFirstChild(tool)
                    if findchild then
                        if LocalPlayer.Character:FindFirstChild(tool) then
                            Rstorage.ReloadEvent:FireServer(findchild)
                        elseif arg2 then break end
                    else break end
                end
            end)
        end;
    };

    Commands = {

        Variables = {
            NoclipBool = false,
            KillAuraBool = false,
            LoopSpeedBool = false,
            LoopGunsBool = false,
            SuperPunchBool = false,
            InfJumpBool = false,
            LkAll = false,
            AutoReBool = false,
            LKGuards = false,
            LKInmates = false,
            LKCriminals = false,
            LKPlayer = false,
            ESP = false,
            LoopM9 = false,
            LoopAK = false,
            LoopRem = false
        },

        Colors = {
            blue = BrickColor.Blue(),
            gray = BrickColor.Gray(),
            red = BrickColor.Red(),
            green = BrickColor.Green(),
            white = BrickColor.White(),
            black = BrickColor.Black()
        },

        FlyCommand = {
            Index = {"FlyGui", "fly", "fly gui", "flygui"},
            ExecuteCommand = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
                CreateMessage("Loaded Fly GUI", false)
            end,
        },

        Noclip = {
            Index = {"Noclip", "noclip", "wallhack", "enable wallhack", "enable noclip"},
            ExecuteCommand = function()
                Commands.Variables.NoclipBool = true
                game:GetService("RunService").RenderStepped:Connect(function()
                    if Commands.Variables.NoclipBool == true then
                        for _, ab in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                            if ab:IsA("BasePart") then
                                ab.CanCollide = false
                            end
                        end
                    end
                end)
                CreateMessage("Enabled Noclip", false)
            end,
        },

        Clip = {
            Index = {"Clip", "clip", "disable wallhack", "disable noclip"},
            ExecuteCommand = function()
                Commands.Variables.NoclipBool = false
                for _, ab in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if ab:IsA("BasePart") and ab.Name == "Torso" then
                        ab.CanCollide = true
                    end
                end
                CreateMessage("Disabled Noclip", false)
            end,
        },

        KillAura = {
            Index = {"Kill Aura", "killaura", "aura", "Aura", "KillAura"},
            ExecuteCommand = function()
                local ME = game:GetService("ReplicatedStorage")['meleeEvent']

                Commands.Variables.KillAuraBool = true

                CreateMessage("Enabled Kill Aura", false)
                while task.wait(0.05) do
                    if Commands.Variables.KillAuraBool == true then
                        for _, plr in pairs(game.Players:GetPlayers()) do
                            if plr.Name ~= game.Players.LocalPlayer.Name then
                                ME:FireServer(plr)
                            end
                        end
                    end
                end
            end,
        },

        DisableKillAura = {
            Index = {"Disable KillAura", "disable aura", "disable killaura", "unaura", "unkillaura"},
            ExecuteCommand = function()
                Commands.Variables.KillAuraBool = false
                CreateMessage("Disabled Kill Aura", false)
            end,
        },

        AK = {
            Index = {"AK-47", "AK", "Get AK-47", "ak", "get ak47"},
            ExecuteCommand = function()
                Gun("AK-47")
                CreateMessage("Successfully Gave "..LocalPlayer.Name.." AK-47", false)
            end,
        },

        M9 = {
            Index = {"M9", "Pistol", "get pistol", "Get Pistol", "get M9"},
            ExecuteCommand = function()
                Gun("M9")
                CreateMessage("Successfully Gave "..LocalPlayer.Name.." M9", false)
            end,
        },

        R870 = {
            Index = {"Remington 870", "Shotgun", "R870", "get shotgun", "Get Shotgun"},
            ExecuteCommand = function()
                Gun("Remington 870")
                CreateMessage("Successfully Gave "..LocalPlayer.Name.." Remington 870", false)
            end,
        },

        GetGuns = {
            Index = {"Get Guns", "Guns", "All Guns", "allguns"},
            ExecuteCommand = function()
                AllGuns()
                CreateMessage("Successfully Gave "..LocalPlayer.Name.." All Guns", false)
            end,
        },

        LoopGuns = {
            Index = {"Loop Guns", "Loop All Weapons", "loopweapons", "lp weapons", "loopguns", "loopg", "loopguns"},
            ExecuteCommand = function()
                Toggles.AutoGuns = true

                if Toggles.AutoGuns then
                    Threads.AutoGuns()
                end

                CreateMessage("Successfully Enabled All Guns", false)
            end,
        },

        UnLoopGuns = {
            Index = {"Unloop guns", "Unloop weapons", "unlpguns", "unlp guns"},
            ExecuteCommand = function()
                Toggles.AutoGuns = false
                CreateMessage("Successfully Disabled All Guns", false)
            end,
        },

        ColorGun = {
            Index = {"Colorgun", "setguncolor", "color gun", "Color Gun", "change guncolor", "Change Gun Color"},
            SpecialCommand = true,
            ExecuteCommand = function(color : string, name : string)

                local colorobj = Commands.Colors[string.lower(color)]

                if not colorobj then
                    local validColors = table.concat(table.keys(Commands.Colors), ", ")
                    CreateMessage("Invalid color! Valid options: " .. validColors, true)
                    return
                end

                for _, gun in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if gun:IsA("Model") and string.lower(gun.Name) == string.lower(name) then
                        CreateMessage("Successfully Colored "..gun.Name.." "..tostring(colorobj), false)

                        for _, gunpart in pairs(gun:GetDescendants()) do
                            if gunpart:IsA("BasePart") then
                                print("Changing color of part:", gunpart.Name)
                                gunpart.BrickColor = colorobj
                                gunpart.Material = Enum.Material.Neon
                                gunpart.CastShadow = false
                            end
                        end
                    end
                end
            end,
        },

        Inmate = {
            Index = {"Become Inmate", "Prisoner", "prisoner", "inmate", "become inmate"},
            ExecuteCommand = function()
                TeamTo("inmate")
                CreateMessage("Successfully Set "..LocalPlayer.Name.."'s Team To: Inmate", false)
            end,
        },

        Cop = {
            Index = {"Become Cop", "Cop", "cop", "officer", "become officer"},
            ExecuteCommand = function()
                TeamTo("guard")
                CreateMessage("Successfully Set "..LocalPlayer.Name.."'s Team To: Guard", false)
            end,
        },

        Crim = {
            Index = {"Become Criminal", "Criminal", "criminal", "become criminal", "crim"},
            ExecuteCommand = function()
                TeamTo("criminal")
                CreateMessage("Successfully Set "..LocalPlayer.Name.."'s Team To: Criminal", false)
            end,
        },

        BTools = {
            Index = {"Btools", "tools", "btools", "building tools"},
            ExecuteCommand = function()
                local Backpack = game.Players.LocalPlayer.Backpack
                local Character = game.Players.LocalPlayer.Character
                if not Backpack:FindFirstChild("Bin_1") and not Character:FindFirstChild("Bin_1") then
                    local HopperBin_1 = Instance.new("HopperBin", Backpack)
                    HopperBin_1.BinType = 1
                    HopperBin_1.Name = "Bin_1"
                end
                if not Backpack:FindFirstChild("Bin_2") and not Character:FindFirstChild("Bin_2") then
                    local HopperBin_2 = Instance.new("HopperBin", Backpack)
                    HopperBin_2.BinType = 2
                    HopperBin_2.Name = "Bin_2"
                end
                if not Backpack:FindFirstChild("Bin_3") and not Character:FindFirstChild("Bin_3") then
                    local HopperBin_3 = Instance.new("HopperBin", Backpack)
                    HopperBin_3.BinType = 3
                    HopperBin_3.Name = "Bin_3"
                end
                if not Backpack:FindFirstChild("Bin_4") and not Character:FindFirstChild("Bin_4") then
                    local HopperBin_4 = Instance.new("HopperBin", Backpack)
                    HopperBin_4.BinType = 4
                    HopperBin_4.Name = "Bin_4"
                end
                CreateMessage("Successfully Gave "..LocalPlayer.Name.." BTools", false)
            end,
        },

        Sword = {
            Index = {"FE Sword", "sword", "fesword", "fe sword"},
            ExecuteCommand = function()
                local classic_sword = Instance.new("Tool")
                classic_sword.Grip = CFrame.fromMatrix(Vector3.new(0, 0, -1.5), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1), Vector3.new(1, 0, 0))
                classic_sword.GripForward = Vector3.new(-1, -0, -0)
                classic_sword.GripPos = Vector3.new(0, 0, -1.5)
                classic_sword.GripRight = Vector3.new(0, 1, 0)
                classic_sword.GripUp = Vector3.new(0, 0, 1)
                classic_sword.TextureId = "rbxasset://Textures/Sword128.png"
                classic_sword.WorldPivot = CFrame.fromMatrix(Vector3.new(-114.38774108886719, 24.64931297302246, 83.36888122558594), Vector3.new(0.09104403853416443, 0.5370116829872131, -0.8386485576629639), Vector3.new(-0.8810994625091553, 0.43589484691619873, 0.18346372246742249), Vector3.new(0.46408435702323914, 0.7222291231155396, 0.5128455758094788))
                classic_sword.Name = "ClassicSword"
                classic_sword.Parent = game.Players.LocalPlayer.Backpack

                local handle = Instance.new("Part")
                handle.BottomSurface = Enum.SurfaceType.Smooth
                handle.BrickColor = BrickColor.new(0.38823533058166504, 0.37254902720451355, 0.38431376218795776)
                handle.CFrame = CFrame.fromMatrix(Vector3.new(-114.44070434570312, 24.240930557250977, 82.50543212890625), Vector3.new(0.09104403853416443, 0.5370116829872131, -0.8386485576629639), Vector3.new(-0.8810994625091553, 0.43589484691619873, 0.18346372246742249), Vector3.new(0.46408435702323914, 0.7222291231155396, 0.5128455758094788))
                handle.Color = Color3.new(0.388235, 0.372549, 0.384314)
                handle.Locked = true
                handle.Orientation = Vector3.new(-46.23899841308594, 42.143001556396484, 50.933998107910156)
                handle.Reflectance = 0.4000000059604645
                handle.Rotation = Vector3.new(-54.62200164794922, 27.650999069213867, 84.10099792480469)
                handle.Size = Vector3.new(1, 0.800000011920929, 4)
                handle.TopSurface = Enum.SurfaceType.Smooth
                handle.Name = "Handle"
                handle.Parent = classic_sword

                local mesh = Instance.new("SpecialMesh")
                mesh.MeshType = Enum.MeshType.FileMesh
                mesh.MeshId = "rbxasset://fonts/sword.mesh"
                mesh.TextureId = "rbxasset://textures/SwordTexture.png"
                mesh.Parent = handle

                classic_sword.Activated:Connect(function()local a=game.Players.LocalPlayer local b="74894663"local c=Instance.new("Animation")c.AnimationId="rbxassetid://218504594"..b local a=a.Character.Humanoid:LoadAnimation(c)a:Play()a:AdjustSpeed(2)local c=Instance.new("Sound")c.Parent=handle c.MaxDistance=math.huge c.SoundId="rbxassetid://88633606"c.Volume=2 wait()c:Play()for a,b in pairs(game.Players:GetChildren())do if b.Name~=game.Players.LocalPlayer.Name then for a=1,10 do game.ReplicatedStorage.meleeEvent:FireServer(b)c:Destroy()end end end end)

                local swing = Instance.new("Animation")
                swing.AnimationId = "rbxassetid://2954124238"
                swing.Name = "Swing"
                swing.Parent = classic_sword

                local sound = Instance.new("Sound")
                sound.RollOffMode = Enum.RollOffMode.InverseTapered
                sound.SoundId = "rbxassetid://935843979"
                sound.Parent = handle

                local AnimTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(swing)

                classic_sword.Activated:Connect(function()
                    AnimTrack:Play()
                    sound:Play()
                end)
                CreateMessage("Successfully Gave "..LocalPlayer.Name.." Classic Sword", false)
            end,
        },

        Scythe = {
            Index = {"FE Scythe", "fe scythe", "fescythe", "FEScythe"},
            ExecuteCommand = function()
                local scythe = Instance.new("Tool")
                scythe.Grip = CFrame.fromMatrix(Vector3.new(0.0007686614990234375, -0.4924072325229645, -0.7983719110488892), Vector3.new(-0.9838138818740845, 0.06910257786512375, 0.16533301770687103), Vector3.new(-0.016353439539670944, 0.8841786980628967, -0.4668625295162201), Vector3.new(-0.17844536900520325, -0.46200957894325256, -0.8687372207641602))
                scythe.GripForward = Vector3.new(0.17844536900520325, 0.46200957894325256, 0.8687372207641602)
                scythe.GripPos = Vector3.new(0.0007686614990234375, -0.4924072325229645, -0.7983719110488892)
                scythe.GripRight = Vector3.new(-0.9838138818740845, 0.06910257786512375, 0.16533301770687103)
                scythe.GripUp = Vector3.new(-0.016353439539670944, 0.8841786980628967, -0.4668625295162201)
                scythe.TextureId = "rbxassetid://1609077907"
                scythe.WorldPivot = CFrame.fromMatrix(Vector3.new(-6.417652130126953, 15.600000381469727, 127.1673583984375), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
                scythe.Name = "Scythe"
                scythe.Parent = game.Players.LocalPlayer.Backpack

                local handle = Instance.new("Part")
                handle.BottomSurface = Enum.SurfaceType.Smooth
                handle.CFrame = CFrame.fromMatrix(Vector3.new(-6.417652130126953, 15.600000381469727, 127.1673583984375), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1))
                handle.Size = Vector3.new(4, 1, 2)
                handle.TopSurface = Enum.SurfaceType.Smooth
                handle.Name = "Handle"
                handle.Parent = scythe

                local mesh = Instance.new("SpecialMesh")
                mesh.MeshType = Enum.MeshType.FileMesh
                mesh.MeshId = "rbxassetid://218497396 "
                mesh.TextureId = "rbxassetid://1489112250"
                mesh.Scale = Vector3.new(2, 2, 2)
                mesh.Parent = handle

                handle.Touched:Connect(function()end)
                local touch_interest = handle:WaitForChild("TouchInterest")

                local sounds = Instance.new("Folder")
                sounds.Name = "Sounds"
                sounds.Parent = scythe

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




                scythe.Activated:Connect(function()local a=game.Players.LocalPlayer local b="74894663"local c=Instance.new("Animation")c.AnimationId="rbxassetid://218504594"..b local a=a.Character.Humanoid:LoadAnimation(c)a:Play()a:AdjustSpeed(2)local c=Instance.new("Sound")c.Parent=handle c.MaxDistance=math.huge c.SoundId="rbxassetid://88633606"c.Volume=2 wait()c:Play()for a,b in pairs(game.Players:GetChildren())do if b.Name~=game.Players.LocalPlayer.Name then for a=1,10 do game.ReplicatedStorage.meleeEvent:FireServer(b)c:Destroy()end end end end)

                scythe.Activated:Connect(function()
                    AnimTrack:Play()
                    slash:Play()
                end)
                CreateMessage("Successfully Gave "..LocalPlayer.Name.." FE Scythe", false)
            end,
        },

        SuperPunch = {
            Index = {"God Punch", "One Punch", "Super Punch", "onepunch", "SPunch"},
            ExecuteCommand = function()

                Commands.Variables.SuperPunchBool = true

                local mainRemotes = game.ReplicatedStorage
                local meleeRemote = mainRemotes['meleeEvent']
                local mouse = game.Players.LocalPlayer:GetMouse()
                local punching = false
                local cooldown = false

                local function punch()
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

                            if Commands.Variables.SuperPunchBool == true then
                                punch()
                            end


                        end
                    end
                end)
                CreateMessage("Successfully Set One Punch To: "..tostring(Commands.Variables.SuperPunchBool), false)
            end,
        },

        UnSuperPunch = {
            Index = {"Unsuper Punch", "UnPunch", "Ungod Punch", "disablepunch"},
            ExecuteCommand = function()
                Commands.Variables.SuperPunchBool = false
                CreateMessage("Successfully Set One Punch To: "..tostring(Commands.Variables.SuperPunchBool), false)
            end,
        },

        GearMod = {
            Index = {"Gear Gui", "GearMod", "geargui", "gearmod"},
            ExecuteCommand = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Pedro0239485y7/FE-Gear-Giver-Mod-PRison-Life-UnOb/refs/heads/main/Code"))()
                CreateMessage("Successfully Loaded Gear Mod Script", false)
            end,
        },

        KillAll = {
            Index = {"Kill All", "oofall", "killall", "kill all", "oof all"},
            ExecuteCommand = function()
                MultiKill(Players)      
            end,
        },

        InfiniteJump = {
            Index = {"Infinite Jump", "infjump", "infinite jump", "ijump"},
            ExecuteCommand = function()
                Commands.Variables.InfJumpBool = true
                game:GetService("UserInputService").JumpRequest:Connect(function()
                    if Commands.Variables.InfJumpBool == true then
                        game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):ChangeState("Jumping")
                    end
                end)
                CreateMessage("Successfully Enabled Infinite Jump", false)
            end,
        },

        DisableInfiniteJump = {
            Index = {"Disable Infinite Jump", "disinfjump", "disable infjump", "stopinfjump", "stopinf"},
            ExecuteCommand = function()
                Commands.Variables.InfJumpBool = false
                CreateMessage("Successfully Disabled Infinite Jump", false)
            end,
        },

        AutoRespawn = {
            Index = {"QuickRespawn", "autores", "autorespawn", "quickreset"},
            ExecuteCommand = function()
                Toggles.AutoRespawn = true;
                CreateMessage("Successfully Enabled Auto Respawn", false)
            end,
        },

        CrashServer = {
            Index = {"Crash Server", "lagserver", "shutdown", "servershutdown"},
            ExecuteCommand = function()
                local e = 8654

                for i=1, e do
                    task.spawn(function()
                        workspace.Remote.TeamEvent:FireServer("Bright orange")
                    end)
                end
                CreateMessage("Successfully Crashed Server", false)
            end,
        },

        DestroyDoors = {
            Index = {"Destroy Doors", "DDoors", "ddoors"},
            ExecuteCommand = function()
                workspace.Doors.Parent = Rstorage
                CreateMessage("Successfully Destroyed All Doors", false)
            end,
        },

        RestoreDoors = {
            Index = {"Restore Doors", "RDoors", "rdoors", "sdoors"},
            ExecuteCommand = function()
                Rstorage.Doors.Parent = workspace
                CreateMessage("Successfully Restored All Doors", false)
            end,
        },

        LKAll = {
            Index = {"Loopkill all", "lkall", "lk all", "loopkillall", "lka"},
            ExecuteCommand = function()
                Loops.KillTeams.All = true
                CreateMessage("Successfully Enabled Loopkill: All", false)
            end,
        },

        UnLKAll = {
            Index = {"UnLoopkill all", "unlkall", "unlk all", "unloopkillall", "unlka"},
            ExecuteCommand = function()
                Loops.KillTeams.All = false
                CreateMessage("Successfully Disabled Loopkill: All", false)
            end,
        },

        AntiFling = {
            Index = {"Anti fling", "afling", "af", "antif"},
            ExecuteCommand = function()
                States.AntiFling = true;
                CreateMessage("Successfully Enabled AntiFling",false)
            end,
        },

        UnAntiFling = {
            Index = {"Disable anti fling", "dafling", "daf", "dantif"},
            ExecuteCommand = function()
                States.AntiFling = false;
                CreateMessage("Successfully Disabled AntiFling",false)
            end,
        },

        KillGuards = {
            Index = {"KillGuards", "killg", "kill all guards", "killcops"},
            ExecuteCommand = function()
                MultiKill(Teams.Guards)
                CreateMessage("Successfully Killed Guards", false)
            end,
        },

        LKGuards = {
            Index = {"LoopKillGuards", "lkg", "loopkill all guards", "loopkillcops"},
            ExecuteCommand = function()
                Loops.KillTeams.Guards = true
                CreateMessage("Successfully Enabled Loopkill: Guards", false)
            end,
        },

        AntiVelocity = {
            Index = {"Anti velocity", "antivelocity", "av"},
            ExecuteCommand = function()
                States.AntiVelocity = true;
                CreateMessage("Successfully Enabled AntiVelocity",false)
            end,
        },

        UnAntiVelocity = {
            Index = {"Disable anti velocity", "unantivelocity", "unav"},
            ExecuteCommand = function()
                States.AntiVelocity = false;
                CreateMessage("Successfully Disabled AntiVelocity",false)
            end,
        },

        FullBright = {
            Index = {"Fullbright", "fb"},
            ExecuteCommand = function()
                States.FullBright = true;
                CreateMessage("Successfully Enabled FullBright",false)
            end,
        },

        UnFullBright = {
            Index = {"unFullbright", "unfb"},
            ExecuteCommand = function()
                States.FullBright = false;
                CreateMessage("Successfully Disabled FullBright",false)
            end,
        },

        AntiShoot = {
            Index = {"Antishoot", "ashoot"},
            ExecuteCommand = function()
                Toggles.Antishoot = true;
                CreateMessage("Successfully Enabled AntiShoot",false)
            end,
        },

        UnAntiShoot = {
            Index = {"UnAntiShoot", "unashoot"},
            ExecuteCommand = function()
                Toggles.Antishoot = false;
                CreateMessage("Successfully Disabled AntiShoot",false)
            end,
        },

        AntiPunch = {
            Index = {"AntiPunch", "apunch"},
            ExecuteCommand = function()
                Toggles.AntiPunch = true;
                CreateMessage("Successfully Enabled AntiPunch",false)
            end,
        },

        UnAntiPunch = {
            Index = {"UnAntiPunch", "unapunch"},
            ExecuteCommand = function()
                Toggles.AntiPunch = false;
                CreateMessage("Successfully Disabled AntiPunch",false)
            end,
        },



        UnLKGuards = {
            Index = {"UnLoopKillGuards", "unlkg", "unloopkill all guards", "unloopkillcops"},
            ExecuteCommand = function()
                Loops.KillTeams.Guards = false
                CreateMessage("Successfully Disabled Loopkill: All", false)
            end,
        },
        
        KillNeutrals = {
            Index = {"KillNeutrals", "killn", "kill all neutrals", "killneutrals"},
            ExecuteCommand = function()
                MultiKill(Teams.Inmates)
                CreateMessage("Successfully Killed Neutrals", false)
            end,
        },

        LKNeutrals = {
            Index = {"LoopKillneutrals", "lkn", "loopkill all neutrals", "loopkillneutrals"},
            ExecuteCommand = function()
                Loops.KillTeams.Neutrals = true
                CreateMessage("Successfully Enabled Loopkill: Neutrals", false)
            end,
        },

        UnLKNeutrals = {
            Index = {"UnLoopKillNeutrals", "unlkn", "unloopkill all neutrals", "unloopkillneutrals"},
            ExecuteCommand = function()
                Loops.KillTeams.Neutrals = false
                CreateMessage("Successfully Disabled Loopkill: All", false)
            end,
        },

        KillInmates = {
            Index = {"KillInmates", "killi", "kill all inmates", "killinmates"},
            ExecuteCommand = function()
                MultiKill(Teams.Inmates)
                CreateMessage("Successfully Killed Inmates", false)
            end,
        },

        LKInmates = {
            Index = {"LoopKillInmates", "lki", "loopkill all inmates", "loopkillinmates"},
            ExecuteCommand = function()
                Loops.KillTeams.Inmates = true
                CreateMessage("Successfully Enabled Loopkill: Inmates", false)
            end,
        },

        UnLKInmates = {
            Index = {"UnLoopKillInmates", "unlki", "unloopkill all inmates", "unloopkillinmates"},
            ExecuteCommand = function()
                Loops.KillTeams.Inmates = false
                CreateMessage("Successfully Disabled Loopkill: Guards", false)
            end,
        },

        KillCrim = {
            Index = {"KillCriminals", "killc", "kill all criminals", "killcriminals"},
            ExecuteCommand = function()
                MultiKill(Teams.Criminals)
                CreateMessage("Successfully Enabled Loopkill: Criminals", false)
            end,
        },

        LKCrims = {
            Index = {"LoopKillCriminals", "lkc", "loopkill all criminals", "loopkillcrims"},
            ExecuteCommand = function()
                Loops.KillTeams.Criminals = true
                CreateMessage("Successfully Disabled Loopkill: Criminals", false)
            end,
        },

        UnLKCriminals = {
            Index = {"UnLoopKillCriminals", "unlkc", "unloopkill all criminals", "unloopkillcrims"},
            ExecuteCommand = function()
                Loops.KillTeams.Criminals = false
                CreateMessage("Successfully Disabled Loopkill: Criminals", false)
            end,
        },

        HideUI = {
            Index = {"Hide UI", "hide", "hidecommands", "hide all"},
            ExecuteCommand = function()
                ExecuteFrame.Visible = false
                MainFrame.Visible = false
                OutPutFrame.Visible = false
                CreateMessage("Successfuly Hid UI", false)
            end,
        },

        SpamSound = {
            Index = {"Spam Sound", "spamsound", "soundspam", "spamnoise"},
            ExecuteCommand = function()
                States.SoundSpam = true
                task.wait(0.02)
                SoundSpam()
                CreateMessage("Successfully Enabled Sound Spam", false)
            end,
        },

        UnSpamSound = {
            Index = {"UnSpam Sound", "unspamsound", "unsoundspam", "unspamnoise"},
            ExecuteCommand = function()
                States.SoundSpam = false
                CreateMessage("Successfully Disabled Sound Spam", false)
            end,
        },

        Yard = {
            Index = {"Yard", "tpyard", "toyard"},
            ExecuteCommand = function()
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(780.7301025390625, 97.99992370605469, 2468.014404296875)
                CreateMessage("Successfully Teleported Player To: Yard", false)
            end,
        },

        CrimBase = {
            Index = {"CrimBase", "tpbase", "tocrimbase", "Criminal Base"},
            ExecuteCommand = function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-920.821044921875, 95.32717895507812, 2138.347412109375)
                CreateMessage("Successfully Teleported Player To: Criminal Base", false)
            end,
        },

        GuardRoom = {
            Index = {"Guard Room", "tpguardroom", "toguardroom", "Cops Room"},
            ExecuteCommand = function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(838.4561767578125, 99.98998260498047, 2261.929931640625)
                CreateMessage("Successfully Teleported Player To: Guard Room", false)
            end,
        },

        UnAutoRespawn = {
            Index = {"UnAuto Respawn", "unauto", "unautore", "nonautorespawn", "unfastrespawn"},
            ExecuteCommand = function()
                Toggles.AutoRespawn = false;
                CreateMessage("Successfully Disabled Auto Respawn", false)
            end,
        },

        KeyCard = {
            Index = {"Give Keycard", "keycard", "givekeycard", "givekey"},
            ExecuteCommand = function()
                repeat task.wait() GiveKeyCard(LocalPlayer) until LocalPlayer.Backpack:FindFirstChild("Key card")
                CreateMessage("Successfully Gave Keycard To "..LocalPlayer.Name, false)
            end,
        },

        KillPlayer = {
            Index = {"Kill Player", "killplr", "kill plr", "kill"},
            ArgsCommand = true,
            ExecuteCommand = function(player : string)
                for _, plr in pairs(Players:GetPlayers()) do
                    if plr.Name == player then
                        KillPL(plr)
                        CreateMessage("Successfully Killed "..plr.Name, false)
                    else
                        CreateMessage("Invalid Player: "..plr.Name, true)
                    end
                end
            end,
        },

        LoopKillPlayer = {
            Index = {"LoopKill Player", "lkplr", "lkill plr", "loopkill"},
            ArgsCommand = true,
            ExecuteCommand = function(playerName : string)
                local targetPlayer = Players:FindFirstChild(playerName)

                if not targetPlayer then
                    CreateMessage("Invalid Player: " .. playerName, true)
                    return
                end

                Loops.Kill[targetPlayer.UserId] = targetPlayer
                CreateMessage("Enabled Loopkill For " .. targetPlayer.Name, false)
            end,
        },

        PrintCommands = {
            Index = {"Print Commands", "cmds", "printcmds", "printcommands"},
            ExecuteCommand = function()
                for _, cmd in pairs(CommandsFrame:GetChildren()) do
                    if cmd:IsA("TextButton") and cmd.Name ~= "ReferenceCommand" and PrintCommands then
                        print(cmd.Name)
                        CreateMessage("Successfully Printed All Commands! Press F9 To View The Commands.", false)
                    end
                end
            end,
        },

        ShootKillPlr = {
            Index = {"Shootkill Player", "Shootkillplr", "shootkill", "sKill"},
            ArgsCommand = true,
            ExecuteCommand = function(player : string)
                for _, plr in pairs(Players:GetPlayers()) do
                    if plr.Name == player then
                        ShootKill(plr)
                        CreateMessage("Successfully Shootkilling "..plr.Name, false)
                    end
                end
            end,
        },

        ArrestPlr = {
            Index = {"Arrest Player", "arrestplr", "arrest player", "arplayer"},
            ArgCommand = true,
            ExecuteCommand = function(player : string)
                for _, plr in pairs(Players:GetPlayers()) do
                    if plr.Name == player then
                        ArrestPL(plr)
                    else
                        CreateMessage("Invalid Player: "..plr.Name, true)
                    end
                end
            end,
        },

        TasePlayer = {
            Index = {"Tase Player", "taseplr", "tase plr", "tsplr"},
            ExecuteCommand = function(player : string)
                local plrfound = false
                for _, plr in pairs(Players:GetPlayers()) do
                    if plr.Name == player then
                        plrfound = true
                        TasePL(plr)
                        CreateMessage("Successfully Tasered Player "..plr.Name, false)
                        break
                    else
                        CreateMessage("Invalid Player: "..plr.Name, true)
                    end
                end
            end,
        },

        TaseAll = {
            Index = {"Tase All", "taseall", "tase all", "tsall"},
            ExecuteCommand = function()
                TasePL(Players, "teams")
                CreateMessage("Successfully Tasered Everyone", false)
            end,
        },

        UnLoopKillPlayer = {
            Index = {"UnloopkillPlayer", "stoploopkill", "stoplk"},
            ArgsCommand = true,
            ExecuteCommand = function(playerName : string)
                local targetPlayer = Players:FindFirstChild(playerName)

                if not targetPlayer then
                    CreateMessage("Invalid Player: " .. playerName, true)
                    return
                end

                Loops.Kill[targetPlayer.UserId] = nil
                CreateMessage("Stopped loopkill for " .. targetPlayer.Name, false)
            end,
        },

        SpawnCar = {
            Index = {"Spawn Car", "spawncar", "Scar", "scar"},
            ExecuteCommand = function()
                BringCar()
                CreateMessage("Successfully Spawned Car", false)
            end,
        },

        BringPlayer = {
            Index = {"Bring Player", "bringplr", "bplr", "bplayer"},
            ArgsCommand = true,
            ExecuteCommand = function(player : Player)
                local DaPlayer = player
                if DaPlayer then
                    BringPL(DaPlayer, LocalPlayer)
                    CreateMessage("Successfully Brung "..DaPlayer, false)
                else
                    CreateMessage("Invalid Player: "..player, false)
                end
            end,
        },

        BringAll = {
            Index = {"Bring All", "bringall", "Ball", "brall"},
            ExecuteCommand = function()
                SavedPositions.BringAll = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
                for i,v in pairs(Players:GetPlayers()) do
                    if not (v == LocalPlayer) then
                        BringPL(v, SavedPositions.BringAll, true)
                        CreateMessage("Successfully Brung All Players", false)
                    end
                end
                LAction("unsit", true)
                LocTP(SavedPositions.BringAll)
            end,
        },

        UnnamedESP = {
            Index = {"Unnamed ESP", "esp", "ESP"},
            ExecuteCommand = function()
                pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'))() end)
                CreateMessage("Successfully Loaded Unnamed ESP", false)
            end,
        },

        RemoteSpy = {
            Index = {"Simple Spy", "Remote Spy", "rspy", "sspy"},
            ExecuteCommand = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
                CreateMessage("Successfully Loaded Remote Spy",false)
            end,
        },

        InfYield = {
            Index = {"Infinite Yield", "adminpanel", "infyield"},
            ExecuteCommand = function()
                loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
                CreateMessage("Successfully Loaded Infinite Yield", false)
            end,
        },

        ImpactHub = {
            Index = {"Impact Hub", "imphub", "impact hub"},
            ExecuteCommand = function()
                loadstring(game:HttpGet("https://zygomorphic-jobyna-impacthub-3d96c239.koyeb.app/main.lua"))()
                CreateMessage("Successfully Loaded Impact Hub", false)
            end,
        },



        TPNexus = {
            Index = {"Nexus", "TPNexus", "tpnex"},
            ExecuteCommand = function()
                LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.nexus
                CreateMessage("Successfully Teleported Player To Nexus", false)
            end,
        },

        TPCafe = {
            Index = {"Cafe", "TPCafe", "tpcafe"},
            ExecuteCommand = function()
                LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.cafe
                CreateMessage("Successfully Teleported Player To Cafeteria", false)
            end,
        },

        TPCrimBase = {
            Index = {"Criminal Base", "TPCrimBase", "tpcrimbase", "tpbase", "tbcb"},
            ExecuteCommand = function()
                LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.crimbase
                CreateMessage("Successfully Teleported Player To Criminal Base", false)
            end,
        },

        TPGasStation = {
            Index = {"GasStation", "TPGasStation", "tpgas", "tpstation"},
            ExecuteCommand = function()
                LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.gas
                CreateMessage("Successfully Teleported Player To Gas Station", false)
            end,
        },

        Sonic = {
            Index = {"Sonic", "sonicspeed", "fastrun"},
            ExecuteCommand = function()
                LocalPlayer.Character.Humanoid.WalkSpeed = 32
                CreateMessage("Successfully Enabled Sonic Speed", false)
            end,
        },

        UnSoni = {
            Index = {"UnSonic", "unsonicspeed", "unfastrun"},
            ExecuteCommand = function()
                LocalPlayer.Character.Humanoid.WalkSpeed = 16
                CreateMessage("Successfully Disabled Sonic Speed", false)
            end,
        },

        LoopSonic = {
            Index = {"Loop Sonic", "loopsonicspeed", "loopfastrun"},
            ExecuteCommand = function()
                Loops.Speed = true
                while task.wait() do
                    if Loops.Speed == true then
                        LocalPlayer.Character.Humanoid.WalkSpeed = 32
                    end
                end
                CreateMessage("Successfully Enabled Loop Sonic Speed", false)
            end,
        },

        UnLoopSonic = {
            Index = {"UnLoop Sonic", "unloopsonicspeed", "unloopfastrun"},
            ExecuteCommand = function()
                Loops.Speed = false
                LocalPlayer.Character.Humanoid.WalkSpeed = 16
                CreateMessage("Successfully Disabled Loop Sonic Speed", false)
            end,
        },


        Virus = {
            Index = {"Virus", "virus me", "killontouch"},
            ExecuteCommand = function()
                Powers.Antitouch[LocalPlayer.UserId] = LocalPlayer
                CreateMessage("Succefully Virused Yourself!", false)
            end,
        },

        UnVirus = {
            Index = {"UnVirus", "unvirus player", "unkillontouch"},
            ExecuteCommand = function()
                Powers.Antitouch[LocalPlayer.UserId] = nil
                CreateMessage("Succefully UnVirused Yourself!", false)
            end,
        },

        HighJump = {
            Index = {"High Jump", "highjump", "jumphigh"},
            ExecuteCommand = function()
                LocalPlayer.Character.Humanoid.JumpPower = 85
                CreateMessage("Successfully Enabled High Jump", false)
            end,
        },

        UnHighJump = {
            Index = {"YnHigh Jump", "ynhighjump", "unjumphigh"},
            ExecuteCommand = function()
                LocalPlayer.Character.Humanoid.JumpPower = 50
                CreateMessage("Successfully Disabled High Jump", false)
            end,
        },

        LoopHighJump = {
            Index = {"Loop High Jump", "loophighjump", "loopjumphigh"},
            ExecuteCommand = function()
                Loops.Jump = true
                while task.wait() do
                    if Loops.Jump == true then
                        LocalPlayer.Character.Humanoid.JumpPower = 85
                    end
                end
                CreateMessage("Successfully Enabled Loop High Jump", false)
            end,
        },

        UnLoopHighJump = {
            Index = {"UnLoop High Jump", "unloophighjump", "unloopjumphigh"},
            ExecuteCommand = function()
                Loops.Jump = false
                LocalPlayer.Character.Humanoid.JumpPower = 50
                CreateMessage("Successfully Disabled Loop High Jump", false)
            end,
        },

        OpenAllDoors = {
            Index = {"Open Doors", "OpenDoors", "opendoors"},
            ExecuteCommand = function()
                OpenDoors()
                CreateMessage("Successfully Opened All Doors", false)
            end,
        },

        ShootKillAll = {
            Index = {"Shootkill All", "shootkillall", "shootall"},
            ExecuteCommand = function()
                for _, plr in pairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer then
                        ShootKill(plr)
                        CreateMessage("Successfully Shootkilling All Players", false)
                    end
                end
            end,
        },

        ShootKillGuards = {
            Index = {"Shootkill Guards", "skillguards", "killguardsshoot"},
            ExecuteCommand = function()
                for _, plr in pairs(Players:GetPlayers()) do
                    if plr.Team == Teams.Guards and plr ~= LocalPlayer then
                        ShootKill(plr)
                        CreateMessage("Successfully Shootkilling Guards", false)
                    end
                end
            end,
        },

        ShootKillInmates = {
            Index = {"Shootkill Inmates", "skillinmates", "killinmatesshoot"},
            ExecuteCommand = function()
                for _, plr in pairs(Players:GetPlayers()) do
                    if plr.Team == Teams.Inmates and plr ~= LocalPlayer then
                        ShootKill(plr)
                        CreateMessage("Successfully Shootkilling Inmates", false)
                    end
                end
            end,
        },

        ShootKillCriminals = {
            Index = {"Shootkill Criminals", "skillcriminals", "killcriminalsshoot"},
            ExecuteCommand = function()
                for _, plr in pairs(Players:GetPlayers()) do
                    if plr.Team == Teams.Criminals and plr ~= LocalPlayer then
                        ShootKill(plr)
                        CreateMessage("Successfully Shootkilling Criminals", false)
                    end
                end
            end,
        },

        FlingAll = {
            Index = {"Fling All", "FlingAll", "fAll"},
            ExecuteCommand = function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/ChaosExploits/OrionLib/refs/heads/main/SkidFling'))()
                CreateMessage("Successfully Flinging All", false)
            end,
        },

        ArrestPlayer = {
            Index = {"Arrest Player", "arrestplr", "arrest plr"},
            ArgsCommand = true,
            ExecuteCommand = function(player : string)
                local targetplayer = Players:FindFirstChild(player)

                if not targetplayer then
                    return
                        CreateMessage("Invalid Player: "..targetplayer, true)
                end

                ArrestPL(targetplayer)

                CreateMessage("Successfully Arresting "..player, false)
            end,
        },

        LoopArrestPlayer = {
            Index = {"Loop Arrest Player", "laplayer"},
            ArgsCommand = true,
            ExecuteCommand = function(player : string)
                local targetplayer = Players:FindFirstChild(player)

                if not targetplayer then
                    return
                        CreateMessage("Invalid Player: "..player, true)
                end

                Loops.Arrest[targetplayer.UserID] = targetplayer
                CreateMessage("Successfully Loop Arrested "..player, false)
            end,
        },

        UnLoopArrestPlayer = {
            Index = {"UnLoop Arrest Player", "unlaplayer"},
            ArgsCommand = true,
            ExecuteCommand = function(player : string)
                local targetplayer = Players:FindFirstChild(player)

                if not targetplayer then
                    return
                        CreateMessage("Invalid Player: "..player, true)
                end

                Loops.Arrest[targetplayer.UserID] = nil
                CreateMessage("Successfully Unloop Arrested "..player, false)
            end,
        },

        CarFling = {
            Index = {"Carfling Player", "carfling", "carflingplr", "cfplr"},
            ArgsCommand = true,
            ExecuteCommand = function(player : string)
                local targetplayer = Players:FindFirstChild(player)

                if not player then return end

                CarFlingPL(player)
                CreateMessage("Successfully Car Flung "..player, false)
            end,
        },

        Fling = {
            Index = {"Fling Player", "fling", "flingplr"},
            ArgsCommand = true,
            ExecuteCommand = function(player : string)
                local target = Players:FindFirstChild(player)

                if target then
                    FlingPL(target)
                    CreateMessage("Successfully Flung "..LocalPlayer.Name,false)
                else
                    CreateMessage("Invalid Player: "..player, true)
                end
            end,
        },

        TPVents = {
            Index = {"Vents", "TPVents", "tpvents"},
            ExecuteCommand = function()
                LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.vents
                CreateMessage("Successfully Teleported To Vents", false)
            end,
        },

        TPCells = {
            Index = {"Cells", "TPCells", "tpcells"},
            ExecuteCommand = function()
                LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.cells
                CreateMessage("Successfully Teleported To Cells", false)
            end,
        },

        TPRoof = {
            Index = {"Roof", "TPRoof", "tproof"},
            ExecuteCommand = function()
                LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.roof
                CreateMessage("Successfully Teleported To Roof", false)
            end,
        },

        ChaosUI = {
            Index = {"Chaos GUI", "Chaosui"},
            ExecuteCommand = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Chaosscripter/CorgiSideExploits-OrionLib/refs/heads/main/Chaos%20Prison%20Life", true))()
                CreateMessage("Loaded Chaos Exploits Official GUI",false)
            end,
        },

        TPBuildingRoof = {
            Index = {"Building Roof", "TPBRoof", "tpbroof"},
            ExecuteCommand = function()
                LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.buildingroof
                CreateMessage("Successfully Teleported To Building Roof", false)
            end,
        },

        LoopM9 = {
            Index = {"Loop M9", "loopm9", "looppistol"},
            ExecuteCommand = function()
                Commands.Variables.LoopM9 = true
                while task.wait() do
                    if Commands.Variables.LoopM9 == true then
                        Gun("M9")
                    end
                end
                CreateMessage("Successfully Looped M9", false)
            end,
        },

        UnLoopM9 = {
            Index = {"UnLoop M9", "unloopm9", "unlooppistol"},
            ExecuteCommand = function()
                Commands.Variables.LoopM9 = false
                CreateMessage("Successfully Unlooped M9", false)
            end,
        },

        LoopShotgun = {
            Index = {"Loop Remington", "loopshotgun", "loopremington"},
            ExecuteCommand = function()
                Commands.Variables.LoopRem = true
                while task.wait() do
                    if Commands.Variables.LoopRem == true then
                        Gun("Remington 870")
                    end
                end
                CreateMessage("Successfully Looped Remington 870", false)
            end,
        },

        UnLoopShotgun = {
            Index = {"UnLoop Remington", "unloopshotgun", "unloopremington"},
            ExecuteCommand = function()
                Commands.Variables.LoopRem = false
                CreateMessage("Successfully Unlooped Remington 870", false)
            end,
        },

        LoopAK47 = {
            Index = {"Loop AK", "loopak", "loopak47"},
            ExecuteCommand = function()
                Commands.Variables.LoopAK = true
                while task.wait() do
                    if Commands.Variables.LoopAK == true then
                        Gun("AK-47")
                    end
                end
                CreateMessage("Successfully Looped AK-47", false)
            end,
        },

        UnLoopAK47 = {
            Index = {"UnLoop AK", "unloopak", "unloopak47"},
            ExecuteCommand = function()
                Commands.Variables.LoopAk = false
                CreateMessage("Successfully Unlooped AK-47", false)
            end,
        },

        AntiArrest = {
            Index = {"AntiArrest", "antiarrest", "anti arrest", "Aarrest"},
            ExecuteCommand = function()
                Toggles.Antiarrest = true
                CreateMessage("Successfully Enabled AntiArrest", false)
            end,
        },

        UnAntiArrest = {
            Index = {"UnAntiArrest", "unantiarrest", "unanti arrest", "unAarrest"},
            ExecuteCommand = function()
                Toggles.Antiarrest = false
                CreateMessage("Successfully Disabled AntiArrest", false)
            end,
        },

        AntiTase = {
            Index = {"AntiTase", "antitase", "anti tase", "Atase"},
            ExecuteCommand = function()
                Toggles.AntiTase = true
                CreateMessage("Successfully Enabled AntiTase", false)
            end,
        },

        UnAntiTase = {
            Index = {"UnAntiTase", "unantitase", "unanti tase", "unAtase"},
            ExecuteCommand = function()
                Toggles.AntiTase = false
                CreateMessage("Successfully Disabled AntiTase", false)
            end,
        },

        OGScript = {
            Index = {"OG Exploiting GUI", "ogui", "og script", "ogscript", "ogexploit"},
            ExecuteCommand = function()
                loadstring(game:HttpGet("https://pastebin.com/raw/GzeWWPWN"))()
                CreateMessage("Successfully Loaded OG Prison Life GUI", false)
            end,
        },

        CorgiwareScript = {
            Index = {"Corgiware Gui", "CorgiwareUI", "Corgiware"},
            ExecuteCommand = function()
                loadstring(game:HttpGet("https://pastebin.com/raw/DuWbmerF"))()
                CreateMessage("Successfully Loaded Corgiware", false)
            end,
        },

        SpamPunch = {
            Index = {"Spam Punch", "Fast Punch", "spunch", "fpunch"},
            ExecuteCommand = function()
                if not Toggles.SpamPunch then
                    Toggles.SpamPunch = true
                    print(Toggles['SpamPunch'])
                    CreateMessage("Enabled Spam Punch", false)
                else
                    CreateMessage("Spam Punch is Already Enabled!", true)
                end


            end,
        },

        UnSpamPunch = {
            Index = {"UnSpam Punch", "UnFast Punch", "unspunch", "unfpunch"},
            ExecuteCommand = function()
                if Toggles.SpamPunch then
                    Toggles.SpamPunch = nil
                    print(Toggles['SpamPunch'])
                    CreateMessage("Disabled Spam Punch", false)
                else
                    CreateMessage("Spam Punch is Already Disabled!", true)
                end
            end,
        },

        ClickKill = {
            Index = {"ClickKill", "ckill"},
            ExecuteCommand = function()
                States.ClickKill = true;
                CreateMessage("Successfully Enabled Click Kill",false)
            end,
        },

        UnClickKill = {
            Index = {"Disable ClickKill", "unckill"},
            ExecuteCommand = function()
                States.ClickKill = false;
                CreateMessage("Successfully Disabled Click Kill",false)
            end,
        },

        SpamArrest = {
            Index = {"Spamarrest", "spam arrest", "spamarrestplayer"},
            ArgsCommand = true,
            ExecuteCommand = function(player : string)
                local target = Players:FindFirstChild(player)

                if target then
                    SpamArrestPL(player)
                else
                    CreateMessage("Invalid Player: "..player,true)
                end
            end,
        },

        MakeCriminal = {
            Index = {"Make Criminal", "criminal person", "crimplr"},
            ArgsCommand = true,
            ExecuteCommand = function(player : string)
                local target = Players:FindFirstChild(player)

                if target then
                    MakeCrim(target,true,true,false)
                else
                    CreateMessage("Invalid Player: "..player,true)
                end
            end,
        },

        ShowThemes = {
            Index = {"Themes", "themes"},
            ExecuteCommand = function()
                ThemesFrame.Visible = true
            end,
        },

        HideThemes = {
            Index = {"Hide Themes", "hide themes"},
            ExecuteCommand = function()
                ThemesFrame.Visible = false
            end,
        },

        ShowOutput = {
            Index = {"Show Output", "show output"},
            ExecuteCommand = function()
                OutPutFrame.Visible = true
            end,
        },

        HideOutput = {
            Index = {"Hide Output", "hide output"},
            ExecuteCommand = function()
                OutPutFrame.Visible = false
            end,
        },

        ShowExecuteFrame = {
            Index = {"Show ExecuteFrame", "show executeframe"},
            ExecuteCommand = function()
                ExecuteFrame.Visible = true
            end,
        },

        HideExecuteFrame = {
            Index = {"Hide ExecuteFrame", "hide executeframe"},
            ExecuteCommand = function()
                ExecuteFrame.Visible = false
            end,
        },

        -- COMMAND ENDING

    };

    Themes = {
        Default = {
            PanelColor = Color3.new(1, 0.243137, 0.254902);
            BackgroundColor = Color3.new(0.172549, 0.172549, 0.172549);
            ForeColor = Color3.new(0.85098, 0.85098, 0.85098);
            ButtonColor = Color3.new(1, 0.403922, 0.403922)
        };
        Nebula = {
            PanelColor = Color3.new(0.823529, 0.298039, 0.862745);
            BackgroundColor = Color3.new(0.639216, 0.341176, 1);
            ForeColor = Color3.new(1, 1, 1);
            ButtonColor = Color3.new(0.890196, 0.458824, 1)
        };
        Dark = {
            PanelColor = Color3.new(0.152941, 0.152941, 0.152941);
            BackgroundColor = Color3.new(0.184314, 0.184314, 0.184314);
            ForeColor = Color3.new(0.85098, 0.85098, 0.85098);
            ButtonColor = Color3.new(0.207843, 0.207843, 0.207843)
        };
        Light = {
            PanelColor = Color3.new(0.772549, 0.772549, 0.772549);
            BackgroundColor = Color3.new(255,255,255);
            ForeColor = Color3.new(0,0,0);
            ButtonColor = Color3.new(0.737255, 0.737255, 0.737255)
        };
        Banana = {
            PanelColor = Color3.new(0.811765, 0.709804, 0.196078);
            BackgroundColor = Color3.new(1, 0.8, 0);
            ForeColor = Color3.new(1, 1, 1);
            ButtonColor = Color3.new(0.784314, 0.662745, 0.227451)
        };
        Mothernature = {
            PanelColor = Color3.new(0.0117647, 0.611765, 0.00392157);
            BackgroundColor = Color3.new(0.345098, 0.764706, 0.247059);
            ForeColor = Color3.new(1, 1, 1);
            ButtonColor = Color3.new(0.223529, 0.839216, 0)
        };
        Skies = {
            PanelColor = Color3.new(0.152941, 0.419608, 1);
            BackgroundColor = Color3.new(0.243137, 0.443137, 1);
            ForeColor = Color3.new(1, 1, 1);
            ButtonColor = Color3.new(0.376471, 0.647059, 1)
        }
    }

    local LoadThemesIntoFrame = function()
        for themeName, themeData in pairs(Themes) do
            local NewTheme = ThemesFrame.ThemeScroll.ReferenceTheme:Clone()
            NewTheme.Name = themeName
            NewTheme.Text = themeName
            NewTheme.Visible = true
            NewTheme.Parent = ThemesFrame.ThemeScroll
            print(NewTheme.Name)

            NewTheme.Activated:Connect(function()
                ThemeAPI.SetTheme(themeData)
            end)

            task.wait()
            UpdateThemeScrollCanvasSize()
        end
    end

    LoadThemesIntoFrame()

    ThemeAPI.SetTheme(Themes.Default)

    MainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if MainFrame.Visible == false then
            Open.Visible = true
        end
    end)

    local function UpdateSearchResults()
        local query = string.lower(SearchBox.Text)

        for _, button in pairs(CommandsFrame:GetChildren()) do
            if (button:IsA("TextButton") or button:IsA("TextLabel")) and button.Name ~= "ReferenceCommand" then
                button.Visible = false -- Hide by default

                for _, cmd in pairs(Commands) do
                    if cmd.Index then
                        for _, alias in pairs(cmd.Index) do
                            -- If alias starts with the query and button matches command
                            if string.sub(string.lower(alias), 1, #query) == query then
                                -- If button is for this command, show it
                                if string.find(string.lower(button.Text), string.lower(alias)) then
                                    button.Visible = true
                                    break
                                end
                            end
                        end
                    end
                    if button.Visible then break end
                end

                -- Optional: show all if search is empty
                if query == "" then
                    button.Visible = true
                end
            end
        end
    end

    LoadCommandsIntoMainFrame()
    SearchBox:GetPropertyChangedSignal("Text"):Connect(UpdateSearchResults)

    CommandBox.FocusLost:Connect(function()
        local found = false
        local input = CommandBox.Text

        for name, tblcommand in pairs(Commands) do
            if tblcommand.Index and tblcommand.ExecuteCommand then
                for _, alias in ipairs(tblcommand.Index) do
                    local inputLower = string.lower(input)
                    local aliasLower = string.lower(alias)

                    -- Exact match for non-special, no-args commands
                    if not tblcommand.SpecialCommand and not tblcommand.ArgsCommand and inputLower == aliasLower then
                        pcall(function() tblcommand.ExecuteCommand() end)
                        found = true
                        break
                    end

                    -- Special command (e.g. custom argument parsing like color + gun)
                    if tblcommand.SpecialCommand and string.sub(inputLower, 1, #aliasLower) == aliasLower then
                        local argsText = string.sub(input, #alias + 2)
                        local args = string.split(argsText, " ")
                        local color = table.remove(args, #args)
                        local gunName = table.concat(args, " ")

                        pcall(function() tblcommand.ExecuteCommand(color, gunName) end)
                        found = true
                        break
                    end

                    if tblcommand.NumberCommand and string.sub(inputLower, 1, #aliasLower) == aliasLower then
                        local argsText = string.sub(input, #alias + 2)
                        local args = string.split(argsText, " ")
                        local lastArg = table.remove(args, #args)

                        local numberarg = tonumber(lastArg)
                        if numberarg then
                            pcall(function() tblcommand.ExecuteCommand(numberarg) end)
                        else
                            CreateMessage("Invalid number: " .. tostring(lastArg), true)
                        end

                        found = true
                        break
                    end
                    -- ArgsCommand (e.g. player name or one arg at end)
                    if tblcommand.ArgsCommand and string.sub(inputLower, 1, #aliasLower) == aliasLower then
                        local argsText = string.sub(input, #alias + 2)
                        local args = string.split(argsText, " ")
                        local lastArg = table.remove(args, #args)

                        pcall(function() tblcommand.ExecuteCommand(lastArg) end)
                        found = true
                        break
                    end
                end
            end
            if found then break end
        end

        if not found then
            CreateMessage("Invalid Command: " .. input .. ".", true)
        end
    end)

    Open.Activated:Connect(function()
        Open.Visible = false
        MainFrame.Visible = true
        OutPutFrame.Visible = true
        ExecuteFrame.Visible = true
    end)

    task.wait(0.1)

    local CommandsAmount = 0

    for _, cmd in pairs(CommandsFrame:GetChildren()) do
        if cmd.Name ~= "ReferenceCommand" and cmd:IsA("TextButton") and PrintCommands then
            CommandsAmount += 1
            print(cmd.Name)
            print("Amount of commands: "..CommandsAmount)
        end
    end

    Threads = {
        ExtraSensory = function()
            if not Toggles.ESP then
                return
            end
            task.spawn(function()
                while Toggles.ESP do task.wait()
                    for i,v in pairs(Players:GetPlayers()) do
                        local LPos = LocalPlayer.Character and LocalPlayer.Character.PrimaryPart
                        local VHead, VRoot, VHuman = v.Character and v.Character:FindFirstChild("Head"), v.Character and v.Character:FindFirstChild("HumanoidRootPart"), v.Character and v.Character:FindFirstChildOfClass("Humanoid")
                        if v ~= LocalPlayer and VHead and VRoot and VHuman and LPos then
                            if VHead:FindFirstChild("ESP") then
                                local NameESP = VHead:FindFirstChild("ESP"):FindFirstChild("NameESP")
                                VRoot:FindFirstChild("RootESP").Color3 = v.TeamColor.Color
                                if v.Name == v.DisplayName then
                                    NameESP.Text = v.Name .. " | Health: " .. math.floor(VHuman.Health) .. " | Magnitude: " .. math.floor((LPos.Position-VRoot.Position).Magnitude)
                                else
                                    NameESP.Text = v.Name .. " [" .. v.DisplayName .. "] | Health: " .. math.floor(VHuman.Health) .. " | Magnitude: " .. math.floor((LPos.Position-VRoot.Position).Magnitude)
                                end; NameESP.TextColor3 = v.TeamColor.Color
                            else
                                local NameESP, Label, RootESP = Instance.new("BillboardGui"), Instance.new("TextLabel"), Instance.new("BoxHandleAdornment")
                                NameESP.Adornee = v.Character.Head;NameESP.Name = "ESP";NameESP.Parent = v.Character.Head
                                NameESP.Size = UDim2.new(0, 100, 0, 135);NameESP.StudsOffset = Vector3.new(0, 0, 0);NameESP.AlwaysOnTop = true
                                Label.Parent = NameESP;Label.Name = "NameESP";Label.BackgroundTransparency = 1
                                Label.Position = UDim2.new(0, 0, 0, -50);Label.Size = UDim2.new(0, 100, 0, 100);Label.Font = Enum.Font.SourceSansSemibold
                                Label.TextSize = 18;Label.TextColor3 = v.TeamColor.Color;Label.TextStrokeTransparency = 0
                                Label.TextYAlignment = Enum.TextYAlignment.Bottom;Label.Text = v.Name;Label.ZIndex = 10
                                RootESP.Name = "RootESP";RootESP.Parent = VRoot;RootESP.Adornee = VRoot;RootESP.AlwaysOnTop = true
                                RootESP.ZIndex = 10;RootESP.Size = VRoot.Size;RootESP.Transparency = 0.4;RootESP.Color3 = v.TeamColor.Color
                            end
                        end
                    end; Hbeat:wait()
                end
                for i,v in pairs(Players:GetPlayers()) do
                    if v ~= LocalPlayer and v.Character then
                        local lroot, lhead = v.Character:FindFirstChild("HumanoidRootPart"), v.Character:FindFirstChild("Head")
                        if lroot and lroot:FindFirstChild("RootESP") then
                            lroot:FindFirstChild("RootESP"):Destroy()
                        end; if lhead and lhead:FindFirstChild("ESP") then
                            lhead:FindFirstChild("ESP"):Destroy()
                        end
                    end
                end
            end)
        end;
        ArrestBack = function()
            if not Toggles.ArrestBack then
                return
            end
            task.spawn(function()
                while Toggles.ArrestBack do task.wait()
                    pcall(function()
                        for i,v in pairs(Teams.Guards:GetPlayers()) do
                            if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Handcuffs") then
                                local vhead, lhead = v.Character:FindFirstChild("Head"), LocalPlayer.Character:FindFirstChild("Head")
                                if vhead and lhead and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 then
                                    if (vhead.Position-lhead.Position).Magnitude <= 18 then
                                        MakeCrim(v, true, false, true)
                                    end
                                end
                            end
                        end
                    end)
                end
            end)
        end;
        AntiPay2Win = function()
            if not Toggles.AntiShield then
                return
            end
            task.spawn(function()
                while Toggles.AntiShield do task.wait()
                    for _, pay2winusers in pairs(Players:GetPlayers()) do
                        if pay2winusers ~= LocalPlayer and pay2winusers.Character and pay2winusers.Character:FindFirstChild("Torso") then
                            local folder = pay2winusers.Character.Torso:FindFirstChild("ShieldFolder"); local shield = folder and folder:FindFirstChild("shield")
                            if shield then
                                shield.Size = Vector3.new(0, 0, 0)
                            end
                        end
                    end
                end
                for _, pay2winusers in pairs(Players:GetPlayers()) do
                    if pay2winusers ~= LocalPlayer and pay2winusers.Character and pay2winusers.Character:FindFirstChild("Torso") then
                        local folder = pay2winusers.Character.Torso:FindFirstChild("ShieldFolder"); local shield = folder and folder:FindFirstChild("shield")
                        if shield then
                            shield.Size = Vector3.new(2.6, 4.2, 0.4)
                        end
                    end
                end
            end)
        end;
        AntiFling = function()
            if not States.AntiFling then
                return
            end
            task.spawn(function()
                local temp = PhysicalProperties.new(0.01, 0, 0)
                local tempfunc = function(arg)
                    for _,vv in pairs(arg.Character:GetChildren()) do
                        if vv:IsA("BasePart") or vv:IsA("Part") then
                            vv.CanCollide = false
                            if vv.CustomPhysicalProperties ~= temp then
                                vv.CustomPhysicalProperties = temp
                            end
                        end; if vv:IsA("MeshPart") then
                            vv.CanCollide = false
                        end; if vv:IsA("Accessory") then
                            local handle = vv:FindFirstChildWhichIsA("Part") or vv:FindFirstChildWhichIsA("MeshPart") or vv:FindFirstChildWhichIsA("WedgePart")
                            if handle and handle.CanCollide then
                                handle.CanCollide = false
                            end
                        end
                    end
                end
                while States.AntiFling do Stepped:wait()
                    for _,v in pairs(Players:GetPlayers()) do
                        if v ~= LocalPlayer and v.Character then
                            tempfunc(v)
                        end
                    end
                end
                tempfunc = nil; temp = nil
            end)
        end;
        AntiVelocity = function()
            if not States.AntiVelocity then
                return
            end
            task.spawn(function()
                local parts, cus = {}, PhysicalProperties.new(0, 0, 0)
                for i,v in pairs(workspace:GetDescendants()) do
                    if v:IsA("BasePart") or v:IsA("Part") and not v:IsDescendantOf(LocalPlayer.Character) then
                        parts[#parts+1] = v
                    end
                    if v:IsA("MeshPart") or v:IsA("WedgePart") and not v:IsDescendantOf(LocalPlayer.Character) then
                        parts[#parts+1] = v
                    end
                end
                coroutine.wrap(function()
                    while States.AntiVelocity do
                        wait(.1)
                        parts = {}
                        for i,v in pairs(workspace:GetDescendants()) do
                            if v:IsA("BasePart") or v:IsA("Part") and not v:IsDescendantOf(LocalPlayer.Character) then
                                parts[#parts+1] = v
                            end
                            if v:IsA("MeshPart") or v:IsA("WedgePart") and not v:IsDescendantOf(LocalPlayer.Character) then
                                parts[#parts+1] = v
                            end
                        end
                        local des = workspace:FindFirstChild(LocalPlayer.Name)
                        if des.PrimaryPart and des.PrimaryPart.AssemblyLinearVelocity.Magnitude > 50 then
                            Stepped:wait()
                            des.PrimaryPart.Velocity = Vector3.new(0, 0, 0)
                            des.PrimaryPart.RotVelocity = Vector3.new(0, 0, 0)
                            LocTP(SavedPositions.AntiFling)
                            deprint("Debug_Player was flinged")
                        elseif des.PrimaryPart and des.PrimaryPart.AssemblyLinearVelocity.Magnitude < 50 then
                            SavedPositions.AntiFling = des.PrimaryPart.CFrame
                        end
                    end
                    parts = nil; cus = nil
                end)()
                while States.AntiVelocity do
                    Stepped:wait()
                    if next(parts) then
                        for _,v in next, parts do
                            if v:IsA("BasePart") or v:IsA("Part") then
                                v.Velocity = Vector3.new(0, 0, 0)
                                v.RotVelocity = Vector3.new(0, 0, 0)
                                v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                                v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                                v.CustomPhysicalProperties = cus
                            end
                            if v:IsA("MeshPart") or v:IsA("WedgePart") then
                                v.CanCollide = false
                                v.Velocity = Vector3.new(0, 0, 0)
                                v.RotVelocity = Vector3.new(0, 0, 0)
                                v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                                v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                            end
                        end
                    end
                end
            end)
        end;
        ForceField = function()
            if not States.ForceField then
                return
            end
            task.spawn(function()
                while States.ForceField do task.wait()
                    local plc = LocalPlayer.Character
                    if plc then
                        plc = LocalPlayer.Character
                        local plr = plc and plc:FindFirstChild("HumanoidRootPart")
                        if plr then
                            task.delay(CPing(nil,true),function()SavedPositions.AutoRe = plr.CFrame;SaveCamPos() end)
                            if #Teams.Guards:GetPlayers() > 7 then
                                TeamEve("Bright orange")
                            end; TeamEve("Bright blue")
                            task.spawn(function()
                                local isholding = plc:FindFirstChildWhichIsA("Tool") and plc:FindFirstChildWhichIsA("Tool").Name
                                LocalPlayer.CharacterAdded:wait()
                                if States.ForceField then
                                    if not Toggles.AutoRespawn then
                                        waitfor(LocalPlayer.Character, "HumanoidRootPart", 1).CFrame = SavedPositions.AutoRe
                                    end; LoadCamPos()
                                    if isholding and wait() then
                                        local hastool = LocalPlayer.Backpack:FindFirstChild(isholding)
                                        if hastool then
                                            LAction("equip", hastool)
                                        else
                                            ItemHand(false, isholding); ItemHand(false, isholding); ItemHand(false, isholding)
                                            local toequip = LocalPlayer.Backpack:FindFirstChild(isholding)
                                            if toequip then
                                                LAction("equip", toequip)
                                            end
                                        end
                                    end
                                end
                            end)
                            local o = CPing() / 2; task.wait(5 - o)
                        end
                    end
                end
            end)
        end;
        ArrestAura = function()
            if not Toggles.ArrestAura then
                return
            end
            task.spawn(function()
                while Toggles.ArrestAura do task.wait()
                    for i,v in pairs(Players:GetPlayers()) do
                        if v.Character and v ~= LocalPlayer and v.TeamColor.Name ~= "Bright blue" then
                            local VHead, LHead = v.Character:FindFirstChild("Head"), LocalPlayer.Character:FindFirstChild("Head")
                            if VHead and LHead and CheckWhitelist(v) then
                                if (VHead.Position-LHead.Position).Magnitude <= 25 then
                                    if v.TeamColor == BrickColor.new("Really red") or GetIllegalReg(v) then
                                        task.spawn(ArrestEve, v); wait()
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end;
        ClickTeleport = function()
            if not States.ClickTeleport then
                return
            end
            task.spawn(function()
                while States.ClickTeleport do task.wait()
                    if States.ClickTeleport then
                    else break end; LocalPlayer.CharacterAdded:wait(); wait(.1); if LocalPlayer.TeamColor == BrickColor.new("Bright blue") then task.wait(1) end
                end
            end)
        end;
        Fullbright = function()
            if not States.Fullbright then
                return
            end
            task.spawn(function() pcall(function() LocalPlayer.PlayerGui.Home.fadeFrame.Visible = false end)
                local Lighting = game:GetService("Lighting"); local temp = {
                    Brightness = Lighting.Brightness,FogEnd = Lighting.FogEnd,GlobalShadows = Lighting.GlobalShadows,OutdoorAmbient = Lighting.OutdoorAmbient
                };while States.Fullbright do task.wait()
                    Lighting.Brightness = 5;Lighting.FogEnd = 100000;Lighting.GlobalShadows = false;Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
                end;Lighting.Brightness = temp.Brightness;Lighting.FogEnd = temp.FogEnd;Lighting.GlobalShadows = temp.GlobalShadows;Lighting.OutdoorAmbient = temp.OutdoorAmbient
            end)
        end;
        Invisibility = function()
            if not States.Invisible then
                return
            end
            task.spawn(function()
                AllGuns()
                local Character, FakeCharacter = LocalPlayer.Character, nil
                while States.Invisible do task.wait()
                    local root = waitfor(LocalPlayer.Character, "HumanoidRootPart", 5)
                    if root and States.Invisible then
                        local lastpos = root.CFrame
                        Character.Archivable = true
                        FakeCharacter = Character:Clone()
                        FakeCharacter.Parent = game.Lighting
                        FakeCharacter.Name = "FakeCharacter"; FakeCharacter:FindFirstChildOfClass("Humanoid").DisplayName = "[INVISIBLE]"
                        SaveCamPos()
                        root.CFrame = CFrame.new(9e9, 9e9, 9e9)
                        SavedPositions.AutoRe = lastpos; wait(.4)
                        game:GetService("Workspace").CurrentCamera.CameraType = Enum.CameraType.Scriptable
                        Hbeat:wait(); Rstep:wait()
                        game:GetService("Workspace").CurrentCamera.CameraType = Enum.CameraType.Custom
                        FakeCharacter = FakeCharacter
                        Character.Parent = game.Lighting
                        FakeCharacter.Parent = game:GetService("Workspace")
                        FakeCharacter:FindFirstChild("HumanoidRootPart").CFrame = lastpos
                        LocalPlayer.Character = FakeCharacter; Rstep:wait()
                        workspace.CurrentCamera.CameraSubject = FakeCharacter:FindFirstChildOfClass("Humanoid")
                        workspace.CurrentCamera.CameraType = "Custom"; LoadCamPos()
                        LocalPlayer.Character.Animate.Disabled = true
                        LocalPlayer.Character.Animate.Disabled = false
                        LocalPlayer.CharacterAdded:wait(); waitfor(LocalPlayer.Character, "HumanoidRootPart")
                        Character:Destroy(); Character = nil
                        FakeCharacter:Destroy(); FakeCharacter = nil
                        root = nil; lastpos = nil
                        AllGuns(); AllGuns(); AllGuns()
                        if States.Invisible then
                            Character = LocalPlayer.Character
                        else
                            break
                        end
                    end
                end; Character = nil; FakeCharacter = nil
            end)
        end;
        ShootKillPlayers = function()
            if Saved.Thread.ShootKillPlayers then
                return
            end; Saved.Thread.ShootKillPlayers = true
            task.spawn(function()
                while task.wait() do
                    if next(Loops.ShootKill) then
                        pcall(function()
                            for i,v in next, Loops.ShootKill do
                                if v and v.Character and v.Character:FindFirstChildOfClass("Humanoid") and v.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 then
                                    local tool = LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
                                    if tool and tool:FindFirstChildOfClass("ModuleScript") and tool.Name ~= "Taser" then
                                        ShootKill(v, nil, tool.Name)
                                    else
                                        ShootKill(v)
                                    end
                                end
                            end
                        end)
                    else
                        break
                    end
                end; Saved.Thread.ShootKillPlayers = nil
            end)
        end;
        RandomKillPlayers = function()
            if Saved.Thread.RandomKillPlayers then
                return
            end; Saved.Thread.RandomKillPlayers = true
            task.spawn(function()
                while wait(1) do
                    if next(Loops.RandomKill) then
                        pcall(function()
                            for i,v in next, Loops.RandomKill do
                                if v and v.Character and v ~= LocalPlayer then
                                    local meth = math.random(1, 15)
                                    if meth == 6 then
                                        KillPL(v); task.wait(.35)
                                    end
                                end
                            end
                        end)
                    else
                        break
                    end
                end; Saved.Thread.RandomKillPlayers = nil
            end)
        end;
        LoopTasePlayers = function()
            if Saved.Thread.LoopTasePlayers then
                return
            end; Saved.Thread.LoopTasePlayers = true
            task.spawn(function()
                while wait(.7) do
                    pcall(function()
                        if Loops.TaseTeams.All then
                            if LocalPlayer.TeamColor ~= BrickColor.new("Bright blue") and #Teams.Guards:GetPlayers() < 8 then
                                TeamTo("guard")
                            end; if LocalPlayer.TeamColor.Name == "Bright blue" then 
                                TasePL(Players, "teams") 
                            end
                        else
                            local temp = {}
                            if Loops.TaseTeams.Inmates then
                                for i,v in pairs(Teams.Inmates:GetPlayers()) do
                                    if v.Character and CheckWhitelist(v) and v ~= LocalPlayer and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                                        temp[#temp+1] = v
                                    end
                                end
                            end; if Loops.TaseTeams.Criminals then
                                for i,v in pairs(Teams.Criminals:GetPlayers()) do
                                    if v.Character and CheckWhitelist(v) and v ~= LocalPlayer and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                                        temp[#temp+1] = v
                                    end
                                end
                            end; if next(Loops.Tase) then
                                for i,v in next, Loops.Tase do
                                    if v.Character and v ~= LocalPlayer and not (v.Character:FindFirstChild("Humanoid").Health == 0 or v.TeamColor == BrickColor.new("Bright blue")) then
                                        temp[#temp+1] = v
                                    end
                                end
                            end; if next(Powers.Taseauras) then
                                for i,v in next, Powers.Taseauras do
                                    if v.Character and v.Character:FindFirstChild("Head") then
                                        for _,vv in pairs(Players:GetPlayers()) do
                                            if vv.Character and vv.Character:FindFirstChild("Head") and CheckWhitelist(vv) and not (vv == LocalPlayer or vv == v) then
                                                local THead, VHead = v.Character.Head, vv.Character.Head
                                                if THead and VHead and CheckWhitelist(vv) and not (vv.Character:FindFirstChildOfClass("Humanoid").Health == 0 or vv.TeamColor == BrickColor.new("Bright blue")) then
                                                    if (THead.Position-VHead.Position).Magnitude <= 17 then
                                                        temp[#temp+1] = vv
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end; if next(temp) then
                                if LocalPlayer.TeamColor ~= BrickColor.new("Bright blue") and #Teams.Guards:GetPlayers() < 8 then
                                    TeamTo("guard")
                                end; if LocalPlayer.TeamColor.Name == "Bright blue" then 
                                    TasePL(temp, "tables")
                                end
                            end; temp = nil
                        end
                    end)
                end
            end)
        end;
        DeathNukes = function()
            if Saved.Thread.DeathNukes then
                return
            end; Saved.Thread.DeathNukes = true
            task.spawn(function()
                while task.wait() do
                    if next(Powers.DeathNuke) then
                        for i,v in next, Powers.DeathNuke do
                            if v.Character and v.Character:FindFirstChildOfClass("Humanoid") then
                                if v.Character:FindFirstChildOfClass("Humanoid").Health == 0 and next(Powers.DeathNuke) then
                                    pcall(function() MultiKill(Players, v) end)
                                    RTPing(0.1); wait(5)
                                end
                            end
                        end
                    else break end
                end; Saved.Thread.DeathNukes = nil
            end)
        end;
        AutoGuns = function()
            if not Toggles.AutoGuns then
                return
            end; Toggles.AutoItems = false
            task.spawn(function()
                while Toggles.AutoGuns do task.wait()
                    pcall(AllGuns)
                    if Settings.User.OldItemMethod then
                        LocalPlayer.CharacterAdded:wait(); wait(1)
                    end
                end
            end)
        end;
        AutoItems = function()
            if not Toggles.AutoItems then
                return
            end; Toggles.AutoGuns = false
            task.spawn(function()
                while Toggles.AutoItems do task.wait()
                    task.spawn(AllItems)
                    LocalPlayer.CharacterAdded:wait()
                    if waitfor(LocalPlayer.Character, "HumanoidRootPart", 1) and Settings.User.OldItemMethod and LocalPlayer.TeamColor == BrickColor.new("Bright blue") then
                        RTPing(1)
                    end
                end
            end)
        end;
        HideTeamGui = function()
            task.spawn(function()
                task.delay(0.05, function()
                    game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
                end); for i = 1, 10 do
                    pcall(function()
                        LocalPlayer.PlayerGui:FindFirstChild("Home"):FindFirstChild("intro").Visible = false; LocalPlayer.PlayerGui:FindFirstChild("Home"):FindFirstChild("hud").Visible = true
                        game:GetService("Workspace").CurrentCamera.FieldOfView = 70; game:GetService("Workspace").CurrentCamera.CameraType = Enum.CameraType.Custom
                        game:GetService("Workspace").CurrentCamera.CameraSubject = LocalPlayer.Character:FindFirstChild("Humanoid")
                    end); task.wait()
                end
            end)
        end;
    };

    Tasks = {
        ReloadGun = function(arg, arg2)
            if not arg then
                return
            end
            task.spawn(function()
                local tool = arg.Name
                while wait() do
                    local findchild = LocalPlayer.Character:FindFirstChild(tool) or LocalPlayer.Backpack:FindFirstChild(tool)
                    if findchild then
                        if LocalPlayer.Character:FindFirstChild(tool) then
                            Rstorage.ReloadEvent:FireServer(findchild)
                        elseif arg2 then break end
                    else break end
                end
            end)
        end;
    };

    task.spawn(function()
        local task0 = function()
            if Loops.KillTeams.All then
                Gun("AK-47")
                MultiKill(Players)
                wait(CPing(nil, true) / 2)
            else
                if next(Loops.Kill) then
                    for i,v in next, Loops.Kill do
                        if v and v.Character and not Saved.KillDebounce[v.Name] then
                            if v.Character:FindFirstChild("Humanoid") and not (v.Character:FindFirstChild("Humanoid").Health == 0 or v.Character:FindFirstChildWhichIsA("ForceField")) then
                                Saved.KillDebounce[v.Name] = true
                                coroutine.wrap(function()
                                    if RTPing() then
                                        Saved.KillDebounce[v.Name] = nil
                                    end
                                end)()
                                KillPL(v)
                                deprint("Debug_killed player loopkills")
                            end
                        end
                    end
                end
                if Loops.KillTeams.Inmates then
                    if not SavedArgs.KillDebounceInmate then
                        SavedArgs.KillDebounceInmate = true
                        task.delay(0.09, function()
                            RTPing(); SavedArgs.KillDebounceInmate = nil
                        end)
                        MultiKill(Teams.Inmates)
                    end
                end
                if Loops.KillTeams.Guards then
                    if not SavedArgs.KillDebounceGuard then
                        SavedArgs.KillDebounceGuard = true
                        task.delay(0.09, function()
                            RTPing(); SavedArgs.KillDebounceGuard = nil
                        end)
                        MultiKill(Teams.Guards)
                    end
                end
                if Loops.KillTeams.Criminals then
                    if not SavedArgs.KillDebounceCriminal then
                        SavedArgs.KillDebounceCriminal = true
                        task.delay(0.09, function()
                            RTPing(); SavedArgs.KillDebounceCriminal = nil
                        end)
                        MultiKill(Teams.Criminals)
                    end
                end
                if Loops.KillTeams.Neutrals then
                    if not SavedArgs.KillDebounceNeutral then
                        SavedArgs.KillDebounceNeutral = true
                        task.delay(0.35, function()
                            SavedArgs.KillDebounceNeutral = nil
                        end)
                        MultiKill(Teams.Neutral)
                    end
                end
            end
        end
        while task.wait() do
            pcall(task0)
            if Unloaded then
                break
            end
        end
    end)
    --Killauras and antitouch
    task.spawn(function()
        local task0 = function()
            local KillPlayers = {};
            if next(Powers.Killauras) then
                for i,v in next, Powers.Killauras do
                    if v.Character then
                        local VHead = v.Character:FindFirstChild("Head")
                        for _, Targets in pairs(Players:GetPlayers()) do
                            if Targets ~= v and Targets.Character and not Targets.Character:FindFirstChildWhichIsA("ForceField") and Targets.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 then
                                local THead = Targets.Character:FindFirstChild("Head")
                                if VHead and THead and CheckWhitelist(Targets) and Targets ~= LocalPlayer then
                                    if (THead.Position-VHead.Position).Magnitude <= Settings.KillauraThreshold then
                                        KillPlayers[#KillPlayers+1] = Targets
                                    end
                                end
                            end
                        end
                    end
                end
            end
            if next(Powers.Antitouch) then
                for i,v in next, Powers.Antitouch do
                    if v.Character and v.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 then
                        local VPart = v.Character:FindFirstChildWhichIsA("BasePart")
                        for _, Targets in pairs(Players:GetPlayers()) do
                            if Targets ~= v and Targets.Character and not Targets.Character:FindFirstChildWhichIsA("ForceField") and Targets.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 then
                                local TPart = Targets.Character:FindFirstChildWhichIsA("BasePart")
                                if VPart and TPart and CheckWhitelist(Targets) and Targets ~= LocalPlayer then
                                    if (TPart.Position-VPart.Position).Magnitude <= 2.5 then
                                        KillPlayers[#KillPlayers+1] = Targets
                                    end
                                end
                            end
                        end
                    end
                end
            end
            if next(Powers.Antiarrest) then
                for i,v in next, Powers.Antiarrest do
                    if v.Character and v.TeamColor.Name ~= "Bright blue" then
                        local VPart = v.Character:FindFirstChild("Head")
                        for _, Cunts in pairs(Teams.Guards:GetPlayers()) do
                            if Cunts.Character and Cunts.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 and Cunts ~= LocalPlayer and CheckWhitelist(Cunts) then
                                local CPart = Cunts.Character and Cunts.Character:FindFirstChild("Head")
                                if VPart and CPart then
                                    if Cunts.Character:FindFirstChild("Handcuffs") and (CPart.Position-VPart.Position).Magnitude < 20 or Cunts.Character:FindFirstChild("Taser") and (CPart.Position-VPart.Position).Magnitude < 30 then
                                        KillPlayers[#KillPlayers+1] = Cunts
                                    end
                                end
                            end
                        end
                    end
                end
            end
            if next(Powers.Antipunch) then
                for i,v in next, Powers.Antipunch do
                    if v.Character then
                        local VPart = v.Character:FindFirstChildWhichIsA("BasePart")
                        for _, Hostiles in pairs(Players:GetPlayers()) do
                            if Hostiles ~= v and Hostiles.Character and not Hostiles.Character:FindFirstChildWhichIsA("ForceField") and Hostiles.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 then
                                local HPart = Hostiles.Character:FindFirstChildWhichIsA("BasePart")
                                if VPart and HPart and CheckWhitelist(Hostiles) and Hostiles ~= LocalPlayer then
                                    if (HPart.Position-VPart.Position).Magnitude <= 4 then
                                        for _, tracks in ipairs(Hostiles.Character:FindFirstChild("Humanoid"):GetPlayingAnimationTracks()) do
                                            if table.find(Saved.HostileAnimations, tracks.Animation.AnimationId) then
                                                KillPlayers[#KillPlayers+1] = Hostiles
                                                break
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            if next(Powers.Onepunch) then
                for i,v in next, Powers.Onepunch do
                    if v.Character then
                        local waspunching = nil
                        for _, tracks in ipairs(v.Character:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks()) do
                            if tracks.Animation.AnimationId == "rbxassetid://484200742" or tracks.Animation.AnimationId == "rbxassetid://484926359" then
                                waspunching = true
                                break
                            end
                        end
                        if waspunching then
                            local VPart = v.Character:FindFirstChildWhichIsA("BasePart")
                            for _, targets in pairs(Players:GetPlayers()) do
                                if targets ~= v and targets.Character and targets.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 and not targets.Character:FindFirstChildWhichIsA("ForceField") then
                                    local TPart = targets.Character:FindFirstChildWhichIsA("BasePart")
                                    if VPart and TPart and CheckWhitelist(targets) and targets ~= LocalPlayer then
                                        if (VPart.Position-TPart.Position).Magnitude <= 3 then
                                            KillPlayers[#KillPlayers+1] = targets
                                            break
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            if next(Powers.Punchaura) then
                for i,v in next, Powers.Punchaura do
                    if v.Character then
                        local waspunching = nil
                        for _, track in ipairs(v.Character:FindFirstChild("Humanoid"):GetPlayingAnimationTracks()) do
                            if track.Animation.AnimationId == "rbxassetid://484200742" or track.Animation.AnimationId == "rbxassetid://484926359" then
                                waspunching = true
                                break
                            end
                        end
                        if waspunching then
                            local VHead = v.Character:FindFirstChild("Head")
                            for _, Victims in pairs(Players:GetPlayers()) do
                                if Victims ~= v and Victims.Character and not Victims.Character:FindFirstChildWhichIsA("ForceField") and Victims.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 then
                                    local VTHead = Victims.Character:FindFirstChild("Head")
                                    if VTHead and VHead and CheckWhitelist(Victims) and Victims ~= LocalPlayer then
                                        if (VTHead.Position-VHead.Position).Magnitude <= 16 then
                                            if Powers.Onepunch[v.UserId] then
                                                KillPlayers[#KillPlayers+1] = Victims
                                            else
                                                if not SavedArgs.PauraDebounce then
                                                    SavedArgs.PauraDebounce = true
                                                    task.delay(1, function()
                                                        SavedArgs.PauraDebounce = nil
                                                    end)
                                                    KillPL(Victims, 1, false)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            if next(KillPlayers) then
                TableKill(KillPlayers)
            end
            KillPlayers = nil
        end
        while task.wait() do
            pcall(task0)
            if Unloaded then
                break
            end
        end
    end)
    --Loops (Teleport)
    task.spawn(function()
        local task0 = function()
            if Loops.MeleeTeams.All then
                for i,v in pairs(Players:GetPlayers()) do
                    if v.Character and v ~= LocalPlayer and CheckWhitelist(v) then
                        if not (v.Character:FindFirstChildWhichIsA("ForceField") or v.Character:FindFirstChild("Humanoid").Health == 0) then
                            SavedPositions.MeleeLK = not SavedPositions.MeleeLK and LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame or SavedPositions.MeleeLK
                            MeleeKill(v, false)
                        end
                        if not Loops.MeleeTeams.All then
                            break
                        end
                    end
                end
            else
                if next(Loops.MeleeKill) then
                    for i,v in next, Loops.MeleeKill do
                        if v.Character and v.Character:FindFirstChild("Humanoid") then
                            if not (v.Character:FindFirstChildWhichIsA("ForceField") or v.Character:FindFirstChild("Humanoid").Health == 0) then
                                SavedPositions.MeleeLK = not SavedPositions.MeleeLK and LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame or SavedPositions.MeleeLK
                                MeleeKill(v)
                            end
                        end
                    end
                end
                if Loops.MeleeTeams.Inmates then
                    for i,v in pairs(Teams.Inmates:GetPlayers()) do
                        if v.Character and v ~= LocalPlayer and CheckWhitelist(v) then
                            if not (v.Character:FindFirstChildWhichIsA("ForceField") or v.Character:FindFirstChild("Humanoid").Health == 0) then
                                SavedPositions.MeleeLK = not SavedPositions.MeleeLK and LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame or SavedPositions.MeleeLK
                                MeleeKill(v, false)
                            end
                        end
                        if not Loops.MeleeTeams.Inmates then
                            break
                        end
                    end
                end
                if Loops.MeleeTeams.Guards then
                    for i,v in pairs(Teams.Guards:GetPlayers()) do
                        if v.Character and v ~= LocalPlayer and CheckWhitelist(v) then
                            if not (v.Character:FindFirstChildWhichIsA("ForceField") or v.Character:FindFirstChild("Humanoid").Health == 0) then
                                SavedPositions.MeleeLK = not SavedPositions.MeleeLK and LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame or SavedPositions.MeleeLK
                                MeleeKill(v, false)
                            end
                        end
                        if not Loops.MeleeTeams.Guards then
                            break
                        end
                    end
                end
                if Loops.MeleeTeams.Criminals then
                    for i,v in pairs(Teams.Criminals:GetPlayers()) do
                        if v.Character and v ~= LocalPlayer and CheckWhitelist(v) then
                            if not (v.Character:FindFirstChildWhichIsA("ForceField") or v.Character:FindFirstChild("Humanoid").Health == 0) then
                                SavedPositions.MeleeLK = not SavedPositions.MeleeLK and LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame or SavedPositions.MeleeLK
                                MeleeKill(v, false)
                            end
                        end
                        if not Loops.MeleeTeams.Criminals then
                            break
                        end
                    end
                end
                if Loops.MeleeTeams.Neutrals then
                    for i,v in pairs(Teams.Neutral:GetPlayers()) do
                        if v.Character and v ~= LocalPlayer and CheckWhitelist(v) then
                            if not (v.Character:FindFirstChildWhichIsA("ForceField") or v.Character:FindFirstChild("Humanoid").Health == 0) then
                                SavedPositions.MeleeLK = not SavedPositions.MeleeLK and LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame or SavedPositions.MeleeLK
                                MeleeKill(v, false)
                            end
                        end
                        if not Loops.MeleeTeams.Neutrals then
                            break
                        end
                    end
                end
            end
            if SavedPositions.MeleeLK then
                LocTP(SavedPositions.MeleeLK); SavedPositions.MeleeLK = nil
            end
            if next(Loops.Fling) then
                for i,v in next, Loops.Fling do
                    if v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v ~= LocalPlayer then
                        if not (v.Character:FindFirstChild("Humanoid").Health == 0 or v.TeamColor == BrickColor.new("Medium stone grey")) and not (v.Character:FindFirstChild("Head").Position.Y > 699 or v.Character:FindFirstChild("Head").Position.Y < 1) then
                            FlingPL(v)
                        end
                    end
                end
            end
            if next(Loops.MakeCrim) then
                for i,v in next, Loops.MakeCrim do
                    if v.Character and v.TeamColor.Name ~= "Really red" then
                        if not (v.Character:FindFirstChild("Humanoid").Health == 0 or v.TeamColor == BrickColor.new("Medium stone grey")) then
                            if v ~= LocalPlayer then
                                SavedPositions.LoopMakeCrim = not SavedPositions.LoopMakeCrim and LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame or SavedPositions.LoopMakeCrim
                                MakeCrim(v)
                            else TeamTo("criminal"); end
                        end
                    end
                end
                if SavedPositions.LoopMakeCrim then
                    LAction("unsit", true); LocTP(SavedPositions.LoopMakeCrim); SavedPositions.LoopMakeCrim = nil
                end
            end
            if next(Loops.Arrest) then
                for i,v in next, Loops.Arrest do
                    if v.Character and not (v.Character:FindFirstChild("Humanoid").Health == 0 or v.Character.Head:FindFirstChild("handcuffedGui")) then
                        if v.TeamColor == BrickColor.new("Really red") or (v.TeamColor == BrickColor.new("Bright orange") and GetIllegalReg(v)) then
                            ArrestPL(v, true, false)
                        elseif v.TeamColor.Name ~= "Medium stone grey" then
                            MakeCrim(v, true, false, true)
                        end
                    end
                end
            end
            if Loops.ArrestTeams.Inmate then
                for i,v in pairs(Teams.Inmates:GetPlayers()) do
                    if v.Character and not (v.Character:FindFirstChild("Humanoid").Health == 0 or v.Character.Head:FindFirstChild("handcuffedGui")) then
                        SavedPositions.ArrestTeams = not SavedPositions.ArrestTeams and LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame or SavedPositions.ArrestTeams
                        if GetIllegalReg(v) then
                            ArrestPL(v, false, false)
                        else
                            MakeCrim(v, false, false, true)
                        end
                    end
                end
            end
            if Loops.ArrestTeams.Criminal then
                for i,v in pairs(Teams.Criminals:GetPlayers()) do
                    if v.Character and not (v.Character:FindFirstChild("Humanoid").Health == 0 or v.Character.Head:FindFirstChild("handcuffedGui")) then
                        SavedPositions.ArrestTeams = not SavedPositions.ArrestTeams and LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame or SavedPositions.ArrestTeams
                        ArrestPL(v, false)
                    end
                end
            end
            if Loops.ArrestTeams.Guard then
                for i,v in pairs(Teams.Guards:GetPlayers()) do
                    if v.Character and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                        SavedPositions.ArrestTeams = not SavedPositions.ArrestTeams and LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame or SavedPositions.ArrestTeams
                        MakeCrim(v, false, false, true)
                    end
                end
            end
            if SavedPositions.ArrestTeams then
                if LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                    LAction("unsit", true)
                end; LocTP(SavedPositions.ArrestTeams); SavedPositions.ArrestTeams = nil
            end
            if Loops.AutoArresting.All then
                for i,v in pairs(Players:GetPlayers()) do
                    if v.Character and v ~= LocalPlayer and CheckWhitelist(v) and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                        if not v.Character.Head:FindFirstChild("handcuffedGui") then
                            if (v.TeamColor == BrickColor.new("Bright orange") and GetIllegalReg(v)) or v.TeamColor == BrickColor.new("Really red") then
                                SavedPositions.AutoArresting = not SavedPositions.AutoArresting and LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame or SavedPositions.AutoArresting
                                ArrestPL(v, false, false)
                            end
                        end
                    end
                end
            else
                if next(Loops.AutoArresting.Plr) then
                    for i,v in next, Loops.AutoArresting.Plr do
                        if v.Character and not (v == LocalPlayer or v.Character:FindFirstChild("Humanoid").Health == 0) and CheckWhitelist(v) then
                            if not v.Character.Head:FindFirstChild("handcuffedGui") then
                                if (v.TeamColor == BrickColor.new("Bright orange") and GetIllegalReg(v)) or v.TeamColor == BrickColor.new("Really red") then
                                    SavedPositions.AutoArresting = not SavedPositions.AutoArresting and LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame or SavedPositions.AutoArresting
                                    ArrestPL(v, false, false)
                                end
                            end
                        end
                    end
                end
            end
            if SavedPositions.AutoArresting then
                LocTP(SavedPositions.AutoArresting); SavedPositions.AutoArresting = nil
            end
            if next(Loops.VoidKill) then
                for i,v in next, Loops.VoidKill do
                    if v.Character and v.Character:FindFirstChild("Head").Position.Y > 1 and v.Character:FindFirstChild("Humanoid").Health ~= 0 and v.TeamColor.Name ~= "Medium stone grey" and not v.Character.Humanoid.Sit then
                        if States.AntiVoid then
                            task.delay(8,function()States.AntiVoid = true;end);States.AntiVoid = false
                        end
                        local tempos = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
                        BringPL(v,CFrame.new(0, -320, 0),true,true);wait(.2);LAction("unsit",true)
                        LocTP(CFrame.new(-190.722427,54.774929,1880.20374,0.007893865,6.46408438e-08,0.999968827,-3.42371038e-08,1,-6.43725926e-08,-0.999968827,-3.37278863e-08,0.007893865))
                        RTPing();RTPing();RTPing();RTPing();LocTP(tempos)
                    end
                end
            end
            if next(Loops.Trapped) then
                for i,v in next, Loops.Trapped do
                    if v.Character and not (v.Character:FindFirstChild("Humanoid").Health == 0 or v.Character.Humanoid.Sit or v.TeamColor.Name == "Medium stone grey") then
                        if v.Character:FindFirstChild("HumanoidRootPart") and (v.Character.HumanoidRootPart.Position-Teleports.trapbuilding.Position).Magnitude > 90 then
                            SavedPositions.TrapPlayerPos = not SavedPositions.TrapPlayerPos and LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame or SavedPositions.TrapPlayerPos
                            BringPL(v, Teleports.trapbuilding, true)
                        end
                    end
                end
                if SavedPositions.TrapPlayerPos then
                    wait(.2); LAction("unsit", true); LocTP(SavedPositions.TrapPlayerPos); SavedPositions.TrapPlayerPos = nil
                end
            end
            if next(Loops.Voided) then
                for i,v in next, Loops.Voided do
                    if v.Character and not (v.Character:FindFirstChildOfClass("Humanoid").Health == 0 or v.Character:FindFirstChild("Humanoid").Sit or v.TeamColor.Name == "Medium stone grey") then
                        if v.Character:FindFirstChild("Head") and v.Character.Head.Position.Y < 699 then
                            local tempos = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
                            BringPL(v, CFrame.new(0, 9e9, 0), true, true)
                            wait(.2); Tasks.Refresh(nil, tempos)
                        end
                    end
                end
            end
            if next(Loops.PunchKill) then
                for i,v in next, Loops.PunchKill do
                    if v.Character and not (v.Character:FindFirstChildWhichIsA("ForceField") or v.Character:FindFirstChild("Humanoid").Health == 0) then
                        PunchKill(v, 0.1)
                    end
                end
            end
            if next(Loops.CarFling) then
                for i,v in next, Loops.CarFling do
                    if v.Character then
                        if not (v.TeamColor == BrickColor.new("Medium stone grey") or v.Character:FindFirstChild("Humanoid").Health == 0 or v.Character.Humanoid.Sit) and v.Character:FindFirstChild("Head").Position.Y < 999 then
                            CarFlingPL(v)
                        end
                    end
                end
            end
        end
        while task.wait() do
            pcall(task0)
            if Unloaded then
                break
            end
        end
    end)
    loadstring(game:HttpGet('https://gist.githubusercontent.com/devguy100/d072e90c00da292e695b3748c1361499/raw/5e741bf486d8773b97129d48ed98988f6ac942e7/cmdlist.txt'))()
    --Loops (MeleeAura and stuff)
    task.spawn(function()
        local task0 = function()
            if Toggles.MeleeAura then
                wait()
                for i,v in pairs(Players:GetPlayers()) do
                    if v.Character and v ~= LocalPlayer then
                        if not (v.Character:FindFirstChild("Humanoid").Health == 0 or v.Character:FindFirstChildWhichIsA("ForceField")) and CheckWhitelist(v) then
                            MeleEve(v);task.delay(0,function() MeleEve(v); end)
                        end
                    end
                end
            else
                if Toggles.MeleeTouch then
                    for i,v in pairs(Players:GetPlayers()) do
                        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChildOfClass("Humanoid") then
                            if not (v.Character:FindFirstChildWhichIsA("ForceField") or v.Character:FindFirstChildOfClass("Humanoid").Health == 0) then
                                local VPart, LPart = v.Character:FindFirstChildWhichIsA("BasePart"), LocalPlayer.Character:FindFirstChildWhichIsA("BasePart")
                                if VPart and LPart and CheckWhitelist(v) then
                                    if (VPart.Position-LPart.Position).Magnitude <= 2.5 then
                                        for i = 1, 5 do
                                            MeleEve(v)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                if Toggles.AntiPunch then
                    for i,v in pairs(Players:GetPlayers()) do
                        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                            local VHead, LHead = v.Character:FindFirstChild("Head"), LocalPlayer.Character:FindFirstChild("Head")
                            if VHead and LHead and CheckWhitelist(v) then
                                if (VHead.Position-LHead.Position).Magnitude <= 5 then
                                    local VHuman = v.Character:FindFirstChildOfClass("Humanoid")
                                    for _, punch in ipairs(VHuman:GetPlayingAnimationTracks()) do
                                        if table.find(Saved.HostileAnimations, punch.Animation.AnimationId) then
                                            for i = 1, 15 do
                                                MeleEve(v)
                                            end
                                            break
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                if Toggles.TKA.Guard then
                    for i,v in pairs(Teams.Guards:GetPlayers()) do
                        if v.Character and v ~= LocalPlayer and not (v.Character:FindFirstChild("Humanoid").Health == 0 or v.Character:FindFirstChildWhichIsA("ForceField")) then
                            local LHead, VHead = LocalPlayer.Character:FindFirstChild("Head"), v.Character:FindFirstChild("Head")
                            if LHead and VHead and CheckWhitelist(v) then
                                if (LHead.Position-VHead.Position).Magnitude <= 17 then
                                    for i = 1, 7 do
                                        MeleEve(v)
                                    end
                                end
                            end
                        end
                    end
                else
                    if Toggles.AntiArrest then
                        for _, PotangIna in pairs(Teams.Guards:GetPlayers()) do
                            if PotangIna.Character and PotangIna ~= LocalPlayer then
                                if PotangIna.Character:FindFirstChild("Handcuffs") and PotangIna.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 then
                                    local PPart, LPart = PotangIna.Character.PrimaryPart, LocalPlayer.Character.PrimaryPart
                                    if PPart and LPart and CheckWhitelist(PotangIna) then
                                        if (PPart.Position-LPart.Position).Magnitude <= 20 then
                                            for i = 1, 10 do
                                                MeleEve(PotangIna)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                if Toggles.TKA.Inmate then
                    for i,v in pairs(Teams.Inmates:GetPlayers()) do
                        if v.Character and v ~= LocalPlayer and not (v.Character:FindFirstChild("Humanoid").Health == 0 or v.Character:FindFirstChildWhichIsA("ForceField")) then
                            local LHead, VHead = LocalPlayer.Character:FindFirstChild("Head"), v.Character:FindFirstChild("Head")
                            if LHead and VHead and CheckWhitelist(v) then
                                if (LHead.Position-VHead.Position).Magnitude <= 17 then
                                    for i = 1, 7 do
                                        MeleEve(v)
                                    end
                                end
                            end
                        end
                    end
                end
                if Toggles.TKA.Criminal then
                    for i,v in pairs(Teams.Criminals:GetPlayers()) do
                        if v.Character and v ~= LocalPlayer and not (v.Character:FindFirstChild("Humanoid").Health == 0 or v.Character:FindFirstChildWhichIsA("ForceField")) then
                            local LHead, VHead = LocalPlayer.Character:FindFirstChild("Head"), v.Character:FindFirstChild("Head")
                            if LHead and VHead and CheckWhitelist(v) then
                                if (LHead.Position-VHead.Position).Magnitude <= 17 then
                                    for i = 1, 7 do
                                        MeleEve(v)
                                    end
                                end
                            end
                        end
                    end
                end
                if Toggles.TKA.Enemies then
                    for i,v in pairs(Players:GetPlayers()) do
                        if v.Character and v ~= LocalPlayer and not (v.Character:FindFirstChild("Humanoid").Health == 0 or v.Character:FindFirstChildWhichIsA("ForceField")) then
                            if v.TeamColor ~= LocalPlayer.TeamColor then
                                local LHead, VHead = LocalPlayer.Character:FindFirstChild("Head"), v.Character:FindFirstChild("Head")
                                if LHead and VHead and CheckWhitelist(v) then
                                    if (LHead.Position-VHead.Position).Magnitude <= 17 then
                                        for i = 1, 7 do
                                            MeleEve(v)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        while task.wait() do
            pcall(task0)
            if Unloaded then
                break
            end
        end
    end)
    --Loops (Non-interfering)
    task.spawn(function()
        local task0 = function()
            if Toggles.AntiBring and not States.IsBringing and LocalPlayer.Character:FindFirstChild("Humanoid").Sit then LAction("unsit") end
            if States.JumpPower then LAction("jumppw", Saved.JumpPower); end
            if States.Speeding then
                LAction("speed", Saved.WalkSpeed)
            elseif States.Running then
                if not (LocalPlayer.Character:FindFirstChild("Humanoid").WalkSpeed == Saved.RunSpeed) then
                    LAction("speed", Saved.RunSpeed)
                end
            end
            if States.IsHoldingF then
                if Toggles.SpamPunch then
                    task.wait();VirtualPunch()
                end
            end
            if Toggles.Noclip then
                for i,v in pairs(LocalPlayer.Character:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end
        while wait() do
            game:GetService('StarterGui'):SetCoreGuiEnabled('Backpack', true)
            if States.RemoveLeaderboard then 
                game:GetService('StarterGui'):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
            end
            pcall(task0)
            if next(CmdQueue) then
                if not SavedArgs.QueueExecuted then
                    SavedArgs.QueueExecuted = true
                    coroutine.wrap(function()
                        for i, execute in next, CmdQueue do
                            pcall(execute);wait()
                            CmdQueue[i] = nil;table.remove(CmdQueue, i)
                        end;SavedArgs.QueueExecuted = nil
                    end)()
                end
            end
            if Unloaded then
                break
            end
        end
    end)
end;
task.spawn(C_23);

return G2L["1"], require;
