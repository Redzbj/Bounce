local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window = Library:NewWindow("Cherish")
local Section = Window:NewSection("功能")

local autoFarmActive = false

Section:CreateToggle("开始传送", function(value)
    autoFarmActive = value
    if autoFarmActive then
        startAutoFarm()
    end
end)

function startAutoFarm()
    spawn(function()
        while autoFarmActive do
            pcall(function()
                local player = game.Players.LocalPlayer
                local char = player.Character or player.CharacterAdded:Wait()
                local hrp = char:FindFirstChild("HumanoidRootPart")
                
                if char and hrp then
                    local target = findClosestAliveNPC(5000, hrp)
                    
                    if target and target:FindFirstChild("HumanoidRootPart") then
                        -- Instant teleport directly above the NPC
                        hrp.CFrame = target.HumanoidRootPart.CFrame * CFrame.new(0, 3, 0)
                        attackNPC(target)
                    end
                end
            end)
            wait(0.05) -- Faster reaction time
        end
    end)
end

function attackNPC(npc)
    pcall(function()
        if npc and npc:FindFirstChild("Humanoid") and npc.Humanoid.Health > 0 then
            local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if tool then
                tool:Activate()
            end
        end
    end)
end

function findClosestAliveNPC(maxDistance, part)
    local lastDist = maxDistance
    local closest = nil

    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
            local hum = v:FindFirstChild("Humanoid")
            if hum and hum.Health > 0 and not game.Players:GetPlayerFromCharacter(v) then
                local thisDist = (v.HumanoidRootPart.Position - part.Position).Magnitude
                if thisDist < lastDist then
                    closest = v
                    lastDist = thisDist
                end
            end
        end
    end
    return closest
end