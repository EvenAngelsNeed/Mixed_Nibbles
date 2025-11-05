
;Insert at carat.ahk

#Requires Autohotkey v2
#SingleInstance Force




myGui := Gui()
myGui.Title := "Insert At Caret"
myGui.SetFont("s11")

myGui.Add("Text", "x16 y16 w271 h23 +0x200", "Select a point at which to insert text:")
myGui.Add("Text", "x304 y16 w120 h23 +0x200", "Insert This Text:")

Edit1 := myGui.Add("Edit", "x16 y40 w271 h23", "Some Text Here")
Edit2 := myGui.Add("Edit", "x304 y40 w120 h23", " 😁 ")


ButtonOK := myGui.Add("Button", "x432 y39 w96 h25", "&Insert At Caret")
ButtonOK.OnEvent("Click", InsertAtCaret)

myGui.OnEvent('Close', (*) => ExitApp())



myGui.Show("w548 h80")
ControlSend "{End}", Edit1

InsertAtCaret(*)
{
	ControlSendText Edit2.Value, "Edit1"
}

