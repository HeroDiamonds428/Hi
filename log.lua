--webhook part by https://v3rmillion.net/member.php?action=profile&uid=923737
--original thread : https://v3rmillion.net/showthread.php?tid=1101168
cd = 5
local webhook = "<WebHook Here>"

if game.PlaceId ~= 1537690962 then return end
repeat
	wait()
until game:IsLoaded()
repeat
	wait()
until game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenGui")
repeat
	wait()
until game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("MeterHUD")
repeat
	wait()
until game.Players.LocalPlayer.PlayerGui.ScreenGui.MeterHUD:FindFirstChild("HoneyMeter")
repeat
	wait()
until game.Players.LocalPlayer.PlayerGui.ScreenGui.MeterHUD.HoneyMeter:FindFirstChild("Bar")
repeat
	wait()
until game.Players.LocalPlayer.PlayerGui.ScreenGui.LoadingMessage.Visible == false



local Honey = game.Players.LocalPlayer.PlayerGui.ScreenGui.MeterHUD.HoneyMeter.Bar:WaitForChild("TextLabel")
local Old_Time = tostring(os.date("%m/%d %X"))
local Old_Honey = Honey.Text
local Old_Honey2 = game.Players.LocalPlayer.CoreStats.Honey.Value
local New_Honey, New_Honey2, HoneySum, New_Time, Timer

function GetTime()
	local re = tostring(os.date("%m/%d/%Y %X"))
	return re
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

local embed1 = {
	['title'] = 'Bee Swarm Simulator\nStarted Tracking Player Honey Amount at\n'..tostring(os.date("%m/%d/%Y %X"))
}
local a = syn.request({
	Url = webhook,
	Headers = {['Content-Type'] = 'application/json'},
	Body = game:GetService("HttpService"):JSONEncode({['embeds'] = {embed1}, ['content'] = ''}),
	Method = "POST"
})

function logHoney(Webhook, Time, Player, Message)
	local embed = {
		['description'] = Time.." "..Player..":\n **"..Message.."**"
	}
	local a = syn.request({
		Url = Webhook,
		Headers = {['Content-Type'] = 'application/json'},
		Body = game:GetService("HttpService"):JSONEncode({['embeds'] = {embed}, ['content'] = ''}),
		Method = "POST"
	})
end

function logLeave(Webhook, Time, Player, Message)
	local embed2 = {
		['description'] = "**This is the End of Bee Swarm Simulator log**\n\n**"..Time.." "..Player.."**:\n\n "..Message
	}
	local a2 = syn.request({
		Url = Webhook,
		Headers = {['Content-Type'] = 'application/json'},
		Body = game:GetService("HttpService"):JSONEncode({['embeds'] = {embed2}, ['content'] = ''}),
		Method = "POST"
	})
end

Cooldown = false
Honey:GetPropertyChangedSignal("Text"):Connect(function()
	if Cooldown == true then
		return
	else
		Cooldown = true
		logHoney(webhook, GetTime(), game.Players.LocalPlayer.Name, Honey.Text)
		wait(cd)
		Cooldown = false
	end
end)

function Integer_N_Comma(value)
    if value:find(".") then
       local v2 = string.split(value, ".")
       local v2 = comma_value(v2)
       return v2
    else
       local v2 = comma_value(value)
       return v2
    end
end

local timer = coroutine.wrap(function()
    for i=0,math.huge,1 do
    	Timer=i/5
    	wait(0.2)
    end
end)
timer()

game.Players.PlayerRemoving:Connect(function(player)
	if player.Name == game.Players.LocalPlayer.Name then
		local msg1 = ("  **"..Old_Honey.." || "..Old_Time.."**\n\n  **"..Honey.Text.." || "..tostring(os.date("%m/%d %X")).."**\n\n  **"..comma_value(game.Players.LocalPlayer.CoreStats.Honey.Value-Old_Honey2).." || "..tostring(math.floor(Timer/86400)%365)..":"..tostring(math.floor(Timer/3600)%24)..":"..tostring(math.floor(Timer/60)%60)..":"..tostring(math.floor(Timer%60)).."("..Timer.."s)**\n\n    **"..(game.Players.LocalPlayer.CoreStats.Honey.Value-Old_Honey2)/Timer.."/s**\n   **("..Integer_N_Comma((game.Players.LocalPlayer.CoreStats.Honey.Value-Old_Honey2)/Timer)..")**")
		timer()
		logLeave(webhook, GetTime(), player.Name, msg1)
	end
end)