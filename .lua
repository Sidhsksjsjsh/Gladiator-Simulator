local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()
local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = true, ConfigFolder = "TurtleFi"})

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

T2:AddLabel("Coming Soon!")

T3:AddTextbox({
  Name = "Enter Boss ID (Noob = 1)",
  Default = "1",
  TextDisappear = false,
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
