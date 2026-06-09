#Requires AutoHotkey v2
#SingleInstance

myGui:= Gui()

{ ; Allows Drag & Drop across different elevations.
WM_DROPFILES      := 0x0233
WM_COPYDATA       := 0x004A
WM_COPYGLOBALDATA := 0x0049
MSGFLT_ALLOW      := 1
Call              := "User32\ChangeWindowMessageFilterEx"

DllCall(Call, "ptr", myGui.Hwnd, "uint", WM_DROPFILES,      "uint", MSGFLT_ALLOW, "ptr", 0)
DllCall(Call, "ptr", myGui.Hwnd, "uint", WM_COPYDATA,       "uint", MSGFLT_ALLOW, "ptr", 0)
DllCall(Call, "ptr", myGui.Hwnd, "uint", WM_COPYGLOBALDATA, "uint", MSGFLT_ALLOW, "ptr", 0)
} ; End.

myGui.OnEvent("DropFiles", Gui_DropFiles)
myGui.Show("w400 h200")

Gui_DropFiles(thisGui, thisCtrl, FileArray, x, y) {
	MsgBox("Dropped:  " FileArray.Length " Item(s)")
}