function Initialize(a_Plugin)
  a_Plugin:SetName("PlaceholderAPI")
  a_Plugin:SetVersion(1.0)
  
  if not cPluginManager:ForEachPlugin(function(a_plugin)
      if a_plugin:GetName() == LibDependHandle then return true end
    end
  )
  then
    LDHSetup()
  else
    cPluginManager:AddHook(cPluginManager.HOOK_PLUGINS_LOADED, LDHSetup)
    cRoot:Get():GetDefaultWorld():ScheduleTask(2,LDHSetup)
  end
  
  g_Plugin = a_Plugin
	
  LOG("Initialized API API v." .. a_Plugin:GetVersion())
  return true
end

function OnDisable()
  
  cPluginManager:CallPlugin("LibDependHandler","UnregisterLibrary","PlaceholderAPI")
  
  LOG("PlaceholderHooker is disabled")
end

function LDHSetup()
  if not g_LDH then
    cPluginManager:CallPlugin("LibDependHandler","RegisterLibrary","PlaceholderAPI")
    g_LDH = true
  end
end

function LDHVerify()
  return true
end
