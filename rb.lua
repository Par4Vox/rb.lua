-- Variables
local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local moveDistance = 10 -- Adjust the distance as needed
local waitTime = 1 -- Time to wait between movements (seconds)

-- Initial Position
local initialPosition = humanoidRootPart.Position

-- Function to perform the Pass action
local function Pass()
    local PassButton = game:GetService("Players").LocalPlayer.PlayerGui.MobileUI.Controls.Offense.Pass
    for _, connection in pairs(getconnections(PassButton.MouseButton1Click)) do
        connection:Fire()
    end
end

-- Rayfield setup
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Window =
    Rayfield:CreateWindow(
    {
        Name = "farm",
        LoadingTitle = "fart",
        LoadingSubtitle = "by me",
        ConfigurationSaving = {
            Enabled = true,
            FolderName = nil,
            FileName = "RB Fart"
        },
        Discord = {
            Enabled = false,
            Invite = "noinvitelink",
            RememberJoins = true
        },
        KeySystem = false,
        KeySettings = {
            Title = "Untitled",
            Subtitle = "Key System",
            Note = "No method of obtaining the key is provided",
            FileName = "Key",
            SaveKey = true,
            GrabKeyFromSite = false,
            Key = {"Hello"}
        }
    }
)
local Tab = Window:CreateTab("farm", 4483362458) -- Title, Image
local Section = Tab:CreateSection("farm")
Section:Set("far")

local Toggle =
    Tab:CreateToggle(
    {
        Name = "start farm",
        CurrentValue = false,
        Flag = "Toggle1",
        Callback = function(Value)
            while Value == true do
                -- Move forward
                local targetPosition = initialPosition + Vector3.new(0, 0, -moveDistance)
                humanoid:MoveTo(targetPosition)
                humanoid.MoveToFinished:Wait()
                Pass()
                task.wait(1)

                -- Move backward
                humanoid:MoveTo(initialPosition)
                humanoid.MoveToFinished:Wait()
                Pass()
                task.wait(1)

                -- Move left
                targetPosition = initialPosition + Vector3.new(-moveDistance, 0, 0)
                humanoid:MoveTo(targetPosition)
                humanoid.MoveToFinished:Wait()
                Pass()
                task.wait(1)

                -- Move right
                humanoid:MoveTo(initialPosition)
                humanoid.MoveToFinished:Wait()
                Pass()
                task.wait(1)

                -- Optional: Wait before repeating the loop
                task.wait(waitTime)
            end
        end
    }
)
