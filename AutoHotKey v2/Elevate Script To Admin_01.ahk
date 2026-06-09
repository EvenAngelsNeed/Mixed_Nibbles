#Requires AutohotKey v2
#SingleInstance

; Elevate script to admin.

If Not A_IsAdmin {
  Try {
    If A_IsCompiled {
      Run '*RunAs "' A_ScriptFullPath '" /restart'
    }
    Else {
      Run '*RunAs "' A_AhkPath '" /restart "' A_ScriptFullPath '"'
    }
  }
  ExitApp()
}

