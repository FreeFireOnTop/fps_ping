local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "GrandSystemUI"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

local Stats = game:GetService("Stats")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- [ TWEEN HELPER ] --
local function anim(obj, time, goal, style)
    style = style or Enum.EasingStyle.Quart
    local info = TweenInfo.new(time, style, Enum.EasingDirection.Out)
    local tween = TweenService:Create(obj, info, goal)
    tween:Play()
    return tween
end

--==================== STATUS PANEL ====================--
local infoFrame = Instance.new("Frame")
infoFrame.Parent = gui
infoFrame.Size = UDim2.new(0, 180, 0, 80)
infoFrame.Position = UDim2.new(0.02, -250, 0.02, 0)
infoFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
Instance.new("UICorner", infoFrame).CornerRadius = UDim.new(0, 15)
local infoStroke = Instance.new("UIStroke", infoFrame)
infoStroke.Color = Color3.fromRGB(0, 255, 255)
infoStroke.Thickness = 2.5

local function createStat(text, pos, color)
    local lbl = Instance.new("TextLabel")
    lbl.Parent = infoFrame
    lbl.Size = UDim2.new(1, -20, 0, 30)
    lbl.Position = pos
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = color
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 16
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return lbl
end

local fpsLabel = createStat("⚡ FPS: --", UDim2.new(0, 15, 0, 10), Color3.fromRGB(0, 255, 150))
local pingLabel = createStat("📡 MS: --", UDim2.new(0, 15, 0, 40), Color3.fromRGB(255, 180, 50))

--==================== MAIN DASHBOARD ====================--
local mainFrame = Instance.new("Frame")
mainFrame.Parent = gui
mainFrame.Size = UDim2.new(0, 420, 0, 140)
mainFrame.Position = UDim2.new(0.5, -210, -0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
mainFrame.Active = true
mainFrame.Draggable = true
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 20)
local mainStroke = Instance.new("UIStroke", mainFrame)
mainStroke.Color = Color3.fromRGB(255, 45, 100)
mainStroke.Thickness = 3

local title = Instance.new("TextLabel")
title.Parent = mainFrame
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundTransparency = 1
title.Text = "Thông Tin Và Đơn By Quang Vinh"
title.TextColor3 = Color3.fromRGB(200, 200, 200)
title.Font = Enum.Font.GothamBold
title.TextSize = 13
title.TextTransparency = 0.5

local orderText = Instance.new("TextLabel")
orderText.Parent = mainFrame
orderText.Size = UDim2.new(1, -120, 0, 40)
orderText.Position = UDim2.new(0, 25, 0, 45)
orderText.BackgroundTransparency = 1
orderText.Text = "📦 ĐƠN: <font color='#FFFFFF'>QuangVinh</font>"
orderText.RichText = true
orderText.TextColor3 = Color3.fromRGB(160, 160, 160)
orderText.Font = Enum.Font.GothamBold
orderText.TextSize = 20
orderText.TextXAlignment = Enum.TextXAlignment.Left

local nameText = Instance.new("TextLabel")
nameText.Parent = mainFrame
nameText.Size = UDim2.new(1, -120, 0, 40)
nameText.Position = UDim2.new(0, 25, 0, 85)
nameText.BackgroundTransparency = 1
nameText.Text = "👤 TÊN: <font color='#00FFFF'>QuangVinh</font>"
nameText.RichText = true
nameText.TextColor3 = Color3.fromRGB(160, 160, 160)
nameText.Font = Enum.Font.GothamBold
nameText.TextSize = 20
nameText.TextXAlignment = Enum.TextXAlignment.Left

local editBtn = Instance.new("TextButton")
editBtn.Parent = mainFrame
editBtn.Size = UDim2.new(0, 90, 0, 50)
editBtn.Position = UDim2.new(1, -110, 0.5, -5)
editBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
editBtn.Text = "SỬA"
editBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
editBtn.Font = Enum.Font.GothamBold
editBtn.TextSize = 16
Instance.new("UICorner", editBtn).CornerRadius = UDim.new(0, 12)

--==================== BẢNG SỬA (PHẦN VIẾT LẠI) ====================--
local editFrame = Instance.new("Frame")
editFrame.Name = "EditPanel"
editFrame.Parent = gui
editFrame.Size = UDim2.new(0, 350, 0, 220)
editFrame.Position = UDim2.new(0.5, -175, 1.2, 0) -- Giấu ở dưới màn hình
editFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
editFrame.Visible = false
Instance.new("UICorner", editFrame).CornerRadius = UDim.new(0, 20)
local editStroke = Instance.new("UIStroke", editFrame)
editStroke.Color = Color3.fromRGB(0, 255, 255)
editStroke.Thickness = 2.5

local function createInput(place, pos)
    local box = Instance.new("TextBox")
    box.Parent = editFrame
    box.Size = UDim2.new(0, 290, 0, 45)
    box.Position = pos
    box.PlaceholderText = place
    box.Text = ""
    box.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    box.TextColor3 = Color3.new(1,1,1)
    box.Font = Enum.Font.GothamBold
    box.TextSize = 14
    box.ClearTextOnFocus = false
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 10)
    return box
end

local boxOrder = createInput("Nhập đơn mới...", UDim2.new(0, 30, 0, 35))
local boxName = createInput("Nhập tên mới...", UDim2.new(0, 30, 0, 95))

local confirmBtn = Instance.new("TextButton")
confirmBtn.Parent = editFrame
confirmBtn.Size = UDim2.new(0, 290, 0, 50)
confirmBtn.Position = UDim2.new(0, 30, 0, 155)
confirmBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
confirmBtn.Text = "XÁC NHẬN"
confirmBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
confirmBtn.Font = Enum.Font.GothamBold
confirmBtn.TextSize = 16
Instance.new("UICorner", confirmBtn).CornerRadius = UDim.new(0, 10)

--==================== LOGIC & ANIMATION ====================--

-- Hiệu ứng vào màn hình
task.wait(0.5)
anim(infoFrame, 1.2, {Position = UDim2.new(0.02, 0, 0.02, 0)}, Enum.EasingStyle.Elastic)
anim(mainFrame, 1.2, {Position = UDim2.new(0.5, -210, 0.05, 0)}, Enum.EasingStyle.Elastic)

-- Hover nút Sửa
editBtn.MouseEnter:Connect(function()
    anim(editBtn, 0.3, {BackgroundColor3 = Color3.fromRGB(255, 45, 100), Size = UDim2.new(0, 100, 0, 55)})
end)
editBtn.MouseLeave:Connect(function()
    anim(editBtn, 0.3, {BackgroundColor3 = Color3.fromRGB(30, 30, 40), Size = UDim2.new(0, 90, 0, 50)})
end)

-- Mở bảng Sửa
editBtn.MouseButton1Click:Connect(function()
    editFrame.Visible = true
    anim(editFrame, 0.6, {Position = UDim2.new(0.5, -175, 0.4, 0)}, Enum.EasingStyle.Back)
end)

-- Logic Xác nhận (Quan trọng)
confirmBtn.MouseButton1Click:Connect(function()
    -- Cập nhật chữ nếu TextBox không trống
    if boxOrder.Text ~= "" then
        orderText.Text = "📦 ĐƠN: <font color='#FFFFFF'>" .. boxOrder.Text .. "</font>"
    end
    if boxName.Text ~= "" then
        nameText.Text = "👤 TÊN: <font color='#00FFFF'>" .. boxName.Text .. "</font>"
    end
    
    -- Đóng bảng với animation
    local closeTween = anim(editFrame, 0.5, {Position = UDim2.new(0.5, -175, 1.2, 0)})
    closeTween.Completed:Connect(function()
        editFrame.Visible = false
        boxOrder.Text = "" -- Reset box
        boxName.Text = "" -- Reset box
    end)
end)

-- Glow viền bảng chính
spawn(function()
    while true do
        anim(mainStroke, 2, {Transparency = 0.2})
        task.wait(2)
        anim(mainStroke, 2, {Transparency = 0.8})
        task.wait(2)
    end
end)

-- Cập nhật FPS/Ping chuẩn
local frames = 0
local lastTime = tick()
RunService.RenderStepped:Connect(function()
    frames = frames + 1
    if tick() - lastTime >= 1 then
        fpsLabel.Text = "⚡ FPS: " .. frames
        frames = 0
        lastTime = tick()
    end
    local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
    pingLabel.Text = "📡 MS: " .. ping
end)