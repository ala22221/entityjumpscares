local REBOUND_IMAGE = "rbxassetid://95524729864776"
local REBOUND_SOUND = "rbxassetid://92911265618024"

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "ReboundJumpscare"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = playerGui

local BGC = Instance.new("Frame")
BGC.Name = "BGC"
BGC.Size = UDim2.fromScale(1, 1)
BGC.Position = UDim2.fromScale(0, 0)
BGC.BackgroundTransparency = 1
BGC.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
BGC.BorderSizePixel = 0
BGC.Visible = false
BGC.ZIndex = 1
BGC.Parent = gui

local Rebound = Instance.new("ImageLabel")
Rebound.Name = "Rebound"
Rebound.BackgroundTransparency = 1
Rebound.Image = REBOUND_IMAGE
Rebound.Visible = false
Rebound.ZIndex = 2

Rebound.Size = UDim2.new(0.142, 0, 0.318, 0)
Rebound.Position = UDim2.new(0.429, 0, 0.34, 0)

Rebound.ImageTransparency = 0
Rebound.ImageColor3 = Color3.fromRGB(255, 255, 255)

Rebound.Parent = gui

local ReboundScream = Instance.new("Sound")
ReboundScream.Name = "ReboundScream"
ReboundScream.SoundId = REBOUND_SOUND
ReboundScream.Volume = 1
ReboundScream.Parent = gui

local t4 = {
	Color3.fromRGB(146, 255, 237),
	Color3.fromRGB(196, 169, 255),
	Color3.fromRGB(120, 174, 255),
	Color3.fromRGB(210, 233, 255),
	Color3.fromRGB(37, 84, 255),
	Color3.fromRGB(133, 255, 237)
}

local t5 = {
	Color3.fromRGB(255, 155, 155),
	Color3.fromRGB(146, 255, 237),
	Color3.fromRGB(196, 169, 255),
	Color3.fromRGB(120, 174, 255),
	Color3.fromRGB(210, 233, 255),
	Color3.fromRGB(37, 84, 255),
	Color3.fromRGB(119, 85, 255)
}

local function PlayRebound()

	ReboundScream:Stop()
	ReboundScream.TimePosition = 0
	ReboundScream.PlaybackSpeed = 1

	BGC.Visible = true
	BGC.BackgroundTransparency = 0
	BGC.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

	Rebound.Visible = true
	Rebound.ImageTransparency = 0
	Rebound.ImageColor3 = Color3.fromRGB(255, 255, 255)
	Rebound.Rotation = 0
	Rebound.Position = UDim2.new(0.429, 0, 0.34, 0)
	Rebound.Size = UDim2.new(0.142, 0, 0.318, 0)

	for i = 1, math.random(15, 30) do

		local v3 = math.random(-1, 250)

		Rebound.Rotation = math.random(-30, 30)

		Rebound.Position =
			UDim2.new(0.429, 0, 0.34, 0)
			+ UDim2.new(
				0,
				math.random(-60, 60),
				0,
				math.random(-60, 60)
			)

		Rebound.Size =
			UDim2.new(0.142, 0, 0.318, 0)
			+ UDim2.new(
				0,
				v3,
				0,
				v3
			)

		Rebound.ImageColor3 =
			t5[math.random(#t5)]

		BGC.BackgroundColor3 =
			t4[math.random(#t4)]

		BGC.BackgroundTransparency = 0

		ReboundScream:Resume()

		ReboundScream.PlaybackSpeed =
			math.random(80, 120) / 100

		ReboundScream.TimePosition =
			ReboundScream.TimePosition
			+ math.random(-10, 10) / 10

		task.wait(
			0.12 / math.random(3, 420)
		)
	end

	ReboundScream:Play()

	TweenService:Create(
		Rebound,
		TweenInfo.new(0.2),
		{
			Rotation = math.random(-60, 60),
			Position = UDim2.new(-0.283, 0, -0.875, 0),
			Size = UDim2.new(1.428, 0, 3.098, 0)
		}
	):Play()

	task.wait(0.2)

	ReboundScream:Stop()


	BGC.Visible = false
	BGC.BackgroundTransparency = 1


	local fade = TweenService:Create(
		Rebound,
		TweenInfo.new(1),
		{
			ImageTransparency = 1,
			ImageColor3 = Color3.fromRGB(255, 0, 0)
		}
	)

	fade:Play()
	fade.Completed:Wait()

	Rebound.Visible = false

	-- Reset everything
	BGC.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

	Rebound.ImageTransparency = 0
	Rebound.ImageColor3 = Color3.fromRGB(255, 255, 255)
	Rebound.Rotation = 0
	Rebound.Position = UDim2.new(0.429, 0, 0.34, 0)
	Rebound.Size = UDim2.new(0.142, 0, 0.318, 0)

	ReboundScream.TimePosition = 0
	ReboundScream.PlaybackSpeed = 1
end

PlayRebound()
