


local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/BigJoeyJoeyFunnies/Luck/main/CustomLib')))()
local Window = OrionLib:MakeWindow({Name = "Luck (Sword Fights)", HidePremium = false, SaveConfig = true, ConfigFolder = "Luckswordfighting"})


OrionLib:MakeNotification({
	Name = "sword fight script loaded!",
	Content = "sword fight script loaded!",
	Image = "rbxassetid://4483345998",
	Time = 5
})


local Tab = Window:MakeTab({
	Name = "PVP",
	Icon = "rbxassetid://14252554680",
	PremiumOnly = false
})


Tab:AddButton({
	Name = "Trigger bot (KA)",
	Callback = function()
	
 local player = game:GetService("Players").LocalPlayer
local mouse = player:GetMouse()
game:GetService("RunService").RenderStepped:Connect(function()
			if mouse.Target.Parent:FindFirstChild("Humanoid") and mouse.Target.Parent.Name ~= player.Name then
				mouse1press() wait() mouse1release()
			end
end)

  	end    
})



Tab:AddButton({
	Name = "Better Killaura",
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/BigJoeyJoeyFunnies/roux/main/killaura.lua", true))()

  	end    
})

local Tab = Window:MakeTab({
	Name = "BYPASSES",
	Icon = "rbxassetid://14252554680",
	PremiumOnly = false
})

local isTPSpeedEnabled = false
local tpSpeed = 2 
local tpDelay = 1 
local lastPosition = nil 

local function teleportForward()
    local localPlayer = game.Players.LocalPlayer
    local character = localPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local humanoidRootPart = character.HumanoidRootPart
        local forwardVector = humanoidRootPart.CFrame.lookVector
        humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position + forwardVector * tpSpeed)
    end
end

Tab:AddSlider({
    Name = "TP SPEED",
    Min = 0,
    Max = 10,
    Default = 2,
    ValueName = "Studs per Second",
    Callback = function(Value)
        tpSpeed = Value
        if isTPSpeedEnabled and lastPosition then
            teleportForward() 
        end
    end
})

Tab:AddSlider({
    Name = "Delay Between TP",
    Min = 0,
    Max = 5,
    Default = 1,
    ValueName = "Seconds",
    Callback = function(Value)
        tpDelay = Value
    end
})

Tab:AddToggle({
    Name = "TP SPEED",
    Default = false,
    Callback = function(Value)
        isTPSpeedEnabled = Value
        lastPosition = nil -- Reset the last position when enabling the toggle

        while isTPSpeedEnabled do
            local localPlayer = game.Players.LocalPlayer
            local character = localPlayer.Character

            if character and character:FindFirstChild("HumanoidRootPart") then
                local humanoidRootPart = character.HumanoidRootPart
                local currentPosition = humanoidRootPart.Position

                if lastPosition and (currentPosition - lastPosition).magnitude > 0.01 then
                    teleportForward()
                end

                lastPosition = currentPosition
            end

            wait(tpDelay) 
        end
    end
})


Tab:AddButton({
	Name = "Tp behind players!",
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/BigJoeyJoeyFunnies/roux/main/swordfighintg.lua", true))()
  	end    
})

Tab:AddButton({
    Name = "DeathPlayerTP",
    Callback = function()

        local function teleportToRandomPlayer()
            local players = game.Players:GetPlayers()
            local randomPlayer = players[math.random(1, #players)]

            if randomPlayer and randomPlayer ~= game.Players.LocalPlayer then
                local character = game.Players.LocalPlayer.Character
                if character then
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart then
                        humanoidRootPart.CFrame = randomPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
            end
        end

        local localPlayer = game.Players.LocalPlayer
        local character = localPlayer.Character
        if character then
            character:BreakJoints() -- Reset the character by breaking its joints (respawns the character)
        end

        -- Wait for the character to respawn
        local characterAddedConnection
        characterAddedConnection = localPlayer.CharacterAdded:Connect(function(respawnedCharacter)
            characterAddedConnection:Disconnect() -- Disconnect the event to avoid multiple calls
            wait(1) -- Wait for 1 second to ensure the respawn process completes
            teleportToRandomPlayer() -- Teleport the player to a random player's location after respawn
        end)

        -- Teleport the player immediately after character reset (before respawn)
        teleportToRandomPlayer()
    end    
})

local Tab = Window:MakeTab({
	Name = "MOVEMENT",
	Icon = "rbxassetid://14252554680",
	PremiumOnly = false
})

OrionLib:MakeNotification({
	Name = "warning",
	Content = "do not enable anything in the movement section in games that have anticheat",
	Image = "rbxassetid://4483345998",
	Time = 6
})


Tab:AddSlider({
	Name = "Slider",
	Min = 0,
	Max = 100,
	Default = 16,
	ValueName = "Speed",
	Callback = function(Value)
		local player = game.Players.LocalPlayer
		if player.Character and player.Character:FindFirstChild("Humanoid") then
			player.Character.Humanoid.WalkSpeed = Value
		end
	end    
})

Tab:AddSlider({
	Name = "Slider",
	Min = 0,
	Max = 100,
	Default = 50,
	ValueName = "Jump Power",
	Callback = function(Value)
		local player = game.Players.LocalPlayer
		if player.Character and player.Character:FindFirstChild("Humanoid") then
			player.Character.Humanoid.JumpPower = Value
		end
	end    
})

Tab:AddButton({
    Name = "Inf Jump",
    Save = true,
    Callback = function()
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
    if InfiniteJumpEnabled then
        game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
    end
end)
      end    
})





local Tab = Window:MakeTab({
	Name = "OTHER",
	Icon = "rbxassetid://14252554680",
	PremiumOnly = false
})



OrionLib:MakeNotification({
	Name = "warning",
	Content = "enable TP BEHIND so auto win works!",
	Image = "rbxassetid://4483345998",
	Time = 6
})



Tab:AddButton({
    Name = "FLING (gui + requires colision)",
    Callback = function()

loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()

      end    
})



Tab:AddButton({
    Name = "PlayerTP (click a few times)",
    Callback = function()

local function teleportToRandomPlayer()
    local players = game.Players:GetPlayers()
    local randomPlayer = players[math.random(1, #players)]
    
    if randomPlayer and randomPlayer ~= game.Players.LocalPlayer then
        local character = game.Players.LocalPlayer.Character
        if character then
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.CFrame = randomPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    end
end



teleportToRandomPlayer()

      end    
})


Tab:AddButton({
    Name = "Antivoid",
    Save = true,
    Callback = function()
local player = game.Players.LocalPlayer
local yOffset = -10
local gridSize = 5
local partSize = 10

local function createGroundCover()
    local character = player.Character
    if not character then
        return
    end

    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then
        return
    end

    local position = rootPart.Position

    local groundCover = Instance.new("Part")
    groundCover.Size = Vector3.new((gridSize * 2 + 1000000000) * partSize, 1, (gridSize * 2 + 1000000000) * partSize)
    groundCover.Anchored = true
    groundCover.CanCollide = true
    groundCover.BrickColor = BrickColor.new("Bright red")
    groundCover.Transparency = 0.5
    groundCover.Position = Vector3.new(position.X, position.Y + yOffset, position.Z)
    groundCover.Parent = workspace
end

createGroundCover()

      end    
})


local isAutoWinEnabled = false

local function isPlayerKillable(player)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        return not player.Character:FindFirstChild("ForceField")
    end
    return false
end

local function teleportToNextAlivePlayer()
    local players = game.Players:GetPlayers()
    local localPlayer = game.Players.LocalPlayer
    local currentIndex = math.random(1, #players)
    local nextIndex = currentIndex

    repeat
        nextIndex = nextIndex + 1
        if nextIndex > #players then
            nextIndex = 1
        end

        local targetPlayer = players[nextIndex]

        if targetPlayer ~= localPlayer and isPlayerKillable(targetPlayer) then
            local humanoidRootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            end
        end

        wait(1) 

    until not isAutoWinEnabled
end

Tab:AddToggle({
    Name = "Auto Win Toggle",
    Default = false,
    Callback = function(Value)
        isAutoWinEnabled = Value
        if isAutoWinEnabled then
            teleportToNextAlivePlayer()
        end
    end
})


