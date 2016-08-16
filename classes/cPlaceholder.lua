local cPlaceholder = {}
cPlaceholder.__index = cPlaceholder

function cPlaceholder:new(a_plugin,a_text,a_help,a_callback,a_req_cPlayer,a_equals)
  assert(type(a_plugin) == "string","Plugin name is not a string!")
  assert(type(a_text) == "string","Placeholder text is not a string!")
  assert(type(a_help) == "string","Help text is not a string!")
  assert(type(a_callback) == "string","Calback name is not a string!")
  
  local obj = {}
  setmetatable(obj,cPlaceholder)
  
  
  obj.plugin = a_plugin
  obj.help = a_help
  obj.callback = a_callback
  obj.player = a_req_cPlayer
  obj.split = a_equals
  obj.text=a_text
  
  return obj
end

function cPlaceholder:replace(a_args)
  return cPluginManager:CallPlugin(self.plugin,self.callback,a_args)
end
