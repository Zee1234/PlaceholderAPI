local ZPSI = dofile(cPluginManager:GetCurrentPlugin():GetLocalFolder() .. "/ZPSI/ZPSI.lua")

g_Config = ZPSI.parse(cPluginManager:GetCurrentPlugin():GetLocalFolder() .. "/config.zpsi")

assert(g_Config.EnableReplacements ~= nil,"Config value EnableReplacements not found!")
if g_Config.EnableReplacements then assert(g_Config.Replacements ~= nil,"Config value Replacements not found!") end
