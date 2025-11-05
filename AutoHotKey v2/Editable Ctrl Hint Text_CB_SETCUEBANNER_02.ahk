#Requires Autohotkey v2

myGui := Gui()

ComboBox1 := myGui.Add("ComboBox", "x16 y16 w357", ["ComboBox"])
CB_SETCUEBANNER(ComboBox1.hwnd, "ComboBox Cue Text")

ButtonOK := myGui.Add("Button", "x296 y56 w80 h23", "&OK")

myGui.OnEvent('Close', (*) => ExitApp())
myGui.Title := ""

myGui.Show("w389 h99")

CB_SETCUEBANNER(handle, string, option := True) {
    static ECM_FIRST := 0x1500
    static EM_SETCUEBANNER := ECM_FIRST + 1

    cbi := Buffer(40+A_PtrSize*3)
    NumPut("uint", cbi.size, cbi)
    DllCall("GetComboBoxInfo", "ptr", handle, "ptr", cbi)
    hwndItem := NumGet(cbi, 40+A_PtrSize, "ptr")
    SendMessage(EM_SETCUEBANNER, true, StrPtr(string), hwndItem)
}