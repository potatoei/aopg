local en = workspace.Entities
local isActive = false  -- Start the loop as inactive
print(isActive)

-- Function to get the names of all players
local function getPlayerNames()
    local playerNames = {}
    for _, player in ipairs(game.Players:GetPlayers()) do
        table.insert(playerNames, player.Name)
    end
    return playerNames
end

-- Function to toggle the script
local function toggleScript()
    isActive = not isActive
    if isActive then
        -- Start the loop if not already active
        spawn(function()
            while isActive do
                local plrs = getPlayerNames()
                for _, v in pairs(en:GetChildren()) do
                    if v:FindFirstChildOfClass("Humanoid") then
                        if not table.find(plrs, v.Name) then
                            if v.Humanoid.Health < v.Humanoid.MaxHealth * 0.5 then
                                v.Humanoid.Health = 0
                            end
                        end
                    end
                end
                wait(0.5)  -- Adjust the wait time as needed
            end
        end)
    end
end

-- Start the loop immediately
toggleScript()
