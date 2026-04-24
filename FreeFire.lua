local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "ModernOrderUI"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

local Stats = game:GetService("Stats")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- Hàm tạo Tween nhanh cho Button
local function addButtonEffect(button)
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = button.BackgroundColor3:Lerp(Color3.new(1,1,1), 0.1)}):Play()
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = button.BackgroundColor3}):Play()
    end)
end

--==================== STATUS FRAME (FPS/PING) ====================--

local infoFrame = Instance.new("Frame")
infoFrame.Name = "StatusFrame"
infoFrame.Parent = gui
infoFrame.Size = UDim2.new(0, 160, 0, 65)
infoFrame.Position = UDim2.new(0.02, 0, 0.02, 0)
infoFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
infoFrame.BackgroundTransparency = 0.1
infoFrame.Active = true
infoFrame.Draggable = true

Instance.new("UICorner", infoFrame).CornerRadius = UDim.new(0, 10)
local infoStroke = Instance.new("UIStroke", infoFrame)
infoStroke.Color = Color3.fromRGB(0, 200, 255)
infoStroke.Thickness = 1.5
infoStroke.Transparency = 0.5

local fpsLabel = Instance.new("TextLabel")
fpsLabel.Parent = infoFrame
fpsLabel.Size = UDim2.new(1, -20, 0, 25)
fpsLabel.Position = UDim2.new(0, 10, 0, 8)
fpsLabel.BackgroundTransparency = 1
fpsLabel.Text = "⚡ FPS: --"
fpsLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
fpsLabel.Font = Enum.Font.GothamMedium
fpsLabel.TextSize = 13
fpsLabel.TextXAlignment = Enum.TextXAlignment.Left

local pingLabel = Instance.new("TextLabel")
pingLabel.Parent = infoFrame
pingLabel.Size = UDim2.new(1, -20, 0, 25)
pingLabel.Position = UDim2.new(0, 10, 0, 32)
pingLabel.BackgroundTransparency = 1
pingLabel.Text = "📡 PING: -- ms"
pingLabel.TextColor3 = Color3.fromRGB(255, 180, 50)
pingLabel.Font = Enum.Font.GothamMedium
pingLabel.TextSize = 13
pingLabel.TextXAlignment = Enum.TextXAlignment.Left

--==================== MAIN FRAME (ORDER INFO) ====================--

local mainFrame = Instance.new("Frame")
mainFrame.Parent = gui
mainFrame.Size = UDim2.new(0, 320, 0, 100)
mainFrame.Position = UDim2.new(0.5, -160, 0.05, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
mainFrame.Active = true
mainFrame.Draggable = true

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)
local mainStroke = Instance.new("UIStroke", mainFrame)
mainStroke.Thickness = 2
mainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
local mainGradient = Instance.new("UIGradient", mainStroke)
mainGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 80, 150)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 50, 255))
}

local title = Instance.new("TextLabel")
title.Parent = mainFrame
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "ORDER INFORMATION"
title.TextColor3 = Color3.fromRGB(200, 200, 200)
title.Font = Enum.Font.GothamBold
title.TextSize = 12
title.TextTransparency = 0.4

local orderText = Instance.new("TextLabel")
orderText.Parent = mainFrame
orderText.Size = UDim2.new(1, -100, 0, 25)
orderText.Position = UDim2.new(0, 20, 0, 35)
orderText.BackgroundTransparency = 1
orderText.Text = "📦 Order: <font color='#ffffff'>QuangVinh</font>"
orderText.RichText = true
orderText.TextColor3 = Color3.fromRGB(180, 180, 180)
orderText.Font = Enum.Font.GothamMedium
orderText.TextSize = 15
orderText.TextXAlignment = Enum.TextXAlignment.Left

local nameText = Instance.new("TextLabel")
nameText.Parent = mainFrame
nameText.Size = UDim2.new(1, -100, 0, 25)
nameText.Position = UDim2.new(0, 20, 0, 60)
nameText.BackgroundTransparency = 1
nameText.Text = "👤 Name: <font color='#ffca00'>QuangVinh</font>"
nameText.RichText = true
nameText.TextColor3 = Color3.fromRGB(180, 180, 180)
nameText.Font = Enum.Font.GothamMedium
nameText.TextSize = 15
nameText.TextXAlignment = Enum.TextXAlignment.Left

local editBtn = Instance.new("TextButton")
editBtn.Parent = mainFrame
editBtn.Size = UDim2.new(0, 70, 0, 35)
editBtn.Position = UDim2.new(1, -85, 0.5, -10)
editBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
editBtn.Text = "EDIT"
editBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
editBtn.Font = Enum.Font.GothamBold
editBtn.TextSize = 12
Instance.new("UICorner", editBtn).CornerRadius = UDim.new(0, 8)
addButtonEffect(editBtn)

--==================== EDIT PANEL (POPUP) ====================--

local editFrame = Instance.new("Frame")
editFrame.Parent = gui
editFrame.Size = UDim2.new(0, 300, 0, 220)
editFrame.Position = UDim2.new(0.5, -150, 0.4, 0)
editFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
editFrame.Visible = false
editFrame.Active = true
editFrame.Draggable = true

Instance.new("UICorner", editFrame).CornerRadius = UDim.new(0, 15)
local editStroke = Instance.new("UIStroke", editFrame)
editStroke.Color = Color3.fromRGB(0, 170, 255)
editStroke.Thickness = 2

local function createInput(placeholder, pos, parent)
    local box = Instance.new("TextBox")
    box.Size = UDim2.new(0, 260, 0, 40)
    box.Position = pos
    box.Parent = parent
    box.PlaceholderText = placeholder
    box.Text = ""
    box.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
    box.TextColor3 = Color3.new(1,1,1)
    box.Font = Enum.Font.Gotham
    box.TextSize = 14
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 8)
    return box
end

local orderBox = createInput("New Order Name...", UDim2.new(0, 20, 0, 50), editFrame)
local nameBox = createInput("New User Name...", UDim2.new(0, 20, 0, 100), editFrame)

local saveBtn = Instance.new("TextButton")
saveBtn.Parent = editFrame
saveBtn.Size = UDim2.new(0, 260, 0, 40)
saveBtn.Position = UDim2.new(0, 20, 0, 155)
saveBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
saveBtn.Text = "SAVE CHANGES"
saveBtn.TextColor3 = Color3.new(1,1,1)
saveBtn.Font = Enum.Font.GothamBold
saveBtn.TextSize = 14
Instance.new("UICorner", saveBtn).CornerRadius = UDim.new(0, 8)
addButtonEffect(saveBtn)

local closeBtn = Instance.new("TextButton")
closeBtn.Parent = editFrame
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -40, 0, 10)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
closeBtn.TextSize = 20
closeBtn.Font = Enum.Font.GothamBold

--==================== LOGIC ====================--

editBtn.MouseButton1Click:Connect(function()
    editFrame.Visible = true
end)

closeBtn.MouseButton1Click:Connect(function()
    editFrame.Visible = false
end)

saveBtn.MouseButton1Click:Connect(function()
    if orderBox.Text ~= "" then
        orderText.Text = "📦 Order: <font color='#ffffff'>" .. orderBox.Text .. "</font>"
    end
    if nameBox.Text ~= "" then
        nameText.Text = "👤 Name: <font color='#ffca00'>" .. nameBox.Text .. "</font>"
    end
    editFrame.Visible = false
    orderBox.Text = ""
    nameBox.Text = ""
end)

-- Update Stats
local frames = 0
local lastTime = tick()

RunService.RenderStepped:Connect(function()
    frames += 1
    if tick() - lastTime >= 1 then
        fpsLabel.Text = "⚡ FPS: " .. frames
        frames = 0
        lastTime = tick()
    end
    
    local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
    pingLabel.Text = "📡 PING: " .. ping .. " ms"
end)