--SHOUTOUT TO bloodball FOR CREATING WIZARD UI

local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local simulator = Library:NewWindow("zzzzz game", "#19cf83", 9160626035)

local main = simulator:NewSection("Auto Stuff")
local main2 = simulator:NewSection("FUCK YOU")
getgenv().autoNextStage = false
getgenv().autoPrestige = false
getgenv().doubleJump = false
getgenv().easyMode = false


plr = game.Players.LocalPlayer

main:CreateToggle("Auto Next Stage",function(bool)
    getgenv().autoNextStage = bool
    if bool then
        autoNextStage()
    end
end)

main:CreateToggle("Auto Prestige",function(bool)
    getgenv().autoPrestige = bool
    if bool then
        autoPrestige()
    end
end)

main2:CreateToggle("Double Jump",function(bool)
    getgenv().doubleJump = bool
    if bool then
        plr.Premium.DoubleJump.Value = true
    else 
        plr.Premium.DoubleJump.Value = false
    end

end)

main2:CreateToggle("Easy Mode",function(bool)
    getgenv().easyMode = bool
    if bool then
        easyMode()
    else 
        plr.Easy.Value = false
    end

end)

function easyMode()
    spawn(function()
        while getgenv().easyMode == true do
            plr.Easy.Value = true
              wait()
          end
      end)
end

function autoNextStage()

    spawn(function()
      while getgenv().autoNextStage == true do
            local stageCount = plr.leaderstats.Stage
            local nextStage = tostring(stageCount.Value+1)
            local fag = game.Workspace.Checkpoints:FindFirstChild(nextStage)
            plr.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(fag.CFrame.X, fag.CFrame.Y + 5, fag.CFrame.Z)
            wait()
        end
    end)
end

function autoPrestige()

    spawn(function()
      while getgenv().autoPrestige == true do

            game:GetService("ReplicatedStorage").Events.prestige:FireServer()
            wait(1)
        end
    end)
end
