local espLabels = {}
local detectedTransmitters = {}

local function createESPLabelForTransmitter(transmitterToilet)
    if transmitterToilet and not espLabels[transmitterToilet] then
        local adornee = transmitterToilet:FindFirstChildWhichIsA("BasePart") or transmitterToilet

        local billboardGui = Instance.new("BillboardGui")
        billboardGui.Name = "ESPBillboard"
        billboardGui.Size = UDim2.new(0, 400, 0, 50)
        billboardGui.AlwaysOnTop = true
        billboardGui.Adornee = adornee
        billboardGui.Parent = game:GetService("CoreGui")

        local textLabel = Instance.new("TextLabel")
        textLabel.Name = "ESPText"
        textLabel.Text = "轰炸机"
        textLabel.Font = Enum.Font.SourceSansBold
        textLabel.TextSize = 20
        textLabel.TextColor3 = Color3.new(1, 0, 0) 
        textLabel.BackgroundTransparency = 1
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.Parent = billboardGui

        espLabels[transmitterToilet] = billboardGui
    end
end

local function checkTransmitterToilets()
    local livingFolder = workspace:FindFirstChild("Living")
    if livingFolder then
        local transmitterToilets = livingFolder:GetChildren()
        for _, transmitterToilet in ipairs(transmitterToilets) do
            if transmitterToilet.Name == "Air Dropper" and not detectedTransmitters[transmitterToilet] then
                createESPLabelForTransmitter(transmitterToilet)
                detectedTransmitters[transmitterToilet] = true  -- 仅保留标记功能
            end
        end
    end

    for transmitterToilet, billboardGui in pairs(espLabels) do
        if not transmitterToilet.Parent then
            billboardGui:Destroy()
            espLabels[transmitterToilet] = nil
            detectedTransmitters[transmitterToilet] = nil
        end
    end
end

local function startChecking()
    while wait() do
        checkTransmitterToilets()
    end
end

startChecking()