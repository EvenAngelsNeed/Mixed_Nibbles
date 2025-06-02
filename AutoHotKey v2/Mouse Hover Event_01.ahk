#Requires Autohotkey v2
#SingleInstance 

; Template AHK2

; Mouse hover:

OnMessage 0x200, WM_MOUSEMOVE

CurrControl := ''


WM_MOUSEMOVE(wParam, lParam, msg, hwnd) {

	; Static. A bit like Kotlin remember?
	Static PrevControl := ''
	
	MouseGetPos ,,, &CurrControl
	Global CurrControl := CurrControl
	
	; Without this If and Static PrevControl the tooltip 
	; would be constantly triggered and flicker.
	
	If CurrControl != PrevControl {
		
		PrevControl := CurrControl
		txtShow.value := CurrControl

		showTip()
	}
	

	
}


showTip() {
	If CurrControl{


		ToolTip("Hovering over `n" 
				. CurrControl " control.", 150, 130)
		
		SetTimer () => ToolTip(), -2000
		
	}
	
	else{
		; So ToolTip switches off when 
		; moving off a control.
		
		ToolTip()
		
		; Return txtShow to original value
		txtShow.value := "I'm txtShow"
	
		
	}
}
  
  
; GUI:

myGui := Gui()
myGui.Title := "Control Hover"
myGui.OnEvent('Close', (*) => ExitApp())
myGui.Opt("+AlwaysOnTop -MinimizeBox")


; Controls

txtShow := myGui.Add("Text", "x45 y30 w100 h22 +Center", "I'm txtShow" ) ;
txtShow.SetFont("s12")

btnNull := myGui.Add("Button", "x45 y80 w100 h25", "I'm btnNull")

btnClose := myGui.Add("Button", "x45 y120 w100 h25", "I'm btnClose")

; Options

txtShow.Opt("Background" "FFE4E1")
;txtShow.Redraw()


; Events:

btnClose.OnEvent("Click", (*) => ExitApp())


myGui.Show("w200 h200")

