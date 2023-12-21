if Tower_Defense_Simulator_Script_Game == nil or typeof(Tower_Defense_Simulator_Script_Game) ~= "table" then
	getgenv()["Tower_Defense_Simulator_Script_Game"] = {}
end
if not game:IsLoaded() then
    game.Loaded:Wait()
end
local Core, wait, spawn = Tower_Defense_Simulator_Script_Game, task.wait, task.spawn
if game.PlaceId == 5591597781 then
    local function SetValue(v1,v2)
        for i,v in pairs(v1) do
            if Core[i] == nil then
                Core[i] = v
            end
        end
        for i,v in pairs(v2) do
            Core[i] = v
        end
    end
    SetValue({["AbilitySpam"] = false,["PlaceAtZeroZeroZero"] = false,["GameGui"] = false,["autoskipAct"] = false,["LastPosAct"] = false,["RandomRotation"] = false,["CopyToClipBoard"] = false,["FastPlace"] = false,["FastUpgrade"] = false,["Included"] = false,
        ["locky"] = true,["AutoSellFarms"] = true, ["BetterPlacing"] = true, ["TDSScriptLoading"] = true, ["AutoRefresh"] = true,
        ["UpgradeFromLvl"] = 0,["UpgradeToLvl"] = 1,["UpgradeCount"] = 0,["eX"] = 0,["eY"] = 8,["eZ"] = 0,["StackAmount"] = 1,["stackspeed"] = 200,["Xr"] = 0,["Yr"] = 0,["Zr"] = 0, ["chainindex"] = 0, ["ExecuteTime"] = 0,
        ["CommanderChain"] = {},["CommanderChain2"] = {}, ["TowerStatsConnections"] = {}
    },{["AbilityDelayTextBoxes"] = {}})
    Core.ExecuteTime = Core.ExecuteTime + 1
    local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/HeroDiamonds428/Hi/main/TwinkLib_By_twink_marie.lua", true))()
	--loadstring(game:HttpGet("https://raw.githubusercontent.com/HeroDiamonds428/Hi/main/tds%20stuffs.lua", true))()
    local RS, WS, PS, CG = game:GetService("ReplicatedStorage"), game:GetService("Workspace"), game:GetService("Players"), game:GetService("CoreGui")
    local rf = RS:WaitForChild("RemoteFunction")
    local MainUI = UILibrary.Load("TDS Game")
    local Page2, SetTowerMenu, SetTowerPage = MainUI.AddPage("Set Tower",false)
    local Page1 = MainUI.AddPage("Stack",false)
    local Page5 = MainUI.AddPage("Towers",false) 
    local Page4 = MainUI.AddPage("Abilities",false)
    local Page6, ChainMenu, ChainPage = MainUI.AddPage("Chain",false)
    local Page3 = MainUI.AddPage("Misc",false)
    local Page8, TowerStatsMenu, TowerStatsPage = MainUI.AddPage("Tower Stats",true)
    local Page7 = MainUI.AddPage("Stats",true)
    local lp = PS.LocalPlayer
    local StepLabel = Page1.AddLabel("Step 0")
    local p1, p2, p3, autoskipPath, upgradeHandler = WS:WaitForChild("Towers"), lp:WaitForChild("PlayerGui"):WaitForChild("GameGui"):WaitForChild("Waves"):WaitForChild("Content"), RS:WaitForChild("State"), RS:WaitForChild("State"):WaitForChild("Voting"):WaitForChild("Enabled"), require(game:GetService("ReplicatedStorage"):WaitForChild("Client"):WaitForChild("Modules"):WaitForChild("Game"):WaitForChild("Interface"):WaitForChild("Elements"):WaitForChild("Upgrade"):WaitForChild("upgradeHandler"))
    if WS:FindFirstChild("Step1Model") then
        WS.Step1Model:Destroy()
    end
    if WS:FindFirstChild("Step2Model") then
        WS.Step2Model:Destroy()
    end
    local step, TowerCountButtons, upcount2, TowerUpgradeStatus, Targets, index, TimeScale, TowerAbilitiesData, PriceScale, TowerStackStatus, Placed, TotalTowerPlaced, Golden, Trooplist, Towerlist, TowerlistOthers, TowerCount, start, Mouse, RayResultWhiteList1, RayResultWhiteList2, BacktoLobby, Model1, LowestPlacableHeight, Modifiers, ExecuteTime, RefreshTowerStatsPage, Connections, loc1, loc2, oldupc, TowerUpgradeButton, firstcomm, secondcomm, thirdcomm, StateReplicatorPath, StackAmountTextBox, StackSpeedTextBox, XOffsetTextBox, YOffsetTextBox, ZOffsetTextBox, XRotationTextBox, YRotationTextBox, ZRotationTextBox, UpFromTextBox, UpToTextBox, UpAmountTextBox, TimeScaleTextBox, PriceScaleTextBox, TowerStackButton, LocalPlayerStatsReplicator, location, X, Y, Z, OldNameCall, EspFolder, EspCommanderFolder, EspOtherFolder, RefreshCommanderPage, DifficultyConnection, Voted = 1, {}, 0, {["Started"] = false,["Ended"] = true}, {"First","Last","Strongest","Weakest","Closest","Farthest","Random"}, 0, 1, {{},{},{},{},{},{},{}}, p3:WaitForChild("PriceScale").Value, {["Started"] = false,["Ended"] = true}, 0, 0, {}, {}, {}, {}, {}, false, lp:GetMouse(), {}, {}, 0, Instance.new("Model", WS), math.huge, {"Nuclear", "Double Health", "Fallen", "Small", "Birthday", "Cowboy", "AllPaths", "Enemies Beta", "HP Locked", "Mutation", "Translated", "Retro Deaths", "Talk Like a Pirate Day", "Halloween(No Icon)", "Christmas(No Icon)", "Valentines(No Icon)", "Easter(No Icon)", "NewYear(No Icon)", "Fireworks", "Space Suit", "Scuba Gear", "Glass", "Boss", "Badlands"}, Core.ExecuteTime, {}, {}
    local Part1, Part2, Range1, Range2, Model2, Part3, Part4 = Instance.new("Part", Model1), Instance.new("Part", Model1), Instance.new("MeshPart", Model1)
    Model1.Name, Model1.PrimaryPart = "Step1Model", Part1
    Part1.Anchored, Part1.Size, Part1.Material, Part1.Shape, Part1.Color, Part1.CanCollide, Part1.Name = true, Vector3.new(1,1,1), Enum.Material.Neon, Enum.PartType.Ball, Color3.fromRGB(255, 255, 255), false, "Main" -- Ball
    Part2.Anchored, Part2.Size, Part2.Material, Part2.Shape, Part2.Color, Part2.CanCollide = true, Vector3.new(10e4,.1,.1), Enum.Material.Neon, Enum.PartType.Cylinder, Color3.fromRGB(255, 0, 0), false -- Red Cylinder
    Part3, Part4 = Part2:Clone(), Part2:Clone()
    Part3.Parent, Part4.Parent = Model1, Model1
    Part3.Rotation, Part4.Rotation = Vector3.new(0,90,0), Vector3.new(0,0,90)
    Range1.Anchored, Range1.Size, Range1.Material, Range1.Color, Range1.MeshId, Range1.Transparency, Range1.CanCollide = true, Vector3.new(1,.3,1), Enum.Material.Neon, Color3.fromRGB(41, 144, 255), "rbxassetid://3746001467", .85, false
    Model2 = Model1:Clone()
    Model2.Parent, Model2.Name, Model2.PrimaryPart = WS, "Step2Model", Model2:FindFirstChild("Main")
    Model2.PrimaryPart.Color = Color3.new(0,0,0)
    Range2 = Model2:FindFirstChildOfClass("MeshPart")
    Model1:MoveTo(Vector3.new(10e7,10e7,10e7))
    Model2:MoveTo(Vector3.new(10e7,10e7,10e7))
    if not CG:FindFirstChild("EspFolder") then
        EspFolder = Instance.new("Folder",CG)
        EspFolder.Name = "EspFolder"
        EspCommanderFolder = Instance.new("Folder",EspFolder)
        EspCommanderFolder.Name = "EspCommanderFolder"
        EspOtherFolder = Instance.new("Folder",EspFolder)
        EspOtherFolder.Name = "EspOtherFolder"
    else
        EspFolder = CG.EspFolder
        EspCommanderFolder = EspFolder.EspCommanderFolder
        EspOtherFolder = EspFolder.EspOtherFolder
    end
    for i,v in pairs(RS:WaitForChild("Assets"):WaitForChild("Troops"):GetChildren()) do
        Trooplist[i] = v.Name
    end
    table.sort(Trooplist)
    for i,v in pairs(Trooplist) do
        Towerlist[v] = {}
        TowerlistOthers[v] = {}
        TowerCount[v] = {}
        TowerCount[v][1] = 0
        TowerCount[v][2] = 0
    end
    for i,v in pairs(WS:WaitForChild("Cliff"):GetChildren()) do
        if v:IsA("MeshPart") or v:IsA("Part") then
            if v.Position.Y < LowestPlacableHeight then
                LowestPlacableHeight = v.Position.Y
            end
            RayResultWhiteList1[#RayResultWhiteList1+1] = v
        end
    end
    for i,v in pairs(WS:WaitForChild("Ground"):GetChildren()) do
        if v:IsA("MeshPart") or v:IsA("Part") then
            if v.Position.Y < LowestPlacableHeight then
                LowestPlacableHeight = v.Position.Y
            end
            RayResultWhiteList1[#RayResultWhiteList1+1] = v
        end
    end
    for i,v in pairs(p1:GetChildren()) do
        RayResultWhiteList2[#RayResultWhiteList2+1] = v
    end
    local function GetEquipped()
		return {"Scout", "Sniper"}, {"Scout", "Sniper"}
        --[[if getgc and getupvalues then
            for i,v in next, getgc(true) do
                if typeof(v) == "table" and rawget(v,"Managers") and typeof(v.Managers) == "table" and rawget(v["Managers"],"Equipped.Troops") and rawget(v["Managers"],"Inventory.Troops") then
                    return getupvalues(v["Managers"]["Equipped.Troops"]["Get"])[2], getupvalues(v["Managers"]["Inventory.Troops"]["Get"])[2]
                end
            end
        else
            return rf:InvokeServer("Session","Search","Equipped.Troops"), rf:InvokeServer("Session","Search","Inventory.Troops")
        end]]
    end
    local Equipped, Inventory = GetEquipped()
    for i=1, #Equipped do
        local tempt = {}
        print(Equipped[i].."Data")
        rawset(tempt, Equipped[i].."Data", {eX = 0, eY = -8, eZ = 0, StackAmount = 1, stackspeed = 200, Xr = 0, Yr = 0, Zr = 0})
        --print(serializeTable(tempt))
        SetValue(tempt, {})
    end
    local TowerStackData = {eX, eY, eZ, StackAmount, stackspeed, Xr, Yr, Zr}
    local function GetTowerInfos()
        local TowerCosts, TowerWithAbility, TowerRanges = {}, {} ,{}
        for i=1, #Equipped do
            local v = Equipped[i]
            local tower = v
            v = RS:WaitForChild("Assets"):WaitForChild("Troops"):FindFirstChild(v)
            if v:FindFirstChild("Stats") or v:FindFirstChild("Stats_Golden") then
                local ms, count = require(v.Stats), 1
                if table.find(Golden,tower) and v:FindFirstChild("Stats_Golden") then
                    ms = require(v.Stats_Golden)
                end
                TowerRanges[v.Name] = ms.Range*2
                TowerCosts[v.Name] = {}
                if ms.Price ~= nil and ms.Upgrades ~= nil then
                    TowerCosts[v.Name][count] = math.floor(ms.Price*PriceScale)
                    if typeof(ms.Upgrades[1]) == "table" then
                        for i2=1, #ms.Upgrades do
                            count = count + 1
                            TowerCosts[v.Name][count] = math.floor(ms.Upgrades[i2].Cost*PriceScale)
                        end
                    elseif typeof(ms.Upgrades[1]) == "number" then
                        for i2=1, #ms.Upgrades do
                            count = count + 1
                            TowerCosts[v.Name][count] = math.floor(ms.Upgrades[i2]*PriceScale)
                        end
                    end
                end
                if ms.Abilities ~= nil and typeof(ms.Abilities) == "table" then
                    if typeof(ms.Abilities[1]) == "table" then
                        for i=1,#ms.Abilities do
                            TowerWithAbility[tower] = {}
                            TowerWithAbility[tower][ms.Abilities[i].Name] = ms.Abilities[i].Level
                        end
                    elseif ms.Upgrades.Name ~= nil then
                        TowerWithAbility[tower] = {}
                        TowerWithAbility[tower][ms.Abilities[i].Name] = ms.Abilities[i].Level
                    end
                end
            end
        end
        return TowerCosts, TowerWithAbility, TowerRanges
    end
    local PlaceUpgradePriceData, TowerWithAbility, TowerRanges = GetTowerInfos()
    for i,v in pairs(RS.StateReplicators:GetChildren()) do
        if v:GetAttribute("UserId") and v:GetAttribute("UserId") == lp.UserId then
            LocalPlayerStatsReplicator = v
        end
    end
    local function HaveEnoughCash(tower,lvl,disc)
        if math.floor(PlaceUpgradePriceData[tower][lvl]*(1-disc*0.01)+0.5) <= LocalPlayerStatsReplicator:GetAttribute("Cash") then
            return true
        else
            return false
        end
    end
    if #Equipped > 0 then
        for i,v in pairs(Equipped) do
            Page2.AddButton("Set to "..v, function()
                Core.SelectedTower = v
                XOffsetTextBox.Text = Core[v .. "Data"].eX
                YOffsetTextBox.Text = Core[v .. "Data"].eY
                ZOffsetTextBox.Text = Core[v .. "Data"].eZ
                XRotationTextBox.Text = Core[v .. "Data"].Xr
                YRotationTextBox.Text = Core[v .. "Data"].Yr
                ZRotationTextBox.Text = Core[v .. "Data"].Zr
                StackSpeedTextBox.Text = Core[v .. "Data"].stackspeed
                StackAmountTextBox.Text = Core[v .. "Data"].StackAmount
                Core.eX = Core[v .. "Data"].eX
                Core.eY = Core[v .. "Data"].eY
                Core.eZ = Core[v .. "Data"].eZ
                Core.Xr = Core[v .. "Data"].Xr
                Core.Yr = Core[v .. "Data"].Yr
                Core.Zr = Core[v .. "Data"].Zr
                Core.stackspeed = Core[v .. "Data"].stackspeed
                Core.StackAmount = Core[v .. "Data"].StackAmount
                for i,v2 in next, TowerStackData do
                    Core[v2] = Core[v .. "Data"][v2]
                end
                Range1.Size = Vector3.new(TowerRanges[v], .3, TowerRanges[v])
                Range2.Size = Vector3.new(TowerRanges[v], .3, TowerRanges[v])
            end)
        end
        local First = Equipped[1]
        if Core.SelectedTower == nil then
            Core.SelectedTower = First
        end
        Range1.Size = Vector3.new(TowerRanges[First], .3, TowerRanges[First])
        Range2.Size = Vector3.new(TowerRanges[First], .3, TowerRanges[First])
    else
        Page2.AddLabel("No Tower Equipped")
    end
    --local data = {{"Commander","Gladiator","Medic","Swarmer"},{1,2,4,3},{"commascd","gladascd","medascd","swarmascd"},{"cdone","gdone","mdone","sdone"},{["Commander"] = "Call Of Arms",["Gladiator"] = "Warrior's Call",["Medic"] = "Cleansing",["Swarmer"] = "Swarm"},{"spamcomm","spamglad","spammed","spamswarm"}}
    for i,v in pairs(TowerWithAbility) do
        local index2 = 1
        for i2,v2 in pairs(v) do
            index = index + 1
            local name = i.." "..index2
            SetValue({[name.."AbilitySpamCoolDown"] = -1,["Spam"..name] = false},{[name.."Done"] = true})
            TowerAbilitiesData[1][index] = name
            TowerAbilitiesData[2][index] = v2-1
            TowerAbilitiesData[3][index] = name.."AbilitySpamCoolDown"
            TowerAbilitiesData[4][index] = name.."Done"
            TowerAbilitiesData[5][name] = i2 
            TowerAbilitiesData[6][index] = "Spam"..name
            TowerAbilitiesData[7][index] = i
            index2 = index2 + 1
        end
    end
    local function Esp(v,text)
        for i,v2 in pairs(EspFolder:GetDescendants()) do
            if v2:IsA("BillboardGui") and v2.Adornee == v then
                v2:Destroy()
            end
        end
        local bg, tl = Instance.new("BillboardGui"), Instance.new("TextLabel")
        bg.Name = "Esp"
        bg.AlwaysOnTop = true
        bg.Size = UDim2.new(5,0,5,0)
        bg.Adornee = v
        tl.Text = text
        tl.Font = "SciFi"
        tl.Size = UDim2.new(1,0,1,0)
        tl.TextScaled = true
        tl.TextStrokeColor3 = Color3.fromRGB(255,255,255)
        tl.TextStrokeTransparency = 0
        tl.BackgroundTransparency = 1
        tl.TextColor3 = Color3.fromRGB(0,0,0)
        tl.Parent = bg
        if v.Replicator:GetAttribute("Type") == "Commander" then
            bg.Parent = EspCommanderFolder
        else
            bg.Parent = EspOtherFolder
        end
        return tl
    end
    local function IsNumber(v1,v2,old)
        local temp = tonumber(v1)
        if temp == nil then
            v2.Text = old
            return old, false
        else
            return temp, true
        end
    end
    local function CopyOrPrint(v)
        if Core.TDSScriptLoading then
            return
        end
        if Core.CopyToClipBoard then
            setclipboard(v)
        else
            print(v)
        end
    end
    local function comma_value(v)
        local i
        v = tostring(v)
    	while true do
    		v, i = string.gsub(v, "^(-?%d+)(%d%d%d)", '%1,%2')
    		if i == 0 then
    			break
    		end
    		wait()
    	end
    	return v
    end
    local function FindSelectedTowerWithLevel(tower, lvl, included, to)
        local count, result = 0, {}
        if included then
            if not to then
                to = 6
            end
            for i,v in pairs(Towerlist[tower]) do
                if v:WaitForChild("Replicator"):GetAttribute("Upgrade") >= lvl and v:WaitForChild("Replicator"):GetAttribute("Upgrade") < to then
                    count = count + 1
                    result[count] = v
                end
            end
        else
            for i,v in pairs(Towerlist[tower]) do
                if not included and v:WaitForChild("Replicator"):GetAttribute("Upgrade") == lvl then
                    count = count + 1
                    result[count] = v
                end
            end
        end
        return count, result
    end
    local function Combine(t2,t1)
        for i=1,#t1 do
            t2[#t2+i] = t1[i]
        end
        return t2
    end
    local function rayResult(x, y, List1, List2) -- https://devforum.roblox.com/t/how-would-i-cast-a-ray-to-where-my-mouse-hit
        local params1, params2 = RaycastParams.new(), RaycastParams.new()
        params1.FilterDescendantsInstances, params2.FilterDescendantsInstances = Combine(List2,List1) , List1
        params1.IgnoreWater, params1.IgnoreWater = true, true
        params1.FilterType, params2.FilterType = Enum.RaycastFilterType.Whitelist, Enum.RaycastFilterType.Whitelist
        local unitRay = WS.CurrentCamera:ScreenPointToRay(x, y)
        local Ray1 = WS:Raycast(unitRay.Origin, unitRay.Direction * 500, params1)
        if Ray1 == nil then
            return nil
        end
        if table.find(List1,Ray1.Instance) then
            return Ray1
        end
        Ray1 = Ray1.Position
        if Ray1.Y >= LowestPlacableHeight then
            return WS:Raycast(Ray1, Vector3.new(Ray1.X, -500, Ray1.Y), params2)
        else
            return WS:Raycast(Ray1, Vector3.new(Ray1.X, 500, Ray1.Y), params2)
        end
    end
    for i,v in pairs(p1:GetChildren()) do
        local Type, Temp = v:WaitForChild("Replicator"):GetAttribute("Type"), #Connections+1
        TotalTowerPlaced = TotalTowerPlaced + 1
        TowerCount[Type][1] = TowerCount[Type][1] + 1
        if v.Owner.Value == lp.UserId then
            Placed = Placed + 1
            TowerCount[Type][2] = TowerCount[Type][2] + 1
            table.insert(Towerlist[Type],v)
            Connections[Temp] = v.Replicator:GetAttributeChangedSignal("Upgrade"):Connect(function()
                if Core.ExecuteTime ~= ExecuteTime then
                    Connections[Temp]:Disconnect()
                end
                if #v.Upgrades:GetChildren() <= v.Replicator:GetAttribute("Upgrade")+1 then
                    if Core.AutoRefresh then
                        RefreshTowerStatsPage(1)
                    end
                    Connections[Temp]:Disconnect()
                elseif Core.AutoRefresh then
                    RefreshTowerStatsPage(1)
                end
            end)
        else
            table.insert(TowerlistOthers[Type],v)
            Connections[Temp] = v.Replicator:GetAttributeChangedSignal("Upgrade"):Connect(function()
                if Core.ExecuteTime ~= ExecuteTime then
                    Connections[Temp]:Disconnect()
                end
                if #v.Upgrades:GetChildren() <= v.Replicator:GetAttribute("Upgrade")+1 then
                    if Core.AutoRefresh then
                        RefreshTowerStatsPage(2)
                    end
                    Connections[Temp]:Disconnect()
                elseif Core.AutoRefresh then
                    RefreshTowerStatsPage(2)
                end
            end)
        end
    end
    for i,v in pairs(RS:WaitForChild("StateReplicators"):GetChildren()) do
        if v:GetAttribute("TimeScale") then
            StateReplicatorPath = v
            TimeScale = v:GetAttribute("TimeScale")
            break
        end
    end
    local ShowExpectedPlacePoint = coroutine.wrap(function()
        while true do
            if step == 1 and start == true then
                local RayCastResult = rayResult(Mouse.X, Mouse.Y, RayResultWhiteList1, RayResultWhiteList2)
                if RayCastResult ~= nil then
                    Model1:MoveTo(RayCastResult.Position)
                end
            elseif step == 2 and start == true then
                local RayCastResult = rayResult(Mouse.X, Mouse.Y, RayResultWhiteList1, RayResultWhiteList2)
                if RayCastResult ~= nil then
                    local roz, newlocation, X, Y, Z = RayCastResult.Position-loc1, location
                    if Core.locky then
                        Y = 0
                    else
                        Y = roz.Y
                    end
                    if Core.lockxz then
                        X, Z = 0, 0
                    else
                        X, Z = roz.X, roz.Z
                    end
                    X, Y, Z = X + Core.eX, Y + Core.eY, Z + Core.eZ
                    if Core.LastPosAct and Core.LastPos ~= nil and Core.LastLoc ~= nil then
                        local temp = Core.LastLoc + Vector3.new(Core.LastPos.X,Core.LastPos.Y,Core.LastPos.Z) - location
                        X, Y, Z = temp.X, temp.Y, temp.Z
                    end
                    if Core.PlaceAtZeroZeroZero then
                        newlocation = Vector3.new(0,0,0)
                        X, Y, Z = Core.eX, Core.eY, Core.eZ
                    end
                    Model2:MoveTo(newlocation + Vector3.new(X, Y, Z))
                end
            else
                Model1:MoveTo(Vector3.new(10e7,10e7,10e7))
                Model2:MoveTo(Vector3.new(10e7,10e7,10e7))
                coroutine.yield()
            end
            wait()
        end
    end)
    TowerStackButton = Page1.AddButton("Start", function()
        if TowerStackStatus["Started"] then
            TowerStackStatus["Ended"] = true
            TowerStackStatus["Started"] = false
            TowerStackButton.Text = "Start"
            StepLabel.Text = "Step 0"
            start = false
            step = 1
        else
            TowerStackStatus["Ended"] = false
            TowerStackStatus["Started"] = true
            TowerStackButton.Text = "End"
            start = true
            StepLabel.Text = "Step 1"
            if Core.BetterPlacing then
                ShowExpectedPlacePoint()
            end
        end
    end)
    Page1.AddToggle("Better Placing", Core.BetterPlacing, function(v)
        Core.BetterPlacing = v
    end)
    Page1.AddToggle("Place at 0, 0, 0", Core.PlaceAtZeroZeroZero, function(v)
        Core.PlaceAtZeroZeroZero = v
    end)
    Page1.AddToggle("Stack at Last Position", Core.LastPosAct, function(v)
        Core.LastPosAct = v
    end)
    Page1.AddToggle("Lock Y", Core.locky, function(v)
        Core.locky = v
    end)
    Page1.AddToggle("Lock X Z", Core.lockxz, function(v)
        Core.lockxz = v
    end)
    Page1.AddToggle("Fast Place(need enough cash to place all towers)", Core.FastPlace, function(v)
        Core.FastPlace = v
    end)
    StackAmountTextBox = Page1.AddTextBox("Stack Amount", Core.StackAmount, function(v)
        Core.StackAmount, b = IsNumber(v,StackAmountTextBox,Core.StackAmount)
        if b then
            Core[Core.SelectedTower .. "Data"].StackAmount = Core.StackAmount
        end
    end)
    StackSpeedTextBox = Page1.AddTextBox("Stack Speed", Core.stackspeed, function(v)
        Core.stackspeed, b = IsNumber(v,StackSpeedTextBox,Core.stackspeed)
        if b then
            Core[Core.SelectedTower .. "Data"].stackspeed = Core.stackspeed
        end
    end)
    XOffsetTextBox = Page1.AddTextBox("X Offset", Core.eX, function(v)
        Core.eX, b = IsNumber(v,XOffsetTextBox,Core.eX)
        if b then
            Core[Core.SelectedTower .. "Data"].eX = Core.eX
        end
    end)
    YOffsetTextBox = Page1.AddTextBox("Y Offset", Core.eY, function(v)
        Core.eY, b = IsNumber(v,YOffsetTextBox,Core.eY)
        if b then
            Core[Core.SelectedTower .. "Data"].eY = Core.eY
        end
    end)
    ZOffsetTextBox = Page1.AddTextBox("Z Offset", Core.eZ, function(v)
        Core.eZ, b = IsNumber(v,ZOffsetTextBox,Core.eZ)
        if b then
            Core[Core.SelectedTower .. "Data"].eZ = Core.eZ
        end
    end)
    Page1.AddToggle("Random Rotation", Core.RandomRotation, function(v)
        Core.RandomRotation = v
    end)
    XRotationTextBox = Page1.AddTextBox("X Rotation", Core.Xr, function(v)
        Core.Xr, b = IsNumber(v,XRotationTextBox,Core.Xr)
        if b then
            Core[Core.SelectedTower .. "Data"].Xr = Core.Xr
        end
    end)
    YRotationTextBox = Page1.AddTextBox("Y Rotation", Core.Yr, function(v)
        Core.Yr, b = IsNumber(v,YRotationTextBox,Core.Yr)
        if b then
            Core[Core.SelectedTower .. "Data"].Yr = Core.Yr
        end
    end)
    ZRotationTextBox = Page1.AddTextBox("Z Rotation", Core.Zr, function(v)
        Core.Zr, b = IsNumber(v,ZRotationTextBox,Core.Zr)
        if b then
            Core[Core.SelectedTower .. "Data"].Zr = Core.Zr
        end
    end)
    Page3.AddToggle("Auto Skip", Core.autoskipAct, function(v)
        if v == true then
            Core.autoskipAct = true
    		if autoskipPath.Value == true and not Voted then
                firesignal(p2.Yes.Button.MouseButton1Click)
    		end
        else
            Core.autoskipAct = false
        end
    end)
    Page3.AddToggle("Hide Game Gui",Core.GameGui,function(v)
        lp.PlayerGui.GameGui.Enabled = not v
        Core.GameGui = v
    end)
    Page3.AddToggle("Sell Farms at Final Wave",Core.AutoSellFarms,function(v)
        Core.AutoSellFarms = v
    end)
    Page3.AddButton("Print All Your Towers in Dev Console", function()
        if Placed > 0 then
            print(" \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ \n")
            for i,v in pairs(Towerlist) do
                for i2,v2 in pairs(v) do
                    print("Tower :",i,"|| Skin :",v2:WaitForChild("Replicator"):GetAttribute("Skin"),"|| Level :",v2.Replicator:GetAttribute("Upgrade"),"|| Index :",i2)
                end
                if #v > 0 then
                    print("")
                end
            end
            print(" \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ")
        else
            print("No Tower Found")
        end
    end)
    Page3.AddButton("Print All Others Towers in Dev Console", function()
        if TotalTowerPlaced - Placed > 0 then
            print(" \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ \n")
            for i,v in pairs(TowerlistOthers) do
                for i2,v2 in pairs(v) do
                    print("Tower :",i,"|| Skin :",v2:WaitForChild("Replicator"):GetAttribute("Skin"),"|| Level :",v2.Replicator:GetAttribute("Upgrade"),"|| Owner :",v2.Owner.Value.Name,"|| Index :",i2)
                end
                if #v > 0 then
                    print("")
                end
            end
            print(" \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ")
        else
            print("No Tower Found")
        end
    end)
    Page3.AddButton("Triple Click to Back to TDS Lobby", function()
        spawn(function()
            BacktoLobby = BacktoLobby + 1
            if BacktoLobby % 3 == 0 then
                game:GetService("TeleportService"):Teleport(3260590327)
            end
            wait(.25)
            BacktoLobby = BacktoLobby - 1
        end)
    end)
    Page3.AddLabel("Visual (Client Side)")
    TimeScaleTextBox = Page3.AddTextBox("Enemies Walk Speed", TimeScale, function(v)
        TimeScale = IsNumber(v,TimeScaleTextBox,TimeScale)
        StateReplicatorPath:SetAttribute("TimeScale",TimeScale)
    end)
    PriceScaleTextBox = Page3.AddTextBox("Price Scale", PriceScale, function(v)
        PriceScale = IsNumber(v,PriceScaleTextBox,PriceScale)
        p3.PriceScale.Value = PriceScale
    end)
    PriceScaleTextBox = Page3.AddDropdown("Enable Modifier (Can NOT Disable)", Modifiers, function(v)
        RS.Modifiers:SetAttribute(table.find(Modifiers,v),true)
    end, "LayoutOrder", 2)
    local EquippedTowerWithAbility = index
    if EquippedTowerWithAbility > 0 then
        local func1 = coroutine.wrap(function()
            while true do
                for k=1,EquippedTowerWithAbility do
                    if Core[TowerAbilitiesData[3][k]] >= 0 and Core[TowerAbilitiesData[4][k]] then
                        spawn(function()
                            Core[TowerAbilitiesData[4][k]] = false
                            for i,v in pairs(Towerlist[TowerAbilitiesData[7][k]]) do
                                if not Core.AbilitySpam or Core[TowerAbilitiesData[3][k]] < 0 then break end
                                if v.Replicator:GetAttribute("Upgrade") > TowerAbilitiesData[2][k] then
                                    spawn(function()
                                        rf:InvokeServer("Troops","Abilities","Activate",{["Troop"] = v,["Name"] = TowerAbilitiesData[5][TowerAbilitiesData[1][k]]})
                                    end)
                                    if Core[TowerAbilitiesData[3][k]] > 0 then
                                        wait(Core[TowerAbilitiesData[3][k]])
                                    end
                                end
                            end
                            Core[TowerAbilitiesData[4][k]] = true
                        end)
                    end
                end
                if not Core.AbilitySpam then
                    coroutine.yield()
                end
                wait(.1)
            end
        end)
        Page4.AddToggle("Spam Abilities", Core.AbilitySpam, function(v)
            if v == true then
                Core.AbilitySpam = true
                func1()
            else
                Core.AbilitySpam = false
            end
        end)
        Page4.AddLabel("Delay < 0 : Disable Ability Spam on that Tower")
        for k=1,EquippedTowerWithAbility do
            Core.AbilityDelayTextBoxes[k] = Page4.AddTextBox(TowerAbilitiesData[7][k].."'s "..TowerAbilitiesData[5][TowerAbilitiesData[1][k]].." Delay", Core[TowerAbilitiesData[3][k]], function(v)
                local b
                Core[TowerAbilitiesData[3][k]], b = IsNumber(v,Core.AbilityDelayTextBoxes[k],Core[TowerAbilitiesData[3][k]])
                if b then
                    if tonumber(v) < 0 then
                        Core[TowerAbilitiesData[6][k]] = false
                    else
                        Core[TowerAbilitiesData[6][k]] = true
                    end
                end
            end, false, false, 78)
            local Type, Type2 = TowerAbilitiesData[1][k], TowerAbilitiesData[7][k]
            Page4.AddButton("Activate "..TowerAbilitiesData[7][k].."'s "..TowerAbilitiesData[5][Type].." once", function()
                if #Towerlist[Type2] > 0 then
                    for i,v in pairs(Towerlist[Type2]) do
                        if v:WaitForChild("Replicator"):GetAttribute("Upgrade") > TowerAbilitiesData[2][k] then
                            if rf:InvokeServer("Troops","Abilities","Activate",{["Troop"] = v,["Name"] = TowerAbilitiesData[5][Type]}) == true then
                                break
                            end
                        end
                    end
                end
            end)
        end
    else
        Page4.AddLabel("No Tower With Ability Equipped")
    end
    if table.find(Equipped,"Commander") then
        local function FindCommanders(t)
            local count, TableForDropDown, CommanderInstances, found = 0, {}, {}, false
            for i,v in pairs(Towerlist["Commander"]) do
                for i2,v2 in pairs(Core.CommanderChain) do
                    for i3,v3 in pairs(v2) do
                        if v == v3 then
                            found = true
                        end
                    end
                end
                if not found and v:WaitForChild("Replicator"):GetAttribute("Upgrade") > 1 and v.Parent ~= nil then
                    count = count + 1
                    if t == nil or t == 0 then
                        TableForDropDown[count] = "Commander "..count
                        CommanderInstances["Commander "..count] = v
                    end
                    if t == 1 then
                        TableForDropDown[count] = v
                    end
                end
                found = false
            end
            return TableForDropDown, CommanderInstances
        end
        local function StartChain(v1)
            local Index, rfreturn = 1
            while not (Core.CommanderChain[v1] == nil or Core.CommanderChain[v1][Index] == nil or Core.CommanderChain[v1][Index].Parent == nil) do
                repeat
                    rfreturn = rf:InvokeServer("Troops","Abilities","Activate",{["Troop"] = Core.CommanderChain[v1][Index],["Name"] = "Call Of Arms"})
                    wait()
                until rfreturn or Core.CommanderChain[v1] == nil or Core.CommanderChain[v1][Index] == nil or Core.CommanderChain[v1][Index].Parent == nil
                Index = Index % 3 + 1
                rfreturn = false
                wait(9.9)
            end
            Core.CommanderChain[v1] = {}
            Core.CommanderChain2[v1] = nil
            warn("Detected Commander Removed From Group",v1,"Ended Chain")
        end
        Page6.AddToggle("Show Commanders", true, function(v)
            for i,v2 in pairs(EspCommanderFolder:GetChildren()) do
                v2.TextLabel.Visible = v
            end
        end)
        function RefreshCommanderPage()
            for i,v in pairs(ChainPage:GetChildren()) do
                if v.Name == "First CommanderDROPDOWN" or v.Name == "Second CommanderDROPDOWN" or v.Name == "Third CommanderDROPDOWN" or v.Name == "End Commander ChainDROPDOWN" then
                    v:Destroy()
                end
            end
            for i,v in pairs(EspCommanderFolder:GetChildren()) do
                v:Destroy()
            end
            local tab, CommanderChain3 = FindCommanders(0)
            for i,v in pairs(tab) do
                Esp(CommanderChain3[v],i)
            end
            Page6.AddDropdown("First Commander", tab, function(v)
                firstcomm = CommanderChain3[v]
            end, "LayoutOrder", 2)
            Page6.AddDropdown("Second Commander", tab, function(v)
                secondcomm = CommanderChain3[v]
            end, "LayoutOrder", 2)
            Page6.AddDropdown("Third Commander", tab, function(v)
                thirdcomm = CommanderChain3[v]
            end, "LayoutOrder", 2)
            Page6.AddDropdown("End Commander Chain", Core.CommanderChain2, function(v1)
                for i,v2 in pairs(Core.CommanderChain2) do
                    if v1 == v2 and v2 == i.." Enabled" then
                        Core.CommanderChain[i] = {}
                        Core.CommanderChain2[i] = nil
                        RefreshCommanderPage()
                    end
                end
            end, "LayoutOrder", 2)
        end
        Page6.AddButton("Quick Start, Every 3 Commanders (1-3, 4-6, ...)", function()
            local tab = FindCommanders(1)
            for i=0,#tab,3 do
                Core.chainindex = Core.chainindex + 1
                Core.CommanderChain[Core.chainindex] = {tab[i-2],tab[i-1],tab[i]}
                Core.CommanderChain2[Core.chainindex] = Core.chainindex.." Enabled"
                spawn(function()
                    StartChain(Core.chainindex,1)
                end)
            end
            RefreshCommanderPage()
        end)
        Page6.AddButton("Start", function()
            if typeof(firstcomm) == typeof(secondcomm) and typeof(secondcomm) == typeof(thirdcomm) and typeof(thirdcomm) == "Instance" and firstcomm ~= secondcomm and secondcomm ~= thirdcomm and firstcomm ~= thirdcomm and firstcomm.Parent ~= nil and secondcomm.Parent ~= nil and thirdcomm.Parent ~= nil then
                Core.chainindex = Core.chainindex + 1
                Core.CommanderChain[Core.chainindex] = {firstcomm,secondcomm,thirdcomm}
                Core.CommanderChain2[Core.chainindex] = Core.chainindex.." Enabled"
                firstcomm = ""
                secondcomm = ""
                thirdcomm = ""
                spawn(function()
                    StartChain(Core.chainindex,1)
                end)
            else
                warn("Please Select Commanders")
            end
            RefreshCommanderPage()
        end)
        Page6.AddButton("Refresh", function()
            RefreshCommanderPage()
        end)
    else
        Page6.AddLabel("Commander Not Equipped")
    end
    local UpgradeStatus = Page5.AddLabel("Waiting...")
    UpFromTextBox = Page5.AddTextBox("Upgrade Selected Tower Type From Level", Core.UpgradeFromLvl, function(v)
        Core.UpgradeFromLvl = IsNumber(v,UpFromTextBox,Core.UpgradeFromLvl)
    end)
    UpToTextBox = Page5.AddTextBox("Upgrade Selected Tower Type To Level", Core.UpgradeToLvl, function(v)
        Core.UpgradeToLvl = IsNumber(v,UpToTextBox,Core.UpgradeToLvl)
    end)
    UpAmountTextBox = Page5.AddTextBox("Amount ( 0 = All )", Core.UpgradeCount, function(v)
        Core.UpgradeCount = IsNumber(v,UpAmountTextBox,Core.UpgradeCount)
    end)
    Page5.AddToggle("Fast Upgrade(need enough cash to upgrade towers)", Core.FastUpgrade, function(v)
        Core.FastUpgrade = v
    end)
    Page5.AddToggle("From Level - To Level Included", Core.Included, function(v)
        Core.Included = v
    end)
    TowerUpgradeButton = Page5.AddButton("Start", function()
        if Core.UpgradeFromLvl < 0 or Core.UpgradeToLvl < 1 then return end
        if Core.UpgradeFromLvl >= Core.UpgradeToLvl then
            UpgradeStatus.Text = "To Level need to be greater than From Level" 
            wait(1.5) 
            UpgradeStatus.Text = "Waiting..." 
            return 
        end
        local upcount1, Type, count, towers = Core.UpgradeCount, Core.SelectedTower, FindSelectedTowerWithLevel(Core.SelectedTower, Core.UpgradeFromLvl, Core.Included, Core.UpgradeToLvl)
        if TowerUpgradeStatus["Started"] then
            TowerUpgradeStatus["Ended"] = true
            TowerUpgradeStatus["Started"] = false
            TowerUpgradeButton.Text = "Start"
        elseif count > 0 then
            oldupc = Core.UpgradeCount
            TowerUpgradeStatus["Ended"] = false
            TowerUpgradeStatus["Started"] = true
            TowerUpgradeButton.Text = "End"
            local to, length, Total = Core.UpgradeToLvl, #towers
            if upcount1 < 1 then 
                upcount1 = count 
                Total = length
            elseif upcount1 > length then
                Total = length
            else
                Total = upcount1
            end
            for i,v in pairs(towers) do
                local orilvl = v.Replicator:GetAttribute("Upgrade")
                for i2=1,to-orilvl do
                    local rfreturn = nil
                    UpgradeStatus.Text = "Upgrading "..Type..", lvl "..(orilvl+i2-1).." to lvl "..orilvl+i2..", "..(Total-i+1).." Left"
                    if Core.FastUpgrade then
                        spawn(function()
                            rf:InvokeServer("Troops","Upgrade","Set",{["Troop"] = v})
                        end)
                    elseif PlaceUpgradePriceData[Type][orilvl+i2+1] ~= nil then
                        repeat
                            if HaveEnoughCash(Type,orilvl+i2+1,v.Replicator:GetAttribute("DiscountBuff")) then
                                rfreturn = rf:InvokeServer("Troops","Upgrade","Set",{["Troop"] = v})
                            end
                            wait()
                        until typeof(rfreturn) == "number" or rfreturn == true or v.Replicator:GetAttribute("Upgrade") == to or TowerUpgradeStatus["Ended"] == true
                    end
                    if TowerUpgradeStatus["Ended"] == true then break end
                end
                upcount2 = upcount2 + 1
                if TowerUpgradeStatus["Ended"] == true or upcount2 == upcount1 then break end
            end
            TowerUpgradeStatus["Ended"] = true
            TowerUpgradeStatus["Started"] = false
            TowerUpgradeButton.Text = "Start"
            upcount1 = oldupc
            upcount2 = 0
            UpgradeStatus.Text = "Waiting..."
        end
    end)
    Page5.AddButton("Upgrade All Once", function()
        for i,v in pairs(Towerlist) do
            if #v > 0 then
                for i2,v2 in pairs(v) do
                    spawn(function()
                        local temp = v2:WaitForChild("Replicator")
                        if HaveEnoughCash(temp:GetAttribute("Type"),temp:GetAttribute("Upgrade")+1,temp:GetAttribute("DiscountBuff")) then
                            rf:InvokeServer("Troops","Upgrade","Set",{["Troop"] = v2})
                        end
                    end)
                end
            end
        end
    end)
    Page5.AddDropdown("Upgrade All ",Equipped,function(v1)
        if #Towerlist[v1] > 0 then
            for i,v2 in pairs(Towerlist[v1]) do
                spawn(function()
                    local Replicator = v2:WaitForChild("Replicator")
                    if HaveEnoughCash(Replicator:GetAttribute("Type"),Replicator:GetAttribute("Upgrade")+2,Replicator:GetAttribute("DiscountBuff")) then
                        rf:InvokeServer("Troops","Upgrade","Set",{["Troop"] = v2})
                    end
                end)
            end
        end
    end)
    Page5.AddButton("Sell All", function()
        for i,v in pairs(Towerlist) do
            if #v > 0 then
                for i2=#v,1,-1 do
                    spawn(function()
                        rf:InvokeServer("Troops","Sell",{["Troop"] = v[i2]})
                    end)
                end
            end
        end
    end)
    Page5.AddDropdown("Sell All ",Equipped,function(v1)
        if #Towerlist[v1] > 0 then
            for i=#Towerlist[v1],1,-1 do
                spawn(function()
                    rf:InvokeServer("Troops","Sell",{["Troop"] = Towerlist[v1][i]})
                end)
            end
        end
    end)
    Page5.AddDropdown("Set Selected Towers Target",Targets,function(v1)
        local done, required = 0, #Towerlist[Core.SelectedTower]
        local t = coroutine.running()
        for i,v2 in pairs(Towerlist[Core.SelectedTower]) do
            spawn(function()
                local rfreturn
                repeat
                    rfreturn = rf:InvokeServer("Troops","Target","Set",{["Troop"] = v2})
                until rfreturn == v1
                done += 1
                if done == required then
                    coroutine.resume(t)
                end
            end)
        end
        coroutine.yield()
        repeat wait() until done >= required
    end)
    if typeof(Core.TowerStatsConnections) == "table" then
        for i,v in pairs(Core.TowerStatsConnections) do
            v:Disconnect()
        end
    end
    function RefreshTowerStatsPage(v1,v2,v3,v4)
        if v1 == 3 then
            for i,v in pairs(TowerStatsPage:GetChildren()) do
                if v.Name ~= "Show TowerTOGGLE" and v.Name ~= "UIListLayout" and v.Name ~= "UIPadding" and v.Name ~= "SearchBar" and v.Name ~= "Copy To ClipboardTOGGLE" then
                    v:Destroy()
                end
            end
        else
            for i,v in pairs(SetTowerPage:GetChildren()) do
                if v1 == 1 and v.Name == "Select Your TowerDROPDOWN" then
                    v:Destroy()
                elseif v1 == 2 and v.Name == "Select Others TowerDROPDOWN" then
                    v:Destroy()
                end
            end
        end
        local dropdownlist, towerlist, counts = {}, {}, {0,0}
        if v1 == 1 then
            for i,v in pairs(Towerlist) do
                for i2,v2 in pairs(v) do
                    counts[1] = counts[1] + 1
                    counts[2] = counts[2] + 1
                    dropdownlist[counts[1]] = i.." "..counts[2]..", lvl "..v2.Replicator:GetAttribute("Upgrade")
                    towerlist[i.." "..counts[2]..", lvl "..v2.Replicator:GetAttribute("Upgrade")] = v2
                end
                counts[2] = 0
            end
            Page2.AddDropdown("Select Your Tower", dropdownlist, function(v)
                if rawget(towerlist, v) and towerlist[v].Parent ~= nil then
                    Core.SelectedTowerForTowerStatsInfo = {towerlist[v], true, v}
                    upgradeHandler:selectTroop(towerlist[v])
                    RefreshTowerStatsPage(3, towerlist[v], true, v)
                end
            end, "LayoutOrder", 2)
        end
        if v1 == 2 then
            for i,v in pairs(TowerlistOthers) do
                for i2,v2 in pairs(v) do
                    counts[1] = counts[1] + 1
                    counts[2] = counts[2] + 1
                    dropdownlist[counts[1]] = i.." "..counts[2]..", lvl "..v2.Replicator:GetAttribute("Upgrade")
                    towerlist[i.." "..counts[2]..", lvl "..v2.Replicator:GetAttribute("Upgrade")] = v2
                end
                counts[2] = 0
            end
            Page2.AddDropdown("Select Others Tower", dropdownlist, function(v)
                if rawget(towerlist, v) and towerlist[v].Parent ~= nil then
                    Core.SelectedTowerForTowerStatsInfo = {towerlist[v], false, v}
                    RefreshTowerStatsPage(3, towerlist[v], false, v)
                end
            end, "LayoutOrder", 2)
        end
        if v1 == 3 and v2 ~= nil and v2.Parent ~= nil and v3 ~= nil and v4 ~= nil then
            Page8.AddLabel("Tower Stats")
            local pos, count = v2:WaitForChild("HumanoidRootPart"):WaitForChild("GridPart").Position, 0
            Page8.AddButton("Tower Position : "..(math.floor(pos.x*10e5+.5)/10e5)..", "..(math.floor(pos.y*10e5+.5)/10e5)..", "..math.floor(pos.z*10e5+.5)/10e5, function()  
                CopyOrPrint(tostring(pos)) 
            end)
            for i,v in pairs(v2.Replicator:GetAttributes()) do
                count = count + 1
                local Button = Page8.AddButton(i.." : "..tostring(v), function() CopyOrPrint(i.." : "..tostring(v)) end)
                Core.TowerStatsConnections[count] = v2.Replicator:GetAttributeChangedSignal(i):Connect(function()
                    Button.Text = i.." : "..tostring(v2.Replicator:GetAttribute(i))
                end)
            end
        end
    end
    Page2.AddLabel("Select Tower For Tower Stats")
    Page8.AddToggle("Copy To Clipboard", Core.CopyToClipBoard, function(v)
        Core.CopyToClipBoard = v
    end)
    Page2.AddButton("Refresh", function()
        RefreshTowerStatsPage(1)
        RefreshTowerStatsPage(2)
    end)
    Page2.AddToggle("Auto Refresh", Core.AutoRefresh, function(v)
        Core.AutoRefresh = v
    end)
    RefreshTowerStatsPage(1)
    RefreshTowerStatsPage(2)
    if Core.SelectedTowerForTowerStatsInfo ~= nil and Core.SelectedTowerForTowerStatsInfo[1].Parent ~= nil and Core.SelectedTowerForTowerStatsInfo[2] ~= nil and Core.SelectedTowerForTowerStatsInfo[3] ~= nil then
        RefreshTowerStatsPage(3, Core.SelectedTowerForTowerStatsInfo[1], Core.SelectedTowerForTowerStatsInfo[2], Core.SelectedTowerForTowerStatsInfo[3])
    end
    for i,v in pairs(RS.StateReplicators:GetChildren()) do
        if v:GetAttribute("UserId") then
            local userid = v:GetAttribute("UserId")
            if userid ~= lp.UserId then
                local info = game:GetService("UserService"):GetUserInfosByUserIdsAsync({userid})
                local dpname, username, cash, TextScaled, labelname = info[1]["DisplayName"], info[1]["Username"], comma_value(v:GetAttribute("Cash")), false
                if game:GetService("Players"):FindFirstChild(username) then
                    labelname = "("..dpname..")"..username.."'s Lvl : "..game:GetService("Players")[username].Level.Value..", Cash : "
                else
                    labelname = "("..dpname..")"..username.."'s Cash : "
                end
                if labelname:len() > 45 then
                    TextScaled = true
                end
                local CashButton, Temp = Page7.AddButton(labelname..cash, function() 
                    CopyOrPrint(labelname..comma_value(v:GetAttribute("Cash"))) 
                end, false, false, false, TextScaled), #Connections+1
                Connections[Temp] = v:GetAttributeChangedSignal("Cash"):Connect(function()
                    if ExecuteTime ~= Core.ExecuteTime then Connections[Temp]:Disconnect() return end
                    CashButton.Text = labelname..comma_value(v:GetAttribute("Cash"))
                end)
            end
        end
    end
    local PlacedButton = Page7.AddButton("Tower Placed : "..Placed, function() 
        CopyOrPrint("Tower Placed : "..Placed) 
    end)
    local TotalTowerPlacedButton = Page7.AddButton("Total Tower Placed : "..TotalTowerPlaced, function() 
        CopyOrPrint("Total Tower Placed : "..TotalTowerPlaced) 
    end)
    Page7.AddButton("Map : "..p3.Map.Value, function() 
        CopyOrPrint("Map : "..p3.Map.Value) 
    end)
    Page7.AddButton("Mode : "..p3.Mode.Value, function() 
        CopyOrPrint("Mode : "..p3.Mode.Value) 
    end)
    local DifficultyButton = Page7.AddButton("Difficulty : ", function() 
        CopyOrPrint("Difficulty : "..p3.Difficulty.Value) 
    end)
    Page7.AddButton("Tower Counts : ", function()
        local s = ""
        for i,v in pairs(TowerCount) do
            if TowerCount[i][1] ~= 0 and TowerCount[i][2] ~= 0 then 
                s = s..i.." Total : "..TowerCount[i][1]..", Yours : "..TowerCount[i][2].."\n"
            end
        end
        CopyOrPrint(s)
    end)
    for i,v in pairs(p1:GetChildren()) do
        local Skin, Type, found = v.Name, v:WaitForChild("Replicator"):GetAttribute("Type"), false
        v.Replicator:SetAttribute("Skin",Skin)
        for i,v in pairs(TowerCountButtons) do
            if i == Type then
                found = true
                break
            end
        end
        if found == false then
            local TowerCountButton = Page7.AddButton(Type.." Total : "..TowerCount[Type][1]..", Yours : "..TowerCount[Type][2], function() CopyOrPrint(Type.." Total : "..TowerCount[Type][1].." , Yours : "..TowerCount[Type][2]) end)
            TowerCountButtons[Type] = TowerCountButton
        end
    end
    if p3.Difficulty.Value == "" then
        DifficultyConnection = p3.Difficulty:GetPropertyChangedSignal("Value"):Connect(function()
            if p3.Difficulty.Value ~= "" then
                DifficultyButton.Text = "Difficulty : "..p3.Difficulty.Value
                DifficultyConnection:Disconnect()
            end
        end)
    else
        DifficultyButton.Text = "Difficulty : "..p3.Difficulty.Value
    end
    spawn(function()
        repeat wait(.1) until p3.Difficulty.Value ~= ""
        DifficultyButton.Text = "Difficulty : "..p3.Difficulty.Value
    end)
    if typeof(Core.MouseConnection) == "RBXScriptConnection" then
        Core.TowerRemoved:Disconnect()
    end
    Core.MouseConnection = Mouse.Button1Down:Connect(function()
        if start then
            if step == 1 then
                if Core.BetterPlacing then
                    loc1 = rayResult(Mouse.X, Mouse.Y, RayResultWhiteList1, RayResultWhiteList2)
                    if loc1 == nil then
                        start = false
                        StepLabel.Text = "Unable to place tower "
                        wait(1.5)
                        StepLabel.Text, step, TowerStackStatus["Ended"], TowerStackStatus["Started"], TowerStackButton.Text = 'Step 0', 1, true, false, "Start"
                        return
                    end
                    loc1 = loc1.Position
                else
                    loc1 = Mouse.Hit.Position
                end
                location, step, StepLabel.Text = loc1, 2, 'Step 2'
            elseif step == 2 then
                start = false
                if Core.StackAmount > 0 then
                    if Core.BetterPlacing then
                        loc2 = rayResult(Mouse.X, Mouse.Y, RayResultWhiteList1, RayResultWhiteList2)
                        if loc2 == nil then
                            StepLabel.Text = "Unable to place tower "
                            wait(1.5)
                            StepLabel.Text, step, TowerStackStatus["Ended"], TowerStackStatus["Started"], TowerStackButton.Text = 'Step 0', 1, true, false, "Start"
                            return
                        end
                        loc2 = loc2.Position
                    else
                        loc2 = Mouse.Hit.Position
                    end
                    local roz = loc2-loc1
                    if Core.locky then
                        Y = 0
                    else
                        Y = roz.Y
                    end
                    if Core.lockxz then
                        X, Z = 0, 0
                    else
                        X, Z = roz.X, roz.Z
                    end
                    X, Y, Z = X + Core.eX, Y + Core.eY, Z + Core.eZ
                    if Core.LastPosAct and Core.LastPos ~= nil and Core.LastLoc ~= nil then
                        local temp = Core.LastLoc + Vector3.new(Core.LastPos.X,Core.LastPos.Y,Core.LastPos.Z) - location
                        X, Y, Z = temp.X, temp.Y, temp.Z
                    end
                    if Core.PlaceAtZeroZeroZero then
                        location = Vector3.new(0,0,0)
                    end
                    Core.LastPos, Core.LastLoc = CFrame.new(X,Y,Z), location
                    local StackAmount, SelectedTower = Core.StackAmount, Core.SelectedTower
                    for i=1,StackAmount do
                        local rfreturn, Rot = ""
                        StepLabel.Text = "Stacking towers "..(StackAmount-i+1).." left ("..SelectedTower..")"
                        if Core.RandomRotation then
                            Rot = CFrame.Angles(math.rad(math.random(0,359)),math.rad(math.random(0,359)),math.rad(math.random(0,359)))
                        else
                            Rot = CFrame.Angles(math.rad(Core.Xr),math.rad(Core.Yr),math.rad(Core.Zr))
                        end
                        if Core.FastPlace then
                            spawn(function()
                                rf:InvokeServer("Troops","Place",SelectedTower,{["Rotation"] = CFrame.new(X,Y,Z) * Rot,["Position"] = location})
                            end)
                        else
                            while typeof(rfreturn) ~= "Instance" and rfreturn ~= nil and not tostring(rfreturn):find("You can only place") and TowerStackStatus["Ended"] == false and not tostring(rfreturn):find("Tower Not Equipped") and rfreturn == "" do
                                if HaveEnoughCash(SelectedTower,1,0) then
                                    rfreturn = rf:InvokeServer("Troops","Place",SelectedTower,{["Rotation"] = CFrame.new(X,Y,Z) * Rot,["Position"] = location})
                                end
                                wait()
                            end
                        end
                        if rfreturn == nil and not TowerStackStatus["Ended"] then
                            StepLabel.Text = "Unable to place tower "..(StackAmount-i+1).." left ("..SelectedTower..")"
                            wait(1.5)
                            break
                        elseif tostring(rfreturn):find("You can only place") then
                            StepLabel.Text = rfreturn.."  "..(StackAmount-i+1).." left ("..SelectedTower..")"
                            wait(1.5)
                            break
                        elseif tostring(rfreturn):find("Tower Not Equipped") then
                            StepLabel.Text = rfreturn
                            wait(1.5)
                            break
                        elseif TowerStackStatus["Ended"] then
                            break
                        elseif Core.FastPlace then
                            StepLabel.Text = "Stacking towers "..(StackAmount-i).." left ("..SelectedTower..")"
                        else
                            StepLabel.Text = "Stacking towers "..(StackAmount-i).." left ("..SelectedTower..")"
                            if Core.stackspeed > 0 then
                                wait(20/Core.stackspeed)
                            end
                        end
                    end
                end
                StepLabel.Text, step, TowerStackStatus["Ended"], TowerStackStatus["Started"], TowerStackButton.Text = 'Step 0', 1, true, false, "Start"
            end
        end
    end)
    autoskipPath:GetPropertyChangedSignal("Value"):Connect(function()
        if Core.autoskipAct and autoskipPath.Value then
            task.wait(.15)
            firesignal(p2.Yes.Button.MouseButton1Click)
        end
    end)
    local FinalWaveAtDifferentMode = {["Easy"] = 30, ["Normal"] = 40, ["Insane"] = 40, ["Hardcore"] = 50}
    StateReplicatorPath:GetAttributeChangedSignal("Wave"):Connect(function()
        if Core.AutoSellFarms and StateReplicatorPath:GetAttribute("Wave") == FinalWaveAtDifferentMode[p3.Difficulty.Value] then
            for i,v in pairs(Towerlist["Farm"]) do
                spawn(function()
                    rf:InvokeServer("Troops","Sell",{["Troop"] = v})
                end)
            end
        end
    end)
    if typeof(Core.TowerAdded) == "RBXScriptConnection" then
        Core.TowerAdded:Disconnect()
    end
    if typeof(Core.TowerRemoved) == "RBXScriptConnection" then
        Core.TowerRemoved:Disconnect()
    end
    Core.TowerAdded = p1.ChildAdded:Connect(function(child)
        local Skin, Type, found = child.Name, child:WaitForChild("Replicator"):GetAttribute("Type"), false
        child.Replicator:SetAttribute("Skin",Skin)
        for i,v in pairs(TowerCountButtons) do
            if i == Type then
                found = true
                break
            end
        end
        if not found then
            local TowerCountButton = Page7.AddButton(Type.." Total : "..TowerCount[Type][1]..", Yours : "..TowerCount[Type][2], function() CopyOrPrint(Type.." Total : "..TowerCount[Type][1].." , Yours : "..TowerCount[Type][2]) end)
            TowerCountButtons[Type] = TowerCountButton
            TowerCountButtons[Type] = TowerCountButton
        end
        if child:WaitForChild("Owner").Value == lp.UserId then
            Placed = Placed + 1
            PlacedButton.Text = "Tower Placed : "..Placed
            TowerCount[Type][2] = TowerCount[Type][2] + 1
            if Type == "Commander" then
                local Temp = #Connections+1
                Connections[Temp] = child.Replicator:GetAttributeChangedSignal("Upgrade"):Connect(function()
                    if child.Parent == nil or Core.ExecuteTime ~= ExecuteTime then
                        Connections[Temp]:Disconnect()
                        return
                    end
                    if child.Replicator:GetAttribute("Upgrade") == 2 then
                        RefreshCommanderPage()
                        Connections[Temp]:Disconnect()
                    end
                end)
            end
            local Temp = #Connections+1
            Connections[Temp] = child.Replicator:GetAttributeChangedSignal("Upgrade"):Connect(function()
                if Core.ExecuteTime ~= ExecuteTime then
                    Connections[Temp]:Disconnect()
                end
                if #child.Upgrades:GetChildren() <= child.Replicator:GetAttribute("Upgrade")+1 then
                    if Core.AutoRefresh then
                        RefreshTowerStatsPage(1)
                    end
                    Connections[Temp]:Disconnect()
                elseif Core.AutoRefresh then
                    RefreshTowerStatsPage(1)
                end
            end)
            table.insert(Towerlist[Type],child)
            if Core.AutoRefresh then
                RefreshTowerStatsPage(1)
            end
        else
            table.insert(TowerlistOthers[Type],child)
            if Core.AutoRefresh then
                RefreshTowerStatsPage(2)
            end
            local Temp = #Connections+1
            Connections[Temp] = child.Replicator:GetAttributeChangedSignal("Upgrade"):Connect(function()
                if Core.ExecuteTime ~= ExecuteTime then
                    Connections[Temp]:Disconnect()
                end
                if #child.Upgrades:GetChildren() <= child.Replicator:GetAttribute("Upgrade")+1 then
                    if Core.AutoRefresh then
                        RefreshTowerStatsPage(2)
                    end
                    Connections[Temp]:Disconnect()
                elseif Core.AutoRefresh then
                    RefreshTowerStatsPage(2)
                end
            end)
        end
        TotalTowerPlaced = TotalTowerPlaced + 1
        TotalTowerPlacedButton.Text = "Total Tower Placed : "..TotalTowerPlaced
        TowerCount[Type][1] = TowerCount[Type][1] + 1
        TowerCountButtons[Type].Text = Type.." Total : "..TowerCount[Type][1]..", Yours : "..TowerCount[Type][2]
        RayResultWhiteList2[#RayResultWhiteList2+1] = child
    end)
    Core.TowerRemoved = p1.ChildRemoved:Connect(function(child)
        local Type = child:WaitForChild("Replicator"):GetAttribute("Type")
        local index, index2 = table.find(Towerlist[Type],child), table.find(TowerlistOthers[Type],child)
        if index then
            Placed = Placed - 1
            PlacedButton.Text = "Tower Placed : "..Placed
            TowerCount[Type][2] = TowerCount[Type][2] - 1
            if Type == "Commander" and child.Replicator:GetAttribute("Upgrade") > 1 then
                RefreshCommanderPage()
            end
            table.remove(Towerlist[Type],index)
            if Core.AutoRefresh then
                RefreshTowerStatsPage(1)
            end
        elseif index2 then
            table.remove(TowerlistOthers[Type],index2)
            if Core.AutoRefresh then
                RefreshTowerStatsPage(2)
            end
        end
        if Core.SelectedTowerForTowerStatsInfo ~= nil and child == Core.SelectedTowerForTowerStatsInfo[1] then
            RefreshTowerStatsPage(3)
        end
        TotalTowerPlaced = TotalTowerPlaced - 1
        TotalTowerPlacedButton.Text = "Total Tower Placed : "..TotalTowerPlaced
        TowerCount[Type][1] = TowerCount[Type][1] - 1
        TowerCountButtons[Type].Text = Type.." Total : "..TowerCount[Type][1]..", Yours : "..TowerCount[Type][2]
        table.remove(RayResultWhiteList2, table.find(RayResultWhiteList2, child))
    end)
    if Core.CheckTowerPlacement == nil and hookmetamethod and newcclosure then
        Core.CheckTowerPlacement = true
        OldNameCall = hookmetamethod(rf, "__namecall", newcclosure(function(Self, ...)
            if Core.CheckTowerPlacement and checkcaller() and Self == rf and getnamecallmethod() == "InvokeServer" then
                local Args = {...}
                if Args[1] == "Troops" and Args[2] == "Place" and not table.find(Equipped,Args[3]) then
                    return "Tower Not Equipped : "..Args[3]
                end
            end
            return OldNameCall(Self, ...)
        end))
    end
    Core.TDSScriptLoading = false
end
