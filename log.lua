--original webhook by https://v3rmillion.net/member.php?action=profile&uid=923737
--original script thread : https://v3rmillion.net/showthread.php?tid=1101168
HoneyInfo = true  -- || true || false || Send a information of your honey and pollen amount every x seconds
_G.cd = 60  --|| number bigger then 0 || Cooldown of HoneyInfo
discordid = ""  --|| Your discord id || (Leave it empty("") if u don't want a ping when u leave the game)
webhook = "https://discord.com/api/webhooks/874726048841998347/n56DY0RtQvoAOM3OACfNxSZlcOksY1Vkv2K1tS9z7Pj3Fiv2qjBO6KmNgt7tQ-4V0F3w"  -- || Your discord webhook link ||
username = "Bee Swarm Simulator Log"  -- || Webhook Name ||
avatar_url = "https://t2.rbxcdn.com/5a7af67e8aff4511fa2d2e8b1914a2e2"  -- || Webhook Avatar Url ||

if game.PlaceId ~= 1537690962 then return end

repeat wait() until game:IsLoaded() repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenGui") repeat wait() until game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("MeterHUD") repeat wait() until game.Players.LocalPlayer.PlayerGui.ScreenGui.MeterHUD:FindFirstChild("HoneyMeter") repeat wait() until game.Players.LocalPlayer.PlayerGui.ScreenGui.MeterHUD.HoneyMeter:FindFirstChild("Bar") repeat wait() until game.Players.LocalPlayer.PlayerGui.ScreenGui.MeterHUD:FindFirstChild("PollenMeter") repeat wait() until game.Players.LocalPlayer.PlayerGui.ScreenGui.MeterHUD.PollenMeter:FindFirstChild("Bar") repeat wait() until game.Players.LocalPlayer.PlayerGui.ScreenGui.LoadingMessage.Visible == false

local lp = game.Players.LocalPlayer
local lpname = lp.Name
local Honey = lp.PlayerGui.ScreenGui.MeterHUD.HoneyMeter.Bar.TextLabel
local Pollen = lp.PlayerGui.ScreenGui.MeterHUD.PollenMeter.Bar:WaitForChild("TextLabel")
local Old_Time = tostring(os.date("%m/%d %X"))
local Old_Time2 = os.time()
local Old_Honey = Honey.Text
local Old_Honey2 = lp.CoreStats.Honey.Value
local New_Honey, New_Honey2, HoneySum, New_Time, Timer


function GetTime()
	return tostring(os.date("%m/%d/%Y %X"))
end

function RemoveSpace(v)
    if tostring(v):find(" ") then
        string.split(tostring(v)," ")
        return v[1]
    end
end

function comma_value(amount)
	while true do
		amount, k = string.gsub(amount, "^(-?%d+)(%d%d%d)", '%1,%2')
		if k == 0 then
			break
		end
	end
	return amount
end
function Integer_N_Comma(value)
    if tostring(value):find(".") then
       local v2 = string.split(tostring(value), ".")
       return comma_value(tonumber(v2[1]))
    else
       return comma_value(value)
    end
end
function SendRequest(v,msg)
    if v=="title" then
        local embed = {
        	['title'] = msg
        }
    elseif v=="description" then
    	local embed = {
    		['description'] = msg
    	}
    end
    if discordid == "" then
    	local rq = syn.request({
    		Url = Webhook,
    		Headers = {['Content-Type'] = 'application/json'},
    		Body = game:GetService("HttpService"):JSONEncode({['username'] = username, ['avatar_url'] = avatar_url, ['content'] = '<@'..discordid..'>', ['embeds'] = {embed}}),
    		Method = "POST"
    	})
	else
    	local rq = syn.request({
    		Url = Webhook,
    		Headers = {['Content-Type'] = 'application/json'},
    		Body = game:GetService("HttpService"):JSONEncode({['username'] = username, ['avatar_url'] = avatar_url, ['content'] = '', ['embeds'] = {embed}}),
    		Method = "POST"
    	})
	end
end

SendRequest("title",'Bee Swarm Simulator\nStarted Tracking Player Honey Amount at\n'..tostring(os.date("%m/%d/%Y %X")))

if _G.cd <= 0 then
    _G.cd = 60
    print("CoolDown Must Bigger then 0 (Set cd to 60)")
end
function RemoveComma(v)
    if tostring(v):find(",") then
        v2, t = string.gsub(tostring(v), ",", "")
        return tonumber(v2)
    end
end
local LogHoney = coroutine.wrap(function()
    while HoneyInfo do
        local old = RemoveComma(Honey.Text)
        wait(_G.cd)
        local new = RemoveComma(Honey.Text)
        SendRequest("description","**Honey Log Sends Every ".._G.cd.." Seconds\n"..GetTime().." ||"..lpname.."||:\n "..("Honey: "..Honey.Text.." | "..Integer_N_Comma((new-old)/_G.cd).."/s | ("..Integer_N_Comma(new-old).."/".._G.cd.."s)\nPollen: "..Pollen.Text).."**")
    end
end)

local LogOtherHoney = coroutine.wrap(function()
    for i,plr in pairs(game.Players:GetPlayers()) do
        wait(0.75)
        if plr.Name ~= lp.Name then
            repeat wait() until plr:FindFirstChild("CoreStats") repeat wait() until plr.CoreStats:FindFirstChild("Honey") repeat wait() until plr.CoreStats.Honey.Value ~= 0
            SendRequest("description","**Honey Log (Other Players)\n"..GetTime().." LocalPlayer : ||"..lpname.."||\n "..plr.Name.." : "..comma_value(plr:WaitForChild("CoreStats"):WaitForChild("Honey").Value).."**")
        end
    end
end)

game.Players.PlayerAdded:Connect(function(plr)
    if plr.Name ~= lp.Name then
        repeat wait() until plr:FindFirstChild("CoreStats") repeat wait() until plr.CoreStats:FindFirstChild("Honey") repeat wait() until plr.CoreStats.Honey.Value ~= 0
        SendRequest("description","**Honey Log (Other Players)\n"..GetTime().." LocalPlayer : ||"..lpname.."||\n "..plr.Name.." : "..comma_value(plr:WaitForChild("CoreStats"):WaitForChild("Honey").Value).."**")
    end
end)

game.Players.PlayerRemoving:Connect(function(player)
	if player.Name == game.Players.LocalPlayer.Name then
		local timer = (os.time()-tonumber(Old_Time2))
        SendRequest("description","**This is the End of Bee Swarm Simulator log**\n\n**"..GetTime().." ||"..lpname.."||**:\n\n "..("  **"..Old_Honey.." || "..Old_Time.."**\n\n  **"..Honey.Text.." || "..tostring(os.date("%m/%d %X")).."**\n\n  **"..comma_value(game.Players.LocalPlayer.CoreStats.Honey.Value-Old_Honey2).." || "..tostring(math.floor(timer/86400))..":"..tostring(math.floor(timer/3600)%24)..":"..tostring(math.floor(timer/60)%60)..":"..tostring(math.floor(timer%60)).."("..timer.."s)**\n\n    **"..(game.Players.LocalPlayer.CoreStats.Honey.Value-Old_Honey2)/timer.."/s**\n   **("..Integer_N_Comma((game.Players.LocalPlayer.CoreStats.Honey.Value-Old_Honey2)/timer)..")**"))
	end
end)

LogHoney()
LogOtherHoney()
