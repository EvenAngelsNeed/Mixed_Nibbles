#Requires Autohotkey v2
#SingleInstance

; Snippets: Open New Window From Same script
; + Check if already exists
; + Set Focus.


; Gui
myGui := Gui()
myGui.Title := "Gui 1"
myGui.Opt("+AlwaysOnTop -MinimizeBox")


; Controls
Text1 := myGui.Add("Text", "x17 y10 h14", "Gui Window 1")

btnOpen := myGui.Add("Button", "x14 y40 h23", "Open 2nd Gui")
btnOpen.OnEvent("Click", (*) => newGui())


myGui.Show("w120 h100")


; Functions

beepBeep(*){

	SoundBeep(500)
}


newGui(*){
	; Variables
	newTitle := "Gui 2" ; Unique title given to new gui window

	; As #SingleInstance will not work for a new window
	; embeded in same script:
	; Check window is not already open.
	; If it is: Set focus to it.
	; Otherwise create

	if WinExist(newTitle){
		WinActivate ; Sets focus to window just found by WinExist
	}


	else{
		; Get Position of first window if needed
		myGui.GetPos(&X1, &Y1) ;, &Width, &Height

		; 2nd Gui
		newGui := Gui()
		newGui.Title := newTitle
		newGui.Opt("+AlwaysOnTop -MinimizeBox")


		; Controls
		Text1 := newGui.Add("Text", "x7 y10  h14", "Hello. I'm a new Gui Window")



		; Show windowposition ofset or relative to first.
		; + for Below. - for Above.
		newGui.Show("w150 w170")
		newGui.Move(X1+70, Y1+120, ,)
	}

	beepBeep()
}


