


local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/BigJoeyJoeyFunnies/Luck/main/CustomLib')))()
local Window = OrionLib:MakeWindow({Name = "Luck (Flag wars)", HidePremium = false, SaveConfig = true, ConfigFolder = "Luck/Flagwars"})



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
	Name = "Aimbot",
	Callback = function()
	
 local currPlayer = game:GetService('Players').LocalPlayer
    local servPlayer = game:GetService('Players')

    local RunService = game:GetService('RunService')
    local servTeams = game:GetService("Teams")

    local currMouse = currPlayer:GetMouse()
    local currCamera = game:GetService("Workspace").CurrentCamera


    getgenv().GameSettings = {
        SilentAim = {
            ["active"] = true,
            ["fov"] = 100,
            ["hitpart"] = "Head",
            ["circlevis"] = true,
            ["wallbang"] = false,
            ["circcolor"] = Color3.fromRGB(228, 9, 191)
        }
    }


    local CircleInline = Drawing.new("Circle")
    local CircleOutline = Drawing.new("Circle")
    CircleInline.Radius = getgenv().GameSettings.SilentAim.fov
    CircleInline.Thickness = 2
    CircleInline.Position = Vector2.new(currCamera.ViewportSize.X / 2, currCamera.ViewportSize.Y / 2)
    CircleInline.Transparency = 1
    CircleInline.Color = getgenv().GameSettings.SilentAim.circcolor
    CircleInline.Visible = getgenv().GameSettings.SilentAim.circlevis
    CircleInline.ZIndex = 2
    CircleOutline.Radius = getgenv().GameSettings.SilentAim.fov
    CircleOutline.Thickness = 4
    CircleOutline.Position = Vector2.new(currCamera.ViewportSize.X / 2, currCamera.ViewportSize.Y / 2)
    CircleOutline.Transparency = 1
    CircleOutline.Color = Color3.new()
    CircleOutline.Visible = getgenv().GameSettings.SilentAim.circlevis
    CircleOutline.ZIndex = 1


    function isSameTeam(player)
        if player.team ~= currPlayer.team and player.team ~= servTeams["Neutral"] then
            return false
        else
            return true
        end
    end

    function isDead(player)
        if
            player == nil or player.Character == nil or player.Character:FindFirstChildWhichIsA("Humanoid") == nil or
                player.Character.Humanoid.Health <= 0
        then
            return true
        else
            return false
        end
    end


        local function isClosestPlayer()
            local target
            local dist = math.huge
            for _, v in next, servPlayer:GetPlayers() do
                if
                    not isDead(v) and v ~= currPlayer and not isSameTeam(v) and v.Character:FindFirstChild("Head") and
                        getgenv().GameSettings.SilentAim.active
                then
                    local pos, visible = currCamera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
                    local magnitude = (Vector2.new(currMouse.X, currMouse.Y) - Vector2.new(pos.X, pos.Y)).magnitude
                    if magnitude < (getgenv().GameSettings.SilentAim.fov) then
                        if magnitude < dist then
                            if getgenv().GameSettings.SilentAim.wallbang then
                                target = v
                                dist = magnitude
                            else
                                if visible then
                                    target = v
                                    dist = magnitude
                            end
                        end
    
    
                        end
                    end
                end
            end
            return target
        end
    
    
        local target
        local gmt = getrawmetatable(game)
        setreadonly(gmt, false)
        local oldNamecall = gmt.__namecall
    
        gmt.__namecall =
            newcclosure(
            function(self, ...)
                local Args = {...}
                local method = getnamecallmethod()
                if tostring(self) == "WeaponHit" and tostring(method) == "FireServer" then
                    target = isClosestPlayer()
                    if target then
                        Args[2]["part"] = target.Character[getgenv().GameSettings.SilentAim.hitpart]
                        return self.FireServer(self, unpack(Args))
                    end
                end
                return oldNamecall(self, ...)
            end
        )

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
	Name = "TP behind players!",
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/BigJoeyJoeyFunnies/roux/main/swordfighintg.lua", true))()
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



Tab:AddButton({
    Name = "DeathPlayerTP",
    Callback = function()

        local function teleportToRandomPlayer()
            local localPlayer = game.Players.LocalPlayer
            local players = game.Players:GetPlayers()
            local randomPlayer = players[math.random(1, #players)]

            if randomPlayer and randomPlayer.Team ~= localPlayer.Team then
                local character = localPlayer.Character
                if character then
                    character:BreakJoints() 
                end

                local characterAddedConnection
                characterAddedConnection = localPlayer.CharacterAdded:Connect(function(respawnedCharacter)
                    characterAddedConnection:Disconnect() -- Disconnect the event to avoid multiple calls
                    wait(1) -- Wait for 1 second to ensure the respawn process completes
                    local respawnedPlayer = game.Players:GetPlayerFromCharacter(respawnedCharacter)
                    if respawnedPlayer and respawnedPlayer == localPlayer then
                        local humanoidRootPart = respawnedCharacter:FindFirstChild("HumanoidRootPart")
                        if humanoidRootPart then
                            humanoidRootPart.CFrame = randomPlayer.Character.HumanoidRootPart.CFrame
                        end
                    end
                end)

                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    humanoidRootPart.CFrame = randomPlayer.Character.HumanoidRootPart.CFrame
                end
            else
                teleportToRandomPlayer()
            end
        end

        teleportToRandomPlayer()

    end    
})



local Tab = Window:MakeTab({
	Name = "EXPLOITS",
	Icon = "rbxassetid://14252554680",
	PremiumOnly = false
})



Tab:AddButton({
	Name = "TPAURA",
	Callback = function()
	
  local currPlayer = game:GetService("Players").LocalPlayer
    local servPlayer = game:GetService("Players")
    
    local teams = game:GetService("Teams")
    
    function isSameTeam(player)
        if player.Team ~= currPlayer.Team and player.Team ~= teams["Neutral"] then
            return false
        else
            return true
        end
    end
    
    while true do
        for _, v in ipairs(servPlayer:GetPlayers()) do
            if v ~= currPlayer and not isSameTeam(v) then
                -- Make the player's character invisible
                for _, part in ipairs(v.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.Transparency = 1
                        part.CanCollide = false
                    end
                end
                -- Teleport the player
                v.Character.HumanoidRootPart.CFrame = currPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(2.2, 0.5, -6)
            end
        end
        task.wait()
    end
  	end    
})



Tab:AddButton({
    Name = "Dirt Exploit",
    Callback = function()
        local workspaceParts = workspace:GetDescendants()
        for _, obj in ipairs(workspaceParts) do
            if obj:IsA("BasePart") and obj.Name == "dirt" then
                obj:Destroy()
            end
        end
    end
})



Tab:AddButton({
	Name = "SniperExploit",
	Callback = function()
	
  local servPlayer = game:GetService("Players")
    local currPlayer = game:GetService('Players').LocalPlayer
    
    function getEquippedWeapon(player)
        local char = player.Character
        local weapon = char and char:FindFirstChildWhichIsA("Tool")
    
        if weapon ~= nil then
            return weapon.Name
        else
            return "Holstered"
        end
    end
    
    local currWeapon = getEquippedWeapon(currPlayer)
    
    for _, v in pairs(servPlayer:GetPlayers()) do
        if v.Name ~= currPlayer.Name then
            task.wait(1)
    local args = {
        [1] = game:GetService("Players").LocalPlayer.Character[currWeapon],
        [2] = {
            ["p"] = Vector3.new(127.24491882324219, 16.624034881591797, -84.08683776855469),
            ["pid"] = 1,
            ["part"] = v.Character.Head,
            ["d"] = 80.71643829345703,
            ["maxDist"] = 80.71429443359375,
            ["h"] = v.Character.Humanoid,
            ["m"] = Enum.Material.SmoothPlastic,
            ["sid"] = 1,
            ["t"] = 0.8510603182300679,
            ["n"] = Vector3.new(-0.20354677736759186, -0.016248714178800583, 0.9789304733276367)
        }
    }
    
    if state == true then
    game:GetService("ReplicatedStorage").WeaponsSystem.Network.WeaponHit:FireServer(unpack(args))
    end
    end
    end

  	end    
})

OrionLib:MakeNotification({
	Name = "warning",
	Content = "enable TP BEHIND so auto win works!",
	Image = "rbxassetid://4483345998",
	Time = 6
})



