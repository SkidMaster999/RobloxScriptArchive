--https://github.com/Chaosscripter/Prison-Life-Admin-Commands/blob/main/Prison%20Life%20Admin%20Commands.lua
--[[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]]

-- Instances: 56 | Scripts: 1 | Modules: 0 | Tags: 0
local G2L = {};

-- StarterGui.CorgiSideAdminGUI
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["Name"] = [[CorgiSideAdminGUI]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


-- StarterGui.CorgiSideAdminGUI.MainFrame
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["Active"] = true;
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
G2L["2"]["Selectable"] = true;
G2L["2"]["Size"] = UDim2.new(0, 399, 0, 449);
G2L["2"]["Position"] = UDim2.new(0, 501, 0, 154);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Name"] = [[MainFrame]];


-- StarterGui.CorgiSideAdminGUI.MainFrame.Title
G2L["3"] = Instance.new("TextLabel", G2L["2"]);
G2L["3"]["TextWrapped"] = true;
G2L["3"]["TextStrokeTransparency"] = 0;
G2L["3"]["BorderSizePixel"] = 0;
G2L["3"]["TextSize"] = 25;
G2L["3"]["TextScaled"] = true;
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(105, 105, 105);
G2L["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3"]["Size"] = UDim2.new(0, 399, 0, 45);
G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["Text"] = [[Prison Life Admin Commands Mod]];
G2L["3"]["Name"] = [[Title]];


-- StarterGui.CorgiSideAdminGUI.MainFrame.Title.UIAspectRatioConstraint
G2L["4"] = Instance.new("UIAspectRatioConstraint", G2L["3"]);
G2L["4"]["AspectRatio"] = 8.69565;


-- StarterGui.CorgiSideAdminGUI.MainFrame.Title.UITextSizeConstraint
G2L["5"] = Instance.new("UITextSizeConstraint", G2L["3"]);
G2L["5"]["MaxTextSize"] = 25;


-- StarterGui.CorgiSideAdminGUI.MainFrame.CommandsFrame
G2L["6"] = Instance.new("ScrollingFrame", G2L["2"]);
G2L["6"]["Active"] = true;
G2L["6"]["BorderSizePixel"] = 0;
G2L["6"]["CanvasSize"] = UDim2.new(0, 0, 0.2, 0);
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6"]["Name"] = [[CommandsFrame]];
G2L["6"]["Size"] = UDim2.new(0, 399, 0, 351);
G2L["6"]["Position"] = UDim2.new(0, 0, 0, 97);
G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["BackgroundTransparency"] = 1;


-- StarterGui.CorgiSideAdminGUI.MainFrame.CommandsFrame.ReferenceCommand
G2L["7"] = Instance.new("TextButton", G2L["6"]);
G2L["7"]["TextWrapped"] = true;
G2L["7"]["TextStrokeTransparency"] = 0;
G2L["7"]["BorderSizePixel"] = 0;
G2L["7"]["TextColor3"] = Color3.fromRGB(186, 186, 186);
G2L["7"]["TextSize"] = 14;
G2L["7"]["TextScaled"] = true;
G2L["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["7"]["Size"] = UDim2.new(0, 347, 0, 45);
G2L["7"]["BackgroundTransparency"] = 1;
G2L["7"]["Name"] = [[ReferenceCommand]];
G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7"]["Text"] = [[Reference Command]];
G2L["7"]["Visible"] = false;
G2L["7"]["Position"] = UDim2.new(0, 25, 0, 0);


-- StarterGui.CorgiSideAdminGUI.MainFrame.CommandsFrame.ReferenceCommand.UIAspectRatioConstraint
G2L["8"] = Instance.new("UIAspectRatioConstraint", G2L["7"]);
G2L["8"]["AspectRatio"] = 7.71111;


-- StarterGui.CorgiSideAdminGUI.MainFrame.CommandsFrame.ReferenceCommand.UITextSizeConstraint
G2L["9"] = Instance.new("UITextSizeConstraint", G2L["7"]);
G2L["9"]["MaxTextSize"] = 45;


-- StarterGui.CorgiSideAdminGUI.MainFrame.CommandsFrame.CommandLayout
G2L["a"] = Instance.new("UIListLayout", G2L["6"]);
G2L["a"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["a"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["a"]["Name"] = [[CommandLayout]];


-- StarterGui.CorgiSideAdminGUI.MainFrame.CommandsFrame.UIAspectRatioConstraint
G2L["b"] = Instance.new("UIAspectRatioConstraint", G2L["6"]);
G2L["b"]["AspectRatio"] = 1.13636;


-- StarterGui.CorgiSideAdminGUI.MainFrame.SearchBox
G2L["c"] = Instance.new("TextBox", G2L["2"]);
G2L["c"]["TextStrokeTransparency"] = 0;
G2L["c"]["Name"] = [[SearchBox]];
G2L["c"]["BorderSizePixel"] = 0;
G2L["c"]["TextWrapped"] = true;
G2L["c"]["TextSize"] = 14;
G2L["c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["c"]["TextScaled"] = true;
G2L["c"]["BackgroundColor3"] = Color3.fromRGB(61, 61, 61);
G2L["c"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);
G2L["c"]["ClearTextOnFocus"] = false;
G2L["c"]["PlaceholderText"] = [[Search For A Command]];
G2L["c"]["Size"] = UDim2.new(0, 289, 0, 35);
G2L["c"]["Position"] = UDim2.new(0, 54, 0, 58);
G2L["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["c"]["Text"] = [[]];


-- StarterGui.CorgiSideAdminGUI.MainFrame.SearchBox.UIStroke
G2L["d"] = Instance.new("UIStroke", G2L["c"]);
G2L["d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["d"]["Color"] = Color3.fromRGB(255, 62, 65);


-- StarterGui.CorgiSideAdminGUI.MainFrame.SearchBox.UIAspectRatioConstraint
G2L["e"] = Instance.new("UIAspectRatioConstraint", G2L["c"]);
G2L["e"]["AspectRatio"] = 8.25714;


-- StarterGui.CorgiSideAdminGUI.MainFrame.SearchBox.UITextSizeConstraint
G2L["f"] = Instance.new("UITextSizeConstraint", G2L["c"]);
G2L["f"]["MaxTextSize"] = 14;


-- StarterGui.CorgiSideAdminGUI.MainFrame.UIAspectRatioConstraint
G2L["10"] = Instance.new("UIAspectRatioConstraint", G2L["2"]);
G2L["10"]["AspectRatio"] = 0.88889;


-- StarterGui.CorgiSideAdminGUI.ExecuteFrame
G2L["11"] = Instance.new("Frame", G2L["1"]);
G2L["11"]["Active"] = true;
G2L["11"]["BorderSizePixel"] = 0;
G2L["11"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
G2L["11"]["Selectable"] = true;
G2L["11"]["Size"] = UDim2.new(0, 300, 0, 150);
G2L["11"]["Position"] = UDim2.new(0, 165, 0, 461);
G2L["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["11"]["Name"] = [[ExecuteFrame]];


-- StarterGui.CorgiSideAdminGUI.ExecuteFrame.Title
G2L["12"] = Instance.new("TextLabel", G2L["11"]);
G2L["12"]["TextWrapped"] = true;
G2L["12"]["TextStrokeTransparency"] = 0;
G2L["12"]["BorderSizePixel"] = 0;
G2L["12"]["TextSize"] = 35;
G2L["12"]["TextScaled"] = true;
G2L["12"]["BackgroundColor3"] = Color3.fromRGB(105, 105, 105);
G2L["12"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["12"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["12"]["Size"] = UDim2.new(0, 300, 0, 41);
G2L["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["12"]["Text"] = [[Execute Frame]];
G2L["12"]["Name"] = [[Title]];


-- StarterGui.CorgiSideAdminGUI.ExecuteFrame.Title.UIAspectRatioConstraint
G2L["13"] = Instance.new("UIAspectRatioConstraint", G2L["12"]);
G2L["13"]["AspectRatio"] = 7.31707;


-- StarterGui.CorgiSideAdminGUI.ExecuteFrame.Title.UITextSizeConstraint
G2L["14"] = Instance.new("UITextSizeConstraint", G2L["12"]);
G2L["14"]["MaxTextSize"] = 35;


-- StarterGui.CorgiSideAdminGUI.ExecuteFrame.CommandBox
G2L["15"] = Instance.new("TextBox", G2L["11"]);
G2L["15"]["Name"] = [[CommandBox]];
G2L["15"]["BorderSizePixel"] = 0;
G2L["15"]["TextWrapped"] = true;
G2L["15"]["TextSize"] = 14;
G2L["15"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["15"]["TextScaled"] = true;
G2L["15"]["BackgroundColor3"] = Color3.fromRGB(61, 61, 61);
G2L["15"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["15"]["ClearTextOnFocus"] = false;
G2L["15"]["Size"] = UDim2.new(0, 200, 0, 44);
G2L["15"]["Position"] = UDim2.new(0, 50, 0, 51);
G2L["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["15"]["Text"] = [[]];


-- StarterGui.CorgiSideAdminGUI.ExecuteFrame.CommandBox.Execute
G2L["16"] = Instance.new("TextButton", G2L["15"]);
G2L["16"]["TextWrapped"] = true;
G2L["16"]["BorderSizePixel"] = 0;
G2L["16"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["16"]["TextSize"] = 14;
G2L["16"]["TextScaled"] = true;
G2L["16"]["BackgroundColor3"] = Color3.fromRGB(71, 71, 71);
G2L["16"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["16"]["Size"] = UDim2.new(0, 144, 0, 35);
G2L["16"]["Name"] = [[Execute]];
G2L["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["16"]["Text"] = [[Execute]];
G2L["16"]["Position"] = UDim2.new(0.14, 0, 1.15556, 0);


-- StarterGui.CorgiSideAdminGUI.ExecuteFrame.CommandBox.UIStroke
G2L["17"] = Instance.new("UIStroke", G2L["15"]);
G2L["17"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["17"]["Color"] = Color3.fromRGB(52, 255, 83);


-- StarterGui.CorgiSideAdminGUI.ExecuteFrame.CommandBox.UIAspectRatioConstraint
G2L["18"] = Instance.new("UIAspectRatioConstraint", G2L["15"]);
G2L["18"]["AspectRatio"] = 4.44444;


-- StarterGui.CorgiSideAdminGUI.ExecuteFrame.CommandBox.UITextSizeConstraint
G2L["19"] = Instance.new("UITextSizeConstraint", G2L["15"]);
G2L["19"]["MaxTextSize"] = 14;


-- StarterGui.CorgiSideAdminGUI.ExecuteFrame.UIAspectRatioConstraint
G2L["1a"] = Instance.new("UIAspectRatioConstraint", G2L["11"]);
G2L["1a"]["AspectRatio"] = 2;


-- StarterGui.CorgiSideAdminGUI.OutputFrame
G2L["1b"] = Instance.new("Frame", G2L["1"]);
G2L["1b"]["Active"] = true;
G2L["1b"]["BorderSizePixel"] = 0;
G2L["1b"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
G2L["1b"]["Selectable"] = true;
G2L["1b"]["Size"] = UDim2.new(0, 300, 0, 154);
G2L["1b"]["Position"] = UDim2.new(0, 165, 0, 154);
G2L["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1b"]["Name"] = [[OutputFrame]];


-- StarterGui.CorgiSideAdminGUI.OutputFrame.Title
G2L["1c"] = Instance.new("TextLabel", G2L["1b"]);
G2L["1c"]["TextWrapped"] = true;
G2L["1c"]["TextStrokeTransparency"] = 0;
G2L["1c"]["BorderSizePixel"] = 0;
G2L["1c"]["TextSize"] = 35;
G2L["1c"]["TextScaled"] = true;
G2L["1c"]["BackgroundColor3"] = Color3.fromRGB(105, 105, 105);
G2L["1c"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1c"]["Size"] = UDim2.new(0, 300, 0, 41);
G2L["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1c"]["Text"] = [[Output]];
G2L["1c"]["Name"] = [[Title]];


-- StarterGui.CorgiSideAdminGUI.OutputFrame.Title.UIAspectRatioConstraint
G2L["1d"] = Instance.new("UIAspectRatioConstraint", G2L["1c"]);
G2L["1d"]["AspectRatio"] = 7.31707;


-- StarterGui.CorgiSideAdminGUI.OutputFrame.Title.UITextSizeConstraint
G2L["1e"] = Instance.new("UITextSizeConstraint", G2L["1c"]);
G2L["1e"]["MaxTextSize"] = 35;


-- StarterGui.CorgiSideAdminGUI.OutputFrame.Logs
G2L["1f"] = Instance.new("ScrollingFrame", G2L["1b"]);
G2L["1f"]["Active"] = true;
G2L["1f"]["BorderSizePixel"] = 0;
G2L["1f"]["CanvasSize"] = UDim2.new(0, 0, 0.1, 0);
G2L["1f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1f"]["Name"] = [[Logs]];
G2L["1f"]["Size"] = UDim2.new(0, 329, 0, 113);
G2L["1f"]["Position"] = UDim2.new(0, -14, 0, 41);
G2L["1f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1f"]["BackgroundTransparency"] = 1;


-- StarterGui.CorgiSideAdminGUI.OutputFrame.Logs.ReferenceMessage
G2L["20"] = Instance.new("TextLabel", G2L["1f"]);
G2L["20"]["TextWrapped"] = true;
G2L["20"]["TextStrokeTransparency"] = 0;
G2L["20"]["BorderSizePixel"] = 0;
G2L["20"]["TextSize"] = 1;
G2L["20"]["TextScaled"] = true;
G2L["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["20"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);
G2L["20"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["20"]["BackgroundTransparency"] = 1;
G2L["20"]["Size"] = UDim2.new(0, 277, 0, 38);
G2L["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["20"]["Text"] = [[Loaded Script Successfully!]];
G2L["20"]["Name"] = [[ReferenceMessage]];
G2L["20"]["Position"] = UDim2.new(0, 22, 0, 0);


-- StarterGui.CorgiSideAdminGUI.OutputFrame.Logs.ReferenceMessage.UIAspectRatioConstraint
G2L["21"] = Instance.new("UIAspectRatioConstraint", G2L["20"]);
G2L["21"]["AspectRatio"] = 7.28947;


-- StarterGui.CorgiSideAdminGUI.OutputFrame.Logs.ReferenceMessage.UITextSizeConstraint
G2L["22"] = Instance.new("UITextSizeConstraint", G2L["20"]);
G2L["22"]["MaxTextSize"] = 24;


-- StarterGui.CorgiSideAdminGUI.OutputFrame.Logs.UIListLayout
G2L["23"] = Instance.new("UIListLayout", G2L["1f"]);
G2L["23"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["23"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.CorgiSideAdminGUI.OutputFrame.Logs.UIAspectRatioConstraint
G2L["24"] = Instance.new("UIAspectRatioConstraint", G2L["1f"]);
G2L["24"]["AspectRatio"] = 2.9115;


-- StarterGui.CorgiSideAdminGUI.OutputFrame.UIAspectRatioConstraint
G2L["25"] = Instance.new("UIAspectRatioConstraint", G2L["1b"]);
G2L["25"]["AspectRatio"] = 1.94805;


-- StarterGui.CorgiSideAdminGUI.ScriptClient
G2L["26"] = Instance.new("LocalScript", G2L["1"]);
G2L["26"]["Name"] = [[ScriptClient]];


-- StarterGui.CorgiSideAdminGUI.CreditsFrame
G2L["27"] = Instance.new("Frame", G2L["1"]);
G2L["27"]["Active"] = true;
G2L["27"]["BorderSizePixel"] = 0;
G2L["27"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
G2L["27"]["Selectable"] = true;
G2L["27"]["Size"] = UDim2.new(0, 300, 0, 154);
G2L["27"]["Position"] = UDim2.new(0, 893, 0, 153);
G2L["27"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["27"]["Name"] = [[CreditsFrame]];


-- StarterGui.CorgiSideAdminGUI.CreditsFrame.Title
G2L["28"] = Instance.new("TextLabel", G2L["27"]);
G2L["28"]["TextWrapped"] = true;
G2L["28"]["TextStrokeTransparency"] = 0;
G2L["28"]["BorderSizePixel"] = 0;
G2L["28"]["TextSize"] = 35;
G2L["28"]["TextScaled"] = true;
G2L["28"]["BackgroundColor3"] = Color3.fromRGB(105, 105, 105);
G2L["28"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["28"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["28"]["Size"] = UDim2.new(0, 300, 0, 41);
G2L["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["28"]["Text"] = [[Credits]];
G2L["28"]["Name"] = [[Title]];


-- StarterGui.CorgiSideAdminGUI.CreditsFrame.Title.UIAspectRatioConstraint
G2L["29"] = Instance.new("UIAspectRatioConstraint", G2L["28"]);
G2L["29"]["AspectRatio"] = 7.31707;


-- StarterGui.CorgiSideAdminGUI.CreditsFrame.Title.UITextSizeConstraint
G2L["2a"] = Instance.new("UITextSizeConstraint", G2L["28"]);
G2L["2a"]["MaxTextSize"] = 35;


-- StarterGui.CorgiSideAdminGUI.CreditsFrame.Logs
G2L["2b"] = Instance.new("ScrollingFrame", G2L["27"]);
G2L["2b"]["Active"] = true;
G2L["2b"]["BorderSizePixel"] = 0;
G2L["2b"]["CanvasSize"] = UDim2.new(0, 0, 0.1, 0);
G2L["2b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2b"]["Name"] = [[Logs]];
G2L["2b"]["Size"] = UDim2.new(0, 329, 0, 113);
G2L["2b"]["Position"] = UDim2.new(0, -14, 0, 41);
G2L["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2b"]["BackgroundTransparency"] = 1;


-- StarterGui.CorgiSideAdminGUI.CreditsFrame.Logs.ReferenceMessage
G2L["2c"] = Instance.new("TextLabel", G2L["2b"]);
G2L["2c"]["TextWrapped"] = true;
G2L["2c"]["TextStrokeTransparency"] = 0;
G2L["2c"]["BorderSizePixel"] = 0;
G2L["2c"]["TextSize"] = 1;
G2L["2c"]["TextScaled"] = true;
G2L["2c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2c"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);
G2L["2c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2c"]["BackgroundTransparency"] = 1;
G2L["2c"]["Size"] = UDim2.new(0, 277, 0, 54);
G2L["2c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2c"]["Text"] = [[PrizzLife Owner Credits For Kill Scripts!]];
G2L["2c"]["Name"] = [[ReferenceMessage]];
G2L["2c"]["Position"] = UDim2.new(0, 25, 0, 0);


-- StarterGui.CorgiSideAdminGUI.CreditsFrame.Logs.ReferenceMessage.UIAspectRatioConstraint
G2L["2d"] = Instance.new("UIAspectRatioConstraint", G2L["2c"]);
G2L["2d"]["AspectRatio"] = 5.12963;


-- StarterGui.CorgiSideAdminGUI.CreditsFrame.Logs.ReferenceMessage.UITextSizeConstraint
G2L["2e"] = Instance.new("UITextSizeConstraint", G2L["2c"]);
G2L["2e"]["MaxTextSize"] = 54;


-- StarterGui.CorgiSideAdminGUI.CreditsFrame.Logs.UIListLayout
G2L["2f"] = Instance.new("UIListLayout", G2L["2b"]);
G2L["2f"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["2f"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.CorgiSideAdminGUI.CreditsFrame.Logs.ReferenceMessage
G2L["30"] = Instance.new("TextLabel", G2L["2b"]);
G2L["30"]["TextWrapped"] = true;
G2L["30"]["TextStrokeTransparency"] = 0;
G2L["30"]["BorderSizePixel"] = 0;
G2L["30"]["TextSize"] = 1;
G2L["30"]["TextScaled"] = true;
G2L["30"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["30"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);
G2L["30"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["30"]["BackgroundTransparency"] = 1;
G2L["30"]["Size"] = UDim2.new(0, 277, 0, 54);
G2L["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["30"]["Text"] = [[Property Of CorgiScripter: DO NOT SKID]];
G2L["30"]["Name"] = [[ReferenceMessage]];
G2L["30"]["Position"] = UDim2.new(0, 25, 0, 0);


-- StarterGui.CorgiSideAdminGUI.CreditsFrame.Logs.ReferenceMessage.UIAspectRatioConstraint
G2L["31"] = Instance.new("UIAspectRatioConstraint", G2L["30"]);
G2L["31"]["AspectRatio"] = 5.12963;


-- StarterGui.CorgiSideAdminGUI.CreditsFrame.Logs.ReferenceMessage.UITextSizeConstraint
G2L["32"] = Instance.new("UITextSizeConstraint", G2L["30"]);
G2L["32"]["MaxTextSize"] = 52;


-- StarterGui.CorgiSideAdminGUI.CreditsFrame.Logs.UIAspectRatioConstraint
G2L["33"] = Instance.new("UIAspectRatioConstraint", G2L["2b"]);
G2L["33"]["AspectRatio"] = 2.9115;


-- StarterGui.CorgiSideAdminGUI.CreditsFrame.UIAspectRatioConstraint
G2L["34"] = Instance.new("UIAspectRatioConstraint", G2L["27"]);
G2L["34"]["AspectRatio"] = 1.94805;


-- StarterGui.CorgiSideAdminGUI.OpenButton
G2L["35"] = Instance.new("TextButton", G2L["1"]);
G2L["35"]["TextWrapped"] = true;
G2L["35"]["TextStrokeTransparency"] = 0;
G2L["35"]["BorderSizePixel"] = 0;
G2L["35"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["35"]["TextSize"] = 30;
G2L["35"]["TextScaled"] = true;
G2L["35"]["BackgroundColor3"] = Color3.fromRGB(105, 105, 105);
G2L["35"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["35"]["Size"] = UDim2.new(0, 162, 0, 44);
G2L["35"]["Name"] = [[OpenButton]];
G2L["35"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["35"]["Text"] = [[Admin Mod]];
G2L["35"]["Visible"] = false;
G2L["35"]["Position"] = UDim2.new(0, 27, 0, 653);


-- StarterGui.CorgiSideAdminGUI.OpenButton.UIStroke
G2L["36"] = Instance.new("UIStroke", G2L["35"]);
G2L["36"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["36"]["Thickness"] = 3;


-- StarterGui.CorgiSideAdminGUI.OpenButton.UIAspectRatioConstraint
G2L["37"] = Instance.new("UIAspectRatioConstraint", G2L["35"]);
G2L["37"]["AspectRatio"] = 3.68182;


-- StarterGui.CorgiSideAdminGUI.OpenButton.UITextSizeConstraint
G2L["38"] = Instance.new("UITextSizeConstraint", G2L["35"]);
G2L["38"]["MaxTextSize"] = 30;


-- StarterGui.CorgiSideAdminGUI.ScriptClient
local function C_26()
local script = G2L["26"];
	local UI = script.Parent
	
	local API = loadstring(game:HttpGet("https://raw.githubusercontent.com/raycast6000/gunner/main/main.lua"))()
	
	ExecuteFrame = UI.ExecuteFrame
	ExecuteFrame.Draggable = true
	MainFrame = UI.MainFrame
	MainFrame.Draggable = true
	OutPutFrame = UI.OutputFrame
	OutPutFrame.Draggable = true
	CreditsFrame = UI.CreditsFrame
	CreditsFrame.Draggable = true
	Open = UI.OpenButton
	
	Logs = OutPutFrame.Logs
	
	CommandsFrame = MainFrame.CommandsFrame
	SearchBox = MainFrame.SearchBox
	
	local ReferenceCommand = CommandsFrame.ReferenceCommand
	
	-- Dumps
	
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
	
	CommandBox = ExecuteFrame.CommandBox
	Execute = CommandBox.Execute
	
	local Unloaded = false
	local RegModule = nil
	
	if game.Players.LocalPlayer.PlayerGui:FindFirstChild("CorgiSideAdminGUI") then
		if game.Players.LocalPlayer.PlayerGui['CorgiSideAdminGUI'] ~= UI then
			game.Players.LocalPlayer.PlayerGui['CorgiSideAdminGUI']:Destroy()
		end
	end
	
	wait(0.05)
	
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "CorgiSide Exploits";
		Text = "Happy Exploiting!";
		Duration = 5;
		Icon = "rbxassetid://114193036129104"
	})
	
	local SavedArgs = {};
	
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
		AutoRespawn = true;
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
		SpamPunch = false;
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
		SoundSpam = false,
		LoopSounds = false
	};
	
	local SavedPositions = {};
	
	local Connections = {};
	
	local Whitelisted = {};
	local RankedPlrs = {};
	
	function LoadCommandsIntoMainFrame()
		for name, tblcommand in pairs(Commands) do
			if typeof(tblcommand) == "table" and tblcommand.Index and tblcommand.ExecuteCommand then
				local NewCommand = ReferenceCommand:Clone()
				NewCommand.Name = name
				NewCommand.Text = (table.concat(tblcommand.Index, " / "))
				NewCommand.Parent = CommandsFrame
				NewCommand.Visible = true
	
				CommandsFrame.CanvasSize = CommandsFrame.CanvasSize + UDim2.new(0, 0, 0.1, 0)
	
				NewCommand.Activated:Connect(function()
					CommandBox.Text = tblcommand.Index[1]
				end)
			end
		end
	end
	
	function CreateMessage(Message, error : boolean)
		local NewMessage = Logs.ReferenceMessage:Clone()
		NewMessage.Visible = true
		NewMessage.Parent = Logs
		NewMessage.Text = Message
		if error == true then
			NewMessage.TextColor3 = Color3.new(1, 0.164706, 0.180392)
		else
			NewMessage.TextColor3 = Color3.new(0.0666667, 1, 0)
		end
		Logs.CanvasSize = Logs.CanvasSize + UDim2.new(0, 0, 0.3, 0)
	end
	
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
		repeat Stepped:Wait() until source:FindFirstChild(args) or tick() - timeout >=0
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
		Rstep:Wait()
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
				for i = 1, 8 do Hbeat:Wait();human.Sit=false;Rstep:Wait();human.Sit=false;Stepped:Wait();human.Sit=false end
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
				Stepped:Wait()
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
		LocalPlayer.CharacterAdded:Wait(); waitfor(LocalPlayer.Character, "HumanoidRootPart", 5).CFrame = tempos; LoadCamPos()
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
		elseif LocalPlayer.TeamColor == BrickColor.new("Bright blue") then
			AK = LocalPlayer.Backpack:FindFirstChild("M9") or LocalPlayer.Character:FindFirstChild("M9")
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
							Hit = v.Character:FindFirstChildOfClass("Part");
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
	local lochar = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
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
				LocalPlayer.CharacterAdded:Wait()
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
						LocalPlayer.CharacterAdded:Wait(); waitfor(LocalPlayer.Character, "HumanoidRootPart", 1).CFrame = tempos; LoadCamPos()
						if wascriminal then
							TeamTo("criminal")
						end
					end); task.delay(0, function()
						LAction("speed", Saved.NormalSpeed); task.wait(0.03); LAction("jumppw", Saved.NormalJump)
					end)
				end
				if Toggles.AntiTase and des.Animation.AnimationId == "rbxassetid://279227693" then
					des:Stop(); des:Destroy()
					Hbeat:Wait(); LAction("speed", Saved.NormalSpeed); task.wait(0.03); LAction("jumppw", Saved.NormalJump)
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
		lochar = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
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
						LocalPlayer.CharacterAdded:Wait()
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
						TeamEve("Bright blue"); LocalPlayer.CharacterAdded:Wait()
						waitfor(LocalPlayer.Character, "HumanoidRootPart", 2).CFrame = temp; RTPing(0)
					end
					LAction("died")
					if Toggles.AutoRespawn then
						LocalPlayer.CharacterAdded:Wait(); waitfor(LocalPlayer.Character, "HumanoidRootPart", 2).CFrame = temp
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
						Hit = v.Character:FindFirstChildOfClass("Part");
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
	
	local FlingPlr = function()
	
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
				Car = game:GetService("Workspace").CarContainer.ChildAdded:Wait()
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
							Hit = v.Character:FindFirstChildOfClass("Part");
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
			Stepped:Wait()
			LHuman.Sit = false; LocalPlayer.Character.PrimaryPart.Velocity = Vector3.new(0, 0, 0); LocTP(tempos)
		end; Hbeat:Wait(); LHuman.Sit = false; LocTP(tempos)
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
			Stepped:Wait()
		end; Stepped:Wait(); Hbeat:Wait()
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
					end); Rstep:Wait(); LocTP(VRoot.CFrame); wait()
					for i = 1, 10 do MeleEve(args); end
					wait(0.030); LocTP(VRoot.CFrame)
					for i = 1, 10 do MeleEve(args); end
					wait(0.030); LocTP(VRoot.CFrame)
					for i = 1, 10 do MeleEve(args); end
					Rstep:Wait(); LocTP(VRoot.CFrame)
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
			end,
		},
	
		Clip = {
			Index = {"Clip", "clip", "disable wallhack", "disable noclip"},
			ExecuteCommand = function()
				Commands.Variables.NoclipBool = false
				for _, ab in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
					if ab:IsA("BasePart") then
						ab.CanCollide = true
					end
				end
			end,
		},
	
		KillAura = {
			Index = {"Kill Aura", "killaura", "aura", "Aura", "KillAura"},
			ExecuteCommand = function()
				local ME = game:GetService("ReplicatedStorage")['meleeEvent']
	
				Commands.Variables.KillAuraBool = true
	
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
			end,
		},
	
		AK = {
			Index = {"AK-47", "AK", "Get AK-47", "ak", "get ak47"},
			ExecuteCommand = function()
				Gun("AK-47")
			end,
		},
	
		M9 = {
			Index = {"M9", "Pistol", "get pistol", "Get Pistol", "get M9"},
			ExecuteCommand = function()
				Gun("M9")
			end,
		},
	
		R870 = {
			Index = {"Remington 870", "Shotgun", "R870", "get shotgun", "Get Shotgun"},
			ExecuteCommand = function()
				Gun("Remington 870")
			end,
		},
	
		GetGuns = {
			Index = {"Get Guns", "Guns", "All Guns", "allguns"},
			ExecuteCommand = function()
				AllGuns()
			end,
		},
	
		LoopGuns = {
			Index = {"Loop Guns", "Loop All Weapons", "loopweapons", "lp weapons"},
			ExecuteCommand = function()
	
				Commands.Variables.LoopGunsBool = true
	
				while wait(0.2) do
					if Commands.Variables.LoopGunsBool == true then
						AllGuns()
					end
				end
			end,
		},
	
		UnLoopGuns = {
			Index = {"Unloop guns", "Unloop weapons", "unlpguns", "unlp guns"},
			ExecuteCommand = function()
				Commands.Variables.LoopGunsBool = false
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
						print("Found matching gun:", gun.Name)
	
						for _, gunpart in pairs(gun:GetDescendants()) do
							if gunpart:IsA("BasePart") then
								print("Changing color of part:", gunpart.Name)
								gunpart.BrickColor = colorobj
								gunpart.Material = Enum.Material.Neon
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
			end,
		},
	
		Cop = {
			Index = {"Become Cop", "Cop", "cop", "officer", "become officer"},
			ExecuteCommand = function()
				TeamTo("guard")
			end,
		},
	
		Crim = {
			Index = {"Become Criminal", "Criminal", "criminal", "become criminal", "crim"},
			ExecuteCommand = function()
				TeamTo("criminal")
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
			end,
		},
	
		UnSuperPunch = {
			Index = {"Unsuper Punch", "UnPunch", "Ungod Punch", "disablepunch"},
			ExecuteCommand = function()
				Commands.Variables.SuperPunchBool = false
			end,
		},
	
		GearMod = {
			Index = {"Gear Gui", "GearMod", "geargui", "gearmod"},
			ExecuteCommand = function()
				loadstring(game:HttpGet("https://raw.githubusercontent.com/Pedro0239485y7/FE-Gear-Giver-Mod-PRison-Life-UnOb/refs/heads/main/Code"))()
			end,
		},
	
		KillAll = {
			Index = {"Kill All", "oofall", "killall", "kill all", "oof all"},
			ExecuteCommand = function()
				task.spawn(function()
					local task0 = function()
						MultiKill(Players)
					end
					task0()
				end)
	
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
			end,
		},
	
		DisableInfiniteJump = {
			Index = {"Disable Infinite Jump", "disinfjump", "disable infjump", "stopinfjump", "stopinf"},
			ExecuteCommand = function()
				Commands.Variables.InfJumpBool = false
			end,
		},
	
		AutoRespawn = {
			Index = {"QuickRespawn", "autores", "autorespawn", "quickreset"},
			ExecuteCommand = function()
				Commands.Variables.AutoReBool = true
				if Commands.Variables.AutoReBool == true then
					diedevent = lochar:WaitForChild("Humanoid").Died:Connect(ondiedevent)
					Connections.CharacterAdded = LocalPlayer.CharacterAdded:Connect(oncharadded)
				end
			end,	
		},
	
		CrashServer = {
			Index = {"Crash Server", "lagserver", "shutdown", "servershutdown"},
			ExecuteCommand = function()
				local e = 1000
	
				for i=1, e do
					task.spawn(function()
						workspace.Remote.TeamEvent:FireServer("Bright orange")
					end)
				end
			end,
		},
	
		DestroyDoors = {
			Index = {"Destroy Doors", "DDoors", "ddoors"},
			ExecuteCommand = function()
				workspace.Doors.Parent = Rstorage
			end,
		},
	
		RestoreDoors = {
			Index = {"Restore Doors", "RDoors", "rdoors", "sdoors"},
			ExecuteCommand = function()
				Rstorage.Doors.Parent = workspace
			end,
		},
	
		LKAll = {
			Index = {"Loopkill all", "lkall", "lk all", "loopkillall", "lka"},
			ExecuteCommand = function()
				Loops.KillTeams.All = true
			end,
		},
	
		UnLKAll = {
			Index = {"UnLoopkill all", "unlkall", "unlk all", "unloopkillall", "unlka"},
			ExecuteCommand = function()
				Loops.KillTeams.All = false
			end,
		},
	
		KillGuards = {
			Index = {"KillGuards", "killg", "kill all guards", "killcops"},
			ExecuteCommand = function()
				MultiKill(Teams.Guards)
			end,
		},
	
		LKGuards = {
			Index = {"LoopKillGuards", "lkg", "loopkill all guards", "loopkillcops"},
			ExecuteCommand = function()
				Loops.KillTeams.Guards = true
			end,
		},
	
		UnLKGuards = {
			Index = {"UnLoopKillGuards", "unlkg", "unloopkill all guards", "unloopkillcops"},
			ExecuteCommand = function()
				Loops.KillTeams.Guards = false
			end,
		},
	
		KillInmates = {
			Index = {"KillInmates", "killi", "kill all inmates", "killinmates"},
			ExecuteCommand = function()
				MultiKill(Teams.Inmates)
			end,
		},
	
		LKInmates = {
			Index = {"LoopKillInmates", "lki", "loopkill all inmates", "loopkillinmates"},
			ExecuteCommand = function()
				Loops.KillTeams.Inmates = true
			end,
		},
	
		UnLKInmates = {
			Index = {"UnLoopKillInmates", "unlki", "unloopkill all inmates", "unloopkillinmates"},
			ExecuteCommand = function()
				Loops.KillTeams.Inmates = false
			end,
		},
	
		KillCrim = {
			Index = {"KillCriminals", "killc", "kill all criminals", "killcriminals"},
			ExecuteCommand = function()
				repeat task.wait()
					MultiKill(Teams.Criminals)
					task.wait(.35)
				until not (#Teams.Criminals:GetPlayers() >=8)
			end,
		},
	
		LKCrims = {
			Index = {"LoopKillCriminals", "lkc", "loopkill all criminals", "loopkillcrims"},
			ExecuteCommand = function()
				Loops.KillTeams.Criminals = true
			end,
		},
	
		UnLKCriminals = {
			Index = {"UnLoopKillCriminals", "unlkc", "unloopkill all criminals", "unloopkillcrims"},
			ExecuteCommand = function()
				Loops.KillTeams.Criminals = false
			end,
		},
	
		HideUI = {
			Index = {"Hide UI", "hide", "hidecommands", "hide all"},
			ExecuteCommand = function()
				ExecuteFrame.Visible = false
				MainFrame.Visible = false
				OutPutFrame.Visible = false
				CreditsFrame.Visible = false
			end,
		},
	
		SpamSound = {
			Index = {"Spam Sound", "spamsound", "soundspam", "spamnoise"},
			ExecuteCommand = function()
				States.SoundSpam = true
				task.wait(0.02)
				SoundSpam()
			end,
		},

		UnSpamSound = {
			Index = {"UnSpam Sound", "unspamsound", "unsoundspam", "unspamnoise"},
			ExecuteCommand = function()
				States.SoundSpam = false
			end,
		},

		Yard = {
			Index = {"Yard", "tpyard", "toyard"},
			ExecuteCommand = function()
				LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(780.7301025390625, 97.99992370605469, 2468.014404296875)
			end,
		},

		CrimBase = {
			Index = {"CrimBase", "tpbase", "tocrimbase", "Criminal Base"},
			ExecuteCommand = function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-920.821044921875, 95.32717895507812, 2138.347412109375)
			end,
		},

		GuardRoom = {
			Index = {"Guard Room", "tpguardroom", "toguardroom", "Cops Room"},
			ExecuteCommand = function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(838.4561767578125, 99.98998260498047, 2261.929931640625)

			end,
		},

		UnAutoRespawn = {
			Index = {"UnAuto Respawn", "unauto", "unautore", "nonautorespawn", "unfastrespawn"},
			ExecuteCommand = function()
				Commands.Variables.AutoReBool = false
				diedevent = nil
				Connections.CharacterAdded = nil
			end,
		},

		KeyCard = {
			Index = {"Give Keycard", "keycard", "givekeycard", "givekey"},
			ExecuteCommand = function()
				GiveKeyCard(LocalPlayer)
			end,
		},

		KillPlayer = {
			Index = {"Kill Player", "killplr", "kill plr", "kill"},
			ArgsCommand = true,
			ExecuteCommand = function(player : string)
				for _, plr in pairs(Players:GetPlayers()) do
					if plr.Name == player then
						KillPL(plr)
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
				CreateMessage("Stopped loopkill for " .. targetPlayer.Name, false)
			end,
		},

		PrintCommands = {
			Index = {"Print Commands", "cmds", "printcmds", "printcommands"},
			ExecuteCommand = function()
				for _, cmd in pairs(CommandsFrame:GetChildren()) do
					if cmd:IsA("TextButton") and cmd.Name ~= "ReferenceCommand" then
						print(cmd.Name)
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
						ArrestEve(plr)
					else
						ArrestPL(plr)
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
						break
					else
						CreateMessage("Invalid Player", true)
					end
				end
			end,
		},

		TaseAll = {
			Index = {"Tase All", "taseall", "tase all", "tsall"},
			ExecuteCommand = function()
				TasePL(Players, "teams")
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
				BringCar(nil, true)
				if not LocalPlayer.Character.Humanoid.Sit then
					BringCar()
					CreateMessage("No cars available.", true)
				else
					CreateMessage("Successfully Spawned A Car!", false)
				end
			end,
		},

		BringPlayer = {
			Index = {"Bring Player", "bringplr", "bplr", "bplayer"},
			ArgsCommand = true,
			ExecuteCommand = function(player : Player)
				local DaPlayer = player
				if DaPlayer then
					BringPL(DaPlayer, LocalPlayer)
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
			end,
		},

		InfYield = {
			Index = {"Infinite Yield", "adminpanel", "infyield"},
			ExecuteCommand = function()
				loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
			end,
		},

		TPNexus = {
			Index = {"Nexus", "TPNexus", "tpnex"},
			ExecuteCommand = function()
				LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.nexus
			end,
		},

		TPCafe = {
			Index = {"Cafe", "TPCafe", "tpcafe"},
			ExecuteCommand = function()
				LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.cafe
			end,
		},

		TPCrimBase = {
			Index = {"Criminal Base", "TPCrimBase", "tpcrimbase", "tpbase", "tbcb"},
			ExecuteCommand = function()
				LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.crimbase
			end,
		},

		TPGasStation = {
			Index = {"GasStation", "TPGasStation", "tpgas", "tpstation"},
			ExecuteCommand = function()
				LocalPlayer.CharacterAdded:Wait()
				LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.gas
			end,
		},

		Sonic = {
			Index = {"Sonic", "sonicspeed", "fastrun"},
			ExecuteCommand = function()
				LocalPlayer.Character.Humanoid.WalkSpeed = 32
			end,
		},

		UnSoni = {
			Index = {"UnSonic", "unsonicspeed", "unfastrun"},
			ExecuteCommand = function()
				LocalPlayer.Character.Humanoid.WalkSpeed = 16
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
			end,
		},

		UnLoopSonic = {
			Index = {"UnLoop Sonic", "unloopsonicspeed", "unloopfastrun"},
			ExecuteCommand = function()
				Loops.Speed = false
				LocalPlayer.Character.Humanoid.WalkSpeed = 16
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
			end,
		},

		UnHighJump = {
			Index = {"YnHigh Jump", "ynhighjump", "unjumphigh"},
			ExecuteCommand = function()
				LocalPlayer.Character.Humanoid.JumpPower = 50
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
			end,
		},

		UnLoopHighJump = {
			Index = {"UnLoop High Jump", "unloophighjump", "unloopjumphigh"},
			ExecuteCommand = function()
				Loops.Jump = false
				LocalPlayer.Character.Humanoid.JumpPower = 50
			end,
		},

		OpenAllDoors = {
			Index = {"Open Doors", "OpenDoors", "opendoors"},
			ExecuteCommand = function()
				OpenDoors()
			end,
		},

		ShootKillAll = {
			Index = {"Shootkill All", "shootkillall", "shootall"},
			ExecuteCommand = function()
				for _, plr in pairs(Players:GetPlayers()) do
					if plr ~= LocalPlayer then
						ShootKill(plr)
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
					end
				end
			end,
		},

		FlingAll = {
			Index = {"Fling All", "FlingAll", "fAll"},
			ExecuteCommand = function()
				loadstring(game:HttpGet('https://raw.githubusercontent.com/CorgiSideExploits/OrionLib/refs/heads/main/SkidFling'))()
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
			end,
		},

		CarFling = {
			Index = {"Carfling Player", "carfling", "carflingplr", "cfplr"},
			ArgsCommand = true,
			ExecuteCommand = function(player : string)
				local targetplayer = Players:FindFirstChild(player)

				if not player then return end

				CarFlingPL(player)
			end,
		},

		TPVents = {
			Index = {"Vents", "TPVents", "tpvents"},
			ExecuteCommand = function()
				LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.vents
			end,
		},

		TPCells = {
			Index = {"Cells", "TPCells", "tpcells"},
			ExecuteCommand = function()
				LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.cells
			end,
		},

		TPRoof = {
			Index = {"Roof", "TPRoof", "tproof"},
			ExecuteCommand = function()
				LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.roof
			end,
		},

		TPBuildingRoof = {
			Index = {"Building Roof", "TPBRoof", "tpbroof"},
			ExecuteCommand = function()
				LocalPlayer.Character.HumanoidRootPart.CFrame = Teleports.buildingroof
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
			end,
		},

		UnLoopM9 = {
			Index = {"UnLoop M9", "unloopm9", "unlooppistol"},
			ExecuteCommand = function()
				Commands.Variables.LoopM9 = false
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
			end,
		},

		UnLoopShotgun = {
			Index = {"UnLoop Remington", "unloopshotgun", "unloopremington"},
			ExecuteCommand = function()
				Commands.Variables.LoopRem = false
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
			end,
		},

		UnLoopAK47 = {
			Index = {"UnLoop AK", "unloopak", "unloopak47"},
			ExecuteCommand = function()
				Commands.Variables.LoopAk = false
			end,
		},

		AntiArrest = {
			Index = {"AntiArrest", "antiarrest", "anti arrest", "Aarrest"},
			ExecuteCommand = function()
				Toggles.Antiarrest = true
			end,
		},

		UnAntiArrest = {
			Index = {"UnAntiArrest", "unantiarrest", "unanti arrest", "unAarrest"},
			ExecuteCommand = function()
				Toggles.Antiarrest = false
			end,
		},

		AntiTase = {
			Index = {"AntiTase", "antitase", "anti tase", "Atase"},
			ExecuteCommand = function()
				Toggles.AntiTase = true
			end,
		},

		UnAntiTase = {
			Index = {"UnAntiTase", "unantitase", "unanti tase", "unAtase"},
			ExecuteCommand = function()
				Toggles.AntiTase = false
			end,
		},

		OGScript = {
			Index = {"OG Exploiting GUI", "ogui", "og script", "ogscript", "ogexploit"},
			ExecuteCommand = function()
				loadstring(game:HttpGet("https://pastebin.com/raw/GzeWWPWN"))()
			end,
		},

		CorgiwareScript = {
			Index = {"Corgiware Gui", "CorgiwareUI", "Corgiware"},
			ExecuteCommand = function()
				loadstring(game:HttpGet("https://pastebin.com/raw/DuWbmerF"))()
			end,
		}

	}

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

	Execute.Activated:Connect(function()
		local found = false
		local input = CommandBox.Text

		for name, tblcommand in pairs(Commands) do
			if tblcommand.Index and tblcommand.ExecuteCommand then
				for _, alias in ipairs(tblcommand.Index) do
					local inputLower = string.lower(input)
					local aliasLower = string.lower(alias)

					-- Exact match for non-special, no-args commands
					if not tblcommand.SpecialCommand and not tblcommand.ArgsCommand and inputLower == aliasLower then
						tblcommand.ExecuteCommand()
						CreateMessage("Successfully Executed Command: " .. input .. "!", false)
						found = true
						break
					end

					-- Special command (e.g. custom argument parsing like color + gun)
					if tblcommand.SpecialCommand and string.sub(inputLower, 1, #aliasLower) == aliasLower then
						local argsText = string.sub(input, #alias + 2)
						local args = string.split(argsText, " ")
						local color = table.remove(args, #args)
						local gunName = table.concat(args, " ")

						tblcommand.ExecuteCommand(color, gunName)
						CreateMessage("Successfully Executed Command: " .. input .. "!", false)
						found = true
						break
					end

					if tblcommand.NumberCommand and string.sub(inputLower, 1, #aliasLower) == aliasLower then
						local argsText = string.sub(input, #alias + 2)
						local args = string.split(argsText, " ")
						local lastArg = table.remove(args, #args)

						local numberarg = tonumber(lastArg)
						if numberarg then
							tblcommand.ExecuteCommand(numberarg)
							CreateMessage("Successfully Executed Number Command: " .. input .. "!", false)
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

						tblcommand.ExecuteCommand(lastArg)
						CreateMessage("Successfully Executed Command: " .. input .. "!", false)
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
		CreditsFrame.Visible = true
		ExecuteFrame.Visible = true
	end)

	task.wait(0.1)

	local CommandsAmount = 0

	for _, cmd in pairs(CommandsFrame:GetChildren()) do
		if cmd.Name ~= "ReferenceCommand" and cmd:IsA("TextButton") then
			CommandsAmount += 1
			print("Amount Of Commands: " .. CommandsAmount)
		end
	end

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
end;
task.spawn(C_26);

return G2L["1"], require;
