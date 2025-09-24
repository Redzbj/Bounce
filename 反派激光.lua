local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "GasterBlasterGUI"
gui.Parent = player:WaitForChild("PlayerGui")

-- 创建主窗口框架
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 200, 0, 100)  -- 窗口大小
mainFrame.Position = UDim2.new(0.5, -100, 0.5, -50)  -- 居中
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(200, 50, 50)  -- 红色背景
mainFrame.Active = true
mainFrame.Draggable = true  -- 可拖动
mainFrame.Parent = gui

-- 添加标题栏
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 20)
titleBar.BackgroundColor3 = Color3.fromRGB(150, 30, 30)
titleBar.Parent = mainFrame

-- 标题文本
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, -20, 1, 0)
title.Position = UDim2.new(0, 5, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Gaster Blaster"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = titleBar

-- 关闭按钮
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Position = UDim2.new(1, -20, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Parent = titleBar

-- 执行按钮
local executeButton = Instance.new("TextButton")
executeButton.Name = "ExecuteButton"
executeButton.Size = UDim2.new(0.8, 0, 0.4, 0)
executeButton.Position = UDim2.new(0.1, 0, 0.3, 0)
executeButton.BackgroundColor3 = Color3.fromRGB(150, 30, 30)
executeButton.Text = "启动"
executeButton.TextColor3 = Color3.new(1, 1, 1)
executeButton.Parent = mainFrame

-- 状态文本
local statusText = Instance.new("TextLabel")
statusText.Name = "StatusText"
statusText.Size = UDim2.new(0.8, 0, 0.2, 0)
statusText.Position = UDim2.new(0.1, 0, 0.75, 0)
statusText.BackgroundTransparency = 1
statusText.Text = "就绪"
statusText.TextColor3 = Color3.new(1, 1, 1)
statusText.Parent = mainFrame

-- 脚本逻辑
local args = {
    [1] = Vector3.new(625.0844116210938, -406.0308837890625, -665.1387329101562)
}

local isRunning = false
local connection

-- 关闭按钮功能
closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
    if connection then
        connection:Disconnect()
    end
end)

-- 执行按钮功能
executeButton.MouseButton1Click:Connect(function()
    if isRunning then
        -- 停止执行
        isRunning = false
        executeButton.Text = "启动"
        statusText.Text = "已停止"
        if connection then
            connection:Disconnect()
        end
    else
        -- 开始执行
        isRunning = true
        executeButton.Text = "停止"
        statusText.Text = "运行中..."
        
        connection = game:GetService("RunService").Heartbeat:Connect(function()
            game:GetService("ReplicatedStorage").VillanArcGasterBlaster:FireServer(unpack(args))
            task.wait(0.1)  -- 使用task.wait代替wait
        end)
    end
end)