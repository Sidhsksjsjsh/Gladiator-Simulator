local mt = getrawmetatable(game);
setreadonly(mt,false)
local namecall = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
	local Method = getnamecallmethod()
	local Args = {...}

	if Method == 'InvokeServer' and self.Name == "ResetIdleTimer" then -- Blocked Script Caller with name "ResetIdleTimer"
           return 
        end
	return namecall(self, ...) 
end)

local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()
local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = false, ConfigFolder = "TurtleFi"})

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

local T4 = Window:MakeTab({
Name = "Arena PVP",
Icon = "rbxassetid://",
PremiumOnly = false
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

T2:AddDropdown({
   Name = "Select Egg ID",
   Default = "1",
   Options = {"1","2","3","4","5","6","7","8","9","10"},
   Callback = function(Value)
      _G.EggID = tonumber(Value)
   end    
})

T2:AddDropdown({
   Name = "Select Hatch Amount",
   Default = "1",
   Options = {"1","3","8","10"},
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
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["GameService"]["RF"]["RequestOpenCrate"]:InvokeServer(_G.EggID,_G.a_h)
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
