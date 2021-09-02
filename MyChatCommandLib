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

            ['Add'] = function(Cmd, Callback)
                getgenv().CubedCommands.Commands[tostring(Cmd):lower()] = Callback
            end

        }

    }

    game.Players.LocalPlayer.Chatted:connect(getgenv()['CubedCommands']['Core']['ChatCmds'])

    return getgenv()['CubedCommands']
end
