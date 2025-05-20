local LocalPlayerUserId = game.Players.LocalPlayer.UserId
local UserId = {5335271770,4784315100,4004157046,3324915714,2964551995,7022749544,4701133524,3379428327} --填写UserID 需要,分开
local function Bmd()
    for _, UserId in pairs(UserId) do
        if UserId == LocalPlayerUserId then
            return true
        end
    end
end
if Bmd() then
else
    game.Players.LocalPlayer:kick("找山风获取白名单")
end
