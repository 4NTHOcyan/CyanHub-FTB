

if game.PlaceId == 109686116036889 then

    local _Version = "CyanHub v1.1-beta"

    --// call Library
    local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

    local GUI = Mercury:Create{
        Name = _Version,
        Size = UDim2.fromOffset(600, 400),
        Theme = Mercury.Themes.Aqua,
        Link = "https://github.com/4NTHOcyan",
        Keybind = Enum.KeyCode.RightShift
    }

    --// Local VAR
    local __HUM_player = game.Players.LocalPlayer.Character.Humanoid -- PlayerTab
    
    local __myname8 = game.Players.LocalPlayer.Name

    local myperson = game.Workspace[__myname8] --my model in workspace

    local direct_userID = game.Players.LocalPlayer.UserId
    local ser_bun = tostring(direct_userID).."_Bunker" -- user ID BUNKER folder in workspace
    local ser_EQUI = tostring(direct_userID).."_Wyposazenie" -- user ID EQUIPMENT folder in workspace

    local NC__model = game.Workspace["Night Crystal"]:FindFirstChild("Particles") -- Night Crystal location

    local _me_inWS = game.Players.LocalPlayer.Character.HumanoidRootPart -- my HRP

    local _homex__ = game.Workspace.Bunkers[ser_bun].Elementy.C1 -- my bunker

    local _Invincible_ = false -- Invincible toggle flag
    local _Pickup_ = false -- Food pick up flag
    local _naurclip = false -- noclip flag

    local _HurtyParts = workspace.TGaz -- toxic gas in rare wh

    local _W = game.Workspace
    local _eQuipment = workspace.Wyposazenie
    local _MYeQuipment = workspace.Wyposazenie[ser_EQUI]

    local bunkers = game.Workspace.Bunkers

    ----------
    --// Main Tab Creation [PLAYER]

    local PLAYERTAB = GUI:Tab{
        Name = "Player",
        Icon = nil,
    }

    PLAYERTAB:Slider{
        Name = "Speed",
        Default = 16,
	    Min = 16,
	    Max = 130,
	    Callback = function(value) 
        
            local charr_ = game.Players.LocalPlayer.Character
            local __hum_PLAYER = charr_.Humanoid

            __hum_PLAYER.WalkSpeed = value

            if not charr_ or charr_:FindFirstChildOfClass("Humanoid").Health == 0 then
                local plr_wait = game.Players.LocalPlayer.CharacterAdded:Wait()
                plr_wait:FindFirstChild("Humanoid").WalkSpeed = value
            end
        
        end

    }


    PLAYERTAB:Toggle{

        Name = "No Clip",
	    StartingState = false,
	    Description = "Go through stuff",
	    Callback = function(state) 
        
           _naurclip = state
            while _naurclip do

                local __plr = game.Players.LocalPlayer.Character

                for _,v in pairs(__plr:GetChildren()) do
                    task.wait()
                    if v:IsA("BasePart") and v.CanCollide == true then
                        task.wait()
                        v.CanCollide = false
                        v.CanQuery = false
                        v.CanTouch = false
                        task.wait()
                    end
                end

                if _naurclip == false then
                    for _,v in pairs(__plr:GetChildren()) do
                        task.wait()
                        if v:IsA("BasePart") and v.CanCollide == false then  --// left off here with changes
                            task.wait()
                            v.CanCollide = true
                            v.CanQuery = true
                            v.CanTouch = true
                            task.wait()
                        end
                    end
                end

            end
        
        end
    }


    PLAYERTAB:Toggle{

        Name = "No Die (experimental*)",
	    StartingState = false,
	    Description = "Do not die to Hunger or Toxic Gas",
	    Callback = function(state) 
        
            _Invincible_ = state
            while _Invincible_ do

                function ___DISABLe()

                    local __TARGETscripT = myperson.Health

                    __TARGETscripT.Enabled = false
                    __TARGETscripT.Disabled = true
                    __TARGETscripT.Archivable = false -- // attempts to nullify standard Health script

                end

                function ___RESETmaX()

                    local xzhumAnoid = game.Players.LocalPlayer.Character.Humanoid

                    xzhumAnoid.Health = 100
                    xzhumAnoid.MaxHealth = 100
                    xzhumAnoid.maxHealth = 100 --// attempts setting all health variables to 100

                end

                _HurtyParts.CanQuery = false
                _HurtyParts.CanTouch = false

                pcall(___DISABLe)
                task.wait()
                
                pcall(___RESETmaX)
                task.wait()          -- !!! changed -- removed while loop
                

            end
        
        end


    }

    PLAYERTAB:Toggle{

        Name = "Instant Pickup",
	    StartingState = false,
	    Description = "Instantly pick up food items from the world",
	    Callback = function(state) 
        
            _Pickup_ = state
            while _Pickup_ do

                for _,v in pairs(_W:GetChildren()) do -- // general workspace filtering

                    if v:IsA("Tool") then
                        local __HandleF = v:FindFirstChild("Handle")
                    
                        if __HandleF then

                            local __PROX = __HandleF:FindFirstChild("ProximityPrompt")
                        
                            __PROX.HoldDuration = 0

                            task.wait()
                        else
                            continue
                        end
                    end
                
                end

                for _,v in pairs(_eQuipment:GetChildren()) do -- // general equipment folder filtering
                
                    if v:IsA("Tool") then
                        local __HandleF = v:FindFirstChild("Handle")
                    
                        if __HandleF then

                            local __PROX = __HandleF:FindFirstChild("ProximityPrompt")
                        
                            __PROX.HoldDuration = 0

                            task.wait()
                        else
                            continue
                        end
                    end
                
                end

                for _,v in pairs(_MYeQuipment:GetChildren()) do -- // my equipment inside bunker filtering
                
                    if v:IsA("Tool") then
                        local __HandleF = v:FindFirstChild("Handle")
                    
                        if __HandleF then

                            local __PROX = __HandleF:FindFirstChild("ProximityPrompt")
                        
                            __PROX.HoldDuration = 0

                            task.wait()
                        else
                            continue
                        end
                    end
                
                end

                task.wait()

            end
        
        end


    }

    ----------
    --// Tab Creation [PAYWALLS]

    local DELETE = GUI:Tab{
        Name = "Paywalls",
        Icon = nil,
    }

    DELETE:Button{

        Name = "Delete Doors",
	    Description = "Deletes ALL paywall doors in ALL bunkers!",
	    Callback = function() 
        
            for _,v in pairs(bunkers:GetChildren()) do
                for _,j in pairs(v:GetChildren())do
                    local retrieve = j 
                
                if retrieve:IsA("Part") and string.find(retrieve.Name, "GamePass1") then
                    retrieve.CanCollide = false
                    retrieve.CanQuery = false
                    retrieve.CanTouch = false
                    retrieve.AudioCanCollide = false
                    retrieve.Transparency = 1
                
                    for _,s in pairs(retrieve:GetChildren()) do
                        local gui = s
                    
                        if gui:IsA("SurfaceGui") then
                            gui.Enabled = false
                        end 
                end
            
                elseif retrieve:IsA("Part") and string.find(retrieve.Name, "GamePass2") then
                    retrieve.CanCollide = false
                    retrieve.CanQuery = false
                    retrieve.CanTouch = false
                    retrieve.AudioCanCollide = false
                    retrieve.Transparency = 1
                
                    for _,s in pairs(retrieve:GetChildren()) do
                        local gui = s
                    
                        if gui:IsA("SurfaceGui") then
                            gui.Enabled = false
                        end 
                end
            
                elseif retrieve:IsA("Part") and string.find(retrieve.Name, "GamePass3") then
                    retrieve.CanCollide = false
                    retrieve.CanQuery = false
                    retrieve.CanTouch = false
                    retrieve.AudioCanCollide = false
                    retrieve.Transparency = 1
                
                    for _,s in pairs(retrieve:GetChildren()) do
                        local gui = s
                    
                        if gui:IsA("SurfaceGui") then
                            gui.Enabled = false
                        end 
                end
            
                else
                    continue
                end
            
                end

            end
        
        end


    }

    ----------
    --// Teleport Tab

    local TP = GUI:Tab{
        Name = "Teleport",
        Icon = nil,
    }

    TP:Button{
        Name = "Go To Home",
	    Description = "Teleports you to your bunker",
	    Callback = function() 
        
            local __TP_NC_x = _homex__.CFrame


            local charr_ = game.Players.LocalPlayer.Character
            local __hum_PLAYER = charr_:FindFirstChild("HumanoidRootPart")
            __hum_PLAYER.CFrame = __TP_NC_x * CFrame.new(0, 2, 0)

            if not __hum_PLAYER or charr_:FindFirstChildOfClass("Humanoid").Health == 0 then
                local plr_wait = game.Players.LocalPlayer.CharacterAdded:Wait()
                plr_wait.Humanoid:FindFirstChild("HumanoidRootPart").CFrame = __TP_NC_x * CFrame.new(0, 2, 0)
            end
     
        end

    }

    TP:Button{
        Name = "Go To Night Crystal",
	    Description = "Teleports you to the underground Night Crystal",
	    Callback = function() 

            local __TP_NC_x = NC__model.CFrame

            local charr_ = game.Players.LocalPlayer.Character
            local __hum_PLAYER = charr_:FindFirstChild("HumanoidRootPart")
            __hum_PLAYER.CFrame = __TP_NC_x * CFrame.new(0, 2, 0)

            if not __hum_PLAYER or charr_:FindFirstChildOfClass("Humanoid").Health == 0 then
                local plr_wait = game.Players.LocalPlayer.CharacterAdded:Wait()
                plr_wait.Humanoid:FindFirstChild("HumanoidRootPart").CFrame = __TP_NC_x * CFrame.new(0, 2, 0)
            end
        
        end

    }

    TP:Button{
        Name = "Go To Rare Furniture",
	    Description = "Teleports you to the Rare Furniture inside of the Market",
	    Callback = function() 

            local charr_ = game.Players.LocalPlayer.Character
            local __hum_PLAYER = charr_:FindFirstChild("HumanoidRootPart")
            __hum_PLAYER.CFrame = CFrame.new(-190, 5, 35)

            if not __hum_PLAYER or charr_:FindFirstChildOfClass("Humanoid").Health == 0 then
                local plr_wait = game.Players.LocalPlayer.CharacterAdded:Wait()
                plr_wait.Humanoid:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(-190, 5, 35)
            end
        
        end

    }

    TP:Button{
        Name = "Go To Street",
	    Description = "Teleports you to the main road",
	    Callback = function() 

            local charr_ = game.Players.LocalPlayer.Character
            local __hum_PLAYER = charr_:FindFirstChild("HumanoidRootPart")
            __hum_PLAYER.CFrame = CFrame.new(290, 5, 35)

            if not __hum_PLAYER or charr_:FindFirstChildOfClass("Humanoid").Health == 0 then
                local plr_wait = game.Players.LocalPlayer.CharacterAdded:Wait()
                plr_wait.Humanoid:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(290, 5, 35)
            end
        
        end

    }

    TP:Button{
        Name = "Go To Market",
	    Description = "Teleports you to the regular market entrance",
	    Callback = function() 

            local charr_ = game.Players.LocalPlayer.Character
            local __hum_PLAYER = charr_:FindFirstChild("HumanoidRootPart")
            __hum_PLAYER.CFrame = CFrame.new(100, 5, -125)

            if not __hum_PLAYER or charr_:FindFirstChildOfClass("Humanoid").Health == 0 then
                local plr_wait = game.Players.LocalPlayer.CharacterAdded:Wait()
                plr_wait.Humanoid:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(100, 5, -125)
            end
        
        end

    }

        -- add button for Street for food drop


    ----------
    --// Furniture Tab -- TEST Suite !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    local _F = GUI:Tab{
        Name = "Furniture (beta in progress)",
        Icon = nil,
    }


    local selected = nil


    local function ReturnFurniture()
        local Names = {}
    
        for _, item in pairs(workspace.Wyposazenie:GetChildren()) do
            if item:IsA("Folder") then
                for _, interno in pairs(item:GetChildren()) do
                    if interno:IsA("Model") and not table.find(Names, interno.Name) then
                        table.insert(Names, interno.Name)
                end
            end

            elseif item:IsA("Model") and not table.find(Names, item.Name) then
                table.insert(Names, item.Name)
            end

        end
    
        return Names
    end


    local function GetFurniture()
        for _, furniture in pairs(workspace.Wyposazenie:GetChildren()) do
            if furniture:IsA("Folder") then
                for _, interno in pairs(furniture:GetChildren()) do
                    if interno:IsA("Model") and interno.Name == selected then
                        game:GetService("ReplicatedStorage").PickupItemEvent:FireServer(interno)
                        return true
                    end
            end

            elseif furniture:IsA("Model") and furniture.Name == selected then
                game:GetService("ReplicatedStorage").PickupItemEvent:FireServer(furniture)
                return true
            end
        end
    
        return false
    end



    local furnitureDrop = _F:Dropdown{

        Name = "Furniture List",
    	StartingText = "Select...",
    	Description = nil,
        Items = Names,
        Callback = function(item) return end

    }



end
