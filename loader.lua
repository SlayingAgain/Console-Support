local G={ViolenceDistrict=93978595733734}
local S={ViolenceDistrict={
	"https://raw.githubusercontent.com/SlayingAgain/Console-Support/refs/heads/main/Violence%20District/Auto-Parry.lua", --// Auto Parry
	"https://raw.githubusercontent.com/SlayingAgain/Console-Support/refs/heads/main/Violence%20District/Auto-SC" --// Auto Skill Check
}}

local p=game:GetService("Players").LocalPlayer
local k
for n,id in pairs(G) do if game.PlaceId==id then k=n end end
if not k then return end

local function r(c)
	return c and c:FindFirstChild("Humanoid") and c:FindFirstChild("HumanoidRootPart")
end

local l=false
local function f()
	if l or not r(p.Character) then return end
	l=true
	for _,u in ipairs(S[k]) do pcall(function() loadstring(game:HttpGet(u))() end) end
end

if p.Character then repeat task.wait() until r(p.Character) f() end
p.CharacterAdded:Connect(function() l=false repeat task.wait() until r(p.Character) f() end)
