

if game.PlaceId == 109686116036889 then

    local _Version = "CyanHub v1.0"

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
        
            __HUM_player.WalkSpeed = value
        
        end

    }

    PLAYERTAB:Button{
        Name = "Go To Home",
	    Description = "Takes you back to your bunker",
	    Callback = function() 
        
            local __TP_NC_x = _homex__.CFrame

            _me_inWS.CFrame = __TP_NC_x * CFrame.new(0, 2, 0)
        
        end

    }

    PLAYERTAB:Button{
        Name = "Go To Night Crystal",
	    Description = "Teleports you to the underground Night Crystal",
	    Callback = function() 
        
            local __TP_NC_x = NC__model.CFrame

            _me_inWS.CFrame = __TP_NC_x * CFrame.new(0, 2, 0)
        
        end

    }

    -- add button for rare furniture and Street for food drop

    PLAYERTAB:Toggle{

        Name = "No Die (Simple)",
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
                while true do
                    pcall(___RESETmaX)
                    task.wait()
                end

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
                        
                            task.wait()

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
                        
                            task.wait()

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
                        
                            task.wait()

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

end
