-- Potassium Executor
-- Full UI: lưu tên đơn + FPS + Ping + nút sửa gần chữ Đơn

local Stats = game:GetService("Stats")
local RunService = game:GetService("RunService")

local fileName = "order_save.txt"

-- đọc dữ liệu cũ
local savedOrder = ""
if isfile(fileName) then
	savedOrder = readfile(fileName)
end

-- player
local player = game.Players.LocalPlayer

-- UI
local gui = Instance.new("ScreenGui")
gui.Name = "OrderUI"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

-- che nửa tên acc
local function hideHalfName(name)
	local len = #name
	local keep = math.floor(len / 2)
	local hidden = string.rep("*", len - keep)
	return string.sub(name, 1, keep) .. hidden
end

-- frame chính
local main = Instance.new("Frame")
main.Parent = gui
main.Size = UDim2.new(0, 320, 0, 118)
main.Position = UDim2.new(0.04, 0, 0.14, 0)
main.BackgroundColor3 = Color3.fromRGB(30,30,30)
main.BorderSizePixel = 3
main.BorderColor3 = Color3.fromRGB(255,200,0)

-- tiêu đề
local title = Instance.new("TextLabel")
title.Parent = main
title.Size = UDim2.new(1,0,0,24)
title.Position = UDim2.new(0,10,0,4)
title.BackgroundTransparency = 1
title.Text = "THÔNG TIN VÀ ĐƠN"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextSize = 18
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left

-- ⭐ chữ QUANG VINH (7 màu)
local brand = Instance.new("TextLabel")
brand.Parent = main
brand.Size = UDim2.new(1,0,0,20)
brand.Position = UDim2.new(0,10,0,22)
brand.BackgroundTransparency = 1
brand.Text = "quang vinh"
brand.TextSize = 12
brand.Font = Enum.Font.GothamBold
brand.TextXAlignment = Enum.TextXAlignment.Left
brand.TextColor3 = Color3.fromRGB(255,0,0)

-- tên acc
local nameLabel = Instance.new("TextLabel")
nameLabel.Parent = main
nameLabel.Size = UDim2.new(0,0,0,40)
nameLabel.Position = UDim2.new(0,10,0,28)
nameLabel.BackgroundTransparency = 1
nameLabel.Text = "Tên: " .. hideHalfName(player.Name)
nameLabel.TextColor3 = Color3.fromRGB(255,255,255)
nameLabel.TextSize = 16
nameLabel.Font = Enum.Font.GothamSemibold
nameLabel.TextXAlignment = Enum.TextXAlignment.Left

-- chữ Đơn:
local orderText = Instance.new("TextLabel")
orderText.Parent = main
orderText.Size = UDim2.new(0,80,0,24)
orderText.Position = UDim2.new(0,10,0,55)
orderText.BackgroundTransparency = 1
orderText.Text = "Đơn:"
orderText.TextColor3 = Color3.fromRGB(255,220,0)
orderText.TextSize = 17
orderText.Font = Enum.Font.GothamBold
orderText.TextXAlignment = Enum.TextXAlignment.Left

-- tên đơn
local orderName = Instance.new("TextLabel")
orderName.Parent = main
orderName.Size = UDim2.new(0,180,0,24)
orderName.Position = UDim2.new(0,55,0,55)
orderName.BackgroundTransparency = 1
orderName.Text = savedOrder
orderName.TextColor3 = Color3.fromRGB(255,220,0)
orderName.TextSize = 17
orderName.Font = Enum.Font.GothamBold
orderName.TextXAlignment = Enum.TextXAlignment.Left

-- nút sửa
local editBtn = Instance.new("TextButton")
editBtn.Parent = main
editBtn.Size = UDim2.new(0,75,0,30)
editBtn.Position = UDim2.new(0,230,0,52)
editBtn.BackgroundColor3 = Color3.fromRGB(45,45,45)
editBtn.BorderSizePixel = 0
editBtn.Text = "✏ Sửa"
editBtn.TextColor3 = Color3.fromRGB(255,255,255)
editBtn.TextSize = 21
editBtn.Font = Enum.Font.GothamBold

-- FPS
local fpsLabel = Instance.new("TextLabel")
fpsLabel.Parent = main
fpsLabel.Size = UDim2.new(0,140,0,24)
fpsLabel.Position = UDim2.new(0,10,0,84)
fpsLabel.BackgroundTransparency = 1
fpsLabel.Text = "FPS: 0"
fpsLabel.TextColor3 = Color3.fromRGB(255,255,255)
fpsLabel.TextSize = 17
fpsLabel.Font = Enum.Font.GothamBold
fpsLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Ping
local pingLabel = Instance.new("TextLabel")
pingLabel.Parent = main
pingLabel.Size = UDim2.new(0,140,0,24)
pingLabel.Position = UDim2.new(0,170,0,84)
pingLabel.BackgroundTransparency = 1
pingLabel.Text = "Ping: 0 ms"
pingLabel.TextColor3 = Color3.fromRGB(255,255,255)
pingLabel.TextSize = 17
pingLabel.Font = Enum.Font.GothamBold
pingLabel.TextXAlignment = Enum.TextXAlignment.Left

-- popup sửa
local popup = Instance.new("Frame")
popup.Parent = gui
popup.Size = UDim2.new(0,260,0,135)
popup.Position = UDim2.new(0.5,-130,0.5,-67)
popup.BackgroundColor3 = Color3.fromRGB(35,35,35)
popup.BorderSizePixel = 2
popup.BorderColor3 = Color3.fromRGB(255,200,0)
popup.Visible = false

local popupTitle = Instance.new("TextLabel")
popupTitle.Parent = popup
popupTitle.Size = UDim2.new(1,0,0,30)
popupTitle.BackgroundTransparency = 1
popupTitle.Text = "Nhập tên đơn"
popupTitle.TextColor3 = Color3.fromRGB(255,255,255)
popupTitle.TextSize = 18
popupTitle.Font = Enum.Font.GothamBold

local inputBox = Instance.new("TextBox")
inputBox.Parent = popup
inputBox.Size = UDim2.new(0,210,0,32)
inputBox.Position = UDim2.new(0.5,-105,0,42)
inputBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
inputBox.BorderSizePixel = 0
inputBox.PlaceholderText = "Nhập tên đơn..."
inputBox.Text = ""
inputBox.TextColor3 = Color3.fromRGB(255,255,255)
inputBox.TextSize = 15
inputBox.Font = Enum.Font.Gotham

local saveBtn = Instance.new("TextButton")
saveBtn.Parent = popup
saveBtn.Size = UDim2.new(0,90,0,32)
saveBtn.Position = UDim2.new(0.5,-45,0,88)
saveBtn.BackgroundColor3 = Color3.fromRGB(45,45,45)
saveBtn.BorderSizePixel = 0
saveBtn.Text = "💾 Lưu"
saveBtn.TextColor3 = Color3.fromRGB(255,255,255)
saveBtn.TextSize = 15
saveBtn.Font = Enum.Font.GothamBold

-- mở popup
editBtn.MouseButton1Click:Connect(function()
	popup.Visible = true
	inputBox.Text = orderName.Text
	inputBox:CaptureFocus()
end)

-- lưu
saveBtn.MouseButton1Click:Connect(function()
	local text = inputBox.Text
	orderName.Text = text
	writefile(fileName, text)
	popup.Visible = false
end)

-- FPS + Ping
local frames = 0
local lastTime = tick()

RunService.RenderStepped:Connect(function()
	frames += 1

	local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
	pingLabel.Text = "Ping: " .. ping .. " ms"

	if tick() - lastTime >= 1 then
		fpsLabel.Text = "FPS: " .. frames
		frames = 0
		lastTime = tick()
	end
end)

-- 🌈 hiệu ứng 7 màu QUANG VINH
local hue = 0
RunService.RenderStepped:Connect(function()
	hue = (hue + 0.01) % 1
	brand.TextColor3 = Color3.fromHSV(hue, 1, 1)
end)