local player = game.Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
ScreenGui.Name = "AutoFarmUI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 220, 0, 120)
Frame.Position = UDim2.new(0, 10, 0, 100)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.BorderSizePixel = 0


local autoBlowButton = Instance.new("TextButton", Frame)
autoBlowButton.Size = UDim2.new(0, 200, 0, 40)
autoBlowButton.Position = UDim2.new(0, 10, 0, 10)
autoBlowButton.Text = ":repeat: Toggle Auto Blow"
autoBlowButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
autoBlowButton.TextColor3 = Color3.fromRGB(255, 255, 255)
autoBlowButton.BorderSizePixel = 0


local autoTPButton = Instance.new("TextButton", Frame)
autoTPButton.Size = UDim2.new(0, 200, 0, 40)
autoTPButton.Position = UDim2.new(0, 10, 0, 60)
autoTPButton.Text = ":rocket: Auto Teleport: OFF"
autoTPButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
autoTPButton.TextColor3 = Color3.fromRGB(255, 255, 255)
autoTPButton.BorderSizePixel = 0


_G.autoBlow = false
autoBlowButton.MouseButton1Click:Connect(function()
    _G.autoBlow = not _G.autoBlow
    if _G.autoBlow then
        autoBlowButton.Text = ":white_check_mark: Auto Blow: ON"
        spawn(function()
            while _G.autoBlow do
                local args = { [1] = "BlowBubble" }
                game:GetService("ReplicatedStorage").Shared.Framework.Network.Remote.Event:FireServer(unpack(args))
                wait(0.5)
            end
        end)
    else
        autoBlowButton.Text = ":repeat: Auto Blow: OFF"
    end
end)


_G.autoTP = false
autoTPButton.MouseButton1Click:Connect(function()
    _G.autoTP = not _G.autoTP
    if _G.autoTP then
        autoTPButton.Text = ":white_check_mark: Auto Teleport: ON"
        spawn(function()
            while _G.autoTP do
                local target = Vector3.new(-70.8165, 6859.5371, 116.4982) -- ตำแหน่งที่ต้องการวาร์ป
                local char = player.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    char.HumanoidRootPart.CFrame = CFrame.new(target)
                end
                wait(10) 
            end
        end)
    else
        autoTPButton.Text = ":rocket: Auto Teleport: OFF"
    end
end)