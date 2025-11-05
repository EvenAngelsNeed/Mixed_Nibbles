; Gui_At_MousePosition_01.ahk

#SingleInstance
#Requires Autohotkey v2

offsetX := 0 ; +plus or -minus intergers.
offsetY := 0

; Position Gui relative to
; whole screen not just to Ahk Gui.

CoordMode "Mouse", "Screen"
MouseGetPos &OutX, &OutY

myGui := Gui(, "x")

myGui.OnEvent('Close', (*) => ExitApp())




myGui.Show("w200 h200 x" OutX + offsetX " y" OutY + offsetY)