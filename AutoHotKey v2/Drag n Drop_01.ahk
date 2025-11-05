#Requires Autohotkey v2
#SingleInstance Force



; UnElevate Script - Due to Win11 Drag & Drop Issues.
If A_IsAdmin {

	;MsgBox A_IsAdmin
	Run "explorer.exe " A_ScriptFullPath
	ExitApp
	;MsgBox A_IsAdmin
}


myGui := Gui()
myGui.Title := "Window"
myGui.SetFont("s11")

Edit1 := myGui.Add("Edit", "x64 y32 w160 h21")
ButtonClose := myGui.Add("Button", "x104 y80 w80 h23", "&Close")

myGui.OnEvent("DropFiles", GuiDropFiles)
ButtonClose.OnEvent("Click", (*) => ExitApp())

myGui.OnEvent('Close', (*) => ExitApp())


GuiDropFiles(thisGui, Ctrl, FileArray, *) {
	Edit1.Value := FileArray.Length " Items Dropped."
}


myGui.Show("w298 h132")




