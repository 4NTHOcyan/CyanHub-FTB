loadstring(game:HttpGet("https://raw.githubusercontent.com/4NTHOcyan/CyanHub-FTB/refs/heads/main/ftb-jk"))() -- holder )

if game.PlaceId == 109686116036889 then

    local _Version = "CyanHub v1.1"

    --// call Library
    local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

    local GUI = Mercury:Create{
        Name = _Version,
        Size = UDim2.fromOffset(600, 400),
        Theme = Mercury.Themes.Aqua,
        Link = "http://xyz.CyanHub.v1.11f.4NTHOcyan/github?furnish-the-bunker",
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
    local __DOOR = false -- paywall door flag

    local _HurtyParts = workspace.TGaz -- toxic gas in rare wh

    local _W = game.Workspace
    local _eQuipment = workspace.Wyposazenie
    local _MYeQuipment = workspace.Wyposazenie[ser_EQUI]

    local bunkers = game.Workspace.Bunkers

    ----------
    --// Main Tab Creation [PLAYER]

    GUI:Notification{
	    Title = "Welcome!",
	    Text = "Thanks for using CyanHub by 4NTHOcyan | Please do not hinder the progress of other players :)",
	    Duration = 10,
	    Callback = function() end
    }

    local PLAYERTAB = GUI:Tab{
        Name = "Player",
        Icon = "rbxassetid://2795572800",
    }

    PLAYERTAB:Slider{
        Name = "Run Speed",
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

    PLAYERTAB:Slider{
        Name = "Jump Power",
        Default = 8,
	    Min = 8,
	    Max = 120,
	    Callback = function(value) 
        
            local charr_ = game.Players.LocalPlayer.Character
            local __hum_PLAYER = charr_.Humanoid

            __hum_PLAYER.JumpPower = value
            __hum_PLAYER.JumpHeight = value

            if not charr_ or charr_:FindFirstChildOfClass("Humanoid").Health == 0 then
                local plr_wait = game.Players.LocalPlayer.CharacterAdded:Wait()
                plr_wait:FindFirstChild("Humanoid").JumpPower = value
                plr_wait:FindFirstChild("Humanoid").JumpHeight = value
            end
        
        end

    }


    PLAYERTAB:Toggle{

        Name = "No Clip",
	    StartingState = false,
	    Description = "Go through stuff",
	    Callback = function(state) 
        
            _naurclip = state

            if _naurclip then
                GUI:Notification{
	                Title = "Notification",
	                Text = "No Clip Enabled",
	                Duration = 7,
	                Callback = function() end
                }
            end

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
                        if v:IsA("BasePart") and v.CanCollide == false then  
                            task.wait()
                            v.CanCollide = true
                            v.CanQuery = true
                            v.CanTouch = true
                            task.wait()
                        end
                    end
                end

            end
            task.wait()

            
        
        end
    }


    PLAYERTAB:Toggle{

        Name = "No Die (EXPERIMENTAL*)",
	    StartingState = false,
	    Description = "Do not die to Hunger* or Toxic Gas*",
	    Callback = function(state) 
        
            _Invincible_ = state

            if _Invincible_ then
                GUI:Notification{
	                Title = "WARNING",
	                Text = "You will still die/be captured by monsters. This feature prevents death, but does not eliminate it!",
	                Duration = 18,
	                Callback = function() end
                }
            end

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
                task.wait()         
                

            end
        
        end


    }

    PLAYERTAB:Toggle{

        Name = "Instant Pick-Up",
	    StartingState = false,
	    Description = "Instantly pick up food items from the world",
	    Callback = function(state) 
        
            _Pickup_ = state

            GUI:Notification{
                Title = "Notification",
                Text = "Instant Pick-Up Enabled",
                Duration = 7,
                Callback = function() end
            }

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
        Icon = "rbxassetid://35676121",
    }

    DELETE:Button{

        Name = "Delete Doors",
	    Description = "Deletes ALL paywall doors in ALL bunkers! > resets if player reloads",
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

            GUI:Notification{
                Title = "Notification",
                Text = "All paywall doors deleted",
                Duration = 7,
                Callback = function() end
            }
   
        end


    }

    ----------
    --// Teleport Tab

    local TP = GUI:Tab{
        Name = "Teleport",
        Icon = "rbxassetid://12941020168",
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

    TP:Button{
        Name = "Go To Market Roof",
	    Description = "Teleports you to the market roof",
	    Callback = function() 

            local charr_ = game.Players.LocalPlayer.Character
            local __hum_PLAYER = charr_:FindFirstChild("HumanoidRootPart")
            __hum_PLAYER.CFrame = CFrame.new(163, 51, -127)

            if not __hum_PLAYER or charr_:FindFirstChildOfClass("Humanoid").Health == 0 then
                local plr_wait = game.Players.LocalPlayer.CharacterAdded:Wait()
                plr_wait.Humanoid:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(163, 51, -127)
            end
        
        end

    }


    ----------
    --// Tab Creation TPtoPlayers

    local _F = GUI:Tab{
        Name = "People",
        Icon = "rbxassetid://2243841665",
    }


    local selected = nil


    local function ReturnPeople()
        local Names = {}
    
        for _, item in pairs(game:GetService("Players"):GetPlayers()) do
            if item:IsA("Model") and not table.find(Names, item.Name) then
                table.insert(Names, item.Name)

            elseif item:IsA("Player") and not table.find(Names, item.Name) then
                table.insert(Names, item.Name)
            end

        end
    
        return Names
    end


    local personDrop = _F:Dropdown{

        Name = "Player List",
    	StartingText = "Select...",
    	Description = nil,
        Items = ReturnPeople(),
        Callback = function(item)
            while true do

                selected = item 
                task.wait(1)

            return Items  
             

            end

        end
    }


    _F:Button{

        Name = "Teleport to Player",
	    Description = nil,
	    Callback = function() 
            if selected ~= nil then

                local _going_TO = game.Workspace[selected]:FindFirstChild("HumanoidRootPart").CFrame

                local charr_ = game.Players.LocalPlayer.Character
                local __hum_PLAYER = charr_:FindFirstChild("HumanoidRootPart")
                
                __hum_PLAYER.CFrame = CFrame.new(_going_TO.Position + Vector3.new(1, 4, 1))


                if not __hum_PLAYER or charr_:FindFirstChildOfClass("Humanoid").Health == 0 then
                    local plr_wait = game.Players.LocalPlayer.CharacterAdded:Wait()
                    
                    plr_wait.Humanoid:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(_going_TO.Position + Vector3.new(1, 4, 1))
                end

            end

            GUI:Notification{
                Title = "Notification",
                Text = "Teleported to player",
                Duration = 7,
                Callback = function() end
            }

        end
    }

    _F:Button{

        Name = "Refresh Players",
	    Description = nil,
	    Callback = function() 
        
            task.wait(1)

            personDrop:Clear()
            task.wait()
            local Names = {}
            for _, item in pairs(game:GetService("Players"):GetPlayers()) do
                if item:IsA("Model") and not table.find(Names, item.Name) then
                    table.insert(Names, item.Name)

                elseif item:IsA("Player") and not table.find(Names, item.Name) then
                    table.insert(Names, item.Name)
                end

            end
            personDrop:AddItems(Names)
            return Names
            
        
        end
        

    }


    ----------
    --// CREDITS

    GUI:Credit{
	    Name = "4NTHOcyan",
	    Description = "Creator/Tester/Hacker",
	    V3rm = "https://github.com/4NTHOcyan",
	    Discord = nil
    }

end

