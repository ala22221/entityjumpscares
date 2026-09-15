local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")


local REBOUND_IMAGE = "rbxassetid://94841181437395"
local REBOUND_SOUND = "rbxassetid://88369282881781"


local gui = Instance.new("ScreenGui")
gui.Name = "ReboundJumpscare"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = playerGui


local bg = Instance.new("Frame")
bg.Name = "BGC"
bg.Size = UDim2.fromScale(1, 1)
bg.Position = UDim2.fromScale(0, 0)
bg.BackgroundColor3 = Color3.fromRGB(2, 25, 99)
bg.BackgroundTransparency = 1
bg.BorderSizePixel = 0
bg.Parent = gui


local rebound = Instance.new("ImageLabel")
rebound.Name = "Rebound"
rebound.Size = UDim2.fromScale(1, 1)
rebound.Position = UDim2.fromScale(0, 0)
rebound.BackgroundTransparency = 1
rebound.Image = REBOUND_IMAGE
rebound.ScaleType = Enum.ScaleType.Stretch
rebound.Visible = false
rebound.Parent = gui

local scream = Instance.new("Sound")
scream.Name = "ReboundScream"
scream.SoundId = REBOUND_SOUND
scream.Volume = 1
scream.PlaybackSpeed = 3
scream.Parent = gui


local pitch = Instance.new("PitchShiftSoundEffect")
pitch.Name = "Pitch"
pitch.Octave = 0.5
pitch.Priority = 0
pitch.Parent = scream


local equalizer = Instance.new("EqualizerSoundEffect")
equalizer.Name = "Equalizer"
equalizer.HighGain = 10
equalizer.LowGain = 3.7
equalizer.MidGain = 10
equalizer.Priority = 0
equalizer.Parent = scream


local distortion = Instance.new("DistortionSoundEffect")
distortion.Name = "Distortion"
distortion.Level = 0.75
distortion.Priority = 0
distortion.Parent = scream

-- Jumpscare
local function reboundJumpscare()

	-- Reset
	bg.BackgroundTransparency = 1
	bg.BackgroundColor3 = Color3.fromRGB(2, 25, 99)

	rebound.Visible = true
	rebound.Size = UDim2.fromScale(1, 1)
	rebound.Position = UDim2.fromScale(0, 0)


	TweenService:Create(
		bg,
		TweenInfo.new(0.1),
		{
			BackgroundTransparency = 0,
			BackgroundColor3 = Color3.fromRGB(2, 25, 99)
		}
	):Play()


	scream:Play()

	task.wait(0.2)


	TweenService:Create(
		rebound,
		TweenInfo.new(0.7),
		{
			Size = UDim2.new(1.982, 0, 2.257, 0),
			Position = UDim2.new(-0.499, 0, -0.496, 0)
		}
	):Play()


	TweenService:Create(
		bg,
		TweenInfo.new(
			0.1,
			Enum.EasingStyle.Sine,
			Enum.EasingDirection.InOut,
			3,
			true
		),
		{
			BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		}
	):Play()

	task.wait(0.4)


	rebound.Visible = false
	scream:Stop()

	-- Reset
	bg.BackgroundTransparency = 1
	bg.BackgroundColor3 = Color3.fromRGB(2, 25, 99)
end


reboundJumpscare()
