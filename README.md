local LocalPlayerUserId = game.Players.LocalPlayer.UserId
local UserId = {4784315100,3324915714,2964551995,7022749544,4701133524,3379428327,4004157046,5576690071,4100930218,5559481344,7343035256,4905225011,7974222260,8543933576} --填写UserID 需要,分开
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
