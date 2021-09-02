if getgenv()['CubedCommands'] then
    print('I already exist')
    return getgenv().CubedCommands
else
    print('creating table')
    getgenv()['CubedCommands'] = {
        ['Commands'] = {},

        ['Core'] = {
            ['ChatCmds'] = function(msg)
                local Args = string.split(msg, ' ')
                if Args[1] ~= '/e' then return end
                print('called command')
            
                local Func = function() end
                if getgenv().CubedCommands.Commands[tostring(Args[2]):lower()] then Func = getgenv().CubedCommands.Commands[tostring(Args[2]):lower()] end
                Args[1] = nil
                Args[2] = nil

                CommandArgs = {}
                for k, v in pairs(Args) do 
                    CommandArgs[#CommandArgs + 1] = v 
                end

                Func(CommandArgs)
            end,

            ['ChatPrint'] = function(FText, FColor)
                game.StarterGui:SetCore('ChatMakeSystemMessage', {
                    Text = FText,
                    Color = FColor,
                    Font = Enum.Font.SourceSansBold,
                    FontSize = Enum.FontSize.Size18
                })

                --local Chat = game.Players.LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame.Frame_MessageLogDisplay.Scroller:GetChildren()
                --Chat[#Chat]:Remove()
            end,

            ['FindPlayer'] = function(Name)
                for _, v in pairs(game.Players:GetPlayers()) do
                    local Find1, Find2 = string.find(v.Name:lower(), Name:lower())
                    if Find1 == nil then Find1, Find2 = string.find(v.DisplayName:lower(), Name:lower()) end
                    
                    if Find1 == 1 then
                        return v
                    end
                end
            end,

            ['Add'] = function(Cmd, Callback)
                getgenv().CubedCommands.Commands[tostring(Cmd):lower()] = Callback
            end

        }

    }

    game.Players.LocalPlayer.Chatted:connect(getgenv()['CubedCommands']['Core']['ChatCmds'])

    return getgenv()['CubedCommands']
end
