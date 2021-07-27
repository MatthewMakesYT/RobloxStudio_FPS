--[[Local Script - Client]]--------------------------------------------------------------------------------
local tool = script.Parent 
local origin = tool:WaitForChild("Origin")

local rpm = script.Parent:WaitForChild("rpm").value
local fireRate = 60/rpm

local player = game.Players.LocalPlayer 
local mouse = player:GetMouse()

local laserFireEvent = game.ReplicatedStorage.LaserFire 
local laserFolder = game.Workspace.Lasers 

mouse.TargetFilter = laserFolder 

local debounce = false 
local cooldown = fireRate 

local firing = false

local gunDamage = script.Parent:WaitForChild("damage").value


local RunService = game:GetService("RunService")



RunService.RenderStepped:Connect(function(step)
	
	if firing == true then

		if debounce then return end 
		debounce = true

		local mousePosition = mouse.Hit.p 
		local originPosition = origin.Position
		
		local = workspace:Raycast(rayOrigin, rayDirection)
		
		

		laserFireEvent:FireServer(mousePosition, originPosition, gunDamage, bulletRange)

		wait(cooldown)
		debounce = false 
 
	else
		
		return
		
	end

end)







mouse.Button1Down:connect( function()
	firing = true
	
end)

mouse.Button1Up:connect( function()
	firing = false
end)

while wait() do
	if firing then
		print("Mouse held")
	else
		print("Not held.")
	end
end





