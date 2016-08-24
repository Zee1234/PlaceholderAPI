function RegisterPlaceholder(a_plugin,a_text,a_help,a_callback,a_req_cPlayer,a_equals)
  assert(type(a_text) == "string","Invalid Placeholder Type")
  assert(type(a_help) == "string","Invalid Help Sring Type")
  assert(type(a_plugin) == "string","Invalid Plugin Name Type")
  assert(type(a_callback) == "string","Invalid Callback Type")
  assert(type(a_text) ~= "","Invalid Placeholder")
  assert(type(a_plugin) ~= "","Invalid Plugin Name")
  assert(type(a_callback) ~= "","Invalid Callback")
  
  a_text = g_Config.EnableReplacements and g_Config.Replacements[a_text] and g_Config.Replacements[a_text][a_plugin] or a_text
  local text = a_text:lower()
  
  if g_Placeholders[text] then
    LOGERROR("PlaceholderAPI: Placeholder text \""..a_text.."\" is registered by multiple plugins! \""..g_Placeholders[text].plugin.."\" and \""..a_plugin.."\"!")
    LOG("This list may not be extensive")
    return false, "Already Registered"
  end
  
  g_Placeholders[text] = cPlaceholder:new(a_plugin,a_text,a_help,a_callback,a_req_cPlayer,a_equals)
  
  return true
end


function ReplacePlaceholder(a_text,a_player)
  assert(type(a_text) == "string","Invalid Placeholder Type")
  assert(type(a_text) ~= "","Invalid Placeholder")
  
  local args = split(a_text,"=")
  local text = table.remove(split,1)
  
  if not g_Placeholders[text] then return false, "Not a registered placeholder" end
  
  return g_Placeholders[text]:replace(args,a_player)
end