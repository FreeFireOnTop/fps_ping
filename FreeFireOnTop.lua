local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "OrderUI"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

local Stats = game:GetService("Stats")
local RunService = game:GetService("RunService")

--==================== FPS + PING FRAME ====================--

local infoFrame = Instance.new("Frame")
infoFrame.Parent = gui
infoFrame.Size = UDim2.new(0, 180, 0, 75)
infoFrame.Position = UDim2.new(0.02, 0, 0.02, 0)
infoFrame.BackgroundColor3 = Color3.fromRGB(18,18,25)
infoFrame.BorderSizePixel = 0
infoFrame.Active = true
infoFrame.Draggable = true

local infoCorner = Instance.new("UICorner")
infoCorner.CornerRadius = UDim.new(0, 12)
infoCorner.Parent = infoFrame

local infoStroke = Instance.new("UIStroke")
infoStroke.Parent = infoFrame
infoStroke.Color = Color3.fromRGB(0,170,255)
infoStroke.Thickness = 2

local infoTitle = Instance.new("TextLabel")
infoTitle.Parent = infoFrame
infoTitle.Size = UDim2.new(1,0,0,22)
infoTitle.BackgroundTransparency = 1
infoTitle.Text = "📊 STATUS"
infoTitle.TextColor3 = Color3.fromRGB(255,255,255)
infoTitle.Font = Enum.Font.GothamBold
infoTitle.TextSize = 14

local fpsLabel = Instance.new("TextLabel")
fpsLabel.Parent = infoFrame
fpsLabel.Size = UDim2.new(1,-20,0,20)
fpsLabel.Position = UDim2.new(0,10,0,25)
fpsLabel.BackgroundTransparency = 1
fpsLabel.Text = "FPS: Loading..."
fpsLabel.TextColor3 = Color3.fromRGB(0,255,100)
fpsLabel.Font = Enum.Font.GothamBold
fpsLabel.TextSize = 14
fpsLabel.TextXAlignment = Enum.TextXAlignment.Left

local pingLabel = Instance.new("TextLabel")
pingLabel.Parent = infoFrame
pingLabel.Size = UDim2.new(1,-20,0,20)
pingLabel.Position = UDim2.new(0,10,0,45)
pingLabel.BackgroundTransparency = 1
pingLabel.Text = "Ping: Loading..."
pingLabel.TextColor3 = Color3.fromRGB(255,200,0)
pingLabel.Font = Enum.Font.GothamBold
pingLabel.TextSize = 14
pingLabel.TextXAlignment = Enum.TextXAlignment.Left

--==================== MAIN FRAME ====================--

local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0, 340, 0, 90)
frame.Position = UDim2.new(0.35, 0, 0.15, 0)
frame.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local stroke = Instance.new("UIStroke")
stroke.Parent = frame
stroke.Color = Color3.fromRGB(255, 70, 120)
stroke.Thickness = 2

local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1, 0, 0, 22)
title.BackgroundTransparency = 1
title.Text = "📦 THÔNG TIN ĐƠN"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.GothamBold
title.TextSize = 14

local orderText = Instance.new("TextLabel")
orderText.Parent = frame
orderText.Size = UDim2.new(1, -90, 0, 25)
orderText.Position = UDim2.new(0, 15, 0, 28)
orderText.BackgroundTransparency = 1
orderText.Text = "Đơn: QuangVinh"
orderText.TextColor3 = Color3.fromRGB(255,255,255)
orderText.Font = Enum.Font.GothamBold
orderText.TextSize = 16
orderText.TextXAlignment = Enum.TextXAlignment.Left

local nameText = Instance.new("TextLabel")
nameText.Parent = frame
nameText.Size = UDim2.new(1, -90, 0, 25)
nameText.Position = UDim2.new(0, 15, 0, 55)
nameText.BackgroundTransparency = 1
nameText.Text = "Tên: QuangVinh"
nameText.TextColor3 = Color3.fromRGB(255,200,0)
nameText.Font = Enum.Font.GothamBold
nameText.TextSize = 16
nameText.TextXAlignment = Enum.TextXAlignment.Left

local editBtn = Instance.new("TextButton")
editBtn.Parent = frame
editBtn.Size = UDim2.new(0, 65, 0, 32)
editBtn.Position = UDim2.new(1, -75, 0, 28)
editBtn.BackgroundColor3 = Color3.fromRGB(35,35,45)
editBtn.Text = "✏ Sửa"
editBtn.TextColor3 = Color3.fromRGB(255,220,120)
editBtn.Font = Enum.Font.GothamBold
editBtn.TextSize = 14
editBtn.BorderSizePixel = 0

local editCorner = Instance.new("UICorner")
editCorner.CornerRadius = UDim.new(0, 8)
editCorner.Parent = editBtn

--==================== EDIT FRAME ====================--

local editFrame = Instance.new("Frame")
editFrame.Parent = gui
editFrame.Size = UDim2.new(0, 300, 0, 190)
editFrame.Position = UDim2.new(0.38, 0, 0.32, 0)
editFrame.BackgroundColor3 = Color3.fromRGB(22,22,30)
editFrame.Visible = false
editFrame.Active = true
editFrame.Draggable = true
editFrame.BorderSizePixel = 0

local popupCorner = Instance.new("UICorner")
popupCorner.CornerRadius = UDim.new(0, 12)
popupCorner.Parent = editFrame

local popupStroke = Instance.new("UIStroke")
popupStroke.Parent = editFrame
popupStroke.Color = Color3.fromRGB(0,170,255)
popupStroke.Thickness = 2

local popupTitle = Instance.new("TextLabel")
popupTitle.Parent = editFrame
popupTitle.Size = UDim2.new(1,0,0,30)
popupTitle.BackgroundTransparency = 1
popupTitle.Text = "⚙ Chỉnh sửa thông tin"
popupTitle.TextColor3 = Color3.fromRGB(255,255,255)
popupTitle.Font = Enum.Font.GothamBold
popupTitle.TextSize = 16

local closeBtn = Instance.new("TextButton")
closeBtn.Parent = editFrame
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -40, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(255,60,60)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.BorderSizePixel = 0

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeBtn

local orderBox = Instance.new("TextBox")
orderBox.Parent = editFrame
orderBox.Size = UDim2.new(0, 260, 0, 38)
orderBox.Position = UDim2.new(0, 20, 0, 45)
orderBox.PlaceholderText = "Nhập đơn mới..."
orderBox.Text = ""
orderBox.TextSize = 14
orderBox.Font = Enum.Font.Gotham
orderBox.BackgroundColor3 = Color3.fromRGB(35,35,45)
orderBox.TextColor3 = Color3.fromRGB(255,255,255)
orderBox.BorderSizePixel = 0

local orderCorner = Instance.new("UICorner")
orderCorner.CornerRadius = UDim.new(0, 8)
orderCorner.Parent = orderBox

local nameBox = Instance.new("TextBox")
nameBox.Parent = editFrame
nameBox.Size = UDim2.new(0, 260, 0, 38)
nameBox.Position = UDim2.new(0, 20, 0, 92)
nameBox.PlaceholderText = "Nhập tên mới..."
nameBox.Text = ""
nameBox.TextSize = 14
nameBox.Font = Enum.Font.Gotham
nameBox.BackgroundColor3 = Color3.fromRGB(35,35,45)
nameBox.TextColor3 = Color3.fromRGB(255,255,255)
nameBox.BorderSizePixel = 0

local nameCorner = Instance.new("UICorner")
nameCorner.CornerRadius = UDim.new(0, 8)
nameCorner.Parent = nameBox

local saveBtn = Instance.new("TextButton")
saveBtn.Parent = editFrame
saveBtn.Size = UDim2.new(0, 110, 0, 38)
saveBtn.Position = UDim2.new(0.5, -55, 0, 140)
saveBtn.Text = "💾 Lưu"
saveBtn.Font = Enum.Font.GothamBold
saveBtn.TextSize = 14
saveBtn.TextColor3 = Color3.fromRGB(255,255,255)
saveBtn.BackgroundColor3 = Color3.fromRGB(0,170,255)
saveBtn.BorderSizePixel = 0

local saveCorner = Instance.new("UICorner")
saveCorner.CornerRadius = UDim.new(0, 8)
saveCorner.Parent = saveBtn

--==================== FUNCTIONS ====================--

editBtn.MouseButton1Click:Connect(function()
	editFrame.Visible = true
end)

closeBtn.MouseButton1Click:Connect(function()
	editFrame.Visible = false
	orderBox.Text = ""
	nameBox.Text = ""
end)

saveBtn.MouseButton1Click:Connect(function()
	if orderBox.Text ~= "" then
		orderText.Text = "Đơn: " .. orderBox.Text
	end

	if nameBox.Text ~= "" then
		nameText.Text = "Tên: " .. nameBox.Text
	end

	editFrame.Visible = false
	orderBox.Text = ""
	nameBox.Text = ""
end)

-- FPS UPDATE

local frames = 0
local lastTime = tick()

RunService.RenderStepped:Connect(function()
	frames += 1

	if tick() - lastTime >= 1 then
		fpsLabel.Text = "FPS: " .. tostring(frames)
		frames = 0
		lastTime = tick()
	end

	local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
	pingLabel.Text = "Ping: " .. tostring(ping) .. " ms"
end)