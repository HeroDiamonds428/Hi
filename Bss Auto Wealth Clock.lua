repeat wait() until game:IsLoaded() repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenGui") repeat wait() until game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("MeterHUD") repeat wait() until game.Players.LocalPlayer.PlayerGui.ScreenGui.MeterHUD:FindFirstChild("HoneyMeter") repeat wait() until game.Players.LocalPlayer.PlayerGui.ScreenGui.MeterHUD.HoneyMeter:FindFirstChild("Bar") repeat wait() until game.Players.LocalPlayer.PlayerGui.ScreenGui.MeterHUD:FindFirstChild("PollenMeter") repeat wait() until game.Players.LocalPlayer.PlayerGui.ScreenGui.MeterHUD.PollenMeter:FindFirstChild("Bar") repeat wait() until game.Players.LocalPlayer.PlayerGui.ScreenGui.LoadingMessage.Visible == false
local Gui = Instance.new("ScreenGui")
local GuiFrame = Instance.new("Frame")
local GuiButton = Instance.new("TextButton")
local GuiText = Instance.new("TextLabel")
local plat = game:GetService("Workspace"):WaitForChild("Toys"):WaitForChild("Wealth Clock"):WaitForChild("Platform")
local oldP = Vector3.new(311.27, 44.99, 189.996)
Gui.Name = "Auto Wealth Clock"
Gui.Parent = game.CoreGui
Gui.Enabled = true
script.Parent = Gui

GuiFrame.Parent = Gui
GuiFrame.Selectable = true
GuiFrame.Draggable = true
GuiFrame.Active = true
GuiFrame.Visible = true
GuiFrame.Position = UDim2.new(0.45, 0, 0.45, 0)
GuiFrame.Size = UDim2.new(0.08, 0, 0.08, 0)

GuiText.Parent = GuiFrame
GuiText.Text = "Auto Wealth Clock"
GuiText.Visible = true
GuiText.Position = UDim2.new(0.5, 0, 0.2, 0)
GuiText.TextSize = 12

GuiButton.Parent = GuiFrame
GuiButton.Selectable = true
GuiButton.Text = "Disabled"
GuiButton.Visible = true
GuiButton.BackgroundColor3 = Color3.new(255, 0, 0)
GuiButton.Position = UDim2.new(0.15, 0, 0.35, 0)
GuiButton.Size = UDim2.new(0.7, 0, 0.5, 0)
GuiButton.TextSize = 15

_G.Enabled = false

GuiButton.MouseButton1Down:Connect(function()
    if GuiButton.Text == "Disabled" then
        _G.Enabled = true
        GuiButton.Text = "Enabled"
        GuiButton.BackgroundColor3 = Color3.new(0, 255, 0)
        plat.Transparency = 1
    elseif GuiButton.Text == "Enabled" then
        _G.Enabled = false
        GuiButton.Text = "Disabled"
        GuiButton.BackgroundColor3 = Color3.new(255, 0, 0)
        wait(0.1)
        plat.Position = oldP
        plat.Transparency = 0
    end
end)
local lp = game.Players.LocalPlayer
local virtualUser = game:GetService('VirtualUser')
local hive = game:GetService("Workspace"):WaitForChild("HivePlatforms")
local button = lp.PlayerGui:WaitForChild("ScreenGui"):WaitForChild("ActivateButton")
local bt = button:WaitForChild("TextBox")
local hrp = lp.character:WaitForChild("HumanoidRootPart")
plat.Transparency = 1
for i,v in pairs(game:GetService("Workspace"):WaitForChild("HivePlatforms"):GetChildren()) do
    if v:FindFirstChild("Circle") and v.Circle:FindFirstChild("SurfaceGui") and v.Circle.SurfaceGui:FindFirstChild("TextLabel") and v.Circle.SurfaceGui.TextLabel.Text == lp.Name then
        _G.plrhive = v.Platform
    end
end
if not _G.plrhive then print("Please Claim Your Hive Before Executing the Script") return end
virtualUser:CaptureController()
function PressKey(keycode)
    virtualUser:SetKeyDown(keycode)
    wait()
    virtualUser:SetKeyUp(keycode)
end
while true do
    if (hrp.Position - _G.plrhive.Position).magnitude > 25 and _G.Enabled == true then
        plat.Position = hrp.Position
    end
    if bt.Text == "Use the Wealth Clock" and _G.Enabled == true then
        PressKey("0x65")
    end
    if (hrp.Position - _G.plrhive.Position).magnitude < 25 then
        plat.Position = oldP
    end
    wait()
end