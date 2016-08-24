g_Plugin = {}
g_LDH = false
g_Placeholders = {}
g_Plugins = {}

cPlaceholder = dofile(cPluginManager:GetCurrentPlugin():GetLocalFolder() .. "/classes/cPlaceholder.lua")

function split(a_string,a_sep)
  a_sep = a_sep or ":"
  local fields = {}
  local pattern = string.format("([^%s]+)", a_sep)
  a_string:gsub(pattern, function(c) fields[#fields+1] = c end)
  return fields
end