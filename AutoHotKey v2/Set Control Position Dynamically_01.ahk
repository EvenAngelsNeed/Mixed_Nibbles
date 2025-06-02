#Requires Autohotkey v2
#SingleInstance

; GUI:
myGui := Gui()
myGui.Title := "Gui"
myGui.OnEvent('Close', (*) => ExitApp())
myGui.Opt("+AlwaysOnTop -MinimizeBox")


; Controls
btnCancel := myGui.Add("Button", "x0 y0 w50 h24", "&Cancel")

; Events:
btnCancel.OnEvent("Click",  (*) => ExitApp())

myGui.Show("w100 h100")



; Set Button Dynamically to Centre
btnCancel.GetPos(&XbtnC, &YbtnC, &WbtnC, &HbtnC)

myGui.GetClientPos(&Xgui, &Ygui, &Wgui, &Hgui)

; Calculate centre positions

btnX := Wgui / 2 - WbtnC / 2
btnY := Hgui / 2 - HbtnC / 2

; Move Control
btnCancel.Move(btnX, btnY, ,)



