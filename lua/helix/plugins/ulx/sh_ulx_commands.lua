local function Quote(str)
    return "\"" .. tostring(str) .. "\""
end

ix.command.Add("Menu", {
    description = "Open Ulx Menu.",
    arguments = {},
    OnRun = function(self, client)
        client:ConCommand("ulx menu")
    end
})

ix.command.Add("Pm", {
    description = "Send a private message to target.",
    arguments = {
        ix.type.character,
        ix.type.string,
    },
    OnRun = function(self, client, who, message)
        client:ConCommand("ulx psay " .. Quote(who:GetPlayer():Nick()) .. " " .. Quote(message))
    end
})

ix.command.Add("Say", {
    description = "Send a message to everyone in the chat box.",
    arguments = {
        ix.type.string,
    },
    OnRun = function(self, client, message)
        client:ConCommand("ulx tsay " .. Quote(message))
    end
})

ix.command.Add("Csay", {
    description = "Send a centered message on screen.",
    arguments = {
        ix.type.string,
    },
    OnRun = function(self, client, message)
        client:ConCommand("ulx csay " .. Quote(message))
    end
})

ix.command.Add("Mute", {
    description = "Mute a player.",
    arguments = {
        ix.type.character,
    },
    OnRun = function(self, client, who)
        client:ConCommand("ulx mute " .. Quote(who:GetPlayer():Nick()))
    end
})

ix.command.Add("Unmute", {
    description = "Unmute a player.",
    arguments = {
        ix.type.character,
    },
    OnRun = function(self, client, who)
        client:ConCommand("ulx unmute " .. Quote(who:GetPlayer():Nick()))
    end
})

ix.command.Add("Gag", {
    description = "Disable voice chat for a player.",
    arguments = {
        ix.type.character,
    },
    OnRun = function(self, client, who)
        client:ConCommand("ulx gag " .. Quote(who:GetPlayer():Nick()))
    end
})

ix.command.Add("Ungag", {
    description = "Enable voice chat for a player.",
    arguments = {
        ix.type.character,
    },
    OnRun = function(self, client, who)
        client:ConCommand("ulx ungag " .. Quote(who:GetPlayer():Nick()))
    end
})

ix.command.Add("Slap", {
    description = "Slap a player with optional damage.",
    arguments = {
        ix.type.character,
        bit.bor(ix.type.number, ix.type.optional)
    },
    OnRun = function(self, client, who, damage)
        client:ConCommand("ulx slap " .. Quote(who:GetPlayer():Nick()) .. " " .. (damage or ""))
    end
})

ix.command.Add("Kick", {
    description = "Kick a player from the server.",
    arguments = {
        ix.type.character,
        ix.type.string
    },
    OnRun = function(self, client, who, reason)
        client:ConCommand("ulx kick " .. Quote(who:GetPlayer():Nick()) .. " " .. Quote(reason))
    end
})

ix.command.Add("Ban", {
    description = "Ban a player.",
    arguments = {
        ix.type.character,
        ix.type.number,
        ix.type.string
    },
    OnRun = function(self, client, who, minutes, reason)
        client:ConCommand("ulx ban " .. Quote(who:GetPlayer():Nick()) .. " " .. minutes .. " " .. Quote(reason))
    end
})

ix.command.Add("Unban", {
    description = "Unban a SteamID.",
    arguments = {
        ix.type.string
    },
    OnRun = function(self, client, steamid)
        client:ConCommand("ulx unban " .. Quote(steamid))
    end
})

ix.command.Add("Bring", {
    description = "Bring a player to you.",
    arguments = {
        ix.type.character
    },
    OnRun = function(self, client, who)
        client:ConCommand("ulx bring " .. Quote(who:GetPlayer():Nick()))
    end
})

ix.command.Add("Goto", {
    description = "Teleport to a player.",
    arguments = {
        ix.type.character
    },
    OnRun = function(self, client, who)
        client:ConCommand("ulx goto " .. Quote(who:GetPlayer():Nick()))
    end
})

ix.command.Add("Return", {
    description = "Return player to previous position.",
    arguments = {
        ix.type.character
    },
    OnRun = function(self, client, who)
        client:ConCommand("ulx return " .. Quote(who:GetPlayer():Nick()))
    end
})

ix.command.Add("Freeze", {
    description = "Freeze a player.",
    arguments = {
        ix.type.character
    },
    OnRun = function(self, client, who)
        client:ConCommand("ulx freeze " .. Quote(who:GetPlayer():Nick()))
    end
})

ix.command.Add("Unfreeze", {
    description = "Unfreeze a player.",
    arguments = {
        ix.type.character
    },
    OnRun = function(self, client, who)
        client:ConCommand("ulx unfreeze " .. Quote(who:GetPlayer():Nick()))
    end
})

ix.command.Add("God", {
    description = "Enable godmode on a player.",
    arguments = {
        ix.type.character
    },
    OnRun = function(self, client, who)
        client:ConCommand("ulx god " .. Quote(who:GetPlayer():Nick()))
    end
})

ix.command.Add("Ungod", {
    description = "Disable godmode on a player.",
    arguments = {
        ix.type.character
    },
    OnRun = function(self, client, who)
        client:ConCommand("ulx ungod " .. Quote(who:GetPlayer():Nick()))
    end
})

ix.command.Add("Hp", {
    description = "Set a player's health.",
    arguments = {
        ix.type.character,
        ix.type.number
    },
    OnRun = function(self, client, who, hp)
        client:ConCommand("ulx hp " .. Quote(who:GetPlayer():Nick()) .. " " .. hp)
    end
})

ix.command.Add("Armor", {
    description = "Set a player's armor.",
    arguments = {
        ix.type.character,
        ix.type.number
    },
    OnRun = function(self, client, who, armor)
        client:ConCommand("ulx armor " .. Quote(who:GetPlayer():Nick()) .. " " .. armor)
    end
})

ix.command.Add("Noclip", {
    description = "Toggle noclip on player.",
    arguments = {
        ix.type.character
    },
    OnRun = function(self, client, who)
        client:ConCommand("ulx noclip " .. Quote(who:GetPlayer():Nick()))
    end
})

ix.command.Add("Spectate", {
    description = "Spectate a player.",
    arguments = {
        ix.type.character
    },
    OnRun = function(self, client, who)
        client:ConCommand("ulx spectate " .. Quote(who:GetPlayer():Nick()))
    end
})

ix.command.Add("Teleport", {
    description = "Teleport a player to your aim position.",
    arguments = {
        ix.type.character
    },
    OnRun = function(self, client, who)
        client:ConCommand("ulx teleport " .. Quote(who:GetPlayer():Nick()))
    end
})