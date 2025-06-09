local LocalPlayerUserId = game.Players.LocalPlayer.UserId
local UserId = {7974222260,4660640063,3324915714,4004157046,4100930218} --填写UserID 需要,分开
local function Bmd()
    for _, UserId in pairs(UserId) do
        if UserId == LocalPlayerUserId then
            return true
        end
    end
end
if Bmd() then
else
    game.Players.LocalPlayer:kick("白名单已重新开启，找山风获取")
end
