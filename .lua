local mt = getrawmetatable(game);
setreadonly(mt,false)
local namecall = mt.__namecall
local PetIDINDEX = "#16"
local remote = {
	"InvokeServer",
	"FireServer"
}

local args = {
    [1] = 2,
    [2] = "@104",
    [3] = true
}

--game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestEquipItem"]:InvokeServer(unpack(args))

--[[mt.__namecall = newcclosure(function(self, ...)
	local Method = getnamecallmethod()
	local Args = {...}

	if Method == remote[1] and self.Name == "ResetIdleTimer" then -- Blocked Script Caller with name "ResetIdleTimer"
           return 
	elseif Method == remote[1] and self.Name == "RequestEquipItem" and Args[2]:sub(1,1) == "@" then
	   PetIDINDEX = Args[2]
        end
	return namecall(self, ...) 
end)
]]

local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()
local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = false, ConfigFolder = "TurtleFi"})

local function tp(str,dis)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = str.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,dis)
end

local function bringsys(str,dis)
	str.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-dis)
end

local zone = {
	"Meadow",
	"Desert",
	"Ice",
	"Forest",
	"Chaos",
	"Fire",
	"Cyber"
}

local function Gold(ary)
    game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestCraftItem"]:InvokeServer(2,PetIDINDEX,1,1,{ary,ary,ary,ary,ary,ary})
end

local function Rb(ary)
    game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestCraftItem"]:InvokeServer(2,PetIDINDEX,2,1,{ary,ary,ary,ary,ary,ary})
end

local function Converting(str)
	return str:gsub("Meadow","1"):gsub("Desert","2"):gsub("Ice","3"):gsub("Forest","4"):gsub("Chaos","5"):gsub("Fire","6"):gsub("Cyber","7"):gsub("Christmas","15")
end

local function ConvertingToNumber(str)
	return tonumber(Converting(str))
end

local T1 = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T2 = Window:MakeTab({
Name = "Egg",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T3 = Window:MakeTab({
Name = "Boss Fight",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T5 = Window:MakeTab({
Name = "Teleport",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T6 = Window:MakeTab({
Name = "Gold & Rainbow",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T4 = Window:MakeTab({
Name = "Arena PVP",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T7 = Window:MakeTab({
Name = "Debug & Logger",
Icon = "rbxassetid://",
PremiumOnly = false
})

T6:AddTextbox({
  Name = "Enter Pet ID (example: @123)",
  Default = "@123",
  TextDisappear = false,
  Callback = function(Value)
     _G.PetID = Value
  end  
})

T6:AddButton({
  Name = "Enchant GOLD",
  Callback = function()
      Gold(_G.PetID)
  end    
})

T6:AddButton({
  Name = "Enchant RAINBOW",
  Callback = function()
      Rb(_G.PetID)
  end    
})

T5:AddDropdown({
   Name = "Select Zone",
   Default = zone[1],
   Options = zone,
   Callback = function(Value)
      _G.ZoneTP = Converting(Value)
   end    
})

T5:AddButton({
  Name = "Teleport",
  Callback = function()
      game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestTeleport"]:InvokeServer(tonumber(_G.ZoneTP))
      game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestChangeZone"]:InvokeServer(tonumber(_G.ZoneTP))
  end    
})

T5:AddButton({
  Name = "Buy zone",
  Callback = function()
      game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestPurchaseZoneAccess"]:InvokeServer(_G.ZoneTP)
  end    
})

T4:AddLabel("Arena Only")

T4:AddSlider({
  Name = "Teleport And Bring Distance",
  Min = 0,
  Max = 20,
  Default = 2,
  Color = Color3.fromRGB(0,1,0),
  Increment = 1,
  ValueName = "Distance",
  Callback = function(Value)
     _G.TP_AND_BRING_DISTANCE = Value
  end    
})

T4:AddToggle({
  Name = "Auto Kill player",
  Default = false,
  Callback = function(Value)
    _G.akp = Value
      while wait() do
        if _G.akp == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RE"]["PlayerArenaAttackStart"]:FireServer()
      end
  end    
})

T4:AddToggle({
  Name = "Bring player",
  Default = false,
  Callback = function(Value)
    _G.bps = Value
      while wait() do
        if _G.bps == false then break end
        for _,v in pairs(game.Players:GetPlayers()) do
	    bringsys(v,_G.TP_AND_BRING_DISTANCE)
	end
      end
  end    
})

T4:AddToggle({
  Name = "Teleport player",
  Default = false,
  Callback = function(Value)
    _G.tpp = Value
      while wait() do
        if _G.tpp == false then break end
        for _,v in pairs(game.Players:GetPlayers()) do
	    tp(v,_G.TP_AND_BRING_DISTANCE)
	end
      end
  end    
})

T2:AddDropdown({
   Name = "Select Egg",
   Default = zone[1],
   Options = zone,
   Callback = function(Value)
      _G.EggID = Converting(Value)
   end    
})

T2:AddDropdown({
   Name = "Select Hatch Amount",
   Default = "1",
   Options = {"1","3","8"},
   Callback = function(Value)
      _G.a_h = tonumber(Value)
   end    
})

T2:AddToggle({
  Name = "Auto Hatch",
  Default = false,
  Callback = function(Value)
    _G.he = Value
      while wait() do
        if _G.he == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestOpenCrate"]:InvokeServer(tonumber(_G.EggID),_G.a_h)
      end
  end    
})

T2:AddToggle({
  Name = "Hatch Christmas Egg",
  Default = false,
  Callback = function(Value)
    _G.hce = Value
      while wait() do
        if _G.hce == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestOpenCrate"]:InvokeServer(15,_G.a_h)
      end
  end    
})

T3:AddDropdown({
   Name = "Select Boss ID",
   Default = "1",
   Options = {"1","2","3","4"},
   Callback = function(Value)
      _G.BossF = tonumber(Value)
   end    
})

T3:AddToggle({
  Name = "Auto Fight",
  Default = false,
  Callback = function(Value)
    _G.f = Value
      while wait() do
        if _G.f == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestInitFight"]:InvokeServer(_G.BossF)
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestStartFight"]:InvokeServer()
      end
  end    
})

T1:AddToggle({
  Name = "Auto Click",
  Default = false,
  Callback = function(Value)
    _G.Click = Value
      while wait() do
        if _G.Click == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RE"]["PlayerAttackStart"]:FireServer()
	game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RE"]["PlayerAttackStart"]:FireServer()
	game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RE"]["PlayerAttackStart"]:FireServer()
	game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RE"]["PlayerAttackStart"]:FireServer()
	game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RE"]["PlayerAttackStart"]:FireServer()
	game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RE"]["PlayerAttackStart"]:FireServer()
	game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RE"]["PlayerAttackStart"]:FireServer()
	game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RE"]["PlayerAttackStart"]:FireServer()
	game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RE"]["PlayerAttackStart"]:FireServer()
	game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestPlayerFightModeAttack"]:InvokeServer()
      end
  end    
})

T1:AddToggle({
  Name = "Auto Claim Gifts",
  Default = false,
  Callback = function(Value)
    _G.g = Value
      while wait() do
        if _G.g == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestClaimFreeReward"]:InvokeServer(1)
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestClaimFreeReward"]:InvokeServer(2)
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestClaimFreeReward"]:InvokeServer(3)
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestClaimFreeReward"]:InvokeServer(4)
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestClaimFreeReward"]:InvokeServer(5)
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestClaimFreeReward"]:InvokeServer(6)
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestClaimFreeReward"]:InvokeServer(7)
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestClaimFreeReward"]:InvokeServer(8)
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestClaimFreeReward"]:InvokeServer(9)
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestClaimFreeReward"]:InvokeServer(10)
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestClaimFreeReward"]:InvokeServer(11)
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestClaimFreeReward"]:InvokeServer(12)
      end
  end    
})

T1:AddToggle({
  Name = "Auto Spin",
  Default = false,
  Callback = function(Value)
    _G.s = Value
      while wait() do
        if _G.s == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestWheelSpin"]:InvokeServer(1)
      end
  end    
})

T1:AddToggle({
  Name = "Auto Claim Quest",
  Default = false,
  Callback = function(Value)
    _G.cq = Value
      while wait() do
        if _G.cq == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestCompleteQuest"]:InvokeServer()
      end
  end    
})

T1:AddToggle({
  Name = "Auto Rebirth",
  Default = false,
  Callback = function(Value)
    _G.r = Value
      while wait() do
        if _G.r == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestPurchaseRebirth"]:InvokeServer()
      end
  end    
})

--[[local args = {
    [1] = "ServerStorage.Modules.Player:1459: attempt to index nil with 'equipped'",
    [2] = "3OtPTN1, line 56 - function Gold\n3OtPTN1, line 125 - function Callback\n2wNWz2, line 920\n",
    [3] = "LocalScript"
}

game:GetService("ReplicatedStorage")["GameAnalyticsError"]:FireServer(unpack(args))
PetIDINDEX, RequestCraftItem InvokeServer]]

mt.__namecall = newcclosure(function(self, ...)
	local Method = getnamecallmethod()
	local Args = {...}

	if Method == remote[1] and self.Name == "RequestCraftItem" then -- Blocked Script Caller with name "ResetIdleTimer"
           PetIDINDEX = Args[2]
	end
	return namecall(self, ...) 
end)
