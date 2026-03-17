local PLUGIN = PLUGIN

PLUGIN.name = "ULX Admin Tool"
PLUGIN.author = "Ulysses"
PLUGIN.description = "A classic admin tool by ulysses team."


if SERVER then
    include("sv_ulib_patches.lua")
    include("sh_ulx_commands.lua")
    AddCSLuaFile("sh_ulx_commands.lua")
else
    include("sh_ulx_commands.lua")
end


