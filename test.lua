local pfs = game:GetService("PathfindingService")
local p = pfs:CreatePath()
local rm = game.ReplicatedStorage:WaitForChild("RemoteEvent")
local mv = game.ReplicatedStorage.ControlValue
endpoint = Vector3.new()
stoppathing = false
local pathfunc1 = coroutine.wrap(function(state, npc, ep)
	p:ComputeAsync(npc.HumanoidRootPart.Position, ep)
	local wps = p:GetWaypoints()
	for i,v in pairs(wps) do
		if stoppathing == true then
			mv[npc.Name].Moving.Value = false
			coroutine.yield()
		end
		mv[npc.Name].Moving.Value = true
		npc.Humanoid:MoveTo(endpoint)
		npc.Humanoid.MoveToFinished:Wait(2)
	end
end)
function Pathing(plr, state, npc, ep)
	if state == "Move" then
		pathfunc1(state, npc, ep)
		endpoint = Vector3.new(ep.x,ep.y,ep.z)
	elseif state == "Stop" then
		stoppathing = true
	end
end
rm.OnServerEvent:Connect(Pathing)
