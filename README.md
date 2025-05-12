local LocalPlayerUserId = game.Players.LocalPlayer.UserId
local UserId = {5335271770,4784315100} --填写UserID 需要,分开
local function Bmd()
    for _, UserId in pairs(UserId) do
        if UserId == LocalPlayerUserId then
            return true
        end
    end
end
if Bmd() then
else
    game.Players.LocalPlayer:kick("You has been bannd Reason:exploting/script hack")
end
