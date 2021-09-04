--original webhook by https://v3rmillion.net/member.php?action=profile&uid=923737
--original script thread : https://v3rmillion.net/showthread.php?tid=1101168
This_Script_ONLY_Works_On_SynapseX = true -- This Script ONLY Works On SynapseX
HoneyInfo = false  -- || true || false || Send a information of your honey and pollen amount every x seconds
cd = 5  --|| number bigger then 0 || Cooldown of HoneyInfo
discordid = ""  --|| Your discord id || (Leave it empty("") if u don't want a ping when u leave the game)
local webhook = ""  -- || Your discord webhook link ||
username = "Bee Swarm Simulator Log"  -- || Webhook Name ||
avatar_url = "https://t2.rbxcdn.com/5a7af67e8aff4511fa2d2e8b1914a2e2"  -- || Webhook Avatar Url ||

if not syn then return end -- Prevent people execute this script in other exploit and outputing errors
if game.PlaceId ~= 1537690962 then return end

repeat wait() until game:IsLoaded() repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenGui") repeat wait() until game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("MeterHUD") repeat wait() until game.Players.LocalPlayer.PlayerGui.ScreenGui.MeterHUD:FindFirstChild("HoneyMeter") repeat wait() until game.Players.LocalPlayer.PlayerGui.ScreenGui.MeterHUD.HoneyMeter:FindFirstChild("Bar") repeat wait() until game.Players.LocalPlayer.PlayerGui.ScreenGui.MeterHUD:FindFirstChild("PollenMeter") repeat wait() until game.Players.LocalPlayer.PlayerGui.ScreenGui.MeterHUD.PollenMeter:FindFirstChild("Bar") repeat wait() until game.Players.LocalPlayer.PlayerGui.ScreenGui.LoadingMessage.Visible == false

local Honey = game.Players.LocalPlayer.PlayerGui.ScreenGui.MeterHUD.HoneyMeter.Bar:WaitForChild("TextLabel")
local HoneyPerSec = game.Players.LocalPlayer.PlayerGui.ScreenGui.MeterHUD.HoneyMeter.Bar:WaitForChild("PerSecLabel")
local Pollen = game.Players.LocalPlayer.PlayerGui.ScreenGui.MeterHUD.PollenMeter.Bar:WaitForChild("TextLabel")
local PollenPerSec = game.Players.LocalPlayer.PlayerGui.ScreenGui.MeterHUD.PollenMeter.Bar:WaitForChild("PerSecLabel")
local Old_Time = tostring(os.date("%m/%d %X"))
local Old_Time2 = os.time()
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
	Body = game:GetService("HttpService"):JSONEncode({['username'] = username, ['avatar_url'] = avatar_url, ['embeds'] = {embed1}, ['content'] = ''}),
	Method = "POST"
})

function logHoney(Webhook, Time, Player, Message)
	local embed = {
		['description'] = "**"..Time.." "..Player..":\n "..Message.."**"
	}
	local a = syn.request({
		Url = Webhook,
		Headers = {['Content-Type'] = 'application/json'},
		Body = game:GetService("HttpService"):JSONEncode({['username'] = username, ['avatar_url'] = avatar_url, ['embeds'] = {embed}, ['content'] = ''}),
		Method = "POST"
	})
end

function logLeave(Webhook, Time, Player, Message)
	local embed2 = {
		['description'] = "**This is the End of Bee Swarm Simulator log**\n\n**"..Time.." ||"..Player.."||**:\n\n "..Message
	}
	if discordid == "" then
		local a2 = syn.request({
			Url = Webhook,
			Headers = {['Content-Type'] = 'application/json'},
			Body = game:GetService("HttpService"):JSONEncode({['username'] = username, ['avatar_url'] = avatar_url, ['content'] = '', ['embeds'] = {embed2}}),
			Method = "POST"
		})
	else
		local a2 = syn.request({
			Url = Webhook,
			Headers = {['Content-Type'] = 'application/json'},
			Body = game:GetService("HttpService"):JSONEncode({['username'] = username, ['avatar_url'] = avatar_url, ['content'] = '<@'..discordid..'>', ['embeds'] = {embed2}}),
			Method = "POST"
		})
	end
end
if cd <= 0 then
    cd = 5
    print("CoolDown Mush Bigger then 0 (Set cd to 5)")
end
local func1 = coroutine.wrap(function()
    while HoneyInfo do
	    local honeymsg = ("Honey: "..Honey.Text.." | "..HoneyPerSec.Text.."\nPollen: "..Pollen.Text.." | "..PollenPerSec.Text)
	    logHoney(webhook, GetTime(), game.Players.LocalPlayer.Name, honeymsg)
	    wait(cd)
    end
end)
func1()

function Integer_N_Comma(value)
    if tostring(value):find(".") then
       local v2 = string.split(tostring(value), ".")
       local v2 = comma_value(tonumber(v2[1]))
       return v2
    else
       local v2 = comma_value(value)
       return v2
    end
end

game.Players.PlayerRemoving:Connect(function(player)
	if player.Name == game.Players.LocalPlayer.Name then
		local timer = (os.time()-tonumber(Old_Time2))
		local msg1 = ("  **"..Old_Honey.." || "..Old_Time.."**\n\n  **"..Honey.Text.." || "..tostring(os.date("%m/%d %X")).."**\n\n  **"..comma_value(game.Players.LocalPlayer.CoreStats.Honey.Value-Old_Honey2).." || "..tostring(math.floor(timer/86400))..":"..tostring(math.floor(timer/3600)%24)..":"..tostring(math.floor(timer/60)%60)..":"..tostring(math.floor(timer%60)).."("..timer.."s)**\n\n    **"..(game.Players.LocalPlayer.CoreStats.Honey.Value-Old_Honey2)/timer.."/s**\n   **("..Integer_N_Comma((game.Players.LocalPlayer.CoreStats.Honey.Value-Old_Honey2)/timer)..")**")
		logLeave(webhook, GetTime(), player.Name, msg1)
	end
end)
