#Requires Autohotkey v2


myGui := Gui()

ComboBox1 := myGui.Add("ComboBox", "x16 y16 w357", ["ComboBox"])

CB_SETCUEBANNER(ComboBox1, "ComboBox Cue Text")


ButtonOK := myGui.Add("Button", "x296 y56 w80 h23", "&OK")

myGui.OnEvent('Close', (*) => ExitApp())
myGui.Title := ""

ButtonOK.Focus() ; Needed to defocus ComboBox1 and allow hint to show at start.

myGui.Show("w389 h99")


CB_SETCUEBANNER(handle, string, option := True) {
	;static CBM_FIRST       := 0x1700
	static CB_SETCUEBANNER := 0x1703 ; CBM_FIRST + 3

	SendMessage(CB_SETCUEBANNER, 0, StrPtr(string), handle)
}




