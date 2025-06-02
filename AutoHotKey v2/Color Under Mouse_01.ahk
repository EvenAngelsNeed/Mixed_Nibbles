#Requires Autohotkey v2
#SingleInstance


; GUI:
myGui := Gui()
myGui.Title := "Color Picker"
myGui.OnEvent('Close', (*) => ExitApp())
myGui.Opt("+AlwaysOnTop -MinimizeBox")


; Controls
txtShow1 := myGui.Add("Text", "x50 y20 w100 h22 +Center +Border", "HEX" ) ;
txtShow1.SetFont("s12")

txtShow2 := myGui.Add("Text", "x50 y50 w100 h70 +Center +Border", "Color" ) ;

btnClose := myGui.Add("Button", "x50 y129 w100 h25", "Close")

txtShow3 := myGui.Add("Text", "x50 y162 w100 h44 +Center", "Press Esc To Copy Color To Clipboard." ) ;
txtShow3.SetFont("cMaroon")

; Events:
btnClose.OnEvent("Click", (*) => ExitApp())

myGui.Show("w200 h200")


Esc:: {
A_Clipboard := color

	SoundBeep(500)

	ToolTip "`nCopied to clipboard.`n"
			. "HEX Color: " color "`n ", 100, 100

	SetTimer () => ToolTip(), -5000
}


While True {

	MouseGetPos &X, &Y

	color := RegExReplace(PixelGetColor(X, Y), "^0x", "")

	txtShow1.value := color

	txtShow2.value := ""
	txtShow2.Opt("Background" color)

	sleep 100
}

