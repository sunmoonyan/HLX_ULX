
ix.command.Add("Menu", {
    description = "Open Ulx Menu.",
    arguments = {
    },
    OnRun = function(self, client)
        client:ConCommand("ulx menu")
    end
})

------------------------------ Chat ------------------------------

ix.command.Add("Pm", {
    description = "Send a private message to target.",
    arguments = {
        ix.type.character,
        ix.type.string,
    },
    OnRun = function(self, client, who ,message)
        client:ConCommand('ulx psay "' .. who:GetPlayer():Nick() .. '" "' .. message .. '"')
    end
})

ix.command.Add("Say", {
    description = "Send a message to everyone in the chat box.",
    privilege = "ulx tsay",
    arguments = {
        ix.type.string,
    },
    OnRun = function(self, client, message)
        client:ConCommand("ulx tsay " .. message )
    end
})

ix.command.Add("Csay", {
    description = "Send a message to everyone in the left of their screen.",
    privilege = "ulx csay",
    arguments = {
        ix.type.string
    },
    OnRun = function(self, client, message)
        client:ConCommand("ulx csay " .. message )
    end
})

if CLIENT then 

    function ULib.csayDraw( msg, color, duration, fade )
        color = color or ix.config.Get("color")

        if (not IsValid(ix.gui.area)) then
            vgui.Create("ixArea")
        end
        ix.gui.area:AddEntry(msg, color)

    end

end

ix.command.Add("Gimp", {
    description = "Gimps target(s) so they are unable to chat normally.",
    privilege = "ulx gimp",
    arguments = {
        ix.type.character,
    },
    OnRun = function(self, client,who)
        client:ConCommand("ulx gimp "..who:GetPlayer():Nick() )
    end
})

ix.command.Add("Ungimp", {
    description = "Ungimps target(s) so they are able to chat normally.",
    privilege = "ulx ungimp",
    arguments = {
        ix.type.character,
    },
    OnRun = function(self, client,who)
        client:ConCommand("ulx ungimp "..who:GetPlayer():Nick() )
    end
})

ix.command.Add("Mute", {
    description = "Mutes target(s) so they are unable to chat.",
    privilege = "ulx mute",
    arguments = {
        ix.type.character,
    },
    OnRun = function(self, client,who)
        client:ConCommand("ulx mute "..who:GetPlayer():Nick() )
    end
})

ix.command.Add("Unmute", {
    description = "Unmutes target(s) so they are able to chat.",
    privilege = "ulx unmute",
    arguments = {
        ix.type.character,
    },
    OnRun = function(self, client,who)
        client:ConCommand("ulx unmute "..who:GetPlayer():Nick() )
    end
})

ix.command.Add("Gag", {
    description = "Gag target(s), disables microphone.",
    privilege = "ulx gag",
    arguments = {
        ix.type.character,
    },
    OnRun = function(self, client,who)
        client:ConCommand("ulx gag "..who:GetPlayer():Nick() )
    end
})

ix.command.Add("Ungag", {
    description = "Ungag target(s), enable microphone.",
    privilege = "ulx ungag",
    arguments = {
        ix.type.character,
    },
    OnRun = function(self, client,who)
        client:ConCommand("ulx ungag "..who:GetPlayer():Nick() )
    end
})

------------------------------ Thetime ------------------------------

ix.command.Add("Time", {
    description = "Shows you the server time.",
    privilege = "ulx thetime",
    arguments = {
    },
    OnRun = function(self, client)
        client:ConCommand("ulx thetime" )
    end
})

------------------------------ Fun ------------------------------

ix.command.Add("Slap", {
    description = "Slaps target(s) with given damage.",
    privilege = "ulx slap",
    arguments = {
        ix.type.character,
        bit.bor(ix.type.number, ix.type.optional)
    },
    OnRun = function(self, client,who,damage)
        local damage = damage or ""
        client:ConCommand("ulx slap "..who:GetPlayer():Nick().." "..damage )
    end
})

ix.command.Add("Whip", {
    description = "Slaps target(s) x times with given damage each time.",
    privilege = "ulx whip",
    arguments = {
        ix.type.character,
        ix.type.number,
        ix.type.number
    },
    OnRun = function(self, client,who,damage,times)
        client:ConCommand("ulx whip "..who:GetPlayer():Nick().." "..damage.." "..times )
    end
})

ix.command.Add("Slay", {
    description = "Slays target(s)",
    privilege = "ulx slay",
    arguments = {
        ix.type.character
    },
    OnRun = function(self, client,who)
        client:ConCommand("ulx slay "..who:GetPlayer():Nick() )
    end
})

ix.command.Add("Sslay", {
    description = "Silently slays target(s).",
    privilege = "ulx sslay",
    arguments = {
        ix.type.character
    },
    OnRun = function(self, client,who)
        client:ConCommand("ulx sslay "..who:GetPlayer():Nick() )
    end
})

ix.command.Add("Ignite", {
    description = "Ignites target(s).",
    privilege = "ulx ignite",
    arguments = {
        ix.type.character,
        bit.bor(ix.type.number, ix.type.optional)
    },
    OnRun = function(self, client,who,time)
        time = time or "30"
        client:ConCommand("ulx ignite "..who:GetPlayer():Nick() .." "..time)
    end
})

ix.command.Add("Unignite", {
    description = "Unignites target(s).",
    privilege = "ulx unignite",
    arguments = {
        ix.type.character,
    },
    OnRun = function(self, client,who)
        client:ConCommand("ulx unignite "..who:GetPlayer():Nick() )
    end
})

ix.command.Add("Ungniteall", {
    description = "Extinguishes all players and all entities.",
    privilege = "ulx unigniteall",
    arguments = {
    },
    OnRun = function(self, client,who)
        client:ConCommand("ulx unigniteall")
    end
})

ix.command.Add("Sound", {
    description = "Plays a sound (relative to sound dir).",
    privilege = "ulx sound",
    arguments = {
        ix.type.string
    },
    OnRun = function(self, client,path)
        client:ConCommand("ulx playsound "..path)
    end
})

ix.command.Add("Freeze", {
    description = "Freezes target(s).",
    privilege = "ulx freeze",
    arguments = {
        ix.type.character,
    },
    OnRun = function(self, client,who)
        client:ConCommand("ulx freeze "..who:GetPlayer():Nick() )
    end
})


ix.command.Add("Unfreeze", {
    description = "Unfreezes target(s).",
    privilege = "ulx unfreeze",
    arguments = {
        ix.type.character,
    },
    OnRun = function(self, client,who)
        client:ConCommand("ulx unfreeze "..who:GetPlayer():Nick() )
    end
})

ix.command.Add("God", {
    description = "Grants god mode to target(s).",
    privilege = "ulx god",
    arguments = {
        ix.type.character
    },
    OnRun = function(self, client,who)
        client:ConCommand("ulx god "..who:GetPlayer():Nick() )
    end
})

ix.command.Add("Ungod", {
    description = "Ungod target(s).",
    privilege = "ulx ungod",
    arguments = {
        ix.type.character,
    },
    OnRun = function(self, client,who)
        client:ConCommand("ulx ungod "..who:GetPlayer():Nick() )
    end
})

ix.command.Add("Hp", {
    description = "Sets the hp for target(s).",
    privilege = "ulx hp",
    arguments = {
        ix.type.character,
        ix.type.number
    },
    OnRun = function(self, client,who,hp)
        client:ConCommand("ulx hp "..who:GetPlayer():Nick().." "..hp )
    end
})

ix.command.Add("Armor", {
    description = "Sets the armor for target(s).",
    privilege = "ulx armor",
    arguments = {
        ix.type.character,
        ix.type.number
    },
    OnRun = function(self, client,who,hp)
        client:ConCommand("ulx armor "..who:GetPlayer():Nick().." "..hp )
    end
})

ix.command.Add("Cloak", {
    description = "Cloaks target(s).",
    privilege = "ulx cloack",
    arguments = {
        ix.type.character,
        ix.type.number
    },
    OnRun = function(self, client,who,amount)
        client:ConCommand("ulx cloak "..who:GetPlayer():Nick().." "..amount )
    end
})

ix.command.Add("Uncloak", {
    description = "Uncloaks target(s).",
    privilege = "ulx uncloack",
    arguments = {
        ix.type.character
    },
    OnRun = function(self, client,who)
        client:ConCommand("ulx cloak "..who:GetPlayer():Nick() )
    end
})

ix.command.Add("Blind", {
    description = "Blind target(s).",
    privilege = "ulx blind",
    arguments = {
        ix.type.character,
        ix.type.number
    },
    OnRun = function(self, client,who,amount)
        client:ConCommand("ulx blind "..who:GetPlayer():Nick().." "..amount )
    end
})

ix.command.Add("Unblind", {
    description = "Unblind target(s).",
    privilege = "ulx unblind",
    arguments = {
        ix.type.character
    },
    OnRun = function(self, client,who)
        client:ConCommand("ulx unblind "..who:GetPlayer():Nick() )
    end
})

ix.command.Add("Jail", {
    description = "Jails target(s).",
    privilege = "ulx jail",
    arguments = {
        ix.type.character,
        ix.type.number
    },
    OnRun = function(self, client,who,seconds)
        client:ConCommand("ulx jail "..who:GetPlayer():Nick().." "..seconds )
    end
})

ix.command.Add("Unjail", {
    description = "unjails target(s).",
    privilege = "ulx unjail",
    arguments = {
        ix.type.character
    },
    OnRun = function(self, client,who)
        client:ConCommand("ulx unjail "..who:GetPlayer():Nick() )
    end
})

ix.command.Add("JailTP", {
    description = "Teleports, then jails target(s).",
    privilege = "ulx jailtp",
    arguments = {
        ix.type.character,
        ix.type.number
    },
    OnRun = function(self, client,who,seconds)
        client:ConCommand("ulx jailtp "..who:GetPlayer():Nick().." "..seconds )
    end
})

ix.command.Add("Ragdoll", {
    description = "ragdolls target(s).",
    privilege = "ulx ragdoll",
    arguments = {
        ix.type.character,
    },
    OnRun = function(self, client,who)
        client:ConCommand("ulx ragdoll "..who:GetPlayer():Nick() )
    end
})

ix.command.Add("Unragdoll", {
    description = "unragdolls target(s).",
    privilege = "ulx unragdoll",
    arguments = {
        ix.type.character,
    },
    OnRun = function(self, client,who)
        client:ConCommand("ulx unragdoll "..who:GetPlayer():Nick() )
    end
})

ix.command.Add("Maul", {
    description = "Maul target(s).",
    privilege = "ulx maul",
    arguments = {
        ix.type.character,
    },
    OnRun = function(self, client,who)
        client:ConCommand("ulx maul "..who:GetPlayer():Nick() )
    end
})

ix.command.Add("Strip", {
    description = "Strip weapons from target(s).",
    privilege = "ulx strip",
    arguments = {
        ix.type.character,
    },
    OnRun = function(self, client,who)
        client:ConCommand("ulx strip "..who:GetPlayer():Nick() )
    end
})


-----------------------SERVER-----------------------------


ix.command.Add("Motd", {
    description = "Show the message of the day.",
    privilege = "ulx motd",
    arguments = {
    },
    OnRun = function(self, client)
        client:ConCommand("ulx motd" )
    end
})

ix.command.Add("Rcon", {
    description = "Execute command on server console.",
    privilege = "ulx rcon",
    arguments = {
        ix.type.string
    },
    OnRun = function(self, client,command)
        client:ConCommand("ulx rcon "..command )
    end
})

ix.command.Add("LuaRun", {
    description = "Executes lua in server console. (Use '=' for output)",
    privilege = "ulx luarun",
    arguments = {
        ix.type.string
    },
    OnRun = function(self, client,code)
        client:ConCommand("ulx luarun "..code )
    end
})

ix.command.Add("Exec", {
    description = "Execute a file from the cfg directory on the server",
    privilege = "ulx exec",
    arguments = {
        ix.type.string
    },
    OnRun = function(self, client,path)
        client:ConCommand("ulx exec "..path )
    end
})

ix.command.Add("Cexec", {
    description = "Run a command on console of target(s).",
    privilege = "ulx cexec",
    arguments = {
        ix.type.character,
        ix.type.string
    },
    OnRun = function(self, client,who,command)
        client:ConCommand("ulx cexec "..who:GetPlayer():Nick() .." "..command )
    end
})

ix.command.Add("Ent", {
    description = "Spawn an ent, separate flag and value with ':', flag:value pairs with '|'.",
    privilege = "ulx ent",
    arguments = {
        ix.type.string
    },
    OnRun = function(self, client, ent)
        client:ConCommand("ulx ent "..ent )
    end
})

-----------------------------TP--------------------------------------

ix.command.Add("Bring", {
    description = "Brings target(s) to you.",
    privilege = "ulx bring",
    arguments = {
        ix.type.character
    },
    OnRun = function(self, client, who)
        client:ConCommand("ulx bring "..who:GetPlayer():Nick() )
    end
})

ix.command.Add("Goto", {
    description = "Goto target.",
    privilege = "ulx goto",
    arguments = {
        ix.type.character
    },
    OnRun = function(self, client, who)
        client:ConCommand("ulx goto "..who:GetPlayer():Nick() )
    end
})

ix.command.Add("Send", {
    description = "Goto target.",
    privilege = "ulx send",
    arguments = {
        ix.type.character,
        ix.type.character
    },
    OnRun = function(self, client, who,at)
        client:ConCommand("ulx goto "..who:GetPlayer():Nick().." "..at:GetPlayer():Nick() )
    end
})

ix.command.Add("Teleport", {
    description = "Teleports target.",
    privilege = "ulx teleport",
    arguments = {
        ix.type.character
    },
    OnRun = function(self, client, who)
        client:ConCommand("ulx teleport "..who:GetPlayer():Nick())
    end
})

ix.command.Add("Return", {
    description = "Returns target to last position before a teleport.",
    privilege = "ulx return",
    arguments = {
        ix.type.character
    },
    OnRun = function(self, client, who)
        client:ConCommand("ulx return "..who:GetPlayer():Nick())
    end
})


------------------------------ users ------------------------------

ix.command.Add("AddUser", {
    description = "Add a user to specified group.",
    privilege = "ulx adduser",
    arguments = {
        ix.type.character,
        ix.type.string
    },
    OnRun = function(self, client,who,group)
        client:ConCommand("ulx adduser "..who:GetPlayer():Nick() .." "..group )
    end
})

ix.command.Add("AddUserId", {
    description = "Add a user by ID to specified group.",
    privilege = "ulx adduserid",
    arguments = {
        ix.type.string,
        ix.type.string
    },
    OnRun = function(self, client,SteamID,group)
        client:ConCommand("ulx adduser "..SteamID .." "..group )
    end
})

ix.command.Add("RemoveUser", {
    description = "Add a user to specified group.",
    privilege = "ulx removeuser",
    arguments = {
        ix.type.character
    },
    OnRun = function(self, client,who)
        client:ConCommand("ulx removeuser "..who:GetPlayer():Nick() )
    end
})

ix.command.Add("RemoveUserID", {
    description = "Permanently removes a user's access by ID.",
    privilege = "ulx removeuserid",
    arguments = {
        ix.type.string
    },
    OnRun = function(self, client,SteamID)
        client:ConCommand("ulx removeuser "..SteamID )
    end
})


ix.command.Add("UserAllow", {
    description = "Add to a user's access.",
    privilege = "ulx userallow",
    arguments = {
        ix.type.character,
        ix.type.string,
        ix.type.string
    },
    OnRun = function(self, client,who,command,accesstag)
        client:ConCommand("ulx userallow "..who:GetPlayer():Nick().." "..command.." "..accesstag )
    end
})

ix.command.Add("UserAllowID", {
    description = "Add to a user's access.",
    privilege = "ulx userallowid",
    arguments = {
        ix.type.string,
        ix.type.string,
        ix.type.string
    },
    OnRun = function(self, client,SteamID,command,accesstag)
        client:ConCommand("ulx userallowid  "..SteamID.." "..command.." "..accesstag )
    end
})

ix.command.Add("UserDeny", {
    description = "Remove from a user's access.",
    privilege = "ulx userdeny",
    arguments = {
        ix.type.character,
        ix.type.string
    },
    OnRun = function(self, client,who,command)
        client:ConCommand("ulx userdeny "..who:GetPlayer():Nick().." "..command )
    end
})

ix.command.Add("UserDeny", {
    description = "Remove from a user's access.",
    privilege = "ulx userdenyid",
    arguments = {
        ix.type.string,
        ix.type.string
    },
    OnRun = function(self, client,SteamID,command)
        client:ConCommand("ulx userdenyid "..SteamID.." "..command )
    end
})

ix.command.Add("AddGroup", {
    description = "Create a new group with optional inheritance.",
    privilege = "ulx addgroup",
    arguments = {
        ix.type.string
    },
    OnRun = function(self, client,name)
        client:ConCommand("ulx addgroup "..name )
    end
})

ix.command.Add("RenameGroup", {
    description = "Renames a group.",
    privilege = "ulx renamegroup",
    arguments = {
        ix.type.string,
        ix.type.string
    },
    OnRun = function(self, client,group,name)
        client:ConCommand("ulx renamegroup "..group.." "..name )
    end
})

ix.command.Add("SetGroupCanTarget", {
    description = "Sets what a group is allowed to target?",
    privilege = "ulx setgroupcantarget",
    arguments = {
        ix.type.string,
        ix.type.string
    },
    OnRun = function(self, client,group,target)
        client:ConCommand("ulx setgroupcantarget "..group.." "..target )
    end
})

ix.command.Add("RemoveGroup", {
    description = "Removes a group. USE WITH CAUTION.",
    privilege = "ulx removegroup",
    arguments = {
        ix.type.string
    },
    OnRun = function(self, client,name)
        client:ConCommand("ulx removegroup "..group )
    end
})

ix.command.Add("GroupAllow", {
    description = "Add to a group's access.",
    privilege = "ulx groupallow",
    arguments = {
        ix.type.string,
        ix.type.string,
        ix.type.string,
    },
    OnRun = function(self, client,group,command,accesstag)
        client:ConCommand("ulx groupallow "..group.." "..command.." "..accesstag )
    end
})

ix.command.Add("GroupDeny", {
    description = "Remove from a group's access.",
    privilege = "ulx groupdeny",
    arguments = {
        ix.type.string,
        ix.type.string,
    },
    OnRun = function(self, client,group,command)
        client:ConCommand("ulx groupallow "..group.." "..command.." "..accesstag )
    end
})


------------------------------ Map ------------------------------

ix.command.Add("Map", {
    description = "Changes map and gamemode.",
    privilege = "ulx map",
    arguments = {
        ix.type.string,
        bit.bor(ix.type.string, ix.type.optional)
    },
    OnRun = function(self, client,map,gamemode)
        gamemode = gamemode or ""
        client:ConCommand("ulx map "..map.." "..gamemode )
    end
})

------------------------------ Kick ------------------------------

ix.command.Add("Kick", {
    description = "Kicks target.",
    privilege = "ulx kick",
    arguments = {
        ix.type.character,
        ix.type.string
    },
    OnRun = function(self, client,who,reason)
        client:ConCommand("ulx kick "..who:GetPlayer():Nick().." "..reason )
    end
})


ix.command.Add("Ban", {
    description = "Ban target.",
    privilege = "ulx ban",
    arguments = {
        ix.type.character,
        ix.type.number,
        ix.type.string
    },
    OnRun = function(self, client,who,minutes,reason)
        client:ConCommand("ulx ban "..who:GetPlayer():Nick().." "..minutes.." "..reason )
    end
})

ix.command.Add("BanId", {
    description = "Ban target.",
    privilege = "ulx banid",
    arguments = {
        ix.type.string,
        ix.type.number,
        ix.type.string
    },
    OnRun = function(self, client,steamid,minutes,reason)
        client:ConCommand("ulx banid "..steamid.." "..minutes.." "..reason )
    end
})


ix.command.Add("Unban", {
    description = "Unban target.",
    privilege = "ulx unban",
    arguments = {
        ix.type.string
    },
    OnRun = function(self, client,steamid)
        client:ConCommand("ulx unban" )
    end
})

------------------------------ Noclip ------------------------------

ix.command.Add("Noclip", {
    description = "Toggles noclip on target(s).",
    privilege = "ulx noclip",
    arguments = {
        ix.type.character
    },
    OnRun = function(self, client,who)
        client:ConCommand("ulx noclip "..who:GetPlayer():Nick() )
    end
})

ix.command.Add("Spectate", {
    description = "Spectate target.",
    privilege = "ulx spectate",
    arguments = {
        ix.type.character
    },
    OnRun = function(self, client,who)
        client:ConCommand("ulx spectate "..who:GetPlayer():Nick() )
    end
})

--------------------VOTE-----------------------------

ix.command.Add("Vote", {
    description = "Starts a public vote.",
    privilege = "ulx vote",
    arguments = {
        ix.type.string,
        ix.type.string,
    },
    OnRun = function(self, client,title,answers)
        client:ConCommand("ulx vote "..title.." "..answers)
    end
})

ix.command.Add("StopVote", {
    description = "Stops a vote in progress.",
    privilege = "ulx stopvote",
    arguments = {
    },
    OnRun = function(self, client,title,answers)
        client:ConCommand("ulx stopvote")
    end
})


ix.command.Add("VoteMap2", {
    description = "Starts a public map vote.",
    privilege = "ulx votemap2",
    arguments = {
        ix.type.string,
    },
    OnRun = function(self, client,maps)
        client:ConCommand("ulx votemap2 "..maps)
    end
})

ix.command.Add("VoteKick", {
    description = "Starts a public kick vote against target.",
    privilege = "ulx votekick",
    arguments = {
        ix.type.character,
        ix.type.string,
    },
    OnRun = function(self, client,who,reason)
        client:ConCommand("ulx votekick "..who:GetPlayer():Nick().." "..reason)
    end
})

ix.command.Add("VoteBan", {
    description = "Starts a public ban vote against target.",
    privilege = "ulx voteban",
    arguments = {
        ix.type.character,
        ix.type.string,
    },
    OnRun = function(self, client,who,reason)
        client:ConCommand("ulx voteban "..who:GetPlayer():Nick().." "..reason)
    end
})

ix.command.Add("VoteMap", {
    description = "Vote for a map, no args lists available maps.",
    privilege = "ulx votemap",
    arguments = {
        ix.type.string,
    },
    OnRun = function(self, client,map)
        client:ConCommand("ulx votemap "..map)
    end
})

ix.command.Add("Veto", {
    description = "Veto a successful votemap.",
    privilege = "ulx veto",
    arguments = {
    },
    OnRun = function(self, client)
        client:ConCommand("ulx veto")
    end
})
